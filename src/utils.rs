use std::{
    collections::{hash_map::Entry, HashMap},
    hash::BuildHasher,
};

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
    pub fn to_stable<S: BuildHasher>(
        &self,
        ids: &HashMap<LLVMValueRef, InstructionId, S>,
    ) -> StableEdge {
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

pub struct Pool<T>(Vec<T>);

impl<T> Pool<T> {
    pub fn pop(&mut self) -> Option<T> {
        self.0.pop()
    }
}

impl<T> Pool<Vec<T>> {
    pub fn release(&mut self, mut v: Vec<T>) {
        if v.capacity() == 0 {
            return;
        }
        v.clear();
        self.0.push(v);
    }
}

impl<T> Default for Pool<T> {
    fn default() -> Self {
        Self(Vec::new())
    }
}

pub fn build_full_graph<S: BuildHasher>(
    edges: impl IntoIterator<Item = StableEdge>,
    g: &mut HashMap<InstructionId, Vec<InstructionId>, S>,
    ivv_pool: &mut Pool<Vec<InstructionId>>,
) {
    for StableEdge(from, to) in edges {
        match g.entry(from) {
            Entry::Occupied(mut e) => e.get_mut().push(to),
            Entry::Vacant(e) => {
                let mut outgoing = ivv_pool.pop().unwrap_or_default();
                outgoing.push(to);
                e.insert(outgoing);
            }
        }
    }
}
