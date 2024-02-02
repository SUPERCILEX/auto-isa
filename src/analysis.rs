use std::{
    collections::{HashMap, HashSet},
    fmt::Debug,
    hash::{BuildHasher, Hash},
    mem,
    ops::{Deref, DerefMut},
};

use either::Either;
use llvm_plugin::inkwell::{
    basic_block::BasicBlock,
    llvm_sys::prelude::LLVMValueRef,
    values::{
        AsValueRef, BasicValue, FunctionValue, InstructionOpcode, InstructionValue, PhiValue,
    },
};

pub const MEMORY_INSTRUCTIONS: &[InstructionOpcode] =
    &[InstructionOpcode::Store, InstructionOpcode::Load];

type InstructionId = u32;

#[derive(Default)]
pub struct Cache<'ctx, S> {
    seen: HashSet<LLVMValueRef>,
    edges: HashSet<StableEdge, S>,
    path: Vec<InstructionValue<'ctx>>,
    memory_ops: HashSet<InstructionValue<'ctx>>,
}

impl<'ctx, S> Cache<'ctx, S> {
    fn reset(&mut self) {
        let Self {
            seen,
            edges,
            path,
            memory_ops,
        } = self;

        seen.clear();
        edges.clear();
        path.clear();
        memory_ops.clear();
    }
}

struct CacheContext<'a, 'ctx, S>(&'a mut Cache<'ctx, S>);

impl<'a, 'ctx, S> Deref for CacheContext<'a, 'ctx, S> {
    type Target = Cache<'ctx, S>;

    fn deref(&self) -> &Self::Target {
        self.0
    }
}

impl<'a, 'ctx, S> DerefMut for CacheContext<'a, 'ctx, S> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        self.0
    }
}

impl<'a, 'ctx, S> Drop for CacheContext<'a, 'ctx, S> {
    fn drop(&mut self) {
        self.0.reset();
    }
}

pub struct State<'ctx, S> {
    pub ids: HashMap<LLVMValueRef, u32>,
    pub ids_index: Vec<InstructionValue<'ctx>>,

    pub idioms: HashMap<EquivalenceGraph, Vec<ComputeUnit<'ctx>>, S>,
}

pub struct ComputeUnit<'ctx> {
    pub edges: Vec<Edge<'ctx>>,
    pub root: InstructionValue<'ctx>,
    pub memory_ops: HashSet<InstructionValue<'ctx>>,
}

impl<'ctx, S: Default> State<'ctx, S> {
    pub fn new(ids: HashMap<LLVMValueRef, u32>, ids_index: Vec<InstructionValue<'ctx>>) -> Self {
        Self {
            ids,
            ids_index,
            idioms: HashMap::default(),
        }
    }
}

#[derive(Hash, Eq, PartialEq, Debug)]
pub struct Edge<'ctx>(pub InstructionValue<'ctx>, pub InstructionValue<'ctx>);

impl Edge<'_> {
    fn to_opcodes(&self) -> (u8, u8) {
        let Self(a, b) = self;
        (a.get_opcode() as u8, b.get_opcode() as u8)
    }
}

#[derive(Copy, Clone, Hash, Eq, PartialEq, Debug)]
struct StableEdge(InstructionId, InstructionId);

impl StableEdge {
    fn to_edge<'ctx>(self, ids_index: &[InstructionValue<'ctx>]) -> Edge<'ctx> {
        let Self(a, b) = self;
        Edge(
            ids_index[usize::try_from(a).unwrap()],
            ids_index[usize::try_from(b).unwrap()],
        )
    }
}

#[derive(Hash, Eq, PartialEq, Debug)]
pub struct EquivalenceGraph {
    edges: Vec<(u8, u8)>,
}

const _: () = assert!(mem::size_of::<InstructionOpcode>() <= mem::size_of::<u8>());

impl<'ctx, S> From<(&HashSet<StableEdge, S>, &[InstructionValue<'ctx>])> for EquivalenceGraph {
    fn from((edges, ids_index): (&HashSet<StableEdge, S>, &[InstructionValue<'ctx>])) -> Self {
        let mut edges = edges
            .iter()
            .map(|e| e.to_edge(ids_index))
            .map(|e| e.to_opcodes())
            .collect::<Vec<_>>();
        edges.sort_unstable();
        Self { edges }
    }
}

pub fn find_non_local_memory_compute_units<'ctx, S: BuildHasher + Default>(
    cache: &mut Cache<'ctx, S>,
    state: &mut State<'ctx, S>,
    function: FunctionValue<'ctx>,
) {
    for instr in function
        .get_basic_block_iter()
        .flat_map(BasicBlock::get_instructions)
    {
        if !MEMORY_INSTRUCTIONS.contains(&instr.get_opcode()) {
            continue;
        }

        let mut cache = CacheContext(cache);

        cache.path.push(instr);
        cache.memory_ops.insert(instr);
        maybe_add_compute_unit(&mut cache, &state.ids, instr);

        if !cache.edges.is_empty() {
            state
                .idioms
                .entry(EquivalenceGraph::from((&cache.edges, &*state.ids_index)))
                .or_default()
                .push(ComputeUnit {
                    root: instr,
                    memory_ops: cache.memory_ops.clone(),
                    edges: cache
                        .edges
                        .iter()
                        .map(|e| e.to_edge(&state.ids_index))
                        .collect(),
                });
        }
    }
}

fn maybe_add_compute_unit<'ctx, S: BuildHasher>(
    cache: &mut Cache<'ctx, S>,
    ids: &HashMap<LLVMValueRef, u32>,
    instruction: InstructionValue<'ctx>,
) {
    if !cache.seen.insert(instruction.as_value_ref()) {
        return;
    }

    let mut if_phi = PhiValue::try_from(instruction).map(|phi| {
        phi.get_incomings()
            .filter_map(|(value, _)| value.as_instruction_value())
    });
    let mut if_not_phi = instruction
        .get_operands()
        .flatten()
        .filter_map(|op| match op {
            Either::Left(value) => value.as_instruction_value(),
            Either::Right(_) => unreachable!(),
        });
    for instruction in if_phi
        .as_mut()
        .map(|i| i as &mut dyn Iterator<Item = InstructionValue>)
        .unwrap_or(&mut if_not_phi)
    {
        cache.path.push(instruction);
        let op = instruction.get_opcode();
        if op == InstructionOpcode::Load {
            cache.memory_ops.insert(instruction);
            write_path_to_graph(cache, ids);
        } else if !matches!(op, InstructionOpcode::Call | InstructionOpcode::Invoke) {
            maybe_add_compute_unit(cache, ids, instruction);
        }
        cache.path.pop();
    }
}

fn write_path_to_graph<S: BuildHasher>(cache: &mut Cache<S>, ids: &HashMap<LLVMValueRef, u32>) {
    for edge in cache.path.windows(2).rev() {
        let &[from, to] = edge else {
            unreachable!();
        };

        if !cache.edges.insert(StableEdge(
            ids[&from.as_value_ref()],
            ids[&to.as_value_ref()],
        )) {
            break;
        }
    }
}
