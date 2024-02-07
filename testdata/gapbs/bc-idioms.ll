; ModuleID = 'bc-idioms'
source_filename = "bc-idioms"
target triple = "riscv64"

%"class.std::vector.26" = type { %"struct.std::_Vector_base.27" }
%"struct.std::_Vector_base.27" = type { %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl" }
%"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl" = type { %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data" }
%"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data" = type { ptr, ptr, ptr }
%struct.EdgePair = type { i32, i32 }
%"struct.std::pair.18" = type { float, i32 }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char>::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char>::_Alloc_hider" = type { ptr }
%union.anon = type { i64, [8 x i8] }
%"struct.std::pair" = type { i32, float }
%"class.std::basic_ios" = type { %"class.std::ios_base", ptr, i8, i8, ptr, ptr, ptr, ptr }
%"class.std::ios_base" = type { ptr, i64, i64, i32, i32, i32, ptr, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, ptr, %"class.std::locale" }
%"struct.std::ios_base::_Words" = type { ptr, i64 }
%"class.std::locale" = type { ptr }
%"class.std::mersenne_twister_engine" = type { [312 x i64], i64 }

define ptr @"1"(ptr %cond.i31.i.i491, ptr %_M_finish.i468, ptr %add.ptr.i467, i64 %0, i64 %1, ptr %verts_at_depth.sroa.0.5, ptr %arrayidx.i466, i64 %2, i32 %3) {
bb:
  %4 = load i32, ptr %arrayidx.i466, align 4, !tbaa !0
  %conv98 = sext i32 %4 to i64
  %add.ptr.i4672 = getelementptr inbounds %"class.std::vector.26", ptr %verts_at_depth.sroa.0.5, i64 %conv98
  %_M_finish.i4684 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i467, i64 %2, i32 1
  %5 = load ptr, ptr %_M_finish.i468, align 8, !tbaa !4
  %sub.ptr.lhs.cast.i.i.i.i475 = ptrtoint ptr %5 to i64
  %6 = load ptr, ptr %add.ptr.i467, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i.i.i476 = ptrtoint ptr %6 to i64
  %sub.ptr.sub.i.i.i.i477 = sub i64 %sub.ptr.lhs.cast.i.i.i.i475, %sub.ptr.rhs.cast.i.i.i.i476
  %sub.ptr.div.i.i.i.i480 = ashr exact i64 %sub.ptr.sub.i.i.i.i477, %0
  %add.ptr.i.i492 = getelementptr inbounds i32, ptr %cond.i31.i.i491, i64 %sub.ptr.div.i.i.i.i480
  %incdec.ptr.i.i495 = getelementptr inbounds i32, ptr %add.ptr.i.i492, i64 %1
  store ptr %incdec.ptr.i.i495, ptr %_M_finish.i468, align 8, !tbaa !6
  ret ptr %incdec.ptr.i.i495
}

define float @"2"(i1 %cmp.i.i.i, ptr %incdec.ptr14.i.i, float %0, ptr %scores, i64 %1) {
bb:
  %2 = load ptr, ptr %scores, align 8, !tbaa !8
  %incdec.ptr11.i.i = getelementptr inbounds float, ptr %2, i64 %1
  %3 = load float, ptr %incdec.ptr14.i.i, align 4, !tbaa !10
  %4 = select i1 %cmp.i.i.i, float %3, float %0
  %cmp.i.i.i2 = fcmp olt float %4, %3
  %spec.select.i.i = select i1 %cmp.i.i.i, ptr %incdec.ptr11.i.i, ptr %2
  %5 = load float, ptr %spec.select.i.i, align 4, !tbaa !10
  ret float %5
}

define i64 @"3"(ptr %arrayidx.i59, ptr %agg.result, ptr %end_size_.i, ptr %degrees, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i59, align 8, !tbaa !12
  %2 = load ptr, ptr %agg.result, align 8, !tbaa !14
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i61 = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %degrees, align 8, !tbaa !18
  %sub.ptr.rhs.cast.i62 = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i63 = sub i64 %sub.ptr.lhs.cast.i61, %sub.ptr.rhs.cast.i62
  %sub.ptr.div.i64 = ashr exact i64 %sub.ptr.sub.i63, %0
  %arrayidx.i65 = getelementptr inbounds i64, ptr %2, i64 %sub.ptr.div.i64
  store i64 %1, ptr %arrayidx.i65, align 8, !tbaa !12
  ret i64 %1
}

define <2 x i32> @"4"(ptr %degrees, ptr %.omp.lb, i64 %0, i64 %index) {
bb:
  %1 = load ptr, ptr %degrees, align 8, !tbaa !18
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %mul12 = shl i64 %2, %0
  %offset.idx = add i64 %mul12, %index
  %3 = getelementptr inbounds i32, ptr %1, i64 %offset.idx
  %wide.load = load <2 x i32>, ptr %3, align 4, !tbaa !0
  ret <2 x i32> %wide.load
}

define <4 x i32> @"5"(<4 x i32> %0, ptr %init_val, i64 %1, ptr %this, ptr %.omp.lb, i64 %index, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %offset.idx = add i64 %3, %index
  %4 = load ptr, ptr %this, align 8, !tbaa !18
  %5 = getelementptr inbounds i32, ptr %4, i64 %offset.idx
  %6 = getelementptr inbounds i32, ptr %5, i64 %2
  %7 = load i32, ptr %init_val, align 4, !tbaa !0, !alias.scope !19
  %broadcast.splatinsert21 = insertelement <4 x i32> %0, i32 %7, i64 %1
  %broadcast.splat22 = shufflevector <4 x i32> %broadcast.splatinsert21, <4 x i32> %0, <4 x i32> zeroinitializer
  store <4 x i32> %broadcast.splat22, ptr %6, align 4, !tbaa !0, !alias.scope !22, !noalias !19
  ret <4 x i32> %broadcast.splat22
}

define float @"6"(ptr %arrayidx.i, ptr %biggest_score, ptr %scores, ptr %.omp.lb) {
bb:
  %0 = load float, ptr %arrayidx.i, align 4, !tbaa !10
  %1 = load float, ptr %biggest_score, align 4, !tbaa !10
  %div9 = fdiv float %0, %1
  %2 = load ptr, ptr %scores, align 8, !tbaa !8
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %4 = sext i32 %3 to i64
  %arrayidx.i2 = getelementptr inbounds float, ptr %2, i64 %4
  store float %div9, ptr %arrayidx.i, align 4, !tbaa !10
  ret float %div9
}

define ptr @"7"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, ptr %.omp.lb, i64 %1) {
bb:
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %3 = sext i32 %2 to i64
  %4 = add nsw i64 %3, %1
  %5 = load ptr, ptr %in_index_.i, align 8
  %6 = load ptr, ptr %out_index_.i, align 8
  %7 = load i8, ptr %transpose, align 1, !tbaa !24, !range !26, !noundef !27
  %tobool.not = icmp eq i8 %7, %0
  %.sink = select i1 %tobool.not, ptr %6, ptr %5
  %arrayidx.i.i.i60 = getelementptr inbounds ptr, ptr %.sink, i64 %4
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !4
  ret ptr %n_end.0
}

define i8 @"8"(ptr %arrayidx17.i.i, ptr %agg.tmp11, ptr %num_iters_, i32 %0) {
bb:
  %1 = load i32, ptr %num_iters_, align 4, !tbaa !28
  %__val.lobit.i = lshr i32 %1, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %2 = load ptr, ptr %agg.tmp11, align 8, !tbaa !38, !alias.scope !39
  %arrayidx.i.i = getelementptr inbounds i8, ptr %2, i64 %conv5.i
  %3 = load i8, ptr %arrayidx17.i.i, align 2, !tbaa !42, !noalias !39
  store i8 %3, ptr %arrayidx.i.i, align 1, !tbaa !42
  ret i8 %3
}

define i32 @"9"(ptr %diffs, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %1 = sext i32 %0 to i64
  %2 = load ptr, ptr %diffs, align 8, !tbaa !18
  %arrayidx.i44 = getelementptr inbounds i32, ptr %2, i64 %1
  %3 = load i32, ptr %arrayidx.i44, align 4, !tbaa !0
  ret i32 %3
}

define i32 @"10"(ptr %init_val, ptr %this, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %this, align 8, !tbaa !18
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %add.ptr.prol = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %init_val, align 4, !tbaa !0
  store i32 %2, ptr %add.ptr.prol, align 4, !tbaa !0
  ret i32 %2
}

define float @"11"(ptr %scores, ptr %num_nodes_.i, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %scores, align 8, !tbaa !8
  %4 = load i64, ptr %num_nodes_.i, align 8, !tbaa !43
  %5 = and i64 %4, %0
  %n.mod.vf = and i64 %4, %1
  %n.vec = sub nsw i64 %5, %n.mod.vf
  %indvars.iv.next = add nuw nsw i64 %n.vec, %2
  %arrayidx.i.1 = getelementptr inbounds float, ptr %3, i64 %indvars.iv.next
  %6 = load float, ptr %arrayidx.i.1, align 4, !tbaa !10
  ret float %6
}

define ptr @"12"(ptr %el, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1) {
bb:
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !47
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !45
  ret ptr %add.ptr.i464
}

define <4 x float> @"13"(ptr %scores, i64 %index, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %1 = sext i32 %0 to i64
  %offset.idx = add i64 %index, %1
  %2 = load ptr, ptr %scores, align 8, !tbaa !8
  %3 = getelementptr inbounds float, ptr %2, i64 %offset.idx
  %wide.load = load <4 x float>, ptr %3, align 4, !tbaa !10, !alias.scope !48, !noalias !51
  ret <4 x float> %wide.load
}

define i32 @"14"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, ptr %v.i.i.i.i.i.i, ptr %v3.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %v.i.i.i.i.i.i, align 4
  %3 = load i32, ptr %v3.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i = icmp slt i32 %2, %3
  %4 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !53
  %5 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !53
  %cmp7.i.i.i.i.i.i = icmp slt i32 %5, %4
  %cmp.i.i.i.i.i.i = icmp eq i32 %5, %4
  %cond.i.i.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i1 %cmp4.i.i.i.i.i.i, i1 %cmp7.i.i.i.i.i.i
  %spec.select.i.i.i.i = select i1 %cond.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %__parent.020.in.i.i.i.i.i = add nsw i64 %sub12.i.i.i.i, %1
  %__parent.020.i.i56.i.i.i = lshr i64 %__parent.020.in.i.i.i.i.i, %0
  %add.ptr.i.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %__parent.020.i.i56.i.i.i
  %6 = load i32, ptr %add.ptr.i.i.i.i.i, align 4, !tbaa !53
  ret i32 %6
}

define i64 @"15"(ptr %queue, ptr %shared_out_end.i, ptr %shared_out_start.i, i64 %0, i64 %1, ptr %.omp.ub) {
bb:
  %2 = load i64, ptr %shared_out_start.i, align 8, !tbaa !55
  %3 = load ptr, ptr %queue, align 8, !tbaa !57
  %add.ptr.i = getelementptr inbounds i32, ptr %3, i64 %2
  %sub.ptr.rhs.cast = ptrtoint ptr %add.ptr.i to i64
  %4 = load i64, ptr %shared_out_end.i, align 8, !tbaa !58
  %add.ptr.i91 = getelementptr inbounds i32, ptr %3, i64 %4
  %sub.ptr.lhs.cast = ptrtoint ptr %add.ptr.i91 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %sub = add nsw i64 %sub.ptr.div, %1
  store i64 %sub, ptr %.omp.ub, align 8, !tbaa !12
  ret i64 %sub
}

define float @"17"(ptr %arrayidx.i.prol, float %0, ptr %biggest_score4) {
bb:
  %1 = load float, ptr %arrayidx.i.prol, align 4
  %cmp.i.prol = fcmp ogt float %1, %0
  %2 = select i1 %cmp.i.prol, float %1, float %0
  store float %2, ptr %biggest_score4, align 4, !tbaa !10
  ret float %2
}

define i64 @"18"(ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %__i.018.i, ptr %arrayidx7.i) {
bb:
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %add10 = add i64 %5, %0
  %rem.i.i.i = and i64 %add10, %1
  %shr.i = lshr i64 %rem.i.i.i, %2
  %xor.i = xor i64 %shr.i, %3
  %mul.i = mul nuw nsw i64 %xor.i, %4
  %add.i = add nuw i64 %mul.i, %__i.018.i
  %rem.i.i17.i = and i64 %add.i, %1
  store i64 %rem.i.i17.i, ptr %arrayidx7.i, align 8, !tbaa !12
  ret i64 %rem.i.i17.i
}

define ptr @"19"(ptr %queue, ptr %shared_out_start.i, ptr %cond.i31.i.i.i, ptr %_M_finish.i.i, ptr %depth_index, i64 %0) {
bb:
  %1 = load i64, ptr %shared_out_start.i, align 8, !tbaa !55
  %2 = load ptr, ptr %queue, align 8, !tbaa !57
  %add.ptr.i = getelementptr inbounds i32, ptr %2, i64 %1
  %3 = load ptr, ptr %depth_index, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i.i.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !4
  %sub.ptr.lhs.cast.i.i.i.i.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, %0
  %add.ptr.i.i.i = getelementptr inbounds ptr, ptr %cond.i31.i.i.i, i64 %sub.ptr.div.i.i.i.i.i
  store ptr %add.ptr.i, ptr %add.ptr.i.i.i, align 8, !tbaa !4
  ret ptr %add.ptr.i
}

define ptr @"20"(ptr %_M_finish.i468, i64 %0, ptr %verts_at_depth.sroa.0.5, ptr %arrayidx.i466, i64 %1, i32 %2) {
bb:
  %3 = load i32, ptr %arrayidx.i466, align 4, !tbaa !0
  %conv98 = sext i32 %3 to i64
  %add.ptr.i467 = getelementptr inbounds %"class.std::vector.26", ptr %verts_at_depth.sroa.0.5, i64 %conv98
  %_M_finish.i4682 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i467, i64 %1, i32 1
  %4 = load ptr, ptr %_M_finish.i468, align 8, !tbaa !4
  %incdec.ptr.i472 = getelementptr inbounds i32, ptr %4, i64 %0
  store ptr %incdec.ptr.i472, ptr %_M_finish.i468, align 8, !tbaa !6
  ret ptr %incdec.ptr.i472
}

define float @"21"(ptr %arrayidx.i.prol, ptr %biggest_score, ptr %scores, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %1 = sext i32 %0 to i64
  %2 = load ptr, ptr %scores, align 8, !tbaa !8
  %arrayidx.i.prol2 = getelementptr inbounds float, ptr %2, i64 %1
  %3 = load float, ptr %arrayidx.i.prol, align 4, !tbaa !10
  %4 = load float, ptr %biggest_score, align 4, !tbaa !10
  %div9.prol = fdiv float %3, %4
  store float %div9.prol, ptr %arrayidx.i.prol, align 4, !tbaa !10
  ret float %div9.prol
}

define i32 @"22"(ptr %add.ptr.i.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0) {
bb:
  %1 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !0
  %2 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !0
  %cmp.i.i.i.i.i = icmp slt i32 %2, %1
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %add.ptr2.i.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %sub12.i.i.i.i
  %3 = load i32, ptr %add.ptr.i.i.i.i.i, align 4, !tbaa !0
  store i32 %3, ptr %add.ptr2.i.i.i.i.i, align 4, !tbaa !0
  ret i32 %3
}

define i32 @"23"(ptr %n_start.0.in, i64 %0, ptr %diffs, ptr %.omp.lb) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i89 = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.lhs.cast = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast.i.i89
  %1 = lshr exact i64 %sub.ptr.sub, %0
  %conv22 = trunc i64 %1 to i32
  %2 = load ptr, ptr %diffs, align 8, !tbaa !18
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %4 = sext i32 %3 to i64
  %arrayidx.i99 = getelementptr inbounds i32, ptr %2, i64 %4
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !0
  ret i32 %conv22
}

define i64 @"24"(ptr %0, ptr %_M_finish.i38, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5) {
bb:
  %6 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !59
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %6, i64 %1
  %7 = ptrtoint ptr %incdec.ptr.i.i to i64
  %8 = add i64 %7, %2
  %9 = sub i64 %8, %3
  %10 = lshr i64 %9, %4
  %11 = add nuw nsw i64 %10, %1
  %n.vec = and i64 %11, %5
  %12 = shl i64 %n.vec, %4
  %ind.end64 = getelementptr i8, ptr %0, i64 %12
  %13 = load i64, ptr %ind.end64, align 4, !alias.scope !61, !noalias !64
  ret i64 %13
}

define i32 @"25"(ptr %arrayidx.i7.i.i) {
bb:
  %0 = load ptr, ptr %arrayidx.i7.i.i, align 8, !tbaa !4, !llvm.access.group !66
  %1 = load i32, ptr %0, align 4, !tbaa !0, !llvm.access.group !66
  ret i32 %1
}

define float @"26"(ptr %scores, i32 %cond, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %scores, align 8, !tbaa !8
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %5 = sub i32 %cond, %4
  %6 = zext i32 %5 to i64
  %7 = add nuw nsw i64 %6, %0
  %n.vec = and i64 %7, %1
  %ind.end = add nsw i64 %n.vec, %2
  %arrayidx.i = getelementptr inbounds float, ptr %3, i64 %ind.end
  %8 = load float, ptr %arrayidx.i, align 4, !tbaa !10
  ret float %8
}

define i64 @"27"(ptr %__begin0.sroa.0.059, i64 %0, ptr %.sroa_idx, ptr %_M_finish.i38, i64 %1) {
bb:
  %2 = load i32, ptr %__begin0.sroa.0.059, align 4
  %retval.sroa.2.0.insert.ext.i = zext i32 %2 to i64
  %retval.sroa.2.0.insert.shift.i = shl nuw i64 %retval.sroa.2.0.insert.ext.i, %0
  %3 = load i32, ptr %.sroa_idx, align 4
  %retval.sroa.0.0.insert.ext.i = zext i32 %3 to i64
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i
  %4 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !59
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %4, i64 %1
  store i64 %retval.sroa.0.0.insert.insert.i, ptr %incdec.ptr.i.i, align 4
  ret i64 %retval.sroa.0.0.insert.insert.i
}

define i32 @"28"(ptr %__first.addr.033.i.i, ptr %n_start.0.in) {
bb:
  %0 = load i32, ptr %__first.addr.033.i.i, align 4, !tbaa !0
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  store i32 %0, ptr %n_start.0, align 4, !tbaa !0
  ret i32 %0
}

define i32 @"29"(ptr %degrees, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %degrees, align 8, !tbaa !18
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %mul14 = shl i64 %2, %0
  %arrayidx.i36 = getelementptr inbounds i32, ptr %1, i64 %mul14
  %3 = load i32, ptr %arrayidx.i36, align 4, !tbaa !0
  ret i32 %3
}

define i32 @"30"(ptr %el, i64 %0, i64 %1, i32 %2) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %incdec.ptr122.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %v3.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr122.i.i, i64 %1, i32 1
  %3 = load i32, ptr %v3.i.i.i.i, align 4
  ret i32 %3
}

define i64 @"31"(ptr %offsets, ptr %num_nodes_.i, i32 %0, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !67
  %3 = trunc i64 %2 to i32
  %n184.0657 = add i32 %3, %0
  %4 = zext i32 %n184.0657 to i64
  %sext = shl i64 %4, %1
  %conv202 = ashr exact i64 %sext, %1
  %5 = load ptr, ptr %offsets, align 8, !tbaa !14
  %arrayidx.i542 = getelementptr inbounds i64, ptr %5, i64 %conv202
  %6 = load i64, ptr %arrayidx.i542, align 8, !tbaa !12
  ret i64 %6
}

define i32 @"32"(ptr %num_nodes_.i, i64 %0, i64 %1, ptr %add.ptr.i) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !43
  %3 = and i64 %2, %0
  %n.mod.vf = and i64 %2, %1
  %n.vec = sub nsw i64 %3, %n.mod.vf
  %4 = trunc i64 %n.vec to i32
  store i32 %4, ptr %add.ptr.i, align 4, !tbaa !69
  ret i32 %4
}

define i32 @"33"(ptr %init_val, ptr %this, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %init_val, align 4, !tbaa !0
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %2 = load ptr, ptr %this, align 8, !tbaa !18
  %add.ptr = getelementptr inbounds i32, ptr %2, i64 %1
  store i32 %0, ptr %add.ptr, align 4, !tbaa !0
  ret i32 %0
}

define ptr @"34"(ptr %new_range.i.i, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %0) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !45
  ret ptr %add.ptr.i
}

define i32 @"35"(ptr %depths, ptr %__begin3.0814) {
bb:
  %0 = load ptr, ptr %depths, align 8, !tbaa !18
  %1 = load i32, ptr %__begin3.0814, align 4, !tbaa !0
  %conv34 = sext i32 %1 to i64
  %arrayidx.i398 = getelementptr inbounds i32, ptr %0, i64 %conv34
  %2 = load i32, ptr %arrayidx.i398, align 4, !tbaa !0
  ret i32 %2
}

define ptr @"36"(ptr %new_range.i.i457, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !4
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !47
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !71
  ret ptr %add.ptr6.i.i478
}

define i32 @"37"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %2 = load ptr, ptr %el, align 8, !tbaa !47
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %1
  %add.ptr.sroa_idx.prol = getelementptr inbounds i8, ptr %add.ptr.prol, i64 %0
  %3 = load i32, ptr %add.ptr.sroa_idx.prol, align 4
  ret i32 %3
}

define i32 @"38"(ptr %add.ptr3.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr3.i.i.i.i, align 4, !tbaa !0
  %1 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !0
  %2 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !0
  %cmp.i.i.i.i.i = icmp slt i32 %2, %1
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add.ptr4.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i.i.i.i
  store i32 %0, ptr %add.ptr4.i.i.i.i, align 4, !tbaa !0
  ret i32 %0
}

