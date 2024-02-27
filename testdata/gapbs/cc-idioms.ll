; ModuleID = 'cc-idioms'
source_filename = "cc-idioms"
target triple = "riscv64"

%"struct.std::pair.18" = type { i32, i32 }
%struct.EdgePair = type { i32, i32 }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char>::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char>::_Alloc_hider" = type { ptr }
%union.anon = type { i64, [8 x i8] }

define i64 @"1"(ptr %arrayidx.i57, ptr %agg.result, ptr %end_size_.i, ptr %degrees, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i57, align 8, !tbaa !0
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !4
  %sub.ptr.lhs.cast.i59 = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %degrees, align 8, !tbaa !7
  %sub.ptr.rhs.cast.i60 = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i61 = sub i64 %sub.ptr.lhs.cast.i59, %sub.ptr.rhs.cast.i60
  %sub.ptr.div.i62 = ashr exact i64 %sub.ptr.sub.i61, %0
  %4 = load ptr, ptr %agg.result, align 8, !tbaa !8
  %arrayidx.i63 = getelementptr inbounds i64, ptr %4, i64 %sub.ptr.div.i62
  store i64 %1, ptr %arrayidx.i63, align 8, !tbaa !0
  ret i64 %1
}

define <2 x i32> @"2"(ptr %degrees, ptr %.omp.lb, i64 %0, i64 %index) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul12 = shl i64 %1, %0
  %offset.idx = add i64 %mul12, %index
  %2 = load ptr, ptr %degrees, align 8, !tbaa !7
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
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %offset.idx = add i64 %3, %index
  %4 = load ptr, ptr %this, align 8, !tbaa !7
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

define i32 @"6"(ptr %comp, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %1 = sext i32 %0 to i64
  %2 = load ptr, ptr %comp, align 8, !tbaa !7, !llvm.access.group !36
  %arrayidx.i = getelementptr inbounds i32, ptr %2, i64 %1
  %arrayidx.i.promoted = load i32, ptr %arrayidx.i, align 4, !tbaa !10
  ret i32 %arrayidx.i.promoted
}

define i32 @"7"(ptr %init_val, ptr %this, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %this, align 8, !tbaa !7
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add.ptr.prol = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %init_val, align 4, !tbaa !10
  store i32 %2, ptr %add.ptr.prol, align 4, !tbaa !10
  ret i32 %2
}

define i64 @"8"(ptr %add.ptr.i113, ptr %cond.i31.i.i.i, ptr %_M_finish.i.i114, i64 %0, ptr %count_vector, i64 %1) {
bb:
  %2 = load i64, ptr %add.ptr.i113, align 4
  %3 = load ptr, ptr %count_vector, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i.i.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %_M_finish.i.i114, align 8, !tbaa !37
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %4, i64 %0
  %sub.ptr.lhs.cast.i.i.i.i.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, %1
  %add.ptr.i.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %cond.i31.i.i.i, i64 %sub.ptr.div.i.i.i.i.i
  store i64 %2, ptr %add.ptr.i.i.i, align 4
  ret i64 %2
}

define ptr @"9"(ptr %el, ptr %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %2 = load ptr, ptr %el, align 8, !tbaa !39
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !39
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !41
  ret ptr %add.ptr.i464
}

define i32 @"10"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, ptr %v.i.i.i.i.i.i, ptr %v3.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !42
  %3 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !42
  %cmp.i.i.i.i.i.i = icmp eq i32 %2, %3
  %4 = load i32, ptr %v.i.i.i.i.i.i, align 4
  %5 = load i32, ptr %v3.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i = icmp slt i32 %4, %5
  %cmp7.i.i.i.i.i.i = icmp slt i32 %2, %3
  %cond.i.i.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i1 %cmp4.i.i.i.i.i.i, i1 %cmp7.i.i.i.i.i.i
  %spec.select.i.i.i.i = select i1 %cond.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %__parent.020.in.i.i.i.i.i = add nsw i64 %sub12.i.i.i.i, %1
  %__parent.020.i.i56.i.i.i = lshr i64 %__parent.020.in.i.i.i.i.i, %0
  %add.ptr.i.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %__parent.020.i.i56.i.i.i
  %6 = load i32, ptr %add.ptr.i.i.i.i.i, align 4, !tbaa !42
  ret i32 %6
}

define i64 @"12"(ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %__i.018.i, ptr %arrayidx7.i) {
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

define i32 @"13"(ptr %add.ptr.i.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0) {
bb:
  %1 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !10
  %2 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !10
  %cmp.i.i.i.i.i = icmp slt i32 %1, %2
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %add.ptr2.i.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %sub12.i.i.i.i
  %3 = load i32, ptr %add.ptr.i.i.i.i.i, align 4, !tbaa !10
  store i32 %3, ptr %add.ptr2.i.i.i.i.i, align 4, !tbaa !10
  ret i32 %3
}

define i32 @"14"(ptr %n_start.0.in, i64 %0, ptr %diffs, ptr %.omp.lb) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  %sub.ptr.lhs.cast = ptrtoint ptr %n_start.0 to i64
  %.pre134 = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %.pre134
  %1 = lshr exact i64 %sub.ptr.sub, %0
  %conv22 = trunc i64 %1 to i32
  %2 = load ptr, ptr %diffs, align 8, !tbaa !7
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %4 = sext i32 %3 to i64
  %arrayidx.i99 = getelementptr inbounds i32, ptr %2, i64 %4
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !10
  ret i32 %conv22
}

define i64 @"15"(ptr %0, ptr %_M_finish.i38, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5) {
bb:
  %6 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !37
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %6, i64 %1
  %7 = ptrtoint ptr %incdec.ptr.i.i to i64
  %8 = add i64 %7, %2
  %9 = sub i64 %8, %3
  %10 = lshr i64 %9, %4
  %11 = add nuw nsw i64 %10, %1
  %n.vec = and i64 %11, %5
  %12 = shl i64 %n.vec, %4
  %ind.end65 = getelementptr i8, ptr %0, i64 %12
  %13 = load i64, ptr %ind.end65, align 4, !alias.scope !44, !noalias !47
  ret i64 %13
}

define i32 @"17"(ptr %__first.addr.033.i.i, ptr %n_start.0.in) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  %0 = load i32, ptr %__first.addr.033.i.i, align 4, !tbaa !10
  store i32 %0, ptr %n_start.0, align 4, !tbaa !10
  ret i32 %0
}

define i32 @"18"(ptr %degrees, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %degrees, align 8, !tbaa !7
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul13 = shl i64 %2, %0
  %arrayidx.i34 = getelementptr inbounds i32, ptr %1, i64 %mul13
  %3 = load i32, ptr %arrayidx.i34, align 4, !tbaa !10
  ret i32 %3
}

define ptr @"19"(ptr %_M_before_begin.i, ptr %__p.044) {
bb:
  %0 = load ptr, ptr %_M_before_begin.i, align 8, !tbaa !49
  %1 = load ptr, ptr %__p.044, align 8, !tbaa !54
  store ptr %0, ptr %1, align 8, !tbaa !54
  ret ptr %0
}

define i32 @"20"(ptr %el, i64 %0, i64 %1, i32 %2) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr122.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %v3.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr122.i.i, i64 %1, i32 1
  %3 = load i32, ptr %v3.i.i.i.i, align 4
  ret i32 %3
}

define i64 @"21"(ptr %offsets, ptr %num_nodes_.i, i32 %0, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %3 = trunc i64 %2 to i32
  %n184.0657 = add i32 %3, %0
  %4 = zext i32 %n184.0657 to i64
  %sext = shl i64 %4, %1
  %conv202 = ashr exact i64 %sext, %1
  %5 = load ptr, ptr %offsets, align 8, !tbaa !8
  %arrayidx.i542 = getelementptr inbounds i64, ptr %5, i64 %conv202
  %6 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  ret i64 %6
}

define i32 @"22"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !39
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %2
  %add.ptr.sroa_idx.prol = getelementptr inbounds i8, ptr %add.ptr.prol, i64 %0
  %3 = load i32, ptr %add.ptr.sroa_idx.prol, align 4
  ret i32 %3
}

define ptr @"23"(ptr %new_range.i.i457, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !39
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !16
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !57
  ret ptr %add.ptr6.i.i478
}

define ptr @"24"(ptr %el, i64 %sub.ptr.rhs.cast, i64 %0, ptr %end_size_.i) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !39
  %sub.ptr.lhs.cast = ptrtoint ptr %1 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !41
  ret ptr %add.ptr.i
}

define i32 @"25"(ptr %init_val, ptr %this, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %init_val, align 4, !tbaa !10
  %1 = load ptr, ptr %this, align 8, !tbaa !7
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add.ptr = getelementptr inbounds i32, ptr %1, i64 %2
  store i32 %0, ptr %add.ptr, align 4, !tbaa !10
  ret i32 %0
}

define i32 @"26"(ptr %add.ptr3.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr3.i.i.i.i, align 4, !tbaa !10
  %1 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !10
  %2 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !10
  %cmp.i.i.i.i.i = icmp slt i32 %1, %2
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add.ptr4.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i.i.i.i
  store i32 %0, ptr %add.ptr4.i.i.i.i, align 4, !tbaa !10
  ret i32 %0
}

define i64 @"27"(ptr %arrayidx.i56.1, ptr %arrayidx.i56, i64 %total.074, ptr %arrayidx.i55.2) {
bb:
  %0 = load i64, ptr %arrayidx.i56, align 8, !tbaa !0
  %add7 = add nsw i64 %0, %total.074
  %1 = load i64, ptr %arrayidx.i56.1, align 8, !tbaa !0
  %add7.1 = add nsw i64 %1, %add7
  store i64 %add7.1, ptr %arrayidx.i55.2, align 8, !tbaa !0
  ret i64 %add7.1
}

define i64 @"28"(ptr %arrayidx.i25, i64 %0, ptr %arrayidx.i23, ptr %el, i64 %.omp.iv.028) {
bb:
  %1 = load i32, ptr %arrayidx.i25, align 4, !tbaa !10
  %ref.tmp.sroa.4.0.insert.ext = zext i32 %1 to i64
  %ref.tmp.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp.sroa.4.0.insert.ext, %0
  %2 = load i32, ptr %arrayidx.i23, align 4, !tbaa !10
  %ref.tmp.sroa.0.0.insert.ext = zext i32 %2 to i64
  %ref.tmp.sroa.0.0.insert.insert = or i64 %ref.tmp.sroa.4.0.insert.shift, %ref.tmp.sroa.0.0.insert.ext
  %3 = load ptr, ptr %el, align 8, !tbaa !39
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %.omp.iv.028
  store i64 %ref.tmp.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp.sroa.0.0.insert.insert
}

define i64 @"29"(ptr %_M_string_length.i.i.i.i, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %_M_string_length.i24.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i, i32 1
  %3 = load i64, ptr %_M_string_length.i.i.i.i, align 8, !tbaa !58
  store i64 %3, ptr %_M_string_length.i24.i.i.i, align 8, !tbaa !58
  ret i64 %3
}

define i64 @"30"(ptr %arrayidx.i56, ptr %arrayidx.i56.3, ptr %arrayidx.i56.2, ptr %arrayidx.i56.1, i64 %add7, ptr %arrayidx.i55.1) {
bb:
  %0 = load i64, ptr %arrayidx.i56, align 8, !tbaa !0
  %1 = load i64, ptr %arrayidx.i56.1, align 8, !tbaa !0
  %add7.1 = add nsw i64 %1, %add7
  %2 = load i64, ptr %arrayidx.i56.2, align 8, !tbaa !0
  %add7.2 = add nsw i64 %2, %add7.1
  %3 = load i64, ptr %arrayidx.i56.3, align 8, !tbaa !0
  %add7.3 = add nsw i64 %3, %add7.2
  %add72 = add nsw i64 %0, %add7.3
  store i64 %add7, ptr %arrayidx.i55.1, align 8, !tbaa !0
  ret i64 %add7
}

define i32 @"31"(ptr %num_nodes, i64 %0, ptr %length.i) {
bb:
  %1 = load i64, ptr %num_nodes, align 8, !tbaa !0
  %add = add nsw i64 %1, %0
  %conv.i = trunc i64 %add to i32
  store i32 %conv.i, ptr %length.i, align 4, !tbaa !10
  ret i32 %conv.i
}

define i64 @"32"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !59
  %inc.i71 = add nuw nsw i64 %1, %0
  %inc.i64 = add nuw nsw i64 %inc.i71, %0
  store i64 %inc.i64, ptr %_M_p.i.i.i, align 8, !tbaa !59
  ret i64 %inc.i64
}

define i64 @"33"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %end_size_.i.i) {
bb:
  %.pre.pre.i = load ptr, ptr %end_size_.i.i, align 8, !tbaa !41
  %2 = load i32, ptr %v, align 4, !tbaa !61
  %sub = add nsw i32 %2, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %.pre.pre.i, align 4, !tbaa.struct !63
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"34"(ptr %__first, ptr %add.ptr.i.us, ptr %add.ptr2.i.us, i64 %sub1.i.us, i64 %mul.i.us, i64 %0, i64 %1) {
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

define i32 @"35"(ptr %e.sroa.4.0..sroa_idx, ptr %el, ptr %arrayidx.i) {
bb:
  %0 = load ptr, ptr %el, align 8, !tbaa !39
  %1 = load i64, ptr %arrayidx.i, align 8, !tbaa !0
  %arrayidx = getelementptr inbounds i32, ptr %0, i64 %1
  %e.sroa.4.0.copyload = load i32, ptr %e.sroa.4.0..sroa_idx, align 4, !tbaa.struct !64
  store i32 %e.sroa.4.0.copyload, ptr %arrayidx, align 4, !tbaa !10
  ret i32 %e.sroa.4.0.copyload
}

define i32 @"36"(ptr %end_size_.i, ptr %offsets, i64 %0, ptr %length.i138) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !8
  %sub.ptr.rhs.cast.i.i142 = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !65
  %sub.ptr.lhs.cast.i.i141 = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i143 = sub i64 %sub.ptr.lhs.cast.i.i141, %sub.ptr.rhs.cast.i.i142
  %3 = lshr exact i64 %sub.ptr.sub.i.i143, %0
  %conv.i144 = trunc i64 %3 to i32
  store i32 %conv.i144, ptr %length.i138, align 4, !tbaa !10
  ret i32 %conv.i144
}

define ptr @"37"(ptr %out_index.i, ptr %num_nodes_.i) {
bb:
  %0 = load i64, ptr %num_nodes_.i, align 8, !tbaa !66, !noalias !68
  %1 = load ptr, ptr %out_index.i, align 8, !tbaa !16, !noalias !68
  %arrayidx.i.i = getelementptr inbounds ptr, ptr %1, i64 %0
  %2 = load ptr, ptr %arrayidx.i.i, align 8, !tbaa !16, !noalias !68
  ret ptr %2
}

define i32 @"38"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !39
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %ind.end
  %5 = load i32, ptr %add.ptr.prol, align 4
  ret i32 %5
}

define i32 @"39"(ptr %call171, ptr %arrayidx.i548, ptr %arrayidx.i549) {
bb:
  %0 = load i64, ptr %arrayidx.i548, align 8, !tbaa !0
  %add.ptr263 = getelementptr inbounds i32, ptr %call171, i64 %0
  %1 = load i32, ptr %arrayidx.i549, align 4, !tbaa !10
  %idx.ext = sext i32 %1 to i64
  %add.ptr266 = getelementptr inbounds i32, ptr %add.ptr263, i64 %idx.ext
  %2 = load i32, ptr %add.ptr266, align 4, !tbaa !10
  ret i32 %2
}

define i32 @"40"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %el, align 8, !tbaa !39
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %ind.end
  %add.ptr.sroa_idx.prol = getelementptr inbounds i8, ptr %add.ptr.prol, i64 %2
  %6 = load i32, ptr %add.ptr.sroa_idx.prol, align 4
  ret i32 %6
}

