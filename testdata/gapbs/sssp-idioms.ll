; ModuleID = 'sssp-idioms'
source_filename = "sssp-idioms"
target triple = "riscv64"

%struct.NodeWeight = type { i32, i32 }
%"class.std::vector.3" = type { %"struct.std::_Vector_base.4" }
%"struct.std::_Vector_base.4" = type { %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl" }
%"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl" = type { %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data" }
%"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data" = type { ptr, ptr, ptr }
%struct.EdgePair = type { i32, %struct.NodeWeight }
%"struct.std::pair" = type { i32, i32 }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char>::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char>::_Alloc_hider" = type { ptr }
%union.anon = type { i64, [8 x i8] }
%"class.std::mersenne_twister_engine" = type { [312 x i64], i64 }

define i32 @"0"(ptr %neighs, ptr %arrayidx.i567, ptr %arrayidx.i568, ptr %arrayidx.i569, i64 %sub.ptr.rhs.cast.i.i.i.i572, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i569, align 8, !tbaa !0
  %3 = load ptr, ptr %neighs, align 8, !tbaa !4
  %add.ptr287 = getelementptr inbounds %struct.NodeWeight, ptr %3, i64 %2
  %sub.ptr.lhs.cast.i.i.i.i571 = ptrtoint ptr %add.ptr287 to i64
  %sub.ptr.sub.i.i.i.i573 = sub i64 %sub.ptr.lhs.cast.i.i.i.i571, %sub.ptr.rhs.cast.i.i.i.i572
  %sub.ptr.div.i.i.i.i586 = lshr exact i64 %sub.ptr.sub.i.i.i.i573, %0
  %shr.i.i591 = lshr i64 %sub.ptr.div.i.i.i.i586, %1
  %4 = load i64, ptr %arrayidx.i567, align 8, !tbaa !0
  %add.ptr277 = getelementptr inbounds %struct.NodeWeight, ptr %3, i64 %4
  %5 = load i32, ptr %arrayidx.i568, align 4, !tbaa !6
  %idx.ext = sext i32 %5 to i64
  %add.ptr281 = getelementptr inbounds %struct.NodeWeight, ptr %add.ptr277, i64 %idx.ext
  %incdec.ptr4.sink.i.i.i.i595 = getelementptr inbounds %struct.NodeWeight, ptr %add.ptr281, i64 %shr.i.i591
  %6 = load i32, ptr %incdec.ptr4.sink.i.i.i.i595, align 4, !tbaa !8
  ret i32 %6
}

define i64 @"1"(ptr %arrayidx.i59, ptr %agg.result, ptr %end_size_.i, ptr %degrees, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i59, align 8, !tbaa !0
  %2 = load ptr, ptr %agg.result, align 8, !tbaa !10
  %3 = load ptr, ptr %degrees, align 8, !tbaa !12
  %sub.ptr.rhs.cast.i62 = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %end_size_.i, align 8, !tbaa !14
  %sub.ptr.lhs.cast.i61 = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i63 = sub i64 %sub.ptr.lhs.cast.i61, %sub.ptr.rhs.cast.i62
  %sub.ptr.div.i64 = ashr exact i64 %sub.ptr.sub.i63, %0
  %arrayidx.i65 = getelementptr inbounds i64, ptr %2, i64 %sub.ptr.div.i64
  store i64 %1, ptr %arrayidx.i65, align 8, !tbaa !0
  ret i64 %1
}

define <2 x i32> @"3"(ptr %degrees, ptr %.omp.lb, i64 %0, i64 %index) {
bb:
  %1 = load ptr, ptr %degrees, align 8, !tbaa !12
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul12 = shl i64 %2, %0
  %offset.idx = add i64 %mul12, %index
  %3 = getelementptr inbounds i32, ptr %1, i64 %offset.idx
  %wide.load = load <2 x i32>, ptr %3, align 4, !tbaa !6
  ret <2 x i32> %wide.load
}

define ptr @"4"(ptr %local_bins, ptr %arrayidx277) {
bb:
  %0 = load i64, ptr %arrayidx277, align 8, !tbaa !0
  %1 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %add.ptr.i173 = getelementptr inbounds %"class.std::vector.3", ptr %1, i64 %0
  %2 = load ptr, ptr %add.ptr.i173, align 8, !tbaa !4
  ret ptr %2
}

define <4 x i32> @"5"(<4 x i32> %0, ptr %init_val, i64 %1, ptr %this, ptr %.omp.lb, i64 %index, i64 %2) {
bb:
  %3 = load i32, ptr %init_val, align 4, !tbaa !6, !alias.scope !17
  %broadcast.splatinsert21 = insertelement <4 x i32> %0, i32 %3, i64 %1
  %broadcast.splat22 = shufflevector <4 x i32> %broadcast.splatinsert21, <4 x i32> %0, <4 x i32> zeroinitializer
  %4 = load ptr, ptr %this, align 8, !tbaa !12
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %offset.idx = add i64 %5, %index
  %6 = getelementptr inbounds i32, ptr %4, i64 %offset.idx
  %7 = getelementptr inbounds i32, ptr %6, i64 %2
  store <4 x i32> %broadcast.splat22, ptr %7, align 4, !tbaa !6, !alias.scope !20, !noalias !17
  ret <4 x i32> %broadcast.splat22
}

define ptr @"6"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, ptr %.omp.lb, i64 %1) {
bb:
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !6
  %3 = sext i32 %2 to i64
  %4 = add nsw i64 %3, %1
  %5 = load ptr, ptr %out_index_.i, align 8
  %6 = load ptr, ptr %in_index_.i, align 8
  %7 = load i8, ptr %transpose, align 1, !tbaa !22, !range !24, !noundef !25
  %tobool.not = icmp eq i8 %7, %0
  %.sink = select i1 %tobool.not, ptr %5, ptr %6
  %arrayidx.i.i.i60 = getelementptr inbounds ptr, ptr %.sink, i64 %4
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !4
  ret ptr %n_end.0
}

define <2 x i64> @"7"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %.omp.lb, i64 %3, i64 %4, i64 %5, <2 x i64> %6, <2 x i64> %7, ptr %8, <2 x i64> %9, <2 x i64> %10, ptr %11) {
bb:
  %wide.load168 = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %12 = and <2 x i64> %wide.load168, %7
  %13 = icmp eq <2 x i64> %12, %9
  %14 = select <2 x i1> %13, <2 x i64> %9, <2 x i64> %10
  %15 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add11 = add i64 %15, %3
  %rem.i.i.i = and i64 %add11, %4
  %vector.recur.init166 = insertelement <2 x i64> %2, i64 %rem.i.i.i, i64 %5
  %16 = shufflevector <2 x i64> %vector.recur.init166, <2 x i64> %wide.load168, <2 x i32> <i32 1, i32 2>
  %17 = and <2 x i64> %16, %6
  %18 = and <2 x i64> %wide.load168, %1
  %19 = or <2 x i64> %18, %17
  %20 = lshr exact <2 x i64> %19, %7
  %wide.load169 = load <2 x i64>, ptr %8, align 8, !tbaa !0
  %21 = xor <2 x i64> %20, %wide.load169
  %22 = xor <2 x i64> %21, %14
  store <2 x i64> %22, ptr %11, align 8, !tbaa !0
  ret <2 x i64> %22
}

define i8 @"8"(ptr %arrayidx17.i.i, ptr %agg.tmp11, ptr %delta_, i32 %0) {
bb:
  %1 = load i8, ptr %arrayidx17.i.i, align 2, !tbaa !26, !noalias !27
  %2 = load ptr, ptr %agg.tmp11, align 8, !tbaa !30, !alias.scope !27
  %3 = load i32, ptr %delta_, align 4, !tbaa !33
  %__val.lobit.i = lshr i32 %3, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %arrayidx.i.i = getelementptr inbounds i8, ptr %2, i64 %conv5.i
  store i8 %1, ptr %arrayidx.i.i, align 1, !tbaa !26
  ret i8 %1
}

define i32 @"9"(ptr %diffs, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %diffs, align 8, !tbaa !12
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !6
  %2 = sext i32 %1 to i64
  %arrayidx.i44 = getelementptr inbounds i32, ptr %0, i64 %2
  %3 = load i32, ptr %arrayidx.i44, align 4, !tbaa !6
  ret i32 %3
}

define i32 @"10"(ptr %init_val, ptr %this, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %this, align 8, !tbaa !12
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add.ptr.prol = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %init_val, align 4, !tbaa !6
  store i32 %2, ptr %add.ptr.prol, align 4, !tbaa !6
  ret i32 %2
}

define i64 @"11"(ptr %arrayidx.i28, i64 %0, ptr %el, i64 %.omp.iv.031, i64 %1) {
bb:
  %2 = load i32, ptr %arrayidx.i28, align 4, !tbaa !6
  %agg.tmp.sroa.0.0.insert.ext = zext i32 %2 to i64
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.0.0.insert.ext, %0
  %3 = load ptr, ptr %el, align 8, !tbaa !41
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %.omp.iv.031
  %ref.tmp.sroa.4.0.arrayidx.i29.sroa_idx = getelementptr inbounds i8, ptr %arrayidx.i, i64 %1
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %ref.tmp.sroa.4.0.arrayidx.i29.sroa_idx, align 4, !tbaa.struct !43
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"12"(ptr %second.i.phi.trans.insert.i.i.i, ptr %mq, ptr %cond.i31.i.i.i.i, ptr %_M_finish.i.i.i, i64 %0, i64 %1, i64 %2, i64 %3, i64 %sub.ptr.rhs.cast.i.i.i, i64 %4, i32 %5) {
bb:
  %.pre.i.i.i = load i32, ptr %second.i.phi.trans.insert.i.i.i, align 4, !tbaa !6
  %.pre.i = load ptr, ptr %mq, align 8, !tbaa !4
  %6 = load ptr, ptr %_M_finish.i.i.i, align 8, !tbaa !4
  %7 = ptrtoint ptr %6 to i64
  %8 = add i64 %7, %0
  %9 = load ptr, ptr %mq, align 8, !tbaa !4
  %10 = ptrtoint ptr %9 to i64
  %11 = sub i64 %8, %10
  %12 = lshr i64 %11, %1
  %13 = add nuw nsw i64 %12, %2
  %n.vec = and i64 %13, %3
  %14 = shl i64 %n.vec, %1
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i.i, i64 %14
  %incdec.ptr.i.i.i.i = getelementptr %"struct.std::pair", ptr %ind.end, i64 %2
  %sub.ptr.lhs.cast.i.i.i = ptrtoint ptr %incdec.ptr.i.i.i.i to i64
  %sub.ptr.sub.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i, %sub.ptr.rhs.cast.i.i.i
  %sub.ptr.div.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i, %1
  %sub.i.i = add nsw i64 %sub.ptr.div.i.i.i, %4
  %second3.i.i.i.i = getelementptr inbounds %"struct.std::pair", ptr %.pre.i, i64 %sub.i.i, i32 1
  store i32 %.pre.i.i.i, ptr %second3.i.i.i.i, align 4, !tbaa !44
  ret i32 %.pre.i.i.i
}

define i64 @"13"(ptr %0, ptr %arrayidx270, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx270, align 4
  %sext = shl i64 %2, %1
  %conv273 = ashr exact i64 %sext, %1
  %arrayidx.i567 = getelementptr inbounds i64, ptr %0, i64 %conv273
  %3 = load i64, ptr %arrayidx.i567, align 8, !tbaa !0
  ret i64 %3
}

define ptr @"14"(ptr %local_bins, ptr %arrayidx277, i64 %0, i32 %1) {
bb:
  %2 = load i64, ptr %arrayidx277, align 8, !tbaa !0
  %3 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %add.ptr.i = getelementptr inbounds %"class.std::vector.3", ptr %3, i64 %2
  %_M_finish.i.i = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i, i64 %0, i32 1
  %4 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !4
  ret ptr %4
}

define i64 @"15"(ptr %arrayidx225, ptr %neighs, i64 %tail_index.1.lcssa, ptr %arrayidx.i560) {
bb:
  %0 = load i64, ptr %arrayidx225, align 4
  %1 = load i32, ptr %arrayidx.i560, align 4, !tbaa !6
  %conv211 = sext i32 %1 to i64
  %sub239 = sub nsw i64 %tail_index.1.lcssa, %conv211
  %2 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx226 = getelementptr inbounds %struct.NodeWeight, ptr %2, i64 %sub239
  store i64 %0, ptr %arrayidx226, align 4
  ret i64 %0
}

define i32 @"16"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, ptr %w.i.i.i.i.i.i, ptr %w3.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !8
  %3 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !8
  %cmp7.i.i.i.i.i.i = icmp slt i32 %3, %2
  %4 = load i32, ptr %w.i.i.i.i.i.i, align 4
  %5 = load i32, ptr %w3.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i = icmp slt i32 %4, %5
  %cmp.i.i.i.i.i.i = icmp eq i32 %3, %2
  %cond.i.i.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i1 %cmp4.i.i.i.i.i.i, i1 %cmp7.i.i.i.i.i.i
  %spec.select.i.i.i.i = select i1 %cond.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %__parent.020.in.i.i.i.i.i = add nsw i64 %sub12.i.i.i.i, %1
  %__parent.020.i.i56.i.i.i = lshr i64 %__parent.020.in.i.i.i.i.i, %0
  %add.ptr.i.i.i.i.i = getelementptr inbounds %struct.NodeWeight, ptr %__first, i64 %__parent.020.i.i56.i.i.i
  %6 = load i32, ptr %add.ptr.i.i.i.i.i, align 4, !tbaa !8
  ret i32 %6
}

define i64 @"17"(ptr %arrayidx.i28, i64 %0, ptr %el, ptr %.omp.lb, i64 %1) {
bb:
  %2 = load i32, ptr %arrayidx.i28, align 4, !tbaa !6
  %agg.tmp.sroa.0.0.insert.ext = zext i32 %2 to i64
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.0.0.insert.ext, %0
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %4 = load ptr, ptr %el, align 8, !tbaa !41
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %4, i64 %3
  %ref.tmp.sroa.4.0.arrayidx.i29.sroa_idx = getelementptr inbounds i8, ptr %arrayidx.i, i64 %1
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %ref.tmp.sroa.4.0.arrayidx.i29.sroa_idx, align 4, !tbaa.struct !43
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i64 @"18"(ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %__i.018.i, ptr %arrayidx7.i) {
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

define i64 @"20"(ptr %offsets, ptr %arrayidx270, i64 %0) {
bb:
  %.pre763 = load ptr, ptr %offsets, align 8, !tbaa !10
  %1 = load i64, ptr %arrayidx270, align 4
  %sext = shl i64 %1, %0
  %conv273 = ashr exact i64 %sext, %0
  %arrayidx.i567 = getelementptr inbounds i64, ptr %.pre763, i64 %conv273
  %2 = load i64, ptr %arrayidx.i567, align 8, !tbaa !0
  ret i64 %2
}

define ptr @"21"(ptr %local_bins, ptr %arrayidx277, i64 %0, i32 %1) {
bb:
  %2 = load i64, ptr %arrayidx277, align 8, !tbaa !0
  %3 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %add.ptr.i173 = getelementptr inbounds %"class.std::vector.3", ptr %3, i64 %2
  %_M_finish.i.i174 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i173, i64 %0, i32 1
  %4 = load ptr, ptr %_M_finish.i.i174, align 8, !tbaa !4
  ret ptr %4
}

define i32 @"22"(ptr %n_start.0.in, i64 %0, ptr %diffs, ptr %.omp.lb) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !6
  %2 = sext i32 %1 to i64
  %3 = load ptr, ptr %diffs, align 8, !tbaa !12
  %arrayidx.i98 = getelementptr inbounds i32, ptr %3, i64 %2
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  %sub.ptr.lhs.cast = ptrtoint ptr %n_start.0 to i64
  %.pre133 = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %.pre133
  %4 = lshr exact i64 %sub.ptr.sub, %0
  %conv22 = trunc i64 %4 to i32
  store i32 %conv22, ptr %arrayidx.i98, align 4, !tbaa !6
  ret i32 %conv22
}

define i64 @"23"(ptr %offsets, ptr %arrayidx270, i64 %0, i64 %1) {
bb:
  %.pre765 = load ptr, ptr %offsets, align 8, !tbaa !10
  %2 = load i64, ptr %arrayidx270, align 4
  %sext = shl i64 %2, %0
  %sext669 = add i64 %sext, %1
  %conv284 = ashr exact i64 %sext669, %0
  %arrayidx.i569 = getelementptr inbounds i64, ptr %.pre765, i64 %conv284
  %3 = load i64, ptr %arrayidx.i569, align 8, !tbaa !0
  ret i64 %3
}

define ptr @"24"(ptr %local_bins) {
bb:
  %0 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %1 = load ptr, ptr %0, align 8, !tbaa !46
  ret ptr %1
}

define i64 @"25"(ptr %__first.addr.034.i.i, ptr %n_start.0.in) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  %0 = load i64, ptr %__first.addr.034.i.i, align 4
  store i64 %0, ptr %n_start.0, align 4
  ret i64 %0
}

define <2 x i64> @"26"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %rng, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
bb:
  %wide.load168 = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %10 = and <2 x i64> %wide.load168, %5
  %11 = icmp eq <2 x i64> %10, %7
  %12 = select <2 x i1> %11, <2 x i64> %7, <2 x i64> %8
  %13 = load i64, ptr %rng, align 8, !tbaa !0
  %vector.recur.init166 = insertelement <2 x i64> %2, i64 %13, i64 %3
  %14 = shufflevector <2 x i64> %vector.recur.init166, <2 x i64> %wide.load168, <2 x i32> <i32 1, i32 2>
  %15 = and <2 x i64> %14, %4
  %16 = and <2 x i64> %wide.load168, %1
  %17 = or <2 x i64> %16, %15
  %18 = lshr exact <2 x i64> %17, %5
  %wide.load169 = load <2 x i64>, ptr %6, align 8, !tbaa !0
  %19 = xor <2 x i64> %18, %wide.load169
  %20 = xor <2 x i64> %19, %12
  store <2 x i64> %20, ptr %9, align 8, !tbaa !0
  ret <2 x i64> %20
}

define i32 @"27"(ptr %degrees, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %degrees, align 8, !tbaa !12
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul14 = shl i64 %2, %0
  %arrayidx.i35 = getelementptr inbounds i32, ptr %1, i64 %mul14
  %3 = load i32, ptr %arrayidx.i35, align 4, !tbaa !6
  ret i32 %3
}

define i64 @"28"(ptr %agg.tmp, ptr %end_size_.i.i) {
bb:
  %agg.tmp.0.agg.tmp.0.agg.tmp.0.agg.tmp.coerce.sroa.0.0.copyload = load i64, ptr %agg.tmp, align 8
  %0 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !48
  store i64 %agg.tmp.0.agg.tmp.0.agg.tmp.0.agg.tmp.coerce.sroa.0.0.copyload, ptr %0, align 4, !tbaa.struct !49
  ret i64 %agg.tmp.0.agg.tmp.0.agg.tmp.0.agg.tmp.coerce.sroa.0.0.copyload
}

define i64 @"29"(ptr %offsets, ptr %num_nodes_.i, i32 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8, !tbaa !10
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !50
  %4 = trunc i64 %3 to i32
  %n197.0700 = add i32 %4, %0
  %5 = zext i32 %n197.0700 to i64
  %sext778 = shl i64 %5, %1
  %conv215 = ashr exact i64 %sext778, %1
  %arrayidx.i561 = getelementptr inbounds i64, ptr %2, i64 %conv215
  %6 = load i64, ptr %arrayidx.i561, align 8, !tbaa !0
  ret i64 %6
}

define i32 @"30"(ptr %v, i64 %0, ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %1, i64 %2) {
bb:
  %agg.tmp73.sroa.0.0.copyload = load i64, ptr %v, align 8, !tbaa.struct !43
  %3 = lshr i64 %agg.tmp73.sroa.0.0.copyload, %0
  %4 = trunc i64 %3 to i32
  %5 = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %6 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !48
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %6 to i64
  %7 = load ptr, ptr %agg.result, align 8, !tbaa !41
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %7 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = sdiv exact i64 %sub.ptr.sub.i12.i.i, %1
  %add.ptr.i.i151 = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %sub.ptr.div.i13.i.i
  %val.sroa.2.0..sroa_idx.i = getelementptr inbounds i8, ptr %add.ptr.i.i151, i64 %2
  store i32 %4, ptr %val.sroa.2.0..sroa_idx.i, align 4, !tbaa.struct !52
  ret i32 %4
}

define ptr @"31"(ptr %local_bins, ptr %arrayidx277, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %.pre283 = load i64, ptr %arrayidx277, align 8, !tbaa !0
  %add.ptr.i308 = getelementptr inbounds %"class.std::vector.3", ptr %2, i64 %.pre283
  %_M_finish.i.i309 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i308, i64 %0, i32 1
  %3 = load ptr, ptr %_M_finish.i.i309, align 8, !tbaa !4
  ret ptr %3
}

define ptr @"32"(ptr %local_bins, ptr %arrayidx.i36, ptr %__begin1.064, i64 %0, i32 %delta) {
bb:
  %1 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %2 = load i32, ptr %arrayidx.i36, align 4, !tbaa !6
  %3 = load i64, ptr %__begin1.064, align 4
  %wn.sroa.8.0.extract.shift = lshr i64 %3, %0
  %wn.sroa.8.0.extract.trunc = trunc i64 %wn.sroa.8.0.extract.shift to i32
  %add = add nsw i32 %2, %wn.sroa.8.0.extract.trunc
  %div = sdiv i32 %add, %delta
  %conv10 = sext i32 %div to i64
  %add.ptr.i43 = getelementptr inbounds %"class.std::vector.3", ptr %1, i64 %conv10
  %4 = load ptr, ptr %add.ptr.i43, align 8, !tbaa !4
  ret ptr %4
}

define i32 @"33"(ptr %init_val, ptr %this, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %this, align 8, !tbaa !12
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add.ptr = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %init_val, align 4, !tbaa !6
  store i32 %2, ptr %add.ptr, align 4, !tbaa !6
  ret i32 %2
}

define i64 @"34"(ptr %agg.tmp, ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %0) {
bb:
  %agg.tmp.0.agg.tmp.0.agg.tmp.0.agg.tmp.coerce.sroa.0.0.copyload = load i64, ptr %agg.tmp, align 8
  %1 = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %2 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !48
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %agg.result, align 8, !tbaa !41
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = sdiv exact i64 %sub.ptr.sub.i12.i.i, %0
  %add.ptr.i.i151 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %sub.ptr.div.i13.i.i
  store i64 %agg.tmp.0.agg.tmp.0.agg.tmp.0.agg.tmp.coerce.sroa.0.0.copyload, ptr %add.ptr.i.i151, align 4, !tbaa.struct !49
  ret i64 %agg.tmp.0.agg.tmp.0.agg.tmp.0.agg.tmp.coerce.sroa.0.0.copyload
}

define i64 @"35"(ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57.2) {
bb:
  %0 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !0
  %1 = load i64, ptr %arrayidx.i58, align 8, !tbaa !0
  %add7 = add nsw i64 %1, %total.076
  %add7.1 = add nsw i64 %0, %add7
  store i64 %add7.1, ptr %arrayidx.i57.2, align 8, !tbaa !0
  ret i64 %add7.1
}

define i64 @"36"(ptr %_M_string_length.i23.i.i.i.phi.trans.insert, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %_M_string_length.i24.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i, i32 1
  %.pre = load i64, ptr %_M_string_length.i23.i.i.i.phi.trans.insert, align 8, !tbaa !53
  store i64 %.pre, ptr %_M_string_length.i24.i.i.i, align 8, !tbaa !53
  ret i64 %.pre
}

define i64 @"37"(ptr %arrayidx.i58, ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, i64 %add7, ptr %arrayidx.i57.1) {
bb:
  %0 = load i64, ptr %arrayidx.i58, align 8, !tbaa !0
  %1 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !0
  %2 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !0
  %add7.1 = add nsw i64 %2, %add7
  %add7.2 = add nsw i64 %1, %add7.1
  %3 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !0
  %add7.3 = add nsw i64 %3, %add7.2
  %add72 = add nsw i64 %0, %add7.3
  store i64 %add7, ptr %arrayidx.i57.1, align 8, !tbaa !0
  ret i64 %add7
}

define i32 @"38"(ptr %num_nodes, i64 %0, ptr %length.i) {
bb:
  %1 = load i64, ptr %num_nodes, align 8, !tbaa !0
  %add = add nsw i64 %1, %0
  %conv.i = trunc i64 %add to i32
  store i32 %conv.i, ptr %length.i, align 4, !tbaa !6
  ret i32 %conv.i
}

define i64 @"39"(ptr %offsets, ptr %arrayidx270, i64 %0, i64 %1) {
bb:
  %.pre763 = load ptr, ptr %offsets, align 8, !tbaa !10
  %2 = load i64, ptr %arrayidx270, align 4
  %sext = shl i64 %2, %0
  %sext669 = add i64 %sext, %1
  %conv284 = ashr exact i64 %sext669, %0
  %arrayidx.i569 = getelementptr inbounds i64, ptr %.pre763, i64 %conv284
  %3 = load i64, ptr %arrayidx.i569, align 8, !tbaa !0
  ret i64 %3
}

define i64 @"40"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !54
  %inc.i72 = add nuw nsw i64 %1, %0
  %inc.i65 = add nuw nsw i64 %inc.i72, %0
  store i64 %inc.i65, ptr %_M_p.i.i.i, align 8, !tbaa !54
  ret i64 %inc.i65
}

define i64 @"41"(ptr %arrayidx23.i.i, i64 %0, ptr %1, i64 %2, i64 %3, ptr %arrayidx28.i.i, i64 %4, i64 %5, ptr %udist_, i64 %6) {
bb:
  %7 = load i64, ptr %arrayidx28.i.i, align 8, !tbaa !0
  %8 = load i64, ptr %arrayidx23.i.i, align 8, !tbaa !0
  %and24.i.i = and i64 %8, %0
  %wide.load = load <2 x i64>, ptr %1, align 8, !tbaa !0
  %vector.recur.extract = extractelement <2 x i64> %wide.load, i64 %2
  %and20.i.i = and i64 %vector.recur.extract, %3
  %or25.i.i = or i64 %and24.i.i, %and20.i.i
  %shr29.i.i = lshr exact i64 %or25.i.i, %2
  %xor30.i.i = xor i64 %shr29.i.i, %7
  %and31.i.i = and i64 %8, %2
  %tobool32.not.i.i = icmp eq i64 %and31.i.i, %4
  %cond33.i.i = select i1 %tobool32.not.i.i, i64 %4, i64 %5
  %xor34.i.i = xor i64 %xor30.i.i, %cond33.i.i
  %9 = load ptr, ptr %udist_, align 8, !tbaa !56
  %arrayidx19.i.i = getelementptr inbounds [312 x i64], ptr %9, i64 %4, i64 310
  store i64 %xor34.i.i, ptr %arrayidx19.i.i, align 8, !tbaa !0
  ret i64 %xor34.i.i
}

