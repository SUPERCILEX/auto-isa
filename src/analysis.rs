use std::{
    collections::{hash_map::Entry, HashMap, HashSet},
    fmt::Debug,
    hash::{BuildHasher, Hash},
    mem,
    ops::{Deref, DerefMut},
};

use llvm_plugin::inkwell::{
    basic_block::BasicBlock,
    llvm_sys::prelude::LLVMValueRef,
    module::Module,
    values::{
        AsValueRef, BasicValue, FunctionValue, InstructionOpcode, InstructionValue, PhiValue,
    },
};

use crate::{
    utils::{Edge, InstructionId, Pool, StableEdge, MEMORY_INSTRUCTIONS},
    State,
};

#[derive(Default)]
struct Cache<'ctx, S> {
    seen: HashSet<LLVMValueRef, S>,
    edges: HashSet<StableEdge, S>,
    path: Vec<InstructionValue<'ctx>>,
    memory_ops: HashSet<InstructionValue<'ctx>, S>,

    ivv_pool: Pool<Vec<InstructionId>>,
    phi_graph: HashMap<InstructionId, Vec<InstructionId>, S>,
    full_graph: HashMap<InstructionId, Vec<InstructionId>, S>,
    phi_odometer: Vec<usize>,
    phi_edges: Vec<(InstructionId, Vec<InstructionId>)>,
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

pub struct ComputeUnit<'ctx, S> {
    pub edges: Vec<Edge<'ctx>>,
    pub root: InstructionValue<'ctx>,
    pub memory_ops: HashSet<InstructionValue<'ctx>, S>,
}

#[derive(Hash, Eq, PartialEq, Debug)]
struct EquivalenceGraph {
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

#[derive(Default)]
pub struct Idiom<'ctx, S>(pub Vec<ComputeUnit<'ctx, S>>);

pub fn find_non_local_memory_compute_units<'ctx, S: BuildHasher + Default + Clone>(
    state: &State<'ctx, S>,
    module: &Module<'ctx>,
) -> Vec<Idiom<'ctx, S>> {
    let mut idioms = HashMap::default();
    find_idioms(state, module, &mut idioms);
    idioms.into_values().collect()
}

fn find_idioms<'ctx, S: BuildHasher + Default + Clone>(
    state: &State<'ctx, S>,
    module: &Module<'ctx>,
    idioms: &mut HashMap<EquivalenceGraph, Idiom<'ctx, S>, S>,
) {
    let mut cache = Cache::default();
    for instr in module
        .get_functions()
        .flat_map(FunctionValue::get_basic_block_iter)
        .flat_map(BasicBlock::get_instructions)
    {
        if !MEMORY_INSTRUCTIONS.contains(&instr.get_opcode()) {
            continue;
        }

        let mut cache = CacheContext(&mut cache);

        cache.path.push(instr);
        cache.memory_ops.insert(instr);
        maybe_add_compute_unit(&mut cache, &state.ids, instr);

        split_idiom_on_phis(&mut cache, state, instr, &mut |edges, memory_ops| {
            idioms
                .entry(EquivalenceGraph::from((edges, &*state.ids_index)))
                .or_default()
                .0
                .push(ComputeUnit {
                    root: instr,
                    memory_ops,
                    edges: edges.iter().map(|e| e.to_edge(&state.ids_index)).collect(),
                });
        });
    }
    prune_duplicates(state, idioms, &mut cache);
}

fn prune_duplicates<'ctx, S: BuildHasher + Default>(
    State { ids, ids_index: _ }: &State<'ctx, S>,
    idioms: &mut HashMap<EquivalenceGraph, Idiom<'ctx, S>, S>,
    cache: &mut Cache<'ctx, S>,
) {
    let mut seen = HashSet::<_, S>::default();
    let mut seen2 = HashSet::<_, S>::default();
    for Idiom(cus) in idioms.values_mut() {
        cus.retain_mut(
            |ComputeUnit {
                 edges,
                 root,
                 memory_ops: _,
             }| {
                seen.insert(ids[&root.as_value_ref()]);
                edges
                    .iter()
                    .map(|Edge(_, to)| ids[&to.as_value_ref()])
                    .collect_into(&mut seen);

                let mut instrs = cache.ivv_pool.pop().unwrap_or_default();
                seen.iter().collect_into(&mut instrs);
                seen.clear();

                seen2.insert(instrs)
            },
        );

        for v in seen2.drain() {
            cache.ivv_pool.release(v);
        }
    }
}

