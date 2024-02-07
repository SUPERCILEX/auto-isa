; ModuleID = 'converter-idioms'
source_filename = "converter-idioms"
target triple = "riscv64"

%struct.NodeWeight = type { i32, i32 }
%struct.EdgePair.14 = type { i32, i32 }
%struct.EdgePair = type { i32, %struct.NodeWeight }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char>::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char>::_Alloc_hider" = type { ptr }
%union.anon = type { i64, [8 x i8] }
%"class.std::basic_ios" = type { %"class.std::ios_base", ptr, i8, i8, ptr, ptr, ptr, ptr }
%"class.std::ios_base" = type { ptr, i64, i64, i32, i32, i32, ptr, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, ptr, %"class.std::locale" }
%"struct.std::ios_base::_Words" = type { ptr, i64 }
%"class.std::locale" = type { ptr }

define i32 @"0"(ptr %neighs, ptr %arrayidx.i567, ptr %arrayidx.i568, ptr %arrayidx.i569, i64 %sub.ptr.rhs.cast.i.i.i.i572, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %arrayidx.i568, align 4, !tbaa !0
  %idx.ext = sext i32 %2 to i64
  %3 = load ptr, ptr %neighs, align 8, !tbaa !4
  %4 = load i64, ptr %arrayidx.i567, align 8, !tbaa !6
  %add.ptr277 = getelementptr inbounds %struct.NodeWeight, ptr %3, i64 %4
  %add.ptr281 = getelementptr inbounds %struct.NodeWeight, ptr %add.ptr277, i64 %idx.ext
  %5 = load i64, ptr %arrayidx.i569, align 8, !tbaa !6
  %add.ptr287 = getelementptr inbounds %struct.NodeWeight, ptr %3, i64 %5
  %sub.ptr.lhs.cast.i.i.i.i571 = ptrtoint ptr %add.ptr287 to i64
  %sub.ptr.sub.i.i.i.i573 = sub i64 %sub.ptr.lhs.cast.i.i.i.i571, %sub.ptr.rhs.cast.i.i.i.i572
  %sub.ptr.div.i.i.i.i586 = lshr exact i64 %sub.ptr.sub.i.i.i.i573, %0
  %shr.i.i591 = lshr i64 %sub.ptr.div.i.i.i.i586, %1
  %incdec.ptr4.sink.i.i.i.i595 = getelementptr inbounds %struct.NodeWeight, ptr %add.ptr281, i64 %shr.i.i591
  %6 = load i32, ptr %incdec.ptr4.sink.i.i.i.i595, align 4, !tbaa !8
  ret i32 %6
}

define i64 @"1"(ptr %arrayidx.i59, ptr %agg.result, ptr %end_size_.i, ptr %degrees, i64 %0) {
bb:
  %1 = load ptr, ptr %agg.result, align 8, !tbaa !10
  %2 = load ptr, ptr %degrees, align 8, !tbaa !12
  %sub.ptr.rhs.cast.i62 = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !14
  %sub.ptr.lhs.cast.i61 = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i63 = sub i64 %sub.ptr.lhs.cast.i61, %sub.ptr.rhs.cast.i62
  %sub.ptr.div.i64 = ashr exact i64 %sub.ptr.sub.i63, %0
  %arrayidx.i65 = getelementptr inbounds i64, ptr %1, i64 %sub.ptr.div.i64
  %4 = load i64, ptr %arrayidx.i59, align 8, !tbaa !6
  store i64 %4, ptr %arrayidx.i65, align 8, !tbaa !6
  ret i64 %4
}

define <2 x i32> @"3"(ptr %degrees, ptr %.omp.lb, i64 %0, i64 %index) {
bb:
  %1 = load ptr, ptr %degrees, align 8, !tbaa !12
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %mul12 = shl i64 %2, %0
  %offset.idx = add i64 %mul12, %index
  %3 = getelementptr inbounds i32, ptr %1, i64 %offset.idx
  %wide.load = load <2 x i32>, ptr %3, align 4, !tbaa !0
  ret <2 x i32> %wide.load
}

define ptr @"4"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, ptr %.omp.lb, i64 %1) {
bb:
  %2 = load i8, ptr %transpose, align 1, !tbaa !15, !range !17, !noundef !18
  %tobool.not = icmp eq i8 %2, %0
  %3 = load ptr, ptr %in_index_.i, align 8
  %4 = load ptr, ptr %out_index_.i, align 8
  %.sink = select i1 %tobool.not, ptr %4, ptr %3
  %5 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %6 = sext i32 %5 to i64
  %7 = add nsw i64 %6, %1
  %arrayidx.i.i.i65 = getelementptr inbounds ptr, ptr %.sink, i64 %7
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i65, align 8, !tbaa !4
  ret ptr %n_end.0
}

define <4 x i32> @"5"(<4 x i32> %0, ptr %init_val, i64 %1, ptr %this, ptr %.omp.lb, i64 %index, i64 %2) {
bb:
  %3 = load i32, ptr %init_val, align 4, !tbaa !0, !alias.scope !19
  %broadcast.splatinsert21 = insertelement <4 x i32> %0, i32 %3, i64 %1
  %broadcast.splat22 = shufflevector <4 x i32> %broadcast.splatinsert21, <4 x i32> %0, <4 x i32> zeroinitializer
  %4 = load ptr, ptr %this, align 8, !tbaa !12
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %offset.idx = add i64 %5, %index
  %6 = getelementptr inbounds i32, ptr %4, i64 %offset.idx
  %7 = getelementptr inbounds i32, ptr %6, i64 %2
  store <4 x i32> %broadcast.splat22, ptr %7, align 4, !tbaa !0, !alias.scope !22, !noalias !19
  ret <4 x i32> %broadcast.splat22
}

define <2 x i64> @"7"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %.omp.lb, i64 %3, i64 %4, i64 %5, <2 x i64> %6, <2 x i64> %7, ptr %8, <2 x i64> %9, <2 x i64> %10, ptr %11) {
bb:
  %wide.load169 = load <2 x i64>, ptr %8, align 8, !tbaa !6
  %wide.load168 = load <2 x i64>, ptr %0, align 8, !tbaa !6
  %12 = and <2 x i64> %wide.load168, %1
  %13 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %add11 = add i64 %13, %3
  %rem.i.i.i = and i64 %add11, %4
  %vector.recur.init166 = insertelement <2 x i64> %2, i64 %rem.i.i.i, i64 %5
  %14 = shufflevector <2 x i64> %vector.recur.init166, <2 x i64> %wide.load168, <2 x i32> <i32 1, i32 2>
  %15 = and <2 x i64> %14, %6
  %16 = or <2 x i64> %12, %15
  %17 = lshr exact <2 x i64> %16, %7
  %18 = xor <2 x i64> %17, %wide.load169
  %19 = and <2 x i64> %wide.load168, %7
  %20 = icmp eq <2 x i64> %19, %9
  %21 = select <2 x i1> %20, <2 x i64> %9, <2 x i64> %10
  %22 = xor <2 x i64> %18, %21
  store <2 x i64> %22, ptr %11, align 8, !tbaa !6
  ret <2 x i64> %22
}

define i8 @"8"(ptr %arrayidx17.i.i, ptr %agg.tmp125, ptr %degree_, i32 %0) {
bb:
  %1 = load i8, ptr %arrayidx17.i.i, align 2, !tbaa !24, !noalias !25
  %2 = load i32, ptr %degree_, align 4, !tbaa !28
  %__val.lobit.i = lshr i32 %2, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %3 = load ptr, ptr %agg.tmp125, align 8, !tbaa !36, !alias.scope !25
  %arrayidx.i.i = getelementptr inbounds i8, ptr %3, i64 %conv5.i
  store i8 %1, ptr %arrayidx.i.i, align 1, !tbaa !24
  ret i8 %1
}

define i32 @"9"(ptr %diffs, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %diffs, align 8, !tbaa !12
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %2 = sext i32 %1 to i64
  %arrayidx.i47 = getelementptr inbounds i32, ptr %0, i64 %2
  %3 = load i32, ptr %arrayidx.i47, align 4, !tbaa !0
  ret i32 %3
}

define i32 @"10"(ptr %init_val, ptr %this, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %init_val, align 4, !tbaa !0
  %1 = load ptr, ptr %this, align 8, !tbaa !12
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %add.ptr.prol = getelementptr inbounds i32, ptr %1, i64 %2
  store i32 %0, ptr %add.ptr.prol, align 4, !tbaa !0
  ret i32 %0
}

define ptr @"11"(ptr %el, ptr %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre671.pre = load ptr, ptr %el, align 8, !tbaa !37
  %.pre672 = load ptr, ptr %el, align 8, !tbaa !37
  %.pre691 = ptrtoint ptr %.pre672 to i64
  %2 = load ptr, ptr %el, align 8, !tbaa !37
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair.14, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre691
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr.i425 = getelementptr inbounds %struct.EdgePair.14, ptr %.pre671.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i425, ptr %end_size_.i, align 8, !tbaa !39
  ret ptr %add.ptr.i425
}

define i32 @"12"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, ptr %w.i.i.i.i.i.i, ptr %w3.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %w3.i.i.i.i.i.i, align 4
  %3 = load i32, ptr %w.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i = icmp slt i32 %3, %2
  %4 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !8
  %5 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !8
  %cmp7.i.i.i.i.i.i = icmp slt i32 %4, %5
  %cmp.i.i.i.i.i.i = icmp eq i32 %4, %5
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

define i64 @"13"(ptr %arrayidx225, ptr %neighs, i64 %tail_index.1.lcssa, ptr %arrayidx.i560) {
bb:
  %0 = load i64, ptr %arrayidx225, align 4
  %1 = load i32, ptr %arrayidx.i560, align 4, !tbaa !0
  %conv211 = sext i32 %1 to i64
  %sub239 = sub nsw i64 %tail_index.1.lcssa, %conv211
  %2 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx226 = getelementptr inbounds %struct.NodeWeight, ptr %2, i64 %sub239
  store i64 %0, ptr %arrayidx226, align 4
  ret i64 %0
}

define i64 @"14"(ptr %arrayidx.i30, i64 %0, ptr %el, ptr %.omp.lb, i64 %1) {
bb:
  %2 = load i32, ptr %arrayidx.i30, align 4, !tbaa !0
  %agg.tmp.sroa.0.0.insert.ext = zext i32 %2 to i64
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.0.0.insert.ext, %0
  %3 = load ptr, ptr %el, align 8, !tbaa !40
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %4
  %ref.tmp.sroa.4.0.arrayidx.i31.sroa_idx = getelementptr inbounds i8, ptr %arrayidx.i, i64 %1
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %ref.tmp.sroa.4.0.arrayidx.i31.sroa_idx, align 4, !tbaa.struct !42
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i64 @"15"(ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %__i.018.i, ptr %arrayidx7.i) {
bb:
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %add10 = add i64 %5, %0
  %rem.i.i.i = and i64 %add10, %1
  %shr.i = lshr i64 %rem.i.i.i, %2
  %xor.i = xor i64 %shr.i, %3
  %mul.i = mul nuw nsw i64 %xor.i, %4
  %add.i = add nuw i64 %mul.i, %__i.018.i
  %rem.i.i17.i = and i64 %add.i, %1
  store i64 %rem.i.i17.i, ptr %arrayidx7.i, align 8, !tbaa !6
  ret i64 %rem.i.i17.i
}

define i64 @"17"(ptr %offsets, ptr %arrayidx270, i64 %0) {
bb:
  %.pre763 = load ptr, ptr %offsets, align 8, !tbaa !10
  %1 = load i64, ptr %arrayidx270, align 4
  %sext = shl i64 %1, %0
  %conv273 = ashr exact i64 %sext, %0
  %arrayidx.i567 = getelementptr inbounds i64, ptr %.pre763, i64 %conv273
  %2 = load i64, ptr %arrayidx.i567, align 8, !tbaa !6
  ret i64 %2
}

define i32 @"18"(ptr %add.ptr.i.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0) {
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

define i32 @"19"(ptr %n_start.0.in, i64 %0, ptr %diffs, ptr %.omp.lb) {
bb:
  %1 = load ptr, ptr %diffs, align 8, !tbaa !12
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %3 = sext i32 %2 to i64
  %arrayidx.i103 = getelementptr inbounds i32, ptr %1, i64 %3
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  %.pre138 = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.lhs.cast = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %.pre138
  %4 = lshr exact i64 %sub.ptr.sub, %0
  %conv27 = trunc i64 %4 to i32
  store i32 %conv27, ptr %arrayidx.i103, align 4, !tbaa !0
  ret i32 %conv27
}

define i64 @"20"(ptr %offsets, ptr %arrayidx270, i64 %0, i64 %1) {
bb:
  %.pre765 = load ptr, ptr %offsets, align 8, !tbaa !10
  %2 = load i64, ptr %arrayidx270, align 4
  %sext = shl i64 %2, %0
  %sext669 = add i64 %sext, %1
  %conv284 = ashr exact i64 %sext669, %0
  %arrayidx.i569 = getelementptr inbounds i64, ptr %.pre765, i64 %conv284
  %3 = load i64, ptr %arrayidx.i569, align 8, !tbaa !6
  ret i64 %3
}

define ptr @"21"(ptr %help_strings_.i.i) {
bb:
  %0 = load ptr, ptr %help_strings_.i.i, align 8, !tbaa !43
  %1 = load ptr, ptr %0, align 8, !tbaa !36
  ret ptr %1
}

define i64 @"22"(ptr %__first.addr.034.i.i, ptr %n_start.0.in) {
bb:
  %0 = load i64, ptr %__first.addr.034.i.i, align 4
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  store i64 %0, ptr %n_start.0, align 4
  ret i64 %0
}

define <2 x i64> @"23"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %rng, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
bb:
  %wide.load169 = load <2 x i64>, ptr %6, align 8, !tbaa !6
  %wide.load168 = load <2 x i64>, ptr %0, align 8, !tbaa !6
  %10 = and <2 x i64> %wide.load168, %1
  %11 = load i64, ptr %rng, align 8, !tbaa !6
  %vector.recur.init166 = insertelement <2 x i64> %2, i64 %11, i64 %3
  %12 = shufflevector <2 x i64> %vector.recur.init166, <2 x i64> %wide.load168, <2 x i32> <i32 1, i32 2>
  %13 = and <2 x i64> %12, %4
  %14 = or <2 x i64> %10, %13
  %15 = lshr exact <2 x i64> %14, %5
  %16 = xor <2 x i64> %15, %wide.load169
  %17 = and <2 x i64> %wide.load168, %5
  %18 = icmp eq <2 x i64> %17, %7
  %19 = select <2 x i1> %18, <2 x i64> %7, <2 x i64> %8
  %20 = xor <2 x i64> %16, %19
  store <2 x i64> %20, ptr %9, align 8, !tbaa !6
  ret <2 x i64> %20
}

define i32 @"24"(ptr %degrees, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %degrees, align 8, !tbaa !12
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %mul14 = shl i64 %2, %0
  %arrayidx.i36 = getelementptr inbounds i32, ptr %1, i64 %mul14
  %3 = load i32, ptr %arrayidx.i36, align 4, !tbaa !0
  ret i32 %3
}

define i64 @"25"(ptr %agg.tmp, ptr %end_size_.i.i) {
bb:
  %agg.tmp.0.agg.tmp.0.agg.tmp.0.agg.tmp.coerce.sroa.0.0.copyload = load i64, ptr %agg.tmp, align 8
  %0 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !44
  store i64 %agg.tmp.0.agg.tmp.0.agg.tmp.0.agg.tmp.coerce.sroa.0.0.copyload, ptr %0, align 4, !tbaa.struct !45
  ret i64 %agg.tmp.0.agg.tmp.0.agg.tmp.0.agg.tmp.coerce.sroa.0.0.copyload
}

define i64 @"26"(ptr %offsets, ptr %num_nodes_.i, i32 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8, !tbaa !10
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !46
  %4 = trunc i64 %3 to i32
  %n197.0700 = add i32 %4, %0
  %5 = zext i32 %n197.0700 to i64
  %sext778 = shl i64 %5, %1
  %conv215 = ashr exact i64 %sext778, %1
  %arrayidx.i561 = getelementptr inbounds i64, ptr %2, i64 %conv215
  %6 = load i64, ptr %arrayidx.i561, align 8, !tbaa !6
  ret i64 %6
}

define i32 @"27"(ptr %v, i64 %0, ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %1, i64 %2) {
bb:
  %agg.tmp73.sroa.0.0.copyload = load i64, ptr %v, align 8, !tbaa.struct !42
  %3 = lshr i64 %agg.tmp73.sroa.0.0.copyload, %0
  %4 = trunc i64 %3 to i32
  %5 = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %6 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !44
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %6 to i64
  %7 = load ptr, ptr %agg.result, align 8, !tbaa !40
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %7 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = sdiv exact i64 %sub.ptr.sub.i12.i.i, %1
  %add.ptr.i.i151 = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %sub.ptr.div.i13.i.i
  %val.sroa.2.0..sroa_idx.i = getelementptr inbounds i8, ptr %add.ptr.i.i151, i64 %2
  store i32 %4, ptr %val.sroa.2.0..sroa_idx.i, align 4, !tbaa.struct !48
  ret i32 %4
}

define i32 @"28"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !40
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %2
  %e.sroa.5.0.add.ptr.sroa_idx = getelementptr inbounds i8, ptr %add.ptr, i64 %0
  %e.sroa.5.0.copyload = load i32, ptr %e.sroa.5.0.add.ptr.sroa_idx, align 4, !tbaa.struct !42
  ret i32 %e.sroa.5.0.copyload
}

define i32 @"29"(ptr %init_val, ptr %this, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %init_val, align 4, !tbaa !0
  %1 = load ptr, ptr %this, align 8, !tbaa !12
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %add.ptr = getelementptr inbounds i32, ptr %1, i64 %2
  store i32 %0, ptr %add.ptr, align 4, !tbaa !0
  ret i32 %0
}

define i32 @"30"(ptr %el, i64 %0, i64 %1, i32 %2) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr122.i.i = getelementptr inbounds %struct.EdgePair.14, ptr %.pre, i64 %0
  %v3.i.i.i.i = getelementptr inbounds %struct.EdgePair.14, ptr %incdec.ptr122.i.i, i64 %1, i32 1
  %3 = load i32, ptr %v3.i.i.i.i, align 4
  ret i32 %3
}

define ptr @"31"(ptr %el, i64 %sub.ptr.rhs.cast, i64 %0, ptr %end_size_.i) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !37
  %sub.ptr.lhs.cast = ptrtoint ptr %1 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %add.ptr.i = getelementptr inbounds %struct.EdgePair.14, ptr %.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !39
  ret ptr %add.ptr.i
}

define ptr @"32"(ptr %new_range.i.i418, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i437 = load ptr, ptr %new_range.i.i418, align 8, !tbaa !4
  %.pre672 = load ptr, ptr %el, align 8, !tbaa !37
  %.pre691 = ptrtoint ptr %.pre672 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair.14, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair.14, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre691
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %add.ptr6.i.i439 = getelementptr inbounds %struct.EdgePair.14, ptr %.pre.i.i437, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i439, ptr %end_capacity_.i.i.i, align 8, !tbaa !49
  ret ptr %add.ptr6.i.i439
}

define i64 @"33"(ptr %agg.tmp, ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %0) {
bb:
  %agg.tmp.0.agg.tmp.0.agg.tmp.0.agg.tmp.coerce.sroa.0.0.copyload = load i64, ptr %agg.tmp, align 8
  %1 = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %2 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !44
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %agg.result, align 8, !tbaa !40
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = sdiv exact i64 %sub.ptr.sub.i12.i.i, %0
  %add.ptr.i.i151 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %sub.ptr.div.i13.i.i
  store i64 %agg.tmp.0.agg.tmp.0.agg.tmp.0.agg.tmp.coerce.sroa.0.0.copyload, ptr %add.ptr.i.i151, align 4, !tbaa.struct !45
  ret i64 %agg.tmp.0.agg.tmp.0.agg.tmp.0.agg.tmp.coerce.sroa.0.0.copyload
}

define i32 @"34"(ptr %add.ptr3.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i) {
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

define i64 @"35"(ptr %_M_string_length.i23.i.i.i.phi.trans.insert, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0, i32 %1) {
bb:
  %.pre = load i64, ptr %_M_string_length.i23.i.i.i.phi.trans.insert, align 8, !tbaa !50
  %2 = load ptr, ptr %this, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %_M_string_length.i24.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i, i32 1
  store i64 %.pre, ptr %_M_string_length.i24.i.i.i, align 8, !tbaa !50
  ret i64 %.pre
}

define i64 @"36"(ptr %arrayidx.i58, ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, i64 %add7, ptr %arrayidx.i57.1) {
bb:
  %0 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !6
  %1 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !6
  %add7.1 = add nsw i64 %1, %add7
  %2 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !6
  %add7.2 = add nsw i64 %2, %add7.1
  %add7.3 = add nsw i64 %0, %add7.2
  %3 = load i64, ptr %arrayidx.i58, align 8, !tbaa !6
  %add72 = add nsw i64 %3, %add7.3
  store i64 %add7, ptr %arrayidx.i57.1, align 8, !tbaa !6
  ret i64 %add7
}

define i32 @"37"(ptr %num_nodes, i64 %0, ptr %length.i) {
bb:
  %1 = load i64, ptr %num_nodes, align 8, !tbaa !6
  %add = add nsw i64 %1, %0
  %conv.i = trunc i64 %add to i32
  store i32 %conv.i, ptr %length.i, align 4, !tbaa !0
  ret i32 %conv.i
}

define i64 @"38"(ptr %offsets, ptr %arrayidx270, i64 %0, i64 %1) {
bb:
  %.pre763 = load ptr, ptr %offsets, align 8, !tbaa !10
  %2 = load i64, ptr %arrayidx270, align 4
  %sext = shl i64 %2, %0
  %sext669 = add i64 %sext, %1
  %conv284 = ashr exact i64 %sext669, %0
  %arrayidx.i569 = getelementptr inbounds i64, ptr %.pre763, i64 %conv284
  %3 = load i64, ptr %arrayidx.i569, align 8, !tbaa !6
  ret i64 %3
}

define i64 @"39"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !51
  %inc.i72 = add nuw nsw i64 %1, %0
  %inc.i65 = add nuw nsw i64 %inc.i72, %0
  store i64 %inc.i65, ptr %_M_p.i.i.i, align 8, !tbaa !51
  ret i64 %inc.i65
}