define ptr @"42"(ptr %add.ptr.i194.phi.trans.insert, ptr %local_bins, ptr %arrayidx4, i32 %0, i32 %1) {
bb:
  %.pre287 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %.pre286 = load i64, ptr %arrayidx4, align 8, !tbaa !0
  %_M_finish.i.i195 = getelementptr inbounds %"class.std::vector.3", ptr %.pre287, i64 %.pre286, i32 0, i32 0, i32 0, i32 1
  %.pre289 = load ptr, ptr %add.ptr.i194.phi.trans.insert, align 8, !tbaa !46
  store ptr %.pre289, ptr %_M_finish.i.i195, align 8, !tbaa !58
  ret ptr %.pre289
}

define ptr @"43"(ptr %local_bins, ptr %arrayidx277, i64 %0, i32 %1) {
bb:
  %.pre283 = load i64, ptr %arrayidx277, align 8, !tbaa !0
  %2 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %add.ptr.i173 = getelementptr inbounds %"class.std::vector.3", ptr %2, i64 %.pre283
  %_M_finish.i.i174 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i173, i64 %0, i32 1
  %3 = load ptr, ptr %_M_finish.i.i174, align 8, !tbaa !4
  ret ptr %3
}

define ptr @"44"(ptr %local_bins, ptr %arrayidx277) {
bb:
  %0 = load i64, ptr %arrayidx277, align 8, !tbaa !0
  %1 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %add.ptr.i = getelementptr inbounds %"class.std::vector.3", ptr %1, i64 %0
  %2 = load ptr, ptr %add.ptr.i, align 8, !tbaa !4
  ret ptr %2
}

define i32 @"45"(ptr %end_size_.i, ptr %offsets, i64 %0, ptr %length.i149) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !10
  %sub.ptr.rhs.cast.i.i153 = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !59
  %sub.ptr.lhs.cast.i.i152 = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i154 = sub i64 %sub.ptr.lhs.cast.i.i152, %sub.ptr.rhs.cast.i.i153
  %3 = lshr exact i64 %sub.ptr.sub.i.i154, %0
  %conv.i155 = trunc i64 %3 to i32
  store i32 %conv.i155, ptr %length.i149, align 4, !tbaa !6
  ret i32 %conv.i155
}

define ptr @"46"(ptr %new_range.i.i, ptr %el, i64 %sub.ptr.rhs.cast, i64 %0, ptr %end_size_.i) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !41
  %sub.ptr.lhs.cast = ptrtoint ptr %1 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %0
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !48
  ret ptr %add.ptr.i
}

define ptr @"48"(ptr %local_bins, ptr %arrayidx.i36, ptr %__begin1.064, i64 %0, i32 %delta, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %4 = load i32, ptr %arrayidx.i36, align 4, !tbaa !6
  %5 = load i64, ptr %__begin1.064, align 4
  %wn.sroa.8.0.extract.shift = lshr i64 %5, %0
  %wn.sroa.8.0.extract.trunc = trunc i64 %wn.sroa.8.0.extract.shift to i32
  %add = add nsw i32 %4, %wn.sroa.8.0.extract.trunc
  %div = sdiv i32 %add, %delta
  %conv10 = sext i32 %div to i64
  %add.ptr.i43 = getelementptr inbounds %"class.std::vector.3", ptr %3, i64 %conv10
  %_M_finish.i44 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i43, i64 %1, i32 1
  %6 = load ptr, ptr %_M_finish.i44, align 8, !tbaa !4
  ret ptr %6
}

define i32 @"49"(ptr %degrees, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul12 = shl i64 %1, %0
  %2 = load ptr, ptr %degrees, align 8, !tbaa !12
  %arrayidx.i31 = getelementptr inbounds i32, ptr %2, i64 %mul12
  %3 = load i32, ptr %arrayidx.i31, align 4, !tbaa !6
  ret i32 %3
}

define i64 @"50"(i64 %__value.coerce0, ptr %__first, ptr %add.ptr, ptr %add.ptr2, i64 %sub1, i64 %mul, i64 %0) {
bb:
  %1 = load i32, ptr %add.ptr2, align 4, !tbaa !60
  %2 = load i32, ptr %add.ptr, align 4, !tbaa !60
  %cmp6.i.i = icmp slt i32 %2, %1
  %spec.select = select i1 %cmp6.i.i, i64 %sub1, i64 %mul
  %add10 = shl i64 %spec.select, %0
  %sub12 = or i64 %add10, %0
  %add.ptr5.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %sub12
  store i64 %__value.coerce0, ptr %add.ptr5.i, align 4, !tbaa.struct !49
  ret i64 %__value.coerce0
}

define <2 x i64> @"51"(ptr %0, <2 x i64> %1, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %udist_, i64 %7, i64 %index15) {
bb:
  %8 = load ptr, ptr %udist_, align 8, !tbaa !56
  %9 = getelementptr inbounds [312 x i64], ptr %8, i64 %7, i64 %index15
  %wide.load19 = load <2 x i64>, ptr %4, align 8, !tbaa !0
  %wide.load18 = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %10 = and <2 x i64> %wide.load18, %1
  %11 = shufflevector <2 x i64> %wide.load18, <2 x i64> %wide.load18, <2 x i32> <i32 1, i32 2>
  %12 = and <2 x i64> %11, %2
  %13 = or <2 x i64> %10, %12
  %14 = lshr exact <2 x i64> %13, %3
  %15 = xor <2 x i64> %14, %wide.load19
  %16 = and <2 x i64> %wide.load18, %3
  %17 = icmp eq <2 x i64> %16, %5
  %18 = select <2 x i1> %17, <2 x i64> %5, <2 x i64> %6
  %19 = xor <2 x i64> %15, %18
  store <2 x i64> %19, ptr %9, align 8, !tbaa !0
  ret <2 x i64> %19
}

define i64 @"52"(ptr %new_range.i.i, i64 %0) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %incdec.ptr.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i = load i64, ptr %incdec.ptr.i.i.i.i, align 4, !tbaa.struct !49
  ret i64 %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i
}

define ptr @"53"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !41
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %2 = load ptr, ptr %el, align 8, !tbaa !41
  %sub.ptr.rhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %1
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !62
  ret ptr %add.ptr6.i.i
}

define ptr @"54"(ptr %new_range.i.i476, ptr %new_range.i.i, i64 %0, ptr %el, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i495 = load ptr, ptr %new_range.i.i476, align 8, !tbaa !4
  %.pre752 = load ptr, ptr %el, align 8, !tbaa !41
  %.pre776 = ptrtoint ptr %.pre752 to i64
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre776
  %sub.ptr.div14 = sdiv exact i64 %sub.ptr.sub13, %1
  %add.ptr6.i.i497 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i495, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i497, ptr %end_capacity_.i.i.i, align 8, !tbaa !62
  ret ptr %add.ptr6.i.i497
}

define i8 @"55"(ptr %arrayidx.i17.i, ptr %agg.tmp11, ptr %delta_, i32 %0, i64 %idxprom1.i.i) {
bb:
  %1 = load i8, ptr %arrayidx.i17.i, align 1, !tbaa !26, !noalias !27
  %2 = load ptr, ptr %agg.tmp11, align 8, !tbaa !30, !alias.scope !27
  %3 = load i32, ptr %delta_, align 4, !tbaa !33
  %__val.lobit.i = lshr i32 %3, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %arrayidx.i.i = getelementptr inbounds i8, ptr %2, i64 %conv5.i
  %arrayidx2.i.i = getelementptr inbounds i8, ptr %arrayidx.i.i, i64 %idxprom1.i.i
  store i8 %1, ptr %arrayidx2.i.i, align 1, !tbaa !26
  ret i8 %1
}

define i32 @"56"(ptr %add.ptr.i.i.i, ptr %mq, ptr %_M_finish.i.i.i, i64 %0, i64 %sub.ptr.rhs.cast.i.i.i, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %_M_finish.i.i.i, align 8, !tbaa !63
  %incdec.ptr.i.i.i = getelementptr inbounds %"struct.std::pair", ptr %3, i64 %0
  %sub.ptr.lhs.cast.i.i.i = ptrtoint ptr %incdec.ptr.i.i.i to i64
  %sub.ptr.sub.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i, %sub.ptr.rhs.cast.i.i.i
  %sub.ptr.div.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i, %1
  %sub.i.i = add nsw i64 %sub.ptr.div.i.i.i, %2
  %.pre.i = load ptr, ptr %mq, align 8, !tbaa !4
  %add.ptr.i27.i.i.i = getelementptr inbounds %"struct.std::pair", ptr %.pre.i, i64 %sub.i.i
  %__value.sroa.0.0.copyload.i.i = load i64, ptr %add.ptr.i.i.i, align 4
  %__value.sroa.0.0.extract.trunc.i.i.i = trunc i64 %__value.sroa.0.0.copyload.i.i to i32
  store i32 %__value.sroa.0.0.extract.trunc.i.i.i, ptr %add.ptr.i27.i.i.i, align 4, !tbaa !65
  ret i32 %__value.sroa.0.0.extract.trunc.i.i.i
}

define i64 @"57"(ptr %arrayidx.i, i64 %0, ptr %offsets, ptr %__begin0.0683) {
bb:
  %1 = load i64, ptr %arrayidx.i, align 8, !tbaa !0
  %inc = add nsw i64 %1, %0
  %e.sroa.0.0.copyload = load i32, ptr %__begin0.0683, align 4, !tbaa.struct !49
  %conv = sext i32 %e.sroa.0.0.copyload to i64
  %2 = load ptr, ptr %offsets, align 8, !tbaa !10
  %arrayidx.i2 = getelementptr inbounds i64, ptr %2, i64 %conv
  store i64 %inc, ptr %arrayidx.i, align 8, !tbaa !0
  ret i64 %inc
}

define i32 @"58"(ptr %second.i.phi.trans.insert.i.i.i, ptr %mq, ptr %_M_finish.i.i.i, i64 %0, i64 %sub.ptr.rhs.cast.i.i.i, i64 %1, i64 %2, i32 %3) {
bb:
  %.pre.i = load ptr, ptr %mq, align 8, !tbaa !4
  %4 = load ptr, ptr %_M_finish.i.i.i, align 8, !tbaa !63
  %incdec.ptr.i.i.i = getelementptr inbounds %"struct.std::pair", ptr %4, i64 %0
  %sub.ptr.lhs.cast.i.i.i = ptrtoint ptr %incdec.ptr.i.i.i to i64
  %sub.ptr.sub.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i, %sub.ptr.rhs.cast.i.i.i
  %sub.ptr.div.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i, %1
  %sub.i.i = add nsw i64 %sub.ptr.div.i.i.i, %2
  %second3.i.i.i.i = getelementptr inbounds %"struct.std::pair", ptr %.pre.i, i64 %sub.i.i, i32 1
  %.pre.i.i.i = load i32, ptr %second.i.phi.trans.insert.i.i.i, align 4, !tbaa !6
  store i32 %.pre.i.i.i, ptr %second3.i.i.i.i, align 4, !tbaa !44
  ret i32 %.pre.i.i.i
}

define ptr @"59"(ptr %call.i, ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, i64 %2, ptr %end_size_.i40) {
bb:
  %3 = load ptr, ptr %degrees, align 8, !tbaa !12
  %sub.ptr.rhs.cast.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %end_size_.i, align 8, !tbaa !14
  %sub.ptr.lhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %sub = add nsw i64 %sub.ptr.div.i, %1
  %div38 = lshr i64 %sub, %2
  %add.ptr.i = getelementptr inbounds i64, ptr %call.i, i64 %div38
  store ptr %add.ptr.i, ptr %end_size_.i40, align 8, !tbaa !59
  ret ptr %add.ptr.i
}

define i64 @"60"(ptr %max_seen.i, i32 %0, ptr %num_nodes_) {
bb:
  %1 = load i32, ptr %max_seen.i, align 4, !tbaa !6
  %add = add nsw i32 %1, %0
  %conv = sext i32 %add to i64
  store i64 %conv, ptr %num_nodes_, align 8, !tbaa !50
  ret i64 %conv
}

define i64 @"61"(ptr %new_range.i.i, i64 %0) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !49
  ret i64 %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i
}

define i32 @"62"(ptr %invs_needed, ptr %num_nodes_.i, i32 %0) {
bb:
  %.pre760 = load ptr, ptr %invs_needed, align 8, !tbaa !12
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !50
  %2 = trunc i64 %1 to i32
  %n197.0700 = add i32 %2, %0
  %3 = zext i32 %n197.0700 to i64
  %arrayidx.i560 = getelementptr inbounds i32, ptr %.pre760, i64 %3
  %4 = load i32, ptr %arrayidx.i560, align 4, !tbaa !6
  ret i32 %4
}

define i64 @"63"(ptr %0, i64 %1, ptr %arrayidx42.i.i, i64 %2, i64 %3, ptr %arrayidx49.i.i, i64 %4, i64 %5, ptr %udist_, i64 %6) {
bb:
  %7 = load ptr, ptr %udist_, align 8, !tbaa !56
  %arrayidx42.i.i2 = getelementptr inbounds [312 x i64], ptr %0, i64 %4, i64 311
  %8 = load i64, ptr %0, align 8, !tbaa !0
  %and46.i.i = and i64 %8, %1
  %9 = load i64, ptr %arrayidx42.i.i, align 8, !tbaa !0
  %and43.i.i = and i64 %9, %2
  %or47.i.i = or i64 %and46.i.i, %and43.i.i
  %shr50.i.i = lshr exact i64 %or47.i.i, %3
  %10 = load i64, ptr %arrayidx49.i.i, align 8, !tbaa !0
  %xor51.i.i = xor i64 %shr50.i.i, %10
  %and52.i.i = and i64 %8, %3
  %tobool53.not.i.i = icmp eq i64 %and52.i.i, %4
  %cond54.i.i = select i1 %tobool53.not.i.i, i64 %4, i64 %5
  %xor55.i.i = xor i64 %xor51.i.i, %cond54.i.i
  store i64 %xor55.i.i, ptr %arrayidx42.i.i, align 8, !tbaa !0
  ret i64 %xor55.i.i
}

define i32 @"64"(ptr %v, i64 %0, ptr %end_size_.i.i, i64 %1) {
bb:
  %agg.tmp73.sroa.0.0.copyload = load i64, ptr %v, align 8, !tbaa.struct !43
  %2 = lshr i64 %agg.tmp73.sroa.0.0.copyload, %0
  %3 = trunc i64 %2 to i32
  %.pre.pre.i = load ptr, ptr %end_size_.i.i, align 8, !tbaa !48
  %val.sroa.2.0..sroa_idx.i = getelementptr inbounds i8, ptr %.pre.pre.i, i64 %1
  store i32 %3, ptr %val.sroa.2.0..sroa_idx.i, align 4, !tbaa.struct !52
  ret i32 %3
}

define i32 @"65"(ptr %invs_needed, ptr %num_nodes_.i, i32 %0) {
bb:
  %.pre761 = load ptr, ptr %invs_needed, align 8, !tbaa !12
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !50
  %2 = trunc i64 %1 to i32
  %n197.0700 = add i32 %2, %0
  %3 = zext i32 %n197.0700 to i64
  %arrayidx.i560 = getelementptr inbounds i32, ptr %.pre761, i64 %3
  %4 = load i32, ptr %arrayidx.i560, align 4, !tbaa !6
  ret i32 %4
}

define ptr @"66"(ptr %new_range.i.i476, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i495 = load ptr, ptr %new_range.i.i476, align 8, !tbaa !4
  %.pre752 = load ptr, ptr %el, align 8, !tbaa !41
  %.pre776 = ptrtoint ptr %.pre752 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !41
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre776
  %sub.ptr.div14 = sdiv exact i64 %sub.ptr.sub13, %1
  %add.ptr6.i.i497 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i495, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i497, ptr %end_capacity_.i.i.i, align 8, !tbaa !62
  ret ptr %add.ptr6.i.i497
}

define i64 @"67"(ptr %arrayidx225.prol, ptr %neighs, ptr %arrayidx.i558, i64 %0) {
bb:
  %1 = load ptr, ptr %neighs, align 8, !tbaa !4
  %2 = load i64, ptr %arrayidx.i558, align 8, !tbaa !0
  %sub196 = add nsw i64 %2, %0
  %arrayidx226.prol = getelementptr inbounds %struct.NodeWeight, ptr %1, i64 %sub196
  %3 = load i64, ptr %arrayidx225.prol, align 4
  store i64 %3, ptr %arrayidx226.prol, align 4
  ret i64 %3
}

define i64 @"68"(ptr %arrayidx.i58.epil, i64 %total.076.epil, ptr %arrayidx.i57.epil) {
bb:
  %0 = load i64, ptr %arrayidx.i58.epil, align 8, !tbaa !0
  %add7.epil = add nsw i64 %0, %total.076.epil
  store i64 %add7.epil, ptr %arrayidx.i57.epil, align 8, !tbaa !0
  ret i64 %add7.epil
}

define ptr @"69"(ptr %local_bins, ptr %arrayidx277) {
bb:
  %0 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %.pre283 = load i64, ptr %arrayidx277, align 8, !tbaa !0
  %add.ptr.i308 = getelementptr inbounds %"class.std::vector.3", ptr %0, i64 %.pre283
  %1 = load ptr, ptr %add.ptr.i308, align 8, !tbaa !4
  ret ptr %1
}

define i64 @"70"(ptr %neighs, ptr %arrayidx.i561, i64 %0, i64 %total_missing_inv.1702, ptr %arrayidx.i560) {
bb:
  %1 = load ptr, ptr %neighs, align 8, !tbaa !4
  %2 = load i32, ptr %arrayidx.i560, align 4, !tbaa !6
  %conv211 = sext i32 %2 to i64
  %sub235 = sub nsw i64 %total_missing_inv.1702, %conv211
  %3 = load i64, ptr %arrayidx.i561, align 8, !tbaa !0
  %i213.0.1 = add nsw i64 %3, %0
  %sub224.1 = sub nsw i64 %i213.0.1, %sub235
  %arrayidx225.1 = getelementptr inbounds %struct.NodeWeight, ptr %1, i64 %sub224.1
  %4 = load i64, ptr %arrayidx225.1, align 4
  ret i64 %4
}

define i64 @"71"(ptr %__begin3.0183, i64 %0, ptr %1, ptr %_M_finish.i.i.i) {
bb:
  %2 = load ptr, ptr %_M_finish.i.i.i, align 8, !tbaa !4
  %3 = load i64, ptr %__begin3.0183, align 4
  %wn.sroa.7.0.extract.shift = lshr i64 %3, %0
  %wn.sroa.7.0.extract.trunc = trunc i64 %wn.sroa.7.0.extract.shift to i32
  %4 = load i32, ptr %1, align 4, !tbaa !65
  %add = add nsw i32 %4, %wn.sroa.7.0.extract.trunc
  %retval.sroa.0.0.insert.ext.i136 = zext i32 %add to i64
  %sext = shl i64 %3, %0
  %retval.sroa.0.0.insert.insert.i137 = or i64 %sext, %retval.sroa.0.0.insert.ext.i136
  store i64 %retval.sroa.0.0.insert.insert.i137, ptr %2, align 4
  ret i64 %retval.sroa.0.0.insert.insert.i137
}

define i64 @"72"(i32 %shl19, ptr %arrayidx.i62, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i64, i64 %4, i64 %5, i64 %xor4.i, i64 %6, i64 %xor7.i, i32 %7, i32 %8, i32 %9, i32 %conv, i64 %10, ptr %el, ptr %.omp.lb, i64 %11) {
bb:
  %12 = load i64, ptr %arrayidx.i62, align 8, !tbaa !0
  %shr.i63 = lshr i64 %12, %0
  %and.i = and i64 %shr.i63, %1
  %xor.i642 = xor i64 %and.i, %12
  %shl.i = shl i64 %xor.i64, %2
  %and3.i = and i64 %shl.i, %3
  %xor4.i4 = xor i64 %and3.i, %xor.i64
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
  %agg.tmp.sroa.0.0.insert.ext = zext i32 %dst.1 to i64
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.0.0.insert.ext, %10
  %13 = load ptr, ptr %el, align 8, !tbaa !41
  %14 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul = shl i64 %14, %6
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %13, i64 %mul
  %ref.tmp30.sroa.4.0.arrayidx.i.sroa_idx = getelementptr inbounds i8, ptr %arrayidx.i, i64 %11
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %ref.tmp30.sroa.4.0.arrayidx.i.sroa_idx, align 4, !tbaa.struct !43
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"73"(ptr %.omp.lb, ptr %permutation, i64 %indvars.iv) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !6
  %1 = sext i32 %0 to i64
  %2 = trunc i64 %1 to i32
  %3 = load ptr, ptr %permutation, align 8, !tbaa !12
  %arrayidx.i = getelementptr inbounds i32, ptr %3, i64 %indvars.iv
  store i32 %2, ptr %arrayidx.i, align 4, !tbaa !6
  ret i32 %2
}

define ptr @"74"(ptr %this, i64 %0, i32 %1, ptr %__first.addr.07.i.i.i.i) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !4
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %2, i64 %0, i32 2
  store ptr %3, ptr %__first.addr.07.i.i.i.i, align 8, !tbaa !30, !alias.scope !66, !noalias !69
  ret ptr %3
}

define i64 @"75"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57) {
bb:
  %0 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !0
  %1 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !0
  %2 = load i64, ptr %arrayidx.i58, align 8, !tbaa !0
  %add7 = add nsw i64 %2, %total.076
  %add7.1 = add nsw i64 %1, %add7
  %add7.2 = add nsw i64 %0, %add7.1
  %3 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !0
  %add7.3 = add nsw i64 %3, %add7.2
  store i64 %add7.3, ptr %arrayidx.i57, align 8, !tbaa !0
  ret i64 %add7.3
}

define i64 @"76"(ptr %add.ptr.i.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, ptr %w.i.i.i.i.i.i, ptr %w3.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0) {
bb:
  %1 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !8
  %2 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !8
  %cmp7.i.i.i.i.i.i = icmp slt i32 %2, %1
  %3 = load i32, ptr %w.i.i.i.i.i.i, align 4
  %4 = load i32, ptr %w3.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i = icmp slt i32 %3, %4
  %cmp.i.i.i.i.i.i = icmp eq i32 %2, %1
  %cond.i.i.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i1 %cmp4.i.i.i.i.i.i, i1 %cmp7.i.i.i.i.i.i
  %spec.select.i.i.i.i = select i1 %cond.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %add.ptr2.i.i.i.i.i = getelementptr inbounds %struct.NodeWeight, ptr %__first, i64 %sub12.i.i.i.i
  %5 = load i64, ptr %add.ptr.i.i.i.i.i, align 4
  store i64 %5, ptr %add.ptr2.i.i.i.i.i, align 4
  ret i64 %5
}

define i64 @"77"(i64 %0, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %this, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %1
  %_M_string_length.i24.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i, i32 1
  store i64 %0, ptr %_M_string_length.i24.i.i.i, align 8, !tbaa !53
  ret i64 %0
}

define i32 @"78"(ptr %frontier, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %frontier, align 8, !tbaa !12, !llvm.access.group !71
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %arrayidx.i, align 4, !tbaa !6, !llvm.access.group !71
  ret i32 %2
}

define ptr @"79"(ptr %cond.i31.i.i.i.i, ptr %_M_finish.i.i.i, i64 %0, ptr %mq, i64 %1, i64 %2, i64 %3) {
bb:
  %4 = load ptr, ptr %_M_finish.i.i.i, align 8, !tbaa !4
  %5 = ptrtoint ptr %4 to i64
  %6 = add i64 %5, %0
  %7 = load ptr, ptr %mq, align 8, !tbaa !4
  %8 = ptrtoint ptr %7 to i64
  %9 = sub i64 %6, %8
  %10 = lshr i64 %9, %1
  %11 = add nuw nsw i64 %10, %2
  %n.vec = and i64 %11, %3
  %12 = shl i64 %n.vec, %1
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i.i, i64 %12
  %incdec.ptr.i.i.i.i = getelementptr %"struct.std::pair", ptr %ind.end, i64 %2
  store ptr %incdec.ptr.i.i.i.i, ptr %_M_finish.i.i.i, align 8, !tbaa !63
  ret ptr %incdec.ptr.i.i.i.i
}

define ptr @"80"(ptr %local_bins, ptr %arrayidx277, i64 %0, i32 %1) {
bb:
  %.pre283 = load i64, ptr %arrayidx277, align 8, !tbaa !0
  %2 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %add.ptr.i173 = getelementptr inbounds %"class.std::vector.3", ptr %2, i64 %.pre283
  %_M_finish.i.i174 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i173, i64 %0, i32 1
  %3 = load ptr, ptr %_M_finish.i.i174, align 8, !tbaa !4
  ret ptr %3
}

define i32 @"81"(ptr %dist, ptr %__begin1.064, i64 %0) {
bb:
  %1 = load i64, ptr %__begin1.064, align 4
  %sext = shl i64 %1, %0
  %conv = ashr exact i64 %sext, %0
  %2 = load ptr, ptr %dist, align 8, !tbaa !12
  %old_dist.0.in59 = getelementptr inbounds i32, ptr %2, i64 %conv
  %old_dist.060 = load i32, ptr %old_dist.0.in59, align 4, !tbaa !6
  ret i32 %old_dist.060
}

define <2 x i64> @"82"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %rng, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
bb:
  %wide.load92 = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %10 = and <2 x i64> %wide.load92, %5
  %11 = icmp eq <2 x i64> %10, %7
  %12 = select <2 x i1> %11, <2 x i64> %7, <2 x i64> %8
  %13 = load i64, ptr %rng, align 8, !tbaa !0
  %vector.recur.init90 = insertelement <2 x i64> %2, i64 %13, i64 %3
  %14 = shufflevector <2 x i64> %vector.recur.init90, <2 x i64> %wide.load92, <2 x i32> <i32 1, i32 2>
  %15 = and <2 x i64> %14, %4
  %16 = and <2 x i64> %wide.load92, %1
  %17 = or <2 x i64> %16, %15
  %18 = lshr exact <2 x i64> %17, %5
  %wide.load93 = load <2 x i64>, ptr %6, align 8, !tbaa !0
  %19 = xor <2 x i64> %18, %wide.load93
  %20 = xor <2 x i64> %19, %12
  store <2 x i64> %20, ptr %9, align 8, !tbaa !0
  ret <2 x i64> %20
}