define i64 @"41"(ptr %add.ptr.i113, ptr %cond.i31.i.i.i, i64 %0, ptr %count_vector, i64 %1, i64 %2, i64 %3) {
bb:
  %4 = load i64, ptr %add.ptr.i113, align 4
  %5 = load ptr, ptr %count_vector, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i.i.i.i = ptrtoint ptr %5 to i64
  %6 = ptrtoint ptr %5 to i64
  %7 = sub i64 %0, %6
  %8 = lshr i64 %7, %1
  %9 = add nuw nsw i64 %8, %2
  %n.vec = and i64 %9, %3
  %10 = shl i64 %n.vec, %1
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i, i64 %10
  %incdec.ptr.i.i.i = getelementptr %"struct.std::pair.18", ptr %ind.end, i64 %2
  %sub.ptr.lhs.cast.i.i.i.i.i = ptrtoint ptr %incdec.ptr.i.i.i to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, %1
  %add.ptr.i.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %cond.i31.i.i.i, i64 %sub.ptr.div.i.i.i.i.i
  store i64 %4, ptr %add.ptr.i.i.i, align 4
  ret i64 %4
}

define i64 @"42"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %end_size_.i.i) {
bb:
  %2 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !41
  %3 = load i32, ptr %v, align 4, !tbaa !61
  %sub = add nsw i32 %3, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %2, align 4, !tbaa.struct !63
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"43"(ptr %degrees, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul12 = shl i64 %1, %0
  %2 = load ptr, ptr %degrees, align 8, !tbaa !7
  %arrayidx.i30 = getelementptr inbounds i32, ptr %2, i64 %mul12
  %3 = load i32, ptr %arrayidx.i30, align 4, !tbaa !10
  ret i32 %3
}

define i64 @"44"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i = load i64, ptr %incdec.ptr.i.i.i.i, align 4, !tbaa.struct !63
  ret i64 %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i
}

define ptr @"45"(ptr %__p.044, ptr %retval.0.i, ptr %add.ptr, i64 %__bkt_count) {
bb:
  %0 = load i32, ptr %add.ptr, align 4, !tbaa !10
  %conv.i.i.i = sext i32 %0 to i64
  %rem.i.i = urem i64 %conv.i.i.i, %__bkt_count
  %arrayidx16 = getelementptr inbounds ptr, ptr %retval.0.i, i64 %rem.i.i
  %1 = load ptr, ptr %__p.044, align 8, !tbaa !54
  store ptr %1, ptr %arrayidx16, align 8, !tbaa !16
  ret ptr %1
}

define i8 @"46"(ptr %arrayidx.i17.i, ptr %agg.tmp32, ptr %num_trials_, i32 %0, i64 %idxprom1.i.i) {
bb:
  %1 = load i8, ptr %arrayidx.i17.i, align 1, !tbaa !22, !noalias !23
  %2 = load i32, ptr %num_trials_, align 4, !tbaa !26
  %__val.lobit.i = lshr i32 %2, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %3 = load ptr, ptr %agg.tmp32, align 8, !tbaa !35, !alias.scope !23
  %arrayidx.i.i = getelementptr inbounds i8, ptr %3, i64 %conv5.i
  %arrayidx2.i.i = getelementptr inbounds i8, ptr %arrayidx.i.i, i64 %idxprom1.i.i
  store i8 %1, ptr %arrayidx2.i.i, align 1, !tbaa !22
  ret i8 %1
}

define ptr @"47"(ptr %call.i, ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, i64 %2, ptr %end_size_.i38) {
bb:
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !4
  %sub.ptr.lhs.cast.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %degrees, align 8, !tbaa !7
  %sub.ptr.rhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %sub = add nsw i64 %sub.ptr.div.i, %1
  %div36 = lshr i64 %sub, %2
  %add.ptr.i = getelementptr inbounds i64, ptr %call.i, i64 %div36
  store ptr %add.ptr.i, ptr %end_size_.i38, align 8, !tbaa !65
  ret ptr %add.ptr.i
}

define i64 @"48"(ptr %arrayidx.i, i64 %0, ptr %offsets, ptr %__begin0.0640) {
bb:
  %1 = load i64, ptr %arrayidx.i, align 8, !tbaa !0
  %inc = add nsw i64 %1, %0
  %2 = load ptr, ptr %offsets, align 8, !tbaa !8
  %e.sroa.0.0.copyload = load i32, ptr %__begin0.0640, align 4, !tbaa.struct !63
  %conv = sext i32 %e.sroa.0.0.copyload to i64
  %arrayidx.i2 = getelementptr inbounds i64, ptr %2, i64 %conv
  store i64 %inc, ptr %arrayidx.i, align 8, !tbaa !0
  ret i64 %inc
}

define i64 @"49"(ptr %max_seen.i, i32 %0, ptr %num_nodes_) {
bb:
  %1 = load i32, ptr %max_seen.i, align 4, !tbaa !10
  %add = add nsw i32 %1, %0
  %conv = sext i32 %add to i64
  store i64 %conv, ptr %num_nodes_, align 8, !tbaa !55
  ret i64 %conv
}

define ptr @"50"(ptr %new_range.i.i, ptr %el, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %1 = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %2 = load ptr, ptr %el, align 8, !tbaa !39
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !57
  ret ptr %add.ptr6.i.i
}

define i32 @"51"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3) {
bb:
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add15 = add i64 %ind.end, %2
  %6 = load ptr, ptr %el, align 8, !tbaa !39
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %6, i64 %add15
  %add.ptr.sroa_idx.1 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %3
  %7 = load i32, ptr %add.ptr.sroa_idx.1, align 4
  ret i32 %7
}

define i64 @"52"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !63
  ret i64 %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i
}

define ptr @"53"(ptr %cond.i31.i.i.i, i64 %.sroa.speculated.i.i.i.i, i64 %0, ptr %count_vector, i64 %1, i64 %2, i64 %3, i64 %sub.ptr.div.i.i.i.i.i, i1 %cmp9.i.i.i.i, i64 %4, i64 %add.i.i.i.i, ptr %_M_end_of_storage.i.i277) {
bb:
  %5 = load ptr, ptr %count_vector, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i.i.i.i = ptrtoint ptr %5 to i64
  %6 = ptrtoint ptr %5 to i64
  %7 = sub i64 %0, %6
  %8 = lshr i64 %7, %1
  %9 = add nuw nsw i64 %8, %2
  %n.vec = and i64 %9, %3
  %10 = shl i64 %n.vec, %1
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i, i64 %10
  %incdec.ptr.i.i.i = getelementptr %"struct.std::pair.18", ptr %ind.end, i64 %2
  %sub.ptr.lhs.cast.i.i.i.i.i = ptrtoint ptr %incdec.ptr.i.i.i to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i2 = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, %1
  %add.i.i.i.i4 = add i64 %.sroa.speculated.i.i.i.i, %sub.ptr.div.i.i.i.i.i
  %cmp7.i.i.i.i = icmp ult i64 %add.i.i.i.i, %sub.ptr.div.i.i.i.i.i
  %or.cond.i.i.i.i = or i1 %cmp7.i.i.i.i, %cmp9.i.i.i.i
  %cond.i.i.i.i = select i1 %or.cond.i.i.i.i, i64 %4, i64 %add.i.i.i.i
  %add.ptr19.i.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %cond.i31.i.i.i, i64 %cond.i.i.i.i
  store ptr %add.ptr19.i.i.i, ptr %_M_end_of_storage.i.i277, align 8, !tbaa !71
  ret ptr %add.ptr19.i.i.i
}

define i64 @"55"(ptr %arrayidx.i263, i64 %0, ptr %label_source_pair.sroa.5.0.call42.sroa_idx, i64 %1) {
bb:
  %label_source_pair.sroa.5.0.copyload = load i32, ptr %label_source_pair.sroa.5.0.call42.sroa_idx, align 4
  %conv45 = sext i32 %label_source_pair.sroa.5.0.copyload to i64
  %and.i.i = and i64 %conv45, %1
  %shl.i = shl nuw i64 %0, %and.i.i
  %2 = load i64, ptr %arrayidx.i263, align 8, !tbaa !0
  %or.i = or i64 %2, %shl.i
  store i64 %or.i, ptr %arrayidx.i263, align 8, !tbaa !0
  ret i64 %or.i
}

define i32 @"56"(ptr %el, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %1 = load ptr, ptr %el, align 8, !tbaa !39
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %0
  %2 = load i32, ptr %add.ptr, align 4
  ret i32 %2
}

define ptr @"57"(ptr %cond.i31.i.i.i, i64 %.sroa.speculated.i.i.i.i, i64 %sub.ptr.lhs.cast.i.i.i.i.i, ptr %count_vector, i64 %0, i64 %sub.ptr.div.i.i.i.i.i, i1 %cmp9.i.i.i.i, i64 %1, i64 %add.i.i.i.i, ptr %_M_end_of_storage.i.i277) {
bb:
  %2 = load ptr, ptr %count_vector, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i.i.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i2 = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, %0
  %add.i.i.i.i4 = add i64 %.sroa.speculated.i.i.i.i, %sub.ptr.div.i.i.i.i.i
  %cmp7.i.i.i.i = icmp ult i64 %add.i.i.i.i, %sub.ptr.div.i.i.i.i.i
  %or.cond.i.i.i.i = or i1 %cmp7.i.i.i.i, %cmp9.i.i.i.i
  %cond.i.i.i.i = select i1 %or.cond.i.i.i.i, i64 %1, i64 %add.i.i.i.i
  %add.ptr19.i.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %cond.i31.i.i.i, i64 %cond.i.i.i.i
  store ptr %add.ptr19.i.i.i, ptr %_M_end_of_storage.i.i277, align 8, !tbaa !71
  ret ptr %add.ptr19.i.i.i
}

define i64 @"58"(ptr %arrayidx.i56.epil, i64 %total.074.epil, ptr %arrayidx.i55.epil) {
bb:
  %0 = load i64, ptr %arrayidx.i56.epil, align 8, !tbaa !0
  %add7.epil = add nsw i64 %0, %total.074.epil
  store i64 %add7.epil, ptr %arrayidx.i55.epil, align 8, !tbaa !0
  ret i64 %add7.epil
}

define i32 @"59"(ptr %.omp.lb, ptr %comp, i64 %indvars.iv) {
bb:
  %0 = load ptr, ptr %comp, align 8, !tbaa !7
  %arrayidx.i = getelementptr inbounds i32, ptr %0, i64 %indvars.iv
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %3 = trunc i64 %2 to i32
  store i32 %3, ptr %arrayidx.i, align 4, !tbaa !10
  ret i32 %3
}

define ptr @"60"(ptr %el, i64 %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !41
  ret ptr %add.ptr.i
}

define i32 @"61"(i32 %0, ptr %__p.022.i.i.i.i, i64 %1) {
bb:
  %2 = load ptr, ptr %__p.022.i.i.i.i, align 8, !tbaa !54
  %retval.1.i.i = getelementptr inbounds i8, ptr %2, i64 %1
  store i32 %0, ptr %retval.1.i.i, align 4, !tbaa !10
  ret i32 %0
}

define i32 @"62"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.1659, ptr %arrayidx.i541) {
bb:
  %1 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  %i200.0 = add nsw i64 %1, %0
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %.pre731 = sext i32 %.pre717 to i64
  %sub222 = sub nsw i64 %total_missing_inv.1659, %.pre731
  %sub211 = sub nsw i64 %i200.0, %sub222
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %2 = load i32, ptr %arrayidx212, align 4, !tbaa !10
  ret i32 %2
}

define i64 @"63"(ptr %arrayidx.i56.3, ptr %arrayidx.i56.2, ptr %arrayidx.i56.1, ptr %arrayidx.i56, i64 %total.074, ptr %arrayidx.i55) {
bb:
  %0 = load i64, ptr %arrayidx.i56, align 8, !tbaa !0
  %add7 = add nsw i64 %0, %total.074
  %1 = load i64, ptr %arrayidx.i56.1, align 8, !tbaa !0
  %add7.1 = add nsw i64 %1, %add7
  %2 = load i64, ptr %arrayidx.i56.2, align 8, !tbaa !0
  %add7.2 = add nsw i64 %2, %add7.1
  %3 = load i64, ptr %arrayidx.i56.3, align 8, !tbaa !0
  %add7.3 = add nsw i64 %3, %add7.2
  store i64 %add7.3, ptr %arrayidx.i55, align 8, !tbaa !0
  ret i64 %add7.3
}

define i32 @"64"(ptr %call171, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %0, i64 %1, i64 %total_missing_inv.0649, ptr %arrayidx.i536) {
bb:
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  %3 = load i64, ptr %arrayidx.i540, align 8, !tbaa !0
  %4 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %conv198 = sext i32 %4 to i64
  %add199 = add nsw i64 %3, %conv198
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

define i64 @"65"(ptr %add.ptr.i.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, ptr %v.i.i.i.i.i.i, ptr %v3.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %add.ptr.i.i.i.i.i, align 4
  %2 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !42
  %3 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !42
  %cmp.i.i.i.i.i.i = icmp eq i32 %2, %3
  %4 = load i32, ptr %v.i.i.i.i.i.i, align 4
  %5 = load i32, ptr %v3.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i = icmp slt i32 %4, %5
  %cmp7.i.i.i.i.i.i = icmp slt i32 %2, %3
  %cond.i.i.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i1 %cmp4.i.i.i.i.i.i, i1 %cmp7.i.i.i.i.i.i
  %spec.select.i.i.i.i = select i1 %cond.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %add.ptr2.i.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %sub12.i.i.i.i
  store i64 %1, ptr %add.ptr2.i.i.i.i.i, align 4
  ret i64 %1
}

define i64 @"66"(i64 %0, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %this, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %1
  %_M_string_length.i24.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i, i32 1
  store i64 %0, ptr %_M_string_length.i24.i.i.i, align 8, !tbaa !58
  ret i64 %0
}

define i64 @"67"(ptr %this, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %1 = load ptr, ptr %this, align 8, !tbaa !39
  %arrayidx = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %0
  %2 = load i64, ptr %arrayidx, align 4
  ret i64 %2
}

define <2 x i64> @"69"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %rng, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
bb:
  %wide.load91 = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %10 = and <2 x i64> %wide.load91, %1
  %11 = load i64, ptr %rng, align 8, !tbaa !0
  %vector.recur.init89 = insertelement <2 x i64> %2, i64 %11, i64 %3
  %12 = shufflevector <2 x i64> %vector.recur.init89, <2 x i64> %wide.load91, <2 x i32> <i32 1, i32 2>
  %13 = and <2 x i64> %12, %4
  %14 = or <2 x i64> %10, %13
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

define <4 x i32> @"70"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.1659, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  %3 = add i64 %2, %0
  %4 = sub nsw i64 %3, %total_missing_inv.1659
  %5 = getelementptr inbounds i32, ptr %call171, i64 %4
  %6 = getelementptr inbounds i32, ptr %5, i64 %1
  %wide.load803 = load <4 x i32>, ptr %6, align 4, !tbaa !10
  ret <4 x i32> %wide.load803
}

define i32 @"71"(ptr %comp, ptr %arrayidx.i36.phi.trans.insert) {
bb:
  %.pre = load ptr, ptr %comp, align 8, !tbaa !7
  %.pre52 = load i32, ptr %arrayidx.i36.phi.trans.insert, align 4, !tbaa !10
  %conv13 = sext i32 %.pre52 to i64
  %arrayidx.i37 = getelementptr inbounds i32, ptr %.pre, i64 %conv13
  %p1.0 = load i32, ptr %arrayidx.i37, align 4, !tbaa !10
  ret i32 %p1.0
}

define i32 @"72"(ptr %arrayidx212, ptr %call171, ptr %arrayidx.i539, i64 %0) {
bb:
  %1 = load i32, ptr %arrayidx212, align 4, !tbaa !10
  %2 = load i64, ptr %arrayidx.i539, align 8, !tbaa !0
  %sub183 = add nsw i64 %2, %0
  %arrayidx213 = getelementptr inbounds i32, ptr %call171, i64 %sub183
  store i32 %1, ptr %arrayidx213, align 4, !tbaa !10
  ret i32 %1
}