define i64 @"40"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %end_size_.i.i) {
bb:
  %.pre.pre.i = load ptr, ptr %end_size_.i.i, align 8, !tbaa !39
  %2 = load i32, ptr %v, align 4, !tbaa !8
  %sub = add nsw i32 %2, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %.pre.pre.i, align 4, !tbaa.struct !42
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"41"(ptr %__first, ptr %add.ptr.i.us, ptr %add.ptr2.i.us, i64 %sub1.i.us, i64 %mul.i.us, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr.i.us, align 4, !tbaa !0
  %3 = load i32, ptr %add.ptr2.i.us, align 4, !tbaa !0
  %cmp.i.i.us = icmp slt i32 %2, %3
  %spec.select.i.us = select i1 %cmp.i.i.us, i64 %sub1.i.us, i64 %mul.i.us
  %__parent.020.in.i.i.us = add nsw i64 %spec.select.i.us, %0
  %__parent.020.i.i.us = sdiv i64 %__parent.020.in.i.i.us, %1
  %add.ptr.i.i.us = getelementptr inbounds i32, ptr %__first, i64 %__parent.020.i.i.us
  %4 = load i32, ptr %add.ptr.i.i.us, align 4, !tbaa !0
  ret i32 %4
}

define i64 @"42"(ptr %e.sroa.4.0..sroa_idx, ptr %neighs, ptr %arrayidx.i) {
bb:
  %0 = load i64, ptr %arrayidx.i, align 8, !tbaa !6
  %1 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx = getelementptr inbounds %struct.NodeWeight, ptr %1, i64 %0
  %2 = load i64, ptr %e.sroa.4.0..sroa_idx, align 4
  store i64 %2, ptr %arrayidx, align 4
  ret i64 %2
}

define i32 @"43"(ptr %end_size_.i, ptr %offsets, i64 %0, ptr %length.i151) {
bb:
  %1 = load ptr, ptr %end_size_.i, align 8, !tbaa !53
  %sub.ptr.lhs.cast.i.i154 = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %offsets, align 8, !tbaa !10
  %sub.ptr.rhs.cast.i.i155 = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i156 = sub i64 %sub.ptr.lhs.cast.i.i154, %sub.ptr.rhs.cast.i.i155
  %3 = lshr exact i64 %sub.ptr.sub.i.i156, %0
  %conv.i157 = trunc i64 %3 to i32
  store i32 %conv.i157, ptr %length.i151, align 4, !tbaa !0
  ret i32 %conv.i157
}

define ptr @"44"(ptr %out_index.i, ptr %num_nodes_.i) {
bb:
  %0 = load i64, ptr %num_nodes_.i, align 8, !tbaa !54, !noalias !56
  %1 = load ptr, ptr %out_index.i, align 8, !tbaa !4, !noalias !56
  %arrayidx.i.i = getelementptr inbounds ptr, ptr %1, i64 %0
  %2 = load ptr, ptr %arrayidx.i.i, align 8, !tbaa !4, !noalias !56
  ret ptr %2
}

define ptr @"45"(ptr %el, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %0) {
bb:
  %.pre750 = load ptr, ptr %end_size_.i, align 8, !tbaa !44
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre750 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %0
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !44
  ret ptr %add.ptr.i
}

define i32 @"47"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %3 = sub i64 %0, %2
  %n.vec = and i64 %3, %1
  %ind.end = add i64 %2, %n.vec
  %4 = load ptr, ptr %el, align 8, !tbaa !37
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair.14, ptr %4, i64 %ind.end
  %5 = load i32, ptr %add.ptr.prol, align 4
  ret i32 %5
}

define i32 @"48"(ptr %call148, ptr %arrayidx.i509, ptr %arrayidx.i510) {
bb:
  %0 = load i64, ptr %arrayidx.i509, align 8, !tbaa !6
  %add.ptr227 = getelementptr inbounds i32, ptr %call148, i64 %0
  %1 = load i32, ptr %arrayidx.i510, align 4, !tbaa !0
  %idx.ext = sext i32 %1 to i64
  %add.ptr230 = getelementptr inbounds i32, ptr %add.ptr227, i64 %idx.ext
  %2 = load i32, ptr %add.ptr230, align 4, !tbaa !0
  ret i32 %2
}

define i32 @"49"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %5 = load ptr, ptr %el, align 8, !tbaa !37
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair.14, ptr %5, i64 %ind.end
  %add.ptr.sroa_idx.prol = getelementptr inbounds i8, ptr %add.ptr.prol, i64 %2
  %6 = load i32, ptr %add.ptr.sroa_idx.prol, align 4
  ret i32 %6
}

define i32 @"50"(ptr %degrees, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %degrees, align 8, !tbaa !12
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %mul12 = shl i64 %2, %0
  %arrayidx.i32 = getelementptr inbounds i32, ptr %1, i64 %mul12
  %3 = load i32, ptr %arrayidx.i32, align 4, !tbaa !0
  ret i32 %3
}

define i64 @"51"(i64 %__value.coerce0, ptr %__first, ptr %add.ptr, ptr %add.ptr2, i64 %sub1, i64 %mul, i64 %0) {
bb:
  %1 = load i32, ptr %add.ptr2, align 4, !tbaa !59
  %2 = load i32, ptr %add.ptr, align 4, !tbaa !59
  %cmp6.i.i = icmp slt i32 %2, %1
  %spec.select = select i1 %cmp6.i.i, i64 %sub1, i64 %mul
  %add10 = shl i64 %spec.select, %0
  %sub12 = or i64 %add10, %0
  %add.ptr5.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %sub12
  store i64 %__value.coerce0, ptr %add.ptr5.i, align 4, !tbaa.struct !45
  ret i64 %__value.coerce0
}

define i64 @"52"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %end_size_.i.i) {
bb:
  %2 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !39
  %3 = load i32, ptr %v, align 4, !tbaa !8
  %sub = add nsw i32 %3, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %2, align 4, !tbaa.struct !42
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i64 @"53"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %incdec.ptr.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i = load i64, ptr %incdec.ptr.i.i.i.i, align 4, !tbaa.struct !45
  ret i64 %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i
}

define ptr @"54"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %1
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !61
  ret ptr %add.ptr6.i.i
}

define ptr @"55"(ptr %new_range.i.i476, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %.pre752 = load ptr, ptr %el, align 8, !tbaa !40
  %.pre776 = ptrtoint ptr %.pre752 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre776
  %sub.ptr.div14 = sdiv exact i64 %sub.ptr.sub13, %1
  %.pre.i.i495 = load ptr, ptr %new_range.i.i476, align 8, !tbaa !4
  %add.ptr6.i.i497 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i495, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i497, ptr %end_capacity_.i.i.i, align 8, !tbaa !61
  ret ptr %add.ptr6.i.i497
}

define i8 @"56"(ptr %arrayidx.i17.i, ptr %agg.tmp125, ptr %degree_, i32 %0, i64 %idxprom1.i.i) {
bb:
  %1 = load i8, ptr %arrayidx.i17.i, align 1, !tbaa !24, !noalias !25
  %2 = load i32, ptr %degree_, align 4, !tbaa !28
  %__val.lobit.i = lshr i32 %2, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %3 = load ptr, ptr %agg.tmp125, align 8, !tbaa !36, !alias.scope !25
  %arrayidx.i.i = getelementptr inbounds i8, ptr %3, i64 %conv5.i
  %arrayidx2.i.i = getelementptr inbounds i8, ptr %arrayidx.i.i, i64 %idxprom1.i.i
  store i8 %1, ptr %arrayidx2.i.i, align 1, !tbaa !24
  ret i8 %1
}

define ptr @"57"(ptr %call.i, ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, i64 %2, ptr %end_size_.i40) {
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
  store ptr %add.ptr.i, ptr %end_size_.i40, align 8, !tbaa !53
  ret ptr %add.ptr.i
}

define i64 @"58"(ptr %arrayidx.i, i64 %0, ptr %offsets, ptr %__begin0.0683) {
bb:
  %1 = load i64, ptr %arrayidx.i, align 8, !tbaa !6
  %inc = add nsw i64 %1, %0
  %e.sroa.0.0.copyload = load i32, ptr %__begin0.0683, align 4, !tbaa.struct !45
  %conv = sext i32 %e.sroa.0.0.copyload to i64
  %2 = load ptr, ptr %offsets, align 8, !tbaa !10
  %arrayidx.i2 = getelementptr inbounds i64, ptr %2, i64 %conv
  store i64 %inc, ptr %arrayidx.i, align 8, !tbaa !6
  ret i64 %inc
}

define i64 @"59"(ptr %max_seen.i, i32 %0, ptr %num_nodes_) {
bb:
  %1 = load i32, ptr %max_seen.i, align 4, !tbaa !0
  %add = add nsw i32 %1, %0
  %conv = sext i32 %add to i64
  store i64 %conv, ptr %num_nodes_, align 8, !tbaa !46
  ret i64 %conv
}

define ptr @"60"(ptr %new_range.i.i, ptr %el, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %.pre671.pre = load ptr, ptr %el, align 8, !tbaa !37
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre671.pre to i64
  %1 = load ptr, ptr %el, align 8, !tbaa !37
  %sub.ptr.lhs.cast = ptrtoint ptr %1 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair.14, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !49
  ret ptr %add.ptr6.i.i
}

define i32 @"61"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3) {
bb:
  %4 = load ptr, ptr %el, align 8, !tbaa !37
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %6 = sub i64 %0, %5
  %n.vec = and i64 %6, %1
  %ind.end = add i64 %5, %n.vec
  %add13 = add i64 %ind.end, %2
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair.14, ptr %4, i64 %add13
  %add.ptr.sroa_idx.1 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %3
  %7 = load i32, ptr %add.ptr.sroa_idx.1, align 4
  ret i32 %7
}

define i64 @"62"(ptr %end_size_.i, i64 %0) {
bb:
  %.pre750 = load ptr, ptr %end_size_.i, align 8, !tbaa !44
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre750, i64 %0
  %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !45
  ret i64 %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i
}

define i32 @"63"(ptr %invs_needed, ptr %num_nodes_.i, i32 %0) {
bb:
  %.pre760 = load ptr, ptr %invs_needed, align 8, !tbaa !12
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !46
  %2 = trunc i64 %1 to i32
  %n197.0700 = add i32 %2, %0
  %3 = zext i32 %n197.0700 to i64
  %arrayidx.i560 = getelementptr inbounds i32, ptr %.pre760, i64 %3
  %4 = load i32, ptr %arrayidx.i560, align 4, !tbaa !0
  ret i32 %4
}

define i32 @"64"(ptr %el, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %el, align 8, !tbaa !37
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %add.ptr = getelementptr inbounds %struct.EdgePair.14, ptr %0, i64 %1
  %2 = load i32, ptr %add.ptr, align 4
  ret i32 %2
}

define i32 @"65"(ptr %v, i64 %0, ptr %end_size_.i.i, i64 %1) {
bb:
  %agg.tmp73.sroa.0.0.copyload = load i64, ptr %v, align 8, !tbaa.struct !42
  %2 = lshr i64 %agg.tmp73.sroa.0.0.copyload, %0
  %3 = trunc i64 %2 to i32
  %.pre.pre.i = load ptr, ptr %end_size_.i.i, align 8, !tbaa !44
  %val.sroa.2.0..sroa_idx.i = getelementptr inbounds i8, ptr %.pre.pre.i, i64 %1
  store i32 %3, ptr %val.sroa.2.0..sroa_idx.i, align 4, !tbaa.struct !48
  ret i32 %3
}

define i32 @"66"(ptr %invs_needed, ptr %num_nodes_.i, i32 %0) {
bb:
  %.pre761 = load ptr, ptr %invs_needed, align 8, !tbaa !12
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !46
  %2 = trunc i64 %1 to i32
  %n197.0700 = add i32 %2, %0
  %3 = zext i32 %n197.0700 to i64
  %arrayidx.i560 = getelementptr inbounds i32, ptr %.pre761, i64 %3
  %4 = load i32, ptr %arrayidx.i560, align 4, !tbaa !0
  ret i32 %4
}

define ptr @"67"(ptr %new_range.i.i476, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %.pre752 = load ptr, ptr %el, align 8, !tbaa !40
  %.pre776 = ptrtoint ptr %.pre752 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre776
  %sub.ptr.div14 = sdiv exact i64 %sub.ptr.sub13, %1
  %.pre.i.i495 = load ptr, ptr %new_range.i.i476, align 8, !tbaa !4
  %add.ptr6.i.i497 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i495, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i497, ptr %end_capacity_.i.i.i, align 8, !tbaa !61
  ret ptr %add.ptr6.i.i497
}

define i64 @"68"(ptr %arrayidx225.prol, ptr %neighs, ptr %arrayidx.i558, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx225.prol, align 4
  %2 = load i64, ptr %arrayidx.i558, align 8, !tbaa !6
  %sub196 = add nsw i64 %2, %0
  %3 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx226.prol = getelementptr inbounds %struct.NodeWeight, ptr %3, i64 %sub196
  store i64 %1, ptr %arrayidx226.prol, align 4
  ret i64 %1
}

define i64 @"69"(ptr %arrayidx.i58.epil, i64 %total.076.epil, ptr %arrayidx.i57.epil) {
bb:
  %0 = load i64, ptr %arrayidx.i58.epil, align 8, !tbaa !6
  %add7.epil = add nsw i64 %0, %total.076.epil
  store i64 %add7.epil, ptr %arrayidx.i57.epil, align 8, !tbaa !6
  ret i64 %add7.epil
}

define i64 @"70"(ptr %neighs, ptr %arrayidx.i561, i64 %0, i64 %total_missing_inv.1702, ptr %arrayidx.i560) {
bb:
  %1 = load i32, ptr %arrayidx.i560, align 4, !tbaa !0
  %conv211 = sext i32 %1 to i64
  %sub235 = sub nsw i64 %total_missing_inv.1702, %conv211
  %2 = load i64, ptr %arrayidx.i561, align 8, !tbaa !6
  %i213.0.1 = add nsw i64 %2, %0
  %sub224.1 = sub nsw i64 %i213.0.1, %sub235
  %3 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx225.1 = getelementptr inbounds %struct.NodeWeight, ptr %3, i64 %sub224.1
  %4 = load i64, ptr %arrayidx225.1, align 4
  ret i64 %4
}

define i64 @"71"(i32 %shl19, ptr %arrayidx.i62, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i64, i64 %4, i64 %5, i64 %xor4.i, i64 %6, i64 %xor7.i, i32 %7, i32 %8, i32 %9, i32 %conv, i64 %10, ptr %el, ptr %.omp.lb, i64 %11) {
bb:
  %12 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %mul = shl i64 %12, %6
  %13 = load ptr, ptr %el, align 8, !tbaa !40
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %13, i64 %mul
  %ref.tmp30.sroa.4.0.arrayidx.i.sroa_idx = getelementptr inbounds i8, ptr %arrayidx.i, i64 %11
  %14 = load i64, ptr %arrayidx.i62, align 8, !tbaa !6
  %shr.i63 = lshr i64 %14, %0
  %and.i = and i64 %shr.i63, %1
  %xor.i642 = xor i64 %and.i, %14
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
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %ref.tmp30.sroa.4.0.arrayidx.i.sroa_idx, align 4, !tbaa.struct !42
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"72"(ptr %.omp.lb, ptr %permutation, i64 %indvars.iv) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %1 = sext i32 %0 to i64
  %2 = trunc i64 %1 to i32
  %3 = load ptr, ptr %permutation, align 8, !tbaa !12
  %arrayidx.i = getelementptr inbounds i32, ptr %3, i64 %indvars.iv
  store i32 %2, ptr %arrayidx.i, align 4, !tbaa !0
  ret i32 %2
}

define ptr @"73"(ptr %el, i64 %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair.14, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair.14, ptr %.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !39
  ret ptr %add.ptr.i
}

define ptr @"74"(ptr %this, i64 %0, i32 %1, ptr %__first.addr.07.i.i.i.i) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !4
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %2, i64 %0, i32 2
  store ptr %3, ptr %__first.addr.07.i.i.i.i, align 8, !tbaa !36, !alias.scope !62, !noalias !65
  ret ptr %3
}

define i32 @"75"(ptr %call148, ptr %arrayidx.i503, i64 %0, i64 %total_missing_inv.1620, ptr %arrayidx.i502) {
bb:
  %.pre678 = load i32, ptr %arrayidx.i502, align 4, !tbaa !0
  %.pre692 = sext i32 %.pre678 to i64
  %sub193 = sub nsw i64 %total_missing_inv.1620, %.pre692
  %1 = load i64, ptr %arrayidx.i503, align 8, !tbaa !6
  %i174.0 = add nsw i64 %1, %0
  %sub183 = sub nsw i64 %i174.0, %sub193
  %arrayidx184 = getelementptr inbounds i32, ptr %call148, i64 %sub183
  %2 = load i32, ptr %arrayidx184, align 4, !tbaa !0
  ret i32 %2
}

define i64 @"76"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57) {
bb:
  %0 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !6
  %1 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !6
  %2 = load i64, ptr %arrayidx.i58, align 8, !tbaa !6
  %add7 = add nsw i64 %2, %total.076
  %add7.1 = add nsw i64 %1, %add7
  %3 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !6
  %add7.2 = add nsw i64 %3, %add7.1
  %add7.3 = add nsw i64 %0, %add7.2
  store i64 %add7.3, ptr %arrayidx.i57, align 8, !tbaa !6
  ret i64 %add7.3
}

define i64 @"77"(ptr %add.ptr.i.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, ptr %w.i.i.i.i.i.i, ptr %w3.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %add.ptr.i.i.i.i.i, align 4
  %2 = load i32, ptr %w3.i.i.i.i.i.i, align 4
  %3 = load i32, ptr %w.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i = icmp slt i32 %3, %2
  %4 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !8
  %5 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !8
  %cmp7.i.i.i.i.i.i = icmp slt i32 %4, %5
  %cmp.i.i.i.i.i.i = icmp eq i32 %4, %5
  %cond.i.i.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i1 %cmp4.i.i.i.i.i.i, i1 %cmp7.i.i.i.i.i.i
  %spec.select.i.i.i.i = select i1 %cond.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %add.ptr2.i.i.i.i.i = getelementptr inbounds %struct.NodeWeight, ptr %__first, i64 %sub12.i.i.i.i
  store i64 %1, ptr %add.ptr2.i.i.i.i.i, align 4
  ret i64 %1
}

define i32 @"78"(ptr %call148, ptr %arrayidx.i503, ptr %arrayidx.i501, ptr %arrayidx.i502, i64 %0, i64 %1, i64 %total_missing_inv.0610, ptr %arrayidx.i497) {
bb:
  %2 = load i32, ptr %arrayidx.i497, align 4, !tbaa !0
  %conv137 = sext i32 %2 to i64
  %add138 = add nsw i64 %total_missing_inv.0610, %conv137
  %3 = load i64, ptr %arrayidx.i503, align 8, !tbaa !6
  %4 = load i32, ptr %arrayidx.i502, align 4, !tbaa !0
  %conv172 = sext i32 %4 to i64
  %5 = load i64, ptr %arrayidx.i501, align 8, !tbaa !6
  %add173 = add nsw i64 %5, %conv172
  %6 = sub i64 %3, %add173
  %n.vec754 = and i64 %6, %0
  %ind.end755 = sub i64 %3, %n.vec754
  %i174.0 = add nsw i64 %ind.end755, %1
  %sub183 = sub nsw i64 %i174.0, %add138
  %arrayidx184 = getelementptr inbounds i32, ptr %call148, i64 %sub183
  %7 = load i32, ptr %arrayidx184, align 4, !tbaa !0
  ret i32 %7
}

define ptr @"79"(ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0, i32 %1, ptr %add.ptr) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i, i32 2
  store ptr %3, ptr %add.ptr, align 8, !tbaa !67
  ret ptr %3
}

define i32 @"80"(ptr %el, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %el, align 8, !tbaa !40
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %1
  %2 = load i32, ptr %arrayidx.i, align 4, !tbaa !59
  ret i32 %2
}

define i64 @"81"(ptr %offsets, ptr %arrayidx120, i64 %0) {
bb:
  %.pre759.pre772 = load ptr, ptr %offsets, align 8, !tbaa !10
  %1 = load i64, ptr %arrayidx120, align 4
  %sext670 = shl i64 %1, %0
  %conv122 = ashr exact i64 %sext670, %0
  %arrayidx.i542 = getelementptr inbounds i64, ptr %.pre759.pre772, i64 %conv122
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !6
  ret i64 %2
}

define <2 x i64> @"82"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %rng, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
bb:
  %wide.load92 = load <2 x i64>, ptr %0, align 8, !tbaa !6
  %10 = and <2 x i64> %wide.load92, %5
  %11 = icmp eq <2 x i64> %10, %7
  %12 = select <2 x i1> %11, <2 x i64> %7, <2 x i64> %8
  %wide.load93 = load <2 x i64>, ptr %6, align 8, !tbaa !6
  %13 = and <2 x i64> %wide.load92, %1
  %14 = load i64, ptr %rng, align 8, !tbaa !6
  %vector.recur.init90 = insertelement <2 x i64> %2, i64 %14, i64 %3
  %15 = shufflevector <2 x i64> %vector.recur.init90, <2 x i64> %wide.load92, <2 x i32> <i32 1, i32 2>
  %16 = and <2 x i64> %15, %4
  %17 = or <2 x i64> %13, %16
  %18 = lshr exact <2 x i64> %17, %5
  %19 = xor <2 x i64> %18, %wide.load93
  %20 = xor <2 x i64> %19, %12
  store <2 x i64> %20, ptr %9, align 8, !tbaa !6
  ret <2 x i64> %20
}

define i32 @"83"(ptr %arrayidx.i551, i32 %0, ptr %invs_needed, ptr %arrayidx120, i64 %1) {
bb:
  %2 = load i32, ptr %arrayidx.i551, align 4, !tbaa !0
  %inc143 = add nsw i32 %2, %0
  %3 = load i64, ptr %arrayidx120, align 4
  %sext670 = shl i64 %3, %1
  %conv122 = ashr exact i64 %sext670, %1
  %4 = load ptr, ptr %invs_needed, align 8
  %arrayidx.i5512 = getelementptr inbounds i32, ptr %4, i64 %conv122
  store i32 %inc143, ptr %arrayidx.i551, align 4, !tbaa !0
  ret i32 %inc143
}

define i64 @"84"(ptr %arrayidx225.1, ptr %neighs, i64 %tail_index.1.lcssa, ptr %arrayidx.i560, i64 %0) {
bb:
  %1 = load i32, ptr %arrayidx.i560, align 4, !tbaa !0
  %conv211 = sext i32 %1 to i64
  %sub239 = sub nsw i64 %tail_index.1.lcssa, %conv211
  %dec227 = add nsw i64 %sub239, %0
  %2 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx226.1 = getelementptr inbounds %struct.NodeWeight, ptr %2, i64 %dec227
  %3 = load i64, ptr %arrayidx225.1, align 4
  store i64 %3, ptr %arrayidx226.1, align 4
  ret i64 %3
}

define i32 @"85"(ptr %arrayidx184, ptr %call148, ptr %arrayidx.i500, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i500, align 8, !tbaa !6
  %sub159 = add nsw i64 %1, %0
  %arrayidx185 = getelementptr inbounds i32, ptr %call148, i64 %sub159
  %2 = load i32, ptr %arrayidx184, align 4, !tbaa !0
  store i32 %2, ptr %arrayidx185, align 4, !tbaa !0
  ret i32 %2
}

define i64 @"86"(ptr %neighs, ptr %arrayidx.i561, i64 %total_missing_inv.1702, ptr %arrayidx.i560, i64 %0) {
bb:
  %1 = load ptr, ptr %neighs, align 8, !tbaa !4
  %2 = load i32, ptr %arrayidx.i560, align 4, !tbaa !0
  %conv211 = sext i32 %2 to i64
  %sub235 = sub nsw i64 %total_missing_inv.1702, %conv211
  %3 = xor i64 %sub235, %0
  %4 = load i64, ptr %arrayidx.i561, align 8, !tbaa !6
  %sub224 = add i64 %4, %3
  %arrayidx225 = getelementptr inbounds %struct.NodeWeight, ptr %1, i64 %sub224
  %5 = load i64, ptr %arrayidx225, align 4
  ret i64 %5
}

