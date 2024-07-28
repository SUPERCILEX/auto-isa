#![feature(iter_collect_into)]
#![feature(iter_next_chunk)]

use std::{
    collections::{HashMap, HashSet},
    fs::File,
    hash::{BuildHasher, BuildHasherDefault},
    io::{stdin, BufRead, BufWriter, Write},
    mem::ManuallyDrop,
    os::fd::FromRawFd,
    path::Path,
};

use either::Either;
use llvm_plugin::{
    inkwell::{
        basic_block::BasicBlock,
        llvm_sys::prelude::LLVMValueRef,
        module::Module,
        values::{AsValueRef, BasicValue, FunctionValue, InstructionOpcode, InstructionValue},
    },
    LlvmModulePass, ModuleAnalysisManager, PassBuilder, PipelineParsing, PreservedAnalyses,
};
use rustc_hash::FxHasher;
use rustix::{process::WaitOptions, runtime::Fork::Parent};

use crate::{
    analysis::{find_non_local_memory_compute_units, Idiom},
    extraction::extract_compute_units,
    instrumentation::instrument_compute_units,
    shared::{EXTRACTION_COMPLETE, INSTRUMENTATION_COMPLETE},
    utils::{build_full_graph, Edge, InstructionId, Pool, MEMORY_INSTRUCTIONS},
};

mod analysis;
mod extraction;
mod instrumentation;
mod shared;
mod utils;

#[cfg(feature = "trace")]
#[global_allocator]
static GLOBAL: tracy_client::ProfiledAllocator<std::alloc::System> =
    tracy_client::ProfiledAllocator::new(std::alloc::System, 100);

#[llvm_plugin::plugin(name = "AutoIsa", version = "0.1")]
fn plugin_registrar(builder: &mut PassBuilder) {
    #[cfg(feature = "trace")]
    tracy_client::Client::start();

    builder.add_module_pipeline_parsing_callback(|name, pass_manager| {
        if name.starts_with("auto-isa") {
            pass_manager.add_pass(AutoIsaPass {
                analysis_only: name == "auto-isa-analysis",
            });
            PipelineParsing::Parsed
        } else {
            PipelineParsing::NotParsed
        }
    });
}

struct AutoIsaPass {
    analysis_only: bool,
}

pub struct State<'ctx, S> {
    pub ids: HashMap<LLVMValueRef, InstructionId, S>,
    pub ids_index: Vec<InstructionValue<'ctx>>,
}

impl LlvmModulePass for AutoIsaPass {
    fn run_pass(&self, module: &mut Module, _: &ModuleAnalysisManager) -> PreservedAnalyses {
        let state = build_state(module);

        let idioms = find_non_local_memory_compute_units(&state, module);
        if self.analysis_only {
            return PreservedAnalyses::All;
        }

        split_into_next_stage(&state, &idioms, module);

        instrument_compute_units(&state, &idioms, module);
        PreservedAnalyses::None
    }
}

fn split_into_next_stage<'ctx, S: BuildHasher + Default + Clone>(
    state: &State<'ctx, S>,
    idioms: &[Idiom<'ctx, S>],
    module: &Module<'ctx>,
) {
    {
        let Parent(instrument_pid) = unsafe { rustix::runtime::fork() }.unwrap() else {
            return;
        };
        let Parent(extract_pid) = unsafe { rustix::runtime::fork() }.unwrap() else {
            extract_compute_units(state, idioms, module);
            std::process::exit(0);
        };

        let mut pending_completions = 2;
        let mut wait = || {
            if pending_completions == 0 {
                return None;
            }

            let (pid, completion) = rustix::process::wait(WaitOptions::empty())
                .unwrap()
                .unwrap();
            assert_eq!(0, completion.exit_status().unwrap());

            let mut stdout = ManuallyDrop::new(unsafe { File::from_raw_fd(1) });
            if pid == instrument_pid {
                stdout.write_all(&[INSTRUMENTATION_COMPLETE]).unwrap();
            } else if pid == extract_pid {
                stdout.write_all(&[EXTRACTION_COMPLETE]).unwrap();
            } else {
                unreachable!();
            }
            pending_completions -= 1;

            Some(pid)
        };
        while wait().is_some() {}
    }

    let dynamic_counts = read_dynamic_counts(state, idioms);
    print_compute_units(module, state, idioms, &dynamic_counts);
    std::process::exit(0);
}

struct DynamicCounts<S> {
    global_mem: HashMap<InstructionId, u64, S>,
    idioms: Vec<Vec<HashMap<InstructionId, u64, S>>>,
}

