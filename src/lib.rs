use std::{
    collections::{hash_map::DefaultHasher, HashMap},
    hash::{BuildHasher, BuildHasherDefault},
    io::{stdout, Write},
};

use llvm_plugin::{
    inkwell::{llvm_sys::prelude::LLVMValueRef, module::Module, values::AsValueRef},
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
        let mut state = State::<BuildHasherDefault<DefaultHasher>>::new(build_ids(module));
        {
            let mut cache = Cache::default();
            for function in FunctionIterator::new(module) {
                find_non_local_memory_compute_units(&mut cache, &mut state, function);
            }
        }

        print_compute_units(&state);
    }

    fn id() -> AnalysisKey {
        1 as AnalysisKey
    }
}

fn print_compute_units<S: BuildHasher>(State { ids, compute_units }: &State<S>) {
    let mut output = stdout().lock();
    writeln!(output, "strict digraph {{\nrankdir=BT").unwrap();
    for (compute_unit_id, (graph, roots)) in compute_units.iter().enumerate() {
        writeln!(output, "subgraph {{").unwrap();
        for (instr, dependencies) in graph.edges.values() {
            writeln!(
                output,
                "\"{compute_unit_id}_{0}\" [label=\"{1:?}\"]\n\"{compute_unit_id}_{0}\" -> {{",
                ids[&instr.as_value_ref()],
                instr.get_opcode()
            )
            .unwrap();
            for instr in dependencies {
                writeln!(
                    output,
                    "\"{compute_unit_id}_{}\"",
                    ids[&instr.as_value_ref()]
                )
                .unwrap();
            }
            writeln!(output, "}}").unwrap();

            for instr in dependencies {
                if !graph.edges.contains_key(&ids[&instr.as_value_ref()]) {
                    writeln!(
                        output,
                        "\"{compute_unit_id}_{}\" [label=\"{:?}\"]",
                        ids[&instr.as_value_ref()],
                        instr.get_opcode()
                    )
                    .unwrap();
                }
            }
        }
        writeln!(
            output,
            "cluster=true\nlabel=<Static occurrences: {}>\n}}",
            roots.len()
        )
        .unwrap();
    }
    writeln!(output, "}}").unwrap();
}

fn build_ids(module: &Module) -> HashMap<LLVMValueRef, u32> {
    let mut id = 0;
    let mut ids = HashMap::new();
    for function in FunctionIterator::new(module) {
        for bb in function.get_basic_blocks() {
            for instr in InstructionIterator::new(&bb) {
                let previous = ids.insert(instr.as_value_ref(), id);
                debug_assert!(previous.is_none());
                id += 1;
            }
        }
    }
    ids
}
