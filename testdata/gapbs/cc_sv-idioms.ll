; ModuleID = 'cc_sv-idioms'
source_filename = "cc_sv-idioms"
target triple = "riscv64"

%struct.EdgePair = type { i32, i32 }
%"struct.std::pair.8" = type { i32, i32 }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char>::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char>::_Alloc_hider" = type { ptr }
%union.anon = type { i64, [8 x i8] }

define i32 @"0"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %init_val, align 4, !tbaa !0
  %3 = load ptr, ptr %this, align 8, !tbaa !4
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add.ptr = getelementptr inbounds i32, ptr %3, i64 %ind.end
  store i32 %2, ptr %add.ptr, align 4, !tbaa !0
  ret i32 %2
}

define i64 @"1"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %2) {
bb:
  %3 = load i32, ptr %v, align 4, !tbaa !9
  %sub = add nsw i32 %3, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  %4 = load ptr, ptr %new_range.i.i, align 8, !tbaa !11
  %5 = load ptr, ptr %agg.result, align 8, !tbaa !12
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %5 to i64
  %6 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !14
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %6 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = ashr exact i64 %sub.ptr.sub.i12.i.i, %2
  %add.ptr.i.i149 = getelementptr inbounds %struct.EdgePair, ptr %4, i64 %sub.ptr.div.i13.i.i
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %add.ptr.i.i149, align 4, !tbaa.struct !15
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"2"(i64 %indvars.iv687, ptr %incdec.ptr4.sink.i.i.i.i, ptr %__first.addr.015.i.i, ptr %neighs, ptr %arrayidx.i524, i64 %sub.ptr.rhs.cast.i.i.i.i526, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %neighs, align 8, !tbaa !11
  %3 = load i64, ptr %arrayidx.i524, align 8, !tbaa !7
  %add.ptr121 = getelementptr inbounds i32, ptr %2, i64 %3
  %sub.ptr.lhs.cast.i.i.i.i525 = ptrtoint ptr %add.ptr121 to i64
  %sub.ptr.sub.i.i.i.i527 = sub i64 %sub.ptr.lhs.cast.i.i.i.i525, %sub.ptr.rhs.cast.i.i.i.i526
  %sub.ptr.div.i.i.i.i = lshr exact i64 %sub.ptr.sub.i.i.i.i527, %0
  %shr.i.i = lshr i64 %sub.ptr.div.i.i.i.i, %1
  %incdec.ptr4.sink.i.i.i.i2 = getelementptr inbounds i32, ptr %__first.addr.015.i.i, i64 %shr.i.i
  %incdec.ptr.i.i = getelementptr inbounds i32, ptr %incdec.ptr4.sink.i.i.i.i, i64 %1
  %4 = load i32, ptr %incdec.ptr4.sink.i.i.i.i, align 4, !tbaa !0
  %5 = sext i32 %4 to i64
  %cmp.i.i.i530 = icmp sgt i64 %indvars.iv687, %5
  %__first.addr.1.i.i = select i1 %cmp.i.i.i530, ptr %incdec.ptr.i.i, ptr %__first.addr.015.i.i
  %6 = load i32, ptr %__first.addr.1.i.i, align 4, !tbaa !0
  ret i32 %6
}

define ptr @"3"(ptr %cond.i31.i.i.i, i64 %.sroa.speculated.i.i.i.i, i64 %sub.ptr.lhs.cast.i.i.i.i.i, ptr %count_vector, i64 %0, i64 %sub.ptr.div.i.i.i.i.i, i1 %cmp9.i.i.i.i, i64 %1, i64 %add.i.i.i.i, ptr %_M_end_of_storage.i.i277) {
bb:
  %2 = load ptr, ptr %count_vector, align 8, !tbaa !11
  %sub.ptr.rhs.cast.i.i.i.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i2 = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, %0
  %add.i.i.i.i4 = add i64 %.sroa.speculated.i.i.i.i, %sub.ptr.div.i.i.i.i.i
  %cmp7.i.i.i.i = icmp ult i64 %add.i.i.i.i, %sub.ptr.div.i.i.i.i.i
  %or.cond.i.i.i.i = or i1 %cmp7.i.i.i.i, %cmp9.i.i.i.i
  %cond.i.i.i.i = select i1 %or.cond.i.i.i.i, i64 %1, i64 %add.i.i.i.i
  %add.ptr19.i.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %cond.i31.i.i.i, i64 %cond.i.i.i.i
  store ptr %add.ptr19.i.i.i, ptr %_M_end_of_storage.i.i277, align 8, !tbaa !16
  ret ptr %add.ptr19.i.i.i
}

define ptr @"4"(ptr %new_range.i.i, ptr %end_size_.i, ptr %el, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !14
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !11
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !18
  ret ptr %add.ptr6.i.i
}

define i64 @"5"(ptr %add.ptr.i113, ptr %cond.i31.i.i.i, i64 %sub.ptr.lhs.cast.i.i.i.i.i, ptr %count_vector, i64 %0) {
bb:
  %1 = load i64, ptr %add.ptr.i113, align 4
  %2 = load ptr, ptr %count_vector, align 8, !tbaa !11
  %sub.ptr.rhs.cast.i.i.i.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, %0
  %add.ptr.i.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %cond.i31.i.i.i, i64 %sub.ptr.div.i.i.i.i.i
  store i64 %1, ptr %add.ptr.i.i.i, align 4
  ret i64 %1
}

define <2 x i32> @"6"(ptr %degrees, ptr %.omp.lb, i64 %0, i64 %index) {
bb:
  %1 = load ptr, ptr %degrees, align 8, !tbaa !4
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %mul12 = shl i64 %2, %0
  %offset.idx = add i64 %mul12, %index
  %3 = getelementptr inbounds i32, ptr %1, i64 %offset.idx
  %wide.load = load <2 x i32>, ptr %3, align 4, !tbaa !0
  ret <2 x i32> %wide.load
}

define ptr @"7"(ptr %cond.i31.i.i.i, i64 %.sroa.speculated.i.i.i.i, ptr %_M_finish.i.i114, i64 %0, ptr %count_vector, i64 %1, i64 %sub.ptr.div.i.i.i.i.i, i1 %cmp9.i.i.i.i, i64 %2, i64 %add.i.i.i.i, ptr %_M_end_of_storage.i.i277) {
bb:
  %3 = load ptr, ptr %count_vector, align 8, !tbaa !11
  %sub.ptr.rhs.cast.i.i.i.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %_M_finish.i.i114, align 8, !tbaa !19
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %4, i64 %0
  %sub.ptr.lhs.cast.i.i.i.i.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i2 = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, %1
  %add.i.i.i.i4 = add i64 %.sroa.speculated.i.i.i.i, %sub.ptr.div.i.i.i.i.i
  %cmp7.i.i.i.i = icmp ult i64 %add.i.i.i.i, %sub.ptr.div.i.i.i.i.i
  %or.cond.i.i.i.i = or i1 %cmp7.i.i.i.i, %cmp9.i.i.i.i
  %cond.i.i.i.i = select i1 %or.cond.i.i.i.i, i64 %2, i64 %add.i.i.i.i
  %add.ptr19.i.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %cond.i31.i.i.i, i64 %cond.i.i.i.i
  store ptr %add.ptr19.i.i.i, ptr %_M_end_of_storage.i.i277, align 8, !tbaa !16
  ret ptr %add.ptr19.i.i.i
}

define ptr @"8"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !11
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !18
  ret ptr %add.ptr6.i.i
}

define ptr @"9"(ptr %out_index_.i, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %2 = sext i32 %1 to i64
  %indvars.iv.next = add nsw i64 %2, %0
  %3 = load ptr, ptr %out_index_.i, align 8, !tbaa !20, !noalias !23
  %arrayidx.i.i.i = getelementptr inbounds ptr, ptr %3, i64 %indvars.iv.next
  %4 = load ptr, ptr %arrayidx.i.i.i, align 8, !tbaa !11
  ret ptr %4
}

define i32 @"10"(ptr %__i.sroa.0.042.i.ptr, ptr %__first.coerce) {
bb:
  %0 = load i64, ptr %__i.sroa.0.042.i.ptr, align 4
  %__val.sroa.0.0.extract.trunc.i = trunc i64 %0 to i32
  store i32 %__val.sroa.0.0.extract.trunc.i, ptr %__first.coerce, align 4, !tbaa !26
  ret i32 %__val.sroa.0.0.extract.trunc.i
}

define ptr @"11"(ptr %new_range.i.i457, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1, ptr %el, ptr %end_capacity_.i.i.i) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !12
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !14
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %2 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !11
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !18
  ret ptr %add.ptr6.i.i478
}

define i32 @"13"(ptr %n_start.0.in, i64 %0, ptr %diffs, ptr %.omp.lb) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !11
  %sub.ptr.lhs.cast = ptrtoint ptr %n_start.0 to i64
  %.pre134 = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %.pre134
  %1 = lshr exact i64 %sub.ptr.sub, %0
  %conv22 = trunc i64 %1 to i32
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %3 = sext i32 %2 to i64
  %4 = load ptr, ptr %diffs, align 8, !tbaa !4
  %arrayidx.i99 = getelementptr inbounds i32, ptr %4, i64 %3
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !0
  ret i32 %conv22
}

define i64 @"14"(i64 %val.coerce, ptr %new_range.i, ptr %end_size_.i, ptr %this, i64 %0) {
bb:
  %1 = load ptr, ptr %end_size_.i, align 8, !tbaa !14
  %sub.ptr.lhs.cast.i10.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %this, align 8, !tbaa !12
  %sub.ptr.rhs.cast.i11.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i12.i = sub i64 %sub.ptr.lhs.cast.i10.i, %sub.ptr.rhs.cast.i11.i
  %sub.ptr.div.i13.i = ashr exact i64 %sub.ptr.sub.i12.i, %0
  %3 = load ptr, ptr %new_range.i, align 8, !tbaa !11
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div.i13.i
  store i64 %val.coerce, ptr %add.ptr.i, align 4, !tbaa.struct !15
  ret i64 %val.coerce
}

define i64 @"15"(i64 %local_total.039, ptr %arrayidx.i35, ptr %prefix, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %prefix, align 8
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %mul14 = shl i64 %2, %0
  %arrayidx.i34 = getelementptr inbounds i64, ptr %1, i64 %mul14
  %3 = load i32, ptr %arrayidx.i35, align 4, !tbaa !0
  %conv = sext i32 %3 to i64
  %add19 = add nsw i64 %local_total.039, %conv
  store i64 %add19, ptr %arrayidx.i34, align 8, !tbaa !7
  ret i64 %add19
}

define i32 @"16"(ptr %add.ptr3.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !0
  %1 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !0
  %cmp.i.i.i.i.i = icmp slt i32 %1, %0
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add.ptr4.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i.i.i.i
  %2 = load i32, ptr %add.ptr3.i.i.i.i, align 4, !tbaa !0
  store i32 %2, ptr %add.ptr4.i.i.i.i, align 4, !tbaa !0
  ret i32 %2
}

define i64 @"17"(ptr %_M_b.i, ptr %__param, i64 %0, ptr %_M_b.i32) {
bb:
  %1 = load i64, ptr %_M_b.i, align 8, !tbaa !28
  %2 = load i64, ptr %__param, align 8, !tbaa !30
  %sub = sub i64 %1, %2
  %div31 = lshr i64 %sub, %0
  store i64 %div31, ptr %_M_b.i32, align 8, !tbaa !28
  ret i64 %div31
}

define ptr @"18"(ptr %new_range.i.i457, ptr %new_range.i.i, i64 %0, ptr %el, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !12
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !11
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %2 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !11
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !18
  ret ptr %add.ptr6.i.i478
}

define i32 @"19"(ptr %call171, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %0, i64 %1, i64 %total_missing_inv.1659) {
bb:
  %2 = load i64, ptr %arrayidx.i540, align 8, !tbaa !7
  %3 = load i32, ptr %arrayidx.i541, align 4, !tbaa !0
  %conv198 = sext i32 %3 to i64
  %add199 = add nsw i64 %2, %conv198
  %4 = load i64, ptr %arrayidx.i542, align 8, !tbaa !7
  %5 = sub i64 %4, %add199
  %n.vec793 = and i64 %5, %0
  %ind.end794 = sub i64 %4, %n.vec793
  %i200.0 = add nsw i64 %ind.end794, %1
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !0
  %.pre731 = sext i32 %.pre717 to i64
  %sub222 = sub nsw i64 %total_missing_inv.1659, %.pre731
  %sub211 = sub nsw i64 %i200.0, %sub222
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %6 = load i32, ptr %arrayidx212, align 4, !tbaa !0
  ret i32 %6
}

define i64 @"20"(ptr %arrayidx.i140, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i143, i64 %4, i64 %5, i64 %xor4.i146, i64 %6, i64 %xor7.i149, ptr %num_nodes_, i64 %7, ptr %arrayidx.i65, i64 %xor.i67, i64 %xor4.i, i64 %xor7.i, i32 %8, ptr %el, ptr %.omp.lb) {
bb:
  %9 = load ptr, ptr %el, align 8, !tbaa !12
  %10 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %mul = shl i64 %10, %6
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %9, i64 %mul
  %11 = load i64, ptr %arrayidx.i65, align 8, !tbaa !7
  %shr.i66 = lshr i64 %11, %0
  %and.i = and i64 %shr.i66, %1
  %xor.i672 = xor i64 %and.i, %11
  %shl.i = shl i64 %xor.i67, %2
  %and3.i = and i64 %shl.i, %3
  %xor4.i4 = xor i64 %and3.i, %xor.i67
  %shl5.i = shl i64 %xor4.i, %4
  %and6.i = and i64 %shl5.i, %5
  %xor7.i6 = xor i64 %and6.i, %xor4.i
  %shr8.i = lshr i64 %xor7.i, %6
  %xor9.i = xor i64 %shr8.i, %xor7.i
  %conv7.i = trunc i64 %xor9.i to i32
  %rem.i = urem i32 %conv7.i, %8
  %ref.tmp16.sroa.0.0.insert.ext = zext i32 %rem.i to i64
  %12 = load i64, ptr %arrayidx.i140, align 8, !tbaa !7
  %shr.i141 = lshr i64 %12, %0
  %and.i142 = and i64 %shr.i141, %1
  %xor.i1438 = xor i64 %and.i142, %12
  %shl.i144 = shl i64 %xor.i143, %2
  %and3.i145 = and i64 %shl.i144, %3
  %xor4.i14610 = xor i64 %and3.i145, %xor.i143
  %shl5.i147 = shl i64 %xor4.i146, %4
  %and6.i148 = and i64 %shl5.i147, %5
  %xor7.i14912 = xor i64 %and6.i148, %xor4.i146
  %shr8.i150 = lshr i64 %xor7.i149, %6
  %xor9.i151 = xor i64 %shr8.i150, %xor7.i149
  %conv7.i54 = trunc i64 %xor9.i151 to i32
  %13 = load i64, ptr %num_nodes_, align 8, !tbaa !31
  %14 = trunc i64 %13 to i32
  %rem.i52 = urem i32 %conv7.i54, %8
  %ref.tmp16.sroa.4.0.insert.ext = zext i32 %rem.i52 to i64
  %ref.tmp16.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp16.sroa.4.0.insert.ext, %7
  %ref.tmp16.sroa.0.0.insert.insert = or i64 %ref.tmp16.sroa.4.0.insert.shift, %ref.tmp16.sroa.0.0.insert.ext
  store i64 %ref.tmp16.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp16.sroa.0.0.insert.insert
}

define i32 @"21"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %el, align 8, !tbaa !12
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %ind.end
  %add.ptr.sroa_idx = getelementptr inbounds i8, ptr %add.ptr, i64 %2
  %6 = load i32, ptr %add.ptr.sroa_idx, align 4
  ret i32 %6
}

define i64 @"22"(ptr %arrayidx.i59, ptr %agg.result, ptr %end_size_.i, ptr %degrees, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i59, align 8, !tbaa !7
  %2 = load ptr, ptr %agg.result, align 8, !tbaa !33
  %3 = load ptr, ptr %degrees, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i62 = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %end_size_.i, align 8, !tbaa !35
  %sub.ptr.lhs.cast.i61 = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i63 = sub i64 %sub.ptr.lhs.cast.i61, %sub.ptr.rhs.cast.i62
  %sub.ptr.div.i64 = ashr exact i64 %sub.ptr.sub.i63, %0
  %arrayidx.i65 = getelementptr inbounds i64, ptr %2, i64 %sub.ptr.div.i64
  store i64 %1, ptr %arrayidx.i65, align 8, !tbaa !7
  ret i64 %1
}

define i32 @"23"(ptr %neighs, ptr %arrayidx.i523) {
bb:
  %0 = load ptr, ptr %neighs, align 8, !tbaa !11
  %1 = load i64, ptr %arrayidx.i523, align 8, !tbaa !7
  %add.ptr = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %add.ptr, align 4, !tbaa !0
  ret i32 %2
}

define <4 x i32> @"25"(<4 x i32> %0, ptr %init_val, i64 %1, ptr %this, ptr %.omp.lb, i64 %index, i64 %2) {
bb:
  %3 = load i32, ptr %init_val, align 4, !tbaa !0, !alias.scope !36
  %broadcast.splatinsert21 = insertelement <4 x i32> %0, i32 %3, i64 %1
  %broadcast.splat22 = shufflevector <4 x i32> %broadcast.splatinsert21, <4 x i32> %0, <4 x i32> zeroinitializer
  %4 = load ptr, ptr %this, align 8, !tbaa !4
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %offset.idx = add i64 %5, %index
  %6 = getelementptr inbounds i32, ptr %4, i64 %offset.idx
  %7 = getelementptr inbounds i32, ptr %6, i64 %2
  store <4 x i32> %broadcast.splat22, ptr %7, align 4, !tbaa !0, !alias.scope !39, !noalias !36
  ret <4 x i32> %broadcast.splat22
}