define i32 @"83"(ptr %arrayidx.i551, i32 %0, ptr %invs_needed, ptr %arrayidx120, i64 %1) {
bb:
  %2 = load i32, ptr %arrayidx.i551, align 4, !tbaa !6
  %inc143 = add nsw i32 %2, %0
  %3 = load i64, ptr %arrayidx120, align 4
  %sext670 = shl i64 %3, %1
  %conv122 = ashr exact i64 %sext670, %1
  %4 = load ptr, ptr %invs_needed, align 8
  %arrayidx.i5512 = getelementptr inbounds i32, ptr %4, i64 %conv122
  store i32 %inc143, ptr %arrayidx.i551, align 4, !tbaa !6
  ret i32 %inc143
}

define i64 @"84"(ptr %arrayidx225.1, ptr %neighs, i64 %tail_index.1.lcssa, ptr %arrayidx.i560, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx225.1, align 4
  %2 = load i32, ptr %arrayidx.i560, align 4, !tbaa !6
  %conv211 = sext i32 %2 to i64
  %sub239 = sub nsw i64 %tail_index.1.lcssa, %conv211
  %dec227 = add nsw i64 %sub239, %0
  %3 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx226.1 = getelementptr inbounds %struct.NodeWeight, ptr %3, i64 %dec227
  store i64 %1, ptr %arrayidx226.1, align 4
  ret i64 %1
}

define ptr @"85"(ptr %local_bins, ptr %arrayidx277, i64 %0, i32 %1) {
bb:
  %2 = load i64, ptr %arrayidx277, align 8, !tbaa !0
  %3 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %add.ptr.i = getelementptr inbounds %"class.std::vector.3", ptr %3, i64 %2
  %_M_finish.i.i = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i, i64 %0, i32 1
  %4 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !4
  ret ptr %4
}

define i64 @"86"(ptr %neighs, ptr %arrayidx.i561, i64 %total_missing_inv.1702, ptr %arrayidx.i560, i64 %0) {
bb:
  %1 = load i32, ptr %arrayidx.i560, align 4, !tbaa !6
  %conv211 = sext i32 %1 to i64
  %sub235 = sub nsw i64 %total_missing_inv.1702, %conv211
  %2 = xor i64 %sub235, %0
  %3 = load i64, ptr %arrayidx.i561, align 8, !tbaa !0
  %sub224 = add i64 %3, %2
  %4 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx225 = getelementptr inbounds %struct.NodeWeight, ptr %4, i64 %sub224
  %5 = load i64, ptr %arrayidx225, align 4
  ret i64 %5
}

define i32 @"87"(i32 %0, ptr %new_range.i.i161, ptr %end_size_.i.i, ptr %agg.result, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !48
  %sub.ptr.lhs.cast.i10.i.i181 = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %agg.result, align 8, !tbaa !41
  %sub.ptr.rhs.cast.i11.i.i182 = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i12.i.i183 = sub i64 %sub.ptr.lhs.cast.i10.i.i181, %sub.ptr.rhs.cast.i11.i.i182
  %sub.ptr.div.i13.i.i184 = sdiv exact i64 %sub.ptr.sub.i12.i.i183, %1
  %5 = load ptr, ptr %new_range.i.i161, align 8, !tbaa !4
  %add.ptr.i.i185 = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %sub.ptr.div.i13.i.i184
  %val.sroa.2.0..sroa_idx.i172 = getelementptr inbounds i8, ptr %add.ptr.i.i185, i64 %2
  store i32 %0, ptr %val.sroa.2.0..sroa_idx.i172, align 4, !tbaa.struct !52
  ret i32 %0
}

define ptr @"88"(ptr %el, ptr %0, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre752 = load ptr, ptr %el, align 8, !tbaa !41
  %.pre776 = ptrtoint ptr %.pre752 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !41
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre776
  %sub.ptr.div14 = sdiv exact i64 %sub.ptr.sub13, %2
  %add.ptr.i483 = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i483, ptr %end_size_.i, align 8, !tbaa !48
  ret ptr %add.ptr.i483
}

define ptr @"89"(ptr %add.ptr.i312, ptr %local_bins, ptr %arrayidx4, i64 %0, i32 %1) {
bb:
  %2 = load i64, ptr %arrayidx4, align 8, !tbaa !0
  %3 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %add.ptr.i308 = getelementptr inbounds %"class.std::vector.3", ptr %3, i64 %2
  %_M_finish.i.i309 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i308, i64 %0, i32 1
  %.pre285 = load ptr, ptr %add.ptr.i312, align 8, !tbaa !46
  store ptr %.pre285, ptr %_M_finish.i.i309, align 8, !tbaa !58
  ret ptr %.pre285
}

define <4 x i32> @"90"(<4 x i32> %0, ptr %init_val, i64 %1, ptr %this, ptr %.omp.lb, i64 %index) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !12
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %offset.idx = add i64 %3, %index
  %4 = getelementptr inbounds i32, ptr %2, i64 %offset.idx
  %5 = load i32, ptr %init_val, align 4, !tbaa !6, !alias.scope !17
  %broadcast.splatinsert21 = insertelement <4 x i32> %0, i32 %5, i64 %1
  %broadcast.splat22 = shufflevector <4 x i32> %broadcast.splatinsert21, <4 x i32> %0, <4 x i32> zeroinitializer
  store <4 x i32> %broadcast.splat22, ptr %4, align 4, !tbaa !6, !alias.scope !20, !noalias !17
  ret <4 x i32> %broadcast.splat22
}

define i32 @"91"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i32, ptr %init_val, align 4, !tbaa !6
  %4 = load ptr, ptr %this, align 8, !tbaa !12
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %6 = sub i64 %0, %5
  %n.vec = and i64 %6, %1
  %ind.end = add i64 %5, %n.vec
  %add7 = add i64 %ind.end, %2
  %add.ptr.1 = getelementptr inbounds i32, ptr %4, i64 %add7
  store i32 %3, ptr %add.ptr.1, align 4, !tbaa !6
  ret i32 %3
}

define i64 @"92"(ptr %new_range.i.i, i64 %0, i64 %1) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr13.i.i.i.i, i64 %1
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.030.i.i, align 4, !tbaa.struct !49
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define ptr @"93"(ptr %neighs, ptr %arrayidx.i.prol, ptr %index, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !6
  %1 = sext i32 %0 to i64
  %2 = load ptr, ptr %index, align 8, !tbaa !4
  %arrayidx.prol = getelementptr inbounds ptr, ptr %2, i64 %1
  %3 = load ptr, ptr %neighs, align 8, !tbaa !4
  %4 = load i64, ptr %arrayidx.i.prol, align 8, !tbaa !0
  %add.ptr.prol = getelementptr inbounds %struct.NodeWeight, ptr %3, i64 %4
  store ptr %add.ptr.prol, ptr %arrayidx.prol, align 8, !tbaa !4
  ret ptr %add.ptr.prol
}

define <2 x i64> @"94"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %3, i64 %4, <2 x i64> %5, <2 x i64> %6, ptr %7, <2 x i64> %8, <2 x i64> %9, ptr %udist_, i64 %10, i64 %index15) {
bb:
  %11 = load ptr, ptr %udist_, align 8, !tbaa !56
  %12 = getelementptr inbounds [312 x i64], ptr %3, i64 %10, i64 %index15
  %wide.load19 = load <2 x i64>, ptr %7, align 8, !tbaa !0
  %wide.load18 = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %13 = and <2 x i64> %wide.load18, %1
  %.pre.i.i = load i64, ptr %3, align 8, !tbaa !0
  %vector.recur.init16 = insertelement <2 x i64> %2, i64 %.pre.i.i, i64 %4
  %14 = shufflevector <2 x i64> %vector.recur.init16, <2 x i64> %wide.load18, <2 x i32> <i32 1, i32 2>
  %15 = and <2 x i64> %14, %5
  %16 = or <2 x i64> %13, %15
  %17 = lshr exact <2 x i64> %16, %6
  %18 = xor <2 x i64> %17, %wide.load19
  %19 = and <2 x i64> %wide.load18, %6
  %20 = icmp eq <2 x i64> %19, %8
  %21 = select <2 x i1> %20, <2 x i64> %8, <2 x i64> %9
  %22 = xor <2 x i64> %18, %21
  store <2 x i64> %22, ptr %12, align 8, !tbaa !0
  ret <2 x i64> %22
}

define i64 @"95"(ptr %arrayidx.i511.1, ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !50
  %n.mod.vf = and i64 %3, %0
  %indvars.iv.next = add nsw i64 %n.mod.vf, %1
  %arrayidx.i512.1 = getelementptr inbounds i64, ptr %2, i64 %indvars.iv.next
  %4 = load i64, ptr %arrayidx.i511.1, align 8, !tbaa !0
  store i64 %4, ptr %arrayidx.i512.1, align 8, !tbaa !0
  ret i64 %4
}

define ptr @"96"(ptr %local_bins, ptr %shared_indexes) {
bb:
  %0 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %1 = load i64, ptr %shared_indexes, align 8, !tbaa !0
  %add.ptr.i308 = getelementptr inbounds %"class.std::vector.3", ptr %0, i64 %1
  %2 = load ptr, ptr %add.ptr.i308, align 8, !tbaa !4
  ret ptr %2
}

define ptr @"97"(ptr %neighs, ptr %arrayidx.i.1, ptr %index, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %index, align 8, !tbaa !4
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !6
  %3 = sext i32 %2 to i64
  %indvars.iv.next = add nsw i64 %3, %0
  %arrayidx.1 = getelementptr inbounds ptr, ptr %1, i64 %indvars.iv.next
  %4 = load ptr, ptr %neighs, align 8, !tbaa !4
  %5 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !0
  %add.ptr.1 = getelementptr inbounds %struct.NodeWeight, ptr %4, i64 %5
  store ptr %add.ptr.1, ptr %arrayidx.1, align 8, !tbaa !4
  ret ptr %add.ptr.1
}

define i64 @"98"(ptr %neighs, ptr %arrayidx.i561, i64 %0, i64 %total_missing_inv.1702, ptr %arrayidx.i560) {
bb:
  %1 = load i32, ptr %arrayidx.i560, align 4, !tbaa !6
  %conv211 = sext i32 %1 to i64
  %sub235 = sub nsw i64 %total_missing_inv.1702, %conv211
  %2 = load i64, ptr %arrayidx.i561, align 8, !tbaa !0
  %i213.0.prol = add nsw i64 %2, %0
  %sub224.prol = sub nsw i64 %i213.0.prol, %sub235
  %3 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx225.prol = getelementptr inbounds %struct.NodeWeight, ptr %3, i64 %sub224.prol
  %4 = load i64, ptr %arrayidx225.prol, align 4
  ret i64 %4
}

define i64 @"99"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !54
  %inc.i72 = add nuw nsw i64 %1, %0
  %inc.i208 = add nuw nsw i64 %inc.i72, %0
  %inc.i140 = add nuw nsw i64 %inc.i208, %0
  store i64 %inc.i140, ptr %_M_p.i.i.i, align 8, !tbaa !54
  ret i64 %inc.i140
}

define ptr @"100"(ptr %add.ptr.i312, ptr %local_bins, ptr %arrayidx277, i64 %0, i32 %1) {
bb:
  %2 = load i64, ptr %arrayidx277, align 8, !tbaa !0
  %3 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %add.ptr.i = getelementptr inbounds %"class.std::vector.3", ptr %3, i64 %2
  %_M_finish.i.i = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i, i64 %0, i32 1
  %.pre285 = load ptr, ptr %add.ptr.i312, align 8, !tbaa !46
  store ptr %.pre285, ptr %_M_finish.i.i, align 8, !tbaa !58
  ret ptr %.pre285
}

define i32 @"101"(ptr %dist, ptr %end_size_.i, i64 %0, i64 %1, i64 %2, i64 %3) {
bb:
  %4 = load ptr, ptr %end_size_.i, align 8, !tbaa !14
  %5 = ptrtoint ptr %4 to i64
  %6 = add i64 %5, %0
  %7 = load ptr, ptr %dist, align 8, !tbaa !12
  %8 = ptrtoint ptr %7 to i64
  %9 = sub i64 %6, %8
  %10 = lshr i64 %9, %1
  %11 = add nuw nsw i64 %10, %2
  %n.vec = and i64 %11, %3
  %12 = shl i64 %n.vec, %1
  %ind.end = getelementptr i8, ptr %7, i64 %12
  %__first.addr.0.val.i.i = load i32, ptr %ind.end, align 4, !tbaa !6
  ret i32 %__first.addr.0.val.i.i
}

define i64 @"102"(ptr %inoffsets, ptr %it.0718) {
bb:
  %0 = load i32, ptr %it.0718, align 4, !tbaa !8
  %conv77 = sext i32 %0 to i64
  %1 = load ptr, ptr %inoffsets, align 8, !tbaa !10
  %arrayidx.i535 = getelementptr inbounds i64, ptr %1, i64 %conv77
  %2 = load i64, ptr %arrayidx.i535, align 8, !tbaa !0
  ret i64 %2
}

define i64 @"103"(ptr %arrayidx.i58.epil, i64 %total.076.epil, ptr %call.i4145, ptr %num_blocks) {
bb:
  %0 = load i64, ptr %arrayidx.i58.epil, align 8, !tbaa !0
  %add7.epil = add nsw i64 %0, %total.076.epil
  %1 = load i64, ptr %num_blocks, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds i64, ptr %call.i4145, i64 %1
  store i64 %add7.epil, ptr %arrayidx.i, align 8, !tbaa !0
  ret i64 %add7.epil
}

define i32 @"104"(ptr %add.ptr.i.i.i10.i, ptr %mq, ptr %_M_finish.i.i.i, i64 %0, i64 %sub.ptr.rhs.cast.i.i.i, i64 %1, i64 %2) {
bb:
  %3 = load i32, ptr %add.ptr.i.i.i10.i, align 4, !tbaa !6
  %.pre.i = load ptr, ptr %mq, align 8, !tbaa !4
  %4 = load ptr, ptr %_M_finish.i.i.i, align 8, !tbaa !63
  %incdec.ptr.i.i.i = getelementptr inbounds %"struct.std::pair", ptr %4, i64 %0
  %sub.ptr.lhs.cast.i.i.i = ptrtoint ptr %incdec.ptr.i.i.i to i64
  %sub.ptr.sub.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i, %sub.ptr.rhs.cast.i.i.i
  %sub.ptr.div.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i, %1
  %sub.i.i = add nsw i64 %sub.ptr.div.i.i.i, %2
  %add.ptr.i26.i.i.i = getelementptr inbounds %"struct.std::pair", ptr %.pre.i, i64 %sub.i.i
  store i32 %3, ptr %add.ptr.i26.i.i.i, align 4, !tbaa !65
  ret i32 %3
}

define i64 @"105"(ptr %.omp.lb, i64 %0, i64 %1, ptr %rng) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add10 = add i64 %2, %0
  %rem.i.i.i = and i64 %add10, %1
  store i64 %rem.i.i.i, ptr %rng, align 8, !tbaa !0
  ret i64 %rem.i.i.i
}

define i32 @"106"(ptr %mq, ptr %cond.i31.i.i.i.i, ptr %_M_finish.i.i.i, i64 %0, i64 %1, i64 %2, i64 %3, i64 %sub.ptr.rhs.cast.i.i.i, i64 %4) {
bb:
  %5 = load ptr, ptr %_M_finish.i.i.i, align 8, !tbaa !4
  %6 = ptrtoint ptr %5 to i64
  %7 = add i64 %6, %0
  %8 = load ptr, ptr %mq, align 8, !tbaa !4
  %9 = ptrtoint ptr %8 to i64
  %10 = sub i64 %7, %9
  %11 = lshr i64 %10, %1
  %12 = add nuw nsw i64 %11, %2
  %n.vec = and i64 %12, %3
  %13 = shl i64 %n.vec, %1
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i.i, i64 %13
  %incdec.ptr.i.i.i.i = getelementptr %"struct.std::pair", ptr %ind.end, i64 %2
  %sub.ptr.lhs.cast.i.i.i = ptrtoint ptr %incdec.ptr.i.i.i.i to i64
  %sub.ptr.sub.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i, %sub.ptr.rhs.cast.i.i.i
  %sub.ptr.div.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i, %1
  %sub.i.i = add nsw i64 %sub.ptr.div.i.i.i, %4
  %__parent.040.in.i.i.i = add nsw i64 %sub.i.i, %4
  %__parent.040.i910.i.i = lshr i64 %__parent.040.in.i.i.i, %2
  %.pre.i = load ptr, ptr %mq, align 8, !tbaa !4
  %add.ptr.i.i.i10.i = getelementptr inbounds %"struct.std::pair", ptr %.pre.i, i64 %__parent.040.i910.i.i
  %14 = load i32, ptr %add.ptr.i.i.i10.i, align 4, !tbaa !6
  ret i32 %14
}

define ptr @"107"(ptr %local_bins, ptr %arrayidx4, i64 %0, i32 %1) {
bb:
  %2 = load i64, ptr %arrayidx4, align 8, !tbaa !0
  %3 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %add.ptr.i173 = getelementptr inbounds %"class.std::vector.3", ptr %3, i64 %2
  %_M_finish.i.i174 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i173, i64 %0, i32 1
  %4 = load ptr, ptr %_M_finish.i.i174, align 8, !tbaa !4
  ret ptr %4
}

define i32 @"108"(ptr %add.ptr.i.i.i, ptr %mq, ptr %cond.i31.i.i.i.i, ptr %_M_finish.i.i.i, i64 %0, i64 %1, i64 %2, i64 %3, i64 %sub.ptr.rhs.cast.i.i.i, i64 %4) {
bb:
  %5 = load ptr, ptr %_M_finish.i.i.i, align 8, !tbaa !4
  %6 = ptrtoint ptr %5 to i64
  %7 = add i64 %6, %0
  %8 = load ptr, ptr %mq, align 8, !tbaa !4
  %9 = ptrtoint ptr %8 to i64
  %10 = sub i64 %7, %9
  %11 = lshr i64 %10, %1
  %12 = add nuw nsw i64 %11, %2
  %n.vec = and i64 %12, %3
  %13 = shl i64 %n.vec, %1
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i.i, i64 %13
  %incdec.ptr.i.i.i.i = getelementptr %"struct.std::pair", ptr %ind.end, i64 %2
  %sub.ptr.lhs.cast.i.i.i = ptrtoint ptr %incdec.ptr.i.i.i.i to i64
  %sub.ptr.sub.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i, %sub.ptr.rhs.cast.i.i.i
  %sub.ptr.div.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i, %1
  %sub.i.i = add nsw i64 %sub.ptr.div.i.i.i, %4
  %.pre.i = load ptr, ptr %mq, align 8, !tbaa !4
  %add.ptr.i27.i.i.i = getelementptr inbounds %"struct.std::pair", ptr %.pre.i, i64 %sub.i.i
  %__value.sroa.0.0.copyload.i.i = load i64, ptr %add.ptr.i.i.i, align 4
  %__value.sroa.0.0.extract.trunc.i.i.i = trunc i64 %__value.sroa.0.0.copyload.i.i to i32
  store i32 %__value.sroa.0.0.extract.trunc.i.i.i, ptr %add.ptr.i27.i.i.i, align 4, !tbaa !65
  ret i32 %__value.sroa.0.0.extract.trunc.i.i.i
}

define ptr @"109"(ptr %cond.i65, ptr %_M_finish.i, ptr %this, i64 %0, i64 %__n) {
bb:
  %1 = load ptr, ptr %this, align 8, !tbaa !15
  %sub.ptr.rhs.cast.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %_M_finish.i, align 8, !tbaa !72
  %sub.ptr.lhs.cast.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = sdiv exact i64 %sub.ptr.sub.i, %0
  %add.ptr = getelementptr inbounds %"class.std::vector.3", ptr %cond.i65, i64 %sub.ptr.div.i
  %add.ptr37 = getelementptr inbounds %"class.std::vector.3", ptr %add.ptr, i64 %__n
  store ptr %add.ptr37, ptr %_M_finish.i, align 8, !tbaa !72
  ret ptr %add.ptr37
}

define i64 @"110"(ptr %arrayidx.i, ptr %prefix, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i, align 8, !tbaa !0
  %2 = load ptr, ptr %prefix, align 8
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul14 = shl i64 %3, %0
  %arrayidx.i34 = getelementptr inbounds i64, ptr %2, i64 %mul14
  store i64 %1, ptr %arrayidx.i34, align 8, !tbaa !0
  ret i64 %1
}

define i64 @"111"(ptr %offsets, ptr %num_nodes_.i) {
bb:
  %0 = load i64, ptr %num_nodes_.i, align 8, !tbaa !50
  %.pre759.pre772 = load ptr, ptr %offsets, align 8, !tbaa !10
  %arrayidx.i552 = getelementptr inbounds i64, ptr %.pre759.pre772, i64 %0
  %1 = load i64, ptr %arrayidx.i552, align 8, !tbaa !0
  ret i64 %1
}

define i32 @"112"(ptr %incdec.ptr.i.i, i64 %0, ptr %this, i64 %__holeIndex.addr.0.lcssa.i.i.i.i, i32 %1) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !4
  %second3.i29.i.i.i.i = getelementptr inbounds %"struct.std::pair", ptr %2, i64 %__holeIndex.addr.0.lcssa.i.i.i.i, i32 1
  %__value.sroa.0.0.copyload.i.i = load i64, ptr %incdec.ptr.i.i, align 4
  %__value.sroa.3.0.extract.shift.i.i.i.i = lshr i64 %__value.sroa.0.0.copyload.i.i, %0
  %__value.sroa.3.0.extract.trunc.i.i.i.i = trunc i64 %__value.sroa.3.0.extract.shift.i.i.i.i to i32
  store i32 %__value.sroa.3.0.extract.trunc.i.i.i.i, ptr %second3.i29.i.i.i.i, align 4, !tbaa !44
  ret i32 %__value.sroa.3.0.extract.trunc.i.i.i.i
}

define i64 @"113"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !54
  %inc.i72 = add nuw nsw i64 %2, %1
  %inc.i208 = add nuw nsw i64 %inc.i72, %1
  %arrayidx.i141 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i208
  %3 = load i64, ptr %arrayidx.i141, align 8, !tbaa !0
  ret i64 %3
}

define i64 @"114"(ptr %arrayidx.i18.i, ptr %0, i64 %1, i64 %2, ptr %3) {
bb:
  %4 = load ptr, ptr %arrayidx.i18.i, align 8, !tbaa !4, !noalias !73
  %sub.ptr.lhs.cast.i19.i = ptrtoint ptr %4 to i64
  %5 = load ptr, ptr %0, align 8, !tbaa !4, !noalias !73
  %sub.ptr.rhs.cast.i20.i = ptrtoint ptr %5 to i64
  %sub.ptr.sub.i21.i = sub i64 %sub.ptr.lhs.cast.i19.i, %sub.ptr.rhs.cast.i20.i
  %sub.ptr.div.i22.i = ashr exact i64 %sub.ptr.sub.i21.i, %1
  %div.i.i = sdiv i64 %sub.ptr.div.i22.i, %2
  store i64 %div.i.i, ptr %3, align 8, !alias.scope !73
  ret i64 %div.i.i
}

define i32 @"115"(ptr %num_nodes_, i32 %0, ptr %.omp.ub) {
bb:
  %1 = load i64, ptr %num_nodes_, align 8, !tbaa !76
  %conv = trunc i64 %1 to i32
  %sub2 = add nsw i32 %conv, %0
  store i32 %sub2, ptr %.omp.ub, align 4, !tbaa !6
  ret i32 %sub2
}

define ptr @"116"(ptr %local_bins, ptr %arrayidx4) {
bb:
  %0 = load i64, ptr %arrayidx4, align 8, !tbaa !0
  %1 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %add.ptr.i173 = getelementptr inbounds %"class.std::vector.3", ptr %1, i64 %0
  %2 = load ptr, ptr %add.ptr.i173, align 8, !tbaa !4
  ret ptr %2
}

define i32 @"117"(i32 %shl, ptr %arrayidx.i62, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i64, i64 %4, i64 %5, i64 %xor4.i, i64 %6, i64 %xor7.i, i32 %7, ptr %el, ptr %.omp.lb) {
bb:
  %8 = load i64, ptr %arrayidx.i62, align 8, !tbaa !0
  %shr.i63 = lshr i64 %8, %0
  %and.i = and i64 %shr.i63, %1
  %xor.i642 = xor i64 %and.i, %8
  %shl.i = shl i64 %xor.i64, %2
  %and3.i = and i64 %shl.i, %3
  %xor4.i4 = xor i64 %and3.i, %xor.i64
  %shl5.i = shl i64 %xor4.i, %4
  %and6.i = and i64 %shl5.i, %5
  %xor7.i6 = xor i64 %and6.i, %xor4.i
  %shr8.i = lshr i64 %xor7.i, %6
  %xor9.i = xor i64 %shr8.i, %xor7.i
  %conv = trunc i64 %xor9.i to i32
  %cmp20 = icmp ugt i32 %conv, %7
  %inc23 = zext i1 %cmp20 to i32
  %src.1 = or i32 %shl, %inc23
  %9 = load ptr, ptr %el, align 8, !tbaa !41
  %10 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul = shl i64 %10, %6
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %9, i64 %mul
  store i32 %src.1, ptr %arrayidx.i, align 4, !tbaa.struct !49
  ret i32 %src.1
}

define i64 @"118"(ptr %add.ptr.i.i.i.i16, ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %w.i.i.i.i.i, ptr %w3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i64, ptr %add.ptr.i.i.i.i16, align 4
  %1 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !8
  %2 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !8
  %cmp7.i.i.i.i.i = icmp slt i32 %1, %2
  %cmp.i.i.i.i.i = icmp eq i32 %1, %2
  %3 = load i32, ptr %w.i.i.i.i.i, align 4
  %4 = load i32, ptr %w3.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %3, %4
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr2.i.i.i.i23 = getelementptr inbounds %struct.NodeWeight, ptr %__first, i64 %spec.select.i.i.i
  store i64 %0, ptr %add.ptr2.i.i.i.i23, align 4
  ret i64 %0
}

define ptr @"119"(ptr %local_bins, ptr %shared_indexes) {
bb:
  %0 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %1 = load i64, ptr %shared_indexes, align 8, !tbaa !0
  %add.ptr.i308 = getelementptr inbounds %"class.std::vector.3", ptr %0, i64 %1
  %2 = load ptr, ptr %add.ptr.i308, align 8, !tbaa !4
  ret ptr %2
}

