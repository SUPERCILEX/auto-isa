use std::{
    collections::{hash_map::Entry, HashMap, HashSet},
    fmt::Debug,
    hash::{BuildHasher, Hash, Hasher},
    ops::{Deref, DerefMut},
};

use either::Either;
use llvm_plugin::{
    inkwell::{
        llvm_sys::prelude::LLVMValueRef,
        values::{AsValueRef, BasicValue, FunctionValue, InstructionOpcode, InstructionValue},
    },
    utils::InstructionIterator,
};

type InstructionId = u32;

#[derive(Default)]
pub struct Cache<'ctx> {
    seen: HashSet<LLVMValueRef>,
    path: Vec<InstructionValue<'ctx>>,
}

impl<'ctx> Cache<'ctx> {
    fn reset(&mut self) {
        self.seen.clear();
        self.path.clear();
    }
}

struct CacheContext<'a, 'ctx>(&'a mut Cache<'ctx>);

impl<'a, 'ctx> Deref for CacheContext<'a, 'ctx> {
    type Target = Cache<'ctx>;

    fn deref(&self) -> &Self::Target {
        self.0
    }
}

impl<'a, 'ctx> DerefMut for CacheContext<'a, 'ctx> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        self.0
    }
}

impl<'a, 'ctx> Drop for CacheContext<'a, 'ctx> {
    fn drop(&mut self) {
        self.0.reset();
    }
}

pub struct State<'ctx, S> {
    pub ids: HashMap<LLVMValueRef, u32>,
    pub compute_units: HashMap<DependencyGraph<'ctx, S>, Vec<InstructionValue<'ctx>>, S>,
}

impl<'ctx, S: Default> State<'ctx, S> {
    pub fn new(ids: HashMap<LLVMValueRef, u32>) -> Self {
        Self {
            ids,
            compute_units: HashMap::default(),
        }
    }
}

#[derive(Debug)]
pub struct DependencyGraph<'ctx, S> {
    pub edges: HashMap<InstructionId, (InstructionValue<'ctx>, Vec<InstructionValue<'ctx>>), S>,
}

impl<'ctx, S> DependencyGraph<'ctx, S> {
    fn normalize(&mut self) {
        for nodes in self.edges.values_mut() {
            nodes.1.sort_unstable_by_key(|a| a.get_opcode() as u32);
        }
    }
}

// TODO https://github.com/rust-lang/rust-clippy/issues/11923
#[allow(clippy::collection_is_never_read)]
impl<'ctx, S> Hash for DependencyGraph<'ctx, S> {
    fn hash<H: Hasher>(&self, state: &mut H) {
        let mut ops = Vec::with_capacity(self.edges.len());
        for (from, nodes) in self.edges.values() {
            ops.push(from.get_opcode());
            for node in nodes {
                ops.push(node.get_opcode());
            }
        }
        ops.sort_unstable_by_key(|&op| op as u32);

        ops.hash(state);
    }
}

