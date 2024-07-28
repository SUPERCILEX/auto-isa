use std::{
    collections::HashMap,
    fmt::{Debug, Formatter, Write},
    hash::BuildHasher,
    ops::{Deref, DerefMut},
};

use llvm_plugin::inkwell::{
    basic_block::BasicBlock,
    builder::Builder,
    context::ContextRef,
    llvm_sys::prelude::LLVMValueRef,
    module::Module,
    types::FunctionType,
    values::{
        AnyValue, AsValueRef, BasicMetadataValueEnum, FunctionValue, InstructionOpcode,
        InstructionValue, IntValue, PhiValue, PointerValue,
    },
    AddressSpace, IntPredicate,
};

use crate::{
    analysis::{ComputeUnit, Idiom},
    utils::{build_full_graph, Edge, InstructionId, Pool, MEMORY_INSTRUCTIONS},
    State,
};

pub fn instrument_compute_units<'ctx, S: BuildHasher + Default>(
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

    let rsp_fn = {
        let get_rsp_fn = ctx
            .i64_type()
            .ptr_type(AddressSpace::default())
            .fn_type(&[], false);
        let get_rsp = ctx.create_inline_asm(
            get_rsp_fn,
            "movq %rsp, $0".to_string(),
            "=r".to_string(),
            false,
            false,
            None,
            false,
        );

        (get_rsp_fn, get_rsp)
    };

    let mut buf = String::new();

    count_mem_ops(module, incr_fn, ids, &mut StringView::new(&mut buf));

    let mut output_executions = Vec::with_capacity(idioms.len());
    count_output_ops(
        module,
        incr_fn,
        rsp_fn,
        idioms,
        ids,
        &mut output_executions,
        &mut StringView::new(&mut buf),
    );
    count_input_ops(
        module,
        incr_fn,
        rsp_fn,
        idioms,
        ids,
        &output_executions,
        &mut StringView::new(&mut buf),
    );
}

#[must_use]
struct StringView<'a>(usize, &'a mut String);

impl<'a> StringView<'a> {
    pub fn new(s: &'a mut String) -> Self {
        Self(s.len(), s)
    }

    pub fn extend(s: &'a mut String, e: &str) -> Self {
        let mut view = Self::new(s);
        view.push_str(e);
        view
    }
}

impl<'a> Deref for StringView<'a> {
    type Target = String;

    fn deref(&self) -> &Self::Target {
        self.1
    }
}

impl<'a> DerefMut for StringView<'a> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        self.1
    }
}