define i32 @"120"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !41
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add16 = add i64 %3, %0
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %add16
  %e.sroa.5.0.add.ptr.sroa_idx.1 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %1
  %e.sroa.5.0.copyload.1 = load i32, ptr %e.sroa.5.0.add.ptr.sroa_idx.1, align 4, !tbaa.struct !43
  ret i32 %e.sroa.5.0.copyload.1
}

define ptr @"121"(ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %0, i64 %1, ptr %end_capacity_.i.i) {
bb:
  %2 = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %3 = load ptr, ptr %agg.result, align 8, !tbaa !41
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !48
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i = sdiv exact i64 %sub.ptr.sub.i.i, %0
  %mul.i = shl nsw i64 %sub.ptr.div.i.i, %1
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %mul.i
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i, align 8, !tbaa !62
  ret ptr %add.ptr6.i.i
}

define i64 @"122"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !41
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !49
  ret i64 %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i
}

define i32 @"123"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !41
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add16.1 = add i64 %2, %0
  %add.ptr.epil = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %add16.1
  %e.sroa.0.0.copyload.epil = load i32, ptr %add.ptr.epil, align 4, !tbaa.struct !49
  ret i32 %e.sroa.0.0.copyload.epil
}

define i64 @"124"(i64 %val.coerce0, ptr %new_range.i, ptr %end_size_.i, ptr %this, i64 %0) {
bb:
  %1 = load ptr, ptr %new_range.i, align 8, !tbaa !4
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !48
  %sub.ptr.lhs.cast.i10.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %this, align 8, !tbaa !41
  %sub.ptr.rhs.cast.i11.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i12.i = sub i64 %sub.ptr.lhs.cast.i10.i, %sub.ptr.rhs.cast.i11.i
  %sub.ptr.div.i13.i = sdiv exact i64 %sub.ptr.sub.i12.i, %0
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %sub.ptr.div.i13.i
  store i64 %val.coerce0, ptr %add.ptr.i, align 4, !tbaa.struct !49
  ret i64 %val.coerce0
}

define i64 @"125"(ptr %new_range.i.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %agg.tmp.sroa.0.0.copyload.i.i.i.i.i = load i64, ptr %.pre.i.i, align 4, !tbaa.struct !49
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i.i.i
}

define ptr @"126"(ptr %local_bins, ptr %arrayidx277) {
bb:
  %0 = load i64, ptr %arrayidx277, align 8, !tbaa !0
  %1 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %add.ptr.i = getelementptr inbounds %"class.std::vector.3", ptr %1, i64 %0
  %2 = load ptr, ptr %add.ptr.i, align 8, !tbaa !4
  ret ptr %2
}

define i32 @"127"(ptr %neighs, ptr %arrayidx.i542, i64 %shr.i.i, i32 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  %2 = load ptr, ptr %neighs, align 8, !tbaa !4
  %add.ptr = getelementptr inbounds %struct.NodeWeight, ptr %2, i64 %1
  %w.i.i.i.i = getelementptr inbounds %struct.NodeWeight, ptr %add.ptr, i64 %shr.i.i, i32 1
  %3 = load i32, ptr %w.i.i.i.i, align 4
  ret i32 %3
}

define i64 @"128"(i64 %ref.tmp297.sroa.0.0.insert.insert, ptr %neighs, ptr %arrayidx.i567, i64 %0, ptr %arrayidx.i568) {
bb:
  %1 = load ptr, ptr %neighs, align 8, !tbaa !4
  %2 = load i64, ptr %arrayidx.i567, align 8, !tbaa !0
  %add308 = add i64 %2, %0
  %3 = load i32, ptr %arrayidx.i568, align 4, !tbaa !6
  %idx.ext = sext i32 %3 to i64
  %sub309 = add i64 %add308, %idx.ext
  %arrayidx310 = getelementptr inbounds %struct.NodeWeight, ptr %1, i64 %sub309
  store i64 %ref.tmp297.sroa.0.0.insert.insert, ptr %arrayidx310, align 4
  ret i64 %ref.tmp297.sroa.0.0.insert.insert
}

define i64 @"129"(ptr %end_size_.i, ptr %el, i64 %0, i64 %1, i64 %2, i64 %3, ptr %.omp.ub) {
bb:
  %4 = load ptr, ptr %end_size_.i, align 8, !tbaa !48
  %sub.ptr.lhs.cast.i = ptrtoint ptr %4 to i64
  %5 = load ptr, ptr %el, align 8, !tbaa !41
  %sub.ptr.rhs.cast.i = ptrtoint ptr %5 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = sdiv exact i64 %sub.ptr.sub.i, %0
  %sub = add nuw nsw i64 %sub.ptr.div.i, %1
  %div33 = lshr i64 %sub, %2
  %sub5 = add nsw i64 %div33, %3
  store i64 %sub5, ptr %.omp.ub, align 8, !tbaa !0
  ret i64 %sub5
}

define i64 @"130"(ptr %__first.addr.034.i.i, ptr %n_start.0.in, i64 %0) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  %incdec.ptr12.i.i.i.i = getelementptr inbounds %struct.NodeWeight, ptr %n_start.0, i64 %0
  %1 = load i64, ptr %__first.addr.034.i.i, align 4
  store i64 %1, ptr %incdec.ptr12.i.i.i.i, align 4
  ret i64 %1
}

define i32 @"131"(ptr %n_start.0.in, i64 %0, i64 %1, ptr %diffs, ptr %.omp.lb) {
bb:
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !6
  %3 = sext i32 %2 to i64
  %4 = load ptr, ptr %diffs, align 8, !tbaa !12
  %arrayidx.i98 = getelementptr inbounds i32, ptr %4, i64 %3
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  %incdec.ptr12.i.i.i.i = getelementptr inbounds %struct.NodeWeight, ptr %n_start.0, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr12.i.i.i.i to i64
  %.pre133 = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %.pre133
  %5 = lshr exact i64 %sub.ptr.sub, %1
  %conv22 = trunc i64 %5 to i32
  store i32 %conv22, ptr %arrayidx.i98, align 4, !tbaa !6
  ret i32 %conv22
}

define i32 @"132"(ptr %mq, ptr %_M_finish.i.i.i, i64 %0, i64 %sub.ptr.rhs.cast.i.i.i, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %_M_finish.i.i.i, align 8, !tbaa !63
  %incdec.ptr.i.i.i = getelementptr inbounds %"struct.std::pair", ptr %3, i64 %0
  %sub.ptr.lhs.cast.i.i.i = ptrtoint ptr %incdec.ptr.i.i.i to i64
  %sub.ptr.sub.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i, %sub.ptr.rhs.cast.i.i.i
  %sub.ptr.div.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i, %1
  %sub.i.i = add nsw i64 %sub.ptr.div.i.i.i, %2
  %__parent.040.in.i.i.i = add nsw i64 %sub.i.i, %2
  %__parent.040.i910.i.i = lshr i64 %__parent.040.in.i.i.i, %0
  %.pre.i = load ptr, ptr %mq, align 8, !tbaa !4
  %add.ptr.i.i.i10.i = getelementptr inbounds %"struct.std::pair", ptr %.pre.i, i64 %__parent.040.i910.i.i
  %4 = load i32, ptr %add.ptr.i.i.i10.i, align 4, !tbaa !6
  ret i32 %4
}

define i64 @"133"(ptr %neighs, ptr %arrayidx.i561, i64 %0, i64 %total_missing_inv.1702, ptr %arrayidx.i560) {
bb:
  %1 = load i32, ptr %arrayidx.i560, align 4, !tbaa !6
  %conv211 = sext i32 %1 to i64
  %sub235 = sub nsw i64 %total_missing_inv.1702, %conv211
  %2 = xor i64 %sub235, %0
  %3 = load i64, ptr %arrayidx.i561, align 8, !tbaa !0
  %i213.0.prol = add nsw i64 %3, %0
  %sub224 = add i64 %i213.0.prol, %2
  %4 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx225 = getelementptr inbounds %struct.NodeWeight, ptr %4, i64 %sub224
  %5 = load i64, ptr %arrayidx225, align 4
  ret i64 %5
}

define i64 @"134"(ptr %neighs, ptr %arrayidx.i561, i64 %0, i64 %1, i64 %total_missing_inv.1702, ptr %arrayidx.i560) {
bb:
  %2 = load ptr, ptr %neighs, align 8, !tbaa !4
  %3 = load i32, ptr %arrayidx.i560, align 4, !tbaa !6
  %conv211 = sext i32 %3 to i64
  %sub235 = sub nsw i64 %total_missing_inv.1702, %conv211
  %4 = load i64, ptr %arrayidx.i561, align 8, !tbaa !0
  %i213.0.prol = add nsw i64 %4, %0
  %i213.0.1 = add nsw i64 %i213.0.prol, %1
  %sub224.1 = sub nsw i64 %i213.0.1, %sub235
  %arrayidx225.1 = getelementptr inbounds %struct.NodeWeight, ptr %2, i64 %sub224.1
  %5 = load i64, ptr %arrayidx225.1, align 4
  ret i64 %5
}

define i32 @"136"(ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %w.i.i.i.i.i, ptr %w3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !8
  %3 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !8
  %cmp7.i.i.i.i.i = icmp slt i32 %2, %3
  %cmp.i.i.i.i.i = icmp eq i32 %2, %3
  %4 = load i32, ptr %w.i.i.i.i.i, align 4
  %5 = load i32, ptr %w3.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %4, %5
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %__parent.020.in.i.i.i.i = add nsw i64 %spec.select.i.i.i, %0
  %__parent.020.i.i.i.i = sdiv i64 %__parent.020.in.i.i.i.i, %1
  %add.ptr.i.i.i.i16 = getelementptr inbounds %struct.NodeWeight, ptr %__first, i64 %__parent.020.i.i.i.i
  %6 = load i32, ptr %add.ptr.i.i.i.i16, align 4, !tbaa !8
  ret i32 %6
}

define ptr @"137"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !41
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %1
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !48
  ret ptr %add.ptr.i
}

define ptr @"138"(ptr %cond.i31.i.i.i.i, i64 %.sroa.speculated.i.i.i.i.i, ptr %_M_finish.i.i.i, ptr %mq, i64 %0, i64 %sub.ptr.div.i.i.i.i.i.i, i1 %cmp9.i.i.i.i.i, i64 %1, i64 %add.i.i.i.i.i, ptr %_M_end_of_storage.i.i.i) {
bb:
  %2 = load ptr, ptr %_M_finish.i.i.i, align 8, !tbaa !4
  %sub.ptr.lhs.cast.i.i.i.i.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %mq, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i.i.i.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i.i2 = ashr exact i64 %sub.ptr.sub.i.i.i.i.i.i, %0
  %add.i.i.i.i.i4 = add i64 %.sroa.speculated.i.i.i.i.i, %sub.ptr.div.i.i.i.i.i.i
  %cmp7.i.i.i.i.i = icmp ult i64 %add.i.i.i.i.i, %sub.ptr.div.i.i.i.i.i.i
  %or.cond.i.i.i.i.i = or i1 %cmp7.i.i.i.i.i, %cmp9.i.i.i.i.i
  %cond.i.i.i.i.i = select i1 %or.cond.i.i.i.i.i, i64 %1, i64 %add.i.i.i.i.i
  %add.ptr19.i.i.i.i = getelementptr inbounds %"struct.std::pair", ptr %cond.i31.i.i.i.i, i64 %cond.i.i.i.i.i
  store ptr %add.ptr19.i.i.i.i, ptr %_M_end_of_storage.i.i.i, align 8, !tbaa !78
  ret ptr %add.ptr19.i.i.i.i
}

define i32 @"139"(ptr %add.ptr.i.i.i10.i, ptr %mq, ptr %cond.i31.i.i.i.i, ptr %_M_finish.i.i.i, i64 %0, i64 %1, i64 %2, i64 %3, i64 %sub.ptr.rhs.cast.i.i.i, i64 %4) {
bb:
  %5 = load i32, ptr %add.ptr.i.i.i10.i, align 4, !tbaa !6
  %.pre.i = load ptr, ptr %mq, align 8, !tbaa !4
  %6 = load ptr, ptr %_M_finish.i.i.i, align 8, !tbaa !4
  %7 = ptrtoint ptr %6 to i64
  %8 = add i64 %7, %0
  %9 = load ptr, ptr %mq, align 8, !tbaa !4
  %10 = ptrtoint ptr %9 to i64
  %11 = sub i64 %8, %10
  %12 = lshr i64 %11, %1
  %13 = add nuw nsw i64 %12, %2
  %n.vec = and i64 %13, %3
  %14 = shl i64 %n.vec, %1
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i.i, i64 %14
  %incdec.ptr.i.i.i.i = getelementptr %"struct.std::pair", ptr %ind.end, i64 %2
  %sub.ptr.lhs.cast.i.i.i = ptrtoint ptr %incdec.ptr.i.i.i.i to i64
  %sub.ptr.sub.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i, %sub.ptr.rhs.cast.i.i.i
  %sub.ptr.div.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i, %1
  %sub.i.i = add nsw i64 %sub.ptr.div.i.i.i, %4
  %add.ptr.i26.i.i.i = getelementptr inbounds %"struct.std::pair", ptr %.pre.i, i64 %sub.i.i
  store i32 %5, ptr %add.ptr.i26.i.i.i, align 4, !tbaa !65
  ret i32 %5
}

define i32 @"140"(ptr %v, i64 %0, ptr %val.sroa.2.0..sroa_idx.i) {
bb:
  %agg.tmp73.sroa.0.0.copyload = load i64, ptr %v, align 8, !tbaa.struct !43
  %1 = lshr i64 %agg.tmp73.sroa.0.0.copyload, %0
  %2 = trunc i64 %1 to i32
  store i32 %2, ptr %val.sroa.2.0..sroa_idx.i, align 4, !tbaa.struct !52
  ret i32 %2
}

define i32 @"141"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !12
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add.ptr = getelementptr inbounds i32, ptr %2, i64 %ind.end
  %5 = load i32, ptr %init_val, align 4, !tbaa !6
  store i32 %5, ptr %add.ptr, align 4, !tbaa !6
  ret i32 %5
}

define i32 @"142"(ptr %neighs, ptr %arrayidx.i567, ptr %arrayidx.i568, i64 %shr.i.i591, i32 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i567, align 8, !tbaa !0
  %2 = load ptr, ptr %neighs, align 8, !tbaa !4
  %add.ptr277 = getelementptr inbounds %struct.NodeWeight, ptr %2, i64 %1
  %3 = load i32, ptr %arrayidx.i568, align 4, !tbaa !6
  %idx.ext = sext i32 %3 to i64
  %add.ptr281 = getelementptr inbounds %struct.NodeWeight, ptr %add.ptr277, i64 %idx.ext
  %w.i.i.i.i597 = getelementptr inbounds %struct.NodeWeight, ptr %add.ptr281, i64 %shr.i.i591, i32 1
  %4 = load i32, ptr %w.i.i.i.i597, align 4
  ret i32 %4
}

define i8 @"143"(ptr %label) {
bb:
  %0 = load ptr, ptr %label, align 8, !tbaa !30, !noalias !79
  %1 = load i8, ptr %0, align 1, !tbaa !26
  ret i8 %1
}

define i32 @"144"(ptr %__first, ptr %add.ptr, ptr %add.ptr2, i64 %sub1, i64 %mul, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i32, ptr %add.ptr2, align 4, !tbaa !60
  %4 = load i32, ptr %add.ptr, align 4, !tbaa !60
  %cmp6.i.i = icmp slt i32 %4, %3
  %spec.select = select i1 %cmp6.i.i, i64 %sub1, i64 %mul
  %add10 = shl i64 %spec.select, %0
  %sub12 = or i64 %add10, %0
  %__parent.019.in.i = add nsw i64 %sub12, %1
  %__parent.019.i = sdiv i64 %__parent.019.in.i, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %__parent.019.i
  %5 = load i32, ptr %add.ptr.i, align 4, !tbaa !60
  ret i32 %5
}

define ptr @"145"(ptr %__args, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0) {
bb:
  %1 = load ptr, ptr %this, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %1 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %add.ptr = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i
  %2 = load ptr, ptr %__args, align 8, !tbaa !30
  store ptr %2, ptr %add.ptr, align 8, !tbaa !30
  ret ptr %2
}

define ptr @"146"(ptr %_M_finish.i44, i64 %0, ptr %local_bins, ptr %arrayidx.i36, ptr %__begin1.064, i64 %1, i32 %delta, i64 %2, i32 %3) {
bb:
  %4 = load ptr, ptr %_M_finish.i44, align 8, !tbaa !4
  %incdec.ptr.i = getelementptr inbounds i32, ptr %4, i64 %0
  %5 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %6 = load i32, ptr %arrayidx.i36, align 4, !tbaa !6
  %7 = load i64, ptr %__begin1.064, align 4
  %wn.sroa.8.0.extract.shift = lshr i64 %7, %1
  %wn.sroa.8.0.extract.trunc = trunc i64 %wn.sroa.8.0.extract.shift to i32
  %add = add nsw i32 %6, %wn.sroa.8.0.extract.trunc
  %div = sdiv i32 %add, %delta
  %conv10 = sext i32 %div to i64
  %add.ptr.i43 = getelementptr inbounds %"class.std::vector.3", ptr %5, i64 %conv10
  %_M_finish.i442 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i43, i64 %2, i32 1
  store ptr %incdec.ptr.i, ptr %_M_finish.i44, align 8, !tbaa !58
  ret ptr %incdec.ptr.i
}

define ptr @"147"(ptr %index.i150, ptr %0) {
bb:
  %1 = load ptr, ptr %index.i150, align 8, !tbaa !4
  store ptr %1, ptr %0, align 8
  ret ptr %1
}

define i64 @"148"(ptr %arrayidx.i511.prol, ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i511.prol, align 8, !tbaa !0
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !50
  %n.mod.vf = and i64 %3, %0
  %arrayidx.i512.prol = getelementptr inbounds i64, ptr %2, i64 %n.mod.vf
  store i64 %1, ptr %arrayidx.i512.prol, align 8, !tbaa !0
  ret i64 %1
}

define i64 @"149"(ptr %arrayidx.i511, ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !50
  %n.mod.vf = and i64 %2, %0
  %arrayidx.i512 = getelementptr inbounds i64, ptr %1, i64 %n.mod.vf
  %3 = load i64, ptr %arrayidx.i511, align 8, !tbaa !0
  store i64 %3, ptr %arrayidx.i512, align 8, !tbaa !0
  ret i64 %3
}

define i64 @"150"(ptr %incdec.ptr125.i.i, ptr %n_start.0.in, i64 %0) {
bb:
  %1 = load i64, ptr %incdec.ptr125.i.i, align 4
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  %incdec.ptr5.i.i = getelementptr inbounds %struct.NodeWeight, ptr %n_start.0, i64 %0
  store i64 %1, ptr %incdec.ptr5.i.i, align 4
  ret i64 %1
}

define i64 @"151"(i64 %lsum.035, ptr %arrayidx.i31, ptr %local_sums, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %1 = load ptr, ptr %local_sums, align 8, !tbaa !10
  %arrayidx.i = getelementptr inbounds i64, ptr %1, i64 %0
  %2 = load i32, ptr %arrayidx.i31, align 4, !tbaa !6
  %conv = sext i32 %2 to i64
  %add15 = add nsw i64 %lsum.035, %conv
  store i64 %add15, ptr %arrayidx.i, align 8, !tbaa !0
  ret i64 %add15
}

define i64 @"152"(ptr %arrayidx225, ptr %neighs, ptr %arrayidx.i558, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx225, align 4
  %2 = load i64, ptr %arrayidx.i558, align 8, !tbaa !0
  %sub196 = add nsw i64 %2, %0
  %3 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx226 = getelementptr inbounds %struct.NodeWeight, ptr %3, i64 %sub196
  store i64 %1, ptr %arrayidx226, align 4
  ret i64 %1
}

define <2 x i64> @"153"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %.omp.lb, i64 %3, i64 %4, i64 %5, <2 x i64> %6, <2 x i64> %7, ptr %8, <2 x i64> %9, <2 x i64> %10, ptr %11) {
bb:
  %wide.load138 = load <2 x i64>, ptr %8, align 8, !tbaa !0
  %wide.load137 = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %12 = and <2 x i64> %wide.load137, %1
  %13 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add11 = add i64 %13, %3
  %rem.i.i.i = and i64 %add11, %4
  %vector.recur.init135 = insertelement <2 x i64> %2, i64 %rem.i.i.i, i64 %5
  %14 = shufflevector <2 x i64> %vector.recur.init135, <2 x i64> %wide.load137, <2 x i32> <i32 1, i32 2>
  %15 = and <2 x i64> %14, %6
  %16 = or <2 x i64> %12, %15
  %17 = lshr exact <2 x i64> %16, %7
  %18 = xor <2 x i64> %17, %wide.load138
  %19 = and <2 x i64> %wide.load137, %7
  %20 = icmp eq <2 x i64> %19, %9
  %21 = select <2 x i1> %20, <2 x i64> %9, <2 x i64> %10
  %22 = xor <2 x i64> %18, %21
  store <2 x i64> %22, ptr %11, align 8, !tbaa !0
  ret <2 x i64> %22
}

define i64 @"154"(ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, i64 %2, ptr %num_blocks) {
bb:
  %3 = load ptr, ptr %degrees, align 8, !tbaa !12
  %sub.ptr.rhs.cast.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %end_size_.i, align 8, !tbaa !14
  %sub.ptr.lhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %sub = add nsw i64 %sub.ptr.div.i, %1
  %div38 = lshr i64 %sub, %2
  store i64 %div38, ptr %num_blocks, align 8, !tbaa !0
  ret i64 %div38
}

define i32 @"155"(ptr %arrayidx.i26, ptr %el, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %arrayidx.i26, align 4, !tbaa !6
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %2 = load ptr, ptr %el, align 8, !tbaa !41
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %1
  store i32 %0, ptr %arrayidx.i, align 4, !tbaa.struct !49
  ret i32 %0
}

define i32 @"156"(ptr %n_start.0.in, i64 %0) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  %incdec.ptr12.i.i.i.i = getelementptr inbounds %struct.NodeWeight, ptr %n_start.0, i64 %0
  %1 = load i32, ptr %incdec.ptr12.i.i.i.i, align 4, !tbaa !8
  ret i32 %1
}

define ptr @"157"(ptr %local_bins, ptr %arrayidx277) {
bb:
  %.pre283 = load i64, ptr %arrayidx277, align 8, !tbaa !0
  %0 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %add.ptr.i173 = getelementptr inbounds %"class.std::vector.3", ptr %0, i64 %.pre283
  %1 = load ptr, ptr %add.ptr.i173, align 8, !tbaa !4
  ret ptr %1
}

define i64 @"158"(ptr %num_edges_, i64 %0, i64 %1, i64 %2, ptr %.omp.ub) {
bb:
  %3 = load i64, ptr %num_edges_, align 8, !tbaa !82
  %sub3 = add nuw i64 %3, %0
  %div37 = lshr i64 %sub3, %1
  %sub4 = add nsw i64 %div37, %2
  store i64 %sub4, ptr %.omp.ub, align 8, !tbaa !0
  ret i64 %sub4
}