define i32 @"26"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !4
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add.ptr.prol = getelementptr inbounds i32, ptr %2, i64 %ind.end
  %5 = load i32, ptr %init_val, align 4, !tbaa !0
  store i32 %5, ptr %add.ptr.prol, align 4, !tbaa !0
  ret i32 %5
}

define <2 x i64> @"27"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %rng, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
bb:
  %10 = load i64, ptr %rng, align 8, !tbaa !7
  %vector.recur.init89 = insertelement <2 x i64> %2, i64 %10, i64 %3
  %wide.load91 = load <2 x i64>, ptr %0, align 8, !tbaa !7
  %11 = shufflevector <2 x i64> %vector.recur.init89, <2 x i64> %wide.load91, <2 x i32> <i32 1, i32 2>
  %12 = and <2 x i64> %11, %4
  %13 = and <2 x i64> %wide.load91, %1
  %14 = or <2 x i64> %13, %12
  %15 = lshr exact <2 x i64> %14, %5
  %wide.load92 = load <2 x i64>, ptr %6, align 8, !tbaa !7
  %16 = xor <2 x i64> %15, %wide.load92
  %17 = and <2 x i64> %wide.load91, %5
  %18 = icmp eq <2 x i64> %17, %7
  %19 = select <2 x i1> %18, <2 x i64> %7, <2 x i64> %8
  %20 = xor <2 x i64> %16, %19
  store <2 x i64> %20, ptr %9, align 8, !tbaa !7
  ret <2 x i64> %20
}

define i32 @"28"(ptr %degrees, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %mul12 = shl i64 %1, %0
  %2 = load ptr, ptr %degrees, align 8, !tbaa !4
  %arrayidx.i31 = getelementptr inbounds i32, ptr %2, i64 %mul12
  %3 = load i32, ptr %arrayidx.i31, align 4, !tbaa !0
  ret i32 %3
}

define i32 @"29"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0, i64 %1) {
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

define i64 @"30"(ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %__i.018.i, ptr %arrayidx7.i) {
bb:
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %add10 = add i64 %5, %0
  %rem.i.i.i = and i64 %add10, %1
  %shr.i = lshr i64 %rem.i.i.i, %2
  %xor.i = xor i64 %shr.i, %3
  %mul.i = mul nuw nsw i64 %xor.i, %4
  %add.i = add nuw i64 %mul.i, %__i.018.i
  %rem.i.i17.i = and i64 %add.i, %1
  store i64 %rem.i.i17.i, ptr %arrayidx7.i, align 8, !tbaa !7
  ret i64 %rem.i.i17.i
}

define ptr @"31"(ptr %new_range.i.i, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %0) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !11
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !14
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !14
  ret ptr %add.ptr.i
}

define i64 @"32"(i64 %0, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %this, align 8, !tbaa !11
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %1
  %_M_string_length.i24.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i, i32 1
  store i64 %0, ptr %_M_string_length.i24.i.i.i, align 8, !tbaa !41
  ret i64 %0
}

define ptr @"33"(ptr %new_range.i.i457, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_capacity_.i.i.i) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !12
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %3 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !11
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !18
  ret ptr %add.ptr6.i.i478
}

define <4 x i32> @"34"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.1659, ptr %arrayidx.i541, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !7
  %3 = add i64 %2, %0
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !0
  %.pre731 = sext i32 %.pre717 to i64
  %sub222 = sub nsw i64 %total_missing_inv.1659, %.pre731
  %4 = sub nsw i64 %3, %sub222
  %5 = getelementptr inbounds i32, ptr %call171, i64 %4
  %6 = getelementptr inbounds i32, ptr %5, i64 %1
  %wide.load803 = load <4 x i32>, ptr %6, align 4, !tbaa !0
  ret <4 x i32> %wide.load803
}

define i32 @"35"(ptr %n_start.0.in, i64 %0) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !11
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %1 = load i32, ptr %incdec.ptr12.i.i.i.i, align 4, !tbaa !0
  ret i32 %1
}

define ptr @"36"(ptr %this, i64 %__code, ptr %_M_bucket_count) {
bb:
  %0 = load i64, ptr %_M_bucket_count, align 8, !tbaa !44
  %rem.i.i.i = urem i64 %__code, %0
  %1 = load ptr, ptr %this, align 8, !tbaa !49
  %arrayidx.i = getelementptr inbounds ptr, ptr %1, i64 %rem.i.i.i
  %2 = load ptr, ptr %arrayidx.i, align 8, !tbaa !11
  ret ptr %2
}

define ptr @"37"(ptr %new_range.i.i457, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1, ptr %el) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !12
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !14
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %2 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !11
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !14
  ret ptr %add.ptr.i464
}

define i64 @"38"(ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57.2) {
bb:
  %0 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !7
  %1 = load i64, ptr %arrayidx.i58, align 8, !tbaa !7
  %add7 = add nsw i64 %1, %total.076
  %add7.1 = add nsw i64 %0, %add7
  store i64 %add7.1, ptr %arrayidx.i57.2, align 8, !tbaa !7
  ret i64 %add7.1
}

define i64 @"39"(ptr %arrayidx.i535, i64 %total_missing_inv.0649, ptr %arrayidx.i536, ptr %offsets, i64 %indvars.iv691) {
bb:
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !33
  %arrayidx.i5352 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %indvars.iv691
  %0 = load i32, ptr %arrayidx.i536, align 4, !tbaa !0
  %conv155 = sext i32 %0 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %1 = load i64, ptr %arrayidx.i535, align 8, !tbaa !7
  %add152 = add nsw i64 %1, %add156
  store i64 %add152, ptr %arrayidx.i535, align 8, !tbaa !7
  ret i64 %add152
}

define i64 @"40"(ptr %arrayidx3.i.i91, i64 %0, ptr %1, i64 %2, i64 %3, ptr %arrayidx7.i.i95, i64 %4, i64 %5, ptr %arrayidx.i.i88) {
bb:
  %wide.load392 = load <2 x i64>, ptr %1, align 8, !tbaa !7
  %vector.recur.extract395 = extractelement <2 x i64> %wide.load392, i64 %2
  %and.i.i89 = and i64 %vector.recur.extract395, %3
  %6 = load i64, ptr %arrayidx3.i.i91, align 8, !tbaa !7
  %and4.i.i92 = and i64 %6, %0
  %or.i.i93 = or i64 %and4.i.i92, %and.i.i89
  %shr.i.i96 = lshr exact i64 %or.i.i93, %2
  %7 = load i64, ptr %arrayidx7.i.i95, align 8, !tbaa !7
  %xor.i.i97 = xor i64 %shr.i.i96, %7
  %and8.i.i98 = and i64 %6, %2
  %tobool.not.i.i99 = icmp eq i64 %and8.i.i98, %4
  %cond.i.i100 = select i1 %tobool.not.i.i99, i64 %4, i64 %5
  %xor9.i.i101 = xor i64 %xor.i.i97, %cond.i.i100
  store i64 %xor9.i.i101, ptr %arrayidx.i.i88, align 8, !tbaa !7
  ret i64 %xor9.i.i101
}

define i32 @"41"(ptr %add.ptr.i.i, ptr %__first, ptr %add.ptr.i, ptr %add.ptr2.i, i64 %sub1.i, i64 %mul.i) {
bb:
  %0 = load i32, ptr %add.ptr.i.i, align 4, !tbaa !0
  %1 = load i32, ptr %add.ptr2.i, align 4, !tbaa !0
  %2 = load i32, ptr %add.ptr.i, align 4, !tbaa !0
  %cmp.i.i = icmp slt i32 %2, %1
  %spec.select.i = select i1 %cmp.i.i, i64 %sub1.i, i64 %mul.i
  %add.ptr2.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i
  store i32 %0, ptr %add.ptr2.i.i, align 4, !tbaa !0
  ret i32 %0
}

define ptr @"42"(ptr %new_range.i.i, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !12
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !11
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !14
  ret ptr %add.ptr.i464
}

define i32 @"43"(ptr %arrayidx.i37, ptr %comp, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %arrayidx.i37, align 4, !tbaa !0
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %2 = sext i32 %1 to i64
  %3 = load ptr, ptr %comp, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i32, ptr %3, i64 %2
  store i32 %0, ptr %arrayidx.i, align 4, !tbaa !0
  ret i32 %0
}

define i32 @"44"(ptr %__first, ptr %add.ptr.i, ptr %add.ptr2.i, i64 %sub1.i, i64 %mul.i, i64 %0, i64 %1) {
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

define i32 @"45"(ptr %end_size_.i.i583, i64 %sub.ptr.rhs.cast.i.i585, i64 %0, ptr %length.i581) {
bb:
  %1 = load ptr, ptr %end_size_.i.i583, align 8, !tbaa !50
  %sub.ptr.lhs.cast.i.i584 = ptrtoint ptr %1 to i64
  %sub.ptr.sub.i.i586 = sub i64 %sub.ptr.lhs.cast.i.i584, %sub.ptr.rhs.cast.i.i585
  %2 = lshr exact i64 %sub.ptr.sub.i.i586, %0
  %conv.i587 = trunc i64 %2 to i32
  store i32 %conv.i587, ptr %length.i581, align 4, !tbaa !0
  ret i32 %conv.i587
}

define i64 @"46"(ptr %__begin0.sroa.0.060, i64 %0, ptr %1) {
bb:
  %2 = load i64, ptr %__begin0.sroa.0.060, align 4
  %retval.sroa.2.0.insert.ext.i = shl i64 %2, %0
  %kvp.sroa.5.0.extract.shift = lshr i64 %2, %0
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.ext.i, %kvp.sroa.5.0.extract.shift
  store i64 %retval.sroa.0.0.insert.insert.i, ptr %1, align 4
  ret i64 %retval.sroa.0.0.insert.insert.i
}

define i32 @"47"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %incdec.ptr122.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %1 = load i32, ptr %incdec.ptr122.i.i, align 4, !tbaa !51
  ret i32 %1
}

define i8 @"49"(ptr %arrayidx.i17.i, ptr %ref.tmp, i64 %conv5.i, i64 %idxprom1.i.i) {
bb:
  %0 = load i8, ptr %arrayidx.i17.i, align 1, !tbaa !53, !noalias !54
  %1 = load ptr, ptr %ref.tmp, align 8, !tbaa !57, !alias.scope !54
  %arrayidx.i.i = getelementptr inbounds i8, ptr %1, i64 %conv5.i
  %arrayidx2.i.i = getelementptr inbounds i8, ptr %arrayidx.i.i, i64 %idxprom1.i.i
  store i8 %0, ptr %arrayidx2.i.i, align 1, !tbaa !53
  ret i8 %0
}

define i64 @"50"(ptr %add.ptr.i113, ptr %cond.i31.i.i.i, i64 %0, ptr %count_vector, i64 %1, i64 %2, i64 %3) {
bb:
  %4 = load i64, ptr %add.ptr.i113, align 4
  %5 = load ptr, ptr %count_vector, align 8, !tbaa !11
  %6 = ptrtoint ptr %5 to i64
  %7 = sub i64 %0, %6
  %8 = lshr i64 %7, %1
  %9 = add nuw nsw i64 %8, %2
  %n.vec = and i64 %9, %3
  %10 = shl i64 %n.vec, %1
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i, i64 %10
  %incdec.ptr.i.i.i = getelementptr %"struct.std::pair.8", ptr %ind.end, i64 %2
  store i64 %4, ptr %incdec.ptr.i.i.i, align 4
  ret i64 %4
}

define i64 @"51"(ptr %new_range.i.i, i64 %0, i64 %1) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !11
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr13.i.i.i.i, i64 %1
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.030.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i64 @"52"(ptr %new_range.i.i, i64 %0) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !11
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !15
  ret i64 %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i
}

define ptr @"53"(ptr %el, i64 %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !14
  ret ptr %add.ptr.i
}

define i32 @"54"(ptr %arrayidx212, ptr %call171, i64 %tail_index.0660, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %0) {
bb:
  %1 = load i32, ptr %arrayidx212, align 4, !tbaa !0
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !0
  %.pre731 = sext i32 %.pre717 to i64
  %2 = load i64, ptr %arrayidx.i540, align 8, !tbaa !7
  %3 = load i32, ptr %arrayidx.i541, align 4, !tbaa !0
  %conv198 = sext i32 %3 to i64
  %add199 = add nsw i64 %2, %conv198
  %4 = load i64, ptr %arrayidx.i542, align 8, !tbaa !7
  %5 = sub i64 %4, %add199
  %n.vec793 = and i64 %5, %0
  %ind.end796 = sub i64 %tail_index.0660, %n.vec793
  %sub226 = sub nsw i64 %ind.end796, %.pre731
  %arrayidx213 = getelementptr inbounds i32, ptr %call171, i64 %sub226
  store i32 %1, ptr %arrayidx213, align 4, !tbaa !0
  ret i32 %1
}

define i64 @"55"(ptr %__begin0.sroa.0.060, i64 %0, ptr %_M_finish.i38, i64 %1) {
bb:
  %2 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !19
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %2, i64 %1
  %3 = load i64, ptr %__begin0.sroa.0.060, align 4
  %kvp.sroa.5.0.extract.shift = lshr i64 %3, %0
  %retval.sroa.2.0.insert.ext.i = shl i64 %3, %0
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.ext.i, %kvp.sroa.5.0.extract.shift
  store i64 %retval.sroa.0.0.insert.insert.i, ptr %incdec.ptr.i.i, align 4
  ret i64 %retval.sroa.0.0.insert.insert.i
}

define i8 @"56"(ptr %label) {
bb:
  %0 = load ptr, ptr %label, align 8, !tbaa !57, !noalias !58
  %1 = load i8, ptr %0, align 1, !tbaa !53
  ret i8 %1
}

define i32 @"57"(ptr %call171, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %0, i64 %1, i64 %total_missing_inv.0649, ptr %arrayidx.i536) {
bb:
  %2 = load i64, ptr %arrayidx.i540, align 8, !tbaa !7
  %3 = load i32, ptr %arrayidx.i541, align 4, !tbaa !0
  %conv198 = sext i32 %3 to i64
  %add199 = add nsw i64 %2, %conv198
  %4 = load i64, ptr %arrayidx.i542, align 8, !tbaa !7
  %5 = sub i64 %4, %add199
  %n.vec793 = and i64 %5, %0
  %ind.end794 = sub i64 %4, %n.vec793
  %i200.0 = add nsw i64 %ind.end794, %1
  %6 = load i32, ptr %arrayidx.i536, align 4, !tbaa !0
  %conv155 = sext i32 %6 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %sub211 = sub nsw i64 %i200.0, %add156
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %7 = load i32, ptr %arrayidx212, align 4, !tbaa !0
  ret i32 %7
}

define i64 @"58"(ptr %arrayidx.i, ptr %prefix, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %prefix, align 8
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %mul14 = shl i64 %2, %0
  %arrayidx.i34 = getelementptr inbounds i64, ptr %1, i64 %mul14
  %3 = load i64, ptr %arrayidx.i, align 8, !tbaa !7
  store i64 %3, ptr %arrayidx.i34, align 8, !tbaa !7
  ret i64 %3
}

define ptr @"59"(ptr %new_range.i.i, ptr %end_size_.i, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !14
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !11
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !18
  ret ptr %add.ptr6.i.i
}

define i32 @"60"(ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !51
  %3 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !51
  %cmp.i.i.i.i.i = icmp eq i32 %3, %2
  %cmp7.i.i.i.i.i = icmp slt i32 %3, %2
  %4 = load i32, ptr %v3.i.i.i.i.i, align 4
  %5 = load i32, ptr %v.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %5, %4
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %__parent.020.in.i.i.i.i = add nsw i64 %spec.select.i.i.i, %0
  %__parent.020.i.i.i.i = sdiv i64 %__parent.020.in.i.i.i.i, %1
  %add.ptr.i.i.i.i16 = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %__parent.020.i.i.i.i
  %6 = load i32, ptr %add.ptr.i.i.i.i16, align 4, !tbaa !51
  ret i32 %6
}

define ptr @"61"(ptr %count, ptr %__begin1.0264, ptr %_M_bucket_count.i.i) {
bb:
  %0 = load ptr, ptr %count, align 8, !tbaa !49
  %1 = load i32, ptr %__begin1.0264, align 4, !tbaa !0
  %conv.i.i.i.i = sext i32 %1 to i64
  %2 = load i64, ptr %_M_bucket_count.i.i, align 8
  %rem.i.i.i.i.i = urem i64 %conv.i.i.i.i, %2
  %arrayidx.i.i.i.i = getelementptr inbounds ptr, ptr %0, i64 %rem.i.i.i.i.i
  %3 = load ptr, ptr %arrayidx.i.i.i.i, align 8, !tbaa !11
  ret ptr %3
}