define <4 x i32> @"87"(ptr %call148, ptr %arrayidx.i503, i64 %0, i64 %total_missing_inv.0610, ptr %arrayidx.i497, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i503, align 8, !tbaa !6
  %3 = add i64 %2, %0
  %4 = load i32, ptr %arrayidx.i497, align 4, !tbaa !0
  %conv137 = sext i32 %4 to i64
  %add138 = add nsw i64 %total_missing_inv.0610, %conv137
  %5 = sub nsw i64 %3, %add138
  %6 = getelementptr inbounds i32, ptr %call148, i64 %5
  %7 = getelementptr inbounds i32, ptr %6, i64 %1
  %wide.load764 = load <4 x i32>, ptr %7, align 4, !tbaa !0
  ret <4 x i32> %wide.load764
}

define i32 @"88"(i64 %indvars.iv660, ptr %incdec.ptr4.sink.i.i.i.i530, ptr %__first.addr.015.i.i524, ptr %call148, ptr %arrayidx.i511, i64 %sub.ptr.rhs.cast.i.i.i.i513, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %incdec.ptr4.sink.i.i.i.i530, align 4, !tbaa !0
  %3 = sext i32 %2 to i64
  %cmp.i.i.i531 = icmp sgt i64 %indvars.iv660, %3
  %4 = load i64, ptr %arrayidx.i511, align 8, !tbaa !6
  %add.ptr234 = getelementptr inbounds i32, ptr %call148, i64 %4
  %sub.ptr.lhs.cast.i.i.i.i512 = ptrtoint ptr %add.ptr234 to i64
  %sub.ptr.sub.i.i.i.i514 = sub i64 %sub.ptr.lhs.cast.i.i.i.i512, %sub.ptr.rhs.cast.i.i.i.i513
  %sub.ptr.div.i.i.i.i522 = lshr exact i64 %sub.ptr.sub.i.i.i.i514, %0
  %shr.i.i526 = lshr i64 %sub.ptr.div.i.i.i.i522, %1
  %incdec.ptr4.sink.i.i.i.i5302 = getelementptr inbounds i32, ptr %__first.addr.015.i.i524, i64 %shr.i.i526
  %incdec.ptr.i.i532 = getelementptr inbounds i32, ptr %incdec.ptr4.sink.i.i.i.i530, i64 %1
  %__first.addr.1.i.i535 = select i1 %cmp.i.i.i531, ptr %incdec.ptr.i.i532, ptr %__first.addr.015.i.i524
  %5 = load i32, ptr %__first.addr.1.i.i535, align 4, !tbaa !0
  ret i32 %5
}

define i32 @"89"(i32 %0, ptr %new_range.i.i161, ptr %end_size_.i.i, ptr %agg.result, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %new_range.i.i161, align 8, !tbaa !4
  %4 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !44
  %sub.ptr.lhs.cast.i10.i.i181 = ptrtoint ptr %4 to i64
  %5 = load ptr, ptr %agg.result, align 8, !tbaa !40
  %sub.ptr.rhs.cast.i11.i.i182 = ptrtoint ptr %5 to i64
  %sub.ptr.sub.i12.i.i183 = sub i64 %sub.ptr.lhs.cast.i10.i.i181, %sub.ptr.rhs.cast.i11.i.i182
  %sub.ptr.div.i13.i.i184 = sdiv exact i64 %sub.ptr.sub.i12.i.i183, %1
  %add.ptr.i.i185 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div.i13.i.i184
  %val.sroa.2.0..sroa_idx.i172 = getelementptr inbounds i8, ptr %add.ptr.i.i185, i64 %2
  store i32 %0, ptr %val.sroa.2.0..sroa_idx.i172, align 4, !tbaa.struct !48
  ret i32 %0
}

define ptr @"90"(ptr %el, ptr %0, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre752 = load ptr, ptr %el, align 8, !tbaa !40
  %.pre776 = ptrtoint ptr %.pre752 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre776
  %sub.ptr.div14 = sdiv exact i64 %sub.ptr.sub13, %2
  %add.ptr.i483 = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i483, ptr %end_size_.i, align 8, !tbaa !44
  ret ptr %add.ptr.i483
}

define <4 x i32> @"91"(<4 x i32> %0, ptr %init_val, i64 %1, ptr %this, ptr %.omp.lb, i64 %index) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !12
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %offset.idx = add i64 %3, %index
  %4 = getelementptr inbounds i32, ptr %2, i64 %offset.idx
  %5 = load i32, ptr %init_val, align 4, !tbaa !0, !alias.scope !19
  %broadcast.splatinsert21 = insertelement <4 x i32> %0, i32 %5, i64 %1
  %broadcast.splat22 = shufflevector <4 x i32> %broadcast.splatinsert21, <4 x i32> %0, <4 x i32> zeroinitializer
  store <4 x i32> %broadcast.splat22, ptr %4, align 4, !tbaa !0, !alias.scope !22, !noalias !19
  ret <4 x i32> %broadcast.splat22
}

define <4 x i32> @"92"(ptr %call148, ptr %arrayidx.i503, i64 %0, i64 %total_missing_inv.1620, ptr %arrayidx.i502, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i503, align 8, !tbaa !6
  %3 = add i64 %2, %0
  %.pre678 = load i32, ptr %arrayidx.i502, align 4, !tbaa !0
  %.pre692 = sext i32 %.pre678 to i64
  %sub193 = sub nsw i64 %total_missing_inv.1620, %.pre692
  %4 = sub nsw i64 %3, %sub193
  %5 = getelementptr inbounds i32, ptr %call148, i64 %4
  %6 = getelementptr inbounds i32, ptr %5, i64 %1
  %wide.load764 = load <4 x i32>, ptr %6, align 4, !tbaa !0
  ret <4 x i32> %wide.load764
}

define <2 x i64> @"93"(ptr %0, <2 x i64> %1, ptr %2, i64 %3, <2 x i64> %4, ptr %5) {
bb:
  %wide.load = load <2 x ptr>, ptr %0, align 8, !tbaa !4, !noalias !68
  %6 = ptrtoint <2 x ptr> %wide.load to <2 x i64>
  %7 = load ptr, ptr %2, align 8, !tbaa !4, !noalias !68
  %sub.ptr.rhs.cast12.i = ptrtoint ptr %7 to i64
  %broadcast.splatinsert = insertelement <2 x i64> %1, i64 %sub.ptr.rhs.cast12.i, i64 %3
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> %1, <2 x i32> zeroinitializer
  %8 = sub <2 x i64> %6, %broadcast.splat
  %9 = ashr exact <2 x i64> %8, %4
  store <2 x i64> %9, ptr %5, align 8, !tbaa !6, !noalias !68
  ret <2 x i64> %9
}

define i32 @"94"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %this, align 8, !tbaa !12
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add7 = add i64 %ind.end, %2
  %add.ptr.1 = getelementptr inbounds i32, ptr %3, i64 %add7
  %6 = load i32, ptr %init_val, align 4, !tbaa !0
  store i32 %6, ptr %add.ptr.1, align 4, !tbaa !0
  ret i32 %6
}

define i64 @"95"(i64 %val.coerce, ptr %new_range.i, ptr %end_size_.i, ptr %this, i64 %0) {
bb:
  %1 = load ptr, ptr %new_range.i, align 8, !tbaa !4
  %2 = load ptr, ptr %this, align 8, !tbaa !37
  %sub.ptr.rhs.cast.i11.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !39
  %sub.ptr.lhs.cast.i10.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i12.i = sub i64 %sub.ptr.lhs.cast.i10.i, %sub.ptr.rhs.cast.i11.i
  %sub.ptr.div.i13.i = ashr exact i64 %sub.ptr.sub.i12.i, %0
  %add.ptr.i = getelementptr inbounds %struct.EdgePair.14, ptr %1, i64 %sub.ptr.div.i13.i
  store i64 %val.coerce, ptr %add.ptr.i, align 4, !tbaa.struct !42
  ret i64 %val.coerce
}

define <8 x i32> @"96"(ptr %el, ptr %.omp.lb, i64 %index, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !37
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %offset.idx = add i64 %2, %index
  %3 = add i64 %offset.idx, %0
  %4 = getelementptr inbounds %struct.EdgePair.14, ptr %1, i64 %3
  %wide.vec42 = load <8 x i32>, ptr %4, align 4
  ret <8 x i32> %wide.vec42
}

define i64 @"97"(ptr %el, i64 %0, i64 %1) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr13.i.i.i.i, i64 %1
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.030.i.i, align 4, !tbaa.struct !45
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i32 @"98"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0, i64 %1) {
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

define ptr @"99"(ptr %neighs, ptr %arrayidx.i.prol, ptr %index, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %1 = sext i32 %0 to i64
  %2 = load ptr, ptr %index, align 8, !tbaa !4
  %arrayidx.prol = getelementptr inbounds ptr, ptr %2, i64 %1
  %3 = load ptr, ptr %neighs, align 8, !tbaa !4
  %4 = load i64, ptr %arrayidx.i.prol, align 8, !tbaa !6
  %add.ptr.prol = getelementptr inbounds %struct.NodeWeight, ptr %3, i64 %4
  store ptr %add.ptr.prol, ptr %arrayidx.prol, align 8, !tbaa !4
  ret ptr %add.ptr.prol
}

define ptr @"100"(ptr %el, ptr %0, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %.pre672 = load ptr, ptr %el, align 8, !tbaa !37
  %.pre691 = ptrtoint ptr %.pre672 to i64
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair.14, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair.14, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre691
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %add.ptr.i425 = getelementptr inbounds %struct.EdgePair.14, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i425, ptr %end_size_.i, align 8, !tbaa !39
  ret ptr %add.ptr.i425
}

define ptr @"101"(ptr %neighs, ptr %arrayidx.i.1, ptr %index, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %index, align 8, !tbaa !4
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %3 = sext i32 %2 to i64
  %indvars.iv.next = add nsw i64 %3, %0
  %arrayidx.1 = getelementptr inbounds ptr, ptr %1, i64 %indvars.iv.next
  %4 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !6
  %5 = load ptr, ptr %neighs, align 8, !tbaa !4
  %add.ptr.1 = getelementptr inbounds %struct.NodeWeight, ptr %5, i64 %4
  store ptr %add.ptr.1, ptr %arrayidx.1, align 8, !tbaa !4
  ret ptr %add.ptr.1
}

define i64 @"102"(ptr %arrayidx.i511.1, ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i511.1, align 8, !tbaa !6
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !46
  %4 = and i64 %3, %0
  %indvars.iv.next = add nsw i64 %4, %1
  %5 = load ptr, ptr %offsets, align 8
  %arrayidx.i512.1 = getelementptr inbounds i64, ptr %5, i64 %indvars.iv.next
  store i64 %2, ptr %arrayidx.i512.1, align 8, !tbaa !6
  ret i64 %2
}

define i64 @"103"(ptr %neighs, ptr %.pre759.pre772) {
bb:
  %0 = load ptr, ptr %neighs, align 8, !tbaa !4
  %.pre756 = load i64, ptr %.pre759.pre772, align 8, !tbaa !6
  %arrayidx120 = getelementptr inbounds %struct.NodeWeight, ptr %0, i64 %.pre756
  %1 = load i64, ptr %arrayidx120, align 4
  ret i64 %1
}

define i64 @"104"(ptr %neighs, ptr %arrayidx.i561, i64 %0, i64 %total_missing_inv.1702, ptr %arrayidx.i560) {
bb:
  %1 = load ptr, ptr %neighs, align 8, !tbaa !4
  %2 = load i64, ptr %arrayidx.i561, align 8, !tbaa !6
  %i213.0.prol = add nsw i64 %2, %0
  %3 = load i32, ptr %arrayidx.i560, align 4, !tbaa !0
  %conv211 = sext i32 %3 to i64
  %sub235 = sub nsw i64 %total_missing_inv.1702, %conv211
  %sub224.prol = sub nsw i64 %i213.0.prol, %sub235
  %arrayidx225.prol = getelementptr inbounds %struct.NodeWeight, ptr %1, i64 %sub224.prol
  %4 = load i64, ptr %arrayidx225.prol, align 4
  ret i64 %4
}

define i64 @"105"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !51
  %inc.i72 = add nuw nsw i64 %1, %0
  %inc.i208 = add nuw nsw i64 %inc.i72, %0
  %inc.i140 = add nuw nsw i64 %inc.i208, %0
  store i64 %inc.i140, ptr %_M_p.i.i.i, align 8, !tbaa !51
  ret i64 %inc.i140
}

define i32 @"106"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %el, align 8, !tbaa !37
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add13 = add i64 %ind.end, %2
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair.14, ptr %3, i64 %add13
  %6 = load i32, ptr %add.ptr.1, align 4
  ret i32 %6
}

define i64 @"107"(ptr %inoffsets, ptr %it.0718) {
bb:
  %0 = load i32, ptr %it.0718, align 4, !tbaa !8
  %conv77 = sext i32 %0 to i64
  %.pre769 = load ptr, ptr %inoffsets, align 8, !tbaa !10
  %arrayidx.i535 = getelementptr inbounds i64, ptr %.pre769, i64 %conv77
  %1 = load i64, ptr %arrayidx.i535, align 8, !tbaa !6
  ret i64 %1
}

define i64 @"108"(ptr %arrayidx.i58.epil, i64 %total.076.epil, ptr %call.i4145, ptr %num_blocks) {
bb:
  %0 = load i64, ptr %arrayidx.i58.epil, align 8, !tbaa !6
  %add7.epil = add nsw i64 %0, %total.076.epil
  %1 = load i64, ptr %num_blocks, align 8, !tbaa !6
  %arrayidx.i = getelementptr inbounds i64, ptr %call.i4145, i64 %1
  store i64 %add7.epil, ptr %arrayidx.i, align 8, !tbaa !6
  ret i64 %add7.epil
}

define i64 @"109"(ptr %.omp.lb, i64 %0, i64 %1, ptr %rng) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %add10 = add i64 %2, %0
  %rem.i.i.i = and i64 %add10, %1
  store i64 %rem.i.i.i, ptr %rng, align 8, !tbaa !6
  ret i64 %rem.i.i.i
}

define ptr @"110"(ptr %new_range.i.i418, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i437 = load ptr, ptr %new_range.i.i418, align 8, !tbaa !4
  %.pre672 = load ptr, ptr %el, align 8, !tbaa !37
  %.pre691 = ptrtoint ptr %.pre672 to i64
  %.pre671.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair.14, ptr %.pre671.pre, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre691
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr6.i.i439 = getelementptr inbounds %struct.EdgePair.14, ptr %.pre.i.i437, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i439, ptr %end_capacity_.i.i.i, align 8, !tbaa !49
  ret ptr %add.ptr6.i.i439
}

define i64 @"111"(ptr %arrayidx.i, ptr %prefix, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %mul14 = shl i64 %1, %0
  %2 = load ptr, ptr %prefix, align 8
  %arrayidx.i35 = getelementptr inbounds i64, ptr %2, i64 %mul14
  %3 = load i64, ptr %arrayidx.i, align 8, !tbaa !6
  store i64 %3, ptr %arrayidx.i35, align 8, !tbaa !6
  ret i64 %3
}

define i64 @"112"(ptr %offsets, ptr %num_nodes_.i) {
bb:
  %.pre759.pre772 = load ptr, ptr %offsets, align 8, !tbaa !10
  %0 = load i64, ptr %num_nodes_.i, align 8, !tbaa !46
  %arrayidx.i552 = getelementptr inbounds i64, ptr %.pre759.pre772, i64 %0
  %1 = load i64, ptr %arrayidx.i552, align 8, !tbaa !6
  ret i64 %1
}

define i64 @"113"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !51
  %inc.i72 = add nuw nsw i64 %2, %1
  %inc.i208 = add nuw nsw i64 %inc.i72, %1
  %arrayidx.i141 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i208
  %3 = load i64, ptr %arrayidx.i141, align 8, !tbaa !6
  ret i64 %3
}

define i32 @"114"(ptr %num_nodes_, i32 %0, ptr %.omp.ub) {
bb:
  %1 = load i64, ptr %num_nodes_, align 8, !tbaa !71
  %conv = trunc i64 %1 to i32
  %sub2 = add nsw i32 %conv, %0
  store i32 %sub2, ptr %.omp.ub, align 4, !tbaa !0
  ret i32 %sub2
}

define i64 @"115"(ptr %arrayidx.i18.i, ptr %0, i64 %1, i64 %2, ptr %3) {
bb:
  %4 = load ptr, ptr %0, align 8, !tbaa !4, !noalias !56
  %sub.ptr.rhs.cast.i20.i = ptrtoint ptr %4 to i64
  %5 = load ptr, ptr %arrayidx.i18.i, align 8, !tbaa !4, !noalias !56
  %sub.ptr.lhs.cast.i19.i = ptrtoint ptr %5 to i64
  %sub.ptr.sub.i21.i = sub i64 %sub.ptr.lhs.cast.i19.i, %sub.ptr.rhs.cast.i20.i
  %sub.ptr.div.i22.i = ashr exact i64 %sub.ptr.sub.i21.i, %1
  %div.i.i = sdiv i64 %sub.ptr.div.i22.i, %2
  store i64 %div.i.i, ptr %3, align 8, !alias.scope !56
  ret i64 %div.i.i
}

define i32 @"116"(i32 %shl, ptr %arrayidx.i62, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i64, i64 %4, i64 %5, i64 %xor4.i, i64 %6, i64 %xor7.i, i32 %7, ptr %el, ptr %.omp.lb) {
bb:
  %8 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %mul = shl i64 %8, %6
  %9 = load ptr, ptr %el, align 8, !tbaa !40
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %9, i64 %mul
  %10 = load i64, ptr %arrayidx.i62, align 8, !tbaa !6
  %shr.i63 = lshr i64 %10, %0
  %and.i = and i64 %shr.i63, %1
  %xor.i642 = xor i64 %and.i, %10
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
  store i32 %src.1, ptr %arrayidx.i, align 4, !tbaa.struct !45
  ret i32 %src.1
}

define i64 @"117"(ptr %add.ptr.i.i.i.i16, ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %w.i.i.i.i.i, ptr %w3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i64, ptr %add.ptr.i.i.i.i16, align 4
  %1 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !8
  %2 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !8
  %cmp7.i.i.i.i.i = icmp slt i32 %1, %2
  %3 = load i32, ptr %w.i.i.i.i.i, align 4
  %4 = load i32, ptr %w3.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %3, %4
  %cmp.i.i.i.i.i = icmp eq i32 %1, %2
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr2.i.i.i.i23 = getelementptr inbounds %struct.NodeWeight, ptr %__first, i64 %spec.select.i.i.i
  store i64 %0, ptr %add.ptr2.i.i.i.i23, align 4
  ret i64 %0
}

define i32 @"118"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %add16 = add i64 %2, %0
  %3 = load ptr, ptr %el, align 8, !tbaa !40
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %add16
  %e.sroa.5.0.add.ptr.sroa_idx.1 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %1
  %e.sroa.5.0.copyload.1 = load i32, ptr %e.sroa.5.0.add.ptr.sroa_idx.1, align 4, !tbaa.struct !42
  ret i32 %e.sroa.5.0.copyload.1
}

define ptr @"119"(ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %0, i64 %1, ptr %end_capacity_.i.i) {
bb:
  %2 = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %3 = load ptr, ptr %agg.result, align 8, !tbaa !40
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !44
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i = sdiv exact i64 %sub.ptr.sub.i.i, %0
  %mul.i = shl nsw i64 %sub.ptr.div.i.i, %1
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %mul.i
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i, align 8, !tbaa !61
  ret ptr %add.ptr6.i.i
}

define i64 @"120"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !45
  ret i64 %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i
}

define i32 @"121"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %add16.1 = add i64 %1, %0
  %2 = load ptr, ptr %el, align 8, !tbaa !40
  %add.ptr.epil = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %add16.1
  %e.sroa.0.0.copyload.epil = load i32, ptr %add.ptr.epil, align 4, !tbaa.struct !45
  ret i32 %e.sroa.0.0.copyload.epil
}

define i64 @"122"(i64 %val.coerce0, ptr %new_range.i, ptr %end_size_.i, ptr %this, i64 %0) {
bb:
  %1 = load ptr, ptr %end_size_.i, align 8, !tbaa !44
  %sub.ptr.lhs.cast.i10.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %this, align 8, !tbaa !40
  %sub.ptr.rhs.cast.i11.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i12.i = sub i64 %sub.ptr.lhs.cast.i10.i, %sub.ptr.rhs.cast.i11.i
  %sub.ptr.div.i13.i = sdiv exact i64 %sub.ptr.sub.i12.i, %0
  %3 = load ptr, ptr %new_range.i, align 8, !tbaa !4
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div.i13.i
  store i64 %val.coerce0, ptr %add.ptr.i, align 4, !tbaa.struct !45
  ret i64 %val.coerce0
}

define i64 @"123"(ptr %el) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %agg.tmp.sroa.0.0.copyload.i.i.i.i.i = load i64, ptr %.pre, align 4, !tbaa.struct !45
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i.i.i
}

define i32 @"124"(ptr %neighs, ptr %arrayidx.i542, i64 %shr.i.i, i32 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i542, align 8, !tbaa !6
  %2 = load ptr, ptr %neighs, align 8, !tbaa !4
  %add.ptr = getelementptr inbounds %struct.NodeWeight, ptr %2, i64 %1
  %w.i.i.i.i = getelementptr inbounds %struct.NodeWeight, ptr %add.ptr, i64 %shr.i.i, i32 1
  %3 = load i32, ptr %w.i.i.i.i, align 4
  ret i32 %3
}

define i32 @"125"(ptr %neighs, ptr %arrayidx.i542) {
bb:
  %0 = load i64, ptr %arrayidx.i542, align 8, !tbaa !6
  %1 = load ptr, ptr %neighs, align 8, !tbaa !4
  %add.ptr = getelementptr inbounds %struct.NodeWeight, ptr %1, i64 %0
  %2 = load i32, ptr %add.ptr, align 4, !tbaa !8
  ret i32 %2
}

define i64 @"126"(i64 %ref.tmp297.sroa.0.0.insert.insert, ptr %neighs, ptr %arrayidx.i567, i64 %0, ptr %arrayidx.i568) {
bb:
  %1 = load ptr, ptr %neighs, align 8, !tbaa !4
  %2 = load i64, ptr %arrayidx.i567, align 8, !tbaa !6
  %add308 = add i64 %2, %0
  %3 = load i32, ptr %arrayidx.i568, align 4, !tbaa !0
  %idx.ext = sext i32 %3 to i64
  %sub309 = add i64 %add308, %idx.ext
  %arrayidx310 = getelementptr inbounds %struct.NodeWeight, ptr %1, i64 %sub309
  store i64 %ref.tmp297.sroa.0.0.insert.insert, ptr %arrayidx310, align 4
  ret i64 %ref.tmp297.sroa.0.0.insert.insert
}

define i64 @"127"(ptr %end_size_.i, ptr %el, i64 %0, i64 %1, i64 %2, i64 %3, ptr %.omp.ub) {
bb:
  %4 = load ptr, ptr %end_size_.i, align 8, !tbaa !44
  %sub.ptr.lhs.cast.i = ptrtoint ptr %4 to i64
  %5 = load ptr, ptr %el, align 8, !tbaa !40
  %sub.ptr.rhs.cast.i = ptrtoint ptr %5 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = sdiv exact i64 %sub.ptr.sub.i, %0
  %sub = add nuw nsw i64 %sub.ptr.div.i, %1
  %div33 = lshr i64 %sub, %2
  %sub5 = add nsw i64 %div33, %3
  store i64 %sub5, ptr %.omp.ub, align 8, !tbaa !6
  ret i64 %sub5
}

define i64 @"128"(ptr %__first.addr.034.i.i, ptr %n_start.0.in, i64 %0) {
bb:
  %1 = load i64, ptr %__first.addr.034.i.i, align 4
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  %incdec.ptr12.i.i.i.i = getelementptr inbounds %struct.NodeWeight, ptr %n_start.0, i64 %0
  store i64 %1, ptr %incdec.ptr12.i.i.i.i, align 4
  ret i64 %1
}