define <4 x i32> @"73"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.0649, ptr %arrayidx.i536, i64 %1) {
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

define i32 @"74"(i64 %indvars.iv699, ptr %incdec.ptr4.sink.i.i.i.i569, ptr %__first.addr.015.i.i563, ptr %call171, ptr %arrayidx.i550, i64 %sub.ptr.rhs.cast.i.i.i.i552, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i550, align 8, !tbaa !0
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

define <4 x i32> @"75"(<4 x i32> %0, ptr %init_val, i64 %1, ptr %this, ptr %.omp.lb, i64 %index) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %offset.idx = add i64 %2, %index
  %3 = load ptr, ptr %this, align 8, !tbaa !7
  %4 = getelementptr inbounds i32, ptr %3, i64 %offset.idx
  %5 = load i32, ptr %init_val, align 4, !tbaa !10, !alias.scope !17
  %broadcast.splatinsert21 = insertelement <4 x i32> %0, i32 %5, i64 %1
  %broadcast.splat22 = shufflevector <4 x i32> %broadcast.splatinsert21, <4 x i32> %0, <4 x i32> zeroinitializer
  store <4 x i32> %broadcast.splat22, ptr %4, align 4, !tbaa !10, !alias.scope !20, !noalias !17
  ret <4 x i32> %broadcast.splat22
}

define <4 x i32> @"76"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.1659, ptr %arrayidx.i541, i64 %1) {
bb:
  %2 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %conv198 = sext i32 %2 to i64
  %sub222 = sub nsw i64 %total_missing_inv.1659, %conv198
  %3 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  %4 = add i64 %3, %0
  %5 = sub nsw i64 %4, %sub222
  %6 = getelementptr inbounds i32, ptr %call171, i64 %5
  %7 = getelementptr inbounds i32, ptr %6, i64 %1
  %wide.load803 = load <4 x i32>, ptr %7, align 4, !tbaa !10
  ret <4 x i32> %wide.load803
}

define i32 @"77"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %this, align 8, !tbaa !7
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add7 = add i64 %ind.end, %2
  %add.ptr.1 = getelementptr inbounds i32, ptr %3, i64 %add7
  %6 = load i32, ptr %init_val, align 4, !tbaa !10
  store i32 %6, ptr %add.ptr.1, align 4, !tbaa !10
  ret i32 %6
}

define i64 @"78"(i64 %val.coerce, ptr %new_range.i, ptr %end_size_.i, ptr %this, i64 %0) {
bb:
  %1 = load ptr, ptr %end_size_.i, align 8, !tbaa !41
  %sub.ptr.lhs.cast.i10.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %this, align 8, !tbaa !39
  %sub.ptr.rhs.cast.i11.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i12.i = sub i64 %sub.ptr.lhs.cast.i10.i, %sub.ptr.rhs.cast.i11.i
  %sub.ptr.div.i13.i = ashr exact i64 %sub.ptr.sub.i12.i, %0
  %3 = load ptr, ptr %new_range.i, align 8, !tbaa !16
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div.i13.i
  store i64 %val.coerce, ptr %add.ptr.i, align 4, !tbaa.struct !63
  ret i64 %val.coerce
}

define <8 x i32> @"79"(ptr %el, ptr %.omp.lb, i64 %index, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %offset.idx = add i64 %1, %index
  %2 = add i64 %offset.idx, %0
  %3 = load ptr, ptr %el, align 8, !tbaa !39
  %4 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %2
  %wide.vec44 = load <8 x i32>, ptr %4, align 4
  ret <8 x i32> %wide.vec44
}

define i64 @"80"(ptr %el, i64 %0, i64 %1) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr13.i.i.i.i, i64 %1
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.030.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i32 @"81"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0, i64 %1) {
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

define ptr @"82"(ptr %neighs, ptr %arrayidx.i.prol, ptr %index, ptr %.omp.lb) {
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

define ptr @"83"(ptr %el, ptr %0, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !39
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !41
  ret ptr %add.ptr.i464
}

define ptr @"84"(ptr %neighs, ptr %arrayidx.i.1, ptr %index, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %neighs, align 8, !tbaa !16
  %2 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !0
  %add.ptr.1 = getelementptr inbounds i32, ptr %1, i64 %2
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %4 = sext i32 %3 to i64
  %indvars.iv.next = add nsw i64 %4, %0
  %5 = load ptr, ptr %index, align 8, !tbaa !16
  %arrayidx.1 = getelementptr inbounds ptr, ptr %5, i64 %indvars.iv.next
  store ptr %add.ptr.1, ptr %arrayidx.1, align 8, !tbaa !16
  ret ptr %add.ptr.1
}

define i64 @"85"(ptr %arrayidx.i492.1, ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i492.1, align 8, !tbaa !0
  %3 = load ptr, ptr %offsets, align 8
  %4 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %5 = and i64 %4, %0
  %indvars.iv.next = add nsw i64 %5, %1
  %arrayidx.i493.1 = getelementptr inbounds i64, ptr %3, i64 %indvars.iv.next
  store i64 %2, ptr %arrayidx.i493.1, align 8, !tbaa !0
  ret i64 %2
}

define i32 @"86"(ptr %neighs, ptr %arrayidx.i522) {
bb:
  %0 = load i64, ptr %arrayidx.i522, align 8, !tbaa !0
  %1 = load ptr, ptr %neighs, align 8, !tbaa !16
  %arrayidx112 = getelementptr inbounds i32, ptr %1, i64 %0
  %2 = load i32, ptr %arrayidx112, align 4, !tbaa !10
  ret i32 %2
}

define i64 @"87"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !59
  %inc.i71 = add nuw nsw i64 %1, %0
  %inc.i207 = add nuw nsw i64 %inc.i71, %0
  %inc.i139 = add nuw nsw i64 %inc.i207, %0
  store i64 %inc.i139, ptr %_M_p.i.i.i, align 8, !tbaa !59
  ret i64 %inc.i139
}

define i64 @"88"(ptr %__begin0.sroa.0.060, i64 %0, ptr %cond.i31.i.i.i, ptr %_M_finish.i38, i64 %1, i64 %sub.ptr.rhs.cast.i, i64 %2) {
bb:
  %3 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !37
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %3, i64 %1
  %sub.ptr.lhs.cast.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %2
  %add.ptr.i.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %cond.i31.i.i.i, i64 %sub.ptr.div.i
  %4 = load i64, ptr %__begin0.sroa.0.060, align 4
  %kvp.sroa.5.0.extract.shift = lshr i64 %4, %0
  %retval.sroa.2.0.insert.ext.i = shl i64 %4, %0
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.ext.i, %kvp.sroa.5.0.extract.shift
  store i64 %retval.sroa.0.0.insert.insert.i, ptr %add.ptr.i.i.i, align 4
  ret i64 %retval.sroa.0.0.insert.insert.i
}

define i32 @"89"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add15 = add i64 %ind.end, %2
  %5 = load ptr, ptr %el, align 8, !tbaa !39
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %add15
  %6 = load i32, ptr %add.ptr.1, align 4
  ret i32 %6
}

define i64 @"90"(ptr %arrayidx.i56.epil, i64 %total.074.epil, ptr %call.i3943, ptr %num_blocks) {
bb:
  %0 = load i64, ptr %arrayidx.i56.epil, align 8, !tbaa !0
  %add7.epil = add nsw i64 %0, %total.074.epil
  %1 = load i64, ptr %num_blocks, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds i64, ptr %call.i3943, i64 %1
  store i64 %add7.epil, ptr %arrayidx.i, align 8, !tbaa !0
  ret i64 %add7.epil
}

define i32 @"91"(ptr %retval.1.i.i, i32 %0, ptr %1, i64 %2) {
bb:
  %3 = load ptr, ptr %1, align 8, !tbaa !54
  %retval.1.i.i2 = getelementptr inbounds i8, ptr %3, i64 %2
  %4 = load i32, ptr %retval.1.i.i, align 4, !tbaa !10
  %inc = add nsw i32 %4, %0
  store i32 %inc, ptr %retval.1.i.i, align 4, !tbaa !10
  ret i32 %inc
}

define i64 @"92"(ptr %.omp.lb, i64 %0, i64 %1, ptr %rng) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add10 = add i64 %2, %0
  %rem.i.i.i = and i64 %add10, %1
  store i64 %rem.i.i.i, ptr %rng, align 8, !tbaa !0
  ret i64 %rem.i.i.i
}

define ptr @"93"(ptr %new_range.i.i457, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !39
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !16
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !57
  ret ptr %add.ptr6.i.i478
}

define i64 @"94"(ptr %arrayidx.i, ptr %prefix, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul13 = shl i64 %1, %0
  %2 = load ptr, ptr %prefix, align 8
  %arrayidx.i33 = getelementptr inbounds i64, ptr %2, i64 %mul13
  %3 = load i64, ptr %arrayidx.i, align 8, !tbaa !0
  store i64 %3, ptr %arrayidx.i33, align 8, !tbaa !0
  ret i64 %3
}

define i64 @"95"(ptr %offsets, ptr %num_nodes_.i) {
bb:
  %0 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !8
  %arrayidx.i533 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %0
  %1 = load i64, ptr %arrayidx.i533, align 8, !tbaa !0
  ret i64 %1
}

define i32 @"96"(ptr %num_nodes_.i, i32 %0, ptr %.omp.ub) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !66
  %conv = trunc i64 %1 to i32
  %sub4 = add nsw i32 %conv, %0
  store i32 %sub4, ptr %.omp.ub, align 4, !tbaa !10
  ret i32 %sub4
}

define i64 @"97"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !59
  %inc.i71 = add nuw nsw i64 %2, %1
  %inc.i207 = add nuw nsw i64 %inc.i71, %1
  %arrayidx.i140 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i207
  %3 = load i64, ptr %arrayidx.i140, align 8, !tbaa !0
  ret i64 %3
}

define i64 @"98"(ptr %arrayidx.i18.i, ptr %0, i64 %1, ptr %2) {
bb:
  %3 = load ptr, ptr %arrayidx.i18.i, align 8, !tbaa !16, !noalias !68
  %sub.ptr.lhs.cast.i19.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %0, align 8, !tbaa !16, !noalias !68
  %sub.ptr.rhs.cast.i20.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i21.i = sub i64 %sub.ptr.lhs.cast.i19.i, %sub.ptr.rhs.cast.i20.i
  %sub.ptr.div.i22.i = ashr exact i64 %sub.ptr.sub.i21.i, %1
  %div.i.i = sdiv i64 %sub.ptr.div.i22.i, %1
  store i64 %div.i.i, ptr %2, align 8, !alias.scope !68
  ret i64 %div.i.i
}

define i64 @"99"(ptr %add.ptr.i.i.i.i16, ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i64, ptr %add.ptr.i.i.i.i16, align 4
  %1 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !42
  %2 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !42
  %cmp7.i.i.i.i.i = icmp slt i32 %1, %2
  %cmp.i.i.i.i.i = icmp eq i32 %1, %2
  %3 = load i32, ptr %v3.i.i.i.i.i, align 4
  %4 = load i32, ptr %v.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %4, %3
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr2.i.i.i.i23 = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  store i64 %0, ptr %add.ptr2.i.i.i.i23, align 4
  ret i64 %0
}

define i32 @"100"(ptr %__first.addr.033.i.i, ptr %n_start.0.in, i64 %0) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %1 = load i32, ptr %__first.addr.033.i.i, align 4, !tbaa !10
  store i32 %1, ptr %incdec.ptr12.i.i.i.i, align 4, !tbaa !10
  ret i32 %1
}

define i64 @"101"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !63
  ret i64 %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i
}

define i64 @"102"(ptr %el) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %agg.tmp.sroa.0.0.copyload.i.i.i.i.i = load i64, ptr %.pre, align 4, !tbaa.struct !63
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i.i.i
}

define i32 @"103"(ptr %neighs, ptr %arrayidx.i523) {
bb:
  %0 = load ptr, ptr %neighs, align 8, !tbaa !16
  %1 = load i64, ptr %arrayidx.i523, align 8, !tbaa !0
  %add.ptr = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %add.ptr, align 4, !tbaa !10
  ret i32 %2
}

define i32 @"104"(ptr %n_start.0.in, i64 %0, i64 %1, ptr %diffs, ptr %.omp.lb) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  %incdec.ptr7.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %.pre134 = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %.pre134
  %2 = lshr exact i64 %sub.ptr.sub, %1
  %conv22 = trunc i64 %2 to i32
  %3 = load ptr, ptr %diffs, align 8, !tbaa !7
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %5 = sext i32 %4 to i64
  %arrayidx.i99 = getelementptr inbounds i32, ptr %3, i64 %5
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !10
  ret i32 %conv22
}

define i64 @"105"(ptr %__first.addr.07.i.i.i.i.i.i.i, ptr %cond.i31.i.i.i, ptr %_M_finish.i.i114, i64 %0, i64 %1, ptr %count_vector, i64 %2, i64 %3) {
bb:
  %4 = load i64, ptr %__first.addr.07.i.i.i.i.i.i.i, align 4, !alias.scope !72, !noalias !75
  %5 = load ptr, ptr %count_vector, align 8, !tbaa !16
  %6 = ptrtoint ptr %5 to i64
  %7 = load ptr, ptr %_M_finish.i.i114, align 8, !tbaa !37
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %7, i64 %0
  %8 = ptrtoint ptr %incdec.ptr.i.i to i64
  %9 = add i64 %8, %1
  %10 = sub i64 %9, %6
  %11 = lshr i64 %10, %2
  %12 = add nuw nsw i64 %11, %0
  %n.vec = and i64 %12, %3
  %13 = shl i64 %n.vec, %2
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i, i64 %13
  store i64 %4, ptr %ind.end, align 4, !alias.scope !75, !noalias !72
  ret i64 %4
}

define ptr @"106"(ptr %new_range.i.i457, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !39
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !16
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !57
  ret ptr %add.ptr6.i.i478
}

define ptr @"107"(ptr %cond.i31.i.i.i, i64 %.sroa.speculated.i.i.i.i, ptr %_M_finish.i.i114, i64 %0, ptr %count_vector, i64 %1, i64 %sub.ptr.div.i.i.i.i.i, i1 %cmp9.i.i.i.i, i64 %2, i64 %add.i.i.i.i, ptr %_M_end_of_storage.i.i277) {
bb:
  %3 = load ptr, ptr %count_vector, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i.i.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %_M_finish.i.i114, align 8, !tbaa !37
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %4, i64 %0
  %sub.ptr.lhs.cast.i.i.i.i.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i2 = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, %1
  %add.i.i.i.i4 = add i64 %.sroa.speculated.i.i.i.i, %sub.ptr.div.i.i.i.i.i
  %cmp7.i.i.i.i = icmp ult i64 %add.i.i.i.i, %sub.ptr.div.i.i.i.i.i
  %or.cond.i.i.i.i = or i1 %cmp7.i.i.i.i, %cmp9.i.i.i.i
  %cond.i.i.i.i = select i1 %or.cond.i.i.i.i, i64 %2, i64 %add.i.i.i.i
  %add.ptr19.i.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %cond.i31.i.i.i, i64 %cond.i.i.i.i
  store ptr %add.ptr19.i.i.i, ptr %_M_end_of_storage.i.i277, align 8, !tbaa !71
  ret ptr %add.ptr19.i.i.i
}

define i32 @"108"(ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !42
  %3 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !42
  %cmp7.i.i.i.i.i = icmp slt i32 %2, %3
  %cmp.i.i.i.i.i = icmp eq i32 %2, %3
  %4 = load i32, ptr %v3.i.i.i.i.i, align 4
  %5 = load i32, ptr %v.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %5, %4
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %__parent.020.in.i.i.i.i = add nsw i64 %spec.select.i.i.i, %0
  %__parent.020.i.i.i.i = sdiv i64 %__parent.020.in.i.i.i.i, %1
  %add.ptr.i.i.i.i16 = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %__parent.020.i.i.i.i
  %6 = load i32, ptr %add.ptr.i.i.i.i16, align 4, !tbaa !42
  ret i32 %6
}

define ptr @"109"(ptr %cond.i31, i64 %.sroa.speculated.i, ptr %_M_finish.i.i, ptr %this, i64 %0, i64 %sub.ptr.div.i.i, i1 %cmp9.i, i64 %1, i64 %add.i, ptr %_M_end_of_storage) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !77
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i2 = ashr exact i64 %sub.ptr.sub.i.i, %0
  %add.i4 = add i64 %.sroa.speculated.i, %sub.ptr.div.i.i
  %cmp7.i = icmp ult i64 %add.i, %sub.ptr.div.i.i
  %or.cond.i = or i1 %cmp7.i, %cmp9.i
  %cond.i = select i1 %or.cond.i, i64 %1, i64 %add.i
  %add.ptr19 = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %cond.i
  store ptr %add.ptr19, ptr %_M_end_of_storage, align 8, !tbaa !78
  ret ptr %add.ptr19
}

