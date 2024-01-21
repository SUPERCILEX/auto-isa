use std::{
    collections::{HashMap, HashSet},
    fmt::Debug,
    hash::{BuildHasher, Hash, Hasher},
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

type InstructionId = u32;

#[derive(Default)]
pub struct Cache<'ctx, S> {
    seen: HashSet<LLVMValueRef>,
    edges: HashSet<StableEdge, S>,
    path: Vec<InstructionValue<'ctx>>,
}

impl<'ctx, S> Cache<'ctx, S> {
    fn reset(&mut self) {
        self.seen.clear();
        self.edges.clear();
        self.path.clear();
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
    ids_index: Vec<InstructionValue<'ctx>>,

    pub compute_units: HashMap<DependencyGraph<'ctx>, Vec<InstructionValue<'ctx>>, S>,
}

impl<'ctx, S: Default> State<'ctx, S> {
    pub fn new(ids: HashMap<LLVMValueRef, u32>, ids_index: Vec<InstructionValue<'ctx>>) -> Self {
        Self {
            ids,
            ids_index,
            compute_units: HashMap::default(),
        }
    }
}

type Edge<'ctx> = (InstructionValue<'ctx>, InstructionValue<'ctx>);
type StableEdge = (InstructionId, InstructionId);

#[derive(Debug)]
pub struct DependencyGraph<'ctx> {
    pub edges: Vec<Edge<'ctx>>,
}

impl<'ctx, S> From<(&HashSet<StableEdge, S>, &State<'ctx, S>)> for DependencyGraph<'ctx> {
    fn from((edges, State { ids_index, .. }): (&HashSet<StableEdge, S>, &State<'ctx, S>)) -> Self {
        let mut edges = edges
            .iter()
            .map(|&(a, b)| {
                (
                    ids_index[usize::try_from(a).unwrap()],
                    ids_index[usize::try_from(b).unwrap()],
                )
            })
            .collect::<Vec<_>>();
        edges.sort_unstable_by_key(|(a, b)| (a.get_opcode() as u32, b.get_opcode() as u32));
        Self { edges }
    }
}

impl<'ctx> DependencyGraph<'ctx> {
    fn ops(&self) -> impl Iterator<Item = (InstructionOpcode, InstructionOpcode)> + '_ {
        self.edges
            .iter()
            .map(|(a, b)| (a.get_opcode(), b.get_opcode()))
    }
}

impl<'ctx> Hash for DependencyGraph<'ctx> {
    fn hash<H: Hasher>(&self, state: &mut H) {
        for edge in self.ops() {
            edge.hash(state);
        }
    }
}

impl<'ctx> PartialEq<Self> for DependencyGraph<'ctx> {
    fn eq(&self, other: &Self) -> bool {
        self.ops().eq(other.ops())
    }
}

impl<'ctx> Eq for DependencyGraph<'ctx> {}

pub fn find_non_local_memory_compute_units<'ctx, S: BuildHasher + Default>(
    cache: &mut Cache<'ctx, S>,
    state: &mut State<'ctx, S>,
    function: FunctionValue<'ctx>,
) {
    const TARGET_INSTRUCTIONS: &[InstructionOpcode] =
        &[InstructionOpcode::Store, InstructionOpcode::Load];

    for instr in function
        .get_basic_block_iter()
        .flat_map(BasicBlock::get_instructions)
    {
        if !TARGET_INSTRUCTIONS.contains(&instr.get_opcode()) {
            continue;
        }

        let mut cache = CacheContext(cache);

        cache.path.push(instr);
        maybe_add_compute_unit(&mut cache, state, instr);

        if !cache.edges.is_empty() {
            state
                .compute_units
                .entry(DependencyGraph::from((&cache.edges, &*state)))
                .or_default()
                .push(instr);
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

        if !edges.insert((ids[&from.as_value_ref()], ids[&to.as_value_ref()])) {
            break;
        }
    }
}