define i32 @"129"(ptr %n_start.0.in, i64 %0, i64 %1, ptr %diffs, ptr %.omp.lb) {
bb:
  %2 = load ptr, ptr %diffs, align 8, !tbaa !12
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %4 = sext i32 %3 to i64
  %arrayidx.i103 = getelementptr inbounds i32, ptr %2, i64 %4
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  %.pre138 = ptrtoint ptr %n_start.0 to i64
  %incdec.ptr7.i.i = getelementptr inbounds %struct.NodeWeight, ptr %n_start.0, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %.pre138
  %5 = lshr exact i64 %sub.ptr.sub, %1
  %conv27 = trunc i64 %5 to i32
  store i32 %conv27, ptr %arrayidx.i103, align 4, !tbaa !0
  ret i32 %conv27
}

define i64 @"130"(ptr %num_edges_.i, ptr %0, i8 %1, ptr %edges_to_write) {
bb:
  %2 = load i64, ptr %num_edges_.i, align 8
  %3 = load i8, ptr %0, align 8, !tbaa !73, !range !17, !noundef !18
  %tobool.not.i = icmp eq i8 %3, %1
  %mul.i = zext i1 %tobool.not.i to i64
  %cond.i = shl nsw i64 %2, %mul.i
  store i64 %cond.i, ptr %edges_to_write, align 8, !tbaa !6
  ret i64 %cond.i
}

define i64 @"131"(ptr %neighs, ptr %arrayidx.i561, i64 %0, i64 %total_missing_inv.1702, ptr %arrayidx.i560) {
bb:
  %1 = load ptr, ptr %neighs, align 8, !tbaa !4
  %2 = load i32, ptr %arrayidx.i560, align 4, !tbaa !0
  %conv211 = sext i32 %2 to i64
  %sub235 = sub nsw i64 %total_missing_inv.1702, %conv211
  %3 = xor i64 %sub235, %0
  %4 = load i64, ptr %arrayidx.i561, align 8, !tbaa !6
  %i213.0.prol = add nsw i64 %4, %0
  %sub224 = add i64 %i213.0.prol, %3
  %arrayidx225 = getelementptr inbounds %struct.NodeWeight, ptr %1, i64 %sub224
  %5 = load i64, ptr %arrayidx225, align 4
  ret i64 %5
}

define i64 @"132"(ptr %neighs, ptr %arrayidx.i561, i64 %0, i64 %1, i64 %total_missing_inv.1702, ptr %arrayidx.i560) {
bb:
  %2 = load i32, ptr %arrayidx.i560, align 4, !tbaa !0
  %conv211 = sext i32 %2 to i64
  %sub235 = sub nsw i64 %total_missing_inv.1702, %conv211
  %3 = load i64, ptr %arrayidx.i561, align 8, !tbaa !6
  %i213.0.prol = add nsw i64 %3, %0
  %i213.0.1 = add nsw i64 %i213.0.prol, %1
  %sub224.1 = sub nsw i64 %i213.0.1, %sub235
  %4 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx225.1 = getelementptr inbounds %struct.NodeWeight, ptr %4, i64 %sub224.1
  %5 = load i64, ptr %arrayidx225.1, align 4
  ret i64 %5
}

define ptr @"133"(ptr %new_range.i.i418, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i437 = load ptr, ptr %new_range.i.i418, align 8, !tbaa !4
  %.pre672 = load ptr, ptr %el, align 8, !tbaa !37
  %.pre691 = ptrtoint ptr %.pre672 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair.14, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre691
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr6.i.i439 = getelementptr inbounds %struct.EdgePair.14, ptr %.pre.i.i437, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i439, ptr %end_capacity_.i.i.i, align 8, !tbaa !49
  ret ptr %add.ptr6.i.i439
}

define i32 @"135"(ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %w.i.i.i.i.i, ptr %w3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !8
  %3 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !8
  %cmp7.i.i.i.i.i = icmp slt i32 %2, %3
  %4 = load i32, ptr %w.i.i.i.i.i, align 4
  %5 = load i32, ptr %w3.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %4, %5
  %cmp.i.i.i.i.i = icmp eq i32 %2, %3
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %__parent.020.in.i.i.i.i = add nsw i64 %spec.select.i.i.i, %0
  %__parent.020.i.i.i.i = sdiv i64 %__parent.020.in.i.i.i.i, %1
  %add.ptr.i.i.i.i16 = getelementptr inbounds %struct.NodeWeight, ptr %__first, i64 %__parent.020.i.i.i.i
  %6 = load i32, ptr %add.ptr.i.i.i.i16, align 4, !tbaa !8
  ret i32 %6
}

define ptr @"136"(ptr %el, i64 %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !44
  ret ptr %add.ptr.i
}

define ptr @"137"(ptr %cond.i31, i64 %.sroa.speculated.i, ptr %_M_finish.i.i, ptr %this, i64 %0, i64 %sub.ptr.div.i.i, i1 %cmp9.i, i64 %1, i64 %add.i, ptr %_M_end_of_storage) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !74
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i2 = ashr exact i64 %sub.ptr.sub.i.i, %0
  %add.i4 = add i64 %.sroa.speculated.i, %sub.ptr.div.i.i
  %cmp7.i = icmp ult i64 %add.i, %sub.ptr.div.i.i
  %or.cond.i = or i1 %cmp7.i, %cmp9.i
  %cond.i = select i1 %or.cond.i, i64 %1, i64 %add.i
  %add.ptr19 = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %cond.i
  store ptr %add.ptr19, ptr %_M_end_of_storage, align 8, !tbaa !75
  ret ptr %add.ptr19
}

define i32 @"138"(ptr %neighs, ptr %arrayidx.i567, ptr %arrayidx.i568, i64 %shr.i.i591, i32 %0) {
bb:
  %1 = load i32, ptr %arrayidx.i568, align 4, !tbaa !0
  %idx.ext = sext i32 %1 to i64
  %2 = load ptr, ptr %neighs, align 8, !tbaa !4
  %3 = load i64, ptr %arrayidx.i567, align 8, !tbaa !6
  %add.ptr277 = getelementptr inbounds %struct.NodeWeight, ptr %2, i64 %3
  %add.ptr281 = getelementptr inbounds %struct.NodeWeight, ptr %add.ptr277, i64 %idx.ext
  %w.i.i.i.i597 = getelementptr inbounds %struct.NodeWeight, ptr %add.ptr281, i64 %shr.i.i591, i32 1
  %4 = load i32, ptr %w.i.i.i.i597, align 4
  ret i32 %4
}

define i32 @"139"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %init_val, align 4, !tbaa !0
  %3 = load ptr, ptr %this, align 8, !tbaa !12
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add.ptr = getelementptr inbounds i32, ptr %3, i64 %ind.end
  store i32 %2, ptr %add.ptr, align 4, !tbaa !0
  ret i32 %2
}

define ptr @"140"(ptr %el, i64 %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair.14, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %.pre671.pre = load ptr, ptr %el, align 8, !tbaa !37
  %add.ptr.i = getelementptr inbounds %struct.EdgePair.14, ptr %.pre671.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !39
  ret ptr %add.ptr.i
}

define <4 x i32> @"141"(ptr %0, ptr %call148, i64 %tail_index.0621, ptr %arrayidx.i503, ptr %arrayidx.i501, ptr %arrayidx.i502, i64 %1, i64 %index761, i64 %2) {
bb:
  %3 = load i32, ptr %arrayidx.i502, align 4, !tbaa !0
  %conv172 = sext i32 %3 to i64
  %4 = load i64, ptr %arrayidx.i501, align 8, !tbaa !6
  %add173 = add nsw i64 %4, %conv172
  %5 = load i64, ptr %arrayidx.i503, align 8, !tbaa !6
  %6 = sub i64 %5, %add173
  %n.vec754 = and i64 %6, %1
  %ind.end757 = sub i64 %tail_index.0621, %n.vec754
  %.pre678 = load i32, ptr %arrayidx.i502, align 4, !tbaa !0
  %.pre692 = sext i32 %.pre678 to i64
  %sub197 = sub nsw i64 %ind.end757, %.pre692
  %offset.idx762 = sub i64 %sub197, %index761
  %7 = getelementptr inbounds i32, ptr %call148, i64 %offset.idx762
  %8 = getelementptr inbounds i32, ptr %7, i64 %2
  %wide.load764 = load <4 x i32>, ptr %0, align 4, !tbaa !0
  store <4 x i32> %wide.load764, ptr %8, align 4, !tbaa !0
  ret <4 x i32> %wide.load764
}

define i8 @"142"(ptr %label) {
bb:
  %0 = load ptr, ptr %label, align 8, !tbaa !36, !noalias !76
  %1 = load i8, ptr %0, align 1, !tbaa !24
  ret i8 %1
}

define i32 @"143"(ptr %__first, ptr %add.ptr, ptr %add.ptr2, i64 %sub1, i64 %mul, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i32, ptr %add.ptr2, align 4, !tbaa !59
  %4 = load i32, ptr %add.ptr, align 4, !tbaa !59
  %cmp6.i.i = icmp slt i32 %4, %3
  %spec.select = select i1 %cmp6.i.i, i64 %sub1, i64 %mul
  %add10 = shl i64 %spec.select, %0
  %sub12 = or i64 %add10, %0
  %__parent.019.in.i = add nsw i64 %sub12, %1
  %__parent.019.i = sdiv i64 %__parent.019.in.i, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %__parent.019.i
  %5 = load i32, ptr %add.ptr.i, align 4, !tbaa !59
  ret i32 %5
}

define ptr @"144"(ptr %__args, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0) {
bb:
  %1 = load ptr, ptr %__args, align 8, !tbaa !36
  %2 = load ptr, ptr %this, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %add.ptr = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i
  store ptr %1, ptr %add.ptr, align 8, !tbaa !36
  ret ptr %1
}

define i64 @"145"(ptr %arrayidx.i511.prol, ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i511.prol, align 8, !tbaa !6
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !46
  %4 = and i64 %3, %0
  %arrayidx.i512.prol = getelementptr inbounds i64, ptr %2, i64 %4
  store i64 %1, ptr %arrayidx.i512.prol, align 8, !tbaa !6
  ret i64 %1
}

define ptr @"146"(ptr %index.i152, ptr %0) {
bb:
  %1 = load ptr, ptr %index.i152, align 8, !tbaa !4
  store ptr %1, ptr %0, align 8
  ret ptr %1
}

define i64 @"147"(ptr %arrayidx.i511, ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !46
  %2 = and i64 %1, %0
  %3 = load ptr, ptr %offsets, align 8
  %arrayidx.i512 = getelementptr inbounds i64, ptr %3, i64 %2
  %4 = load i64, ptr %arrayidx.i511, align 8, !tbaa !6
  store i64 %4, ptr %arrayidx.i512, align 8, !tbaa !6
  ret i64 %4
}

define i64 @"148"(ptr %incdec.ptr125.i.i, ptr %n_start.0.in, i64 %0) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  %incdec.ptr5.i.i = getelementptr inbounds %struct.NodeWeight, ptr %n_start.0, i64 %0
  %1 = load i64, ptr %incdec.ptr125.i.i, align 4
  store i64 %1, ptr %incdec.ptr5.i.i, align 4
  ret i64 %1
}

define ptr @"149"(ptr %new_range.i.i418, ptr %0, ptr %el, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i437 = load ptr, ptr %new_range.i.i418, align 8, !tbaa !4
  %.pre672 = load ptr, ptr %el, align 8, !tbaa !37
  %.pre691 = ptrtoint ptr %.pre672 to i64
  %2 = load ptr, ptr %el, align 8, !tbaa !37
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair.14, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre691
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr6.i.i439 = getelementptr inbounds %struct.EdgePair.14, ptr %.pre.i.i437, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i439, ptr %end_capacity_.i.i.i, align 8, !tbaa !49
  ret ptr %add.ptr6.i.i439
}

define i64 @"150"(i64 %lsum.036, ptr %arrayidx.i32, ptr %local_sums, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %1 = load ptr, ptr %local_sums, align 8, !tbaa !10
  %arrayidx.i = getelementptr inbounds i64, ptr %1, i64 %0
  %2 = load i32, ptr %arrayidx.i32, align 4, !tbaa !0
  %conv = sext i32 %2 to i64
  %add16 = add nsw i64 %lsum.036, %conv
  store i64 %add16, ptr %arrayidx.i, align 8, !tbaa !6
  ret i64 %add16
}

define i32 @"151"(ptr %call148, ptr %arrayidx.i503, ptr %arrayidx.i501, ptr %arrayidx.i502, i64 %0, i64 %1, i64 %total_missing_inv.1620) {
bb:
  %.pre678 = load i32, ptr %arrayidx.i502, align 4, !tbaa !0
  %.pre692 = sext i32 %.pre678 to i64
  %sub193 = sub nsw i64 %total_missing_inv.1620, %.pre692
  %2 = load i64, ptr %arrayidx.i503, align 8, !tbaa !6
  %3 = load i32, ptr %arrayidx.i502, align 4, !tbaa !0
  %conv172 = sext i32 %3 to i64
  %4 = load i64, ptr %arrayidx.i501, align 8, !tbaa !6
  %add173 = add nsw i64 %4, %conv172
  %5 = sub i64 %2, %add173
  %n.vec754 = and i64 %5, %0
  %ind.end755 = sub i64 %2, %n.vec754
  %i174.0 = add nsw i64 %ind.end755, %1
  %sub183 = sub nsw i64 %i174.0, %sub193
  %arrayidx184 = getelementptr inbounds i32, ptr %call148, i64 %sub183
  %6 = load i32, ptr %arrayidx184, align 4, !tbaa !0
  ret i32 %6
}

define i64 @"152"(ptr %arrayidx225, ptr %neighs, ptr %arrayidx.i558, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx225, align 4
  %2 = load i64, ptr %arrayidx.i558, align 8, !tbaa !6
  %sub196 = add nsw i64 %2, %0
  %3 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx226 = getelementptr inbounds %struct.NodeWeight, ptr %3, i64 %sub196
  store i64 %1, ptr %arrayidx226, align 4
  ret i64 %1
}

define <2 x i64> @"153"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %.omp.lb, i64 %3, i64 %4, i64 %5, <2 x i64> %6, <2 x i64> %7, ptr %8, <2 x i64> %9, <2 x i64> %10, ptr %11) {
bb:
  %wide.load137 = load <2 x i64>, ptr %0, align 8, !tbaa !6
  %12 = and <2 x i64> %wide.load137, %7
  %13 = icmp eq <2 x i64> %12, %9
  %14 = select <2 x i1> %13, <2 x i64> %9, <2 x i64> %10
  %15 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %add11 = add i64 %15, %3
  %rem.i.i.i = and i64 %add11, %4
  %vector.recur.init135 = insertelement <2 x i64> %2, i64 %rem.i.i.i, i64 %5
  %16 = shufflevector <2 x i64> %vector.recur.init135, <2 x i64> %wide.load137, <2 x i32> <i32 1, i32 2>
  %17 = and <2 x i64> %16, %6
  %18 = and <2 x i64> %wide.load137, %1
  %19 = or <2 x i64> %18, %17
  %20 = lshr exact <2 x i64> %19, %7
  %wide.load138 = load <2 x i64>, ptr %8, align 8, !tbaa !6
  %21 = xor <2 x i64> %20, %wide.load138
  %22 = xor <2 x i64> %21, %14
  store <2 x i64> %22, ptr %11, align 8, !tbaa !6
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
  store i64 %div38, ptr %num_blocks, align 8, !tbaa !6
  ret i64 %div38
}

define i32 @"155"(ptr %arrayidx.i28, ptr %el, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %el, align 8, !tbaa !40
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %1
  %2 = load i32, ptr %arrayidx.i28, align 4, !tbaa !0
  store i32 %2, ptr %arrayidx.i, align 4, !tbaa.struct !45
  ret i32 %2
}

define i32 @"156"(ptr %n_start.0.in, i64 %0) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  %incdec.ptr12.i.i.i.i = getelementptr inbounds %struct.NodeWeight, ptr %n_start.0, i64 %0
  %1 = load i32, ptr %incdec.ptr12.i.i.i.i, align 4, !tbaa !8
  ret i32 %1
}

define ptr @"157"(ptr %new_range.i.i418, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre.i.i437 = load ptr, ptr %new_range.i.i418, align 8, !tbaa !4
  %.pre672 = load ptr, ptr %el, align 8, !tbaa !37
  %.pre691 = ptrtoint ptr %.pre672 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair.14, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair.14, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre691
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %add.ptr.i425 = getelementptr inbounds %struct.EdgePair.14, ptr %.pre.i.i437, i64 %sub.ptr.div14
  store ptr %add.ptr.i425, ptr %end_size_.i, align 8, !tbaa !39
  ret ptr %add.ptr.i425
}

define i64 @"158"(ptr %num_edges_, i64 %0, i64 %1, i64 %2, ptr %.omp.ub) {
bb:
  %3 = load i64, ptr %num_edges_, align 8, !tbaa !79
  %sub3 = add nuw i64 %3, %0
  %div37 = lshr i64 %sub3, %1
  %sub4 = add nsw i64 %div37, %2
  store i64 %sub4, ptr %.omp.ub, align 8, !tbaa !6
  ret i64 %sub4
}

define i64 @"159"(ptr %arrayidx.i209, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i212, i64 %4, i64 %5, i64 %xor4.i215, i64 %6, i64 %xor7.i218, ptr %num_nodes_, i64 %7, ptr %el, ptr %.omp.lb, i64 %8) {
bb:
  %9 = load i64, ptr %num_nodes_, align 8, !tbaa !71
  %10 = trunc i64 %9 to i32
  %11 = load i64, ptr %arrayidx.i209, align 8, !tbaa !6
  %shr.i210 = lshr i64 %11, %0
  %and.i211 = and i64 %shr.i210, %1
  %xor.i2122 = xor i64 %and.i211, %11
  %shl.i213 = shl i64 %xor.i212, %2
  %and3.i214 = and i64 %shl.i213, %3
  %xor4.i2154 = xor i64 %and3.i214, %xor.i212
  %shl5.i216 = shl i64 %xor4.i215, %4
  %and6.i217 = and i64 %shl5.i216, %5
  %xor7.i2186 = xor i64 %and6.i217, %xor4.i215
  %shr8.i219 = lshr i64 %xor7.i218, %6
  %xor9.i220 = xor i64 %shr8.i219, %xor7.i218
  %conv.i43 = trunc i64 %xor9.i220 to i32
  %rem.i53 = urem i32 %conv.i43, %10
  %agg.tmp.sroa.0.0.insert.ext = zext i32 %rem.i53 to i64
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.0.0.insert.ext, %7
  %12 = load ptr, ptr %el, align 8, !tbaa !40
  %13 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %mul = shl i64 %13, %6
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %12, i64 %mul
  %ref.tmp16.sroa.4.0.arrayidx.i.sroa_idx = getelementptr inbounds i8, ptr %arrayidx.i, i64 %8
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %ref.tmp16.sroa.4.0.arrayidx.i.sroa_idx, align 4, !tbaa.struct !42
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"160"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !37
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %add.ptr = getelementptr inbounds %struct.EdgePair.14, ptr %1, i64 %2
  %add.ptr.sroa_idx = getelementptr inbounds i8, ptr %add.ptr, i64 %0
  %3 = load i32, ptr %add.ptr.sroa_idx, align 4
  ret i32 %3
}

define ptr @"161"(ptr %el, ptr %0, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre752 = load ptr, ptr %el, align 8, !tbaa !40
  %.pre776 = ptrtoint ptr %.pre752 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre776
  %sub.ptr.div14 = sdiv exact i64 %sub.ptr.sub13, %2
  %add.ptr.i483 = getelementptr inbounds %struct.EdgePair, ptr %.pre752, i64 %sub.ptr.div14
  store ptr %add.ptr.i483, ptr %end_size_.i, align 8, !tbaa !44
  ret ptr %add.ptr.i483
}

define i8 @"162"(ptr %0, ptr %opt_arg) {
bb:
  %1 = load i8, ptr %0, align 8, !tbaa !24
  %2 = load ptr, ptr %opt_arg, align 8, !tbaa !36
  store i8 %1, ptr %2, align 1, !tbaa !24
  ret i8 %1
}

define i32 @"163"(i32 %__value.coerce1, ptr %__first, ptr %add.ptr, ptr %add.ptr2, i64 %sub1, i64 %mul, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr2, align 4, !tbaa !59
  %3 = load i32, ptr %add.ptr, align 4, !tbaa !59
  %cmp6.i.i = icmp slt i32 %3, %2
  %spec.select = select i1 %cmp6.i.i, i64 %sub1, i64 %mul
  %add10 = shl i64 %spec.select, %0
  %sub12 = or i64 %add10, %0
  %add.ptr5.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %sub12
  %__value.sroa.4.0.add.ptr5.sroa_idx.i = getelementptr inbounds i8, ptr %add.ptr5.i, i64 %1
  store i32 %__value.coerce1, ptr %__value.sroa.4.0.add.ptr5.sroa_idx.i, align 4, !tbaa.struct !48
  ret i32 %__value.coerce1
}

define i32 @"165"(i32 %0, ptr %end_size_.i.i, i64 %1) {
bb:
  %.pre.pre.i189 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !44
  %val.sroa.2.0..sroa_idx.i172 = getelementptr inbounds i8, ptr %.pre.pre.i189, i64 %1
  store i32 %0, ptr %val.sroa.2.0..sroa_idx.i172, align 4, !tbaa.struct !48
  ret i32 %0
}