define float @"39"(float %delta_u.0.lcssa, ptr %arrayidx.i64, ptr %scores, ptr %add.ptr) {
bb:
  %0 = load i32, ptr %add.ptr, align 4, !tbaa !0, !llvm.access.group !72
  %idxprom.i6.i.i = sext i32 %0 to i64
  %1 = load ptr, ptr %scores, align 8, !tbaa !8, !llvm.access.group !72
  %arrayidx.i642 = getelementptr inbounds float, ptr %1, i64 %idxprom.i6.i.i
  %2 = load float, ptr %arrayidx.i64, align 4, !tbaa !10, !llvm.access.group !72
  %add38 = fadd float %delta_u.0.lcssa, %2
  store float %add38, ptr %arrayidx.i64, align 4, !tbaa !10, !llvm.access.group !72
  ret float %add38
}

define i64 @"40"(ptr %_M_string_length.i.i.i.i, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %_M_string_length.i24.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i, i32 1
  %3 = load i64, ptr %_M_string_length.i.i.i.i, align 8, !tbaa !73
  store i64 %3, ptr %_M_string_length.i24.i.i.i, align 8, !tbaa !73
  ret i64 %3
}

define i64 @"41"(ptr %arrayidx23.i.i, i64 %0, ptr %1, i64 %2, i64 %3, ptr %arrayidx28.i.i, i64 %4, i64 %5, ptr %udist_, i64 %6) {
bb:
  %7 = load ptr, ptr %udist_, align 8, !tbaa !74
  %arrayidx19.i.i = getelementptr inbounds [312 x i64], ptr %7, i64 %4, i64 310
  %8 = load i64, ptr %arrayidx23.i.i, align 8, !tbaa !12
  %and31.i.i = and i64 %8, %2
  %tobool32.not.i.i = icmp eq i64 %and31.i.i, %4
  %cond33.i.i = select i1 %tobool32.not.i.i, i64 %4, i64 %5
  %and24.i.i = and i64 %8, %0
  %wide.load = load <2 x i64>, ptr %1, align 8, !tbaa !12
  %vector.recur.extract = extractelement <2 x i64> %wide.load, i64 %2
  %and20.i.i = and i64 %vector.recur.extract, %3
  %or25.i.i = or i64 %and24.i.i, %and20.i.i
  %shr29.i.i = lshr exact i64 %or25.i.i, %2
  %9 = load i64, ptr %arrayidx28.i.i, align 8, !tbaa !12
  %xor30.i.i = xor i64 %shr29.i.i, %9
  %xor34.i.i = xor i64 %xor30.i.i, %cond33.i.i
  store i64 %xor34.i.i, ptr %arrayidx19.i.i, align 8, !tbaa !12
  ret i64 %xor34.i.i
}

define i32 @"42"(ptr %num_nodes, i64 %0, ptr %length.i) {
bb:
  %1 = load i64, ptr %num_nodes, align 8, !tbaa !12
  %add = add nsw i64 %1, %0
  %conv.i = trunc i64 %add to i32
  store i32 %conv.i, ptr %length.i, align 4, !tbaa !0
  ret i32 %conv.i
}

define float @"43"(ptr %arrayidx.i547, ptr %arrayidx.i548, ptr %scores, ptr %__begin3122.sroa.0.0831) {
bb:
  %0 = load float, ptr %arrayidx.i548, align 4, !tbaa !10
  %1 = load float, ptr %arrayidx.i547, align 4, !tbaa !10
  %add172 = fadd float %1, %0
  %2 = load ptr, ptr %scores, align 8
  %3 = load i32, ptr %__begin3122.sroa.0.0831, align 4, !tbaa !0
  %idxprom.i6.i.i532 = sext i32 %3 to i64
  %arrayidx.i5482 = getelementptr inbounds float, ptr %2, i64 %idxprom.i6.i.i532
  store float %add172, ptr %arrayidx.i548, align 4, !tbaa !10
  ret float %add172
}

define i64 @"44"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %end_size_.i.i) {
bb:
  %.pre.pre.i = load ptr, ptr %end_size_.i.i, align 8, !tbaa !45
  %2 = load i32, ptr %v, align 4, !tbaa !76
  %sub = add nsw i32 %2, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %.pre.pre.i, align 4, !tbaa.struct !78
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i64 @"45"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !79
  %inc.i71 = add nuw nsw i64 %1, %0
  %inc.i64 = add nuw nsw i64 %inc.i71, %0
  store i64 %inc.i64, ptr %_M_p.i.i.i, align 8, !tbaa !79
  ret i64 %inc.i64
}

define ptr @"46"(ptr %queue, ptr %shared_out_start.i, ptr %_M_finish.i.i) {
bb:
  %0 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !4
  %1 = load ptr, ptr %queue, align 8, !tbaa !57
  %2 = load i64, ptr %shared_out_start.i, align 8, !tbaa !55
  %add.ptr.i = getelementptr inbounds i32, ptr %1, i64 %2
  store ptr %add.ptr.i, ptr %0, align 8, !tbaa !4
  ret ptr %add.ptr.i
}

define i32 @"47"(ptr %end_size_.i, ptr %offsets, i64 %0, ptr %length.i136) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !14
  %sub.ptr.rhs.cast.i.i140 = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !81
  %sub.ptr.lhs.cast.i.i139 = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i141 = sub i64 %sub.ptr.lhs.cast.i.i139, %sub.ptr.rhs.cast.i.i140
  %3 = lshr exact i64 %sub.ptr.sub.i.i141, %0
  %conv.i142 = trunc i64 %3 to i32
  store i32 %conv.i142, ptr %length.i136, align 4, !tbaa !0
  ret i32 %conv.i142
}

define float @"48"(ptr %arrayidx.i, ptr %call5.i.i.i.i4.i.i79, ptr %num_nodes_.i, i64 %0, i64 %1, i32 %2) {
bb:
  %3 = load float, ptr %arrayidx.i, align 4, !tbaa !10
  %4 = load i64, ptr %num_nodes_.i, align 8, !tbaa !43
  %5 = and i64 %4, %0
  %n.mod.vf = and i64 %4, %1
  %n.vec = sub nsw i64 %5, %n.mod.vf
  %second3.i = getelementptr inbounds %"struct.std::pair", ptr %call5.i.i.i.i4.i.i79, i64 %n.vec, i32 1
  store float %3, ptr %second3.i, align 4, !tbaa !82
  ret float %3
}

define i32 @"49"(ptr %num_nodes_.i, i64 %0, i64 %1, ptr %add.ptr.i.prol) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !43
  %3 = and i64 %2, %0
  %n.mod.vf = and i64 %2, %1
  %n.vec = sub nsw i64 %3, %n.mod.vf
  %4 = trunc i64 %n.vec to i32
  store i32 %4, ptr %add.ptr.i.prol, align 4, !tbaa !69
  ret i32 %4
}

define i32 @"50"(ptr %depths, ptr %__begin3.0814) {
bb:
  %0 = load ptr, ptr %depths, align 8, !tbaa !18
  %1 = load i32, ptr %__begin3.0814, align 4, !tbaa !0
  %conv34 = sext i32 %1 to i64
  %arrayidx.i439 = getelementptr inbounds i32, ptr %0, i64 %conv34
  %2 = load i32, ptr %arrayidx.i439, align 4, !tbaa !0
  ret i32 %2
}

define ptr @"51"(ptr %out_index.i, ptr %num_nodes_.i) {
bb:
  %0 = load ptr, ptr %out_index.i, align 8, !tbaa !4, !noalias !83
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !43, !noalias !83
  %arrayidx.i.i = getelementptr inbounds ptr, ptr %0, i64 %1
  %2 = load ptr, ptr %arrayidx.i.i, align 8, !tbaa !4, !noalias !83
  ret ptr %2
}

define i32 @"52"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %3 = sub i64 %0, %2
  %n.vec = and i64 %3, %1
  %ind.end = add i64 %2, %n.vec
  %4 = load ptr, ptr %el, align 8, !tbaa !47
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %4, i64 %ind.end
  %5 = load i32, ptr %add.ptr.prol, align 4
  ret i32 %5
}

define i32 @"53"(ptr %call171, ptr %arrayidx.i548, ptr %arrayidx.i549) {
bb:
  %0 = load i32, ptr %arrayidx.i549, align 4, !tbaa !0
  %idx.ext = sext i32 %0 to i64
  %1 = load i64, ptr %arrayidx.i548, align 8, !tbaa !12
  %add.ptr263 = getelementptr inbounds i32, ptr %call171, i64 %1
  %add.ptr266 = getelementptr inbounds i32, ptr %add.ptr263, i64 %idx.ext
  %2 = load i32, ptr %add.ptr266, align 4, !tbaa !0
  ret i32 %2
}

define i64 @"54"(ptr %arrayidx.i58, ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, i64 %add7, ptr %arrayidx.i57.1) {
bb:
  %0 = load i64, ptr %arrayidx.i58, align 8, !tbaa !12
  %1 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !12
  %add7.1 = add nsw i64 %1, %add7
  %2 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !12
  %add7.2 = add nsw i64 %2, %add7.1
  %3 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !12
  %add7.3 = add nsw i64 %3, %add7.2
  %add72 = add nsw i64 %0, %add7.3
  store i64 %add7, ptr %arrayidx.i57.1, align 8, !tbaa !12
  ret i64 %add7
}

define i32 @"55"(ptr %__first, ptr %add.ptr.i.us, ptr %add.ptr2.i.us, i64 %sub1.i.us, i64 %mul.i.us, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr2.i.us, align 4, !tbaa !0
  %3 = load i32, ptr %add.ptr.i.us, align 4, !tbaa !0
  %cmp.i.i.us = icmp slt i32 %3, %2
  %spec.select.i.us = select i1 %cmp.i.i.us, i64 %sub1.i.us, i64 %mul.i.us
  %__parent.020.in.i.i.us = add nsw i64 %spec.select.i.us, %0
  %__parent.020.i.i.us = sdiv i64 %__parent.020.in.i.i.us, %1
  %add.ptr.i.i.us = getelementptr inbounds i32, ptr %__first, i64 %__parent.020.i.i.us
  %4 = load i32, ptr %add.ptr.i.i.us, align 4, !tbaa !0
  ret i32 %4
}

define i32 @"56"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %5 = load ptr, ptr %el, align 8, !tbaa !47
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %ind.end
  %add.ptr.sroa_idx.prol = getelementptr inbounds i8, ptr %add.ptr.prol, i64 %2
  %6 = load i32, ptr %add.ptr.sroa_idx.prol, align 4
  ret i32 %6
}

define float @"57"(ptr %scores, i32 %cond, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %scores, align 8, !tbaa !8
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %5 = sub i32 %cond, %4
  %6 = zext i32 %5 to i64
  %7 = add nuw nsw i64 %6, %0
  %n.vec = and i64 %7, %1
  %ind.end = add nsw i64 %n.vec, %2
  %indvars.iv.next = add nsw i64 %ind.end, %0
  %arrayidx.i.1 = getelementptr inbounds float, ptr %3, i64 %indvars.iv.next
  %8 = load float, ptr %arrayidx.i.1, align 4, !tbaa !10
  ret float %8
}

define i64 @"58"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %end_size_.i.i) {
bb:
  %2 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !45
  %3 = load i32, ptr %v, align 4, !tbaa !76
  %sub = add nsw i32 %3, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %2, align 4, !tbaa.struct !78
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"59"(ptr %degrees, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %degrees, align 8, !tbaa !18
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %mul12 = shl i64 %2, %0
  %arrayidx.i32 = getelementptr inbounds i32, ptr %1, i64 %mul12
  %3 = load i32, ptr %arrayidx.i32, align 4, !tbaa !0
  ret i32 %3
}

define <2 x i64> @"60"(ptr %0, <2 x i64> %1, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %udist_, i64 %7, i64 %index15) {
bb:
  %wide.load18 = load <2 x i64>, ptr %0, align 8, !tbaa !12
  %8 = and <2 x i64> %wide.load18, %3
  %9 = icmp eq <2 x i64> %8, %5
  %10 = select <2 x i1> %9, <2 x i64> %5, <2 x i64> %6
  %11 = and <2 x i64> %wide.load18, %1
  %12 = shufflevector <2 x i64> %wide.load18, <2 x i64> %wide.load18, <2 x i32> <i32 1, i32 2>
  %13 = and <2 x i64> %12, %2
  %14 = or <2 x i64> %11, %13
  %15 = lshr exact <2 x i64> %14, %3
  %wide.load19 = load <2 x i64>, ptr %4, align 8, !tbaa !12
  %16 = xor <2 x i64> %15, %wide.load19
  %17 = xor <2 x i64> %16, %10
  %18 = load ptr, ptr %udist_, align 8, !tbaa !74
  %19 = getelementptr inbounds [312 x i64], ptr %18, i64 %7, i64 %index15
  store <2 x i64> %17, ptr %19, align 8, !tbaa !12
  ret <2 x i64> %17
}

define i64 @"61"(ptr %new_range.i.i, i64 %0) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %incdec.ptr.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i = load i64, ptr %incdec.ptr.i.i.i.i, align 4, !tbaa.struct !78
  ret i64 %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i
}

define i8 @"62"(ptr %arrayidx.i17.i, ptr %agg.tmp11, ptr %num_iters_, i32 %0, i64 %idxprom1.i.i) {
bb:
  %1 = load i8, ptr %arrayidx.i17.i, align 1, !tbaa !42, !noalias !39
  %2 = load i32, ptr %num_iters_, align 4, !tbaa !28
  %__val.lobit.i = lshr i32 %2, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %3 = load ptr, ptr %agg.tmp11, align 8, !tbaa !38, !alias.scope !39
  %arrayidx.i.i = getelementptr inbounds i8, ptr %3, i64 %conv5.i
  %arrayidx2.i.i = getelementptr inbounds i8, ptr %arrayidx.i.i, i64 %idxprom1.i.i
  store i8 %1, ptr %arrayidx2.i.i, align 1, !tbaa !42
  ret i8 %1
}

define ptr @"63"(ptr %call.i, ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, i64 %2, ptr %end_size_.i40) {
bb:
  %3 = load ptr, ptr %degrees, align 8, !tbaa !18
  %sub.ptr.rhs.cast.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %end_size_.i, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %sub = add nsw i64 %sub.ptr.div.i, %1
  %div38 = lshr i64 %sub, %2
  %add.ptr.i = getelementptr inbounds i64, ptr %call.i, i64 %div38
  store ptr %add.ptr.i, ptr %end_size_.i40, align 8, !tbaa !81
  ret ptr %add.ptr.i
}

define i64 @"64"(ptr %arrayidx.i, i64 %0, ptr %offsets, ptr %__begin0.0640) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !14
  %e.sroa.0.0.copyload = load i32, ptr %__begin0.0640, align 4, !tbaa.struct !78
  %conv = sext i32 %e.sroa.0.0.copyload to i64
  %arrayidx.i2 = getelementptr inbounds i64, ptr %1, i64 %conv
  %2 = load i64, ptr %arrayidx.i, align 8, !tbaa !12
  %inc = add nsw i64 %2, %0
  store i64 %inc, ptr %arrayidx.i, align 8, !tbaa !12
  ret i64 %inc
}

define i64 @"65"(ptr %max_seen.i, i32 %0, ptr %num_nodes_) {
bb:
  %1 = load i32, ptr %max_seen.i, align 4, !tbaa !0
  %add = add nsw i32 %1, %0
  %conv = sext i32 %add to i64
  store i64 %conv, ptr %num_nodes_, align 8, !tbaa !67
  ret i64 %conv
}

define ptr @"66"(ptr %new_range.i.i, ptr %end_size_.i, ptr %el, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !71
  ret ptr %add.ptr6.i.i
}

define i32 @"67"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3) {
bb:
  %4 = load ptr, ptr %el, align 8, !tbaa !47
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %6 = sub i64 %0, %5
  %n.vec = and i64 %6, %1
  %ind.end = add i64 %5, %n.vec
  %add15 = add i64 %ind.end, %2
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %4, i64 %add15
  %add.ptr.sroa_idx.1 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %3
  %7 = load i32, ptr %add.ptr.sroa_idx.1, align 4
  ret i32 %7
}

define i64 @"68"(ptr %new_range.i.i, i64 %0) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !78
  ret i64 %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i
}

define i64 @"69"(ptr %0, i64 %1, ptr %arrayidx42.i.i, i64 %2, i64 %3, ptr %arrayidx49.i.i, i64 %4, i64 %5, ptr %udist_, i64 %6) {
bb:
  %7 = load i64, ptr %arrayidx49.i.i, align 8, !tbaa !12
  %8 = load i64, ptr %arrayidx42.i.i, align 8, !tbaa !12
  %and43.i.i = and i64 %8, %2
  %9 = load i64, ptr %0, align 8, !tbaa !12
  %and46.i.i = and i64 %9, %1
  %or47.i.i = or i64 %and46.i.i, %and43.i.i
  %shr50.i.i = lshr exact i64 %or47.i.i, %3
  %xor51.i.i = xor i64 %shr50.i.i, %7
  %and52.i.i = and i64 %9, %3
  %tobool53.not.i.i = icmp eq i64 %and52.i.i, %4
  %cond54.i.i = select i1 %tobool53.not.i.i, i64 %4, i64 %5
  %xor55.i.i = xor i64 %xor51.i.i, %cond54.i.i
  %10 = load ptr, ptr %udist_, align 8, !tbaa !74
  %arrayidx42.i.i2 = getelementptr inbounds [312 x i64], ptr %0, i64 %4, i64 311
  store i64 %xor55.i.i, ptr %arrayidx42.i.i, align 8, !tbaa !12
  ret i64 %xor55.i.i
}

define i32 @"70"(ptr %depths, ptr %__begin4.0135) {
bb:
  %0 = load ptr, ptr %depths, align 8, !tbaa !18, !llvm.access.group !66
  %.pre = load i32, ptr %__begin4.0135, align 4, !tbaa !0, !llvm.access.group !66
  %conv36 = sext i32 %.pre to i64
  %arrayidx.i102 = getelementptr inbounds i32, ptr %0, i64 %conv36
  %1 = load i32, ptr %arrayidx.i102, align 4, !tbaa !0, !llvm.access.group !66
  ret i32 %1
}

define i32 @"71"(ptr %el, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %el, align 8, !tbaa !47
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %1
  %2 = load i32, ptr %add.ptr, align 4
  ret i32 %2
}

define float @"72"(ptr %biggest_score, ptr %biggest_score4) {
bb:
  %0 = load float, ptr %biggest_score, align 4, !tbaa !10
  %1 = load float, ptr %biggest_score4, align 4, !tbaa !10
  %cmp13 = fcmp ogt float %0, %1
  %. = select i1 %cmp13, float %0, float %1
  store float %., ptr %biggest_score, align 4, !tbaa !10
  ret float %.
}

define i64 @"73"(ptr %shared_in.i, i64 %0, ptr %shared_out_end.i) {
bb:
  %1 = load i64, ptr %shared_in.i, align 8, !tbaa !86
  %inc.i = add i64 %1, %0
  store i64 %inc.i, ptr %shared_out_end.i, align 8, !tbaa !58
  ret i64 %inc.i
}

define float @"74"(ptr %arrayidx.i.prol, ptr %biggest_score, ptr %scores, i32 %cond, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %4 = sub i32 %cond, %3
  %5 = zext i32 %4 to i64
  %6 = add nuw nsw i64 %5, %0
  %n.vec = and i64 %6, %1
  %ind.end = add nsw i64 %n.vec, %2
  %7 = load ptr, ptr %scores, align 8, !tbaa !8
  %arrayidx.i.prol2 = getelementptr inbounds float, ptr %7, i64 %ind.end
  %8 = load float, ptr %arrayidx.i.prol, align 4, !tbaa !10
  %9 = load float, ptr %biggest_score, align 4, !tbaa !10
  %div9.prol = fdiv float %8, %9
  store float %div9.prol, ptr %arrayidx.i.prol, align 4, !tbaa !10
  ret float %div9.prol
}

define i32 @"75"(ptr %.omp.lb, ptr %permutation, i64 %indvars.iv) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %1 = sext i32 %0 to i64
  %2 = trunc i64 %1 to i32
  %3 = load ptr, ptr %permutation, align 8, !tbaa !18
  %arrayidx.i = getelementptr inbounds i32, ptr %3, i64 %indvars.iv
  store i32 %2, ptr %arrayidx.i, align 4, !tbaa !0
  ret i32 %2
}

define ptr @"76"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !45
  ret ptr %add.ptr.i
}

define ptr @"77"(ptr %call.i.i446450, ptr %num_nodes_.i, ptr %end_size_.i.i448) {
bb:
  %0 = load i64, ptr %num_nodes_.i, align 8, !tbaa !43
  %add.ptr.i.i447 = getelementptr inbounds float, ptr %call.i.i446450, i64 %0
  store ptr %add.ptr.i.i447, ptr %end_size_.i.i448, align 8, !tbaa !87
  ret ptr %add.ptr.i.i447
}

define i32 @"78"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.1659, ptr %arrayidx.i541) {
bb:
  %1 = load i64, ptr %arrayidx.i542, align 8, !tbaa !12
  %i200.0 = add nsw i64 %1, %0
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !0
  %.pre731 = sext i32 %.pre717 to i64
  %sub222 = sub nsw i64 %total_missing_inv.1659, %.pre731
  %sub211 = sub nsw i64 %i200.0, %sub222
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %2 = load i32, ptr %arrayidx212, align 4, !tbaa !0
  ret i32 %2
}

define i64 @"79"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57) {
bb:
  %0 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !12
  %1 = load i64, ptr %arrayidx.i58, align 8, !tbaa !12
  %add7 = add nsw i64 %1, %total.076
  %add7.1 = add nsw i64 %0, %add7
  %2 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !12
  %add7.2 = add nsw i64 %2, %add7.1
  %3 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !12
  %add7.3 = add nsw i64 %3, %add7.2
  store i64 %add7.3, ptr %arrayidx.i57, align 8, !tbaa !12
  ret i64 %add7.3
}