define i64 @"62"(ptr %rng, i64 %0, ptr %arrayidx42.i.i124, i64 %1, i64 %2, ptr %arrayidx49.i.i128, i64 %3, i64 %4) {
bb:
  %5 = load i64, ptr %rng, align 8, !tbaa !7
  %and46.i.i126 = and i64 %5, %0
  %6 = load i64, ptr %arrayidx42.i.i124, align 8, !tbaa !7
  %and43.i.i125 = and i64 %6, %1
  %or47.i.i127 = or i64 %and46.i.i126, %and43.i.i125
  %shr50.i.i129 = lshr exact i64 %or47.i.i127, %2
  %7 = load i64, ptr %arrayidx49.i.i128, align 8, !tbaa !7
  %xor51.i.i130 = xor i64 %shr50.i.i129, %7
  %and52.i.i131 = and i64 %5, %2
  %tobool53.not.i.i132 = icmp eq i64 %and52.i.i131, %3
  %cond54.i.i133 = select i1 %tobool53.not.i.i132, i64 %3, i64 %4
  %xor55.i.i134 = xor i64 %xor51.i.i130, %cond54.i.i133
  store i64 %xor55.i.i134, ptr %arrayidx42.i.i124, align 8, !tbaa !7
  ret i64 %xor55.i.i134
}

define i64 @"63"(ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57.3) {
bb:
  %0 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !7
  %1 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !7
  %2 = load i64, ptr %arrayidx.i58, align 8, !tbaa !7
  %add7 = add nsw i64 %2, %total.076
  %add7.1 = add nsw i64 %1, %add7
  %add7.2 = add nsw i64 %0, %add7.1
  store i64 %add7.2, ptr %arrayidx.i57.3, align 8, !tbaa !7
  ret i64 %add7.2
}

define ptr @"64"(ptr %new_range.i.i, ptr %el, i64 %0, ptr %end_size_.i, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !14
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre709 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !11
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !18
  ret ptr %add.ptr6.i.i
}

define ptr @"65"(ptr %call.i, ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, i64 %2, ptr %end_size_.i40) {
bb:
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !35
  %sub.ptr.lhs.cast.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %degrees, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %sub = add nsw i64 %sub.ptr.div.i, %1
  %div38 = lshr i64 %sub, %2
  %add.ptr.i = getelementptr inbounds i64, ptr %call.i, i64 %div38
  store ptr %add.ptr.i, ptr %end_size_.i40, align 8, !tbaa !50
  ret ptr %add.ptr.i
}

define i64 @"66"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !61
  %inc.i71 = add nuw nsw i64 %1, %0
  %inc.i207 = add nuw nsw i64 %inc.i71, %0
  %inc.i139 = add nuw nsw i64 %inc.i207, %0
  store i64 %inc.i139, ptr %_M_p.i.i.i, align 8, !tbaa !61
  ret i64 %inc.i139
}

define i64 @"67"(ptr %add.ptr.i.i.i.i16, ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i64, ptr %add.ptr.i.i.i.i16, align 4
  %1 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !51
  %2 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !51
  %cmp.i.i.i.i.i = icmp eq i32 %2, %1
  %cmp7.i.i.i.i.i = icmp slt i32 %2, %1
  %3 = load i32, ptr %v3.i.i.i.i.i, align 4
  %4 = load i32, ptr %v.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %4, %3
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr2.i.i.i.i23 = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  store i64 %0, ptr %add.ptr2.i.i.i.i23, align 4
  ret i64 %0
}

define ptr @"68"(ptr %index.i139, ptr %0) {
bb:
  %1 = load ptr, ptr %index.i139, align 8, !tbaa !11
  store ptr %1, ptr %0, align 8
  ret ptr %1
}

define i64 @"69"(ptr %arrayidx.i58.epil, i64 %total.076.epil, ptr %call.i4145, ptr %num_blocks) {
bb:
  %0 = load i64, ptr %num_blocks, align 8, !tbaa !7
  %arrayidx.i = getelementptr inbounds i64, ptr %call.i4145, i64 %0
  %1 = load i64, ptr %arrayidx.i58.epil, align 8, !tbaa !7
  %add7.epil = add nsw i64 %1, %total.076.epil
  store i64 %add7.epil, ptr %arrayidx.i, align 8, !tbaa !7
  ret i64 %add7.epil
}

define i64 @"70"(ptr %_M_string_length.i.i.i, i64 %call, ptr %__dnew.i.i.i) {
bb:
  %0 = load i64, ptr %_M_string_length.i.i.i, align 8, !tbaa !41, !noalias !63
  %sub.i.i.i = sub i64 %0, %call
  store i64 %sub.i.i.i, ptr %__dnew.i.i.i, align 8, !tbaa !7, !noalias !63
  ret i64 %sub.i.i.i
}

define i64 @"71"(ptr %arrayidx.i25, i64 %0, ptr %arrayidx.i23, ptr %el, ptr %.omp.lb) {
bb:
  %1 = load i32, ptr %arrayidx.i23, align 4, !tbaa !0
  %ref.tmp.sroa.0.0.insert.ext = zext i32 %1 to i64
  %2 = load i32, ptr %arrayidx.i25, align 4, !tbaa !0
  %ref.tmp.sroa.4.0.insert.ext = zext i32 %2 to i64
  %ref.tmp.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp.sroa.4.0.insert.ext, %0
  %ref.tmp.sroa.0.0.insert.insert = or i64 %ref.tmp.sroa.4.0.insert.shift, %ref.tmp.sroa.0.0.insert.ext
  %3 = load ptr, ptr %el, align 8, !tbaa !12
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %4
  store i64 %ref.tmp.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp.sroa.0.0.insert.insert
}

define i32 @"72"(ptr %call171, ptr %arrayidx.i547, ptr %arrayidx.i546) {
bb:
  %0 = load i32, ptr %arrayidx.i546, align 4, !tbaa !0
  %conv246 = sext i32 %0 to i64
  %1 = load i64, ptr %arrayidx.i547, align 8, !tbaa !7
  %add247 = add nsw i64 %1, %conv246
  %arrayidx257 = getelementptr inbounds i32, ptr %call171, i64 %add247
  %2 = load i32, ptr %arrayidx257, align 4, !tbaa !0
  ret i32 %2
}

define ptr @"73"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, ptr %.omp.lb, i64 %1) {
bb:
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %3 = sext i32 %2 to i64
  %4 = add nsw i64 %3, %1
  %5 = load i8, ptr %transpose, align 1, !tbaa !66, !range !67, !noundef !68
  %tobool.not = icmp eq i8 %5, %0
  %6 = load ptr, ptr %in_index_.i, align 8
  %7 = load ptr, ptr %out_index_.i, align 8
  %.sink = select i1 %tobool.not, ptr %7, ptr %6
  %arrayidx.i.i.i60 = getelementptr inbounds ptr, ptr %.sink, i64 %4
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !11
  ret ptr %n_end.0
}

define i32 @"74"(ptr %n_start.0.in, i64 %0, i64 %1, ptr %diffs, ptr %.omp.lb) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !11
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr12.i.i.i.i to i64
  %.pre134 = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %.pre134
  %2 = lshr exact i64 %sub.ptr.sub, %1
  %conv22 = trunc i64 %2 to i32
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %4 = sext i32 %3 to i64
  %5 = load ptr, ptr %diffs, align 8, !tbaa !4
  %arrayidx.i99 = getelementptr inbounds i32, ptr %5, i64 %4
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !0
  ret i32 %conv22
}

define i64 @"75"(ptr %offsets, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %1 = sext i32 %0 to i64
  %2 = load ptr, ptr %offsets, align 8, !tbaa !33
  %arrayidx.i = getelementptr inbounds i64, ptr %2, i64 %1
  %3 = load i64, ptr %arrayidx.i, align 8, !tbaa !7
  ret i64 %3
}

define <2 x i64> @"76"(ptr %0, ptr %offsets, ptr %num_nodes_.i, i64 %1, i64 %index770, i64 %2) {
bb:
  %3 = load ptr, ptr %offsets, align 8
  %4 = load i64, ptr %num_nodes_.i, align 8, !tbaa !69
  %5 = and i64 %4, %1
  %offset.idx = sub i64 %5, %index770
  %6 = getelementptr inbounds i64, ptr %3, i64 %offset.idx
  %7 = getelementptr inbounds i64, ptr %6, i64 %2
  %wide.load = load <2 x i64>, ptr %0, align 8, !tbaa !7
  store <2 x i64> %wide.load, ptr %7, align 8, !tbaa !7
  ret <2 x i64> %wide.load
}

define i64 @"77"(ptr %offsets, ptr %num_nodes_.i) {
bb:
  %.pre714 = load i64, ptr %num_nodes_.i, align 8, !tbaa !69
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !33
  %arrayidx.i533 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %.pre714
  %0 = load i64, ptr %arrayidx.i533, align 8, !tbaa !7
  ret i64 %0
}

define i64 @"78"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !33
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !69
  %sext = shl i64 %2, %0
  %conv202 = ashr exact i64 %sext, %0
  %arrayidx.i542 = getelementptr inbounds i64, ptr %1, i64 %conv202
  %3 = load i64, ptr %arrayidx.i542, align 8, !tbaa !7
  ret i64 %3
}

define ptr @"79"(ptr %neighs, ptr %arrayidx.i.1, ptr %index, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !7
  %2 = load ptr, ptr %neighs, align 8, !tbaa !11
  %add.ptr.1 = getelementptr inbounds i32, ptr %2, i64 %1
  %3 = load ptr, ptr %index, align 8, !tbaa !11
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %5 = sext i32 %4 to i64
  %indvars.iv.next = add nsw i64 %5, %0
  %arrayidx.1 = getelementptr inbounds ptr, ptr %3, i64 %indvars.iv.next
  store ptr %add.ptr.1, ptr %arrayidx.1, align 8, !tbaa !11
  ret ptr %add.ptr.1
}

define i32 @"80"(ptr %comp) {
bb:
  %0 = load ptr, ptr %comp, align 8, !tbaa !4
  %1 = load i32, ptr %0, align 4, !tbaa !0
  ret i32 %1
}

define ptr @"81"(ptr %cond.i31.i.i.i, ptr %_M_finish.i38, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4) {
bb:
  %5 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !19
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
  store ptr %incdec.ptr.i.i.i, ptr %_M_finish.i38, align 8, !tbaa !19
  ret ptr %incdec.ptr.i.i.i
}

define i64 @"82"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %end_size_.i.i) {
bb:
  %2 = load i32, ptr %v, align 4, !tbaa !9
  %sub = add nsw i32 %2, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  %.pre.pre.i = load ptr, ptr %end_size_.i.i, align 8, !tbaa !14
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %.pre.pre.i, align 4, !tbaa.struct !15
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define ptr @"83"(ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %0) {
bb:
  %1 = load ptr, ptr %new_range.i.i, align 8, !tbaa !11
  %2 = load ptr, ptr %agg.result, align 8, !tbaa !12
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !14
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = ashr exact i64 %sub.ptr.sub.i12.i.i, %0
  %add.ptr.i.i149 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %sub.ptr.div.i13.i.i
  store ptr %add.ptr.i.i149, ptr %end_size_.i.i, align 8, !tbaa !14
  ret ptr %add.ptr.i.i149
}

define i64 @"84"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !15
  ret i64 %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i
}

define i32 @"85"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, ptr %v.i.i.i.i.i.i, ptr %v3.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %v.i.i.i.i.i.i, align 4
  %3 = load i32, ptr %v3.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i = icmp slt i32 %2, %3
  %4 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !51
  %5 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !51
  %cmp.i.i.i.i.i.i = icmp eq i32 %5, %4
  %cmp7.i.i.i.i.i.i = icmp slt i32 %5, %4
  %cond.i.i.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i1 %cmp4.i.i.i.i.i.i, i1 %cmp7.i.i.i.i.i.i
  %spec.select.i.i.i.i = select i1 %cond.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %__parent.020.in.i.i.i.i.i = add nsw i64 %sub12.i.i.i.i, %1
  %__parent.020.i.i56.i.i.i = lshr i64 %__parent.020.in.i.i.i.i.i, %0
  %add.ptr.i.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %__parent.020.i.i56.i.i.i
  %6 = load i32, ptr %add.ptr.i.i.i.i.i, align 4, !tbaa !51
  ret i32 %6
}

define i64 @"86"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57.epil) {
bb:
  %0 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !7
  %1 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !7
  %2 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !7
  %3 = load i64, ptr %arrayidx.i58, align 8, !tbaa !7
  %add7 = add nsw i64 %3, %total.076
  %add7.1 = add nsw i64 %2, %add7
  %add7.2 = add nsw i64 %1, %add7.1
  %add7.3 = add nsw i64 %0, %add7.2
  store i64 %add7.3, ptr %arrayidx.i57.epil, align 8, !tbaa !7
  ret i64 %add7.3
}

define i64 @"87"(ptr %add.ptr.i113, ptr %cond.i31.i.i.i, ptr %_M_finish.i.i114, i64 %0, ptr %count_vector, i64 %1) {
bb:
  %2 = load i64, ptr %add.ptr.i113, align 4
  %3 = load ptr, ptr %count_vector, align 8, !tbaa !11
  %sub.ptr.rhs.cast.i.i.i.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %_M_finish.i.i114, align 8, !tbaa !19
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %4, i64 %0
  %sub.ptr.lhs.cast.i.i.i.i.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, %1
  %add.ptr.i.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %cond.i31.i.i.i, i64 %sub.ptr.div.i.i.i.i.i
  store i64 %2, ptr %add.ptr.i.i.i, align 4
  ret i64 %2
}

define i32 @"88"(ptr %call171, ptr %arrayidx.i548, ptr %arrayidx.i549, ptr %arrayidx.i550, i64 %sub.ptr.rhs.cast.i.i.i.i552, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i548, align 8, !tbaa !7
  %add.ptr263 = getelementptr inbounds i32, ptr %call171, i64 %2
  %3 = load i32, ptr %arrayidx.i549, align 4, !tbaa !0
  %idx.ext = sext i32 %3 to i64
  %add.ptr266 = getelementptr inbounds i32, ptr %add.ptr263, i64 %idx.ext
  %4 = load i64, ptr %arrayidx.i550, align 8, !tbaa !7
  %add.ptr271 = getelementptr inbounds i32, ptr %call171, i64 %4
  %sub.ptr.lhs.cast.i.i.i.i551 = ptrtoint ptr %add.ptr271 to i64
  %sub.ptr.sub.i.i.i.i553 = sub i64 %sub.ptr.lhs.cast.i.i.i.i551, %sub.ptr.rhs.cast.i.i.i.i552
  %sub.ptr.div.i.i.i.i561 = lshr exact i64 %sub.ptr.sub.i.i.i.i553, %0
  %shr.i.i565 = lshr i64 %sub.ptr.div.i.i.i.i561, %1
  %incdec.ptr4.sink.i.i.i.i569 = getelementptr inbounds i32, ptr %add.ptr266, i64 %shr.i.i565
  %5 = load i32, ptr %incdec.ptr4.sink.i.i.i.i569, align 4, !tbaa !0
  ret i32 %5
}

define <2 x i64> @"89"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %rng, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
bb:
  %wide.load393 = load <2 x i64>, ptr %6, align 8, !tbaa !7
  %.pre.i.i85 = load i64, ptr %rng, align 8, !tbaa !7
  %vector.recur.init390 = insertelement <2 x i64> %2, i64 %.pre.i.i85, i64 %3
  %wide.load392 = load <2 x i64>, ptr %0, align 8, !tbaa !7
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
  store <2 x i64> %19, ptr %9, align 8, !tbaa !7
  ret <2 x i64> %19
}

define ptr @"90"(ptr %cond.i31.i.i.i, ptr %_M_finish.i.i114, i64 %0, i64 %1, ptr %count_vector, i64 %2, i64 %3) {
bb:
  %4 = load ptr, ptr %count_vector, align 8, !tbaa !11
  %5 = ptrtoint ptr %4 to i64
  %6 = load ptr, ptr %_M_finish.i.i114, align 8, !tbaa !19
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %6, i64 %0
  %7 = ptrtoint ptr %incdec.ptr.i.i to i64
  %8 = add i64 %7, %1
  %9 = sub i64 %8, %5
  %10 = lshr i64 %9, %2
  %11 = add nuw nsw i64 %10, %0
  %n.vec = and i64 %11, %3
  %12 = shl i64 %n.vec, %2
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i, i64 %12
  %incdec.ptr.i.i.i = getelementptr %"struct.std::pair.8", ptr %ind.end, i64 %0
  store ptr %incdec.ptr.i.i.i, ptr %_M_finish.i.i114, align 8, !tbaa !19
  ret ptr %incdec.ptr.i.i.i
}

define i64 @"91"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !61
  %inc.i71 = add nuw nsw i64 %2, %1
  %arrayidx.i65 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i71
  %3 = load i64, ptr %arrayidx.i65, align 8, !tbaa !7
  ret i64 %3
}

define ptr @"92"(ptr %new_range.i.i, ptr %end_capacity_.i.i, ptr %agg.result, i64 %0) {
bb:
  %1 = load ptr, ptr %end_capacity_.i.i, align 8, !tbaa !18
  %sub.ptr.lhs.cast.i7.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %agg.result, align 8, !tbaa !12
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i9.i = sub i64 %sub.ptr.lhs.cast.i7.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.sub.i9.fr.i = freeze i64 %sub.ptr.sub.i9.i
  %mul.i = ashr exact i64 %sub.ptr.sub.i9.fr.i, %0
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !11
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %mul.i
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i, align 8, !tbaa !18
  ret ptr %add.ptr6.i.i
}