define i64 @"159"(ptr %arrayidx.i141, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i144, i64 %4, i64 %5, i64 %xor4.i147, i64 %6, i64 %xor7.i150, ptr %num_nodes_, i64 %7, ptr %el, ptr %.omp.lb, i64 %8) {
bb:
  %9 = load i64, ptr %num_nodes_, align 8, !tbaa !76
  %10 = trunc i64 %9 to i32
  %11 = load i64, ptr %arrayidx.i141, align 8, !tbaa !0
  %shr.i142 = lshr i64 %11, %0
  %and.i143 = and i64 %shr.i142, %1
  %xor.i1442 = xor i64 %and.i143, %11
  %shl.i145 = shl i64 %xor.i144, %2
  %and3.i146 = and i64 %shl.i145, %3
  %xor4.i1474 = xor i64 %and3.i146, %xor.i144
  %shl5.i148 = shl i64 %xor4.i147, %4
  %and6.i149 = and i64 %shl5.i148, %5
  %xor7.i1506 = xor i64 %and6.i149, %xor4.i147
  %shr8.i151 = lshr i64 %xor7.i150, %6
  %xor9.i152 = xor i64 %shr8.i151, %xor7.i150
  %conv7.i55 = trunc i64 %xor9.i152 to i32
  %rem.i53 = urem i32 %conv7.i55, %10
  %agg.tmp.sroa.0.0.insert.ext = zext i32 %rem.i53 to i64
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.0.0.insert.ext, %7
  %12 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul = shl i64 %12, %6
  %13 = load ptr, ptr %el, align 8, !tbaa !41
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %13, i64 %mul
  %ref.tmp16.sroa.4.0.arrayidx.i.sroa_idx = getelementptr inbounds i8, ptr %arrayidx.i, i64 %8
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %ref.tmp16.sroa.4.0.arrayidx.i.sroa_idx, align 4, !tbaa.struct !43
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"160"(ptr %add.ptr.i.i.i, ptr %add.ptr.i27.i.i.i) {
bb:
  %__value.sroa.0.0.copyload.i.i = load i64, ptr %add.ptr.i.i.i, align 4
  %__value.sroa.0.0.extract.trunc.i.i.i = trunc i64 %__value.sroa.0.0.copyload.i.i to i32
  store i32 %__value.sroa.0.0.extract.trunc.i.i.i, ptr %add.ptr.i27.i.i.i, align 4, !tbaa !65
  ret i32 %__value.sroa.0.0.extract.trunc.i.i.i
}

define ptr @"161"(ptr %new_range.i.i476, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre752 = load ptr, ptr %el, align 8, !tbaa !41
  %.pre776 = ptrtoint ptr %.pre752 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !41
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre776
  %sub.ptr.div14 = sdiv exact i64 %sub.ptr.sub13, %2
  %.pre.i.i495 = load ptr, ptr %new_range.i.i476, align 8, !tbaa !4
  %add.ptr.i483 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i495, i64 %sub.ptr.div14
  store ptr %add.ptr.i483, ptr %end_size_.i, align 8, !tbaa !48
  ret ptr %add.ptr.i483
}

define i64 @"162"(ptr %__x, ptr %_M_finish.i.i) {
bb:
  %0 = load i64, ptr %__x, align 4
  %1 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !4
  store i64 %0, ptr %1, align 4
  ret i64 %0
}

define i32 @"163"(i32 %__value.coerce1, ptr %__first, ptr %add.ptr, ptr %add.ptr2, i64 %sub1, i64 %mul, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr2, align 4, !tbaa !60
  %3 = load i32, ptr %add.ptr, align 4, !tbaa !60
  %cmp6.i.i = icmp slt i32 %3, %2
  %spec.select = select i1 %cmp6.i.i, i64 %sub1, i64 %mul
  %add10 = shl i64 %spec.select, %0
  %sub12 = or i64 %add10, %0
  %add.ptr5.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %sub12
  %__value.sroa.4.0.add.ptr5.sroa_idx.i = getelementptr inbounds i8, ptr %add.ptr5.i, i64 %1
  store i32 %__value.coerce1, ptr %__value.sroa.4.0.add.ptr5.sroa_idx.i, align 4, !tbaa.struct !52
  ret i32 %__value.coerce1
}

define i32 @"164"(i32 %0, ptr %end_size_.i.i, i64 %1) {
bb:
  %.pre.pre.i189 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !48
  %val.sroa.2.0..sroa_idx.i172 = getelementptr inbounds i8, ptr %.pre.pre.i189, i64 %1
  store i32 %0, ptr %val.sroa.2.0..sroa_idx.i172, align 4, !tbaa.struct !52
  ret i32 %0
}

define i32 @"165"(ptr %v, i64 %0, ptr %end_size_.i.i, i64 %1) {
bb:
  %agg.tmp73.sroa.0.0.copyload = load i64, ptr %v, align 8, !tbaa.struct !43
  %2 = lshr i64 %agg.tmp73.sroa.0.0.copyload, %0
  %3 = trunc i64 %2 to i32
  %4 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !48
  %val.sroa.2.0..sroa_idx.i = getelementptr inbounds i8, ptr %4, i64 %1
  store i32 %3, ptr %val.sroa.2.0..sroa_idx.i, align 4, !tbaa.struct !52
  ret i32 %3
}

define i64 @"166"(ptr %offsets, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !10
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !6
  %3 = sext i32 %2 to i64
  %indvars.iv.next = add nsw i64 %3, %0
  %arrayidx.i.1 = getelementptr inbounds i64, ptr %1, i64 %indvars.iv.next
  %4 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !0
  ret i64 %4
}

define i64 @"167"(ptr %neighs, ptr %arrayidx.i561, i64 %0, i64 %total_missing_inv.0692, ptr %arrayidx.i555) {
bb:
  %1 = load i32, ptr %arrayidx.i555, align 4, !tbaa !6
  %conv168 = sext i32 %1 to i64
  %add169 = add nsw i64 %total_missing_inv.0692, %conv168
  %2 = xor i64 %add169, %0
  %3 = load i64, ptr %arrayidx.i561, align 8, !tbaa !0
  %i213.0.prol = add nsw i64 %3, %0
  %sub224 = add i64 %i213.0.prol, %2
  %4 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx225 = getelementptr inbounds %struct.NodeWeight, ptr %4, i64 %sub224
  %5 = load i64, ptr %arrayidx225, align 4
  ret i64 %5
}

define i64 @"168"(ptr %neighs, ptr %arrayidx.i564, ptr %arrayidx.i565) {
bb:
  %0 = load i64, ptr %arrayidx.i564, align 8, !tbaa !0
  %1 = load i32, ptr %arrayidx.i565, align 4, !tbaa !6
  %conv259 = sext i32 %1 to i64
  %add260 = add nsw i64 %0, %conv259
  %2 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx270 = getelementptr inbounds %struct.NodeWeight, ptr %2, i64 %add260
  %3 = load i64, ptr %arrayidx270, align 4
  ret i64 %3
}

define i64 @"169"(ptr %w.i, i64 %0, ptr %v, i32 %1, ptr %agg.tmp.4.sroa_idx) {
bb:
  %2 = load i32, ptr %v, align 4, !tbaa !8
  %sub14 = add nsw i32 %2, %1
  %agg.tmp12.sroa.0.0.insert.ext = zext i32 %sub14 to i64
  %3 = load i32, ptr %w.i, align 4, !tbaa !83
  %agg.tmp12.sroa.2.0.insert.ext = zext i32 %3 to i64
  %agg.tmp12.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp12.sroa.2.0.insert.ext, %0
  %agg.tmp12.sroa.0.0.insert.insert = or i64 %agg.tmp12.sroa.2.0.insert.shift, %agg.tmp12.sroa.0.0.insert.ext
  store i64 %agg.tmp12.sroa.0.0.insert.insert, ptr %agg.tmp.4.sroa_idx, align 4, !tbaa.struct !43
  ret i64 %agg.tmp12.sroa.0.0.insert.insert
}

define i64 @"170"(ptr %offsets, ptr %arrayidx270, i64 %0) {
bb:
  %.pre765 = load ptr, ptr %offsets, align 8, !tbaa !10
  %1 = load i64, ptr %arrayidx270, align 4
  %sext = shl i64 %1, %0
  %conv273 = ashr exact i64 %sext, %0
  %arrayidx.i567 = getelementptr inbounds i64, ptr %.pre765, i64 %conv273
  %2 = load i64, ptr %arrayidx.i567, align 8, !tbaa !0
  ret i64 %2
}

define i64 @"171"(i64 %agg.tmp.sroa.0.0.insert.insert, ptr %el, i64 %e.073, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !41
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %e.073
  %ref.tmp30.sroa.4.0.arrayidx.i.sroa_idx = getelementptr inbounds i8, ptr %arrayidx.i, i64 %0
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %ref.tmp30.sroa.4.0.arrayidx.i.sroa_idx, align 4, !tbaa.struct !43
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"172"(ptr %arrayidx.i73, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i76, i64 %4, i64 %5, i64 %xor4.i79, i64 %6, i64 %xor7.i82, ptr %num_nodes_, ptr %el, ptr %.omp.lb) {
bb:
  %7 = load i64, ptr %arrayidx.i73, align 8, !tbaa !0
  %shr.i74 = lshr i64 %7, %0
  %and.i75 = and i64 %shr.i74, %1
  %xor.i762 = xor i64 %and.i75, %7
  %shl.i77 = shl i64 %xor.i76, %2
  %and3.i78 = and i64 %shl.i77, %3
  %xor4.i794 = xor i64 %and3.i78, %xor.i76
  %shl5.i80 = shl i64 %xor4.i79, %4
  %and6.i81 = and i64 %shl5.i80, %5
  %xor7.i826 = xor i64 %and6.i81, %xor4.i79
  %shr8.i83 = lshr i64 %xor7.i82, %6
  %xor9.i84 = xor i64 %shr8.i83, %xor7.i82
  %conv.i = trunc i64 %xor9.i84 to i32
  %8 = load i64, ptr %num_nodes_, align 8, !tbaa !76
  %9 = trunc i64 %8 to i32
  %rem.i = urem i32 %conv.i, %9
  %10 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul = shl i64 %10, %6
  %11 = load ptr, ptr %el, align 8, !tbaa !41
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %11, i64 %mul
  store i32 %rem.i, ptr %arrayidx.i, align 4, !tbaa.struct !49
  ret i32 %rem.i
}

define <2 x i64> @"173"(ptr %0, <2 x i64> %1, <2 x i64> %vector.recur167, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %7) {
bb:
  %wide.load168 = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %8 = and <2 x i64> %wide.load168, %3
  %9 = icmp eq <2 x i64> %8, %5
  %10 = select <2 x i1> %9, <2 x i64> %5, <2 x i64> %6
  %11 = shufflevector <2 x i64> %vector.recur167, <2 x i64> %wide.load168, <2 x i32> <i32 1, i32 2>
  %12 = and <2 x i64> %11, %2
  %13 = and <2 x i64> %wide.load168, %1
  %14 = or <2 x i64> %13, %12
  %15 = lshr exact <2 x i64> %14, %3
  %wide.load169 = load <2 x i64>, ptr %4, align 8, !tbaa !0
  %16 = xor <2 x i64> %15, %wide.load169
  %17 = xor <2 x i64> %16, %10
  store <2 x i64> %17, ptr %7, align 8, !tbaa !0
  ret <2 x i64> %17
}

define ptr @"174"(ptr %el, i64 %sub.ptr.rhs.cast, i64 %0, ptr %end_size_.i) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !41
  %sub.ptr.lhs.cast = ptrtoint ptr %1 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %0
  %.pre = load ptr, ptr %el, align 8, !tbaa !41
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !48
  ret ptr %add.ptr.i
}

define i32 @"175"(ptr %dist) {
bb:
  %0 = load ptr, ptr %dist, align 8, !tbaa !12
  %__first.addr.0.val.i.i = load i32, ptr %0, align 4, !tbaa !6
  ret i32 %__first.addr.0.val.i.i
}

define i64 @"176"(ptr %e.8.sroa_idx, i64 %0, ptr %e, i64 %1, ptr %2, ptr %offsets, i64 %3) {
bb:
  %e.8.e.8.e.8.agg.tmp.sroa.2.0.copyload = load i32, ptr %e.8.sroa_idx, align 8, !tbaa.struct !52
  %retval.sroa.2.0.insert.ext.i = zext i32 %e.8.e.8.e.8.agg.tmp.sroa.2.0.copyload to i64
  %retval.sroa.2.0.insert.shift.i = shl nuw i64 %retval.sroa.2.0.insert.ext.i, %0
  %e.0.e.0.e.0.agg.tmp.sroa.0.0.copyload = load i64, ptr %e, align 8
  %retval.sroa.0.0.insert.ext.i = and i64 %e.0.e.0.e.0.agg.tmp.sroa.0.0.copyload, %1
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i
  %4 = load ptr, ptr %2, align 8, !tbaa !4
  %5 = load ptr, ptr %offsets, align 8, !tbaa !10
  %conv26 = ashr i64 %e.0.e.0.e.0.agg.tmp.sroa.0.0.copyload, %0
  %arrayidx.i44 = getelementptr inbounds i64, ptr %5, i64 %conv26
  %6 = atomicrmw add ptr %arrayidx.i44, i64 %3 seq_cst, align 8
  %arrayidx30 = getelementptr inbounds %struct.NodeWeight, ptr %4, i64 %6
  store i64 %retval.sroa.0.0.insert.insert.i, ptr %arrayidx30, align 4, !tbaa.struct !43
  ret i64 %retval.sroa.0.0.insert.insert.i
}

define i32 @"177"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !41
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add16.1 = add i64 %3, %0
  %add.ptr.epil = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %add16.1
  %e.sroa.5.0.add.ptr.sroa_idx.epil = getelementptr inbounds i8, ptr %add.ptr.epil, i64 %1
  %e.sroa.5.0.copyload.epil = load i32, ptr %e.sroa.5.0.add.ptr.sroa_idx.epil, align 4, !tbaa.struct !43
  ret i32 %e.sroa.5.0.copyload.epil
}

define i32 @"178"(i64 %indvars.iv731, ptr %incdec.ptr4.sink.i.i.i.i, ptr %w.i.i.i.i, i32 %0, ptr %__first.addr.016.i.i, ptr %neighs, ptr %arrayidx.i543, i64 %sub.ptr.rhs.cast.i.i.i.i546, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %arrayidx.i543, align 8, !tbaa !0
  %4 = load ptr, ptr %neighs, align 8, !tbaa !4
  %add.ptr131 = getelementptr inbounds %struct.NodeWeight, ptr %4, i64 %3
  %sub.ptr.lhs.cast.i.i.i.i545 = ptrtoint ptr %add.ptr131 to i64
  %sub.ptr.sub.i.i.i.i547 = sub i64 %sub.ptr.lhs.cast.i.i.i.i545, %sub.ptr.rhs.cast.i.i.i.i546
  %sub.ptr.div.i.i.i.i = lshr exact i64 %sub.ptr.sub.i.i.i.i547, %1
  %shr.i.i = lshr i64 %sub.ptr.div.i.i.i.i, %2
  %incdec.ptr4.sink.i.i.i.i2 = getelementptr inbounds %struct.NodeWeight, ptr %__first.addr.016.i.i, i64 %shr.i.i
  %incdec.ptr.i.i = getelementptr inbounds %struct.NodeWeight, ptr %incdec.ptr4.sink.i.i.i.i, i64 %2
  %5 = load i32, ptr %incdec.ptr4.sink.i.i.i.i, align 4, !tbaa !8
  %6 = zext i32 %5 to i64
  %cmp.i.i10.i.i = icmp eq i64 %indvars.iv731, %6
  %7 = load i32, ptr %w.i.i.i.i, align 4
  %cmp4.i.i.i.i = icmp slt i32 %7, %0
  %8 = sext i32 %5 to i64
  %cmp7.i.i.i.i = icmp sgt i64 %indvars.iv731, %8
  %cond.i.i.i.i = select i1 %cmp.i.i10.i.i, i1 %cmp4.i.i.i.i, i1 %cmp7.i.i.i.i
  %__first.addr.1.i.i = select i1 %cond.i.i.i.i, ptr %incdec.ptr.i.i, ptr %__first.addr.016.i.i
  %9 = load i32, ptr %__first.addr.1.i.i, align 4, !tbaa !8
  ret i32 %9
}

define i64 @"179"(ptr %e.4.sroa_idx, ptr %0, ptr %offsets, ptr %e, i64 %1) {
bb:
  %e.0.e.0.e.0. = load i32, ptr %e, align 8, !tbaa !60
  %conv = sext i32 %e.0.e.0.e.0. to i64
  %2 = load ptr, ptr %offsets, align 8, !tbaa !10
  %arrayidx.i = getelementptr inbounds i64, ptr %2, i64 %conv
  %3 = atomicrmw add ptr %arrayidx.i, i64 %1 seq_cst, align 8
  %4 = load ptr, ptr %0, align 8, !tbaa !4
  %arrayidx = getelementptr inbounds %struct.NodeWeight, ptr %4, i64 %3
  %e.4.e.4.e.4. = load i64, ptr %e.4.sroa_idx, align 4
  store i64 %e.4.e.4.e.4., ptr %arrayidx, align 4
  ret i64 %e.4.e.4.e.4.
}

define i64 @"180"(ptr %offsets, ptr %num_nodes_.i, i32 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !50
  %2 = trunc i64 %1 to i32
  %n197.0700 = add i32 %2, %0
  %3 = zext i32 %n197.0700 to i64
  %4 = load ptr, ptr %offsets, align 8, !tbaa !10
  %arrayidx.i559 = getelementptr inbounds i64, ptr %4, i64 %3
  %5 = load i64, ptr %arrayidx.i559, align 8, !tbaa !0
  ret i64 %5
}

define i64 @"181"(ptr %_M_string_length.i.i.i, i64 %call, ptr %__dnew.i.i.i) {
bb:
  %0 = load i64, ptr %_M_string_length.i.i.i, align 8, !tbaa !53, !noalias !84
  %sub.i.i.i = sub i64 %0, %call
  store i64 %sub.i.i.i, ptr %__dnew.i.i.i, align 8, !tbaa !0, !noalias !84
  ret i64 %sub.i.i.i
}

define i64 @"182"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !10
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !50
  %sext778 = shl i64 %2, %0
  %conv215 = ashr exact i64 %sext778, %0
  %arrayidx.i561 = getelementptr inbounds i64, ptr %1, i64 %conv215
  %3 = load i64, ptr %arrayidx.i561, align 8, !tbaa !0
  ret i64 %3
}

define i64 @"183"(ptr %el, i64 %0, i64 %1) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !41
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr13.i.i.i.i, i64 %1
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.030.i.i, align 4, !tbaa.struct !49
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i64 @"184"(ptr %neighs, ptr %arrayidx.i561, i64 %0, i64 %total_missing_inv.0692, ptr %arrayidx.i555) {
bb:
  %1 = load ptr, ptr %neighs, align 8, !tbaa !4
  %2 = load i32, ptr %arrayidx.i555, align 4, !tbaa !6
  %conv168 = sext i32 %2 to i64
  %add169 = add nsw i64 %total_missing_inv.0692, %conv168
  %3 = load i64, ptr %arrayidx.i561, align 8, !tbaa !0
  %i213.0.1 = add nsw i64 %3, %0
  %sub224.1 = sub nsw i64 %i213.0.1, %add169
  %arrayidx225.1 = getelementptr inbounds %struct.NodeWeight, ptr %1, i64 %sub224.1
  %4 = load i64, ptr %arrayidx225.1, align 4
  ret i64 %4
}

define i64 @"185"(ptr %0, ptr %arrayidx270, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %arrayidx270, align 4
  %sext = shl i64 %3, %1
  %sext669 = add i64 %sext, %2
  %conv284 = ashr exact i64 %sext669, %1
  %arrayidx.i569 = getelementptr inbounds i64, ptr %0, i64 %conv284
  %4 = load i64, ptr %arrayidx.i569, align 8, !tbaa !0
  ret i64 %4
}

define i64 @"186"(ptr %arrayidx225.1, ptr %neighs, ptr %arrayidx.i558, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx225.1, align 4
  %2 = load i64, ptr %arrayidx.i558, align 8, !tbaa !0
  %sub196 = add nsw i64 %2, %0
  %dec227 = add nsw i64 %sub196, %0
  %3 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx226.1 = getelementptr inbounds %struct.NodeWeight, ptr %3, i64 %dec227
  store i64 %1, ptr %arrayidx226.1, align 4
  ret i64 %1
}

define ptr @"187"(ptr %cond.i31.i.i, ptr %_M_finish.i44, ptr %add.ptr.i43, i64 %0, i64 %1, ptr %local_bins, ptr %arrayidx.i36, ptr %__begin1.064, i64 %2, i32 %delta, i64 %3, i32 %4) {
bb:
  %5 = load ptr, ptr %_M_finish.i44, align 8, !tbaa !4
  %sub.ptr.lhs.cast.i.i.i.i = ptrtoint ptr %5 to i64
  %6 = load ptr, ptr %add.ptr.i43, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i.i.i = ptrtoint ptr %6 to i64
  %sub.ptr.sub.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i
  %sub.ptr.div.i.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i.i, %0
  %add.ptr.i.i = getelementptr inbounds i32, ptr %cond.i31.i.i, i64 %sub.ptr.div.i.i.i.i
  %incdec.ptr.i.i = getelementptr inbounds i32, ptr %add.ptr.i.i, i64 %1
  %7 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %8 = load i32, ptr %arrayidx.i36, align 4, !tbaa !6
  %9 = load i64, ptr %__begin1.064, align 4
  %wn.sroa.8.0.extract.shift = lshr i64 %9, %2
  %wn.sroa.8.0.extract.trunc = trunc i64 %wn.sroa.8.0.extract.shift to i32
  %add = add nsw i32 %8, %wn.sroa.8.0.extract.trunc
  %div = sdiv i32 %add, %delta
  %conv10 = sext i32 %div to i64
  %add.ptr.i432 = getelementptr inbounds %"class.std::vector.3", ptr %7, i64 %conv10
  %_M_finish.i444 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i43, i64 %3, i32 1
  store ptr %incdec.ptr.i.i, ptr %_M_finish.i44, align 8, !tbaa !58
  ret ptr %incdec.ptr.i.i
}

define <2 x i32> @"188"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !41
  %incdec.ptr123.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %1 = load <2 x i32>, ptr %incdec.ptr123.i.i, align 4
  ret <2 x i32> %1
}

define i32 @"190"(ptr %n_start.0.in, i64 %0, i64 %1) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  %incdec.ptr12.i.i.i.i = getelementptr inbounds %struct.NodeWeight, ptr %n_start.0, i64 %0
  %__first.addr.031.i.i = getelementptr inbounds %struct.NodeWeight, ptr %incdec.ptr12.i.i.i.i, i64 %1
  %2 = load i32, ptr %__first.addr.031.i.i, align 4, !tbaa !8
  ret i32 %2
}

define <2 x i64> @"191"(ptr %0, <2 x i64> %1, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %7) {
bb:
  %wide.load393 = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %8 = and <2 x i64> %wide.load393, %3
  %9 = icmp eq <2 x i64> %8, %5
  %10 = select <2 x i1> %9, <2 x i64> %5, <2 x i64> %6
  %11 = shufflevector <2 x i64> %wide.load393, <2 x i64> %wide.load393, <2 x i32> <i32 1, i32 2>
  %12 = and <2 x i64> %11, %2
  %13 = and <2 x i64> %wide.load393, %1
  %14 = or <2 x i64> %13, %12
  %15 = lshr exact <2 x i64> %14, %3
  %wide.load394 = load <2 x i64>, ptr %4, align 8, !tbaa !0
  %16 = xor <2 x i64> %15, %wide.load394
  %17 = xor <2 x i64> %16, %10
  store <2 x i64> %17, ptr %7, align 8, !tbaa !0
  ret <2 x i64> %17
}

define i64 @"192"(ptr %__first.addr.07.i.i.i.i.i.i.i.i, ptr %cond.i31.i.i.i.i, ptr %_M_finish.i.i.i, i64 %0, ptr %mq, i64 %1, i64 %2, i64 %3) {
bb:
  %4 = load i64, ptr %__first.addr.07.i.i.i.i.i.i.i.i, align 4, !alias.scope !87, !noalias !90
  %5 = load ptr, ptr %_M_finish.i.i.i, align 8, !tbaa !4
  %6 = ptrtoint ptr %5 to i64
  %7 = add i64 %6, %0
  %8 = load ptr, ptr %mq, align 8, !tbaa !4
  %9 = ptrtoint ptr %8 to i64
  %10 = sub i64 %7, %9
  %11 = lshr i64 %10, %1
  %12 = add nuw nsw i64 %11, %2
  %n.vec = and i64 %12, %3
  %13 = shl i64 %n.vec, %1
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i.i, i64 %13
  store i64 %4, ptr %ind.end, align 4, !alias.scope !90, !noalias !87
  ret i64 %4
}

define i8 @"193"(i8 %0, ptr %ref.tmp, ptr %__dnew.i.i.i) {
bb:
  %1 = load i64, ptr %__dnew.i.i.i, align 8, !tbaa !0, !noalias !79
  %2 = load ptr, ptr %ref.tmp, align 8, !tbaa !30, !alias.scope !79
  %arrayidx.i.i.i.i = getelementptr inbounds i8, ptr %2, i64 %1
  store i8 %0, ptr %arrayidx.i.i.i.i, align 1, !tbaa !26
  ret i8 %0
}

define i64 @"194"(ptr %arrayidx.i554, i64 %total_missing_inv.0692, ptr %offsets, i64 %indvars.iv735) {
bb:
  %0 = load i64, ptr %arrayidx.i554, align 8, !tbaa !0
  %add165 = add nsw i64 %0, %total_missing_inv.0692
  %.pre759.pre = load ptr, ptr %offsets, align 8, !tbaa !10
  %arrayidx.i5542 = getelementptr inbounds i64, ptr %.pre759.pre, i64 %indvars.iv735
  store i64 %add165, ptr %arrayidx.i554, align 8, !tbaa !0
  ret i64 %add165
}

define ptr @"195"(ptr %el, i64 %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !41
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !48
  ret ptr %add.ptr.i
}

define ptr @"196"(ptr %new_range.i.i476, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i495 = load ptr, ptr %new_range.i.i476, align 8, !tbaa !4
  %.pre752 = load ptr, ptr %el, align 8, !tbaa !41
  %.pre776 = ptrtoint ptr %.pre752 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !41
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre776
  %sub.ptr.div14 = sdiv exact i64 %sub.ptr.sub13, %2
  %add.ptr6.i.i497 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i495, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i497, ptr %end_capacity_.i.i.i, align 8, !tbaa !62
  ret ptr %add.ptr6.i.i497
}

define i64 @"197"(ptr %neighs, ptr %arrayidx.i561, i64 %total_missing_inv.0692, ptr %arrayidx.i555, i64 %0) {
bb:
  %1 = load i32, ptr %arrayidx.i555, align 4, !tbaa !6
  %conv168 = sext i32 %1 to i64
  %add169 = add nsw i64 %total_missing_inv.0692, %conv168
  %2 = xor i64 %add169, %0
  %3 = load i64, ptr %arrayidx.i561, align 8, !tbaa !0
  %sub224 = add i64 %3, %2
  %4 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx225 = getelementptr inbounds %struct.NodeWeight, ptr %4, i64 %sub224
  %5 = load i64, ptr %arrayidx225, align 4
  ret i64 %5
}

define i64 @"198"(ptr %cond.i31.i.i.i.i, ptr %_M_finish.i.i.i, i64 %0, ptr %mq, i64 %1, i64 %2, i64 %3, i64 %4) {
bb:
  %5 = load ptr, ptr %_M_finish.i.i.i, align 8, !tbaa !4
  %6 = ptrtoint ptr %5 to i64
  %7 = add i64 %6, %0
  %8 = load ptr, ptr %mq, align 8, !tbaa !4
  %9 = ptrtoint ptr %8 to i64
  %10 = sub i64 %7, %9
  %11 = lshr i64 %10, %1
  %12 = add nuw nsw i64 %11, %2
  %n.vec = and i64 %12, %3
  %13 = shl i64 %n.vec, %1
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i.i, i64 %13
  %incdec.ptr.i.i.i.i = getelementptr %"struct.std::pair", ptr %ind.end, i64 %2
  %add.ptr.i.i.i = getelementptr inbounds %"struct.std::pair", ptr %incdec.ptr.i.i.i.i, i64 %4
  %__value.sroa.0.0.copyload.i.i = load i64, ptr %add.ptr.i.i.i, align 4
  ret i64 %__value.sroa.0.0.copyload.i.i
}

define i64 @"199"(ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !50
  %n.mod.vf = and i64 %3, %0
  %sub.prol = add nuw i64 %n.mod.vf, %1
  %conv34.prol = and i64 %sub.prol, %1
  %arrayidx.i511.prol = getelementptr inbounds i64, ptr %2, i64 %conv34.prol
  %4 = load i64, ptr %arrayidx.i511.prol, align 8, !tbaa !0
  ret i64 %4
}

define i32 @"200"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !41
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add16 = add i64 %2, %0
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %add16
  %e.sroa.0.0.copyload.1 = load i32, ptr %add.ptr.1, align 4, !tbaa.struct !49
  ret i32 %e.sroa.0.0.copyload.1
}

define i64 @"201"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !54
  %inc.i72 = add nuw nsw i64 %1, %0
  %inc.i208 = add nuw nsw i64 %inc.i72, %0
  store i64 %inc.i208, ptr %_M_p.i.i.i, align 8, !tbaa !54
  ret i64 %inc.i208
}

define ptr @"202"(ptr %local_bins, ptr %shared_indexes, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %3 = load i64, ptr %shared_indexes, align 8, !tbaa !0
  %add.ptr.i308 = getelementptr inbounds %"class.std::vector.3", ptr %2, i64 %3
  %_M_finish.i.i309 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i308, i64 %0, i32 1
  %4 = load ptr, ptr %_M_finish.i.i309, align 8, !tbaa !4
  ret ptr %4
}