define i32 @"110"(ptr %__i.sroa.0.042.i.ptr, i64 %0, ptr %second.i.i.i.i.i) {
bb:
  %1 = load i64, ptr %__i.sroa.0.042.i.ptr, align 4
  %__val.sroa.4.0.extract.shift.i = lshr i64 %1, %0
  %__val.sroa.4.0.extract.trunc.i = trunc i64 %__val.sroa.4.0.extract.shift.i to i32
  store i32 %__val.sroa.4.0.extract.trunc.i, ptr %second.i.i.i.i.i, align 4, !tbaa !79
  ret i32 %__val.sroa.4.0.extract.trunc.i
}

define <4 x i32> @"111"(ptr %0, ptr %call171, i64 %tail_index.0660, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %1, i64 %index800, i64 %2) {
bb:
  %wide.load803 = load <4 x i32>, ptr %0, align 4, !tbaa !10
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %.pre731 = sext i32 %.pre717 to i64
  %3 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  %4 = load i64, ptr %arrayidx.i540, align 8, !tbaa !0
  %5 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %conv198 = sext i32 %5 to i64
  %add199 = add nsw i64 %4, %conv198
  %6 = sub i64 %3, %add199
  %n.vec793 = and i64 %6, %1
  %ind.end796 = sub i64 %tail_index.0660, %n.vec793
  %sub226 = sub nsw i64 %ind.end796, %.pre731
  %offset.idx801 = sub i64 %sub226, %index800
  %7 = getelementptr inbounds i32, ptr %call171, i64 %offset.idx801
  %8 = getelementptr inbounds i32, ptr %7, i64 %2
  store <4 x i32> %wide.load803, ptr %8, align 4, !tbaa !10
  ret <4 x i32> %wide.load803
}

define ptr @"112"(ptr %el, i64 %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !41
  ret ptr %add.ptr.i
}

define i32 @"113"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %init_val, align 4, !tbaa !10
  %3 = load ptr, ptr %this, align 8, !tbaa !7
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add.ptr = getelementptr inbounds i32, ptr %3, i64 %ind.end
  store i32 %2, ptr %add.ptr, align 4, !tbaa !10
  ret i32 %2
}

define i8 @"114"(ptr %label) {
bb:
  %0 = load ptr, ptr %label, align 8, !tbaa !35, !noalias !81
  %1 = load i8, ptr %0, align 1, !tbaa !22
  ret i8 %1
}

define i64 @"115"(ptr %__begin0.sroa.0.060, i64 %0, ptr %add.ptr.i.i.i) {
bb:
  %1 = load i64, ptr %__begin0.sroa.0.060, align 4
  %retval.sroa.2.0.insert.ext.i = shl i64 %1, %0
  %kvp.sroa.5.0.extract.shift = lshr i64 %1, %0
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.ext.i, %kvp.sroa.5.0.extract.shift
  store i64 %retval.sroa.0.0.insert.insert.i, ptr %add.ptr.i.i.i, align 4
  ret i64 %retval.sroa.0.0.insert.insert.i
}

define i64 @"116"(ptr %add.ptr.i113, ptr %cond.i31.i.i.i, i64 %sub.ptr.lhs.cast.i.i.i.i.i, ptr %count_vector, i64 %0) {
bb:
  %1 = load i64, ptr %add.ptr.i113, align 4
  %2 = load ptr, ptr %count_vector, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i.i.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, %0
  %add.ptr.i.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %cond.i31.i.i.i, i64 %sub.ptr.div.i.i.i.i.i
  store i64 %1, ptr %add.ptr.i.i.i, align 4
  ret i64 %1
}

define i64 @"117"(ptr %incdec.ptr126.i.i, ptr %el, i64 %0) {
bb:
  %1 = load i64, ptr %incdec.ptr126.i.i, align 4
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr5.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  store i64 %1, ptr %incdec.ptr5.i.i, align 4
  ret i64 %1
}

define ptr @"118"(ptr %index.i139, ptr %0) {
bb:
  %1 = load ptr, ptr %index.i139, align 8, !tbaa !16
  store ptr %1, ptr %0, align 8
  ret ptr %1
}

define i64 @"119"(ptr %arrayidx.i492.prol, ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %2 = and i64 %1, %0
  %3 = load ptr, ptr %offsets, align 8
  %arrayidx.i493.prol = getelementptr inbounds i64, ptr %3, i64 %2
  %4 = load i64, ptr %arrayidx.i492.prol, align 8, !tbaa !0
  store i64 %4, ptr %arrayidx.i493.prol, align 8, !tbaa !0
  ret i64 %4
}

define i64 @"120"(ptr %arrayidx.i492, ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i492, align 8, !tbaa !0
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %4 = and i64 %3, %0
  %arrayidx.i493 = getelementptr inbounds i64, ptr %2, i64 %4
  store i64 %1, ptr %arrayidx.i493, align 8, !tbaa !0
  ret i64 %1
}

define i64 @"121"(ptr %count_vector, ptr %_M_finish.i.i114, i64 %0, i64 %1, i64 %2, i64 %3) {
bb:
  %4 = load ptr, ptr %count_vector, align 8, !tbaa !16
  %5 = load ptr, ptr %_M_finish.i.i114, align 8, !tbaa !37
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %5, i64 %0
  %6 = ptrtoint ptr %incdec.ptr.i.i to i64
  %7 = add i64 %6, %1
  %8 = ptrtoint ptr %4 to i64
  %9 = sub i64 %7, %8
  %10 = lshr i64 %9, %2
  %11 = add nuw nsw i64 %10, %0
  %n.vec = and i64 %11, %3
  %12 = shl i64 %n.vec, %2
  %ind.end280 = getelementptr i8, ptr %4, i64 %12
  %13 = load i64, ptr %ind.end280, align 4, !alias.scope !72, !noalias !75
  ret i64 %13
}

define ptr @"122"(ptr %new_range.i.i457, ptr %0, ptr %el, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !39
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !39
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !16
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !57
  ret ptr %add.ptr6.i.i478
}

define i64 @"123"(i64 %lsum.034, ptr %arrayidx.i30, ptr %local_sums, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %1 = load ptr, ptr %local_sums, align 8, !tbaa !8
  %arrayidx.i = getelementptr inbounds i64, ptr %1, i64 %0
  %2 = load i32, ptr %arrayidx.i30, align 4, !tbaa !10
  %conv = sext i32 %2 to i64
  %add15 = add nsw i64 %lsum.034, %conv
  store i64 %add15, ptr %arrayidx.i, align 8, !tbaa !0
  ret i64 %add15
}

define i32 @"124"(ptr %call171, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %0, i64 %1, i64 %total_missing_inv.1659) {
bb:
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  %3 = load i64, ptr %arrayidx.i540, align 8, !tbaa !0
  %4 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %conv198 = sext i32 %4 to i64
  %add199 = add nsw i64 %3, %conv198
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

define i64 @"125"(ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, i64 %2, ptr %num_blocks) {
bb:
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !4
  %sub.ptr.lhs.cast.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %degrees, align 8, !tbaa !7
  %sub.ptr.rhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %sub = add nsw i64 %sub.ptr.div.i, %1
  %div36 = lshr i64 %sub, %2
  store i64 %div36, ptr %num_blocks, align 8, !tbaa !0
  ret i64 %div36
}

define i64 @"126"(ptr %arrayidx, ptr %new_range, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %1 = load ptr, ptr %new_range, align 8, !tbaa !16
  %arrayidx7 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %0
  %2 = load i64, ptr %arrayidx, align 4
  store i64 %2, ptr %arrayidx7, align 4
  ret i64 %2
}

define <4 x i32> @"127"(ptr %gep, <4 x i32> %0, <2 x i32> %1, ptr %gep123) {
bb:
  %wide.vec = load <4 x i32>, ptr %gep, align 4, !tbaa !10
  %strided.vec = shufflevector <4 x i32> %wide.vec, <4 x i32> %0, <2 x i32> <i32 0, i32 2>
  %reverse = shufflevector <2 x i32> %strided.vec, <2 x i32> %1, <2 x i32> <i32 1, i32 0>
  %reverse117 = shufflevector <2 x i32> %reverse, <2 x i32> %1, <2 x i32> <i32 1, i32 0>
  %strided.vec115 = shufflevector <4 x i32> %wide.vec, <4 x i32> %0, <2 x i32> <i32 1, i32 3>
  %reverse116 = shufflevector <2 x i32> %strided.vec115, <2 x i32> %1, <2 x i32> <i32 1, i32 0>
  %reverse118 = shufflevector <2 x i32> %reverse116, <2 x i32> %1, <2 x i32> <i32 1, i32 0>
  %interleaved.vec = shufflevector <2 x i32> %reverse117, <2 x i32> %reverse118, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x i32> %interleaved.vec, ptr %gep123, align 4, !tbaa !10
  ret <4 x i32> %interleaved.vec
}

define i32 @"128"(ptr %n_start.0.in, i64 %0) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %1 = load i32, ptr %incdec.ptr12.i.i.i.i, align 4, !tbaa !10
  ret i32 %1
}

define ptr @"129"(ptr %new_range.i.i457, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !16
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !39
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !41
  ret ptr %add.ptr.i464
}

define i64 @"130"(ptr %num_edges_, i64 %0, i64 %1, i64 %2, ptr %.omp.ub) {
bb:
  %3 = load i64, ptr %num_edges_, align 8, !tbaa !84
  %sub3 = add nuw i64 %3, %0
  %div36 = lshr i64 %sub3, %1
  %sub4 = add nsw i64 %div36, %2
  store i64 %sub4, ptr %.omp.ub, align 8, !tbaa !0
  ret i64 %sub4
}

define i32 @"131"(ptr %__i.sroa.0.042.i.ptr, ptr %__first.coerce) {
bb:
  %0 = load i64, ptr %__i.sroa.0.042.i.ptr, align 4
  %__val.sroa.0.0.extract.trunc.i = trunc i64 %0 to i32
  store i32 %__val.sroa.0.0.extract.trunc.i, ptr %__first.coerce, align 4, !tbaa !86
  ret i32 %__val.sroa.0.0.extract.trunc.i
}

define i32 @"132"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %2 = load ptr, ptr %el, align 8, !tbaa !39
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %1
  %add.ptr.sroa_idx = getelementptr inbounds i8, ptr %add.ptr, i64 %0
  %3 = load i32, ptr %add.ptr.sroa_idx, align 4
  ret i32 %3
}

define i8 @"133"(ptr %0, ptr %opt_arg) {
bb:
  %1 = load i8, ptr %0, align 8, !tbaa !22
  %2 = load ptr, ptr %opt_arg, align 8, !tbaa !35
  store i8 %1, ptr %2, align 1, !tbaa !22
  ret i8 %1
}

define i64 @"135"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %2) {
bb:
  %3 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !41
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %agg.result, align 8, !tbaa !39
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = ashr exact i64 %sub.ptr.sub.i12.i.i, %2
  %5 = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %add.ptr.i.i149 = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %sub.ptr.div.i13.i.i
  %6 = load i32, ptr %v, align 4, !tbaa !61
  %sub = add nsw i32 %6, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %add.ptr.i.i149, align 4, !tbaa.struct !63
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"136"(ptr %call171, ptr %0, ptr %arrayidx.i546) {
bb:
  %1 = load i32, ptr %arrayidx.i546, align 4, !tbaa !10
  %conv246 = sext i32 %1 to i64
  %.pre718 = load i64, ptr %0, align 8, !tbaa !0
  %add247 = add nsw i64 %.pre718, %conv246
  %arrayidx257 = getelementptr inbounds i32, ptr %call171, i64 %add247
  %2 = load i32, ptr %arrayidx257, align 4, !tbaa !10
  ret i32 %2
}

define i64 @"137"(ptr %offsets, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !8
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %3 = sext i32 %2 to i64
  %indvars.iv.next = add nsw i64 %3, %0
  %arrayidx.i.1 = getelementptr inbounds i64, ptr %1, i64 %indvars.iv.next
  %4 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !0
  ret i64 %4
}

define i64 @"138"(ptr %__first.addr.033.i.i, ptr %el, i64 %0) {
bb:
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.033.i.i, align 4
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  store i64 %agg.tmp.sroa.0.0.copyload.i.i.i, ptr %incdec.ptr13.i.i.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define <2 x i64> @"139"(ptr %0, <2 x i64> %1, <2 x i64> %vector.recur90, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %7) {
bb:
  %wide.load91 = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %8 = and <2 x i64> %wide.load91, %1
  %9 = shufflevector <2 x i64> %vector.recur90, <2 x i64> %wide.load91, <2 x i32> <i32 1, i32 2>
  %10 = and <2 x i64> %9, %2
  %11 = or <2 x i64> %8, %10
  %12 = lshr exact <2 x i64> %11, %3
  %wide.load92 = load <2 x i64>, ptr %4, align 8, !tbaa !0
  %13 = xor <2 x i64> %12, %wide.load92
  %14 = and <2 x i64> %wide.load91, %3
  %15 = icmp eq <2 x i64> %14, %5
  %16 = select <2 x i1> %15, <2 x i64> %5, <2 x i64> %6
  %17 = xor <2 x i64> %13, %16
  store <2 x i64> %17, ptr %7, align 8, !tbaa !0
  ret <2 x i64> %17
}

define ptr @"140"(ptr %new_range.i.i457, ptr %0, ptr %el, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !16
  %2 = load ptr, ptr %el, align 8, !tbaa !39
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !39
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !41
  ret ptr %add.ptr.i464
}

define ptr @"141"(ptr %_M_before_begin.i.i.i) {
bb:
  %.pre = load ptr, ptr %_M_before_begin.i.i.i, align 8, !tbaa !49
  %0 = load ptr, ptr %.pre, align 8, !tbaa !54
  ret ptr %0
}

define i32 @"142"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %5 = load ptr, ptr %el, align 8, !tbaa !39
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %ind.end
  %add.ptr.sroa_idx = getelementptr inbounds i8, ptr %add.ptr, i64 %2
  %6 = load i32, ptr %add.ptr.sroa_idx, align 4
  ret i32 %6
}

define ptr @"143"(ptr %cond.i31.i.i.i, i64 %.sroa.speculated.i.i.i.i, ptr %_M_finish.i38, i64 %0, i64 %sub.ptr.rhs.cast.i, i64 %1, i64 %sub.ptr.div.i, i1 %cmp9.i.i.i.i, i64 %2, i64 %add.i.i.i.i, ptr %_M_end_of_storage.i.i) {
bb:
  %3 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !37
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %3, i64 %0
  %sub.ptr.lhs.cast.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i2 = ashr exact i64 %sub.ptr.sub.i, %1
  %add.i.i.i.i4 = add i64 %.sroa.speculated.i.i.i.i, %sub.ptr.div.i
  %cmp7.i.i.i.i = icmp ult i64 %add.i.i.i.i, %sub.ptr.div.i
  %or.cond.i.i.i.i = or i1 %cmp7.i.i.i.i, %cmp9.i.i.i.i
  %cond.i.i.i.i = select i1 %or.cond.i.i.i.i, i64 %2, i64 %add.i.i.i.i
  %add.ptr19.i.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %cond.i31.i.i.i, i64 %cond.i.i.i.i
  store ptr %add.ptr19.i.i.i, ptr %_M_end_of_storage.i.i, align 8, !tbaa !71
  ret ptr %add.ptr19.i.i.i
}

define i64 @"144"(ptr %arrayidx.i208, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i211, i64 %4, i64 %5, i64 %xor4.i214, i64 %6, i64 %xor7.i217, ptr %num_nodes_, i64 %7, ptr %arrayidx.i72, i64 %xor.i75, i64 %xor4.i78, i64 %xor7.i81, i32 %8, ptr %el, ptr %.omp.lb) {
bb:
  %9 = load i64, ptr %arrayidx.i72, align 8, !tbaa !0
  %shr.i73 = lshr i64 %9, %0
  %and.i74 = and i64 %shr.i73, %1
  %xor.i752 = xor i64 %and.i74, %9
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
  %10 = load i64, ptr %num_nodes_, align 8, !tbaa !87
  %11 = trunc i64 %10 to i32
  %12 = load i64, ptr %arrayidx.i208, align 8, !tbaa !0
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
  %rem.i52 = urem i32 %conv.i42, %8
  %ref.tmp16.sroa.4.0.insert.ext = zext i32 %rem.i52 to i64
  %ref.tmp16.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp16.sroa.4.0.insert.ext, %7
  %ref.tmp16.sroa.0.0.insert.insert = or i64 %ref.tmp16.sroa.4.0.insert.shift, %ref.tmp16.sroa.0.0.insert.ext
  %13 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul = shl i64 %13, %6
  %14 = load ptr, ptr %el, align 8, !tbaa !39
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %14, i64 %mul
  store i64 %ref.tmp16.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp16.sroa.0.0.insert.insert
}

define i32 @"145"(ptr %e.sroa.5.0..sroa_idx, ptr %0, ptr %offsets, ptr %add.ptr, i64 %1) {
bb:
  %e.sroa.5.0.copyload = load i32, ptr %e.sroa.5.0..sroa_idx, align 4, !tbaa.struct !64
  %2 = load ptr, ptr %0, align 8, !tbaa !16
  %3 = load ptr, ptr %offsets, align 8, !tbaa !8
  %e.sroa.0.0.copyload = load i32, ptr %add.ptr, align 4, !tbaa.struct !63
  %conv = sext i32 %e.sroa.0.0.copyload to i64
  %arrayidx.i = getelementptr inbounds i64, ptr %3, i64 %conv
  %4 = atomicrmw add ptr %arrayidx.i, i64 %1 seq_cst, align 8
  %arrayidx = getelementptr inbounds i32, ptr %2, i64 %4
  store i32 %e.sroa.5.0.copyload, ptr %arrayidx, align 4, !tbaa !10
  ret i32 %e.sroa.5.0.copyload
}

define i64 @"146"(ptr %offsets, ptr %num_nodes_.i, i32 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !8
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %3 = trunc i64 %2 to i32
  %n184.0657 = add i32 %3, %0
  %4 = zext i32 %n184.0657 to i64
  %arrayidx.i540 = getelementptr inbounds i64, ptr %1, i64 %4
  %5 = load i64, ptr %arrayidx.i540, align 8, !tbaa !0
  ret i64 %5
}

define i64 @"147"(ptr %_M_string_length.i.i.i, i64 %call, ptr %__dnew.i.i.i) {
bb:
  %0 = load i64, ptr %_M_string_length.i.i.i, align 8, !tbaa !58, !noalias !88
  %sub.i.i.i = sub i64 %0, %call
  store i64 %sub.i.i.i, ptr %__dnew.i.i.i, align 8, !tbaa !0, !noalias !88
  ret i64 %sub.i.i.i
}

define i64 @"148"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %sext = shl i64 %1, %0
  %conv202 = ashr exact i64 %sext, %0
  %2 = load ptr, ptr %offsets, align 8, !tbaa !8
  %arrayidx.i542 = getelementptr inbounds i64, ptr %2, i64 %conv202
  %3 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  ret i64 %3
}

