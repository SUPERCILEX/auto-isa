use std::{
    collections::{hash_map::Entry, HashMap, HashSet},
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

    ivv_pool: VecPool<InstructionValue<'ctx>>,
    phi_graph: HashMap<InstructionValue<'ctx>, Vec<InstructionValue<'ctx>>, S>,
    full_graph: HashMap<InstructionValue<'ctx>, Vec<InstructionValue<'ctx>>, S>,
    phi_odometer: Vec<usize>,
    phi_edges: Vec<(InstructionValue<'ctx>, Vec<InstructionValue<'ctx>>)>,
    seen_split_pool: VecPool<StableEdge>,
    seen_split_idioms: HashSet<Vec<StableEdge>>,
}

struct VecPool<T>(Vec<Vec<T>>);

impl<T> VecPool<T> {
    fn pop(&mut self) -> Option<Vec<T>> {
        self.0.pop()
    }

    fn release(&mut self, mut v: Vec<T>) {
        if v.capacity() == 0 {
            return;
        }
        v.clear();
        self.0.push(v);
    }
}

impl<T> Default for VecPool<T> {
    fn default() -> Self {
        Self(Vec::new())
    }
}

impl<'ctx, S> Cache<'ctx, S> {
    fn reset(&mut self) {
        let Self {
            seen,
            edges,
            path,
            memory_ops,
            ivv_pool,
            phi_graph,
            full_graph,
            phi_odometer,
            phi_edges,
            seen_split_idioms,
            seen_split_pool,
        } = self;

        seen.clear();
        edges.clear();
        path.clear();
        memory_ops.clear();

        macro_rules! drain {
            ($iter:expr) => {
                for (_, v) in $iter {
                    ivv_pool.release(v);
                }
            };
        }

        drain!(phi_graph.drain());
        drain!(full_graph.drain());
        drain!(phi_edges.drain(0..));
        phi_odometer.clear();
        for v in seen_split_idioms.drain() {
            seen_split_pool.release(v);
        }
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
    fn to_stable(&self, ids: &HashMap<LLVMValueRef, u32>) -> StableEdge {
        let Self(a, b) = self;
        StableEdge(ids[&a.as_value_ref()], ids[&b.as_value_ref()])
    }

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

        split_idiom_on_phis(
            &mut cache,
            &state.ids,
            &state.ids_index,
            instr,
            &mut |edges, memory_ops| {
                state
                    .idioms
                    .entry(EquivalenceGraph::from((edges, &*state.ids_index)))
                    .or_default()
                    .push(ComputeUnit {
                        root: instr,
                        memory_ops,
                        edges: edges.iter().map(|e| e.to_edge(&state.ids_index)).collect(),
                    });
            },
        );
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

        if !cache.edges.insert(Edge(from, to).to_stable(ids)) {
            break;
        }
    }
}