define <2 x i32> @"203"(ptr %degrees, ptr %.omp.lb, i64 %0, i64 %index, i64 %1) {
bb:
  %2 = load ptr, ptr %degrees, align 8, !tbaa !12
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul12 = shl i64 %3, %0
  %offset.idx = add i64 %mul12, %index
  %4 = getelementptr inbounds i32, ptr %2, i64 %offset.idx
  %5 = getelementptr inbounds i32, ptr %4, i64 %1
  %wide.load41 = load <2 x i32>, ptr %5, align 4, !tbaa !6
  ret <2 x i32> %wide.load41
}

define i32 @"204"(i32 %conv22, ptr %diffs, i64 %indvars.iv) {
bb:
  %0 = load ptr, ptr %diffs, align 8, !tbaa !12
  %arrayidx.i98 = getelementptr inbounds i32, ptr %0, i64 %indvars.iv
  store i32 %conv22, ptr %arrayidx.i98, align 4, !tbaa !6
  ret i32 %conv22
}

define i64 @"205"(ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %__i.018.i, i64 %add.i, i64 %inc.i, ptr %arrayidx7.i.1) {
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

define ptr @"206"(ptr %local_bins, ptr %shared_indexes, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %3 = load i64, ptr %shared_indexes, align 8, !tbaa !0
  %add.ptr.i308 = getelementptr inbounds %"class.std::vector.3", ptr %2, i64 %3
  %_M_finish.i.i309 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i308, i64 %0, i32 1
  %4 = load ptr, ptr %_M_finish.i.i309, align 8, !tbaa !4
  ret ptr %4
}

define i64 @"207"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !41
  %incdec.ptr.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i = load i64, ptr %incdec.ptr.i.i.i.i, align 4, !tbaa.struct !49
  ret i64 %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i
}

define i64 @"208"(ptr %neighs, ptr %arrayidx.i561, i64 %0, i64 %total_missing_inv.0692, ptr %arrayidx.i555) {
bb:
  %1 = load i32, ptr %arrayidx.i555, align 4, !tbaa !6
  %conv168 = sext i32 %1 to i64
  %add169 = add nsw i64 %total_missing_inv.0692, %conv168
  %2 = load i64, ptr %arrayidx.i561, align 8, !tbaa !0
  %i213.0.prol = add nsw i64 %2, %0
  %sub224.prol = sub nsw i64 %i213.0.prol, %add169
  %3 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx225.prol = getelementptr inbounds %struct.NodeWeight, ptr %3, i64 %sub224.prol
  %4 = load i64, ptr %arrayidx225.prol, align 4
  ret i64 %4
}

define ptr @"209"(ptr %local_bins, i64 %0, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %add.ptr.i308 = getelementptr inbounds %"class.std::vector.3", ptr %3, i64 %0
  %_M_finish.i.i309 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i308, i64 %1, i32 1
  %4 = load ptr, ptr %_M_finish.i.i309, align 8, !tbaa !4
  ret ptr %4
}

define i64 @"210"(ptr %arrayidx225.prol, ptr %neighs, i64 %tail_index.1.lcssa, ptr %arrayidx.i560) {
bb:
  %0 = load ptr, ptr %neighs, align 8, !tbaa !4
  %1 = load i32, ptr %arrayidx.i560, align 4, !tbaa !6
  %conv211 = sext i32 %1 to i64
  %sub239 = sub nsw i64 %tail_index.1.lcssa, %conv211
  %arrayidx226.prol = getelementptr inbounds %struct.NodeWeight, ptr %0, i64 %sub239
  %2 = load i64, ptr %arrayidx225.prol, align 4
  store i64 %2, ptr %arrayidx226.prol, align 4
  ret i64 %2
}

define i64 @"211"(ptr %neighs, ptr %arrayidx.i561, i64 %0, i64 %1, i64 %total_missing_inv.0692, ptr %arrayidx.i555) {
bb:
  %2 = load ptr, ptr %neighs, align 8, !tbaa !4
  %3 = load i32, ptr %arrayidx.i555, align 4, !tbaa !6
  %conv168 = sext i32 %3 to i64
  %add169 = add nsw i64 %total_missing_inv.0692, %conv168
  %4 = load i64, ptr %arrayidx.i561, align 8, !tbaa !0
  %i213.0.prol = add nsw i64 %4, %0
  %i213.0.1 = add nsw i64 %i213.0.prol, %1
  %sub224.1 = sub nsw i64 %i213.0.1, %add169
  %arrayidx225.1 = getelementptr inbounds %struct.NodeWeight, ptr %2, i64 %sub224.1
  %5 = load i64, ptr %arrayidx225.1, align 4
  ret i64 %5
}

define i32 @"212"(ptr %neighs, ptr %arrayidx.i567, ptr %arrayidx.i568) {
bb:
  %0 = load i64, ptr %arrayidx.i567, align 8, !tbaa !0
  %1 = load ptr, ptr %neighs, align 8, !tbaa !4
  %add.ptr277 = getelementptr inbounds %struct.NodeWeight, ptr %1, i64 %0
  %2 = load i32, ptr %arrayidx.i568, align 4, !tbaa !6
  %idx.ext = sext i32 %2 to i64
  %add.ptr281 = getelementptr inbounds %struct.NodeWeight, ptr %add.ptr277, i64 %idx.ext
  %3 = load i32, ptr %add.ptr281, align 4, !tbaa !8
  ret i32 %3
}

define ptr @"213"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !41
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %1
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !62
  ret ptr %add.ptr6.i.i
}

define i32 @"214"(ptr %init_val, ptr %this, i64 %.omp.iv.018.prol) {
bb:
  %0 = load i32, ptr %init_val, align 4, !tbaa !6
  %1 = load ptr, ptr %this, align 8, !tbaa !12
  %add.ptr.prol = getelementptr inbounds i32, ptr %1, i64 %.omp.iv.018.prol
  store i32 %0, ptr %add.ptr.prol, align 4, !tbaa !6
  ret i32 %0
}

define i32 @"215"(ptr %__first, ptr %v.i.i, ptr %v3.i.i, ptr %w.i.i.i, ptr %w3.i.i.i, i64 %sub1, i64 %mul, i64 %0) {
bb:
  %1 = load i32, ptr %v3.i.i, align 4, !tbaa !8
  %2 = load i32, ptr %v.i.i, align 4, !tbaa !8
  %cmp.i.i.i = icmp eq i32 %2, %1
  %cmp7.i.i.i = icmp slt i32 %2, %1
  %3 = load i32, ptr %w.i.i.i, align 4
  %4 = load i32, ptr %w3.i.i.i, align 4
  %cmp4.i.i.i = icmp slt i32 %3, %4
  %cond.i.i.i = select i1 %cmp.i.i.i, i1 %cmp4.i.i.i, i1 %cmp7.i.i.i
  %spec.select = select i1 %cond.i.i.i, i64 %sub1, i64 %mul
  %add = shl i64 %spec.select, %0
  %sub12 = or i64 %add, %0
  %add.ptr2 = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %sub1
  %5 = load i32, ptr %add.ptr2, align 4, !tbaa !60
  ret i32 %5
}

define i64 @"216"(ptr %offsets, ptr %arrayidx120, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx120, align 4
  %sext670 = shl i64 %2, %0
  %sext671 = add i64 %sext670, %1
  %conv128 = ashr exact i64 %sext671, %0
  %.pre759.pre772 = load ptr, ptr %offsets, align 8, !tbaa !10
  %arrayidx.i543 = getelementptr inbounds i64, ptr %.pre759.pre772, i64 %conv128
  %3 = load i64, ptr %arrayidx.i543, align 8, !tbaa !0
  ret i64 %3
}

define ptr @"217"(ptr %local_bins, ptr %arrayidx277, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %.pre283 = load i64, ptr %arrayidx277, align 8, !tbaa !0
  %add.ptr.i308 = getelementptr inbounds %"class.std::vector.3", ptr %2, i64 %.pre283
  %_M_finish.i.i309 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i308, i64 %0, i32 1
  %3 = load ptr, ptr %_M_finish.i.i309, align 8, !tbaa !4
  ret ptr %3
}

define ptr @"218"(ptr %local_bins, ptr %arrayidx.i36, ptr %__begin1.064, i64 %0, i32 %delta, i64 %1, ptr %_M_finish.i) {
bb:
  %2 = load i32, ptr %arrayidx.i36, align 4, !tbaa !6
  %3 = load i64, ptr %__begin1.064, align 4
  %wn.sroa.8.0.extract.shift = lshr i64 %3, %0
  %wn.sroa.8.0.extract.trunc = trunc i64 %wn.sroa.8.0.extract.shift to i32
  %add = add nsw i32 %2, %wn.sroa.8.0.extract.trunc
  %div = sdiv i32 %add, %delta
  %conv10 = sext i32 %div to i64
  %add14 = add nsw i64 %conv10, %1
  %4 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %add.ptr.i42 = getelementptr inbounds %"class.std::vector.3", ptr %4, i64 %add14
  store ptr %add.ptr.i42, ptr %_M_finish.i, align 8, !tbaa !72
  ret ptr %add.ptr.i42
}

define i32 @"219"(ptr %dist, ptr %arrayidx.i) {
bb:
  %0 = load i32, ptr %arrayidx.i, align 4, !tbaa !6, !llvm.access.group !71
  %conv = sext i32 %0 to i64
  %1 = load ptr, ptr %dist, align 8, !tbaa !12, !llvm.access.group !71
  %arrayidx.i150 = getelementptr inbounds i32, ptr %1, i64 %conv
  %2 = load i32, ptr %arrayidx.i150, align 4, !tbaa !6, !llvm.access.group !71
  ret i32 %2
}

define ptr @"220"(ptr %neighs, ptr %arrayidx.i, ptr %index, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %arrayidx.i, align 8, !tbaa !0
  %1 = load ptr, ptr %neighs, align 8, !tbaa !4
  %add.ptr = getelementptr inbounds %struct.NodeWeight, ptr %1, i64 %0
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !6
  %3 = sext i32 %2 to i64
  %4 = load ptr, ptr %index, align 8, !tbaa !4
  %arrayidx = getelementptr inbounds ptr, ptr %4, i64 %3
  store ptr %add.ptr, ptr %arrayidx, align 8, !tbaa !4
  ret ptr %add.ptr
}

define i8 @"221"(ptr %arrayidx17.i.i, ptr %ref.tmp, i64 %conv5.i) {
bb:
  %0 = load ptr, ptr %ref.tmp, align 8, !tbaa !30, !alias.scope !92
  %arrayidx.i.i = getelementptr inbounds i8, ptr %0, i64 %conv5.i
  %1 = load i8, ptr %arrayidx17.i.i, align 2, !tbaa !26, !noalias !92
  store i8 %1, ptr %arrayidx.i.i, align 1, !tbaa !26
  ret i8 %1
}

define i64 @"222"(i64 %local_total.039, ptr %arrayidx.i35, ptr %prefix, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i32, ptr %arrayidx.i35, align 4, !tbaa !6
  %conv = sext i32 %1 to i64
  %add19 = add nsw i64 %local_total.039, %conv
  %2 = load ptr, ptr %prefix, align 8
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul14 = shl i64 %3, %0
  %arrayidx.i34 = getelementptr inbounds i64, ptr %2, i64 %mul14
  store i64 %add19, ptr %arrayidx.i34, align 8, !tbaa !0
  ret i64 %add19
}

define i64 @"223"(ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57.3) {
bb:
  %0 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !0
  %1 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !0
  %2 = load i64, ptr %arrayidx.i58, align 8, !tbaa !0
  %add7 = add nsw i64 %2, %total.076
  %add7.1 = add nsw i64 %1, %add7
  %add7.2 = add nsw i64 %0, %add7.1
  store i64 %add7.2, ptr %arrayidx.i57.3, align 8, !tbaa !0
  ret i64 %add7.2
}

define i64 @"224"(ptr %arrayidx.i554, i64 %total_missing_inv.0692, ptr %arrayidx.i555, ptr %offsets, i64 %indvars.iv735) {
bb:
  %0 = load i32, ptr %arrayidx.i555, align 4, !tbaa !6
  %conv168 = sext i32 %0 to i64
  %add169 = add nsw i64 %total_missing_inv.0692, %conv168
  %1 = load i64, ptr %arrayidx.i554, align 8, !tbaa !0
  %add165 = add nsw i64 %1, %add169
  %.pre759.pre = load ptr, ptr %offsets, align 8, !tbaa !10
  %arrayidx.i5542 = getelementptr inbounds i64, ptr %.pre759.pre, i64 %indvars.iv735
  store i64 %add165, ptr %arrayidx.i554, align 8, !tbaa !0
  ret i64 %add165
}

define i64 @"225"(ptr %v.i, i64 %0, ptr %agg.tmp.i.4.sroa_idx) {
bb:
  %1 = load i32, ptr %v.i, align 4, !tbaa !6, !noalias !95
  %agg.tmp6.sroa.0.0.insert.ext.i = zext i32 %1 to i64
  %agg.tmp6.sroa.0.0.insert.insert.i = or i64 %agg.tmp6.sroa.0.0.insert.ext.i, %0
  store i64 %agg.tmp6.sroa.0.0.insert.insert.i, ptr %agg.tmp.i.4.sroa_idx, align 4, !tbaa.struct !43, !noalias !95
  ret i64 %agg.tmp6.sroa.0.0.insert.insert.i
}

define ptr @"226"(ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %0) {
bb:
  %1 = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %2 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !48
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %agg.result, align 8, !tbaa !41
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = sdiv exact i64 %sub.ptr.sub.i12.i.i, %0
  %add.ptr.i.i151 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %sub.ptr.div.i13.i.i
  store ptr %add.ptr.i.i151, ptr %end_size_.i.i, align 8, !tbaa !48
  ret ptr %add.ptr.i.i151
}

define i64 @"227"(ptr %offsets, i64 %indvars.iv741) {
bb:
  %.pre763 = load ptr, ptr %offsets, align 8, !tbaa !10
  %arrayidx.i564 = getelementptr inbounds i64, ptr %.pre763, i64 %indvars.iv741
  %0 = load i64, ptr %arrayidx.i564, align 8, !tbaa !0
  ret i64 %0
}

define i32 @"228"(ptr %incdec.ptr.i.i, ptr %this, i64 %__holeIndex.addr.0.lcssa.i.i.i.i) {
bb:
  %0 = load ptr, ptr %this, align 8, !tbaa !4
  %add.ptr.i27.i.i.i.i = getelementptr inbounds %"struct.std::pair", ptr %0, i64 %__holeIndex.addr.0.lcssa.i.i.i.i
  %__value.sroa.0.0.copyload.i.i = load i64, ptr %incdec.ptr.i.i, align 4
  %__value.sroa.0.0.extract.trunc.i.i.i.i = trunc i64 %__value.sroa.0.0.copyload.i.i to i32
  store i32 %__value.sroa.0.0.extract.trunc.i.i.i.i, ptr %add.ptr.i27.i.i.i.i, align 4, !tbaa !65
  ret i32 %__value.sroa.0.0.extract.trunc.i.i.i.i
}

define i64 @"229"(ptr %_M_p.i, i64 %0, ptr %udist_, i64 %1, i32 %2) {
bb:
  %.pre = load i64, ptr %_M_p.i, align 8, !tbaa !98
  %inc.i = add nuw nsw i64 %.pre, %0
  %3 = load ptr, ptr %udist_, align 8, !tbaa !56
  %_M_p.i2 = getelementptr inbounds %"class.std::mersenne_twister_engine", ptr %3, i64 %1, i32 1
  store i64 %inc.i, ptr %_M_p.i, align 8, !tbaa !98
  ret i64 %inc.i
}

define ptr @"230"(ptr %neighs, ptr %arrayidx.i.1, ptr %index, i64 %indvars.iv.next) {
bb:
  %0 = load ptr, ptr %index, align 8, !tbaa !4
  %arrayidx.1 = getelementptr inbounds ptr, ptr %0, i64 %indvars.iv.next
  %1 = load ptr, ptr %neighs, align 8, !tbaa !4
  %2 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !0
  %add.ptr.1 = getelementptr inbounds %struct.NodeWeight, ptr %1, i64 %2
  store ptr %add.ptr.1, ptr %arrayidx.1, align 8, !tbaa !4
  ret ptr %add.ptr.1
}

define i64 @"231"(ptr %agg.tmp, ptr %end_size_.i.i) {
bb:
  %agg.tmp.0.agg.tmp.0.agg.tmp.0.agg.tmp.coerce.sroa.0.0.copyload = load i64, ptr %agg.tmp, align 8
  %.pre.pre.i = load ptr, ptr %end_size_.i.i, align 8, !tbaa !48
  store i64 %agg.tmp.0.agg.tmp.0.agg.tmp.0.agg.tmp.coerce.sroa.0.0.copyload, ptr %.pre.pre.i, align 4, !tbaa.struct !49
  ret i64 %agg.tmp.0.agg.tmp.0.agg.tmp.0.agg.tmp.coerce.sroa.0.0.copyload
}

define ptr @"232"(ptr %local_bins, ptr %arrayidx.i36, ptr %__begin1.064, i64 %0, i32 %delta, i64 %1) {
bb:
  %2 = load i32, ptr %arrayidx.i36, align 4, !tbaa !6
  %3 = load i64, ptr %__begin1.064, align 4
  %wn.sroa.8.0.extract.shift = lshr i64 %3, %0
  %wn.sroa.8.0.extract.trunc = trunc i64 %wn.sroa.8.0.extract.shift to i32
  %add = add nsw i32 %2, %wn.sroa.8.0.extract.trunc
  %div = sdiv i32 %add, %delta
  %conv10 = sext i32 %div to i64
  %add14 = add nsw i64 %conv10, %1
  %4 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %add.ptr.i42 = getelementptr inbounds %"class.std::vector.3", ptr %4, i64 %add14
  %5 = load ptr, ptr %add.ptr.i42, align 8, !tbaa !46
  ret ptr %5
}

define ptr @"233"(ptr %new_range.i.i, ptr %0, ptr %el, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre752 = load ptr, ptr %el, align 8, !tbaa !41
  %.pre776 = ptrtoint ptr %.pre752 to i64
  %2 = load ptr, ptr %el, align 8, !tbaa !41
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre776
  %sub.ptr.div14 = sdiv exact i64 %sub.ptr.sub13, %1
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr.i483 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div14
  store ptr %add.ptr.i483, ptr %end_size_.i, align 8, !tbaa !48
  ret ptr %add.ptr.i483
}

define i64 @"234"(ptr %0, ptr %it.0718) {
bb:
  %1 = load i32, ptr %it.0718, align 4, !tbaa !8
  %conv77 = sext i32 %1 to i64
  %arrayidx.i535 = getelementptr inbounds i64, ptr %0, i64 %conv77
  %2 = load i64, ptr %arrayidx.i535, align 8, !tbaa !0
  ret i64 %2
}

define ptr @"235"(ptr %el, ptr %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre752 = load ptr, ptr %el, align 8, !tbaa !41
  %.pre776 = ptrtoint ptr %.pre752 to i64
  %2 = load ptr, ptr %el, align 8, !tbaa !41
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre776
  %sub.ptr.div14 = sdiv exact i64 %sub.ptr.sub13, %1
  %.pre = load ptr, ptr %el, align 8, !tbaa !41
  %add.ptr.i483 = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i483, ptr %end_size_.i, align 8, !tbaa !48
  ret ptr %add.ptr.i483
}

define ptr @"236"(ptr %cond.i31.i.i, ptr %local_bins, ptr %arrayidx.i36, ptr %__begin1.064, i64 %0, i32 %delta) {
bb:
  %1 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %2 = load i32, ptr %arrayidx.i36, align 4, !tbaa !6
  %3 = load i64, ptr %__begin1.064, align 4
  %wn.sroa.8.0.extract.shift = lshr i64 %3, %0
  %wn.sroa.8.0.extract.trunc = trunc i64 %wn.sroa.8.0.extract.shift to i32
  %add = add nsw i32 %2, %wn.sroa.8.0.extract.trunc
  %div = sdiv i32 %add, %delta
  %conv10 = sext i32 %div to i64
  %add.ptr.i43 = getelementptr inbounds %"class.std::vector.3", ptr %1, i64 %conv10
  store ptr %cond.i31.i.i, ptr %add.ptr.i43, align 8, !tbaa !46
  ret ptr %cond.i31.i.i
}

define ptr @"237"(ptr %cond.i31.i.i, i64 %.sroa.speculated.i.i.i, ptr %_M_finish.i44, ptr %add.ptr.i43, i64 %0, i64 %sub.ptr.div.i.i.i.i, i1 %cmp9.i.i.i, i64 %1, i64 %add.i.i.i47, ptr %local_bins, ptr %arrayidx.i36, ptr %__begin1.064, i64 %2, i32 %delta, i64 %3, i32 %4) {
bb:
  %5 = load ptr, ptr %_M_finish.i44, align 8, !tbaa !4
  %sub.ptr.lhs.cast.i.i.i.i = ptrtoint ptr %5 to i64
  %6 = load ptr, ptr %add.ptr.i43, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i.i.i = ptrtoint ptr %6 to i64
  %sub.ptr.sub.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i
  %sub.ptr.div.i.i.i.i2 = ashr exact i64 %sub.ptr.sub.i.i.i.i, %0
  %add.i.i.i474 = add i64 %.sroa.speculated.i.i.i, %sub.ptr.div.i.i.i.i
  %cmp7.i.i.i = icmp ult i64 %add.i.i.i47, %sub.ptr.div.i.i.i.i
  %or.cond.i.i.i = or i1 %cmp7.i.i.i, %cmp9.i.i.i
  %cond.i.i.i = select i1 %or.cond.i.i.i, i64 %1, i64 %add.i.i.i47
  %add.ptr19.i.i = getelementptr inbounds i32, ptr %cond.i31.i.i, i64 %cond.i.i.i
  %7 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %8 = load i32, ptr %arrayidx.i36, align 4, !tbaa !6
  %9 = load i64, ptr %__begin1.064, align 4
  %wn.sroa.8.0.extract.shift = lshr i64 %9, %2
  %wn.sroa.8.0.extract.trunc = trunc i64 %wn.sroa.8.0.extract.shift to i32
  %add = add nsw i32 %8, %wn.sroa.8.0.extract.trunc
  %div = sdiv i32 %add, %delta
  %conv10 = sext i32 %div to i64
  %add.ptr.i436 = getelementptr inbounds %"class.std::vector.3", ptr %7, i64 %conv10
  %_M_end_of_storage.i = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i43, i64 %3, i32 2
  store ptr %add.ptr19.i.i, ptr %_M_end_of_storage.i, align 8, !tbaa !100
  ret ptr %add.ptr19.i.i
}

define ptr @"238"(ptr %this, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !15
  %_M_end_of_storage4.i.i.i.i.i.i.i.i.i.i.i = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %2, i64 %0, i32 2
  %3 = load ptr, ptr %_M_end_of_storage4.i.i.i.i.i.i.i.i.i.i.i, align 8, !tbaa !100, !alias.scope !101, !noalias !104
  ret ptr %3
}

define <2 x i64> @"239"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %.omp.lb, i64 %3, i64 %4, i64 %5, <2 x i64> %6, <2 x i64> %7, ptr %8, <2 x i64> %9, <2 x i64> %10, ptr %11) {
bb:
  %wide.load92 = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %12 = and <2 x i64> %wide.load92, %7
  %13 = icmp eq <2 x i64> %12, %9
  %14 = select <2 x i1> %13, <2 x i64> %9, <2 x i64> %10
  %15 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add8 = add i64 %15, %3
  %rem.i.i.i = and i64 %add8, %4
  %vector.recur.init90 = insertelement <2 x i64> %2, i64 %rem.i.i.i, i64 %5
  %16 = shufflevector <2 x i64> %vector.recur.init90, <2 x i64> %wide.load92, <2 x i32> <i32 1, i32 2>
  %17 = and <2 x i64> %16, %6
  %18 = and <2 x i64> %wide.load92, %1
  %19 = or <2 x i64> %18, %17
  %20 = lshr exact <2 x i64> %19, %7
  %wide.load93 = load <2 x i64>, ptr %8, align 8, !tbaa !0
  %21 = xor <2 x i64> %20, %wide.load93
  %22 = xor <2 x i64> %21, %14
  store <2 x i64> %22, ptr %11, align 8, !tbaa !0
  ret <2 x i64> %22
}

define ptr @"240"(ptr %cond.i65, i64 %.sroa.speculated.i, ptr %_M_finish.i, ptr %this, i64 %0, i64 %sub.ptr.div.i, i1 %cmp9.i, i64 %1, i64 %add.i, ptr %_M_end_of_storage) {
bb:
  %2 = load ptr, ptr %_M_finish.i, align 8, !tbaa !72
  %sub.ptr.lhs.cast.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %this, align 8, !tbaa !15
  %sub.ptr.rhs.cast.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i2 = sdiv exact i64 %sub.ptr.sub.i, %0
  %add.i4 = add i64 %.sroa.speculated.i, %sub.ptr.div.i
  %cmp7.i = icmp ult i64 %add.i, %sub.ptr.div.i
  %or.cond.i = or i1 %cmp7.i, %cmp9.i
  %cond.i = select i1 %or.cond.i, i64 %1, i64 %add.i
  %add.ptr40 = getelementptr inbounds %"class.std::vector.3", ptr %cond.i65, i64 %cond.i
  store ptr %add.ptr40, ptr %_M_end_of_storage, align 8, !tbaa !106
  ret ptr %add.ptr40
}

define <2 x i64> @"241"(ptr %0, ptr %offsets, ptr %num_nodes_.i, i64 %1, i64 %index824, i64 %2) {
bb:
  %wide.load = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %3 = load ptr, ptr %offsets, align 8
  %4 = load i64, ptr %num_nodes_.i, align 8, !tbaa !50
  %5 = and i64 %4, %1
  %offset.idx = sub i64 %5, %index824
  %6 = getelementptr inbounds i64, ptr %3, i64 %offset.idx
  %7 = getelementptr inbounds i64, ptr %6, i64 %2
  store <2 x i64> %wide.load, ptr %7, align 8, !tbaa !0
  ret <2 x i64> %wide.load
}

define ptr @"242"(ptr %index, i64 %indvars.iv747) {
bb:
  %0 = load ptr, ptr %index, align 8, !tbaa !4
  %arrayidx66 = getelementptr inbounds ptr, ptr %0, i64 %indvars.iv747
  %1 = load ptr, ptr %arrayidx66, align 8, !tbaa !4
  ret ptr %1
}

define i64 @"243"(ptr %offsets, ptr %arrayidx270, i64 %0, i64 %1) {
bb:
  %.pre763 = load ptr, ptr %offsets, align 8, !tbaa !10
  %2 = load i64, ptr %arrayidx270, align 4
  %sext = shl i64 %2, %0
  %sext669 = add i64 %sext, %1
  %conv284 = ashr exact i64 %sext669, %0
  %arrayidx.i569 = getelementptr inbounds i64, ptr %.pre763, i64 %conv284
  %3 = load i64, ptr %arrayidx.i569, align 8, !tbaa !0
  ret i64 %3
}