define i32 @"80"(ptr %call171, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %0, i64 %1, i64 %total_missing_inv.0649, ptr %arrayidx.i536) {
bb:
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !12
  %3 = load i32, ptr %arrayidx.i541, align 4, !tbaa !0
  %conv198 = sext i32 %3 to i64
  %4 = load i64, ptr %arrayidx.i540, align 8, !tbaa !12
  %add199 = add nsw i64 %4, %conv198
  %5 = sub i64 %2, %add199
  %n.vec793 = and i64 %5, %0
  %ind.end794 = sub i64 %2, %n.vec793
  %i200.0 = add nsw i64 %ind.end794, %1
  %6 = load i32, ptr %arrayidx.i536, align 4, !tbaa !0
  %conv155 = sext i32 %6 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %sub211 = sub nsw i64 %i200.0, %add156
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %7 = load i32, ptr %arrayidx212, align 4, !tbaa !0
  ret i32 %7
}

define i64 @"81"(ptr %add.ptr.i.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, ptr %v.i.i.i.i.i.i, ptr %v3.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0) {
bb:
  %1 = load i32, ptr %v.i.i.i.i.i.i, align 4
  %2 = load i32, ptr %v3.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i = icmp slt i32 %1, %2
  %3 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !53
  %4 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !53
  %cmp7.i.i.i.i.i.i = icmp slt i32 %4, %3
  %cmp.i.i.i.i.i.i = icmp eq i32 %4, %3
  %cond.i.i.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i1 %cmp4.i.i.i.i.i.i, i1 %cmp7.i.i.i.i.i.i
  %spec.select.i.i.i.i = select i1 %cond.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %add.ptr2.i.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %sub12.i.i.i.i
  %5 = load i64, ptr %add.ptr.i.i.i.i.i, align 4
  store i64 %5, ptr %add.ptr2.i.i.i.i.i, align 4
  ret i64 %5
}

define ptr @"82"(ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0, i32 %1, ptr %add.ptr) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i, i32 2
  store ptr %3, ptr %add.ptr, align 8, !tbaa !88
  ret ptr %3
}

define double @"83"(ptr %add.ptr.i441, ptr %add.ptr.i442, ptr %path_counts.sroa.0.1741879, ptr %__begin3.0814) {
bb:
  %0 = load i32, ptr %__begin3.0814, align 4, !tbaa !0
  %conv34 = sext i32 %0 to i64
  %add.ptr.i4422 = getelementptr inbounds double, ptr %path_counts.sroa.0.1741879, i64 %conv34
  %1 = load double, ptr %add.ptr.i441, align 8, !tbaa !89
  %2 = load double, ptr %add.ptr.i442, align 8, !tbaa !89
  %add54 = fadd double %1, %2
  store double %add54, ptr %add.ptr.i442, align 8, !tbaa !89
  ret double %add54
}

define i32 @"84"(ptr %add.ptr.i, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %1 = load ptr, ptr %add.ptr.i, align 8, !tbaa !4
  %add.ptr = getelementptr inbounds i32, ptr %1, i64 %0
  %2 = load i32, ptr %add.ptr, align 4, !tbaa !0, !llvm.access.group !72
  ret i32 %2
}

define ptr @"85"(ptr %cond.i31.i.i491, ptr %verts_at_depth.sroa.0.5, ptr %arrayidx.i466) {
bb:
  %0 = load i32, ptr %arrayidx.i466, align 4, !tbaa !0
  %conv98 = sext i32 %0 to i64
  %add.ptr.i467 = getelementptr inbounds %"class.std::vector.26", ptr %verts_at_depth.sroa.0.5, i64 %conv98
  store ptr %cond.i31.i.i491, ptr %add.ptr.i467, align 8, !tbaa !91
  ret ptr %cond.i31.i.i491
}

define float @"86"(ptr %arrayidx.i, ptr %biggest_score, ptr %scores, i32 %cond, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load float, ptr %arrayidx.i, align 4, !tbaa !10
  %4 = load float, ptr %biggest_score, align 4, !tbaa !10
  %div9 = fdiv float %3, %4
  %5 = load ptr, ptr %scores, align 8, !tbaa !8
  %6 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %7 = sub i32 %cond, %6
  %8 = zext i32 %7 to i64
  %9 = add nuw nsw i64 %8, %0
  %n.vec = and i64 %9, %1
  %ind.end = add nsw i64 %n.vec, %2
  %arrayidx.i2 = getelementptr inbounds float, ptr %5, i64 %ind.end
  store float %div9, ptr %arrayidx.i, align 4, !tbaa !10
  ret float %div9
}

define <2 x i64> @"87"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %rng, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
bb:
  %wide.load91 = load <2 x i64>, ptr %0, align 8, !tbaa !12
  %10 = and <2 x i64> %wide.load91, %1
  %11 = load i64, ptr %rng, align 8, !tbaa !12
  %vector.recur.init89 = insertelement <2 x i64> %2, i64 %11, i64 %3
  %12 = shufflevector <2 x i64> %vector.recur.init89, <2 x i64> %wide.load91, <2 x i32> <i32 1, i32 2>
  %13 = and <2 x i64> %12, %4
  %14 = or <2 x i64> %10, %13
  %15 = lshr exact <2 x i64> %14, %5
  %wide.load92 = load <2 x i64>, ptr %6, align 8, !tbaa !12
  %16 = xor <2 x i64> %15, %wide.load92
  %17 = and <2 x i64> %wide.load91, %5
  %18 = icmp eq <2 x i64> %17, %7
  %19 = select <2 x i1> %18, <2 x i64> %7, <2 x i64> %8
  %20 = xor <2 x i64> %16, %19
  store <2 x i64> %20, ptr %9, align 8, !tbaa !12
  ret <2 x i64> %20
}

define i32 @"88"(ptr %arrayidx212, ptr %call171, ptr %arrayidx.i539, i64 %0) {
bb:
  %1 = load i32, ptr %arrayidx212, align 4, !tbaa !0
  %2 = load i64, ptr %arrayidx.i539, align 8, !tbaa !12
  %sub183 = add nsw i64 %2, %0
  %arrayidx213 = getelementptr inbounds i32, ptr %call171, i64 %sub183
  store i32 %1, ptr %arrayidx213, align 4, !tbaa !0
  ret i32 %1
}

define <4 x i32> @"89"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.0649, ptr %arrayidx.i536, i64 %1) {
bb:
  %2 = load i32, ptr %arrayidx.i536, align 4, !tbaa !0
  %conv155 = sext i32 %2 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %3 = load i64, ptr %arrayidx.i542, align 8, !tbaa !12
  %4 = add i64 %3, %0
  %5 = sub nsw i64 %4, %add156
  %6 = getelementptr inbounds i32, ptr %call171, i64 %5
  %7 = getelementptr inbounds i32, ptr %6, i64 %1
  %wide.load803 = load <4 x i32>, ptr %7, align 4, !tbaa !0
  ret <4 x i32> %wide.load803
}

define i32 @"90"(i64 %indvars.iv699, ptr %incdec.ptr4.sink.i.i.i.i569, ptr %__first.addr.015.i.i563, ptr %call171, ptr %arrayidx.i550, i64 %sub.ptr.rhs.cast.i.i.i.i552, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i550, align 8, !tbaa !12
  %add.ptr271 = getelementptr inbounds i32, ptr %call171, i64 %2
  %sub.ptr.lhs.cast.i.i.i.i551 = ptrtoint ptr %add.ptr271 to i64
  %sub.ptr.sub.i.i.i.i553 = sub i64 %sub.ptr.lhs.cast.i.i.i.i551, %sub.ptr.rhs.cast.i.i.i.i552
  %sub.ptr.div.i.i.i.i561 = lshr exact i64 %sub.ptr.sub.i.i.i.i553, %0
  %shr.i.i565 = lshr i64 %sub.ptr.div.i.i.i.i561, %1
  %incdec.ptr4.sink.i.i.i.i5692 = getelementptr inbounds i32, ptr %__first.addr.015.i.i563, i64 %shr.i.i565
  %incdec.ptr.i.i571 = getelementptr inbounds i32, ptr %incdec.ptr4.sink.i.i.i.i569, i64 %1
  %3 = load i32, ptr %incdec.ptr4.sink.i.i.i.i569, align 4, !tbaa !0
  %4 = sext i32 %3 to i64
  %cmp.i.i.i570 = icmp sgt i64 %indvars.iv699, %4
  %__first.addr.1.i.i574 = select i1 %cmp.i.i.i570, ptr %incdec.ptr.i.i571, ptr %__first.addr.015.i.i563
  %5 = load i32, ptr %__first.addr.1.i.i574, align 4, !tbaa !0
  ret i32 %5
}

define <4 x i32> @"91"(<4 x i32> %0, ptr %init_val, i64 %1, ptr %this, ptr %.omp.lb, i64 %index) {
bb:
  %2 = load i32, ptr %init_val, align 4, !tbaa !0, !alias.scope !19
  %broadcast.splatinsert21 = insertelement <4 x i32> %0, i32 %2, i64 %1
  %broadcast.splat22 = shufflevector <4 x i32> %broadcast.splatinsert21, <4 x i32> %0, <4 x i32> zeroinitializer
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %offset.idx = add i64 %3, %index
  %4 = load ptr, ptr %this, align 8, !tbaa !18
  %5 = getelementptr inbounds i32, ptr %4, i64 %offset.idx
  store <4 x i32> %broadcast.splat22, ptr %5, align 4, !tbaa !0, !alias.scope !22, !noalias !19
  ret <4 x i32> %broadcast.splat22
}

define <4 x i32> @"92"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.1659, ptr %arrayidx.i541, i64 %1) {
bb:
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !0
  %.pre731 = sext i32 %.pre717 to i64
  %sub222 = sub nsw i64 %total_missing_inv.1659, %.pre731
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !12
  %3 = add i64 %2, %0
  %4 = sub nsw i64 %3, %sub222
  %5 = getelementptr inbounds i32, ptr %call171, i64 %4
  %6 = getelementptr inbounds i32, ptr %5, i64 %1
  %wide.load803 = load <4 x i32>, ptr %6, align 4, !tbaa !0
  ret <4 x i32> %wide.load803
}

define i32 @"93"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %this, align 8, !tbaa !18
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add7 = add i64 %ind.end, %2
  %add.ptr.1 = getelementptr inbounds i32, ptr %3, i64 %add7
  %6 = load i32, ptr %init_val, align 4, !tbaa !0
  store i32 %6, ptr %add.ptr.1, align 4, !tbaa !0
  ret i32 %6
}

define i32 @"94"(ptr %num_nodes_.i, i64 %0, i64 %1, i64 %2, ptr %add.ptr.i.1) {
bb:
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !43
  %4 = and i64 %3, %0
  %n.mod.vf = and i64 %3, %1
  %n.vec = sub nsw i64 %4, %n.mod.vf
  %indvars.iv.next = add nuw nsw i64 %n.vec, %2
  %5 = trunc i64 %indvars.iv.next to i32
  store i32 %5, ptr %add.ptr.i.1, align 4, !tbaa !69
  ret i32 %5
}

define i32 @"95"(ptr %depths, ptr %__begin3.0814) {
bb:
  %0 = load ptr, ptr %depths, align 8, !tbaa !18
  %1 = load i32, ptr %__begin3.0814, align 4, !tbaa !0
  %conv34 = sext i32 %1 to i64
  %arrayidx.i398 = getelementptr inbounds i32, ptr %0, i64 %conv34
  %2 = load i32, ptr %arrayidx.i398, align 4, !tbaa !0
  ret i32 %2
}

define float @"96"(ptr %scores, i32 %cond, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %4 = sub i32 %cond, %3
  %5 = zext i32 %4 to i64
  %6 = add nuw nsw i64 %5, %0
  %n.vec = and i64 %6, %1
  %ind.end = add nsw i64 %n.vec, %2
  %7 = load ptr, ptr %scores, align 8, !tbaa !8
  %arrayidx.i.prol = getelementptr inbounds float, ptr %7, i64 %ind.end
  %8 = load float, ptr %arrayidx.i.prol, align 4, !tbaa !10
  ret float %8
}

define float @"97"(ptr %0, ptr %1, ptr %2) {
bb:
  %3 = load float, ptr %1, align 4, !tbaa !10
  %4 = load float, ptr %0, align 4, !tbaa !10
  %cmp = fcmp ogt float %4, %3
  %. = select i1 %cmp, float %4, float %3
  %5 = load ptr, ptr %2, align 8
  store float %., ptr %0, align 4, !tbaa !10
  ret float %.
}

define float @"98"(ptr %scores, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %scores, align 8, !tbaa !8
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %2 = sext i32 %1 to i64
  %arrayidx.i = getelementptr inbounds float, ptr %0, i64 %2
  %3 = load float, ptr %arrayidx.i, align 4, !tbaa !10
  ret float %3
}

define i64 @"99"(i64 %val.coerce, ptr %new_range.i, ptr %end_size_.i, ptr %this, i64 %0) {
bb:
  %1 = load ptr, ptr %this, align 8, !tbaa !47
  %sub.ptr.rhs.cast.i11.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast.i10.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i12.i = sub i64 %sub.ptr.lhs.cast.i10.i, %sub.ptr.rhs.cast.i11.i
  %sub.ptr.div.i13.i = ashr exact i64 %sub.ptr.sub.i12.i, %0
  %3 = load ptr, ptr %new_range.i, align 8, !tbaa !4
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div.i13.i
  store i64 %val.coerce, ptr %add.ptr.i, align 4, !tbaa.struct !78
  ret i64 %val.coerce
}

define <2 x i64> @"100"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %3, i64 %4, <2 x i64> %5, <2 x i64> %6, ptr %7, <2 x i64> %8, <2 x i64> %9, ptr %udist_, i64 %10, i64 %index15) {
bb:
  %wide.load18 = load <2 x i64>, ptr %0, align 8, !tbaa !12
  %11 = and <2 x i64> %wide.load18, %1
  %.pre.i.i = load i64, ptr %3, align 8, !tbaa !12
  %vector.recur.init16 = insertelement <2 x i64> %2, i64 %.pre.i.i, i64 %4
  %12 = shufflevector <2 x i64> %vector.recur.init16, <2 x i64> %wide.load18, <2 x i32> <i32 1, i32 2>
  %13 = and <2 x i64> %12, %5
  %14 = or <2 x i64> %11, %13
  %15 = lshr exact <2 x i64> %14, %6
  %wide.load19 = load <2 x i64>, ptr %7, align 8, !tbaa !12
  %16 = xor <2 x i64> %15, %wide.load19
  %17 = and <2 x i64> %wide.load18, %6
  %18 = icmp eq <2 x i64> %17, %8
  %19 = select <2 x i1> %18, <2 x i64> %8, <2 x i64> %9
  %20 = xor <2 x i64> %16, %19
  %21 = load ptr, ptr %udist_, align 8, !tbaa !74
  %22 = getelementptr inbounds [312 x i64], ptr %3, i64 %10, i64 %index15
  store <2 x i64> %20, ptr %22, align 8, !tbaa !12
  ret <2 x i64> %20
}

define ptr @"101"(ptr %neighs, ptr %arrayidx.i.prol, ptr %index, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %neighs, align 8, !tbaa !4
  %1 = load i64, ptr %arrayidx.i.prol, align 8, !tbaa !12
  %add.ptr.prol = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load ptr, ptr %index, align 8, !tbaa !4
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %4 = sext i32 %3 to i64
  %arrayidx.prol = getelementptr inbounds ptr, ptr %2, i64 %4
  store ptr %add.ptr.prol, ptr %arrayidx.prol, align 8, !tbaa !4
  ret ptr %add.ptr.prol
}

define i64 @"102"(ptr %new_range.i.i, i64 %0, i64 %1) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr13.i.i.i.i, i64 %1
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.030.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define ptr @"103"(ptr %new_range.i.i, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !47
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !45
  ret ptr %add.ptr.i464
}

define i64 @"104"(ptr %arrayidx.i492.1, ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !67
  %4 = and i64 %3, %0
  %indvars.iv.next = add nsw i64 %4, %1
  %arrayidx.i493.1 = getelementptr inbounds i64, ptr %2, i64 %indvars.iv.next
  %5 = load i64, ptr %arrayidx.i492.1, align 8, !tbaa !12
  store i64 %5, ptr %arrayidx.i493.1, align 8, !tbaa !12
  ret i64 %5
}

define i64 @"105"(ptr %udist_, i64 %0, ptr %_M_p.i) {
bb:
  %.pre = load i64, ptr %_M_p.i, align 8, !tbaa !92
  %1 = load ptr, ptr %udist_, align 8, !tbaa !74
  %arrayidx.i7 = getelementptr inbounds [312 x i64], ptr %1, i64 %0, i64 %.pre
  %2 = load i64, ptr %arrayidx.i7, align 8, !tbaa !12
  ret i64 %2
}

define ptr @"106"(ptr %neighs, ptr %arrayidx.i.1, ptr %index, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !12
  %2 = load ptr, ptr %neighs, align 8, !tbaa !4
  %add.ptr.1 = getelementptr inbounds i32, ptr %2, i64 %1
  %3 = load ptr, ptr %index, align 8, !tbaa !4
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %5 = sext i32 %4 to i64
  %indvars.iv.next = add nsw i64 %5, %0
  %arrayidx.1 = getelementptr inbounds ptr, ptr %3, i64 %indvars.iv.next
  store ptr %add.ptr.1, ptr %arrayidx.1, align 8, !tbaa !4
  ret ptr %add.ptr.1
}

define <8 x i32> @"107"(ptr %el, ptr %.omp.lb, i64 %index, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %offset.idx = add i64 %1, %index
  %2 = add i64 %offset.idx, %0
  %3 = load ptr, ptr %el, align 8, !tbaa !47
  %4 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %2
  %wide.vec44 = load <8 x i32>, ptr %4, align 4
  ret <8 x i32> %wide.vec44
}

define i64 @"108"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !79
  %inc.i71 = add nuw nsw i64 %1, %0
  %inc.i207 = add nuw nsw i64 %inc.i71, %0
  %inc.i139 = add nuw nsw i64 %inc.i207, %0
  store i64 %inc.i139, ptr %_M_p.i.i.i, align 8, !tbaa !79
  ret i64 %inc.i139
}

define i32 @"109"(ptr %queue, ptr %shared_out_start.i, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %1 = load i64, ptr %shared_out_start.i, align 8, !tbaa !55
  %2 = load ptr, ptr %queue, align 8, !tbaa !57
  %add.ptr.i = getelementptr inbounds i32, ptr %2, i64 %1
  %add.ptr = getelementptr inbounds i32, ptr %add.ptr.i, i64 %0
  %3 = load i32, ptr %add.ptr, align 4, !tbaa !0, !llvm.access.group !66
  ret i32 %3
}

define i32 @"110"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %el, align 8, !tbaa !47
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add15 = add i64 %ind.end, %2
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %add15
  %6 = load i32, ptr %add.ptr.1, align 4
  ret i32 %6
}

define i32 @"111"(ptr %depths, ptr %__begin3.0814) {
bb:
  %.pre = load ptr, ptr %depths, align 8, !tbaa !18
  %0 = load i32, ptr %__begin3.0814, align 4, !tbaa !0
  %conv34 = sext i32 %0 to i64
  %arrayidx.i439 = getelementptr inbounds i32, ptr %.pre, i64 %conv34
  %1 = load i32, ptr %arrayidx.i439, align 4, !tbaa !0
  ret i32 %1
}

define i64 @"112"(ptr %arrayidx.i58.epil, i64 %total.076.epil, ptr %call.i4145, ptr %num_blocks) {
bb:
  %0 = load i64, ptr %arrayidx.i58.epil, align 8, !tbaa !12
  %add7.epil = add nsw i64 %0, %total.076.epil
  %1 = load i64, ptr %num_blocks, align 8, !tbaa !12
  %arrayidx.i = getelementptr inbounds i64, ptr %call.i4145, i64 %1
  store i64 %add7.epil, ptr %arrayidx.i, align 8, !tbaa !12
  ret i64 %add7.epil
}

define i32 @"113"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !0
  %3 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !0
  %cmp.i.i.i.i.i = icmp slt i32 %3, %2
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %__parent.020.in.i.i.i.i.i = add nsw i64 %sub12.i.i.i.i, %1
  %__parent.020.i.i45.i.i.i = lshr i64 %__parent.020.in.i.i.i.i.i, %0
  %add.ptr.i.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %__parent.020.i.i45.i.i.i
  %4 = load i32, ptr %add.ptr.i.i.i.i.i, align 4, !tbaa !0
  ret i32 %4
}

define float @"114"(ptr %arrayidx.i.prol, float %0, ptr %arrayidx.i, float %1, ptr %arrayidx.i.1, float %2, ptr %biggest_score4) {
bb:
  %3 = load float, ptr %arrayidx.i.1, align 4
  %4 = load float, ptr %arrayidx.i, align 4
  %5 = load float, ptr %arrayidx.i.prol, align 4
  %cmp.i.prol = fcmp ogt float %5, %0
  %6 = select i1 %cmp.i.prol, float %5, float %0
  %cmp.i = fcmp olt float %6, %4
  %7 = select i1 %cmp.i, float %4, float %1
  %cmp.i.1 = fcmp olt float %2, %3
  %8 = select i1 %cmp.i.1, float %3, float %2
  store float %8, ptr %biggest_score4, align 4, !tbaa !10
  ret float %8
}

define i64 @"115"(ptr %.omp.lb, i64 %0, i64 %1, ptr %rng) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %add10 = add i64 %2, %0
  %rem.i.i.i = and i64 %add10, %1
  store i64 %rem.i.i.i, ptr %rng, align 8, !tbaa !12
  ret i64 %rem.i.i.i
}