fn read_dynamic_counts<S: BuildHasher + Default + Clone>(
    State { ids, .. }: &State<S>,
    idioms: &[Idiom<S>],
) -> DynamicCounts<S> {
    #[derive(Copy, Clone, Debug)]
    enum Kind {
        Mem(InstructionId),
        Input([usize; 3]),
        Output([usize; 2]),
    }

    let mut dynamic_counts = HashMap::default();
    let mut idiom_counts = Vec::with_capacity(idioms.len());
    for Idiom(cu) in idioms {
        idiom_counts.push(vec![HashMap::default(); cu.len()]);
    }

    let mut input = stdin().lock();
    let mut buf = String::new();
    let mut pending_counter = None;
    let mut skipped = 0;

    while input.read_line(&mut buf).unwrap() > 0 {
        if let Some(kind) = pending_counter {
            if skipped < 3 {
                skipped += 1;
                buf.clear();
                continue;
            }
            skipped = 0;

            let count = str::parse::<u64>(&buf[..buf.len() - 1]).unwrap();
            match kind {
                Kind::Mem(id) => {
                    assert!(dynamic_counts.insert(id, count).is_none());
                }
                Kind::Input([idiom_id, cu_id, instr_id]) => {
                    assert!(
                        idiom_counts[idiom_id][cu_id]
                            .insert(u32::try_from(instr_id).unwrap(), count)
                            .is_none()
                    );
                }
                Kind::Output([idiom_id, cu_id]) => {
                    assert!(
                        idiom_counts[idiom_id][cu_id]
                            .insert(ids[&idioms[idiom_id].0[cu_id].root.as_value_ref()], count)
                            .is_none()
                    );
                }
            }
            pending_counter = None;
        }

        if buf == ":ir\n" || buf.ends_with("\n\n") {
            buf.clear();
        } else if buf.ends_with("# Func Hash:\n223372036859619000\n") {
            pending_counter = Some(Kind::Mem(
                str::parse::<u32>(&buf[4..buf.find('\n').unwrap()]).unwrap(),
            ));
        } else if buf.ends_with("# Func Hash:\n223372036859619001\n") {
            let buf = &buf[7..buf.find('\n').unwrap()];
            pending_counter = Some(Kind::Input(
                buf.split('_')
                    .map(str::parse::<usize>)
                    .map(Result::unwrap)
                    .next_chunk::<3>()
                    .unwrap(),
            ));
        } else if buf.ends_with("# Func Hash:\n223372036859619002\n") {
            let buf = &buf[8..buf.find('\n').unwrap()];
            pending_counter = Some(Kind::Output(
                buf.split('_')
                    .map(str::parse::<usize>)
                    .map(Result::unwrap)
                    .next_chunk::<2>()
                    .unwrap(),
            ));
        }
    }

    DynamicCounts {
        global_mem: dynamic_counts,
        idioms: idiom_counts,
    }
}

