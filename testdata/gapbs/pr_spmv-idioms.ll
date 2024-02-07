; ModuleID = 'pr_spmv-idioms'
source_filename = "pr_spmv-idioms"
target triple = "riscv64"

%struct.EdgePair = type { i32, i32 }
%"struct.std::pair.8" = type { float, i32 }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char>::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char>::_Alloc_hider" = type { ptr }
%union.anon = type { i64, [8 x i8] }
%"struct.std::pair" = type { i32, float }
%"class.std::basic_ios" = type { %"class.std::ios_base", ptr, i8, i8, ptr, ptr, ptr, ptr }
%"class.std::ios_base" = type { ptr, i64, i64, i32, i32, i32, ptr, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, ptr, %"class.std::locale" }
%"struct.std::ios_base::_Words" = type { ptr, i64 }
%"class.std::locale" = type { ptr }

define i64 @"1"(ptr %arrayidx.i59, ptr %agg.result, ptr %end_size_.i, ptr %degrees, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i59, align 8, !tbaa !0
  %2 = load ptr, ptr %agg.result, align 8, !tbaa !4
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !7
  %sub.ptr.lhs.cast.i61 = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %degrees, align 8, !tbaa !9
  %sub.ptr.rhs.cast.i62 = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i63 = sub i64 %sub.ptr.lhs.cast.i61, %sub.ptr.rhs.cast.i62
  %sub.ptr.div.i64 = ashr exact i64 %sub.ptr.sub.i63, %0
  %arrayidx.i65 = getelementptr inbounds i64, ptr %2, i64 %sub.ptr.div.i64
  store i64 %1, ptr %arrayidx.i65, align 8, !tbaa !0
  ret i64 %1
}

define <2 x i32> @"2"(ptr %degrees, ptr %.omp.lb, i64 %0, i64 %index) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul12 = shl i64 %1, %0
  %offset.idx = add i64 %mul12, %index
  %2 = load ptr, ptr %degrees, align 8, !tbaa !9
  %3 = getelementptr inbounds i32, ptr %2, i64 %offset.idx
  %wide.load = load <2 x i32>, ptr %3, align 4, !tbaa !10
  ret <2 x i32> %wide.load
}

define ptr @"3"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, ptr %.omp.lb, i64 %1) {
bb:
  %2 = load i8, ptr %transpose, align 1, !tbaa !12, !range !14, !noundef !15
  %tobool.not = icmp eq i8 %2, %0
  %3 = load ptr, ptr %out_index_.i, align 8
  %4 = load ptr, ptr %in_index_.i, align 8
  %.sink = select i1 %tobool.not, ptr %3, ptr %4
  %5 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %6 = sext i32 %5 to i64
  %7 = add nsw i64 %6, %1
  %arrayidx.i.i.i60 = getelementptr inbounds ptr, ptr %.sink, i64 %7
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !16
  ret ptr %n_end.0
}

define <4 x float> @"4"(<4 x float> %0, ptr %init_val, i64 %1, ptr %this, ptr %.omp.lb, i64 %index, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %offset.idx = add i64 %3, %index
  %4 = load ptr, ptr %this, align 8, !tbaa !17
  %5 = getelementptr inbounds float, ptr %4, i64 %offset.idx
  %6 = getelementptr inbounds float, ptr %5, i64 %2
  %7 = load float, ptr %init_val, align 4, !tbaa !19, !alias.scope !21
  %broadcast.splatinsert21 = insertelement <4 x float> %0, float %7, i64 %1
  %broadcast.splat22 = shufflevector <4 x float> %broadcast.splatinsert21, <4 x float> %0, <4 x i32> zeroinitializer
  store <4 x float> %broadcast.splat22, ptr %6, align 4, !tbaa !19, !alias.scope !24, !noalias !21
  ret <4 x float> %broadcast.splat22
}

define i8 @"5"(ptr %arrayidx17.i.i, ptr %agg.tmp11, ptr %max_iters_, i32 %0) {
bb:
  %1 = load i8, ptr %arrayidx17.i.i, align 2, !tbaa !26, !noalias !27
  %2 = load i32, ptr %max_iters_, align 4, !tbaa !30
  %__val.lobit.i = lshr i32 %2, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %3 = load ptr, ptr %agg.tmp11, align 8, !tbaa !41, !alias.scope !27
  %arrayidx.i.i = getelementptr inbounds i8, ptr %3, i64 %conv5.i
  store i8 %1, ptr %arrayidx.i.i, align 1, !tbaa !26
  ret i8 %1
}

define float @"6"(ptr %scores, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %scores, align 8, !tbaa !17, !llvm.access.group !42
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %arrayidx.i51 = getelementptr inbounds float, ptr %0, i64 %2
  %3 = load float, ptr %arrayidx.i51, align 4, !tbaa !19, !llvm.access.group !42
  ret float %3
}

define float @"7"(ptr %init_val, ptr %this, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %this, align 8, !tbaa !17
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add.ptr.prol = getelementptr inbounds float, ptr %0, i64 %1
  %2 = load float, ptr %init_val, align 4, !tbaa !19
  store float %2, ptr %add.ptr.prol, align 4, !tbaa !19
  ret float %2
}

define <2 x float> @"8"(ptr %0, ptr %1, <2 x i64> %2, ptr %outgoing_contrib, i64 %index, ptr %.omp.lb) {
bb:
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %4 = sext i32 %3 to i64
  %offset.idx = add i64 %index, %4
  %5 = load ptr, ptr %outgoing_contrib, align 8, !tbaa !17
  %6 = getelementptr inbounds float, ptr %5, i64 %offset.idx
  %wide.load32 = load <2 x ptr>, ptr %1, align 8, !tbaa !16
  %7 = ptrtoint <2 x ptr> %wide.load32 to <2 x i64>
  %8 = shufflevector <2 x ptr> %wide.load32, <2 x ptr> %wide.load32, <2 x i32> <i32 1, i32 2>
  %9 = ptrtoint <2 x ptr> %8 to <2 x i64>
  %10 = sub <2 x i64> %7, %9
  %11 = ashr exact <2 x i64> %10, %2
  %12 = sitofp <2 x i64> %11 to <2 x float>
  %wide.load = load <2 x float>, ptr %0, align 4, !tbaa !19
  %13 = fdiv <2 x float> %wide.load, %12
  store <2 x float> %13, ptr %6, align 4, !tbaa !19
  ret <2 x float> %13
}

define ptr @"9"(ptr %el, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1) {
bb:
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !43
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !45
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %.pre710.pre = load ptr, ptr %el, align 8, !tbaa !45
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre710.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !43
  ret ptr %add.ptr.i464
}

define <2 x float> @"10"(ptr %scores, i64 %index, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %1 = sext i32 %0 to i64
  %offset.idx = add i64 %index, %1
  %2 = load ptr, ptr %scores, align 8, !tbaa !17
  %3 = getelementptr inbounds float, ptr %2, i64 %offset.idx
  %wide.load = load <2 x float>, ptr %3, align 4, !tbaa !19
  ret <2 x float> %wide.load
}

define i32 @"11"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, ptr %v.i.i.i.i.i.i, ptr %v3.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !46
  %3 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !46
  %cmp7.i.i.i.i.i.i = icmp slt i32 %3, %2
  %4 = load i32, ptr %v.i.i.i.i.i.i, align 4
  %5 = load i32, ptr %v3.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i = icmp slt i32 %4, %5
  %cmp.i.i.i.i.i.i = icmp eq i32 %3, %2
  %cond.i.i.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i1 %cmp4.i.i.i.i.i.i, i1 %cmp7.i.i.i.i.i.i
  %spec.select.i.i.i.i = select i1 %cond.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %__parent.020.in.i.i.i.i.i = add nsw i64 %sub12.i.i.i.i, %1
  %__parent.020.i.i56.i.i.i = lshr i64 %__parent.020.in.i.i.i.i.i, %0
  %add.ptr.i.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %__parent.020.i.i56.i.i.i
  %6 = load i32, ptr %add.ptr.i.i.i.i.i, align 4, !tbaa !46
  ret i32 %6
}

define i64 @"13"(ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %__i.018.i, ptr %arrayidx7.i) {
bb:
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add10 = add i64 %5, %0
  %rem.i.i.i = and i64 %add10, %1
  %shr.i = lshr i64 %rem.i.i.i, %2
  %xor.i = xor i64 %shr.i, %3
  %mul.i = mul nuw nsw i64 %xor.i, %4
  %add.i = add nuw i64 %mul.i, %__i.018.i
  %rem.i.i17.i = and i64 %add.i, %1
  store i64 %rem.i.i17.i, ptr %arrayidx7.i, align 8, !tbaa !0
  ret i64 %rem.i.i17.i
}

define i32 @"14"(ptr %add.ptr.i.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0) {
bb:
  %1 = load i32, ptr %add.ptr.i.i.i.i.i, align 4, !tbaa !10
  %2 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !10
  %3 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !10
  %cmp.i.i.i.i.i = icmp slt i32 %2, %3
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %add.ptr2.i.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %sub12.i.i.i.i
  store i32 %1, ptr %add.ptr2.i.i.i.i.i, align 4, !tbaa !10
  ret i32 %1
}

define i32 @"15"(ptr %n_start.0.in, i64 %0, ptr %diffs, ptr %.omp.lb) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  %sub.ptr.lhs.cast = ptrtoint ptr %n_start.0 to i64
  %.pre134 = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %.pre134
  %1 = lshr exact i64 %sub.ptr.sub, %0
  %conv22 = trunc i64 %1 to i32
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %3 = sext i32 %2 to i64
  %4 = load ptr, ptr %diffs, align 8, !tbaa !9
  %arrayidx.i99 = getelementptr inbounds i32, ptr %4, i64 %3
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !10
  ret i32 %conv22
}

define i64 @"16"(ptr %0, ptr %_M_finish.i38, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5) {
bb:
  %6 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !48
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %6, i64 %1
  %7 = ptrtoint ptr %incdec.ptr.i.i to i64
  %8 = add i64 %7, %2
  %9 = sub i64 %8, %3
  %10 = lshr i64 %9, %4
  %11 = add nuw nsw i64 %10, %1
  %n.vec = and i64 %11, %5
  %12 = shl i64 %n.vec, %4
  %ind.end64 = getelementptr i8, ptr %0, i64 %12
  %13 = load i64, ptr %ind.end64, align 4, !alias.scope !50, !noalias !53
  ret i64 %13
}

define float @"17"(ptr %top_k) {
bb:
  %0 = load ptr, ptr %top_k, align 8, !tbaa !16
  %kvp.sroa.0.0.copyload = load float, ptr %0, align 4
  ret float %kvp.sroa.0.0.copyload
}

define i64 @"18"(ptr %__begin0.sroa.0.059, i64 %0, ptr %.sroa_idx, ptr %_M_finish.i38, i64 %1) {
bb:
  %2 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !48
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %2, i64 %1
  %3 = load i32, ptr %__begin0.sroa.0.059, align 4
  %retval.sroa.2.0.insert.ext.i = zext i32 %3 to i64
  %retval.sroa.2.0.insert.shift.i = shl nuw i64 %retval.sroa.2.0.insert.ext.i, %0
  %4 = load i32, ptr %.sroa_idx, align 4
  %retval.sroa.0.0.insert.ext.i = zext i32 %4 to i64
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i
  store i64 %retval.sroa.0.0.insert.insert.i, ptr %incdec.ptr.i.i, align 4
  ret i64 %retval.sroa.0.0.insert.insert.i
}

define i32 @"19"(ptr %__first.addr.033.i.i, ptr %n_start.0.in) {
bb:
  %0 = load i32, ptr %__first.addr.033.i.i, align 4, !tbaa !10
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  store i32 %0, ptr %n_start.0, align 4, !tbaa !10
  ret i32 %0
}

define i32 @"20"(ptr %degrees, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul14 = shl i64 %1, %0
  %2 = load ptr, ptr %degrees, align 8, !tbaa !9
  %arrayidx.i36 = getelementptr inbounds i32, ptr %2, i64 %mul14
  %3 = load i32, ptr %arrayidx.i36, align 4, !tbaa !10
  ret i32 %3
}

define i32 @"21"(ptr %el, i64 %0, i64 %1, i32 %2) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !45
  %incdec.ptr122.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %v3.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr122.i.i, i64 %1, i32 1
  %3 = load i32, ptr %v3.i.i.i.i, align 4
  ret i32 %3
}

define i64 @"22"(ptr %offsets, ptr %num_nodes_.i, i32 %0, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %3 = trunc i64 %2 to i32
  %n184.0657 = add i32 %3, %0
  %4 = zext i32 %n184.0657 to i64
  %sext = shl i64 %4, %1
  %conv202 = ashr exact i64 %sext, %1
  %5 = load ptr, ptr %offsets, align 8, !tbaa !4
  %arrayidx.i542 = getelementptr inbounds i64, ptr %5, i64 %conv202
  %6 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  ret i64 %6
}

define i32 @"23"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %2 = load ptr, ptr %el, align 8, !tbaa !45
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %1
  %add.ptr.sroa_idx.prol = getelementptr inbounds i8, ptr %add.ptr.prol, i64 %0
  %3 = load i32, ptr %add.ptr.sroa_idx.prol, align 4
  ret i32 %3
}

define float @"24"(ptr %init_val, ptr %this, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %1 = load ptr, ptr %this, align 8, !tbaa !17
  %add.ptr = getelementptr inbounds float, ptr %1, i64 %0
  %2 = load float, ptr %init_val, align 4, !tbaa !19
  store float %2, ptr %add.ptr, align 4, !tbaa !19
  ret float %2
}

define ptr @"25"(ptr %new_range.i.i, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %0) {
bb:
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !43
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !43
  ret ptr %add.ptr.i
}

define ptr @"26"(ptr %new_range.i.i457, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !16
  %.pre = load ptr, ptr %el, align 8, !tbaa !45
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !45
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !57
  ret ptr %add.ptr6.i.i478
}

define i32 @"27"(ptr %add.ptr3.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !10
  %1 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !10
  %cmp.i.i.i.i.i = icmp slt i32 %0, %1
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add.ptr4.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i.i.i.i
  %2 = load i32, ptr %add.ptr3.i.i.i.i, align 4, !tbaa !10
  store i32 %2, ptr %add.ptr4.i.i.i.i, align 4, !tbaa !10
  ret i32 %2
}

define i64 @"28"(ptr %_M_string_length.i23.i.i.i.phi.trans.insert, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %_M_string_length.i24.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i, i32 1
  %.pre = load i64, ptr %_M_string_length.i23.i.i.i.phi.trans.insert, align 8, !tbaa !58
  store i64 %.pre, ptr %_M_string_length.i24.i.i.i, align 8, !tbaa !58
  ret i64 %.pre
}

define i64 @"29"(ptr %arrayidx.i58, ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, i64 %add7, ptr %arrayidx.i57.1) {
bb:
  %0 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !0
  %1 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !0
  %add7.1 = add nsw i64 %1, %add7
  %add7.2 = add nsw i64 %0, %add7.1
  %2 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !0
  %add7.3 = add nsw i64 %2, %add7.2
  %3 = load i64, ptr %arrayidx.i58, align 8, !tbaa !0
  %add72 = add nsw i64 %3, %add7.3
  store i64 %add7, ptr %arrayidx.i57.1, align 8, !tbaa !0
  ret i64 %add7
}

define i32 @"30"(ptr %num_nodes, i64 %0, ptr %length.i) {
bb:
  %1 = load i64, ptr %num_nodes, align 8, !tbaa !0
  %add = add nsw i64 %1, %0
  %conv.i = trunc i64 %add to i32
  store i32 %conv.i, ptr %length.i, align 4, !tbaa !10
  ret i32 %conv.i
}

define i64 @"31"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !59
  %inc.i71 = add nuw nsw i64 %1, %0
  %inc.i64 = add nuw nsw i64 %inc.i71, %0
  store i64 %inc.i64, ptr %_M_p.i.i.i, align 8, !tbaa !59
  ret i64 %inc.i64
}

define i64 @"32"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %end_size_.i.i) {
bb:
  %2 = load i32, ptr %v, align 4, !tbaa !61
  %sub = add nsw i32 %2, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  %.pre.pre.i = load ptr, ptr %end_size_.i.i, align 8, !tbaa !43
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %.pre.pre.i, align 4, !tbaa.struct !63
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"33"(ptr %__first, ptr %add.ptr.i.us, ptr %add.ptr2.i.us, i64 %sub1.i.us, i64 %mul.i.us, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr2.i.us, align 4, !tbaa !10
  %3 = load i32, ptr %add.ptr.i.us, align 4, !tbaa !10
  %cmp.i.i.us = icmp slt i32 %3, %2
  %spec.select.i.us = select i1 %cmp.i.i.us, i64 %sub1.i.us, i64 %mul.i.us
  %__parent.020.in.i.i.us = add nsw i64 %spec.select.i.us, %0
  %__parent.020.i.i.us = sdiv i64 %__parent.020.in.i.i.us, %1
  %add.ptr.i.i.us = getelementptr inbounds i32, ptr %__first, i64 %__parent.020.i.i.us
  %4 = load i32, ptr %add.ptr.i.i.us, align 4, !tbaa !10
  ret i32 %4
}

define i32 @"34"(ptr %e.sroa.4.0..sroa_idx, ptr %el, ptr %arrayidx.i) {
bb:
  %0 = load i64, ptr %arrayidx.i, align 8, !tbaa !0
  %1 = load ptr, ptr %el, align 8, !tbaa !45
  %arrayidx = getelementptr inbounds i32, ptr %1, i64 %0
  %e.sroa.4.0.copyload = load i32, ptr %e.sroa.4.0..sroa_idx, align 4, !tbaa.struct !64
  store i32 %e.sroa.4.0.copyload, ptr %arrayidx, align 4, !tbaa !10
  ret i32 %e.sroa.4.0.copyload
}

define i32 @"35"(ptr %end_size_.i, ptr %offsets, i64 %0, ptr %length.i138) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i142 = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !65
  %sub.ptr.lhs.cast.i.i141 = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i143 = sub i64 %sub.ptr.lhs.cast.i.i141, %sub.ptr.rhs.cast.i.i142
  %3 = lshr exact i64 %sub.ptr.sub.i.i143, %0
  %conv.i144 = trunc i64 %3 to i32
  store i32 %conv.i144, ptr %length.i138, align 4, !tbaa !10
  ret i32 %conv.i144
}