define ptr @"116"(ptr %new_range.i.i457, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !4
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !47
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !71
  ret ptr %add.ptr6.i.i478
}

define i64 @"117"(ptr %arrayidx.i, ptr %prefix, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %mul14 = shl i64 %1, %0
  %2 = load ptr, ptr %prefix, align 8
  %arrayidx.i35 = getelementptr inbounds i64, ptr %2, i64 %mul14
  %3 = load i64, ptr %arrayidx.i, align 8, !tbaa !12
  store i64 %3, ptr %arrayidx.i35, align 8, !tbaa !12
  ret i64 %3
}

define ptr @"118"(ptr %verts_at_depth.sroa.0.1825, ptr %arrayidx.i451, i32 %0) {
bb:
  %1 = load i32, ptr %arrayidx.i451, align 4, !tbaa !0
  %add91 = add nuw nsw i32 %1, %0
  %conv92 = sext i32 %add91 to i64
  %add.ptr.i462 = getelementptr inbounds %"class.std::vector.26", ptr %verts_at_depth.sroa.0.1825, i64 %conv92
  %2 = load ptr, ptr %add.ptr.i462, align 8, !tbaa !91
  ret ptr %2
}

define i64 @"119"(ptr %offsets, ptr %num_nodes_.i) {
bb:
  %.pre714 = load i64, ptr %num_nodes_.i, align 8, !tbaa !67
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !14
  %arrayidx.i533 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %.pre714
  %0 = load i64, ptr %arrayidx.i533, align 8, !tbaa !12
  ret i64 %0
}

define i32 @"120"(ptr %num_nodes_.i, i32 %0, ptr %.omp.ub) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !43
  %conv = trunc i64 %1 to i32
  %sub3 = add nsw i32 %conv, %0
  store i32 %sub3, ptr %.omp.ub, align 4, !tbaa !0
  ret i32 %sub3
}

define i64 @"121"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !79
  %inc.i71 = add nuw nsw i64 %2, %1
  %inc.i207 = add nuw nsw i64 %inc.i71, %1
  %arrayidx.i140 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i207
  %3 = load i64, ptr %arrayidx.i140, align 8, !tbaa !12
  ret i64 %3
}

define i64 @"122"(ptr %arrayidx.i18.i, ptr %0, i64 %1, ptr %2) {
bb:
  %3 = load ptr, ptr %0, align 8, !tbaa !4, !noalias !83
  %sub.ptr.rhs.cast.i20.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %arrayidx.i18.i, align 8, !tbaa !4, !noalias !83
  %sub.ptr.lhs.cast.i19.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i21.i = sub i64 %sub.ptr.lhs.cast.i19.i, %sub.ptr.rhs.cast.i20.i
  %sub.ptr.div.i22.i = ashr exact i64 %sub.ptr.sub.i21.i, %1
  %div.i.i = sdiv i64 %sub.ptr.div.i22.i, %1
  store i64 %div.i.i, ptr %2, align 8, !alias.scope !83
  ret i64 %div.i.i
}

define float @"123"(ptr %arrayidx.i591, ptr %retval.0.i.i, ptr %scores, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %scores, align 8, !tbaa !8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !43
  %4 = and i64 %3, %0
  %n.mod.vf = and i64 %3, %1
  %n.vec = sub nsw i64 %4, %n.mod.vf
  %arrayidx.i5912 = getelementptr inbounds float, ptr %2, i64 %n.vec
  %5 = load float, ptr %retval.0.i.i, align 4, !tbaa !10
  %6 = load float, ptr %arrayidx.i591, align 4, !tbaa !10
  %div224 = fdiv float %6, %5
  store float %div224, ptr %arrayidx.i591, align 4, !tbaa !10
  ret float %div224
}

define i64 @"124"(ptr %add.ptr.i.i.i.i16, ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i64, ptr %add.ptr.i.i.i.i16, align 4
  %1 = load i32, ptr %v3.i.i.i.i.i, align 4
  %2 = load i32, ptr %v.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %2, %1
  %3 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !53
  %4 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !53
  %cmp.i.i.i.i.i = icmp eq i32 %3, %4
  %cmp7.i.i.i.i.i = icmp slt i32 %3, %4
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr2.i.i.i.i23 = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  store i64 %0, ptr %add.ptr2.i.i.i.i23, align 4
  ret i64 %0
}

define float @"125"(ptr %scores, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !43
  %3 = and i64 %2, %0
  %n.mod.vf = and i64 %2, %1
  %n.vec = sub nsw i64 %3, %n.mod.vf
  %4 = load ptr, ptr %scores, align 8, !tbaa !8
  %arrayidx.i.prol = getelementptr inbounds float, ptr %4, i64 %n.vec
  %5 = load float, ptr %arrayidx.i.prol, align 4, !tbaa !10
  ret float %5
}

define float @"126"(ptr %scores, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %scores, align 8, !tbaa !8
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %3 = sext i32 %2 to i64
  %indvars.iv.next = add nsw i64 %3, %0
  %arrayidx.i.1 = getelementptr inbounds float, ptr %1, i64 %indvars.iv.next
  %4 = load float, ptr %arrayidx.i.1, align 4, !tbaa !10
  ret float %4
}

define i64 @"127"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !78
  ret i64 %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i
}

define i32 @"128"(ptr %__first.addr.033.i.i, ptr %n_start.0.in, i64 %0) {
bb:
  %1 = load i32, ptr %__first.addr.033.i.i, align 4, !tbaa !0
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  store i32 %1, ptr %incdec.ptr12.i.i.i.i, align 4, !tbaa !0
  ret i32 %1
}

define i64 @"129"(ptr %new_range.i.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %agg.tmp.sroa.0.0.copyload.i.i.i.i.i = load i64, ptr %.pre.i.i, align 4, !tbaa.struct !78
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i.i.i
}

define i32 @"130"(ptr %neighs, ptr %arrayidx.i523) {
bb:
  %0 = load ptr, ptr %neighs, align 8, !tbaa !4
  %1 = load i64, ptr %arrayidx.i523, align 8, !tbaa !12
  %add.ptr = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %add.ptr, align 4, !tbaa !0
  ret i32 %2
}

define i32 @"131"(ptr %n_start.0.in, i64 %0, i64 %1, ptr %diffs, ptr %.omp.lb) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i89 = ptrtoint ptr %n_start.0 to i64
  %incdec.ptr7.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast.i.i89
  %2 = lshr exact i64 %sub.ptr.sub, %1
  %conv22 = trunc i64 %2 to i32
  %3 = load ptr, ptr %diffs, align 8, !tbaa !18
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %5 = sext i32 %4 to i64
  %arrayidx.i99 = getelementptr inbounds i32, ptr %3, i64 %5
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !0
  ret i32 %conv22
}

define ptr @"132"(ptr %new_range.i.i457, ptr %new_range.i.i, i64 %0, ptr %el, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !4
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !47
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !71
  ret ptr %add.ptr6.i.i478
}

define i32 @"133"(ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %v3.i.i.i.i.i, align 4
  %3 = load i32, ptr %v.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %3, %2
  %4 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !53
  %5 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !53
  %cmp.i.i.i.i.i = icmp eq i32 %4, %5
  %cmp7.i.i.i.i.i = icmp slt i32 %4, %5
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %__parent.020.in.i.i.i.i = add nsw i64 %spec.select.i.i.i, %0
  %__parent.020.i.i.i.i = sdiv i64 %__parent.020.in.i.i.i.i, %1
  %add.ptr.i.i.i.i16 = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %__parent.020.i.i.i.i
  %6 = load i32, ptr %add.ptr.i.i.i.i16, align 4, !tbaa !53
  ret i32 %6
}

define ptr @"134"(ptr %cond.i31.i.i.i, i64 %.sroa.speculated.i.i.i.i, ptr %_M_finish.i.i, ptr %depth_index, i64 %0, i64 %sub.ptr.div.i.i.i.i.i, i1 %cmp9.i.i.i.i, i64 %1, i64 %add.i.i.i.i, ptr %_M_end_of_storage.i.i) {
bb:
  %2 = load ptr, ptr %depth_index, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i.i.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !4
  %sub.ptr.lhs.cast.i.i.i.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i2 = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, %0
  %add.i.i.i.i4 = add i64 %.sroa.speculated.i.i.i.i, %sub.ptr.div.i.i.i.i.i
  %cmp7.i.i.i.i = icmp ult i64 %add.i.i.i.i, %sub.ptr.div.i.i.i.i.i
  %or.cond.i.i.i.i = or i1 %cmp7.i.i.i.i, %cmp9.i.i.i.i
  %cond.i.i.i.i = select i1 %or.cond.i.i.i.i, i64 %1, i64 %add.i.i.i.i
  %add.ptr19.i.i.i = getelementptr inbounds ptr, ptr %cond.i31.i.i.i, i64 %cond.i.i.i.i
  store ptr %add.ptr19.i.i.i, ptr %_M_end_of_storage.i.i, align 8, !tbaa !94
  ret ptr %add.ptr19.i.i.i
}

define i32 @"135"(ptr %incdec.ptr.i, i64 %0, ptr %second3.i29.i.i.i) {
bb:
  %__value.sroa.0.0.copyload.i = load i64, ptr %incdec.ptr.i, align 4
  %__value.sroa.3.0.extract.shift.i.i.i = lshr i64 %__value.sroa.0.0.copyload.i, %0
  %__value.sroa.3.0.extract.trunc.i.i.i = trunc i64 %__value.sroa.3.0.extract.shift.i.i.i to i32
  store i32 %__value.sroa.3.0.extract.trunc.i.i.i, ptr %second3.i29.i.i.i, align 4, !tbaa !96
  ret i32 %__value.sroa.3.0.extract.trunc.i.i.i
}

define i32 @"136"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %init_val, align 4, !tbaa !0
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %5 = load ptr, ptr %this, align 8, !tbaa !18
  %add.ptr = getelementptr inbounds i32, ptr %5, i64 %ind.end
  store i32 %2, ptr %add.ptr, align 4, !tbaa !0
  ret i32 %2
}

define ptr @"137"(ptr %call5.i.i.i.i4.i.i79, ptr %num_nodes_.i, i64 %0, ptr %_M_finish.i.i9.i) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !43
  %mul.i.i.i.i.i.i = shl nuw nsw i64 %1, %0
  %scevgep.i.i.i.i.i = getelementptr i8, ptr %call5.i.i.i.i4.i.i79, i64 %mul.i.i.i.i.i.i
  store ptr %scevgep.i.i.i.i.i, ptr %_M_finish.i.i9.i, align 8, !tbaa !98
  ret ptr %scevgep.i.i.i.i.i
}

define ptr @"138"(ptr %el, i64 %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !45
  ret ptr %add.ptr.i
}

define i32 @"139"(ptr %arrayidx.i399, i32 %0, ptr %depths, ptr %__begin3.0814) {
bb:
  %1 = load i32, ptr %arrayidx.i399, align 4, !tbaa !0
  %add = add nsw i32 %1, %0
  %2 = load ptr, ptr %depths, align 8, !tbaa !18
  %3 = load i32, ptr %__begin3.0814, align 4, !tbaa !0
  %conv34 = sext i32 %3 to i64
  %arrayidx.i398 = getelementptr inbounds i32, ptr %2, i64 %conv34
  store i32 %add, ptr %arrayidx.i398, align 4, !tbaa !0
  ret i32 %add
}

define i8 @"140"(ptr %label) {
bb:
  %0 = load ptr, ptr %label, align 8, !tbaa !38, !noalias !100
  %1 = load i8, ptr %0, align 1, !tbaa !42
  ret i8 %1
}

define <4 x i32> @"141"(ptr %0, ptr %call171, i64 %tail_index.0660, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %1, i64 %index800, i64 %2) {
bb:
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !0
  %.pre731 = sext i32 %.pre717 to i64
  %3 = load i64, ptr %arrayidx.i542, align 8, !tbaa !12
  %4 = load i32, ptr %arrayidx.i541, align 4, !tbaa !0
  %conv198 = sext i32 %4 to i64
  %5 = load i64, ptr %arrayidx.i540, align 8, !tbaa !12
  %add199 = add nsw i64 %5, %conv198
  %6 = sub i64 %3, %add199
  %n.vec793 = and i64 %6, %1
  %ind.end796 = sub i64 %tail_index.0660, %n.vec793
  %sub226 = sub nsw i64 %ind.end796, %.pre731
  %offset.idx801 = sub i64 %sub226, %index800
  %7 = getelementptr inbounds i32, ptr %call171, i64 %offset.idx801
  %8 = getelementptr inbounds i32, ptr %7, i64 %2
  %wide.load803 = load <4 x i32>, ptr %0, align 4, !tbaa !0
  store <4 x i32> %wide.load803, ptr %8, align 4, !tbaa !0
  ret <4 x i32> %wide.load803
}

define ptr @"142"(ptr %__args, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0) {
bb:
  %1 = load ptr, ptr %this, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %1 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %add.ptr = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i
  %2 = load ptr, ptr %__args, align 8, !tbaa !38
  store ptr %2, ptr %add.ptr, align 8, !tbaa !38
  ret ptr %2
}

define i64 @"143"(ptr %incdec.ptr126.i.i, ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %incdec.ptr5.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %1 = load i64, ptr %incdec.ptr126.i.i, align 4
  store i64 %1, ptr %incdec.ptr5.i.i, align 4
  ret i64 %1
}

define i64 @"144"(ptr %shared_in.i, ptr %shared_out_end.i) {
bb:
  %.pre.pre = load i64, ptr %shared_in.i, align 8, !tbaa !86
  store i64 %.pre.pre, ptr %shared_out_end.i, align 8, !tbaa !58
  ret i64 %.pre.pre
}

define float @"145"(ptr %scores, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !43
  %3 = and i64 %2, %0
  %n.mod.vf = and i64 %2, %1
  %n.vec = sub nsw i64 %3, %n.mod.vf
  %4 = load ptr, ptr %scores, align 8, !tbaa !8
  %arrayidx.i = getelementptr inbounds float, ptr %4, i64 %n.vec
  %5 = load float, ptr %arrayidx.i, align 4, !tbaa !10
  ret float %5
}

define i64 @"146"(ptr %arrayidx.i492.prol, ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !67
  %3 = and i64 %2, %0
  %arrayidx.i493.prol = getelementptr inbounds i64, ptr %1, i64 %3
  %4 = load i64, ptr %arrayidx.i492.prol, align 8, !tbaa !12
  store i64 %4, ptr %arrayidx.i493.prol, align 8, !tbaa !12
  ret i64 %4
}

define i64 @"147"(ptr %arrayidx.i492, ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !67
  %3 = and i64 %2, %0
  %arrayidx.i493 = getelementptr inbounds i64, ptr %1, i64 %3
  %4 = load i64, ptr %arrayidx.i492, align 8, !tbaa !12
  store i64 %4, ptr %arrayidx.i493, align 8, !tbaa !12
  ret i64 %4
}

define ptr @"148"(ptr %new_range.i.i457, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1, ptr %el, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !4
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !47
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !71
  ret ptr %add.ptr6.i.i478
}

define i64 @"149"(i64 %lsum.036, ptr %arrayidx.i32, ptr %local_sums, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %local_sums, align 8, !tbaa !14
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %arrayidx.i = getelementptr inbounds i64, ptr %0, i64 %1
  %2 = load i32, ptr %arrayidx.i32, align 4, !tbaa !0
  %conv = sext i32 %2 to i64
  %add16 = add nsw i64 %lsum.036, %conv
  store i64 %add16, ptr %arrayidx.i, align 8, !tbaa !12
  ret i64 %add16
}

define i32 @"150"(ptr %call171, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %0, i64 %1, i64 %total_missing_inv.1659) {
bb:
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !12
  %3 = load i32, ptr %arrayidx.i541, align 4, !tbaa !0
  %conv198 = sext i32 %3 to i64
  %4 = load i64, ptr %arrayidx.i540, align 8, !tbaa !12
  %add199 = add nsw i64 %4, %conv198
  %5 = sub i64 %2, %add199
  %n.vec793 = and i64 %5, %0
  %ind.end794 = sub i64 %2, %n.vec793
  %i200.0 = add nsw i64 %ind.end794, %1
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !0
  %.pre731 = sext i32 %.pre717 to i64
  %sub222 = sub nsw i64 %total_missing_inv.1659, %.pre731
  %sub211 = sub nsw i64 %i200.0, %sub222
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %6 = load i32, ptr %arrayidx212, align 4, !tbaa !0
  ret i32 %6
}

define i64 @"151"(ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, i64 %2, ptr %num_blocks) {
bb:
  %3 = load ptr, ptr %degrees, align 8, !tbaa !18
  %sub.ptr.rhs.cast.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %end_size_.i, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %sub = add nsw i64 %sub.ptr.div.i, %1
  %div38 = lshr i64 %sub, %2
  store i64 %div38, ptr %num_blocks, align 8, !tbaa !12
  ret i64 %div38
}

define i64 @"152"(ptr %arrayidx, ptr %new_range, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %arrayidx, align 4
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %2 = load ptr, ptr %new_range, align 8, !tbaa !4
  %arrayidx7 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %1
  store i64 %0, ptr %arrayidx7, align 4
  ret i64 %0
}

define i32 @"153"(ptr %n_start.0.in, i64 %0) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %1 = load i32, ptr %incdec.ptr12.i.i.i.i, align 4, !tbaa !0
  ret i32 %1
}

define ptr @"154"(ptr %el, ptr %0, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !47
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre711, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !45
  ret ptr %add.ptr.i464
}

define float @"155"(ptr %arrayidx.i.1, ptr %biggest_score, ptr %scores, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load float, ptr %arrayidx.i.1, align 4, !tbaa !10
  %2 = load float, ptr %biggest_score, align 4, !tbaa !10
  %div9.1 = fdiv float %1, %2
  %3 = load ptr, ptr %scores, align 8, !tbaa !8
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %5 = sext i32 %4 to i64
  %indvars.iv.next = add nsw i64 %5, %0
  %arrayidx.i.12 = getelementptr inbounds float, ptr %3, i64 %indvars.iv.next
  store float %div9.1, ptr %arrayidx.i.1, align 4, !tbaa !10
  ret float %div9.1
}

define i64 @"156"(ptr %num_edges_, i64 %0, i64 %1, i64 %2, ptr %.omp.ub) {
bb:
  %3 = load i64, ptr %num_edges_, align 8, !tbaa !103
  %sub3 = add nuw i64 %3, %0
  %div36 = lshr i64 %sub3, %1
  %sub4 = add nsw i64 %div36, %2
  store i64 %sub4, ptr %.omp.ub, align 8, !tbaa !12
  ret i64 %sub4
}

define i32 @"157"(ptr %incdec.ptr.i, ptr %add.ptr.i27.i.i.i) {
bb:
  %__value.sroa.0.0.copyload.i = load i64, ptr %incdec.ptr.i, align 4
  %__value.sroa.0.0.extract.trunc.i.i.i = trunc i64 %__value.sroa.0.0.copyload.i to i32
  store i32 %__value.sroa.0.0.extract.trunc.i.i.i, ptr %add.ptr.i27.i.i.i, align 4, !tbaa !105
  ret i32 %__value.sroa.0.0.extract.trunc.i.i.i
}

define i32 @"158"(ptr %arrayidx.i399, i32 %0, ptr %depths, ptr %__begin3.0814) {
bb:
  %1 = load i32, ptr %arrayidx.i399, align 4, !tbaa !0
  %add = add nsw i32 %1, %0
  %2 = load ptr, ptr %depths, align 8, !tbaa !18
  %3 = load i32, ptr %__begin3.0814, align 4, !tbaa !0
  %conv34 = sext i32 %3 to i64
  %arrayidx.i398 = getelementptr inbounds i32, ptr %2, i64 %conv34
  store i32 %add, ptr %arrayidx.i398, align 4, !tbaa !0
  ret i32 %add
}

define i32 @"159"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !47
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %2
  %add.ptr.sroa_idx = getelementptr inbounds i8, ptr %add.ptr, i64 %0
  %3 = load i32, ptr %add.ptr.sroa_idx, align 4
  ret i32 %3
}

define i8 @"160"(ptr %0, ptr %opt_arg) {
bb:
  %1 = load i8, ptr %0, align 8, !tbaa !42
  %2 = load ptr, ptr %opt_arg, align 8, !tbaa !38
  store i8 %1, ptr %2, align 1, !tbaa !42
  ret i8 %1
}

