; ModuleID = 'bfs-idioms'
source_filename = "bfs-idioms"
target triple = "riscv64"

%struct.EdgePair = type { i32, i32 }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char>::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char>::_Alloc_hider" = type { ptr }
%union.anon = type { i64, [8 x i8] }
%"class.std::mersenne_twister_engine" = type { [312 x i64], i64 }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], ptr, i8, [7 x i8], ptr, ptr, ptr, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ ptr, i32 }>

define i64 @"1"(ptr %arrayidx.i59, ptr %agg.result, ptr %end_size_.i, ptr %degrees, i64 %0) {
bb:
  %1 = load ptr, ptr %degrees, align 8, !tbaa !0
  %sub.ptr.rhs.cast.i62 = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !5
  %sub.ptr.lhs.cast.i61 = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i63 = sub i64 %sub.ptr.lhs.cast.i61, %sub.ptr.rhs.cast.i62
  %sub.ptr.div.i64 = ashr exact i64 %sub.ptr.sub.i63, %0
  %3 = load ptr, ptr %agg.result, align 8, !tbaa !6
  %arrayidx.i65 = getelementptr inbounds i64, ptr %3, i64 %sub.ptr.div.i64
  %4 = load i64, ptr %arrayidx.i59, align 8, !tbaa !8
  store i64 %4, ptr %arrayidx.i65, align 8, !tbaa !8
  ret i64 %4
}

define <2 x i32> @"2"(ptr %degrees, ptr %.omp.lb, i64 %0, i64 %index) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %mul12 = shl i64 %1, %0
  %offset.idx = add i64 %mul12, %index
  %2 = load ptr, ptr %degrees, align 8, !tbaa !0
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

define <4 x i32> @"4"(<4 x i32> %0, ptr %init_val, i64 %1, ptr %this, ptr %.omp.lb, i64 %index, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %offset.idx = add i64 %3, %index
  %4 = load ptr, ptr %this, align 8, !tbaa !0
  %5 = getelementptr inbounds i32, ptr %4, i64 %offset.idx
  %6 = getelementptr inbounds i32, ptr %5, i64 %2
  %7 = load i32, ptr %init_val, align 4, !tbaa !10, !alias.scope !17
  %broadcast.splatinsert21 = insertelement <4 x i32> %0, i32 %7, i64 %1
  %broadcast.splat22 = shufflevector <4 x i32> %broadcast.splatinsert21, <4 x i32> %0, <4 x i32> zeroinitializer
  store <4 x i32> %broadcast.splat22, ptr %6, align 4, !tbaa !10, !alias.scope !20, !noalias !17
  ret <4 x i32> %broadcast.splat22
}

define i8 @"5"(ptr %arrayidx17.i.i, ptr %agg.tmp32, ptr %num_trials_, i32 %0) {
bb:
  %1 = load i8, ptr %arrayidx17.i.i, align 2, !tbaa !22, !noalias !23
  %2 = load i32, ptr %num_trials_, align 4, !tbaa !26
  %__val.lobit.i = lshr i32 %2, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %3 = load ptr, ptr %agg.tmp32, align 8, !tbaa !35, !alias.scope !23
  %arrayidx.i.i = getelementptr inbounds i8, ptr %3, i64 %conv5.i
  store i8 %1, ptr %arrayidx.i.i, align 1, !tbaa !22
  ret i8 %1
}

define i32 @"6"(ptr %parent, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %parent, align 8, !tbaa !0, !llvm.access.group !36
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %arrayidx.i = getelementptr inbounds i32, ptr %0, i64 %2
  %3 = load i32, ptr %arrayidx.i, align 4, !tbaa !10, !llvm.access.group !36
  ret i32 %3
}

define i32 @"7"(ptr %init_val, ptr %this, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %this, align 8, !tbaa !0
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %add.ptr.prol = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %init_val, align 4, !tbaa !10
  store i32 %2, ptr %add.ptr.prol, align 4, !tbaa !10
  ret i32 %2
}

define ptr @"8"(ptr %el, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !37
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !39
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !39
  ret ptr %add.ptr.i464
}

define i32 @"9"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, ptr %v.i.i.i.i.i.i, ptr %v3.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !40
  %3 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !40
  %cmp.i.i.i.i.i.i = icmp eq i32 %2, %3
  %cmp7.i.i.i.i.i.i = icmp slt i32 %2, %3
  %4 = load i32, ptr %v3.i.i.i.i.i.i, align 4
  %5 = load i32, ptr %v.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i = icmp slt i32 %5, %4
  %cond.i.i.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i1 %cmp4.i.i.i.i.i.i, i1 %cmp7.i.i.i.i.i.i
  %spec.select.i.i.i.i = select i1 %cond.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %__parent.020.in.i.i.i.i.i = add nsw i64 %sub12.i.i.i.i, %1
  %__parent.020.i.i56.i.i.i = lshr i64 %__parent.020.in.i.i.i.i.i, %0
  %add.ptr.i.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %__parent.020.i.i56.i.i.i
  %6 = load i32, ptr %add.ptr.i.i.i.i.i, align 4, !tbaa !40
  ret i32 %6
}

define i32 @"10"(ptr %queue, ptr %shared_out_start.i, i64 %.omp.iv.087) {
bb:
  %0 = load ptr, ptr %queue, align 8, !tbaa !42
  %1 = load i64, ptr %shared_out_start.i, align 8, !tbaa !44
  %add.ptr.i = getelementptr inbounds i32, ptr %0, i64 %1
  %add.ptr = getelementptr inbounds i32, ptr %add.ptr.i, i64 %.omp.iv.087
  %2 = load i32, ptr %add.ptr, align 4, !tbaa !10
  ret i32 %2
}

define i64 @"12"(ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %__i.018.i, ptr %arrayidx7.i) {
bb:
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %add10 = add i64 %5, %0
  %rem.i.i.i = and i64 %add10, %1
  %shr.i = lshr i64 %rem.i.i.i, %2
  %xor.i = xor i64 %shr.i, %3
  %mul.i = mul nuw nsw i64 %xor.i, %4
  %add.i = add nuw i64 %mul.i, %__i.018.i
  %rem.i.i17.i = and i64 %add.i, %1
  store i64 %rem.i.i17.i, ptr %arrayidx7.i, align 8, !tbaa !8
  ret i64 %rem.i.i17.i
}

define i32 @"13"(ptr %add.ptr.i.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0) {
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

define i32 @"14"(ptr %n_start.0.in, i64 %0, ptr %diffs, ptr %.omp.lb) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %3 = load ptr, ptr %diffs, align 8, !tbaa !0
  %arrayidx.i99 = getelementptr inbounds i32, ptr %3, i64 %2
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i89 = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.lhs.cast = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast.i.i89
  %4 = lshr exact i64 %sub.ptr.sub, %0
  %conv22 = trunc i64 %4 to i32
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !10
  ret i32 %conv22
}

define i32 @"15"(ptr %arrayidx.i7.i.i) {
bb:
  %0 = load ptr, ptr %arrayidx.i7.i.i, align 8, !tbaa !16, !llvm.access.group !36
  %1 = load i32, ptr %0, align 4, !tbaa !10, !llvm.access.group !36
  ret i32 %1
}

define i64 @"16"(ptr %front, ptr %__begin3.064, i64 %0) {
bb:
  %1 = load i32, ptr %__begin3.064, align 4, !tbaa !10, !llvm.access.group !36
  %conv20 = sext i32 %1 to i64
  %div1.i.i = lshr i64 %conv20, %0
  %2 = load ptr, ptr %front, align 8
  %arrayidx.i55 = getelementptr inbounds i64, ptr %2, i64 %div1.i.i
  %3 = load i64, ptr %arrayidx.i55, align 8, !tbaa !8, !llvm.access.group !36
  ret i64 %3
}

define i32 @"17"(ptr %__first.addr.033.i.i, ptr %n_start.0.in) {
bb:
  %0 = load i32, ptr %__first.addr.033.i.i, align 4, !tbaa !10
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  store i32 %0, ptr %n_start.0, align 4, !tbaa !10
  ret i32 %0
}

define i32 @"18"(ptr %degrees, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %mul14 = shl i64 %1, %0
  %2 = load ptr, ptr %degrees, align 8, !tbaa !0
  %arrayidx.i35 = getelementptr inbounds i32, ptr %2, i64 %mul14
  %3 = load i32, ptr %arrayidx.i35, align 4, !tbaa !10
  ret i32 %3
}

define i32 @"19"(ptr %el, i64 %0, i64 %1, i32 %2) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr122.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %v3.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr122.i.i, i64 %1, i32 1
  %3 = load i32, ptr %v3.i.i.i.i, align 4
  ret i32 %3
}

define i64 @"20"(ptr %awake_count7, ptr %awake_count) {
bb:
  %0 = load i64, ptr %awake_count7, align 8, !tbaa !8
  %1 = load i64, ptr %awake_count, align 8, !tbaa !8
  %add35 = add nsw i64 %0, %1
  store i64 %add35, ptr %awake_count, align 8, !tbaa !8
  ret i64 %add35
}

define i64 @"21"(ptr %offsets, ptr %num_nodes_.i, i32 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8, !tbaa !6
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !45
  %4 = trunc i64 %3 to i32
  %n184.0657 = add i32 %4, %0
  %5 = zext i32 %n184.0657 to i64
  %sext = shl i64 %5, %1
  %conv202 = ashr exact i64 %sext, %1
  %arrayidx.i542 = getelementptr inbounds i64, ptr %2, i64 %conv202
  %6 = load i64, ptr %arrayidx.i542, align 8, !tbaa !8
  ret i64 %6
}

define i32 @"22"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !37
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %2
  %add.ptr.sroa_idx.prol = getelementptr inbounds i8, ptr %add.ptr.prol, i64 %0
  %3 = load i32, ptr %add.ptr.sroa_idx.prol, align 4
  ret i32 %3
}

define i32 @"23"(ptr %init_val, ptr %this, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %init_val, align 4, !tbaa !10
  %1 = load ptr, ptr %this, align 8, !tbaa !0
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %add.ptr = getelementptr inbounds i32, ptr %1, i64 %2
  store i32 %0, ptr %add.ptr, align 4, !tbaa !10
  ret i32 %0
}

define ptr @"24"(ptr %new_range.i.i, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %0) {
bb:
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !39
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !39
  ret ptr %add.ptr.i
}

define ptr @"25"(ptr %new_range.i.i457, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_capacity_.i.i.i) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !37
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %3 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !16
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !47
  ret ptr %add.ptr6.i.i478
}

define i32 @"26"(ptr %add.ptr3.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i) {
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

define i64 @"27"(ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57.2) {
bb:
  %0 = load i64, ptr %arrayidx.i58, align 8, !tbaa !8
  %add7 = add nsw i64 %0, %total.076
  %1 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !8
  %add7.1 = add nsw i64 %1, %add7
  store i64 %add7.1, ptr %arrayidx.i57.2, align 8, !tbaa !8
  ret i64 %add7.1
}

define i64 @"28"(ptr %arrayidx.i25, i64 %0, ptr %arrayidx.i23, ptr %el, i64 %.omp.iv.028) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !37
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %.omp.iv.028
  %2 = load i32, ptr %arrayidx.i25, align 4, !tbaa !10
  %ref.tmp.sroa.4.0.insert.ext = zext i32 %2 to i64
  %ref.tmp.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp.sroa.4.0.insert.ext, %0
  %3 = load i32, ptr %arrayidx.i23, align 4, !tbaa !10
  %ref.tmp.sroa.0.0.insert.ext = zext i32 %3 to i64
  %ref.tmp.sroa.0.0.insert.insert = or i64 %ref.tmp.sroa.4.0.insert.shift, %ref.tmp.sroa.0.0.insert.ext
  store i64 %ref.tmp.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp.sroa.0.0.insert.insert
}

define i64 @"29"(ptr %_M_string_length.i.i.i.i, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0, i32 %1) {
bb:
  %2 = load i64, ptr %_M_string_length.i.i.i.i, align 8, !tbaa !48
  %3 = load ptr, ptr %this, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %_M_string_length.i24.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i, i32 1
  store i64 %2, ptr %_M_string_length.i24.i.i.i, align 8, !tbaa !48
  ret i64 %2
}

define i64 @"30"(ptr %arrayidx.i58, ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, i64 %add7, ptr %arrayidx.i57.1) {
bb:
  %0 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !8
  %1 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !8
  %2 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !8
  %add7.1 = add nsw i64 %2, %add7
  %add7.2 = add nsw i64 %1, %add7.1
  %add7.3 = add nsw i64 %0, %add7.2
  %3 = load i64, ptr %arrayidx.i58, align 8, !tbaa !8
  %add72 = add nsw i64 %3, %add7.3
  store i64 %add7, ptr %arrayidx.i57.1, align 8, !tbaa !8
  ret i64 %add7
}

define i32 @"31"(ptr %num_nodes, i64 %0, ptr %length.i) {
bb:
  %1 = load i64, ptr %num_nodes, align 8, !tbaa !8
  %add = add nsw i64 %1, %0
  %conv.i = trunc i64 %add to i32
  store i32 %conv.i, ptr %length.i, align 4, !tbaa !10
  ret i32 %conv.i
}

define i64 @"32"(ptr %arrayidx23.i.i, i64 %0, ptr %1, i64 %2, i64 %3, ptr %arrayidx28.i.i, i64 %4, i64 %5, ptr %udist_, i64 %6) {
bb:
  %7 = load ptr, ptr %udist_, align 8, !tbaa !49
  %arrayidx19.i.i = getelementptr inbounds [312 x i64], ptr %7, i64 %4, i64 310
  %8 = load i64, ptr %arrayidx23.i.i, align 8, !tbaa !8
  %and31.i.i = and i64 %8, %2
  %tobool32.not.i.i = icmp eq i64 %and31.i.i, %4
  %cond33.i.i = select i1 %tobool32.not.i.i, i64 %4, i64 %5
  %9 = load i64, ptr %arrayidx28.i.i, align 8, !tbaa !8
  %wide.load = load <2 x i64>, ptr %1, align 8, !tbaa !8
  %vector.recur.extract = extractelement <2 x i64> %wide.load, i64 %2
  %and20.i.i = and i64 %vector.recur.extract, %3
  %and24.i.i = and i64 %8, %0
  %or25.i.i = or i64 %and24.i.i, %and20.i.i
  %shr29.i.i = lshr exact i64 %or25.i.i, %2
  %xor30.i.i = xor i64 %shr29.i.i, %9
  %xor34.i.i = xor i64 %xor30.i.i, %cond33.i.i
  store i64 %xor34.i.i, ptr %arrayidx19.i.i, align 8, !tbaa !8
  ret i64 %xor34.i.i
}

define i64 @"33"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !51
  %inc.i71 = add nuw nsw i64 %1, %0
  %inc.i64 = add nuw nsw i64 %inc.i71, %0
  store i64 %inc.i64, ptr %_M_p.i.i.i, align 8, !tbaa !51
  ret i64 %inc.i64
}