define i64 @"166"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %2) {
bb:
  %3 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !39
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %agg.result, align 8, !tbaa !37
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = ashr exact i64 %sub.ptr.sub.i12.i.i, %2
  %5 = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr.i.i149 = getelementptr inbounds %struct.EdgePair.14, ptr %5, i64 %sub.ptr.div.i13.i.i
  %6 = load i32, ptr %v, align 4, !tbaa !8
  %sub = add nsw i32 %6, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %add.ptr.i.i149, align 4, !tbaa.struct !42
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"167"(ptr %v, i64 %0, ptr %end_size_.i.i, i64 %1) {
bb:
  %agg.tmp73.sroa.0.0.copyload = load i64, ptr %v, align 8, !tbaa.struct !42
  %2 = lshr i64 %agg.tmp73.sroa.0.0.copyload, %0
  %3 = trunc i64 %2 to i32
  %4 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !44
  %val.sroa.2.0..sroa_idx.i = getelementptr inbounds i8, ptr %4, i64 %1
  store i32 %3, ptr %val.sroa.2.0..sroa_idx.i, align 4, !tbaa.struct !48
  ret i32 %3
}

define i64 @"168"(ptr %offsets, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %2 = sext i32 %1 to i64
  %indvars.iv.next = add nsw i64 %2, %0
  %3 = load ptr, ptr %offsets, align 8, !tbaa !10
  %arrayidx.i.1 = getelementptr inbounds i64, ptr %3, i64 %indvars.iv.next
  %4 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !6
  ret i64 %4
}

define i64 @"169"(ptr %neighs, ptr %arrayidx.i561, i64 %0, i64 %total_missing_inv.0692, ptr %arrayidx.i555) {
bb:
  %1 = load ptr, ptr %neighs, align 8, !tbaa !4
  %2 = load i32, ptr %arrayidx.i555, align 4, !tbaa !0
  %conv168 = sext i32 %2 to i64
  %add169 = add nsw i64 %total_missing_inv.0692, %conv168
  %3 = xor i64 %add169, %0
  %4 = load i64, ptr %arrayidx.i561, align 8, !tbaa !6
  %i213.0.prol = add nsw i64 %4, %0
  %sub224 = add i64 %i213.0.prol, %3
  %arrayidx225 = getelementptr inbounds %struct.NodeWeight, ptr %1, i64 %sub224
  %5 = load i64, ptr %arrayidx225, align 4
  ret i64 %5
}

define i64 @"170"(ptr %neighs, ptr %arrayidx.i564, ptr %arrayidx.i565) {
bb:
  %0 = load ptr, ptr %neighs, align 8, !tbaa !4
  %1 = load i64, ptr %arrayidx.i564, align 8, !tbaa !6
  %2 = load i32, ptr %arrayidx.i565, align 4, !tbaa !0
  %conv259 = sext i32 %2 to i64
  %add260 = add nsw i64 %1, %conv259
  %arrayidx270 = getelementptr inbounds %struct.NodeWeight, ptr %0, i64 %add260
  %3 = load i64, ptr %arrayidx270, align 4
  ret i64 %3
}

define i64 @"171"(ptr %w.i, i64 %0, ptr %v, i32 %1, ptr %agg.tmp.4.sroa_idx) {
bb:
  %2 = load i32, ptr %v, align 4, !tbaa !8
  %sub14 = add nsw i32 %2, %1
  %agg.tmp12.sroa.0.0.insert.ext = zext i32 %sub14 to i64
  %3 = load i32, ptr %w.i, align 4, !tbaa !80
  %agg.tmp12.sroa.2.0.insert.ext = zext i32 %3 to i64
  %agg.tmp12.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp12.sroa.2.0.insert.ext, %0
  %agg.tmp12.sroa.0.0.insert.insert = or i64 %agg.tmp12.sroa.2.0.insert.shift, %agg.tmp12.sroa.0.0.insert.ext
  store i64 %agg.tmp12.sroa.0.0.insert.insert, ptr %agg.tmp.4.sroa_idx, align 4, !tbaa.struct !42
  ret i64 %agg.tmp12.sroa.0.0.insert.insert
}

define i64 @"172"(ptr %offsets, ptr %arrayidx270, i64 %0) {
bb:
  %.pre765 = load ptr, ptr %offsets, align 8, !tbaa !10
  %1 = load i64, ptr %arrayidx270, align 4
  %sext = shl i64 %1, %0
  %conv273 = ashr exact i64 %sext, %0
  %arrayidx.i567 = getelementptr inbounds i64, ptr %.pre765, i64 %conv273
  %2 = load i64, ptr %arrayidx.i567, align 8, !tbaa !6
  ret i64 %2
}

define i64 @"173"(ptr %__first.addr.033.i.i, ptr %el, i64 %0) {
bb:
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.033.i.i, align 4
  %.pre671.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair.14, ptr %.pre671.pre, i64 %0
  store i64 %agg.tmp.sroa.0.0.copyload.i.i.i, ptr %incdec.ptr13.i.i.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i32 @"174"(ptr %arrayidx.i73, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i76, i64 %4, i64 %5, i64 %xor4.i79, i64 %6, i64 %xor7.i82, ptr %num_nodes_, ptr %el, ptr %.omp.lb) {
bb:
  %7 = load ptr, ptr %el, align 8, !tbaa !40
  %8 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %mul = shl i64 %8, %6
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %7, i64 %mul
  %9 = load i64, ptr %arrayidx.i73, align 8, !tbaa !6
  %shr.i74 = lshr i64 %9, %0
  %and.i75 = and i64 %shr.i74, %1
  %xor.i762 = xor i64 %and.i75, %9
  %shl.i77 = shl i64 %xor.i76, %2
  %and3.i78 = and i64 %shl.i77, %3
  %xor4.i794 = xor i64 %and3.i78, %xor.i76
  %shl5.i80 = shl i64 %xor4.i79, %4
  %and6.i81 = and i64 %shl5.i80, %5
  %xor7.i826 = xor i64 %and6.i81, %xor4.i79
  %shr8.i83 = lshr i64 %xor7.i82, %6
  %xor9.i84 = xor i64 %shr8.i83, %xor7.i82
  %conv.i = trunc i64 %xor9.i84 to i32
  %10 = load i64, ptr %num_nodes_, align 8, !tbaa !71
  %11 = trunc i64 %10 to i32
  %rem.i = urem i32 %conv.i, %11
  store i32 %rem.i, ptr %arrayidx.i, align 4, !tbaa.struct !45
  ret i32 %rem.i
}

define i32 @"175"(ptr %call148, ptr %0, ptr %arrayidx.i507) {
bb:
  %.pre679 = load i64, ptr %0, align 8, !tbaa !6
  %1 = load i32, ptr %arrayidx.i507, align 4, !tbaa !0
  %conv213 = sext i32 %1 to i64
  %add214 = add nsw i64 %.pre679, %conv213
  %arrayidx223 = getelementptr inbounds i32, ptr %call148, i64 %add214
  %2 = load i32, ptr %arrayidx223, align 4, !tbaa !0
  ret i32 %2
}

define ptr @"176"(ptr %new_range.i.i418, ptr %0, ptr %el, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre.i.i437 = load ptr, ptr %new_range.i.i418, align 8, !tbaa !4
  %.pre672 = load ptr, ptr %el, align 8, !tbaa !37
  %.pre691 = ptrtoint ptr %.pre672 to i64
  %2 = load ptr, ptr %el, align 8, !tbaa !37
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair.14, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre691
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr.i425 = getelementptr inbounds %struct.EdgePair.14, ptr %.pre.i.i437, i64 %sub.ptr.div14
  store ptr %add.ptr.i425, ptr %end_size_.i, align 8, !tbaa !39
  ret ptr %add.ptr.i425
}

define ptr @"177"(ptr %el, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %0) {
bb:
  %.pre750 = load ptr, ptr %end_size_.i, align 8, !tbaa !44
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre750 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %0
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !44
  ret ptr %add.ptr.i
}

define <2 x i32> @"178"(ptr %el) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %0 = load <2 x i32>, ptr %.pre, align 4
  ret <2 x i32> %0
}

define i32 @"179"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %el, align 8, !tbaa !37
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add.ptr = getelementptr inbounds %struct.EdgePair.14, ptr %3, i64 %ind.end
  %add.ptr.sroa_idx = getelementptr inbounds i8, ptr %add.ptr, i64 %2
  %6 = load i32, ptr %add.ptr.sroa_idx, align 4
  ret i32 %6
}

define i64 @"180"(ptr %e.8.sroa_idx, i64 %0, ptr %e, i64 %1, ptr %2, ptr %offsets, i64 %3) {
bb:
  %e.0.e.0.e.0.agg.tmp.sroa.0.0.copyload = load i64, ptr %e, align 8
  %retval.sroa.0.0.insert.ext.i = and i64 %e.0.e.0.e.0.agg.tmp.sroa.0.0.copyload, %1
  %e.8.e.8.e.8.agg.tmp.sroa.2.0.copyload = load i32, ptr %e.8.sroa_idx, align 8, !tbaa.struct !48
  %retval.sroa.2.0.insert.ext.i = zext i32 %e.8.e.8.e.8.agg.tmp.sroa.2.0.copyload to i64
  %retval.sroa.2.0.insert.shift.i = shl nuw i64 %retval.sroa.2.0.insert.ext.i, %0
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i
  %4 = load ptr, ptr %2, align 8, !tbaa !4
  %conv26 = ashr i64 %e.0.e.0.e.0.agg.tmp.sroa.0.0.copyload, %0
  %5 = load ptr, ptr %offsets, align 8, !tbaa !10
  %arrayidx.i44 = getelementptr inbounds i64, ptr %5, i64 %conv26
  %6 = atomicrmw add ptr %arrayidx.i44, i64 %3 seq_cst, align 8
  %arrayidx30 = getelementptr inbounds %struct.NodeWeight, ptr %4, i64 %6
  store i64 %retval.sroa.0.0.insert.insert.i, ptr %arrayidx30, align 4, !tbaa.struct !42
  ret i64 %retval.sroa.0.0.insert.insert.i
}

define i32 @"181"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %add16.1 = add i64 %2, %0
  %3 = load ptr, ptr %el, align 8, !tbaa !40
  %add.ptr.epil = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %add16.1
  %e.sroa.5.0.add.ptr.sroa_idx.epil = getelementptr inbounds i8, ptr %add.ptr.epil, i64 %1
  %e.sroa.5.0.copyload.epil = load i32, ptr %e.sroa.5.0.add.ptr.sroa_idx.epil, align 4, !tbaa.struct !42
  ret i32 %e.sroa.5.0.copyload.epil
}

define i32 @"182"(i64 %indvars.iv731, ptr %incdec.ptr4.sink.i.i.i.i, ptr %w.i.i.i.i, i32 %0, ptr %__first.addr.016.i.i, ptr %neighs, ptr %arrayidx.i543, i64 %sub.ptr.rhs.cast.i.i.i.i546, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %arrayidx.i543, align 8, !tbaa !6
  %4 = load ptr, ptr %neighs, align 8, !tbaa !4
  %add.ptr131 = getelementptr inbounds %struct.NodeWeight, ptr %4, i64 %3
  %sub.ptr.lhs.cast.i.i.i.i545 = ptrtoint ptr %add.ptr131 to i64
  %sub.ptr.sub.i.i.i.i547 = sub i64 %sub.ptr.lhs.cast.i.i.i.i545, %sub.ptr.rhs.cast.i.i.i.i546
  %sub.ptr.div.i.i.i.i = lshr exact i64 %sub.ptr.sub.i.i.i.i547, %1
  %shr.i.i = lshr i64 %sub.ptr.div.i.i.i.i, %2
  %incdec.ptr4.sink.i.i.i.i2 = getelementptr inbounds %struct.NodeWeight, ptr %__first.addr.016.i.i, i64 %shr.i.i
  %incdec.ptr.i.i = getelementptr inbounds %struct.NodeWeight, ptr %incdec.ptr4.sink.i.i.i.i, i64 %2
  %5 = load i32, ptr %incdec.ptr4.sink.i.i.i.i, align 4, !tbaa !8
  %6 = sext i32 %5 to i64
  %cmp7.i.i.i.i = icmp sgt i64 %indvars.iv731, %6
  %7 = zext i32 %5 to i64
  %cmp.i.i10.i.i = icmp eq i64 %indvars.iv731, %7
  %8 = load i32, ptr %w.i.i.i.i, align 4
  %cmp4.i.i.i.i = icmp slt i32 %8, %0
  %cond.i.i.i.i = select i1 %cmp.i.i10.i.i, i1 %cmp4.i.i.i.i, i1 %cmp7.i.i.i.i
  %__first.addr.1.i.i = select i1 %cond.i.i.i.i, ptr %incdec.ptr.i.i, ptr %__first.addr.016.i.i
  %9 = load i32, ptr %__first.addr.1.i.i, align 4, !tbaa !8
  ret i32 %9
}

define i64 @"183"(ptr %arrayidx.i207, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i210, i64 %4, i64 %5, i64 %xor4.i213, i64 %6, i64 %xor7.i216, ptr %num_nodes_, i64 %7, ptr %arrayidx.i64, i64 %xor.i66, i64 %xor4.i, i64 %xor7.i, i32 %8, ptr %el, ptr %.omp.lb) {
bb:
  %9 = load i64, ptr %num_nodes_, align 8, !tbaa !81
  %10 = trunc i64 %9 to i32
  %11 = load i64, ptr %arrayidx.i207, align 8, !tbaa !6
  %shr.i208 = lshr i64 %11, %0
  %and.i209 = and i64 %shr.i208, %1
  %xor.i2102 = xor i64 %and.i209, %11
  %shl.i211 = shl i64 %xor.i210, %2
  %and3.i212 = and i64 %shl.i211, %3
  %xor4.i2134 = xor i64 %and3.i212, %xor.i210
  %shl5.i214 = shl i64 %xor4.i213, %4
  %and6.i215 = and i64 %shl5.i214, %5
  %xor7.i2166 = xor i64 %and6.i215, %xor4.i213
  %shr8.i217 = lshr i64 %xor7.i216, %6
  %xor9.i218 = xor i64 %shr8.i217, %xor7.i216
  %conv.i41 = trunc i64 %xor9.i218 to i32
  %rem.i51 = urem i32 %conv.i41, %8
  %ref.tmp15.sroa.4.0.insert.ext = zext i32 %rem.i51 to i64
  %ref.tmp15.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp15.sroa.4.0.insert.ext, %7
  %12 = load i64, ptr %arrayidx.i64, align 8, !tbaa !6
  %shr.i65 = lshr i64 %12, %0
  %and.i = and i64 %shr.i65, %1
  %xor.i668 = xor i64 %and.i, %12
  %shl.i = shl i64 %xor.i66, %2
  %and3.i = and i64 %shl.i, %3
  %xor4.i10 = xor i64 %and3.i, %xor.i66
  %shl5.i = shl i64 %xor4.i, %4
  %and6.i = and i64 %shl5.i, %5
  %xor7.i12 = xor i64 %and6.i, %xor4.i
  %shr8.i = lshr i64 %xor7.i, %6
  %xor9.i = xor i64 %shr8.i, %xor7.i
  %conv7.i = trunc i64 %xor9.i to i32
  %rem.i = urem i32 %conv7.i, %8
  %ref.tmp15.sroa.0.0.insert.ext = zext i32 %rem.i to i64
  %ref.tmp15.sroa.0.0.insert.insert = or i64 %ref.tmp15.sroa.4.0.insert.shift, %ref.tmp15.sroa.0.0.insert.ext
  %13 = load ptr, ptr %el, align 8, !tbaa !37
  %14 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %mul = shl i64 %14, %6
  %arrayidx.i = getelementptr inbounds %struct.EdgePair.14, ptr %13, i64 %mul
  store i64 %ref.tmp15.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp15.sroa.0.0.insert.insert
}

define i64 @"184"(ptr %e.4.sroa_idx, ptr %0, ptr %offsets, ptr %e, i64 %1) {
bb:
  %2 = load ptr, ptr %0, align 8, !tbaa !4
  %3 = load ptr, ptr %offsets, align 8, !tbaa !10
  %e.0.e.0.e.0. = load i32, ptr %e, align 8, !tbaa !59
  %conv = sext i32 %e.0.e.0.e.0. to i64
  %arrayidx.i = getelementptr inbounds i64, ptr %3, i64 %conv
  %4 = atomicrmw add ptr %arrayidx.i, i64 %1 seq_cst, align 8
  %arrayidx = getelementptr inbounds %struct.NodeWeight, ptr %2, i64 %4
  %e.4.e.4.e.4. = load i64, ptr %e.4.sroa_idx, align 4
  store i64 %e.4.e.4.e.4., ptr %arrayidx, align 4
  ret i64 %e.4.e.4.e.4.
}

define i64 @"185"(ptr %offsets, ptr %num_nodes_.i, i32 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !10
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !46
  %3 = trunc i64 %2 to i32
  %n197.0700 = add i32 %3, %0
  %4 = zext i32 %n197.0700 to i64
  %arrayidx.i559 = getelementptr inbounds i64, ptr %1, i64 %4
  %5 = load i64, ptr %arrayidx.i559, align 8, !tbaa !6
  ret i64 %5
}

define i64 @"186"(ptr %_M_string_length.i.i.i, i64 %call, ptr %__dnew.i.i.i) {
bb:
  %0 = load i64, ptr %_M_string_length.i.i.i, align 8, !tbaa !50, !noalias !83
  %sub.i.i.i = sub i64 %0, %call
  store i64 %sub.i.i.i, ptr %__dnew.i.i.i, align 8, !tbaa !6, !noalias !83
  ret i64 %sub.i.i.i
}

define i64 @"187"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !10
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !46
  %sext778 = shl i64 %2, %0
  %conv215 = ashr exact i64 %sext778, %0
  %arrayidx.i561 = getelementptr inbounds i64, ptr %1, i64 %conv215
  %3 = load i64, ptr %arrayidx.i561, align 8, !tbaa !6
  ret i64 %3
}

define i64 @"188"(ptr %el, i64 %0, i64 %1) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr13.i.i.i.i, i64 %1
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.030.i.i, align 4, !tbaa.struct !45
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i64 @"189"(ptr %neighs, ptr %arrayidx.i561, i64 %0, i64 %total_missing_inv.0692, ptr %arrayidx.i555) {
bb:
  %1 = load i32, ptr %arrayidx.i555, align 4, !tbaa !0
  %conv168 = sext i32 %1 to i64
  %add169 = add nsw i64 %total_missing_inv.0692, %conv168
  %2 = load i64, ptr %arrayidx.i561, align 8, !tbaa !6
  %i213.0.1 = add nsw i64 %2, %0
  %sub224.1 = sub nsw i64 %i213.0.1, %add169
  %3 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx225.1 = getelementptr inbounds %struct.NodeWeight, ptr %3, i64 %sub224.1
  %4 = load i64, ptr %arrayidx225.1, align 4
  ret i64 %4
}

define i32 @"190"(ptr %call148, ptr %arrayidx.i509, ptr %arrayidx.i510, ptr %arrayidx.i511, i64 %sub.ptr.rhs.cast.i.i.i.i513, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i509, align 8, !tbaa !6
  %add.ptr227 = getelementptr inbounds i32, ptr %call148, i64 %2
  %3 = load i32, ptr %arrayidx.i510, align 4, !tbaa !0
  %idx.ext = sext i32 %3 to i64
  %add.ptr230 = getelementptr inbounds i32, ptr %add.ptr227, i64 %idx.ext
  %4 = load i64, ptr %arrayidx.i511, align 8, !tbaa !6
  %add.ptr234 = getelementptr inbounds i32, ptr %call148, i64 %4
  %sub.ptr.lhs.cast.i.i.i.i512 = ptrtoint ptr %add.ptr234 to i64
  %sub.ptr.sub.i.i.i.i514 = sub i64 %sub.ptr.lhs.cast.i.i.i.i512, %sub.ptr.rhs.cast.i.i.i.i513
  %sub.ptr.div.i.i.i.i522 = lshr exact i64 %sub.ptr.sub.i.i.i.i514, %0
  %shr.i.i526 = lshr i64 %sub.ptr.div.i.i.i.i522, %1
  %incdec.ptr4.sink.i.i.i.i530 = getelementptr inbounds i32, ptr %add.ptr230, i64 %shr.i.i526
  %5 = load i32, ptr %incdec.ptr4.sink.i.i.i.i530, align 4, !tbaa !0
  ret i32 %5
}

define i64 @"191"(ptr %arrayidx225.1, ptr %neighs, ptr %arrayidx.i558, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i558, align 8, !tbaa !6
  %sub196 = add nsw i64 %1, %0
  %dec227 = add nsw i64 %sub196, %0
  %2 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx226.1 = getelementptr inbounds %struct.NodeWeight, ptr %2, i64 %dec227
  %3 = load i64, ptr %arrayidx225.1, align 4
  store i64 %3, ptr %arrayidx226.1, align 4
  ret i64 %3
}

define <2 x i32> @"192"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %incdec.ptr123.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %1 = load <2 x i32>, ptr %incdec.ptr123.i.i, align 4
  ret <2 x i32> %1
}

define i32 @"194"(ptr %n_start.0.in, i64 %0, i64 %1) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  %incdec.ptr12.i.i.i.i = getelementptr inbounds %struct.NodeWeight, ptr %n_start.0, i64 %0
  %__first.addr.031.i.i = getelementptr inbounds %struct.NodeWeight, ptr %incdec.ptr12.i.i.i.i, i64 %1
  %2 = load i32, ptr %__first.addr.031.i.i, align 4, !tbaa !8
  ret i32 %2
}

define i32 @"196"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !0
  %1 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !0
  %cmp.i.i.i.i.i = icmp slt i32 %1, %0
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add.ptr3.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i.i.i.i
  %2 = load i32, ptr %add.ptr3.i.i.i.i, align 4, !tbaa !0
  ret i32 %2
}

define <2 x i64> @"197"(ptr %0, <2 x i64> %1, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %7) {
bb:
  %wide.load393 = load <2 x i64>, ptr %0, align 8, !tbaa !6
  %8 = and <2 x i64> %wide.load393, %3
  %9 = icmp eq <2 x i64> %8, %5
  %10 = select <2 x i1> %9, <2 x i64> %5, <2 x i64> %6
  %11 = shufflevector <2 x i64> %wide.load393, <2 x i64> %wide.load393, <2 x i32> <i32 1, i32 2>
  %12 = and <2 x i64> %11, %2
  %13 = and <2 x i64> %wide.load393, %1
  %14 = or <2 x i64> %13, %12
  %15 = lshr exact <2 x i64> %14, %3
  %wide.load394 = load <2 x i64>, ptr %4, align 8, !tbaa !6
  %16 = xor <2 x i64> %15, %wide.load394
  %17 = xor <2 x i64> %16, %10
  store <2 x i64> %17, ptr %7, align 8, !tbaa !6
  ret <2 x i64> %17
}

define i64 @"198"(ptr %__first.addr.033.i.i, ptr %el, i64 %0) {
bb:
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.033.i.i, align 4
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair.14, ptr %.pre, i64 %0
  store i64 %agg.tmp.sroa.0.0.copyload.i.i.i, ptr %incdec.ptr13.i.i.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i8 @"199"(i8 %0, ptr %ref.tmp, ptr %__dnew.i.i.i) {
bb:
  %1 = load i64, ptr %__dnew.i.i.i, align 8, !tbaa !6, !noalias !76
  %2 = load ptr, ptr %ref.tmp, align 8, !tbaa !36, !alias.scope !76
  %arrayidx.i.i.i.i = getelementptr inbounds i8, ptr %2, i64 %1
  store i8 %0, ptr %arrayidx.i.i.i.i, align 1, !tbaa !24
  ret i8 %0
}

define i32 @"200"(ptr %__first, ptr %add.ptr.i, ptr %add.ptr2.i, i64 %sub1.i, i64 %mul.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr.i, align 4, !tbaa !0
  %3 = load i32, ptr %add.ptr2.i, align 4, !tbaa !0
  %cmp.i.i = icmp slt i32 %2, %3
  %spec.select.i = select i1 %cmp.i.i, i64 %sub1.i, i64 %mul.i
  %__parent.020.in.i.i = add nsw i64 %spec.select.i, %0
  %__parent.020.i.i = sdiv i64 %__parent.020.in.i.i, %1
  %add.ptr.i.i = getelementptr inbounds i32, ptr %__first, i64 %__parent.020.i.i
  %4 = load i32, ptr %add.ptr.i.i, align 4, !tbaa !0
  ret i32 %4
}

define ptr @"201"(ptr %el, i64 %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !44
  ret ptr %add.ptr.i
}

define ptr @"202"(ptr %new_range.i.i476, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre752 = load ptr, ptr %el, align 8, !tbaa !40
  %.pre776 = ptrtoint ptr %.pre752 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre776
  %sub.ptr.div14 = sdiv exact i64 %sub.ptr.sub13, %2
  %.pre.i.i495 = load ptr, ptr %new_range.i.i476, align 8, !tbaa !4
  %add.ptr6.i.i497 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i495, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i497, ptr %end_capacity_.i.i.i, align 8, !tbaa !61
  ret ptr %add.ptr6.i.i497
}

define i64 @"203"(ptr %neighs, ptr %arrayidx.i561, i64 %total_missing_inv.0692, ptr %arrayidx.i555, i64 %0) {
bb:
  %1 = load ptr, ptr %neighs, align 8, !tbaa !4
  %2 = load i32, ptr %arrayidx.i555, align 4, !tbaa !0
  %conv168 = sext i32 %2 to i64
  %add169 = add nsw i64 %total_missing_inv.0692, %conv168
  %3 = xor i64 %add169, %0
  %4 = load i64, ptr %arrayidx.i561, align 8, !tbaa !6
  %sub224 = add i64 %4, %3
  %arrayidx225 = getelementptr inbounds %struct.NodeWeight, ptr %1, i64 %sub224
  %5 = load i64, ptr %arrayidx225, align 4
  ret i64 %5
}

define i64 @"204"(ptr %arrayidx.i25, i64 %0, ptr %arrayidx.i23, ptr %el, ptr %.omp.lb) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !37
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %arrayidx.i = getelementptr inbounds %struct.EdgePair.14, ptr %1, i64 %2
  %3 = load i32, ptr %arrayidx.i25, align 4, !tbaa !0
  %ref.tmp.sroa.4.0.insert.ext = zext i32 %3 to i64
  %ref.tmp.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp.sroa.4.0.insert.ext, %0
  %4 = load i32, ptr %arrayidx.i23, align 4, !tbaa !0
  %ref.tmp.sroa.0.0.insert.ext = zext i32 %4 to i64
  %ref.tmp.sroa.0.0.insert.insert = or i64 %ref.tmp.sroa.4.0.insert.shift, %ref.tmp.sroa.0.0.insert.ext
  store i64 %ref.tmp.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp.sroa.0.0.insert.insert
}