define i64 @"162"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %2) {
bb:
  %3 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %agg.result, align 8, !tbaa !47
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = ashr exact i64 %sub.ptr.sub.i12.i.i, %2
  %5 = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr.i.i149 = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %sub.ptr.div.i13.i.i
  %6 = load i32, ptr %v, align 4, !tbaa !76
  %sub = add nsw i32 %6, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %add.ptr.i.i149, align 4, !tbaa.struct !78
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"163"(ptr %call171, ptr %arrayidx.i547, ptr %arrayidx.i546) {
bb:
  %0 = load i32, ptr %arrayidx.i546, align 4, !tbaa !0
  %conv246 = sext i32 %0 to i64
  %1 = load i64, ptr %arrayidx.i547, align 8, !tbaa !12
  %add247 = add nsw i64 %1, %conv246
  %arrayidx257 = getelementptr inbounds i32, ptr %call171, i64 %add247
  %2 = load i32, ptr %arrayidx257, align 4, !tbaa !0
  ret i32 %2
}

define float @"164"(ptr %scores, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %2 = sext i32 %1 to i64
  %indvars.iv.next = add nsw i64 %2, %0
  %3 = load ptr, ptr %scores, align 8, !tbaa !8
  %arrayidx.i.1 = getelementptr inbounds float, ptr %3, i64 %indvars.iv.next
  %4 = load float, ptr %arrayidx.i.1, align 4
  ret float %4
}

define float @"165"(ptr %arrayidx.i.1, ptr %biggest_score, ptr %scores, i32 %cond, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load float, ptr %arrayidx.i.1, align 4, !tbaa !10
  %4 = load float, ptr %biggest_score, align 4, !tbaa !10
  %div9.1 = fdiv float %3, %4
  %5 = load ptr, ptr %scores, align 8, !tbaa !8
  %6 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %7 = sub i32 %cond, %6
  %8 = zext i32 %7 to i64
  %9 = add nuw nsw i64 %8, %0
  %n.vec = and i64 %9, %1
  %ind.end = add nsw i64 %n.vec, %2
  %indvars.iv.next = add nsw i64 %ind.end, %0
  %arrayidx.i.12 = getelementptr inbounds float, ptr %5, i64 %indvars.iv.next
  store float %div9.1, ptr %arrayidx.i.1, align 4, !tbaa !10
  ret float %div9.1
}

define i64 @"166"(ptr %__first.addr.033.i.i, ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.033.i.i, align 4
  store i64 %agg.tmp.sroa.0.0.copyload.i.i.i, ptr %incdec.ptr13.i.i.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define ptr @"167"(ptr %verts_at_depth.sroa.0.1.lcssa, ptr %cond.i65.i, ptr %arrayidx.i451, i32 %0, i64 %sub.ptr.rhs.cast.i508, i64 %1, i32 %2, i64 %3) {
bb:
  %4 = load i32, ptr %arrayidx.i451, align 4, !tbaa !0
  %add91 = add nuw nsw i32 %4, %0
  %conv92 = sext i32 %add91 to i64
  %add.ptr37.i = getelementptr inbounds %"class.std::vector.26", ptr %cond.i65.i, i64 %conv92
  %sub.ptr.lhs.cast.i507 = ptrtoint ptr %add.ptr37.i to i64
  %sub.ptr.sub.i509 = sub i64 %sub.ptr.lhs.cast.i507, %sub.ptr.rhs.cast.i508
  %sub.ptr.div.i510 = sdiv exact i64 %sub.ptr.sub.i509, %1
  %5 = trunc i64 %sub.ptr.div.i510 to i32
  %depth.0832 = add i32 %5, %2
  %conv120 = zext i32 %depth.0832 to i64
  %add.ptr.i523 = getelementptr inbounds %"class.std::vector.26", ptr %verts_at_depth.sroa.0.1.lcssa, i64 %conv120
  %_M_finish.i524 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i523, i64 %3, i32 1
  %6 = load ptr, ptr %_M_finish.i524, align 8, !tbaa !4
  ret ptr %6
}

define ptr @"168"(ptr %el, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1) {
bb:
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !47
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre711, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !45
  ret ptr %add.ptr.i464
}

define i32 @"169"(ptr %arrayidx67) {
bb:
  %0 = load ptr, ptr %arrayidx67, align 8, !tbaa !4
  %1 = load i32, ptr %0, align 4, !tbaa !0
  ret i32 %1
}

define i32 @"170"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %el, align 8, !tbaa !47
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %ind.end
  %add.ptr.sroa_idx = getelementptr inbounds i8, ptr %add.ptr, i64 %2
  %6 = load i32, ptr %add.ptr.sroa_idx, align 4
  ret i32 %6
}

define i32 @"171"(ptr %arrayidx.i399, i32 %0, ptr %depths, ptr %__begin3.0814) {
bb:
  %1 = load i32, ptr %arrayidx.i399, align 4, !tbaa !0
  %add = add nsw i32 %1, %0
  %.pre = load ptr, ptr %depths, align 8, !tbaa !18
  %2 = load i32, ptr %__begin3.0814, align 4, !tbaa !0
  %conv34 = sext i32 %2 to i64
  %arrayidx.i398 = getelementptr inbounds i32, ptr %.pre, i64 %conv34
  store i32 %add, ptr %arrayidx.i398, align 4, !tbaa !0
  ret i32 %add
}

define ptr @"172"(ptr %cond.i31.i.i.i, i64 %.sroa.speculated.i.i.i.i, ptr %_M_finish.i38, i64 %0, i64 %sub.ptr.rhs.cast.i, i64 %1, i64 %sub.ptr.div.i, i1 %cmp9.i.i.i.i, i64 %2, i64 %add.i.i.i.i, ptr %_M_end_of_storage.i.i) {
bb:
  %3 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !59
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %3, i64 %0
  %sub.ptr.lhs.cast.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i2 = ashr exact i64 %sub.ptr.sub.i, %1
  %add.i.i.i.i4 = add i64 %.sroa.speculated.i.i.i.i, %sub.ptr.div.i
  %cmp7.i.i.i.i = icmp ult i64 %add.i.i.i.i, %sub.ptr.div.i
  %or.cond.i.i.i.i = or i1 %cmp7.i.i.i.i, %cmp9.i.i.i.i
  %cond.i.i.i.i = select i1 %or.cond.i.i.i.i, i64 %2, i64 %add.i.i.i.i
  %add.ptr19.i.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %cond.i31.i.i.i, i64 %cond.i.i.i.i
  store ptr %add.ptr19.i.i.i, ptr %_M_end_of_storage.i.i, align 8, !tbaa !106
  ret ptr %add.ptr19.i.i.i
}

define i64 @"173"(ptr %arrayidx.i140, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i143, i64 %4, i64 %5, i64 %xor4.i146, i64 %6, i64 %xor7.i149, ptr %num_nodes_, i64 %7, ptr %arrayidx.i72, i64 %xor.i75, i64 %xor4.i78, i64 %xor7.i81, i32 %8, ptr %el, ptr %.omp.lb) {
bb:
  %9 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %mul = shl i64 %9, %6
  %10 = load ptr, ptr %el, align 8, !tbaa !47
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %10, i64 %mul
  %11 = load i64, ptr %arrayidx.i72, align 8, !tbaa !12
  %shr.i73 = lshr i64 %11, %0
  %and.i74 = and i64 %shr.i73, %1
  %xor.i752 = xor i64 %and.i74, %11
  %shl.i76 = shl i64 %xor.i75, %2
  %and3.i77 = and i64 %shl.i76, %3
  %xor4.i784 = xor i64 %and3.i77, %xor.i75
  %shl5.i79 = shl i64 %xor4.i78, %4
  %and6.i80 = and i64 %shl5.i79, %5
  %xor7.i816 = xor i64 %and6.i80, %xor4.i78
  %shr8.i82 = lshr i64 %xor7.i81, %6
  %xor9.i83 = xor i64 %shr8.i82, %xor7.i81
  %conv.i = trunc i64 %xor9.i83 to i32
  %rem.i = urem i32 %conv.i, %8
  %ref.tmp16.sroa.0.0.insert.ext = zext i32 %rem.i to i64
  %12 = load i64, ptr %num_nodes_, align 8, !tbaa !107
  %13 = trunc i64 %12 to i32
  %14 = load i64, ptr %arrayidx.i140, align 8, !tbaa !12
  %shr.i141 = lshr i64 %14, %0
  %and.i142 = and i64 %shr.i141, %1
  %xor.i1438 = xor i64 %and.i142, %14
  %shl.i144 = shl i64 %xor.i143, %2
  %and3.i145 = and i64 %shl.i144, %3
  %xor4.i14610 = xor i64 %and3.i145, %xor.i143
  %shl5.i147 = shl i64 %xor4.i146, %4
  %and6.i148 = and i64 %shl5.i147, %5
  %xor7.i14912 = xor i64 %and6.i148, %xor4.i146
  %shr8.i150 = lshr i64 %xor7.i149, %6
  %xor9.i151 = xor i64 %shr8.i150, %xor7.i149
  %conv7.i54 = trunc i64 %xor9.i151 to i32
  %rem.i52 = urem i32 %conv7.i54, %8
  %ref.tmp16.sroa.4.0.insert.ext = zext i32 %rem.i52 to i64
  %ref.tmp16.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp16.sroa.4.0.insert.ext, %7
  %ref.tmp16.sroa.0.0.insert.insert = or i64 %ref.tmp16.sroa.4.0.insert.shift, %ref.tmp16.sroa.0.0.insert.ext
  store i64 %ref.tmp16.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp16.sroa.0.0.insert.insert
}

define i32 @"174"(ptr %e.sroa.5.0..sroa_idx, ptr %0, ptr %offsets, ptr %add.ptr, i64 %1) {
bb:
  %e.sroa.5.0.copyload = load i32, ptr %e.sroa.5.0..sroa_idx, align 4, !tbaa.struct !108
  %2 = load ptr, ptr %offsets, align 8, !tbaa !14
  %e.sroa.0.0.copyload = load i32, ptr %add.ptr, align 4, !tbaa.struct !78
  %conv = sext i32 %e.sroa.0.0.copyload to i64
  %arrayidx.i = getelementptr inbounds i64, ptr %2, i64 %conv
  %3 = atomicrmw add ptr %arrayidx.i, i64 %1 seq_cst, align 8
  %4 = load ptr, ptr %0, align 8, !tbaa !4
  %arrayidx = getelementptr inbounds i32, ptr %4, i64 %3
  store i32 %e.sroa.5.0.copyload, ptr %arrayidx, align 4, !tbaa !0
  ret i32 %e.sroa.5.0.copyload
}

define i64 @"175"(ptr %offsets, ptr %num_nodes_.i, i32 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !14
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !67
  %3 = trunc i64 %2 to i32
  %n184.0657 = add i32 %3, %0
  %4 = zext i32 %n184.0657 to i64
  %arrayidx.i540 = getelementptr inbounds i64, ptr %1, i64 %4
  %5 = load i64, ptr %arrayidx.i540, align 8, !tbaa !12
  ret i64 %5
}

define i64 @"176"(ptr %_M_string_length.i.i.i, i64 %call, ptr %__dnew.i.i.i) {
bb:
  %0 = load i64, ptr %_M_string_length.i.i.i, align 8, !tbaa !73, !noalias !109
  %sub.i.i.i = sub i64 %0, %call
  store i64 %sub.i.i.i, ptr %__dnew.i.i.i, align 8, !tbaa !12, !noalias !109
  ret i64 %sub.i.i.i
}

define i64 @"177"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !67
  %sext = shl i64 %1, %0
  %conv202 = ashr exact i64 %sext, %0
  %2 = load ptr, ptr %offsets, align 8, !tbaa !14
  %arrayidx.i542 = getelementptr inbounds i64, ptr %2, i64 %conv202
  %3 = load i64, ptr %arrayidx.i542, align 8, !tbaa !12
  ret i64 %3
}

define i64 @"178"(ptr %el, i64 %0, i64 %1) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr13.i.i.i.i, i64 %1
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.030.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i32 @"179"(ptr %call171, ptr %arrayidx.i548, ptr %arrayidx.i549, ptr %arrayidx.i550, i64 %sub.ptr.rhs.cast.i.i.i.i552, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i550, align 8, !tbaa !12
  %add.ptr271 = getelementptr inbounds i32, ptr %call171, i64 %2
  %sub.ptr.lhs.cast.i.i.i.i551 = ptrtoint ptr %add.ptr271 to i64
  %sub.ptr.sub.i.i.i.i553 = sub i64 %sub.ptr.lhs.cast.i.i.i.i551, %sub.ptr.rhs.cast.i.i.i.i552
  %sub.ptr.div.i.i.i.i561 = lshr exact i64 %sub.ptr.sub.i.i.i.i553, %0
  %shr.i.i565 = lshr i64 %sub.ptr.div.i.i.i.i561, %1
  %3 = load i32, ptr %arrayidx.i549, align 4, !tbaa !0
  %idx.ext = sext i32 %3 to i64
  %4 = load i64, ptr %arrayidx.i548, align 8, !tbaa !12
  %add.ptr263 = getelementptr inbounds i32, ptr %call171, i64 %4
  %add.ptr266 = getelementptr inbounds i32, ptr %add.ptr263, i64 %idx.ext
  %incdec.ptr4.sink.i.i.i.i569 = getelementptr inbounds i32, ptr %add.ptr266, i64 %shr.i.i565
  %5 = load i32, ptr %incdec.ptr4.sink.i.i.i.i569, align 4, !tbaa !0
  ret i32 %5
}

define i32 @"180"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %incdec.ptr122.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %1 = load i32, ptr %incdec.ptr122.i.i, align 4, !tbaa !53
  ret i32 %1
}

define float @"181"(float %delta_u.0.lcssa, ptr %deltas, ptr %add.ptr) {
bb:
  %0 = load i32, ptr %add.ptr, align 4, !tbaa !0, !llvm.access.group !72
  %idxprom.i6.i.i = sext i32 %0 to i64
  %1 = load ptr, ptr %deltas, align 8, !tbaa !8, !llvm.access.group !72
  %arrayidx.i63 = getelementptr inbounds float, ptr %1, i64 %idxprom.i6.i.i
  store float %delta_u.0.lcssa, ptr %arrayidx.i63, align 4, !tbaa !10, !llvm.access.group !72
  ret float %delta_u.0.lcssa
}

define ptr @"182"(ptr %verts_at_depth.sroa.0.5, ptr %arrayidx.i466, i64 %0, i32 %1) {
bb:
  %2 = load i32, ptr %arrayidx.i466, align 4, !tbaa !0
  %conv98 = sext i32 %2 to i64
  %add.ptr.i467 = getelementptr inbounds %"class.std::vector.26", ptr %verts_at_depth.sroa.0.5, i64 %conv98
  %_M_finish.i468 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i467, i64 %0, i32 1
  %3 = load ptr, ptr %_M_finish.i468, align 8, !tbaa !4
  ret ptr %3
}

define i32 @"185"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !0
  %1 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !0
  %cmp.i.i.i.i.i = icmp slt i32 %1, %0
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add.ptr3.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i.i.i.i
  %2 = load i32, ptr %add.ptr3.i.i.i.i, align 4, !tbaa !0
  ret i32 %2
}

define i32 @"186"(ptr %n_start.0.in, i64 %0, i64 %1) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds i32, ptr %incdec.ptr12.i.i.i.i, i64 %1
  %2 = load i32, ptr %__first.addr.030.i.i, align 4, !tbaa !0
  ret i32 %2
}

define <2 x i64> @"187"(ptr %0, <2 x i64> %1, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %7) {
bb:
  %wide.load = load <2 x i64>, ptr %0, align 8, !tbaa !12
  %8 = and <2 x i64> %wide.load, %3
  %9 = icmp eq <2 x i64> %8, %5
  %10 = select <2 x i1> %9, <2 x i64> %5, <2 x i64> %6
  %11 = and <2 x i64> %wide.load, %1
  %12 = shufflevector <2 x i64> %wide.load, <2 x i64> %wide.load, <2 x i32> <i32 1, i32 2>
  %13 = and <2 x i64> %12, %2
  %14 = or <2 x i64> %11, %13
  %15 = lshr exact <2 x i64> %14, %3
  %wide.load18 = load <2 x i64>, ptr %4, align 8, !tbaa !12
  %16 = xor <2 x i64> %15, %wide.load18
  %17 = xor <2 x i64> %16, %10
  store <2 x i64> %17, ptr %7, align 8, !tbaa !12
  ret <2 x i64> %17
}

define i64 @"188"(ptr %__first.addr.033.i.i, ptr %new_range.i.i, i64 %0) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.033.i.i, align 4
  store i64 %agg.tmp.sroa.0.0.copyload.i.i.i, ptr %incdec.ptr13.i.i.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i8 @"189"(i8 %0, ptr %ref.tmp, ptr %__dnew.i.i.i) {
bb:
  %1 = load i64, ptr %__dnew.i.i.i, align 8, !tbaa !12, !noalias !100
  %2 = load ptr, ptr %ref.tmp, align 8, !tbaa !38, !alias.scope !100
  %arrayidx.i.i.i.i = getelementptr inbounds i8, ptr %2, i64 %1
  store i8 %0, ptr %arrayidx.i.i.i.i, align 1, !tbaa !42
  ret i8 %0
}

define i32 @"190"(ptr %__first, ptr %add.ptr.i, ptr %add.ptr2.i, i64 %sub1.i, i64 %mul.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr2.i, align 4, !tbaa !0
  %3 = load i32, ptr %add.ptr.i, align 4, !tbaa !0
  %cmp.i.i = icmp slt i32 %3, %2
  %spec.select.i = select i1 %cmp.i.i, i64 %sub1.i, i64 %mul.i
  %__parent.020.in.i.i = add nsw i64 %spec.select.i, %0
  %__parent.020.i.i = sdiv i64 %__parent.020.in.i.i, %1
  %add.ptr.i.i = getelementptr inbounds i32, ptr %__first, i64 %__parent.020.i.i
  %4 = load i32, ptr %add.ptr.i.i, align 4, !tbaa !0
  ret i32 %4
}

define i64 @"191"(ptr %arrayidx.i25, i64 %0, ptr %arrayidx.i23, ptr %el, ptr %.omp.lb) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %2 = load ptr, ptr %el, align 8, !tbaa !47
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %1
  %3 = load i32, ptr %arrayidx.i23, align 4, !tbaa !0
  %ref.tmp.sroa.0.0.insert.ext = zext i32 %3 to i64
  %4 = load i32, ptr %arrayidx.i25, align 4, !tbaa !0
  %ref.tmp.sroa.4.0.insert.ext = zext i32 %4 to i64
  %ref.tmp.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp.sroa.4.0.insert.ext, %0
  %ref.tmp.sroa.0.0.insert.insert = or i64 %ref.tmp.sroa.4.0.insert.shift, %ref.tmp.sroa.0.0.insert.ext
  store i64 %ref.tmp.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp.sroa.0.0.insert.insert
}

define i64 @"192"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !67
  %3 = and i64 %2, %0
  %sub.prol = add nuw i64 %3, %0
  %conv34.prol = and i64 %sub.prol, %0
  %arrayidx.i492.prol = getelementptr inbounds i64, ptr %1, i64 %conv34.prol
  %4 = load i64, ptr %arrayidx.i492.prol, align 8, !tbaa !12
  ret i64 %4
}

define ptr @"193"(ptr %el, ptr %0, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !47
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !45
  ret ptr %add.ptr.i464
}

define float @"194"(ptr %arrayidx.i.1, ptr %call5.i.i.i.i4.i.i79, ptr %num_nodes_.i, i64 %0, i64 %1, i64 %2, i32 %3) {
bb:
  %4 = load i64, ptr %num_nodes_.i, align 8, !tbaa !43
  %5 = and i64 %4, %0
  %n.mod.vf = and i64 %4, %1
  %n.vec = sub nsw i64 %5, %n.mod.vf
  %indvars.iv.next = add nuw nsw i64 %n.vec, %2
  %second3.i.1 = getelementptr inbounds %"struct.std::pair", ptr %call5.i.i.i.i4.i.i79, i64 %indvars.iv.next, i32 1
  %6 = load float, ptr %arrayidx.i.1, align 4, !tbaa !10
  store float %6, ptr %second3.i.1, align 4, !tbaa !82
  ret float %6
}

define i64 @"195"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !79
  %inc.i71 = add nuw nsw i64 %1, %0
  %inc.i207 = add nuw nsw i64 %inc.i71, %0
  store i64 %inc.i207, ptr %_M_p.i.i.i, align 8, !tbaa !79
  ret i64 %inc.i207
}

define i32 @"196"(ptr %end_size_.i.i583, ptr %offsets, i64 %0, ptr %length.i581) {
bb:
  %1 = load ptr, ptr %end_size_.i.i583, align 8, !tbaa !81
  %sub.ptr.lhs.cast.i.i584 = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %offsets, align 8, !tbaa !14
  %sub.ptr.rhs.cast.i.i585 = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i586 = sub i64 %sub.ptr.lhs.cast.i.i584, %sub.ptr.rhs.cast.i.i585
  %3 = lshr exact i64 %sub.ptr.sub.i.i586, %0
  %conv.i587 = trunc i64 %3 to i32
  store i32 %conv.i587, ptr %length.i581, align 4, !tbaa !0
  ret i32 %conv.i587
}

define <2 x i32> @"197"(ptr %degrees, ptr %.omp.lb, i64 %0, i64 %index, i64 %1) {
bb:
  %2 = load ptr, ptr %degrees, align 8, !tbaa !18
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %mul12 = shl i64 %3, %0
  %offset.idx = add i64 %mul12, %index
  %4 = getelementptr inbounds i32, ptr %2, i64 %offset.idx
  %5 = getelementptr inbounds i32, ptr %4, i64 %1
  %wide.load42 = load <2 x i32>, ptr %5, align 4, !tbaa !0
  ret <2 x i32> %wide.load42
}

define ptr @"198"(ptr %call.i.i, ptr %num_nodes_.i, ptr %end_size_.i.i) {
bb:
  %0 = load i64, ptr %num_nodes_.i, align 8, !tbaa !43
  %add.ptr.i.i = getelementptr inbounds i32, ptr %call.i.i, i64 %0
  store ptr %add.ptr.i.i, ptr %end_size_.i.i, align 8, !tbaa !16
  ret ptr %add.ptr.i.i
}

define float @"199"(ptr %_M_finish.i38, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !59
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %2, i64 %0
  %add.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %incdec.ptr.i.i, i64 %1
  %3 = load float, ptr %add.ptr.i.i, align 4, !tbaa !105
  ret float %3
}

define ptr @"200"(ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %0) {
bb:
  %1 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %agg.result, align 8, !tbaa !47
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = ashr exact i64 %sub.ptr.sub.i12.i.i, %0
  %3 = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr.i.i149 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div.i13.i.i
  store ptr %add.ptr.i.i149, ptr %end_size_.i.i, align 8, !tbaa !45
  ret ptr %add.ptr.i.i149
}