fn split_idiom_on_phis<'ctx, S: BuildHasher>(
    cache: &mut Cache<'ctx, S>,
    ids: &HashMap<LLVMValueRef, u32>,
    ids_index: &[InstructionValue<'ctx>],
    root: InstructionValue<'ctx>,
    add: &mut impl FnMut(&HashSet<StableEdge, S>, HashSet<InstructionValue<'ctx>>),
) {
    if cache.edges.is_empty() {
        return;
    }

    for &StableEdge(from, to) in &cache.edges {
        let from = ids_index[usize::try_from(from).unwrap()];
        if from.get_opcode() == InstructionOpcode::Phi {
            let to = ids_index[usize::try_from(to).unwrap()];
            match cache.phi_graph.entry(from) {
                Entry::Occupied(mut e) => e.get_mut().push(to),
                Entry::Vacant(e) => {
                    let mut outgoing = cache.ivv_pool.pop().unwrap_or_default();
                    outgoing.push(to);
                    e.insert(outgoing);
                }
            }
        }
    }

    {
        let mut prune = cache.ivv_pool.pop().unwrap_or_default();
        for (&node, outgoings) in &cache.phi_graph {
            if outgoings.len() <= 1 {
                prune.push(node);
            }
        }
        for node in &prune {
            cache
                .ivv_pool
                .release(cache.phi_graph.remove(node).unwrap());
        }
        cache.ivv_pool.release(prune);
    }

    if cache.phi_graph.is_empty() {
        add(&cache.edges, cache.memory_ops.clone());
        return;
    }

    for e in &cache.edges {
        let Edge(from, to) = e.to_edge(ids_index);
        match cache.full_graph.entry(from) {
            Entry::Occupied(mut e) => e.get_mut().push(to),
            Entry::Vacant(e) => {
                let mut outgoing = cache.ivv_pool.pop().unwrap_or_default();
                outgoing.push(to);
                e.insert(outgoing);
            }
        }
    }

    cache.phi_graph.drain().collect_into(&mut cache.phi_edges);
    cache.phi_odometer.resize(cache.phi_edges.len(), 0);

    'outer: loop {
        {
            cache.edges.clear();
            cache.memory_ops.clear();
            cache.seen.clear();

            build_filtered_compute_unit(
                root,
                &cache.full_graph,
                &cache.phi_odometer,
                &cache.phi_edges,
                ids,
                &mut cache.seen,
                &mut cache.edges,
                &mut cache.memory_ops,
            );

            let mut graph = cache.seen_split_pool.pop().unwrap_or_default();
            cache.edges.iter().copied().collect_into(&mut graph);
            if cache.seen_split_idioms.contains(&graph) {
                cache.seen_split_pool.release(graph);
            } else {
                add(&cache.edges, cache.memory_ops.clone());
                cache.seen_split_idioms.insert(graph);
            }
        }

        let mut odometer_digit = cache.phi_odometer.len() - 1;
        loop {
            cache.phi_odometer[odometer_digit] += 1;
            if cache.phi_odometer[odometer_digit] < cache.phi_edges[odometer_digit].1.len() {
                break;
            }
            if odometer_digit == 0 {
                break 'outer;
            }
            cache.phi_odometer[odometer_digit] = 0;
            odometer_digit -= 1;
        }
    }
}

#[allow(clippy::too_many_arguments)]
fn build_filtered_compute_unit<'ctx, S: BuildHasher>(
    root: InstructionValue<'ctx>,
    full_graph: &HashMap<InstructionValue<'ctx>, Vec<InstructionValue<'ctx>>, S>,
    phi_odometer: &[usize],
    phi_edges: &[(InstructionValue<'ctx>, Vec<InstructionValue<'ctx>>)],
    ids: &HashMap<LLVMValueRef, u32>,
    seen: &mut HashSet<LLVMValueRef>,
    edges: &mut HashSet<StableEdge, S>,
    memory_ops: &mut HashSet<InstructionValue<'ctx>>,
) {
    if !seen.insert(root.as_value_ref()) {
        return;
    }

    if let Some(index) = phi_edges.iter().position(|&(node, _)| root == node) {
        let next = phi_edges[index].1[phi_odometer[index]];
        edges.insert(Edge(root, next).to_stable(ids));
        build_filtered_compute_unit(
            next,
            full_graph,
            phi_odometer,
            phi_edges,
            ids,
            seen,
            edges,
            memory_ops,
        );
    } else {
        if MEMORY_INSTRUCTIONS.contains(&root.get_opcode()) {
            memory_ops.insert(root);
        }
        for &outgoing in full_graph.get(&root).map(|v| &**v).unwrap_or_default() {
            edges.insert(Edge(root, outgoing).to_stable(ids));
            build_filtered_compute_unit(
                outgoing,
                full_graph,
                phi_odometer,
                phi_edges,
                ids,
                seen,
                edges,
                memory_ops,
            );
        }
    }
}