fn print_compute_units<'ctx, S: BuildHasher + Default>(
    module: &Module<'ctx>,
    State { ids, ids_index }: &State<'ctx, S>,
    idioms: &[Idiom<'ctx, S>],
    dynamic_counts: &DynamicCounts<S>,
) {
    let mut total_executed_loads = 0;
    let mut total_executed_stores = 0;
    for (&id, count) in &dynamic_counts.global_mem {
        match ids_index[usize::try_from(id).unwrap()].get_opcode() {
            InstructionOpcode::Load => {
                total_executed_loads += count;
            }
            InstructionOpcode::Store => {
                total_executed_stores += count;
            }
            _ => unreachable!(),
        }
    }
    let total_executed_mem_ops = total_executed_loads
        .checked_add(total_executed_stores)
        .unwrap();

    let idioms = {
        let mut idioms = idioms
            .iter()
            .zip(&dynamic_counts.idioms)
            .map(|(idiom, counts)| {
                let total = counts.iter().flat_map(|cu| cu.values()).sum::<u64>();
                (idiom, counts, total)
            })
            .enumerate()
            .collect::<Vec<_>>();
        idioms.sort_by(|(_, (cu_a, _, total_a)), (_, (cu_b, _, total_b))| {
            total_a
                .cmp(total_b)
                .then(cu_a.0.len().cmp(&cu_b.0.len()))
                .reverse()
        });
        idioms
    };

    let mut all_time_seen = HashSet::<_, S>::default();
    let mut seen = HashSet::default();
    let mut seen_params = HashSet::default();
    let mut ivv_pool = Pool::<Vec<InstructionId>>::default();
    let mut full_graph = HashMap::<InstructionId, Vec<InstructionId>, S>::default();

    let mut stdout = ManuallyDrop::new(unsafe { File::from_raw_fd(rustix::stdio::raw_stdout()) });
    let mut output = BufWriter::new(&mut *stdout);

    let mut csv = BufWriter::new(
        File::create(Path::new(&*module.get_name().to_string_lossy()).with_extension("csv"))
            .unwrap(),
    );
    writeln!(
        csv,
        "total_memory_ops,num_parameters,num_instructions,num_memory_instructions,\
         memory_ops_in_idiom,idiom_id,compute_unit_id"
    )
    .unwrap();

    writeln!(output, "strict digraph {{\nrankdir=BT").unwrap();
    writeln!(
        output,
        "subgraph {{\nStats [shape=plaintext]\ncluster=true\nlabel=\"Total loads executed: \
         {total_executed_loads}\\nTotal stores executed: {total_executed_stores}\"\n}}"
    )
    .unwrap();

    let mut compute_unit_pointers = Vec::new();
    let mut cum_counts = 0;
    for &(idiom_id, (compute_units, counts, total_counts)) in &idioms {
        let captured_mem_ops = |total: u64| {
            if total_executed_mem_ops == 0 {
                (0, 0)
            } else {
                let bps = total.checked_mul(1000).unwrap() / total_executed_mem_ops;
                (bps / 10, bps % 10)
            }
        };

        compute_unit_pointers.clear();
        counts
            .iter()
            .map(|counts| counts.values().sum::<u64>())
            .enumerate()
            .collect_into(&mut compute_unit_pointers);
        compute_unit_pointers.sort_by(|(_, a), (_, b)| a.cmp(b).reverse());

        writeln!(output, "subgraph {{").unwrap();
        let mut first = total_counts
            < u64::try_from(counts.len())
                .unwrap()
                .checked_mul(100)
                .unwrap();
        let mut prev_cu = None;
        for (compute_unit_id, cu, counts, total_counts) in compute_unit_pointers
            .iter()
            .map(|&(i, total_counts)| (i, &compute_units.0[i], &counts[i], total_counts))
        {
            cum_counts += total_counts;
            if !first && total_counts < 100 {
                continue;
            }
            first = false;

            let mut deduplicated_total_counts = 0;
            seen.clear();
            for instr in &cu.memory_ops {
                seen.insert(instr.as_value_ref());
            }
            let uses_mem_instruction_from_previous_idioms = {
                let mut overlap = false;
                for &instr in &seen {
                    if all_time_seen.insert(instr) {
                        deduplicated_total_counts += counts[&ids[&instr]];
                    } else {
                        overlap = true;
                    }
                }
                overlap
            };

            {
                seen.clear();
                seen.insert(cu.root.as_value_ref());
                for Edge(_, to) in &cu.edges {
                    seen.insert(to.as_value_ref());
                }
                let num_instructions = seen.len();

                build_full_graph(
                    cu.edges.iter().map(|e| e.to_stable(ids)),
                    &mut full_graph,
                    &mut ivv_pool,
                );
                let mut num_params = 0;
                seen.clear();
                seen_params.clear();
                count_params(
                    cu.root,
                    &full_graph,
                    ids,
                    ids_index,
                    &mut seen,
                    &mut seen_params,
                    &mut num_params,
                );
                for (_, v) in full_graph.drain() {
                    ivv_pool.release(v);
                }

                if deduplicated_total_counts != 0 {
                    writeln!(
                        csv,
                        "{total_executed_mem_ops},{num_params},{num_instructions},{},\
                         {deduplicated_total_counts},{idiom_id},{compute_unit_id}",
                        cu.memory_ops.len()
                    )
                    .unwrap();
                }
            }
            seen.clear();

            writeln!(output, "subgraph {{").unwrap();
            writeln!(
                output,
                "{{\nrank=max\n\"{idiom_id}_{compute_unit_id}\" [shape=point style=invis]\n}}",
            )
            .unwrap();
            if let Some(prev_cu_id) = prev_cu {
                let root_id = ids[&cu.root.as_value_ref()];
                writeln!(
                    output,
                    "\"{idiom_id}_{prev_cu_id}\" -> \"{idiom_id}_{compute_unit_id}_{root_id}\" \
                     [style=invis]",
                )
                .unwrap();
            }
            prev_cu = Some(compute_unit_id);
            for Edge(from, to) in &cu.edges {
                let mut create = |&node: &InstructionValue| {
                    if seen.insert(node.as_value_ref()) {
                        let is_root = node == cu.root;
                        if is_root {
                            writeln!(output, "{{\nrank=min").unwrap();
                        }

                        write!(
                            output,
                            "\"{idiom_id}_{compute_unit_id}_{}\" [label=\"{:?}",
                            ids[&node.as_value_ref()],
                            node.get_opcode(),
                        )
                        .unwrap();
                        if MEMORY_INSTRUCTIONS.contains(&node.get_opcode()) {
                            write!(output, "\\n{}", counts[&ids[&node.as_value_ref()]]).unwrap();
                        }
                        writeln!(output, "\"]").unwrap();

                        if is_root {
                            writeln!(output, "}}").unwrap();
                        }
                    }
                };
                create(from);
                create(to);

                writeln!(
                    output,
                    "\"{idiom_id}_{compute_unit_id}_{}\" -> \"{idiom_id}_{compute_unit_id}_{}\"",
                    ids[&from.as_value_ref()],
                    ids[&to.as_value_ref()],
                )
                .unwrap();
            }
            seen.clear();

            let captured_memory_operations = captured_mem_ops(counts.values().sum::<u64>());
            writeln!(
                output,
                "cluster=true\nlabel=\"Raw dynamic executions: {}\\nRaw memory operations: \
                 {}\\nCaptured memory operations: {}.{}%\"",
                dynamic_counts.global_mem[&ids[&cu.root.as_value_ref()]],
                cu.memory_ops
                    .iter()
                    .map(|instr| dynamic_counts.global_mem[&ids[&instr.as_value_ref()]])
                    .sum::<u64>(),
                captured_memory_operations.0,
                captured_memory_operations.1
            )
            .unwrap();
            if uses_mem_instruction_from_previous_idioms {
                writeln!(output, "color=red").unwrap();
            }
            writeln!(output, "}}").unwrap();
        }

        let captured_memory_operations = captured_mem_ops(total_counts);
        let cum_captured_memory_operations = captured_mem_ops(cum_counts);

        writeln!(
            output,
            "cluster=true\npenwidth=0\nlabel=\"Static occurrences: {}\\nMemory operations: \
             {total_counts}\\nCaptured memory operations: {}.{}%\\nCumulative: {}.{}%\\nId: \
             {idiom_id}\"\n}}",
            compute_units.0.len(),
            captured_memory_operations.0,
            captured_memory_operations.1,
            cum_captured_memory_operations.0,
            cum_captured_memory_operations.1,
        )
        .unwrap();
    }
    writeln!(output, "}}").unwrap();
}