define ptr @"36"(ptr %out_index.i, ptr %num_nodes_.i) {
bb:
  %0 = load i64, ptr %num_nodes_.i, align 8, !tbaa !66, !noalias !68
  %1 = load ptr, ptr %out_index.i, align 8, !tbaa !16, !noalias !68
  %arrayidx.i.i = getelementptr inbounds ptr, ptr %1, i64 %0
  %2 = load ptr, ptr %arrayidx.i.i, align 8, !tbaa !16, !noalias !68
  ret ptr %2
}

define i32 @"37"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %3 = sub i64 %0, %2
  %n.vec = and i64 %3, %1
  %ind.end = add i64 %2, %n.vec
  %4 = load ptr, ptr %el, align 8, !tbaa !45
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %4, i64 %ind.end
  %5 = load i32, ptr %add.ptr.prol, align 4
  ret i32 %5
}

define i32 @"38"(ptr %call171, ptr %arrayidx.i548, ptr %arrayidx.i549) {
bb:
  %0 = load i64, ptr %arrayidx.i548, align 8, !tbaa !0
  %add.ptr263 = getelementptr inbounds i32, ptr %call171, i64 %0
  %1 = load i32, ptr %arrayidx.i549, align 4, !tbaa !10
  %idx.ext = sext i32 %1 to i64
  %add.ptr266 = getelementptr inbounds i32, ptr %add.ptr263, i64 %idx.ext
  %2 = load i32, ptr %add.ptr266, align 4, !tbaa !10
  ret i32 %2
}

define i32 @"39"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %5 = load ptr, ptr %el, align 8, !tbaa !45
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %ind.end
  %add.ptr.sroa_idx.prol = getelementptr inbounds i8, ptr %add.ptr.prol, i64 %2
  %6 = load i32, ptr %add.ptr.sroa_idx.prol, align 4
  ret i32 %6
}

define i64 @"40"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %end_size_.i.i) {
bb:
  %2 = load i32, ptr %v, align 4, !tbaa !61
  %sub = add nsw i32 %2, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  %3 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !43
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %3, align 4, !tbaa.struct !63
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"41"(ptr %degrees, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %degrees, align 8, !tbaa !9
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul12 = shl i64 %2, %0
  %arrayidx.i32 = getelementptr inbounds i32, ptr %1, i64 %mul12
  %3 = load i32, ptr %arrayidx.i32, align 4, !tbaa !10
  ret i32 %3
}

define i64 @"42"(ptr %new_range.i.i, i64 %0) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %incdec.ptr.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i = load i64, ptr %incdec.ptr.i.i.i.i, align 4, !tbaa.struct !63
  ret i64 %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i
}

define i8 @"43"(ptr %arrayidx.i17.i, ptr %agg.tmp11, ptr %max_iters_, i32 %0, i64 %idxprom1.i.i) {
bb:
  %1 = load i32, ptr %max_iters_, align 4, !tbaa !30
  %__val.lobit.i = lshr i32 %1, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %2 = load ptr, ptr %agg.tmp11, align 8, !tbaa !41, !alias.scope !27
  %arrayidx.i.i = getelementptr inbounds i8, ptr %2, i64 %conv5.i
  %arrayidx2.i.i = getelementptr inbounds i8, ptr %arrayidx.i.i, i64 %idxprom1.i.i
  %3 = load i8, ptr %arrayidx.i17.i, align 1, !tbaa !26, !noalias !27
  store i8 %3, ptr %arrayidx2.i.i, align 1, !tbaa !26
  ret i8 %3
}

define ptr @"44"(ptr %call.i, ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, i64 %2, ptr %end_size_.i40) {
bb:
  %3 = load ptr, ptr %degrees, align 8, !tbaa !9
  %sub.ptr.rhs.cast.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %end_size_.i, align 8, !tbaa !7
  %sub.ptr.lhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %sub = add nsw i64 %sub.ptr.div.i, %1
  %div38 = lshr i64 %sub, %2
  %add.ptr.i = getelementptr inbounds i64, ptr %call.i, i64 %div38
  store ptr %add.ptr.i, ptr %end_size_.i40, align 8, !tbaa !65
  ret ptr %add.ptr.i
}

define i64 @"45"(ptr %arrayidx.i, i64 %0, ptr %offsets, ptr %__begin0.0640) {
bb:
  %1 = load i64, ptr %arrayidx.i, align 8, !tbaa !0
  %inc = add nsw i64 %1, %0
  %e.sroa.0.0.copyload = load i32, ptr %__begin0.0640, align 4, !tbaa.struct !63
  %conv = sext i32 %e.sroa.0.0.copyload to i64
  %2 = load ptr, ptr %offsets, align 8, !tbaa !4
  %arrayidx.i2 = getelementptr inbounds i64, ptr %2, i64 %conv
  store i64 %inc, ptr %arrayidx.i, align 8, !tbaa !0
  ret i64 %inc
}

define i64 @"46"(ptr %max_seen.i, i32 %0, ptr %num_nodes_) {
bb:
  %1 = load i32, ptr %max_seen.i, align 4, !tbaa !10
  %add = add nsw i32 %1, %0
  %conv = sext i32 %add to i64
  store i64 %conv, ptr %num_nodes_, align 8, !tbaa !55
  ret i64 %conv
}

define ptr @"47"(ptr %new_range.i.i, ptr %end_size_.i, ptr %el, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !43
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %.pre710.pre = load ptr, ptr %el, align 8, !tbaa !45
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre710.pre to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !57
  ret ptr %add.ptr6.i.i
}

define i32 @"48"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3) {
bb:
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add15 = add i64 %ind.end, %2
  %6 = load ptr, ptr %el, align 8, !tbaa !45
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %6, i64 %add15
  %add.ptr.sroa_idx.1 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %3
  %7 = load i32, ptr %add.ptr.sroa_idx.1, align 4
  ret i32 %7
}

define i64 @"49"(ptr %new_range.i.i, i64 %0) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !63
  ret i64 %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i
}

define i32 @"50"(ptr %el, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %1 = load ptr, ptr %el, align 8, !tbaa !45
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %0
  %2 = load i32, ptr %add.ptr, align 4
  ret i32 %2
}

define i64 @"51"(ptr %arrayidx.i58.epil, i64 %total.076.epil, ptr %arrayidx.i57.epil) {
bb:
  %0 = load i64, ptr %arrayidx.i58.epil, align 8, !tbaa !0
  %add7.epil = add nsw i64 %0, %total.076.epil
  store i64 %add7.epil, ptr %arrayidx.i57.epil, align 8, !tbaa !0
  ret i64 %add7.epil
}

define float @"52"(ptr %arrayidx.i, ptr %arrayidx.i27, ptr %0, i64 %1, i64 %2, ptr %outgoing_contrib, i32 %cond, ptr %.omp.lb, i64 %3) {
bb:
  %4 = load float, ptr %arrayidx.i, align 4, !tbaa !19
  %wide.load32 = load <2 x ptr>, ptr %0, align 8, !tbaa !16
  %vector.recur.extract = extractelement <2 x ptr> %wide.load32, i64 %1
  %sub.ptr.rhs.cast.i = ptrtoint ptr %vector.recur.extract to i64
  %5 = load ptr, ptr %arrayidx.i27, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i = ptrtoint ptr %5 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %2
  %conv12 = sitofp i64 %sub.ptr.div.i to float
  %div13 = fdiv float %4, %conv12
  %6 = load ptr, ptr %outgoing_contrib, align 8, !tbaa !17
  %7 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %8 = sub i32 %cond, %7
  %9 = zext i32 %8 to i64
  %10 = add nuw nsw i64 %9, %1
  %n.vec = and i64 %10, %3
  %11 = sext i32 %7 to i64
  %ind.end = add nsw i64 %n.vec, %11
  %arrayidx.i28 = getelementptr inbounds float, ptr %6, i64 %ind.end
  store float %div13, ptr %arrayidx.i28, align 4, !tbaa !19
  ret float %div13
}

define i32 @"53"(ptr %num_nodes_.i, i64 %0, ptr %add.ptr.i) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !66
  %n.vec = and i64 %1, %0
  %2 = trunc i64 %n.vec to i32
  store i32 %2, ptr %add.ptr.i, align 4, !tbaa !71
  ret i32 %2
}

define <2 x ptr> @"54"(ptr %out_index_.i, i64 %index, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %out_index_.i, align 8, !tbaa !73
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %3 = sext i32 %2 to i64
  %offset.idx = add i64 %index, %3
  %4 = add nsw i64 %offset.idx, %0
  %5 = getelementptr inbounds ptr, ptr %1, i64 %4
  %wide.load32 = load <2 x ptr>, ptr %5, align 8, !tbaa !16
  ret <2 x ptr> %wide.load32
}

define i32 @"55"(ptr %.omp.lb, ptr %permutation, i64 %indvars.iv) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %1 = sext i32 %0 to i64
  %2 = trunc i64 %1 to i32
  %3 = load ptr, ptr %permutation, align 8, !tbaa !9
  %arrayidx.i = getelementptr inbounds i32, ptr %3, i64 %indvars.iv
  store i32 %2, ptr %arrayidx.i, align 4, !tbaa !10
  ret i32 %2
}

define ptr @"56"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !45
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !43
  ret ptr %add.ptr.i
}

define ptr @"57"(ptr %this, i64 %0, i32 %1, ptr %__first.addr.07.i.i.i.i) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !16
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %2, i64 %0, i32 2
  store ptr %3, ptr %__first.addr.07.i.i.i.i, align 8, !tbaa !41, !alias.scope !74, !noalias !77
  ret ptr %3
}

define i32 @"58"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.1659, ptr %arrayidx.i541) {
bb:
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %.pre731 = sext i32 %.pre717 to i64
  %sub222 = sub nsw i64 %total_missing_inv.1659, %.pre731
  %1 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  %i200.0 = add nsw i64 %1, %0
  %sub211 = sub nsw i64 %i200.0, %sub222
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %2 = load i32, ptr %arrayidx212, align 4, !tbaa !10
  ret i32 %2
}

define i64 @"59"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57) {
bb:
  %0 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !0
  %1 = load i64, ptr %arrayidx.i58, align 8, !tbaa !0
  %add7 = add nsw i64 %1, %total.076
  %2 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !0
  %add7.1 = add nsw i64 %2, %add7
  %add7.2 = add nsw i64 %0, %add7.1
  %3 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !0
  %add7.3 = add nsw i64 %3, %add7.2
  store i64 %add7.3, ptr %arrayidx.i57, align 8, !tbaa !0
  ret i64 %add7.3
}

define i32 @"60"(ptr %call171, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %0, i64 %1, i64 %total_missing_inv.0649, ptr %arrayidx.i536) {
bb:
  %2 = load i32, ptr %arrayidx.i536, align 4, !tbaa !10
  %conv155 = sext i32 %2 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %3 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  %4 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %conv198 = sext i32 %4 to i64
  %5 = load i64, ptr %arrayidx.i540, align 8, !tbaa !0
  %add199 = add nsw i64 %5, %conv198
  %6 = sub i64 %3, %add199
  %n.vec793 = and i64 %6, %0
  %ind.end794 = sub i64 %3, %n.vec793
  %i200.0 = add nsw i64 %ind.end794, %1
  %sub211 = sub nsw i64 %i200.0, %add156
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %7 = load i32, ptr %arrayidx212, align 4, !tbaa !10
  ret i32 %7
}

define i64 @"61"(ptr %add.ptr.i.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, ptr %v.i.i.i.i.i.i, ptr %v3.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %add.ptr.i.i.i.i.i, align 4
  %2 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !46
  %3 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !46
  %cmp7.i.i.i.i.i.i = icmp slt i32 %3, %2
  %4 = load i32, ptr %v.i.i.i.i.i.i, align 4
  %5 = load i32, ptr %v3.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i = icmp slt i32 %4, %5
  %cmp.i.i.i.i.i.i = icmp eq i32 %3, %2
  %cond.i.i.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i1 %cmp4.i.i.i.i.i.i, i1 %cmp7.i.i.i.i.i.i
  %spec.select.i.i.i.i = select i1 %cond.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %add.ptr2.i.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %sub12.i.i.i.i
  store i64 %1, ptr %add.ptr2.i.i.i.i.i, align 4
  ret i64 %1
}

define ptr @"62"(ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0, i32 %1, ptr %add.ptr) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i, i32 2
  store ptr %3, ptr %add.ptr, align 8, !tbaa !79
  ret ptr %3
}

define i64 @"63"(ptr %this, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %this, align 8, !tbaa !45
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %arrayidx = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %1
  %2 = load i64, ptr %arrayidx, align 4
  ret i64 %2
}

define <2 x i64> @"64"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %rng, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
bb:
  %wide.load91 = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %10 = load i64, ptr %rng, align 8, !tbaa !0
  %vector.recur.init89 = insertelement <2 x i64> %2, i64 %10, i64 %3
  %11 = shufflevector <2 x i64> %vector.recur.init89, <2 x i64> %wide.load91, <2 x i32> <i32 1, i32 2>
  %12 = and <2 x i64> %11, %4
  %13 = and <2 x i64> %wide.load91, %1
  %14 = or <2 x i64> %13, %12
  %15 = lshr exact <2 x i64> %14, %5
  %wide.load92 = load <2 x i64>, ptr %6, align 8, !tbaa !0
  %16 = xor <2 x i64> %15, %wide.load92
  %17 = and <2 x i64> %wide.load91, %5
  %18 = icmp eq <2 x i64> %17, %7
  %19 = select <2 x i1> %18, <2 x i64> %7, <2 x i64> %8
  %20 = xor <2 x i64> %16, %19
  store <2 x i64> %20, ptr %9, align 8, !tbaa !0
  ret <2 x i64> %20
}

define i32 @"65"(ptr %arrayidx212, ptr %call171, ptr %arrayidx.i539, i64 %0) {
bb:
  %1 = load i32, ptr %arrayidx212, align 4, !tbaa !10
  %2 = load i64, ptr %arrayidx.i539, align 8, !tbaa !0
  %sub183 = add nsw i64 %2, %0
  %arrayidx213 = getelementptr inbounds i32, ptr %call171, i64 %sub183
  store i32 %1, ptr %arrayidx213, align 4, !tbaa !10
  ret i32 %1
}

define <4 x i32> @"66"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.0649, ptr %arrayidx.i536, i64 %1) {
bb:
  %2 = load i32, ptr %arrayidx.i536, align 4, !tbaa !10
  %conv155 = sext i32 %2 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %3 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  %4 = add i64 %3, %0
  %5 = sub nsw i64 %4, %add156
  %6 = getelementptr inbounds i32, ptr %call171, i64 %5
  %7 = getelementptr inbounds i32, ptr %6, i64 %1
  %wide.load803 = load <4 x i32>, ptr %7, align 4, !tbaa !10
  ret <4 x i32> %wide.load803
}

define i32 @"67"(i64 %indvars.iv699, ptr %incdec.ptr4.sink.i.i.i.i569, ptr %__first.addr.015.i.i563, ptr %call171, ptr %arrayidx.i550, i64 %sub.ptr.rhs.cast.i.i.i.i552, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %incdec.ptr4.sink.i.i.i.i569, align 4, !tbaa !10
  %3 = sext i32 %2 to i64
  %cmp.i.i.i570 = icmp sgt i64 %indvars.iv699, %3
  %4 = load i64, ptr %arrayidx.i550, align 8, !tbaa !0
  %add.ptr271 = getelementptr inbounds i32, ptr %call171, i64 %4
  %sub.ptr.lhs.cast.i.i.i.i551 = ptrtoint ptr %add.ptr271 to i64
  %sub.ptr.sub.i.i.i.i553 = sub i64 %sub.ptr.lhs.cast.i.i.i.i551, %sub.ptr.rhs.cast.i.i.i.i552
  %sub.ptr.div.i.i.i.i561 = lshr exact i64 %sub.ptr.sub.i.i.i.i553, %0
  %shr.i.i565 = lshr i64 %sub.ptr.div.i.i.i.i561, %1
  %incdec.ptr4.sink.i.i.i.i5692 = getelementptr inbounds i32, ptr %__first.addr.015.i.i563, i64 %shr.i.i565
  %incdec.ptr.i.i571 = getelementptr inbounds i32, ptr %incdec.ptr4.sink.i.i.i.i569, i64 %1
  %__first.addr.1.i.i574 = select i1 %cmp.i.i.i570, ptr %incdec.ptr.i.i571, ptr %__first.addr.015.i.i563
  %5 = load i32, ptr %__first.addr.1.i.i574, align 4, !tbaa !10
  ret i32 %5
}

