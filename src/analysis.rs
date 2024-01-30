use std::{
    collections::{HashMap, HashSet},
    fmt::Debug,
    hash::{BuildHasher, Hash, Hasher},
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

    pub idioms: HashMap<EquivalenceGraph<'ctx>, Vec<ComputeUnit<'ctx>>, S>,
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

#[derive(Debug)]
pub struct EquivalenceGraph<'ctx> {
    edges: Vec<(InstructionValue<'ctx>, InstructionValue<'ctx>)>,
}

const _: () = assert!(mem::size_of::<InstructionOpcode>() <= mem::size_of::<u8>());

impl<'ctx, S> From<(&HashSet<StableEdge, S>, &[InstructionValue<'ctx>])>
    for EquivalenceGraph<'ctx>
{
    fn from((edges, ids_index): (&HashSet<StableEdge, S>, &[InstructionValue<'ctx>])) -> Self {
        let mut edges = edges
            .iter()
            .map(|e| e.to_edge(ids_index))
            .map(|e| (e.0, e.1))
            .collect::<Vec<_>>();
        edges.sort_unstable_by_key(|(a, b)| (a.get_opcode() as u32, b.get_opcode() as u32));
        Self { edges }
    }
}

impl<'ctx> EquivalenceGraph<'ctx> {
    fn ops(&self) -> impl Iterator<Item = (InstructionOpcode, InstructionOpcode)> + '_ {
        self.edges
            .iter()
            .map(|(a, b)| (a.get_opcode(), b.get_opcode()))
    }
}

impl<'ctx> Hash for EquivalenceGraph<'ctx> {
    fn hash<H: Hasher>(&self, state: &mut H) {
        for edge in self.ops() {
            edge.hash(state);
        }
    }
}

impl<'ctx> PartialEq<Self> for EquivalenceGraph<'ctx> {
    fn eq(&self, other: &Self) -> bool {
        self.ops().eq(other.ops())
    }
}

impl<'ctx> Eq for EquivalenceGraph<'ctx> {}

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
        maybe_add_compute_unit(&mut cache, state, instr);

        if !cache.edges.is_empty() {
            let mut edges = cache
                .edges
                .iter()
                .map(|e| e.to_edge(&state.ids_index))
                .collect::<Vec<_>>();
            edges.sort_unstable_by_key(Edge::to_opcodes);
            state
                .idioms
                .entry(EquivalenceGraph::from((&cache.edges, &*state.ids_index)))
                .or_default()
                .push(ComputeUnit {
                    root: instr,
                    memory_ops: cache.memory_ops.clone(),
                    edges,
                });
        }
    }
}

fn maybe_add_compute_unit<'ctx, S: BuildHasher>(
    cache: &mut Cache<'ctx, S>,
    state: &mut State<'ctx, S>,
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
            write_path_to_graph(cache, state);
        } else if !matches!(op, InstructionOpcode::Call | InstructionOpcode::Invoke) {
            maybe_add_compute_unit(cache, state, instruction);
        }
        cache.path.pop();
    }
}

fn write_path_to_graph<'ctx, S: BuildHasher>(
    Cache { path, edges, .. }: &mut Cache<'ctx, S>,
    State { ids, .. }: &mut State<'ctx, S>,
) {
    for edge in path.windows(2).rev() {
        let &[from, to] = edge else {
            unreachable!();
        };

        if !edges.insert(StableEdge(
            ids[&from.as_value_ref()],
            ids[&to.as_value_ref()],
        )) {
            break;
        }
    }
}
