use std::{
    collections::{hash_map::Entry, HashMap, HashSet},
    ffi::CStr,
    hash::BuildHasher,
};

use either::Either;
use llvm_plugin::inkwell::{
    basic_block::BasicBlock,
    builder::Builder,
    context::ContextRef,
    llvm_sys::prelude::LLVMValueRef,
    module::Module,
    targets::TargetTriple,
    types::{AnyTypeEnum, BasicMetadataTypeEnum, BasicType, FunctionType},
    values::{
        AnyValue, AsValueRef, BasicValue, BasicValueEnum, FunctionValue, InstructionOpcode,
        InstructionValue,
    },
};

use crate::{
    analysis::{ComputeUnit, Idiom},
    utils::{InstructionId, Pool, StableEdge},
    State,
};

#[derive(Default)]
struct Cache<'ctx, S> {
    seen: HashSet<LLVMValueRef, S>,
    seen_params: HashSet<LLVMValueRef, S>,
    param_values: Vec<BasicValueEnum<'ctx>>,
    params: Vec<BasicMetadataTypeEnum<'ctx>>,
    param_indices: HashMap<LLVMValueRef, u32, S>,
    cloned_mapping: HashMap<LLVMValueRef, InstructionValue<'ctx>, S>,

    ivv_pool: Pool<Vec<InstructionId>>,
    full_graph: HashMap<InstructionId, Vec<InstructionId>, S>,
}

impl<'ctx, S> Cache<'ctx, S> {
    fn reset(&mut self) {
        let Self {
            seen,
            seen_params,
            param_values,
            params,
            param_indices,
            cloned_mapping,
            ivv_pool,
            full_graph,
        } = self;

        seen.clear();
        seen_params.clear();
        param_values.clear();
        params.clear();
        param_indices.clear();
        cloned_mapping.clear();

        for (_, v) in full_graph.drain() {
            ivv_pool.release(v);
        }
    }
}

#[allow(clippy::too_many_lines)]
pub fn extract_compute_units<'ctx, S: BuildHasher + Default>(
    State { ids, ids_index }: &State<'ctx, S>,
    idioms: &[Idiom<'ctx, S>],
    module: &Module<'ctx>,
) {
    let mut module_name = module.get_name().to_string_lossy().into_owned();
    module_name.truncate(module_name.rfind('.').unwrap_or(module_name.len()));
    module_name.push_str("-idioms");

    let ctx = module.get_context();
    let module = ctx.create_module(&module_name);
    module.set_triple(&TargetTriple::create("riscv64"));

    let mut id_buf = itoa::Buffer::new();
    let mut cache = Cache::default();

    for (
        id,
        &ComputeUnit {
            ref edges,
            root,
            memory_ops: _,
        },
    ) in idioms
        .iter()
        .enumerate()
        .filter_map(|(i, idiom)| idiom.0.first().map(|cu| (i, cu)))
    {
        cache.reset();

        for e in edges {
            let StableEdge(from, to) = e.to_stable(ids);
            match cache.full_graph.entry(from) {
                Entry::Occupied(mut e) => e.get_mut().push(to),
                Entry::Vacant(e) => {
                    let mut outgoing = cache.ivv_pool.pop().unwrap_or_default();
                    outgoing.push(to);
                    e.insert(outgoing);
                }
            }
        }

        extract_params(
            root,
            &cache.full_graph,
            ids,
            ids_index,
            &mut cache.seen,
            &mut cache.seen_params,
            &mut cache.param_values,
        );
        cache
            .param_values
            .iter()
            .map(|v| BasicMetadataTypeEnum::from(v.get_type()))
            .collect_into(&mut cache.params);
        cache
            .param_values
            .iter()
            .enumerate()
            .map(|(i, v)| (v.as_value_ref(), u32::try_from(i).unwrap()))
            .collect_into(&mut cache.param_indices);

        let return_value = |root: InstructionValue<'ctx>| {
            if root.get_opcode() == InstructionOpcode::Store {
                root.get_operand(0)
                    .unwrap()
                    .unwrap_left()
                    .as_any_value_enum()
            } else {
                root.as_any_value_enum()
            }
        };
        let new_func = module.add_function(
            id_buf.format(id),
            build_function(&ctx, return_value(root).get_type(), &cache.params),
            None,
        );
        for (param, v) in new_func.get_param_iter().zip(&cache.param_values) {
            if let Ok(name) = get_name(v).to_str() {
                param.set_name(name);
            }
        }

        let b = ctx.create_builder();
        b.position_at_end(ctx.append_basic_block(new_func, "bb"));

        {
            cache.seen.clear();
            let mut recursive = false;
            add_instructions(
                ids[&root.as_value_ref()],
                &cache.full_graph,
                &cache.param_indices,
                ids_index,
                &mut cache.seen,
                &mut cache.cloned_mapping,
                &mut recursive,
                &b,
                &new_func,
            );

            if recursive {
                // HACK: we don't know how to handle recursive idioms yet
                unsafe {
                    new_func.delete();
                }
                continue;
            }
        }

        for instr in new_func
            .get_basic_block_iter()
            .flat_map(BasicBlock::get_instructions)
        {
            for (i, operand) in instr.get_operands().enumerate() {
                if let Some(operand) = operand
                    .and_then(Either::left)
                    .and_then(|v| v.as_instruction_value())
                    .and_then(|instr| cache.cloned_mapping.get(&instr.as_value_ref()))
                {
                    instr.set_operand(
                        u32::try_from(i).unwrap(),
                        BasicValueEnum::try_from(operand.as_any_value_enum()).unwrap(),
                    );
                }
            }
        }

        b.build_return(
            BasicValueEnum::try_from(return_value(cache.cloned_mapping[&root.as_value_ref()]))
                .ok()
                .as_ref()
                .map(|v| v as &dyn BasicValue),
        )
        .unwrap();
    }

    module_name.push_str(".ll");
    module.print_to_file(&module_name).unwrap();
}

