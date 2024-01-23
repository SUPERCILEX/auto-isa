use std::fmt::Write;

use llvm_plugin::inkwell::{
    basic_block::BasicBlock,
    module::Module,
    values::{AsValueRef, FunctionValue},
    AddressSpace,
};

use crate::analysis::{State, MEMORY_INSTRUCTIONS};

pub fn instrument_compute_units<'ctx, S>(
    State { ids, .. }: &State<'ctx, S>,
    module: &Module<'ctx>,
) {
    let ctx = module.get_context();
    let incr_fn = module.add_function(
        "llvm.instrprof.increment",
        ctx.void_type().fn_type(
            &[
                ctx.i8_type().ptr_type(AddressSpace::default()).into(),
                ctx.i64_type().into(),
                ctx.i32_type().into(),
                ctx.i32_type().into(),
            ],
            false,
        ),
        None,
    );

    let mut global_name_buf = "prof_auto_isa_".to_string();
    let base_name_len = global_name_buf.len();
    for instr in module
        .get_functions()
        .flat_map(FunctionValue::get_basic_block_iter)
        .flat_map(BasicBlock::get_instructions)
        .filter(|instr| MEMORY_INSTRUCTIONS.contains(&instr.get_opcode()))
    {
        let id = {
            let id = ids[&instr.as_value_ref()];
            write!(global_name_buf, "{id}").unwrap();
            let id = &global_name_buf[base_name_len..];

            let value = ctx.const_string(id.as_bytes(), false);
            let global = module.add_global(value.get_type(), None, &global_name_buf);
            global.set_initializer(&value);
            global_name_buf.drain((global_name_buf.len() - id.len())..);

            global
        };

        let builder = ctx.create_builder();
        builder.position_at(instr.get_parent().unwrap(), &instr);
        builder
            .build_call(
                incr_fn,
                &[
                    id.as_pointer_value().into(),
                    ctx.i64_type().const_int(4_844_047, false).into(),
                    ctx.i32_type().const_int(1, false).into(),
                    ctx.i32_type().const_int(0, false).into(),
                ],
                "call",
            )
            .unwrap();
    }
}