define i64 @"93"(ptr %arrayidx.i, i64 %0, ptr %offsets, ptr %__begin0.0640) {
bb:
  %1 = load i64, ptr %arrayidx.i, align 8, !tbaa !7
  %inc = add nsw i64 %1, %0
  %2 = load ptr, ptr %offsets, align 8, !tbaa !33
  %e.sroa.0.0.copyload = load i32, ptr %__begin0.0640, align 4, !tbaa.struct !15
  %conv = sext i32 %e.sroa.0.0.copyload to i64
  %arrayidx.i2 = getelementptr inbounds i64, ptr %2, i64 %conv
  store i64 %inc, ptr %arrayidx.i, align 8, !tbaa !7
  ret i64 %inc
}

define ptr @"94"(ptr %__node, ptr %this, ptr %add.ptr.i, ptr %_M_bucket_count) {
bb:
  %0 = load ptr, ptr %this, align 8, !tbaa !49
  %1 = load i32, ptr %add.ptr.i, align 4, !tbaa !0
  %conv.i.i.i.i.i = sext i32 %1 to i64
  %2 = load i64, ptr %_M_bucket_count, align 8, !tbaa !44
  %rem.i.i.i.i = urem i64 %conv.i.i.i.i.i, %2
  %arrayidx17.i = getelementptr inbounds ptr, ptr %0, i64 %rem.i.i.i.i
  store ptr %__node, ptr %arrayidx17.i, align 8, !tbaa !11
  ret ptr %__node
}

define i64 @"95"(i32 %shl19, ptr %arrayidx.i61, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i63, i64 %4, i64 %5, i64 %xor4.i, i64 %6, i64 %xor7.i, i32 %7, i32 %8, i32 %9, i32 %conv, i64 %10, i64 %ref.tmp30.sroa.0.0.insert.ext, ptr %el, ptr %.omp.lb) {
bb:
  %11 = load i64, ptr %arrayidx.i61, align 8, !tbaa !7
  %shr.i62 = lshr i64 %11, %0
  %and.i = and i64 %shr.i62, %1
  %xor.i632 = xor i64 %and.i, %11
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
  %12 = load ptr, ptr %el, align 8, !tbaa !12
  %13 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %mul = shl i64 %13, %6
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %12, i64 %mul
  store i64 %ref.tmp30.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp30.sroa.0.0.insert.insert
}

define ptr @"96"(ptr %new_range.i.i, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1, ptr %el) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !12
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !14
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !11
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !14
  ret ptr %add.ptr.i464
}

define ptr @"97"(ptr %el, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !12
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !14
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !14
  ret ptr %add.ptr.i464
}

define i64 @"98"(i64 %lsum.035, ptr %arrayidx.i31, ptr %local_sums, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %arrayidx.i31, align 4, !tbaa !0
  %conv = sext i32 %0 to i64
  %add15 = add nsw i64 %lsum.035, %conv
  %1 = load ptr, ptr %local_sums, align 8, !tbaa !33
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %arrayidx.i = getelementptr inbounds i64, ptr %1, i64 %2
  store i64 %add15, ptr %arrayidx.i, align 8, !tbaa !7
  ret i64 %add15
}

define i32 @"99"(ptr %_M_finish.i38, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !19
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %2, i64 %0
  %add.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %incdec.ptr.i.i, i64 %1
  %3 = load i32, ptr %add.ptr.i.i, align 4, !tbaa !26
  ret i32 %3
}

define i32 @"100"(ptr %arrayidx212, ptr %call171, ptr %arrayidx.i539, i64 %0) {
bb:
  %1 = load i32, ptr %arrayidx212, align 4, !tbaa !0
  %2 = load i64, ptr %arrayidx.i539, align 8, !tbaa !7
  %sub183 = add nsw i64 %2, %0
  %arrayidx213 = getelementptr inbounds i32, ptr %call171, i64 %sub183
  store i32 %1, ptr %arrayidx213, align 4, !tbaa !0
  ret i32 %1
}

define i64 @"101"(ptr %arrayidx.i.i, ptr %0, i64 %1, ptr %2) {
bb:
  %3 = load ptr, ptr %0, align 8, !tbaa !11, !noalias !71
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %arrayidx.i.i, align 8, !tbaa !11, !noalias !71
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i = ashr exact i64 %sub.ptr.sub.i.i, %1
  store i64 %sub.ptr.div.i.i, ptr %2, align 8, !alias.scope !71
  ret i64 %sub.ptr.div.i.i
}

define i8 @"102"(i8 %0, ptr %ref.tmp, ptr %__dnew.i.i.i) {
bb:
  %1 = load ptr, ptr %ref.tmp, align 8, !tbaa !57, !alias.scope !58
  %2 = load i64, ptr %__dnew.i.i.i, align 8, !tbaa !7, !noalias !58
  %arrayidx.i.i.i.i = getelementptr inbounds i8, ptr %1, i64 %2
  store i8 %0, ptr %arrayidx.i.i.i.i, align 1, !tbaa !53
  ret i8 %0
}

define i32 @"103"(i32 %conv22, ptr %diffs, i64 %indvars.iv) {
bb:
  %0 = load ptr, ptr %diffs, align 8, !tbaa !4
  %arrayidx.i99 = getelementptr inbounds i32, ptr %0, i64 %indvars.iv
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !0
  ret i32 %conv22
}

define i64 @"104"(ptr %add.ptr.i113, ptr %_M_finish.i.i114, i64 %0) {
bb:
  %1 = load i64, ptr %add.ptr.i113, align 4
  %2 = load ptr, ptr %_M_finish.i.i114, align 8, !tbaa !19
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %2, i64 %0
  store i64 %1, ptr %incdec.ptr.i.i, align 4
  ret i64 %1
}

define ptr @"105"(ptr %__p.044, ptr %retval.0.i, ptr %add.ptr, i64 %__bkt_count) {
bb:
  %0 = load ptr, ptr %__p.044, align 8, !tbaa !74
  %1 = load i32, ptr %add.ptr, align 4, !tbaa !0
  %conv.i.i.i = sext i32 %1 to i64
  %rem.i.i = urem i64 %conv.i.i.i, %__bkt_count
  %arrayidx16 = getelementptr inbounds ptr, ptr %retval.0.i, i64 %rem.i.i
  store ptr %0, ptr %arrayidx16, align 8, !tbaa !11
  ret ptr %0
}

define i32 @"106"(ptr %neighs, ptr %arrayidx.i523, ptr %arrayidx.i524, i64 %sub.ptr.rhs.cast.i.i.i.i526, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %neighs, align 8, !tbaa !11
  %3 = load i64, ptr %arrayidx.i524, align 8, !tbaa !7
  %add.ptr121 = getelementptr inbounds i32, ptr %2, i64 %3
  %sub.ptr.lhs.cast.i.i.i.i525 = ptrtoint ptr %add.ptr121 to i64
  %sub.ptr.sub.i.i.i.i527 = sub i64 %sub.ptr.lhs.cast.i.i.i.i525, %sub.ptr.rhs.cast.i.i.i.i526
  %sub.ptr.div.i.i.i.i = lshr exact i64 %sub.ptr.sub.i.i.i.i527, %0
  %shr.i.i = lshr i64 %sub.ptr.div.i.i.i.i, %1
  %4 = load i64, ptr %arrayidx.i523, align 8, !tbaa !7
  %add.ptr = getelementptr inbounds i32, ptr %2, i64 %4
  %incdec.ptr4.sink.i.i.i.i = getelementptr inbounds i32, ptr %add.ptr, i64 %shr.i.i
  %5 = load i32, ptr %incdec.ptr4.sink.i.i.i.i, align 4, !tbaa !0
  ret i32 %5
}

define ptr @"107"(ptr %__p.044, ptr %_M_before_begin.i) {
bb:
  %0 = load ptr, ptr %__p.044, align 8, !tbaa !74
  store ptr %0, ptr %_M_before_begin.i, align 8, !tbaa !75
  ret ptr %0
}

define i32 @"108"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %3 = sub i64 %0, %2
  %n.vec = and i64 %3, %1
  %ind.end = add i64 %2, %n.vec
  %4 = load ptr, ptr %el, align 8, !tbaa !12
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %4, i64 %ind.end
  %5 = load i32, ptr %add.ptr.prol, align 4
  ret i32 %5
}

define i32 @"109"(ptr %arrayidx.i.i.i60, ptr %n_start.0.in, i64 %0, ptr %diffs, ptr %.omp.lb) {
bb:
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !11
  %sub.ptr.lhs.cast = ptrtoint ptr %n_end.0 to i64
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !11
  %.pre134 = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %.pre134
  %1 = lshr exact i64 %sub.ptr.sub, %0
  %conv22 = trunc i64 %1 to i32
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %3 = sext i32 %2 to i64
  %4 = load ptr, ptr %diffs, align 8, !tbaa !4
  %arrayidx.i99 = getelementptr inbounds i32, ptr %4, i64 %3
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !0
  ret i32 %conv22
}

define i32 @"110"(ptr %__i.sroa.0.042.i.ptr, i64 %0, ptr %second.i.i.i.i.i) {
bb:
  %1 = load i64, ptr %__i.sroa.0.042.i.ptr, align 4
  %__val.sroa.4.0.extract.shift.i = lshr i64 %1, %0
  %__val.sroa.4.0.extract.trunc.i = trunc i64 %__val.sroa.4.0.extract.shift.i to i32
  store i32 %__val.sroa.4.0.extract.trunc.i, ptr %second.i.i.i.i.i, align 4, !tbaa !76
  ret i32 %__val.sroa.4.0.extract.trunc.i
}

define i64 @"111"(ptr %arrayidx.i533, i64 %total_missing_inv.0649, ptr %arrayidx.i536, ptr %offsets, ptr %num_nodes_.i) {
bb:
  %.pre714 = load i64, ptr %num_nodes_.i, align 8, !tbaa !69
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !33
  %arrayidx.i5332 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %.pre714
  %0 = load i32, ptr %arrayidx.i536, align 4, !tbaa !0
  %conv155 = sext i32 %0 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %1 = load i64, ptr %arrayidx.i533, align 8, !tbaa !7
  %add165 = add nsw i64 %1, %add156
  store i64 %add165, ptr %arrayidx.i533, align 8, !tbaa !7
  ret i64 %add165
}

define i32 @"112"(ptr %el, i64 %0, i64 %1, i32 %2) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %incdec.ptr122.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %v3.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr122.i.i, i64 %1, i32 1
  %3 = load i32, ptr %v3.i.i.i.i, align 4
  ret i32 %3
}

define i64 @"113"(ptr %arrayidx.i492, ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !69
  %n.mod.vf = and i64 %2, %0
  %arrayidx.i493 = getelementptr inbounds i64, ptr %1, i64 %n.mod.vf
  %3 = load i64, ptr %arrayidx.i492, align 8, !tbaa !7
  store i64 %3, ptr %arrayidx.i493, align 8, !tbaa !7
  ret i64 %3
}

define i32 @"114"(ptr %arrayidx.i7.i.i.phi.trans.insert) {
bb:
  %.pre = load ptr, ptr %arrayidx.i7.i.i.phi.trans.insert, align 8, !tbaa !11
  %0 = load i32, ptr %.pre, align 4, !tbaa !0
  ret i32 %0
}

define i32 @"115"(ptr %num_nodes_.i, i32 %0, ptr %.omp.ub) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !77
  %conv = trunc i64 %1 to i32
  %sub3 = add nsw i32 %conv, %0
  store i32 %sub3, ptr %.omp.ub, align 4, !tbaa !0
  ret i32 %sub3
}

define i32 @"116"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.1659, ptr %arrayidx.i541) {
bb:
  %1 = load i64, ptr %arrayidx.i542, align 8, !tbaa !7
  %i200.0 = add nsw i64 %1, %0
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !0
  %.pre731 = sext i32 %.pre717 to i64
  %sub222 = sub nsw i64 %total_missing_inv.1659, %.pre731
  %sub211 = sub nsw i64 %i200.0, %sub222
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %2 = load i32, ptr %arrayidx212, align 4, !tbaa !0
  ret i32 %2
}

define <2 x i64> @"117"(ptr %__first, <2 x i64> %0) {
bb:
  %1 = load <2 x i64>, ptr %__first, align 4
  %2 = shufflevector <2 x i64> %1, <2 x i64> %0, <2 x i32> <i32 1, i32 0>
  store <2 x i64> %2, ptr %__first, align 4
  ret <2 x i64> %2
}

define i32 @"118"(ptr %n_start.0.in, i64 %0, i64 %1) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !11
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds i32, ptr %incdec.ptr12.i.i.i.i, i64 %1
  %2 = load i32, ptr %__first.addr.030.i.i, align 4, !tbaa !0
  ret i32 %2
}

define i64 @"119"(ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %__i.018.i, i64 %add.i, i64 %inc.i, ptr %arrayidx7.i.1) {
bb:
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !7
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
  store i64 %rem.i.i17.i.1, ptr %arrayidx7.i.1, align 8, !tbaa !7
  ret i64 %rem.i.i17.i.1
}

define i32 @"120"(ptr %degrees, i64 %mul12, i64 %umin, ptr %.omp.lb, i64 %indvar, i64 %0, i64 %n.mod.vf) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %2 = add i64 %1, %indvar
  %3 = shl i64 %2, %0
  %4 = sub i64 %umin, %3
  %n.vec = sub i64 %4, %n.mod.vf
  %ind.end = add i64 %mul12, %n.vec
  %5 = load ptr, ptr %degrees, align 8, !tbaa !4
  %arrayidx.i31 = getelementptr inbounds i32, ptr %5, i64 %ind.end
  %6 = load i32, ptr %arrayidx.i31, align 4, !tbaa !0
  ret i32 %6
}

define <2 x i64> @"121"(ptr %0, <2 x i64> %1, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %7) {
bb:
  %wide.load393 = load <2 x i64>, ptr %4, align 8, !tbaa !7
  %wide.load392 = load <2 x i64>, ptr %0, align 8, !tbaa !7
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
  store <2 x i64> %17, ptr %7, align 8, !tbaa !7
  ret <2 x i64> %17
}

define i64 @"122"(ptr %arrayidx.i25, i64 %0, ptr %arrayidx.i23, ptr %el, i64 %.omp.iv.028) {
bb:
  %1 = load i32, ptr %arrayidx.i23, align 4, !tbaa !0
  %ref.tmp.sroa.0.0.insert.ext = zext i32 %1 to i64
  %2 = load i32, ptr %arrayidx.i25, align 4, !tbaa !0
  %ref.tmp.sroa.4.0.insert.ext = zext i32 %2 to i64
  %ref.tmp.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp.sroa.4.0.insert.ext, %0
  %ref.tmp.sroa.0.0.insert.insert = or i64 %ref.tmp.sroa.4.0.insert.shift, %ref.tmp.sroa.0.0.insert.ext
  %3 = load ptr, ptr %el, align 8, !tbaa !12
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %.omp.iv.028
  store i64 %ref.tmp.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp.sroa.0.0.insert.insert
}

define i32 @"124"(ptr %neighs, ptr %arrayidx.i522) {
bb:
  %0 = load ptr, ptr %neighs, align 8, !tbaa !11
  %1 = load i64, ptr %arrayidx.i522, align 8, !tbaa !7
  %arrayidx112 = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %arrayidx112, align 4, !tbaa !0
  ret i32 %2
}

define i64 @"125"(ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !51
  %1 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !51
  %cmp.i.i.i.i.i = icmp eq i32 %1, %0
  %cmp7.i.i.i.i.i = icmp slt i32 %1, %0
  %2 = load i32, ptr %v3.i.i.i.i.i, align 4
  %3 = load i32, ptr %v.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %3, %2
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr3.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  %4 = load i64, ptr %add.ptr3.i.i.i, align 4
  ret i64 %4
}

define ptr @"126"(ptr %neighs, ptr %arrayidx.i.1, ptr %index, i64 %indvars.iv.next) {
bb:
  %0 = load ptr, ptr %index, align 8, !tbaa !11
  %arrayidx.1 = getelementptr inbounds ptr, ptr %0, i64 %indvars.iv.next
  %1 = load ptr, ptr %neighs, align 8, !tbaa !11
  %2 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !7
  %add.ptr.1 = getelementptr inbounds i32, ptr %1, i64 %2
  store ptr %add.ptr.1, ptr %arrayidx.1, align 8, !tbaa !11
  ret ptr %add.ptr.1
}

define i64 @"127"(ptr %arrayidx.i535, i64 %total_missing_inv.0649, ptr %offsets, i64 %indvars.iv691) {
bb:
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !33
  %arrayidx.i5352 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %indvars.iv691
  %0 = load i64, ptr %arrayidx.i535, align 8, !tbaa !7
  %add152 = add nsw i64 %0, %total_missing_inv.0649
  store i64 %add152, ptr %arrayidx.i535, align 8, !tbaa !7
  ret i64 %add152
}

define i64 @"128"(ptr %__first.addr.033.i.i, ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.033.i.i, align 4
  store i64 %agg.tmp.sroa.0.0.copyload.i.i.i, ptr %incdec.ptr13.i.i.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i64 @"129"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !61
  %inc.i71 = add nuw nsw i64 %2, %1
  %inc.i207 = add nuw nsw i64 %inc.i71, %1
  %arrayidx.i140 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i207
  %3 = load i64, ptr %arrayidx.i140, align 8, !tbaa !7
  ret i64 %3
}