define i32 @"205"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %add16 = add i64 %1, %0
  %2 = load ptr, ptr %el, align 8, !tbaa !40
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %add16
  %e.sroa.0.0.copyload.1 = load i32, ptr %add.ptr.1, align 4, !tbaa.struct !45
  ret i32 %e.sroa.0.0.copyload.1
}

define i64 @"206"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !46
  %2 = and i64 %1, %0
  %sub.prol = add nuw i64 %2, %0
  %conv34.prol = and i64 %sub.prol, %0
  %3 = load ptr, ptr %offsets, align 8
  %arrayidx.i511.prol = getelementptr inbounds i64, ptr %3, i64 %conv34.prol
  %4 = load i64, ptr %arrayidx.i511.prol, align 8, !tbaa !6
  ret i64 %4
}

define ptr @"207"(ptr %el, ptr %0, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre671.pre = load ptr, ptr %el, align 8, !tbaa !37
  %.pre672 = load ptr, ptr %el, align 8, !tbaa !37
  %.pre691 = ptrtoint ptr %.pre672 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair.14, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair.14, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre691
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %add.ptr.i425 = getelementptr inbounds %struct.EdgePair.14, ptr %.pre671.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i425, ptr %end_size_.i, align 8, !tbaa !39
  ret ptr %add.ptr.i425
}

define i64 @"208"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !51
  %inc.i72 = add nuw nsw i64 %1, %0
  %inc.i208 = add nuw nsw i64 %inc.i72, %0
  store i64 %inc.i208, ptr %_M_p.i.i.i, align 8, !tbaa !51
  ret i64 %inc.i208
}

define <2 x i32> @"209"(ptr %degrees, ptr %.omp.lb, i64 %0, i64 %index, i64 %1) {
bb:
  %2 = load ptr, ptr %degrees, align 8, !tbaa !12
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %mul12 = shl i64 %3, %0
  %offset.idx = add i64 %mul12, %index
  %4 = getelementptr inbounds i32, ptr %2, i64 %offset.idx
  %5 = getelementptr inbounds i32, ptr %4, i64 %1
  %wide.load42 = load <2 x i32>, ptr %5, align 4, !tbaa !0
  ret <2 x i32> %wide.load42
}

define i32 @"210"(ptr %end_size_.i.i544, ptr %offsets, i64 %0, ptr %length.i542) {
bb:
  %1 = load ptr, ptr %end_size_.i.i544, align 8, !tbaa !53
  %sub.ptr.lhs.cast.i.i545 = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %offsets, align 8, !tbaa !10
  %sub.ptr.rhs.cast.i.i546 = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i547 = sub i64 %sub.ptr.lhs.cast.i.i545, %sub.ptr.rhs.cast.i.i546
  %3 = lshr exact i64 %sub.ptr.sub.i.i547, %0
  %conv.i548 = trunc i64 %3 to i32
  store i32 %conv.i548, ptr %length.i542, align 4, !tbaa !0
  ret i32 %conv.i548
}

define i8 @"211"(i8 %0, ptr %call2.i10.i447, ptr %__dnew.i.i437) {
bb:
  %1 = load i64, ptr %__dnew.i.i437, align 8, !tbaa !6
  %arrayidx.i.i.i442 = getelementptr inbounds i8, ptr %call2.i10.i447, i64 %1
  store i8 %0, ptr %arrayidx.i.i.i442, align 1, !tbaa !24
  ret i8 %0
}

define i64 @"212"(ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %__i.018.i, i64 %add.i, i64 %inc.i, ptr %arrayidx7.i.1) {
bb:
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !6
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
  store i64 %rem.i.i17.i.1, ptr %arrayidx7.i.1, align 8, !tbaa !6
  ret i64 %rem.i.i17.i.1
}

define ptr @"213"(ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %0) {
bb:
  %1 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !39
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %agg.result, align 8, !tbaa !37
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = ashr exact i64 %sub.ptr.sub.i12.i.i, %0
  %3 = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr.i.i149 = getelementptr inbounds %struct.EdgePair.14, ptr %3, i64 %sub.ptr.div.i13.i.i
  store ptr %add.ptr.i.i149, ptr %end_size_.i.i, align 8, !tbaa !39
  ret ptr %add.ptr.i.i149
}

define ptr @"214"(ptr %new_range.i.i, ptr %end_capacity_.i.i, ptr %agg.result, i64 %0) {
bb:
  %1 = load ptr, ptr %end_capacity_.i.i, align 8, !tbaa !49
  %sub.ptr.lhs.cast.i7.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %agg.result, align 8, !tbaa !37
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i9.i = sub i64 %sub.ptr.lhs.cast.i7.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.sub.i9.fr.i = freeze i64 %sub.ptr.sub.i9.i
  %mul.i = ashr exact i64 %sub.ptr.sub.i9.fr.i, %0
  %3 = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair.14, ptr %3, i64 %mul.i
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i, align 8, !tbaa !49
  ret ptr %add.ptr6.i.i
}

define i64 @"215"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %incdec.ptr.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i = load i64, ptr %incdec.ptr.i.i.i.i, align 4, !tbaa.struct !45
  ret i64 %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i
}

define i64 @"216"(ptr %neighs, ptr %arrayidx.i561, i64 %0, i64 %total_missing_inv.0692, ptr %arrayidx.i555) {
bb:
  %1 = load ptr, ptr %neighs, align 8, !tbaa !4
  %2 = load i64, ptr %arrayidx.i561, align 8, !tbaa !6
  %i213.0.prol = add nsw i64 %2, %0
  %3 = load i32, ptr %arrayidx.i555, align 4, !tbaa !0
  %conv168 = sext i32 %3 to i64
  %add169 = add nsw i64 %total_missing_inv.0692, %conv168
  %sub224.prol = sub nsw i64 %i213.0.prol, %add169
  %arrayidx225.prol = getelementptr inbounds %struct.NodeWeight, ptr %1, i64 %sub224.prol
  %4 = load i64, ptr %arrayidx225.prol, align 4
  ret i64 %4
}

define ptr @"217"(ptr %out_index_.i, ptr %num_nodes_.i60, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i60, align 8, !tbaa !54, !noalias !68
  %3 = add i64 %2, %0
  %n.vec = and i64 %3, %1
  %4 = load ptr, ptr %out_index_.i, align 8, !noalias !68
  %arrayidx8.i = getelementptr inbounds ptr, ptr %4, i64 %n.vec
  %5 = load ptr, ptr %arrayidx8.i, align 8, !tbaa !4, !noalias !68
  ret ptr %5
}

define <8 x i32> @"218"(ptr %el, ptr %.omp.lb, i64 %index) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %offset.idx = add i64 %0, %index
  %1 = load ptr, ptr %el, align 8, !tbaa !37
  %2 = getelementptr inbounds %struct.EdgePair.14, ptr %1, i64 %offset.idx
  %wide.vec = load <8 x i32>, ptr %2, align 4
  ret <8 x i32> %wide.vec
}

define ptr @"219"(ptr %_ZSt4cout, ptr %vbase.offset.ptr.i, i64 %0, i32 %1) {
bb:
  %vbase.offset.i = load i64, ptr %vbase.offset.ptr.i, align 8
  %add.ptr.i = getelementptr inbounds i8, ptr %_ZSt4cout, i64 %vbase.offset.i
  %_M_ctype.i.i = getelementptr inbounds %"class.std::basic_ios", ptr %add.ptr.i, i64 %0, i32 5
  %2 = load ptr, ptr %_M_ctype.i.i, align 8, !tbaa !86
  ret ptr %2
}

define i64 @"220"(ptr %arrayidx225.prol, ptr %neighs, i64 %tail_index.1.lcssa, ptr %arrayidx.i560) {
bb:
  %0 = load i64, ptr %arrayidx225.prol, align 4
  %1 = load i32, ptr %arrayidx.i560, align 4, !tbaa !0
  %conv211 = sext i32 %1 to i64
  %sub239 = sub nsw i64 %tail_index.1.lcssa, %conv211
  %2 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx226.prol = getelementptr inbounds %struct.NodeWeight, ptr %2, i64 %sub239
  store i64 %0, ptr %arrayidx226.prol, align 4
  ret i64 %0
}

define i64 @"221"(ptr %neighs, ptr %arrayidx.i561, i64 %0, i64 %1, i64 %total_missing_inv.0692, ptr %arrayidx.i555) {
bb:
  %2 = load i32, ptr %arrayidx.i555, align 4, !tbaa !0
  %conv168 = sext i32 %2 to i64
  %add169 = add nsw i64 %total_missing_inv.0692, %conv168
  %3 = load i64, ptr %arrayidx.i561, align 8, !tbaa !6
  %i213.0.prol = add nsw i64 %3, %0
  %i213.0.1 = add nsw i64 %i213.0.prol, %1
  %sub224.1 = sub nsw i64 %i213.0.1, %add169
  %4 = load ptr, ptr %neighs, align 8, !tbaa !4
  %arrayidx225.1 = getelementptr inbounds %struct.NodeWeight, ptr %4, i64 %sub224.1
  %5 = load i64, ptr %arrayidx225.1, align 4
  ret i64 %5
}

define i32 @"222"(ptr %neighs, ptr %arrayidx.i567, ptr %arrayidx.i568) {
bb:
  %0 = load i32, ptr %arrayidx.i568, align 4, !tbaa !0
  %idx.ext = sext i32 %0 to i64
  %1 = load ptr, ptr %neighs, align 8, !tbaa !4
  %2 = load i64, ptr %arrayidx.i567, align 8, !tbaa !6
  %add.ptr277 = getelementptr inbounds %struct.NodeWeight, ptr %1, i64 %2
  %add.ptr281 = getelementptr inbounds %struct.NodeWeight, ptr %add.ptr277, i64 %idx.ext
  %3 = load i32, ptr %add.ptr281, align 4, !tbaa !8
  ret i32 %3
}

define ptr @"223"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %1
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !61
  ret ptr %add.ptr6.i.i
}

define ptr @"224"(ptr %0, ptr %file, ptr %vbase.offset.ptr.i.i) {
bb:
  %vbase.offset.i.i = load i64, ptr %vbase.offset.ptr.i.i, align 8
  %add.ptr.i.i = getelementptr inbounds i8, ptr %file, i64 %vbase.offset.i.i
  %1 = load ptr, ptr %0, align 8
  store ptr %1, ptr %add.ptr.i.i, align 8, !tbaa !93
  ret ptr %1
}

define i32 @"225"(ptr %__first, ptr %v.i.i, ptr %v3.i.i, ptr %w.i.i.i, ptr %w3.i.i.i, i64 %sub1, i64 %mul, i64 %0) {
bb:
  %1 = load i32, ptr %v3.i.i, align 4, !tbaa !8
  %2 = load i32, ptr %v.i.i, align 4, !tbaa !8
  %cmp.i.i.i = icmp eq i32 %2, %1
  %3 = load i32, ptr %w3.i.i.i, align 4
  %4 = load i32, ptr %w.i.i.i, align 4
  %cmp4.i.i.i = icmp slt i32 %4, %3
  %cmp7.i.i.i = icmp slt i32 %2, %1
  %cond.i.i.i = select i1 %cmp.i.i.i, i1 %cmp4.i.i.i, i1 %cmp7.i.i.i
  %spec.select = select i1 %cond.i.i.i, i64 %sub1, i64 %mul
  %add = shl i64 %spec.select, %0
  %sub12 = or i64 %add, %0
  %add.ptr2 = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %sub1
  %5 = load i32, ptr %add.ptr2, align 4, !tbaa !59
  ret i32 %5
}

define i64 @"226"(ptr %offsets, ptr %arrayidx120, i64 %0, i64 %1) {
bb:
  %.pre759.pre772 = load ptr, ptr %offsets, align 8, !tbaa !10
  %2 = load i64, ptr %arrayidx120, align 4
  %sext670 = shl i64 %2, %0
  %sext671 = add i64 %sext670, %1
  %conv128 = ashr exact i64 %sext671, %0
  %arrayidx.i543 = getelementptr inbounds i64, ptr %.pre759.pre772, i64 %conv128
  %3 = load i64, ptr %arrayidx.i543, align 8, !tbaa !6
  ret i64 %3
}

define i32 @"227"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !37
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add.ptr = getelementptr inbounds %struct.EdgePair.14, ptr %2, i64 %ind.end
  %5 = load i32, ptr %add.ptr, align 4
  ret i32 %5
}

define i64 @"228"(i64 %local_total.040, ptr %arrayidx.i36, ptr %prefix, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %mul14 = shl i64 %1, %0
  %2 = load ptr, ptr %prefix, align 8
  %arrayidx.i35 = getelementptr inbounds i64, ptr %2, i64 %mul14
  %3 = load i32, ptr %arrayidx.i36, align 4, !tbaa !0
  %conv = sext i32 %3 to i64
  %add20 = add nsw i64 %local_total.040, %conv
  store i64 %add20, ptr %arrayidx.i35, align 8, !tbaa !6
  ret i64 %add20
}

define i64 @"229"(ptr %offsets, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %1 = sext i32 %0 to i64
  %2 = load ptr, ptr %offsets, align 8, !tbaa !10
  %arrayidx.i.prol = getelementptr inbounds i64, ptr %2, i64 %1
  %3 = load i64, ptr %arrayidx.i.prol, align 8, !tbaa !6
  ret i64 %3
}

define ptr @"230"(ptr %neighs, ptr %arrayidx.i, ptr %index, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %neighs, align 8, !tbaa !4
  %1 = load i64, ptr %arrayidx.i, align 8, !tbaa !6
  %add.ptr = getelementptr inbounds %struct.NodeWeight, ptr %0, i64 %1
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %3 = sext i32 %2 to i64
  %4 = load ptr, ptr %index, align 8, !tbaa !4
  %arrayidx = getelementptr inbounds ptr, ptr %4, i64 %3
  store ptr %add.ptr, ptr %arrayidx, align 8, !tbaa !4
  ret ptr %add.ptr
}

define i8 @"231"(ptr %arrayidx17.i.i, ptr %ref.tmp, i64 %conv5.i) {
bb:
  %0 = load ptr, ptr %ref.tmp, align 8, !tbaa !36, !alias.scope !95
  %arrayidx.i.i = getelementptr inbounds i8, ptr %0, i64 %conv5.i
  %1 = load i8, ptr %arrayidx17.i.i, align 2, !tbaa !24, !noalias !95
  store i8 %1, ptr %arrayidx.i.i, align 1, !tbaa !24
  ret i8 %1
}

define i32 @"232"(ptr %call148, ptr %arrayidx.i503, i64 %0, i64 %total_missing_inv.0610, ptr %arrayidx.i497) {
bb:
  %1 = load i32, ptr %arrayidx.i497, align 4, !tbaa !0
  %conv137 = sext i32 %1 to i64
  %add138 = add nsw i64 %total_missing_inv.0610, %conv137
  %2 = load i64, ptr %arrayidx.i503, align 8, !tbaa !6
  %i174.0 = add nsw i64 %2, %0
  %sub183 = sub nsw i64 %i174.0, %add138
  %arrayidx184 = getelementptr inbounds i32, ptr %call148, i64 %sub183
  %3 = load i32, ptr %arrayidx184, align 4, !tbaa !0
  ret i32 %3
}

define i64 @"233"(ptr %arrayidx.i554, i64 %total_missing_inv.0692, ptr %arrayidx.i555, ptr %offsets, i64 %indvars.iv735) {
bb:
  %.pre759.pre = load ptr, ptr %offsets, align 8, !tbaa !10
  %arrayidx.i5542 = getelementptr inbounds i64, ptr %.pre759.pre, i64 %indvars.iv735
  %0 = load i32, ptr %arrayidx.i555, align 4, !tbaa !0
  %conv168 = sext i32 %0 to i64
  %add169 = add nsw i64 %total_missing_inv.0692, %conv168
  %1 = load i64, ptr %arrayidx.i554, align 8, !tbaa !6
  %add165 = add nsw i64 %1, %add169
  store i64 %add165, ptr %arrayidx.i554, align 8, !tbaa !6
  ret i64 %add165
}

define i64 @"234"(ptr %v.i, i64 %0, ptr %agg.tmp.i.4.sroa_idx) {
bb:
  %1 = load i32, ptr %v.i, align 4, !tbaa !0, !noalias !98
  %agg.tmp6.sroa.0.0.insert.ext.i = zext i32 %1 to i64
  %agg.tmp6.sroa.0.0.insert.insert.i = or i64 %agg.tmp6.sroa.0.0.insert.ext.i, %0
  store i64 %agg.tmp6.sroa.0.0.insert.insert.i, ptr %agg.tmp.i.4.sroa_idx, align 4, !tbaa.struct !42, !noalias !98
  ret i64 %agg.tmp6.sroa.0.0.insert.insert.i
}

define ptr @"235"(ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %0) {
bb:
  %1 = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %2 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !44
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %agg.result, align 8, !tbaa !40
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = sdiv exact i64 %sub.ptr.sub.i12.i.i, %0
  %add.ptr.i.i151 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %sub.ptr.div.i13.i.i
  store ptr %add.ptr.i.i151, ptr %end_size_.i.i, align 8, !tbaa !44
  ret ptr %add.ptr.i.i151
}

define i64 @"236"(ptr %offsets, i64 %indvars.iv741) {
bb:
  %.pre763 = load ptr, ptr %offsets, align 8, !tbaa !10
  %arrayidx.i564 = getelementptr inbounds i64, ptr %.pre763, i64 %indvars.iv741
  %0 = load i64, ptr %arrayidx.i564, align 8, !tbaa !6
  ret i64 %0
}

define ptr @"237"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair.14, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair.14, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !49
  ret ptr %add.ptr6.i.i
}

define i64 @"238"(ptr %agg.tmp, ptr %end_size_.i.i) {
bb:
  %agg.tmp.0.agg.tmp.0.agg.tmp.0.agg.tmp.coerce.sroa.0.0.copyload = load i64, ptr %agg.tmp, align 8
  %.pre.pre.i = load ptr, ptr %end_size_.i.i, align 8, !tbaa !44
  store i64 %agg.tmp.0.agg.tmp.0.agg.tmp.0.agg.tmp.coerce.sroa.0.0.copyload, ptr %.pre.pre.i, align 4, !tbaa.struct !45
  ret i64 %agg.tmp.0.agg.tmp.0.agg.tmp.0.agg.tmp.coerce.sroa.0.0.copyload
}

define ptr @"239"(ptr %el, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1) {
bb:
  %.pre750 = load ptr, ptr %end_size_.i, align 8, !tbaa !44
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre750 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre752 = load ptr, ptr %el, align 8, !tbaa !40
  %.pre776 = ptrtoint ptr %.pre752 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre776
  %sub.ptr.div14 = sdiv exact i64 %sub.ptr.sub13, %1
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %add.ptr.i483 = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i483, ptr %end_size_.i, align 8, !tbaa !44
  ret ptr %add.ptr.i483
}

define i32 @"240"(ptr %arrayidx184, ptr %call148, i64 %tail_index.0621, ptr %arrayidx.i503, ptr %arrayidx.i501, ptr %arrayidx.i502, i64 %0) {
bb:
  %1 = load i32, ptr %arrayidx.i502, align 4, !tbaa !0
  %conv172 = sext i32 %1 to i64
  %2 = load i64, ptr %arrayidx.i501, align 8, !tbaa !6
  %add173 = add nsw i64 %2, %conv172
  %3 = load i64, ptr %arrayidx.i503, align 8, !tbaa !6
  %4 = sub i64 %3, %add173
  %n.vec754 = and i64 %4, %0
  %ind.end757 = sub i64 %tail_index.0621, %n.vec754
  %.pre678 = load i32, ptr %arrayidx.i502, align 4, !tbaa !0
  %.pre692 = sext i32 %.pre678 to i64
  %sub197 = sub nsw i64 %ind.end757, %.pre692
  %arrayidx185 = getelementptr inbounds i32, ptr %call148, i64 %sub197
  %5 = load i32, ptr %arrayidx184, align 4, !tbaa !0
  store i32 %5, ptr %arrayidx185, align 4, !tbaa !0
  ret i32 %5
}

define ptr @"241"(ptr %el, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1) {
bb:
  %.pre750 = load ptr, ptr %end_size_.i, align 8, !tbaa !44
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre750 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre752 = load ptr, ptr %el, align 8, !tbaa !40
  %.pre776 = ptrtoint ptr %.pre752 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre776
  %sub.ptr.div14 = sdiv exact i64 %sub.ptr.sub13, %1
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %add.ptr.i483 = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i483, ptr %end_size_.i, align 8, !tbaa !44
  ret ptr %add.ptr.i483
}

define <2 x i64> @"242"(ptr %0, ptr %offsets, ptr %num_nodes_.i, i64 %1, i64 %index824, i64 %2) {
bb:
  %wide.load = load <2 x i64>, ptr %0, align 8, !tbaa !6
  %3 = load ptr, ptr %offsets, align 8
  %4 = load i64, ptr %num_nodes_.i, align 8, !tbaa !46
  %5 = and i64 %4, %1
  %offset.idx = sub i64 %5, %index824
  %6 = getelementptr inbounds i64, ptr %3, i64 %offset.idx
  %7 = getelementptr inbounds i64, ptr %6, i64 %2
  store <2 x i64> %wide.load, ptr %7, align 8, !tbaa !6
  ret <2 x i64> %wide.load
}

define i64 @"243"(ptr %help_strings_.i.i, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %help_strings_.i.i, align 8, !tbaa !43
  %_M_string_length.i.i.i.i.i.i.i.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %2, i64 %0, i32 1
  %3 = load i64, ptr %_M_string_length.i.i.i.i.i.i.i.i.i.i, align 8, !tbaa !50
  ret i64 %3
}