define i64 @"149"(ptr %el, i64 %0, i64 %1) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr13.i.i.i.i, i64 %1
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.030.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i32 @"150"(ptr %call171, ptr %arrayidx.i548, ptr %arrayidx.i549, ptr %arrayidx.i550, i64 %sub.ptr.rhs.cast.i.i.i.i552, i64 %0, i64 %1) {
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

define i32 @"151"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr122.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %1 = load i32, ptr %incdec.ptr122.i.i, align 4, !tbaa !42
  ret i32 %1
}

define ptr @"154"(ptr %sample_counts, ptr %arrayidx.i, ptr %_M_bucket_count.i.i.i) {
bb:
  %0 = load i64, ptr %_M_bucket_count.i.i.i, align 8
  %1 = load i32, ptr %arrayidx.i, align 4, !tbaa !10
  %conv.i.i.i.i = sext i32 %1 to i64
  %rem.i.i.i.i.i = urem i64 %conv.i.i.i.i, %0
  %2 = load ptr, ptr %sample_counts, align 8, !tbaa !91
  %arrayidx.i.i.i.i = getelementptr inbounds ptr, ptr %2, i64 %rem.i.i.i.i.i
  %3 = load ptr, ptr %arrayidx.i.i.i.i, align 8, !tbaa !16
  ret ptr %3
}

define i32 @"155"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !10
  %1 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !10
  %cmp.i.i.i.i.i = icmp slt i32 %0, %1
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add.ptr3.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i.i.i.i
  %2 = load i32, ptr %add.ptr3.i.i.i.i, align 4, !tbaa !10
  ret i32 %2
}

define i32 @"156"(ptr %n_start.0.in, i64 %0, i64 %1) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds i32, ptr %incdec.ptr12.i.i.i.i, i64 %1
  %2 = load i32, ptr %__first.addr.030.i.i, align 4, !tbaa !10
  ret i32 %2
}

define ptr @"157"(ptr %__node, ptr %this, ptr %add.ptr.i, ptr %_M_bucket_count) {
bb:
  %0 = load i32, ptr %add.ptr.i, align 4, !tbaa !10
  %conv.i.i.i.i.i = sext i32 %0 to i64
  %1 = load i64, ptr %_M_bucket_count, align 8, !tbaa !92
  %rem.i.i.i.i = urem i64 %conv.i.i.i.i.i, %1
  %2 = load ptr, ptr %this, align 8, !tbaa !91
  %arrayidx17.i = getelementptr inbounds ptr, ptr %2, i64 %rem.i.i.i.i
  store ptr %__node, ptr %arrayidx17.i, align 8, !tbaa !16
  ret ptr %__node
}

define <2 x i64> @"158"(ptr %0, <2 x i64> %1, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %7) {
bb:
  %wide.load = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %8 = and <2 x i64> %wide.load, %3
  %9 = icmp eq <2 x i64> %8, %5
  %10 = select <2 x i1> %9, <2 x i64> %5, <2 x i64> %6
  %wide.load18 = load <2 x i64>, ptr %4, align 8, !tbaa !0
  %11 = and <2 x i64> %wide.load, %1
  %12 = shufflevector <2 x i64> %wide.load, <2 x i64> %wide.load, <2 x i32> <i32 1, i32 2>
  %13 = and <2 x i64> %12, %2
  %14 = or <2 x i64> %11, %13
  %15 = lshr exact <2 x i64> %14, %3
  %16 = xor <2 x i64> %15, %wide.load18
  %17 = xor <2 x i64> %16, %10
  store <2 x i64> %17, ptr %7, align 8, !tbaa !0
  ret <2 x i64> %17
}

define i64 @"159"(ptr %add.ptr.i113, ptr %cond.i31.i.i.i, i64 %0, ptr %count_vector, i64 %1, i64 %2, i64 %3) {
bb:
  %4 = load ptr, ptr %count_vector, align 8, !tbaa !16
  %5 = ptrtoint ptr %4 to i64
  %6 = sub i64 %0, %5
  %7 = lshr i64 %6, %1
  %8 = add nuw nsw i64 %7, %2
  %n.vec = and i64 %8, %3
  %9 = shl i64 %n.vec, %1
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i, i64 %9
  %incdec.ptr.i.i.i = getelementptr %"struct.std::pair.18", ptr %ind.end, i64 %2
  %10 = load i64, ptr %add.ptr.i113, align 4
  store i64 %10, ptr %incdec.ptr.i.i.i, align 4
  ret i64 %10
}

define i64 @"160"(ptr %__begin0.sroa.0.060, i64 %0, ptr %_M_finish.i38, i64 %1) {
bb:
  %2 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !37
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %2, i64 %1
  %3 = load i64, ptr %__begin0.sroa.0.060, align 4
  %kvp.sroa.5.0.extract.shift = lshr i64 %3, %0
  %retval.sroa.2.0.insert.ext.i = shl i64 %3, %0
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.ext.i, %kvp.sroa.5.0.extract.shift
  store i64 %retval.sroa.0.0.insert.insert.i, ptr %incdec.ptr.i.i, align 4
  ret i64 %retval.sroa.0.0.insert.insert.i
}

define i64 @"161"(ptr %__first.addr.033.i.i, ptr %el, i64 %0) {
bb:
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.033.i.i, align 4
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  store i64 %agg.tmp.sroa.0.0.copyload.i.i.i, ptr %incdec.ptr13.i.i.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i8 @"162"(i8 %0, ptr %ref.tmp, ptr %__dnew.i.i.i) {
bb:
  %1 = load i64, ptr %__dnew.i.i.i, align 8, !tbaa !0, !noalias !81
  %2 = load ptr, ptr %ref.tmp, align 8, !tbaa !35, !alias.scope !81
  %arrayidx.i.i.i.i = getelementptr inbounds i8, ptr %2, i64 %1
  store i8 %0, ptr %arrayidx.i.i.i.i, align 1, !tbaa !22
  ret i8 %0
}

define i32 @"163"(ptr %__first, ptr %add.ptr.i, ptr %add.ptr2.i, i64 %sub1.i, i64 %mul.i, i64 %0, i64 %1) {
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

define i64 @"164"(ptr %arrayidx.i535, i64 %total_missing_inv.0649, ptr %offsets, i64 %indvars.iv691) {
bb:
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !8
  %arrayidx.i5352 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %indvars.iv691
  %0 = load i64, ptr %arrayidx.i535, align 8, !tbaa !0
  %add152 = add nsw i64 %0, %total_missing_inv.0649
  store i64 %add152, ptr %arrayidx.i535, align 8, !tbaa !0
  ret i64 %add152
}

define i64 @"165"(ptr %arrayidx.i25, i64 %0, ptr %arrayidx.i23, ptr %el, ptr %.omp.lb) {
bb:
  %1 = load i32, ptr %arrayidx.i25, align 4, !tbaa !10
  %ref.tmp.sroa.4.0.insert.ext = zext i32 %1 to i64
  %ref.tmp.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp.sroa.4.0.insert.ext, %0
  %2 = load i32, ptr %arrayidx.i23, align 4, !tbaa !10
  %ref.tmp.sroa.0.0.insert.ext = zext i32 %2 to i64
  %ref.tmp.sroa.0.0.insert.insert = or i64 %ref.tmp.sroa.4.0.insert.shift, %ref.tmp.sroa.0.0.insert.ext
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %4 = load ptr, ptr %el, align 8, !tbaa !39
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %4, i64 %3
  store i64 %ref.tmp.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp.sroa.0.0.insert.insert
}

define i64 @"166"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %2 = and i64 %1, %0
  %sub.prol = add nuw i64 %2, %0
  %conv34.prol = and i64 %sub.prol, %0
  %3 = load ptr, ptr %offsets, align 8
  %arrayidx.i492.prol = getelementptr inbounds i64, ptr %3, i64 %conv34.prol
  %4 = load i64, ptr %arrayidx.i492.prol, align 8, !tbaa !0
  ret i64 %4
}

define ptr @"167"(ptr %el, ptr %0, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !39
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !41
  ret ptr %add.ptr.i464
}

define i64 @"168"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !59
  %inc.i71 = add nuw nsw i64 %1, %0
  %inc.i207 = add nuw nsw i64 %inc.i71, %0
  store i64 %inc.i207, ptr %_M_p.i.i.i, align 8, !tbaa !59
  ret i64 %inc.i207
}

define i32 @"169"(ptr %end_size_.i.i583, ptr %offsets, i64 %0, ptr %length.i581) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !8
  %sub.ptr.rhs.cast.i.i585 = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %end_size_.i.i583, align 8, !tbaa !65
  %sub.ptr.lhs.cast.i.i584 = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i586 = sub i64 %sub.ptr.lhs.cast.i.i584, %sub.ptr.rhs.cast.i.i585
  %3 = lshr exact i64 %sub.ptr.sub.i.i586, %0
  %conv.i587 = trunc i64 %3 to i32
  store i32 %conv.i587, ptr %length.i581, align 4, !tbaa !10
  ret i32 %conv.i587
}

define <2 x i32> @"170"(ptr %degrees, ptr %.omp.lb, i64 %0, i64 %index, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul12 = shl i64 %2, %0
  %offset.idx = add i64 %mul12, %index
  %3 = load ptr, ptr %degrees, align 8, !tbaa !7
  %4 = getelementptr inbounds i32, ptr %3, i64 %offset.idx
  %5 = getelementptr inbounds i32, ptr %4, i64 %1
  %wide.load40 = load <2 x i32>, ptr %5, align 4, !tbaa !10
  ret <2 x i32> %wide.load40
}

define i32 @"171"(i32 %conv22, ptr %diffs, i64 %indvars.iv) {
bb:
  %0 = load ptr, ptr %diffs, align 8, !tbaa !7
  %arrayidx.i99 = getelementptr inbounds i32, ptr %0, i64 %indvars.iv
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !10
  ret i32 %conv22
}

define i32 @"172"(ptr %_M_finish.i38, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !37
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %2, i64 %0
  %add.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %incdec.ptr.i.i, i64 %1
  %3 = load i32, ptr %add.ptr.i.i, align 4, !tbaa !86
  ret i32 %3
}

define ptr @"173"(ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %0) {
bb:
  %1 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !41
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %agg.result, align 8, !tbaa !39
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = ashr exact i64 %sub.ptr.sub.i12.i.i, %0
  %3 = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %add.ptr.i.i149 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div.i13.i.i
  store ptr %add.ptr.i.i149, ptr %end_size_.i.i, align 8, !tbaa !41
  ret ptr %add.ptr.i.i149
}

define i64 @"174"(ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %__i.018.i, i64 %add.i, i64 %inc.i, ptr %arrayidx7.i.1) {
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

define ptr @"175"(ptr %retval.0.i, ptr %add.ptr, i64 %__bkt_count) {
bb:
  %0 = load i32, ptr %add.ptr, align 4, !tbaa !10
  %conv.i.i.i = sext i32 %0 to i64
  %rem.i.i = urem i64 %conv.i.i.i, %__bkt_count
  %arrayidx = getelementptr inbounds ptr, ptr %retval.0.i, i64 %rem.i.i
  %1 = load ptr, ptr %arrayidx, align 8, !tbaa !16
  ret ptr %1
}

define ptr @"176"(ptr %new_range.i.i, ptr %end_capacity_.i.i, ptr %agg.result, i64 %0) {
bb:
  %1 = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %2 = load ptr, ptr %agg.result, align 8, !tbaa !39
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %end_capacity_.i.i, align 8, !tbaa !57
  %sub.ptr.lhs.cast.i7.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i9.i = sub i64 %sub.ptr.lhs.cast.i7.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.sub.i9.fr.i = freeze i64 %sub.ptr.sub.i9.i
  %mul.i = ashr exact i64 %sub.ptr.sub.i9.fr.i, %0
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %mul.i
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i, align 8, !tbaa !57
  ret ptr %add.ptr6.i.i
}

define i64 @"177"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i = load i64, ptr %incdec.ptr.i.i.i.i, align 4, !tbaa.struct !63
  ret i64 %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i
}