fn count_params<'ctx, S: BuildHasher>(
    root: InstructionValue<'ctx>,
    full_graph: &HashMap<InstructionId, Vec<InstructionId>, S>,
    ids: &HashMap<LLVMValueRef, InstructionId, S>,
    ids_index: &[InstructionValue<'ctx>],
    seen: &mut HashSet<LLVMValueRef, S>,
    seen_params: &mut HashSet<LLVMValueRef, S>,
    num_params: &mut u32,
) {
    if !seen.insert(root.as_value_ref()) {
        return;
    }

    if root.get_opcode() == InstructionOpcode::Phi {
        let next = &full_graph[&ids[&root.as_value_ref()]];
        assert_eq!(next.len(), 1);
        count_params(
            ids_index[usize::try_from(next[0]).unwrap()],
            full_graph,
            ids,
            ids_index,
            seen,
            seen_params,
            num_params,
        );
    } else {
        let targets = full_graph
            .get(&ids[&root.as_value_ref()])
            .map_or([].as_slice(), |v| &**v);
        for value in root.get_operands().flatten().map(Either::unwrap_left) {
            if value.as_instruction_value().is_some()
                && targets.contains(&ids[&value.as_value_ref()])
            {
                count_params(
                    value.as_instruction_value().unwrap(),
                    full_graph,
                    ids,
                    ids_index,
                    seen,
                    seen_params,
                    num_params,
                );
            } else if seen_params.insert(value.as_value_ref()) {
                *num_params += 1;
            }
        }
    }
}

fn build_state<'ctx>(module: &Module<'ctx>) -> State<'ctx, BuildHasherDefault<FxHasher>> {
    let mut ids = HashMap::default();
    let mut ids_index = Vec::new();

    for instr in module
        .get_functions()
        .flat_map(FunctionValue::get_basic_block_iter)
        .flat_map(BasicBlock::get_instructions)
    {
        let previous = ids.insert(
            instr.as_value_ref(),
            u32::try_from(ids_index.len()).unwrap(),
        );
        debug_assert!(previous.is_none());
        ids_index.push(instr);
    }

    ids.shrink_to_fit();
    ids_index.shrink_to_fit();
    State { ids, ids_index }
}