define i64 @"201"(ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %__i.018.i, i64 %add.i, i64 %inc.i, ptr %arrayidx7.i.1) {
bb:
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %add10 = add i64 %5, %0
  %rem.i.i.i = and i64 %add10, %1
  %shr.i = lshr i64 %rem.i.i.i, %2
  %xor.i = xor i64 %shr.i, %3
  %mul.i = mul nuw nsw i64 %xor.i, %4
  %add.i2 = add nuw i64 %mul.i, %__i.018.i
  %rem.i.i17.i = and i64 %add.i, %1
  %shr.i.1 = lshr i64 %rem.i.i17.i, %2
  %xor.i.1 = xor i64 %shr.i.1, %add.i
  %mul.i.1 = mul i64 %xor.i.1, %4
  %add.i.1 = add i64 %mul.i.1, %inc.i
  %rem.i.i17.i.1 = and i64 %add.i.1, %1
  store i64 %rem.i.i17.i.1, ptr %arrayidx7.i.1, align 8, !tbaa !12
  ret i64 %rem.i.i17.i.1
}

define ptr @"202"(ptr %new_range.i.i, ptr %end_capacity_.i.i, ptr %agg.result, i64 %0) {
bb:
  %1 = load ptr, ptr %end_capacity_.i.i, align 8, !tbaa !71
  %sub.ptr.lhs.cast.i7.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %agg.result, align 8, !tbaa !47
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i9.i = sub i64 %sub.ptr.lhs.cast.i7.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.sub.i9.fr.i = freeze i64 %sub.ptr.sub.i9.i
  %mul.i = ashr exact i64 %sub.ptr.sub.i9.fr.i, %0
  %3 = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %mul.i
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i, align 8, !tbaa !71
  ret ptr %add.ptr6.i.i
}

define i64 @"203"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %incdec.ptr.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i = load i64, ptr %incdec.ptr.i.i.i.i, align 4, !tbaa.struct !78
  ret i64 %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i
}

define <8 x i32> @"204"(ptr %el, ptr %.omp.lb, i64 %index) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %offset.idx = add i64 %0, %index
  %1 = load ptr, ptr %el, align 8, !tbaa !47
  %2 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %offset.idx
  %wide.vec = load <8 x i32>, ptr %2, align 4
  ret <8 x i32> %wide.vec
}

define i32 @"205"(i32 %0, ptr %cond.i31.i.i491, ptr %_M_finish.i468, ptr %add.ptr.i467, i64 %1) {
bb:
  %2 = load ptr, ptr %_M_finish.i468, align 8, !tbaa !4
  %sub.ptr.lhs.cast.i.i.i.i475 = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %add.ptr.i467, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i.i.i476 = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i.i.i.i477 = sub i64 %sub.ptr.lhs.cast.i.i.i.i475, %sub.ptr.rhs.cast.i.i.i.i476
  %sub.ptr.div.i.i.i.i480 = ashr exact i64 %sub.ptr.sub.i.i.i.i477, %1
  %add.ptr.i.i492 = getelementptr inbounds i32, ptr %cond.i31.i.i491, i64 %sub.ptr.div.i.i.i.i480
  store i32 %0, ptr %add.ptr.i.i492, align 4, !tbaa !0
  ret i32 %0
}

define ptr @"206"(ptr %_ZSt4cout, ptr %vbase.offset.ptr.i, i64 %0, i32 %1) {
bb:
  %vbase.offset.i = load i64, ptr %vbase.offset.ptr.i, align 8
  %add.ptr.i = getelementptr inbounds i8, ptr %_ZSt4cout, i64 %vbase.offset.i
  %_M_ctype.i.i = getelementptr inbounds %"class.std::basic_ios", ptr %add.ptr.i, i64 %0, i32 5
  %2 = load ptr, ptr %_M_ctype.i.i, align 8, !tbaa !112
  ret ptr %2
}

define float @"207"(ptr %0, ptr %incdec.ptr14.i.i, ptr %scores, i64 %1) {
bb:
  %2 = load ptr, ptr %scores, align 8, !tbaa !8
  %incdec.ptr11.i.i = getelementptr inbounds float, ptr %0, i64 %1
  %.pre.i.i = load float, ptr %0, align 4, !tbaa !10
  %3 = load float, ptr %incdec.ptr14.i.i, align 4, !tbaa !10
  %cmp.i.i.i = fcmp olt float %.pre.i.i, %3
  %spec.select.i.i = select i1 %cmp.i.i.i, ptr %incdec.ptr11.i.i, ptr %0
  %4 = load float, ptr %spec.select.i.i, align 4, !tbaa !10
  ret float %4
}

define ptr @"208"(ptr %_M_finish.i.i, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !4
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %2, i64 %0, i32 2
  store ptr %3, ptr %2, align 8, !tbaa !88
  ret ptr %3
}

define i32 @"209"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !47
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %ind.end
  %5 = load i32, ptr %add.ptr, align 4
  ret i32 %5
}

define i64 @"210"(i64 %local_total.040, ptr %arrayidx.i36, ptr %prefix, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %mul14 = shl i64 %1, %0
  %2 = load ptr, ptr %prefix, align 8
  %arrayidx.i35 = getelementptr inbounds i64, ptr %2, i64 %mul14
  %3 = load i32, ptr %arrayidx.i36, align 4, !tbaa !0
  %conv = sext i32 %3 to i64
  %add20 = add nsw i64 %local_total.040, %conv
  store i64 %add20, ptr %arrayidx.i35, align 8, !tbaa !12
  ret i64 %add20
}

define ptr @"211"(ptr %out_index_.i, ptr %add.ptr) {
bb:
  %0 = load ptr, ptr %out_index_.i, align 8, !tbaa !119, !noalias !120, !llvm.access.group !66
  %1 = load i32, ptr %add.ptr, align 4, !tbaa !0, !llvm.access.group !66
  %idxprom.i6.i.i = sext i32 %1 to i64
  %arrayidx.i7.i.i = getelementptr inbounds ptr, ptr %0, i64 %idxprom.i6.i.i
  %2 = load ptr, ptr %arrayidx.i7.i.i, align 8, !tbaa !4, !llvm.access.group !66
  ret ptr %2
}

define float @"212"(ptr %arrayidx.i.prol, ptr %call5.i.i.i.i4.i.i79, ptr %num_nodes_.i, i64 %0, i64 %1, i32 %2) {
bb:
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !43
  %4 = and i64 %3, %0
  %n.mod.vf = and i64 %3, %1
  %n.vec = sub nsw i64 %4, %n.mod.vf
  %second3.i.prol = getelementptr inbounds %"struct.std::pair", ptr %call5.i.i.i.i4.i.i79, i64 %n.vec, i32 1
  %5 = load float, ptr %arrayidx.i.prol, align 4, !tbaa !10
  store float %5, ptr %second3.i.prol, align 4, !tbaa !82
  ret float %5
}

define i8 @"213"(ptr %arrayidx17.i.i, ptr %ref.tmp, i64 %conv5.i) {
bb:
  %0 = load ptr, ptr %ref.tmp, align 8, !tbaa !38, !alias.scope !123
  %arrayidx.i.i = getelementptr inbounds i8, ptr %0, i64 %conv5.i
  %1 = load i8, ptr %arrayidx17.i.i, align 2, !tbaa !42, !noalias !123
  store i8 %1, ptr %arrayidx.i.i, align 1, !tbaa !42
  ret i8 %1
}

define ptr @"214"(ptr %neighs, ptr %arrayidx.i, ptr %index, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %arrayidx.i, align 8, !tbaa !12
  %1 = load ptr, ptr %neighs, align 8, !tbaa !4
  %add.ptr = getelementptr inbounds i32, ptr %1, i64 %0
  %2 = load ptr, ptr %index, align 8, !tbaa !4
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %4 = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds ptr, ptr %2, i64 %4
  store ptr %add.ptr, ptr %arrayidx, align 8, !tbaa !4
  ret ptr %add.ptr
}

define float @"215"(float %0, ptr %arrayidx.i.1, ptr %arrayidx.i, float %1, ptr %biggest_score4) {
bb:
  %2 = load float, ptr %arrayidx.i, align 4
  %3 = load float, ptr %arrayidx.i.1, align 4
  %cmp.i.1 = fcmp olt float %0, %3
  %4 = select i1 %cmp.i.1, float %3, float %0
  %cmp.i = fcmp olt float %4, %2
  %5 = select i1 %cmp.i, float %2, float %1
  store float %0, ptr %biggest_score4, align 4, !tbaa !10
  ret float %0
}

define i32 @"216"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.0649, ptr %arrayidx.i536) {
bb:
  %1 = load i64, ptr %arrayidx.i542, align 8, !tbaa !12
  %i200.0 = add nsw i64 %1, %0
  %2 = load i32, ptr %arrayidx.i536, align 4, !tbaa !0
  %conv155 = sext i32 %2 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %sub211 = sub nsw i64 %i200.0, %add156
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %3 = load i32, ptr %arrayidx212, align 4, !tbaa !0
  ret i32 %3
}

define i64 @"217"(ptr %arrayidx.i535, i64 %total_missing_inv.0649, ptr %arrayidx.i536, ptr %offsets, i64 %indvars.iv691) {
bb:
  %0 = load i64, ptr %arrayidx.i535, align 8, !tbaa !12
  %1 = load i32, ptr %arrayidx.i536, align 4, !tbaa !0
  %conv155 = sext i32 %1 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %add152 = add nsw i64 %0, %add156
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !14
  %arrayidx.i5352 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %indvars.iv691
  store i64 %add152, ptr %arrayidx.i535, align 8, !tbaa !12
  ret i64 %add152
}

define ptr @"218"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !47
  %sub.ptr.rhs.cast = ptrtoint ptr %2 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !71
  ret ptr %add.ptr6.i.i
}

define i64 @"219"(ptr %_M_p.i, i64 %0, ptr %udist_, i64 %1, i32 %2) {
bb:
  %.pre = load i64, ptr %_M_p.i, align 8, !tbaa !92
  %inc.i = add nuw nsw i64 %.pre, %0
  %3 = load ptr, ptr %udist_, align 8, !tbaa !74
  %_M_p.i2 = getelementptr inbounds %"class.std::mersenne_twister_engine", ptr %3, i64 %1, i32 1
  store i64 %inc.i, ptr %_M_p.i, align 8, !tbaa !92
  ret i64 %inc.i
}

define ptr @"220"(ptr %verts_at_depth.sroa.0.1.lcssa, ptr %cond.i65.i, ptr %arrayidx.i451, i32 %0, i64 %sub.ptr.rhs.cast.i508, i64 %1, i32 %2) {
bb:
  %3 = load i32, ptr %arrayidx.i451, align 4, !tbaa !0
  %add91 = add nuw nsw i32 %3, %0
  %conv92 = sext i32 %add91 to i64
  %add.ptr37.i = getelementptr inbounds %"class.std::vector.26", ptr %cond.i65.i, i64 %conv92
  %sub.ptr.lhs.cast.i507 = ptrtoint ptr %add.ptr37.i to i64
  %sub.ptr.sub.i509 = sub i64 %sub.ptr.lhs.cast.i507, %sub.ptr.rhs.cast.i508
  %sub.ptr.div.i510 = sdiv exact i64 %sub.ptr.sub.i509, %1
  %4 = trunc i64 %sub.ptr.div.i510 to i32
  %depth.0832 = add i32 %4, %2
  %conv120 = zext i32 %depth.0832 to i64
  %add.ptr.i523 = getelementptr inbounds %"class.std::vector.26", ptr %verts_at_depth.sroa.0.1.lcssa, i64 %conv120
  %5 = load ptr, ptr %add.ptr.i523, align 8, !tbaa !4
  ret ptr %5
}

define i32 @"221"(ptr %arrayidx212, ptr %call171, i64 %tail_index.0660, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %0) {
bb:
  %1 = load i32, ptr %arrayidx212, align 4, !tbaa !0
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !0
  %.pre731 = sext i32 %.pre717 to i64
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !12
  %3 = load i32, ptr %arrayidx.i541, align 4, !tbaa !0
  %conv198 = sext i32 %3 to i64
  %4 = load i64, ptr %arrayidx.i540, align 8, !tbaa !12
  %add199 = add nsw i64 %4, %conv198
  %5 = sub i64 %2, %add199
  %n.vec793 = and i64 %5, %0
  %ind.end796 = sub i64 %tail_index.0660, %n.vec793
  %sub226 = sub nsw i64 %ind.end796, %.pre731
  %arrayidx213 = getelementptr inbounds i32, ptr %call171, i64 %sub226
  store i32 %1, ptr %arrayidx213, align 4, !tbaa !0
  ret i32 %1
}

define i32 @"222"(ptr %_M_finish.i.i, ptr %depth_index, i64 %0, i32 %1, ptr %d) {
bb:
  %2 = load ptr, ptr %depth_index, align 8, !tbaa !126
  %sub.ptr.rhs.cast.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !127
  %sub.ptr.lhs.cast.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %4 = lshr exact i64 %sub.ptr.sub.i, %0
  %5 = trunc i64 %4 to i32
  %conv69 = add i32 %5, %1
  store i32 %conv69, ptr %d, align 4, !tbaa !0
  ret i32 %conv69
}

define double @"223"(ptr %path_counts.sroa.0.1741879, ptr %it.sroa.0.0817) {
bb:
  %0 = load i32, ptr %it.sroa.0.0817, align 4, !tbaa !0
  %idxprom.i6.i.i = sext i32 %0 to i64
  %add.ptr.i441 = getelementptr inbounds double, ptr %path_counts.sroa.0.1741879, i64 %idxprom.i6.i.i
  %1 = load double, ptr %add.ptr.i441, align 8, !tbaa !89
  ret double %1
}

define i32 @"224"(ptr %el, i64 %0, i32 %1) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %v.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0, i32 1
  %2 = load i32, ptr %v.i.i.i.i, align 4
  ret i32 %2
}

define i64 @"225"(ptr %this, i64 %0, ptr %_M_p) {
bb:
  %1 = load i64, ptr %_M_p, align 8, !tbaa !92
  %arrayidx = getelementptr inbounds [312 x i64], ptr %this, i64 %0, i64 %1
  %2 = load i64, ptr %arrayidx, align 8, !tbaa !12
  ret i64 %2
}

define <2 x i64> @"226"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %.omp.lb, i64 %3, i64 %4, i64 %5, <2 x i64> %6, <2 x i64> %7, ptr %8, <2 x i64> %9, <2 x i64> %10, ptr %11) {
bb:
  %wide.load91 = load <2 x i64>, ptr %0, align 8, !tbaa !12
  %12 = and <2 x i64> %wide.load91, %1
  %13 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %add8 = add i64 %13, %3
  %rem.i.i.i = and i64 %add8, %4
  %vector.recur.init89 = insertelement <2 x i64> %2, i64 %rem.i.i.i, i64 %5
  %14 = shufflevector <2 x i64> %vector.recur.init89, <2 x i64> %wide.load91, <2 x i32> <i32 1, i32 2>
  %15 = and <2 x i64> %14, %6
  %16 = or <2 x i64> %12, %15
  %17 = lshr exact <2 x i64> %16, %7
  %wide.load92 = load <2 x i64>, ptr %8, align 8, !tbaa !12
  %18 = xor <2 x i64> %17, %wide.load92
  %19 = and <2 x i64> %wide.load91, %7
  %20 = icmp eq <2 x i64> %19, %9
  %21 = select <2 x i1> %20, <2 x i64> %9, <2 x i64> %10
  %22 = xor <2 x i64> %18, %21
  store <2 x i64> %22, ptr %11, align 8, !tbaa !12
  ret <2 x i64> %22
}

define <2 x i64> @"227"(ptr %0, ptr %offsets, ptr %num_nodes_.i, i64 %1, i64 %index770, i64 %2) {
bb:
  %wide.load = load <2 x i64>, ptr %0, align 8, !tbaa !12
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !67
  %4 = and i64 %3, %1
  %offset.idx = sub i64 %4, %index770
  %5 = load ptr, ptr %offsets, align 8
  %6 = getelementptr inbounds i64, ptr %5, i64 %offset.idx
  %7 = getelementptr inbounds i64, ptr %6, i64 %2
  store <2 x i64> %wide.load, ptr %7, align 8, !tbaa !12
  ret <2 x i64> %wide.load
}

define <4 x float> @"228"(ptr %0, <4 x float> %1, ptr %biggest_score, i64 %2, ptr %scores, i64 %index, ptr %.omp.lb) {
bb:
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %4 = sext i32 %3 to i64
  %offset.idx = add i64 %index, %4
  %5 = load ptr, ptr %scores, align 8, !tbaa !8
  %6 = getelementptr inbounds float, ptr %5, i64 %offset.idx
  %wide.load = load <4 x float>, ptr %0, align 4, !tbaa !10, !alias.scope !48, !noalias !51
  %7 = load float, ptr %biggest_score, align 4, !tbaa !10, !alias.scope !51
  %broadcast.splatinsert = insertelement <4 x float> %1, float %7, i64 %2
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> %1, <4 x i32> zeroinitializer
  %8 = fdiv <4 x float> %wide.load, %broadcast.splat
  store <4 x float> %8, ptr %0, align 4, !tbaa !10, !alias.scope !48, !noalias !51
  ret <4 x float> %8
}

define ptr @"229"(ptr %new_range.i.i, ptr %end_size_.i, ptr %el, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !47
  %sub.ptr.rhs.cast = ptrtoint ptr %1 to i64
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !71
  ret ptr %add.ptr6.i.i
}

define ptr @"230"(ptr %call.i5155, ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, ptr %end_size_.i53) {
bb:
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i47 = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %degrees, align 8, !tbaa !18
  %sub.ptr.rhs.cast.i48 = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i49 = sub i64 %sub.ptr.lhs.cast.i47, %sub.ptr.rhs.cast.i48
  %sub.ptr.div.i50 = ashr exact i64 %sub.ptr.sub.i49, %0
  %add13 = add nsw i64 %sub.ptr.div.i50, %1
  %add.ptr.i52 = getelementptr inbounds i64, ptr %call.i5155, i64 %add13
  store ptr %add.ptr.i52, ptr %end_size_.i53, align 8, !tbaa !81
  ret ptr %add.ptr.i52
}

define ptr @"231"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !71
  ret ptr %add.ptr6.i.i
}

define i64 @"232"(ptr %end_size_, ptr %this, i64 %0, i64 %1, ptr %.omp.ub) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !18
  %sub.ptr.rhs.cast = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %end_size_, align 8, !tbaa !16
  %sub.ptr.lhs.cast = ptrtoint ptr %3 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %sub = add nsw i64 %sub.ptr.div, %1
  store i64 %sub, ptr %.omp.ub, align 8, !tbaa !12
  ret i64 %sub
}

define i32 @"233"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %this, align 8, !tbaa !18
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %add7 = add i64 %2, %0
  %add.ptr.1 = getelementptr inbounds i32, ptr %1, i64 %add7
  %3 = load i32, ptr %init_val, align 4, !tbaa !0
  store i32 %3, ptr %add.ptr.1, align 4, !tbaa !0
  ret i32 %3
}

define ptr @"234"(ptr %out_index_.i, ptr %add.ptr, i32 %0) {
bb:
  %1 = load i32, ptr %add.ptr, align 4, !tbaa !0, !llvm.access.group !66
  %add.i.i.i = add nsw i32 %1, %0
  %idxprom.i.i.i = sext i32 %add.i.i.i to i64
  %2 = load ptr, ptr %out_index_.i, align 8, !tbaa !119, !noalias !120, !llvm.access.group !66
  %arrayidx.i.i.i = getelementptr inbounds ptr, ptr %2, i64 %idxprom.i.i.i
  %3 = load ptr, ptr %arrayidx.i.i.i, align 8, !tbaa !4, !llvm.access.group !66
  ret ptr %3
}

define i64 @"235"(ptr %arrayidx23.i, i64 %0, ptr %1, i64 %2, i64 %3, ptr %arrayidx28.i, i64 %4, i64 %5, ptr %arrayidx19.i) {
bb:
  %6 = load i64, ptr %arrayidx28.i, align 8, !tbaa !12
  %wide.load28 = load <2 x i64>, ptr %1, align 8, !tbaa !12
  %vector.recur.extract31 = extractelement <2 x i64> %wide.load28, i64 %2
  %and20.i = and i64 %vector.recur.extract31, %3
  %7 = load i64, ptr %arrayidx23.i, align 8, !tbaa !12
  %and24.i = and i64 %7, %0
  %or25.i = or i64 %and24.i, %and20.i
  %shr29.i = lshr exact i64 %or25.i, %2
  %xor30.i = xor i64 %shr29.i, %6
  %and31.i = and i64 %7, %2
  %tobool32.not.i = icmp eq i64 %and31.i, %4
  %cond33.i = select i1 %tobool32.not.i, i64 %4, i64 %5
  %xor34.i = xor i64 %xor30.i, %cond33.i
  store i64 %xor34.i, ptr %arrayidx19.i, align 8, !tbaa !12
  ret i64 %xor34.i
}