define i32 @"130"(i32 %0, ptr %__p.022.i.i.i.i, i64 %1) {
bb:
  %2 = load ptr, ptr %__p.022.i.i.i.i, align 8, !tbaa !74
  %retval.1.i.i = getelementptr inbounds i8, ptr %2, i64 %1
  store i32 %0, ptr %retval.1.i.i, align 4, !tbaa !0
  ret i32 %0
}

define i64 @"131"(ptr %new_range.i.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !11
  %agg.tmp.sroa.0.0.copyload.i.i.i.i.i = load i64, ptr %.pre.i.i, align 4, !tbaa.struct !15
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i.i.i
}

define i32 @"132"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !0
  %1 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !0
  %cmp.i.i.i.i.i = icmp slt i32 %1, %0
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add.ptr3.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i.i.i.i
  %2 = load i32, ptr %add.ptr3.i.i.i.i, align 4, !tbaa !0
  ret i32 %2
}

define i64 @"133"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !61
  %inc.i71 = add nuw nsw i64 %2, %1
  %arrayidx.i208 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i71
  %3 = load i64, ptr %arrayidx.i208, align 8, !tbaa !7
  ret i64 %3
}

define i32 @"134"(ptr %el, i64 %.omp.iv.040, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !12
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %.omp.iv.040
  %add.ptr.sroa_idx = getelementptr inbounds i8, ptr %add.ptr, i64 %0
  %2 = load i32, ptr %add.ptr.sroa_idx, align 4
  ret i32 %2
}

define i32 @"135"(ptr %call171, ptr %arrayidx.i548, ptr %arrayidx.i549) {
bb:
  %0 = load i64, ptr %arrayidx.i548, align 8, !tbaa !7
  %add.ptr263 = getelementptr inbounds i32, ptr %call171, i64 %0
  %1 = load i32, ptr %arrayidx.i549, align 4, !tbaa !0
  %idx.ext = sext i32 %1 to i64
  %add.ptr266 = getelementptr inbounds i32, ptr %add.ptr263, i64 %idx.ext
  %2 = load i32, ptr %add.ptr266, align 4, !tbaa !0
  ret i32 %2
}

define <4 x i32> @"136"(ptr %gep, <4 x i32> %0, <2 x i32> %1, ptr %gep123) {
bb:
  %wide.vec = load <4 x i32>, ptr %gep, align 4, !tbaa !0
  %strided.vec115 = shufflevector <4 x i32> %wide.vec, <4 x i32> %0, <2 x i32> <i32 1, i32 3>
  %reverse116 = shufflevector <2 x i32> %strided.vec115, <2 x i32> %1, <2 x i32> <i32 1, i32 0>
  %reverse118 = shufflevector <2 x i32> %reverse116, <2 x i32> %1, <2 x i32> <i32 1, i32 0>
  %strided.vec = shufflevector <4 x i32> %wide.vec, <4 x i32> %0, <2 x i32> <i32 0, i32 2>
  %reverse = shufflevector <2 x i32> %strided.vec, <2 x i32> %1, <2 x i32> <i32 1, i32 0>
  %reverse117 = shufflevector <2 x i32> %reverse, <2 x i32> %1, <2 x i32> <i32 1, i32 0>
  %interleaved.vec = shufflevector <2 x i32> %reverse117, <2 x i32> %reverse118, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x i32> %interleaved.vec, ptr %gep123, align 4, !tbaa !0
  ret <4 x i32> %interleaved.vec
}

define i64 @"137"(ptr %count_vector, ptr %_M_finish.i.i114, i64 %0, i64 %1, i64 %2, i64 %3) {
bb:
  %4 = load ptr, ptr %count_vector, align 8, !tbaa !11
  %5 = ptrtoint ptr %4 to i64
  %6 = load ptr, ptr %_M_finish.i.i114, align 8, !tbaa !19
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %6, i64 %0
  %7 = ptrtoint ptr %incdec.ptr.i.i to i64
  %8 = add i64 %7, %1
  %9 = sub i64 %8, %5
  %10 = lshr i64 %9, %2
  %11 = add nuw nsw i64 %10, %0
  %n.vec = and i64 %11, %3
  %12 = shl i64 %n.vec, %2
  %ind.end280 = getelementptr i8, ptr %4, i64 %12
  %13 = load i64, ptr %ind.end280, align 4, !alias.scope !78, !noalias !81
  ret i64 %13
}

define i64 @"138"(ptr %__first.addr.07.i.i.i.i.i.i.i, ptr %cond.i31.i.i.i, ptr %_M_finish.i38, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4) {
bb:
  %5 = load i64, ptr %__first.addr.07.i.i.i.i.i.i.i, align 4, !alias.scope !83, !noalias !86
  %6 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !19
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %6, i64 %0
  %7 = ptrtoint ptr %incdec.ptr.i.i to i64
  %8 = add i64 %7, %1
  %9 = sub i64 %8, %2
  %10 = lshr i64 %9, %3
  %11 = add nuw nsw i64 %10, %0
  %n.vec = and i64 %11, %4
  %12 = shl i64 %n.vec, %3
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i, i64 %12
  store i64 %5, ptr %ind.end, align 4, !alias.scope !86, !noalias !83
  ret i64 %5
}

define i64 @"139"(ptr %.omp.lb, i64 %0, i64 %1, ptr %rng) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %add10 = add i64 %2, %0
  %rem.i.i.i = and i64 %add10, %1
  store i64 %rem.i.i.i, ptr %rng, align 8, !tbaa !7
  ret i64 %rem.i.i.i
}

define i64 @"140"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !61
  %inc.i71 = add nuw nsw i64 %1, %0
  %inc.i207 = add nuw nsw i64 %inc.i71, %0
  store i64 %inc.i207, ptr %_M_p.i.i.i, align 8, !tbaa !61
  ret i64 %inc.i207
}

define <4 x i32> @"141"(<4 x i32> %0, ptr %init_val, i64 %1, ptr %this, ptr %.omp.lb, i64 %index) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !4
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %offset.idx = add i64 %3, %index
  %4 = getelementptr inbounds i32, ptr %2, i64 %offset.idx
  %5 = load i32, ptr %init_val, align 4, !tbaa !0, !alias.scope !36
  %broadcast.splatinsert21 = insertelement <4 x i32> %0, i32 %5, i64 %1
  %broadcast.splat22 = shufflevector <4 x i32> %broadcast.splatinsert21, <4 x i32> %0, <4 x i32> zeroinitializer
  store <4 x i32> %broadcast.splat22, ptr %4, align 4, !tbaa !0, !alias.scope !39, !noalias !36
  ret <4 x i32> %broadcast.splat22
}

define i32 @"142"(ptr %__first, ptr %add.ptr.i.us, ptr %add.ptr2.i.us, i64 %sub1.i.us, i64 %mul.i.us, i64 %0, i64 %1) {
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

define <4 x i32> @"143"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.1659, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !7
  %3 = add i64 %2, %0
  %4 = sub nsw i64 %3, %total_missing_inv.1659
  %5 = getelementptr inbounds i32, ptr %call171, i64 %4
  %6 = getelementptr inbounds i32, ptr %5, i64 %1
  %wide.load803 = load <4 x i32>, ptr %6, align 4, !tbaa !0
  ret <4 x i32> %wide.load803
}

define i64 @"144"(ptr %arrayidx, ptr %new_range, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %arrayidx, align 4
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %2 = load ptr, ptr %new_range, align 8, !tbaa !11
  %arrayidx7 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %1
  store i64 %0, ptr %arrayidx7, align 4
  ret i64 %0
}

define i32 @"145"(ptr %el, i64 %0, i32 %1) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %v.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0, i32 1
  %2 = load i32, ptr %v.i.i.i.i, align 4
  ret i32 %2
}

define ptr @"146"(ptr %retval.0.i, ptr %add.ptr, i64 %__bkt_count) {
bb:
  %0 = load i32, ptr %add.ptr, align 4, !tbaa !0
  %conv.i.i.i = sext i32 %0 to i64
  %rem.i.i = urem i64 %conv.i.i.i, %__bkt_count
  %arrayidx = getelementptr inbounds ptr, ptr %retval.0.i, i64 %rem.i.i
  %1 = load ptr, ptr %arrayidx, align 8, !tbaa !11
  ret ptr %1
}

define <2 x i64> @"147"(ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %index770, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !69
  %4 = and i64 %3, %0
  %offset.idx = sub i64 %4, %index770
  %5 = add nuw i64 %offset.idx, %0
  %6 = and i64 %5, %0
  %7 = getelementptr inbounds i64, ptr %2, i64 %6
  %8 = getelementptr inbounds i64, ptr %7, i64 %1
  %wide.load = load <2 x i64>, ptr %8, align 8, !tbaa !7
  ret <2 x i64> %wide.load
}

define i8 @"148"(ptr %arrayidx.i17.i, ptr %agg.tmp32, ptr %num_trials_, i32 %0, i64 %idxprom1.i.i) {
bb:
  %1 = load ptr, ptr %agg.tmp32, align 8, !tbaa !57, !alias.scope !88
  %2 = load i32, ptr %num_trials_, align 4, !tbaa !91
  %__val.lobit.i = lshr i32 %2, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %arrayidx.i.i = getelementptr inbounds i8, ptr %1, i64 %conv5.i
  %arrayidx2.i.i = getelementptr inbounds i8, ptr %arrayidx.i.i, i64 %idxprom1.i.i
  %3 = load i8, ptr %arrayidx.i17.i, align 1, !tbaa !53, !noalias !88
  store i8 %3, ptr %arrayidx2.i.i, align 1, !tbaa !53
  ret i8 %3
}

define i64 @"149"(ptr %arrayidx.i492.prol, ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !69
  %n.mod.vf = and i64 %1, %0
  %2 = load ptr, ptr %offsets, align 8
  %arrayidx.i493.prol = getelementptr inbounds i64, ptr %2, i64 %n.mod.vf
  %3 = load i64, ptr %arrayidx.i492.prol, align 8, !tbaa !7
  store i64 %3, ptr %arrayidx.i493.prol, align 8, !tbaa !7
  ret i64 %3
}

define i32 @"150"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !12
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %add15 = add i64 %3, %0
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %add15
  %add.ptr.sroa_idx.1 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %1
  %4 = load i32, ptr %add.ptr.sroa_idx.1, align 4
  ret i32 %4
}

define i64 @"151"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %call.i4145, ptr %num_blocks) {
bb:
  %0 = load i64, ptr %num_blocks, align 8, !tbaa !7
  %arrayidx.i = getelementptr inbounds i64, ptr %call.i4145, i64 %0
  %1 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !7
  %2 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !7
  %3 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !7
  %4 = load i64, ptr %arrayidx.i58, align 8, !tbaa !7
  %add7 = add nsw i64 %4, %total.076
  %add7.1 = add nsw i64 %3, %add7
  %add7.2 = add nsw i64 %2, %add7.1
  %add7.3 = add nsw i64 %1, %add7.2
  store i64 %add7.3, ptr %arrayidx.i, align 8, !tbaa !7
  ret i64 %add7.3
}

define i64 @"152"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %incdec.ptr.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i = load i64, ptr %incdec.ptr.i.i.i.i, align 4, !tbaa.struct !15
  ret i64 %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i
}

define ptr @"153"(ptr %_M_before_begin.i, ptr %this, i64 %__code, ptr %_M_bucket_count) {
bb:
  %.pre.i = load ptr, ptr %this, align 8, !tbaa !49
  %0 = load i64, ptr %_M_bucket_count, align 8, !tbaa !44
  %rem.i.i.i = urem i64 %__code, %0
  %arrayidx20.i = getelementptr inbounds ptr, ptr %.pre.i, i64 %rem.i.i.i
  store ptr %_M_before_begin.i, ptr %arrayidx20.i, align 8, !tbaa !11
  ret ptr %_M_before_begin.i
}

define i64 @"154"(ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !69
  %n.mod.vf = and i64 %2, %0
  %sub = add nuw i64 %n.mod.vf, %1
  %conv34 = and i64 %sub, %1
  %3 = load ptr, ptr %offsets, align 8
  %arrayidx.i492 = getelementptr inbounds i64, ptr %3, i64 %conv34
  %4 = load i64, ptr %arrayidx.i492, align 8, !tbaa !7
  ret i64 %4
}

define i32 @"155"(ptr %el, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %el, align 8, !tbaa !12
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %1
  %2 = load i32, ptr %add.ptr, align 4
  ret i32 %2
}

define i32 @"156"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !12
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %2
  %add.ptr.sroa_idx = getelementptr inbounds i8, ptr %add.ptr, i64 %0
  %3 = load i32, ptr %add.ptr.sroa_idx, align 4
  ret i32 %3
}

define i64 @"157"(ptr %arrayidx.i18.i, ptr %0, i64 %1, ptr %2) {
bb:
  %3 = load ptr, ptr %0, align 8, !tbaa !11, !noalias !71
  %sub.ptr.rhs.cast.i20.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %arrayidx.i18.i, align 8, !tbaa !11, !noalias !71
  %sub.ptr.lhs.cast.i19.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i21.i = sub i64 %sub.ptr.lhs.cast.i19.i, %sub.ptr.rhs.cast.i20.i
  %sub.ptr.div.i22.i = ashr exact i64 %sub.ptr.sub.i21.i, %1
  %div.i.i = sdiv i64 %sub.ptr.div.i22.i, %1
  store i64 %div.i.i, ptr %2, align 8, !alias.scope !71
  ret i64 %div.i.i
}

define ptr @"158"(ptr %out_index_.i, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %out_index_.i, align 8, !tbaa !20, !noalias !23
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %2 = sext i32 %1 to i64
  %arrayidx.i7.i.i.phi.trans.insert = getelementptr inbounds ptr, ptr %0, i64 %2
  %.pre = load ptr, ptr %arrayidx.i7.i.i.phi.trans.insert, align 8, !tbaa !11
  ret ptr %.pre
}

define i32 @"159"(ptr %comp, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %1 = sext i32 %0 to i64
  %2 = load ptr, ptr %comp, align 8
  %arrayidx.i70 = getelementptr inbounds i32, ptr %2, i64 %1
  %3 = load i32, ptr %arrayidx.i70, align 4, !tbaa !0
  ret i32 %3
}

define ptr @"160"(ptr %__p.044, ptr %arrayidx) {
bb:
  %0 = load ptr, ptr %__p.044, align 8, !tbaa !74
  %1 = load ptr, ptr %arrayidx, align 8, !tbaa !11
  store ptr %0, ptr %1, align 8, !tbaa !11
  ret ptr %0
}

define <2 x i32> @"161"(ptr %degrees, ptr %.omp.lb, i64 %0, i64 %index, i64 %1) {
bb:
  %2 = load ptr, ptr %degrees, align 8, !tbaa !4
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %mul12 = shl i64 %3, %0
  %offset.idx = add i64 %mul12, %index
  %4 = getelementptr inbounds i32, ptr %2, i64 %offset.idx
  %5 = getelementptr inbounds i32, ptr %4, i64 %1
  %wide.load41 = load <2 x i32>, ptr %5, align 4, !tbaa !0
  ret <2 x i32> %wide.load41
}

define ptr @"162"(ptr %out_index_.i, ptr %it.sroa.0.0546, i32 %0) {
bb:
  %1 = load i32, ptr %it.sroa.0.0546, align 4, !tbaa !0
  %add.i.i.i271 = add nsw i32 %1, %0
  %idxprom.i.i.i = sext i32 %add.i.i.i271 to i64
  %2 = load ptr, ptr %out_index_.i, align 8, !tbaa !20, !noalias !98
  %arrayidx.i.i.i = getelementptr inbounds ptr, ptr %2, i64 %idxprom.i.i.i
  %3 = load ptr, ptr %arrayidx.i.i.i, align 8, !tbaa !11
  ret ptr %3
}

define ptr @"163"(ptr %cond.i31, i64 %.sroa.speculated.i, ptr %_M_finish.i.i, ptr %this, i64 %0, i64 %sub.ptr.div.i.i, i1 %cmp9.i, i64 %1, i64 %add.i, ptr %_M_end_of_storage) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !11
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !101
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i2 = ashr exact i64 %sub.ptr.sub.i.i, %0
  %add.i4 = add i64 %.sroa.speculated.i, %sub.ptr.div.i.i
  %cmp7.i = icmp ult i64 %add.i, %sub.ptr.div.i.i
  %or.cond.i = or i1 %cmp7.i, %cmp9.i
  %cond.i = select i1 %or.cond.i, i64 %1, i64 %add.i
  %add.ptr19 = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %cond.i
  store ptr %add.ptr19, ptr %_M_end_of_storage, align 8, !tbaa !102
  ret ptr %add.ptr19
}

define i32 @"164"(ptr %init_val, ptr %this, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %this, align 8, !tbaa !4
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %add.ptr.prol = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %init_val, align 4, !tbaa !0
  store i32 %2, ptr %add.ptr.prol, align 4, !tbaa !0
  ret i32 %2
}

define i64 @"165"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !61
  %inc.i71 = add nuw nsw i64 %1, %0
  %inc.i64 = add nuw nsw i64 %inc.i71, %0
  store i64 %inc.i64, ptr %_M_p.i.i.i, align 8, !tbaa !61
  ret i64 %inc.i64
}