impl<'ctx, S: BuildHasher> PartialEq<Self> for DependencyGraph<'ctx, S> {
    fn eq(&self, other: &Self) -> bool {
        if self.edges.len() != other.edges.len() {
            return false;
        }

        let mut ops = HashMap::<_, Vec<&[InstructionValue<'ctx>]>>::with_capacity(self.edges.len());
        for (from, nodes) in self.edges.values() {
            match ops.entry(from.get_opcode()) {
                Entry::Occupied(mut entry) => {
                    entry.get_mut().push(nodes);
                }
                Entry::Vacant(entry) => {
                    entry.insert(vec![nodes]);
                }
            }
        }

        for (from, nodes2) in other.edges.values() {
            let Some(edge_sets) = ops.get_mut(&from.get_opcode()) else {
                return false;
            };
            let Ok(pos) = edge_sets.binary_search_by(|nodes1| {
                nodes1
                    .iter()
                    .map(|instr| instr.get_opcode() as u32)
                    .cmp(nodes2.iter().map(|instr| instr.get_opcode() as u32))
            }) else {
                return false;
            };

            edge_sets.remove(pos);
        }

        ops.values().all(Vec::is_empty)
    }
}

impl<'ctx, S: BuildHasher> Eq for DependencyGraph<'ctx, S> {}

pub fn find_non_local_memory_compute_units<'ctx, S: BuildHasher + Default>(
    cache: &mut Cache<'ctx>,
    state: &mut State<'ctx, S>,
    function: FunctionValue<'ctx>,
) {
    const TARGET_INSTRUCTIONS: &[InstructionOpcode] =
        &[InstructionOpcode::Store, InstructionOpcode::Load];

    for bb in function.get_basic_blocks() {
        for instr in InstructionIterator::new(&bb) {
            if !TARGET_INSTRUCTIONS.contains(&instr.get_opcode()) {
                continue;
            }
            {
                let mut cache = CacheContext(cache);
                if contains_alloca(&mut cache, instr) {
                    continue;
                }
            }

            let mut dependencies = DependencyGraph {
                edges: HashMap::default(),
            };

            {
                let mut cache = CacheContext(cache);

                cache.path.push(instr);
                maybe_add_compute_unit(&mut cache, state, &mut dependencies, instr);
            }
            if !dependencies.edges.is_empty() {
                dependencies.normalize();
                match state.compute_units.entry(dependencies) {
                    Entry::Occupied(mut entry) => {
                        entry.get_mut().push(instr);
                    }
                    Entry::Vacant(entry) => {
                        entry.insert(vec![instr]);
                    }
                }
            }
        }
    }
}

fn contains_alloca<'ctx>(cache: &mut Cache<'ctx>, instruction: InstructionValue<'ctx>) -> bool {
    if cache.seen.contains(&instruction.as_value_ref()) {
        return false;
    }
    cache.seen.insert(instruction.as_value_ref());

    for i in 0..instruction.get_num_operands() {
        if let Some(op) = instruction.get_operand(i) {
            if let Some(instruction) = match op {
                Either::Left(value) => value.as_instruction_value(),
                Either::Right(block) => block.get_last_instruction(),
            } {
                if instruction.get_opcode() == InstructionOpcode::Alloca
                    || contains_alloca(cache, instruction)
                {
                    return true;
                }
            }
        }
    }
    false
}

fn maybe_add_compute_unit<'ctx, S: BuildHasher>(
    cache: &mut Cache<'ctx>,
    state: &mut State<'ctx, S>,
    dependency_graph: &mut DependencyGraph<'ctx, S>,
    instruction: InstructionValue<'ctx>,
) {
    if cache.seen.contains(&instruction.as_value_ref()) {
        return;
    }
    cache.seen.insert(instruction.as_value_ref());

    for i in 0..instruction.get_num_operands() {
        if let Some(op) = instruction.get_operand(i) {
            if let Some(instruction) = match op {
                Either::Left(value) => value.as_instruction_value(),
                Either::Right(block) => block.get_last_instruction(),
            } {
                cache.path.push(instruction);
                if instruction.get_opcode() == InstructionOpcode::Load {
                    write_path_to_graph(cache, state, dependency_graph);
                } else {
                    maybe_add_compute_unit(cache, state, dependency_graph, instruction);
                }
                cache.path.pop();
            }
        }
    }
}

fn write_path_to_graph<'ctx, S: BuildHasher>(
    Cache { path, .. }: &mut Cache<'ctx>,
    State { ids, .. }: &mut State<'ctx, S>,
    graph: &mut DependencyGraph<'ctx, S>,
) {
    for edge in path.windows(2) {
        let &[from, to] = edge else {
            unreachable!();
        };

        match graph.edges.entry(ids[&from.as_value_ref()]) {
            Entry::Occupied(mut entry) => {
                entry.get_mut().1.push(to);
            }
            Entry::Vacant(entry) => {
                entry.insert((from, vec![to]));
            }
        }
    }
}