define <4 x float> @"68"(<4 x float> %0, ptr %init_val, i64 %1, ptr %this, ptr %.omp.lb, i64 %index) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %offset.idx = add i64 %2, %index
  %3 = load ptr, ptr %this, align 8, !tbaa !17
  %4 = getelementptr inbounds float, ptr %3, i64 %offset.idx
  %5 = load float, ptr %init_val, align 4, !tbaa !19, !alias.scope !21
  %broadcast.splatinsert21 = insertelement <4 x float> %0, float %5, i64 %1
  %broadcast.splat22 = shufflevector <4 x float> %broadcast.splatinsert21, <4 x float> %0, <4 x i32> zeroinitializer
  store <4 x float> %broadcast.splat22, ptr %4, align 4, !tbaa !19, !alias.scope !24, !noalias !21
  ret <4 x float> %broadcast.splat22
}

define <4 x i32> @"69"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.1659, ptr %arrayidx.i541, i64 %1) {
bb:
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %.pre731 = sext i32 %.pre717 to i64
  %sub222 = sub nsw i64 %total_missing_inv.1659, %.pre731
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  %3 = add i64 %2, %0
  %4 = sub nsw i64 %3, %sub222
  %5 = getelementptr inbounds i32, ptr %call171, i64 %4
  %6 = getelementptr inbounds i32, ptr %5, i64 %1
  %wide.load803 = load <4 x i32>, ptr %6, align 4, !tbaa !10
  ret <4 x i32> %wide.load803
}

define float @"70"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load float, ptr %init_val, align 4, !tbaa !19
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add7 = add i64 %ind.end, %2
  %6 = load ptr, ptr %this, align 8, !tbaa !17
  %add.ptr.1 = getelementptr inbounds float, ptr %6, i64 %add7
  store float %3, ptr %add.ptr.1, align 4, !tbaa !19
  ret float %3
}

define i64 @"71"(i64 %val.coerce, ptr %new_range.i, ptr %end_size_.i, ptr %this, i64 %0) {
bb:
  %1 = load ptr, ptr %end_size_.i, align 8, !tbaa !43
  %sub.ptr.lhs.cast.i10.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %this, align 8, !tbaa !45
  %sub.ptr.rhs.cast.i11.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i12.i = sub i64 %sub.ptr.lhs.cast.i10.i, %sub.ptr.rhs.cast.i11.i
  %sub.ptr.div.i13.i = ashr exact i64 %sub.ptr.sub.i12.i, %0
  %3 = load ptr, ptr %new_range.i, align 8, !tbaa !16
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div.i13.i
  store i64 %val.coerce, ptr %add.ptr.i, align 4, !tbaa.struct !63
  ret i64 %val.coerce
}

define float @"72"(ptr %arrayidx.i.prol, ptr %call5.i.i.i.i4.i.i45, ptr %num_nodes_.i, i64 %0, i32 %1) {
bb:
  %2 = load float, ptr %arrayidx.i.prol, align 4, !tbaa !19
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !66
  %n.vec = and i64 %3, %0
  %second3.i.prol = getelementptr inbounds %"struct.std::pair", ptr %call5.i.i.i.i4.i.i45, i64 %n.vec, i32 1
  store float %2, ptr %second3.i.prol, align 4, !tbaa !80
  ret float %2
}

define i64 @"73"(ptr %new_range.i.i, i64 %0, i64 %1) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr13.i.i.i.i, i64 %1
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.030.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define <8 x i32> @"74"(ptr %el, ptr %.omp.lb, i64 %index, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !45
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %offset.idx = add i64 %2, %index
  %3 = add i64 %offset.idx, %0
  %4 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %3
  %wide.vec44 = load <8 x i32>, ptr %4, align 4
  ret <8 x i32> %wide.vec44
}

define ptr @"75"(ptr %neighs, ptr %arrayidx.i.prol, ptr %index, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %1 = sext i32 %0 to i64
  %2 = load ptr, ptr %index, align 8, !tbaa !16
  %arrayidx.prol = getelementptr inbounds ptr, ptr %2, i64 %1
  %3 = load i64, ptr %arrayidx.i.prol, align 8, !tbaa !0
  %4 = load ptr, ptr %neighs, align 8, !tbaa !16
  %add.ptr.prol = getelementptr inbounds i32, ptr %4, i64 %3
  store ptr %add.ptr.prol, ptr %arrayidx.prol, align 8, !tbaa !16
  ret ptr %add.ptr.prol
}

define i32 @"76"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !10
  %3 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !10
  %cmp.i.i.i.i.i = icmp slt i32 %2, %3
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %__parent.020.in.i.i.i.i.i = add nsw i64 %sub12.i.i.i.i, %1
  %__parent.020.i.i45.i.i.i = lshr i64 %__parent.020.in.i.i.i.i.i, %0
  %add.ptr.i.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %__parent.020.i.i45.i.i.i
  %4 = load i32, ptr %add.ptr.i.i.i.i.i, align 4, !tbaa !10
  ret i32 %4
}

define ptr @"77"(ptr %new_range.i.i, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !45
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !45
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !43
  ret ptr %add.ptr.i464
}

define ptr @"78"(ptr %neighs, ptr %arrayidx.i.1, ptr %index, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !0
  %2 = load ptr, ptr %neighs, align 8, !tbaa !16
  %add.ptr.1 = getelementptr inbounds i32, ptr %2, i64 %1
  %3 = load ptr, ptr %index, align 8, !tbaa !16
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %5 = sext i32 %4 to i64
  %indvars.iv.next = add nsw i64 %5, %0
  %arrayidx.1 = getelementptr inbounds ptr, ptr %3, i64 %indvars.iv.next
  store ptr %add.ptr.1, ptr %arrayidx.1, align 8, !tbaa !16
  ret ptr %add.ptr.1
}

define i64 @"79"(ptr %arrayidx.i492.1, ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i492.1, align 8, !tbaa !0
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %4 = and i64 %3, %0
  %indvars.iv.next = add nsw i64 %4, %1
  %5 = load ptr, ptr %offsets, align 8
  %arrayidx.i493.1 = getelementptr inbounds i64, ptr %5, i64 %indvars.iv.next
  store i64 %2, ptr %arrayidx.i493.1, align 8, !tbaa !0
  ret i64 %2
}

define i32 @"80"(ptr %neighs, ptr %arrayidx.i522) {
bb:
  %0 = load i64, ptr %arrayidx.i522, align 8, !tbaa !0
  %1 = load ptr, ptr %neighs, align 8, !tbaa !16
  %arrayidx112 = getelementptr inbounds i32, ptr %1, i64 %0
  %2 = load i32, ptr %arrayidx112, align 4, !tbaa !10
  ret i32 %2
}

define i32 @"81"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add15 = add i64 %ind.end, %2
  %5 = load ptr, ptr %el, align 8, !tbaa !45
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %add15
  %6 = load i32, ptr %add.ptr.1, align 4
  ret i32 %6
}

define i64 @"82"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !59
  %inc.i71 = add nuw nsw i64 %1, %0
  %inc.i207 = add nuw nsw i64 %inc.i71, %0
  %inc.i139 = add nuw nsw i64 %inc.i207, %0
  store i64 %inc.i139, ptr %_M_p.i.i.i, align 8, !tbaa !59
  ret i64 %inc.i139
}

define i64 @"83"(ptr %arrayidx.i58.epil, i64 %total.076.epil, ptr %call.i4145, ptr %num_blocks) {
bb:
  %0 = load i64, ptr %num_blocks, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds i64, ptr %call.i4145, i64 %0
  %1 = load i64, ptr %arrayidx.i58.epil, align 8, !tbaa !0
  %add7.epil = add nsw i64 %1, %total.076.epil
  store i64 %add7.epil, ptr %arrayidx.i, align 8, !tbaa !0
  ret i64 %add7.epil
}

define i64 @"84"(ptr %.omp.lb, i64 %0, i64 %1, ptr %rng) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add10 = add i64 %2, %0
  %rem.i.i.i = and i64 %add10, %1
  store i64 %rem.i.i.i, ptr %rng, align 8, !tbaa !0
  ret i64 %rem.i.i.i
}

define ptr @"85"(ptr %new_range.i.i457, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !16
  %.pre710.pre = load ptr, ptr %el, align 8, !tbaa !45
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre710.pre, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !45
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !57
  ret ptr %add.ptr6.i.i478
}

define float @"86"(ptr %scores, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load ptr, ptr %scores, align 8, !tbaa !17
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !66
  %n.vec = and i64 %2, %0
  %arrayidx.i = getelementptr inbounds float, ptr %1, i64 %n.vec
  %3 = load float, ptr %arrayidx.i, align 4, !tbaa !19
  ret float %3
}

define i64 @"87"(ptr %arrayidx.i, ptr %prefix, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i, align 8, !tbaa !0
  %2 = load ptr, ptr %prefix, align 8
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul14 = shl i64 %3, %0
  %arrayidx.i35 = getelementptr inbounds i64, ptr %2, i64 %mul14
  store i64 %1, ptr %arrayidx.i35, align 8, !tbaa !0
  ret i64 %1
}

define i64 @"88"(ptr %offsets, ptr %num_nodes_.i) {
bb:
  %.pre716.pre727 = load ptr, ptr %offsets, align 8, !tbaa !4
  %0 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %arrayidx.i533 = getelementptr inbounds i64, ptr %.pre716.pre727, i64 %0
  %1 = load i64, ptr %arrayidx.i533, align 8, !tbaa !0
  ret i64 %1
}

define i32 @"89"(ptr %num_nodes_.i, i32 %0, ptr %.omp.ub) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !66
  %conv = trunc i64 %1 to i32
  %sub3 = add nsw i32 %conv, %0
  store i32 %sub3, ptr %.omp.ub, align 4, !tbaa !10
  ret i32 %sub3
}

define i64 @"90"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !59
  %inc.i71 = add nuw nsw i64 %2, %1
  %inc.i207 = add nuw nsw i64 %inc.i71, %1
  %arrayidx.i140 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i207
  %3 = load i64, ptr %arrayidx.i140, align 8, !tbaa !0
  ret i64 %3
}

define i64 @"91"(ptr %arrayidx.i18.i, ptr %0, i64 %1, ptr %2) {
bb:
  %3 = load ptr, ptr %0, align 8, !tbaa !16, !noalias !68
  %sub.ptr.rhs.cast.i20.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %arrayidx.i18.i, align 8, !tbaa !16, !noalias !68
  %sub.ptr.lhs.cast.i19.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i21.i = sub i64 %sub.ptr.lhs.cast.i19.i, %sub.ptr.rhs.cast.i20.i
  %sub.ptr.div.i22.i = ashr exact i64 %sub.ptr.sub.i21.i, %1
  %div.i.i = sdiv i64 %sub.ptr.div.i22.i, %1
  store i64 %div.i.i, ptr %2, align 8, !alias.scope !68
  ret i64 %div.i.i
}

define i64 @"92"(ptr %add.ptr.i.i.i.i16, ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i64, ptr %add.ptr.i.i.i.i16, align 4
  %1 = load i32, ptr %v3.i.i.i.i.i, align 4
  %2 = load i32, ptr %v.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %2, %1
  %3 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !46
  %4 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !46
  %cmp7.i.i.i.i.i = icmp slt i32 %4, %3
  %cmp.i.i.i.i.i = icmp eq i32 %4, %3
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr2.i.i.i.i23 = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  store i64 %0, ptr %add.ptr2.i.i.i.i23, align 4
  ret i64 %0
}

define i32 @"93"(ptr %num_nodes_.i, i64 %0, i64 %1, ptr %add.ptr.i.1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !66
  %n.vec = and i64 %2, %0
  %indvars.iv.next = add nuw nsw i64 %n.vec, %1
  %3 = trunc i64 %indvars.iv.next to i32
  store i32 %3, ptr %add.ptr.i.1, align 4, !tbaa !71
  ret i32 %3
}

define i32 @"94"(ptr %__first.addr.033.i.i, ptr %n_start.0.in, i64 %0) {
bb:
  %1 = load i32, ptr %__first.addr.033.i.i, align 4, !tbaa !10
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  store i32 %1, ptr %incdec.ptr12.i.i.i.i, align 4, !tbaa !10
  ret i32 %1
}

define i64 @"95"(ptr %el, i64 %0) {
bb:
  %.pre710.pre = load ptr, ptr %el, align 8, !tbaa !45
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre710.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !63
  ret i64 %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i
}

define i64 @"96"(ptr %new_range.i.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %agg.tmp.sroa.0.0.copyload.i.i.i.i.i = load i64, ptr %.pre.i.i, align 4, !tbaa.struct !63
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i.i.i
}

define i32 @"97"(ptr %neighs, ptr %arrayidx.i523) {
bb:
  %0 = load ptr, ptr %neighs, align 8, !tbaa !16
  %1 = load i64, ptr %arrayidx.i523, align 8, !tbaa !0
  %add.ptr = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %add.ptr, align 4, !tbaa !10
  ret i32 %2
}

define i32 @"98"(ptr %n_start.0.in, i64 %0, i64 %1, ptr %diffs, ptr %.omp.lb) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  %incdec.ptr7.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %.pre134 = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %.pre134
  %2 = lshr exact i64 %sub.ptr.sub, %1
  %conv22 = trunc i64 %2 to i32
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %4 = sext i32 %3 to i64
  %5 = load ptr, ptr %diffs, align 8, !tbaa !9
  %arrayidx.i99 = getelementptr inbounds i32, ptr %5, i64 %4
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !10
  ret i32 %conv22
}

define double @"99"(ptr %error, ptr %error4) {
bb:
  %0 = load double, ptr %error4, align 8, !tbaa !81
  %1 = load double, ptr %error, align 8, !tbaa !81
  %add33 = fadd double %1, %0
  store double %add33, ptr %error, align 8, !tbaa !81
  ret double %add33
}

define ptr @"100"(ptr %new_range.i.i457, ptr %new_range.i.i, i64 %0, ptr %el, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !16
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !45
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !57
  ret ptr %add.ptr6.i.i478
}

define i32 @"101"(ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %v3.i.i.i.i.i, align 4
  %3 = load i32, ptr %v.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %3, %2
  %4 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !46
  %5 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !46
  %cmp7.i.i.i.i.i = icmp slt i32 %5, %4
  %cmp.i.i.i.i.i = icmp eq i32 %5, %4
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %__parent.020.in.i.i.i.i = add nsw i64 %spec.select.i.i.i, %0
  %__parent.020.i.i.i.i = sdiv i64 %__parent.020.in.i.i.i.i, %1
  %add.ptr.i.i.i.i16 = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %__parent.020.i.i.i.i
  %6 = load i32, ptr %add.ptr.i.i.i.i16, align 4, !tbaa !46
  ret i32 %6
}

define float @"102"(float %0, ptr %num_nodes_.i, ptr %base_score) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !66
  %conv = sitofp i64 %1 to float
  %div3 = fdiv float %0, %conv
  store float %div3, ptr %base_score, align 4, !tbaa !19
  ret float %div3
}

define ptr @"103"(ptr %cond.i31, i64 %.sroa.speculated.i, ptr %_M_finish.i.i, ptr %this, i64 %0, i64 %sub.ptr.div.i.i, i1 %cmp9.i, i64 %1, i64 %add.i, ptr %_M_end_of_storage) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !82
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i2 = ashr exact i64 %sub.ptr.sub.i.i, %0
  %add.i4 = add i64 %.sroa.speculated.i, %sub.ptr.div.i.i
  %cmp7.i = icmp ult i64 %add.i, %sub.ptr.div.i.i
  %or.cond.i = or i1 %cmp7.i, %cmp9.i
  %cond.i = select i1 %or.cond.i, i64 %1, i64 %add.i
  %add.ptr19 = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %cond.i
  store ptr %add.ptr19, ptr %_M_end_of_storage, align 8, !tbaa !83
  ret ptr %add.ptr19
}

define i32 @"104"(ptr %incdec.ptr.i, i64 %0, ptr %second3.i29.i.i.i) {
bb:
  %__value.sroa.0.0.copyload.i = load i64, ptr %incdec.ptr.i, align 4
  %__value.sroa.3.0.extract.shift.i.i.i = lshr i64 %__value.sroa.0.0.copyload.i, %0
  %__value.sroa.3.0.extract.trunc.i.i.i = trunc i64 %__value.sroa.3.0.extract.shift.i.i.i to i32
  store i32 %__value.sroa.3.0.extract.trunc.i.i.i, ptr %second3.i29.i.i.i, align 4, !tbaa !84
  ret i32 %__value.sroa.3.0.extract.trunc.i.i.i
}

define float @"105"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %3 = sub i64 %0, %2
  %n.vec = and i64 %3, %1
  %ind.end = add i64 %2, %n.vec
  %4 = load ptr, ptr %this, align 8, !tbaa !17
  %add.ptr = getelementptr inbounds float, ptr %4, i64 %ind.end
  %5 = load float, ptr %init_val, align 4, !tbaa !19
  store float %5, ptr %add.ptr, align 4, !tbaa !19
  ret float %5
}

define ptr @"106"(ptr %call5.i.i.i.i4.i.i45, ptr %num_nodes_.i, i64 %0, ptr %_M_finish.i.i9.i80) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !66
  %mul.i.i.i.i.i.i = shl nuw nsw i64 %1, %0
  %scevgep.i.i.i.i.i = getelementptr i8, ptr %call5.i.i.i.i4.i.i45, i64 %mul.i.i.i.i.i.i
  store ptr %scevgep.i.i.i.i.i, ptr %_M_finish.i.i9.i80, align 8, !tbaa !86
  ret ptr %scevgep.i.i.i.i.i
}

define ptr @"107"(ptr %el, i64 %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !45
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %.pre710.pre = load ptr, ptr %el, align 8, !tbaa !45
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre710.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !43
  ret ptr %add.ptr.i
}