fn maybe_add_compute_unit<'ctx, S: BuildHasher>(
    cache: &mut Cache<'ctx, S>,
    ids: &HashMap<LLVMValueRef, InstructionId, S>,
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
        .filter_map(|op| op.unwrap_left().as_instruction_value());
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

fn write_path_to_graph<S: BuildHasher>(
    cache: &mut Cache<S>,
    ids: &HashMap<LLVMValueRef, InstructionId, S>,
) {
    for edge in cache.path.windows(2).rev() {
        let &[from, to] = edge else {
            unreachable!();
        };

        if !cache.edges.insert(Edge(from, to).to_stable(ids)) {
            break;
        }
    }
}

fn split_idiom_on_phis<'ctx, S: BuildHasher + Clone>(
    cache: &mut Cache<'ctx, S>,
    State { ids, ids_index }: &State<'ctx, S>,
    root: InstructionValue<'ctx>,
    add: &mut impl FnMut(&HashSet<StableEdge, S>, HashSet<InstructionValue<'ctx>, S>),
) {
    if cache.edges.is_empty() {
        return;
    }

    for &StableEdge(from, to) in &cache.edges {
        if ids_index[usize::try_from(from).unwrap()].get_opcode() == InstructionOpcode::Phi {
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

    for &StableEdge(from, to) in &cache.edges {
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

    // HACK because we scale as O(product of num outgoing phi edges)
    if cache
        .phi_edges
        .iter()
        .map(|(_, v)| v.len())
        .product::<usize>()
        > 100_000
    {
        // Preemptively give up
        return;
    }

    'outer: loop {
        {
            cache.edges.clear();
            cache.memory_ops.clear();
            cache.seen.clear();

            build_filtered_compute_unit(
                ids[&root.as_value_ref()],
                &cache.full_graph,
                &cache.phi_odometer,
                &cache.phi_edges,
                ids_index,
                &mut cache.seen,
                &mut cache.edges,
                &mut cache.memory_ops,
            );

            add(&cache.edges, cache.memory_ops.clone());
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
    root: InstructionId,
    full_graph: &HashMap<InstructionId, Vec<InstructionId>, S>,
    phi_odometer: &[usize],
    phi_edges: &[(InstructionId, Vec<InstructionId>)],
    ids_index: &[InstructionValue<'ctx>],
    seen: &mut HashSet<LLVMValueRef, S>,
    edges: &mut HashSet<StableEdge, S>,
    memory_ops: &mut HashSet<InstructionValue<'ctx>, S>,
) {
    let root_instr = ids_index[usize::try_from(root).unwrap()];
    if !seen.insert(root_instr.as_value_ref()) {
        return;
    }

    if let Some(index) = phi_edges.iter().position(|&(node, _)| root == node) {
        let next = phi_edges[index].1[phi_odometer[index]];
        edges.insert(StableEdge(root, next));
        build_filtered_compute_unit(
            next,
            full_graph,
            phi_odometer,
            phi_edges,
            ids_index,
            seen,
            edges,
            memory_ops,
        );
    } else {
        if MEMORY_INSTRUCTIONS.contains(&root_instr.get_opcode()) {
            memory_ops.insert(root_instr);
        }
        for &outgoing in full_graph.get(&root).map(|v| &**v).unwrap_or_default() {
            edges.insert(StableEdge(root, outgoing));
            build_filtered_compute_unit(
                outgoing,
                full_graph,
                phi_odometer,
                phi_edges,
                ids_index,
                seen,
                edges,
                memory_ops,
            );
        }
    }
}