define i64 @"34"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %end_size_.i.i) {
bb:
  %.pre.pre.i = load ptr, ptr %end_size_.i.i, align 8, !tbaa !39
  %2 = load i32, ptr %v, align 4, !tbaa !53
  %sub = add nsw i32 %2, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %.pre.pre.i, align 4, !tbaa.struct !55
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"35"(ptr %__first, ptr %add.ptr.i.us, ptr %add.ptr2.i.us, i64 %sub1.i.us, i64 %mul.i.us, i64 %0, i64 %1) {
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

define i32 @"36"(ptr %e.sroa.4.0..sroa_idx, ptr %el, ptr %arrayidx.i) {
bb:
  %0 = load i64, ptr %arrayidx.i, align 8, !tbaa !8
  %1 = load ptr, ptr %el, align 8, !tbaa !37
  %arrayidx = getelementptr inbounds i32, ptr %1, i64 %0
  %e.sroa.4.0.copyload = load i32, ptr %e.sroa.4.0..sroa_idx, align 4, !tbaa.struct !56
  store i32 %e.sroa.4.0.copyload, ptr %arrayidx, align 4, !tbaa !10
  ret i32 %e.sroa.4.0.copyload
}

define i32 @"37"(ptr %end_size_.i, ptr %offsets, i64 %0, ptr %length.i136) {
bb:
  %1 = load ptr, ptr %end_size_.i, align 8, !tbaa !57
  %sub.ptr.lhs.cast.i.i139 = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %offsets, align 8, !tbaa !6
  %sub.ptr.rhs.cast.i.i140 = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i141 = sub i64 %sub.ptr.lhs.cast.i.i139, %sub.ptr.rhs.cast.i.i140
  %3 = lshr exact i64 %sub.ptr.sub.i.i141, %0
  %conv.i142 = trunc i64 %3 to i32
  store i32 %conv.i142, ptr %length.i136, align 4, !tbaa !10
  ret i32 %conv.i142
}

define i64 @"38"(ptr %arrayidx.i59, i64 %0, ptr %.omp.lb, i64 %1, ptr %next, i64 %div1.i.i58) {
bb:
  %2 = load ptr, ptr %next, align 8
  %arrayidx.i592 = getelementptr inbounds i64, ptr %2, i64 %div1.i.i58
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %4 = sext i32 %3 to i64
  %and.i.i57 = and i64 %4, %1
  %shl.i = shl nuw i64 %0, %and.i.i57
  %5 = load i64, ptr %arrayidx.i59, align 8, !tbaa !8, !llvm.access.group !36
  %or.i = or i64 %5, %shl.i
  store i64 %or.i, ptr %arrayidx.i59, align 8, !tbaa !8, !llvm.access.group !36
  ret i64 %or.i
}

define ptr @"39"(ptr %out_index.i, ptr %num_nodes_.i) {
bb:
  %0 = load i64, ptr %num_nodes_.i, align 8, !tbaa !58, !noalias !60
  %1 = load ptr, ptr %out_index.i, align 8, !tbaa !16, !noalias !60
  %arrayidx.i.i = getelementptr inbounds ptr, ptr %1, i64 %0
  %2 = load ptr, ptr %arrayidx.i.i, align 8, !tbaa !16, !noalias !60
  ret ptr %2
}

define i32 @"40"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !37
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %ind.end
  %5 = load i32, ptr %add.ptr.prol, align 4
  ret i32 %5
}

define i32 @"41"(ptr %call171, ptr %arrayidx.i548, ptr %arrayidx.i549) {
bb:
  %0 = load i64, ptr %arrayidx.i548, align 8, !tbaa !8
  %add.ptr263 = getelementptr inbounds i32, ptr %call171, i64 %0
  %1 = load i32, ptr %arrayidx.i549, align 4, !tbaa !10
  %idx.ext = sext i32 %1 to i64
  %add.ptr266 = getelementptr inbounds i32, ptr %add.ptr263, i64 %idx.ext
  %2 = load i32, ptr %add.ptr266, align 4, !tbaa !10
  ret i32 %2
}

define i32 @"42"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %el, align 8, !tbaa !37
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %ind.end
  %add.ptr.sroa_idx.prol = getelementptr inbounds i8, ptr %add.ptr.prol, i64 %2
  %6 = load i32, ptr %add.ptr.sroa_idx.prol, align 4
  ret i32 %6
}

define i64 @"43"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %end_size_.i.i) {
bb:
  %2 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !39
  %3 = load i32, ptr %v, align 4, !tbaa !53
  %sub = add nsw i32 %3, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %2, align 4, !tbaa.struct !55
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"44"(ptr %degrees, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %mul12 = shl i64 %1, %0
  %2 = load ptr, ptr %degrees, align 8, !tbaa !0
  %arrayidx.i31 = getelementptr inbounds i32, ptr %2, i64 %mul12
  %3 = load i32, ptr %arrayidx.i31, align 4, !tbaa !10
  ret i32 %3
}

define <2 x i64> @"45"(ptr %0, <2 x i64> %1, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %udist_, i64 %7, i64 %index15) {
bb:
  %8 = load ptr, ptr %udist_, align 8, !tbaa !49
  %9 = getelementptr inbounds [312 x i64], ptr %8, i64 %7, i64 %index15
  %wide.load18 = load <2 x i64>, ptr %0, align 8, !tbaa !8
  %10 = and <2 x i64> %wide.load18, %3
  %11 = icmp eq <2 x i64> %10, %5
  %12 = select <2 x i1> %11, <2 x i64> %5, <2 x i64> %6
  %wide.load19 = load <2 x i64>, ptr %4, align 8, !tbaa !8
  %13 = shufflevector <2 x i64> %wide.load18, <2 x i64> %wide.load18, <2 x i32> <i32 1, i32 2>
  %14 = and <2 x i64> %13, %2
  %15 = and <2 x i64> %wide.load18, %1
  %16 = or <2 x i64> %15, %14
  %17 = lshr exact <2 x i64> %16, %3
  %18 = xor <2 x i64> %17, %wide.load19
  %19 = xor <2 x i64> %18, %12
  store <2 x i64> %19, ptr %9, align 8, !tbaa !8
  ret <2 x i64> %19
}

define i64 @"46"(ptr %new_range.i.i, i64 %0) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %incdec.ptr.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i = load i64, ptr %incdec.ptr.i.i.i.i, align 4, !tbaa.struct !55
  ret i64 %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i
}

define i8 @"47"(ptr %arrayidx.i17.i, ptr %agg.tmp32, ptr %num_trials_, i32 %0, i64 %idxprom1.i.i) {
bb:
  %1 = load i32, ptr %num_trials_, align 4, !tbaa !26
  %__val.lobit.i = lshr i32 %1, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %2 = load ptr, ptr %agg.tmp32, align 8, !tbaa !35, !alias.scope !23
  %arrayidx.i.i = getelementptr inbounds i8, ptr %2, i64 %conv5.i
  %arrayidx2.i.i = getelementptr inbounds i8, ptr %arrayidx.i.i, i64 %idxprom1.i.i
  %3 = load i8, ptr %arrayidx.i17.i, align 1, !tbaa !22, !noalias !23
  store i8 %3, ptr %arrayidx2.i.i, align 1, !tbaa !22
  ret i8 %3
}

define ptr @"48"(ptr %call.i, ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, i64 %2, ptr %end_size_.i40) {
bb:
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !5
  %sub.ptr.lhs.cast.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %degrees, align 8, !tbaa !0
  %sub.ptr.rhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %sub = add nsw i64 %sub.ptr.div.i, %1
  %div38 = lshr i64 %sub, %2
  %add.ptr.i = getelementptr inbounds i64, ptr %call.i, i64 %div38
  store ptr %add.ptr.i, ptr %end_size_.i40, align 8, !tbaa !57
  ret ptr %add.ptr.i
}

define i32 @"49"(ptr %arrayidx.i247, i32 %0, ptr %depth, ptr %__begin2.0527) {
bb:
  %1 = load i32, ptr %arrayidx.i247, align 4, !tbaa !10
  %add = add nsw i32 %1, %0
  %2 = load ptr, ptr %depth, align 8, !tbaa !0
  %3 = load i32, ptr %__begin2.0527, align 4, !tbaa !10
  %conv17 = sext i32 %3 to i64
  %arrayidx.i246 = getelementptr inbounds i32, ptr %2, i64 %conv17
  store i32 %add, ptr %arrayidx.i246, align 4, !tbaa !10
  ret i32 %add
}

define i64 @"50"(ptr %max_seen.i, i32 %0, ptr %num_nodes_) {
bb:
  %1 = load i32, ptr %max_seen.i, align 4, !tbaa !10
  %add = add nsw i32 %1, %0
  %conv = sext i32 %add to i64
  store i64 %conv, ptr %num_nodes_, align 8, !tbaa !45
  ret i64 %conv
}

define ptr @"51"(ptr %new_range.i.i, ptr %end_size_.i, ptr %el, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !39
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !47
  ret ptr %add.ptr6.i.i
}

define i32 @"52"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3) {
bb:
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add15 = add i64 %ind.end, %2
  %6 = load ptr, ptr %el, align 8, !tbaa !37
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %6, i64 %add15
  %add.ptr.sroa_idx.1 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %3
  %7 = load i32, ptr %add.ptr.sroa_idx.1, align 4
  ret i32 %7
}

define i64 @"53"(ptr %new_range.i.i, i64 %0) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !55
  ret i64 %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i
}

define i64 @"54"(ptr %0, i64 %1, ptr %arrayidx42.i.i, i64 %2, i64 %3, ptr %arrayidx49.i.i, i64 %4, i64 %5, ptr %udist_, i64 %6) {
bb:
  %7 = load i64, ptr %0, align 8, !tbaa !8
  %and52.i.i = and i64 %7, %3
  %tobool53.not.i.i = icmp eq i64 %and52.i.i, %4
  %cond54.i.i = select i1 %tobool53.not.i.i, i64 %4, i64 %5
  %8 = load i64, ptr %arrayidx42.i.i, align 8, !tbaa !8
  %and43.i.i = and i64 %8, %2
  %and46.i.i = and i64 %7, %1
  %or47.i.i = or i64 %and46.i.i, %and43.i.i
  %shr50.i.i = lshr exact i64 %or47.i.i, %3
  %9 = load i64, ptr %arrayidx49.i.i, align 8, !tbaa !8
  %xor51.i.i = xor i64 %shr50.i.i, %9
  %xor55.i.i = xor i64 %xor51.i.i, %cond54.i.i
  %10 = load ptr, ptr %udist_, align 8, !tbaa !49
  %arrayidx42.i.i2 = getelementptr inbounds [312 x i64], ptr %0, i64 %4, i64 311
  store i64 %xor55.i.i, ptr %arrayidx42.i.i, align 8, !tbaa !8
  ret i64 %xor55.i.i
}

define i32 @"55"(ptr %el, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %1 = load ptr, ptr %el, align 8, !tbaa !37
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %0
  %2 = load i32, ptr %add.ptr, align 4
  ret i32 %2
}

define i64 @"56"(ptr %arrayidx.i58.epil, i64 %total.076.epil, ptr %arrayidx.i57.epil) {
bb:
  %0 = load i64, ptr %arrayidx.i58.epil, align 8, !tbaa !8
  %add7.epil = add nsw i64 %0, %total.076.epil
  store i64 %add7.epil, ptr %arrayidx.i57.epil, align 8, !tbaa !8
  ret i64 %add7.epil
}

define i32 @"57"(ptr %.omp.lb, ptr %permutation, i64 %indvars.iv) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %1 = sext i32 %0 to i64
  %2 = trunc i64 %1 to i32
  %3 = load ptr, ptr %permutation, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds i32, ptr %3, i64 %indvars.iv
  store i32 %2, ptr %arrayidx.i, align 4, !tbaa !10
  ret i32 %2
}

define ptr @"58"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !39
  ret ptr %add.ptr.i
}

define ptr @"59"(ptr %this, i64 %0, i32 %1, ptr %__first.addr.07.i.i.i.i) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !16
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %2, i64 %0, i32 2
  store ptr %3, ptr %__first.addr.07.i.i.i.i, align 8, !tbaa !35, !alias.scope !63, !noalias !66
  ret ptr %3
}

define i32 @"60"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.1659, ptr %arrayidx.i541) {
bb:
  %1 = load i64, ptr %arrayidx.i542, align 8, !tbaa !8
  %i200.0 = add nsw i64 %1, %0
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %.pre731 = sext i32 %.pre717 to i64
  %sub222 = sub nsw i64 %total_missing_inv.1659, %.pre731
  %sub211 = sub nsw i64 %i200.0, %sub222
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %2 = load i32, ptr %arrayidx212, align 4, !tbaa !10
  ret i32 %2
}

define i64 @"61"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57) {
bb:
  %0 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !8
  %1 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !8
  %2 = load i64, ptr %arrayidx.i58, align 8, !tbaa !8
  %add7 = add nsw i64 %2, %total.076
  %3 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !8
  %add7.1 = add nsw i64 %3, %add7
  %add7.2 = add nsw i64 %1, %add7.1
  %add7.3 = add nsw i64 %0, %add7.2
  store i64 %add7.3, ptr %arrayidx.i57, align 8, !tbaa !8
  ret i64 %add7.3
}

define i32 @"62"(ptr %call171, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %0, i64 %1, i64 %total_missing_inv.0649, ptr %arrayidx.i536) {
bb:
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !8
  %3 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %conv198 = sext i32 %3 to i64
  %4 = load i64, ptr %arrayidx.i540, align 8, !tbaa !8
  %add199 = add nsw i64 %4, %conv198
  %5 = sub i64 %2, %add199
  %n.vec793 = and i64 %5, %0
  %ind.end794 = sub i64 %2, %n.vec793
  %i200.0 = add nsw i64 %ind.end794, %1
  %6 = load i32, ptr %arrayidx.i536, align 4, !tbaa !10
  %conv155 = sext i32 %6 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %sub211 = sub nsw i64 %i200.0, %add156
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %7 = load i32, ptr %arrayidx212, align 4, !tbaa !10
  ret i32 %7
}

define i64 @"63"(ptr %add.ptr.i.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, ptr %v.i.i.i.i.i.i, ptr %v3.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %add.ptr.i.i.i.i.i, align 4
  %2 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !40
  %3 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !40
  %cmp.i.i.i.i.i.i = icmp eq i32 %2, %3
  %cmp7.i.i.i.i.i.i = icmp slt i32 %2, %3
  %4 = load i32, ptr %v3.i.i.i.i.i.i, align 4
  %5 = load i32, ptr %v.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i = icmp slt i32 %5, %4
  %cond.i.i.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i1 %cmp4.i.i.i.i.i.i, i1 %cmp7.i.i.i.i.i.i
  %spec.select.i.i.i.i = select i1 %cond.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %add.ptr2.i.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %sub12.i.i.i.i
  store i64 %1, ptr %add.ptr2.i.i.i.i.i, align 4
  ret i64 %1
}

define i64 @"64"(i64 %0, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %this, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %1
  %_M_string_length.i24.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i, i32 1
  store i64 %0, ptr %_M_string_length.i24.i.i.i, align 8, !tbaa !48
  ret i64 %0
}

define i64 @"65"(ptr %this, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %1 = load ptr, ptr %this, align 8, !tbaa !37
  %arrayidx = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %0
  %2 = load i64, ptr %arrayidx, align 4
  ret i64 %2
}

define <2 x i64> @"66"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %rng, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
bb:
  %wide.load91 = load <2 x i64>, ptr %0, align 8, !tbaa !8
  %10 = and <2 x i64> %wide.load91, %5
  %11 = icmp eq <2 x i64> %10, %7
  %12 = select <2 x i1> %11, <2 x i64> %7, <2 x i64> %8
  %13 = load i64, ptr %rng, align 8, !tbaa !8
  %vector.recur.init89 = insertelement <2 x i64> %2, i64 %13, i64 %3
  %14 = shufflevector <2 x i64> %vector.recur.init89, <2 x i64> %wide.load91, <2 x i32> <i32 1, i32 2>
  %15 = and <2 x i64> %14, %4
  %16 = and <2 x i64> %wide.load91, %1
  %17 = or <2 x i64> %16, %15
  %18 = lshr exact <2 x i64> %17, %5
  %wide.load92 = load <2 x i64>, ptr %6, align 8, !tbaa !8
  %19 = xor <2 x i64> %18, %wide.load92
  %20 = xor <2 x i64> %19, %12
  store <2 x i64> %20, ptr %9, align 8, !tbaa !8
  ret <2 x i64> %20
}

define <4 x i32> @"67"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.1659, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !8
  %3 = add i64 %2, %0
  %4 = sub nsw i64 %3, %total_missing_inv.1659
  %5 = getelementptr inbounds i32, ptr %call171, i64 %4
  %6 = getelementptr inbounds i32, ptr %5, i64 %1
  %wide.load803 = load <4 x i32>, ptr %6, align 4, !tbaa !10
  ret <4 x i32> %wide.load803
}

define i32 @"68"(ptr %arrayidx212, ptr %call171, ptr %arrayidx.i539, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i539, align 8, !tbaa !8
  %sub183 = add nsw i64 %1, %0
  %arrayidx213 = getelementptr inbounds i32, ptr %call171, i64 %sub183
  %2 = load i32, ptr %arrayidx212, align 4, !tbaa !10
  store i32 %2, ptr %arrayidx213, align 4, !tbaa !10
  ret i32 %2
}