define i64 @"236"(i32 %shl19, ptr %arrayidx.i61, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i63, i64 %4, i64 %5, i64 %xor4.i, i64 %6, i64 %xor7.i, i32 %7, i32 %8, i32 %9, i32 %conv, i64 %10, i64 %ref.tmp30.sroa.0.0.insert.ext, ptr %el, ptr %.omp.lb) {
bb:
  %11 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %mul = shl i64 %11, %6
  %12 = load ptr, ptr %el, align 8, !tbaa !47
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %12, i64 %mul
  %13 = load i64, ptr %arrayidx.i61, align 8, !tbaa !12
  %shr.i62 = lshr i64 %13, %0
  %and.i = and i64 %shr.i62, %1
  %xor.i632 = xor i64 %and.i, %13
  %shl.i = shl i64 %xor.i63, %2
  %and3.i = and i64 %shl.i, %3
  %xor4.i4 = xor i64 %and3.i, %xor.i63
  %shl5.i = shl i64 %xor4.i, %4
  %and6.i = and i64 %shl5.i, %5
  %xor7.i6 = xor i64 %and6.i, %xor4.i
  %shr8.i = lshr i64 %xor7.i, %6
  %xor9.i = xor i64 %shr8.i, %xor7.i
  %conv8 = trunc i64 %xor9.i to i32
  %cmp20 = icmp ugt i32 %conv, %7
  %inc.pn.in.v = select i1 %cmp20, i32 %8, i32 %9
  %inc.pn.in = icmp ult i32 %inc.pn.in.v, %conv
  %inc.pn = zext i1 %inc.pn.in to i32
  %dst.1 = or i32 %shl19, %inc.pn
  %ref.tmp30.sroa.4.0.insert.ext = zext i32 %dst.1 to i64
  %ref.tmp30.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp30.sroa.4.0.insert.ext, %10
  %ref.tmp30.sroa.0.0.insert.insert = or i64 %ref.tmp30.sroa.4.0.insert.shift, %ref.tmp30.sroa.0.0.insert.ext
  store i64 %ref.tmp30.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp30.sroa.0.0.insert.insert
}

define i32 @"237"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !47
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %add15 = add i64 %3, %0
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %add15
  %add.ptr.sroa_idx.1 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %1
  %4 = load i32, ptr %add.ptr.sroa_idx.1, align 4
  ret i32 %4
}

define i32 @"238"(i64 %indvars.iv687, ptr %incdec.ptr4.sink.i.i.i.i, ptr %__first.addr.015.i.i, ptr %neighs, ptr %arrayidx.i524, i64 %sub.ptr.rhs.cast.i.i.i.i526, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %incdec.ptr4.sink.i.i.i.i, align 4, !tbaa !0
  %3 = sext i32 %2 to i64
  %cmp.i.i.i530 = icmp sgt i64 %indvars.iv687, %3
  %4 = load i64, ptr %arrayidx.i524, align 8, !tbaa !12
  %5 = load ptr, ptr %neighs, align 8, !tbaa !4
  %add.ptr121 = getelementptr inbounds i32, ptr %5, i64 %4
  %sub.ptr.lhs.cast.i.i.i.i525 = ptrtoint ptr %add.ptr121 to i64
  %sub.ptr.sub.i.i.i.i527 = sub i64 %sub.ptr.lhs.cast.i.i.i.i525, %sub.ptr.rhs.cast.i.i.i.i526
  %sub.ptr.div.i.i.i.i = lshr exact i64 %sub.ptr.sub.i.i.i.i527, %0
  %shr.i.i = lshr i64 %sub.ptr.div.i.i.i.i, %1
  %incdec.ptr4.sink.i.i.i.i2 = getelementptr inbounds i32, ptr %__first.addr.015.i.i, i64 %shr.i.i
  %incdec.ptr.i.i = getelementptr inbounds i32, ptr %incdec.ptr4.sink.i.i.i.i, i64 %1
  %__first.addr.1.i.i = select i1 %cmp.i.i.i530, ptr %incdec.ptr.i.i, ptr %__first.addr.015.i.i
  %6 = load i32, ptr %__first.addr.1.i.i, align 4, !tbaa !0
  ret i32 %6
}

define <2 x i64> @"239"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %this, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
bb:
  %wide.load = load <2 x i64>, ptr %0, align 8, !tbaa !12
  %10 = and <2 x i64> %wide.load, %5
  %11 = icmp eq <2 x i64> %10, %7
  %12 = select <2 x i1> %11, <2 x i64> %7, <2 x i64> %8
  %13 = and <2 x i64> %wide.load, %1
  %.pre.i = load i64, ptr %this, align 8, !tbaa !12
  %vector.recur.init = insertelement <2 x i64> %2, i64 %.pre.i, i64 %3
  %14 = shufflevector <2 x i64> %vector.recur.init, <2 x i64> %wide.load, <2 x i32> <i32 1, i32 2>
  %15 = and <2 x i64> %14, %4
  %16 = or <2 x i64> %13, %15
  %17 = lshr exact <2 x i64> %16, %5
  %wide.load18 = load <2 x i64>, ptr %6, align 8, !tbaa !12
  %18 = xor <2 x i64> %17, %wide.load18
  %19 = xor <2 x i64> %18, %12
  store <2 x i64> %19, ptr %9, align 8, !tbaa !12
  ret <2 x i64> %19
}

define i64 @"240"(ptr %_ZSt4cout, i64 %0) {
bb:
  %vtable.i = load ptr, ptr %_ZSt4cout, align 8, !tbaa !128
  %vbase.offset.ptr.i = getelementptr i8, ptr %vtable.i, i64 %0
  %vbase.offset.i = load i64, ptr %vbase.offset.ptr.i, align 8
  ret i64 %vbase.offset.i
}

define i64 @"241"(ptr %shared_in.i, i64 %0) {
bb:
  %1 = load i64, ptr %shared_in.i, align 8, !tbaa !86
  %inc.i = add i64 %1, %0
  store i64 %inc.i, ptr %shared_in.i, align 8, !tbaa !86
  ret i64 %inc.i
}

define i32 @"242"(i32 %0, ptr %call171, ptr %arrayidx.i548, i64 %1, ptr %arrayidx.i549) {
bb:
  %2 = load i32, ptr %arrayidx.i549, align 4, !tbaa !0
  %idx.ext = sext i32 %2 to i64
  %3 = load i64, ptr %arrayidx.i548, align 8, !tbaa !12
  %add286 = add i64 %3, %1
  %sub287 = add i64 %add286, %idx.ext
  %arrayidx288 = getelementptr inbounds i32, ptr %call171, i64 %sub287
  store i32 %0, ptr %arrayidx288, align 4, !tbaa !0
  ret i32 %0
}

define ptr @"243"(ptr %cond.i31.i.i.i, ptr %_M_finish.i38, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4) {
bb:
  %5 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !59
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %5, i64 %0
  %6 = ptrtoint ptr %incdec.ptr.i.i to i64
  %7 = add i64 %6, %1
  %8 = sub i64 %7, %2
  %9 = lshr i64 %8, %3
  %10 = add nuw nsw i64 %9, %0
  %n.vec = and i64 %10, %4
  %11 = shl i64 %n.vec, %3
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i, i64 %11
  %incdec.ptr.i.i.i = getelementptr %"struct.std::pair.18", ptr %ind.end, i64 %0
  store ptr %incdec.ptr.i.i.i, ptr %_M_finish.i38, align 8, !tbaa !59
  ret ptr %incdec.ptr.i.i.i
}

define ptr @"244"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, ptr %.omp.lb) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %2 = sext i32 %1 to i64
  %3 = load i8, ptr %transpose, align 1, !tbaa !24, !range !26, !noundef !27
  %tobool.not = icmp eq i8 %3, %0
  %4 = load ptr, ptr %in_index_.i, align 8
  %5 = load ptr, ptr %out_index_.i, align 8
  %.pn = select i1 %tobool.not, ptr %5, ptr %4
  %n_start.0.in = getelementptr inbounds ptr, ptr %.pn, i64 %2
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  ret ptr %n_start.0
}

define i32 @"245"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !18
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add.ptr.prol = getelementptr inbounds i32, ptr %2, i64 %ind.end
  %5 = load i32, ptr %init_val, align 4, !tbaa !0
  store i32 %5, ptr %add.ptr.prol, align 4, !tbaa !0
  ret i32 %5
}

define ptr @"246"(ptr %out_index_.i, ptr %arrayidx.i7, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i, i64 %4, i64 %5, i64 %xor4.i, i64 %6, ptr %mod_.i, i32 %7) {
bb:
  %8 = load i64, ptr %arrayidx.i7, align 8, !tbaa !12
  %shr.i = lshr i64 %8, %0
  %and.i = and i64 %shr.i, %1
  %xor.i2 = xor i64 %and.i, %8
  %shl.i = shl i64 %xor.i, %2
  %and3.i = and i64 %shl.i, %3
  %xor4.i4 = xor i64 %and3.i, %xor.i
  %shl5.i = shl i64 %xor4.i, %4
  %and6.i = and i64 %shl5.i, %5
  %xor7.i = xor i64 %and6.i, %xor4.i
  %shr8.i = lshr i64 %xor7.i, %6
  %xor9.i = xor i64 %shr8.i, %xor4.i
  %conv7.i = trunc i64 %xor9.i to i32
  %9 = load i32, ptr %mod_.i, align 4, !tbaa !130
  %rem.i = urem i32 %conv7.i, %9
  %add.i = add nsw i32 %rem.i, %7
  %idxprom.i = sext i32 %add.i to i64
  %10 = load ptr, ptr %out_index_.i, align 8, !tbaa !119
  %arrayidx.i = getelementptr inbounds ptr, ptr %10, i64 %idxprom.i
  %11 = load ptr, ptr %arrayidx.i, align 8, !tbaa !4
  ret ptr %11
}

define i32 @"247"(ptr %.sroa_idx.phi.trans.insert.i, ptr %second.i.i.i.i.i) {
bb:
  %.pre43.i = load i32, ptr %.sroa_idx.phi.trans.insert.i, align 4
  store i32 %.pre43.i, ptr %second.i.i.i.i.i, align 4, !tbaa !96
  ret i32 %.pre43.i
}

define i64 @"248"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !79
  %inc.i71 = add nuw nsw i64 %2, %1
  %arrayidx.i65 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i71
  %3 = load i64, ptr %arrayidx.i65, align 8, !tbaa !12
  ret i64 %3
}

define i32 @"249"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !47
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %add15 = add i64 %2, %0
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %add15
  %3 = load i32, ptr %add.ptr.1, align 4
  ret i32 %3
}

define i64 @"250"(ptr %__begin0.sroa.0.059, i64 %0, ptr %.sroa_idx, ptr %cond.i31.i.i.i, ptr %_M_finish.i38, i64 %1, i64 %sub.ptr.rhs.cast.i, i64 %2) {
bb:
  %3 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !59
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %3, i64 %1
  %sub.ptr.lhs.cast.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %2
  %add.ptr.i.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %cond.i31.i.i.i, i64 %sub.ptr.div.i
  %4 = load i32, ptr %__begin0.sroa.0.059, align 4
  %retval.sroa.2.0.insert.ext.i = zext i32 %4 to i64
  %retval.sroa.2.0.insert.shift.i = shl nuw i64 %retval.sroa.2.0.insert.ext.i, %0
  %5 = load i32, ptr %.sroa_idx, align 4
  %retval.sroa.0.0.insert.ext.i = zext i32 %5 to i64
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i
  store i64 %retval.sroa.0.0.insert.insert.i, ptr %add.ptr.i.i.i, align 4
  ret i64 %retval.sroa.0.0.insert.insert.i
}

define i64 @"251"(ptr %arrayidx.i.i, ptr %0, i64 %1, ptr %2) {
bb:
  %3 = load ptr, ptr %arrayidx.i.i, align 8, !tbaa !4, !noalias !83
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %0, align 8, !tbaa !4, !noalias !83
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i = ashr exact i64 %sub.ptr.sub.i.i, %1
  store i64 %sub.ptr.div.i.i, ptr %2, align 8, !alias.scope !83
  ret i64 %sub.ptr.div.i.i
}

define i64 @"252"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !79
  %inc.i71 = add nuw nsw i64 %2, %1
  %arrayidx.i208 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i71
  %3 = load i64, ptr %arrayidx.i208, align 8, !tbaa !12
  ret i64 %3
}

define i64 @"253"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !67
  %2 = and i64 %1, %0
  %sub = add nuw i64 %2, %0
  %conv34 = and i64 %sub, %0
  %3 = load ptr, ptr %offsets, align 8
  %arrayidx.i492 = getelementptr inbounds i64, ptr %3, i64 %conv34
  %4 = load i64, ptr %arrayidx.i492, align 8, !tbaa !12
  ret i64 %4
}

define i64 @"255"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %call.i4145, ptr %num_blocks) {
bb:
  %0 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !12
  %1 = load i64, ptr %arrayidx.i58, align 8, !tbaa !12
  %add7 = add nsw i64 %1, %total.076
  %add7.1 = add nsw i64 %0, %add7
  %2 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !12
  %add7.2 = add nsw i64 %2, %add7.1
  %3 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !12
  %add7.3 = add nsw i64 %3, %add7.2
  %4 = load i64, ptr %num_blocks, align 8, !tbaa !12
  %arrayidx.i = getelementptr inbounds i64, ptr %call.i4145, i64 %4
  store i64 %add7.3, ptr %arrayidx.i, align 8, !tbaa !12
  ret i64 %add7.3
}

define i32 @"256"(ptr %degrees, i64 %mul12, i64 %umin, ptr %.omp.lb, i64 %indvar, i64 %0, i64 %n.mod.vf) {
bb:
  %1 = load ptr, ptr %degrees, align 8, !tbaa !18
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !12
  %3 = add i64 %2, %indvar
  %4 = shl i64 %3, %0
  %5 = sub i64 %umin, %4
  %n.vec = sub i64 %5, %n.mod.vf
  %ind.end = add i64 %mul12, %n.vec
  %arrayidx.i32 = getelementptr inbounds i32, ptr %1, i64 %ind.end
  %6 = load i32, ptr %arrayidx.i32, align 4, !tbaa !0
  ret i32 %6
}

define ptr @"257"(ptr %cond.i31.i.i.i, ptr %_M_finish.i.i, ptr %depth_index, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %depth_index, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i.i.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !4
  %sub.ptr.lhs.cast.i.i.i.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, %0
  %add.ptr.i.i.i = getelementptr inbounds ptr, ptr %cond.i31.i.i.i, i64 %sub.ptr.div.i.i.i.i.i
  %incdec.ptr.i.i.i = getelementptr inbounds ptr, ptr %add.ptr.i.i.i, i64 %1
  store ptr %incdec.ptr.i.i.i, ptr %_M_finish.i.i, align 8, !tbaa !127
  ret ptr %incdec.ptr.i.i.i
}

define i32 @"258"(ptr %add.ptr.i.i, ptr %__first, ptr %add.ptr.i, ptr %add.ptr2.i, i64 %sub1.i, i64 %mul.i) {
bb:
  %0 = load i32, ptr %add.ptr2.i, align 4, !tbaa !0
  %1 = load i32, ptr %add.ptr.i, align 4, !tbaa !0
  %cmp.i.i = icmp slt i32 %1, %0
  %spec.select.i = select i1 %cmp.i.i, i64 %sub1.i, i64 %mul.i
  %add.ptr2.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i
  %2 = load i32, ptr %add.ptr.i.i, align 4, !tbaa !0
  store i32 %2, ptr %add.ptr2.i.i, align 4, !tbaa !0
  ret i32 %2
}

define float @"259"(ptr %arrayidx.i.prol, float %0, ptr %arrayidx.i, float %1, ptr %biggest_score4) {
bb:
  %2 = load float, ptr %arrayidx.i, align 4
  %3 = load float, ptr %arrayidx.i.prol, align 4
  %cmp.i.prol = fcmp ogt float %3, %0
  %4 = select i1 %cmp.i.prol, float %3, float %0
  %cmp.i = fcmp olt float %4, %2
  %5 = select i1 %cmp.i, float %2, float %1
  store float %5, ptr %biggest_score4, align 4, !tbaa !10
  ret float %5
}

define i64 @"260"(ptr %el) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %agg.tmp.sroa.0.0.copyload.i.i.i.i.i = load i64, ptr %.pre, align 4, !tbaa.struct !78
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i.i.i
}

define i64 @"261"(ptr %_M_string_length.i.i.i, ptr %__dnew.i.i.i) {
bb:
  %0 = load i64, ptr %_M_string_length.i.i.i, align 8, !tbaa !73, !noalias !100
  store i64 %0, ptr %__dnew.i.i.i, align 8, !tbaa !12, !noalias !100
  ret i64 %0
}

define ptr @"262"(ptr %cond.i31.i.i491, i64 %.sroa.speculated.i.i.i481, ptr %_M_finish.i468, ptr %add.ptr.i467, i64 %0, i64 %sub.ptr.div.i.i.i.i480, i1 %cmp9.i.i.i484, i64 %1, i64 %add.i.i.i482, ptr %verts_at_depth.sroa.0.5, ptr %arrayidx.i466, i64 %2, i32 %3) {
bb:
  %4 = load i32, ptr %arrayidx.i466, align 4, !tbaa !0
  %conv98 = sext i32 %4 to i64
  %add.ptr.i4672 = getelementptr inbounds %"class.std::vector.26", ptr %verts_at_depth.sroa.0.5, i64 %conv98
  %_M_end_of_storage.i469 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i467, i64 %2, i32 2
  %5 = load ptr, ptr %_M_finish.i468, align 8, !tbaa !4
  %sub.ptr.lhs.cast.i.i.i.i475 = ptrtoint ptr %5 to i64
  %6 = load ptr, ptr %add.ptr.i467, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i.i.i476 = ptrtoint ptr %6 to i64
  %sub.ptr.sub.i.i.i.i477 = sub i64 %sub.ptr.lhs.cast.i.i.i.i475, %sub.ptr.rhs.cast.i.i.i.i476
  %sub.ptr.div.i.i.i.i4804 = ashr exact i64 %sub.ptr.sub.i.i.i.i477, %0
  %add.i.i.i4826 = add i64 %.sroa.speculated.i.i.i481, %sub.ptr.div.i.i.i.i480
  %cmp7.i.i.i483 = icmp ult i64 %add.i.i.i482, %sub.ptr.div.i.i.i.i480
  %or.cond.i.i.i485 = or i1 %cmp7.i.i.i483, %cmp9.i.i.i484
  %cond.i.i.i486 = select i1 %or.cond.i.i.i485, i64 %1, i64 %add.i.i.i482
  %add.ptr19.i.i499 = getelementptr inbounds i32, ptr %cond.i31.i.i491, i64 %cond.i.i.i486
  store ptr %add.ptr19.i.i499, ptr %_M_end_of_storage.i469, align 8, !tbaa !131
  ret ptr %add.ptr19.i.i499
}

define i32 @"263"(ptr %neighs, ptr %arrayidx.i523, ptr %arrayidx.i524, i64 %sub.ptr.rhs.cast.i.i.i.i526, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %neighs, align 8, !tbaa !4
  %3 = load i64, ptr %arrayidx.i523, align 8, !tbaa !12
  %add.ptr = getelementptr inbounds i32, ptr %2, i64 %3
  %4 = load i64, ptr %arrayidx.i524, align 8, !tbaa !12
  %add.ptr121 = getelementptr inbounds i32, ptr %2, i64 %4
  %sub.ptr.lhs.cast.i.i.i.i525 = ptrtoint ptr %add.ptr121 to i64
  %sub.ptr.sub.i.i.i.i527 = sub i64 %sub.ptr.lhs.cast.i.i.i.i525, %sub.ptr.rhs.cast.i.i.i.i526
  %sub.ptr.div.i.i.i.i = lshr exact i64 %sub.ptr.sub.i.i.i.i527, %0
  %shr.i.i = lshr i64 %sub.ptr.div.i.i.i.i, %1
  %incdec.ptr4.sink.i.i.i.i = getelementptr inbounds i32, ptr %add.ptr, i64 %shr.i.i
  %5 = load i32, ptr %incdec.ptr4.sink.i.i.i.i, align 4, !tbaa !0
  ret i32 %5
}

define ptr @"264"(ptr %el, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !45
  ret ptr %add.ptr.i
}

define i64 @"265"(ptr %this, i64 %0, ptr %arrayidx42.i, i64 %1, i64 %2, ptr %arrayidx49.i, i64 %3, i64 %4) {
bb:
  %5 = load i64, ptr %this, align 8, !tbaa !12
  %and52.i = and i64 %5, %2
  %tobool53.not.i = icmp eq i64 %and52.i, %3
  %cond54.i = select i1 %tobool53.not.i, i64 %3, i64 %4
  %6 = load i64, ptr %arrayidx49.i, align 8, !tbaa !12
  %and46.i = and i64 %5, %0
  %7 = load i64, ptr %arrayidx42.i, align 8, !tbaa !12
  %and43.i = and i64 %7, %1
  %or47.i = or i64 %and46.i, %and43.i
  %shr50.i = lshr exact i64 %or47.i, %2
  %xor51.i = xor i64 %shr50.i, %6
  %xor55.i = xor i64 %xor51.i, %cond54.i
  store i64 %xor55.i, ptr %arrayidx42.i, align 8, !tbaa !12
  ret i64 %xor55.i
}

define i32 @"266"(ptr %depths, ptr %__begin3.0814) {
bb:
  %.pre = load ptr, ptr %depths, align 8, !tbaa !18
  %0 = load i32, ptr %__begin3.0814, align 4, !tbaa !0
  %conv34 = sext i32 %0 to i64
  %arrayidx.i398 = getelementptr inbounds i32, ptr %.pre, i64 %conv34
  %1 = load i32, ptr %arrayidx.i398, align 4, !tbaa !0
  ret i32 %1
}

define i64 @"267"(ptr %__first.addr.07.i.i.i.i.i.i.i, ptr %cond.i31.i.i.i, ptr %_M_finish.i38, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4) {
bb:
  %5 = load i64, ptr %__first.addr.07.i.i.i.i.i.i.i, align 4, !alias.scope !61, !noalias !64
  %6 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !59
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %6, i64 %0
  %7 = ptrtoint ptr %incdec.ptr.i.i to i64
  %8 = add i64 %7, %1
  %9 = sub i64 %8, %2
  %10 = lshr i64 %9, %3
  %11 = add nuw nsw i64 %10, %0
  %n.vec = and i64 %11, %4
  %12 = shl i64 %n.vec, %3
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i, i64 %12
  store i64 %5, ptr %ind.end, align 4, !alias.scope !64, !noalias !61
  ret i64 %5
}

