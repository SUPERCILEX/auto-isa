use std::fmt::Write;

use llvm_plugin::inkwell::{module::Module, values::AsValueRef, AddressSpace};

use crate::analysis::State;

pub fn instrument_compute_units<'ctx, S>(
    State {
        ids, compute_units, ..
    }: &State<'ctx, S>,
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
    for root in compute_units.values().flatten() {
        let id = {
            let id = ids[&root.as_value_ref()];
            write!(global_name_buf, "{id}").unwrap();
            let id = &global_name_buf[base_name_len..];

            let value = ctx.const_string(id.as_bytes(), false);
            let global = module.add_global(value.get_type(), None, &global_name_buf);
            global.set_initializer(&value);
            global_name_buf.drain((global_name_buf.len() - id.len())..);

            global
        };

        let builder = ctx.create_builder();
        builder.position_at(root.get_parent().unwrap(), root);
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