define <4 x i32> @"69"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.0649, ptr %arrayidx.i536, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !8
  %3 = add i64 %2, %0
  %4 = load i32, ptr %arrayidx.i536, align 4, !tbaa !10
  %conv155 = sext i32 %4 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %5 = sub nsw i64 %3, %add156
  %6 = getelementptr inbounds i32, ptr %call171, i64 %5
  %7 = getelementptr inbounds i32, ptr %6, i64 %1
  %wide.load803 = load <4 x i32>, ptr %7, align 4, !tbaa !10
  ret <4 x i32> %wide.load803
}

define i32 @"70"(i64 %indvars.iv699, ptr %incdec.ptr4.sink.i.i.i.i569, ptr %__first.addr.015.i.i563, ptr %call171, ptr %arrayidx.i550, i64 %sub.ptr.rhs.cast.i.i.i.i552, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i550, align 8, !tbaa !8
  %add.ptr271 = getelementptr inbounds i32, ptr %call171, i64 %2
  %sub.ptr.lhs.cast.i.i.i.i551 = ptrtoint ptr %add.ptr271 to i64
  %sub.ptr.sub.i.i.i.i553 = sub i64 %sub.ptr.lhs.cast.i.i.i.i551, %sub.ptr.rhs.cast.i.i.i.i552
  %sub.ptr.div.i.i.i.i561 = lshr exact i64 %sub.ptr.sub.i.i.i.i553, %0
  %shr.i.i565 = lshr i64 %sub.ptr.div.i.i.i.i561, %1
  %incdec.ptr4.sink.i.i.i.i5692 = getelementptr inbounds i32, ptr %__first.addr.015.i.i563, i64 %shr.i.i565
  %incdec.ptr.i.i571 = getelementptr inbounds i32, ptr %incdec.ptr4.sink.i.i.i.i569, i64 %1
  %3 = load i32, ptr %incdec.ptr4.sink.i.i.i.i569, align 4, !tbaa !10
  %4 = sext i32 %3 to i64
  %cmp.i.i.i570 = icmp sgt i64 %indvars.iv699, %4
  %__first.addr.1.i.i574 = select i1 %cmp.i.i.i570, ptr %incdec.ptr.i.i571, ptr %__first.addr.015.i.i563
  %5 = load i32, ptr %__first.addr.1.i.i574, align 4, !tbaa !10
  ret i32 %5
}

define <4 x i32> @"71"(<4 x i32> %0, ptr %init_val, i64 %1, ptr %this, ptr %.omp.lb, i64 %index) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %offset.idx = add i64 %2, %index
  %3 = load ptr, ptr %this, align 8, !tbaa !0
  %4 = getelementptr inbounds i32, ptr %3, i64 %offset.idx
  %5 = load i32, ptr %init_val, align 4, !tbaa !10, !alias.scope !17
  %broadcast.splatinsert21 = insertelement <4 x i32> %0, i32 %5, i64 %1
  %broadcast.splat22 = shufflevector <4 x i32> %broadcast.splatinsert21, <4 x i32> %0, <4 x i32> zeroinitializer
  store <4 x i32> %broadcast.splat22, ptr %4, align 4, !tbaa !10, !alias.scope !20, !noalias !17
  ret <4 x i32> %broadcast.splat22
}

define <4 x i32> @"72"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.1659, ptr %arrayidx.i541, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !8
  %3 = add i64 %2, %0
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %.pre731 = sext i32 %.pre717 to i64
  %sub222 = sub nsw i64 %total_missing_inv.1659, %.pre731
  %4 = sub nsw i64 %3, %sub222
  %5 = getelementptr inbounds i32, ptr %call171, i64 %4
  %6 = getelementptr inbounds i32, ptr %5, i64 %1
  %wide.load803 = load <4 x i32>, ptr %6, align 4, !tbaa !10
  ret <4 x i32> %wide.load803
}

define i32 @"73"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i32, ptr %init_val, align 4, !tbaa !10
  %4 = load ptr, ptr %this, align 8, !tbaa !0
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %6 = sub i64 %0, %5
  %n.vec = and i64 %6, %1
  %ind.end = add i64 %5, %n.vec
  %add7 = add i64 %ind.end, %2
  %add.ptr.1 = getelementptr inbounds i32, ptr %4, i64 %add7
  store i32 %3, ptr %add.ptr.1, align 4, !tbaa !10
  ret i32 %3
}

define i64 @"74"(i64 %val.coerce, ptr %new_range.i, ptr %end_size_.i, ptr %this, i64 %0) {
bb:
  %1 = load ptr, ptr %end_size_.i, align 8, !tbaa !39
  %sub.ptr.lhs.cast.i10.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %this, align 8, !tbaa !37
  %sub.ptr.rhs.cast.i11.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i12.i = sub i64 %sub.ptr.lhs.cast.i10.i, %sub.ptr.rhs.cast.i11.i
  %sub.ptr.div.i13.i = ashr exact i64 %sub.ptr.sub.i12.i, %0
  %3 = load ptr, ptr %new_range.i, align 8, !tbaa !16
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div.i13.i
  store i64 %val.coerce, ptr %add.ptr.i, align 4, !tbaa.struct !55
  ret i64 %val.coerce
}

define <8 x i32> @"75"(ptr %el, ptr %.omp.lb, i64 %index, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %offset.idx = add i64 %1, %index
  %2 = add i64 %offset.idx, %0
  %3 = load ptr, ptr %el, align 8, !tbaa !37
  %4 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %2
  %wide.vec44 = load <8 x i32>, ptr %4, align 4
  ret <8 x i32> %wide.vec44
}

define i64 @"76"(ptr %new_range.i.i, i64 %0, i64 %1) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr13.i.i.i.i, i64 %1
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.030.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i32 @"77"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0, i64 %1) {
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

define ptr @"78"(ptr %neighs, ptr %arrayidx.i.prol, ptr %index, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %index, align 8, !tbaa !16
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %arrayidx.prol = getelementptr inbounds ptr, ptr %0, i64 %2
  %3 = load ptr, ptr %neighs, align 8, !tbaa !16
  %4 = load i64, ptr %arrayidx.i.prol, align 8, !tbaa !8
  %add.ptr.prol = getelementptr inbounds i32, ptr %3, i64 %4
  store ptr %add.ptr.prol, ptr %arrayidx.prol, align 8, !tbaa !16
  ret ptr %add.ptr.prol
}

define <2 x i64> @"79"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %3, i64 %4, <2 x i64> %5, <2 x i64> %6, ptr %7, <2 x i64> %8, <2 x i64> %9, ptr %udist_, i64 %10, i64 %index15) {
bb:
  %11 = load ptr, ptr %udist_, align 8, !tbaa !49
  %12 = getelementptr inbounds [312 x i64], ptr %3, i64 %10, i64 %index15
  %wide.load18 = load <2 x i64>, ptr %0, align 8, !tbaa !8
  %13 = and <2 x i64> %wide.load18, %6
  %14 = icmp eq <2 x i64> %13, %8
  %15 = select <2 x i1> %14, <2 x i64> %8, <2 x i64> %9
  %wide.load19 = load <2 x i64>, ptr %7, align 8, !tbaa !8
  %.pre.i.i = load i64, ptr %3, align 8, !tbaa !8
  %vector.recur.init16 = insertelement <2 x i64> %2, i64 %.pre.i.i, i64 %4
  %16 = shufflevector <2 x i64> %vector.recur.init16, <2 x i64> %wide.load18, <2 x i32> <i32 1, i32 2>
  %17 = and <2 x i64> %16, %5
  %18 = and <2 x i64> %wide.load18, %1
  %19 = or <2 x i64> %18, %17
  %20 = lshr exact <2 x i64> %19, %6
  %21 = xor <2 x i64> %20, %wide.load19
  %22 = xor <2 x i64> %21, %15
  store <2 x i64> %22, ptr %12, align 8, !tbaa !8
  ret <2 x i64> %22
}

define ptr @"80"(ptr %new_range.i.i, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !37
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !39
  ret ptr %add.ptr.i464
}

define ptr @"81"(ptr %neighs, ptr %arrayidx.i.1, ptr %index, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !8
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

define i64 @"82"(ptr %arrayidx.i492.1, ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i492.1, align 8, !tbaa !8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !45
  %4 = and i64 %3, %0
  %indvars.iv.next = add nsw i64 %4, %1
  %5 = load ptr, ptr %offsets, align 8
  %arrayidx.i493.1 = getelementptr inbounds i64, ptr %5, i64 %indvars.iv.next
  store i64 %2, ptr %arrayidx.i493.1, align 8, !tbaa !8
  ret i64 %2
}

define i32 @"83"(ptr %neighs, ptr %arrayidx.i522) {
bb:
  %0 = load ptr, ptr %neighs, align 8, !tbaa !16
  %1 = load i64, ptr %arrayidx.i522, align 8, !tbaa !8
  %arrayidx112 = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %arrayidx112, align 4, !tbaa !10
  ret i32 %2
}

define i64 @"84"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !51
  %inc.i71 = add nuw nsw i64 %1, %0
  %inc.i207 = add nuw nsw i64 %inc.i71, %0
  %inc.i139 = add nuw nsw i64 %inc.i207, %0
  store i64 %inc.i139, ptr %_M_p.i.i.i, align 8, !tbaa !51
  ret i64 %inc.i139
}

define i32 @"85"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add15 = add i64 %ind.end, %2
  %5 = load ptr, ptr %el, align 8, !tbaa !37
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %add15
  %6 = load i32, ptr %add.ptr.1, align 4
  ret i32 %6
}

define i32 @"86"(ptr %.omp.lb, ptr %arrayidx.i27) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %1 = sext i32 %0 to i64
  %2 = trunc i64 %1 to i32
  store i32 %2, ptr %arrayidx.i27, align 4, !tbaa !10
  ret i32 %2
}

define i64 @"87"(ptr %arrayidx.i58.epil, i64 %total.076.epil, ptr %call.i4145, ptr %num_blocks) {
bb:
  %0 = load i64, ptr %num_blocks, align 8, !tbaa !8
  %arrayidx.i = getelementptr inbounds i64, ptr %call.i4145, i64 %0
  %1 = load i64, ptr %arrayidx.i58.epil, align 8, !tbaa !8
  %add7.epil = add nsw i64 %1, %total.076.epil
  store i64 %add7.epil, ptr %arrayidx.i, align 8, !tbaa !8
  ret i64 %add7.epil
}

define i64 @"88"(ptr %.omp.lb, i64 %0, i64 %1, ptr %rng) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %add10 = add i64 %2, %0
  %rem.i.i.i = and i64 %add10, %1
  store i64 %rem.i.i.i, ptr %rng, align 8, !tbaa !8
  ret i64 %rem.i.i.i
}

define ptr @"89"(ptr %new_range.i.i457, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !37
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %2 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !16
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !47
  ret ptr %add.ptr6.i.i478
}

define i64 @"90"(ptr %arrayidx.i, ptr %prefix, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %mul14 = shl i64 %1, %0
  %2 = load ptr, ptr %prefix, align 8
  %arrayidx.i34 = getelementptr inbounds i64, ptr %2, i64 %mul14
  %3 = load i64, ptr %arrayidx.i, align 8, !tbaa !8
  store i64 %3, ptr %arrayidx.i34, align 8, !tbaa !8
  ret i64 %3
}

define i32 @"91"(ptr %queue, ptr %shared_out_start.i, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %queue, align 8, !tbaa !42
  %1 = load i64, ptr %shared_out_start.i, align 8, !tbaa !44
  %add.ptr.i = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %add.ptr = getelementptr inbounds i32, ptr %add.ptr.i, i64 %2
  %3 = load i32, ptr %add.ptr, align 4, !tbaa !10
  ret i32 %3
}

define i64 @"92"(ptr %offsets, ptr %num_nodes_.i) {
bb:
  %.pre716.pre727 = load ptr, ptr %offsets, align 8, !tbaa !6
  %0 = load i64, ptr %num_nodes_.i, align 8, !tbaa !45
  %arrayidx.i533 = getelementptr inbounds i64, ptr %.pre716.pre727, i64 %0
  %1 = load i64, ptr %arrayidx.i533, align 8, !tbaa !8
  ret i64 %1
}

define i32 @"93"(ptr %num_nodes_.i, i32 %0, ptr %.omp.ub) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !58
  %conv = trunc i64 %1 to i32
  %sub6 = add nsw i32 %conv, %0
  store i32 %sub6, ptr %.omp.ub, align 4, !tbaa !10
  ret i32 %sub6
}

define i64 @"94"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !51
  %inc.i71 = add nuw nsw i64 %2, %1
  %inc.i207 = add nuw nsw i64 %inc.i71, %1
  %arrayidx.i140 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i207
  %3 = load i64, ptr %arrayidx.i140, align 8, !tbaa !8
  ret i64 %3
}

define i64 @"95"(ptr %arrayidx.i18.i, ptr %0, i64 %1, ptr %2) {
bb:
  %3 = load ptr, ptr %0, align 8, !tbaa !16, !noalias !60
  %sub.ptr.rhs.cast.i20.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %arrayidx.i18.i, align 8, !tbaa !16, !noalias !60
  %sub.ptr.lhs.cast.i19.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i21.i = sub i64 %sub.ptr.lhs.cast.i19.i, %sub.ptr.rhs.cast.i20.i
  %sub.ptr.div.i22.i = ashr exact i64 %sub.ptr.sub.i21.i, %1
  %div.i.i = sdiv i64 %sub.ptr.div.i22.i, %1
  store i64 %div.i.i, ptr %2, align 8, !alias.scope !60
  ret i64 %div.i.i
}

define i64 @"96"(ptr %add.ptr.i.i.i.i16, ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i64, ptr %add.ptr.i.i.i.i16, align 4
  %1 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !40
  %2 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !40
  %cmp.i.i.i.i.i = icmp eq i32 %1, %2
  %3 = load i32, ptr %v3.i.i.i.i.i, align 4
  %4 = load i32, ptr %v.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %4, %3
  %cmp7.i.i.i.i.i = icmp slt i32 %1, %2
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr2.i.i.i.i23 = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  store i64 %0, ptr %add.ptr2.i.i.i.i23, align 4
  ret i64 %0
}

define i32 @"97"(ptr %__first.addr.033.i.i, ptr %n_start.0.in, i64 %0) {
bb:
  %1 = load i32, ptr %__first.addr.033.i.i, align 4, !tbaa !10
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  store i32 %1, ptr %incdec.ptr12.i.i.i.i, align 4, !tbaa !10
  ret i32 %1
}

define i64 @"98"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !55
  ret i64 %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i
}

define i64 @"99"(ptr %new_range.i.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %agg.tmp.sroa.0.0.copyload.i.i.i.i.i = load i64, ptr %.pre.i.i, align 4, !tbaa.struct !55
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i.i.i
}

define i32 @"100"(ptr %neighs, ptr %arrayidx.i523) {
bb:
  %0 = load ptr, ptr %neighs, align 8, !tbaa !16
  %1 = load i64, ptr %arrayidx.i523, align 8, !tbaa !8
  %add.ptr = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %add.ptr, align 4, !tbaa !10
  ret i32 %2
}

define i32 @"101"(ptr %n_start.0.in, i64 %0, i64 %1, ptr %diffs, ptr %.omp.lb) {
bb:
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %3 = sext i32 %2 to i64
  %4 = load ptr, ptr %diffs, align 8, !tbaa !0
  %arrayidx.i99 = getelementptr inbounds i32, ptr %4, i64 %3
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i89 = ptrtoint ptr %n_start.0 to i64
  %incdec.ptr7.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast.i.i89
  %5 = lshr exact i64 %sub.ptr.sub, %1
  %conv22 = trunc i64 %5 to i32
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !10
  ret i32 %conv22
}

define ptr @"102"(ptr %new_range.i.i457, ptr %new_range.i.i, i64 %0, ptr %el, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !37
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %2 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !16
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !47
  ret ptr %add.ptr6.i.i478
}