define i64 @"178"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %2) {
bb:
  %3 = load i32, ptr %v, align 4, !tbaa !61
  %sub = add nsw i32 %3, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %2, align 4, !tbaa.struct !63
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define <8 x i32> @"179"(ptr %el, ptr %.omp.lb, i64 %index) {
bb:
  %0 = load ptr, ptr %el, align 8, !tbaa !39
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %offset.idx = add i64 %1, %index
  %2 = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %offset.idx
  %wide.vec = load <8 x i32>, ptr %2, align 4
  ret <8 x i32> %wide.vec
}

define i32 @"180"(ptr %el, i64 %.omp.iv.040.ph, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !39
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %.omp.iv.040.ph
  %add.ptr.sroa_idx.prol = getelementptr inbounds i8, ptr %add.ptr.prol, i64 %0
  %2 = load i32, ptr %add.ptr.sroa_idx.prol, align 4
  ret i32 %2
}

define i64 @"181"(ptr %call.i248, ptr %label_source_pair.sroa.5.0.call42.sroa_idx, i64 %0) {
bb:
  %label_source_pair.sroa.5.0.copyload = load i32, ptr %label_source_pair.sroa.5.0.call42.sroa_idx, align 4
  %conv45 = sext i32 %label_source_pair.sroa.5.0.copyload to i64
  %div1.i.i = lshr i64 %conv45, %0
  %arrayidx.i263 = getelementptr inbounds i64, ptr %call.i248, i64 %div1.i.i
  %1 = load i64, ptr %arrayidx.i263, align 8, !tbaa !0
  ret i64 %1
}

define i32 @"182"(ptr %init_val, ptr %this, i64 %.omp.iv.018.prol) {
bb:
  %0 = load ptr, ptr %this, align 8, !tbaa !7
  %add.ptr.prol = getelementptr inbounds i32, ptr %0, i64 %.omp.iv.018.prol
  %1 = load i32, ptr %init_val, align 4, !tbaa !10
  store i32 %1, ptr %add.ptr.prol, align 4, !tbaa !10
  ret i32 %1
}

define i32 @"183"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %3 = sub i64 %0, %2
  %n.vec = and i64 %3, %1
  %ind.end = add i64 %2, %n.vec
  %4 = load ptr, ptr %el, align 8, !tbaa !39
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %4, i64 %ind.end
  %5 = load i32, ptr %add.ptr, align 4
  ret i32 %5
}

define i64 @"184"(i64 %local_total.038, ptr %arrayidx.i34, ptr %prefix, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul13 = shl i64 %1, %0
  %2 = load ptr, ptr %prefix, align 8
  %arrayidx.i33 = getelementptr inbounds i64, ptr %2, i64 %mul13
  %3 = load i32, ptr %arrayidx.i34, align 4, !tbaa !10
  %conv = sext i32 %3 to i64
  %add18 = add nsw i64 %local_total.038, %conv
  store i64 %add18, ptr %arrayidx.i33, align 8, !tbaa !0
  ret i64 %add18
}

define i32 @"185"(ptr %comp, ptr %arrayidx.i) {
bb:
  %arrayidx.i.promoted = load i32, ptr %arrayidx.i, align 4, !tbaa !10
  %conv1139 = sext i32 %arrayidx.i.promoted to i64
  %0 = load ptr, ptr %comp, align 8, !tbaa !7, !llvm.access.group !36
  %arrayidx.i3540 = getelementptr inbounds i32, ptr %0, i64 %conv1139
  %1 = load i32, ptr %arrayidx.i3540, align 4, !tbaa !10, !llvm.access.group !36
  ret i32 %1
}

define ptr @"186"(ptr %neighs, ptr %arrayidx.i, ptr %index, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %neighs, align 8, !tbaa !16
  %1 = load i64, ptr %arrayidx.i, align 8, !tbaa !0
  %add.ptr = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %3 = sext i32 %2 to i64
  %4 = load ptr, ptr %index, align 8, !tbaa !16
  %arrayidx = getelementptr inbounds ptr, ptr %4, i64 %3
  store ptr %add.ptr, ptr %arrayidx, align 8, !tbaa !16
  ret ptr %add.ptr
}

define i8 @"187"(ptr %arrayidx17.i.i, ptr %ref.tmp, i64 %conv5.i) {
bb:
  %0 = load ptr, ptr %ref.tmp, align 8, !tbaa !35, !alias.scope !93
  %arrayidx.i.i = getelementptr inbounds i8, ptr %0, i64 %conv5.i
  %1 = load i8, ptr %arrayidx17.i.i, align 2, !tbaa !22, !noalias !93
  store i8 %1, ptr %arrayidx.i.i, align 1, !tbaa !22
  ret i8 %1
}

define i64 @"188"(ptr %add.ptr.i113, ptr %_M_finish.i.i114, i64 %0) {
bb:
  %1 = load ptr, ptr %_M_finish.i.i114, align 8, !tbaa !37
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %1, i64 %0
  %2 = load i64, ptr %add.ptr.i113, align 4
  store i64 %2, ptr %incdec.ptr.i.i, align 4
  ret i64 %2
}

define ptr @"189"(ptr %cond.i31.i.i.i, ptr %_M_finish.i.i114, i64 %0, i64 %1, ptr %count_vector, i64 %2, i64 %3) {
bb:
  %4 = load ptr, ptr %_M_finish.i.i114, align 8, !tbaa !37
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %4, i64 %0
  %5 = ptrtoint ptr %incdec.ptr.i.i to i64
  %6 = add i64 %5, %1
  %7 = load ptr, ptr %count_vector, align 8, !tbaa !16
  %8 = ptrtoint ptr %7 to i64
  %9 = sub i64 %6, %8
  %10 = lshr i64 %9, %2
  %11 = add nuw nsw i64 %10, %0
  %n.vec = and i64 %11, %3
  %12 = shl i64 %n.vec, %2
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i, i64 %12
  %incdec.ptr.i.i.i = getelementptr %"struct.std::pair.18", ptr %ind.end, i64 %0
  store ptr %incdec.ptr.i.i.i, ptr %_M_finish.i.i114, align 8, !tbaa !37
  ret ptr %incdec.ptr.i.i.i
}

define i32 @"190"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.0649, ptr %arrayidx.i536) {
bb:
  %1 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  %i200.0 = add nsw i64 %1, %0
  %2 = load i32, ptr %arrayidx.i536, align 4, !tbaa !10
  %conv155 = sext i32 %2 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %sub211 = sub nsw i64 %i200.0, %add156
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %3 = load i32, ptr %arrayidx212, align 4, !tbaa !10
  ret i32 %3
}

define i64 @"191"(ptr %arrayidx.i56.2, ptr %arrayidx.i56.1, ptr %arrayidx.i56, i64 %total.074, ptr %arrayidx.i55.3) {
bb:
  %0 = load i64, ptr %arrayidx.i56, align 8, !tbaa !0
  %add7 = add nsw i64 %0, %total.074
  %1 = load i64, ptr %arrayidx.i56.1, align 8, !tbaa !0
  %add7.1 = add nsw i64 %1, %add7
  %2 = load i64, ptr %arrayidx.i56.2, align 8, !tbaa !0
  %add7.2 = add nsw i64 %2, %add7.1
  store i64 %add7.2, ptr %arrayidx.i55.3, align 8, !tbaa !0
  ret i64 %add7.2
}

define i64 @"192"(ptr %arrayidx.i535, i64 %total_missing_inv.0649, ptr %arrayidx.i536, ptr %offsets, i64 %indvars.iv691) {
bb:
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !8
  %arrayidx.i5352 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %indvars.iv691
  %0 = load i32, ptr %arrayidx.i536, align 4, !tbaa !10
  %conv155 = sext i32 %0 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %1 = load i64, ptr %arrayidx.i535, align 8, !tbaa !0
  %add152 = add nsw i64 %1, %add156
  store i64 %add152, ptr %arrayidx.i535, align 8, !tbaa !0
  ret i64 %add152
}

define ptr @"193"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %2 = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !57
  ret ptr %add.ptr6.i.i
}

define ptr @"194"(ptr %this, i64 %__code, ptr %_M_bucket_count) {
bb:
  %0 = load i64, ptr %_M_bucket_count, align 8, !tbaa !92
  %rem.i.i.i = urem i64 %__code, %0
  %1 = load ptr, ptr %this, align 8, !tbaa !91
  %arrayidx.i = getelementptr inbounds ptr, ptr %1, i64 %rem.i.i.i
  %2 = load ptr, ptr %arrayidx.i, align 8, !tbaa !16
  ret ptr %2
}

define ptr @"195"(ptr %neighs, ptr %arrayidx.i.1, ptr %index, i64 %indvars.iv.next) {
bb:
  %0 = load ptr, ptr %neighs, align 8, !tbaa !16
  %1 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !0
  %add.ptr.1 = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load ptr, ptr %index, align 8, !tbaa !16
  %arrayidx.1 = getelementptr inbounds ptr, ptr %2, i64 %indvars.iv.next
  store ptr %add.ptr.1, ptr %arrayidx.1, align 8, !tbaa !16
  ret ptr %add.ptr.1
}

define i32 @"196"(ptr %comp, ptr %arrayidx.i33, i32 %cond, ptr %arrayidx.i37) {
bb:
  %0 = load ptr, ptr %comp, align 8, !tbaa !7
  %p1.0 = load i32, ptr %arrayidx.i37, align 4, !tbaa !10
  %p2.048 = load i32, ptr %arrayidx.i33, align 4, !tbaa !10
  %sub = sub nsw i32 %p2.048, %cond
  %add = add nsw i32 %sub, %p1.0
  %conv15 = sext i32 %add to i64
  %arrayidx.i38 = getelementptr inbounds i32, ptr %0, i64 %conv15
  %p2.0 = load i32, ptr %arrayidx.i38, align 4, !tbaa !10
  ret i32 %p2.0
}

define ptr @"197"(ptr %__p.044, ptr %arrayidx) {
bb:
  %0 = load ptr, ptr %arrayidx, align 8, !tbaa !16
  %1 = load ptr, ptr %__p.044, align 8, !tbaa !54
  store ptr %1, ptr %0, align 8, !tbaa !16
  ret ptr %1
}

define i32 @"198"(ptr %0, ptr %1, ptr %2, ptr %_M_before_begin.i.i.i, i64 %3) {
bb:
  %call5.val.i.i.i = load i32, ptr %1, align 4, !tbaa !96
  %call.val.i.i.i = load i32, ptr %0, align 4, !tbaa !96
  %cmp.i.i.i.i = icmp slt i32 %call.val.i.i.i, %call5.val.i.i.i
  %4 = load ptr, ptr %2, align 8, !tbaa !54
  %5 = load ptr, ptr %_M_before_begin.i.i.i, align 8, !tbaa !49, !nonnull !15, !noundef !15
  %spec.select.i.i = select i1 %cmp.i.i.i.i, ptr %4, ptr %5
  %second = getelementptr inbounds i8, ptr %spec.select.i.i, i64 %3
  %6 = load i32, ptr %second, align 4, !tbaa !96
  ret i32 %6
}

define i32 @"199"(ptr %end_size_.i, ptr %comp, i64 %0, i32 %1, ptr %_M_b.i.i) {
bb:
  %2 = load ptr, ptr %comp, align 8, !tbaa !7
  %sub.ptr.rhs.cast.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !4
  %sub.ptr.lhs.cast.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %4 = lshr exact i64 %sub.ptr.sub.i, %0
  %5 = trunc i64 %4 to i32
  %conv = add i32 %5, %1
  store i32 %conv, ptr %_M_b.i.i, align 4, !tbaa !98
  ret i32 %conv
}

define i32 @"200"(ptr %arrayidx212, ptr %call171, i64 %tail_index.0660, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %0) {
bb:
  %1 = load i32, ptr %arrayidx212, align 4, !tbaa !10
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %.pre731 = sext i32 %.pre717 to i64
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !0
  %3 = load i64, ptr %arrayidx.i540, align 8, !tbaa !0
  %4 = load i32, ptr %arrayidx.i541, align 4, !tbaa !10
  %conv198 = sext i32 %4 to i64
  %add199 = add nsw i64 %3, %conv198
  %5 = sub i64 %2, %add199
  %n.vec793 = and i64 %5, %0
  %ind.end796 = sub i64 %tail_index.0660, %n.vec793
  %sub226 = sub nsw i64 %ind.end796, %.pre731
  %arrayidx213 = getelementptr inbounds i32, ptr %call171, i64 %sub226
  store i32 %1, ptr %arrayidx213, align 4, !tbaa !10
  ret i32 %1
}

define i32 @"201"(ptr %comp, i64 %conv4) {
bb:
  %.pre = load ptr, ptr %comp, align 8, !tbaa !7
  %arrayidx.i34 = getelementptr inbounds i32, ptr %.pre, i64 %conv4
  %0 = load i32, ptr %arrayidx.i34, align 4, !tbaa !10
  ret i32 %0
}

define i32 @"202"(ptr %comp, i64 %conv4) {
bb:
  %0 = load ptr, ptr %comp, align 8, !tbaa !7
  %arrayidx.i34 = getelementptr inbounds i32, ptr %0, i64 %conv4
  %1 = load i32, ptr %arrayidx.i34, align 4, !tbaa !10
  ret i32 %1
}

define <2 x i64> @"203"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %.omp.lb, i64 %3, i64 %4, i64 %5, <2 x i64> %6, <2 x i64> %7, ptr %8, <2 x i64> %9, <2 x i64> %10, ptr %11) {
bb:
  %wide.load91 = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %12 = and <2 x i64> %wide.load91, %1
  %13 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add8 = add i64 %13, %3
  %rem.i.i.i = and i64 %add8, %4
  %vector.recur.init89 = insertelement <2 x i64> %2, i64 %rem.i.i.i, i64 %5
  %14 = shufflevector <2 x i64> %vector.recur.init89, <2 x i64> %wide.load91, <2 x i32> <i32 1, i32 2>
  %15 = and <2 x i64> %14, %6
  %16 = or <2 x i64> %12, %15
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

define <2 x i64> @"204"(ptr %0, ptr %offsets, ptr %num_nodes_.i, i64 %1, i64 %index770, i64 %2) {
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

define ptr @"205"(ptr %new_range.i.i, ptr %el, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %1 = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %2 = load ptr, ptr %el, align 8, !tbaa !39
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !57
  ret ptr %add.ptr6.i.i
}

define ptr @"206"(ptr %call.i4953, ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, ptr %end_size_.i51) {
bb:
  %2 = load ptr, ptr %degrees, align 8, !tbaa !7
  %sub.ptr.rhs.cast.i46 = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !4
  %sub.ptr.lhs.cast.i45 = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i47 = sub i64 %sub.ptr.lhs.cast.i45, %sub.ptr.rhs.cast.i46
  %sub.ptr.div.i48 = ashr exact i64 %sub.ptr.sub.i47, %0
  %add12 = add nsw i64 %sub.ptr.div.i48, %1
  %add.ptr.i50 = getelementptr inbounds i64, ptr %call.i4953, i64 %add12
  store ptr %add.ptr.i50, ptr %end_size_.i51, align 8, !tbaa !65
  ret ptr %add.ptr.i50
}

define ptr @"207"(ptr %_M_before_begin.i, ptr %retval.0.i, ptr %add.ptr, i64 %__bkt_count) {
bb:
  %0 = load i32, ptr %add.ptr, align 4, !tbaa !10
  %conv.i.i.i = sext i32 %0 to i64
  %rem.i.i = urem i64 %conv.i.i.i, %__bkt_count
  %arrayidx = getelementptr inbounds ptr, ptr %retval.0.i, i64 %rem.i.i
  store ptr %_M_before_begin.i, ptr %arrayidx, align 8, !tbaa !16
  ret ptr %_M_before_begin.i
}

define ptr @"208"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %2 = load ptr, ptr %new_range.i.i, align 8, !tbaa !16
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !57
  ret ptr %add.ptr6.i.i
}

define i64 @"209"(ptr %end_size_.i, ptr %this, i64 %0, i64 %1, ptr %.omp.ub) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !39
  %sub.ptr.rhs.cast.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !41
  %sub.ptr.lhs.cast.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %sub2 = add nsw i64 %sub.ptr.div.i, %1
  store i64 %sub2, ptr %.omp.ub, align 8, !tbaa !0
  ret i64 %sub2
}