define <2 x i64> @"167"(ptr %0, <2 x i64> %1, <2 x i64> %vector.recur90, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %7) {
bb:
  %wide.load91 = load <2 x i64>, ptr %0, align 8, !tbaa !7
  %8 = shufflevector <2 x i64> %vector.recur90, <2 x i64> %wide.load91, <2 x i32> <i32 1, i32 2>
  %9 = and <2 x i64> %8, %2
  %10 = and <2 x i64> %wide.load91, %1
  %11 = or <2 x i64> %10, %9
  %12 = lshr exact <2 x i64> %11, %3
  %wide.load92 = load <2 x i64>, ptr %4, align 8, !tbaa !7
  %13 = xor <2 x i64> %12, %wide.load92
  %14 = and <2 x i64> %wide.load91, %3
  %15 = icmp eq <2 x i64> %14, %5
  %16 = select <2 x i1> %15, <2 x i64> %5, <2 x i64> %6
  %17 = xor <2 x i64> %13, %16
  store <2 x i64> %17, ptr %7, align 8, !tbaa !7
  ret <2 x i64> %17
}

define <2 x i64> @"168"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %.omp.lb, i64 %3, i64 %4, i64 %5, <2 x i64> %6, <2 x i64> %7, ptr %8, <2 x i64> %9, <2 x i64> %10, ptr %11) {
bb:
  %12 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %add8 = add i64 %12, %3
  %rem.i.i.i = and i64 %add8, %4
  %vector.recur.init89 = insertelement <2 x i64> %2, i64 %rem.i.i.i, i64 %5
  %wide.load91 = load <2 x i64>, ptr %0, align 8, !tbaa !7
  %13 = shufflevector <2 x i64> %vector.recur.init89, <2 x i64> %wide.load91, <2 x i32> <i32 1, i32 2>
  %14 = and <2 x i64> %13, %6
  %15 = and <2 x i64> %wide.load91, %1
  %16 = or <2 x i64> %15, %14
  %17 = lshr exact <2 x i64> %16, %7
  %wide.load92 = load <2 x i64>, ptr %8, align 8, !tbaa !7
  %18 = xor <2 x i64> %17, %wide.load92
  %19 = and <2 x i64> %wide.load91, %7
  %20 = icmp eq <2 x i64> %19, %9
  %21 = select <2 x i1> %20, <2 x i64> %9, <2 x i64> %10
  %22 = xor <2 x i64> %18, %21
  store <2 x i64> %22, ptr %11, align 8, !tbaa !7
  ret <2 x i64> %22
}

define i64 @"169"(ptr %__first.addr.033.i.i, ptr %new_range.i.i, i64 %0) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !11
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.033.i.i, align 4
  store i64 %agg.tmp.sroa.0.0.copyload.i.i.i, ptr %incdec.ptr13.i.i.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i8 @"170"(i8 %storemerge.i.i, ptr %agg.tmp32, ptr %num_trials_, i32 %0) {
bb:
  %1 = load ptr, ptr %agg.tmp32, align 8, !tbaa !57, !alias.scope !88
  %2 = load i32, ptr %num_trials_, align 4, !tbaa !91
  %__val.lobit.i = lshr i32 %2, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %arrayidx.i.i = getelementptr inbounds i8, ptr %1, i64 %conv5.i
  store i8 %storemerge.i.i, ptr %arrayidx.i.i, align 1, !tbaa !53
  ret i8 %storemerge.i.i
}

define i64 @"171"(ptr %num_edges_, i64 %0, i64 %1, i64 %2, ptr %.omp.ub) {
bb:
  %3 = load i64, ptr %num_edges_, align 8, !tbaa !103
  %sub3 = add nuw i64 %3, %0
  %div36 = lshr i64 %sub3, %1
  %sub4 = add nsw i64 %div36, %2
  store i64 %sub4, ptr %.omp.ub, align 8, !tbaa !7
  ret i64 %sub4
}

define ptr @"172"(ptr %call.i134135, ptr %num_nodes, i64 %0, ptr %end_size_.i) {
bb:
  %1 = load i64, ptr %num_nodes, align 8, !tbaa !7
  %add = add nsw i64 %1, %0
  %add.ptr.i = getelementptr inbounds i64, ptr %call.i134135, i64 %add
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !50
  ret ptr %add.ptr.i
}

define i64 @"173"(ptr %offsets, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %2 = sext i32 %1 to i64
  %indvars.iv.next = add nsw i64 %2, %0
  %3 = load ptr, ptr %offsets, align 8, !tbaa !33
  %arrayidx.i.1 = getelementptr inbounds i64, ptr %3, i64 %indvars.iv.next
  %4 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !7
  ret i64 %4
}

define i64 @"174"(ptr %arrayidx.i58.epil, i64 %total.076.epil, ptr %arrayidx.i57.epil) {
bb:
  %0 = load i64, ptr %arrayidx.i58.epil, align 8, !tbaa !7
  %add7.epil = add nsw i64 %0, %total.076.epil
  store i64 %add7.epil, ptr %arrayidx.i57.epil, align 8, !tbaa !7
  ret i64 %add7.epil
}

define i64 @"175"(ptr %el) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %agg.tmp.sroa.0.0.copyload.i.i.i.i.i = load i64, ptr %.pre, align 4, !tbaa.struct !15
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i.i.i
}

define i64 @"176"(ptr %max_seen.i, i32 %0, ptr %num_nodes_) {
bb:
  %1 = load i32, ptr %max_seen.i, align 4, !tbaa !0
  %add = add nsw i32 %1, %0
  %conv = sext i32 %add to i64
  store i64 %conv, ptr %num_nodes_, align 8, !tbaa !69
  ret i64 %conv
}

define i32 @"177"(ptr %__first.addr.033.i.i, ptr %n_start.0.in, i64 %0) {
bb:
  %1 = load i32, ptr %__first.addr.033.i.i, align 4, !tbaa !0
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !11
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  store i32 %1, ptr %incdec.ptr12.i.i.i.i, align 4, !tbaa !0
  ret i32 %1
}

define i32 @"178"(ptr %end_size_.i, ptr %offsets, i64 %0, ptr %length.i138) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !33
  %sub.ptr.rhs.cast.i.i142 = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !50
  %sub.ptr.lhs.cast.i.i141 = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i143 = sub i64 %sub.ptr.lhs.cast.i.i141, %sub.ptr.rhs.cast.i.i142
  %3 = lshr exact i64 %sub.ptr.sub.i.i143, %0
  %conv.i144 = trunc i64 %3 to i32
  store i32 %conv.i144, ptr %length.i138, align 4, !tbaa !0
  ret i32 %conv.i144
}

define i32 @"179"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %add7 = add i64 %1, %0
  %2 = load ptr, ptr %this, align 8, !tbaa !4
  %add.ptr.1 = getelementptr inbounds i32, ptr %2, i64 %add7
  %3 = load i32, ptr %init_val, align 4, !tbaa !0
  store i32 %3, ptr %add.ptr.1, align 4, !tbaa !0
  ret i32 %3
}

define i8 @"180"(ptr %arrayidx17.i.i, ptr %agg.tmp32, ptr %num_trials_, i32 %0) {
bb:
  %1 = load i8, ptr %arrayidx17.i.i, align 2, !tbaa !53, !noalias !88
  %2 = load ptr, ptr %agg.tmp32, align 8, !tbaa !57, !alias.scope !88
  %3 = load i32, ptr %num_trials_, align 4, !tbaa !91
  %__val.lobit.i = lshr i32 %3, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %arrayidx.i.i = getelementptr inbounds i8, ptr %2, i64 %conv5.i
  store i8 %1, ptr %arrayidx.i.i, align 1, !tbaa !53
  ret i8 %1
}

define i32 @"181"(ptr %retval.1.i.i, i32 %0, ptr %__p.022.i.i.i.i, i64 %1) {
bb:
  %2 = load i32, ptr %retval.1.i.i, align 4, !tbaa !0
  %add = add nsw i32 %2, %0
  %3 = load ptr, ptr %__p.022.i.i.i.i, align 8, !tbaa !74
  %retval.1.i.i2 = getelementptr inbounds i8, ptr %3, i64 %1
  store i32 %add, ptr %retval.1.i.i, align 4, !tbaa !0
  ret i32 %add
}

define i64 @"182"(ptr %arrayidx.i268, i64 %0, ptr %label_source_pair.sroa.5.0.call43.sroa_idx, i64 %1) {
bb:
  %label_source_pair.sroa.5.0.copyload = load i32, ptr %label_source_pair.sroa.5.0.call43.sroa_idx, align 4
  %conv46 = sext i32 %label_source_pair.sroa.5.0.copyload to i64
  %and.i.i = and i64 %conv46, %1
  %shl.i = shl nuw i64 %0, %and.i.i
  %2 = load i64, ptr %arrayidx.i268, align 8, !tbaa !7
  %or.i = or i64 %2, %shl.i
  store i64 %or.i, ptr %arrayidx.i268, align 8, !tbaa !7
  ret i64 %or.i
}

define i64 @"183"(ptr %add.ptr.i.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, ptr %v.i.i.i.i.i.i, ptr %v3.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0) {
bb:
  %1 = load i32, ptr %v.i.i.i.i.i.i, align 4
  %2 = load i32, ptr %v3.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i = icmp slt i32 %1, %2
  %3 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !51
  %4 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !51
  %cmp.i.i.i.i.i.i = icmp eq i32 %4, %3
  %cmp7.i.i.i.i.i.i = icmp slt i32 %4, %3
  %cond.i.i.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i1 %cmp4.i.i.i.i.i.i, i1 %cmp7.i.i.i.i.i.i
  %spec.select.i.i.i.i = select i1 %cond.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %add.ptr2.i.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %sub12.i.i.i.i
  %5 = load i64, ptr %add.ptr.i.i.i.i.i, align 4
  store i64 %5, ptr %add.ptr2.i.i.i.i.i, align 4
  ret i64 %5
}

define i32 @"184"(ptr %add.ptr.i.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0) {
bb:
  %1 = load i32, ptr %add.ptr.i.i.i.i.i, align 4, !tbaa !0
  %2 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !0
  %3 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !0
  %cmp.i.i.i.i.i = icmp slt i32 %3, %2
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %add.ptr2.i.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %sub12.i.i.i.i
  store i32 %1, ptr %add.ptr2.i.i.i.i.i, align 4, !tbaa !0
  ret i32 %1
}

define i64 @"185"(ptr %end_size_.i, ptr %this, i64 %0, i64 %1, ptr %.omp.ub) {
bb:
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !14
  %sub.ptr.lhs.cast.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %this, align 8, !tbaa !12
  %sub.ptr.rhs.cast.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %sub2 = add nsw i64 %sub.ptr.div.i, %1
  store i64 %sub2, ptr %.omp.ub, align 8, !tbaa !7
  ret i64 %sub2
}

define i64 @"186"(ptr %el, i64 %0, i64 %1) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr13.i.i.i.i, i64 %1
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.030.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i32 @"187"(ptr %degrees, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %degrees, align 8, !tbaa !4
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %mul14 = shl i64 %2, %0
  %arrayidx.i35 = getelementptr inbounds i32, ptr %1, i64 %mul14
  %3 = load i32, ptr %arrayidx.i35, align 4, !tbaa !0
  ret i32 %3
}

define i64 @"188"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !61
  %inc.i71 = add nuw nsw i64 %1, %0
  store i64 %inc.i71, ptr %_M_p.i.i.i, align 8, !tbaa !61
  ret i64 %inc.i71
}

define ptr @"189"(ptr %cond.i31.i.i.i, i64 %.sroa.speculated.i.i.i.i, ptr %_M_finish.i38, i64 %0, i64 %sub.ptr.rhs.cast.i, i64 %1, i64 %sub.ptr.div.i, i1 %cmp9.i.i.i.i, i64 %2, i64 %add.i.i.i.i, ptr %_M_end_of_storage.i.i) {
bb:
  %3 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !19
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %3, i64 %0
  %sub.ptr.lhs.cast.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i2 = ashr exact i64 %sub.ptr.sub.i, %1
  %add.i.i.i.i4 = add i64 %.sroa.speculated.i.i.i.i, %sub.ptr.div.i
  %cmp7.i.i.i.i = icmp ult i64 %add.i.i.i.i, %sub.ptr.div.i
  %or.cond.i.i.i.i = or i1 %cmp7.i.i.i.i, %cmp9.i.i.i.i
  %cond.i.i.i.i = select i1 %or.cond.i.i.i.i, i64 %2, i64 %add.i.i.i.i
  %add.ptr19.i.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %cond.i31.i.i.i, i64 %cond.i.i.i.i
  store ptr %add.ptr19.i.i.i, ptr %_M_end_of_storage.i.i, align 8, !tbaa !16
  ret ptr %add.ptr19.i.i.i
}

define i32 @"190"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add7 = add i64 %ind.end, %2
  %5 = load ptr, ptr %this, align 8, !tbaa !4
  %add.ptr.1 = getelementptr inbounds i32, ptr %5, i64 %add7
  %6 = load i32, ptr %init_val, align 4, !tbaa !0
  store i32 %6, ptr %add.ptr.1, align 4, !tbaa !0
  ret i32 %6
}

define ptr @"191"(ptr %new_range.i.i457, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !12
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %3 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !11
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !14
  ret ptr %add.ptr.i464
}

define <8 x i32> @"192"(ptr %el, ptr %.omp.lb, i64 %index) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %offset.idx = add i64 %0, %index
  %1 = load ptr, ptr %el, align 8, !tbaa !12
  %2 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %offset.idx
  %wide.vec = load <8 x i32>, ptr %2, align 4
  ret <8 x i32> %wide.vec
}

define i64 @"193"(ptr %arrayidx.i58, ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, i64 %add7, ptr %arrayidx.i57.1) {
bb:
  %0 = load i64, ptr %arrayidx.i58, align 8, !tbaa !7
  %1 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !7
  %2 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !7
  %3 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !7
  %add7.1 = add nsw i64 %3, %add7
  %add7.2 = add nsw i64 %2, %add7.1
  %add7.3 = add nsw i64 %1, %add7.2
  %add72 = add nsw i64 %0, %add7.3
  store i64 %add7, ptr %arrayidx.i57.1, align 8, !tbaa !7
  ret i64 %add7
}

define i64 @"194"(ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !69
  %n.mod.vf = and i64 %2, %0
  %sub.prol = add nuw i64 %n.mod.vf, %1
  %conv34.prol = and i64 %sub.prol, %1
  %3 = load ptr, ptr %offsets, align 8
  %arrayidx.i492.prol = getelementptr inbounds i64, ptr %3, i64 %conv34.prol
  %4 = load i64, ptr %arrayidx.i492.prol, align 8, !tbaa !7
  ret i64 %4
}

define ptr @"195"(ptr %call.i5155, ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, ptr %end_size_.i53) {
bb:
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !35
  %sub.ptr.lhs.cast.i47 = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %degrees, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i48 = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i49 = sub i64 %sub.ptr.lhs.cast.i47, %sub.ptr.rhs.cast.i48
  %sub.ptr.div.i50 = ashr exact i64 %sub.ptr.sub.i49, %0
  %add13 = add nsw i64 %sub.ptr.div.i50, %1
  %add.ptr.i52 = getelementptr inbounds i64, ptr %call.i5155, i64 %add13
  store ptr %add.ptr.i52, ptr %end_size_.i53, align 8, !tbaa !50
  ret ptr %add.ptr.i52
}

define i32 @"196"(ptr %init_val, ptr %this, i64 %.omp.iv.018) {
bb:
  %0 = load i32, ptr %init_val, align 4, !tbaa !0
  %1 = load ptr, ptr %this, align 8, !tbaa !4
  %add.ptr = getelementptr inbounds i32, ptr %1, i64 %.omp.iv.018
  store i32 %0, ptr %add.ptr, align 4, !tbaa !0
  ret i32 %0
}

define <4 x i32> @"197"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.0649, ptr %arrayidx.i536, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !7
  %3 = add i64 %2, %0
  %4 = load i32, ptr %arrayidx.i536, align 4, !tbaa !0
  %conv155 = sext i32 %4 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %5 = sub nsw i64 %3, %add156
  %6 = getelementptr inbounds i32, ptr %call171, i64 %5
  %7 = getelementptr inbounds i32, ptr %6, i64 %1
  %wide.load803 = load <4 x i32>, ptr %7, align 4, !tbaa !0
  ret <4 x i32> %wide.load803
}

define ptr @"198"(ptr %out_index.i, ptr %num_nodes_.i) {
bb:
  %0 = load ptr, ptr %out_index.i, align 8, !tbaa !11, !noalias !71
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !77, !noalias !71
  %arrayidx.i.i = getelementptr inbounds ptr, ptr %0, i64 %1
  %2 = load ptr, ptr %arrayidx.i.i, align 8, !tbaa !11, !noalias !71
  ret ptr %2
}

define <2 x i32> @"199"(ptr %degrees, i64 %offset.idx) {
bb:
  %0 = load ptr, ptr %degrees, align 8, !tbaa !4
  %1 = getelementptr inbounds i32, ptr %0, i64 %offset.idx
  %wide.load = load <2 x i32>, ptr %1, align 4, !tbaa !0
  ret <2 x i32> %wide.load
}

define i64 @"200"(i64 %0, ptr %offsets, ptr %num_nodes_.i, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !69
  %n.mod.vf = and i64 %2, %1
  %3 = load ptr, ptr %offsets, align 8
  %arrayidx.i493734 = getelementptr inbounds i64, ptr %3, i64 %n.mod.vf
  store i64 %0, ptr %arrayidx.i493734, align 8, !tbaa !7
  ret i64 %0
}

