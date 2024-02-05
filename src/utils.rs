use std::{collections::HashMap, hash::BuildHasher};

use llvm_plugin::inkwell::{
    llvm_sys::prelude::LLVMValueRef,
    values::{AsValueRef, InstructionOpcode, InstructionValue},
};

pub const MEMORY_INSTRUCTIONS: &[InstructionOpcode] =
    &[InstructionOpcode::Store, InstructionOpcode::Load];

pub type InstructionId = u32;

#[derive(Hash, Eq, PartialEq, Debug)]
pub struct Edge<'ctx>(pub InstructionValue<'ctx>, pub InstructionValue<'ctx>);

impl Edge<'_> {
    pub fn to_stable<S: BuildHasher>(&self, ids: &HashMap<LLVMValueRef, u32, S>) -> StableEdge {
        let Self(a, b) = self;
        StableEdge(ids[&a.as_value_ref()], ids[&b.as_value_ref()])
    }

    pub fn to_opcodes(&self) -> (u8, u8) {
        let Self(a, b) = self;
        (a.get_opcode() as u8, b.get_opcode() as u8)
    }
}

#[derive(Copy, Clone, Hash, Eq, PartialEq, Debug)]
pub struct StableEdge(pub InstructionId, pub InstructionId);

impl StableEdge {
    pub fn to_edge<'ctx>(self, ids_index: &[InstructionValue<'ctx>]) -> Edge<'ctx> {
        let Self(a, b) = self;
        Edge(
            ids_index[usize::try_from(a).unwrap()],
            ids_index[usize::try_from(b).unwrap()],
        )
    }
}

pub struct VecPool<T>(Vec<Vec<T>>);

impl<T> VecPool<T> {
    pub fn pop(&mut self) -> Option<Vec<T>> {
        self.0.pop()
    }

    pub fn release(&mut self, mut v: Vec<T>) {
        if v.capacity() == 0 {
            return;
        }
        v.clear();
        self.0.push(v);
    }
}

impl<T> Default for VecPool<T> {
    fn default() -> Self {
        Self(Vec::new())
    }
}
