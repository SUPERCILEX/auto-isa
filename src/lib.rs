use std::{
    collections::{hash_map::DefaultHasher, HashMap, HashSet},
    fs::File,
    hash::{BuildHasher, BuildHasherDefault},
    io::{stdin, stdout, BufRead, BufWriter, Write},
    mem::ManuallyDrop,
    os::fd::FromRawFd,
};

use llvm_plugin::{
    inkwell::{
        module::Module,
        values::{AsValueRef, InstructionValue},
    },
    utils::{FunctionIterator, InstructionIterator},
    LlvmModulePass, ModuleAnalysisManager, PassBuilder, PipelineParsing, PreservedAnalyses,
};
use rustix::{process::WaitOptions, runtime::Fork::Parent};

use crate::{
    analysis::{find_non_local_memory_compute_units, Cache, State},
    instrumentation::instrument_compute_units,
};

mod analysis;
mod instrumentation;

#[llvm_plugin::plugin(name = "AutoIsa", version = "0.1")]
fn plugin_registrar(builder: &mut PassBuilder) {
    builder.add_module_pipeline_parsing_callback(|name, pass_manager| {
        if name == "auto-isa" {
            pass_manager.add_pass(AutoIsaPass);
            PipelineParsing::Parsed
        } else {
            PipelineParsing::NotParsed
        }
    });
}

struct AutoIsaPass;

impl LlvmModulePass for AutoIsaPass {
    fn run_pass(&self, module: &mut Module, _: &ModuleAnalysisManager) -> PreservedAnalyses {
        let mut state = build_state(module);
        {
            let mut cache = Cache::default();
            for function in FunctionIterator::new(module) {
                find_non_local_memory_compute_units(&mut cache, &mut state, function);
            }
        }
        split_into_next_stage(&state);

        instrument_compute_units(&state, module);
        PreservedAnalyses::None
    }
}

fn split_into_next_stage<S: BuildHasher>(state: &State<S>) {
    let Parent(child) = unsafe { rustix::runtime::fork() }.unwrap() else {
        return;
    };
    assert_eq!(
        0,
        rustix::process::waitpid(Some(child), WaitOptions::empty())
            .unwrap()
            .unwrap()
            .exit_status()
            .unwrap()
    );
    {
        let mut stdout = stdout().lock();
        stdout.write_all(&[0]).unwrap();
        stdout.flush().unwrap();
    }

    let mut dynamic_counts = HashMap::new();
    {
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
    }

    print_compute_units(state, &dynamic_counts);
}

fn print_compute_units<S: BuildHasher>(
    State {
        ids, compute_units, ..
    }: &State<S>,
    dynamic_counts: &HashMap<u32, u64>,
) {
    let compute_units = {
        let mut compute_units = compute_units
            .iter()
            .map(|(graph, roots)| {
                let dynamic_count = roots
                    .iter()
                    .map(|instr| dynamic_counts[&ids[&instr.as_value_ref()]])
                    .sum::<u64>();
                (graph, roots, dynamic_count)
            })
            .collect::<Vec<_>>();
        compute_units.sort_by(
            |(_, compute_unit_a, dynamic_count_a), (_, compute_unit_b, dynamic_count_b)| {
                dynamic_count_a
                    .cmp(dynamic_count_b)
                    .then(compute_unit_a.len().cmp(&compute_unit_b.len()))
            },
        );
        compute_units
    };

    let mut seen = HashSet::new();

    let mut stdout = ManuallyDrop::new(unsafe { File::from_raw_fd(1) });
    let mut output = BufWriter::new(&mut *stdout);
    writeln!(output, "strict digraph {{\nrankdir=BT").unwrap();
    for (compute_unit_id, (graph, roots, dynamic_count)) in compute_units.iter().rev().enumerate() {
        writeln!(output, "subgraph {{").unwrap();
        for (from, to) in &graph.edges {
            let mut create = |node: &InstructionValue| {
                if seen.insert(node.as_value_ref()) {
                    writeln!(
                        output,
                        "\"{compute_unit_id}_{}\" [label=\"{:?}\"]",
                        ids[&node.as_value_ref()],
                        node.get_opcode(),
                    )
                    .unwrap();
                }
            };
            create(from);
            create(to);

            writeln!(
                output,
                "\"{compute_unit_id}_{}\" -> \"{compute_unit_id}_{}\"",
                ids[&from.as_value_ref()],
                ids[&to.as_value_ref()],
            )
            .unwrap();
        }
        seen.clear();
        writeln!(
            output,
            "cluster=true\nlabel=\"Static occurrences: {}\\nDynamic executions: \
             {dynamic_count}\"\n}}",
            roots.len(),
        )
        .unwrap();
    }
    writeln!(output, "}}").unwrap();
}

fn build_state<'ctx>(module: &Module<'ctx>) -> State<'ctx, BuildHasherDefault<DefaultHasher>> {
    let mut ids = HashMap::new();
    let mut ids_index = Vec::new();
    for function in FunctionIterator::new(module) {
        for bb in function.get_basic_blocks() {
            for instr in InstructionIterator::new(&bb) {
                let previous = ids.insert(
                    instr.as_value_ref(),
                    u32::try_from(ids_index.len()).unwrap(),
                );
                debug_assert!(previous.is_none());
                ids_index.push(instr);
            }
        }
    }
    State::new(ids, ids_index)
}