define i32 @"103"(ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !40
  %3 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !40
  %cmp.i.i.i.i.i = icmp eq i32 %2, %3
  %4 = load i32, ptr %v3.i.i.i.i.i, align 4
  %5 = load i32, ptr %v.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %5, %4
  %cmp7.i.i.i.i.i = icmp slt i32 %2, %3
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %__parent.020.in.i.i.i.i = add nsw i64 %spec.select.i.i.i, %0
  %__parent.020.i.i.i.i = sdiv i64 %__parent.020.in.i.i.i.i, %1
  %add.ptr.i.i.i.i16 = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %__parent.020.i.i.i.i
  %6 = load i32, ptr %add.ptr.i.i.i.i16, align 4, !tbaa !40
  ret i32 %6
}

define ptr @"104"(ptr %cond.i31, i64 %.sroa.speculated.i, ptr %_M_finish.i.i, ptr %this, i64 %0, i64 %sub.ptr.div.i.i, i1 %cmp9.i, i64 %1, i64 %add.i, ptr %_M_end_of_storage) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !68
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i2 = ashr exact i64 %sub.ptr.sub.i.i, %0
  %add.i4 = add i64 %.sroa.speculated.i, %sub.ptr.div.i.i
  %cmp7.i = icmp ult i64 %add.i, %sub.ptr.div.i.i
  %or.cond.i = or i1 %cmp7.i, %cmp9.i
  %cond.i = select i1 %or.cond.i, i64 %1, i64 %add.i
  %add.ptr19 = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %cond.i
  store ptr %add.ptr19, ptr %_M_end_of_storage, align 8, !tbaa !69
  ret ptr %add.ptr19
}

define i32 @"105"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %init_val, align 4, !tbaa !10
  %3 = load ptr, ptr %this, align 8, !tbaa !0
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add.ptr = getelementptr inbounds i32, ptr %3, i64 %ind.end
  store i32 %2, ptr %add.ptr, align 4, !tbaa !10
  ret i32 %2
}

define ptr @"106"(ptr %el, i64 %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !39
  ret ptr %add.ptr.i
}

define <4 x i32> @"107"(ptr %0, ptr %call171, i64 %tail_index.0660, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %1, i64 %index800, i64 %2) {
bb:
  %3 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %conv198 = sext i32 %3 to i64
  %4 = load i64, ptr %arrayidx.i540, align 8, !tbaa !8
  %add199 = add nsw i64 %4, %conv198
  %5 = load i64, ptr %arrayidx.i542, align 8, !tbaa !8
  %6 = sub i64 %5, %add199
  %n.vec793 = and i64 %6, %1
  %ind.end796 = sub i64 %tail_index.0660, %n.vec793
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %.pre731 = sext i32 %.pre717 to i64
  %sub226 = sub nsw i64 %ind.end796, %.pre731
  %offset.idx801 = sub i64 %sub226, %index800
  %7 = getelementptr inbounds i32, ptr %call171, i64 %offset.idx801
  %8 = getelementptr inbounds i32, ptr %7, i64 %2
  %wide.load803 = load <4 x i32>, ptr %0, align 4, !tbaa !10
  store <4 x i32> %wide.load803, ptr %8, align 4, !tbaa !10
  ret <4 x i32> %wide.load803
}

define i8 @"108"(ptr %label) {
bb:
  %0 = load ptr, ptr %label, align 8, !tbaa !35, !noalias !70
  %1 = load i8, ptr %0, align 1, !tbaa !22
  ret i8 %1
}

define ptr @"109"(ptr %__args, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0) {
bb:
  %1 = load ptr, ptr %__args, align 8, !tbaa !35
  %2 = load ptr, ptr %this, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %add.ptr = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i
  store ptr %1, ptr %add.ptr, align 8, !tbaa !35
  ret ptr %1
}

define i64 @"110"(ptr %incdec.ptr126.i.i, ptr %el, i64 %0) {
bb:
  %1 = load i64, ptr %incdec.ptr126.i.i, align 4
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr5.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  store i64 %1, ptr %incdec.ptr5.i.i, align 4
  ret i64 %1
}

define ptr @"111"(ptr %index.i137, ptr %0) {
bb:
  %1 = load ptr, ptr %index.i137, align 8, !tbaa !16
  store ptr %1, ptr %0, align 8
  ret ptr %1
}

define i64 @"112"(ptr %arrayidx.i492.prol, ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !45
  %3 = and i64 %2, %0
  %arrayidx.i493.prol = getelementptr inbounds i64, ptr %1, i64 %3
  %4 = load i64, ptr %arrayidx.i492.prol, align 8, !tbaa !8
  store i64 %4, ptr %arrayidx.i493.prol, align 8, !tbaa !8
  ret i64 %4
}

define i64 @"113"(ptr %arrayidx.i492, ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i492, align 8, !tbaa !8
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !45
  %4 = and i64 %3, %0
  %arrayidx.i493 = getelementptr inbounds i64, ptr %2, i64 %4
  store i64 %1, ptr %arrayidx.i493, align 8, !tbaa !8
  ret i64 %1
}

define ptr @"114"(ptr %new_range.i.i457, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1, ptr %el, ptr %end_capacity_.i.i.i) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !37
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !39
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %2 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !16
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !47
  ret ptr %add.ptr6.i.i478
}

define i64 @"115"(i64 %lsum.035, ptr %arrayidx.i31, ptr %local_sums, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %local_sums, align 8, !tbaa !6
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %arrayidx.i = getelementptr inbounds i64, ptr %0, i64 %1
  %2 = load i32, ptr %arrayidx.i31, align 4, !tbaa !10
  %conv = sext i32 %2 to i64
  %add15 = add nsw i64 %lsum.035, %conv
  store i64 %add15, ptr %arrayidx.i, align 8, !tbaa !8
  ret i64 %add15
}

define i64 @"116"(ptr %queue, ptr %shared_out_end.i, ptr %shared_out_start.i, i64 %0, i64 %1, ptr %.omp.ub) {
bb:
  %2 = load i64, ptr %shared_out_end.i, align 8, !tbaa !73
  %3 = load ptr, ptr %queue, align 8, !tbaa !42
  %add.ptr.i55 = getelementptr inbounds i32, ptr %3, i64 %2
  %sub.ptr.lhs.cast = ptrtoint ptr %add.ptr.i55 to i64
  %4 = load i64, ptr %shared_out_start.i, align 8, !tbaa !44
  %add.ptr.i = getelementptr inbounds i32, ptr %3, i64 %4
  %sub.ptr.rhs.cast = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %sub = add nsw i64 %sub.ptr.div, %1
  store i64 %sub, ptr %.omp.ub, align 8, !tbaa !8
  ret i64 %sub
}

define i32 @"117"(ptr %call171, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %0, i64 %1, i64 %total_missing_inv.1659) {
bb:
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !8
  %3 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %conv198 = sext i32 %3 to i64
  %4 = load i64, ptr %arrayidx.i540, align 8, !tbaa !8
  %add199 = add nsw i64 %4, %conv198
  %5 = sub i64 %2, %add199
  %n.vec793 = and i64 %5, %0
  %ind.end794 = sub i64 %2, %n.vec793
  %i200.0 = add nsw i64 %ind.end794, %1
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %.pre731 = sext i32 %.pre717 to i64
  %sub222 = sub nsw i64 %total_missing_inv.1659, %.pre731
  %sub211 = sub nsw i64 %i200.0, %sub222
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %6 = load i32, ptr %arrayidx212, align 4, !tbaa !10
  ret i32 %6
}

define i64 @"118"(ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, i64 %2, ptr %num_blocks) {
bb:
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !5
  %sub.ptr.lhs.cast.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %degrees, align 8, !tbaa !0
  %sub.ptr.rhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %sub = add nsw i64 %sub.ptr.div.i, %1
  %div38 = lshr i64 %sub, %2
  store i64 %div38, ptr %num_blocks, align 8, !tbaa !8
  ret i64 %div38
}

define i64 @"119"(ptr %arrayidx, ptr %new_range, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %arrayidx, align 4
  %1 = load ptr, ptr %new_range, align 8, !tbaa !16
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %arrayidx7 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %2
  store i64 %0, ptr %arrayidx7, align 4
  ret i64 %0
}

define i32 @"120"(ptr %n_start.0.in, i64 %0) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %1 = load i32, ptr %incdec.ptr12.i.i.i.i, align 4, !tbaa !10
  ret i32 %1
}

define ptr @"121"(ptr %new_range.i.i457, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %3 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !16
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !37
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !39
  ret ptr %add.ptr.i464
}

define i64 @"122"(ptr %num_edges_, i64 %0, i64 %1, i64 %2, ptr %.omp.ub) {
bb:
  %3 = load i64, ptr %num_edges_, align 8, !tbaa !74
  %sub3 = add nuw i64 %3, %0
  %div36 = lshr i64 %sub3, %1
  %sub4 = add nsw i64 %div36, %2
  store i64 %sub4, ptr %.omp.ub, align 8, !tbaa !8
  ret i64 %sub4
}

define i32 @"123"(ptr %start_vertex_.i, ptr %sp) {
bb:
  %0 = load i64, ptr %start_vertex_.i, align 8, !tbaa !76
  %conv = trunc i64 %0 to i32
  store i32 %conv, ptr %sp, align 8, !tbaa !77
  ret i32 %conv
}

define i32 @"124"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %2 = load ptr, ptr %el, align 8, !tbaa !37
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %1
  %add.ptr.sroa_idx = getelementptr inbounds i8, ptr %add.ptr, i64 %0
  %3 = load i32, ptr %add.ptr.sroa_idx, align 4
  ret i32 %3
}

define i8 @"125"(ptr %0, ptr %opt_arg) {
bb:
  %1 = load i8, ptr %0, align 8, !tbaa !22
  %2 = load ptr, ptr %opt_arg, align 8, !tbaa !35
  store i8 %1, ptr %2, align 1, !tbaa !22
  ret i8 %1
}

define i64 @"127"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %2) {
bb:
  %3 = load ptr, ptr %agg.result, align 8, !tbaa !37
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !39
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = ashr exact i64 %sub.ptr.sub.i12.i.i, %2
  %5 = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %add.ptr.i.i149 = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %sub.ptr.div.i13.i.i
  %6 = load i32, ptr %v, align 4, !tbaa !53
  %sub = add nsw i32 %6, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %add.ptr.i.i149, align 4, !tbaa.struct !55
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"128"(ptr %call171, ptr %arrayidx.i547, ptr %arrayidx.i546) {
bb:
  %0 = load i64, ptr %arrayidx.i547, align 8, !tbaa !8
  %1 = load i32, ptr %arrayidx.i546, align 4, !tbaa !10
  %conv246 = sext i32 %1 to i64
  %add247 = add nsw i64 %0, %conv246
  %arrayidx257 = getelementptr inbounds i32, ptr %call171, i64 %add247
  %2 = load i32, ptr %arrayidx257, align 4, !tbaa !10
  ret i32 %2
}

define i64 @"129"(ptr %offsets, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %indvars.iv.next = add nsw i64 %2, %0
  %3 = load ptr, ptr %offsets, align 8, !tbaa !6
  %arrayidx.i.1 = getelementptr inbounds i64, ptr %3, i64 %indvars.iv.next
  %4 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !8
  ret i64 %4
}

define i64 @"130"(ptr %__first.addr.033.i.i, ptr %el, i64 %0) {
bb:
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.033.i.i, align 4
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  store i64 %agg.tmp.sroa.0.0.copyload.i.i.i, ptr %incdec.ptr13.i.i.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define <2 x i64> @"131"(ptr %0, <2 x i64> %1, <2 x i64> %vector.recur90, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %7) {
bb:
  %wide.load91 = load <2 x i64>, ptr %0, align 8, !tbaa !8
  %8 = and <2 x i64> %wide.load91, %3
  %9 = icmp eq <2 x i64> %8, %5
  %10 = select <2 x i1> %9, <2 x i64> %5, <2 x i64> %6
  %11 = shufflevector <2 x i64> %vector.recur90, <2 x i64> %wide.load91, <2 x i32> <i32 1, i32 2>
  %12 = and <2 x i64> %11, %2
  %13 = and <2 x i64> %wide.load91, %1
  %14 = or <2 x i64> %13, %12
  %15 = lshr exact <2 x i64> %14, %3
  %wide.load92 = load <2 x i64>, ptr %4, align 8, !tbaa !8
  %16 = xor <2 x i64> %15, %wide.load92
  %17 = xor <2 x i64> %16, %10
  store <2 x i64> %17, ptr %7, align 8, !tbaa !8
  ret <2 x i64> %17
}

define ptr @"132"(ptr %new_range.i.i457, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1, ptr %el) {
bb:
  %2 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !16
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !37
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !39
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !39
  ret ptr %add.ptr.i464
}

define i32 @"133"(ptr %arrayidx67) {
bb:
  %0 = load ptr, ptr %arrayidx67, align 8, !tbaa !16
  %1 = load i32, ptr %0, align 4, !tbaa !10
  ret i32 %1
}

define i32 @"134"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %5 = load ptr, ptr %el, align 8, !tbaa !37
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %ind.end
  %add.ptr.sroa_idx = getelementptr inbounds i8, ptr %add.ptr, i64 %2
  %6 = load i32, ptr %add.ptr.sroa_idx, align 4
  ret i32 %6
}

define i64 @"135"(ptr %arrayidx.i208, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i211, i64 %4, i64 %5, i64 %xor4.i214, i64 %6, i64 %xor7.i217, ptr %num_nodes_, i64 %7, ptr %arrayidx.i72, i64 %xor.i75, i64 %xor4.i78, i64 %xor7.i81, i32 %8, ptr %el, ptr %.omp.lb) {
bb:
  %9 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %mul = shl i64 %9, %6
  %10 = load ptr, ptr %el, align 8, !tbaa !37
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %10, i64 %mul
  %11 = load i64, ptr %arrayidx.i72, align 8, !tbaa !8
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
  %12 = load i64, ptr %arrayidx.i208, align 8, !tbaa !8
  %shr.i209 = lshr i64 %12, %0
  %and.i210 = and i64 %shr.i209, %1
  %xor.i2118 = xor i64 %and.i210, %12
  %shl.i212 = shl i64 %xor.i211, %2
  %and3.i213 = and i64 %shl.i212, %3
  %xor4.i21410 = xor i64 %and3.i213, %xor.i211
  %shl5.i215 = shl i64 %xor4.i214, %4
  %and6.i216 = and i64 %shl5.i215, %5
  %xor7.i21712 = xor i64 %and6.i216, %xor4.i214
  %shr8.i218 = lshr i64 %xor7.i217, %6
  %xor9.i219 = xor i64 %shr8.i218, %xor7.i217
  %conv.i42 = trunc i64 %xor9.i219 to i32
  %13 = load i64, ptr %num_nodes_, align 8, !tbaa !80
  %14 = trunc i64 %13 to i32
  %rem.i52 = urem i32 %conv.i42, %8
  %ref.tmp16.sroa.4.0.insert.ext = zext i32 %rem.i52 to i64
  %ref.tmp16.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp16.sroa.4.0.insert.ext, %7
  %ref.tmp16.sroa.0.0.insert.insert = or i64 %ref.tmp16.sroa.4.0.insert.shift, %ref.tmp16.sroa.0.0.insert.ext
  store i64 %ref.tmp16.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp16.sroa.0.0.insert.insert
}

define i32 @"136"(ptr %e.sroa.5.0..sroa_idx, ptr %0, ptr %offsets, ptr %add.ptr, i64 %1) {
bb:
  %e.sroa.0.0.copyload = load i32, ptr %add.ptr, align 4, !tbaa.struct !55
  %conv = sext i32 %e.sroa.0.0.copyload to i64
  %2 = load ptr, ptr %offsets, align 8, !tbaa !6
  %arrayidx.i = getelementptr inbounds i64, ptr %2, i64 %conv
  %3 = atomicrmw add ptr %arrayidx.i, i64 %1 seq_cst, align 8
  %4 = load ptr, ptr %0, align 8, !tbaa !16
  %arrayidx = getelementptr inbounds i32, ptr %4, i64 %3
  %e.sroa.5.0.copyload = load i32, ptr %e.sroa.5.0..sroa_idx, align 4, !tbaa.struct !56
  store i32 %e.sroa.5.0.copyload, ptr %arrayidx, align 4, !tbaa !10
  ret i32 %e.sroa.5.0.copyload
}

define i64 @"137"(ptr %offsets, ptr %num_nodes_.i, i32 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !6
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !45
  %3 = trunc i64 %2 to i32
  %n184.0657 = add i32 %3, %0
  %4 = zext i32 %n184.0657 to i64
  %arrayidx.i540 = getelementptr inbounds i64, ptr %1, i64 %4
  %5 = load i64, ptr %arrayidx.i540, align 8, !tbaa !8
  ret i64 %5
}

define i64 @"138"(ptr %_M_string_length.i.i.i, i64 %call, ptr %__dnew.i.i.i) {
bb:
  %0 = load i64, ptr %_M_string_length.i.i.i, align 8, !tbaa !48, !noalias !81
  %sub.i.i.i = sub i64 %0, %call
  store i64 %sub.i.i.i, ptr %__dnew.i.i.i, align 8, !tbaa !8, !noalias !81
  ret i64 %sub.i.i.i
}

define i64 @"139"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !6
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !45
  %sext = shl i64 %2, %0
  %conv202 = ashr exact i64 %sext, %0
  %arrayidx.i542 = getelementptr inbounds i64, ptr %1, i64 %conv202
  %3 = load i64, ptr %arrayidx.i542, align 8, !tbaa !8
  ret i64 %3
}