define <4 x i32> @"108"(ptr %0, ptr %call171, i64 %tail_index.0660, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %1, i64 %index800, i64 %2) {
bb:
  %wide.load803 = load <4 x i32>, ptr %0, align 4, !tbaa !10
  %3 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %conv198 = sext i32 %3 to i64
  %4 = load i64, ptr %arrayidx.i540, align 8, !tbaa !0
  %add199 = add nsw i64 %4, %conv198
  %5 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  %6 = sub i64 %5, %add199
  %n.vec793 = and i64 %6, %1
  %ind.end796 = sub i64 %tail_index.0660, %n.vec793
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %.pre731 = sext i32 %.pre717 to i64
  %sub226 = sub nsw i64 %ind.end796, %.pre731
  %offset.idx801 = sub i64 %sub226, %index800
  %7 = getelementptr inbounds i32, ptr %call171, i64 %offset.idx801
  %8 = getelementptr inbounds i32, ptr %7, i64 %2
  store <4 x i32> %wide.load803, ptr %8, align 4, !tbaa !10
  ret <4 x i32> %wide.load803
}

define i8 @"109"(ptr %label) {
bb:
  %0 = load ptr, ptr %label, align 8, !tbaa !41, !noalias !88
  %1 = load i8, ptr %0, align 1, !tbaa !26
  ret i8 %1
}

define ptr @"110"(ptr %__args, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0) {
bb:
  %1 = load ptr, ptr %this, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %1 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %add.ptr = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i
  %2 = load ptr, ptr %__args, align 8, !tbaa !41
  store ptr %2, ptr %add.ptr, align 8, !tbaa !41
  ret ptr %2
}

define i64 @"111"(ptr %incdec.ptr126.i.i, ptr %el, i64 %0) {
bb:
  %1 = load i64, ptr %incdec.ptr126.i.i, align 4
  %.pre = load ptr, ptr %el, align 8, !tbaa !45
  %incdec.ptr5.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  store i64 %1, ptr %incdec.ptr5.i.i, align 4
  ret i64 %1
}

define ptr @"112"(ptr %index.i139, ptr %0) {
bb:
  %1 = load ptr, ptr %index.i139, align 8, !tbaa !16
  store ptr %1, ptr %0, align 8
  ret ptr %1
}

define i64 @"113"(ptr %arrayidx.i492.prol, ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i492.prol, align 8, !tbaa !0
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %4 = and i64 %3, %0
  %arrayidx.i493.prol = getelementptr inbounds i64, ptr %2, i64 %4
  store i64 %1, ptr %arrayidx.i493.prol, align 8, !tbaa !0
  ret i64 %1
}

define i64 @"114"(ptr %arrayidx.i492, ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i492, align 8, !tbaa !0
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %3 = and i64 %2, %0
  %4 = load ptr, ptr %offsets, align 8
  %arrayidx.i493 = getelementptr inbounds i64, ptr %4, i64 %3
  store i64 %1, ptr %arrayidx.i493, align 8, !tbaa !0
  ret i64 %1
}

define float @"115"(ptr %arrayidx.i, ptr %arrayidx.i27, ptr %arrayidx4.i.phi.trans.insert, i64 %0, ptr %outgoing_contrib, i32 %cond, ptr %.omp.lb, i64 %1, i64 %2) {
bb:
  %3 = load float, ptr %arrayidx.i, align 4, !tbaa !19
  %.pre = load ptr, ptr %arrayidx4.i.phi.trans.insert, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i = ptrtoint ptr %.pre to i64
  %4 = load ptr, ptr %arrayidx.i27, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %conv12 = sitofp i64 %sub.ptr.div.i to float
  %div13 = fdiv float %3, %conv12
  %5 = load ptr, ptr %outgoing_contrib, align 8, !tbaa !17
  %6 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %7 = sub i32 %cond, %6
  %8 = zext i32 %7 to i64
  %9 = add nuw nsw i64 %8, %1
  %n.vec = and i64 %9, %2
  %10 = sext i32 %6 to i64
  %ind.end = add nsw i64 %n.vec, %10
  %arrayidx.i28 = getelementptr inbounds float, ptr %5, i64 %ind.end
  store float %div13, ptr %arrayidx.i28, align 4, !tbaa !19
  ret float %div13
}

define ptr @"116"(ptr %new_range.i.i457, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1, ptr %el, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !16
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !43
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !45
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !57
  ret ptr %add.ptr6.i.i478
}

define i64 @"117"(i64 %lsum.036, ptr %arrayidx.i32, ptr %local_sums, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %local_sums, align 8, !tbaa !4
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds i64, ptr %0, i64 %1
  %2 = load i32, ptr %arrayidx.i32, align 4, !tbaa !10
  %conv = sext i32 %2 to i64
  %add16 = add nsw i64 %lsum.036, %conv
  store i64 %add16, ptr %arrayidx.i, align 8, !tbaa !0
  ret i64 %add16
}

define i32 @"118"(ptr %call171, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %0, i64 %1, i64 %total_missing_inv.1659) {
bb:
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %.pre731 = sext i32 %.pre717 to i64
  %sub222 = sub nsw i64 %total_missing_inv.1659, %.pre731
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  %3 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %conv198 = sext i32 %3 to i64
  %4 = load i64, ptr %arrayidx.i540, align 8, !tbaa !0
  %add199 = add nsw i64 %4, %conv198
  %5 = sub i64 %2, %add199
  %n.vec793 = and i64 %5, %0
  %ind.end794 = sub i64 %2, %n.vec793
  %i200.0 = add nsw i64 %ind.end794, %1
  %sub211 = sub nsw i64 %i200.0, %sub222
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %6 = load i32, ptr %arrayidx212, align 4, !tbaa !10
  ret i32 %6
}

define float @"119"(ptr %arrayidx.i.prol, ptr %arrayidx.i27.prol, ptr %0, i64 %1, i64 %2, ptr %outgoing_contrib, i32 %cond, ptr %.omp.lb, i64 %3) {
bb:
  %4 = load float, ptr %arrayidx.i.prol, align 4, !tbaa !19
  %wide.load32 = load <2 x ptr>, ptr %0, align 8, !tbaa !16
  %vector.recur.extract = extractelement <2 x ptr> %wide.load32, i64 %1
  %sub.ptr.rhs.cast.i.prol = ptrtoint ptr %vector.recur.extract to i64
  %5 = load ptr, ptr %arrayidx.i27.prol, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i.prol = ptrtoint ptr %5 to i64
  %sub.ptr.sub.i.prol = sub i64 %sub.ptr.lhs.cast.i.prol, %sub.ptr.rhs.cast.i.prol
  %sub.ptr.div.i.prol = ashr exact i64 %sub.ptr.sub.i.prol, %2
  %conv12.prol = sitofp i64 %sub.ptr.div.i.prol to float
  %div13.prol = fdiv float %4, %conv12.prol
  %6 = load ptr, ptr %outgoing_contrib, align 8, !tbaa !17
  %7 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %8 = sub i32 %cond, %7
  %9 = zext i32 %8 to i64
  %10 = add nuw nsw i64 %9, %1
  %n.vec = and i64 %10, %3
  %11 = sext i32 %7 to i64
  %ind.end = add nsw i64 %n.vec, %11
  %arrayidx.i28.prol = getelementptr inbounds float, ptr %6, i64 %ind.end
  store float %div13.prol, ptr %arrayidx.i28.prol, align 4, !tbaa !19
  ret float %div13.prol
}

define i64 @"120"(ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, i64 %2, ptr %num_blocks) {
bb:
  %3 = load ptr, ptr %degrees, align 8, !tbaa !9
  %sub.ptr.rhs.cast.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %end_size_.i, align 8, !tbaa !7
  %sub.ptr.lhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %sub = add nsw i64 %sub.ptr.div.i, %1
  %div38 = lshr i64 %sub, %2
  store i64 %div38, ptr %num_blocks, align 8, !tbaa !0
  ret i64 %div38
}

define i64 @"121"(ptr %arrayidx, ptr %new_range, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %new_range, align 8, !tbaa !16
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %arrayidx7 = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %1
  %2 = load i64, ptr %arrayidx, align 4
  store i64 %2, ptr %arrayidx7, align 4
  ret i64 %2
}

define i32 @"122"(ptr %n_start.0.in, i64 %0) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %1 = load i32, ptr %incdec.ptr12.i.i.i.i, align 4, !tbaa !10
  ret i32 %1
}

define ptr @"123"(ptr %new_range.i.i457, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !45
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !45
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !16
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !43
  ret ptr %add.ptr.i464
}

define i32 @"124"(ptr %incdec.ptr.i, ptr %add.ptr.i27.i.i.i) {
bb:
  %__value.sroa.0.0.copyload.i = load i64, ptr %incdec.ptr.i, align 4
  %__value.sroa.0.0.extract.trunc.i.i.i = trunc i64 %__value.sroa.0.0.copyload.i to i32
  store i32 %__value.sroa.0.0.extract.trunc.i.i.i, ptr %add.ptr.i27.i.i.i, align 4, !tbaa !91
  ret i32 %__value.sroa.0.0.extract.trunc.i.i.i
}

define i64 @"125"(ptr %num_edges_, i64 %0, i64 %1, i64 %2, ptr %.omp.ub) {
bb:
  %3 = load i64, ptr %num_edges_, align 8, !tbaa !92
  %sub3 = add nuw i64 %3, %0
  %div36 = lshr i64 %sub3, %1
  %sub4 = add nsw i64 %div36, %2
  store i64 %sub4, ptr %.omp.ub, align 8, !tbaa !0
  ret i64 %sub4
}

define i32 @"126"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %2 = load ptr, ptr %el, align 8, !tbaa !45
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %1
  %add.ptr.sroa_idx = getelementptr inbounds i8, ptr %add.ptr, i64 %0
  %3 = load i32, ptr %add.ptr.sroa_idx, align 4
  ret i32 %3
}

define i8 @"127"(ptr %0, ptr %opt_arg) {
bb:
  %1 = load i8, ptr %0, align 8, !tbaa !26
  %2 = load ptr, ptr %opt_arg, align 8, !tbaa !41
  store i8 %1, ptr %2, align 1, !tbaa !26
  ret i8 %1
}

define i64 @"129"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %2) {
bb:
  %3 = load i32, ptr %v, align 4, !tbaa !61
  %sub = add nsw i32 %3, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  %4 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !43
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %4 to i64
  %5 = load ptr, ptr %agg.result, align 8, !tbaa !45
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %5 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = ashr exact i64 %sub.ptr.sub.i12.i.i, %2
  %6 = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %add.ptr.i.i149 = getelementptr inbounds %struct.EdgePair, ptr %6, i64 %sub.ptr.div.i13.i.i
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %add.ptr.i.i149, align 4, !tbaa.struct !63
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"130"(ptr %call171, ptr %arrayidx.i547, ptr %arrayidx.i546) {
bb:
  %0 = load i32, ptr %arrayidx.i546, align 4, !tbaa !10
  %conv246 = sext i32 %0 to i64
  %1 = load i64, ptr %arrayidx.i547, align 8, !tbaa !0
  %add247 = add nsw i64 %1, %conv246
  %arrayidx257 = getelementptr inbounds i32, ptr %call171, i64 %add247
  %2 = load i32, ptr %arrayidx257, align 4, !tbaa !10
  ret i32 %2
}

define i64 @"131"(ptr %offsets, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %indvars.iv.next = add nsw i64 %2, %0
  %3 = load ptr, ptr %offsets, align 8, !tbaa !4
  %arrayidx.i.1 = getelementptr inbounds i64, ptr %3, i64 %indvars.iv.next
  %4 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !0
  ret i64 %4
}

define float @"132"(ptr %arrayidx.i, ptr %arrayidx.i27, ptr %arrayidx.i27.1, i64 %0, ptr %outgoing_contrib, i32 %cond, ptr %.omp.lb, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %outgoing_contrib, align 8, !tbaa !17
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %5 = sub i32 %cond, %4
  %6 = zext i32 %5 to i64
  %7 = add nuw nsw i64 %6, %1
  %n.vec = and i64 %7, %2
  %8 = sext i32 %4 to i64
  %ind.end = add nsw i64 %n.vec, %8
  %arrayidx.i28 = getelementptr inbounds float, ptr %3, i64 %ind.end
  %9 = load float, ptr %arrayidx.i, align 4, !tbaa !19
  %10 = load ptr, ptr %arrayidx.i27.1, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i = ptrtoint ptr %10 to i64
  %11 = load ptr, ptr %arrayidx.i27, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i = ptrtoint ptr %11 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %conv12 = sitofp i64 %sub.ptr.div.i to float
  %div13 = fdiv float %9, %conv12
  store float %div13, ptr %arrayidx.i28, align 4, !tbaa !19
  ret float %div13
}

define i64 @"133"(ptr %__first.addr.033.i.i, ptr %el, i64 %0) {
bb:
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.033.i.i, align 4
  %.pre710.pre = load ptr, ptr %el, align 8, !tbaa !45
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre710.pre, i64 %0
  store i64 %agg.tmp.sroa.0.0.copyload.i.i.i, ptr %incdec.ptr13.i.i.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define ptr @"134"(ptr %new_range.i.i457, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1, ptr %el) {
bb:
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !43
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !45
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !16
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !43
  ret ptr %add.ptr.i464
}

define i32 @"135"(ptr %arrayidx.i7.i.i.phi.trans.insert) {
bb:
  %.pre = load ptr, ptr %arrayidx.i7.i.i.phi.trans.insert, align 8, !tbaa !16
  %0 = load i32, ptr %.pre, align 4, !tbaa !10, !llvm.access.group !42
  ret i32 %0
}

define i32 @"136"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %5 = load ptr, ptr %el, align 8, !tbaa !45
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %ind.end
  %add.ptr.sroa_idx = getelementptr inbounds i8, ptr %add.ptr, i64 %2
  %6 = load i32, ptr %add.ptr.sroa_idx, align 4
  ret i32 %6
}

define ptr @"137"(ptr %cond.i31.i.i.i, i64 %.sroa.speculated.i.i.i.i, ptr %_M_finish.i38, i64 %0, i64 %sub.ptr.rhs.cast.i, i64 %1, i64 %sub.ptr.div.i, i1 %cmp9.i.i.i.i, i64 %2, i64 %add.i.i.i.i, ptr %_M_end_of_storage.i.i) {
bb:
  %3 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !48
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %3, i64 %0
  %sub.ptr.lhs.cast.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i2 = ashr exact i64 %sub.ptr.sub.i, %1
  %add.i.i.i.i4 = add i64 %.sroa.speculated.i.i.i.i, %sub.ptr.div.i
  %cmp7.i.i.i.i = icmp ult i64 %add.i.i.i.i, %sub.ptr.div.i
  %or.cond.i.i.i.i = or i1 %cmp7.i.i.i.i, %cmp9.i.i.i.i
  %cond.i.i.i.i = select i1 %or.cond.i.i.i.i, i64 %2, i64 %add.i.i.i.i
  %add.ptr19.i.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %cond.i31.i.i.i, i64 %cond.i.i.i.i
  store ptr %add.ptr19.i.i.i, ptr %_M_end_of_storage.i.i, align 8, !tbaa !94
  ret ptr %add.ptr19.i.i.i
}

define i64 @"138"(ptr %arrayidx.i140, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i143, i64 %4, i64 %5, i64 %xor4.i146, i64 %6, i64 %xor7.i149, ptr %num_nodes_, i64 %7, ptr %arrayidx.i65, i64 %xor.i67, i64 %xor4.i, i64 %xor7.i, i32 %8, ptr %el, ptr %.omp.lb) {
bb:
  %9 = load i64, ptr %num_nodes_, align 8, !tbaa !95
  %10 = trunc i64 %9 to i32
  %11 = load i64, ptr %arrayidx.i140, align 8, !tbaa !0
  %shr.i141 = lshr i64 %11, %0
  %and.i142 = and i64 %shr.i141, %1
  %xor.i1432 = xor i64 %and.i142, %11
  %shl.i144 = shl i64 %xor.i143, %2
  %and3.i145 = and i64 %shl.i144, %3
  %xor4.i1464 = xor i64 %and3.i145, %xor.i143
  %shl5.i147 = shl i64 %xor4.i146, %4
  %and6.i148 = and i64 %shl5.i147, %5
  %xor7.i1496 = xor i64 %and6.i148, %xor4.i146
  %shr8.i150 = lshr i64 %xor7.i149, %6
  %xor9.i151 = xor i64 %shr8.i150, %xor7.i149
  %conv7.i54 = trunc i64 %xor9.i151 to i32
  %rem.i52 = urem i32 %conv7.i54, %8
  %ref.tmp16.sroa.4.0.insert.ext = zext i32 %rem.i52 to i64
  %ref.tmp16.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp16.sroa.4.0.insert.ext, %7
  %12 = load i64, ptr %arrayidx.i65, align 8, !tbaa !0
  %shr.i66 = lshr i64 %12, %0
  %and.i = and i64 %shr.i66, %1
  %xor.i678 = xor i64 %and.i, %12
  %shl.i = shl i64 %xor.i67, %2
  %and3.i = and i64 %shl.i, %3
  %xor4.i10 = xor i64 %and3.i, %xor.i67
  %shl5.i = shl i64 %xor4.i, %4
  %and6.i = and i64 %shl5.i, %5
  %xor7.i12 = xor i64 %and6.i, %xor4.i
  %shr8.i = lshr i64 %xor7.i, %6
  %xor9.i = xor i64 %shr8.i, %xor7.i
  %conv7.i = trunc i64 %xor9.i to i32
  %rem.i = urem i32 %conv7.i, %8
  %ref.tmp16.sroa.0.0.insert.ext = zext i32 %rem.i to i64
  %ref.tmp16.sroa.0.0.insert.insert = or i64 %ref.tmp16.sroa.4.0.insert.shift, %ref.tmp16.sroa.0.0.insert.ext
  %13 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul = shl i64 %13, %6
  %14 = load ptr, ptr %el, align 8, !tbaa !45
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %14, i64 %mul
  store i64 %ref.tmp16.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp16.sroa.0.0.insert.insert
}

define i32 @"139"(ptr %e.sroa.5.0..sroa_idx, ptr %0, ptr %offsets, ptr %add.ptr, i64 %1) {
bb:
  %2 = load ptr, ptr %0, align 8, !tbaa !16
  %e.sroa.0.0.copyload = load i32, ptr %add.ptr, align 4, !tbaa.struct !63
  %conv = sext i32 %e.sroa.0.0.copyload to i64
  %3 = load ptr, ptr %offsets, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i64, ptr %3, i64 %conv
  %4 = atomicrmw add ptr %arrayidx.i, i64 %1 seq_cst, align 8
  %arrayidx = getelementptr inbounds i32, ptr %2, i64 %4
  %e.sroa.5.0.copyload = load i32, ptr %e.sroa.5.0..sroa_idx, align 4, !tbaa.struct !64
  store i32 %e.sroa.5.0.copyload, ptr %arrayidx, align 4, !tbaa !10
  ret i32 %e.sroa.5.0.copyload
}

define i64 @"140"(ptr %offsets, ptr %num_nodes_.i, i32 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !4
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %3 = trunc i64 %2 to i32
  %n184.0657 = add i32 %3, %0
  %4 = zext i32 %n184.0657 to i64
  %arrayidx.i540 = getelementptr inbounds i64, ptr %1, i64 %4
  %5 = load i64, ptr %arrayidx.i540, align 8, !tbaa !0
  ret i64 %5
}

define i64 @"141"(ptr %_M_string_length.i.i.i, i64 %call, ptr %__dnew.i.i.i) {
bb:
  %0 = load i64, ptr %_M_string_length.i.i.i, align 8, !tbaa !58, !noalias !96
  %sub.i.i.i = sub i64 %0, %call
  store i64 %sub.i.i.i, ptr %__dnew.i.i.i, align 8, !tbaa !0, !noalias !96
  ret i64 %sub.i.i.i
}

define i64 @"142"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %sext = shl i64 %1, %0
  %conv202 = ashr exact i64 %sext, %0
  %2 = load ptr, ptr %offsets, align 8, !tbaa !4
  %arrayidx.i542 = getelementptr inbounds i64, ptr %2, i64 %conv202
  %3 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  ret i64 %3
}