fn extract_params<'ctx, S: BuildHasher>(
    root: InstructionValue<'ctx>,
    full_graph: &HashMap<InstructionId, Vec<InstructionId>, S>,
    ids: &HashMap<LLVMValueRef, InstructionId, S>,
    ids_index: &[InstructionValue<'ctx>],
    seen: &mut HashSet<LLVMValueRef, S>,
    seen_params: &mut HashSet<LLVMValueRef, S>,
    params: &mut Vec<BasicValueEnum<'ctx>>,
) {
    if !seen.insert(root.as_value_ref()) {
        return;
    }

    if root.get_opcode() == InstructionOpcode::Phi {
        let next = &full_graph[&ids[&root.as_value_ref()]];
        assert_eq!(next.len(), 1);
        extract_params(
            ids_index[usize::try_from(next[0]).unwrap()],
            full_graph,
            ids,
            ids_index,
            seen,
            seen_params,
            params,
        );
    } else {
        let targets = full_graph
            .get(&ids[&root.as_value_ref()])
            .map_or([].as_slice(), |v| &**v);
        for value in root.get_operands().flatten().map(Either::unwrap_left) {
            if value.as_instruction_value().is_some()
                && targets.contains(&ids[&value.as_value_ref()])
            {
                extract_params(
                    value.as_instruction_value().unwrap(),
                    full_graph,
                    ids,
                    ids_index,
                    seen,
                    seen_params,
                    params,
                );
            } else if seen_params.insert(value.as_value_ref()) {
                params.push(value);
            }
        }
    }
}