define i64 @"140"(ptr %el, i64 %0, i64 %1) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr13.i.i.i.i, i64 %1
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.030.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i32 @"141"(ptr %call171, ptr %arrayidx.i548, ptr %arrayidx.i549, ptr %arrayidx.i550, i64 %sub.ptr.rhs.cast.i.i.i.i552, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i548, align 8, !tbaa !8
  %add.ptr263 = getelementptr inbounds i32, ptr %call171, i64 %2
  %3 = load i32, ptr %arrayidx.i549, align 4, !tbaa !10
  %idx.ext = sext i32 %3 to i64
  %add.ptr266 = getelementptr inbounds i32, ptr %add.ptr263, i64 %idx.ext
  %4 = load i64, ptr %arrayidx.i550, align 8, !tbaa !8
  %add.ptr271 = getelementptr inbounds i32, ptr %call171, i64 %4
  %sub.ptr.lhs.cast.i.i.i.i551 = ptrtoint ptr %add.ptr271 to i64
  %sub.ptr.sub.i.i.i.i553 = sub i64 %sub.ptr.lhs.cast.i.i.i.i551, %sub.ptr.rhs.cast.i.i.i.i552
  %sub.ptr.div.i.i.i.i561 = lshr exact i64 %sub.ptr.sub.i.i.i.i553, %0
  %shr.i.i565 = lshr i64 %sub.ptr.div.i.i.i.i561, %1
  %incdec.ptr4.sink.i.i.i.i569 = getelementptr inbounds i32, ptr %add.ptr266, i64 %shr.i.i565
  %5 = load i32, ptr %incdec.ptr4.sink.i.i.i.i569, align 4, !tbaa !10
  ret i32 %5
}

define i32 @"142"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr122.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %1 = load i32, ptr %incdec.ptr122.i.i, align 4, !tbaa !40
  ret i32 %1
}

define i32 @"145"(ptr %n_start.0.in, i64 %0, i64 %1) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds i32, ptr %incdec.ptr12.i.i.i.i, i64 %1
  %2 = load i32, ptr %__first.addr.030.i.i, align 4, !tbaa !10
  ret i32 %2
}

define i32 @"146"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !10
  %1 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !10
  %cmp.i.i.i.i.i = icmp slt i32 %0, %1
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add.ptr3.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i.i.i.i
  %2 = load i32, ptr %add.ptr3.i.i.i.i, align 4, !tbaa !10
  ret i32 %2
}

define i32 @"147"(ptr %arrayidx.i, ptr %0, i32 %1, i32 %2, i64 %sub.ptr.rhs.cast.i, i64 %3, ptr %parent, i64 %indvars.iv) {
bb:
  %4 = load ptr, ptr %parent, align 8, !tbaa !0
  %arrayidx.i40 = getelementptr inbounds i32, ptr %4, i64 %indvars.iv
  %5 = load ptr, ptr %arrayidx.i, align 8, !tbaa !16
  %cmp8.not = icmp eq ptr %5, %0
  %sub.ptr.lhs.cast.i = ptrtoint ptr %5 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %6 = lshr exact i64 %sub.ptr.sub.i, %3
  %7 = trunc i64 %6 to i32
  %8 = sub i32 %2, %7
  %conv16 = select i1 %cmp8.not, i32 %1, i32 %8
  store i32 %conv16, ptr %arrayidx.i40, align 4, !tbaa !10
  ret i32 %conv16
}

define <2 x i64> @"148"(ptr %0, <2 x i64> %1, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %7) {
bb:
  %wide.load393 = load <2 x i64>, ptr %4, align 8, !tbaa !8
  %wide.load392 = load <2 x i64>, ptr %0, align 8, !tbaa !8
  %8 = and <2 x i64> %wide.load392, %1
  %9 = shufflevector <2 x i64> %wide.load392, <2 x i64> %wide.load392, <2 x i32> <i32 1, i32 2>
  %10 = and <2 x i64> %9, %2
  %11 = or <2 x i64> %8, %10
  %12 = lshr exact <2 x i64> %11, %3
  %13 = xor <2 x i64> %12, %wide.load393
  %14 = and <2 x i64> %wide.load392, %3
  %15 = icmp eq <2 x i64> %14, %5
  %16 = select <2 x i1> %15, <2 x i64> %5, <2 x i64> %6
  %17 = xor <2 x i64> %13, %16
  store <2 x i64> %17, ptr %7, align 8, !tbaa !8
  ret <2 x i64> %17
}

define i64 @"149"(ptr %__first.addr.033.i.i, ptr %new_range.i.i, i64 %0) {
bb:
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.033.i.i, align 4
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  store i64 %agg.tmp.sroa.0.0.copyload.i.i.i, ptr %incdec.ptr13.i.i.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i8 @"150"(i8 %0, ptr %ref.tmp, ptr %__dnew.i.i.i) {
bb:
  %1 = load i64, ptr %__dnew.i.i.i, align 8, !tbaa !8, !noalias !70
  %2 = load ptr, ptr %ref.tmp, align 8, !tbaa !35, !alias.scope !70
  %arrayidx.i.i.i.i = getelementptr inbounds i8, ptr %2, i64 %1
  store i8 %0, ptr %arrayidx.i.i.i.i, align 1, !tbaa !22
  ret i8 %0
}

define i32 @"151"(ptr %__first, ptr %add.ptr.i, ptr %add.ptr2.i, i64 %sub1.i, i64 %mul.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr2.i, align 4, !tbaa !10
  %3 = load i32, ptr %add.ptr.i, align 4, !tbaa !10
  %cmp.i.i = icmp slt i32 %3, %2
  %spec.select.i = select i1 %cmp.i.i, i64 %sub1.i, i64 %mul.i
  %__parent.020.in.i.i = add nsw i64 %spec.select.i, %0
  %__parent.020.i.i = sdiv i64 %__parent.020.in.i.i, %1
  %add.ptr.i.i = getelementptr inbounds i32, ptr %__first, i64 %__parent.020.i.i
  %4 = load i32, ptr %add.ptr.i.i, align 4, !tbaa !10
  ret i32 %4
}

define i64 @"152"(ptr %arrayidx.i535, i64 %total_missing_inv.0649, ptr %offsets, i64 %indvars.iv691) {
bb:
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !6
  %arrayidx.i5352 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %indvars.iv691
  %0 = load i64, ptr %arrayidx.i535, align 8, !tbaa !8
  %add152 = add nsw i64 %0, %total_missing_inv.0649
  store i64 %add152, ptr %arrayidx.i535, align 8, !tbaa !8
  ret i64 %add152
}

define i64 @"153"(ptr %scout_count13, i32 %0, ptr %arrayidx.i60) {
bb:
  %1 = load i64, ptr %scout_count13, align 8, !tbaa !8
  %2 = load i32, ptr %arrayidx.i60, align 4, !tbaa !10
  %sub29 = sub nsw i32 %0, %2
  %conv30 = zext i32 %sub29 to i64
  %add31 = add nsw i64 %1, %conv30
  store i64 %add31, ptr %scout_count13, align 8, !tbaa !8
  ret i64 %add31
}

define i64 @"154"(ptr %arrayidx.i25, i64 %0, ptr %arrayidx.i23, ptr %el, ptr %.omp.lb) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %2 = load ptr, ptr %el, align 8, !tbaa !37
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %1
  %3 = load i32, ptr %arrayidx.i25, align 4, !tbaa !10
  %ref.tmp.sroa.4.0.insert.ext = zext i32 %3 to i64
  %ref.tmp.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp.sroa.4.0.insert.ext, %0
  %4 = load i32, ptr %arrayidx.i23, align 4, !tbaa !10
  %ref.tmp.sroa.0.0.insert.ext = zext i32 %4 to i64
  %ref.tmp.sroa.0.0.insert.insert = or i64 %ref.tmp.sroa.4.0.insert.shift, %ref.tmp.sroa.0.0.insert.ext
  store i64 %ref.tmp.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp.sroa.0.0.insert.insert
}

define i64 @"155"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !45
  %2 = and i64 %1, %0
  %sub.prol = add nuw i64 %2, %0
  %conv34.prol = and i64 %sub.prol, %0
  %3 = load ptr, ptr %offsets, align 8
  %arrayidx.i492.prol = getelementptr inbounds i64, ptr %3, i64 %conv34.prol
  %4 = load i64, ptr %arrayidx.i492.prol, align 8, !tbaa !8
  ret i64 %4
}

define ptr @"156"(ptr %el, ptr %0, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !37
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !39
  ret ptr %add.ptr.i464
}

define i64 @"157"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !51
  %inc.i71 = add nuw nsw i64 %1, %0
  %inc.i207 = add nuw nsw i64 %inc.i71, %0
  store i64 %inc.i207, ptr %_M_p.i.i.i, align 8, !tbaa !51
  ret i64 %inc.i207
}

define i32 @"158"(ptr %end_size_.i.i583, ptr %offsets, i64 %0, ptr %length.i581) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !6
  %sub.ptr.rhs.cast.i.i585 = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %end_size_.i.i583, align 8, !tbaa !57
  %sub.ptr.lhs.cast.i.i584 = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i586 = sub i64 %sub.ptr.lhs.cast.i.i584, %sub.ptr.rhs.cast.i.i585
  %3 = lshr exact i64 %sub.ptr.sub.i.i586, %0
  %conv.i587 = trunc i64 %3 to i32
  store i32 %conv.i587, ptr %length.i581, align 4, !tbaa !10
  ret i32 %conv.i587
}

define <2 x i32> @"159"(ptr %degrees, ptr %.omp.lb, i64 %0, i64 %index, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %mul12 = shl i64 %2, %0
  %offset.idx = add i64 %mul12, %index
  %3 = load ptr, ptr %degrees, align 8, !tbaa !0
  %4 = getelementptr inbounds i32, ptr %3, i64 %offset.idx
  %5 = getelementptr inbounds i32, ptr %4, i64 %1
  %wide.load41 = load <2 x i32>, ptr %5, align 4, !tbaa !10
  ret <2 x i32> %wide.load41
}

define i32 @"160"(i32 %conv22, ptr %diffs, i64 %indvars.iv) {
bb:
  %0 = load ptr, ptr %diffs, align 8, !tbaa !0
  %arrayidx.i99 = getelementptr inbounds i32, ptr %0, i64 %indvars.iv
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !10
  ret i32 %conv22
}

define i64 @"161"(ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %__i.018.i, i64 %add.i, i64 %inc.i, ptr %arrayidx7.i.1) {
bb:
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !8
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
  store i64 %rem.i.i17.i.1, ptr %arrayidx7.i.1, align 8, !tbaa !8
  ret i64 %rem.i.i17.i.1
}

define ptr @"162"(ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %0) {
bb:
  %1 = load ptr, ptr %agg.result, align 8, !tbaa !37
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !39
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = ashr exact i64 %sub.ptr.sub.i12.i.i, %0
  %3 = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %add.ptr.i.i149 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div.i13.i.i
  store ptr %add.ptr.i.i149, ptr %end_size_.i.i, align 8, !tbaa !39
  ret ptr %add.ptr.i.i149
}

define i64 @"163"(ptr %arrayidx.i59, i64 %shl.i, ptr %next, i64 %div1.i.i58) {
bb:
  %0 = load i64, ptr %arrayidx.i59, align 8, !tbaa !8, !llvm.access.group !36
  %or.i = or i64 %0, %shl.i
  %1 = load ptr, ptr %next, align 8
  %arrayidx.i592 = getelementptr inbounds i64, ptr %1, i64 %div1.i.i58
  store i64 %or.i, ptr %arrayidx.i59, align 8, !tbaa !8, !llvm.access.group !36
  ret i64 %or.i
}

define ptr @"164"(ptr %new_range.i.i, ptr %end_capacity_.i.i, ptr %agg.result, i64 %0) {
bb:
  %1 = load ptr, ptr %agg.result, align 8, !tbaa !37
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %end_capacity_.i.i, align 8, !tbaa !47
  %sub.ptr.lhs.cast.i7.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i9.i = sub i64 %sub.ptr.lhs.cast.i7.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.sub.i9.fr.i = freeze i64 %sub.ptr.sub.i9.i
  %mul.i = ashr exact i64 %sub.ptr.sub.i9.fr.i, %0
  %3 = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %mul.i
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i, align 8, !tbaa !47
  ret ptr %add.ptr6.i.i
}

define i64 @"165"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i = load i64, ptr %incdec.ptr.i.i.i.i, align 4, !tbaa.struct !55
  ret i64 %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i
}

define i64 @"166"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %2) {
bb:
  %3 = load i32, ptr %v, align 4, !tbaa !53
  %sub = add nsw i32 %3, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %2, align 4, !tbaa.struct !55
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define <8 x i32> @"167"(ptr %el, ptr %.omp.lb, i64 %index) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %offset.idx = add i64 %0, %index
  %1 = load ptr, ptr %el, align 8, !tbaa !37
  %2 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %offset.idx
  %wide.vec = load <8 x i32>, ptr %2, align 4
  ret <8 x i32> %wide.vec
}

define i32 @"168"(ptr %el, i64 %.omp.iv.040.ph, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !37
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %.omp.iv.040.ph
  %add.ptr.sroa_idx.prol = getelementptr inbounds i8, ptr %add.ptr.prol, i64 %0
  %2 = load i32, ptr %add.ptr.sroa_idx.prol, align 4
  ret i32 %2
}

define i32 @"169"(ptr %init_val, ptr %this, i64 %.omp.iv.018.prol) {
bb:
  %0 = load i32, ptr %init_val, align 4, !tbaa !10
  %1 = load ptr, ptr %this, align 8, !tbaa !0
  %add.ptr.prol = getelementptr inbounds i32, ptr %1, i64 %.omp.iv.018.prol
  store i32 %0, ptr %add.ptr.prol, align 4, !tbaa !10
  ret i32 %0
}

define i32 @"170"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %3 = sub i64 %0, %2
  %n.vec = and i64 %3, %1
  %ind.end = add i64 %2, %n.vec
  %4 = load ptr, ptr %el, align 8, !tbaa !37
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %4, i64 %ind.end
  %5 = load i32, ptr %add.ptr, align 4
  ret i32 %5
}

define i64 @"171"(i64 %local_total.039, ptr %arrayidx.i35, ptr %prefix, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %mul14 = shl i64 %1, %0
  %2 = load ptr, ptr %prefix, align 8
  %arrayidx.i34 = getelementptr inbounds i64, ptr %2, i64 %mul14
  %3 = load i32, ptr %arrayidx.i35, align 4, !tbaa !10
  %conv = sext i32 %3 to i64
  %add19 = add nsw i64 %local_total.039, %conv
  store i64 %add19, ptr %arrayidx.i34, align 8, !tbaa !8
  ret i64 %add19
}

define ptr @"172"(ptr %out_index_.i, ptr %add.ptr) {
bb:
  %0 = load ptr, ptr %out_index_.i, align 8, !tbaa !84, !noalias !85
  %1 = load i32, ptr %add.ptr, align 4, !tbaa !10
  %idxprom.i6.i.i = sext i32 %1 to i64
  %arrayidx.i7.i.i = getelementptr inbounds ptr, ptr %0, i64 %idxprom.i6.i.i
  %2 = load ptr, ptr %arrayidx.i7.i.i, align 8, !tbaa !16
  ret ptr %2
}