define <2 x i64> @"244"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %.omp.lb, i64 %3, i64 %4, i64 %5, <2 x i64> %6, <2 x i64> %7, ptr %8, <2 x i64> %9, <2 x i64> %10, ptr %11) {
bb:
  %wide.load92 = load <2 x i64>, ptr %0, align 8, !tbaa !6
  %12 = and <2 x i64> %wide.load92, %7
  %13 = icmp eq <2 x i64> %12, %9
  %14 = select <2 x i1> %13, <2 x i64> %9, <2 x i64> %10
  %wide.load93 = load <2 x i64>, ptr %8, align 8, !tbaa !6
  %15 = and <2 x i64> %wide.load92, %1
  %16 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %add8 = add i64 %16, %3
  %rem.i.i.i = and i64 %add8, %4
  %vector.recur.init90 = insertelement <2 x i64> %2, i64 %rem.i.i.i, i64 %5
  %17 = shufflevector <2 x i64> %vector.recur.init90, <2 x i64> %wide.load92, <2 x i32> <i32 1, i32 2>
  %18 = and <2 x i64> %17, %6
  %19 = or <2 x i64> %15, %18
  %20 = lshr exact <2 x i64> %19, %7
  %21 = xor <2 x i64> %20, %wide.load93
  %22 = xor <2 x i64> %21, %14
  store <2 x i64> %22, ptr %11, align 8, !tbaa !6
  ret <2 x i64> %22
}

define ptr @"245"(ptr %index, i64 %indvars.iv747) {
bb:
  %0 = load ptr, ptr %index, align 8, !tbaa !4
  %arrayidx66 = getelementptr inbounds ptr, ptr %0, i64 %indvars.iv747
  %1 = load ptr, ptr %arrayidx66, align 8, !tbaa !4
  ret ptr %1
}

define i64 @"246"(ptr %offsets, ptr %arrayidx270, i64 %0, i64 %1) {
bb:
  %.pre763 = load ptr, ptr %offsets, align 8, !tbaa !10
  %2 = load i64, ptr %arrayidx270, align 4
  %sext = shl i64 %2, %0
  %sext669 = add i64 %sext, %1
  %conv284 = ashr exact i64 %sext669, %0
  %arrayidx.i569 = getelementptr inbounds i64, ptr %.pre763, i64 %conv284
  %3 = load i64, ptr %arrayidx.i569, align 8, !tbaa !6
  ret i64 %3
}

define i32 @"247"(ptr %__first, ptr %v.i.i, ptr %v3.i.i, ptr %w.i.i.i, ptr %w3.i.i.i, i64 %sub1, i64 %mul, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %v3.i.i, align 4, !tbaa !8
  %3 = load i32, ptr %v.i.i, align 4, !tbaa !8
  %cmp.i.i.i = icmp eq i32 %3, %2
  %4 = load i32, ptr %w3.i.i.i, align 4
  %5 = load i32, ptr %w.i.i.i, align 4
  %cmp4.i.i.i = icmp slt i32 %5, %4
  %cmp7.i.i.i = icmp slt i32 %3, %2
  %cond.i.i.i = select i1 %cmp.i.i.i, i1 %cmp4.i.i.i, i1 %cmp7.i.i.i
  %spec.select = select i1 %cond.i.i.i, i64 %sub1, i64 %mul
  %add = shl i64 %spec.select, %0
  %mul2 = add i64 %add, %1
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %mul
  %6 = load i32, ptr %add.ptr, align 4, !tbaa !59
  ret i32 %6
}

define i32 @"248"(i32 %__value.coerce1, ptr %__first, ptr %v.i.i, ptr %v3.i.i, ptr %w.i.i.i, ptr %w3.i.i.i, i64 %sub1, i64 %mul, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %v3.i.i, align 4, !tbaa !8
  %3 = load i32, ptr %v.i.i, align 4, !tbaa !8
  %cmp.i.i.i = icmp eq i32 %3, %2
  %4 = load i32, ptr %w3.i.i.i, align 4
  %5 = load i32, ptr %w.i.i.i, align 4
  %cmp4.i.i.i = icmp slt i32 %5, %4
  %cmp7.i.i.i = icmp slt i32 %3, %2
  %cond.i.i.i = select i1 %cmp.i.i.i, i1 %cmp4.i.i.i, i1 %cmp7.i.i.i
  %spec.select = select i1 %cond.i.i.i, i64 %sub1, i64 %mul
  %add10 = shl i64 %spec.select, %0
  %sub12 = or i64 %add10, %0
  %add.ptr5.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %sub12
  %__value.sroa.4.0.add.ptr5.sroa_idx.i = getelementptr inbounds i8, ptr %add.ptr5.i, i64 %1
  store i32 %__value.coerce1, ptr %__value.sroa.4.0.add.ptr5.sroa_idx.i, align 4, !tbaa.struct !48
  ret i32 %__value.coerce1
}

define ptr @"249"(ptr %call.i5155, ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, ptr %end_size_.i53) {
bb:
  %2 = load ptr, ptr %degrees, align 8, !tbaa !12
  %sub.ptr.rhs.cast.i48 = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !14
  %sub.ptr.lhs.cast.i47 = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i49 = sub i64 %sub.ptr.lhs.cast.i47, %sub.ptr.rhs.cast.i48
  %sub.ptr.div.i50 = ashr exact i64 %sub.ptr.sub.i49, %0
  %add13 = add nsw i64 %sub.ptr.div.i50, %1
  %add.ptr.i52 = getelementptr inbounds i64, ptr %call.i5155, i64 %add13
  store ptr %add.ptr.i52, ptr %end_size_.i53, align 8, !tbaa !53
  ret ptr %add.ptr.i52
}

define ptr @"250"(ptr %new_range.i.i, ptr %el, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %1 = load ptr, ptr %el, align 8, !tbaa !37
  %sub.ptr.lhs.cast = ptrtoint ptr %1 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair.14, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !49
  ret ptr %add.ptr6.i.i
}

define ptr @"251"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre671.pre = load ptr, ptr %el, align 8, !tbaa !37
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre671.pre to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair.14, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair.14, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !49
  ret ptr %add.ptr6.i.i
}

define i64 @"252"(ptr %end_size_, ptr %this, i64 %0, i64 %1, ptr %.omp.ub) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !12
  %sub.ptr.rhs.cast = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %end_size_, align 8, !tbaa !14
  %sub.ptr.lhs.cast = ptrtoint ptr %3 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %sub = add nsw i64 %sub.ptr.div, %1
  store i64 %sub, ptr %.omp.ub, align 8, !tbaa !6
  ret i64 %sub
}

define i32 @"253"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %this, align 8, !tbaa !12
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %add7 = add i64 %2, %0
  %add.ptr.1 = getelementptr inbounds i32, ptr %1, i64 %add7
  %3 = load i32, ptr %init_val, align 4, !tbaa !0
  store i32 %3, ptr %add.ptr.1, align 4, !tbaa !0
  ret i32 %3
}

define i64 @"254"(i32 %shl19, ptr %arrayidx.i61, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i63, i64 %4, i64 %5, i64 %xor4.i, i64 %6, i64 %xor7.i, i32 %7, i32 %8, i32 %9, i32 %conv, i64 %10, i64 %ref.tmp30.sroa.0.0.insert.ext, ptr %el, ptr %.omp.lb) {
bb:
  %11 = load ptr, ptr %el, align 8, !tbaa !37
  %12 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %mul = shl i64 %12, %6
  %arrayidx.i = getelementptr inbounds %struct.EdgePair.14, ptr %11, i64 %mul
  %13 = load i64, ptr %arrayidx.i61, align 8, !tbaa !6
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

define i64 @"255"(ptr %arrayidx3.i.i92, i64 %0, ptr %1, i64 %2, i64 %3, ptr %arrayidx7.i.i96, i64 %4, i64 %5, ptr %arrayidx.i.i89) {
bb:
  %6 = load i64, ptr %arrayidx3.i.i92, align 8, !tbaa !6
  %and8.i.i99 = and i64 %6, %2
  %tobool.not.i.i100 = icmp eq i64 %and8.i.i99, %4
  %cond.i.i101 = select i1 %tobool.not.i.i100, i64 %4, i64 %5
  %7 = load i64, ptr %arrayidx7.i.i96, align 8, !tbaa !6
  %wide.load393 = load <2 x i64>, ptr %1, align 8, !tbaa !6
  %vector.recur.extract396 = extractelement <2 x i64> %wide.load393, i64 %2
  %and.i.i90 = and i64 %vector.recur.extract396, %3
  %and4.i.i93 = and i64 %6, %0
  %or.i.i94 = or i64 %and4.i.i93, %and.i.i90
  %shr.i.i97 = lshr exact i64 %or.i.i94, %2
  %xor.i.i98 = xor i64 %shr.i.i97, %7
  %xor9.i.i102 = xor i64 %xor.i.i98, %cond.i.i101
  store i64 %xor9.i.i102, ptr %arrayidx.i.i89, align 8, !tbaa !6
  ret i64 %xor9.i.i102
}

define i64 @"256"(ptr %offsets, ptr %arrayidx99, i32 %0) {
bb:
  %.pre677.pre688 = load ptr, ptr %offsets, align 8, !tbaa !10
  %1 = load i32, ptr %arrayidx99, align 4, !tbaa !0
  %add102 = add nsw i32 %1, %0
  %conv103 = sext i32 %add102 to i64
  %arrayidx.i485 = getelementptr inbounds i64, ptr %.pre677.pre688, i64 %conv103
  %2 = load i64, ptr %arrayidx.i485, align 8, !tbaa !6
  ret i64 %2
}

define i32 @"257"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !37
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %add13 = add i64 %3, %0
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair.14, ptr %2, i64 %add13
  %add.ptr.sroa_idx.1 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %1
  %4 = load i32, ptr %add.ptr.sroa_idx.1, align 4
  ret i32 %4
}

define <2 x i64> @"258"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %rng, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
bb:
  %wide.load393 = load <2 x i64>, ptr %0, align 8, !tbaa !6
  %10 = and <2 x i64> %wide.load393, %5
  %11 = icmp eq <2 x i64> %10, %7
  %12 = select <2 x i1> %11, <2 x i64> %7, <2 x i64> %8
  %.pre.i.i86 = load i64, ptr %rng, align 8, !tbaa !6
  %vector.recur.init391 = insertelement <2 x i64> %2, i64 %.pre.i.i86, i64 %3
  %13 = shufflevector <2 x i64> %vector.recur.init391, <2 x i64> %wide.load393, <2 x i32> <i32 1, i32 2>
  %14 = and <2 x i64> %13, %4
  %15 = and <2 x i64> %wide.load393, %1
  %16 = or <2 x i64> %15, %14
  %17 = lshr exact <2 x i64> %16, %5
  %wide.load394 = load <2 x i64>, ptr %6, align 8, !tbaa !6
  %18 = xor <2 x i64> %17, %wide.load394
  %19 = xor <2 x i64> %18, %12
  store <2 x i64> %19, ptr %9, align 8, !tbaa !6
  ret <2 x i64> %19
}

define i64 @"259"(ptr %_ZSt4cout, i64 %0) {
bb:
  %vtable.i = load ptr, ptr %_ZSt4cout, align 8, !tbaa !93
  %vbase.offset.ptr.i = getelementptr i8, ptr %vtable.i, i64 %0
  %vbase.offset.i = load i64, ptr %vbase.offset.ptr.i, align 8
  ret i64 %vbase.offset.i
}

define i32 @"260"(ptr %length, i32 %0, ptr %.omp.ub) {
bb:
  %1 = load i32, ptr %length, align 4, !tbaa !0
  %sub3 = add nsw i32 %1, %0
  store i32 %sub3, ptr %.omp.ub, align 4, !tbaa !0
  ret i32 %sub3
}

define i64 @"261"(i64 %__value.coerce0, ptr %__first, ptr %v.i.i, ptr %v3.i.i, ptr %w.i.i.i, ptr %w3.i.i.i, i64 %sub1, i64 %mul, i64 %0) {
bb:
  %1 = load i32, ptr %v3.i.i, align 4, !tbaa !8
  %2 = load i32, ptr %v.i.i, align 4, !tbaa !8
  %cmp.i.i.i = icmp eq i32 %2, %1
  %3 = load i32, ptr %w3.i.i.i, align 4
  %4 = load i32, ptr %w.i.i.i, align 4
  %cmp4.i.i.i = icmp slt i32 %4, %3
  %cmp7.i.i.i = icmp slt i32 %2, %1
  %cond.i.i.i = select i1 %cmp.i.i.i, i1 %cmp4.i.i.i, i1 %cmp7.i.i.i
  %spec.select = select i1 %cond.i.i.i, i64 %sub1, i64 %mul
  %add10 = shl i64 %spec.select, %0
  %sub12 = or i64 %add10, %0
  %add.ptr5.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %sub12
  store i64 %__value.coerce0, ptr %add.ptr5.i, align 4, !tbaa.struct !45
  ret i64 %__value.coerce0
}

define ptr @"262"(ptr %el, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1) {
bb:
  %.pre750 = load ptr, ptr %end_size_.i, align 8, !tbaa !44
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre750 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre752 = load ptr, ptr %el, align 8, !tbaa !40
  %.pre776 = ptrtoint ptr %.pre752 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre776
  %sub.ptr.div14 = sdiv exact i64 %sub.ptr.sub13, %1
  %add.ptr.i483 = getelementptr inbounds %struct.EdgePair, ptr %.pre752, i64 %sub.ptr.div14
  store ptr %add.ptr.i483, ptr %end_size_.i, align 8, !tbaa !44
  ret ptr %add.ptr.i483
}

define ptr @"263"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, ptr %.omp.lb) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %2 = sext i32 %1 to i64
  %3 = load i8, ptr %transpose, align 1, !tbaa !15, !range !17, !noundef !18
  %tobool.not = icmp eq i8 %3, %0
  %4 = load ptr, ptr %in_index_.i, align 8
  %5 = load ptr, ptr %out_index_.i, align 8
  %.pn = select i1 %tobool.not, ptr %5, ptr %4
  %n_start.0.in = getelementptr inbounds ptr, ptr %.pn, i64 %2
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  ret ptr %n_start.0
}

define i64 @"264"(ptr %offsets, ptr %arrayidx270, i64 %0) {
bb:
  %.pre763 = load ptr, ptr %offsets, align 8, !tbaa !10
  %1 = load i64, ptr %arrayidx270, align 4
  %sext = shl i64 %1, %0
  %conv273 = ashr exact i64 %sext, %0
  %arrayidx.i567 = getelementptr inbounds i64, ptr %.pre763, i64 %conv273
  %2 = load i64, ptr %arrayidx.i567, align 8, !tbaa !6
  ret i64 %2
}

define i32 @"265"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %init_val, align 4, !tbaa !0
  %3 = load ptr, ptr %this, align 8, !tbaa !12
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add.ptr.prol = getelementptr inbounds i32, ptr %3, i64 %ind.end
  store i32 %2, ptr %add.ptr.prol, align 4, !tbaa !0
  ret i32 %2
}

define i64 @"266"(ptr %num_nodes_.i, ptr %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !54, !noalias !56
  store i64 %1, ptr %0, align 8, !alias.scope !56
  ret i64 %1
}

define i64 @"267"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !51
  %inc.i72 = add nuw nsw i64 %2, %1
  %arrayidx.i66 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i72
  %3 = load i64, ptr %arrayidx.i66, align 8, !tbaa !6
  ret i64 %3
}

define i32 @"268"(i64 %indvars.iv648, ptr %incdec.ptr4.sink.i.i.i.i, ptr %__first.addr.015.i.i, ptr %neighs, ptr %arrayidx.i485, i64 %sub.ptr.rhs.cast.i.i.i.i487, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %incdec.ptr4.sink.i.i.i.i, align 4, !tbaa !0
  %3 = sext i32 %2 to i64
  %cmp.i.i.i491 = icmp sgt i64 %indvars.iv648, %3
  %4 = load i64, ptr %arrayidx.i485, align 8, !tbaa !6
  %5 = load ptr, ptr %neighs, align 8, !tbaa !4
  %add.ptr105 = getelementptr inbounds i32, ptr %5, i64 %4
  %sub.ptr.lhs.cast.i.i.i.i486 = ptrtoint ptr %add.ptr105 to i64
  %sub.ptr.sub.i.i.i.i488 = sub i64 %sub.ptr.lhs.cast.i.i.i.i486, %sub.ptr.rhs.cast.i.i.i.i487
  %sub.ptr.div.i.i.i.i = lshr exact i64 %sub.ptr.sub.i.i.i.i488, %0
  %shr.i.i = lshr i64 %sub.ptr.div.i.i.i.i, %1
  %incdec.ptr4.sink.i.i.i.i2 = getelementptr inbounds i32, ptr %__first.addr.015.i.i, i64 %shr.i.i
  %incdec.ptr.i.i = getelementptr inbounds i32, ptr %incdec.ptr4.sink.i.i.i.i, i64 %1
  %__first.addr.1.i.i = select i1 %cmp.i.i.i491, ptr %incdec.ptr.i.i, ptr %__first.addr.015.i.i
  %6 = load i32, ptr %__first.addr.1.i.i, align 4, !tbaa !0
  ret i32 %6
}

define i32 @"269"(i32 %0, ptr %call148, ptr %arrayidx.i509, i64 %1, ptr %arrayidx.i510) {
bb:
  %2 = load i64, ptr %arrayidx.i509, align 8, !tbaa !6
  %add248 = add i64 %2, %1
  %3 = load i32, ptr %arrayidx.i510, align 4, !tbaa !0
  %idx.ext = sext i32 %3 to i64
  %sub249 = add i64 %add248, %idx.ext
  %arrayidx250 = getelementptr inbounds i32, ptr %call148, i64 %sub249
  store i32 %0, ptr %arrayidx250, align 4, !tbaa !0
  ret i32 %0
}

define i32 @"270"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !37
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %add13 = add i64 %2, %0
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair.14, ptr %1, i64 %add13
  %3 = load i32, ptr %add.ptr.1, align 4
  ret i32 %3
}

define i64 @"271"(ptr %arrayidx.i.i, ptr %0, i64 %1, ptr %2) {
bb:
  %3 = load ptr, ptr %arrayidx.i.i, align 8, !tbaa !4, !noalias !56
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %0, align 8, !tbaa !4, !noalias !56
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i = ashr exact i64 %sub.ptr.sub.i.i, %1
  store i64 %sub.ptr.div.i.i, ptr %2, align 8, !alias.scope !56
  ret i64 %sub.ptr.div.i.i
}

define i64 @"272"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !51
  %inc.i72 = add nuw nsw i64 %2, %1
  %arrayidx.i209 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i72
  %3 = load i64, ptr %arrayidx.i209, align 8, !tbaa !6
  ret i64 %3
}

define i64 @"273"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !46
  %2 = and i64 %1, %0
  %sub = add nuw i64 %2, %0
  %conv34 = and i64 %sub, %0
  %3 = load ptr, ptr %offsets, align 8
  %arrayidx.i511 = getelementptr inbounds i64, ptr %3, i64 %conv34
  %4 = load i64, ptr %arrayidx.i511, align 8, !tbaa !6
  ret i64 %4
}

define ptr @"274"(ptr %new_range.i.i476, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1, ptr %el, ptr %end_capacity_.i.i.i) {
bb:
  %.pre750 = load ptr, ptr %end_size_.i, align 8, !tbaa !44
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre750 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre752 = load ptr, ptr %el, align 8, !tbaa !40
  %.pre776 = ptrtoint ptr %.pre752 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre776
  %sub.ptr.div14 = sdiv exact i64 %sub.ptr.sub13, %1
  %.pre.i.i495 = load ptr, ptr %new_range.i.i476, align 8, !tbaa !4
  %add.ptr6.i.i497 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i495, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i497, ptr %end_capacity_.i.i.i, align 8, !tbaa !61
  ret ptr %add.ptr6.i.i497
}

define i64 @"275"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %call.i4145, ptr %num_blocks) {
bb:
  %0 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !6
  %1 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !6
  %2 = load i64, ptr %arrayidx.i58, align 8, !tbaa !6
  %add7 = add nsw i64 %2, %total.076
  %add7.1 = add nsw i64 %1, %add7
  %3 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !6
  %add7.2 = add nsw i64 %3, %add7.1
  %add7.3 = add nsw i64 %0, %add7.2
  %4 = load i64, ptr %num_blocks, align 8, !tbaa !6
  %arrayidx.i = getelementptr inbounds i64, ptr %call.i4145, i64 %4
  store i64 %add7.3, ptr %arrayidx.i, align 8, !tbaa !6
  ret i64 %add7.3
}

define i32 @"276"(ptr %degrees, i64 %mul12, i64 %umin, ptr %.omp.lb, i64 %indvar, i64 %0, i64 %n.mod.vf) {
bb:
  %1 = load ptr, ptr %degrees, align 8, !tbaa !12
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %3 = add i64 %2, %indvar
  %4 = shl i64 %3, %0
  %5 = sub i64 %umin, %4
  %n.vec = sub i64 %5, %n.mod.vf
  %ind.end = add i64 %mul12, %n.vec
  %arrayidx.i32 = getelementptr inbounds i32, ptr %1, i64 %ind.end
  %6 = load i32, ptr %arrayidx.i32, align 4, !tbaa !0
  ret i32 %6
}

define i32 @"277"(ptr %arrayidx.i49, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i52, i64 %4, i64 %5, i64 %xor4.i55, i64 %6, i64 %xor7.i58, i32 %7, i32 %8, ptr %el, ptr %.omp.lb) {
bb:
  %9 = load i64, ptr %arrayidx.i49, align 8, !tbaa !6
  %shr.i50 = lshr i64 %9, %0
  %and.i51 = and i64 %shr.i50, %1
  %xor.i522 = xor i64 %and.i51, %9
  %shl.i53 = shl i64 %xor.i52, %2
  %and3.i54 = and i64 %shl.i53, %3
  %xor4.i554 = xor i64 %and3.i54, %xor.i52
  %shl5.i56 = shl i64 %xor4.i55, %4
  %and6.i57 = and i64 %shl5.i56, %5
  %xor7.i586 = xor i64 %and6.i57, %xor4.i55
  %shr8.i59 = lshr i64 %xor7.i58, %6
  %xor9.i60 = xor i64 %shr8.i59, %xor7.i58
  %conv.i = trunc i64 %xor9.i60 to i32
  %rem.i = urem i32 %conv.i, %7
  %add18 = add nuw nsw i32 %rem.i, %8
  %10 = load i64, ptr %.omp.lb, align 8, !tbaa !6
  %mul = shl i64 %10, %6
  %11 = load ptr, ptr %el, align 8
  %w = getelementptr inbounds %struct.EdgePair, ptr %11, i64 %mul, i32 1, i32 1
  store i32 %add18, ptr %w, align 4, !tbaa !101
  ret i32 %add18
}

define i32 @"279"(ptr %add.ptr.i.i, ptr %__first, ptr %add.ptr.i, ptr %add.ptr2.i, i64 %sub1.i, i64 %mul.i) {
bb:
  %0 = load i32, ptr %add.ptr.i, align 4, !tbaa !0
  %1 = load i32, ptr %add.ptr2.i, align 4, !tbaa !0
  %cmp.i.i = icmp slt i32 %0, %1
  %spec.select.i = select i1 %cmp.i.i, i64 %sub1.i, i64 %mul.i
  %add.ptr2.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i
  %2 = load i32, ptr %add.ptr.i.i, align 4, !tbaa !0
  store i32 %2, ptr %add.ptr2.i.i, align 4, !tbaa !0
  ret i32 %2
}

define i64 @"280"(ptr %end_size_.i, ptr %this, i64 %0, i64 %1, ptr %.omp.ub) {
bb:
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !44
  %sub.ptr.lhs.cast.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %this, align 8, !tbaa !40
  %sub.ptr.rhs.cast.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = sdiv exact i64 %sub.ptr.sub.i, %0
  %sub2 = add nsw i64 %sub.ptr.div.i, %1
  store i64 %sub2, ptr %.omp.ub, align 8, !tbaa !6
  ret i64 %sub2
}

