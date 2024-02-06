use std::{
    collections::{hash_map::Entry, HashMap, HashSet},
    ffi::CStr,
    hash::BuildHasher,
};

use either::Either;
use llvm_plugin::inkwell::{
    builder::Builder,
    context::ContextRef,
    llvm_sys::prelude::LLVMValueRef,
    module::Module,
    types::{AnyTypeEnum, BasicMetadataTypeEnum, BasicType, FunctionType},
    values::{
        AnyValue, AsValueRef, BasicValue, BasicValueEnum, FunctionValue, InstructionOpcode,
        InstructionValue, PhiValue,
    },
};

use crate::{
    analysis::{ComputeUnit, Idiom},
    utils::{InstructionId, Pool, StableEdge, MEMORY_INSTRUCTIONS},
    State,
};

#[derive(Default)]
struct Cache<'ctx, S> {
    seen: HashSet<LLVMValueRef, S>,
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
            param_values,
            params,
            param_indices,
            cloned_mapping,
            ivv_pool,
            full_graph,
        } = self;

        seen.clear();
        param_values.clear();
        params.clear();
        param_indices.clear();
        cloned_mapping.clear();

        for (_, v) in full_graph.drain() {
            ivv_pool.release(v);
        }
    }
}

pub fn extract_compute_units<'ctx, S: BuildHasher + Default>(
    State { ids, ids_index }: &State<'ctx, S>,
    idioms: &[Idiom<'ctx, S>],
    module: &Module<'ctx>,
) {
    let ctx = module.get_context();
    let module = ctx.create_module("idioms");

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

        let bb = ctx.append_basic_block(new_func, "bb");
        let b = ctx.create_builder();
        b.position_at_end(bb);

        cache.seen.clear();
        add_instructions(
            ids[&root.as_value_ref()],
            &cache.full_graph,
            &cache.param_indices,
            ids_index,
            &mut cache.seen,
            &mut cache.cloned_mapping,
            &b,
            &new_func,
        );

        for instr in new_func
            .get_basic_block_iter()
            .flat_map(|bb| bb.get_instructions())
        {
            for (i, operand) in instr.get_operands().enumerate() {
                if let Some(operand) = operand
                    .and_then(|op| op.left())
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

    module.print_to_file("idioms.ll").unwrap();
}

fn extract_params<'ctx, S: BuildHasher>(
    root: InstructionValue<'ctx>,
    full_graph: &HashMap<InstructionId, Vec<InstructionId>, S>,
    ids: &HashMap<LLVMValueRef, u32, S>,
    ids_index: &[InstructionValue<'ctx>],
    seen: &mut HashSet<LLVMValueRef, S>,
    params: &mut Vec<BasicValueEnum<'ctx>>,
) {
    if !seen.insert(root.as_value_ref()) {
        return;
    }

    if PhiValue::try_from(root).is_ok() {
        let next = &full_graph[&ids[&root.as_value_ref()]];
        assert_eq!(next.len(), 1);
        extract_params(
            ids_index[usize::try_from(next[0]).unwrap()],
            full_graph,
            ids,
            ids_index,
            seen,
            params,
        );
    } else {
        for root in root.get_operands().flatten().map(Either::unwrap_left) {
            if let Some(root) = root.as_instruction_value() {
                if MEMORY_INSTRUCTIONS.contains(&root.get_opcode()) {
                    for root in root.get_operands().flatten().map(Either::unwrap_left) {
                        if seen.insert(root.as_value_ref()) {
                            params.push(root);
                        }
                    }
                    continue;
                } else if full_graph.contains_key(&ids[&root.as_value_ref()]) {
                    extract_params(root, full_graph, ids, ids_index, seen, params);
                    continue;
                }
            }
            if seen.insert(root.as_value_ref()) {
                params.push(root);
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
    b: &Builder<'ctx>,
    f: &FunctionValue<'ctx>,
) {
    let iv = {
        let iv = ids_index[usize::try_from(root).unwrap()];
        if !seen.insert(iv.as_value_ref()) {
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
        if PhiValue::try_from(instr).is_ok() {
            let next = &full_graph[&root];
            assert_eq!(next.len(), 1);
            add_instructions(
                next[0],
                full_graph,
                param_indices,
                ids_index,
                seen,
                cloned_mapping,
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
                            ids_index[usize::try_from(next[0]).unwrap()].as_any_value_enum(),
                        )
                        .unwrap(),
                    );
                    break;
                }
            }
        } else {
            for (i, operand) in iv.get_operands().enumerate() {
                if let Some(value) = operand.and_then(Either::left) {
                    if let Some(&param_idx) = param_indices.get(&value.as_value_ref()) {
                        iv.set_operand(
                            u32::try_from(i).unwrap(),
                            f.get_nth_param(param_idx).unwrap(),
                        );
                    }
                }
            }

            add_instructions(
                root,
                full_graph,
                param_indices,
                ids_index,
                seen,
                cloned_mapping,
                b,
                f,
            );
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