define ptr @"173"(ptr %neighs, ptr %arrayidx.i, ptr %index, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %neighs, align 8, !tbaa !16
  %1 = load i64, ptr %arrayidx.i, align 8, !tbaa !8
  %add.ptr = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %3 = sext i32 %2 to i64
  %4 = load ptr, ptr %index, align 8, !tbaa !16
  %arrayidx = getelementptr inbounds ptr, ptr %4, i64 %3
  store ptr %add.ptr, ptr %arrayidx, align 8, !tbaa !16
  ret ptr %add.ptr
}

define i8 @"174"(ptr %arrayidx17.i.i, ptr %ref.tmp, i64 %conv5.i) {
bb:
  %0 = load ptr, ptr %ref.tmp, align 8, !tbaa !35, !alias.scope !88
  %arrayidx.i.i = getelementptr inbounds i8, ptr %0, i64 %conv5.i
  %1 = load i8, ptr %arrayidx17.i.i, align 2, !tbaa !22, !noalias !88
  store i8 %1, ptr %arrayidx.i.i, align 1, !tbaa !22
  ret i8 %1
}

define i32 @"175"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.0649, ptr %arrayidx.i536) {
bb:
  %1 = load i64, ptr %arrayidx.i542, align 8, !tbaa !8
  %i200.0 = add nsw i64 %1, %0
  %2 = load i32, ptr %arrayidx.i536, align 4, !tbaa !10
  %conv155 = sext i32 %2 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %sub211 = sub nsw i64 %i200.0, %add156
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %3 = load i32, ptr %arrayidx212, align 4, !tbaa !10
  ret i32 %3
}

define i64 @"176"(ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57.3) {
bb:
  %0 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !8
  %1 = load i64, ptr %arrayidx.i58, align 8, !tbaa !8
  %add7 = add nsw i64 %1, %total.076
  %2 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !8
  %add7.1 = add nsw i64 %2, %add7
  %add7.2 = add nsw i64 %0, %add7.1
  store i64 %add7.2, ptr %arrayidx.i57.3, align 8, !tbaa !8
  ret i64 %add7.2
}

define i64 @"177"(ptr %arrayidx.i535, i64 %total_missing_inv.0649, ptr %arrayidx.i536, ptr %offsets, i64 %indvars.iv691) {
bb:
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !6
  %arrayidx.i5352 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %indvars.iv691
  %0 = load i32, ptr %arrayidx.i536, align 4, !tbaa !10
  %conv155 = sext i32 %0 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %1 = load i64, ptr %arrayidx.i535, align 8, !tbaa !8
  %add152 = add nsw i64 %1, %add156
  store i64 %add152, ptr %arrayidx.i535, align 8, !tbaa !8
  ret i64 %add152
}

define ptr @"178"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !47
  ret ptr %add.ptr6.i.i
}

define i64 @"179"(ptr %_M_p.i, i64 %0, ptr %udist_, i64 %1, i32 %2) {
bb:
  %.pre = load i64, ptr %_M_p.i, align 8, !tbaa !91
  %inc.i = add nuw nsw i64 %.pre, %0
  %3 = load ptr, ptr %udist_, align 8, !tbaa !49
  %_M_p.i2 = getelementptr inbounds %"class.std::mersenne_twister_engine", ptr %3, i64 %1, i32 1
  store i64 %inc.i, ptr %_M_p.i, align 8, !tbaa !91
  ret i64 %inc.i
}

define ptr @"180"(ptr %neighs, ptr %arrayidx.i.1, ptr %index, i64 %indvars.iv.next) {
bb:
  %0 = load ptr, ptr %index, align 8, !tbaa !16
  %arrayidx.1 = getelementptr inbounds ptr, ptr %0, i64 %indvars.iv.next
  %1 = load ptr, ptr %neighs, align 8, !tbaa !16
  %2 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !8
  %add.ptr.1 = getelementptr inbounds i32, ptr %1, i64 %2
  store ptr %add.ptr.1, ptr %arrayidx.1, align 8, !tbaa !16
  ret ptr %add.ptr.1
}

define i32 @"181"(ptr %arrayidx212, ptr %call171, i64 %tail_index.0660, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %0) {
bb:
  %1 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %conv198 = sext i32 %1 to i64
  %2 = load i64, ptr %arrayidx.i540, align 8, !tbaa !8
  %add199 = add nsw i64 %2, %conv198
  %3 = load i64, ptr %arrayidx.i542, align 8, !tbaa !8
  %4 = sub i64 %3, %add199
  %n.vec793 = and i64 %4, %0
  %ind.end796 = sub i64 %tail_index.0660, %n.vec793
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %.pre731 = sext i32 %.pre717 to i64
  %sub226 = sub nsw i64 %ind.end796, %.pre731
  %arrayidx213 = getelementptr inbounds i32, ptr %call171, i64 %sub226
  %5 = load i32, ptr %arrayidx212, align 4, !tbaa !10
  store i32 %5, ptr %arrayidx213, align 4, !tbaa !10
  ret i32 %5
}

define i32 @"182"(ptr %el, i64 %0, i32 %1) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %v.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0, i32 1
  %2 = load i32, ptr %v.i.i.i.i, align 4
  ret i32 %2
}

define i8 @"183"(ptr %_M_ctype.i.i428, i64 %0, i32 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %_M_ctype.i.i428, align 8, !tbaa !92
  %arrayidx.i.i.i364 = getelementptr inbounds %"class.std::ctype", ptr %3, i64 %0, i32 9, i64 10
  %4 = load i8, ptr %arrayidx.i.i.i364, align 1, !tbaa !22
  ret i8 %4
}

define <2 x i64> @"184"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %.omp.lb, i64 %3, i64 %4, i64 %5, <2 x i64> %6, <2 x i64> %7, ptr %8, <2 x i64> %9, <2 x i64> %10, ptr %11) {
bb:
  %wide.load91 = load <2 x i64>, ptr %0, align 8, !tbaa !8
  %12 = and <2 x i64> %wide.load91, %7
  %13 = icmp eq <2 x i64> %12, %9
  %14 = select <2 x i1> %13, <2 x i64> %9, <2 x i64> %10
  %15 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %add8 = add i64 %15, %3
  %rem.i.i.i = and i64 %add8, %4
  %vector.recur.init89 = insertelement <2 x i64> %2, i64 %rem.i.i.i, i64 %5
  %16 = shufflevector <2 x i64> %vector.recur.init89, <2 x i64> %wide.load91, <2 x i32> <i32 1, i32 2>
  %17 = and <2 x i64> %16, %6
  %18 = and <2 x i64> %wide.load91, %1
  %19 = or <2 x i64> %18, %17
  %20 = lshr exact <2 x i64> %19, %7
  %wide.load92 = load <2 x i64>, ptr %8, align 8, !tbaa !8
  %21 = xor <2 x i64> %20, %wide.load92
  %22 = xor <2 x i64> %21, %14
  store <2 x i64> %22, ptr %11, align 8, !tbaa !8
  ret <2 x i64> %22
}

define <2 x i64> @"185"(ptr %0, ptr %offsets, ptr %num_nodes_.i, i64 %1, i64 %index770, i64 %2) {
bb:
  %wide.load = load <2 x i64>, ptr %0, align 8, !tbaa !8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !45
  %4 = and i64 %3, %1
  %offset.idx = sub i64 %4, %index770
  %5 = load ptr, ptr %offsets, align 8
  %6 = getelementptr inbounds i64, ptr %5, i64 %offset.idx
  %7 = getelementptr inbounds i64, ptr %6, i64 %2
  store <2 x i64> %wide.load, ptr %7, align 8, !tbaa !8
  ret <2 x i64> %wide.load
}

define ptr @"186"(ptr %new_range.i.i, ptr %end_size_.i, ptr %el, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !39
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !47
  ret ptr %add.ptr6.i.i
}

define ptr @"187"(ptr %call.i5155, ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, ptr %end_size_.i53) {
bb:
  %2 = load ptr, ptr %degrees, align 8, !tbaa !0
  %sub.ptr.rhs.cast.i48 = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !5
  %sub.ptr.lhs.cast.i47 = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i49 = sub i64 %sub.ptr.lhs.cast.i47, %sub.ptr.rhs.cast.i48
  %sub.ptr.div.i50 = ashr exact i64 %sub.ptr.sub.i49, %0
  %add13 = add nsw i64 %sub.ptr.div.i50, %1
  %add.ptr.i52 = getelementptr inbounds i64, ptr %call.i5155, i64 %add13
  store ptr %add.ptr.i52, ptr %end_size_.i53, align 8, !tbaa !57
  ret ptr %add.ptr.i52
}

define ptr @"188"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !47
  ret ptr %add.ptr6.i.i
}

define i64 @"189"(ptr %end_size_, ptr %this, i64 %0, i64 %1, ptr %.omp.ub) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !0
  %sub.ptr.rhs.cast = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %end_size_, align 8, !tbaa !5
  %sub.ptr.lhs.cast = ptrtoint ptr %3 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %sub = add nsw i64 %sub.ptr.div, %1
  store i64 %sub, ptr %.omp.ub, align 8, !tbaa !8
  ret i64 %sub
}

define ptr @"190"(ptr %in_index_.i, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %in_index_.i, align 8
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %3 = sext i32 %2 to i64
  %4 = add nsw i64 %3, %0
  %arrayidx.i.i.i = getelementptr inbounds ptr, ptr %1, i64 %4
  %5 = load ptr, ptr %arrayidx.i.i.i, align 8, !tbaa !16, !llvm.access.group !36
  ret ptr %5
}

define ptr @"191"(ptr %out_index_.i, ptr %add.ptr, i32 %0) {
bb:
  %1 = load i32, ptr %add.ptr, align 4, !tbaa !10
  %add.i.i.i = add nsw i32 %1, %0
  %idxprom.i.i.i = sext i32 %add.i.i.i to i64
  %2 = load ptr, ptr %out_index_.i, align 8, !tbaa !84, !noalias !85
  %arrayidx.i.i.i = getelementptr inbounds ptr, ptr %2, i64 %idxprom.i.i.i
  %3 = load ptr, ptr %arrayidx.i.i.i, align 8, !tbaa !16
  ret ptr %3
}

define i32 @"192"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i32, ptr %init_val, align 4, !tbaa !10
  %2 = load ptr, ptr %this, align 8, !tbaa !0
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %add7 = add i64 %3, %0
  %add.ptr.1 = getelementptr inbounds i32, ptr %2, i64 %add7
  store i32 %1, ptr %add.ptr.1, align 4, !tbaa !10
  ret i32 %1
}

define i64 @"193"(ptr %arrayidx3.i.i91, i64 %0, ptr %1, i64 %2, i64 %3, ptr %arrayidx7.i.i95, i64 %4, i64 %5, ptr %arrayidx.i.i88) {
bb:
  %6 = load i64, ptr %arrayidx3.i.i91, align 8, !tbaa !8
  %and8.i.i98 = and i64 %6, %2
  %tobool.not.i.i99 = icmp eq i64 %and8.i.i98, %4
  %cond.i.i100 = select i1 %tobool.not.i.i99, i64 %4, i64 %5
  %wide.load392 = load <2 x i64>, ptr %1, align 8, !tbaa !8
  %vector.recur.extract395 = extractelement <2 x i64> %wide.load392, i64 %2
  %and.i.i89 = and i64 %vector.recur.extract395, %3
  %and4.i.i92 = and i64 %6, %0
  %or.i.i93 = or i64 %and4.i.i92, %and.i.i89
  %shr.i.i96 = lshr exact i64 %or.i.i93, %2
  %7 = load i64, ptr %arrayidx7.i.i95, align 8, !tbaa !8
  %xor.i.i97 = xor i64 %shr.i.i96, %7
  %xor9.i.i101 = xor i64 %xor.i.i97, %cond.i.i100
  store i64 %xor9.i.i101, ptr %arrayidx.i.i88, align 8, !tbaa !8
  ret i64 %xor9.i.i101
}

define i64 @"194"(i32 %shl19, ptr %arrayidx.i61, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i63, i64 %4, i64 %5, i64 %xor4.i, i64 %6, i64 %xor7.i, i32 %7, i32 %8, i32 %9, i32 %conv, i64 %10, i64 %ref.tmp30.sroa.0.0.insert.ext, ptr %el, ptr %.omp.lb) {
bb:
  %11 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %mul = shl i64 %11, %6
  %12 = load ptr, ptr %el, align 8, !tbaa !37
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %12, i64 %mul
  %13 = load i64, ptr %arrayidx.i61, align 8, !tbaa !8
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

define <2 x i64> @"195"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %rng, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
bb:
  %wide.load393 = load <2 x i64>, ptr %6, align 8, !tbaa !8
  %wide.load392 = load <2 x i64>, ptr %0, align 8, !tbaa !8
  %10 = and <2 x i64> %wide.load392, %1
  %.pre.i.i85 = load i64, ptr %rng, align 8, !tbaa !8
  %vector.recur.init390 = insertelement <2 x i64> %2, i64 %.pre.i.i85, i64 %3
  %11 = shufflevector <2 x i64> %vector.recur.init390, <2 x i64> %wide.load392, <2 x i32> <i32 1, i32 2>
  %12 = and <2 x i64> %11, %4
  %13 = or <2 x i64> %10, %12
  %14 = lshr exact <2 x i64> %13, %5
  %15 = xor <2 x i64> %14, %wide.load393
  %16 = and <2 x i64> %wide.load392, %5
  %17 = icmp eq <2 x i64> %16, %7
  %18 = select <2 x i1> %17, <2 x i64> %7, <2 x i64> %8
  %19 = xor <2 x i64> %15, %18
  store <2 x i64> %19, ptr %9, align 8, !tbaa !8
  ret <2 x i64> %19
}

define <2 x i32> @"196"(ptr %degrees, i64 %offset.idx) {
bb:
  %0 = load ptr, ptr %degrees, align 8, !tbaa !0
  %1 = getelementptr inbounds i32, ptr %0, i64 %offset.idx
  %wide.load = load <2 x i32>, ptr %1, align 4, !tbaa !10
  ret <2 x i32> %wide.load
}

define i64 @"197"(ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57.1) {
bb:
  %0 = load i64, ptr %arrayidx.i58, align 8, !tbaa !8
  %add7 = add nsw i64 %0, %total.076
  store i64 %add7, ptr %arrayidx.i57.1, align 8, !tbaa !8
  ret i64 %add7
}

define i32 @"198"(i64 %indvars.iv687, ptr %incdec.ptr4.sink.i.i.i.i, ptr %__first.addr.015.i.i, ptr %neighs, ptr %arrayidx.i524, i64 %sub.ptr.rhs.cast.i.i.i.i526, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %neighs, align 8, !tbaa !16
  %3 = load i64, ptr %arrayidx.i524, align 8, !tbaa !8
  %add.ptr121 = getelementptr inbounds i32, ptr %2, i64 %3
  %sub.ptr.lhs.cast.i.i.i.i525 = ptrtoint ptr %add.ptr121 to i64
  %sub.ptr.sub.i.i.i.i527 = sub i64 %sub.ptr.lhs.cast.i.i.i.i525, %sub.ptr.rhs.cast.i.i.i.i526
  %sub.ptr.div.i.i.i.i = lshr exact i64 %sub.ptr.sub.i.i.i.i527, %0
  %shr.i.i = lshr i64 %sub.ptr.div.i.i.i.i, %1
  %incdec.ptr4.sink.i.i.i.i2 = getelementptr inbounds i32, ptr %__first.addr.015.i.i, i64 %shr.i.i
  %incdec.ptr.i.i = getelementptr inbounds i32, ptr %incdec.ptr4.sink.i.i.i.i, i64 %1
  %4 = load i32, ptr %incdec.ptr4.sink.i.i.i.i, align 4, !tbaa !10
  %5 = sext i32 %4 to i64
  %cmp.i.i.i530 = icmp sgt i64 %indvars.iv687, %5
  %__first.addr.1.i.i = select i1 %cmp.i.i.i530, ptr %incdec.ptr.i.i, ptr %__first.addr.015.i.i
  %6 = load i32, ptr %__first.addr.1.i.i, align 4, !tbaa !10
  ret i32 %6
}

