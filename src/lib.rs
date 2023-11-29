use std::{
    borrow::Cow,
    collections::HashMap,
    io::{stdout, Write},
};

use either::Either;
use llvm_plugin::{
    inkwell::{
        llvm_sys::prelude::LLVMValueRef,
        values::{
            AnyValue, AsValueRef, BasicValue, FunctionValue, InstructionOpcode, InstructionValue,
        },
    },
    utils::InstructionIterator,
    AnalysisKey, FunctionAnalysisManager, LlvmFunctionAnalysis, LlvmFunctionPass, PassBuilder,
    PipelineParsing, PreservedAnalyses,
};

#[llvm_plugin::plugin(name = "AutoIsa", version = "0.1")]
fn plugin_registrar(builder: &mut PassBuilder) {
    builder.add_function_pipeline_parsing_callback(|name, pass_manager| {
        if name == "auto-isa" {
            pass_manager.add_pass(AutoIsaPass);
            PipelineParsing::Parsed
        } else {
            PipelineParsing::NotParsed
        }
    });

    builder.add_function_analysis_registration_callback(|manager| {
        manager.register_pass(AutoIsaAnalysis);
    });
}

struct AutoIsaPass;

impl LlvmFunctionPass for AutoIsaPass {
    fn run_pass(
        &self,
        function: &mut FunctionValue,
        manager: &FunctionAnalysisManager,
    ) -> PreservedAnalyses {
        println!("strict digraph {{");
        manager.get_result::<AutoIsaAnalysis>(function);
        println!("}}");

        PreservedAnalyses::All
    }
}

struct AutoIsaAnalysis;

impl LlvmFunctionAnalysis for AutoIsaAnalysis {
    type Result = ();

    fn run_analysis(&self, function: &FunctionValue, _: &FunctionAnalysisManager) -> Self::Result {
        const TARGET_INSTRUCTIONS: &[InstructionOpcode] =
            &[InstructionOpcode::Store, InstructionOpcode::Load];

        let mut output = stdout().lock();
        writeln!(output, "subgraph {{").unwrap();

        let state = {
            let mut state = FunctionAnalysisState {
                fn_name: function.get_name().to_string_lossy(),
                ids: HashMap::new(),
            };
            let mut instruction_count = 0;

            for bb in function.get_basic_blocks() {
                for instr in InstructionIterator::new(&bb) {
                    assert!(
                        state
                            .ids
                            .insert(instr.as_value_ref(), instruction_count)
                            .is_none()
                    );
                    instruction_count += 1;
                }
            }

            state
        };

        for bb in function.get_basic_blocks() {
            for instr in InstructionIterator::new(&bb) {
                if !TARGET_INSTRUCTIONS.contains(&instr.get_opcode()) {
                    continue;
                }

                writeln!(output, "subgraph {{").unwrap();

                {
                    let mut path = Vec::new();
                    find_instruction_dependencies(&mut output, &state, &mut path, instr);
                }

                writeln!(
                    output,
                    "cluster=true\nlabel=\"{:?} instruction dependencies\"\nlabelloc=b\n}}",
                    instr.get_opcode()
                )
                .unwrap();
            }
        }
        writeln!(
            output,
            "cluster=true\nlabel={}\nlabelloc=b\n}}",
            state.fn_name
        )
        .unwrap();
    }

    fn id() -> AnalysisKey {
        1 as AnalysisKey
    }
}

struct FunctionAnalysisState<'a> {
    fn_name: Cow<'a, str>,
    ids: HashMap<LLVMValueRef, u32>,
}

fn find_instruction_dependencies(
    output: &mut impl Write,
    state: &FunctionAnalysisState,
    path: &mut Vec<LLVMValueRef>,
    instruction: InstructionValue,
) {
    writeln!(
        output,
        "{}_{} [label=\"{:?}\" comment={:?}]",
        state.fn_name,
        state.ids[&instruction.as_value_ref()],
        instruction.get_opcode(),
        instruction.print_to_string(),
    )
    .unwrap();
    writeln!(
        output,
        "{0}_{1} -> {{",
        state.fn_name,
        state.ids[&instruction.as_value_ref()],
    )
    .unwrap();

    if path.contains(&instruction.as_value_ref()) {
        writeln!(output, "}}").unwrap();
        return;
    }

    let mut pending = Vec::new();

    for i in 0..instruction.get_num_operands() {
        if let Some(op) = instruction.get_operand(i) {
            match op {
                Either::Left(value) => {
                    if let Some(parent) = value.as_instruction_value() {
                        pending.push(parent);
                        writeln!(
                            output,
                            "{0}_{1}",
                            state.fn_name,
                            state.ids[&parent.as_value_ref()],
                        )
                        .unwrap();
                    }
                }
                Either::Right(_block) => {
                    todo!();
                }
            }
        }
    }

    writeln!(output, "}}").unwrap();

    for instr in pending {
        path.push(instruction.as_value_ref());
        find_instruction_dependencies(output, state, path, instr);
        path.pop();
    }
}