impl<'a> AsRef<str> for StringView<'a> {
    fn as_ref(&self) -> &str {
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
    rsp_fn: (FunctionType<'ctx>, PointerValue<'ctx>),
    idioms: &[Idiom<'ctx, S>],
    ids: &HashMap<LLVMValueRef, InstructionId, S>,
    output_executions: &[IntValue<'ctx>],
    global_name_buf: &mut String,
) {
    let ctx = module.get_context();

    global_name_buf.push_str("auto_isa_inputs_");
    let base_name_len = global_name_buf.len();
    let mut i = 0;
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
            let first_instr = root
                .get_parent()
                .unwrap()
                .get_parent()
                .unwrap()
                .get_first_basic_block()
                .unwrap()
                .get_first_instruction()
                .unwrap();
            let output_activated = output_executions[i];
            i += 1;

            for input in memory_ops.iter().filter(|&instr| instr != root) {
                let mut buf = StringView::new(global_name_buf);
                write!(buf, "{idiom_id}_{cu_id}_{}", ids[&input.as_value_ref()]).unwrap();

                let b = ctx.create_builder();

                b.position_before(&first_instr);
                let active = b
                    .build_alloca(ctx.bool_type(), &StringView::extend(&mut buf, "_active"))
                    .unwrap();
                b.build_store(active, ctx.bool_type().const_zero()).unwrap();

                b.position_before(input);
                b.build_store(active, gen_is_not_stack_address(&ctx, &b, rsp_fn, *input))
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
                    let activated = b
                        .build_and(
                            activated.into_int_value(),
                            output_activated,
                            &StringView::extend(&mut buf, "_both"),
                        )
                        .unwrap();
                    b.build_call(
                        gen_incr_fn(
                            module,
                            incr_fn,
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

#[derive(Default)]
struct Cache<S> {
    ivv_pool: Pool<Vec<InstructionId>>,
    full_graph: HashMap<InstructionId, Vec<InstructionId>, S>,
}

impl<S> Cache<S> {
    fn reset(&mut self) {
        let Self {
            ivv_pool,
            full_graph,
        } = self;

        for (_, v) in full_graph.drain() {
            ivv_pool.release(v);
        }
    }
}

fn count_output_ops<'ctx, S: BuildHasher + Default>(
    module: &Module<'ctx>,
    incr_fn: FunctionValue<'ctx>,
    rsp_fn: (FunctionType<'ctx>, PointerValue<'ctx>),
    idioms: &[Idiom<'ctx, S>],
    ids: &HashMap<LLVMValueRef, InstructionId, S>,
    output_executions: &mut Vec<IntValue<'ctx>>,
    global_name_buf: &mut String,
) {
    let ctx = module.get_context();
    let mut cache = Cache::<S>::default();
    let mut buf2 = String::new();

    global_name_buf.push_str("auto_isa_outputs_");
    let base_name_len = global_name_buf.len();
    for (idiom_id, Idiom(cus)) in idioms.iter().enumerate() {
        for (
            cu_id,
            ComputeUnit {
                edges,
                root,
                memory_ops: _,
            },
        ) in cus.iter().enumerate()
        {
            cache.reset();
            build_full_graph(
                edges.iter().map(|e| e.to_stable(ids)),
                &mut cache.full_graph,
                &mut cache.ivv_pool,
            );

            let mut buf = StringView::new(global_name_buf);
            write!(buf, "{idiom_id}_{cu_id}").unwrap();
            buf2.clone_from(&buf);

            let first_instr = root
                .get_parent()
                .unwrap()
                .get_parent()
                .unwrap()
                .get_first_basic_block()
                .unwrap()
                .get_first_instruction()
                .unwrap();

            let b = ctx.create_builder();
            let activated = edges
                .iter()
                .map(|Edge(from, _)| from)
                .filter_map(|&instr| PhiValue::try_from(instr).ok())
                .map(|phi| {
                    b.position_before(&first_instr);
                    let active = b
                        .build_alloca(
                            ctx.bool_type(),
                            &StringView::extend(&mut buf, "_active_path"),
                        )
                        .unwrap();
                    b.build_store(active, ctx.bool_type().const_zero()).unwrap();

                    b.position_before(&phi.as_instruction());
                    let mirror = b
                        .build_phi(
                            ctx.bool_type(),
                            &StringView::extend(&mut buf, "_activated_path"),
                        )
                        .unwrap();
                    b.position_before(
                        &mirror
                            .as_instruction()
                            .get_parent()
                            .unwrap()
                            .get_instructions()
                            .find(|instr| instr.get_opcode() != InstructionOpcode::Phi)
                            .unwrap(),
                    );
                    b.build_store(active, mirror.as_basic_value()).unwrap();

                    let target = &cache.full_graph[&ids[&phi.as_value_ref()]];
                    assert_eq!(target.len(), 1);
                    let target = target[0];
                    for (value, block) in phi.get_incomings() {
                        mirror.add_incoming(&[(
                            &ctx.bool_type().const_int(
                                (ids.get(&value.as_value_ref()) == Some(&target)).into(),
                                false,
                            ),
                            block,
                        )]);
                    }

                    active
                })
                .fold(
                    {
                        b.position_before(root);
                        gen_is_not_stack_address(&ctx, &b, rsp_fn, *root)
                    },
                    |and, active| {
                        b.position_before(root);
                        let activated = b
                            .build_load(
                                ctx.bool_type(),
                                active,
                                &StringView::extend(&mut buf2, "_activated"),
                            )
                            .unwrap();
                        b.build_store(active, ctx.bool_type().const_zero()).unwrap();
                        b.build_and(
                            and,
                            activated.into_int_value(),
                            &StringView::extend(&mut buf2, "_activated_reduce"),
                        )
                        .unwrap()
                    },
                );
            output_executions.push(activated);

            let value = ctx.const_string(buf[base_name_len - 8..].as_bytes(), false);
            let id = module.add_global(value.get_type(), None, &buf);
            id.set_initializer(&value);
            b.position_before(root);
            b.build_call(
                gen_incr_fn(
                    module,
                    incr_fn,
                    &StringView::extend(&mut buf, "_maybe"),
                    &[
                        id.as_pointer_value().into(),
                        #[allow(clippy::unreadable_literal)]
                        ctx.i64_type().const_int(223372036859619002, false).into(),
                        ctx.i32_type().const_int(1, false).into(),
                        ctx.i32_type().const_int(0, false).into(),
                    ],
                ),
                &[activated.into()],
                "call",
            )
            .unwrap();
        }
    }
}

fn gen_incr_fn<'ctx>(
    module: &Module<'ctx>,
    incr_fn: FunctionValue<'ctx>,
    name: &str,
    args: &[BasicMetadataValueEnum<'ctx>],
) -> FunctionValue<'ctx> {
    let ctx = module.get_context();
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
}

fn gen_is_not_stack_address<'ctx>(
    ctx: &ContextRef<'ctx>,
    b: &Builder<'ctx>,
    (get_rsp_fn, get_rsp): (FunctionType<'ctx>, PointerValue<'ctx>),
    instr: InstructionValue<'ctx>,
) -> IntValue<'ctx> {
    let pointer = instr
        .get_operand(match instr.get_opcode() {
            InstructionOpcode::Load => 0,
            InstructionOpcode::Store => 1,
            _ => unimplemented!(),
        })
        .unwrap()
        .unwrap_left()
        .into_pointer_value();

    let rsp = b
        .build_ptr_to_int(
            b.build_indirect_call(get_rsp_fn, get_rsp, &[], "auto_isa_get_rsp")
                .unwrap()
                .as_any_value_enum()
                .into_pointer_value(),
            ctx.i64_type(),
            "auto_isa_cast",
        )
        .unwrap();
    let red_zone = b
        .build_int_sub(
            rsp,
            ctx.i64_type().const_int(128, false),
            "auto_isa_red_zone",
        )
        .unwrap();
    let top = b
        .build_int_add(
            rsp,
            ctx.i64_type().const_int(256 * (1 << 10), false),
            "auto_isa_scratchpad_top",
        )
        .unwrap();

    let pointer = b
        .build_ptr_to_int(pointer, ctx.i64_type(), "auto_isa_cast")
        .unwrap();
    let floor = b
        .build_int_compare(
            IntPredicate::ULT,
            pointer,
            red_zone,
            "auto_isa_above_red_zone",
        )
        .unwrap();
    let ceil = b
        .build_int_compare(IntPredicate::UGT, pointer, top, "auto_isa_below_scratchpad")
        .unwrap();
    b.build_or(floor, ceil, "auto_isa_is_not_stack").unwrap()
}