#[allow(clippy::too_many_arguments)]
fn add_instructions<'ctx, S: BuildHasher>(
    root: InstructionId,
    full_graph: &HashMap<InstructionId, Vec<InstructionId>, S>,
    param_indices: &HashMap<LLVMValueRef, u32, S>,
    ids_index: &[InstructionValue<'ctx>],
    seen: &mut HashSet<LLVMValueRef, S>,
    cloned_mapping: &mut HashMap<LLVMValueRef, InstructionValue<'ctx>, S>,
    recursive: &mut bool,
    b: &Builder<'ctx>,
    f: &FunctionValue<'ctx>,
) {
    let iv = {
        let iv = ids_index[usize::try_from(root).unwrap()];
        if !seen.insert(iv.as_value_ref()) {
            if full_graph.contains_key(&root) {
                *recursive = true;
            }
            return;
        }

        #[allow(clippy::clone_on_copy)]
        let new = iv.clone();
        assert!(cloned_mapping.insert(iv.as_value_ref(), new).is_none());
        if let Some(name) = iv.get_name().and_then(|c| c.to_str().ok()) {
            new.set_name(name).unwrap();
        }
        new
    };

    for &root in full_graph.get(&root).map(|v| &**v).unwrap_or_default() {
        let instr = ids_index[usize::try_from(root).unwrap()];
        if instr.get_opcode() == InstructionOpcode::Phi {
            let mut next = root;
            loop {
                let next_v = &full_graph[&next];
                assert_eq!(next_v.len(), 1);
                next = next_v[0];

                if ids_index[usize::try_from(next).unwrap()].get_opcode() != InstructionOpcode::Phi
                {
                    break;
                }
            }
            add_instructions(
                next,
                full_graph,
                param_indices,
                ids_index,
                seen,
                cloned_mapping,
                recursive,
                b,
                f,
            );

            for (i, operand) in iv.get_operands().enumerate() {
                if operand
                    .and_then(Either::left)
                    .and_then(|op| op.as_instruction_value())
                    == Some(instr)
                {
                    iv.set_operand(
                        u32::try_from(i).unwrap(),
                        BasicValueEnum::try_from(
                            ids_index[usize::try_from(next).unwrap()].as_any_value_enum(),
                        )
                        .unwrap(),
                    );
                    break;
                }
            }
        } else {
            add_instructions(
                root,
                full_graph,
                param_indices,
                ids_index,
                seen,
                cloned_mapping,
                recursive,
                b,
                f,
            );
        }
    }

    for (i, operand) in iv.get_operands().enumerate() {
        if let Some(value) = operand.and_then(Either::left) {
            if let Some(&param_idx) = param_indices.get(&value.as_value_ref()) {
                let set = || {
                    iv.set_operand(
                        u32::try_from(i).unwrap(),
                        f.get_nth_param(param_idx).unwrap(),
                    );
                };

                if iv.get_opcode() == InstructionOpcode::GetElementPtr {
                    // HACK because we can't handle structs yet
                    if value.as_instruction_value().is_some() || i < 2 {
                        set();
                    }
                } else {
                    set();
                }
            }
        }
    }
    b.insert_instruction(&iv, iv.get_name().and_then(|c| c.to_str().ok()));
}

fn build_function<'ctx>(
    ctx: &ContextRef<'ctx>,
    t: AnyTypeEnum<'ctx>,
    params: &[BasicMetadataTypeEnum<'ctx>],
) -> FunctionType<'ctx> {
    match t {
        AnyTypeEnum::ArrayType(t) => t.fn_type(params, false),
        AnyTypeEnum::FloatType(t) => t.fn_type(params, false),
        AnyTypeEnum::IntType(t) => t.fn_type(params, false),
        AnyTypeEnum::PointerType(t) => t.fn_type(params, false),
        AnyTypeEnum::StructType(t) => t.fn_type(params, false),
        AnyTypeEnum::VectorType(t) => t.fn_type(params, false),
        AnyTypeEnum::VoidType(t) => t.fn_type(params, false),
        AnyTypeEnum::FunctionType(t) => t.get_return_type().map_or_else(
            || ctx.void_type().fn_type(params, false),
            |t| t.fn_type(params, false),
        ),
    }
}

// TODO remove once upstreamed
pub fn get_name<'a>(v: &'a BasicValueEnum) -> &'a CStr {
    match v {
        BasicValueEnum::ArrayValue(v) => v.get_name(),
        BasicValueEnum::IntValue(v) => v.get_name(),
        BasicValueEnum::FloatValue(v) => v.get_name(),
        BasicValueEnum::PointerValue(v) => v.get_name(),
        BasicValueEnum::StructValue(v) => v.get_name(),
        BasicValueEnum::VectorValue(v) => v.get_name(),
    }
}