define i64 @"201"(ptr %offsets, ptr %num_nodes_.i, i32 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !69
  %2 = trunc i64 %1 to i32
  %n184.0657 = add i32 %2, %0
  %3 = zext i32 %n184.0657 to i64
  %4 = load ptr, ptr %offsets, align 8, !tbaa !33
  %arrayidx.i540 = getelementptr inbounds i64, ptr %4, i64 %3
  %5 = load i64, ptr %arrayidx.i540, align 8, !tbaa !7
  ret i64 %5
}

define ptr @"202"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, ptr %.omp.lb) {
bb:
  %1 = load ptr, ptr %in_index_.i, align 8
  %2 = load ptr, ptr %out_index_.i, align 8
  %3 = load i8, ptr %transpose, align 1, !tbaa !66, !range !67, !noundef !68
  %tobool.not = icmp eq i8 %3, %0
  %.pn = select i1 %tobool.not, ptr %2, ptr %1
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %5 = sext i32 %4 to i64
  %n_start.0.in = getelementptr inbounds ptr, ptr %.pn, i64 %5
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !11
  ret ptr %n_start.0
}

define i64 @"203"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %end_size_.i.i) {
bb:
  %2 = load i32, ptr %v, align 4, !tbaa !9
  %sub = add nsw i32 %2, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  %3 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !14
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %3, align 4, !tbaa.struct !15
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define ptr @"204"(ptr %_M_before_begin.i, ptr %retval.0.i, ptr %add.ptr, i64 %__bkt_count) {
bb:
  %0 = load i32, ptr %add.ptr, align 4, !tbaa !0
  %conv.i.i.i = sext i32 %0 to i64
  %rem.i.i = urem i64 %conv.i.i.i, %__bkt_count
  %arrayidx = getelementptr inbounds ptr, ptr %retval.0.i, i64 %rem.i.i
  store ptr %_M_before_begin.i, ptr %arrayidx, align 8, !tbaa !11
  ret ptr %_M_before_begin.i
}

define i64 @"205"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %2) {
bb:
  %3 = load i32, ptr %v, align 4, !tbaa !9
  %sub = add nsw i32 %3, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %2, align 4, !tbaa.struct !15
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"206"(ptr %__p.022.i.i.i.i, i64 %0) {
bb:
  %1 = load ptr, ptr %__p.022.i.i.i.i, align 8, !tbaa !74
  %retval.1.i.i = getelementptr inbounds i8, ptr %1, i64 %0
  %2 = load i32, ptr %retval.1.i.i, align 4, !tbaa !0
  ret i32 %2
}

define i32 @"207"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %5 = load ptr, ptr %el, align 8, !tbaa !12
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %ind.end
  %add.ptr.sroa_idx.prol = getelementptr inbounds i8, ptr %add.ptr.prol, i64 %2
  %6 = load i32, ptr %add.ptr.sroa_idx.prol, align 4
  ret i32 %6
}

define i32 @"208"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %el, align 8, !tbaa !12
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add15 = add i64 %ind.end, %2
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %add15
  %6 = load i32, ptr %add.ptr.1, align 4
  ret i32 %6
}

define i32 @"209"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !12
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %ind.end
  %5 = load i32, ptr %add.ptr, align 4
  ret i32 %5
}

define ptr @"210"(ptr %cond.i31.i.i.i, i64 %.sroa.speculated.i.i.i.i, i64 %0, ptr %count_vector, i64 %1, i64 %2, i64 %3, i64 %sub.ptr.div.i.i.i.i.i, i1 %cmp9.i.i.i.i, i64 %4, i64 %add.i.i.i.i, ptr %_M_end_of_storage.i.i277) {
bb:
  %5 = load ptr, ptr %count_vector, align 8, !tbaa !11
  %sub.ptr.rhs.cast.i.i.i.i.i = ptrtoint ptr %5 to i64
  %6 = ptrtoint ptr %5 to i64
  %7 = sub i64 %0, %6
  %8 = lshr i64 %7, %1
  %9 = add nuw nsw i64 %8, %2
  %n.vec = and i64 %9, %3
  %10 = shl i64 %n.vec, %1
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i, i64 %10
  %incdec.ptr.i.i.i = getelementptr %"struct.std::pair.8", ptr %ind.end, i64 %2
  %sub.ptr.lhs.cast.i.i.i.i.i = ptrtoint ptr %incdec.ptr.i.i.i to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i2 = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, %1
  %add.i.i.i.i4 = add i64 %.sroa.speculated.i.i.i.i, %sub.ptr.div.i.i.i.i.i
  %cmp7.i.i.i.i = icmp ult i64 %add.i.i.i.i, %sub.ptr.div.i.i.i.i.i
  %or.cond.i.i.i.i = or i1 %cmp7.i.i.i.i, %cmp9.i.i.i.i
  %cond.i.i.i.i = select i1 %or.cond.i.i.i.i, i64 %4, i64 %add.i.i.i.i
  %add.ptr19.i.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %cond.i31.i.i.i, i64 %cond.i.i.i.i
  store ptr %add.ptr19.i.i.i, ptr %_M_end_of_storage.i.i277, align 8, !tbaa !16
  ret ptr %add.ptr19.i.i.i
}

define ptr @"211"(ptr %neighs, ptr %arrayidx.i, ptr %index, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %neighs, align 8, !tbaa !11
  %1 = load i64, ptr %arrayidx.i, align 8, !tbaa !7
  %add.ptr = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %3 = sext i32 %2 to i64
  %4 = load ptr, ptr %index, align 8, !tbaa !11
  %arrayidx = getelementptr inbounds ptr, ptr %4, i64 %3
  store ptr %add.ptr, ptr %arrayidx, align 8, !tbaa !11
  ret ptr %add.ptr
}

define i64 @"212"(ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, i64 %2, ptr %num_blocks) {
bb:
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !35
  %sub.ptr.lhs.cast.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %degrees, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %sub = add nsw i64 %sub.ptr.div.i, %1
  %div38 = lshr i64 %sub, %2
  store i64 %div38, ptr %num_blocks, align 8, !tbaa !7
  ret i64 %div38
}

define i64 @"213"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57) {
bb:
  %0 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !7
  %1 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !7
  %2 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !7
  %3 = load i64, ptr %arrayidx.i58, align 8, !tbaa !7
  %add7 = add nsw i64 %3, %total.076
  %add7.1 = add nsw i64 %2, %add7
  %add7.2 = add nsw i64 %1, %add7.1
  %add7.3 = add nsw i64 %0, %add7.2
  store i64 %add7.3, ptr %arrayidx.i57, align 8, !tbaa !7
  ret i64 %add7.3
}

define i64 @"214"(ptr %add.ptr3.i.i.i, ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !51
  %1 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !51
  %cmp.i.i.i.i.i = icmp eq i32 %1, %0
  %cmp7.i.i.i.i.i = icmp slt i32 %1, %0
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

define ptr @"215"(ptr %el, ptr %0, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !12
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !14
  ret ptr %add.ptr.i464
}

define i64 @"216"(ptr %__first.addr.07.i.i.i.i.i.i.i, ptr %cond.i31.i.i.i, ptr %_M_finish.i.i114, i64 %0, i64 %1, ptr %count_vector, i64 %2, i64 %3) {
bb:
  %4 = load i64, ptr %__first.addr.07.i.i.i.i.i.i.i, align 4, !alias.scope !78, !noalias !81
  %5 = load ptr, ptr %count_vector, align 8, !tbaa !11
  %6 = ptrtoint ptr %5 to i64
  %7 = load ptr, ptr %_M_finish.i.i114, align 8, !tbaa !19
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %7, i64 %0
  %8 = ptrtoint ptr %incdec.ptr.i.i to i64
  %9 = add i64 %8, %1
  %10 = sub i64 %9, %6
  %11 = lshr i64 %10, %2
  %12 = add nuw nsw i64 %11, %0
  %n.vec = and i64 %12, %3
  %13 = shl i64 %n.vec, %2
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i, i64 %13
  store i64 %4, ptr %ind.end, align 4, !alias.scope !81, !noalias !78
  ret i64 %4
}

define i32 @"217"(ptr %add.ptr3.i.i.i.i, ptr %add.ptr4.i.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr3.i.i.i.i, align 4, !tbaa !0
  store i32 %0, ptr %add.ptr4.i.i.i.i, align 4, !tbaa !0
  ret i32 %0
}

define i32 @"218"(ptr %e.sroa.5.0..sroa_idx, ptr %0, ptr %offsets, ptr %add.ptr, i64 %1) {
bb:
  %2 = load ptr, ptr %0, align 8, !tbaa !11
  %3 = load ptr, ptr %offsets, align 8, !tbaa !33
  %e.sroa.0.0.copyload = load i32, ptr %add.ptr, align 4, !tbaa.struct !15
  %conv = sext i32 %e.sroa.0.0.copyload to i64
  %arrayidx.i = getelementptr inbounds i64, ptr %3, i64 %conv
  %4 = atomicrmw add ptr %arrayidx.i, i64 %1 seq_cst, align 8
  %arrayidx = getelementptr inbounds i32, ptr %2, i64 %4
  %e.sroa.5.0.copyload = load i32, ptr %e.sroa.5.0..sroa_idx, align 4, !tbaa.struct !104
  store i32 %e.sroa.5.0.copyload, ptr %arrayidx, align 4, !tbaa !0
  ret i32 %e.sroa.5.0.copyload
}

define i64 @"219"(ptr %new_range.i.i, i64 %0) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !11
  %incdec.ptr.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i = load i64, ptr %incdec.ptr.i.i.i.i, align 4, !tbaa.struct !15
  ret i64 %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i
}

define <8 x i32> @"220"(ptr %el, ptr %.omp.lb, i64 %index, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %offset.idx = add i64 %1, %index
  %2 = add i64 %offset.idx, %0
  %3 = load ptr, ptr %el, align 8, !tbaa !12
  %4 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %2
  %wide.vec44 = load <8 x i32>, ptr %4, align 4
  ret <8 x i32> %wide.vec44
}

define ptr @"222"(ptr %_M_before_begin.i, ptr %__p.044) {
bb:
  %0 = load ptr, ptr %_M_before_begin.i, align 8, !tbaa !75
  %1 = load ptr, ptr %__p.044, align 8, !tbaa !74
  store ptr %0, ptr %1, align 8, !tbaa !74
  ret ptr %0
}

define i32 @"223"(i32 %0, ptr %call171, ptr %arrayidx.i548, i64 %1, ptr %arrayidx.i549) {
bb:
  %2 = load i64, ptr %arrayidx.i548, align 8, !tbaa !7
  %add286 = add i64 %2, %1
  %3 = load i32, ptr %arrayidx.i549, align 4, !tbaa !0
  %idx.ext = sext i32 %3 to i64
  %sub287 = add i64 %add286, %idx.ext
  %arrayidx288 = getelementptr inbounds i32, ptr %call171, i64 %sub287
  store i32 %0, ptr %arrayidx288, align 4, !tbaa !0
  ret i32 %0
}

define ptr @"225"(ptr %new_range.i.i457, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !12
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %2 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !11
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !18
  ret ptr %add.ptr6.i.i478
}

define i8 @"226"(ptr %0, ptr %opt_arg) {
bb:
  %1 = load i8, ptr %0, align 8, !tbaa !53
  %2 = load ptr, ptr %opt_arg, align 8, !tbaa !57
  store i8 %1, ptr %2, align 1, !tbaa !53
  ret i8 %1
}

define <4 x i32> @"227"(ptr %0, ptr %call171, ptr %arrayidx.i539, i64 %1, i64 %index800, i64 %2) {
bb:
  %wide.load803 = load <4 x i32>, ptr %0, align 4, !tbaa !0
  %3 = load i64, ptr %arrayidx.i539, align 8, !tbaa !7
  %sub183 = add nsw i64 %3, %1
  %offset.idx801 = sub i64 %sub183, %index800
  %4 = getelementptr inbounds i32, ptr %call171, i64 %offset.idx801
  %5 = getelementptr inbounds i32, ptr %4, i64 %2
  store <4 x i32> %wide.load803, ptr %5, align 4, !tbaa !0
  ret <4 x i32> %wide.load803
}

define i64 @"228"(ptr %incdec.ptr126.i.i, ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %incdec.ptr5.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %1 = load i64, ptr %incdec.ptr126.i.i, align 4
  store i64 %1, ptr %incdec.ptr5.i.i, align 4
  ret i64 %1
}

define i64 @"229"(ptr %__begin0.sroa.0.060, i64 %0, ptr %cond.i31.i.i.i, ptr %_M_finish.i38, i64 %1, i64 %sub.ptr.rhs.cast.i, i64 %2) {
bb:
  %3 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !19
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %3, i64 %1
  %sub.ptr.lhs.cast.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %2
  %add.ptr.i.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %cond.i31.i.i.i, i64 %sub.ptr.div.i
  %4 = load i64, ptr %__begin0.sroa.0.060, align 4
  %kvp.sroa.5.0.extract.shift = lshr i64 %4, %0
  %retval.sroa.2.0.insert.ext.i = shl i64 %4, %0
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.ext.i, %kvp.sroa.5.0.extract.shift
  store i64 %retval.sroa.0.0.insert.insert.i, ptr %add.ptr.i.i.i, align 4
  ret i64 %retval.sroa.0.0.insert.insert.i
}

define i32 @"230"(ptr %num_nodes, i64 %0, ptr %length.i) {
bb:
  %1 = load i64, ptr %num_nodes, align 8, !tbaa !7
  %add = add nsw i64 %1, %0
  %conv.i = trunc i64 %add to i32
  store i32 %conv.i, ptr %length.i, align 4, !tbaa !0
  ret i32 %conv.i
}

define ptr @"231"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !11
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !14
  ret ptr %add.ptr.i
}

define ptr @"232"(ptr %el, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !14
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !14
  ret ptr %add.ptr.i
}

define i64 @"233"(ptr %arrayidx.i533, i64 %total_missing_inv.0.lcssa) {
bb:
  %0 = load i64, ptr %arrayidx.i533, align 8, !tbaa !7
  %add165 = add nsw i64 %0, %total_missing_inv.0.lcssa
  store i64 %add165, ptr %arrayidx.i533, align 8, !tbaa !7
  ret i64 %add165
}

define <4 x i32> @"234"(ptr %0, ptr %call171, i64 %tail_index.0660, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %1, i64 %index800, i64 %2) {
bb:
  %wide.load803 = load <4 x i32>, ptr %0, align 4, !tbaa !0
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !0
  %.pre731 = sext i32 %.pre717 to i64
  %3 = load i64, ptr %arrayidx.i540, align 8, !tbaa !7
  %4 = load i32, ptr %arrayidx.i541, align 4, !tbaa !0
  %conv198 = sext i32 %4 to i64
  %add199 = add nsw i64 %3, %conv198
  %5 = load i64, ptr %arrayidx.i542, align 8, !tbaa !7
  %6 = sub i64 %5, %add199
  %n.vec793 = and i64 %6, %1
  %ind.end796 = sub i64 %tail_index.0660, %n.vec793
  %sub226 = sub nsw i64 %ind.end796, %.pre731
  %offset.idx801 = sub i64 %sub226, %index800
  %7 = getelementptr inbounds i32, ptr %call171, i64 %offset.idx801
  %8 = getelementptr inbounds i32, ptr %7, i64 %2
  store <4 x i32> %wide.load803, ptr %8, align 4, !tbaa !0
  ret <4 x i32> %wide.load803
}

define i64 @"235"(ptr %call.i253, ptr %label_source_pair.sroa.5.0.call43.sroa_idx, i64 %0) {
bb:
  %label_source_pair.sroa.5.0.copyload = load i32, ptr %label_source_pair.sroa.5.0.call43.sroa_idx, align 4
  %conv46 = sext i32 %label_source_pair.sroa.5.0.copyload to i64
  %div1.i.i = lshr i64 %conv46, %0
  %arrayidx.i268 = getelementptr inbounds i64, ptr %call.i253, i64 %div1.i.i
  %1 = load i64, ptr %arrayidx.i268, align 8, !tbaa !7
  ret i64 %1
}

define i64 @"236"(ptr %offsets, ptr %num_nodes_.i, i32 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8, !tbaa !33
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !69
  %4 = trunc i64 %3 to i32
  %n184.0657 = add i32 %4, %0
  %5 = zext i32 %n184.0657 to i64
  %sext = shl i64 %5, %1
  %conv202 = ashr exact i64 %sext, %1
  %arrayidx.i542 = getelementptr inbounds i64, ptr %2, i64 %conv202
  %6 = load i64, ptr %arrayidx.i542, align 8, !tbaa !7
  ret i64 %6
}

define i32 @"237"(ptr %init_val, ptr %this, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %init_val, align 4, !tbaa !0
  %1 = load ptr, ptr %this, align 8, !tbaa !4
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %add.ptr = getelementptr inbounds i32, ptr %1, i64 %2
  store i32 %0, ptr %add.ptr, align 4, !tbaa !0
  ret i32 %0
}

define i32 @"238"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %2 = load ptr, ptr %el, align 8, !tbaa !12
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %1
  %add.ptr.sroa_idx.prol = getelementptr inbounds i8, ptr %add.ptr.prol, i64 %0
  %3 = load i32, ptr %add.ptr.sroa_idx.prol, align 4
  ret i32 %3
}