define ptr @"244"(ptr %call.i5155, ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, ptr %end_size_.i53) {
bb:
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !14
  %sub.ptr.lhs.cast.i47 = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %degrees, align 8, !tbaa !12
  %sub.ptr.rhs.cast.i48 = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i49 = sub i64 %sub.ptr.lhs.cast.i47, %sub.ptr.rhs.cast.i48
  %sub.ptr.div.i50 = ashr exact i64 %sub.ptr.sub.i49, %0
  %add13 = add nsw i64 %sub.ptr.div.i50, %1
  %add.ptr.i52 = getelementptr inbounds i64, ptr %call.i5155, i64 %add13
  store ptr %add.ptr.i52, ptr %end_size_.i53, align 8, !tbaa !59
  ret ptr %add.ptr.i52
}

define i32 @"245"(ptr %__first, ptr %v.i.i, ptr %v3.i.i, ptr %w.i.i.i, ptr %w3.i.i.i, i64 %sub1, i64 %mul, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %v3.i.i, align 4, !tbaa !8
  %3 = load i32, ptr %v.i.i, align 4, !tbaa !8
  %cmp.i.i.i = icmp eq i32 %3, %2
  %cmp7.i.i.i = icmp slt i32 %3, %2
  %4 = load i32, ptr %w.i.i.i, align 4
  %5 = load i32, ptr %w3.i.i.i, align 4
  %cmp4.i.i.i = icmp slt i32 %4, %5
  %cond.i.i.i = select i1 %cmp.i.i.i, i1 %cmp4.i.i.i, i1 %cmp7.i.i.i
  %spec.select = select i1 %cond.i.i.i, i64 %sub1, i64 %mul
  %add = shl i64 %spec.select, %0
  %mul2 = add i64 %add, %1
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %mul
  %6 = load i32, ptr %add.ptr, align 4, !tbaa !60
  ret i32 %6
}

define i32 @"246"(i32 %__value.coerce1, ptr %__first, ptr %v.i.i, ptr %v3.i.i, ptr %w.i.i.i, ptr %w3.i.i.i, i64 %sub1, i64 %mul, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %v3.i.i, align 4, !tbaa !8
  %3 = load i32, ptr %v.i.i, align 4, !tbaa !8
  %cmp.i.i.i = icmp eq i32 %3, %2
  %cmp7.i.i.i = icmp slt i32 %3, %2
  %4 = load i32, ptr %w.i.i.i, align 4
  %5 = load i32, ptr %w3.i.i.i, align 4
  %cmp4.i.i.i = icmp slt i32 %4, %5
  %cond.i.i.i = select i1 %cmp.i.i.i, i1 %cmp4.i.i.i, i1 %cmp7.i.i.i
  %spec.select = select i1 %cond.i.i.i, i64 %sub1, i64 %mul
  %add10 = shl i64 %spec.select, %0
  %sub12 = or i64 %add10, %0
  %add.ptr5.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %sub12
  %__value.sroa.4.0.add.ptr5.sroa_idx.i = getelementptr inbounds i8, ptr %add.ptr5.i, i64 %1
  store i32 %__value.coerce1, ptr %__value.sroa.4.0.add.ptr5.sroa_idx.i, align 4, !tbaa.struct !52
  ret i32 %__value.coerce1
}

define i64 @"247"(ptr %end_size_, ptr %this, i64 %0, i64 %1, ptr %.omp.ub) {
bb:
  %2 = load ptr, ptr %end_size_, align 8, !tbaa !14
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %this, align 8, !tbaa !12
  %sub.ptr.rhs.cast = ptrtoint ptr %3 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %sub = add nsw i64 %sub.ptr.div, %1
  store i64 %sub, ptr %.omp.ub, align 8, !tbaa !0
  ret i64 %sub
}

define i32 @"248"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i32, ptr %init_val, align 4, !tbaa !6
  %2 = load ptr, ptr %this, align 8, !tbaa !12
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add7 = add i64 %3, %0
  %add.ptr.1 = getelementptr inbounds i32, ptr %2, i64 %add7
  store i32 %1, ptr %add.ptr.1, align 4, !tbaa !6
  ret i32 %1
}

define ptr @"249"(ptr %out_index_.i, ptr %second, i32 %0) {
bb:
  %1 = load i32, ptr %second, align 4, !tbaa !44
  %add.i.i.i = add nsw i32 %1, %0
  %idxprom.i.i.i = sext i32 %add.i.i.i to i64
  %2 = load ptr, ptr %out_index_.i, align 8, !tbaa !107, !noalias !109
  %arrayidx.i.i.i = getelementptr inbounds ptr, ptr %2, i64 %idxprom.i.i.i
  %3 = load ptr, ptr %arrayidx.i.i.i, align 8, !tbaa !4
  ret ptr %3
}

define ptr @"250"(ptr %local_bins, ptr %arrayidx277) {
bb:
  %.pre283 = load i64, ptr %arrayidx277, align 8, !tbaa !0
  %0 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %add.ptr.i173 = getelementptr inbounds %"class.std::vector.3", ptr %0, i64 %.pre283
  %1 = load ptr, ptr %add.ptr.i173, align 8, !tbaa !4
  ret ptr %1
}

define i64 @"251"(ptr %__begin3.0183, i64 %0, ptr %1, ptr %cond.i31.i.i.i.i, ptr %_M_finish.i.i.i, ptr %mq, i64 %2) {
bb:
  %3 = load ptr, ptr %_M_finish.i.i.i, align 8, !tbaa !4
  %sub.ptr.lhs.cast.i.i.i.i.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %mq, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i.i.i.i.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i.i.i.i, %2
  %add.ptr.i.i.i.i = getelementptr inbounds %"struct.std::pair", ptr %cond.i31.i.i.i.i, i64 %sub.ptr.div.i.i.i.i.i.i
  %5 = load i64, ptr %__begin3.0183, align 4
  %wn.sroa.7.0.extract.shift = lshr i64 %5, %0
  %wn.sroa.7.0.extract.trunc = trunc i64 %wn.sroa.7.0.extract.shift to i32
  %6 = load i32, ptr %1, align 4, !tbaa !65
  %add = add nsw i32 %6, %wn.sroa.7.0.extract.trunc
  %retval.sroa.0.0.insert.ext.i136 = zext i32 %add to i64
  %sext = shl i64 %5, %0
  %retval.sroa.0.0.insert.insert.i137 = or i64 %sext, %retval.sroa.0.0.insert.ext.i136
  store i64 %retval.sroa.0.0.insert.insert.i137, ptr %add.ptr.i.i.i.i, align 4
  ret i64 %retval.sroa.0.0.insert.insert.i137
}

define i32 @"252"(ptr %add.ptr.i.i.i, i64 %0, ptr %mq, ptr %_M_finish.i.i.i, i64 %1, i64 %sub.ptr.rhs.cast.i.i.i, i64 %2, i64 %3, i32 %4) {
bb:
  %.pre.i = load ptr, ptr %mq, align 8, !tbaa !4
  %5 = load ptr, ptr %_M_finish.i.i.i, align 8, !tbaa !63
  %incdec.ptr.i.i.i = getelementptr inbounds %"struct.std::pair", ptr %5, i64 %1
  %sub.ptr.lhs.cast.i.i.i = ptrtoint ptr %incdec.ptr.i.i.i to i64
  %sub.ptr.sub.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i, %sub.ptr.rhs.cast.i.i.i
  %sub.ptr.div.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i, %2
  %sub.i.i = add nsw i64 %sub.ptr.div.i.i.i, %3
  %second3.i29.i.i.i = getelementptr inbounds %"struct.std::pair", ptr %.pre.i, i64 %sub.i.i, i32 1
  %__value.sroa.0.0.copyload.i.i = load i64, ptr %add.ptr.i.i.i, align 4
  %__value.sroa.3.0.extract.shift.i.i.i = lshr i64 %__value.sroa.0.0.copyload.i.i, %0
  %__value.sroa.3.0.extract.trunc.i.i.i = trunc i64 %__value.sroa.3.0.extract.shift.i.i.i to i32
  store i32 %__value.sroa.3.0.extract.trunc.i.i.i, ptr %second3.i29.i.i.i, align 4, !tbaa !44
  ret i32 %__value.sroa.3.0.extract.trunc.i.i.i
}

define <2 x i64> @"253"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %rng, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
bb:
  %.pre.i.i86 = load i64, ptr %rng, align 8, !tbaa !0
  %vector.recur.init391 = insertelement <2 x i64> %2, i64 %.pre.i.i86, i64 %3
  %wide.load393 = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %10 = shufflevector <2 x i64> %vector.recur.init391, <2 x i64> %wide.load393, <2 x i32> <i32 1, i32 2>
  %11 = and <2 x i64> %10, %4
  %12 = and <2 x i64> %wide.load393, %1
  %13 = or <2 x i64> %12, %11
  %14 = lshr exact <2 x i64> %13, %5
  %wide.load394 = load <2 x i64>, ptr %6, align 8, !tbaa !0
  %15 = xor <2 x i64> %14, %wide.load394
  %16 = and <2 x i64> %wide.load393, %5
  %17 = icmp eq <2 x i64> %16, %7
  %18 = select <2 x i1> %17, <2 x i64> %7, <2 x i64> %8
  %19 = xor <2 x i64> %15, %18
  store <2 x i64> %19, ptr %9, align 8, !tbaa !0
  ret <2 x i64> %19
}

define <2 x i32> @"254"(ptr %degrees, i64 %offset.idx) {
bb:
  %0 = load ptr, ptr %degrees, align 8, !tbaa !12
  %1 = getelementptr inbounds i32, ptr %0, i64 %offset.idx
  %wide.load = load <2 x i32>, ptr %1, align 4, !tbaa !6
  ret <2 x i32> %wide.load
}

define i64 @"255"(ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57.1) {
bb:
  %0 = load i64, ptr %arrayidx.i58, align 8, !tbaa !0
  %add7 = add nsw i64 %0, %total.076
  store i64 %add7, ptr %arrayidx.i57.1, align 8, !tbaa !0
  ret i64 %add7
}

define i64 @"256"(ptr %arrayidx3.i.i92, i64 %0, ptr %1, i64 %2, i64 %3, ptr %arrayidx7.i.i96, i64 %4, i64 %5, ptr %arrayidx.i.i89) {
bb:
  %6 = load i64, ptr %arrayidx3.i.i92, align 8, !tbaa !0
  %and8.i.i99 = and i64 %6, %2
  %tobool.not.i.i100 = icmp eq i64 %and8.i.i99, %4
  %cond.i.i101 = select i1 %tobool.not.i.i100, i64 %4, i64 %5
  %and4.i.i93 = and i64 %6, %0
  %wide.load393 = load <2 x i64>, ptr %1, align 8, !tbaa !0
  %vector.recur.extract396 = extractelement <2 x i64> %wide.load393, i64 %2
  %and.i.i90 = and i64 %vector.recur.extract396, %3
  %or.i.i94 = or i64 %and4.i.i93, %and.i.i90
  %shr.i.i97 = lshr exact i64 %or.i.i94, %2
  %7 = load i64, ptr %arrayidx7.i.i96, align 8, !tbaa !0
  %xor.i.i98 = xor i64 %shr.i.i97, %7
  %xor9.i.i102 = xor i64 %xor.i.i98, %cond.i.i101
  store i64 %xor9.i.i102, ptr %arrayidx.i.i89, align 8, !tbaa !0
  ret i64 %xor9.i.i102
}

define ptr @"257"(ptr %new_range.i.i476, ptr %0, ptr %el, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre752 = load ptr, ptr %el, align 8, !tbaa !41
  %.pre776 = ptrtoint ptr %.pre752 to i64
  %2 = load ptr, ptr %el, align 8, !tbaa !41
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre776
  %sub.ptr.div14 = sdiv exact i64 %sub.ptr.sub13, %1
  %.pre.i.i495 = load ptr, ptr %new_range.i.i476, align 8, !tbaa !4
  %add.ptr.i483 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i495, i64 %sub.ptr.div14
  store ptr %add.ptr.i483, ptr %end_size_.i, align 8, !tbaa !48
  ret ptr %add.ptr.i483
}

define i64 @"258"(i64 %__value.coerce0, ptr %__first, ptr %v.i.i, ptr %v3.i.i, ptr %w.i.i.i, ptr %w3.i.i.i, i64 %sub1, i64 %mul, i64 %0) {
bb:
  %1 = load i32, ptr %v3.i.i, align 4, !tbaa !8
  %2 = load i32, ptr %v.i.i, align 4, !tbaa !8
  %cmp.i.i.i = icmp eq i32 %2, %1
  %cmp7.i.i.i = icmp slt i32 %2, %1
  %3 = load i32, ptr %w.i.i.i, align 4
  %4 = load i32, ptr %w3.i.i.i, align 4
  %cmp4.i.i.i = icmp slt i32 %3, %4
  %cond.i.i.i = select i1 %cmp.i.i.i, i1 %cmp4.i.i.i, i1 %cmp7.i.i.i
  %spec.select = select i1 %cond.i.i.i, i64 %sub1, i64 %mul
  %add10 = shl i64 %spec.select, %0
  %sub12 = or i64 %add10, %0
  %add.ptr5.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %sub12
  store i64 %__value.coerce0, ptr %add.ptr5.i, align 4, !tbaa.struct !49
  ret i64 %__value.coerce0
}

define i64 @"259"(ptr %offsets, ptr %arrayidx270, i64 %0) {
bb:
  %.pre763 = load ptr, ptr %offsets, align 8, !tbaa !10
  %1 = load i64, ptr %arrayidx270, align 4
  %sext = shl i64 %1, %0
  %conv273 = ashr exact i64 %sext, %0
  %arrayidx.i567 = getelementptr inbounds i64, ptr %.pre763, i64 %conv273
  %2 = load i64, ptr %arrayidx.i567, align 8, !tbaa !0
  ret i64 %2
}

define i32 @"260"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !12
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add.ptr.prol = getelementptr inbounds i32, ptr %2, i64 %ind.end
  %5 = load i32, ptr %init_val, align 4, !tbaa !6
  store i32 %5, ptr %add.ptr.prol, align 4, !tbaa !6
  ret i32 %5
}

define i32 @"261"(ptr %0, ptr %__begin3.0183, i64 %1, ptr %oracle_dist) {
bb:
  %2 = load i64, ptr %__begin3.0183, align 4
  %sext = shl i64 %2, %1
  %conv25 = ashr exact i64 %sext, %1
  %3 = load ptr, ptr %oracle_dist, align 8, !tbaa !12
  %arrayidx.i132 = getelementptr inbounds i32, ptr %3, i64 %conv25
  %wn.sroa.7.0.extract.shift = lshr i64 %2, %1
  %wn.sroa.7.0.extract.trunc = trunc i64 %wn.sroa.7.0.extract.shift to i32
  %4 = load i32, ptr %0, align 4, !tbaa !65
  %add = add nsw i32 %4, %wn.sroa.7.0.extract.trunc
  store i32 %add, ptr %arrayidx.i132, align 4, !tbaa !6
  ret i32 %add
}

define i64 @"262"(ptr %num_nodes_.i, ptr %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !112, !noalias !73
  store i64 %1, ptr %0, align 8, !alias.scope !73
  ret i64 %1
}

define i64 @"263"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !54
  %inc.i72 = add nuw nsw i64 %2, %1
  %arrayidx.i66 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i72
  %3 = load i64, ptr %arrayidx.i66, align 8, !tbaa !0
  ret i64 %3
}

define ptr @"264"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, ptr %.omp.lb) {
bb:
  %1 = load i8, ptr %transpose, align 1, !tbaa !22, !range !24, !noundef !25
  %tobool.not = icmp eq i8 %1, %0
  %2 = load ptr, ptr %in_index_.i, align 8
  %3 = load ptr, ptr %out_index_.i, align 8
  %.pn = select i1 %tobool.not, ptr %3, ptr %2
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !6
  %5 = sext i32 %4 to i64
  %n_start.0.in = getelementptr inbounds ptr, ptr %.pn, i64 %5
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  ret ptr %n_start.0
}

define ptr @"265"(ptr %out_index_.i, ptr %arrayidx.i7, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i, i64 %4, i64 %5, i64 %xor4.i, i64 %6, ptr %mod_.i, i32 %7) {
bb:
  %8 = load i64, ptr %arrayidx.i7, align 8, !tbaa !0
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
  %9 = load i32, ptr %mod_.i, align 4, !tbaa !113
  %rem.i = urem i32 %conv7.i, %9
  %add.i = add nsw i32 %rem.i, %7
  %idxprom.i = sext i32 %add.i to i64
  %10 = load ptr, ptr %out_index_.i, align 8, !tbaa !107
  %arrayidx.i = getelementptr inbounds ptr, ptr %10, i64 %idxprom.i
  %11 = load ptr, ptr %arrayidx.i, align 8, !tbaa !4
  ret ptr %11
}

define i8 @"266"(i8 %storemerge.i.i, ptr %agg.tmp11, ptr %delta_, i32 %0) {
bb:
  %1 = load i32, ptr %delta_, align 4, !tbaa !33
  %__val.lobit.i = lshr i32 %1, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %2 = load ptr, ptr %agg.tmp11, align 8, !tbaa !30, !alias.scope !27
  %arrayidx.i.i = getelementptr inbounds i8, ptr %2, i64 %conv5.i
  store i8 %storemerge.i.i, ptr %arrayidx.i.i, align 1, !tbaa !26
  ret i8 %storemerge.i.i
}

define i64 @"267"(ptr %neighs, ptr %arrayidx.i561, i64 %0, i64 %total_missing_inv.1702) {
bb:
  %1 = load i64, ptr %arrayidx.i561, align 8, !tbaa !0
  %i213.0.prol = add nsw i64 %1, %0
  %sub224.prol = sub nsw i64 %i213.0.prol, %total_missing_inv.1702
  %2 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx225.prol = getelementptr inbounds %struct.NodeWeight, ptr %2, i64 %sub224.prol
  %3 = load i64, ptr %arrayidx225.prol, align 4
  ret i64 %3
}

define i64 @"268"(ptr %arrayidx.i.i, ptr %0, i64 %1, ptr %2) {
bb:
  %3 = load ptr, ptr %0, align 8, !tbaa !4, !noalias !73
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %arrayidx.i.i, align 8, !tbaa !4, !noalias !73
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i = ashr exact i64 %sub.ptr.sub.i.i, %1
  store i64 %sub.ptr.div.i.i, ptr %2, align 8, !alias.scope !73
  ret i64 %sub.ptr.div.i.i
}

define i64 @"269"(ptr %__x, ptr %cond.i31.i.i.i, ptr %_M_finish.i.i, ptr %this, i64 %0) {
bb:
  %1 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !4
  %sub.ptr.lhs.cast.i.i.i.i.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %this, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i.i.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, %0
  %add.ptr.i.i.i = getelementptr inbounds %"struct.std::pair", ptr %cond.i31.i.i.i, i64 %sub.ptr.div.i.i.i.i.i
  %3 = load i64, ptr %__x, align 4
  store i64 %3, ptr %add.ptr.i.i.i, align 4
  ret i64 %3
}

define i64 @"270"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !54
  %inc.i72 = add nuw nsw i64 %2, %1
  %arrayidx.i209 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i72
  %3 = load i64, ptr %arrayidx.i209, align 8, !tbaa !0
  ret i64 %3
}

define i64 @"271"(ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !50
  %n.mod.vf = and i64 %3, %0
  %sub = add nuw i64 %n.mod.vf, %1
  %conv34 = and i64 %sub, %1
  %arrayidx.i511 = getelementptr inbounds i64, ptr %2, i64 %conv34
  %4 = load i64, ptr %arrayidx.i511, align 8, !tbaa !0
  ret i64 %4
}

define ptr @"272"(ptr %new_range.i.i476, ptr %0, ptr %el, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i495 = load ptr, ptr %new_range.i.i476, align 8, !tbaa !4
  %.pre752 = load ptr, ptr %el, align 8, !tbaa !41
  %.pre776 = ptrtoint ptr %.pre752 to i64
  %2 = load ptr, ptr %el, align 8, !tbaa !41
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre776
  %sub.ptr.div14 = sdiv exact i64 %sub.ptr.sub13, %1
  %add.ptr6.i.i497 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i495, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i497, ptr %end_capacity_.i.i.i, align 8, !tbaa !62
  ret ptr %add.ptr6.i.i497
}

define i64 @"273"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %call.i4145, ptr %num_blocks) {
bb:
  %0 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !0
  %1 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !0
  %2 = load i64, ptr %arrayidx.i58, align 8, !tbaa !0
  %add7 = add nsw i64 %2, %total.076
  %add7.1 = add nsw i64 %1, %add7
  %add7.2 = add nsw i64 %0, %add7.1
  %3 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !0
  %add7.3 = add nsw i64 %3, %add7.2
  %4 = load i64, ptr %num_blocks, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds i64, ptr %call.i4145, i64 %4
  store i64 %add7.3, ptr %arrayidx.i, align 8, !tbaa !0
  ret i64 %add7.3
}

define i32 @"274"(ptr %__begin1.064, ptr %_M_finish.i44) {
bb:
  %0 = load ptr, ptr %_M_finish.i44, align 8, !tbaa !4
  %1 = load i64, ptr %__begin1.064, align 4
  %wn.sroa.0.0.extract.trunc = trunc i64 %1 to i32
  store i32 %wn.sroa.0.0.extract.trunc, ptr %0, align 4, !tbaa !6
  ret i32 %wn.sroa.0.0.extract.trunc
}

define i32 @"275"(ptr %arrayidx.i42, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i44, i64 %4, i64 %5, i64 %xor4.i, i64 %6, i64 %xor7.i, i32 %7, i32 %8, ptr %el, ptr %.omp.lb) {
bb:
  %9 = load i64, ptr %arrayidx.i42, align 8, !tbaa !0
  %shr.i43 = lshr i64 %9, %0
  %and.i = and i64 %shr.i43, %1
  %xor.i442 = xor i64 %and.i, %9
  %shl.i = shl i64 %xor.i44, %2
  %and3.i = and i64 %shl.i, %3
  %xor4.i4 = xor i64 %and3.i, %xor.i44
  %shl5.i = shl i64 %xor4.i, %4
  %and6.i = and i64 %shl5.i, %5
  %xor7.i6 = xor i64 %and6.i, %xor4.i
  %shr8.i = lshr i64 %xor7.i, %6
  %xor9.i = xor i64 %shr8.i, %xor7.i
  %conv7.i = trunc i64 %xor9.i to i32
  %rem.i = urem i32 %conv7.i, %7
  %add18 = add nuw nsw i32 %rem.i, %8
  %10 = load ptr, ptr %el, align 8
  %11 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul = shl i64 %11, %6
  %w = getelementptr inbounds %struct.EdgePair, ptr %10, i64 %mul, i32 1, i32 1
  store i32 %add18, ptr %w, align 4, !tbaa !114
  ret i32 %add18
}

define i32 @"276"(ptr %degrees, i64 %mul12, i64 %umin, ptr %.omp.lb, i64 %indvar, i64 %0, i64 %n.mod.vf) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %2 = add i64 %1, %indvar
  %3 = shl i64 %2, %0
  %4 = sub i64 %umin, %3
  %n.vec = sub i64 %4, %n.mod.vf
  %ind.end = add i64 %mul12, %n.vec
  %5 = load ptr, ptr %degrees, align 8, !tbaa !12
  %arrayidx.i31 = getelementptr inbounds i32, ptr %5, i64 %ind.end
  %6 = load i32, ptr %arrayidx.i31, align 4, !tbaa !6
  ret i32 %6
}

define i64 @"277"(ptr %end_size_.i, ptr %this, i64 %0, i64 %1, ptr %.omp.ub) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !41
  %sub.ptr.rhs.cast.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !48
  %sub.ptr.lhs.cast.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = sdiv exact i64 %sub.ptr.sub.i, %0
  %sub2 = add nsw i64 %sub.ptr.div.i, %1
  store i64 %sub2, ptr %.omp.ub, align 8, !tbaa !0
  ret i64 %sub2
}

define i64 @"278"(ptr %el) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !41
  %agg.tmp.sroa.0.0.copyload.i.i.i.i.i = load i64, ptr %.pre, align 4, !tbaa.struct !49
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i.i.i
}

define i64 @"279"(ptr %__first.addr.034.i.i, ptr %__result.033.i.i) {
bb:
  %0 = load i64, ptr %__first.addr.034.i.i, align 4
  store i64 %0, ptr %__result.033.i.i, align 4
  ret i64 %0
}

define ptr @"280"(ptr %call.i16, ptr %num_edges_.i, ptr %g, i8 %0, ptr %end_size_.i) {
bb:
  %1 = load i8, ptr %g, align 8, !tbaa !115, !range !24, !noundef !25
  %tobool.not.i = icmp eq i8 %1, %0
  %mul.i = zext i1 %tobool.not.i to i64
  %2 = load i64, ptr %num_edges_.i, align 8
  %cond.i = shl nsw i64 %2, %mul.i
  %add.ptr.i = getelementptr inbounds i32, ptr %call.i16, i64 %cond.i
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !14
  ret ptr %add.ptr.i
}

define i64 @"281"(ptr %_M_finish.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %_M_finish.i.i.i, align 8, !tbaa !63
  %incdec.ptr.i.i.i = getelementptr inbounds %"struct.std::pair", ptr %2, i64 %0
  %add.ptr.i.i.i = getelementptr inbounds %"struct.std::pair", ptr %incdec.ptr.i.i.i, i64 %1
  %__value.sroa.0.0.copyload.i.i = load i64, ptr %add.ptr.i.i.i, align 4
  ret i64 %__value.sroa.0.0.copyload.i.i
}

define i64 @"282"(ptr %v79, i32 %0, i64 %1, ptr %agg.tmp93.4.sroa_idx) {
bb:
  %2 = load i32, ptr %v79, align 4, !tbaa !6
  %sub95 = add nsw i32 %2, %0
  %agg.tmp94.sroa.0.0.insert.ext = zext i32 %sub95 to i64
  %agg.tmp94.sroa.0.0.insert.insert = or i64 %agg.tmp94.sroa.0.0.insert.ext, %1
  store i64 %agg.tmp94.sroa.0.0.insert.insert, ptr %agg.tmp93.4.sroa_idx, align 4, !tbaa.struct !43
  ret i64 %agg.tmp94.sroa.0.0.insert.insert
}