define i64 @"281"(ptr %el) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %agg.tmp.sroa.0.0.copyload.i.i.i.i.i = load i64, ptr %.pre, align 4, !tbaa.struct !45
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i.i.i
}

define i64 @"282"(ptr %_M_string_length.i.i.i, ptr %__dnew.i.i.i) {
bb:
  %0 = load i64, ptr %_M_string_length.i.i.i, align 8, !tbaa !50, !noalias !76
  store i64 %0, ptr %__dnew.i.i.i, align 8, !tbaa !6, !noalias !76
  ret i64 %0
}

define i64 @"283"(ptr %v79, i32 %0, i64 %1, ptr %agg.tmp93.4.sroa_idx) {
bb:
  %2 = load i32, ptr %v79, align 4, !tbaa !0
  %sub95 = add nsw i32 %2, %0
  %agg.tmp94.sroa.0.0.insert.ext = zext i32 %sub95 to i64
  %agg.tmp94.sroa.0.0.insert.insert = or i64 %agg.tmp94.sroa.0.0.insert.ext, %1
  store i64 %agg.tmp94.sroa.0.0.insert.insert, ptr %agg.tmp93.4.sroa_idx, align 4, !tbaa.struct !42
  ret i64 %agg.tmp94.sroa.0.0.insert.insert
}

define i32 @"284"(ptr %neighs, ptr %arrayidx.i542, ptr %arrayidx.i543, i64 %sub.ptr.rhs.cast.i.i.i.i546, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !6
  %3 = load ptr, ptr %neighs, align 8, !tbaa !4
  %add.ptr = getelementptr inbounds %struct.NodeWeight, ptr %3, i64 %2
  %4 = load i64, ptr %arrayidx.i543, align 8, !tbaa !6
  %add.ptr131 = getelementptr inbounds %struct.NodeWeight, ptr %3, i64 %4
  %sub.ptr.lhs.cast.i.i.i.i545 = ptrtoint ptr %add.ptr131 to i64
  %sub.ptr.sub.i.i.i.i547 = sub i64 %sub.ptr.lhs.cast.i.i.i.i545, %sub.ptr.rhs.cast.i.i.i.i546
  %sub.ptr.div.i.i.i.i = lshr exact i64 %sub.ptr.sub.i.i.i.i547, %0
  %shr.i.i = lshr i64 %sub.ptr.div.i.i.i.i, %1
  %incdec.ptr4.sink.i.i.i.i = getelementptr inbounds %struct.NodeWeight, ptr %add.ptr, i64 %shr.i.i
  %5 = load i32, ptr %incdec.ptr4.sink.i.i.i.i, align 4, !tbaa !8
  ret i32 %5
}

define ptr @"285"(ptr %new_range.i.i, ptr %end_size_.i, ptr %el, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %.pre750 = load ptr, ptr %end_size_.i, align 8, !tbaa !44
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre750 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %0
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !61
  ret ptr %add.ptr6.i.i
}

define ptr @"286"(ptr %el, i64 %sub.ptr.rhs.cast, i64 %0, ptr %end_size_.i) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !37
  %sub.ptr.lhs.cast = ptrtoint ptr %1 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %.pre671.pre = load ptr, ptr %el, align 8, !tbaa !37
  %add.ptr.i = getelementptr inbounds %struct.EdgePair.14, ptr %.pre671.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !39
  ret ptr %add.ptr.i
}

define i64 @"287"(ptr %rng, i64 %0, ptr %arrayidx42.i.i125, i64 %1, i64 %2, ptr %arrayidx49.i.i129, i64 %3, i64 %4) {
bb:
  %5 = load i64, ptr %arrayidx49.i.i129, align 8, !tbaa !6
  %6 = load i64, ptr %arrayidx42.i.i125, align 8, !tbaa !6
  %and43.i.i126 = and i64 %6, %1
  %7 = load i64, ptr %rng, align 8, !tbaa !6
  %and46.i.i127 = and i64 %7, %0
  %or47.i.i128 = or i64 %and46.i.i127, %and43.i.i126
  %shr50.i.i130 = lshr exact i64 %or47.i.i128, %2
  %xor51.i.i131 = xor i64 %shr50.i.i130, %5
  %and52.i.i132 = and i64 %7, %2
  %tobool53.not.i.i133 = icmp eq i64 %and52.i.i132, %3
  %cond54.i.i134 = select i1 %tobool53.not.i.i133, i64 %3, i64 %4
  %xor55.i.i135 = xor i64 %xor51.i.i131, %cond54.i.i134
  store i64 %xor55.i.i135, ptr %arrayidx42.i.i125, align 8, !tbaa !6
  ret i64 %xor55.i.i135
}

define i64 @"288"(i64 %0, ptr %offsets, ptr %num_nodes_.i, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !46
  %n.mod.vf = and i64 %3, %1
  %arrayidx.i512781 = getelementptr inbounds i64, ptr %2, i64 %n.mod.vf
  store i64 %0, ptr %arrayidx.i512781, align 8, !tbaa !6
  ret i64 %0
}

define <2 x i64> @"289"(ptr %__first, <2 x i64> %0) {
bb:
  %1 = load <2 x i64>, ptr %__first, align 4
  %2 = shufflevector <2 x i64> %1, <2 x i64> %0, <2 x i32> <i32 1, i32 0>
  store <2 x i64> %2, ptr %__first, align 4
  ret <2 x i64> %2
}

define ptr @"290"(ptr %call.i147148, ptr %num_nodes, i64 %0, ptr %end_size_.i) {
bb:
  %1 = load i64, ptr %num_nodes, align 8, !tbaa !6
  %add = add nsw i64 %1, %0
  %add.ptr.i = getelementptr inbounds i64, ptr %call.i147148, i64 %add
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !53
  ret ptr %add.ptr.i
}

define i64 @"291"(ptr %offsets, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %offsets, align 8, !tbaa !10
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %2 = sext i32 %1 to i64
  %arrayidx.i = getelementptr inbounds i64, ptr %0, i64 %2
  %3 = load i64, ptr %arrayidx.i, align 8, !tbaa !6
  ret i64 %3
}

define <2 x i64> @"292"(ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %index824, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !46
  %3 = and i64 %2, %0
  %offset.idx = sub i64 %3, %index824
  %4 = add nuw i64 %offset.idx, %0
  %5 = and i64 %4, %0
  %6 = load ptr, ptr %offsets, align 8
  %7 = getelementptr inbounds i64, ptr %6, i64 %5
  %8 = getelementptr inbounds i64, ptr %7, i64 %1
  %wide.load = load <2 x i64>, ptr %8, align 8, !tbaa !6
  ret <2 x i64> %wide.load
}

define i32 @"293"(ptr %arrayidx.i.i.i65, ptr %n_start.0.in, i64 %0, ptr %diffs, ptr %.omp.lb) {
bb:
  %1 = load ptr, ptr %diffs, align 8, !tbaa !12
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %3 = sext i32 %2 to i64
  %arrayidx.i103 = getelementptr inbounds i32, ptr %1, i64 %3
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !4
  %.pre138 = ptrtoint ptr %n_start.0 to i64
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i65, align 8, !tbaa !4
  %sub.ptr.lhs.cast = ptrtoint ptr %n_end.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %.pre138
  %4 = lshr exact i64 %sub.ptr.sub, %0
  %conv27 = trunc i64 %4 to i32
  store i32 %conv27, ptr %arrayidx.i103, align 4, !tbaa !0
  ret i32 %conv27
}

define <4 x i32> @"294"(ptr %0, ptr %call148, ptr %arrayidx.i500, i64 %1, i64 %index761, i64 %2) {
bb:
  %3 = load i64, ptr %arrayidx.i500, align 8, !tbaa !6
  %sub159 = add nsw i64 %3, %1
  %offset.idx762 = sub i64 %sub159, %index761
  %4 = getelementptr inbounds i32, ptr %call148, i64 %offset.idx762
  %5 = getelementptr inbounds i32, ptr %4, i64 %2
  %wide.load764 = load <4 x i32>, ptr %0, align 4, !tbaa !0
  store <4 x i32> %wide.load764, ptr %5, align 4, !tbaa !0
  ret <4 x i32> %wide.load764
}

define i64 @"295"(ptr %arrayidx.i552, i64 %total_missing_inv.0692, ptr %arrayidx.i555, ptr %offsets, ptr %num_nodes_.i) {
bb:
  %0 = load i32, ptr %arrayidx.i555, align 4, !tbaa !0
  %conv168 = sext i32 %0 to i64
  %add169 = add nsw i64 %total_missing_inv.0692, %conv168
  %1 = load i64, ptr %arrayidx.i552, align 8, !tbaa !6
  %add178 = add nsw i64 %1, %add169
  %.pre759.pre772 = load ptr, ptr %offsets, align 8, !tbaa !10
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !46
  %arrayidx.i5522 = getelementptr inbounds i64, ptr %.pre759.pre772, i64 %2
  store i64 %add178, ptr %arrayidx.i552, align 8, !tbaa !6
  ret i64 %add178
}

define ptr @"296"(ptr %new_range.i.i, ptr %end_size_.i, ptr %el, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !4
  %.pre750 = load ptr, ptr %end_size_.i, align 8, !tbaa !44
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre750 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %0
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !61
  ret ptr %add.ptr6.i.i
}

define i32 @"297"(ptr %__first, ptr %v.i.i, ptr %v3.i.i, ptr %w.i.i.i, ptr %w3.i.i.i, i64 %sub1, i64 %mul, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i32, ptr %v3.i.i, align 4, !tbaa !8
  %4 = load i32, ptr %v.i.i, align 4, !tbaa !8
  %cmp.i.i.i = icmp eq i32 %4, %3
  %5 = load i32, ptr %w3.i.i.i, align 4
  %6 = load i32, ptr %w.i.i.i, align 4
  %cmp4.i.i.i = icmp slt i32 %6, %5
  %cmp7.i.i.i = icmp slt i32 %4, %3
  %cond.i.i.i = select i1 %cmp.i.i.i, i1 %cmp4.i.i.i, i1 %cmp7.i.i.i
  %spec.select = select i1 %cond.i.i.i, i64 %sub1, i64 %mul
  %add10 = shl i64 %spec.select, %0
  %sub12 = or i64 %add10, %0
  %__parent.019.in.i = add nsw i64 %sub12, %1
  %__parent.019.i = sdiv i64 %__parent.019.in.i, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %__parent.019.i
  %7 = load i32, ptr %add.ptr.i, align 4, !tbaa !59
  ret i32 %7
}

define i64 @"298"(ptr %_M_b.i, ptr %__param, i64 %0, ptr %_M_b.i32) {
bb:
  %1 = load i64, ptr %__param, align 8, !tbaa !102
  %2 = load i64, ptr %_M_b.i, align 8, !tbaa !104
  %sub = sub i64 %2, %1
  %div31 = lshr i64 %sub, %0
  store i64 %div31, ptr %_M_b.i32, align 8, !tbaa !104
  ret i64 %div31
}

define i64 @"299"(ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %w.i.i.i.i.i, ptr %w3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !8
  %1 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !8
  %cmp7.i.i.i.i.i = icmp slt i32 %0, %1
  %2 = load i32, ptr %w.i.i.i.i.i, align 4
  %3 = load i32, ptr %w3.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %2, %3
  %cmp.i.i.i.i.i = icmp eq i32 %0, %1
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr3.i.i.i = getelementptr inbounds %struct.NodeWeight, ptr %__first, i64 %spec.select.i.i.i
  %4 = load i64, ptr %add.ptr3.i.i.i, align 4
  ret i64 %4
}

define i64 @"300"(ptr %add.ptr3.i.i.i, ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %w.i.i.i.i.i, ptr %w3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i64, ptr %add.ptr3.i.i.i, align 4
  %1 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !8
  %2 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !8
  %cmp7.i.i.i.i.i = icmp slt i32 %1, %2
  %3 = load i32, ptr %w.i.i.i.i.i, align 4
  %4 = load i32, ptr %w3.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %3, %4
  %cmp.i.i.i.i.i = icmp eq i32 %1, %2
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr4.i.i.i = getelementptr inbounds %struct.NodeWeight, ptr %__first, i64 %spec.select.i.i.i
  store i64 %0, ptr %add.ptr4.i.i.i, align 4
  ret i64 %0
}

define i64 @"301"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57.epil) {
bb:
  %0 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !6
  %1 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !6
  %2 = load i64, ptr %arrayidx.i58, align 8, !tbaa !6
  %add7 = add nsw i64 %2, %total.076
  %add7.1 = add nsw i64 %1, %add7
  %3 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !6
  %add7.2 = add nsw i64 %3, %add7.1
  %add7.3 = add nsw i64 %0, %add7.2
  store i64 %add7.3, ptr %arrayidx.i57.epil, align 8, !tbaa !6
  ret i64 %add7.3
}

define i8 @"302"(ptr %arrayidx.i17.i, ptr %ref.tmp, i64 %conv5.i, i64 %idxprom1.i.i) {
bb:
  %0 = load ptr, ptr %ref.tmp, align 8, !tbaa !36, !alias.scope !95
  %arrayidx.i.i = getelementptr inbounds i8, ptr %0, i64 %conv5.i
  %arrayidx2.i.i = getelementptr inbounds i8, ptr %arrayidx.i.i, i64 %idxprom1.i.i
  %1 = load i8, ptr %arrayidx.i17.i, align 1, !tbaa !24, !noalias !95
  store i8 %1, ptr %arrayidx2.i.i, align 1, !tbaa !24
  ret i8 %1
}

define i64 @"303"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i78.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !45
  ret i64 %agg.tmp.sroa.0.0.copyload.i78.i.i.i.i
}

define i64 @"304"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !51
  %inc.i72 = add nuw nsw i64 %1, %0
  store i64 %inc.i72, ptr %_M_p.i.i.i, align 8, !tbaa !51
  ret i64 %inc.i72
}

define ptr @"306"(ptr %el, ptr %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %.pre672 = load ptr, ptr %el, align 8, !tbaa !37
  %.pre691 = ptrtoint ptr %.pre672 to i64
  %2 = load ptr, ptr %el, align 8, !tbaa !37
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair.14, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre691
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr.i425 = getelementptr inbounds %struct.EdgePair.14, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i425, ptr %end_size_.i, align 8, !tbaa !39
  ret ptr %add.ptr.i425
}

define i64 @"307"(ptr %arrayidx8.i, ptr %0, i64 %1, ptr %call.i.i, ptr %num_nodes_.i60, i64 %2, i64 %3) {
bb:
  %4 = load ptr, ptr %0, align 8, !tbaa !4, !noalias !68
  %sub.ptr.rhs.cast12.i = ptrtoint ptr %4 to i64
  %5 = load ptr, ptr %arrayidx8.i, align 8, !tbaa !4, !noalias !68
  %sub.ptr.lhs.cast11.i = ptrtoint ptr %5 to i64
  %sub.ptr.sub13.i = sub i64 %sub.ptr.lhs.cast11.i, %sub.ptr.rhs.cast12.i
  %sub.ptr.div14.i = ashr exact i64 %sub.ptr.sub13.i, %1
  %6 = load i64, ptr %num_nodes_.i60, align 8, !tbaa !54, !noalias !68
  %7 = add i64 %6, %2
  %n.vec = and i64 %7, %3
  %arrayidx.i22.i = getelementptr inbounds i64, ptr %call.i.i, i64 %n.vec
  store i64 %sub.ptr.div14.i, ptr %arrayidx.i22.i, align 8, !tbaa !6, !noalias !68
  ret i64 %sub.ptr.div14.i
}

define ptr @"308"(ptr %el, ptr %0, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !40
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre752 = load ptr, ptr %el, align 8, !tbaa !40
  %.pre776 = ptrtoint ptr %.pre752 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre776
  %sub.ptr.div14 = sdiv exact i64 %sub.ptr.sub13, %2
  %add.ptr.i483 = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i483, ptr %end_size_.i, align 8, !tbaa !44
  ret ptr %add.ptr.i483
}

!0 = !{!1, !1, i64 0}
!1 = !{!"int", !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C++ TBAA"}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !2, i64 0}
!6 = !{!7, !7, i64 0}
!7 = !{!"long", !2, i64 0}
!8 = !{!9, !1, i64 0}
!9 = !{!"_ZTS10NodeWeightIiiE", !1, i64 0, !1, i64 4}
!10 = !{!11, !5, i64 0}
!11 = !{!"_ZTS7pvectorIlE", !5, i64 0, !5, i64 8, !5, i64 16}
!12 = !{!13, !5, i64 0}
!13 = !{!"_ZTS7pvectorIiE", !5, i64 0, !5, i64 8, !5, i64 16}
!14 = !{!13, !5, i64 8}
!15 = !{!16, !16, i64 0}
!16 = !{!"bool", !2, i64 0}
!17 = !{i8 0, i8 2}
!18 = !{}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23}
!23 = distinct !{!23, !21}
!24 = !{!2, !2, i64 0}
!25 = !{!26}
!26 = distinct !{!26, !27, !"_ZNSt7__cxx119to_stringEi: %agg.result"}
!27 = distinct !{!27, !"_ZNSt7__cxx119to_stringEi"}
!28 = !{!29, !1, i64 116}
!29 = !{!"_ZTS6CLBase", !1, i64 8, !5, i64 16, !30, i64 24, !30, i64 56, !32, i64 88, !1, i64 112, !1, i64 116, !30, i64 120, !16, i64 152, !16, i64 153, !16, i64 154}
!30 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !31, i64 0, !7, i64 8, !2, i64 16}
!31 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !5, i64 0}
!32 = !{!"_ZTSSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !33, i64 0}
!33 = !{!"_ZTSSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !34, i64 0}
!34 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implE", !35, i64 0}
!35 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_Vector_impl_dataE", !5, i64 0, !5, i64 8, !5, i64 16}
!36 = !{!30, !5, i64 0}
!37 = !{!38, !5, i64 0}
!38 = !{!"_ZTS7pvectorI8EdgePairIiiEE", !5, i64 0, !5, i64 8, !5, i64 16}
!39 = !{!38, !5, i64 8}
!40 = !{!41, !5, i64 0}
!41 = !{!"_ZTS7pvectorI8EdgePairIi10NodeWeightIiiEEE", !5, i64 0, !5, i64 8, !5, i64 16}
!42 = !{i64 0, i64 4, !0, i64 4, i64 4, !0}
!43 = !{!35, !5, i64 0}
!44 = !{!41, !5, i64 8}
!45 = !{i64 0, i64 4, !0, i64 4, i64 4, !0, i64 8, i64 4, !0}
!46 = !{!47, !7, i64 16}
!47 = !{!"_ZTS11BuilderBaseIi10NodeWeightIiiEiLb1EE", !5, i64 0, !16, i64 8, !16, i64 9, !16, i64 10, !7, i64 16}
!48 = !{i64 0, i64 4, !0}
!49 = !{!38, !5, i64 16}
!50 = !{!30, !7, i64 8}
!51 = !{!52, !7, i64 4992}
!52 = !{!"_ZTSSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE", !2, i64 0, !7, i64 4992}
!53 = !{!11, !5, i64 8}
!54 = !{!55, !7, i64 8}
!55 = !{!"_ZTS8CSRGraphIi10NodeWeightIiiELb1EE", !16, i64 0, !7, i64 8, !7, i64 16, !5, i64 24, !5, i64 32, !5, i64 40, !5, i64 48}
!56 = !{!57}
!57 = distinct !{!57, !58, !"_ZN11BuilderBaseIi10NodeWeightIiiEiLb1EE11SquishGraphERK8CSRGraphIiS1_Lb1EE: %agg.result"}
!58 = distinct !{!58, !"_ZN11BuilderBaseIi10NodeWeightIiiEiLb1EE11SquishGraphERK8CSRGraphIiS1_Lb1EE"}
!59 = !{!60, !1, i64 0}
!60 = !{!"_ZTS8EdgePairIi10NodeWeightIiiEE", !1, i64 0, !9, i64 4}
!61 = !{!41, !5, i64 16}
!62 = !{!63}
!63 = distinct !{!63, !64, !"_ZSt19__relocate_object_aINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_SaIS5_EEvPT_PT0_RT1_: %__orig"}
!64 = distinct !{!64, !"_ZSt19__relocate_object_aINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_SaIS5_EEvPT_PT0_RT1_"}
!65 = !{!66}
!66 = distinct !{!66, !64, !"_ZSt19__relocate_object_aINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_SaIS5_EEvPT_PT0_RT1_: %__dest"}
!67 = !{!31, !5, i64 0}
!68 = !{!69}
!69 = distinct !{!69, !70, !"_ZNK8CSRGraphIi10NodeWeightIiiELb1EE13VertexOffsetsEb: %agg.result"}
!70 = distinct !{!70, !"_ZNK8CSRGraphIi10NodeWeightIiiELb1EE13VertexOffsetsEb"}
!71 = !{!72, !7, i64 8}
!72 = !{!"_ZTS9GeneratorIi10NodeWeightIiiEijLi32ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEE", !1, i64 0, !7, i64 8, !7, i64 16}
!73 = !{!55, !16, i64 0}
!74 = !{!35, !5, i64 8}
!75 = !{!35, !5, i64 16}
!76 = !{!77}
!77 = distinct !{!77, !78, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_: %agg.result"}
!78 = distinct !{!78, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_"}
!79 = !{!72, !7, i64 16}
!80 = !{!9, !1, i64 4}
!81 = !{!82, !7, i64 8}
!82 = !{!"_ZTS9GeneratorIiiijLi32ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEE", !1, i64 0, !7, i64 8, !7, i64 16}
!83 = !{!84}
!84 = distinct !{!84, !85, !"_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm: %agg.result"}
!85 = distinct !{!85, !"_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm"}
!86 = !{!87, !5, i64 240}
!87 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !88, i64 0, !5, i64 216, !2, i64 224, !16, i64 225, !5, i64 232, !5, i64 240, !5, i64 248, !5, i64 256}
!88 = !{!"_ZTSSt8ios_base", !7, i64 8, !7, i64 16, !89, i64 24, !90, i64 28, !90, i64 32, !5, i64 40, !91, i64 48, !2, i64 64, !1, i64 192, !5, i64 200, !92, i64 208}
!89 = !{!"_ZTSSt13_Ios_Fmtflags", !2, i64 0}
!90 = !{!"_ZTSSt12_Ios_Iostate", !2, i64 0}
!91 = !{!"_ZTSNSt8ios_base6_WordsE", !5, i64 0, !7, i64 8}
!92 = !{!"_ZTSSt6locale", !5, i64 0}
!93 = !{!94, !94, i64 0}
!94 = !{!"vtable pointer", !3, i64 0}
!95 = !{!96}
!96 = distinct !{!96, !97, !"_ZNSt7__cxx119to_stringEi: %agg.result"}
!97 = distinct !{!97, !"_ZNSt7__cxx119to_stringEi"}
!98 = !{!99}
!99 = distinct !{!99, !100, !"_ZN6ReaderIi10NodeWeightIiiEiLb1EE8ReadInELERSt14basic_ifstreamIcSt11char_traitsIcEE: %agg.result"}
!100 = distinct !{!100, !"_ZN6ReaderIi10NodeWeightIiiEiLb1EE8ReadInELERSt14basic_ifstreamIcSt11char_traitsIcEE"}
!101 = !{!60, !1, i64 8}
!102 = !{!103, !7, i64 0}
!103 = !{!"_ZTSNSt24uniform_int_distributionImE10param_typeE", !7, i64 0, !7, i64 8}
!104 = !{!103, !7, i64 8}