define i32 @"199"(i32 %0, ptr %call171, ptr %arrayidx.i548, i64 %1, ptr %arrayidx.i549) {
bb:
  %2 = load i64, ptr %arrayidx.i548, align 8, !tbaa !8
  %add286 = add i64 %2, %1
  %3 = load i32, ptr %arrayidx.i549, align 4, !tbaa !10
  %idx.ext = sext i32 %3 to i64
  %sub287 = add i64 %add286, %idx.ext
  %arrayidx288 = getelementptr inbounds i32, ptr %call171, i64 %sub287
  store i32 %0, ptr %arrayidx288, align 4, !tbaa !10
  ret i32 %0
}

define i32 @"200"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %add15 = add i64 %2, %0
  %3 = load ptr, ptr %el, align 8, !tbaa !37
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %add15
  %add.ptr.sroa_idx.1 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %1
  %4 = load i32, ptr %add.ptr.sroa_idx.1, align 4
  ret i32 %4
}

define ptr @"201"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, ptr %.omp.lb) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %3 = load i8, ptr %transpose, align 1, !tbaa !12, !range !14, !noundef !15
  %tobool.not = icmp eq i8 %3, %0
  %4 = load ptr, ptr %in_index_.i, align 8
  %5 = load ptr, ptr %out_index_.i, align 8
  %.pn = select i1 %tobool.not, ptr %5, ptr %4
  %n_start.0.in = getelementptr inbounds ptr, ptr %.pn, i64 %2
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  ret ptr %n_start.0
}

define i32 @"202"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !0
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add.ptr.prol = getelementptr inbounds i32, ptr %2, i64 %ind.end
  %5 = load i32, ptr %init_val, align 4, !tbaa !10
  store i32 %5, ptr %add.ptr.prol, align 4, !tbaa !10
  ret i32 %5
}

define i64 @"203"(ptr %num_nodes_.i, ptr %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !58, !noalias !60
  store i64 %1, ptr %0, align 8, !alias.scope !60
  ret i64 %1
}

define i64 @"204"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !51
  %inc.i71 = add nuw nsw i64 %2, %1
  %arrayidx.i65 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i71
  %3 = load i64, ptr %arrayidx.i65, align 8, !tbaa !8
  ret i64 %3
}

define i32 @"205"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %add15 = add i64 %1, %0
  %2 = load ptr, ptr %el, align 8, !tbaa !37
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %add15
  %3 = load i32, ptr %add.ptr.1, align 4
  ret i32 %3
}

define ptr @"206"(ptr %out_index_.i, ptr %arrayidx.i7, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i, i64 %4, i64 %5, i64 %xor4.i, i64 %6, ptr %mod_.i, i32 %7) {
bb:
  %8 = load i64, ptr %arrayidx.i7, align 8, !tbaa !8
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
  %9 = load i32, ptr %mod_.i, align 4, !tbaa !99
  %rem.i = urem i32 %conv7.i, %9
  %add.i = add nsw i32 %rem.i, %7
  %idxprom.i = sext i32 %add.i to i64
  %10 = load ptr, ptr %out_index_.i, align 8, !tbaa !84
  %arrayidx.i = getelementptr inbounds ptr, ptr %10, i64 %idxprom.i
  %11 = load ptr, ptr %arrayidx.i, align 8, !tbaa !16
  ret ptr %11
}

define i8 @"207"(i8 %storemerge.i.i, ptr %agg.tmp32, ptr %num_trials_, i32 %0) {
bb:
  %1 = load ptr, ptr %agg.tmp32, align 8, !tbaa !35, !alias.scope !23
  %2 = load i32, ptr %num_trials_, align 4, !tbaa !26
  %__val.lobit.i = lshr i32 %2, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %arrayidx.i.i = getelementptr inbounds i8, ptr %1, i64 %conv5.i
  store i8 %storemerge.i.i, ptr %arrayidx.i.i, align 1, !tbaa !22
  ret i8 %storemerge.i.i
}

define i64 @"208"(ptr %arrayidx.i.i, ptr %0, i64 %1, ptr %2) {
bb:
  %3 = load ptr, ptr %0, align 8, !tbaa !16, !noalias !60
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %arrayidx.i.i, align 8, !tbaa !16, !noalias !60
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i = ashr exact i64 %sub.ptr.sub.i.i, %1
  store i64 %sub.ptr.div.i.i, ptr %2, align 8, !alias.scope !60
  ret i64 %sub.ptr.div.i.i
}

define i64 @"209"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !51
  %inc.i71 = add nuw nsw i64 %2, %1
  %arrayidx.i208 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i71
  %3 = load i64, ptr %arrayidx.i208, align 8, !tbaa !8
  ret i64 %3
}

define i64 @"210"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !45
  %2 = and i64 %1, %0
  %sub = add nuw i64 %2, %0
  %conv34 = and i64 %sub, %0
  %3 = load ptr, ptr %offsets, align 8
  %arrayidx.i492 = getelementptr inbounds i64, ptr %3, i64 %conv34
  %4 = load i64, ptr %arrayidx.i492, align 8, !tbaa !8
  ret i64 %4
}

define i64 @"212"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %call.i4145, ptr %num_blocks) {
bb:
  %0 = load i64, ptr %num_blocks, align 8, !tbaa !8
  %arrayidx.i = getelementptr inbounds i64, ptr %call.i4145, i64 %0
  %1 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !8
  %2 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !8
  %3 = load i64, ptr %arrayidx.i58, align 8, !tbaa !8
  %add7 = add nsw i64 %3, %total.076
  %4 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !8
  %add7.1 = add nsw i64 %4, %add7
  %add7.2 = add nsw i64 %2, %add7.1
  %add7.3 = add nsw i64 %1, %add7.2
  store i64 %add7.3, ptr %arrayidx.i, align 8, !tbaa !8
  ret i64 %add7.3
}

define i32 @"213"(ptr %degrees, i64 %mul12, i64 %umin, ptr %.omp.lb, i64 %indvar, i64 %0, i64 %n.mod.vf) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !8
  %2 = add i64 %1, %indvar
  %3 = shl i64 %2, %0
  %4 = sub i64 %umin, %3
  %n.vec = sub i64 %4, %n.mod.vf
  %ind.end = add i64 %mul12, %n.vec
  %5 = load ptr, ptr %degrees, align 8, !tbaa !0
  %arrayidx.i31 = getelementptr inbounds i32, ptr %5, i64 %ind.end
  %6 = load i32, ptr %arrayidx.i31, align 4, !tbaa !10
  ret i32 %6
}

define i32 @"214"(ptr %__begin3.064, ptr %parent, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %parent, align 8, !tbaa !0, !llvm.access.group !36
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %arrayidx.i = getelementptr inbounds i32, ptr %0, i64 %2
  %3 = load i32, ptr %__begin3.064, align 4, !tbaa !10, !llvm.access.group !36
  store i32 %3, ptr %arrayidx.i, align 4, !tbaa !10, !llvm.access.group !36
  ret i32 %3
}

define i32 @"215"(ptr %add.ptr.i.i, ptr %__first, ptr %add.ptr.i, ptr %add.ptr2.i, i64 %sub1.i, i64 %mul.i) {
bb:
  %0 = load i32, ptr %add.ptr2.i, align 4, !tbaa !10
  %1 = load i32, ptr %add.ptr.i, align 4, !tbaa !10
  %cmp.i.i = icmp slt i32 %1, %0
  %spec.select.i = select i1 %cmp.i.i, i64 %sub1.i, i64 %mul.i
  %add.ptr2.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i
  %2 = load i32, ptr %add.ptr.i.i, align 4, !tbaa !10
  store i32 %2, ptr %add.ptr2.i.i, align 4, !tbaa !10
  ret i32 %2
}

define i64 @"216"(ptr %el) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %agg.tmp.sroa.0.0.copyload.i.i.i.i.i = load i64, ptr %.pre, align 4, !tbaa.struct !55
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i.i.i
}

define i32 @"217"(ptr %add.ptr.i.i.i.i.i, ptr %add.ptr2.i.i.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr.i.i.i.i.i, align 4, !tbaa !10
  store i32 %0, ptr %add.ptr2.i.i.i.i.i, align 4, !tbaa !10
  ret i32 %0
}

define i32 @"218"(ptr %arrayidx.i, ptr %arrayidx4.i.phi.trans.insert, i32 %0, i32 %1, i64 %sub.ptr.rhs.cast.i, i64 %2, ptr %parent, ptr %.omp.lb) {
bb:
  %.pre = load ptr, ptr %arrayidx4.i.phi.trans.insert, align 8, !tbaa !16
  %3 = load ptr, ptr %arrayidx.i, align 8, !tbaa !16
  %cmp8.not = icmp eq ptr %3, %.pre
  %sub.ptr.lhs.cast.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %4 = lshr exact i64 %sub.ptr.sub.i, %2
  %5 = trunc i64 %4 to i32
  %6 = sub i32 %1, %5
  %conv16 = select i1 %cmp8.not, i32 %0, i32 %6
  %7 = load ptr, ptr %parent, align 8, !tbaa !0
  %8 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %9 = sext i32 %8 to i64
  %arrayidx.i40 = getelementptr inbounds i32, ptr %7, i64 %9
  store i32 %conv16, ptr %arrayidx.i40, align 4, !tbaa !10
  ret i32 %conv16
}

define i32 @"219"(ptr %neighs, ptr %arrayidx.i523, ptr %arrayidx.i524, i64 %sub.ptr.rhs.cast.i.i.i.i526, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %neighs, align 8, !tbaa !16
  %3 = load i64, ptr %arrayidx.i524, align 8, !tbaa !8
  %add.ptr121 = getelementptr inbounds i32, ptr %2, i64 %3
  %sub.ptr.lhs.cast.i.i.i.i525 = ptrtoint ptr %add.ptr121 to i64
  %sub.ptr.sub.i.i.i.i527 = sub i64 %sub.ptr.lhs.cast.i.i.i.i525, %sub.ptr.rhs.cast.i.i.i.i526
  %sub.ptr.div.i.i.i.i = lshr exact i64 %sub.ptr.sub.i.i.i.i527, %0
  %shr.i.i = lshr i64 %sub.ptr.div.i.i.i.i, %1
  %4 = load i64, ptr %arrayidx.i523, align 8, !tbaa !8
  %add.ptr = getelementptr inbounds i32, ptr %2, i64 %4
  %incdec.ptr4.sink.i.i.i.i = getelementptr inbounds i32, ptr %add.ptr, i64 %shr.i.i
  %5 = load i32, ptr %incdec.ptr4.sink.i.i.i.i, align 4, !tbaa !10
  ret i32 %5
}

define <2 x i64> @"220"(ptr %0, <2 x i64> %1, <2 x i64> %vector.recur17, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %udist_, i64 %7, i64 %index15) {
bb:
  %8 = load ptr, ptr %udist_, align 8, !tbaa !49
  %9 = getelementptr inbounds [312 x i64], ptr %8, i64 %7, i64 %index15
  %wide.load18 = load <2 x i64>, ptr %0, align 8, !tbaa !8
  %10 = and <2 x i64> %wide.load18, %3
  %11 = icmp eq <2 x i64> %10, %5
  %12 = select <2 x i1> %11, <2 x i64> %5, <2 x i64> %6
  %wide.load19 = load <2 x i64>, ptr %4, align 8, !tbaa !8
  %13 = shufflevector <2 x i64> %vector.recur17, <2 x i64> %wide.load18, <2 x i32> <i32 1, i32 2>
  %14 = and <2 x i64> %13, %2
  %15 = and <2 x i64> %wide.load18, %1
  %16 = or <2 x i64> %15, %14
  %17 = lshr exact <2 x i64> %16, %3
  %18 = xor <2 x i64> %17, %wide.load19
  %19 = xor <2 x i64> %18, %12
  store <2 x i64> %19, ptr %9, align 8, !tbaa !8
  ret <2 x i64> %19
}

define ptr @"221"(ptr %el, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %0) {
bb:
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !39
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !39
  ret ptr %add.ptr.i
}

define i64 @"222"(ptr %rng, i64 %0, ptr %arrayidx42.i.i124, i64 %1, i64 %2, ptr %arrayidx49.i.i128, i64 %3, i64 %4) {
bb:
  %5 = load i64, ptr %rng, align 8, !tbaa !8
  %and52.i.i131 = and i64 %5, %2
  %tobool53.not.i.i132 = icmp eq i64 %and52.i.i131, %3
  %cond54.i.i133 = select i1 %tobool53.not.i.i132, i64 %3, i64 %4
  %6 = load i64, ptr %arrayidx49.i.i128, align 8, !tbaa !8
  %7 = load i64, ptr %arrayidx42.i.i124, align 8, !tbaa !8
  %and43.i.i125 = and i64 %7, %1
  %and46.i.i126 = and i64 %5, %0
  %or47.i.i127 = or i64 %and46.i.i126, %and43.i.i125
  %shr50.i.i129 = lshr exact i64 %or47.i.i127, %2
  %xor51.i.i130 = xor i64 %shr50.i.i129, %6
  %xor55.i.i134 = xor i64 %xor51.i.i130, %cond54.i.i133
  store i64 %xor55.i.i134, ptr %arrayidx42.i.i124, align 8, !tbaa !8
  ret i64 %xor55.i.i134
}

define i64 @"223"(i64 %0, ptr %offsets, ptr %num_nodes_.i, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !45
  %3 = and i64 %2, %1
  %4 = load ptr, ptr %offsets, align 8
  %arrayidx.i493734 = getelementptr inbounds i64, ptr %4, i64 %3
  store i64 %0, ptr %arrayidx.i493734, align 8, !tbaa !8
  ret i64 %0
}

define i64 @"224"(ptr %0, ptr %1, ptr %2) {
bb:
  %3 = load ptr, ptr %2, align 8
  %4 = load i64, ptr %0, align 8, !tbaa !8
  %5 = load i64, ptr %1, align 8, !tbaa !8
  %add = add nsw i64 %4, %5
  store i64 %add, ptr %1, align 8, !tbaa !8
  ret i64 %add
}

define ptr @"225"(ptr %call.i132133, ptr %num_nodes, i64 %0, ptr %end_size_.i) {
bb:
  %1 = load i64, ptr %num_nodes, align 8, !tbaa !8
  %add = add nsw i64 %1, %0
  %add.ptr.i = getelementptr inbounds i64, ptr %call.i132133, i64 %add
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !57
  ret ptr %add.ptr.i
}

define <2 x i64> @"226"(ptr %__first, <2 x i64> %0) {
bb:
  %1 = load <2 x i64>, ptr %__first, align 4
  %2 = shufflevector <2 x i64> %1, <2 x i64> %0, <2 x i32> <i32 1, i32 0>
  store <2 x i64> %2, ptr %__first, align 4
  ret <2 x i64> %2
}

define i64 @"227"(ptr %offsets, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %offsets, align 8, !tbaa !6
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %arrayidx.i = getelementptr inbounds i64, ptr %0, i64 %2
  %3 = load i64, ptr %arrayidx.i, align 8, !tbaa !8
  ret i64 %3
}

define i32 @"228"(ptr %end_size_.i.i583, i64 %sub.ptr.rhs.cast.i.i585, i64 %0, ptr %length.i581) {
bb:
  %1 = load ptr, ptr %end_size_.i.i583, align 8, !tbaa !57
  %sub.ptr.lhs.cast.i.i584 = ptrtoint ptr %1 to i64
  %sub.ptr.sub.i.i586 = sub i64 %sub.ptr.lhs.cast.i.i584, %sub.ptr.rhs.cast.i.i585
  %2 = lshr exact i64 %sub.ptr.sub.i.i586, %0
  %conv.i587 = trunc i64 %2 to i32
  store i32 %conv.i587, ptr %length.i581, align 4, !tbaa !10
  ret i32 %conv.i587
}