define i64 @"210"(i32 %shl19, ptr %arrayidx.i61, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i63, i64 %4, i64 %5, i64 %xor4.i, i64 %6, i64 %xor7.i, i32 %7, i32 %8, i32 %9, i32 %conv, i64 %10, i64 %ref.tmp30.sroa.0.0.insert.ext, ptr %el, ptr %.omp.lb) {
bb:
  %11 = load ptr, ptr %el, align 8, !tbaa !39
  %12 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul = shl i64 %12, %6
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %11, i64 %mul
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

define ptr @"211"(ptr %out_index_.i, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %indvars.iv.next = add nsw i64 %2, %0
  %3 = load ptr, ptr %out_index_.i, align 8, !tbaa !100, !noalias !101, !llvm.access.group !104
  %arrayidx.i.i.i = getelementptr inbounds ptr, ptr %3, i64 %indvars.iv.next
  %4 = load ptr, ptr %arrayidx.i.i.i, align 8, !tbaa !16, !llvm.access.group !104
  ret ptr %4
}

define ptr @"212"(ptr %out_index_.i, ptr %it.sroa.0.0541, i32 %0) {
bb:
  %1 = load ptr, ptr %out_index_.i, align 8, !tbaa !100, !noalias !105
  %2 = load i32, ptr %it.sroa.0.0541, align 4, !tbaa !10
  %add.i.i.i266 = add nsw i32 %2, %0
  %idxprom.i.i.i = sext i32 %add.i.i.i266 to i64
  %arrayidx.i.i.i = getelementptr inbounds ptr, ptr %1, i64 %idxprom.i.i.i
  %3 = load ptr, ptr %arrayidx.i.i.i, align 8, !tbaa !16
  ret ptr %3
}

define i64 @"213"(ptr %arrayidx3.i, i64 %0, ptr %1, i64 %2, i64 %3, ptr %arrayidx7.i, i64 %4, i64 %5, ptr %arrayidx.i) {
bb:
  %6 = load i64, ptr %arrayidx3.i, align 8, !tbaa !0
  %and8.i = and i64 %6, %2
  %tobool.not.i = icmp eq i64 %and8.i, %4
  %cond.i = select i1 %tobool.not.i, i64 %4, i64 %5
  %and4.i = and i64 %6, %0
  %wide.load = load <2 x i64>, ptr %1, align 8, !tbaa !0
  %vector.recur.extract = extractelement <2 x i64> %wide.load, i64 %2
  %and.i = and i64 %vector.recur.extract, %3
  %or.i = or i64 %and4.i, %and.i
  %shr.i = lshr exact i64 %or.i, %2
  %7 = load i64, ptr %arrayidx7.i, align 8, !tbaa !0
  %xor.i = xor i64 %shr.i, %7
  %xor9.i = xor i64 %xor.i, %cond.i
  store i64 %xor9.i, ptr %arrayidx.i, align 8, !tbaa !0
  ret i64 %xor9.i
}

define i32 @"214"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add15 = add i64 %2, %0
  %3 = load ptr, ptr %el, align 8, !tbaa !39
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %add15
  %add.ptr.sroa_idx.1 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %1
  %4 = load i32, ptr %add.ptr.sroa_idx.1, align 4
  ret i32 %4
}

define <2 x i64> @"215"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %this, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
bb:
  %wide.load = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %10 = and <2 x i64> %wide.load, %5
  %11 = icmp eq <2 x i64> %10, %7
  %12 = select <2 x i1> %11, <2 x i64> %7, <2 x i64> %8
  %wide.load18 = load <2 x i64>, ptr %6, align 8, !tbaa !0
  %13 = and <2 x i64> %wide.load, %1
  %.pre.i = load i64, ptr %this, align 8, !tbaa !0
  %vector.recur.init = insertelement <2 x i64> %2, i64 %.pre.i, i64 %3
  %14 = shufflevector <2 x i64> %vector.recur.init, <2 x i64> %wide.load, <2 x i32> <i32 1, i32 2>
  %15 = and <2 x i64> %14, %4
  %16 = or <2 x i64> %13, %15
  %17 = lshr exact <2 x i64> %16, %5
  %18 = xor <2 x i64> %17, %wide.load18
  %19 = xor <2 x i64> %18, %12
  store <2 x i64> %19, ptr %9, align 8, !tbaa !0
  ret <2 x i64> %19
}

define <2 x i32> @"216"(ptr %degrees, i64 %offset.idx) {
bb:
  %0 = load ptr, ptr %degrees, align 8, !tbaa !7
  %1 = getelementptr inbounds i32, ptr %0, i64 %offset.idx
  %wide.load = load <2 x i32>, ptr %1, align 4, !tbaa !10
  ret <2 x i32> %wide.load
}

define i64 @"217"(ptr %arrayidx.i56, i64 %total.074, ptr %arrayidx.i55.1) {
bb:
  %0 = load i64, ptr %arrayidx.i56, align 8, !tbaa !0
  %add7 = add nsw i64 %0, %total.074
  store i64 %add7, ptr %arrayidx.i55.1, align 8, !tbaa !0
  ret i64 %add7
}

define i32 @"218"(i64 %indvars.iv687, ptr %incdec.ptr4.sink.i.i.i.i, ptr %__first.addr.015.i.i, ptr %neighs, ptr %arrayidx.i524, i64 %sub.ptr.rhs.cast.i.i.i.i526, i64 %0, i64 %1) {
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

define i32 @"219"(i32 %0, ptr %call171, ptr %arrayidx.i548, i64 %1, ptr %arrayidx.i549) {
bb:
  %2 = load i32, ptr %arrayidx.i549, align 4, !tbaa !10
  %idx.ext = sext i32 %2 to i64
  %3 = load i64, ptr %arrayidx.i548, align 8, !tbaa !0
  %add286 = add i64 %3, %1
  %sub287 = add i64 %add286, %idx.ext
  %arrayidx288 = getelementptr inbounds i32, ptr %call171, i64 %sub287
  store i32 %0, ptr %arrayidx288, align 4, !tbaa !10
  ret i32 %0
}

define ptr @"220"(ptr %cond.i31.i.i.i, ptr %_M_finish.i38, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4) {
bb:
  %5 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !37
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
  store ptr %incdec.ptr.i.i.i, ptr %_M_finish.i38, align 8, !tbaa !37
  ret ptr %incdec.ptr.i.i.i
}

define i32 @"221"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %this, align 8, !tbaa !7
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add7 = add i64 %2, %0
  %add.ptr.1 = getelementptr inbounds i32, ptr %1, i64 %add7
  %3 = load i32, ptr %init_val, align 4, !tbaa !10
  store i32 %3, ptr %add.ptr.1, align 4, !tbaa !10
  ret i32 %3
}

define i32 @"222"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !7
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add.ptr.prol = getelementptr inbounds i32, ptr %2, i64 %ind.end
  %5 = load i32, ptr %init_val, align 4, !tbaa !10
  store i32 %5, ptr %add.ptr.prol, align 4, !tbaa !10
  ret i32 %5
}

define ptr @"223"(ptr %__p.044, ptr %_M_before_begin.i) {
bb:
  %0 = load ptr, ptr %__p.044, align 8, !tbaa !54
  store ptr %0, ptr %_M_before_begin.i, align 8, !tbaa !49
  ret ptr %0
}

define i64 @"224"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !59
  %inc.i71 = add nuw nsw i64 %2, %1
  %arrayidx.i65 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i71
  %3 = load i64, ptr %arrayidx.i65, align 8, !tbaa !0
  ret i64 %3
}

define i32 @"225"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add15 = add i64 %1, %0
  %2 = load ptr, ptr %el, align 8, !tbaa !39
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %add15
  %3 = load i32, ptr %add.ptr.1, align 4
  ret i32 %3
}

define ptr @"226"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, ptr %.omp.lb) {
bb:
  %1 = load ptr, ptr %out_index_.i, align 8
  %2 = load ptr, ptr %in_index_.i, align 8
  %3 = load i8, ptr %transpose, align 1, !tbaa !12, !range !14, !noundef !15
  %tobool.not = icmp eq i8 %3, %0
  %.pn = select i1 %tobool.not, ptr %1, ptr %2
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %5 = sext i32 %4 to i64
  %n_start.0.in = getelementptr inbounds ptr, ptr %.pn, i64 %5
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  ret ptr %n_start.0
}

define i8 @"227"(i8 %storemerge.i.i, ptr %agg.tmp32, ptr %num_trials_, i32 %0) {
bb:
  %1 = load ptr, ptr %agg.tmp32, align 8, !tbaa !35, !alias.scope !23
  %2 = load i32, ptr %num_trials_, align 4, !tbaa !26
  %__val.lobit.i = lshr i32 %2, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %arrayidx.i.i = getelementptr inbounds i8, ptr %1, i64 %conv5.i
  store i8 %storemerge.i.i, ptr %arrayidx.i.i, align 1, !tbaa !22
  ret i8 %storemerge.i.i
}

define i64 @"228"(ptr %arrayidx.i.i, ptr %0, i64 %1, ptr %2) {
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

define i64 @"229"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !59
  %inc.i71 = add nuw nsw i64 %2, %1
  %arrayidx.i208 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i71
  %3 = load i64, ptr %arrayidx.i208, align 8, !tbaa !0
  ret i64 %3
}

define i64 @"230"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
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

define i64 @"232"(ptr %arrayidx.i56.3, ptr %arrayidx.i56.2, ptr %arrayidx.i56.1, ptr %arrayidx.i56, i64 %total.074, ptr %call.i3943, ptr %num_blocks) {
bb:
  %0 = load i64, ptr %arrayidx.i56, align 8, !tbaa !0
  %add7 = add nsw i64 %0, %total.074
  %1 = load i64, ptr %arrayidx.i56.1, align 8, !tbaa !0
  %add7.1 = add nsw i64 %1, %add7
  %2 = load i64, ptr %arrayidx.i56.2, align 8, !tbaa !0
  %add7.2 = add nsw i64 %2, %add7.1
  %3 = load i64, ptr %arrayidx.i56.3, align 8, !tbaa !0
  %add7.3 = add nsw i64 %3, %add7.2
  %4 = load i64, ptr %num_blocks, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds i64, ptr %call.i3943, i64 %4
  store i64 %add7.3, ptr %arrayidx.i, align 8, !tbaa !0
  ret i64 %add7.3
}

define ptr @"233"(ptr %_M_before_begin.i, ptr %this, i64 %__code, ptr %_M_bucket_count) {
bb:
  %.pre.i = load ptr, ptr %this, align 8, !tbaa !91
  %0 = load i64, ptr %_M_bucket_count, align 8, !tbaa !92
  %rem.i.i.i = urem i64 %__code, %0
  %arrayidx20.i = getelementptr inbounds ptr, ptr %.pre.i, i64 %rem.i.i.i
  store ptr %_M_before_begin.i, ptr %arrayidx20.i, align 8, !tbaa !16
  ret ptr %_M_before_begin.i
}

define i32 @"234"(ptr %arrayidx.i35, ptr %comp, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %1 = sext i32 %0 to i64
  %2 = load ptr, ptr %comp, align 8, !tbaa !7, !llvm.access.group !36
  %arrayidx.i = getelementptr inbounds i32, ptr %2, i64 %1
  %3 = load i32, ptr %arrayidx.i35, align 4, !tbaa !10, !llvm.access.group !36
  store i32 %3, ptr %arrayidx.i, align 4, !tbaa !10, !llvm.access.group !36
  ret i32 %3
}

define i32 @"235"(ptr %degrees, i64 %mul12, i64 %umin, ptr %.omp.lb, i64 %indvar, i64 %0, i64 %n.mod.vf) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %2 = add i64 %1, %indvar
  %3 = shl i64 %2, %0
  %4 = sub i64 %umin, %3
  %n.vec = sub i64 %4, %n.mod.vf
  %ind.end = add i64 %mul12, %n.vec
  %5 = load ptr, ptr %degrees, align 8, !tbaa !7
  %arrayidx.i30 = getelementptr inbounds i32, ptr %5, i64 %ind.end
  %6 = load i32, ptr %arrayidx.i30, align 4, !tbaa !10
  ret i32 %6
}

define i32 @"236"(ptr %add.ptr.i.i, ptr %__first, ptr %add.ptr.i, ptr %add.ptr2.i, i64 %sub1.i, i64 %mul.i) {
bb:
  %0 = load i32, ptr %add.ptr.i.i, align 4, !tbaa !10
  %1 = load i32, ptr %add.ptr2.i, align 4, !tbaa !10
  %2 = load i32, ptr %add.ptr.i, align 4, !tbaa !10
  %cmp.i.i = icmp slt i32 %2, %1
  %spec.select.i = select i1 %cmp.i.i, i64 %sub1.i, i64 %mul.i
  %add.ptr2.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i
  store i32 %0, ptr %add.ptr2.i.i, align 4, !tbaa !10
  ret i32 %0
}

define i64 @"237"(ptr %el) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %agg.tmp.sroa.0.0.copyload.i.i.i.i.i = load i64, ptr %.pre, align 4, !tbaa.struct !63
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i.i.i
}

define i32 @"238"(ptr %add.ptr.i.i.i.i.i, ptr %add.ptr2.i.i.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr.i.i.i.i.i, align 4, !tbaa !10
  store i32 %0, ptr %add.ptr2.i.i.i.i.i, align 4, !tbaa !10
  ret i32 %0
}

define i32 @"239"(ptr %neighs, ptr %arrayidx.i523, ptr %arrayidx.i524, i64 %sub.ptr.rhs.cast.i.i.i.i526, i64 %0, i64 %1) {
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

define ptr @"240"(ptr %el, i64 %sub.ptr.rhs.cast, i64 %0, ptr %end_size_.i) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !39
  %sub.ptr.lhs.cast = ptrtoint ptr %1 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !41
  ret ptr %add.ptr.i
}

define i64 @"241"(ptr %this, i64 %0, ptr %arrayidx42.i, i64 %1, i64 %2, ptr %arrayidx49.i, i64 %3, i64 %4) {
bb:
  %5 = load i64, ptr %this, align 8, !tbaa !0
  %and52.i = and i64 %5, %2
  %tobool53.not.i = icmp eq i64 %and52.i, %3
  %cond54.i = select i1 %tobool53.not.i, i64 %3, i64 %4
  %6 = load i64, ptr %arrayidx49.i, align 8, !tbaa !0
  %7 = load i64, ptr %arrayidx42.i, align 8, !tbaa !0
  %and43.i = and i64 %7, %1
  %and46.i = and i64 %5, %0
  %or47.i = or i64 %and46.i, %and43.i
  %shr50.i = lshr exact i64 %or47.i, %2
  %xor51.i = xor i64 %shr50.i, %6
  %xor55.i = xor i64 %xor51.i, %cond54.i
  store i64 %xor55.i, ptr %arrayidx42.i, align 8, !tbaa !0
  ret i64 %xor55.i
}

define i64 @"242"(ptr %__first.addr.07.i.i.i.i.i.i.i, ptr %cond.i31.i.i.i, ptr %_M_finish.i38, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4) {
bb:
  %5 = load i64, ptr %__first.addr.07.i.i.i.i.i.i.i, align 4, !alias.scope !44, !noalias !47
  %6 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !37
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %6, i64 %0
  %7 = ptrtoint ptr %incdec.ptr.i.i to i64
  %8 = add i64 %7, %1
  %9 = sub i64 %8, %2
  %10 = lshr i64 %9, %3
  %11 = add nuw nsw i64 %10, %0
  %n.vec = and i64 %11, %4
  %12 = shl i64 %n.vec, %3
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i, i64 %12
  store i64 %5, ptr %ind.end, align 4, !alias.scope !47, !noalias !44
  ret i64 %5
}

define i64 @"243"(i64 %0, ptr %offsets, ptr %num_nodes_.i, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %n.mod.vf = and i64 %3, %1
  %arrayidx.i493734 = getelementptr inbounds i64, ptr %2, i64 %n.mod.vf
  store i64 %0, ptr %arrayidx.i493734, align 8, !tbaa !0
  ret i64 %0
}

define <2 x i64> @"244"(ptr %__first, <2 x i64> %0) {
bb:
  %1 = load <2 x i64>, ptr %__first, align 4
  %2 = shufflevector <2 x i64> %1, <2 x i64> %0, <2 x i32> <i32 1, i32 0>
  store <2 x i64> %2, ptr %__first, align 4
  ret <2 x i64> %2
}

define ptr @"245"(ptr %call.i134135, ptr %num_nodes, i64 %0, ptr %end_size_.i) {
bb:
  %1 = load i64, ptr %num_nodes, align 8, !tbaa !0
  %add = add nsw i64 %1, %0
  %add.ptr.i = getelementptr inbounds i64, ptr %call.i134135, i64 %add
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !65
  ret ptr %add.ptr.i
}

define i64 @"246"(ptr %offsets, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %offsets, align 8, !tbaa !8
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %arrayidx.i = getelementptr inbounds i64, ptr %0, i64 %2
  %3 = load i64, ptr %arrayidx.i, align 8, !tbaa !0
  ret i64 %3
}

