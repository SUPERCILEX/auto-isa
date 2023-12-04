use std::{
    collections::{hash_map::DefaultHasher, HashMap, HashSet},
    hash::{BuildHasher, BuildHasherDefault},
    io::{stdout, Write},
};

use llvm_plugin::{
    inkwell::{
        module::Module,
        values::{AsValueRef, InstructionValue},
    },
    utils::{FunctionIterator, InstructionIterator},
    AnalysisKey, LlvmModuleAnalysis, LlvmModulePass, ModuleAnalysisManager, PassBuilder,
    PipelineParsing, PreservedAnalyses,
};

use crate::analysis::{find_non_local_memory_compute_units, Cache, State};

mod analysis;

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

    builder.add_module_analysis_registration_callback(|manager| {
        manager.register_pass(AutoIsaAnalysis);
    });
}

struct AutoIsaPass;

impl LlvmModulePass for AutoIsaPass {
    fn run_pass(&self, module: &mut Module, manager: &ModuleAnalysisManager) -> PreservedAnalyses {
        manager.get_result::<AutoIsaAnalysis>(module);
        PreservedAnalyses::All
    }
}

struct AutoIsaAnalysis;

impl LlvmModuleAnalysis for AutoIsaAnalysis {
    type Result = ();

    fn run_analysis(&self, module: &Module, _: &ModuleAnalysisManager) -> Self::Result {
        let mut state = build_state(module);
        {
            let mut cache = Cache::default();
            for function in FunctionIterator::new(module) {
                find_non_local_memory_compute_units(&mut cache, &mut state, function);
            }
        }

        print_compute_units(state);
    }

    fn id() -> AnalysisKey {
        1 as AnalysisKey
    }
}

fn print_compute_units<S: BuildHasher>(
    State {
        ids, compute_units, ..
    }: State<S>,
) {
    let compute_units = {
        let mut compute_units = compute_units.into_iter().collect::<Vec<_>>();
        compute_units.sort_by_key(|(_, compute_unit)| usize::MAX - compute_unit.len());
        compute_units
    };

    let mut seen = HashSet::new();

    let mut output = stdout().lock();
    writeln!(output, "strict digraph {{\nrankdir=BT").unwrap();
    for (compute_unit_id, (graph, roots)) in compute_units.iter().enumerate() {
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
            "cluster=true\nlabel=<Static occurrences: {}>\n}}",
            roots.len()
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