define <4 x float> @"268"(ptr %0, <4 x float> %1, ptr %retval.0.i.i, i64 %2, ptr %scores, i64 %index) {
bb:
  %3 = load ptr, ptr %scores, align 8, !tbaa !8
  %4 = getelementptr inbounds float, ptr %3, i64 %index
  %wide.load = load <4 x float>, ptr %0, align 4, !tbaa !10
  %5 = load float, ptr %retval.0.i.i, align 4, !tbaa !10
  %broadcast.splatinsert = insertelement <4 x float> %1, float %5, i64 %2
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> %1, <4 x i32> zeroinitializer
  %6 = fdiv <4 x float> %wide.load, %broadcast.splat
  store <4 x float> %6, ptr %0, align 4, !tbaa !10
  ret <4 x float> %6
}

define i64 @"269"(i64 %0, ptr %offsets, ptr %num_nodes_.i, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !67
  %4 = and i64 %3, %1
  %arrayidx.i493734 = getelementptr inbounds i64, ptr %2, i64 %4
  store i64 %0, ptr %arrayidx.i493734, align 8, !tbaa !12
  ret i64 %0
}

define <4 x float> @"270"(<2 x float> %0, ptr %1, ptr %2) {
bb:
  %wide.load = load <2 x float>, ptr %1, align 4, !tbaa !10, !alias.scope !132
  %interleaved.vec = shufflevector <2 x float> %0, <2 x float> %wide.load, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x float> %interleaved.vec, ptr %2, align 4, !tbaa !42
  ret <4 x float> %interleaved.vec
}

define ptr @"271"(ptr %call.i132133, ptr %num_nodes, i64 %0, ptr %end_size_.i) {
bb:
  %1 = load i64, ptr %num_nodes, align 8, !tbaa !12
  %add = add nsw i64 %1, %0
  %add.ptr.i = getelementptr inbounds i64, ptr %call.i132133, i64 %add
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !81
  ret ptr %add.ptr.i
}

define float @"272"(ptr %scores, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %1 = sext i32 %0 to i64
  %2 = load ptr, ptr %scores, align 8, !tbaa !8
  %arrayidx.i = getelementptr inbounds float, ptr %2, i64 %1
  %3 = load float, ptr %arrayidx.i, align 4
  ret float %3
}

define <2 x i64> @"273"(ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %index770, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !67
  %4 = and i64 %3, %0
  %offset.idx = sub i64 %4, %index770
  %5 = add nuw i64 %offset.idx, %0
  %6 = and i64 %5, %0
  %7 = getelementptr inbounds i64, ptr %2, i64 %6
  %8 = getelementptr inbounds i64, ptr %7, i64 %1
  %wide.load = load <2 x i64>, ptr %8, align 8, !tbaa !12
  ret <2 x i64> %wide.load
}

define ptr @"274"(ptr %out_index_.i, ptr %arrayidx.i7, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i, i64 %4, i64 %5, i64 %xor4.i, i64 %6, ptr %mod_.i) {
bb:
  %7 = load i64, ptr %arrayidx.i7, align 8, !tbaa !12
  %shr.i = lshr i64 %7, %0
  %and.i = and i64 %shr.i, %1
  %xor.i2 = xor i64 %and.i, %7
  %shl.i = shl i64 %xor.i, %2
  %and3.i = and i64 %shl.i, %3
  %xor4.i4 = xor i64 %and3.i, %xor.i
  %shl5.i = shl i64 %xor4.i, %4
  %and6.i = and i64 %shl5.i, %5
  %xor7.i = xor i64 %and6.i, %xor4.i
  %shr8.i = lshr i64 %xor7.i, %6
  %xor9.i = xor i64 %shr8.i, %xor4.i
  %conv7.i = trunc i64 %xor9.i to i32
  %8 = load i32, ptr %mod_.i, align 4, !tbaa !130
  %rem.i = urem i32 %conv7.i, %8
  %idxprom3.i = sext i32 %rem.i to i64
  %9 = load ptr, ptr %out_index_.i, align 8, !tbaa !119
  %arrayidx4.i = getelementptr inbounds ptr, ptr %9, i64 %idxprom3.i
  %10 = load ptr, ptr %arrayidx4.i, align 8, !tbaa !4
  ret ptr %10
}

define <4 x i32> @"275"(ptr %0, ptr %call171, ptr %arrayidx.i539, i64 %1, i64 %index800, i64 %2) {
bb:
  %3 = load i64, ptr %arrayidx.i539, align 8, !tbaa !12
  %sub183 = add nsw i64 %3, %1
  %offset.idx801 = sub i64 %sub183, %index800
  %4 = getelementptr inbounds i32, ptr %call171, i64 %offset.idx801
  %5 = getelementptr inbounds i32, ptr %4, i64 %2
  %wide.load803 = load <4 x i32>, ptr %0, align 4, !tbaa !0
  store <4 x i32> %wide.load803, ptr %5, align 4, !tbaa !0
  ret <4 x i32> %wide.load803
}

define float @"276"(ptr %scores, i64 %0) {
bb:
  %1 = load ptr, ptr %scores, align 8, !tbaa !8
  %incdec.ptr11.i.i = getelementptr inbounds float, ptr %1, i64 %0
  %2 = load float, ptr %incdec.ptr11.i.i, align 4, !tbaa !10
  ret float %2
}

define i32 @"277"(ptr %arrayidx.i.i.i60, ptr %n_start.0.in, i64 %0, ptr %diffs, ptr %.omp.lb) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i89 = ptrtoint ptr %n_start.0 to i64
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !4
  %sub.ptr.lhs.cast = ptrtoint ptr %n_end.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast.i.i89
  %1 = lshr exact i64 %sub.ptr.sub, %0
  %conv22 = trunc i64 %1 to i32
  %2 = load ptr, ptr %diffs, align 8, !tbaa !18
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %4 = sext i32 %3 to i64
  %arrayidx.i99 = getelementptr inbounds i32, ptr %2, i64 %4
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !0
  ret i32 %conv22
}

define i64 @"278"(ptr %arrayidx.i533, i64 %total_missing_inv.0649, ptr %arrayidx.i536, ptr %offsets, ptr %num_nodes_.i) {
bb:
  %.pre714 = load i64, ptr %num_nodes_.i, align 8, !tbaa !67
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !14
  %arrayidx.i5332 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %.pre714
  %0 = load i32, ptr %arrayidx.i536, align 4, !tbaa !0
  %conv155 = sext i32 %0 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %1 = load i64, ptr %arrayidx.i533, align 8, !tbaa !12
  %add165 = add nsw i64 %1, %add156
  store i64 %add165, ptr %arrayidx.i533, align 8, !tbaa !12
  ret i64 %add165
}

define i64 @"279"(ptr %succ, ptr %arrayidx.i7.i.i, ptr %g_out_start, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %succ, align 8, !tbaa !135, !llvm.access.group !66
  %3 = load ptr, ptr %g_out_start, align 8, !tbaa !4, !llvm.access.group !66
  %sub.ptr.rhs.cast42 = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %arrayidx.i7.i.i, align 8, !tbaa !4, !llvm.access.group !66
  %sub.ptr.lhs.cast41 = ptrtoint ptr %4 to i64
  %sub.ptr.sub43 = sub i64 %sub.ptr.lhs.cast41, %sub.ptr.rhs.cast42
  %sub.ptr.div44 = ashr exact i64 %sub.ptr.sub43, %0
  %div1.i.i = lshr i64 %sub.ptr.div44, %1
  %arrayidx.i103 = getelementptr inbounds i64, ptr %2, i64 %div1.i.i
  %5 = load i64, ptr %arrayidx.i103, align 8, !tbaa !12, !llvm.access.group !66
  ret i64 %5
}

define i64 @"280"(ptr %_M_b.i, ptr %__param, i64 %0, ptr %_M_b.i32) {
bb:
  %1 = load i64, ptr %_M_b.i, align 8, !tbaa !137
  %2 = load i64, ptr %__param, align 8, !tbaa !139
  %sub = sub i64 %1, %2
  %div31 = lshr i64 %sub, %0
  store i64 %div31, ptr %_M_b.i32, align 8, !tbaa !137
  ret i64 %div31
}

define i64 @"281"(ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i32, ptr %v3.i.i.i.i.i, align 4
  %1 = load i32, ptr %v.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %1, %0
  %2 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !53
  %3 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !53
  %cmp.i.i.i.i.i = icmp eq i32 %2, %3
  %cmp7.i.i.i.i.i = icmp slt i32 %2, %3
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr3.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  %4 = load i64, ptr %add.ptr3.i.i.i, align 4
  ret i64 %4
}

define i64 @"282"(ptr %add.ptr3.i.i.i, ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i32, ptr %v3.i.i.i.i.i, align 4
  %1 = load i32, ptr %v.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %1, %0
  %2 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !53
  %3 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !53
  %cmp.i.i.i.i.i = icmp eq i32 %2, %3
  %cmp7.i.i.i.i.i = icmp slt i32 %2, %3
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr4.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  %4 = load i64, ptr %add.ptr3.i.i.i, align 4
  store i64 %4, ptr %add.ptr4.i.i.i, align 4
  ret i64 %4
}

define i64 @"283"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57.epil) {
bb:
  %0 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !12
  %1 = load i64, ptr %arrayidx.i58, align 8, !tbaa !12
  %add7 = add nsw i64 %1, %total.076
  %add7.1 = add nsw i64 %0, %add7
  %2 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !12
  %add7.2 = add nsw i64 %2, %add7.1
  %3 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !12
  %add7.3 = add nsw i64 %3, %add7.2
  store i64 %add7.3, ptr %arrayidx.i57.epil, align 8, !tbaa !12
  ret i64 %add7.3
}

define i8 @"284"(ptr %arrayidx.i17.i, ptr %ref.tmp, i64 %conv5.i, i64 %idxprom1.i.i) {
bb:
  %0 = load ptr, ptr %ref.tmp, align 8, !tbaa !38, !alias.scope !123
  %arrayidx.i.i = getelementptr inbounds i8, ptr %0, i64 %conv5.i
  %arrayidx2.i.i = getelementptr inbounds i8, ptr %arrayidx.i.i, i64 %idxprom1.i.i
  %1 = load i8, ptr %arrayidx.i17.i, align 1, !tbaa !42, !noalias !123
  store i8 %1, ptr %arrayidx2.i.i, align 1, !tbaa !42
  ret i8 %1
}

define ptr @"285"(ptr %call.i139141, ptr %num_edges_.i, ptr %g, i8 %0, i64 %1, i64 %2, ptr %end_.i) {
bb:
  %3 = load i8, ptr %g, align 8, !tbaa !140, !range !26, !noundef !27
  %tobool.not.i = icmp eq i8 %3, %0
  %mul.i = zext i1 %tobool.not.i to i64
  %4 = load i64, ptr %num_edges_.i, align 8
  %cond.i = shl nsw i64 %4, %mul.i
  %sub.i = add i64 %cond.i, %1
  %div4.i = lshr i64 %sub.i, %2
  %add.ptr.i140 = getelementptr inbounds i64, ptr %call.i139141, i64 %div4.i
  store ptr %add.ptr.i140, ptr %end_.i, align 8, !tbaa !141
  ret ptr %add.ptr.i140
}

define i64 @"286"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !47
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i78.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !78
  ret i64 %agg.tmp.sroa.0.0.copyload.i78.i.i.i.i
}

define i64 @"287"(ptr %_M_p, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p, align 8, !tbaa !92
  %inc = add nuw nsw i64 %1, %0
  store i64 %inc, ptr %_M_p, align 8, !tbaa !92
  ret i64 %inc
}

define ptr @"288"(ptr %new_range.i.i, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1, ptr %el) {
bb:
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !47
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !45
  ret ptr %add.ptr.i464
}

define i32 @"289"(ptr %num_nodes_.i.i, i32 %0, i64 %1, i64 %2, i32 %3, i32 %conv14.i.i, ptr %4) {
bb:
  %5 = load i64, ptr %num_nodes_.i.i, align 8, !tbaa !43
  %6 = trunc i64 %5 to i32
  %conv.i = add i32 %6, %0
  %conv6.i.i = and i64 %5, %2
  %rem.i.i = urem i64 %1, %conv6.i.i
  %conv7.i.i = trunc i64 %rem.i.i to i32
  %cmp9.i.i = icmp eq i32 %conv.i, %conv7.i.i
  %spec.select.i.i = select i1 %cmp9.i.i, i32 %3, i32 %conv14.i.i
  store i32 %spec.select.i.i, ptr %4, align 8
  ret i32 %spec.select.i.i
}

!0 = !{!1, !1, i64 0}
!1 = !{!"int", !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C++ TBAA"}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !2, i64 0}
!6 = !{!7, !5, i64 8}
!7 = !{!"_ZTSNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataE", !5, i64 0, !5, i64 8, !5, i64 16}
!8 = !{!9, !5, i64 0}
!9 = !{!"_ZTS7pvectorIfE", !5, i64 0, !5, i64 8, !5, i64 16}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !2, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"long", !2, i64 0}
!14 = !{!15, !5, i64 0}
!15 = !{!"_ZTS7pvectorIlE", !5, i64 0, !5, i64 8, !5, i64 16}
!16 = !{!17, !5, i64 8}
!17 = !{!"_ZTS7pvectorIiE", !5, i64 0, !5, i64 8, !5, i64 16}
!18 = !{!17, !5, i64 0}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23}
!23 = distinct !{!23, !21}
!24 = !{!25, !25, i64 0}
!25 = !{!"bool", !2, i64 0}
!26 = !{i8 0, i8 2}
!27 = !{}
!28 = !{!29, !1, i64 172}
!29 = !{!"_ZTS9CLIterApp", !30, i64 0, !1, i64 172}
!30 = !{!"_ZTS5CLApp", !31, i64 0, !25, i64 155, !1, i64 156, !13, i64 160, !25, i64 168, !25, i64 169}
!31 = !{!"_ZTS6CLBase", !1, i64 8, !5, i64 16, !32, i64 24, !32, i64 56, !34, i64 88, !1, i64 112, !1, i64 116, !32, i64 120, !25, i64 152, !25, i64 153, !25, i64 154}
!32 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !33, i64 0, !13, i64 8, !2, i64 16}
!33 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !5, i64 0}
!34 = !{!"_ZTSSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !35, i64 0}
!35 = !{!"_ZTSSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !36, i64 0}
!36 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implE", !37, i64 0}
!37 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_Vector_impl_dataE", !5, i64 0, !5, i64 8, !5, i64 16}
!38 = !{!32, !5, i64 0}
!39 = !{!40}
!40 = distinct !{!40, !41, !"_ZNSt7__cxx119to_stringEi: %agg.result"}
!41 = distinct !{!41, !"_ZNSt7__cxx119to_stringEi"}
!42 = !{!2, !2, i64 0}
!43 = !{!44, !13, i64 8}
!44 = !{!"_ZTS8CSRGraphIiiLb1EE", !25, i64 0, !13, i64 8, !13, i64 16, !5, i64 24, !5, i64 32, !5, i64 40, !5, i64 48}
!45 = !{!46, !5, i64 8}
!46 = !{!"_ZTS7pvectorI8EdgePairIiiEE", !5, i64 0, !5, i64 8, !5, i64 16}
!47 = !{!46, !5, i64 0}
!48 = !{!49}
!49 = distinct !{!49, !50}
!50 = distinct !{!50, !"LVerDomain"}
!51 = !{!52}
!52 = distinct !{!52, !50}
!53 = !{!54, !1, i64 0}
!54 = !{!"_ZTS8EdgePairIiiE", !1, i64 0, !1, i64 4}
!55 = !{!56, !13, i64 16}
!56 = !{!"_ZTS12SlidingQueueIiE", !5, i64 0, !13, i64 8, !13, i64 16, !13, i64 24}
!57 = !{!56, !5, i64 0}
!58 = !{!56, !13, i64 24}
!59 = !{!60, !5, i64 8}
!60 = !{!"_ZTSNSt12_Vector_baseISt4pairIfiESaIS1_EE17_Vector_impl_dataE", !5, i64 0, !5, i64 8, !5, i64 16}
!61 = !{!62}
!62 = distinct !{!62, !63, !"_ZSt19__relocate_object_aISt4pairIfiES1_SaIS1_EEvPT_PT0_RT1_: %__orig"}
!63 = distinct !{!63, !"_ZSt19__relocate_object_aISt4pairIfiES1_SaIS1_EEvPT_PT0_RT1_"}
!64 = !{!65}
!65 = distinct !{!65, !63, !"_ZSt19__relocate_object_aISt4pairIfiES1_SaIS1_EEvPT_PT0_RT1_: %__dest"}
!66 = distinct !{}
!67 = !{!68, !13, i64 16}
!68 = !{!"_ZTS11BuilderBaseIiiiLb1EE", !5, i64 0, !25, i64 8, !25, i64 9, !25, i64 10, !13, i64 16}
!69 = !{!70, !1, i64 0}
!70 = !{!"_ZTSSt4pairIifE", !1, i64 0, !11, i64 4}
!71 = !{!46, !5, i64 16}
!72 = distinct !{}
!73 = !{!32, !13, i64 8}
!74 = !{!75, !5, i64 0}
!75 = !{!"_ZTS7UniDistIiSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEjE", !5, i64 0, !25, i64 8, !1, i64 12, !1, i64 16}
!76 = !{!77, !1, i64 0}
!77 = !{!"_ZTS10NodeWeightIiiE", !1, i64 0, !1, i64 4}
!78 = !{i64 0, i64 4, !0, i64 4, i64 4, !0}
!79 = !{!80, !13, i64 4992}
!80 = !{!"_ZTSSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE", !2, i64 0, !13, i64 4992}
!81 = !{!15, !5, i64 8}
!82 = !{!70, !11, i64 4}
!83 = !{!84}
!84 = distinct !{!84, !85, !"_ZN11BuilderBaseIiiiLb1EE11SquishGraphERK8CSRGraphIiiLb1EE: %agg.result"}
!85 = distinct !{!85, !"_ZN11BuilderBaseIiiiLb1EE11SquishGraphERK8CSRGraphIiiLb1EE"}
!86 = !{!56, !13, i64 8}
!87 = !{!9, !5, i64 8}
!88 = !{!33, !5, i64 0}
!89 = !{!90, !90, i64 0}
!90 = !{!"double", !2, i64 0}
!91 = !{!7, !5, i64 0}
!92 = !{!93, !13, i64 2496}
!93 = !{!"_ZTSSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE", !2, i64 0, !13, i64 2496}
!94 = !{!95, !5, i64 16}
!95 = !{!"_ZTSNSt12_Vector_baseIPiSaIS0_EE17_Vector_impl_dataE", !5, i64 0, !5, i64 8, !5, i64 16}
!96 = !{!97, !1, i64 4}
!97 = !{!"_ZTSSt4pairIfiE", !11, i64 0, !1, i64 4}
!98 = !{!99, !5, i64 8}
!99 = !{!"_ZTSNSt12_Vector_baseISt4pairIifESaIS1_EE17_Vector_impl_dataE", !5, i64 0, !5, i64 8, !5, i64 16}
!100 = !{!101}
!101 = distinct !{!101, !102, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_: %agg.result"}
!102 = distinct !{!102, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_"}
!103 = !{!104, !13, i64 16}
!104 = !{!"_ZTS9GeneratorIiiijLi32ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEE", !1, i64 0, !13, i64 8, !13, i64 16}
!105 = !{!97, !11, i64 0}
!106 = !{!60, !5, i64 16}
!107 = !{!104, !13, i64 8}
!108 = !{i64 0, i64 4, !0}
!109 = !{!110}
!110 = distinct !{!110, !111, !"_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm: %agg.result"}
!111 = distinct !{!111, !"_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm"}
!112 = !{!113, !5, i64 240}
!113 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !114, i64 0, !5, i64 216, !2, i64 224, !25, i64 225, !5, i64 232, !5, i64 240, !5, i64 248, !5, i64 256}
!114 = !{!"_ZTSSt8ios_base", !13, i64 8, !13, i64 16, !115, i64 24, !116, i64 28, !116, i64 32, !5, i64 40, !117, i64 48, !2, i64 64, !1, i64 192, !5, i64 200, !118, i64 208}
!115 = !{!"_ZTSSt13_Ios_Fmtflags", !2, i64 0}
!116 = !{!"_ZTSSt12_Ios_Iostate", !2, i64 0}
!117 = !{!"_ZTSNSt8ios_base6_WordsE", !5, i64 0, !13, i64 8}
!118 = !{!"_ZTSSt6locale", !5, i64 0}
!119 = !{!44, !5, i64 24}
!120 = !{!121}
!121 = distinct !{!121, !122, !"_ZNK8CSRGraphIiiLb1EE9out_neighEim: %agg.result"}
!122 = distinct !{!122, !"_ZNK8CSRGraphIiiLb1EE9out_neighEim"}
!123 = !{!124}
!124 = distinct !{!124, !125, !"_ZNSt7__cxx119to_stringEi: %agg.result"}
!125 = distinct !{!125, !"_ZNSt7__cxx119to_stringEi"}
!126 = !{!95, !5, i64 0}
!127 = !{!95, !5, i64 8}
!128 = !{!129, !129, i64 0}
!129 = !{!"vtable pointer", !3, i64 0}
!130 = !{!75, !1, i64 12}
!131 = !{!7, !5, i64 16}
!132 = !{!133}
!133 = distinct !{!133, !134}
!134 = distinct !{!134, !"LVerDomain"}
!135 = !{!136, !5, i64 0}
!136 = !{!"_ZTS6Bitmap", !5, i64 0, !5, i64 8}
!137 = !{!138, !13, i64 8}
!138 = !{!"_ZTSNSt24uniform_int_distributionImE10param_typeE", !13, i64 0, !13, i64 8}
!139 = !{!138, !13, i64 0}
!140 = !{!44, !25, i64 0}
!141 = !{!136, !5, i64 8}