define i64 @"143"(ptr %el, i64 %0, i64 %1) {
bb:
  %.pre710.pre = load ptr, ptr %el, align 8, !tbaa !45
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre710.pre, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr13.i.i.i.i, i64 %1
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.030.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define float @"144"(ptr %scores, i32 %cond, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %scores, align 8, !tbaa !17
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %4 = sub i32 %cond, %3
  %5 = zext i32 %4 to i64
  %6 = add nuw nsw i64 %5, %0
  %n.vec = and i64 %6, %1
  %7 = sext i32 %3 to i64
  %ind.end = add nsw i64 %n.vec, %7
  %arrayidx.i.prol = getelementptr inbounds float, ptr %2, i64 %ind.end
  %8 = load float, ptr %arrayidx.i.prol, align 4, !tbaa !19
  ret float %8
}

define i32 @"145"(ptr %call171, ptr %arrayidx.i548, ptr %arrayidx.i549, ptr %arrayidx.i550, i64 %sub.ptr.rhs.cast.i.i.i.i552, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i550, align 8, !tbaa !0
  %add.ptr271 = getelementptr inbounds i32, ptr %call171, i64 %2
  %sub.ptr.lhs.cast.i.i.i.i551 = ptrtoint ptr %add.ptr271 to i64
  %sub.ptr.sub.i.i.i.i553 = sub i64 %sub.ptr.lhs.cast.i.i.i.i551, %sub.ptr.rhs.cast.i.i.i.i552
  %sub.ptr.div.i.i.i.i561 = lshr exact i64 %sub.ptr.sub.i.i.i.i553, %0
  %shr.i.i565 = lshr i64 %sub.ptr.div.i.i.i.i561, %1
  %3 = load i64, ptr %arrayidx.i548, align 8, !tbaa !0
  %add.ptr263 = getelementptr inbounds i32, ptr %call171, i64 %3
  %4 = load i32, ptr %arrayidx.i549, align 4, !tbaa !10
  %idx.ext = sext i32 %4 to i64
  %add.ptr266 = getelementptr inbounds i32, ptr %add.ptr263, i64 %idx.ext
  %incdec.ptr4.sink.i.i.i.i569 = getelementptr inbounds i32, ptr %add.ptr266, i64 %shr.i.i565
  %5 = load i32, ptr %incdec.ptr4.sink.i.i.i.i569, align 4, !tbaa !10
  ret i32 %5
}

define i32 @"146"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !45
  %incdec.ptr122.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %1 = load i32, ptr %incdec.ptr122.i.i, align 4, !tbaa !46
  ret i32 %1
}

define i32 @"149"(ptr %n_start.0.in, i64 %0, i64 %1) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds i32, ptr %incdec.ptr12.i.i.i.i, i64 %1
  %2 = load i32, ptr %__first.addr.030.i.i, align 4, !tbaa !10
  ret i32 %2
}

define i32 @"150"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !10
  %1 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !10
  %cmp.i.i.i.i.i = icmp slt i32 %0, %1
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add.ptr3.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i.i.i.i
  %2 = load i32, ptr %add.ptr3.i.i.i.i, align 4, !tbaa !10
  ret i32 %2
}

define <2 x i64> @"151"(ptr %0, <2 x i64> %1, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %7) {
bb:
  %wide.load393 = load <2 x i64>, ptr %4, align 8, !tbaa !0
  %wide.load392 = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %8 = shufflevector <2 x i64> %wide.load392, <2 x i64> %wide.load392, <2 x i32> <i32 1, i32 2>
  %9 = and <2 x i64> %8, %2
  %10 = and <2 x i64> %wide.load392, %1
  %11 = or <2 x i64> %10, %9
  %12 = lshr exact <2 x i64> %11, %3
  %13 = xor <2 x i64> %12, %wide.load393
  %14 = and <2 x i64> %wide.load392, %3
  %15 = icmp eq <2 x i64> %14, %5
  %16 = select <2 x i1> %15, <2 x i64> %5, <2 x i64> %6
  %17 = xor <2 x i64> %13, %16
  store <2 x i64> %17, ptr %7, align 8, !tbaa !0
  ret <2 x i64> %17
}

define i64 @"152"(ptr %__first.addr.033.i.i, ptr %new_range.i.i, i64 %0) {
bb:
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.033.i.i, align 4
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  store i64 %agg.tmp.sroa.0.0.copyload.i.i.i, ptr %incdec.ptr13.i.i.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i8 @"153"(i8 %0, ptr %ref.tmp, ptr %__dnew.i.i.i) {
bb:
  %1 = load i64, ptr %__dnew.i.i.i, align 8, !tbaa !0, !noalias !88
  %2 = load ptr, ptr %ref.tmp, align 8, !tbaa !41, !alias.scope !88
  %arrayidx.i.i.i.i = getelementptr inbounds i8, ptr %2, i64 %1
  store i8 %0, ptr %arrayidx.i.i.i.i, align 1, !tbaa !26
  ret i8 %0
}

define ptr @"154"(ptr %out_index_.i, i32 %cond, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %3 = sub i32 %cond, %2
  %4 = zext i32 %3 to i64
  %5 = add nuw nsw i64 %4, %0
  %n.vec = and i64 %5, %1
  %6 = sext i32 %2 to i64
  %ind.end = add nsw i64 %n.vec, %6
  %indvars.iv.next = add nsw i64 %ind.end, %0
  %7 = load ptr, ptr %out_index_.i, align 8, !tbaa !73
  %arrayidx.i27 = getelementptr inbounds ptr, ptr %7, i64 %indvars.iv.next
  %8 = load ptr, ptr %arrayidx.i27, align 8, !tbaa !16
  ret ptr %8
}

define i32 @"155"(ptr %__first, ptr %add.ptr.i, ptr %add.ptr2.i, i64 %sub1.i, i64 %mul.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr.i, align 4, !tbaa !10
  %3 = load i32, ptr %add.ptr2.i, align 4, !tbaa !10
  %cmp.i.i = icmp slt i32 %2, %3
  %spec.select.i = select i1 %cmp.i.i, i64 %sub1.i, i64 %mul.i
  %__parent.020.in.i.i = add nsw i64 %spec.select.i, %0
  %__parent.020.i.i = sdiv i64 %__parent.020.in.i.i, %1
  %add.ptr.i.i = getelementptr inbounds i32, ptr %__first, i64 %__parent.020.i.i
  %4 = load i32, ptr %add.ptr.i.i, align 4, !tbaa !10
  ret i32 %4
}

define i64 @"156"(ptr %arrayidx.i27, i64 %0, ptr %arrayidx.i25, ptr %el, ptr %.omp.lb) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %2 = load ptr, ptr %el, align 8, !tbaa !45
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %1
  %3 = load i32, ptr %arrayidx.i27, align 4, !tbaa !10
  %ref.tmp.sroa.4.0.insert.ext = zext i32 %3 to i64
  %ref.tmp.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp.sroa.4.0.insert.ext, %0
  %4 = load i32, ptr %arrayidx.i25, align 4, !tbaa !10
  %ref.tmp.sroa.0.0.insert.ext = zext i32 %4 to i64
  %ref.tmp.sroa.0.0.insert.insert = or i64 %ref.tmp.sroa.4.0.insert.shift, %ref.tmp.sroa.0.0.insert.ext
  store i64 %ref.tmp.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp.sroa.0.0.insert.insert
}

define ptr @"157"(ptr %out_index_.i, i32 %cond, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %3 = sub i32 %cond, %2
  %4 = zext i32 %3 to i64
  %5 = add nuw nsw i64 %4, %0
  %n.vec = and i64 %5, %1
  %6 = sext i32 %2 to i64
  %ind.end = add nsw i64 %n.vec, %6
  %indvars.iv.next.prol = add nsw i64 %ind.end, %0
  %7 = load ptr, ptr %out_index_.i, align 8, !tbaa !73
  %arrayidx.i27.prol = getelementptr inbounds ptr, ptr %7, i64 %indvars.iv.next.prol
  %8 = load ptr, ptr %arrayidx.i27.prol, align 8, !tbaa !16
  ret ptr %8
}

define float @"158"(ptr %scores, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !66
  %n.vec = and i64 %1, %0
  %2 = load ptr, ptr %scores, align 8, !tbaa !17
  %arrayidx.i.prol = getelementptr inbounds float, ptr %2, i64 %n.vec
  %3 = load float, ptr %arrayidx.i.prol, align 4, !tbaa !19
  ret float %3
}

define ptr @"159"(ptr %el, ptr %0, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !45
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !45
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %.pre710.pre = load ptr, ptr %el, align 8, !tbaa !45
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre710.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !43
  ret ptr %add.ptr.i464
}

define i64 @"160"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %3 = and i64 %2, %0
  %sub.prol = add nuw i64 %3, %0
  %conv34.prol = and i64 %sub.prol, %0
  %arrayidx.i492.prol = getelementptr inbounds i64, ptr %1, i64 %conv34.prol
  %4 = load i64, ptr %arrayidx.i492.prol, align 8, !tbaa !0
  ret i64 %4
}

define i64 @"161"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !59
  %inc.i71 = add nuw nsw i64 %1, %0
  %inc.i207 = add nuw nsw i64 %inc.i71, %0
  store i64 %inc.i207, ptr %_M_p.i.i.i, align 8, !tbaa !59
  ret i64 %inc.i207
}

define i32 @"162"(ptr %end_size_.i.i583, ptr %offsets, i64 %0, ptr %length.i581) {
bb:
  %1 = load ptr, ptr %end_size_.i.i583, align 8, !tbaa !65
  %sub.ptr.lhs.cast.i.i584 = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %offsets, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i585 = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i586 = sub i64 %sub.ptr.lhs.cast.i.i584, %sub.ptr.rhs.cast.i.i585
  %3 = lshr exact i64 %sub.ptr.sub.i.i586, %0
  %conv.i587 = trunc i64 %3 to i32
  store i32 %conv.i587, ptr %length.i581, align 4, !tbaa !10
  ret i32 %conv.i587
}

define <2 x i32> @"163"(ptr %degrees, ptr %.omp.lb, i64 %0, i64 %index, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul12 = shl i64 %2, %0
  %offset.idx = add i64 %mul12, %index
  %3 = load ptr, ptr %degrees, align 8, !tbaa !9
  %4 = getelementptr inbounds i32, ptr %3, i64 %offset.idx
  %5 = getelementptr inbounds i32, ptr %4, i64 %1
  %wide.load42 = load <2 x i32>, ptr %5, align 4, !tbaa !10
  ret <2 x i32> %wide.load42
}

define ptr @"164"(ptr %call.i.i, ptr %num_nodes_.i, ptr %end_size_.i.i) {
bb:
  %0 = load i64, ptr %num_nodes_.i, align 8, !tbaa !66
  %add.ptr.i.i = getelementptr inbounds float, ptr %call.i.i, i64 %0
  store ptr %add.ptr.i.i, ptr %end_size_.i.i, align 8, !tbaa !99
  ret ptr %add.ptr.i.i
}

define float @"165"(ptr %arrayidx.i, ptr %arrayidx.i27, ptr %arrayidx.i27.prol, i64 %0, ptr %outgoing_contrib, i32 %cond, ptr %.omp.lb, i64 %1, i64 %2) {
bb:
  %3 = load float, ptr %arrayidx.i, align 4, !tbaa !19
  %4 = load ptr, ptr %arrayidx.i27.prol, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i = ptrtoint ptr %4 to i64
  %5 = load ptr, ptr %arrayidx.i27, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i = ptrtoint ptr %5 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %conv12 = sitofp i64 %sub.ptr.div.i to float
  %div13 = fdiv float %3, %conv12
  %6 = load ptr, ptr %outgoing_contrib, align 8, !tbaa !17
  %7 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %8 = sub i32 %cond, %7
  %9 = zext i32 %8 to i64
  %10 = add nuw nsw i64 %9, %1
  %n.vec = and i64 %10, %2
  %11 = sext i32 %7 to i64
  %ind.end = add nsw i64 %n.vec, %11
  %arrayidx.i28 = getelementptr inbounds float, ptr %6, i64 %ind.end
  store float %div13, ptr %arrayidx.i28, align 4, !tbaa !19
  ret float %div13
}

define float @"166"(ptr %_M_finish.i38, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !48
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %2, i64 %0
  %add.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %incdec.ptr.i.i, i64 %1
  %3 = load float, ptr %add.ptr.i.i, align 4, !tbaa !91
  ret float %3
}

define ptr @"167"(ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %0) {
bb:
  %1 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !43
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %agg.result, align 8, !tbaa !45
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = ashr exact i64 %sub.ptr.sub.i12.i.i, %0
  %3 = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %add.ptr.i.i149 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div.i13.i.i
  store ptr %add.ptr.i.i149, ptr %end_size_.i.i, align 8, !tbaa !43
  ret ptr %add.ptr.i.i149
}

define i64 @"168"(ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %__i.018.i, i64 %add.i, i64 %inc.i, ptr %arrayidx7.i.1) {
bb:
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !0
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
  store i64 %rem.i.i17.i.1, ptr %arrayidx7.i.1, align 8, !tbaa !0
  ret i64 %rem.i.i17.i.1
}

define ptr @"169"(ptr %new_range.i.i, ptr %end_capacity_.i.i, ptr %agg.result, i64 %0) {
bb:
  %1 = load ptr, ptr %agg.result, align 8, !tbaa !45
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %end_capacity_.i.i, align 8, !tbaa !57
  %sub.ptr.lhs.cast.i7.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i9.i = sub i64 %sub.ptr.lhs.cast.i7.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.sub.i9.fr.i = freeze i64 %sub.ptr.sub.i9.i
  %mul.i = ashr exact i64 %sub.ptr.sub.i9.fr.i, %0
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %mul.i
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i, align 8, !tbaa !57
  ret ptr %add.ptr6.i.i
}

define i64 @"170"(ptr %el, i64 %0) {
bb:
  %.pre710.pre = load ptr, ptr %el, align 8, !tbaa !45
  %incdec.ptr.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre710.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i = load i64, ptr %incdec.ptr.i.i.i.i, align 4, !tbaa.struct !63
  ret i64 %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i
}

define <8 x i32> @"171"(ptr %el, ptr %.omp.lb, i64 %index) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %offset.idx = add i64 %0, %index
  %1 = load ptr, ptr %el, align 8, !tbaa !45
  %2 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %offset.idx
  %wide.vec = load <8 x i32>, ptr %2, align 4
  ret <8 x i32> %wide.vec
}

define ptr @"172"(ptr %_ZSt4cout, ptr %vbase.offset.ptr.i, i64 %0, i32 %1) {
bb:
  %vbase.offset.i = load i64, ptr %vbase.offset.ptr.i, align 8
  %add.ptr.i = getelementptr inbounds i8, ptr %_ZSt4cout, i64 %vbase.offset.i
  %_M_ctype.i.i = getelementptr inbounds %"class.std::basic_ios", ptr %add.ptr.i, i64 %0, i32 5
  %2 = load ptr, ptr %_M_ctype.i.i, align 8, !tbaa !100
  ret ptr %2
}