define i32 @"283"(ptr %neighs, ptr %arrayidx.i542, ptr %arrayidx.i543, i64 %sub.ptr.rhs.cast.i.i.i.i546, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i543, align 8, !tbaa !0
  %3 = load ptr, ptr %neighs, align 8, !tbaa !4
  %add.ptr131 = getelementptr inbounds %struct.NodeWeight, ptr %3, i64 %2
  %sub.ptr.lhs.cast.i.i.i.i545 = ptrtoint ptr %add.ptr131 to i64
  %sub.ptr.sub.i.i.i.i547 = sub i64 %sub.ptr.lhs.cast.i.i.i.i545, %sub.ptr.rhs.cast.i.i.i.i546
  %sub.ptr.div.i.i.i.i = lshr exact i64 %sub.ptr.sub.i.i.i.i547, %0
  %shr.i.i = lshr i64 %sub.ptr.div.i.i.i.i, %1
  %4 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  %add.ptr = getelementptr inbounds %struct.NodeWeight, ptr %3, i64 %4
  %incdec.ptr4.sink.i.i.i.i = getelementptr inbounds %struct.NodeWeight, ptr %add.ptr, i64 %shr.i.i
  %5 = load i32, ptr %incdec.ptr4.sink.i.i.i.i, align 4, !tbaa !8
  ret i32 %5
}

define ptr @"284"(ptr %new_range.i.i, ptr %el, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !41
  %sub.ptr.lhs.cast = ptrtoint ptr %1 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %1 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %0
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !62
  ret ptr %add.ptr6.i.i
}

define <2 x i64> @"285"(ptr %0, <2 x i64> %1, <2 x i64> %vector.recur17, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %udist_, i64 %7, i64 %index15) {
bb:
  %8 = load ptr, ptr %udist_, align 8, !tbaa !56
  %9 = getelementptr inbounds [312 x i64], ptr %8, i64 %7, i64 %index15
  %wide.load19 = load <2 x i64>, ptr %4, align 8, !tbaa !0
  %wide.load18 = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %10 = and <2 x i64> %wide.load18, %1
  %11 = shufflevector <2 x i64> %vector.recur17, <2 x i64> %wide.load18, <2 x i32> <i32 1, i32 2>
  %12 = and <2 x i64> %11, %2
  %13 = or <2 x i64> %10, %12
  %14 = lshr exact <2 x i64> %13, %3
  %15 = xor <2 x i64> %14, %wide.load19
  %16 = and <2 x i64> %wide.load18, %3
  %17 = icmp eq <2 x i64> %16, %5
  %18 = select <2 x i1> %17, <2 x i64> %5, <2 x i64> %6
  %19 = xor <2 x i64> %15, %18
  store <2 x i64> %19, ptr %9, align 8, !tbaa !0
  ret <2 x i64> %19
}

define i64 @"286"(ptr %rng, i64 %0, ptr %arrayidx42.i.i125, i64 %1, i64 %2, ptr %arrayidx49.i.i129, i64 %3, i64 %4) {
bb:
  %5 = load i64, ptr %rng, align 8, !tbaa !0
  %and52.i.i132 = and i64 %5, %2
  %tobool53.not.i.i133 = icmp eq i64 %and52.i.i132, %3
  %cond54.i.i134 = select i1 %tobool53.not.i.i133, i64 %3, i64 %4
  %6 = load i64, ptr %arrayidx49.i.i129, align 8, !tbaa !0
  %7 = load i64, ptr %arrayidx42.i.i125, align 8, !tbaa !0
  %and43.i.i126 = and i64 %7, %1
  %and46.i.i127 = and i64 %5, %0
  %or47.i.i128 = or i64 %and46.i.i127, %and43.i.i126
  %shr50.i.i130 = lshr exact i64 %or47.i.i128, %2
  %xor51.i.i131 = xor i64 %shr50.i.i130, %6
  %xor55.i.i135 = xor i64 %xor51.i.i131, %cond54.i.i134
  store i64 %xor55.i.i135, ptr %arrayidx42.i.i125, align 8, !tbaa !0
  ret i64 %xor55.i.i135
}

define i64 @"287"(i64 %0, ptr %offsets, ptr %num_nodes_.i, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !50
  %n.mod.vf = and i64 %3, %1
  %arrayidx.i512781 = getelementptr inbounds i64, ptr %2, i64 %n.mod.vf
  store i64 %0, ptr %arrayidx.i512781, align 8, !tbaa !0
  ret i64 %0
}

define ptr @"288"(ptr %add.ptr.i312, ptr %local_bins, ptr %arrayidx277, i64 %0, i32 %1) {
bb:
  %.pre283 = load i64, ptr %arrayidx277, align 8, !tbaa !0
  %2 = load ptr, ptr %local_bins, align 8, !tbaa !15
  %add.ptr.i308 = getelementptr inbounds %"class.std::vector.3", ptr %2, i64 %.pre283
  %_M_finish.i.i309 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i308, i64 %0, i32 1
  %.pre285 = load ptr, ptr %add.ptr.i312, align 8, !tbaa !46
  store ptr %.pre285, ptr %_M_finish.i.i309, align 8, !tbaa !58
  ret ptr %.pre285
}

define <2 x i64> @"289"(ptr %__first, <2 x i64> %0) {
bb:
  %1 = load <2 x i64>, ptr %__first, align 4
  %2 = shufflevector <2 x i64> %1, <2 x i64> %0, <2 x i32> <i32 1, i32 0>
  store <2 x i64> %2, ptr %__first, align 4
  ret <2 x i64> %2
}

define ptr @"290"(ptr %call.i145146, ptr %num_nodes, i64 %0, ptr %end_size_.i) {
bb:
  %1 = load i64, ptr %num_nodes, align 8, !tbaa !0
  %add = add nsw i64 %1, %0
  %add.ptr.i = getelementptr inbounds i64, ptr %call.i145146, i64 %add
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !59
  ret ptr %add.ptr.i
}

define i64 @"291"(ptr %offsets, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !6
  %1 = sext i32 %0 to i64
  %2 = load ptr, ptr %offsets, align 8, !tbaa !10
  %arrayidx.i = getelementptr inbounds i64, ptr %2, i64 %1
  %3 = load i64, ptr %arrayidx.i, align 8, !tbaa !0
  ret i64 %3
}

define i32 @"292"(ptr %__begin1.064, ptr %cond.i31.i.i, ptr %_M_finish.i44, ptr %add.ptr.i43, i64 %0) {
bb:
  %1 = load ptr, ptr %_M_finish.i44, align 8, !tbaa !4
  %sub.ptr.lhs.cast.i.i.i.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %add.ptr.i43, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i
  %sub.ptr.div.i.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i.i, %0
  %add.ptr.i.i = getelementptr inbounds i32, ptr %cond.i31.i.i, i64 %sub.ptr.div.i.i.i.i
  %3 = load i64, ptr %__begin1.064, align 4
  %wn.sroa.0.0.extract.trunc = trunc i64 %3 to i32
  store i32 %wn.sroa.0.0.extract.trunc, ptr %add.ptr.i.i, align 4, !tbaa !6
  ret i32 %wn.sroa.0.0.extract.trunc
}

define <2 x i64> @"293"(ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %index824, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !50
  %3 = and i64 %2, %0
  %offset.idx = sub i64 %3, %index824
  %4 = add nuw i64 %offset.idx, %0
  %5 = and i64 %4, %0
  %6 = load ptr, ptr %offsets, align 8
  %7 = getelementptr inbounds i64, ptr %6, i64 %5
  %8 = getelementptr inbounds i64, ptr %7, i64 %1
  %wide.load = load <2 x i64>, ptr %8, align 8, !tbaa !0
  ret <2 x i64> %wide.load
}

define i32 @"294"(ptr %arrayidx.i.i.i60, ptr %n_start.0.in, i64 %0, ptr %diffs, ptr %.omp.lb) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !6
  %2 = sext i32 %1 to i64
  %3 = load ptr, ptr %diffs, align 8, !tbaa !12
  %arrayidx.i98 = getelementptr inbounds i32, ptr %3, i64 %2
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !4
  %sub.ptr.lhs.cast = ptrtoint ptr %n_end.0 to i64
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  %.pre133 = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %.pre133
  %4 = lshr exact i64 %sub.ptr.sub, %0
  %conv22 = trunc i64 %4 to i32
  store i32 %conv22, ptr %arrayidx.i98, align 4, !tbaa !6
  ret i32 %conv22
}

define ptr @"295"(ptr %out_index_.i, ptr %arrayidx.i7, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i, i64 %4, i64 %5, i64 %xor4.i, i64 %6, ptr %mod_.i) {
bb:
  %7 = load i64, ptr %arrayidx.i7, align 8, !tbaa !0
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
  %8 = load i32, ptr %mod_.i, align 4, !tbaa !113
  %rem.i = urem i32 %conv7.i, %8
  %idxprom3.i = sext i32 %rem.i to i64
  %9 = load ptr, ptr %out_index_.i, align 8, !tbaa !107
  %arrayidx4.i = getelementptr inbounds ptr, ptr %9, i64 %idxprom3.i
  %10 = load ptr, ptr %arrayidx4.i, align 8, !tbaa !4
  ret ptr %10
}

define i32 @"296"(ptr %add.ptr.i.i.i, i64 %0, ptr %mq, ptr %cond.i31.i.i.i.i, ptr %_M_finish.i.i.i, i64 %1, i64 %2, i64 %3, i64 %4, i64 %sub.ptr.rhs.cast.i.i.i, i64 %5, i32 %6) {
bb:
  %__value.sroa.0.0.copyload.i.i = load i64, ptr %add.ptr.i.i.i, align 4
  %__value.sroa.3.0.extract.shift.i.i.i = lshr i64 %__value.sroa.0.0.copyload.i.i, %0
  %__value.sroa.3.0.extract.trunc.i.i.i = trunc i64 %__value.sroa.3.0.extract.shift.i.i.i to i32
  %.pre.i = load ptr, ptr %mq, align 8, !tbaa !4
  %7 = load ptr, ptr %_M_finish.i.i.i, align 8, !tbaa !4
  %8 = ptrtoint ptr %7 to i64
  %9 = add i64 %8, %1
  %10 = load ptr, ptr %mq, align 8, !tbaa !4
  %11 = ptrtoint ptr %10 to i64
  %12 = sub i64 %9, %11
  %13 = lshr i64 %12, %2
  %14 = add nuw nsw i64 %13, %3
  %n.vec = and i64 %14, %4
  %15 = shl i64 %n.vec, %2
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i.i, i64 %15
  %incdec.ptr.i.i.i.i = getelementptr %"struct.std::pair", ptr %ind.end, i64 %3
  %sub.ptr.lhs.cast.i.i.i = ptrtoint ptr %incdec.ptr.i.i.i.i to i64
  %sub.ptr.sub.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i, %sub.ptr.rhs.cast.i.i.i
  %sub.ptr.div.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i, %2
  %sub.i.i = add nsw i64 %sub.ptr.div.i.i.i, %5
  %second3.i29.i.i.i = getelementptr inbounds %"struct.std::pair", ptr %.pre.i, i64 %sub.i.i, i32 1
  store i32 %__value.sroa.3.0.extract.trunc.i.i.i, ptr %second3.i29.i.i.i, align 4, !tbaa !44
  ret i32 %__value.sroa.3.0.extract.trunc.i.i.i
}

define i64 @"297"(ptr %arrayidx.i552, i64 %total_missing_inv.0692, ptr %arrayidx.i555, ptr %offsets, ptr %num_nodes_.i) {
bb:
  %0 = load i32, ptr %arrayidx.i555, align 4, !tbaa !6
  %conv168 = sext i32 %0 to i64
  %add169 = add nsw i64 %total_missing_inv.0692, %conv168
  %1 = load i64, ptr %arrayidx.i552, align 8, !tbaa !0
  %add178 = add nsw i64 %1, %add169
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !50
  %.pre759.pre772 = load ptr, ptr %offsets, align 8, !tbaa !10
  %arrayidx.i5522 = getelementptr inbounds i64, ptr %.pre759.pre772, i64 %2
  store i64 %add178, ptr %arrayidx.i552, align 8, !tbaa !0
  ret i64 %add178
}

define ptr @"298"(ptr %new_range.i.i, ptr %el, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !41
  %sub.ptr.lhs.cast = ptrtoint ptr %1 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !41
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %0
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !62
  ret ptr %add.ptr6.i.i
}

define i32 @"299"(ptr %__first, ptr %v.i.i, ptr %v3.i.i, ptr %w.i.i.i, ptr %w3.i.i.i, i64 %sub1, i64 %mul, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i32, ptr %v3.i.i, align 4, !tbaa !8
  %4 = load i32, ptr %v.i.i, align 4, !tbaa !8
  %cmp.i.i.i = icmp eq i32 %4, %3
  %cmp7.i.i.i = icmp slt i32 %4, %3
  %5 = load i32, ptr %w.i.i.i, align 4
  %6 = load i32, ptr %w3.i.i.i, align 4
  %cmp4.i.i.i = icmp slt i32 %5, %6
  %cond.i.i.i = select i1 %cmp.i.i.i, i1 %cmp4.i.i.i, i1 %cmp7.i.i.i
  %spec.select = select i1 %cond.i.i.i, i64 %sub1, i64 %mul
  %add10 = shl i64 %spec.select, %0
  %sub12 = or i64 %add10, %0
  %__parent.019.in.i = add nsw i64 %sub12, %1
  %__parent.019.i = sdiv i64 %__parent.019.in.i, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %__parent.019.i
  %7 = load i32, ptr %add.ptr.i, align 4, !tbaa !60
  ret i32 %7
}

define i64 @"300"(ptr %_M_b.i, ptr %__param, i64 %0, ptr %_M_b.i32) {
bb:
  %1 = load i64, ptr %__param, align 8, !tbaa !116
  %2 = load i64, ptr %_M_b.i, align 8, !tbaa !118
  %sub = sub i64 %2, %1
  %div31 = lshr i64 %sub, %0
  store i64 %div31, ptr %_M_b.i32, align 8, !tbaa !118
  ret i64 %div31
}

define ptr @"301"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, i64 %1) {
bb:
  %2 = load ptr, ptr %out_index_.i, align 8
  %3 = load ptr, ptr %in_index_.i, align 8
  %4 = load i8, ptr %transpose, align 1, !tbaa !22, !range !24, !noundef !25
  %tobool.not = icmp eq i8 %4, %0
  %.sink = select i1 %tobool.not, ptr %2, ptr %3
  %arrayidx.i.i.i60 = getelementptr inbounds ptr, ptr %.sink, i64 %1
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !4
  ret ptr %n_end.0
}

define i64 @"302"(ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %w.i.i.i.i.i, ptr %w3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !8
  %1 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !8
  %cmp7.i.i.i.i.i = icmp slt i32 %0, %1
  %cmp.i.i.i.i.i = icmp eq i32 %0, %1
  %2 = load i32, ptr %w.i.i.i.i.i, align 4
  %3 = load i32, ptr %w3.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %2, %3
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr3.i.i.i = getelementptr inbounds %struct.NodeWeight, ptr %__first, i64 %spec.select.i.i.i
  %4 = load i64, ptr %add.ptr3.i.i.i, align 4
  ret i64 %4
}

define i64 @"303"(ptr %add.ptr3.i.i.i, ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %w.i.i.i.i.i, ptr %w3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i64, ptr %add.ptr3.i.i.i, align 4
  %1 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !8
  %2 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !8
  %cmp7.i.i.i.i.i = icmp slt i32 %1, %2
  %cmp.i.i.i.i.i = icmp eq i32 %1, %2
  %3 = load i32, ptr %w.i.i.i.i.i, align 4
  %4 = load i32, ptr %w3.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %3, %4
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr4.i.i.i = getelementptr inbounds %struct.NodeWeight, ptr %__first, i64 %spec.select.i.i.i
  store i64 %0, ptr %add.ptr4.i.i.i, align 4
  ret i64 %0
}

define i64 @"304"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57.epil) {
bb:
  %0 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !0
  %1 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !0
  %2 = load i64, ptr %arrayidx.i58, align 8, !tbaa !0
  %add7 = add nsw i64 %2, %total.076
  %add7.1 = add nsw i64 %1, %add7
  %add7.2 = add nsw i64 %0, %add7.1
  %3 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !0
  %add7.3 = add nsw i64 %3, %add7.2
  store i64 %add7.3, ptr %arrayidx.i57.epil, align 8, !tbaa !0
  ret i64 %add7.3
}

define i8 @"305"(ptr %arrayidx.i17.i, ptr %ref.tmp, i64 %conv5.i, i64 %idxprom1.i.i) {
bb:
  %0 = load ptr, ptr %ref.tmp, align 8, !tbaa !30, !alias.scope !92
  %arrayidx.i.i = getelementptr inbounds i8, ptr %0, i64 %conv5.i
  %arrayidx2.i.i = getelementptr inbounds i8, ptr %arrayidx.i.i, i64 %idxprom1.i.i
  %1 = load i8, ptr %arrayidx.i17.i, align 1, !tbaa !26, !noalias !92
  store i8 %1, ptr %arrayidx2.i.i, align 1, !tbaa !26
  ret i8 %1
}

define i64 @"306"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !41
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i78.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !49
  ret i64 %agg.tmp.sroa.0.0.copyload.i78.i.i.i.i
}

define i64 @"307"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !54
  %inc.i72 = add nuw nsw i64 %1, %0
  store i64 %inc.i72, ptr %_M_p.i.i.i, align 8, !tbaa !54
  ret i64 %inc.i72
}

define i32 @"309"(ptr %num_nodes_.i.i, i32 %0, i64 %1, i64 %2, i32 %3, i32 %conv14.i.i, ptr %4) {
bb:
  %5 = load i64, ptr %num_nodes_.i.i, align 8, !tbaa !112
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

define ptr @"310"(ptr %new_range.i.i, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre752 = load ptr, ptr %el, align 8, !tbaa !41
  %.pre776 = ptrtoint ptr %.pre752 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !41
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre776
  %sub.ptr.div14 = sdiv exact i64 %sub.ptr.sub13, %2
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr.i483 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div14
  store ptr %add.ptr.i483, ptr %end_size_.i, align 8, !tbaa !48
  ret ptr %add.ptr.i483
}

!0 = !{!1, !1, i64 0}
!1 = !{!"long", !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C++ TBAA"}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !2, i64 0}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !2, i64 0}
!8 = !{!9, !7, i64 0}
!9 = !{!"_ZTS10NodeWeightIiiE", !7, i64 0, !7, i64 4}
!10 = !{!11, !5, i64 0}
!11 = !{!"_ZTS7pvectorIlE", !5, i64 0, !5, i64 8, !5, i64 16}
!12 = !{!13, !5, i64 0}
!13 = !{!"_ZTS7pvectorIiE", !5, i64 0, !5, i64 8, !5, i64 16}
!14 = !{!13, !5, i64 8}
!15 = !{!16, !5, i64 0}
!16 = !{!"_ZTSNSt12_Vector_baseISt6vectorIiSaIiEESaIS2_EE17_Vector_impl_dataE", !5, i64 0, !5, i64 8, !5, i64 16}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = !{!23, !23, i64 0}
!23 = !{!"bool", !2, i64 0}
!24 = !{i8 0, i8 2}
!25 = !{}
!26 = !{!2, !2, i64 0}
!27 = !{!28}
!28 = distinct !{!28, !29, !"_ZNSt7__cxx119to_stringEi: %agg.result"}
!29 = distinct !{!29, !"_ZNSt7__cxx119to_stringEi"}
!30 = !{!31, !5, i64 0}
!31 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !32, i64 0, !1, i64 8, !2, i64 16}
!32 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !5, i64 0}
!33 = !{!34, !7, i64 172}
!34 = !{!"_ZTS7CLDeltaIiE", !35, i64 0, !7, i64 172}
!35 = !{!"_ZTS5CLApp", !36, i64 0, !23, i64 155, !7, i64 156, !1, i64 160, !23, i64 168, !23, i64 169}
!36 = !{!"_ZTS6CLBase", !7, i64 8, !5, i64 16, !31, i64 24, !31, i64 56, !37, i64 88, !7, i64 112, !7, i64 116, !31, i64 120, !23, i64 152, !23, i64 153, !23, i64 154}
!37 = !{!"_ZTSSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !38, i64 0}
!38 = !{!"_ZTSSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !39, i64 0}
!39 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implE", !40, i64 0}
!40 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_Vector_impl_dataE", !5, i64 0, !5, i64 8, !5, i64 16}
!41 = !{!42, !5, i64 0}
!42 = !{!"_ZTS7pvectorI8EdgePairIi10NodeWeightIiiEEE", !5, i64 0, !5, i64 8, !5, i64 16}
!43 = !{i64 0, i64 4, !6, i64 4, i64 4, !6}
!44 = !{!45, !7, i64 4}
!45 = !{!"_ZTSSt4pairIiiE", !7, i64 0, !7, i64 4}
!46 = !{!47, !5, i64 0}
!47 = !{!"_ZTSNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataE", !5, i64 0, !5, i64 8, !5, i64 16}
!48 = !{!42, !5, i64 8}
!49 = !{i64 0, i64 4, !6, i64 4, i64 4, !6, i64 8, i64 4, !6}
!50 = !{!51, !1, i64 16}
!51 = !{!"_ZTS11BuilderBaseIi10NodeWeightIiiEiLb1EE", !5, i64 0, !23, i64 8, !23, i64 9, !23, i64 10, !1, i64 16}
!52 = !{i64 0, i64 4, !6}
!53 = !{!31, !1, i64 8}
!54 = !{!55, !1, i64 4992}
!55 = !{!"_ZTSSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE", !2, i64 0, !1, i64 4992}
!56 = !{!57, !5, i64 0}
!57 = !{!"_ZTS7UniDistIiSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEjE", !5, i64 0, !23, i64 8, !7, i64 12, !7, i64 16}
!58 = !{!47, !5, i64 8}
!59 = !{!11, !5, i64 8}
!60 = !{!61, !7, i64 0}
!61 = !{!"_ZTS8EdgePairIi10NodeWeightIiiEE", !7, i64 0, !9, i64 4}
!62 = !{!42, !5, i64 16}
!63 = !{!64, !5, i64 8}
!64 = !{!"_ZTSNSt12_Vector_baseISt4pairIiiESaIS1_EE17_Vector_impl_dataE", !5, i64 0, !5, i64 8, !5, i64 16}
!65 = !{!45, !7, i64 0}
!66 = !{!67}
!67 = distinct !{!67, !68, !"_ZSt19__relocate_object_aINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_SaIS5_EEvPT_PT0_RT1_: %__orig"}
!68 = distinct !{!68, !"_ZSt19__relocate_object_aINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_SaIS5_EEvPT_PT0_RT1_"}
!69 = !{!70}
!70 = distinct !{!70, !68, !"_ZSt19__relocate_object_aINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_SaIS5_EEvPT_PT0_RT1_: %__dest"}
!71 = distinct !{}
!72 = !{!16, !5, i64 8}
!73 = !{!74}
!74 = distinct !{!74, !75, !"_ZN11BuilderBaseIi10NodeWeightIiiEiLb1EE11SquishGraphERK8CSRGraphIiS1_Lb1EE: %agg.result"}
!75 = distinct !{!75, !"_ZN11BuilderBaseIi10NodeWeightIiiEiLb1EE11SquishGraphERK8CSRGraphIiS1_Lb1EE"}
!76 = !{!77, !1, i64 8}
!77 = !{!"_ZTS9GeneratorIi10NodeWeightIiiEijLi32ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEE", !7, i64 0, !1, i64 8, !1, i64 16}
!78 = !{!64, !5, i64 16}
!79 = !{!80}
!80 = distinct !{!80, !81, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_: %agg.result"}
!81 = distinct !{!81, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_"}
!82 = !{!77, !1, i64 16}
!83 = !{!9, !7, i64 4}
!84 = !{!85}
!85 = distinct !{!85, !86, !"_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm: %agg.result"}
!86 = distinct !{!86, !"_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm"}
!87 = !{!88}
!88 = distinct !{!88, !89, !"_ZSt19__relocate_object_aISt4pairIiiES1_SaIS1_EEvPT_PT0_RT1_: %__orig"}
!89 = distinct !{!89, !"_ZSt19__relocate_object_aISt4pairIiiES1_SaIS1_EEvPT_PT0_RT1_"}
!90 = !{!91}
!91 = distinct !{!91, !89, !"_ZSt19__relocate_object_aISt4pairIiiES1_SaIS1_EEvPT_PT0_RT1_: %__dest"}
!92 = !{!93}
!93 = distinct !{!93, !94, !"_ZNSt7__cxx119to_stringEi: %agg.result"}
!94 = distinct !{!94, !"_ZNSt7__cxx119to_stringEi"}
!95 = !{!96}
!96 = distinct !{!96, !97, !"_ZN6ReaderIi10NodeWeightIiiEiLb1EE8ReadInELERSt14basic_ifstreamIcSt11char_traitsIcEE: %agg.result"}
!97 = distinct !{!97, !"_ZN6ReaderIi10NodeWeightIiiEiLb1EE8ReadInELERSt14basic_ifstreamIcSt11char_traitsIcEE"}
!98 = !{!99, !1, i64 2496}
!99 = !{!"_ZTSSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE", !2, i64 0, !1, i64 2496}
!100 = !{!47, !5, i64 16}
!101 = !{!102}
!102 = distinct !{!102, !103, !"_ZSt19__relocate_object_aISt6vectorIiSaIiEES2_SaIS2_EEvPT_PT0_RT1_: %__orig"}
!103 = distinct !{!103, !"_ZSt19__relocate_object_aISt6vectorIiSaIiEES2_SaIS2_EEvPT_PT0_RT1_"}
!104 = !{!105}
!105 = distinct !{!105, !103, !"_ZSt19__relocate_object_aISt6vectorIiSaIiEES2_SaIS2_EEvPT_PT0_RT1_: %__dest"}
!106 = !{!16, !5, i64 16}
!107 = !{!108, !5, i64 24}
!108 = !{!"_ZTS8CSRGraphIi10NodeWeightIiiELb1EE", !23, i64 0, !1, i64 8, !1, i64 16, !5, i64 24, !5, i64 32, !5, i64 40, !5, i64 48}
!109 = !{!110}
!110 = distinct !{!110, !111, !"_ZNK8CSRGraphIi10NodeWeightIiiELb1EE9out_neighEim: %agg.result"}
!111 = distinct !{!111, !"_ZNK8CSRGraphIi10NodeWeightIiiELb1EE9out_neighEim"}
!112 = !{!108, !1, i64 8}
!113 = !{!57, !7, i64 12}
!114 = !{!61, !7, i64 8}
!115 = !{!108, !23, i64 0}
!116 = !{!117, !1, i64 0}
!117 = !{!"_ZTSNSt24uniform_int_distributionImE10param_typeE", !1, i64 0, !1, i64 8}
!118 = !{!117, !1, i64 8}
