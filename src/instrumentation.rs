use std::{
    collections::HashMap,
    fmt::{Debug, Formatter, Write},
    hash::BuildHasher,
    ops::{Deref, DerefMut},
};

use llvm_plugin::inkwell::{
    basic_block::BasicBlock,
    llvm_sys::prelude::LLVMValueRef,
    module::Module,
    values::{AsValueRef, FunctionValue},
    AddressSpace,
};

use crate::{
    analysis::{ComputeUnit, Idiom},
    utils::{InstructionId, MEMORY_INSTRUCTIONS},
    State,
};

pub fn instrument_compute_units<'ctx, S: BuildHasher>(
    State { ids, .. }: &State<'ctx, S>,
    idioms: &[Idiom<'ctx, S>],
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

    let mut buf = String::new();

    count_mem_ops(module, incr_fn, ids, &mut buf);
    buf.clear();

    count_input_ops(module, incr_fn, idioms, ids, &mut buf);
}

#[must_use]
pub struct StringView<'a>(usize, &'a mut String);

impl<'a> StringView<'a> {
    pub fn new(s: &'a mut String) -> Self {
        Self(s.len(), s)
    }

    pub fn extend(s: &'a mut String, e: &str) -> Self {
        let before = s.len();
        s.push_str(e);
        Self(before, s)
    }
}

impl<'a> Deref for StringView<'a> {
    type Target = String;

    fn deref(&self) -> &Self::Target {
        self.1
    }
}

impl<'a> AsRef<str> for StringView<'a> {
    fn as_ref(&self) -> &str {
        self.1
    }
}

impl<'a> DerefMut for StringView<'a> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        self.1
    }
}

impl<'a> Debug for StringView<'a> {
    fn fmt(&self, f: &mut Formatter<'_>) -> std::fmt::Result {
        Debug::fmt(&**self, f)
    }
}

impl<'a> Drop for StringView<'a> {
    fn drop(&mut self) {
        self.1.drain(self.0..);
    }
}

fn count_mem_ops<'ctx, S: BuildHasher>(
    module: &Module<'ctx>,
    incr_fn: FunctionValue<'ctx>,
    ids: &HashMap<LLVMValueRef, InstructionId, S>,
    global_name_buf: &mut String,
) {
    let ctx = module.get_context();

    global_name_buf.push_str("auto_isa_mem_");
    let base_name_len = global_name_buf.len();
    for instr in module
        .get_functions()
        .flat_map(FunctionValue::get_basic_block_iter)
        .flat_map(BasicBlock::get_instructions)
        .filter(|instr| MEMORY_INSTRUCTIONS.contains(&instr.get_opcode()))
    {
        let id = {
            let mut buf = StringView::new(global_name_buf);
            let id = ids[&instr.as_value_ref()];
            write!(buf, "{id}").unwrap();
            let id = &buf[base_name_len - 4..];

            let value = ctx.const_string(id.as_bytes(), false);
            let global = module.add_global(value.get_type(), None, &buf);
            global.set_initializer(&value);

            global
        };

        let builder = ctx.create_builder();
        builder.position_at(instr.get_parent().unwrap(), &instr);
        builder
            .build_call(
                incr_fn,
                &[
                    id.as_pointer_value().into(),
                    #[allow(clippy::unreadable_literal)]
                    ctx.i64_type().const_int(223372036859619000, false).into(),
                    ctx.i32_type().const_int(1, false).into(),
                    ctx.i32_type().const_int(0, false).into(),
                ],
                "call",
            )
            .unwrap();
    }
}

fn count_input_ops<'ctx, S: BuildHasher>(
    module: &Module<'ctx>,
    incr_fn: FunctionValue<'ctx>,
    idioms: &[Idiom<'ctx, S>],
    ids: &HashMap<LLVMValueRef, InstructionId, S>,
    global_name_buf: &mut String,
) {
    let ctx = module.get_context();
    let gen_incr_fn = |name: &_, args: &_| {
        let maybe_incr_fn = module.add_function(
            name,
            ctx.void_type().fn_type(&[ctx.bool_type().into()], false),
            None,
        );

        let b = ctx.create_builder();
        b.position_at_end(ctx.append_basic_block(maybe_incr_fn, "entry"));

        let yes = ctx.append_basic_block(maybe_incr_fn, "yes");
        let no = ctx.append_basic_block(maybe_incr_fn, "no");

        b.build_conditional_branch(
            maybe_incr_fn.get_nth_param(0).unwrap().try_into().unwrap(),
            yes,
            no,
        )
        .unwrap();

        b.position_at_end(yes);
        b.build_call(incr_fn, args, "call").unwrap();
        b.build_return(None).unwrap();

        b.position_at_end(no);
        b.build_return(None).unwrap();

        maybe_incr_fn
    };

    global_name_buf.push_str("auto_isa_inputs_");
    let base_name_len = global_name_buf.len();
    for (idiom_id, Idiom(cus)) in idioms.iter().enumerate() {
        for (
            cu_id,
            ComputeUnit {
                edges: _,
                root,
                memory_ops,
            },
        ) in cus.iter().enumerate()
        {
            for input in memory_ops.iter().filter(|&instr| instr != root) {
                let mut buf = StringView::new(global_name_buf);
                write!(buf, "{idiom_id}_{cu_id}_{}", ids[&input.as_value_ref()]).unwrap();

                let b = ctx.create_builder();

                b.position_before(
                    &input
                        .get_parent()
                        .unwrap()
                        .get_parent()
                        .unwrap()
                        .get_first_basic_block()
                        .unwrap()
                        .get_first_instruction()
                        .unwrap(),
                );
                let active = b
                    .build_alloca(ctx.bool_type(), &StringView::extend(&mut buf, "_active"))
                    .unwrap();
                b.build_store(active, ctx.bool_type().const_zero()).unwrap();

                b.position_before(input);
                b.build_store(active, ctx.bool_type().const_all_ones())
                    .unwrap();

                b.position_before(root);
                {
                    let value = ctx.const_string(buf[base_name_len - 7..].as_bytes(), false);
                    let id = module.add_global(value.get_type(), None, &buf);
                    id.set_initializer(&value);

                    let activated = b
                        .build_load(
                            ctx.bool_type(),
                            active,
                            &StringView::extend(&mut buf, "_activated"),
                        )
                        .unwrap();
                    b.build_call(
                        gen_incr_fn(
                            &StringView::extend(&mut buf, "_maybe"),
                            &[
                                id.as_pointer_value().into(),
                                #[allow(clippy::unreadable_literal)]
                                ctx.i64_type().const_int(223372036859619001, false).into(),
                                ctx.i32_type().const_int(1, false).into(),
                                ctx.i32_type().const_int(0, false).into(),
                            ],
                        ),
                        &[activated.into()],
                        "call",
                    )
                    .unwrap();
                }
                b.build_store(active, ctx.bool_type().const_zero()).unwrap();
            }
        }
    }
}