define <2 x i64> @"229"(ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %index770, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !45
  %4 = and i64 %3, %0
  %offset.idx = sub i64 %4, %index770
  %5 = add nuw i64 %offset.idx, %0
  %6 = and i64 %5, %0
  %7 = getelementptr inbounds i64, ptr %2, i64 %6
  %8 = getelementptr inbounds i64, ptr %7, i64 %1
  %wide.load = load <2 x i64>, ptr %8, align 8, !tbaa !8
  ret <2 x i64> %wide.load
}

define <4 x i32> @"230"(ptr %0, ptr %call171, ptr %arrayidx.i539, i64 %1, i64 %index800, i64 %2) {
bb:
  %3 = load i64, ptr %arrayidx.i539, align 8, !tbaa !8
  %sub183 = add nsw i64 %3, %1
  %offset.idx801 = sub i64 %sub183, %index800
  %4 = getelementptr inbounds i32, ptr %call171, i64 %offset.idx801
  %5 = getelementptr inbounds i32, ptr %4, i64 %2
  %wide.load803 = load <4 x i32>, ptr %0, align 4, !tbaa !10
  store <4 x i32> %wide.load803, ptr %5, align 4, !tbaa !10
  ret <4 x i32> %wide.load803
}

define i32 @"231"(ptr %arrayidx.i.i.i60, ptr %n_start.0.in, i64 %0, ptr %diffs, ptr %.omp.lb) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %3 = load ptr, ptr %diffs, align 8, !tbaa !0
  %arrayidx.i99 = getelementptr inbounds i32, ptr %3, i64 %2
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i89 = ptrtoint ptr %n_start.0 to i64
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !16
  %sub.ptr.lhs.cast = ptrtoint ptr %n_end.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast.i.i89
  %4 = lshr exact i64 %sub.ptr.sub, %0
  %conv22 = trunc i64 %4 to i32
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !10
  ret i32 %conv22
}

define ptr @"232"(ptr %out_index_.i, ptr %arrayidx.i7, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i, i64 %4, i64 %5, i64 %xor4.i, i64 %6, ptr %mod_.i) {
bb:
  %7 = load i64, ptr %arrayidx.i7, align 8, !tbaa !8
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
  %8 = load i32, ptr %mod_.i, align 4, !tbaa !99
  %rem.i = urem i32 %conv7.i, %8
  %idxprom3.i = sext i32 %rem.i to i64
  %9 = load ptr, ptr %out_index_.i, align 8, !tbaa !84
  %arrayidx4.i = getelementptr inbounds ptr, ptr %9, i64 %idxprom3.i
  %10 = load ptr, ptr %arrayidx4.i, align 8, !tbaa !16
  ret ptr %10
}

define i64 @"233"(ptr %arrayidx.i533, i64 %total_missing_inv.0649, ptr %arrayidx.i536, ptr %offsets, ptr %num_nodes_.i) {
bb:
  %.pre716.pre727 = load ptr, ptr %offsets, align 8, !tbaa !6
  %0 = load i64, ptr %num_nodes_.i, align 8, !tbaa !45
  %arrayidx.i5332 = getelementptr inbounds i64, ptr %.pre716.pre727, i64 %0
  %1 = load i32, ptr %arrayidx.i536, align 4, !tbaa !10
  %conv155 = sext i32 %1 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %2 = load i64, ptr %arrayidx.i533, align 8, !tbaa !8
  %add165 = add nsw i64 %2, %add156
  store i64 %add165, ptr %arrayidx.i533, align 8, !tbaa !8
  ret i64 %add165
}

define i32 @"234"(i32 %0, ptr %parent, ptr %.omp.lb) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %3 = load ptr, ptr %parent, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds i32, ptr %3, i64 %2
  store i32 %0, ptr %arrayidx.i, align 4, !tbaa !10
  ret i32 %0
}

define i64 @"235"(ptr %_M_b.i, ptr %__param, i64 %0, ptr %_M_b.i32) {
bb:
  %1 = load i64, ptr %__param, align 8, !tbaa !100
  %2 = load i64, ptr %_M_b.i, align 8, !tbaa !102
  %sub = sub i64 %2, %1
  %div31 = lshr i64 %sub, %0
  store i64 %div31, ptr %_M_b.i32, align 8, !tbaa !102
  ret i64 %div31
}

define ptr @"236"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, i64 %1) {
bb:
  %2 = load i8, ptr %transpose, align 1, !tbaa !12, !range !14, !noundef !15
  %tobool.not = icmp eq i8 %2, %0
  %3 = load ptr, ptr %out_index_.i, align 8
  %4 = load ptr, ptr %in_index_.i, align 8
  %.sink = select i1 %tobool.not, ptr %3, ptr %4
  %arrayidx.i.i.i60 = getelementptr inbounds ptr, ptr %.sink, i64 %1
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !16
  ret ptr %n_end.0
}

define i64 @"237"(ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !40
  %1 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !40
  %cmp.i.i.i.i.i = icmp eq i32 %0, %1
  %2 = load i32, ptr %v3.i.i.i.i.i, align 4
  %3 = load i32, ptr %v.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %3, %2
  %cmp7.i.i.i.i.i = icmp slt i32 %0, %1
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr3.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  %4 = load i64, ptr %add.ptr3.i.i.i, align 4
  ret i64 %4
}

define i64 @"238"(ptr %add.ptr3.i.i.i, ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !40
  %1 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !40
  %cmp.i.i.i.i.i = icmp eq i32 %0, %1
  %2 = load i32, ptr %v3.i.i.i.i.i, align 4
  %3 = load i32, ptr %v.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %3, %2
  %cmp7.i.i.i.i.i = icmp slt i32 %0, %1
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr4.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  %4 = load i64, ptr %add.ptr3.i.i.i, align 4
  store i64 %4, ptr %add.ptr4.i.i.i, align 4
  ret i64 %4
}

define i64 @"239"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57.epil) {
bb:
  %0 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !8
  %1 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !8
  %2 = load i64, ptr %arrayidx.i58, align 8, !tbaa !8
  %add7 = add nsw i64 %2, %total.076
  %3 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !8
  %add7.1 = add nsw i64 %3, %add7
  %add7.2 = add nsw i64 %1, %add7.1
  %add7.3 = add nsw i64 %0, %add7.2
  store i64 %add7.3, ptr %arrayidx.i57.epil, align 8, !tbaa !8
  ret i64 %add7.3
}

define i8 @"240"(ptr %arrayidx.i17.i, ptr %ref.tmp, i64 %conv5.i, i64 %idxprom1.i.i) {
bb:
  %0 = load ptr, ptr %ref.tmp, align 8, !tbaa !35, !alias.scope !88
  %arrayidx.i.i = getelementptr inbounds i8, ptr %0, i64 %conv5.i
  %arrayidx2.i.i = getelementptr inbounds i8, ptr %arrayidx.i.i, i64 %idxprom1.i.i
  %1 = load i8, ptr %arrayidx.i17.i, align 1, !tbaa !22, !noalias !88
  store i8 %1, ptr %arrayidx2.i.i, align 1, !tbaa !22
  ret i8 %1
}

define i64 @"241"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !37
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i78.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !55
  ret i64 %agg.tmp.sroa.0.0.copyload.i78.i.i.i.i
}

define i64 @"242"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !51
  %inc.i71 = add nuw nsw i64 %1, %0
  store i64 %inc.i71, ptr %_M_p.i.i.i, align 8, !tbaa !51
  ret i64 %inc.i71
}

define ptr @"243"(ptr %new_range.i.i, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1, ptr %el) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !37
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !39
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !39
  ret ptr %add.ptr.i464
}

define ptr @"244"(ptr %call.i239240, ptr %num_nodes_.i, i64 %0, i64 %1, ptr %end_.i) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !58
  %sub.i = add i64 %2, %0
  %div4.i = lshr i64 %sub.i, %1
  %add.ptr.i = getelementptr inbounds i64, ptr %call.i239240, i64 %div4.i
  store ptr %add.ptr.i, ptr %end_.i, align 8, !tbaa !103
  ret ptr %add.ptr.i
}

define i32 @"245"(ptr %num_nodes_.i.i, i32 %0, i64 %1, i64 %2, i32 %3, i32 %conv14.i.i, ptr %4) {
bb:
  %5 = load i64, ptr %num_nodes_.i.i, align 8, !tbaa !58
  %conv6.i.i = and i64 %5, %2
  %rem.i.i = urem i64 %1, %conv6.i.i
  %conv7.i.i = trunc i64 %rem.i.i to i32
  %6 = trunc i64 %5 to i32
  %conv.i = add i32 %6, %0
  %cmp9.i.i = icmp eq i32 %conv.i, %conv7.i.i
  %spec.select.i.i = select i1 %cmp9.i.i, i32 %3, i32 %conv14.i.i
  store i32 %spec.select.i.i, ptr %4, align 8
  ret i32 %spec.select.i.i
}

define i64 @"246"(ptr %next, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %div1.i.i58 = lshr i64 %2, %0
  %3 = load ptr, ptr %next, align 8
  %arrayidx.i59 = getelementptr inbounds i64, ptr %3, i64 %div1.i.i58
  %4 = load i64, ptr %arrayidx.i59, align 8, !tbaa !8, !llvm.access.group !36
  ret i64 %4
}

!0 = !{!1, !2, i64 0}
!1 = !{!"_ZTS7pvectorIiE", !2, i64 0, !2, i64 8, !2, i64 16}
!2 = !{!"any pointer", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C++ TBAA"}
!5 = !{!1, !2, i64 8}
!6 = !{!7, !2, i64 0}
!7 = !{!"_ZTS7pvectorIlE", !2, i64 0, !2, i64 8, !2, i64 16}
!8 = !{!9, !9, i64 0}
!9 = !{!"long", !3, i64 0}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !3, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"bool", !3, i64 0}
!14 = !{i8 0, i8 2}
!15 = !{}
!16 = !{!2, !2, i64 0}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = !{!3, !3, i64 0}
!23 = !{!24}
!24 = distinct !{!24, !25, !"_ZNSt7__cxx119to_stringEi: %agg.result"}
!25 = distinct !{!25, !"_ZNSt7__cxx119to_stringEi"}
!26 = !{!27, !11, i64 156}
!27 = !{!"_ZTS5CLApp", !28, i64 0, !13, i64 155, !11, i64 156, !9, i64 160, !13, i64 168, !13, i64 169}
!28 = !{!"_ZTS6CLBase", !11, i64 8, !2, i64 16, !29, i64 24, !29, i64 56, !31, i64 88, !11, i64 112, !11, i64 116, !29, i64 120, !13, i64 152, !13, i64 153, !13, i64 154}
!29 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !30, i64 0, !9, i64 8, !3, i64 16}
!30 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !2, i64 0}
!31 = !{!"_ZTSSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !32, i64 0}
!32 = !{!"_ZTSSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !33, i64 0}
!33 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implE", !34, i64 0}
!34 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_Vector_impl_dataE", !2, i64 0, !2, i64 8, !2, i64 16}
!35 = !{!29, !2, i64 0}
!36 = distinct !{}
!37 = !{!38, !2, i64 0}
!38 = !{!"_ZTS7pvectorI8EdgePairIiiEE", !2, i64 0, !2, i64 8, !2, i64 16}
!39 = !{!38, !2, i64 8}
!40 = !{!41, !11, i64 0}
!41 = !{!"_ZTS8EdgePairIiiE", !11, i64 0, !11, i64 4}
!42 = !{!43, !2, i64 0}
!43 = !{!"_ZTS12SlidingQueueIiE", !2, i64 0, !9, i64 8, !9, i64 16, !9, i64 24}
!44 = !{!43, !9, i64 16}
!45 = !{!46, !9, i64 16}
!46 = !{!"_ZTS11BuilderBaseIiiiLb1EE", !2, i64 0, !13, i64 8, !13, i64 9, !13, i64 10, !9, i64 16}
!47 = !{!38, !2, i64 16}
!48 = !{!29, !9, i64 8}
!49 = !{!50, !2, i64 0}
!50 = !{!"_ZTS7UniDistIiSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEjE", !2, i64 0, !13, i64 8, !11, i64 12, !11, i64 16}
!51 = !{!52, !9, i64 4992}
!52 = !{!"_ZTSSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE", !3, i64 0, !9, i64 4992}
!53 = !{!54, !11, i64 0}
!54 = !{!"_ZTS10NodeWeightIiiE", !11, i64 0, !11, i64 4}
!55 = !{i64 0, i64 4, !10, i64 4, i64 4, !10}
!56 = !{i64 0, i64 4, !10}
!57 = !{!7, !2, i64 8}
!58 = !{!59, !9, i64 8}
!59 = !{!"_ZTS8CSRGraphIiiLb1EE", !13, i64 0, !9, i64 8, !9, i64 16, !2, i64 24, !2, i64 32, !2, i64 40, !2, i64 48}
!60 = !{!61}
!61 = distinct !{!61, !62, !"_ZN11BuilderBaseIiiiLb1EE11SquishGraphERK8CSRGraphIiiLb1EE: %agg.result"}
!62 = distinct !{!62, !"_ZN11BuilderBaseIiiiLb1EE11SquishGraphERK8CSRGraphIiiLb1EE"}
!63 = !{!64}
!64 = distinct !{!64, !65, !"_ZSt19__relocate_object_aINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_SaIS5_EEvPT_PT0_RT1_: %__orig"}
!65 = distinct !{!65, !"_ZSt19__relocate_object_aINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_SaIS5_EEvPT_PT0_RT1_"}
!66 = !{!67}
!67 = distinct !{!67, !65, !"_ZSt19__relocate_object_aINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_SaIS5_EEvPT_PT0_RT1_: %__dest"}
!68 = !{!34, !2, i64 8}
!69 = !{!34, !2, i64 16}
!70 = !{!71}
!71 = distinct !{!71, !72, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_: %agg.result"}
!72 = distinct !{!72, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_"}
!73 = !{!43, !9, i64 24}
!74 = !{!75, !9, i64 16}
!75 = !{!"_ZTS9GeneratorIiiijLi32ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEE", !11, i64 0, !9, i64 8, !9, i64 16}
!76 = !{!27, !9, i64 160}
!77 = !{!78, !11, i64 0}
!78 = !{!"_ZTS12SourcePickerI8CSRGraphIiiLb1EEE", !11, i64 0, !79, i64 8, !50, i64 2512, !2, i64 2536}
!79 = !{!"_ZTSSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE", !3, i64 0, !9, i64 2496}
!80 = !{!75, !9, i64 8}
!81 = !{!82}
!82 = distinct !{!82, !83, !"_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm: %agg.result"}
!83 = distinct !{!83, !"_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm"}
!84 = !{!59, !2, i64 24}
!85 = !{!86}
!86 = distinct !{!86, !87, !"_ZNK8CSRGraphIiiLb1EE9out_neighEim: %agg.result"}
!87 = distinct !{!87, !"_ZNK8CSRGraphIiiLb1EE9out_neighEim"}
!88 = !{!89}
!89 = distinct !{!89, !90, !"_ZNSt7__cxx119to_stringEi: %agg.result"}
!90 = distinct !{!90, !"_ZNSt7__cxx119to_stringEi"}
!91 = !{!79, !9, i64 2496}
!92 = !{!93, !2, i64 240}
!93 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !94, i64 0, !2, i64 216, !3, i64 224, !13, i64 225, !2, i64 232, !2, i64 240, !2, i64 248, !2, i64 256}
!94 = !{!"_ZTSSt8ios_base", !9, i64 8, !9, i64 16, !95, i64 24, !96, i64 28, !96, i64 32, !2, i64 40, !97, i64 48, !3, i64 64, !11, i64 192, !2, i64 200, !98, i64 208}
!95 = !{!"_ZTSSt13_Ios_Fmtflags", !3, i64 0}
!96 = !{!"_ZTSSt12_Ios_Iostate", !3, i64 0}
!97 = !{!"_ZTSNSt8ios_base6_WordsE", !2, i64 0, !9, i64 8}
!98 = !{!"_ZTSSt6locale", !2, i64 0}
!99 = !{!50, !11, i64 12}
!100 = !{!101, !9, i64 0}
!101 = !{!"_ZTSNSt24uniform_int_distributionImE10param_typeE", !9, i64 0, !9, i64 8}
!102 = !{!101, !9, i64 8}
!103 = !{!104, !2, i64 8}
!104 = !{!"_ZTS6Bitmap", !2, i64 0, !2, i64 8}