define i32 @"247"(ptr %end_size_.i.i583, i64 %sub.ptr.rhs.cast.i.i585, i64 %0, ptr %length.i581) {
bb:
  %1 = load ptr, ptr %end_size_.i.i583, align 8, !tbaa !65
  %sub.ptr.lhs.cast.i.i584 = ptrtoint ptr %1 to i64
  %sub.ptr.sub.i.i586 = sub i64 %sub.ptr.lhs.cast.i.i584, %sub.ptr.rhs.cast.i.i585
  %2 = lshr exact i64 %sub.ptr.sub.i.i586, %0
  %conv.i587 = trunc i64 %2 to i32
  store i32 %conv.i587, ptr %length.i581, align 4, !tbaa !10
  ret i32 %conv.i587
}

define <2 x i64> @"248"(ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %index770, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %3 = and i64 %2, %0
  %offset.idx = sub i64 %3, %index770
  %4 = add nuw i64 %offset.idx, %0
  %5 = and i64 %4, %0
  %6 = load ptr, ptr %offsets, align 8
  %7 = getelementptr inbounds i64, ptr %6, i64 %5
  %8 = getelementptr inbounds i64, ptr %7, i64 %1
  %wide.load = load <2 x i64>, ptr %8, align 8, !tbaa !0
  ret <2 x i64> %wide.load
}

define <4 x i32> @"249"(ptr %0, ptr %call171, ptr %arrayidx.i539, i64 %1, i64 %index800, i64 %2) {
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

define i32 @"250"(ptr %arrayidx.i.i.i60, ptr %n_start.0.in, i64 %0, ptr %diffs, ptr %.omp.lb) {
bb:
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !16
  %sub.ptr.lhs.cast = ptrtoint ptr %n_end.0 to i64
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !16
  %.pre134 = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %.pre134
  %1 = lshr exact i64 %sub.ptr.sub, %0
  %conv22 = trunc i64 %1 to i32
  %2 = load ptr, ptr %diffs, align 8, !tbaa !7
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %4 = sext i32 %3 to i64
  %arrayidx.i99 = getelementptr inbounds i32, ptr %2, i64 %4
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !10
  ret i32 %conv22
}

define i32 @"251"(ptr %arrayidx.i7.i.i, i64 %.sroa.speculated.i.i) {
bb:
  %0 = load ptr, ptr %arrayidx.i7.i.i, align 8, !tbaa !16, !llvm.access.group !108
  %add.ptr.i = getelementptr inbounds i32, ptr %0, i64 %.sroa.speculated.i.i
  %1 = load i32, ptr %add.ptr.i, align 4, !tbaa !10, !llvm.access.group !108
  ret i32 %1
}

define i64 @"252"(ptr %arrayidx.i533, i64 %total_missing_inv.0649, ptr %arrayidx.i536, ptr %offsets, ptr %num_nodes_.i) {
bb:
  %0 = load i64, ptr %num_nodes_.i, align 8, !tbaa !55
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !8
  %arrayidx.i5332 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %0
  %1 = load i64, ptr %arrayidx.i533, align 8, !tbaa !0
  %2 = load i32, ptr %arrayidx.i536, align 4, !tbaa !10
  %conv155 = sext i32 %2 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %add165 = add nsw i64 %1, %add156
  store i64 %add165, ptr %arrayidx.i533, align 8, !tbaa !0
  ret i64 %add165
}

define i32 @"253"(ptr %comp, ptr %arrayidx.i33, i32 %cond, ptr %arrayidx.i37) {
bb:
  %.pre = load ptr, ptr %comp, align 8, !tbaa !7
  %p1.0 = load i32, ptr %arrayidx.i37, align 4, !tbaa !10
  %p2.048 = load i32, ptr %arrayidx.i33, align 4, !tbaa !10
  %sub = sub nsw i32 %p2.048, %cond
  %add = add nsw i32 %sub, %p1.0
  %conv15 = sext i32 %add to i64
  %arrayidx.i38 = getelementptr inbounds i32, ptr %.pre, i64 %conv15
  %p2.0 = load i32, ptr %arrayidx.i38, align 4, !tbaa !10
  ret i32 %p2.0
}

define i64 @"254"(ptr %_M_b.i, ptr %__param, i64 %0, ptr %_M_b.i32) {
bb:
  %1 = load i64, ptr %__param, align 8, !tbaa !109
  %2 = load i64, ptr %_M_b.i, align 8, !tbaa !111
  %sub = sub i64 %2, %1
  %div31 = lshr i64 %sub, %0
  store i64 %div31, ptr %_M_b.i32, align 8, !tbaa !111
  ret i64 %div31
}

define i64 @"255"(ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !42
  %1 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !42
  %cmp7.i.i.i.i.i = icmp slt i32 %0, %1
  %cmp.i.i.i.i.i = icmp eq i32 %0, %1
  %2 = load i32, ptr %v3.i.i.i.i.i, align 4
  %3 = load i32, ptr %v.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %3, %2
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr3.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  %4 = load i64, ptr %add.ptr3.i.i.i, align 4
  ret i64 %4
}

define i64 @"256"(ptr %add.ptr3.i.i.i, ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !42
  %1 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !42
  %cmp7.i.i.i.i.i = icmp slt i32 %0, %1
  %cmp.i.i.i.i.i = icmp eq i32 %0, %1
  %2 = load i32, ptr %v3.i.i.i.i.i, align 4
  %3 = load i32, ptr %v.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %3, %2
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr4.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  %4 = load i64, ptr %add.ptr3.i.i.i, align 4
  store i64 %4, ptr %add.ptr4.i.i.i, align 4
  ret i64 %4
}

define ptr @"257"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, i64 %1) {
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

define i64 @"258"(ptr %arrayidx.i56.3, ptr %arrayidx.i56.2, ptr %arrayidx.i56.1, ptr %arrayidx.i56, i64 %total.074, ptr %arrayidx.i55.epil) {
bb:
  %0 = load i64, ptr %arrayidx.i56, align 8, !tbaa !0
  %add7 = add nsw i64 %0, %total.074
  %1 = load i64, ptr %arrayidx.i56.1, align 8, !tbaa !0
  %add7.1 = add nsw i64 %1, %add7
  %2 = load i64, ptr %arrayidx.i56.2, align 8, !tbaa !0
  %add7.2 = add nsw i64 %2, %add7.1
  %3 = load i64, ptr %arrayidx.i56.3, align 8, !tbaa !0
  %add7.3 = add nsw i64 %3, %add7.2
  store i64 %add7.3, ptr %arrayidx.i55.epil, align 8, !tbaa !0
  ret i64 %add7.3
}

define i8 @"259"(ptr %arrayidx.i17.i, ptr %ref.tmp, i64 %conv5.i, i64 %idxprom1.i.i) {
bb:
  %0 = load ptr, ptr %ref.tmp, align 8, !tbaa !35, !alias.scope !93
  %arrayidx.i.i = getelementptr inbounds i8, ptr %0, i64 %conv5.i
  %arrayidx2.i.i = getelementptr inbounds i8, ptr %arrayidx.i.i, i64 %idxprom1.i.i
  %1 = load i8, ptr %arrayidx.i17.i, align 1, !tbaa !22, !noalias !93
  store i8 %1, ptr %arrayidx2.i.i, align 1, !tbaa !22
  ret i8 %1
}

define i64 @"260"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i78.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !63
  ret i64 %agg.tmp.sroa.0.0.copyload.i78.i.i.i.i
}

define i64 @"261"(ptr %_M_p, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p, align 8, !tbaa !59
  %inc = add nuw nsw i64 %1, %0
  store i64 %inc, ptr %_M_p, align 8, !tbaa !59
  ret i64 %inc
}

define ptr @"262"(ptr %el, ptr %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !39
  %2 = load ptr, ptr %el, align 8, !tbaa !39
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !39
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !41
  ret ptr %add.ptr.i464
}

define i32 @"263"(ptr %comp, ptr %arrayidx.i36.phi.trans.insert) {
bb:
  %0 = load ptr, ptr %comp, align 8, !tbaa !7
  %.pre52 = load i32, ptr %arrayidx.i36.phi.trans.insert, align 4, !tbaa !10
  %conv13 = sext i32 %.pre52 to i64
  %arrayidx.i37 = getelementptr inbounds i32, ptr %0, i64 %conv13
  %p1.0 = load i32, ptr %arrayidx.i37, align 4, !tbaa !10
  ret i32 %p1.0
}

!0 = !{!1, !1, i64 0}
!1 = !{!"long", !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C++ TBAA"}
!4 = !{!5, !6, i64 8}
!5 = !{!"_ZTS7pvectorIiE", !6, i64 0, !6, i64 8, !6, i64 16}
!6 = !{!"any pointer", !2, i64 0}
!7 = !{!5, !6, i64 0}
!8 = !{!9, !6, i64 0}
!9 = !{!"_ZTS7pvectorIlE", !6, i64 0, !6, i64 8, !6, i64 16}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !2, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"bool", !2, i64 0}
!14 = !{i8 0, i8 2}
!15 = !{}
!16 = !{!6, !6, i64 0}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = !{!2, !2, i64 0}
!23 = !{!24}
!24 = distinct !{!24, !25, !"_ZNSt7__cxx119to_stringEi: %agg.result"}
!25 = distinct !{!25, !"_ZNSt7__cxx119to_stringEi"}
!26 = !{!27, !11, i64 156}
!27 = !{!"_ZTS5CLApp", !28, i64 0, !13, i64 155, !11, i64 156, !1, i64 160, !13, i64 168, !13, i64 169}
!28 = !{!"_ZTS6CLBase", !11, i64 8, !6, i64 16, !29, i64 24, !29, i64 56, !31, i64 88, !11, i64 112, !11, i64 116, !29, i64 120, !13, i64 152, !13, i64 153, !13, i64 154}
!29 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !30, i64 0, !1, i64 8, !2, i64 16}
!30 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !6, i64 0}
!31 = !{!"_ZTSSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !32, i64 0}
!32 = !{!"_ZTSSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !33, i64 0}
!33 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implE", !34, i64 0}
!34 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_Vector_impl_dataE", !6, i64 0, !6, i64 8, !6, i64 16}
!35 = !{!29, !6, i64 0}
!36 = distinct !{}
!37 = !{!38, !6, i64 8}
!38 = !{!"_ZTSNSt12_Vector_baseISt4pairIiiESaIS1_EE17_Vector_impl_dataE", !6, i64 0, !6, i64 8, !6, i64 16}
!39 = !{!40, !6, i64 0}
!40 = !{!"_ZTS7pvectorI8EdgePairIiiEE", !6, i64 0, !6, i64 8, !6, i64 16}
!41 = !{!40, !6, i64 8}
!42 = !{!43, !11, i64 0}
!43 = !{!"_ZTS8EdgePairIiiE", !11, i64 0, !11, i64 4}
!44 = !{!45}
!45 = distinct !{!45, !46, !"_ZSt19__relocate_object_aISt4pairIiiES1_SaIS1_EEvPT_PT0_RT1_: %__orig"}
!46 = distinct !{!46, !"_ZSt19__relocate_object_aISt4pairIiiES1_SaIS1_EEvPT_PT0_RT1_"}
!47 = !{!48}
!48 = distinct !{!48, !46, !"_ZSt19__relocate_object_aISt4pairIiiES1_SaIS1_EEvPT_PT0_RT1_: %__dest"}
!49 = !{!50, !6, i64 16}
!50 = !{!"_ZTSSt10_HashtableIiSt4pairIKiiESaIS2_ENSt8__detail10_Select1stESt8equal_toIiESt4hashIiENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb0ELb0ELb1EEEE", !6, i64 0, !1, i64 8, !51, i64 16, !1, i64 24, !52, i64 32, !6, i64 48}
!51 = !{!"_ZTSNSt8__detail15_Hash_node_baseE", !6, i64 0}
!52 = !{!"_ZTSNSt8__detail20_Prime_rehash_policyE", !53, i64 0, !1, i64 8}
!53 = !{!"float", !2, i64 0}
!54 = !{!51, !6, i64 0}
!55 = !{!56, !1, i64 16}
!56 = !{!"_ZTS11BuilderBaseIiiiLb1EE", !6, i64 0, !13, i64 8, !13, i64 9, !13, i64 10, !1, i64 16}
!57 = !{!40, !6, i64 16}
!58 = !{!29, !1, i64 8}
!59 = !{!60, !1, i64 4992}
!60 = !{!"_ZTSSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE", !2, i64 0, !1, i64 4992}
!61 = !{!62, !11, i64 0}
!62 = !{!"_ZTS10NodeWeightIiiE", !11, i64 0, !11, i64 4}
!63 = !{i64 0, i64 4, !10, i64 4, i64 4, !10}
!64 = !{i64 0, i64 4, !10}
!65 = !{!9, !6, i64 8}
!66 = !{!67, !1, i64 8}
!67 = !{!"_ZTS8CSRGraphIiiLb1EE", !13, i64 0, !1, i64 8, !1, i64 16, !6, i64 24, !6, i64 32, !6, i64 40, !6, i64 48}
!68 = !{!69}
!69 = distinct !{!69, !70, !"_ZN11BuilderBaseIiiiLb1EE11SquishGraphERK8CSRGraphIiiLb1EE: %agg.result"}
!70 = distinct !{!70, !"_ZN11BuilderBaseIiiiLb1EE11SquishGraphERK8CSRGraphIiiLb1EE"}
!71 = !{!38, !6, i64 16}
!72 = !{!73}
!73 = distinct !{!73, !74, !"_ZSt19__relocate_object_aISt4pairIiiES1_SaIS1_EEvPT_PT0_RT1_: %__orig"}
!74 = distinct !{!74, !"_ZSt19__relocate_object_aISt4pairIiiES1_SaIS1_EEvPT_PT0_RT1_"}
!75 = !{!76}
!76 = distinct !{!76, !74, !"_ZSt19__relocate_object_aISt4pairIiiES1_SaIS1_EEvPT_PT0_RT1_: %__dest"}
!77 = !{!34, !6, i64 8}
!78 = !{!34, !6, i64 16}
!79 = !{!80, !11, i64 4}
!80 = !{!"_ZTSSt4pairIiiE", !11, i64 0, !11, i64 4}
!81 = !{!82}
!82 = distinct !{!82, !83, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_: %agg.result"}
!83 = distinct !{!83, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_"}
!84 = !{!85, !1, i64 16}
!85 = !{!"_ZTS9GeneratorIiiijLi32ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEE", !11, i64 0, !1, i64 8, !1, i64 16}
!86 = !{!80, !11, i64 0}
!87 = !{!85, !1, i64 8}
!88 = !{!89}
!89 = distinct !{!89, !90, !"_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm: %agg.result"}
!90 = distinct !{!90, !"_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm"}
!91 = !{!50, !6, i64 0}
!92 = !{!50, !1, i64 8}
!93 = !{!94}
!94 = distinct !{!94, !95, !"_ZNSt7__cxx119to_stringEi: %agg.result"}
!95 = distinct !{!95, !"_ZNSt7__cxx119to_stringEi"}
!96 = !{!97, !11, i64 4}
!97 = !{!"_ZTSSt4pairIKiiE", !11, i64 0, !11, i64 4}
!98 = !{!99, !11, i64 4}
!99 = !{!"_ZTSNSt24uniform_int_distributionIiE10param_typeE", !11, i64 0, !11, i64 4}
!100 = !{!67, !6, i64 24}
!101 = !{!102}
!102 = distinct !{!102, !103, !"_ZNK8CSRGraphIiiLb1EE9out_neighEim: %agg.result"}
!103 = distinct !{!103, !"_ZNK8CSRGraphIiiLb1EE9out_neighEim"}
!104 = distinct !{}
!105 = !{!106}
!106 = distinct !{!106, !107, !"_ZNK8CSRGraphIiiLb1EE9out_neighEim: %agg.result"}
!107 = distinct !{!107, !"_ZNK8CSRGraphIiiLb1EE9out_neighEim"}
!108 = distinct !{}
!109 = !{!110, !1, i64 0}
!110 = !{!"_ZTSNSt24uniform_int_distributionImE10param_typeE", !1, i64 0, !1, i64 8}
!111 = !{!110, !1, i64 8}