define ptr @"173"(ptr %_M_finish.i.i, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !16
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %2, i64 %0, i32 2
  store ptr %3, ptr %2, align 8, !tbaa !79
  ret ptr %3
}

define i32 @"174"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %3 = sub i64 %0, %2
  %n.vec = and i64 %3, %1
  %ind.end = add i64 %2, %n.vec
  %4 = load ptr, ptr %el, align 8, !tbaa !45
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %4, i64 %ind.end
  %5 = load i32, ptr %add.ptr, align 4
  ret i32 %5
}

define i64 @"175"(i64 %local_total.040, ptr %arrayidx.i36, ptr %prefix, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i32, ptr %arrayidx.i36, align 4, !tbaa !10
  %conv = sext i32 %1 to i64
  %add20 = add nsw i64 %local_total.040, %conv
  %2 = load ptr, ptr %prefix, align 8
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul14 = shl i64 %3, %0
  %arrayidx.i35 = getelementptr inbounds i64, ptr %2, i64 %mul14
  store i64 %add20, ptr %arrayidx.i35, align 8, !tbaa !0
  ret i64 %add20
}

define ptr @"176"(ptr %out_index_.i, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %out_index_.i, align 8, !tbaa !73
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %arrayidx4.i.phi.trans.insert = getelementptr inbounds ptr, ptr %0, i64 %2
  %.pre = load ptr, ptr %arrayidx4.i.phi.trans.insert, align 8, !tbaa !16
  ret ptr %.pre
}

define ptr @"177"(ptr %neighs, ptr %arrayidx.i, ptr %index, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %index, align 8, !tbaa !16
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds ptr, ptr %0, i64 %2
  %3 = load i64, ptr %arrayidx.i, align 8, !tbaa !0
  %4 = load ptr, ptr %neighs, align 8, !tbaa !16
  %add.ptr = getelementptr inbounds i32, ptr %4, i64 %3
  store ptr %add.ptr, ptr %arrayidx, align 8, !tbaa !16
  ret ptr %add.ptr
}

define i8 @"178"(ptr %arrayidx17.i.i, ptr %ref.tmp, i64 %conv5.i) {
bb:
  %0 = load ptr, ptr %ref.tmp, align 8, !tbaa !41, !alias.scope !107
  %arrayidx.i.i = getelementptr inbounds i8, ptr %0, i64 %conv5.i
  %1 = load i8, ptr %arrayidx17.i.i, align 2, !tbaa !26, !noalias !107
  store i8 %1, ptr %arrayidx.i.i, align 1, !tbaa !26
  ret i8 %1
}

define i32 @"179"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.0649, ptr %arrayidx.i536) {
bb:
  %1 = load i32, ptr %arrayidx.i536, align 4, !tbaa !10
  %conv155 = sext i32 %1 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  %i200.0 = add nsw i64 %2, %0
  %sub211 = sub nsw i64 %i200.0, %add156
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %3 = load i32, ptr %arrayidx212, align 4, !tbaa !10
  ret i32 %3
}

define i64 @"180"(ptr %arrayidx.i535, i64 %total_missing_inv.0649, ptr %arrayidx.i536, ptr %offsets, i64 %indvars.iv691) {
bb:
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !4
  %arrayidx.i5352 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %indvars.iv691
  %0 = load i32, ptr %arrayidx.i536, align 4, !tbaa !10
  %conv155 = sext i32 %0 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %1 = load i64, ptr %arrayidx.i535, align 8, !tbaa !0
  %add152 = add nsw i64 %1, %add156
  store i64 %add152, ptr %arrayidx.i535, align 8, !tbaa !0
  ret i64 %add152
}

define ptr @"181"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %.pre = load ptr, ptr %el, align 8, !tbaa !45
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !57
  ret ptr %add.ptr6.i.i
}

define i32 @"182"(ptr %arrayidx212, ptr %call171, i64 %tail_index.0660, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %0) {
bb:
  %1 = load i32, ptr %arrayidx212, align 4, !tbaa !10
  %2 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %conv198 = sext i32 %2 to i64
  %3 = load i64, ptr %arrayidx.i540, align 8, !tbaa !0
  %add199 = add nsw i64 %3, %conv198
  %4 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  %5 = sub i64 %4, %add199
  %n.vec793 = and i64 %5, %0
  %ind.end796 = sub i64 %tail_index.0660, %n.vec793
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %.pre731 = sext i32 %.pre717 to i64
  %sub226 = sub nsw i64 %ind.end796, %.pre731
  %arrayidx213 = getelementptr inbounds i32, ptr %call171, i64 %sub226
  store i32 %1, ptr %arrayidx213, align 4, !tbaa !10
  ret i32 %1
}

define float @"183"(ptr %arrayidx.i.1, ptr %call5.i.i.i.i4.i.i45, ptr %num_nodes_.i, i64 %0, i64 %1, i32 %2) {
bb:
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !66
  %n.vec = and i64 %3, %0
  %indvars.iv.next = add nuw nsw i64 %n.vec, %1
  %second3.i.1 = getelementptr inbounds %"struct.std::pair", ptr %call5.i.i.i.i4.i.i45, i64 %indvars.iv.next, i32 1
  %4 = load float, ptr %arrayidx.i.1, align 4, !tbaa !19
  store float %4, ptr %second3.i.1, align 4, !tbaa !80
  ret float %4
}

define i32 @"184"(ptr %el, i64 %0, i32 %1) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !45
  %v.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0, i32 1
  %2 = load i32, ptr %v.i.i.i.i, align 4
  ret i32 %2
}

define i32 @"185"(ptr %top_k, i64 %0) {
bb:
  %1 = load ptr, ptr %top_k, align 8, !tbaa !16
  %kvp.sroa.5.0.call22.sroa_idx = getelementptr inbounds i8, ptr %1, i64 %0
  %kvp.sroa.5.0.copyload = load i32, ptr %kvp.sroa.5.0.call22.sroa_idx, align 4
  ret i32 %kvp.sroa.5.0.copyload
}

define <2 x i64> @"186"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %.omp.lb, i64 %3, i64 %4, i64 %5, <2 x i64> %6, <2 x i64> %7, ptr %8, <2 x i64> %9, <2 x i64> %10, ptr %11) {
bb:
  %wide.load91 = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %12 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add8 = add i64 %12, %3
  %rem.i.i.i = and i64 %add8, %4
  %vector.recur.init89 = insertelement <2 x i64> %2, i64 %rem.i.i.i, i64 %5
  %13 = shufflevector <2 x i64> %vector.recur.init89, <2 x i64> %wide.load91, <2 x i32> <i32 1, i32 2>
  %14 = and <2 x i64> %13, %6
  %15 = and <2 x i64> %wide.load91, %1
  %16 = or <2 x i64> %15, %14
  %17 = lshr exact <2 x i64> %16, %7
  %wide.load92 = load <2 x i64>, ptr %8, align 8, !tbaa !0
  %18 = xor <2 x i64> %17, %wide.load92
  %19 = and <2 x i64> %wide.load91, %7
  %20 = icmp eq <2 x i64> %19, %9
  %21 = select <2 x i1> %20, <2 x i64> %9, <2 x i64> %10
  %22 = xor <2 x i64> %18, %21
  store <2 x i64> %22, ptr %11, align 8, !tbaa !0
  ret <2 x i64> %22
}

define <2 x i64> @"187"(ptr %0, ptr %offsets, ptr %num_nodes_.i, i64 %1, i64 %index770, i64 %2) {
bb:
  %wide.load = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %3 = load ptr, ptr %offsets, align 8
  %4 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %5 = and i64 %4, %1
  %offset.idx = sub i64 %5, %index770
  %6 = getelementptr inbounds i64, ptr %3, i64 %offset.idx
  %7 = getelementptr inbounds i64, ptr %6, i64 %2
  store <2 x i64> %wide.load, ptr %7, align 8, !tbaa !0
  ret <2 x i64> %wide.load
}

define <2 x float> @"188"(ptr %0, ptr %1, <2 x ptr> %2, ptr %arrayidx4.i.phi.trans.insert, i64 %3, <2 x i64> %4, ptr %outgoing_contrib, i64 %index, ptr %.omp.lb) {
bb:
  %5 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %6 = sext i32 %5 to i64
  %offset.idx = add i64 %index, %6
  %7 = load ptr, ptr %outgoing_contrib, align 8, !tbaa !17
  %8 = getelementptr inbounds float, ptr %7, i64 %offset.idx
  %wide.load32 = load <2 x ptr>, ptr %1, align 8, !tbaa !16
  %9 = ptrtoint <2 x ptr> %wide.load32 to <2 x i64>
  %.pre = load ptr, ptr %arrayidx4.i.phi.trans.insert, align 8, !tbaa !16
  %vector.recur.init = insertelement <2 x ptr> %2, ptr %.pre, i64 %3
  %10 = shufflevector <2 x ptr> %vector.recur.init, <2 x ptr> %wide.load32, <2 x i32> <i32 1, i32 2>
  %11 = ptrtoint <2 x ptr> %10 to <2 x i64>
  %12 = sub <2 x i64> %9, %11
  %13 = ashr exact <2 x i64> %12, %4
  %14 = sitofp <2 x i64> %13 to <2 x float>
  %wide.load = load <2 x float>, ptr %0, align 4, !tbaa !19
  %15 = fdiv <2 x float> %wide.load, %14
  store <2 x float> %15, ptr %8, align 4, !tbaa !19
  ret <2 x float> %15
}

define ptr @"189"(ptr %new_range.i.i, ptr %end_size_.i, ptr %el, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !43
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !45
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !57
  ret ptr %add.ptr6.i.i
}

define ptr @"190"(ptr %call.i5155, ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, ptr %end_size_.i53) {
bb:
  %2 = load ptr, ptr %degrees, align 8, !tbaa !9
  %sub.ptr.rhs.cast.i48 = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !7
  %sub.ptr.lhs.cast.i47 = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i49 = sub i64 %sub.ptr.lhs.cast.i47, %sub.ptr.rhs.cast.i48
  %sub.ptr.div.i50 = ashr exact i64 %sub.ptr.sub.i49, %0
  %add13 = add nsw i64 %sub.ptr.div.i50, %1
  %add.ptr.i52 = getelementptr inbounds i64, ptr %call.i5155, i64 %add13
  store ptr %add.ptr.i52, ptr %end_size_.i53, align 8, !tbaa !65
  ret ptr %add.ptr.i52
}

define ptr @"191"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %.pre = load ptr, ptr %el, align 8, !tbaa !45
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %.pre710.pre = load ptr, ptr %el, align 8, !tbaa !45
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre710.pre to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !57
  ret ptr %add.ptr6.i.i
}

define i64 @"192"(ptr %end_size_, ptr %this, i64 %0, i64 %1, ptr %.omp.ub) {
bb:
  %2 = load ptr, ptr %end_size_, align 8, !tbaa !99
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %this, align 8, !tbaa !17
  %sub.ptr.rhs.cast = ptrtoint ptr %3 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %sub = add nsw i64 %sub.ptr.div, %1
  store i64 %sub, ptr %.omp.ub, align 8, !tbaa !0
  ret i64 %sub
}

define i32 @"193"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add15 = add i64 %2, %0
  %3 = load ptr, ptr %el, align 8, !tbaa !45
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %add15
  %add.ptr.sroa_idx.1 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %1
  %4 = load i32, ptr %add.ptr.sroa_idx.1, align 4
  ret i32 %4
}

define ptr @"194"(ptr %in_index_.i, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %in_index_.i, align 8, !tbaa !110, !noalias !111, !llvm.access.group !42
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %3 = sext i32 %2 to i64
  %indvars.iv.next = add nsw i64 %3, %0
  %arrayidx.i.i.i = getelementptr inbounds ptr, ptr %1, i64 %indvars.iv.next
  %4 = load ptr, ptr %arrayidx.i.i.i, align 8, !tbaa !16, !llvm.access.group !42
  ret ptr %4
}

define float @"195"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load float, ptr %init_val, align 4, !tbaa !19
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add7 = add i64 %2, %0
  %3 = load ptr, ptr %this, align 8, !tbaa !17
  %add.ptr.1 = getelementptr inbounds float, ptr %3, i64 %add7
  store float %1, ptr %add.ptr.1, align 4, !tbaa !19
  ret float %1
}

define i64 @"196"(ptr %arrayidx3.i.i91, i64 %0, ptr %1, i64 %2, i64 %3, ptr %arrayidx7.i.i95, i64 %4, i64 %5, ptr %arrayidx.i.i88) {
bb:
  %6 = load i64, ptr %arrayidx3.i.i91, align 8, !tbaa !0
  %and4.i.i92 = and i64 %6, %0
  %wide.load392 = load <2 x i64>, ptr %1, align 8, !tbaa !0
  %vector.recur.extract395 = extractelement <2 x i64> %wide.load392, i64 %2
  %and.i.i89 = and i64 %vector.recur.extract395, %3
  %or.i.i93 = or i64 %and4.i.i92, %and.i.i89
  %shr.i.i96 = lshr exact i64 %or.i.i93, %2
  %7 = load i64, ptr %arrayidx7.i.i95, align 8, !tbaa !0
  %xor.i.i97 = xor i64 %shr.i.i96, %7
  %and8.i.i98 = and i64 %6, %2
  %tobool.not.i.i99 = icmp eq i64 %and8.i.i98, %4
  %cond.i.i100 = select i1 %tobool.not.i.i99, i64 %4, i64 %5
  %xor9.i.i101 = xor i64 %xor.i.i97, %cond.i.i100
  store i64 %xor9.i.i101, ptr %arrayidx.i.i88, align 8, !tbaa !0
  ret i64 %xor9.i.i101
}

define i64 @"197"(i32 %shl19, ptr %arrayidx.i61, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i63, i64 %4, i64 %5, i64 %xor4.i, i64 %6, i64 %xor7.i, i32 %7, i32 %8, i32 %9, i32 %conv, i64 %10, i64 %ref.tmp30.sroa.0.0.insert.ext, ptr %el, ptr %.omp.lb) {
bb:
  %11 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul = shl i64 %11, %6
  %12 = load ptr, ptr %el, align 8, !tbaa !45
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %12, i64 %mul
  %13 = load i64, ptr %arrayidx.i61, align 8, !tbaa !0
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

define i32 @"198"(i32 %0, ptr %call171, ptr %arrayidx.i548, i64 %1, ptr %arrayidx.i549) {
bb:
  %2 = load i64, ptr %arrayidx.i548, align 8, !tbaa !0
  %add286 = add i64 %2, %1
  %3 = load i32, ptr %arrayidx.i549, align 4, !tbaa !10
  %idx.ext = sext i32 %3 to i64
  %sub287 = add i64 %add286, %idx.ext
  %arrayidx288 = getelementptr inbounds i32, ptr %call171, i64 %sub287
  store i32 %0, ptr %arrayidx288, align 4, !tbaa !10
  ret i32 %0
}

define <2 x i64> @"199"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %rng, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
bb:
  %wide.load393 = load <2 x i64>, ptr %6, align 8, !tbaa !0
  %wide.load392 = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %.pre.i.i85 = load i64, ptr %rng, align 8, !tbaa !0
  %vector.recur.init390 = insertelement <2 x i64> %2, i64 %.pre.i.i85, i64 %3
  %10 = shufflevector <2 x i64> %vector.recur.init390, <2 x i64> %wide.load392, <2 x i32> <i32 1, i32 2>
  %11 = and <2 x i64> %10, %4
  %12 = and <2 x i64> %wide.load392, %1
  %13 = or <2 x i64> %12, %11
  %14 = lshr exact <2 x i64> %13, %5
  %15 = xor <2 x i64> %14, %wide.load393
  %16 = and <2 x i64> %wide.load392, %5
  %17 = icmp eq <2 x i64> %16, %7
  %18 = select <2 x i1> %17, <2 x i64> %7, <2 x i64> %8
  %19 = xor <2 x i64> %15, %18
  store <2 x i64> %19, ptr %9, align 8, !tbaa !0
  ret <2 x i64> %19
}

define i64 @"200"(ptr %_ZSt4cout, i64 %0) {
bb:
  %vtable.i = load ptr, ptr %_ZSt4cout, align 8, !tbaa !114
  %vbase.offset.ptr.i = getelementptr i8, ptr %vtable.i, i64 %0
  %vbase.offset.i = load i64, ptr %vbase.offset.ptr.i, align 8
  ret i64 %vbase.offset.i
}

define float @"201"(ptr %scores, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %scores, align 8, !tbaa !17
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !66
  %n.vec = and i64 %3, %0
  %indvars.iv.next = add nuw nsw i64 %n.vec, %1
  %arrayidx.i.1 = getelementptr inbounds float, ptr %2, i64 %indvars.iv.next
  %4 = load float, ptr %arrayidx.i.1, align 4, !tbaa !19
  ret float %4
}

define i32 @"202"(ptr %length, i32 %0, ptr %.omp.ub) {
bb:
  %1 = load i32, ptr %length, align 4, !tbaa !10
  %sub3 = add nsw i32 %1, %0
  store i32 %sub3, ptr %.omp.ub, align 4, !tbaa !10
  ret i32 %sub3
}

define ptr @"203"(ptr %cond.i31.i.i.i, ptr %_M_finish.i38, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4) {
bb:
  %5 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !48
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %5, i64 %0
  %6 = ptrtoint ptr %incdec.ptr.i.i to i64
  %7 = add i64 %6, %1
  %8 = sub i64 %7, %2
  %9 = lshr i64 %8, %3
  %10 = add nuw nsw i64 %9, %0
  %n.vec = and i64 %10, %4
  %11 = shl i64 %n.vec, %3
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i, i64 %11
  %incdec.ptr.i.i.i = getelementptr %"struct.std::pair.8", ptr %ind.end, i64 %0
  store ptr %incdec.ptr.i.i.i, ptr %_M_finish.i38, align 8, !tbaa !48
  ret ptr %incdec.ptr.i.i.i
}

