#![feature(iter_collect_into)]

use std::{
    collections::{HashMap, HashSet},
    fs::File,
    hash::{BuildHasher, BuildHasherDefault},
    io::{stdin, BufRead, BufWriter, Write},
    mem::ManuallyDrop,
    os::fd::FromRawFd,
};

use llvm_plugin::{
    inkwell::{
        basic_block::BasicBlock,
        llvm_sys::prelude::LLVMValueRef,
        module::Module,
        values::{AsValueRef, FunctionValue, InstructionOpcode, InstructionValue},
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
    utils::{Edge, MEMORY_INSTRUCTIONS},
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
    pub ids: HashMap<LLVMValueRef, u32, S>,
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

        instrument_compute_units(&state, module);
        PreservedAnalyses::None
    }
}

fn split_into_next_stage<'ctx, S: BuildHasher + Default>(
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

    let dynamic_counts = read_dynamic_counts();
    print_compute_units(state, idioms, &dynamic_counts);
    std::process::exit(0);
}

fn read_dynamic_counts() -> HashMap<u32, u64> {
    let mut dynamic_counts = HashMap::new();

    let mut input = stdin().lock();
    let mut buf = String::new();
    let mut pending_counter = None;
    let mut skipped = 0;

    while input.read_line(&mut buf).unwrap() > 0 {
        if let Some(id) = pending_counter {
            if skipped < 3 {
                skipped += 1;
                buf.clear();
                continue;
            }
            skipped = 0;

            dynamic_counts.insert(id, str::parse::<u64>(&buf[..buf.len() - 1]).unwrap());
            pending_counter = None;
        }

        if buf == ":ir\n" || buf.ends_with("\n\n") {
            buf.clear();
        } else if buf.ends_with("# Func Hash:\n4844047\n") {
            pending_counter = Some(str::parse::<u32>(&buf[..buf.find('\n').unwrap()]).unwrap());
        }
    }

    dynamic_counts
}

#[allow(clippy::too_many_lines)]
fn print_compute_units<'ctx, S: BuildHasher>(
    State { ids, ids_index }: &State<'ctx, S>,
    idioms: &[Idiom<'ctx, S>],
    dynamic_counts: &HashMap<u32, u64>,
) {
    let mut total_executed_loads = 0;
    let mut total_executed_stores = 0;
    for (&id, count) in dynamic_counts {
        match ids_index[usize::try_from(id).unwrap()].get_opcode() {
            InstructionOpcode::Load => {
                total_executed_loads += count;
            }
            InstructionOpcode::Store => {
                total_executed_stores += count;
            }
            _ => continue,
        }
    }
    let total_executed_mem_ops = total_executed_loads
        .checked_add(total_executed_stores)
        .unwrap();

    let idioms = {
        let mut idioms = idioms
            .iter()
            .map(|roots| {
                let dynamic_count = roots
                    .0
                    .iter()
                    .map(|cu| dynamic_counts[&ids[&cu.root.as_value_ref()]])
                    .sum::<u64>();
                (roots, dynamic_count)
            })
            .collect::<Vec<_>>();
        idioms.sort_by(
            |(compute_unit_a, dynamic_count_a), (compute_unit_b, dynamic_count_b)| {
                dynamic_count_a
                    .cmp(dynamic_count_b)
                    .then(compute_unit_a.0.len().cmp(&compute_unit_b.0.len()))
            },
        );
        idioms
    };

    let mut all_time_seen = HashSet::new();
    let mut seen = HashSet::new();

    let mut stdout = ManuallyDrop::new(unsafe { File::from_raw_fd(rustix::stdio::raw_stdout()) });
    let mut output = BufWriter::new(&mut *stdout);

    writeln!(output, "strict digraph {{\nrankdir=BT").unwrap();
    writeln!(
        output,
        "subgraph {{\nStats [shape=plaintext]\ncluster=true\nlabel=\"Total loads executed: \
         {total_executed_loads}\\nTotal stores executed: {total_executed_stores}\"\n}}"
    )
    .unwrap();

    for (idiom_id, &(compute_units, dynamic_count)) in idioms.iter().rev().enumerate() {
        macro_rules! captured_mem_ops {
            ($iter:expr) => {{
                let total = $iter
                    .map(|instr| dynamic_counts[&ids[&instr.as_value_ref()]])
                    .sum::<u64>();

                if total_executed_mem_ops == 0 {
                    (0, 0)
                } else {
                    let bps = total.checked_mul(1000).unwrap() / total_executed_mem_ops;
                    (bps / 10, bps % 10)
                }
            }};
        }

        writeln!(output, "subgraph {{").unwrap();
        let mut first = !compute_units
            .0
            .iter()
            .any(|cu| dynamic_counts[&ids[&cu.root.as_value_ref()]] >= 100);
        for (compute_unit_id, cu) in compute_units.0.iter().enumerate() {
            for instr in compute_units.0.iter().flat_map(|cu| &cu.memory_ops) {
                seen.insert(instr.as_value_ref());
            }
            let uses_mem_instruction_from_previous_idioms = {
                let mut overlap = false;
                for &instr in &seen {
                    overlap |= !all_time_seen.insert(instr);
                }
                overlap
            };
            seen.clear();

            if !first && dynamic_counts[&ids[&cu.root.as_value_ref()]] < 100 {
                continue;
            }
            first = false;

            writeln!(output, "subgraph {{").unwrap();
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
                            write!(output, "\\n{}", dynamic_counts[&ids[&node.as_value_ref()]])
                                .unwrap();
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

            let captured_memory_operations = captured_mem_ops!(cu.memory_ops.iter());
            writeln!(
                output,
                "cluster=true\nlabel=\"Dynamic executions: {}\\nCaptured memory operations: \
                 {}.{}%\"",
                dynamic_counts[&ids[&cu.root.as_value_ref()]],
                captured_memory_operations.0,
                captured_memory_operations.1
            )
            .unwrap();
            if uses_mem_instruction_from_previous_idioms {
                writeln!(output, "color=red").unwrap();
            }
            writeln!(output, "}}").unwrap();
        }

        let captured_memory_operations =
            captured_mem_ops!(compute_units.0.iter().flat_map(|cu| &cu.memory_ops));

        writeln!(
            output,
            "cluster=true\nlabel=\"Static occurrences: {}\\nDynamic executions: \
             {dynamic_count}\\nCaptured memory operations: {}.{}%\"\n}}",
            compute_units.0.len(),
            captured_memory_operations.0,
            captured_memory_operations.1
        )
        .unwrap();
    }
    writeln!(output, "}}").unwrap();
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