define i32 @"239"(ptr %__first.addr.033.i.i, ptr %n_start.0.in) {
bb:
  %0 = load i32, ptr %__first.addr.033.i.i, align 4, !tbaa !0
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !11
  store i32 %0, ptr %n_start.0, align 4, !tbaa !0
  ret i32 %0
}

define i8 @"240"(ptr %arrayidx17.i.i, ptr %ref.tmp, i64 %conv5.i) {
bb:
  %0 = load i8, ptr %arrayidx17.i.i, align 2, !tbaa !53, !noalias !54
  %1 = load ptr, ptr %ref.tmp, align 8, !tbaa !57, !alias.scope !54
  %arrayidx.i.i = getelementptr inbounds i8, ptr %1, i64 %conv5.i
  store i8 %0, ptr %arrayidx.i.i, align 1, !tbaa !53
  ret i8 %0
}

define i32 @"241"(ptr %e.sroa.4.0..sroa_idx, ptr %el, ptr %arrayidx.i) {
bb:
  %e.sroa.4.0.copyload = load i32, ptr %e.sroa.4.0..sroa_idx, align 4, !tbaa.struct !104
  %0 = load i64, ptr %arrayidx.i, align 8, !tbaa !7
  %1 = load ptr, ptr %el, align 8, !tbaa !12
  %arrayidx = getelementptr inbounds i32, ptr %1, i64 %0
  store i32 %e.sroa.4.0.copyload, ptr %arrayidx, align 4, !tbaa !0
  ret i32 %e.sroa.4.0.copyload
}

define i32 @"242"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.0649, ptr %arrayidx.i536) {
bb:
  %1 = load i64, ptr %arrayidx.i542, align 8, !tbaa !7
  %i200.0 = add nsw i64 %1, %0
  %2 = load i32, ptr %arrayidx.i536, align 4, !tbaa !0
  %conv155 = sext i32 %2 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %sub211 = sub nsw i64 %i200.0, %add156
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %3 = load i32, ptr %arrayidx212, align 4, !tbaa !0
  ret i32 %3
}

define i64 @"243"(ptr %_M_string_length.i.i.i.i, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0, i32 %1) {
bb:
  %2 = load i64, ptr %_M_string_length.i.i.i.i, align 8, !tbaa !41
  %3 = load ptr, ptr %this, align 8, !tbaa !11
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %_M_string_length.i24.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i, i32 1
  store i64 %2, ptr %_M_string_length.i24.i.i.i, align 8, !tbaa !41
  ret i64 %2
}

define i64 @"244"(ptr %add.ptr.i113, ptr %cond.i31.i.i.i, i64 %0, ptr %count_vector, i64 %1, i64 %2, i64 %3) {
bb:
  %4 = load i64, ptr %add.ptr.i113, align 4
  %5 = load ptr, ptr %count_vector, align 8, !tbaa !11
  %sub.ptr.rhs.cast.i.i.i.i.i = ptrtoint ptr %5 to i64
  %6 = ptrtoint ptr %5 to i64
  %7 = sub i64 %0, %6
  %8 = lshr i64 %7, %1
  %9 = add nuw nsw i64 %8, %2
  %n.vec = and i64 %9, %3
  %10 = shl i64 %n.vec, %1
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i, i64 %10
  %incdec.ptr.i.i.i = getelementptr %"struct.std::pair.8", ptr %ind.end, i64 %2
  %sub.ptr.lhs.cast.i.i.i.i.i = ptrtoint ptr %incdec.ptr.i.i.i to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, %1
  %add.ptr.i.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %cond.i31.i.i.i, i64 %sub.ptr.div.i.i.i.i.i
  store i64 %4, ptr %add.ptr.i.i.i, align 4
  ret i64 %4
}

define i32 @"245"(ptr %.omp.lb, ptr %comp, i64 %indvars.iv) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %1 = sext i32 %0 to i64
  %2 = trunc i64 %1 to i32
  %3 = load ptr, ptr %comp, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i32, ptr %3, i64 %indvars.iv
  store i32 %2, ptr %arrayidx.i, align 4, !tbaa !0
  ret i32 %2
}

define i64 @"246"(ptr %arrayidx.i492.1, ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i492.1, align 8, !tbaa !7
  %3 = load ptr, ptr %offsets, align 8
  %4 = load i64, ptr %num_nodes_.i, align 8, !tbaa !69
  %n.mod.vf = and i64 %4, %0
  %indvars.iv.next = add nsw i64 %n.mod.vf, %1
  %arrayidx.i493.1 = getelementptr inbounds i64, ptr %3, i64 %indvars.iv.next
  store i64 %2, ptr %arrayidx.i493.1, align 8, !tbaa !7
  ret i64 %2
}

define i32 @"247"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !12
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %add15 = add i64 %2, %0
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %add15
  %3 = load i32, ptr %add.ptr.1, align 4
  ret i32 %3
}

define i64 @"248"(ptr %this, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %this, align 8, !tbaa !12
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %1
  %2 = load i64, ptr %arrayidx, align 4
  ret i64 %2
}

define i64 @"249"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !12
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i78.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !15
  ret i64 %agg.tmp.sroa.0.0.copyload.i78.i.i.i.i
}

define i64 @"250"(ptr %0, ptr %_M_finish.i38, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5) {
bb:
  %6 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !19
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %6, i64 %1
  %7 = ptrtoint ptr %incdec.ptr.i.i to i64
  %8 = add i64 %7, %2
  %9 = sub i64 %8, %3
  %10 = lshr i64 %9, %4
  %11 = add nuw nsw i64 %10, %1
  %n.vec = and i64 %11, %5
  %12 = shl i64 %n.vec, %4
  %ind.end65 = getelementptr i8, ptr %0, i64 %12
  %13 = load i64, ptr %ind.end65, align 4, !alias.scope !83, !noalias !86
  ret i64 %13
}

define ptr @"251"(ptr %neighs, ptr %arrayidx.i.prol, ptr %index, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %index, align 8, !tbaa !11
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !0
  %2 = sext i32 %1 to i64
  %arrayidx.prol = getelementptr inbounds ptr, ptr %0, i64 %2
  %3 = load ptr, ptr %neighs, align 8, !tbaa !11
  %4 = load i64, ptr %arrayidx.i.prol, align 8, !tbaa !7
  %add.ptr.prol = getelementptr inbounds i32, ptr %3, i64 %4
  store ptr %add.ptr.prol, ptr %arrayidx.prol, align 8, !tbaa !11
  ret ptr %add.ptr.prol
}

define i32 @"252"(ptr %end_size_.i.i583, ptr %offsets, i64 %0, ptr %length.i581) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !33
  %sub.ptr.rhs.cast.i.i585 = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %end_size_.i.i583, align 8, !tbaa !50
  %sub.ptr.lhs.cast.i.i584 = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i586 = sub i64 %sub.ptr.lhs.cast.i.i584, %sub.ptr.rhs.cast.i.i585
  %3 = lshr exact i64 %sub.ptr.sub.i.i586, %0
  %conv.i587 = trunc i64 %3 to i32
  store i32 %conv.i587, ptr %length.i581, align 4, !tbaa !0
  ret i32 %conv.i587
}

define ptr @"253"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, i64 %1) {
bb:
  %2 = load i8, ptr %transpose, align 1, !tbaa !66, !range !67, !noundef !68
  %tobool.not = icmp eq i8 %2, %0
  %3 = load ptr, ptr %in_index_.i, align 8
  %4 = load ptr, ptr %out_index_.i, align 8
  %.sink = select i1 %tobool.not, ptr %4, ptr %3
  %arrayidx.i.i.i60 = getelementptr inbounds ptr, ptr %.sink, i64 %1
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !11
  ret ptr %n_end.0
}

define i32 @"254"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3) {
bb:
  %4 = load ptr, ptr %el, align 8, !tbaa !12
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !7
  %6 = sub i64 %0, %5
  %n.vec = and i64 %6, %1
  %ind.end = add i64 %5, %n.vec
  %add15 = add i64 %ind.end, %2
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %4, i64 %add15
  %add.ptr.sroa_idx.1 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %3
  %7 = load i32, ptr %add.ptr.sroa_idx.1, align 4
  ret i32 %7
}

define i32 @"255"(i64 %indvars.iv699, ptr %incdec.ptr4.sink.i.i.i.i569, ptr %__first.addr.015.i.i563, ptr %call171, ptr %arrayidx.i550, i64 %sub.ptr.rhs.cast.i.i.i.i552, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %incdec.ptr4.sink.i.i.i.i569, align 4, !tbaa !0
  %3 = sext i32 %2 to i64
  %cmp.i.i.i570 = icmp sgt i64 %indvars.iv699, %3
  %4 = load i64, ptr %arrayidx.i550, align 8, !tbaa !7
  %add.ptr271 = getelementptr inbounds i32, ptr %call171, i64 %4
  %sub.ptr.lhs.cast.i.i.i.i551 = ptrtoint ptr %add.ptr271 to i64
  %sub.ptr.sub.i.i.i.i553 = sub i64 %sub.ptr.lhs.cast.i.i.i.i551, %sub.ptr.rhs.cast.i.i.i.i552
  %sub.ptr.div.i.i.i.i561 = lshr exact i64 %sub.ptr.sub.i.i.i.i553, %0
  %shr.i.i565 = lshr i64 %sub.ptr.div.i.i.i.i561, %1
  %incdec.ptr4.sink.i.i.i.i5692 = getelementptr inbounds i32, ptr %__first.addr.015.i.i563, i64 %shr.i.i565
  %incdec.ptr.i.i571 = getelementptr inbounds i32, ptr %incdec.ptr4.sink.i.i.i.i569, i64 %1
  %__first.addr.1.i.i574 = select i1 %cmp.i.i.i570, ptr %incdec.ptr.i.i571, ptr %__first.addr.015.i.i563
  %5 = load i32, ptr %__first.addr.1.i.i574, align 4, !tbaa !0
  ret i32 %5
}

!0 = !{!1, !1, i64 0}
!1 = !{!"int", !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C++ TBAA"}
!4 = !{!5, !6, i64 0}
!5 = !{!"_ZTS7pvectorIiE", !6, i64 0, !6, i64 8, !6, i64 16}
!6 = !{!"any pointer", !2, i64 0}
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !2, i64 0}
!9 = !{!10, !1, i64 0}
!10 = !{!"_ZTS10NodeWeightIiiE", !1, i64 0, !1, i64 4}
!11 = !{!6, !6, i64 0}
!12 = !{!13, !6, i64 0}
!13 = !{!"_ZTS7pvectorI8EdgePairIiiEE", !6, i64 0, !6, i64 8, !6, i64 16}
!14 = !{!13, !6, i64 8}
!15 = !{i64 0, i64 4, !0, i64 4, i64 4, !0}
!16 = !{!17, !6, i64 16}
!17 = !{!"_ZTSNSt12_Vector_baseISt4pairIiiESaIS1_EE17_Vector_impl_dataE", !6, i64 0, !6, i64 8, !6, i64 16}
!18 = !{!13, !6, i64 16}
!19 = !{!17, !6, i64 8}
!20 = !{!21, !6, i64 24}
!21 = !{!"_ZTS8CSRGraphIiiLb1EE", !22, i64 0, !8, i64 8, !8, i64 16, !6, i64 24, !6, i64 32, !6, i64 40, !6, i64 48}
!22 = !{!"bool", !2, i64 0}
!23 = !{!24}
!24 = distinct !{!24, !25, !"_ZNK8CSRGraphIiiLb1EE9out_neighEim: %agg.result"}
!25 = distinct !{!25, !"_ZNK8CSRGraphIiiLb1EE9out_neighEim"}
!26 = !{!27, !1, i64 0}
!27 = !{!"_ZTSSt4pairIiiE", !1, i64 0, !1, i64 4}
!28 = !{!29, !8, i64 8}
!29 = !{!"_ZTSNSt24uniform_int_distributionImE10param_typeE", !8, i64 0, !8, i64 8}
!30 = !{!29, !8, i64 0}
!31 = !{!32, !8, i64 8}
!32 = !{!"_ZTS9GeneratorIiiijLi32ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEE", !1, i64 0, !8, i64 8, !8, i64 16}
!33 = !{!34, !6, i64 0}
!34 = !{!"_ZTS7pvectorIlE", !6, i64 0, !6, i64 8, !6, i64 16}
!35 = !{!5, !6, i64 8}
!36 = !{!37}
!37 = distinct !{!37, !38}
!38 = distinct !{!38, !"LVerDomain"}
!39 = !{!40}
!40 = distinct !{!40, !38}
!41 = !{!42, !8, i64 8}
!42 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !43, i64 0, !8, i64 8, !2, i64 16}
!43 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !6, i64 0}
!44 = !{!45, !8, i64 8}
!45 = !{!"_ZTSSt10_HashtableIiSt4pairIKiiESaIS2_ENSt8__detail10_Select1stESt8equal_toIiESt4hashIiENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb0ELb0ELb1EEEE", !6, i64 0, !8, i64 8, !46, i64 16, !8, i64 24, !47, i64 32, !6, i64 48}
!46 = !{!"_ZTSNSt8__detail15_Hash_node_baseE", !6, i64 0}
!47 = !{!"_ZTSNSt8__detail20_Prime_rehash_policyE", !48, i64 0, !8, i64 8}
!48 = !{!"float", !2, i64 0}
!49 = !{!45, !6, i64 0}
!50 = !{!34, !6, i64 8}
!51 = !{!52, !1, i64 0}
!52 = !{!"_ZTS8EdgePairIiiE", !1, i64 0, !1, i64 4}
!53 = !{!2, !2, i64 0}
!54 = !{!55}
!55 = distinct !{!55, !56, !"_ZNSt7__cxx119to_stringEi: %agg.result"}
!56 = distinct !{!56, !"_ZNSt7__cxx119to_stringEi"}
!57 = !{!42, !6, i64 0}
!58 = !{!59}
!59 = distinct !{!59, !60, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_: %agg.result"}
!60 = distinct !{!60, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_"}
!61 = !{!62, !8, i64 4992}
!62 = !{!"_ZTSSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE", !2, i64 0, !8, i64 4992}
!63 = !{!64}
!64 = distinct !{!64, !65, !"_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm: %agg.result"}
!65 = distinct !{!65, !"_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm"}
!66 = !{!22, !22, i64 0}
!67 = !{i8 0, i8 2}
!68 = !{}
!69 = !{!70, !8, i64 16}
!70 = !{!"_ZTS11BuilderBaseIiiiLb1EE", !6, i64 0, !22, i64 8, !22, i64 9, !22, i64 10, !8, i64 16}
!71 = !{!72}
!72 = distinct !{!72, !73, !"_ZN11BuilderBaseIiiiLb1EE11SquishGraphERK8CSRGraphIiiLb1EE: %agg.result"}
!73 = distinct !{!73, !"_ZN11BuilderBaseIiiiLb1EE11SquishGraphERK8CSRGraphIiiLb1EE"}
!74 = !{!46, !6, i64 0}
!75 = !{!45, !6, i64 16}
!76 = !{!27, !1, i64 4}
!77 = !{!21, !8, i64 8}
!78 = !{!79}
!79 = distinct !{!79, !80, !"_ZSt19__relocate_object_aISt4pairIiiES1_SaIS1_EEvPT_PT0_RT1_: %__orig"}
!80 = distinct !{!80, !"_ZSt19__relocate_object_aISt4pairIiiES1_SaIS1_EEvPT_PT0_RT1_"}
!81 = !{!82}
!82 = distinct !{!82, !80, !"_ZSt19__relocate_object_aISt4pairIiiES1_SaIS1_EEvPT_PT0_RT1_: %__dest"}
!83 = !{!84}
!84 = distinct !{!84, !85, !"_ZSt19__relocate_object_aISt4pairIiiES1_SaIS1_EEvPT_PT0_RT1_: %__orig"}
!85 = distinct !{!85, !"_ZSt19__relocate_object_aISt4pairIiiES1_SaIS1_EEvPT_PT0_RT1_"}
!86 = !{!87}
!87 = distinct !{!87, !85, !"_ZSt19__relocate_object_aISt4pairIiiES1_SaIS1_EEvPT_PT0_RT1_: %__dest"}
!88 = !{!89}
!89 = distinct !{!89, !90, !"_ZNSt7__cxx119to_stringEi: %agg.result"}
!90 = distinct !{!90, !"_ZNSt7__cxx119to_stringEi"}
!91 = !{!92, !1, i64 156}
!92 = !{!"_ZTS5CLApp", !93, i64 0, !22, i64 155, !1, i64 156, !8, i64 160, !22, i64 168, !22, i64 169}
!93 = !{!"_ZTS6CLBase", !1, i64 8, !6, i64 16, !42, i64 24, !42, i64 56, !94, i64 88, !1, i64 112, !1, i64 116, !42, i64 120, !22, i64 152, !22, i64 153, !22, i64 154}
!94 = !{!"_ZTSSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !95, i64 0}
!95 = !{!"_ZTSSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !96, i64 0}
!96 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implE", !97, i64 0}
!97 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_Vector_impl_dataE", !6, i64 0, !6, i64 8, !6, i64 16}
!98 = !{!99}
!99 = distinct !{!99, !100, !"_ZNK8CSRGraphIiiLb1EE9out_neighEim: %agg.result"}
!100 = distinct !{!100, !"_ZNK8CSRGraphIiiLb1EE9out_neighEim"}
!101 = !{!97, !6, i64 8}
!102 = !{!97, !6, i64 16}
!103 = !{!32, !8, i64 16}
!104 = !{i64 0, i64 4, !0}