define i64 @"204"(ptr %offsets, ptr %arrayidx112, i32 %0) {
bb:
  %1 = load i32, ptr %arrayidx112, align 4, !tbaa !10
  %add117 = add nsw i32 %1, %0
  %conv118 = sext i32 %add117 to i64
  %.pre716.pre727 = load ptr, ptr %offsets, align 8, !tbaa !4
  %arrayidx.i524 = getelementptr inbounds i64, ptr %.pre716.pre727, i64 %conv118
  %2 = load i64, ptr %arrayidx.i524, align 8, !tbaa !0
  ret i64 %2
}

define float @"205"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !17
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add.ptr.prol = getelementptr inbounds float, ptr %2, i64 %ind.end
  %5 = load float, ptr %init_val, align 4, !tbaa !19
  store float %5, ptr %add.ptr.prol, align 4, !tbaa !19
  ret float %5
}

define i32 @"206"(ptr %.sroa_idx.phi.trans.insert.i, ptr %second.i.i.i.i.i) {
bb:
  %.pre43.i = load i32, ptr %.sroa_idx.phi.trans.insert.i, align 4
  store i32 %.pre43.i, ptr %second.i.i.i.i.i, align 4, !tbaa !84
  ret i32 %.pre43.i
}

define float @"207"(ptr %arrayidx.i.prol, ptr %arrayidx.i27.prol, ptr %arrayidx4.i.phi.trans.insert, i64 %0, ptr %outgoing_contrib, i32 %cond, ptr %.omp.lb, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %outgoing_contrib, align 8, !tbaa !17
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %5 = sub i32 %cond, %4
  %6 = zext i32 %5 to i64
  %7 = add nuw nsw i64 %6, %1
  %n.vec = and i64 %7, %2
  %8 = sext i32 %4 to i64
  %ind.end = add nsw i64 %n.vec, %8
  %arrayidx.i28.prol = getelementptr inbounds float, ptr %3, i64 %ind.end
  %9 = load float, ptr %arrayidx.i.prol, align 4, !tbaa !19
  %.pre = load ptr, ptr %arrayidx4.i.phi.trans.insert, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.prol = ptrtoint ptr %.pre to i64
  %10 = load ptr, ptr %arrayidx.i27.prol, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i.prol = ptrtoint ptr %10 to i64
  %sub.ptr.sub.i.prol = sub i64 %sub.ptr.lhs.cast.i.prol, %sub.ptr.rhs.cast.i.prol
  %sub.ptr.div.i.prol = ashr exact i64 %sub.ptr.sub.i.prol, %0
  %conv12.prol = sitofp i64 %sub.ptr.div.i.prol to float
  %div13.prol = fdiv float %9, %conv12.prol
  store float %div13.prol, ptr %arrayidx.i28.prol, align 4, !tbaa !19
  ret float %div13.prol
}

define float @"208"(ptr %arrayidx.i.1, ptr %arrayidx.i27.1, ptr %arrayidx.i27, i64 %0, ptr %outgoing_contrib, i32 %cond, ptr %.omp.lb, i64 %1, i64 %2) {
bb:
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %4 = sub i32 %cond, %3
  %5 = zext i32 %4 to i64
  %6 = add nuw nsw i64 %5, %1
  %n.vec = and i64 %6, %2
  %7 = sext i32 %3 to i64
  %ind.end = add nsw i64 %n.vec, %7
  %indvars.iv.next = add nsw i64 %ind.end, %1
  %8 = load ptr, ptr %outgoing_contrib, align 8, !tbaa !17
  %arrayidx.i28.1 = getelementptr inbounds float, ptr %8, i64 %indvars.iv.next
  %9 = load float, ptr %arrayidx.i.1, align 4, !tbaa !19
  %10 = load ptr, ptr %arrayidx.i27.1, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i.1 = ptrtoint ptr %10 to i64
  %11 = load ptr, ptr %arrayidx.i27, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.1 = ptrtoint ptr %11 to i64
  %sub.ptr.sub.i.1 = sub i64 %sub.ptr.lhs.cast.i.1, %sub.ptr.rhs.cast.i.1
  %sub.ptr.div.i.1 = ashr exact i64 %sub.ptr.sub.i.1, %0
  %conv12.1 = sitofp i64 %sub.ptr.div.i.1 to float
  %div13.1 = fdiv float %9, %conv12.1
  store float %div13.1, ptr %arrayidx.i28.1, align 4, !tbaa !19
  ret float %div13.1
}

define i64 @"209"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !59
  %inc.i71 = add nuw nsw i64 %2, %1
  %arrayidx.i65 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i71
  %3 = load i64, ptr %arrayidx.i65, align 8, !tbaa !0
  ret i64 %3
}

define i32 @"210"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add15 = add i64 %1, %0
  %2 = load ptr, ptr %el, align 8, !tbaa !45
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %add15
  %3 = load i32, ptr %add.ptr.1, align 4
  ret i32 %3
}

define i32 @"211"(i64 %indvars.iv687, ptr %incdec.ptr4.sink.i.i.i.i, ptr %__first.addr.015.i.i, ptr %neighs, ptr %arrayidx.i524, i64 %sub.ptr.rhs.cast.i.i.i.i526, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %incdec.ptr4.sink.i.i.i.i, align 4, !tbaa !10
  %3 = sext i32 %2 to i64
  %cmp.i.i.i530 = icmp sgt i64 %indvars.iv687, %3
  %4 = load ptr, ptr %neighs, align 8, !tbaa !16
  %5 = load i64, ptr %arrayidx.i524, align 8, !tbaa !0
  %add.ptr121 = getelementptr inbounds i32, ptr %4, i64 %5
  %sub.ptr.lhs.cast.i.i.i.i525 = ptrtoint ptr %add.ptr121 to i64
  %sub.ptr.sub.i.i.i.i527 = sub i64 %sub.ptr.lhs.cast.i.i.i.i525, %sub.ptr.rhs.cast.i.i.i.i526
  %sub.ptr.div.i.i.i.i = lshr exact i64 %sub.ptr.sub.i.i.i.i527, %0
  %shr.i.i = lshr i64 %sub.ptr.div.i.i.i.i, %1
  %incdec.ptr4.sink.i.i.i.i2 = getelementptr inbounds i32, ptr %__first.addr.015.i.i, i64 %shr.i.i
  %incdec.ptr.i.i = getelementptr inbounds i32, ptr %incdec.ptr4.sink.i.i.i.i, i64 %1
  %__first.addr.1.i.i = select i1 %cmp.i.i.i530, ptr %incdec.ptr.i.i, ptr %__first.addr.015.i.i
  %6 = load i32, ptr %__first.addr.1.i.i, align 4, !tbaa !10
  ret i32 %6
}

define ptr @"212"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, ptr %.omp.lb) {
bb:
  %1 = load i8, ptr %transpose, align 1, !tbaa !12, !range !14, !noundef !15
  %tobool.not = icmp eq i8 %1, %0
  %2 = load ptr, ptr %out_index_.i, align 8
  %3 = load ptr, ptr %in_index_.i, align 8
  %.pn = select i1 %tobool.not, ptr %2, ptr %3
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %5 = sext i32 %4 to i64
  %n_start.0.in = getelementptr inbounds ptr, ptr %.pn, i64 %5
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  ret ptr %n_start.0
}

define i64 @"213"(ptr %__begin0.sroa.0.059, i64 %0, ptr %.sroa_idx, ptr %cond.i31.i.i.i, ptr %_M_finish.i38, i64 %1, i64 %sub.ptr.rhs.cast.i, i64 %2) {
bb:
  %3 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !48
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %3, i64 %1
  %sub.ptr.lhs.cast.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %2
  %add.ptr.i.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %cond.i31.i.i.i, i64 %sub.ptr.div.i
  %4 = load i32, ptr %__begin0.sroa.0.059, align 4
  %retval.sroa.2.0.insert.ext.i = zext i32 %4 to i64
  %retval.sroa.2.0.insert.shift.i = shl nuw i64 %retval.sroa.2.0.insert.ext.i, %0
  %5 = load i32, ptr %.sroa_idx, align 4
  %retval.sroa.0.0.insert.ext.i = zext i32 %5 to i64
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i
  store i64 %retval.sroa.0.0.insert.insert.i, ptr %add.ptr.i.i.i, align 4
  ret i64 %retval.sroa.0.0.insert.insert.i
}

define float @"214"(ptr %arrayidx.i, ptr %arrayidx.i124, i64 %0, ptr %arrayidx.i132, ptr %incoming_sums, ptr %__begin2.0160) {
bb:
  %1 = load float, ptr %arrayidx.i, align 4, !tbaa !19
  %2 = load ptr, ptr %arrayidx.i124, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i = ptrtoint ptr %2 to i64
  %sub.ptr.lhs.cast.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %conv18 = sitofp i64 %sub.ptr.div.i to float
  %div19 = fdiv float %1, %conv18
  %3 = load float, ptr %arrayidx.i132, align 4, !tbaa !19
  %add = fadd float %div19, %3
  %4 = load ptr, ptr %incoming_sums, align 8
  %5 = load i32, ptr %__begin2.0160, align 4, !tbaa !10
  %conv28 = sext i32 %5 to i64
  %arrayidx.i1322 = getelementptr inbounds float, ptr %4, i64 %conv28
  store float %add, ptr %arrayidx.i132, align 4, !tbaa !19
  ret float %add
}

define float @"215"(ptr %scores, i32 %cond, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %3 = sub i32 %cond, %2
  %4 = zext i32 %3 to i64
  %5 = add nuw nsw i64 %4, %0
  %n.vec = and i64 %5, %1
  %6 = sext i32 %2 to i64
  %ind.end = add nsw i64 %n.vec, %6
  %7 = load ptr, ptr %scores, align 8, !tbaa !17
  %arrayidx.i = getelementptr inbounds float, ptr %7, i64 %ind.end
  %8 = load float, ptr %arrayidx.i, align 4, !tbaa !19
  ret float %8
}

define i64 @"216"(ptr %arrayidx.i.i, ptr %0, i64 %1, ptr %2) {
bb:
  %3 = load ptr, ptr %0, align 8, !tbaa !16, !noalias !68
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %arrayidx.i.i, align 8, !tbaa !16, !noalias !68
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i = ashr exact i64 %sub.ptr.sub.i.i, %1
  store i64 %sub.ptr.div.i.i, ptr %2, align 8, !alias.scope !68
  ret i64 %sub.ptr.div.i.i
}

define i64 @"217"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !59
  %inc.i71 = add nuw nsw i64 %2, %1
  %arrayidx.i208 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i71
  %3 = load i64, ptr %arrayidx.i208, align 8, !tbaa !0
  ret i64 %3
}

define i64 @"218"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %3 = and i64 %2, %0
  %sub = add nuw i64 %3, %0
  %conv34 = and i64 %sub, %0
  %arrayidx.i492 = getelementptr inbounds i64, ptr %1, i64 %conv34
  %4 = load i64, ptr %arrayidx.i492, align 8, !tbaa !0
  ret i64 %4
}

define i64 @"220"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %call.i4145, ptr %num_blocks) {
bb:
  %0 = load i64, ptr %num_blocks, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds i64, ptr %call.i4145, i64 %0
  %1 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !0
  %2 = load i64, ptr %arrayidx.i58, align 8, !tbaa !0
  %add7 = add nsw i64 %2, %total.076
  %3 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !0
  %add7.1 = add nsw i64 %3, %add7
  %add7.2 = add nsw i64 %1, %add7.1
  %4 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !0
  %add7.3 = add nsw i64 %4, %add7.2
  store i64 %add7.3, ptr %arrayidx.i, align 8, !tbaa !0
  ret i64 %add7.3
}

define i32 @"221"(ptr %degrees, i64 %mul12, i64 %umin, ptr %.omp.lb, i64 %indvar, i64 %0, i64 %n.mod.vf) {
bb:
  %1 = load ptr, ptr %degrees, align 8, !tbaa !9
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %3 = add i64 %2, %indvar
  %4 = shl i64 %3, %0
  %5 = sub i64 %umin, %4
  %n.vec = sub i64 %5, %n.mod.vf
  %ind.end = add i64 %mul12, %n.vec
  %arrayidx.i32 = getelementptr inbounds i32, ptr %1, i64 %ind.end
  %6 = load i32, ptr %arrayidx.i32, align 4, !tbaa !10
  ret i32 %6
}

define i32 @"222"(ptr %add.ptr.i.i, ptr %__first, ptr %add.ptr.i, ptr %add.ptr2.i, i64 %sub1.i, i64 %mul.i) {
bb:
  %0 = load i32, ptr %add.ptr.i, align 4, !tbaa !10
  %1 = load i32, ptr %add.ptr2.i, align 4, !tbaa !10
  %cmp.i.i = icmp slt i32 %0, %1
  %spec.select.i = select i1 %cmp.i.i, i64 %sub1.i, i64 %mul.i
  %add.ptr2.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i
  %2 = load i32, ptr %add.ptr.i.i, align 4, !tbaa !10
  store i32 %2, ptr %add.ptr2.i.i, align 4, !tbaa !10
  ret i32 %2
}

define i32 @"223"(ptr %num_nodes_.i, i64 %0, ptr %add.ptr.i.prol) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !66
  %n.vec = and i64 %1, %0
  %2 = trunc i64 %n.vec to i32
  store i32 %2, ptr %add.ptr.i.prol, align 4, !tbaa !71
  ret i32 %2
}

define i64 @"224"(ptr %_M_string_length.i.i.i, ptr %__dnew.i.i.i) {
bb:
  %0 = load i64, ptr %_M_string_length.i.i.i, align 8, !tbaa !58, !noalias !88
  store i64 %0, ptr %__dnew.i.i.i, align 8, !tbaa !0, !noalias !88
  ret i64 %0
}

define i64 @"225"(ptr %el) {
bb:
  %.pre710.pre = load ptr, ptr %el, align 8, !tbaa !45
  %agg.tmp.sroa.0.0.copyload.i.i.i.i.i = load i64, ptr %.pre710.pre, align 4, !tbaa.struct !63
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i.i.i
}

define i32 @"226"(ptr %neighs, ptr %arrayidx.i523, ptr %arrayidx.i524, i64 %sub.ptr.rhs.cast.i.i.i.i526, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %neighs, align 8, !tbaa !16
  %3 = load i64, ptr %arrayidx.i524, align 8, !tbaa !0
  %add.ptr121 = getelementptr inbounds i32, ptr %2, i64 %3
  %sub.ptr.lhs.cast.i.i.i.i525 = ptrtoint ptr %add.ptr121 to i64
  %sub.ptr.sub.i.i.i.i527 = sub i64 %sub.ptr.lhs.cast.i.i.i.i525, %sub.ptr.rhs.cast.i.i.i.i526
  %sub.ptr.div.i.i.i.i = lshr exact i64 %sub.ptr.sub.i.i.i.i527, %0
  %shr.i.i = lshr i64 %sub.ptr.div.i.i.i.i, %1
  %4 = load i64, ptr %arrayidx.i523, align 8, !tbaa !0
  %add.ptr = getelementptr inbounds i32, ptr %2, i64 %4
  %incdec.ptr4.sink.i.i.i.i = getelementptr inbounds i32, ptr %add.ptr, i64 %shr.i.i
  %5 = load i32, ptr %incdec.ptr4.sink.i.i.i.i, align 4, !tbaa !10
  ret i32 %5
}

define ptr @"227"(ptr %el, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %0) {
bb:
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !43
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %.pre710.pre = load ptr, ptr %el, align 8, !tbaa !45
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre710.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !43
  ret ptr %add.ptr.i
}

define double @"228"(ptr %0, ptr %1, ptr %2) {
bb:
  %3 = load ptr, ptr %2, align 8
  %4 = load double, ptr %0, align 8, !tbaa !81
  %5 = load double, ptr %1, align 8, !tbaa !81
  %add = fadd double %4, %5
  store double %add, ptr %0, align 8, !tbaa !81
  ret double %add
}

define i64 @"229"(ptr %rng, i64 %0, ptr %arrayidx42.i.i124, i64 %1, i64 %2, ptr %arrayidx49.i.i128, i64 %3, i64 %4) {
bb:
  %5 = load i64, ptr %rng, align 8, !tbaa !0
  %and52.i.i131 = and i64 %5, %2
  %tobool53.not.i.i132 = icmp eq i64 %and52.i.i131, %3
  %cond54.i.i133 = select i1 %tobool53.not.i.i132, i64 %3, i64 %4
  %and46.i.i126 = and i64 %5, %0
  %6 = load i64, ptr %arrayidx42.i.i124, align 8, !tbaa !0
  %and43.i.i125 = and i64 %6, %1
  %or47.i.i127 = or i64 %and46.i.i126, %and43.i.i125
  %shr50.i.i129 = lshr exact i64 %or47.i.i127, %2
  %7 = load i64, ptr %arrayidx49.i.i128, align 8, !tbaa !0
  %xor51.i.i130 = xor i64 %shr50.i.i129, %7
  %xor55.i.i134 = xor i64 %xor51.i.i130, %cond54.i.i133
  store i64 %xor55.i.i134, ptr %arrayidx42.i.i124, align 8, !tbaa !0
  ret i64 %xor55.i.i134
}

define i64 @"230"(ptr %__first.addr.07.i.i.i.i.i.i.i, ptr %cond.i31.i.i.i, ptr %_M_finish.i38, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4) {
bb:
  %5 = load i64, ptr %__first.addr.07.i.i.i.i.i.i.i, align 4, !alias.scope !50, !noalias !53
  %6 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !48
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %6, i64 %0
  %7 = ptrtoint ptr %incdec.ptr.i.i to i64
  %8 = add i64 %7, %1
  %9 = sub i64 %8, %2
  %10 = lshr i64 %9, %3
  %11 = add nuw nsw i64 %10, %0
  %n.vec = and i64 %11, %4
  %12 = shl i64 %n.vec, %3
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i, i64 %12
  store i64 %5, ptr %ind.end, align 4, !alias.scope !53, !noalias !50
  ret i64 %5
}

define i64 @"231"(i64 %0, ptr %offsets, ptr %num_nodes_.i, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %n.mod.vf = and i64 %2, %1
  %3 = load ptr, ptr %offsets, align 8
  %arrayidx.i493734 = getelementptr inbounds i64, ptr %3, i64 %n.mod.vf
  store i64 %0, ptr %arrayidx.i493734, align 8, !tbaa !0
  ret i64 %0
}

define <4 x float> @"232"(<2 x float> %0, ptr %1, ptr %2) {
bb:
  %wide.load = load <2 x float>, ptr %1, align 4, !tbaa !19, !alias.scope !116
  %interleaved.vec = shufflevector <2 x float> %0, <2 x float> %wide.load, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x float> %interleaved.vec, ptr %2, align 4, !tbaa !26
  ret <4 x float> %interleaved.vec
}

define ptr @"233"(ptr %call.i134135, ptr %num_nodes, i64 %0, ptr %end_size_.i) {
bb:
  %1 = load i64, ptr %num_nodes, align 8, !tbaa !0
  %add = add nsw i64 %1, %0
  %add.ptr.i = getelementptr inbounds i64, ptr %call.i134135, i64 %add
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !65
  ret ptr %add.ptr.i
}

define i64 @"234"(ptr %offsets, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %offsets, align 8, !tbaa !4
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %arrayidx.i = getelementptr inbounds i64, ptr %0, i64 %2
  %3 = load i64, ptr %arrayidx.i, align 8, !tbaa !0
  ret i64 %3
}

define <2 x i64> @"235"(ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %index770, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %4 = and i64 %3, %0
  %offset.idx = sub i64 %4, %index770
  %5 = add nuw i64 %offset.idx, %0
  %6 = and i64 %5, %0
  %7 = getelementptr inbounds i64, ptr %2, i64 %6
  %8 = getelementptr inbounds i64, ptr %7, i64 %1
  %wide.load = load <2 x i64>, ptr %8, align 8, !tbaa !0
  ret <2 x i64> %wide.load
}

define <4 x i32> @"236"(ptr %0, ptr %call171, ptr %arrayidx.i539, i64 %1, i64 %index800, i64 %2) {
bb:
  %wide.load803 = load <4 x i32>, ptr %0, align 4, !tbaa !10
  %3 = load i64, ptr %arrayidx.i539, align 8, !tbaa !0
  %sub183 = add nsw i64 %3, %1
  %offset.idx801 = sub i64 %sub183, %index800
  %4 = getelementptr inbounds i32, ptr %call171, i64 %offset.idx801
  %5 = getelementptr inbounds i32, ptr %4, i64 %2
  store <4 x i32> %wide.load803, ptr %5, align 4, !tbaa !10
  ret <4 x i32> %wide.load803
}

define i32 @"237"(ptr %arrayidx.i.i.i60, ptr %n_start.0.in, i64 %0, ptr %diffs, ptr %.omp.lb) {
bb:
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !16
  %sub.ptr.lhs.cast = ptrtoint ptr %n_end.0 to i64
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  %.pre134 = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %.pre134
  %1 = lshr exact i64 %sub.ptr.sub, %0
  %conv22 = trunc i64 %1 to i32
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %3 = sext i32 %2 to i64
  %4 = load ptr, ptr %diffs, align 8, !tbaa !9
  %arrayidx.i99 = getelementptr inbounds i32, ptr %4, i64 %3
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !10
  ret i32 %conv22
}

define i64 @"238"(ptr %arrayidx.i533, i64 %total_missing_inv.0649, ptr %arrayidx.i536, ptr %offsets, ptr %num_nodes_.i) {
bb:
  %0 = load i32, ptr %arrayidx.i536, align 4, !tbaa !10
  %conv155 = sext i32 %0 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %1 = load i64, ptr %arrayidx.i533, align 8, !tbaa !0
  %add165 = add nsw i64 %1, %add156
  %.pre716.pre727 = load ptr, ptr %offsets, align 8, !tbaa !4
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %arrayidx.i5332 = getelementptr inbounds i64, ptr %.pre716.pre727, i64 %2
  store i64 %add165, ptr %arrayidx.i533, align 8, !tbaa !0
  ret i64 %add165
}

define float @"239"(float %0, ptr %scores, ptr %.omp.lb) {
bb:
  %1 = load ptr, ptr %scores, align 8, !tbaa !17, !llvm.access.group !42
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %3 = sext i32 %2 to i64
  %arrayidx.i51 = getelementptr inbounds float, ptr %1, i64 %3
  store float %0, ptr %arrayidx.i51, align 4, !tbaa !19, !llvm.access.group !42
  ret float %0
}

define float @"240"(ptr %arrayidx.i, ptr %call5.i.i.i.i4.i.i45, ptr %num_nodes_.i, i64 %0, i32 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !66
  %n.vec = and i64 %2, %0
  %second3.i = getelementptr inbounds %"struct.std::pair", ptr %call5.i.i.i.i4.i.i45, i64 %n.vec, i32 1
  %3 = load float, ptr %arrayidx.i, align 4, !tbaa !19
  store float %3, ptr %second3.i, align 4, !tbaa !80
  ret float %3
}

define i64 @"241"(ptr %_M_b.i, ptr %__param, i64 %0, ptr %_M_b.i32) {
bb:
  %1 = load i64, ptr %_M_b.i, align 8, !tbaa !119
  %2 = load i64, ptr %__param, align 8, !tbaa !121
  %sub = sub i64 %1, %2
  %div31 = lshr i64 %sub, %0
  store i64 %div31, ptr %_M_b.i32, align 8, !tbaa !119
  ret i64 %div31
}

define i64 @"242"(ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i32, ptr %v3.i.i.i.i.i, align 4
  %1 = load i32, ptr %v.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %1, %0
  %2 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !46
  %3 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !46
  %cmp7.i.i.i.i.i = icmp slt i32 %3, %2
  %cmp.i.i.i.i.i = icmp eq i32 %3, %2
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr3.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  %4 = load i64, ptr %add.ptr3.i.i.i, align 4
  ret i64 %4
}

define i64 @"243"(ptr %add.ptr3.i.i.i, ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i64, ptr %add.ptr3.i.i.i, align 4
  %1 = load i32, ptr %v3.i.i.i.i.i, align 4
  %2 = load i32, ptr %v.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %2, %1
  %3 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !46
  %4 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !46
  %cmp7.i.i.i.i.i = icmp slt i32 %4, %3
  %cmp.i.i.i.i.i = icmp eq i32 %4, %3
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr4.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  store i64 %0, ptr %add.ptr4.i.i.i, align 4
  ret i64 %0
}

define i64 @"244"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57.epil) {
bb:
  %0 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !0
  %1 = load i64, ptr %arrayidx.i58, align 8, !tbaa !0
  %add7 = add nsw i64 %1, %total.076
  %2 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !0
  %add7.1 = add nsw i64 %2, %add7
  %add7.2 = add nsw i64 %0, %add7.1
  %3 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !0
  %add7.3 = add nsw i64 %3, %add7.2
  store i64 %add7.3, ptr %arrayidx.i57.epil, align 8, !tbaa !0
  ret i64 %add7.3
}

define i8 @"245"(ptr %arrayidx.i17.i, ptr %ref.tmp, i64 %conv5.i, i64 %idxprom1.i.i) {
bb:
  %0 = load ptr, ptr %ref.tmp, align 8, !tbaa !41, !alias.scope !107
  %arrayidx.i.i = getelementptr inbounds i8, ptr %0, i64 %conv5.i
  %arrayidx2.i.i = getelementptr inbounds i8, ptr %arrayidx.i.i, i64 %idxprom1.i.i
  %1 = load i8, ptr %arrayidx.i17.i, align 1, !tbaa !26, !noalias !107
  store i8 %1, ptr %arrayidx2.i.i, align 1, !tbaa !26
  ret i8 %1
}

define i64 @"246"(ptr %el, i64 %0) {
bb:
  %.pre710.pre = load ptr, ptr %el, align 8, !tbaa !45
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre710.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i78.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !63
  ret i64 %agg.tmp.sroa.0.0.copyload.i78.i.i.i.i
}

define i64 @"247"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !59
  %inc.i71 = add nuw nsw i64 %1, %0
  store i64 %inc.i71, ptr %_M_p.i.i.i, align 8, !tbaa !59
  ret i64 %inc.i71
}

define ptr @"248"(ptr %new_range.i.i, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1, ptr %el) {
bb:
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !43
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !45
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !43
  ret ptr %add.ptr.i464
}

!0 = !{!1, !1, i64 0}
!1 = !{!"long", !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C++ TBAA"}
!4 = !{!5, !6, i64 0}
!5 = !{!"_ZTS7pvectorIlE", !6, i64 0, !6, i64 8, !6, i64 16}
!6 = !{!"any pointer", !2, i64 0}
!7 = !{!8, !6, i64 8}
!8 = !{!"_ZTS7pvectorIiE", !6, i64 0, !6, i64 8, !6, i64 16}
!9 = !{!8, !6, i64 0}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !2, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"bool", !2, i64 0}
!14 = !{i8 0, i8 2}
!15 = !{}
!16 = !{!6, !6, i64 0}
!17 = !{!18, !6, i64 0}
!18 = !{!"_ZTS7pvectorIfE", !6, i64 0, !6, i64 8, !6, i64 16}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !2, i64 0}
!21 = !{!22}
!22 = distinct !{!22, !23}
!23 = distinct !{!23, !"LVerDomain"}
!24 = !{!25}
!25 = distinct !{!25, !23}
!26 = !{!2, !2, i64 0}
!27 = !{!28}
!28 = distinct !{!28, !29, !"_ZNSt7__cxx119to_stringEi: %agg.result"}
!29 = distinct !{!29, !"_ZNSt7__cxx119to_stringEi"}
!30 = !{!31, !11, i64 172}
!31 = !{!"_ZTS10CLPageRank", !32, i64 0, !11, i64 172, !40, i64 176}
!32 = !{!"_ZTS5CLApp", !33, i64 0, !13, i64 155, !11, i64 156, !1, i64 160, !13, i64 168, !13, i64 169}
!33 = !{!"_ZTS6CLBase", !11, i64 8, !6, i64 16, !34, i64 24, !34, i64 56, !36, i64 88, !11, i64 112, !11, i64 116, !34, i64 120, !13, i64 152, !13, i64 153, !13, i64 154}
!34 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !35, i64 0, !1, i64 8, !2, i64 16}
!35 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !6, i64 0}
!36 = !{!"_ZTSSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !37, i64 0}
!37 = !{!"_ZTSSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !38, i64 0}
!38 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implE", !39, i64 0}
!39 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_Vector_impl_dataE", !6, i64 0, !6, i64 8, !6, i64 16}
!40 = !{!"double", !2, i64 0}
!41 = !{!34, !6, i64 0}
!42 = distinct !{}
!43 = !{!44, !6, i64 8}
!44 = !{!"_ZTS7pvectorI8EdgePairIiiEE", !6, i64 0, !6, i64 8, !6, i64 16}
!45 = !{!44, !6, i64 0}
!46 = !{!47, !11, i64 0}
!47 = !{!"_ZTS8EdgePairIiiE", !11, i64 0, !11, i64 4}
!48 = !{!49, !6, i64 8}
!49 = !{!"_ZTSNSt12_Vector_baseISt4pairIfiESaIS1_EE17_Vector_impl_dataE", !6, i64 0, !6, i64 8, !6, i64 16}
!50 = !{!51}
!51 = distinct !{!51, !52, !"_ZSt19__relocate_object_aISt4pairIfiES1_SaIS1_EEvPT_PT0_RT1_: %__orig"}
!52 = distinct !{!52, !"_ZSt19__relocate_object_aISt4pairIfiES1_SaIS1_EEvPT_PT0_RT1_"}
!53 = !{!54}
!54 = distinct !{!54, !52, !"_ZSt19__relocate_object_aISt4pairIfiES1_SaIS1_EEvPT_PT0_RT1_: %__dest"}
!55 = !{!56, !1, i64 16}
!56 = !{!"_ZTS11BuilderBaseIiiiLb1EE", !6, i64 0, !13, i64 8, !13, i64 9, !13, i64 10, !1, i64 16}
!57 = !{!44, !6, i64 16}
!58 = !{!34, !1, i64 8}
!59 = !{!60, !1, i64 4992}
!60 = !{!"_ZTSSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE", !2, i64 0, !1, i64 4992}
!61 = !{!62, !11, i64 0}
!62 = !{!"_ZTS10NodeWeightIiiE", !11, i64 0, !11, i64 4}
!63 = !{i64 0, i64 4, !10, i64 4, i64 4, !10}
!64 = !{i64 0, i64 4, !10}
!65 = !{!5, !6, i64 8}
!66 = !{!67, !1, i64 8}
!67 = !{!"_ZTS8CSRGraphIiiLb1EE", !13, i64 0, !1, i64 8, !1, i64 16, !6, i64 24, !6, i64 32, !6, i64 40, !6, i64 48}
!68 = !{!69}
!69 = distinct !{!69, !70, !"_ZN11BuilderBaseIiiiLb1EE11SquishGraphERK8CSRGraphIiiLb1EE: %agg.result"}
!70 = distinct !{!70, !"_ZN11BuilderBaseIiiiLb1EE11SquishGraphERK8CSRGraphIiiLb1EE"}
!71 = !{!72, !11, i64 0}
!72 = !{!"_ZTSSt4pairIifE", !11, i64 0, !20, i64 4}
!73 = !{!67, !6, i64 24}
!74 = !{!75}
!75 = distinct !{!75, !76, !"_ZSt19__relocate_object_aINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_SaIS5_EEvPT_PT0_RT1_: %__orig"}
!76 = distinct !{!76, !"_ZSt19__relocate_object_aINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_SaIS5_EEvPT_PT0_RT1_"}
!77 = !{!78}
!78 = distinct !{!78, !76, !"_ZSt19__relocate_object_aINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_SaIS5_EEvPT_PT0_RT1_: %__dest"}
!79 = !{!35, !6, i64 0}
!80 = !{!72, !20, i64 4}
!81 = !{!40, !40, i64 0}
!82 = !{!39, !6, i64 8}
!83 = !{!39, !6, i64 16}
!84 = !{!85, !11, i64 4}
!85 = !{!"_ZTSSt4pairIfiE", !20, i64 0, !11, i64 4}
!86 = !{!87, !6, i64 8}
!87 = !{!"_ZTSNSt12_Vector_baseISt4pairIifESaIS1_EE17_Vector_impl_dataE", !6, i64 0, !6, i64 8, !6, i64 16}
!88 = !{!89}
!89 = distinct !{!89, !90, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_: %agg.result"}
!90 = distinct !{!90, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_"}
!91 = !{!85, !20, i64 0}
!92 = !{!93, !1, i64 16}
!93 = !{!"_ZTS9GeneratorIiiijLi32ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEE", !11, i64 0, !1, i64 8, !1, i64 16}
!94 = !{!49, !6, i64 16}
!95 = !{!93, !1, i64 8}
!96 = !{!97}
!97 = distinct !{!97, !98, !"_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm: %agg.result"}
!98 = distinct !{!98, !"_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm"}
!99 = !{!18, !6, i64 8}
!100 = !{!101, !6, i64 240}
!101 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !102, i64 0, !6, i64 216, !2, i64 224, !13, i64 225, !6, i64 232, !6, i64 240, !6, i64 248, !6, i64 256}
!102 = !{!"_ZTSSt8ios_base", !1, i64 8, !1, i64 16, !103, i64 24, !104, i64 28, !104, i64 32, !6, i64 40, !105, i64 48, !2, i64 64, !11, i64 192, !6, i64 200, !106, i64 208}
!103 = !{!"_ZTSSt13_Ios_Fmtflags", !2, i64 0}
!104 = !{!"_ZTSSt12_Ios_Iostate", !2, i64 0}
!105 = !{!"_ZTSNSt8ios_base6_WordsE", !6, i64 0, !1, i64 8}
!106 = !{!"_ZTSSt6locale", !6, i64 0}
!107 = !{!108}
!108 = distinct !{!108, !109, !"_ZNSt7__cxx119to_stringEi: %agg.result"}
!109 = distinct !{!109, !"_ZNSt7__cxx119to_stringEi"}
!110 = !{!67, !6, i64 40}
!111 = !{!112}
!112 = distinct !{!112, !113, !"_ZNK8CSRGraphIiiLb1EE8in_neighEim: %agg.result"}
!113 = distinct !{!113, !"_ZNK8CSRGraphIiiLb1EE8in_neighEim"}
!114 = !{!115, !115, i64 0}
!115 = !{!"vtable pointer", !3, i64 0}
!116 = !{!117}
!117 = distinct !{!117, !118}
!118 = distinct !{!118, !"LVerDomain"}
!119 = !{!120, !1, i64 8}
!120 = !{!"_ZTSNSt24uniform_int_distributionImE10param_typeE", !1, i64 0, !1, i64 8}
!121 = !{!120, !1, i64 0}
