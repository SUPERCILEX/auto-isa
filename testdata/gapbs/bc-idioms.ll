; ModuleID = 'bc-idioms'
source_filename = "bc-idioms"
target triple = "riscv64"

%struct.EdgePair = type { i32, i32 }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char>::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char>::_Alloc_hider" = type { ptr }
%union.anon = type { i64, [8 x i8] }
%"class.std::vector.26" = type { %"struct.std::_Vector_base.27" }
%"struct.std::_Vector_base.27" = type { %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl" }
%"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl" = type { %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data" }
%"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data" = type { ptr, ptr, ptr }
%"struct.std::pair" = type { i32, float }
%"class.std::mersenne_twister_engine" = type { [312 x i64], i64 }
%"struct.std::pair.18" = type { float, i32 }

define ptr @"0"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, i64 %1) {
bb:
  %2 = load i8, ptr %transpose, align 1, !tbaa !0, !range !4, !noundef !5
  %tobool.not = icmp eq i8 %2, %0
  %3 = load ptr, ptr %in_index_.i, align 8
  %4 = load ptr, ptr %out_index_.i, align 8
  %.sink = select i1 %tobool.not, ptr %4, ptr %3
  %arrayidx.i.i.i60 = getelementptr inbounds ptr, ptr %.sink, i64 %1
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !6
  ret ptr %n_end.0
}

define i32 @"1"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !8
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add.ptr = getelementptr inbounds i32, ptr %2, i64 %ind.end
  %5 = load i32, ptr %init_val, align 4, !tbaa !12
  store i32 %5, ptr %add.ptr, align 4, !tbaa !12
  ret i32 %5
}

define i64 @"2"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %2) {
bb:
  %3 = load i32, ptr %v, align 4, !tbaa !14
  %sub = add nsw i32 %3, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  %4 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %4 to i64
  %5 = load ptr, ptr %agg.result, align 8, !tbaa !18
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %5 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = ashr exact i64 %sub.ptr.sub.i12.i.i, %2
  %6 = load ptr, ptr %new_range.i.i, align 8, !tbaa !6
  %add.ptr.i.i149 = getelementptr inbounds %struct.EdgePair, ptr %6, i64 %sub.ptr.div.i13.i.i
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %add.ptr.i.i149, align 4, !tbaa.struct !19
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define float @"3"(ptr %arrayidx.i, ptr %biggest_score, ptr %scores, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %scores, align 8, !tbaa !20
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %2 = sext i32 %1 to i64
  %arrayidx.i2 = getelementptr inbounds float, ptr %0, i64 %2
  %3 = load float, ptr %biggest_score, align 4, !tbaa !22
  %4 = load float, ptr %arrayidx.i, align 4, !tbaa !22
  %div9 = fdiv float %4, %3
  store float %div9, ptr %arrayidx.i, align 4, !tbaa !22
  ret float %div9
}

define i32 @"4"(i64 %indvars.iv687, ptr %incdec.ptr4.sink.i.i.i.i, ptr %__first.addr.015.i.i, ptr %neighs, ptr %arrayidx.i524, i64 %sub.ptr.rhs.cast.i.i.i.i526, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i524, align 8, !tbaa !10
  %3 = load ptr, ptr %neighs, align 8, !tbaa !6
  %add.ptr121 = getelementptr inbounds i32, ptr %3, i64 %2
  %sub.ptr.lhs.cast.i.i.i.i525 = ptrtoint ptr %add.ptr121 to i64
  %sub.ptr.sub.i.i.i.i527 = sub i64 %sub.ptr.lhs.cast.i.i.i.i525, %sub.ptr.rhs.cast.i.i.i.i526
  %sub.ptr.div.i.i.i.i = lshr exact i64 %sub.ptr.sub.i.i.i.i527, %0
  %shr.i.i = lshr i64 %sub.ptr.div.i.i.i.i, %1
  %incdec.ptr4.sink.i.i.i.i2 = getelementptr inbounds i32, ptr %__first.addr.015.i.i, i64 %shr.i.i
  %incdec.ptr.i.i = getelementptr inbounds i32, ptr %incdec.ptr4.sink.i.i.i.i, i64 %1
  %4 = load i32, ptr %incdec.ptr4.sink.i.i.i.i, align 4, !tbaa !12
  %5 = sext i32 %4 to i64
  %cmp.i.i.i530 = icmp sgt i64 %indvars.iv687, %5
  %__first.addr.1.i.i = select i1 %cmp.i.i.i530, ptr %incdec.ptr.i.i, ptr %__first.addr.015.i.i
  %6 = load i32, ptr %__first.addr.1.i.i, align 4, !tbaa !12
  ret i32 %6
}

define ptr @"5"(ptr %new_range.i.i, ptr %end_size_.i, ptr %el, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !16
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %1 = load ptr, ptr %new_range.i.i, align 8, !tbaa !6
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !24
  ret ptr %add.ptr6.i.i
}

define ptr @"6"(ptr %__args, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0) {
bb:
  %1 = load ptr, ptr %this, align 8, !tbaa !6
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %1 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %add.ptr = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i
  %2 = load ptr, ptr %__args, align 8, !tbaa !25
  store ptr %2, ptr %add.ptr, align 8, !tbaa !25
  ret ptr %2
}

define float @"7"(ptr %arrayidx.i.prol, float %0, ptr %arrayidx.i, float %1, ptr %arrayidx.i.1, float %2, ptr %biggest_score4) {
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
  store float %8, ptr %biggest_score4, align 4, !tbaa !22
  ret float %8
}

define <2 x i32> @"8"(ptr %degrees, ptr %.omp.lb, i64 %0, i64 %index) {
bb:
  %1 = load ptr, ptr %degrees, align 8, !tbaa !8
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %mul12 = shl i64 %2, %0
  %offset.idx = add i64 %mul12, %index
  %3 = getelementptr inbounds i32, ptr %1, i64 %offset.idx
  %wide.load = load <2 x i32>, ptr %3, align 4, !tbaa !12
  ret <2 x i32> %wide.load
}

define ptr @"9"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %2 = load ptr, ptr %new_range.i.i, align 8, !tbaa !6
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !24
  ret ptr %add.ptr6.i.i
}

define ptr @"10"(ptr %new_range.i.i457, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1, ptr %el, ptr %end_capacity_.i.i.i) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !18
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !16
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !6
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !24
  ret ptr %add.ptr6.i.i478
}

define i32 @"11"(ptr %queue, ptr %shared_out_start.i, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %1 = load i64, ptr %shared_out_start.i, align 8, !tbaa !28
  %2 = load ptr, ptr %queue, align 8, !tbaa !30
  %add.ptr.i = getelementptr inbounds i32, ptr %2, i64 %1
  %add.ptr = getelementptr inbounds i32, ptr %add.ptr.i, i64 %0
  %3 = load i32, ptr %add.ptr, align 4, !tbaa !12, !llvm.access.group !31
  ret i32 %3
}

define i32 @"12"(ptr %incdec.ptr.i, ptr %add.ptr.i27.i.i.i) {
bb:
  %__value.sroa.0.0.copyload.i = load i64, ptr %incdec.ptr.i, align 4
  %__value.sroa.0.0.extract.trunc.i.i.i = trunc i64 %__value.sroa.0.0.copyload.i to i32
  store i32 %__value.sroa.0.0.extract.trunc.i.i.i, ptr %add.ptr.i27.i.i.i, align 4, !tbaa !32
  ret i32 %__value.sroa.0.0.extract.trunc.i.i.i
}

define i32 @"14"(ptr %n_start.0.in, i64 %0, ptr %diffs, ptr %.omp.lb) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !6
  %sub.ptr.lhs.cast = ptrtoint ptr %n_start.0 to i64
  %.pre134 = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %.pre134
  %1 = lshr exact i64 %sub.ptr.sub, %0
  %conv22 = trunc i64 %1 to i32
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %3 = sext i32 %2 to i64
  %4 = load ptr, ptr %diffs, align 8, !tbaa !8
  %arrayidx.i99 = getelementptr inbounds i32, ptr %4, i64 %3
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !12
  ret i32 %conv22
}

define ptr @"15"(ptr %verts_at_depth.sroa.0.1.lcssa, ptr %cond.i65.i, ptr %arrayidx.i451, i32 %0, i64 %sub.ptr.rhs.cast.i508, i64 %1, i32 %2, i64 %3) {
bb:
  %4 = load i32, ptr %arrayidx.i451, align 4, !tbaa !12
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
  %6 = load ptr, ptr %_M_finish.i524, align 8, !tbaa !6
  ret ptr %6
}

define i64 @"16"(i64 %val.coerce, ptr %new_range.i, ptr %end_size_.i, ptr %this, i64 %0) {
bb:
  %1 = load ptr, ptr %this, align 8, !tbaa !18
  %sub.ptr.rhs.cast.i11.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i10.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i12.i = sub i64 %sub.ptr.lhs.cast.i10.i, %sub.ptr.rhs.cast.i11.i
  %sub.ptr.div.i13.i = ashr exact i64 %sub.ptr.sub.i12.i, %0
  %3 = load ptr, ptr %new_range.i, align 8, !tbaa !6
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div.i13.i
  store i64 %val.coerce, ptr %add.ptr.i, align 4, !tbaa.struct !19
  ret i64 %val.coerce
}

define i64 @"17"(i64 %local_total.040, ptr %arrayidx.i36, ptr %prefix, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %prefix, align 8
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %mul14 = shl i64 %2, %0
  %arrayidx.i35 = getelementptr inbounds i64, ptr %1, i64 %mul14
  %3 = load i32, ptr %arrayidx.i36, align 4, !tbaa !12
  %conv = sext i32 %3 to i64
  %add20 = add nsw i64 %local_total.040, %conv
  store i64 %add20, ptr %arrayidx.i35, align 8, !tbaa !10
  ret i64 %add20
}

define ptr @"18"(ptr %call5.i.i.i.i4.i.i79, ptr %num_nodes_.i, i64 %0, ptr %_M_finish.i.i9.i) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !34
  %mul.i.i.i.i.i.i = shl nuw nsw i64 %1, %0
  %scevgep.i.i.i.i.i = getelementptr i8, ptr %call5.i.i.i.i4.i.i79, i64 %mul.i.i.i.i.i.i
  store ptr %scevgep.i.i.i.i.i, ptr %_M_finish.i.i9.i, align 8, !tbaa !36
  ret ptr %scevgep.i.i.i.i.i
}

define i32 @"19"(ptr %add.ptr3.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !12
  %1 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !12
  %cmp.i.i.i.i.i = icmp slt i32 %1, %0
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add.ptr4.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i.i.i.i
  %2 = load i32, ptr %add.ptr3.i.i.i.i, align 4, !tbaa !12
  store i32 %2, ptr %add.ptr4.i.i.i.i, align 4, !tbaa !12
  ret i32 %2
}

define i64 @"20"(ptr %_M_b.i, ptr %__param, i64 %0, ptr %_M_b.i32) {
bb:
  %1 = load i64, ptr %_M_b.i, align 8, !tbaa !38
  %2 = load i64, ptr %__param, align 8, !tbaa !40
  %sub = sub i64 %1, %2
  %div31 = lshr i64 %sub, %0
  store i64 %div31, ptr %_M_b.i32, align 8, !tbaa !38
  ret i64 %div31
}

define ptr @"21"(ptr %new_range.i.i457, ptr %new_range.i.i, i64 %0, ptr %el, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !18
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %2 = load ptr, ptr %new_range.i.i, align 8, !tbaa !6
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !6
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !24
  ret ptr %add.ptr6.i.i478
}

define i32 @"22"(ptr %call171, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %0, i64 %1, i64 %total_missing_inv.1659) {
bb:
  %2 = load i64, ptr %arrayidx.i540, align 8, !tbaa !10
  %3 = load i32, ptr %arrayidx.i541, align 4, !tbaa !12
  %conv198 = sext i32 %3 to i64
  %add199 = add nsw i64 %2, %conv198
  %4 = load i64, ptr %arrayidx.i542, align 8, !tbaa !10
  %5 = sub i64 %4, %add199
  %n.vec793 = and i64 %5, %0
  %ind.end794 = sub i64 %4, %n.vec793
  %i200.0 = add nsw i64 %ind.end794, %1
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !12
  %.pre731 = sext i32 %.pre717 to i64
  %sub222 = sub nsw i64 %total_missing_inv.1659, %.pre731
  %sub211 = sub nsw i64 %i200.0, %sub222
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %6 = load i32, ptr %arrayidx212, align 4, !tbaa !12
  ret i32 %6
}

define i64 @"23"(ptr %arrayidx.i140, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i143, i64 %4, i64 %5, i64 %xor4.i146, i64 %6, i64 %xor7.i149, ptr %num_nodes_, i64 %7, ptr %arrayidx.i65, i64 %xor.i67, i64 %xor4.i, i64 %xor7.i, i32 %8, ptr %el, ptr %.omp.lb) {
bb:
  %9 = load ptr, ptr %el, align 8, !tbaa !18
  %10 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %mul = shl i64 %10, %6
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %9, i64 %mul
  %11 = load i64, ptr %arrayidx.i65, align 8, !tbaa !10
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
  %12 = load i64, ptr %arrayidx.i140, align 8, !tbaa !10
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
  %13 = load i64, ptr %num_nodes_, align 8, !tbaa !41
  %14 = trunc i64 %13 to i32
  %rem.i52 = urem i32 %conv7.i54, %8
  %ref.tmp16.sroa.4.0.insert.ext = zext i32 %rem.i52 to i64
  %ref.tmp16.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp16.sroa.4.0.insert.ext, %7
  %ref.tmp16.sroa.0.0.insert.insert = or i64 %ref.tmp16.sroa.4.0.insert.shift, %ref.tmp16.sroa.0.0.insert.ext
  store i64 %ref.tmp16.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp16.sroa.0.0.insert.insert
}

define i32 @"24"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %el, align 8, !tbaa !18
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %ind.end
  %add.ptr.sroa_idx = getelementptr inbounds i8, ptr %add.ptr, i64 %2
  %6 = load i32, ptr %add.ptr.sroa_idx, align 4
  ret i32 %6
}

define i64 @"25"(ptr %arrayidx.i59, ptr %agg.result, ptr %end_size_.i, ptr %degrees, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i59, align 8, !tbaa !10
  %2 = load ptr, ptr %agg.result, align 8, !tbaa !43
  %3 = load ptr, ptr %degrees, align 8, !tbaa !8
  %sub.ptr.rhs.cast.i62 = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast.i61 = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i63 = sub i64 %sub.ptr.lhs.cast.i61, %sub.ptr.rhs.cast.i62
  %sub.ptr.div.i64 = ashr exact i64 %sub.ptr.sub.i63, %0
  %arrayidx.i65 = getelementptr inbounds i64, ptr %2, i64 %sub.ptr.div.i64
  store i64 %1, ptr %arrayidx.i65, align 8, !tbaa !10
  ret i64 %1
}

define i32 @"26"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %init_val, align 4, !tbaa !12
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %5 = load ptr, ptr %this, align 8, !tbaa !8
  %add.ptr.prol = getelementptr inbounds i32, ptr %5, i64 %ind.end
  store i32 %2, ptr %add.ptr.prol, align 4, !tbaa !12
  ret i32 %2
}

define i32 @"27"(ptr %neighs, ptr %arrayidx.i523) {
bb:
  %0 = load ptr, ptr %neighs, align 8, !tbaa !6
  %1 = load i64, ptr %arrayidx.i523, align 8, !tbaa !10
  %add.ptr = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %add.ptr, align 4, !tbaa !12
  ret i32 %2
}

define <4 x i32> @"28"(<4 x i32> %0, ptr %init_val, i64 %1, ptr %this, ptr %.omp.lb, i64 %index, i64 %2) {
bb:
  %3 = load i32, ptr %init_val, align 4, !tbaa !12, !alias.scope !46
  %broadcast.splatinsert21 = insertelement <4 x i32> %0, i32 %3, i64 %1
  %broadcast.splat22 = shufflevector <4 x i32> %broadcast.splatinsert21, <4 x i32> %0, <4 x i32> zeroinitializer
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %offset.idx = add i64 %4, %index
  %5 = load ptr, ptr %this, align 8, !tbaa !8
  %6 = getelementptr inbounds i32, ptr %5, i64 %offset.idx
  %7 = getelementptr inbounds i32, ptr %6, i64 %2
  store <4 x i32> %broadcast.splat22, ptr %7, align 4, !tbaa !12, !alias.scope !49, !noalias !46
  ret <4 x i32> %broadcast.splat22
}

define <2 x i64> @"30"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %rng, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
bb:
  %wide.load91 = load <2 x i64>, ptr %0, align 8, !tbaa !10
  %10 = load i64, ptr %rng, align 8, !tbaa !10
  %vector.recur.init89 = insertelement <2 x i64> %2, i64 %10, i64 %3
  %11 = shufflevector <2 x i64> %vector.recur.init89, <2 x i64> %wide.load91, <2 x i32> <i32 1, i32 2>
  %12 = and <2 x i64> %11, %4
  %13 = and <2 x i64> %wide.load91, %1
  %14 = or <2 x i64> %13, %12
  %15 = lshr exact <2 x i64> %14, %5
  %wide.load92 = load <2 x i64>, ptr %6, align 8, !tbaa !10
  %16 = xor <2 x i64> %15, %wide.load92
  %17 = and <2 x i64> %wide.load91, %5
  %18 = icmp eq <2 x i64> %17, %7
  %19 = select <2 x i1> %18, <2 x i64> %7, <2 x i64> %8
  %20 = xor <2 x i64> %16, %19
  store <2 x i64> %20, ptr %9, align 8, !tbaa !10
  ret <2 x i64> %20
}

define i32 @"31"(ptr %degrees, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %mul12 = shl i64 %1, %0
  %2 = load ptr, ptr %degrees, align 8, !tbaa !8
  %arrayidx.i32 = getelementptr inbounds i32, ptr %2, i64 %mul12
  %3 = load i32, ptr %arrayidx.i32, align 4, !tbaa !12
  ret i32 %3
}

define i32 @"32"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !12
  %3 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !12
  %cmp.i.i.i.i.i = icmp slt i32 %3, %2
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %__parent.020.in.i.i.i.i.i = add nsw i64 %sub12.i.i.i.i, %1
  %__parent.020.i.i45.i.i.i = lshr i64 %__parent.020.in.i.i.i.i.i, %0
  %add.ptr.i.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %__parent.020.i.i45.i.i.i
  %4 = load i32, ptr %add.ptr.i.i.i.i.i, align 4, !tbaa !12
  ret i32 %4
}

define float @"33"(ptr %0, ptr %1, ptr %2) {
bb:
  %3 = load float, ptr %0, align 4, !tbaa !22
  %4 = load float, ptr %1, align 4, !tbaa !22
  %cmp = fcmp ogt float %3, %4
  %. = select i1 %cmp, float %3, float %4
  %5 = load ptr, ptr %2, align 8
  store float %., ptr %0, align 4, !tbaa !22
  ret float %.
}

define i64 @"34"(ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %__i.018.i, ptr %arrayidx7.i) {
bb:
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %add10 = add i64 %5, %0
  %rem.i.i.i = and i64 %add10, %1
  %shr.i = lshr i64 %rem.i.i.i, %2
  %xor.i = xor i64 %shr.i, %3
  %mul.i = mul nuw nsw i64 %xor.i, %4
  %add.i = add nuw i64 %mul.i, %__i.018.i
  %rem.i.i17.i = and i64 %add.i, %1
  store i64 %rem.i.i17.i, ptr %arrayidx7.i, align 8, !tbaa !10
  ret i64 %rem.i.i17.i
}

define ptr @"35"(ptr %new_range.i.i, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %0) {
bb:
  %1 = load ptr, ptr %new_range.i.i, align 8, !tbaa !6
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !16
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !16
  ret ptr %add.ptr.i
}

define i32 @"36"(ptr %depths, ptr %__begin3.0814) {
bb:
  %0 = load ptr, ptr %depths, align 8, !tbaa !8
  %1 = load i32, ptr %__begin3.0814, align 4, !tbaa !12
  %conv34 = sext i32 %1 to i64
  %arrayidx.i398 = getelementptr inbounds i32, ptr %0, i64 %conv34
  %2 = load i32, ptr %arrayidx.i398, align 4, !tbaa !12
  ret i32 %2
}

define float @"37"(ptr %arrayidx.i.prol, ptr %call5.i.i.i.i4.i.i79, ptr %num_nodes_.i, i64 %0, i64 %1, i32 %2) {
bb:
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !34
  %n.mod.vf = and i64 %3, %1
  %4 = and i64 %3, %0
  %n.vec = sub nsw i64 %4, %n.mod.vf
  %second3.i.prol = getelementptr inbounds %"struct.std::pair", ptr %call5.i.i.i.i4.i.i79, i64 %n.vec, i32 1
  %5 = load float, ptr %arrayidx.i.prol, align 4, !tbaa !22
  store float %5, ptr %second3.i.prol, align 4, !tbaa !51
  ret float %5
}

define i64 @"38"(i64 %0, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %this, align 8, !tbaa !6
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %1
  %_M_string_length.i24.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i, i32 1
  store i64 %0, ptr %_M_string_length.i24.i.i.i, align 8, !tbaa !53
  ret i64 %0
}

define ptr @"39"(ptr %new_range.i.i457, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_capacity_.i.i.i) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !18
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !6
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !24
  ret ptr %add.ptr6.i.i478
}

define <4 x i32> @"40"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.1659, ptr %arrayidx.i541, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !10
  %3 = add i64 %2, %0
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !12
  %.pre731 = sext i32 %.pre717 to i64
  %sub222 = sub nsw i64 %total_missing_inv.1659, %.pre731
  %4 = sub nsw i64 %3, %sub222
  %5 = getelementptr inbounds i32, ptr %call171, i64 %4
  %6 = getelementptr inbounds i32, ptr %5, i64 %1
  %wide.load803 = load <4 x i32>, ptr %6, align 4, !tbaa !12
  ret <4 x i32> %wide.load803
}

define float @"41"(ptr %arrayidx.i.1, ptr %call5.i.i.i.i4.i.i79, ptr %num_nodes_.i, i64 %0, i64 %1, i64 %2, i32 %3) {
bb:
  %4 = load i64, ptr %num_nodes_.i, align 8, !tbaa !34
  %n.mod.vf = and i64 %4, %1
  %5 = and i64 %4, %0
  %n.vec = sub nsw i64 %5, %n.mod.vf
  %indvars.iv.next = add nuw nsw i64 %n.vec, %2
  %second3.i.1 = getelementptr inbounds %"struct.std::pair", ptr %call5.i.i.i.i4.i.i79, i64 %indvars.iv.next, i32 1
  %6 = load float, ptr %arrayidx.i.1, align 4, !tbaa !22
  store float %6, ptr %second3.i.1, align 4, !tbaa !51
  ret float %6
}

define i32 @"42"(ptr %n_start.0.in, i64 %0) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !6
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %1 = load i32, ptr %incdec.ptr12.i.i.i.i, align 4, !tbaa !12
  ret i32 %1
}

define ptr @"43"(ptr %new_range.i.i457, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1, ptr %el) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !18
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !16
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !6
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !16
  ret ptr %add.ptr.i464
}

define ptr @"44"(ptr %verts_at_depth.sroa.0.1.lcssa, ptr %cond.i65.i, ptr %arrayidx.i451, i32 %0, i64 %sub.ptr.rhs.cast.i508, i64 %1, i32 %2) {
bb:
  %3 = load i32, ptr %arrayidx.i451, align 4, !tbaa !12
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
  %5 = load ptr, ptr %add.ptr.i523, align 8, !tbaa !6
  ret ptr %5
}

define i64 @"45"(ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57.2) {
bb:
  %0 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !10
  %1 = load i64, ptr %arrayidx.i58, align 8, !tbaa !10
  %add7 = add nsw i64 %1, %total.076
  %add7.1 = add nsw i64 %0, %add7
  store i64 %add7.1, ptr %arrayidx.i57.2, align 8, !tbaa !10
  ret i64 %add7.1
}

define i64 @"46"(ptr %arrayidx.i535, i64 %total_missing_inv.0649, ptr %arrayidx.i536, ptr %offsets, i64 %indvars.iv691) {
bb:
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !43
  %arrayidx.i5352 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %indvars.iv691
  %0 = load i32, ptr %arrayidx.i536, align 4, !tbaa !12
  %conv155 = sext i32 %0 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %1 = load i64, ptr %arrayidx.i535, align 8, !tbaa !10
  %add152 = add nsw i64 %1, %add156
  store i64 %add152, ptr %arrayidx.i535, align 8, !tbaa !10
  ret i64 %add152
}

define i64 @"47"(ptr %arrayidx23.i, i64 %0, ptr %1, i64 %2, i64 %3, ptr %arrayidx28.i, i64 %4, i64 %5, ptr %arrayidx19.i) {
bb:
  %wide.load28 = load <2 x i64>, ptr %1, align 8, !tbaa !10
  %vector.recur.extract31 = extractelement <2 x i64> %wide.load28, i64 %2
  %and20.i = and i64 %vector.recur.extract31, %3
  %6 = load i64, ptr %arrayidx23.i, align 8, !tbaa !10
  %and24.i = and i64 %6, %0
  %or25.i = or i64 %and24.i, %and20.i
  %shr29.i = lshr exact i64 %or25.i, %2
  %7 = load i64, ptr %arrayidx28.i, align 8, !tbaa !10
  %xor30.i = xor i64 %shr29.i, %7
  %and31.i = and i64 %6, %2
  %tobool32.not.i = icmp eq i64 %and31.i, %4
  %cond33.i = select i1 %tobool32.not.i, i64 %4, i64 %5
  %xor34.i = xor i64 %xor30.i, %cond33.i
  store i64 %xor34.i, ptr %arrayidx19.i, align 8, !tbaa !10
  ret i64 %xor34.i
}

define i32 @"48"(ptr %add.ptr.i.i, ptr %__first, ptr %add.ptr.i, ptr %add.ptr2.i, i64 %sub1.i, i64 %mul.i) {
bb:
  %0 = load i32, ptr %add.ptr.i.i, align 4, !tbaa !12
  %1 = load i32, ptr %add.ptr2.i, align 4, !tbaa !12
  %2 = load i32, ptr %add.ptr.i, align 4, !tbaa !12
  %cmp.i.i = icmp slt i32 %2, %1
  %spec.select.i = select i1 %cmp.i.i, i64 %sub1.i, i64 %mul.i
  %add.ptr2.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i
  store i32 %0, ptr %add.ptr2.i.i, align 4, !tbaa !12
  ret i32 %0
}

define ptr @"49"(ptr %new_range.i.i, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !18
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %3 = load ptr, ptr %new_range.i.i, align 8, !tbaa !6
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !16
  ret ptr %add.ptr.i464
}

define i32 @"50"(ptr %__first, ptr %add.ptr.i, ptr %add.ptr2.i, i64 %sub1.i, i64 %mul.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr2.i, align 4, !tbaa !12
  %3 = load i32, ptr %add.ptr.i, align 4, !tbaa !12
  %cmp.i.i = icmp slt i32 %3, %2
  %spec.select.i = select i1 %cmp.i.i, i64 %sub1.i, i64 %mul.i
  %__parent.020.in.i.i = add nsw i64 %spec.select.i, %0
  %__parent.020.i.i = sdiv i64 %__parent.020.in.i.i, %1
  %add.ptr.i.i = getelementptr inbounds i32, ptr %__first, i64 %__parent.020.i.i
  %4 = load i32, ptr %add.ptr.i.i, align 4, !tbaa !12
  ret i32 %4
}

define i32 @"51"(ptr %end_size_.i.i583, i64 %sub.ptr.rhs.cast.i.i585, i64 %0, ptr %length.i581) {
bb:
  %1 = load ptr, ptr %end_size_.i.i583, align 8, !tbaa !54
  %sub.ptr.lhs.cast.i.i584 = ptrtoint ptr %1 to i64
  %sub.ptr.sub.i.i586 = sub i64 %sub.ptr.lhs.cast.i.i584, %sub.ptr.rhs.cast.i.i585
  %2 = lshr exact i64 %sub.ptr.sub.i.i586, %0
  %conv.i587 = trunc i64 %2 to i32
  store i32 %conv.i587, ptr %length.i581, align 4, !tbaa !12
  ret i32 %conv.i587
}

define float @"52"(ptr %arrayidx.i.1, ptr %biggest_score, ptr %scores, i32 %cond, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %4 = sub i32 %cond, %3
  %5 = zext i32 %4 to i64
  %6 = add nuw nsw i64 %5, %0
  %n.vec = and i64 %6, %1
  %ind.end = add nsw i64 %n.vec, %2
  %indvars.iv.next = add nsw i64 %ind.end, %0
  %7 = load ptr, ptr %scores, align 8, !tbaa !20
  %arrayidx.i.12 = getelementptr inbounds float, ptr %7, i64 %indvars.iv.next
  %8 = load float, ptr %biggest_score, align 4, !tbaa !22
  %9 = load float, ptr %arrayidx.i.1, align 4, !tbaa !22
  %div9.1 = fdiv float %9, %8
  store float %div9.1, ptr %arrayidx.i.1, align 4, !tbaa !22
  ret float %div9.1
}

define i32 @"53"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr122.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %1 = load i32, ptr %incdec.ptr122.i.i, align 4, !tbaa !55
  ret i32 %1
}

define ptr @"55"(ptr %verts_at_depth.sroa.0.1825, ptr %arrayidx.i451, i32 %0) {
bb:
  %1 = load i32, ptr %arrayidx.i451, align 4, !tbaa !12
  %add91 = add nuw nsw i32 %1, %0
  %conv92 = sext i32 %add91 to i64
  %add.ptr.i462 = getelementptr inbounds %"class.std::vector.26", ptr %verts_at_depth.sroa.0.1825, i64 %conv92
  %2 = load ptr, ptr %add.ptr.i462, align 8, !tbaa !57
  ret ptr %2
}

define i8 @"56"(ptr %arrayidx.i17.i, ptr %ref.tmp, i64 %conv5.i, i64 %idxprom1.i.i) {
bb:
  %0 = load i8, ptr %arrayidx.i17.i, align 1, !tbaa !59, !noalias !60
  %1 = load ptr, ptr %ref.tmp, align 8, !tbaa !25, !alias.scope !60
  %arrayidx.i.i = getelementptr inbounds i8, ptr %1, i64 %conv5.i
  %arrayidx2.i.i = getelementptr inbounds i8, ptr %arrayidx.i.i, i64 %idxprom1.i.i
  store i8 %0, ptr %arrayidx2.i.i, align 1, !tbaa !59
  ret i8 %0
}

define i64 @"57"(ptr %_M_p.i, i64 %0, ptr %udist_, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %udist_, align 8, !tbaa !63
  %_M_p.i2 = getelementptr inbounds %"class.std::mersenne_twister_engine", ptr %3, i64 %1, i32 1
  %.pre = load i64, ptr %_M_p.i, align 8, !tbaa !65
  %inc.i = add nuw nsw i64 %.pre, %0
  store i64 %inc.i, ptr %_M_p.i, align 8, !tbaa !65
  ret i64 %inc.i
}

define i64 @"58"(ptr %new_range.i.i, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %new_range.i.i, align 8, !tbaa !6
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr13.i.i.i.i, i64 %1
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.030.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define float @"59"(ptr %arrayidx.i, ptr %biggest_score, ptr %scores, i32 %cond, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %scores, align 8, !tbaa !20
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %5 = sub i32 %cond, %4
  %6 = zext i32 %5 to i64
  %7 = add nuw nsw i64 %6, %0
  %n.vec = and i64 %7, %1
  %ind.end = add nsw i64 %n.vec, %2
  %arrayidx.i2 = getelementptr inbounds float, ptr %3, i64 %ind.end
  %8 = load float, ptr %biggest_score, align 4, !tbaa !22
  %9 = load float, ptr %arrayidx.i, align 4, !tbaa !22
  %div9 = fdiv float %9, %8
  store float %div9, ptr %arrayidx.i, align 4, !tbaa !22
  ret float %div9
}

define ptr @"60"(ptr %el, i64 %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !16
  ret ptr %add.ptr.i
}

define i64 @"61"(ptr %new_range.i.i, i64 %0) {
bb:
  %1 = load ptr, ptr %new_range.i.i, align 8, !tbaa !6
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %0
  %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !19
  ret i64 %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i
}

define i32 @"62"(ptr %arrayidx212, ptr %call171, i64 %tail_index.0660, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %0) {
bb:
  %1 = load i32, ptr %arrayidx212, align 4, !tbaa !12
  %2 = load i64, ptr %arrayidx.i540, align 8, !tbaa !10
  %3 = load i32, ptr %arrayidx.i541, align 4, !tbaa !12
  %conv198 = sext i32 %3 to i64
  %add199 = add nsw i64 %2, %conv198
  %4 = load i64, ptr %arrayidx.i542, align 8, !tbaa !10
  %5 = sub i64 %4, %add199
  %n.vec793 = and i64 %5, %0
  %ind.end796 = sub i64 %tail_index.0660, %n.vec793
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !12
  %.pre731 = sext i32 %.pre717 to i64
  %sub226 = sub nsw i64 %ind.end796, %.pre731
  %arrayidx213 = getelementptr inbounds i32, ptr %call171, i64 %sub226
  store i32 %1, ptr %arrayidx213, align 4, !tbaa !12
  ret i32 %1
}

define float @"63"(ptr %arrayidx.i.prol, ptr %biggest_score, ptr %scores, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %scores, align 8, !tbaa !20
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %2 = sext i32 %1 to i64
  %arrayidx.i.prol2 = getelementptr inbounds float, ptr %0, i64 %2
  %3 = load float, ptr %arrayidx.i.prol, align 4, !tbaa !22
  %4 = load float, ptr %biggest_score, align 4, !tbaa !22
  %div9.prol = fdiv float %3, %4
  store float %div9.prol, ptr %arrayidx.i.prol, align 4, !tbaa !22
  ret float %div9.prol
}

define i32 @"64"(ptr %_M_finish.i.i, ptr %depth_index, i64 %0, i32 %1, ptr %d) {
bb:
  %2 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !67
  %sub.ptr.lhs.cast.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %depth_index, align 8, !tbaa !69
  %sub.ptr.rhs.cast.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %4 = lshr exact i64 %sub.ptr.sub.i, %0
  %5 = trunc i64 %4 to i32
  %conv69 = add i32 %5, %1
  store i32 %conv69, ptr %d, align 4, !tbaa !12
  ret i32 %conv69
}

define i8 @"65"(ptr %label) {
bb:
  %0 = load ptr, ptr %label, align 8, !tbaa !25, !noalias !70
  %1 = load i8, ptr %0, align 1, !tbaa !59
  ret i8 %1
}

define i64 @"66"(ptr %arrayidx23.i.i, i64 %0, ptr %1, i64 %2, i64 %3, ptr %arrayidx28.i.i, i64 %4, i64 %5, ptr %udist_, i64 %6) {
bb:
  %7 = load i64, ptr %arrayidx23.i.i, align 8, !tbaa !10
  %and24.i.i = and i64 %7, %0
  %wide.load = load <2 x i64>, ptr %1, align 8, !tbaa !10
  %vector.recur.extract = extractelement <2 x i64> %wide.load, i64 %2
  %and20.i.i = and i64 %vector.recur.extract, %3
  %or25.i.i = or i64 %and24.i.i, %and20.i.i
  %shr29.i.i = lshr exact i64 %or25.i.i, %2
  %8 = load i64, ptr %arrayidx28.i.i, align 8, !tbaa !10
  %xor30.i.i = xor i64 %shr29.i.i, %8
  %and31.i.i = and i64 %7, %2
  %tobool32.not.i.i = icmp eq i64 %and31.i.i, %4
  %cond33.i.i = select i1 %tobool32.not.i.i, i64 %4, i64 %5
  %xor34.i.i = xor i64 %xor30.i.i, %cond33.i.i
  %9 = load ptr, ptr %udist_, align 8, !tbaa !63
  %arrayidx19.i.i = getelementptr inbounds [312 x i64], ptr %9, i64 %4, i64 310
  store i64 %xor34.i.i, ptr %arrayidx19.i.i, align 8, !tbaa !10
  ret i64 %xor34.i.i
}

define i32 @"67"(ptr %call171, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %0, i64 %1, i64 %total_missing_inv.0649, ptr %arrayidx.i536) {
bb:
  %2 = load i64, ptr %arrayidx.i540, align 8, !tbaa !10
  %3 = load i32, ptr %arrayidx.i541, align 4, !tbaa !12
  %conv198 = sext i32 %3 to i64
  %add199 = add nsw i64 %2, %conv198
  %4 = load i64, ptr %arrayidx.i542, align 8, !tbaa !10
  %5 = sub i64 %4, %add199
  %n.vec793 = and i64 %5, %0
  %ind.end794 = sub i64 %4, %n.vec793
  %i200.0 = add nsw i64 %ind.end794, %1
  %6 = load i32, ptr %arrayidx.i536, align 4, !tbaa !12
  %conv155 = sext i32 %6 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %sub211 = sub nsw i64 %i200.0, %add156
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %7 = load i32, ptr %arrayidx212, align 4, !tbaa !12
  ret i32 %7
}

define ptr @"68"(ptr %new_range.i.i, ptr %end_size_.i, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !16
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %1 = load ptr, ptr %new_range.i.i, align 8, !tbaa !6
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !24
  ret ptr %add.ptr6.i.i
}

define i32 @"69"(ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %v.i.i.i.i.i, align 4
  %3 = load i32, ptr %v3.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %2, %3
  %4 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !55
  %5 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !55
  %cmp.i.i.i.i.i = icmp eq i32 %5, %4
  %cmp7.i.i.i.i.i = icmp slt i32 %5, %4
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %__parent.020.in.i.i.i.i = add nsw i64 %spec.select.i.i.i, %0
  %__parent.020.i.i.i.i = sdiv i64 %__parent.020.in.i.i.i.i, %1
  %add.ptr.i.i.i.i16 = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %__parent.020.i.i.i.i
  %6 = load i32, ptr %add.ptr.i.i.i.i16, align 4, !tbaa !55
  ret i32 %6
}

define i64 @"70"(ptr %arrayidx.i, ptr %prefix, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %prefix, align 8
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %mul14 = shl i64 %2, %0
  %arrayidx.i35 = getelementptr inbounds i64, ptr %1, i64 %mul14
  %3 = load i64, ptr %arrayidx.i, align 8, !tbaa !10
  store i64 %3, ptr %arrayidx.i35, align 8, !tbaa !10
  ret i64 %3
}

define i64 @"71"(ptr %this, i64 %0, ptr %arrayidx42.i, i64 %1, i64 %2, ptr %arrayidx49.i, i64 %3, i64 %4) {
bb:
  %5 = load i64, ptr %arrayidx42.i, align 8, !tbaa !10
  %and43.i = and i64 %5, %1
  %6 = load i64, ptr %this, align 8, !tbaa !10
  %and46.i = and i64 %6, %0
  %or47.i = or i64 %and46.i, %and43.i
  %shr50.i = lshr exact i64 %or47.i, %2
  %7 = load i64, ptr %arrayidx49.i, align 8, !tbaa !10
  %xor51.i = xor i64 %shr50.i, %7
  %and52.i = and i64 %6, %2
  %tobool53.not.i = icmp eq i64 %and52.i, %3
  %cond54.i = select i1 %tobool53.not.i, i64 %3, i64 %4
  %xor55.i = xor i64 %xor51.i, %cond54.i
  store i64 %xor55.i, ptr %arrayidx42.i, align 8, !tbaa !10
  ret i64 %xor55.i
}

define i64 @"72"(ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57.3) {
bb:
  %0 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !10
  %1 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !10
  %2 = load i64, ptr %arrayidx.i58, align 8, !tbaa !10
  %add7 = add nsw i64 %2, %total.076
  %add7.1 = add nsw i64 %1, %add7
  %add7.2 = add nsw i64 %0, %add7.1
  store i64 %add7.2, ptr %arrayidx.i57.3, align 8, !tbaa !10
  ret i64 %add7.2
}

define ptr @"73"(ptr %new_range.i.i, ptr %el, i64 %0, ptr %end_size_.i, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !16
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %2 = load ptr, ptr %new_range.i.i, align 8, !tbaa !6
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !24
  ret ptr %add.ptr6.i.i
}

define ptr @"74"(ptr %call.i, ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, i64 %2, ptr %end_size_.i40) {
bb:
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %degrees, align 8, !tbaa !8
  %sub.ptr.rhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %sub = add nsw i64 %sub.ptr.div.i, %1
  %div38 = lshr i64 %sub, %2
  %add.ptr.i = getelementptr inbounds i64, ptr %call.i, i64 %div38
  store ptr %add.ptr.i, ptr %end_size_.i40, align 8, !tbaa !54
  ret ptr %add.ptr.i
}

define i64 @"75"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !73
  %inc.i71 = add nuw nsw i64 %1, %0
  %inc.i207 = add nuw nsw i64 %inc.i71, %0
  %inc.i139 = add nuw nsw i64 %inc.i207, %0
  store i64 %inc.i139, ptr %_M_p.i.i.i, align 8, !tbaa !73
  ret i64 %inc.i139
}

define i64 @"76"(ptr %add.ptr.i.i.i.i16, ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i64, ptr %add.ptr.i.i.i.i16, align 4
  %1 = load i32, ptr %v.i.i.i.i.i, align 4
  %2 = load i32, ptr %v3.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %1, %2
  %3 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !55
  %4 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !55
  %cmp.i.i.i.i.i = icmp eq i32 %4, %3
  %cmp7.i.i.i.i.i = icmp slt i32 %4, %3
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr2.i.i.i.i23 = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  store i64 %0, ptr %add.ptr2.i.i.i.i23, align 4
  ret i64 %0
}

define double @"77"(ptr %add.ptr.i441, ptr %add.ptr.i442, ptr %path_counts.sroa.0.1741879, ptr %__begin3.0814) {
bb:
  %0 = load i32, ptr %__begin3.0814, align 4, !tbaa !12
  %conv34 = sext i32 %0 to i64
  %add.ptr.i4422 = getelementptr inbounds double, ptr %path_counts.sroa.0.1741879, i64 %conv34
  %1 = load double, ptr %add.ptr.i442, align 8, !tbaa !75
  %2 = load double, ptr %add.ptr.i441, align 8, !tbaa !75
  %add54 = fadd double %2, %1
  store double %add54, ptr %add.ptr.i442, align 8, !tbaa !75
  ret double %add54
}

define i32 @"78"(ptr %depths, ptr %__begin3.0814) {
bb:
  %0 = load ptr, ptr %depths, align 8, !tbaa !8
  %1 = load i32, ptr %__begin3.0814, align 4, !tbaa !12
  %conv34 = sext i32 %1 to i64
  %arrayidx.i398 = getelementptr inbounds i32, ptr %0, i64 %conv34
  %2 = load i32, ptr %arrayidx.i398, align 4, !tbaa !12
  ret i32 %2
}

define ptr @"79"(ptr %call.i139141, ptr %num_edges_.i, ptr %g, i8 %0, i64 %1, i64 %2, ptr %end_.i) {
bb:
  %3 = load i8, ptr %g, align 8, !tbaa !77, !range !4, !noundef !5
  %tobool.not.i = icmp eq i8 %3, %0
  %mul.i = zext i1 %tobool.not.i to i64
  %4 = load i64, ptr %num_edges_.i, align 8
  %cond.i = shl nsw i64 %4, %mul.i
  %sub.i = add i64 %cond.i, %1
  %div4.i = lshr i64 %sub.i, %2
  %add.ptr.i140 = getelementptr inbounds i64, ptr %call.i139141, i64 %div4.i
  store ptr %add.ptr.i140, ptr %end_.i, align 8, !tbaa !78
  ret ptr %add.ptr.i140
}

define ptr @"80"(ptr %_M_finish.i468, i64 %0, ptr %verts_at_depth.sroa.0.5, ptr %arrayidx.i466, i64 %1, i32 %2) {
bb:
  %3 = load i32, ptr %arrayidx.i466, align 4, !tbaa !12
  %conv98 = sext i32 %3 to i64
  %add.ptr.i467 = getelementptr inbounds %"class.std::vector.26", ptr %verts_at_depth.sroa.0.5, i64 %conv98
  %_M_finish.i4682 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i467, i64 %1, i32 1
  %4 = load ptr, ptr %_M_finish.i468, align 8, !tbaa !6
  %incdec.ptr.i472 = getelementptr inbounds i32, ptr %4, i64 %0
  store ptr %incdec.ptr.i472, ptr %_M_finish.i468, align 8, !tbaa !80
  ret ptr %incdec.ptr.i472
}

define i64 @"81"(ptr %shared_in.i, ptr %shared_out_end.i) {
bb:
  %.pre.pre = load i64, ptr %shared_in.i, align 8, !tbaa !81
  store i64 %.pre.pre, ptr %shared_out_end.i, align 8, !tbaa !82
  ret i64 %.pre.pre
}

define i64 @"82"(ptr %arrayidx.i58.epil, i64 %total.076.epil, ptr %call.i4145, ptr %num_blocks) {
bb:
  %0 = load i64, ptr %num_blocks, align 8, !tbaa !10
  %arrayidx.i = getelementptr inbounds i64, ptr %call.i4145, i64 %0
  %1 = load i64, ptr %arrayidx.i58.epil, align 8, !tbaa !10
  %add7.epil = add nsw i64 %1, %total.076.epil
  store i64 %add7.epil, ptr %arrayidx.i, align 8, !tbaa !10
  ret i64 %add7.epil
}

define i64 @"83"(ptr %succ, ptr %arrayidx.i7.i.i, ptr %g_out_start, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %succ, align 8, !tbaa !83, !llvm.access.group !31
  %3 = load ptr, ptr %g_out_start, align 8, !tbaa !6, !llvm.access.group !31
  %sub.ptr.rhs.cast42 = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %arrayidx.i7.i.i, align 8, !tbaa !6, !llvm.access.group !31
  %sub.ptr.lhs.cast41 = ptrtoint ptr %4 to i64
  %sub.ptr.sub43 = sub i64 %sub.ptr.lhs.cast41, %sub.ptr.rhs.cast42
  %sub.ptr.div44 = ashr exact i64 %sub.ptr.sub43, %0
  %div1.i.i = lshr i64 %sub.ptr.div44, %1
  %arrayidx.i103 = getelementptr inbounds i64, ptr %2, i64 %div1.i.i
  %5 = load i64, ptr %arrayidx.i103, align 8, !tbaa !10, !llvm.access.group !31
  ret i64 %5
}

define i64 @"84"(ptr %_M_string_length.i.i.i, i64 %call, ptr %__dnew.i.i.i) {
bb:
  %0 = load i64, ptr %_M_string_length.i.i.i, align 8, !tbaa !53, !noalias !84
  %sub.i.i.i = sub i64 %0, %call
  store i64 %sub.i.i.i, ptr %__dnew.i.i.i, align 8, !tbaa !10, !noalias !84
  ret i64 %sub.i.i.i
}

define i64 @"85"(ptr %arrayidx.i25, i64 %0, ptr %arrayidx.i23, ptr %el, ptr %.omp.lb) {
bb:
  %1 = load i32, ptr %arrayidx.i23, align 4, !tbaa !12
  %ref.tmp.sroa.0.0.insert.ext = zext i32 %1 to i64
  %2 = load i32, ptr %arrayidx.i25, align 4, !tbaa !12
  %ref.tmp.sroa.4.0.insert.ext = zext i32 %2 to i64
  %ref.tmp.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp.sroa.4.0.insert.ext, %0
  %ref.tmp.sroa.0.0.insert.insert = or i64 %ref.tmp.sroa.4.0.insert.shift, %ref.tmp.sroa.0.0.insert.ext
  %3 = load ptr, ptr %el, align 8, !tbaa !18
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %4
  store i64 %ref.tmp.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp.sroa.0.0.insert.insert
}

define i32 @"86"(ptr %call171, ptr %arrayidx.i547, ptr %arrayidx.i546) {
bb:
  %0 = load i32, ptr %arrayidx.i546, align 4, !tbaa !12
  %conv246 = sext i32 %0 to i64
  %1 = load i64, ptr %arrayidx.i547, align 8, !tbaa !10
  %add247 = add nsw i64 %1, %conv246
  %arrayidx257 = getelementptr inbounds i32, ptr %call171, i64 %add247
  %2 = load i32, ptr %arrayidx257, align 4, !tbaa !12
  ret i32 %2
}

define ptr @"87"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, ptr %.omp.lb, i64 %1) {
bb:
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %3 = sext i32 %2 to i64
  %4 = add nsw i64 %3, %1
  %5 = load i8, ptr %transpose, align 1, !tbaa !0, !range !4, !noundef !5
  %tobool.not = icmp eq i8 %5, %0
  %6 = load ptr, ptr %in_index_.i, align 8
  %7 = load ptr, ptr %out_index_.i, align 8
  %.sink = select i1 %tobool.not, ptr %7, ptr %6
  %arrayidx.i.i.i60 = getelementptr inbounds ptr, ptr %.sink, i64 %4
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !6
  ret ptr %n_end.0
}

define i32 @"88"(ptr %n_start.0.in, i64 %0, i64 %1, ptr %diffs, ptr %.omp.lb) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !6
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr12.i.i.i.i to i64
  %.pre134 = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %.pre134
  %2 = lshr exact i64 %sub.ptr.sub, %1
  %conv22 = trunc i64 %2 to i32
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %4 = sext i32 %3 to i64
  %5 = load ptr, ptr %diffs, align 8, !tbaa !8
  %arrayidx.i99 = getelementptr inbounds i32, ptr %5, i64 %4
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !12
  ret i32 %conv22
}

define float @"89"(ptr %scores, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %scores, align 8, !tbaa !20
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %2 = sext i32 %1 to i64
  %arrayidx.i = getelementptr inbounds float, ptr %0, i64 %2
  %3 = load float, ptr %arrayidx.i, align 4
  ret float %3
}

define float @"90"(float %0, ptr %arrayidx.i, ptr %biggest_score4) {
bb:
  %1 = load float, ptr %arrayidx.i, align 4
  %cmp.i = fcmp olt float %0, %1
  %2 = select i1 %cmp.i, float %1, float %0
  store float %2, ptr %biggest_score4, align 4, !tbaa !22
  ret float %2
}

define i32 @"91"(ptr %depths, ptr %__begin3.0814) {
bb:
  %.pre = load ptr, ptr %depths, align 8, !tbaa !8
  %0 = load i32, ptr %__begin3.0814, align 4, !tbaa !12
  %conv34 = sext i32 %0 to i64
  %arrayidx.i439 = getelementptr inbounds i32, ptr %.pre, i64 %conv34
  %1 = load i32, ptr %arrayidx.i439, align 4, !tbaa !12
  ret i32 %1
}

define <2 x i64> @"92"(ptr %0, ptr %offsets, ptr %num_nodes_.i, i64 %1, i64 %index770, i64 %2) {
bb:
  %3 = load ptr, ptr %offsets, align 8
  %4 = load i64, ptr %num_nodes_.i, align 8, !tbaa !87
  %5 = and i64 %4, %1
  %offset.idx = sub i64 %5, %index770
  %6 = getelementptr inbounds i64, ptr %3, i64 %offset.idx
  %7 = getelementptr inbounds i64, ptr %6, i64 %2
  %wide.load = load <2 x i64>, ptr %0, align 8, !tbaa !10
  store <2 x i64> %wide.load, ptr %7, align 8, !tbaa !10
  ret <2 x i64> %wide.load
}

define i64 @"93"(ptr %offsets, ptr %num_nodes_.i) {
bb:
  %0 = load i64, ptr %num_nodes_.i, align 8, !tbaa !87
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !43
  %arrayidx.i533 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %0
  %1 = load i64, ptr %arrayidx.i533, align 8, !tbaa !10
  ret i64 %1
}

define ptr @"94"(ptr %neighs, ptr %arrayidx.i.1, ptr %index, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %2 = sext i32 %1 to i64
  %indvars.iv.next = add nsw i64 %2, %0
  %3 = load ptr, ptr %index, align 8, !tbaa !6
  %arrayidx.1 = getelementptr inbounds ptr, ptr %3, i64 %indvars.iv.next
  %4 = load ptr, ptr %neighs, align 8, !tbaa !6
  %5 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !10
  %add.ptr.1 = getelementptr inbounds i32, ptr %4, i64 %5
  store ptr %add.ptr.1, ptr %arrayidx.1, align 8, !tbaa !6
  ret ptr %add.ptr.1
}

define i32 @"95"(ptr %arrayidx.i7.i.i) {
bb:
  %0 = load ptr, ptr %arrayidx.i7.i.i, align 8, !tbaa !6, !llvm.access.group !31
  %1 = load i32, ptr %0, align 4, !tbaa !12, !llvm.access.group !31
  ret i32 %1
}

define ptr @"96"(ptr %cond.i31.i.i.i, ptr %_M_finish.i38, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4) {
bb:
  %5 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !89
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
  store ptr %incdec.ptr.i.i.i, ptr %_M_finish.i38, align 8, !tbaa !89
  ret ptr %incdec.ptr.i.i.i
}

define i64 @"97"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %end_size_.i.i) {
bb:
  %2 = load i32, ptr %v, align 4, !tbaa !14
  %sub = add nsw i32 %2, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  %.pre.pre.i = load ptr, ptr %end_size_.i.i, align 8, !tbaa !16
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %.pre.pre.i, align 4, !tbaa.struct !19
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define ptr @"98"(ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %0) {
bb:
  %1 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %agg.result, align 8, !tbaa !18
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = ashr exact i64 %sub.ptr.sub.i12.i.i, %0
  %3 = load ptr, ptr %new_range.i.i, align 8, !tbaa !6
  %add.ptr.i.i149 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div.i13.i.i
  store ptr %add.ptr.i.i149, ptr %end_size_.i.i, align 8, !tbaa !16
  ret ptr %add.ptr.i.i149
}

define i64 @"99"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !19
  ret i64 %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i
}

define i64 @"100"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !43
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !87
  %sext = shl i64 %2, %0
  %conv202 = ashr exact i64 %sext, %0
  %arrayidx.i542 = getelementptr inbounds i64, ptr %1, i64 %conv202
  %3 = load i64, ptr %arrayidx.i542, align 8, !tbaa !10
  ret i64 %3
}

define i32 @"101"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, ptr %v.i.i.i.i.i.i, ptr %v3.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %v.i.i.i.i.i.i, align 4
  %3 = load i32, ptr %v3.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i = icmp slt i32 %2, %3
  %4 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !55
  %5 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !55
  %cmp.i.i.i.i.i.i = icmp eq i32 %5, %4
  %cmp7.i.i.i.i.i.i = icmp slt i32 %5, %4
  %cond.i.i.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i1 %cmp4.i.i.i.i.i.i, i1 %cmp7.i.i.i.i.i.i
  %spec.select.i.i.i.i = select i1 %cond.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %__parent.020.in.i.i.i.i.i = add nsw i64 %sub12.i.i.i.i, %1
  %__parent.020.i.i56.i.i.i = lshr i64 %__parent.020.in.i.i.i.i.i, %0
  %add.ptr.i.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %__parent.020.i.i56.i.i.i
  %6 = load i32, ptr %add.ptr.i.i.i.i.i, align 4, !tbaa !55
  ret i32 %6
}

define i64 @"102"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57.epil) {
bb:
  %0 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !10
  %1 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !10
  %2 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !10
  %3 = load i64, ptr %arrayidx.i58, align 8, !tbaa !10
  %add7 = add nsw i64 %3, %total.076
  %add7.1 = add nsw i64 %2, %add7
  %add7.2 = add nsw i64 %1, %add7.1
  %add7.3 = add nsw i64 %0, %add7.2
  store i64 %add7.3, ptr %arrayidx.i57.epil, align 8, !tbaa !10
  ret i64 %add7.3
}

define float @"103"(ptr %arrayidx.i.prol, float %0, ptr %arrayidx.i, float %1, ptr %biggest_score4) {
bb:
  %2 = load float, ptr %arrayidx.i, align 4
  %3 = load float, ptr %arrayidx.i.prol, align 4
  %cmp.i.prol = fcmp ogt float %3, %0
  %4 = select i1 %cmp.i.prol, float %3, float %0
  %cmp.i = fcmp olt float %4, %2
  %5 = select i1 %cmp.i, float %2, float %1
  store float %5, ptr %biggest_score4, align 4, !tbaa !22
  ret float %5
}

define float @"104"(float %0, ptr %arrayidx.i.1, ptr %arrayidx.i, float %1, ptr %biggest_score4) {
bb:
  %2 = load float, ptr %arrayidx.i, align 4
  %3 = load float, ptr %arrayidx.i.1, align 4
  %cmp.i.1 = fcmp olt float %0, %3
  %4 = select i1 %cmp.i.1, float %3, float %0
  %cmp.i = fcmp olt float %4, %2
  %5 = select i1 %cmp.i, float %2, float %1
  store float %0, ptr %biggest_score4, align 4, !tbaa !22
  ret float %0
}

define i32 @"105"(ptr %call171, ptr %arrayidx.i548, ptr %arrayidx.i549, ptr %arrayidx.i550, i64 %sub.ptr.rhs.cast.i.i.i.i552, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i548, align 8, !tbaa !10
  %add.ptr263 = getelementptr inbounds i32, ptr %call171, i64 %2
  %3 = load i32, ptr %arrayidx.i549, align 4, !tbaa !12
  %idx.ext = sext i32 %3 to i64
  %add.ptr266 = getelementptr inbounds i32, ptr %add.ptr263, i64 %idx.ext
  %4 = load i64, ptr %arrayidx.i550, align 8, !tbaa !10
  %add.ptr271 = getelementptr inbounds i32, ptr %call171, i64 %4
  %sub.ptr.lhs.cast.i.i.i.i551 = ptrtoint ptr %add.ptr271 to i64
  %sub.ptr.sub.i.i.i.i553 = sub i64 %sub.ptr.lhs.cast.i.i.i.i551, %sub.ptr.rhs.cast.i.i.i.i552
  %sub.ptr.div.i.i.i.i561 = lshr exact i64 %sub.ptr.sub.i.i.i.i553, %0
  %shr.i.i565 = lshr i64 %sub.ptr.div.i.i.i.i561, %1
  %incdec.ptr4.sink.i.i.i.i569 = getelementptr inbounds i32, ptr %add.ptr266, i64 %shr.i.i565
  %5 = load i32, ptr %incdec.ptr4.sink.i.i.i.i569, align 4, !tbaa !12
  ret i32 %5
}

define i64 @"106"(ptr %queue, i64 %0, i64 %1, i64 %2, i64 %3, ptr %.omp.ub) {
bb:
  %4 = load ptr, ptr %queue, align 8, !tbaa !30
  %add.ptr.i = getelementptr inbounds i32, ptr %4, i64 %1
  %sub.ptr.rhs.cast = ptrtoint ptr %add.ptr.i to i64
  %add.ptr.i91 = getelementptr inbounds i32, ptr %4, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %add.ptr.i91 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %sub = add nsw i64 %sub.ptr.div, %3
  store i64 %sub, ptr %.omp.ub, align 8, !tbaa !10
  ret i64 %sub
}

define float @"107"(ptr %scores, i32 %cond, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %scores, align 8, !tbaa !20
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %5 = sub i32 %cond, %4
  %6 = zext i32 %5 to i64
  %7 = add nuw nsw i64 %6, %0
  %n.vec = and i64 %7, %1
  %ind.end = add nsw i64 %n.vec, %2
  %arrayidx.i = getelementptr inbounds float, ptr %3, i64 %ind.end
  %8 = load float, ptr %arrayidx.i, align 4, !tbaa !22
  ret float %8
}

define <2 x i64> @"108"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %this, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
bb:
  %wide.load = load <2 x i64>, ptr %0, align 8, !tbaa !10
  %10 = and <2 x i64> %wide.load, %1
  %.pre.i = load i64, ptr %this, align 8, !tbaa !10
  %vector.recur.init = insertelement <2 x i64> %2, i64 %.pre.i, i64 %3
  %11 = shufflevector <2 x i64> %vector.recur.init, <2 x i64> %wide.load, <2 x i32> <i32 1, i32 2>
  %12 = and <2 x i64> %11, %4
  %13 = or <2 x i64> %10, %12
  %14 = lshr exact <2 x i64> %13, %5
  %wide.load18 = load <2 x i64>, ptr %6, align 8, !tbaa !10
  %15 = xor <2 x i64> %14, %wide.load18
  %16 = and <2 x i64> %wide.load, %5
  %17 = icmp eq <2 x i64> %16, %7
  %18 = select <2 x i1> %17, <2 x i64> %7, <2 x i64> %8
  %19 = xor <2 x i64> %15, %18
  store <2 x i64> %19, ptr %9, align 8, !tbaa !10
  ret <2 x i64> %19
}

define i64 @"109"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !73
  %inc.i71 = add nuw nsw i64 %2, %1
  %arrayidx.i65 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i71
  %3 = load i64, ptr %arrayidx.i65, align 8, !tbaa !10
  ret i64 %3
}

define <2 x i64> @"110"(ptr %0, <2 x i64> %1, <2 x i64> %vector.recur17, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %udist_, i64 %7, i64 %index15) {
bb:
  %wide.load19 = load <2 x i64>, ptr %4, align 8, !tbaa !10
  %wide.load18 = load <2 x i64>, ptr %0, align 8, !tbaa !10
  %8 = shufflevector <2 x i64> %vector.recur17, <2 x i64> %wide.load18, <2 x i32> <i32 1, i32 2>
  %9 = and <2 x i64> %8, %2
  %10 = and <2 x i64> %wide.load18, %1
  %11 = or <2 x i64> %10, %9
  %12 = lshr exact <2 x i64> %11, %3
  %13 = xor <2 x i64> %12, %wide.load19
  %14 = and <2 x i64> %wide.load18, %3
  %15 = icmp eq <2 x i64> %14, %5
  %16 = select <2 x i1> %15, <2 x i64> %5, <2 x i64> %6
  %17 = xor <2 x i64> %13, %16
  %18 = load ptr, ptr %udist_, align 8, !tbaa !63
  %19 = getelementptr inbounds [312 x i64], ptr %18, i64 %7, i64 %index15
  store <2 x i64> %17, ptr %19, align 8, !tbaa !10
  ret <2 x i64> %17
}

define i64 @"111"(ptr %0, i64 %1, ptr %arrayidx42.i.i, i64 %2, i64 %3, ptr %arrayidx49.i.i, i64 %4, i64 %5, ptr %udist_, i64 %6) {
bb:
  %7 = load i64, ptr %0, align 8, !tbaa !10
  %and46.i.i = and i64 %7, %1
  %8 = load i64, ptr %arrayidx42.i.i, align 8, !tbaa !10
  %and43.i.i = and i64 %8, %2
  %or47.i.i = or i64 %and46.i.i, %and43.i.i
  %shr50.i.i = lshr exact i64 %or47.i.i, %3
  %9 = load i64, ptr %arrayidx49.i.i, align 8, !tbaa !10
  %xor51.i.i = xor i64 %shr50.i.i, %9
  %and52.i.i = and i64 %7, %3
  %tobool53.not.i.i = icmp eq i64 %and52.i.i, %4
  %cond54.i.i = select i1 %tobool53.not.i.i, i64 %4, i64 %5
  %xor55.i.i = xor i64 %xor51.i.i, %cond54.i.i
  %10 = load ptr, ptr %udist_, align 8, !tbaa !63
  %arrayidx42.i.i2 = getelementptr inbounds [312 x i64], ptr %0, i64 %4, i64 311
  store i64 %xor55.i.i, ptr %arrayidx42.i.i, align 8, !tbaa !10
  ret i64 %xor55.i.i
}

define i64 @"112"(ptr %queue, ptr %shared_out_end.i, ptr %shared_out_start.i, i64 %0, i64 %1, ptr %.omp.ub) {
bb:
  %2 = load i64, ptr %shared_out_start.i, align 8, !tbaa !28
  %3 = load ptr, ptr %queue, align 8, !tbaa !30
  %add.ptr.i = getelementptr inbounds i32, ptr %3, i64 %2
  %sub.ptr.rhs.cast = ptrtoint ptr %add.ptr.i to i64
  %4 = load i64, ptr %shared_out_end.i, align 8, !tbaa !82
  %add.ptr.i91 = getelementptr inbounds i32, ptr %3, i64 %4
  %sub.ptr.lhs.cast = ptrtoint ptr %add.ptr.i91 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %sub = add nsw i64 %sub.ptr.div, %1
  store i64 %sub, ptr %.omp.ub, align 8, !tbaa !10
  ret i64 %sub
}

define ptr @"113"(ptr %new_range.i.i, ptr %end_capacity_.i.i, ptr %agg.result, i64 %0) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !6
  %1 = load ptr, ptr %end_capacity_.i.i, align 8, !tbaa !24
  %sub.ptr.lhs.cast.i7.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %agg.result, align 8, !tbaa !18
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i9.i = sub i64 %sub.ptr.lhs.cast.i7.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.sub.i9.fr.i = freeze i64 %sub.ptr.sub.i9.i
  %mul.i = ashr exact i64 %sub.ptr.sub.i9.fr.i, %0
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %mul.i
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i, align 8, !tbaa !24
  ret ptr %add.ptr6.i.i
}

define float @"114"(ptr %arrayidx.i.prol, ptr %biggest_score, ptr %scores, i32 %cond, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %scores, align 8, !tbaa !20
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %5 = sub i32 %cond, %4
  %6 = zext i32 %5 to i64
  %7 = add nuw nsw i64 %6, %0
  %n.vec = and i64 %7, %1
  %ind.end = add nsw i64 %n.vec, %2
  %arrayidx.i.prol2 = getelementptr inbounds float, ptr %3, i64 %ind.end
  %8 = load float, ptr %arrayidx.i.prol, align 4, !tbaa !22
  %9 = load float, ptr %biggest_score, align 4, !tbaa !22
  %div9.prol = fdiv float %8, %9
  store float %div9.prol, ptr %arrayidx.i.prol, align 4, !tbaa !22
  ret float %div9.prol
}

define i64 @"115"(ptr %arrayidx.i, i64 %0, ptr %offsets, ptr %__begin0.0640) {
bb:
  %1 = load i64, ptr %arrayidx.i, align 8, !tbaa !10
  %inc = add nsw i64 %1, %0
  %2 = load ptr, ptr %offsets, align 8, !tbaa !43
  %e.sroa.0.0.copyload = load i32, ptr %__begin0.0640, align 4, !tbaa.struct !19
  %conv = sext i32 %e.sroa.0.0.copyload to i64
  %arrayidx.i2 = getelementptr inbounds i64, ptr %2, i64 %conv
  store i64 %inc, ptr %arrayidx.i, align 8, !tbaa !10
  ret i64 %inc
}

define float @"116"(ptr %arrayidx.i, ptr %call5.i.i.i.i4.i.i79, ptr %num_nodes_.i, i64 %0, i64 %1, i32 %2) {
bb:
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !34
  %n.mod.vf = and i64 %3, %1
  %4 = and i64 %3, %0
  %n.vec = sub nsw i64 %4, %n.mod.vf
  %second3.i = getelementptr inbounds %"struct.std::pair", ptr %call5.i.i.i.i4.i.i79, i64 %n.vec, i32 1
  %5 = load float, ptr %arrayidx.i, align 4, !tbaa !22
  store float %5, ptr %second3.i, align 4, !tbaa !51
  ret float %5
}

define i64 @"117"(i32 %shl19, ptr %arrayidx.i61, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i63, i64 %4, i64 %5, i64 %xor4.i, i64 %6, i64 %xor7.i, i32 %7, i32 %8, i32 %9, i32 %conv, i64 %10, i64 %ref.tmp30.sroa.0.0.insert.ext, ptr %el, ptr %.omp.lb) {
bb:
  %11 = load i64, ptr %arrayidx.i61, align 8, !tbaa !10
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
  %12 = load ptr, ptr %el, align 8, !tbaa !18
  %13 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %mul = shl i64 %13, %6
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %12, i64 %mul
  store i64 %ref.tmp30.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp30.sroa.0.0.insert.insert
}

define ptr @"118"(ptr %new_range.i.i, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1, ptr %el) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !18
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !16
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %2 = load ptr, ptr %new_range.i.i, align 8, !tbaa !6
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !16
  ret ptr %add.ptr.i464
}

define ptr @"119"(ptr %el, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !18
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !16
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !16
  ret ptr %add.ptr.i464
}

define i64 @"120"(i64 %lsum.036, ptr %arrayidx.i32, ptr %local_sums, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %arrayidx.i32, align 4, !tbaa !12
  %conv = sext i32 %0 to i64
  %add16 = add nsw i64 %lsum.036, %conv
  %1 = load ptr, ptr %local_sums, align 8, !tbaa !43
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %arrayidx.i = getelementptr inbounds i64, ptr %1, i64 %2
  store i64 %add16, ptr %arrayidx.i, align 8, !tbaa !10
  ret i64 %add16
}

define i32 @"121"(ptr %arrayidx212, ptr %call171, ptr %arrayidx.i539, i64 %0) {
bb:
  %1 = load i32, ptr %arrayidx212, align 4, !tbaa !12
  %2 = load i64, ptr %arrayidx.i539, align 8, !tbaa !10
  %sub183 = add nsw i64 %2, %0
  %arrayidx213 = getelementptr inbounds i32, ptr %call171, i64 %sub183
  store i32 %1, ptr %arrayidx213, align 4, !tbaa !12
  ret i32 %1
}

define float @"122"(ptr %_M_finish.i38, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !89
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %2, i64 %0
  %add.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %incdec.ptr.i.i, i64 %1
  %3 = load float, ptr %add.ptr.i.i, align 4, !tbaa !32
  ret float %3
}

define i32 @"123"(ptr %arrayidx.i399, i32 %0, ptr %depths, ptr %__begin3.0814) {
bb:
  %1 = load ptr, ptr %depths, align 8, !tbaa !8
  %2 = load i32, ptr %__begin3.0814, align 4, !tbaa !12
  %conv34 = sext i32 %2 to i64
  %arrayidx.i398 = getelementptr inbounds i32, ptr %1, i64 %conv34
  %3 = load i32, ptr %arrayidx.i399, align 4, !tbaa !12
  %add = add nsw i32 %3, %0
  store i32 %add, ptr %arrayidx.i398, align 4, !tbaa !12
  ret i32 %add
}

define i64 @"124"(ptr %arrayidx.i.i, ptr %0, i64 %1, ptr %2) {
bb:
  %3 = load ptr, ptr %0, align 8, !tbaa !6, !noalias !91
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %arrayidx.i.i, align 8, !tbaa !6, !noalias !91
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i = ashr exact i64 %sub.ptr.sub.i.i, %1
  store i64 %sub.ptr.div.i.i, ptr %2, align 8, !alias.scope !91
  ret i64 %sub.ptr.div.i.i
}

define i32 @"125"(ptr %arrayidx.i399, i32 %0, ptr %1, ptr %__begin3.0814) {
bb:
  %2 = load i32, ptr %__begin3.0814, align 4, !tbaa !12
  %conv34 = sext i32 %2 to i64
  %arrayidx.i398 = getelementptr inbounds i32, ptr %1, i64 %conv34
  %3 = load i32, ptr %arrayidx.i399, align 4, !tbaa !12
  %add = add nsw i32 %3, %0
  store i32 %add, ptr %arrayidx.i398, align 4, !tbaa !12
  ret i32 %add
}

define i8 @"126"(i8 %0, ptr %ref.tmp, ptr %__dnew.i.i.i) {
bb:
  %1 = load ptr, ptr %ref.tmp, align 8, !tbaa !25, !alias.scope !70
  %2 = load i64, ptr %__dnew.i.i.i, align 8, !tbaa !10, !noalias !70
  %arrayidx.i.i.i.i = getelementptr inbounds i8, ptr %1, i64 %2
  store i8 %0, ptr %arrayidx.i.i.i.i, align 1, !tbaa !59
  ret i8 %0
}

define i32 @"127"(i32 %conv22, ptr %diffs, i64 %indvars.iv) {
bb:
  %0 = load ptr, ptr %diffs, align 8, !tbaa !8
  %arrayidx.i99 = getelementptr inbounds i32, ptr %0, i64 %indvars.iv
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !12
  ret i32 %conv22
}

define i32 @"128"(ptr %neighs, ptr %arrayidx.i523, ptr %arrayidx.i524, i64 %sub.ptr.rhs.cast.i.i.i.i526, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i524, align 8, !tbaa !10
  %3 = load ptr, ptr %neighs, align 8, !tbaa !6
  %add.ptr121 = getelementptr inbounds i32, ptr %3, i64 %2
  %sub.ptr.lhs.cast.i.i.i.i525 = ptrtoint ptr %add.ptr121 to i64
  %sub.ptr.sub.i.i.i.i527 = sub i64 %sub.ptr.lhs.cast.i.i.i.i525, %sub.ptr.rhs.cast.i.i.i.i526
  %sub.ptr.div.i.i.i.i = lshr exact i64 %sub.ptr.sub.i.i.i.i527, %0
  %shr.i.i = lshr i64 %sub.ptr.div.i.i.i.i, %1
  %4 = load i64, ptr %arrayidx.i523, align 8, !tbaa !10
  %add.ptr = getelementptr inbounds i32, ptr %3, i64 %4
  %incdec.ptr4.sink.i.i.i.i = getelementptr inbounds i32, ptr %add.ptr, i64 %shr.i.i
  %5 = load i32, ptr %incdec.ptr4.sink.i.i.i.i, align 4, !tbaa !12
  ret i32 %5
}

define i32 @"129"(ptr %second5.i.i.i.i.i, ptr %second.i.i.i.i.i) {
bb:
  %0 = load i32, ptr %second5.i.i.i.i.i, align 4
  store i32 %0, ptr %second.i.i.i.i.i, align 4, !tbaa !94
  ret i32 %0
}

define i32 @"130"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %3 = sub i64 %0, %2
  %n.vec = and i64 %3, %1
  %ind.end = add i64 %2, %n.vec
  %4 = load ptr, ptr %el, align 8, !tbaa !18
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %4, i64 %ind.end
  %5 = load i32, ptr %add.ptr.prol, align 4
  ret i32 %5
}

define i32 @"131"(ptr %arrayidx.i.i.i60, ptr %n_start.0.in, i64 %0, ptr %diffs, ptr %.omp.lb) {
bb:
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !6
  %sub.ptr.lhs.cast = ptrtoint ptr %n_end.0 to i64
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !6
  %.pre134 = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %.pre134
  %1 = lshr exact i64 %sub.ptr.sub, %0
  %conv22 = trunc i64 %1 to i32
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %3 = sext i32 %2 to i64
  %4 = load ptr, ptr %diffs, align 8, !tbaa !8
  %arrayidx.i99 = getelementptr inbounds i32, ptr %4, i64 %3
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !12
  ret i32 %conv22
}

define <4 x float> @"132"(<2 x float> %0, ptr %1, ptr %2) {
bb:
  %wide.load = load <2 x float>, ptr %1, align 4, !tbaa !22, !alias.scope !95
  %interleaved.vec = shufflevector <2 x float> %0, <2 x float> %wide.load, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x float> %interleaved.vec, ptr %2, align 4, !tbaa !59
  ret <4 x float> %interleaved.vec
}

define i32 @"133"(ptr %incdec.ptr.i, i64 %0, ptr %second3.i29.i.i.i) {
bb:
  %__value.sroa.0.0.copyload.i = load i64, ptr %incdec.ptr.i, align 4
  %__value.sroa.3.0.extract.shift.i.i.i = lshr i64 %__value.sroa.0.0.copyload.i, %0
  %__value.sroa.3.0.extract.trunc.i.i.i = trunc i64 %__value.sroa.3.0.extract.shift.i.i.i to i32
  store i32 %__value.sroa.3.0.extract.trunc.i.i.i, ptr %second3.i29.i.i.i, align 4, !tbaa !94
  ret i32 %__value.sroa.3.0.extract.trunc.i.i.i
}

define i32 @"134"(ptr %el, i64 %0, i64 %1, i32 %2) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr122.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %v3.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr122.i.i, i64 %1, i32 1
  %3 = load i32, ptr %v3.i.i.i.i, align 4
  ret i32 %3
}

define i64 @"135"(ptr %arrayidx.i492, ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !87
  %n.mod.vf = and i64 %2, %0
  %arrayidx.i493 = getelementptr inbounds i64, ptr %1, i64 %n.mod.vf
  %3 = load i64, ptr %arrayidx.i492, align 8, !tbaa !10
  store i64 %3, ptr %arrayidx.i493, align 8, !tbaa !10
  ret i64 %3
}

define i32 @"136"(ptr %num_nodes_.i, i32 %0, ptr %.omp.ub) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !34
  %conv = trunc i64 %1 to i32
  %sub3 = add nsw i32 %conv, %0
  store i32 %sub3, ptr %.omp.ub, align 4, !tbaa !12
  ret i32 %sub3
}

define i32 @"137"(ptr %0) {
bb:
  %.pre722 = load ptr, ptr %0, align 8, !tbaa !6
  %1 = load i32, ptr %.pre722, align 4, !tbaa !12
  ret i32 %1
}

define i64 @"138"(ptr %arrayidx.i533, i64 %total_missing_inv.0649, ptr %arrayidx.i536, ptr %offsets, ptr %num_nodes_.i) {
bb:
  %0 = load i32, ptr %arrayidx.i536, align 4, !tbaa !12
  %conv155 = sext i32 %0 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %1 = load i64, ptr %arrayidx.i533, align 8, !tbaa !10
  %add165 = add nsw i64 %1, %add156
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !87
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !43
  %arrayidx.i5332 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %2
  store i64 %add165, ptr %arrayidx.i533, align 8, !tbaa !10
  ret i64 %add165
}

define i32 @"139"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.1659, ptr %arrayidx.i541) {
bb:
  %1 = load i64, ptr %arrayidx.i542, align 8, !tbaa !10
  %i200.0 = add nsw i64 %1, %0
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !12
  %.pre731 = sext i32 %.pre717 to i64
  %sub222 = sub nsw i64 %total_missing_inv.1659, %.pre731
  %sub211 = sub nsw i64 %i200.0, %sub222
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %2 = load i32, ptr %arrayidx212, align 4, !tbaa !12
  ret i32 %2
}

define i32 @"140"(ptr %n_start.0.in, i64 %0, i64 %1) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !6
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds i32, ptr %incdec.ptr12.i.i.i.i, i64 %1
  %2 = load i32, ptr %__first.addr.030.i.i, align 4, !tbaa !12
  ret i32 %2
}

define i64 @"141"(ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %__i.018.i, i64 %add.i, i64 %inc.i, ptr %arrayidx7.i.1) {
bb:
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !10
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
  store i64 %rem.i.i17.i.1, ptr %arrayidx7.i.1, align 8, !tbaa !10
  ret i64 %rem.i.i17.i.1
}

define i32 @"142"(ptr %degrees, i64 %mul12, i64 %umin, ptr %.omp.lb, i64 %indvar, i64 %0, i64 %n.mod.vf) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %2 = add i64 %1, %indvar
  %3 = shl i64 %2, %0
  %4 = sub i64 %umin, %3
  %n.vec = sub i64 %4, %n.mod.vf
  %ind.end = add i64 %mul12, %n.vec
  %5 = load ptr, ptr %degrees, align 8, !tbaa !8
  %arrayidx.i32 = getelementptr inbounds i32, ptr %5, i64 %ind.end
  %6 = load i32, ptr %arrayidx.i32, align 4, !tbaa !12
  ret i32 %6
}

define i32 @"143"(ptr %0, ptr %__begin3.0814) {
bb:
  %1 = load i32, ptr %__begin3.0814, align 4, !tbaa !12
  %conv34 = sext i32 %1 to i64
  %arrayidx.i398 = getelementptr inbounds i32, ptr %0, i64 %conv34
  %2 = load i32, ptr %arrayidx.i398, align 4, !tbaa !12
  ret i32 %2
}

define ptr @"144"(ptr %cond.i31.i.i491, ptr %_M_finish.i468, ptr %add.ptr.i467, i64 %0, i64 %1, ptr %verts_at_depth.sroa.0.5, ptr %arrayidx.i466, i64 %2, i32 %3) {
bb:
  %4 = load i32, ptr %arrayidx.i466, align 4, !tbaa !12
  %conv98 = sext i32 %4 to i64
  %add.ptr.i4672 = getelementptr inbounds %"class.std::vector.26", ptr %verts_at_depth.sroa.0.5, i64 %conv98
  %_M_finish.i4684 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i467, i64 %2, i32 1
  %5 = load ptr, ptr %_M_finish.i468, align 8, !tbaa !6
  %sub.ptr.lhs.cast.i.i.i.i475 = ptrtoint ptr %5 to i64
  %6 = load ptr, ptr %add.ptr.i467, align 8, !tbaa !6
  %sub.ptr.rhs.cast.i.i.i.i476 = ptrtoint ptr %6 to i64
  %sub.ptr.sub.i.i.i.i477 = sub i64 %sub.ptr.lhs.cast.i.i.i.i475, %sub.ptr.rhs.cast.i.i.i.i476
  %sub.ptr.div.i.i.i.i480 = ashr exact i64 %sub.ptr.sub.i.i.i.i477, %0
  %add.ptr.i.i492 = getelementptr inbounds i32, ptr %cond.i31.i.i491, i64 %sub.ptr.div.i.i.i.i480
  %incdec.ptr.i.i495 = getelementptr inbounds i32, ptr %add.ptr.i.i492, i64 %1
  store ptr %incdec.ptr.i.i495, ptr %_M_finish.i468, align 8, !tbaa !80
  ret ptr %incdec.ptr.i.i495
}

define <2 x i64> @"145"(ptr %0, <2 x i64> %1, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %7) {
bb:
  %wide.load = load <2 x i64>, ptr %0, align 8, !tbaa !10
  %8 = and <2 x i64> %wide.load, %1
  %9 = shufflevector <2 x i64> %wide.load, <2 x i64> %wide.load, <2 x i32> <i32 1, i32 2>
  %10 = and <2 x i64> %9, %2
  %11 = or <2 x i64> %8, %10
  %12 = lshr exact <2 x i64> %11, %3
  %wide.load18 = load <2 x i64>, ptr %4, align 8, !tbaa !10
  %13 = xor <2 x i64> %12, %wide.load18
  %14 = and <2 x i64> %wide.load, %3
  %15 = icmp eq <2 x i64> %14, %5
  %16 = select <2 x i1> %15, <2 x i64> %5, <2 x i64> %6
  %17 = xor <2 x i64> %13, %16
  store <2 x i64> %17, ptr %7, align 8, !tbaa !10
  ret <2 x i64> %17
}

define float @"146"(ptr %biggest_score, ptr %biggest_score4) {
bb:
  %0 = load float, ptr %biggest_score, align 4, !tbaa !22
  %1 = load float, ptr %biggest_score4, align 4, !tbaa !22
  %cmp13 = fcmp ogt float %0, %1
  %. = select i1 %cmp13, float %0, float %1
  store float %., ptr %biggest_score, align 4, !tbaa !22
  ret float %.
}

define float @"147"(ptr %scores, i32 %cond, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %4 = sub i32 %cond, %3
  %5 = zext i32 %4 to i64
  %6 = add nuw nsw i64 %5, %0
  %n.vec = and i64 %6, %1
  %ind.end = add nsw i64 %n.vec, %2
  %indvars.iv.next = add nsw i64 %ind.end, %0
  %7 = load ptr, ptr %scores, align 8, !tbaa !20
  %arrayidx.i.1 = getelementptr inbounds float, ptr %7, i64 %indvars.iv.next
  %8 = load float, ptr %arrayidx.i.1, align 4, !tbaa !22
  ret float %8
}

define i64 @"148"(ptr %arrayidx.i25, i64 %0, ptr %arrayidx.i23, ptr %el, i64 %.omp.iv.028) {
bb:
  %1 = load i32, ptr %arrayidx.i23, align 4, !tbaa !12
  %ref.tmp.sroa.0.0.insert.ext = zext i32 %1 to i64
  %2 = load i32, ptr %arrayidx.i25, align 4, !tbaa !12
  %ref.tmp.sroa.4.0.insert.ext = zext i32 %2 to i64
  %ref.tmp.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp.sroa.4.0.insert.ext, %0
  %ref.tmp.sroa.0.0.insert.insert = or i64 %ref.tmp.sroa.4.0.insert.shift, %ref.tmp.sroa.0.0.insert.ext
  %3 = load ptr, ptr %el, align 8, !tbaa !18
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %.omp.iv.028
  store i64 %ref.tmp.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp.sroa.0.0.insert.insert
}

define i32 @"149"(ptr %depths, ptr %__begin4.0135) {
bb:
  %0 = load i32, ptr %__begin4.0135, align 4, !tbaa !12, !llvm.access.group !31
  %conv36 = sext i32 %0 to i64
  %1 = load ptr, ptr %depths, align 8, !tbaa !8, !llvm.access.group !31
  %arrayidx.i102 = getelementptr inbounds i32, ptr %1, i64 %conv36
  %2 = load i32, ptr %arrayidx.i102, align 4, !tbaa !12, !llvm.access.group !31
  ret i32 %2
}

define i64 @"150"(ptr %udist_, i64 %0, ptr %_M_p.i) {
bb:
  %1 = load ptr, ptr %udist_, align 8, !tbaa !63
  %.pre = load i64, ptr %_M_p.i, align 8, !tbaa !65
  %arrayidx.i7 = getelementptr inbounds [312 x i64], ptr %1, i64 %0, i64 %.pre
  %2 = load i64, ptr %arrayidx.i7, align 8, !tbaa !10
  ret i64 %2
}

define i64 @"151"(ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i32, ptr %v.i.i.i.i.i, align 4
  %1 = load i32, ptr %v3.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %0, %1
  %2 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !55
  %3 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !55
  %cmp.i.i.i.i.i = icmp eq i32 %3, %2
  %cmp7.i.i.i.i.i = icmp slt i32 %3, %2
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr3.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  %4 = load i64, ptr %add.ptr3.i.i.i, align 4
  ret i64 %4
}

define ptr @"152"(ptr %neighs, ptr %arrayidx.i.1, ptr %index, i64 %indvars.iv.next) {
bb:
  %0 = load ptr, ptr %index, align 8, !tbaa !6
  %arrayidx.1 = getelementptr inbounds ptr, ptr %0, i64 %indvars.iv.next
  %1 = load ptr, ptr %neighs, align 8, !tbaa !6
  %2 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !10
  %add.ptr.1 = getelementptr inbounds i32, ptr %1, i64 %2
  store ptr %add.ptr.1, ptr %arrayidx.1, align 8, !tbaa !6
  ret ptr %add.ptr.1
}

define <2 x i64> @"153"(ptr %0, <2 x i64> %1, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %udist_, i64 %7, i64 %index15) {
bb:
  %wide.load19 = load <2 x i64>, ptr %4, align 8, !tbaa !10
  %wide.load18 = load <2 x i64>, ptr %0, align 8, !tbaa !10
  %8 = shufflevector <2 x i64> %wide.load18, <2 x i64> %wide.load18, <2 x i32> <i32 1, i32 2>
  %9 = and <2 x i64> %8, %2
  %10 = and <2 x i64> %wide.load18, %1
  %11 = or <2 x i64> %10, %9
  %12 = lshr exact <2 x i64> %11, %3
  %13 = xor <2 x i64> %12, %wide.load19
  %14 = and <2 x i64> %wide.load18, %3
  %15 = icmp eq <2 x i64> %14, %5
  %16 = select <2 x i1> %15, <2 x i64> %5, <2 x i64> %6
  %17 = xor <2 x i64> %13, %16
  %18 = load ptr, ptr %udist_, align 8, !tbaa !63
  %19 = getelementptr inbounds [312 x i64], ptr %18, i64 %7, i64 %index15
  store <2 x i64> %17, ptr %19, align 8, !tbaa !10
  ret <2 x i64> %17
}

define i64 @"154"(ptr %__first.addr.033.i.i, ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.033.i.i, align 4
  store i64 %agg.tmp.sroa.0.0.copyload.i.i.i, ptr %incdec.ptr13.i.i.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i64 @"155"(ptr %arrayidx.i535, i64 %total_missing_inv.0649, ptr %offsets, i64 %indvars.iv691) {
bb:
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !43
  %arrayidx.i5352 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %indvars.iv691
  %0 = load i64, ptr %arrayidx.i535, align 8, !tbaa !10
  %add152 = add nsw i64 %0, %total_missing_inv.0649
  store i64 %add152, ptr %arrayidx.i535, align 8, !tbaa !10
  ret i64 %add152
}

define i64 @"156"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !73
  %inc.i71 = add nuw nsw i64 %2, %1
  %inc.i207 = add nuw nsw i64 %inc.i71, %1
  %arrayidx.i140 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i207
  %3 = load i64, ptr %arrayidx.i140, align 8, !tbaa !10
  ret i64 %3
}

define ptr @"157"(ptr %call.i.i446450, ptr %num_nodes_.i, ptr %end_size_.i.i448) {
bb:
  %.pre875 = load i64, ptr %num_nodes_.i, align 8, !tbaa !34
  %add.ptr.i.i447 = getelementptr inbounds float, ptr %call.i.i446450, i64 %.pre875
  store ptr %add.ptr.i.i447, ptr %end_size_.i.i448, align 8, !tbaa !98
  ret ptr %add.ptr.i.i447
}

define i64 @"158"(ptr %new_range.i.i) {
bb:
  %0 = load ptr, ptr %new_range.i.i, align 8, !tbaa !6
  %agg.tmp.sroa.0.0.copyload.i.i.i.i.i = load i64, ptr %0, align 4, !tbaa.struct !19
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i.i.i
}

define i32 @"159"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !12
  %1 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !12
  %cmp.i.i.i.i.i = icmp slt i32 %1, %0
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add.ptr3.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i.i.i.i
  %2 = load i32, ptr %add.ptr3.i.i.i.i, align 4, !tbaa !12
  ret i32 %2
}

define i32 @"160"(ptr %depths, ptr %__begin3.0814) {
bb:
  %.pre = load ptr, ptr %depths, align 8, !tbaa !8
  %0 = load i32, ptr %__begin3.0814, align 4, !tbaa !12
  %conv34 = sext i32 %0 to i64
  %arrayidx.i398 = getelementptr inbounds i32, ptr %.pre, i64 %conv34
  %1 = load i32, ptr %arrayidx.i398, align 4, !tbaa !12
  ret i32 %1
}

define i64 @"161"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !73
  %inc.i71 = add nuw nsw i64 %2, %1
  %arrayidx.i208 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i71
  %3 = load i64, ptr %arrayidx.i208, align 8, !tbaa !10
  ret i64 %3
}

define i32 @"162"(ptr %queue, i64 %0, i64 %.omp.iv.0138) {
bb:
  %1 = load ptr, ptr %queue, align 8, !tbaa !30
  %add.ptr.i = getelementptr inbounds i32, ptr %1, i64 %0
  %add.ptr = getelementptr inbounds i32, ptr %add.ptr.i, i64 %.omp.iv.0138
  %2 = load i32, ptr %add.ptr, align 4, !tbaa !12, !llvm.access.group !31
  ret i32 %2
}

define i32 @"163"(ptr %call171, ptr %arrayidx.i548, ptr %arrayidx.i549) {
bb:
  %0 = load i64, ptr %arrayidx.i548, align 8, !tbaa !10
  %add.ptr263 = getelementptr inbounds i32, ptr %call171, i64 %0
  %1 = load i32, ptr %arrayidx.i549, align 4, !tbaa !12
  %idx.ext = sext i32 %1 to i64
  %add.ptr266 = getelementptr inbounds i32, ptr %add.ptr263, i64 %idx.ext
  %2 = load i32, ptr %add.ptr266, align 4, !tbaa !12
  ret i32 %2
}

define i64 @"164"(ptr %.omp.lb, i64 %0, i64 %1, ptr %rng) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %add10 = add i64 %2, %0
  %rem.i.i.i = and i64 %add10, %1
  store i64 %rem.i.i.i, ptr %rng, align 8, !tbaa !10
  ret i64 %rem.i.i.i
}

define i64 @"165"(ptr %__first.addr.07.i.i.i.i.i.i.i, ptr %cond.i31.i.i.i, ptr %_M_finish.i38, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4) {
bb:
  %5 = load i64, ptr %__first.addr.07.i.i.i.i.i.i.i, align 4, !alias.scope !99, !noalias !102
  %6 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !89
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %6, i64 %0
  %7 = ptrtoint ptr %incdec.ptr.i.i to i64
  %8 = add i64 %7, %1
  %9 = sub i64 %8, %2
  %10 = lshr i64 %9, %3
  %11 = add nuw nsw i64 %10, %0
  %n.vec = and i64 %11, %4
  %12 = shl i64 %n.vec, %3
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i, i64 %12
  store i64 %5, ptr %ind.end, align 4, !alias.scope !102, !noalias !99
  ret i64 %5
}

define i64 @"166"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !73
  %inc.i71 = add nuw nsw i64 %1, %0
  %inc.i207 = add nuw nsw i64 %inc.i71, %0
  store i64 %inc.i207, ptr %_M_p.i.i.i, align 8, !tbaa !73
  ret i64 %inc.i207
}

define <4 x i32> @"167"(<4 x i32> %0, ptr %init_val, i64 %1, ptr %this, ptr %.omp.lb, i64 %index) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %offset.idx = add i64 %2, %index
  %3 = load ptr, ptr %this, align 8, !tbaa !8
  %4 = getelementptr inbounds i32, ptr %3, i64 %offset.idx
  %5 = load i32, ptr %init_val, align 4, !tbaa !12, !alias.scope !46
  %broadcast.splatinsert21 = insertelement <4 x i32> %0, i32 %5, i64 %1
  %broadcast.splat22 = shufflevector <4 x i32> %broadcast.splatinsert21, <4 x i32> %0, <4 x i32> zeroinitializer
  store <4 x i32> %broadcast.splat22, ptr %4, align 4, !tbaa !12, !alias.scope !49, !noalias !46
  ret <4 x i32> %broadcast.splat22
}

define i32 @"168"(ptr %__first, ptr %add.ptr.i.us, ptr %add.ptr2.i.us, i64 %sub1.i.us, i64 %mul.i.us, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr.i.us, align 4, !tbaa !12
  %3 = load i32, ptr %add.ptr2.i.us, align 4, !tbaa !12
  %cmp.i.i.us = icmp slt i32 %2, %3
  %spec.select.i.us = select i1 %cmp.i.i.us, i64 %sub1.i.us, i64 %mul.i.us
  %__parent.020.in.i.i.us = add nsw i64 %spec.select.i.us, %0
  %__parent.020.i.i.us = sdiv i64 %__parent.020.in.i.i.us, %1
  %add.ptr.i.i.us = getelementptr inbounds i32, ptr %__first, i64 %__parent.020.i.i.us
  %4 = load i32, ptr %add.ptr.i.i.us, align 4, !tbaa !12
  ret i32 %4
}

define <4 x i32> @"169"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.1659, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !10
  %3 = add i64 %2, %0
  %4 = sub nsw i64 %3, %total_missing_inv.1659
  %5 = getelementptr inbounds i32, ptr %call171, i64 %4
  %6 = getelementptr inbounds i32, ptr %5, i64 %1
  %wide.load803 = load <4 x i32>, ptr %6, align 4, !tbaa !12
  ret <4 x i32> %wide.load803
}

define i64 @"170"(ptr %arrayidx, ptr %new_range, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %arrayidx, align 4
  %1 = load ptr, ptr %new_range, align 8, !tbaa !6
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %arrayidx7 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %2
  store i64 %0, ptr %arrayidx7, align 4
  ret i64 %0
}

define float @"171"(ptr %arrayidx.i591, ptr %retval.0.i.i, ptr %scores, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %scores, align 8, !tbaa !20
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !34
  %4 = and i64 %3, %0
  %n.mod.vf = and i64 %3, %1
  %n.vec = sub nsw i64 %4, %n.mod.vf
  %arrayidx.i5912 = getelementptr inbounds float, ptr %2, i64 %n.vec
  %5 = load float, ptr %arrayidx.i591, align 4, !tbaa !22
  %6 = load float, ptr %retval.0.i.i, align 4, !tbaa !22
  %div224 = fdiv float %5, %6
  store float %div224, ptr %arrayidx.i591, align 4, !tbaa !22
  ret float %div224
}

define i32 @"172"(ptr %el, i64 %0, i32 %1) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %v.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0, i32 1
  %2 = load i32, ptr %v.i.i.i.i, align 4
  ret i32 %2
}

define i64 @"173"(ptr %__begin0.sroa.0.059, i64 %0, ptr %.sroa_idx, ptr %cond.i31.i.i.i, ptr %_M_finish.i38, i64 %1, i64 %sub.ptr.rhs.cast.i, i64 %2) {
bb:
  %3 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !89
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %3, i64 %1
  %sub.ptr.lhs.cast.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %2
  %add.ptr.i.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %cond.i31.i.i.i, i64 %sub.ptr.div.i
  %4 = load i32, ptr %.sroa_idx, align 4
  %retval.sroa.0.0.insert.ext.i = zext i32 %4 to i64
  %5 = load i32, ptr %__begin0.sroa.0.059, align 4
  %retval.sroa.2.0.insert.ext.i = zext i32 %5 to i64
  %retval.sroa.2.0.insert.shift.i = shl nuw i64 %retval.sroa.2.0.insert.ext.i, %0
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i
  store i64 %retval.sroa.0.0.insert.insert.i, ptr %add.ptr.i.i.i, align 4
  ret i64 %retval.sroa.0.0.insert.insert.i
}

define <2 x i64> @"174"(ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %index770, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !87
  %4 = and i64 %3, %0
  %offset.idx = sub i64 %4, %index770
  %5 = add nuw i64 %offset.idx, %0
  %6 = and i64 %5, %0
  %7 = getelementptr inbounds i64, ptr %2, i64 %6
  %8 = getelementptr inbounds i64, ptr %7, i64 %1
  %wide.load = load <2 x i64>, ptr %8, align 8, !tbaa !10
  ret <2 x i64> %wide.load
}

define i8 @"175"(ptr %arrayidx.i17.i, ptr %agg.tmp11, ptr %num_iters_, i32 %0, i64 %idxprom1.i.i) {
bb:
  %1 = load ptr, ptr %agg.tmp11, align 8, !tbaa !25, !alias.scope !104
  %2 = load i32, ptr %num_iters_, align 4, !tbaa !107
  %__val.lobit.i = lshr i32 %2, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %arrayidx.i.i = getelementptr inbounds i8, ptr %1, i64 %conv5.i
  %arrayidx2.i.i = getelementptr inbounds i8, ptr %arrayidx.i.i, i64 %idxprom1.i.i
  %3 = load i8, ptr %arrayidx.i17.i, align 1, !tbaa !59, !noalias !104
  store i8 %3, ptr %arrayidx2.i.i, align 1, !tbaa !59
  ret i8 %3
}

define i64 @"176"(ptr %arrayidx.i492.prol, ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !87
  %n.mod.vf = and i64 %1, %0
  %2 = load ptr, ptr %offsets, align 8
  %arrayidx.i493.prol = getelementptr inbounds i64, ptr %2, i64 %n.mod.vf
  %3 = load i64, ptr %arrayidx.i492.prol, align 8, !tbaa !10
  store i64 %3, ptr %arrayidx.i493.prol, align 8, !tbaa !10
  ret i64 %3
}

define ptr @"177"(ptr %cond.i31.i.i491, i64 %.sroa.speculated.i.i.i481, ptr %_M_finish.i468, ptr %add.ptr.i467, i64 %0, i64 %sub.ptr.div.i.i.i.i480, i1 %cmp9.i.i.i484, i64 %1, i64 %add.i.i.i482, ptr %verts_at_depth.sroa.0.5, ptr %arrayidx.i466, i64 %2, i32 %3) {
bb:
  %4 = load ptr, ptr %_M_finish.i468, align 8, !tbaa !6
  %sub.ptr.lhs.cast.i.i.i.i475 = ptrtoint ptr %4 to i64
  %5 = load ptr, ptr %add.ptr.i467, align 8, !tbaa !6
  %sub.ptr.rhs.cast.i.i.i.i476 = ptrtoint ptr %5 to i64
  %sub.ptr.sub.i.i.i.i477 = sub i64 %sub.ptr.lhs.cast.i.i.i.i475, %sub.ptr.rhs.cast.i.i.i.i476
  %sub.ptr.div.i.i.i.i4802 = ashr exact i64 %sub.ptr.sub.i.i.i.i477, %0
  %add.i.i.i4824 = add i64 %.sroa.speculated.i.i.i481, %sub.ptr.div.i.i.i.i480
  %cmp7.i.i.i483 = icmp ult i64 %add.i.i.i482, %sub.ptr.div.i.i.i.i480
  %or.cond.i.i.i485 = or i1 %cmp7.i.i.i483, %cmp9.i.i.i484
  %cond.i.i.i486 = select i1 %or.cond.i.i.i485, i64 %1, i64 %add.i.i.i482
  %add.ptr19.i.i499 = getelementptr inbounds i32, ptr %cond.i31.i.i491, i64 %cond.i.i.i486
  %6 = load i32, ptr %arrayidx.i466, align 4, !tbaa !12
  %conv98 = sext i32 %6 to i64
  %add.ptr.i4676 = getelementptr inbounds %"class.std::vector.26", ptr %verts_at_depth.sroa.0.5, i64 %conv98
  %_M_end_of_storage.i469 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i467, i64 %2, i32 2
  store ptr %add.ptr19.i.i499, ptr %_M_end_of_storage.i469, align 8, !tbaa !115
  ret ptr %add.ptr19.i.i499
}

define i32 @"178"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !18
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %add15 = add i64 %3, %0
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %add15
  %add.ptr.sroa_idx.1 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %1
  %4 = load i32, ptr %add.ptr.sroa_idx.1, align 4
  ret i32 %4
}

define i64 @"179"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %call.i4145, ptr %num_blocks) {
bb:
  %0 = load i64, ptr %num_blocks, align 8, !tbaa !10
  %arrayidx.i = getelementptr inbounds i64, ptr %call.i4145, i64 %0
  %1 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !10
  %2 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !10
  %3 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !10
  %4 = load i64, ptr %arrayidx.i58, align 8, !tbaa !10
  %add7 = add nsw i64 %4, %total.076
  %add7.1 = add nsw i64 %3, %add7
  %add7.2 = add nsw i64 %2, %add7.1
  %add7.3 = add nsw i64 %1, %add7.2
  store i64 %add7.3, ptr %arrayidx.i, align 8, !tbaa !10
  ret i64 %add7.3
}

define i64 @"180"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i = load i64, ptr %incdec.ptr.i.i.i.i, align 4, !tbaa.struct !19
  ret i64 %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i
}

define i64 @"181"(ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !87
  %n.mod.vf = and i64 %2, %0
  %sub = add nuw i64 %n.mod.vf, %1
  %conv34 = and i64 %sub, %1
  %3 = load ptr, ptr %offsets, align 8
  %arrayidx.i492 = getelementptr inbounds i64, ptr %3, i64 %conv34
  %4 = load i64, ptr %arrayidx.i492, align 8, !tbaa !10
  ret i64 %4
}

define i32 @"182"(ptr %el, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %el, align 8, !tbaa !18
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %1
  %2 = load i32, ptr %add.ptr, align 4
  ret i32 %2
}

define i32 @"183"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !18
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %2
  %add.ptr.sroa_idx = getelementptr inbounds i8, ptr %add.ptr, i64 %0
  %3 = load i32, ptr %add.ptr.sroa_idx, align 4
  ret i32 %3
}

define float @"184"(ptr %arrayidx.i, ptr %biggest_score, ptr %scores, i64 %indvars.iv) {
bb:
  %0 = load ptr, ptr %scores, align 8, !tbaa !20
  %arrayidx.i2 = getelementptr inbounds float, ptr %0, i64 %indvars.iv
  %1 = load float, ptr %biggest_score, align 4, !tbaa !22
  %2 = load float, ptr %arrayidx.i, align 4, !tbaa !22
  %div9 = fdiv float %2, %1
  store float %div9, ptr %arrayidx.i, align 4, !tbaa !22
  ret float %div9
}

define float @"185"(ptr %0, ptr %incdec.ptr14.i.i, ptr %scores, i64 %1) {
bb:
  %2 = load ptr, ptr %scores, align 8, !tbaa !20
  %incdec.ptr11.i.i = getelementptr inbounds float, ptr %0, i64 %1
  %3 = load float, ptr %incdec.ptr14.i.i, align 4, !tbaa !22
  %.pre.i.i = load float, ptr %0, align 4, !tbaa !22
  %cmp.i.i.i = fcmp olt float %.pre.i.i, %3
  %spec.select.i.i = select i1 %cmp.i.i.i, ptr %incdec.ptr11.i.i, ptr %0
  %4 = load float, ptr %spec.select.i.i, align 4, !tbaa !22
  ret float %4
}

define <4 x float> @"186"(ptr %0, <4 x float> %1, ptr %biggest_score, i64 %2, ptr %scores, i64 %index, ptr %.omp.lb) {
bb:
  %wide.load = load <4 x float>, ptr %0, align 4, !tbaa !22, !alias.scope !116, !noalias !119
  %3 = load float, ptr %biggest_score, align 4, !tbaa !22, !alias.scope !119
  %broadcast.splatinsert = insertelement <4 x float> %1, float %3, i64 %2
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> %1, <4 x i32> zeroinitializer
  %4 = fdiv <4 x float> %wide.load, %broadcast.splat
  %5 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %6 = sext i32 %5 to i64
  %offset.idx = add i64 %index, %6
  %7 = load ptr, ptr %scores, align 8, !tbaa !20
  %8 = getelementptr inbounds float, ptr %7, i64 %offset.idx
  store <4 x float> %4, ptr %0, align 4, !tbaa !22, !alias.scope !116, !noalias !119
  ret <4 x float> %4
}

define i64 @"187"(ptr %arrayidx.i18.i, ptr %0, i64 %1, ptr %2) {
bb:
  %3 = load ptr, ptr %0, align 8, !tbaa !6, !noalias !91
  %sub.ptr.rhs.cast.i20.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %arrayidx.i18.i, align 8, !tbaa !6, !noalias !91
  %sub.ptr.lhs.cast.i19.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i21.i = sub i64 %sub.ptr.lhs.cast.i19.i, %sub.ptr.rhs.cast.i20.i
  %sub.ptr.div.i22.i = ashr exact i64 %sub.ptr.sub.i21.i, %1
  %div.i.i = sdiv i64 %sub.ptr.div.i22.i, %1
  store i64 %div.i.i, ptr %2, align 8, !alias.scope !91
  ret i64 %div.i.i
}

define float @"188"(ptr %scores, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %scores, align 8, !tbaa !20
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !34
  %n.mod.vf = and i64 %3, %1
  %4 = and i64 %3, %0
  %n.vec = sub nsw i64 %4, %n.mod.vf
  %arrayidx.i.prol = getelementptr inbounds float, ptr %2, i64 %n.vec
  %5 = load float, ptr %arrayidx.i.prol, align 4, !tbaa !22
  ret float %5
}

define ptr @"189"(ptr %out_index_.i, ptr %add.ptr) {
bb:
  %0 = load ptr, ptr %out_index_.i, align 8, !tbaa !121, !noalias !122, !llvm.access.group !31
  %1 = load i32, ptr %add.ptr, align 4, !tbaa !12, !llvm.access.group !31
  %idxprom.i6.i.i = sext i32 %1 to i64
  %arrayidx.i7.i.i = getelementptr inbounds ptr, ptr %0, i64 %idxprom.i6.i.i
  %2 = load ptr, ptr %arrayidx.i7.i.i, align 8, !tbaa !6, !llvm.access.group !31
  ret ptr %2
}

define <2 x i32> @"190"(ptr %degrees, ptr %.omp.lb, i64 %0, i64 %index, i64 %1) {
bb:
  %2 = load ptr, ptr %degrees, align 8, !tbaa !8
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %mul12 = shl i64 %3, %0
  %offset.idx = add i64 %mul12, %index
  %4 = getelementptr inbounds i32, ptr %2, i64 %offset.idx
  %5 = getelementptr inbounds i32, ptr %4, i64 %1
  %wide.load42 = load <2 x i32>, ptr %5, align 4, !tbaa !12
  ret <2 x i32> %wide.load42
}

define i32 @"191"(ptr %init_val, ptr %this, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %init_val, align 4, !tbaa !12
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %2 = load ptr, ptr %this, align 8, !tbaa !8
  %add.ptr.prol = getelementptr inbounds i32, ptr %2, i64 %1
  store i32 %0, ptr %add.ptr.prol, align 4, !tbaa !12
  ret i32 %0
}

define float @"192"(ptr %scores, ptr %num_nodes_.i, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !34
  %n.mod.vf = and i64 %3, %1
  %4 = and i64 %3, %0
  %n.vec = sub nsw i64 %4, %n.mod.vf
  %indvars.iv.next = add nuw nsw i64 %n.vec, %2
  %5 = load ptr, ptr %scores, align 8, !tbaa !20
  %arrayidx.i.1 = getelementptr inbounds float, ptr %5, i64 %indvars.iv.next
  %6 = load float, ptr %arrayidx.i.1, align 4, !tbaa !22
  ret float %6
}

define ptr @"193"(ptr %out_index_.i, ptr %add.ptr, i32 %0) {
bb:
  %1 = load i32, ptr %add.ptr, align 4, !tbaa !12, !llvm.access.group !31
  %add.i.i.i = add nsw i32 %1, %0
  %idxprom.i.i.i = sext i32 %add.i.i.i to i64
  %2 = load ptr, ptr %out_index_.i, align 8, !tbaa !121, !noalias !122, !llvm.access.group !31
  %arrayidx.i.i.i = getelementptr inbounds ptr, ptr %2, i64 %idxprom.i.i.i
  %3 = load ptr, ptr %arrayidx.i.i.i, align 8, !tbaa !6, !llvm.access.group !31
  ret ptr %3
}

define ptr @"194"(ptr %cond.i31.i.i.i, i64 %.sroa.speculated.i.i.i.i, ptr %_M_finish.i.i, ptr %depth_index, i64 %0, i64 %sub.ptr.div.i.i.i.i.i, i1 %cmp9.i.i.i.i, i64 %1, i64 %add.i.i.i.i, ptr %_M_end_of_storage.i.i) {
bb:
  %2 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !6
  %sub.ptr.lhs.cast.i.i.i.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %depth_index, align 8, !tbaa !6
  %sub.ptr.rhs.cast.i.i.i.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i2 = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, %0
  %add.i.i.i.i4 = add i64 %.sroa.speculated.i.i.i.i, %sub.ptr.div.i.i.i.i.i
  %cmp7.i.i.i.i = icmp ult i64 %add.i.i.i.i, %sub.ptr.div.i.i.i.i.i
  %or.cond.i.i.i.i = or i1 %cmp7.i.i.i.i, %cmp9.i.i.i.i
  %cond.i.i.i.i = select i1 %or.cond.i.i.i.i, i64 %1, i64 %add.i.i.i.i
  %add.ptr19.i.i.i = getelementptr inbounds ptr, ptr %cond.i31.i.i.i, i64 %cond.i.i.i.i
  store ptr %add.ptr19.i.i.i, ptr %_M_end_of_storage.i.i, align 8, !tbaa !125
  ret ptr %add.ptr19.i.i.i
}

define i32 @"195"(ptr %diffs, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %diffs, align 8, !tbaa !8
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %2 = sext i32 %1 to i64
  %arrayidx.i44 = getelementptr inbounds i32, ptr %0, i64 %2
  %3 = load i32, ptr %arrayidx.i44, align 4, !tbaa !12
  ret i32 %3
}

define i64 @"196"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !73
  %inc.i71 = add nuw nsw i64 %1, %0
  %inc.i64 = add nuw nsw i64 %inc.i71, %0
  store i64 %inc.i64, ptr %_M_p.i.i.i, align 8, !tbaa !73
  ret i64 %inc.i64
}

define ptr @"197"(ptr %out_index_.i, ptr %arrayidx.i7, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i, i64 %4, i64 %5, i64 %xor4.i, i64 %6, ptr %mod_.i) {
bb:
  %7 = load ptr, ptr %out_index_.i, align 8, !tbaa !121
  %8 = load i32, ptr %mod_.i, align 4, !tbaa !126
  %9 = load i64, ptr %arrayidx.i7, align 8, !tbaa !10
  %shr.i = lshr i64 %9, %0
  %and.i = and i64 %shr.i, %1
  %xor.i2 = xor i64 %and.i, %9
  %shl.i = shl i64 %xor.i, %2
  %and3.i = and i64 %shl.i, %3
  %xor4.i4 = xor i64 %and3.i, %xor.i
  %shl5.i = shl i64 %xor4.i, %4
  %and6.i = and i64 %shl5.i, %5
  %xor7.i = xor i64 %and6.i, %xor4.i
  %shr8.i = lshr i64 %xor7.i, %6
  %xor9.i = xor i64 %shr8.i, %xor4.i
  %conv7.i = trunc i64 %xor9.i to i32
  %rem.i = urem i32 %conv7.i, %8
  %idxprom3.i = sext i32 %rem.i to i64
  %arrayidx4.i = getelementptr inbounds ptr, ptr %7, i64 %idxprom3.i
  %10 = load ptr, ptr %arrayidx4.i, align 8, !tbaa !6
  ret ptr %10
}

define <4 x float> @"198"(ptr %scores, i64 %index, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %1 = sext i32 %0 to i64
  %offset.idx = add i64 %index, %1
  %2 = load ptr, ptr %scores, align 8, !tbaa !20
  %3 = getelementptr inbounds float, ptr %2, i64 %offset.idx
  %wide.load = load <4 x float>, ptr %3, align 4, !tbaa !22, !alias.scope !116, !noalias !119
  ret <4 x float> %wide.load
}

define <2 x i64> @"200"(ptr %0, <2 x i64> %1, <2 x i64> %vector.recur90, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %7) {
bb:
  %wide.load91 = load <2 x i64>, ptr %0, align 8, !tbaa !10
  %8 = shufflevector <2 x i64> %vector.recur90, <2 x i64> %wide.load91, <2 x i32> <i32 1, i32 2>
  %9 = and <2 x i64> %8, %2
  %10 = and <2 x i64> %wide.load91, %1
  %11 = or <2 x i64> %10, %9
  %12 = lshr exact <2 x i64> %11, %3
  %wide.load92 = load <2 x i64>, ptr %4, align 8, !tbaa !10
  %13 = xor <2 x i64> %12, %wide.load92
  %14 = and <2 x i64> %wide.load91, %3
  %15 = icmp eq <2 x i64> %14, %5
  %16 = select <2 x i1> %15, <2 x i64> %5, <2 x i64> %6
  %17 = xor <2 x i64> %13, %16
  store <2 x i64> %17, ptr %7, align 8, !tbaa !10
  ret <2 x i64> %17
}

define <2 x i64> @"201"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %.omp.lb, i64 %3, i64 %4, i64 %5, <2 x i64> %6, <2 x i64> %7, ptr %8, <2 x i64> %9, <2 x i64> %10, ptr %11) {
bb:
  %wide.load91 = load <2 x i64>, ptr %0, align 8, !tbaa !10
  %12 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %add8 = add i64 %12, %3
  %rem.i.i.i = and i64 %add8, %4
  %vector.recur.init89 = insertelement <2 x i64> %2, i64 %rem.i.i.i, i64 %5
  %13 = shufflevector <2 x i64> %vector.recur.init89, <2 x i64> %wide.load91, <2 x i32> <i32 1, i32 2>
  %14 = and <2 x i64> %13, %6
  %15 = and <2 x i64> %wide.load91, %1
  %16 = or <2 x i64> %15, %14
  %17 = lshr exact <2 x i64> %16, %7
  %wide.load92 = load <2 x i64>, ptr %8, align 8, !tbaa !10
  %18 = xor <2 x i64> %17, %wide.load92
  %19 = and <2 x i64> %wide.load91, %7
  %20 = icmp eq <2 x i64> %19, %9
  %21 = select <2 x i1> %20, <2 x i64> %9, <2 x i64> %10
  %22 = xor <2 x i64> %18, %21
  store <2 x i64> %22, ptr %11, align 8, !tbaa !10
  ret <2 x i64> %22
}

define i64 @"202"(ptr %__first.addr.033.i.i, ptr %new_range.i.i, i64 %0) {
bb:
  %1 = load ptr, ptr %new_range.i.i, align 8, !tbaa !6
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %0
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.033.i.i, align 4
  store i64 %agg.tmp.sroa.0.0.copyload.i.i.i, ptr %incdec.ptr13.i.i.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i8 @"203"(i8 %storemerge.i.i, ptr %agg.tmp11, ptr %num_iters_, i32 %0) {
bb:
  %1 = load i32, ptr %num_iters_, align 4, !tbaa !107
  %__val.lobit.i = lshr i32 %1, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %2 = load ptr, ptr %agg.tmp11, align 8, !tbaa !25, !alias.scope !104
  %arrayidx.i.i = getelementptr inbounds i8, ptr %2, i64 %conv5.i
  store i8 %storemerge.i.i, ptr %arrayidx.i.i, align 1, !tbaa !59
  ret i8 %storemerge.i.i
}

define i64 @"204"(ptr %num_edges_, i64 %0, i64 %1, i64 %2, ptr %.omp.ub) {
bb:
  %3 = load i64, ptr %num_edges_, align 8, !tbaa !127
  %sub3 = add nuw i64 %3, %0
  %div36 = lshr i64 %sub3, %1
  %sub4 = add nsw i64 %div36, %2
  store i64 %sub4, ptr %.omp.ub, align 8, !tbaa !10
  ret i64 %sub4
}

define i32 @"205"(ptr %arrayidx.i399, i32 %0, ptr %depths, ptr %__begin3.0814) {
bb:
  %.pre = load ptr, ptr %depths, align 8, !tbaa !8
  %1 = load i32, ptr %__begin3.0814, align 4, !tbaa !12
  %conv34 = sext i32 %1 to i64
  %arrayidx.i398 = getelementptr inbounds i32, ptr %.pre, i64 %conv34
  %2 = load i32, ptr %arrayidx.i399, align 4, !tbaa !12
  %add = add nsw i32 %2, %0
  store i32 %add, ptr %arrayidx.i398, align 4, !tbaa !12
  ret i32 %add
}

define float @"206"(float %delta_u.0.lcssa, ptr %arrayidx.i64, ptr %scores, ptr %add.ptr) {
bb:
  %0 = load float, ptr %arrayidx.i64, align 4, !tbaa !22, !llvm.access.group !128
  %add38 = fadd float %delta_u.0.lcssa, %0
  %1 = load i32, ptr %add.ptr, align 4, !tbaa !12, !llvm.access.group !128
  %idxprom.i6.i.i = sext i32 %1 to i64
  %2 = load ptr, ptr %scores, align 8, !tbaa !20, !llvm.access.group !128
  %arrayidx.i642 = getelementptr inbounds float, ptr %2, i64 %idxprom.i6.i.i
  store float %add38, ptr %arrayidx.i64, align 4, !tbaa !22, !llvm.access.group !128
  ret float %add38
}

define ptr @"207"(ptr %call.i132133, ptr %num_nodes, i64 %0, ptr %end_size_.i) {
bb:
  %1 = load i64, ptr %num_nodes, align 8, !tbaa !10
  %add = add nsw i64 %1, %0
  %add.ptr.i = getelementptr inbounds i64, ptr %call.i132133, i64 %add
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !54
  ret ptr %add.ptr.i
}

define float @"208"(ptr %scores, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %scores, align 8, !tbaa !20
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %3 = sext i32 %2 to i64
  %indvars.iv.next = add nsw i64 %3, %0
  %arrayidx.i.1 = getelementptr inbounds float, ptr %1, i64 %indvars.iv.next
  %4 = load float, ptr %arrayidx.i.1, align 4
  ret float %4
}

define i64 @"209"(ptr %shared_in.i, i64 %0, ptr %shared_out_end.i) {
bb:
  %1 = load i64, ptr %shared_in.i, align 8, !tbaa !81
  %inc.i = add i64 %1, %0
  store i64 %inc.i, ptr %shared_out_end.i, align 8, !tbaa !82
  ret i64 %inc.i
}

define i64 @"210"(ptr %el) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %agg.tmp.sroa.0.0.copyload.i.i.i.i.i = load i64, ptr %.pre, align 4, !tbaa.struct !19
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i.i.i
}

define i64 @"211"(ptr %max_seen.i, i32 %0, ptr %num_nodes_) {
bb:
  %1 = load i32, ptr %max_seen.i, align 4, !tbaa !12
  %add = add nsw i32 %1, %0
  %conv = sext i32 %add to i64
  store i64 %conv, ptr %num_nodes_, align 8, !tbaa !87
  ret i64 %conv
}

define i32 @"212"(i32 %0, ptr %cond.i31.i.i491, ptr %_M_finish.i468, ptr %add.ptr.i467, i64 %1) {
bb:
  %2 = load ptr, ptr %_M_finish.i468, align 8, !tbaa !6
  %sub.ptr.lhs.cast.i.i.i.i475 = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %add.ptr.i467, align 8, !tbaa !6
  %sub.ptr.rhs.cast.i.i.i.i476 = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i.i.i.i477 = sub i64 %sub.ptr.lhs.cast.i.i.i.i475, %sub.ptr.rhs.cast.i.i.i.i476
  %sub.ptr.div.i.i.i.i480 = ashr exact i64 %sub.ptr.sub.i.i.i.i477, %1
  %add.ptr.i.i492 = getelementptr inbounds i32, ptr %cond.i31.i.i491, i64 %sub.ptr.div.i.i.i.i480
  store i32 %0, ptr %add.ptr.i.i492, align 4, !tbaa !12
  ret i32 %0
}

define <4 x float> @"213"(ptr %0, <4 x float> %1, ptr %retval.0.i.i, i64 %2, ptr %scores, i64 %index) {
bb:
  %3 = load ptr, ptr %scores, align 8, !tbaa !20
  %4 = getelementptr inbounds float, ptr %3, i64 %index
  %wide.load = load <4 x float>, ptr %0, align 4, !tbaa !22
  %5 = load float, ptr %retval.0.i.i, align 4, !tbaa !22
  %broadcast.splatinsert = insertelement <4 x float> %1, float %5, i64 %2
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> %1, <4 x i32> zeroinitializer
  %6 = fdiv <4 x float> %wide.load, %broadcast.splat
  store <4 x float> %6, ptr %0, align 4, !tbaa !22
  ret <4 x float> %6
}

define float @"214"(ptr %scores, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %2 = sext i32 %1 to i64
  %indvars.iv.next = add nsw i64 %2, %0
  %3 = load ptr, ptr %scores, align 8, !tbaa !20
  %arrayidx.i.1 = getelementptr inbounds float, ptr %3, i64 %indvars.iv.next
  %4 = load float, ptr %arrayidx.i.1, align 4, !tbaa !22
  ret float %4
}

define i32 @"215"(ptr %__first.addr.033.i.i, ptr %n_start.0.in, i64 %0) {
bb:
  %1 = load i32, ptr %__first.addr.033.i.i, align 4, !tbaa !12
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !6
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  store i32 %1, ptr %incdec.ptr12.i.i.i.i, align 4, !tbaa !12
  ret i32 %1
}

define i32 @"216"(ptr %end_size_.i, ptr %offsets, i64 %0, ptr %length.i136) {
bb:
  %1 = load ptr, ptr %end_size_.i, align 8, !tbaa !54
  %sub.ptr.lhs.cast.i.i139 = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %offsets, align 8, !tbaa !43
  %sub.ptr.rhs.cast.i.i140 = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i141 = sub i64 %sub.ptr.lhs.cast.i.i139, %sub.ptr.rhs.cast.i.i140
  %3 = lshr exact i64 %sub.ptr.sub.i.i141, %0
  %conv.i142 = trunc i64 %3 to i32
  store i32 %conv.i142, ptr %length.i136, align 4, !tbaa !12
  ret i32 %conv.i142
}

define i32 @"217"(ptr %num_nodes_.i.i, i32 %0, i64 %1, i64 %2, i32 %3, i32 %conv14.i.i, ptr %4) {
bb:
  %5 = load i64, ptr %num_nodes_.i.i, align 8, !tbaa !34
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

define ptr @"218"(ptr %cond.i31.i.i491, ptr %verts_at_depth.sroa.0.5, ptr %arrayidx.i466) {
bb:
  %0 = load i32, ptr %arrayidx.i466, align 4, !tbaa !12
  %conv98 = sext i32 %0 to i64
  %add.ptr.i467 = getelementptr inbounds %"class.std::vector.26", ptr %verts_at_depth.sroa.0.5, i64 %conv98
  store ptr %cond.i31.i.i491, ptr %add.ptr.i467, align 8, !tbaa !57
  ret ptr %cond.i31.i.i491
}

define i32 @"219"(ptr %num_nodes_.i, i64 %0, i64 %1, ptr %add.ptr.i.prol) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !34
  %n.mod.vf = and i64 %2, %1
  %3 = and i64 %2, %0
  %n.vec = sub nsw i64 %3, %n.mod.vf
  %4 = trunc i64 %n.vec to i32
  store i32 %4, ptr %add.ptr.i.prol, align 4, !tbaa !129
  ret i32 %4
}

define i32 @"220"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i32, ptr %init_val, align 4, !tbaa !12
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %add7 = add i64 %2, %0
  %3 = load ptr, ptr %this, align 8, !tbaa !8
  %add.ptr.1 = getelementptr inbounds i32, ptr %3, i64 %add7
  store i32 %1, ptr %add.ptr.1, align 4, !tbaa !12
  ret i32 %1
}

define i8 @"221"(ptr %arrayidx17.i.i, ptr %agg.tmp11, ptr %num_iters_, i32 %0) {
bb:
  %1 = load i8, ptr %arrayidx17.i.i, align 2, !tbaa !59, !noalias !104
  %2 = load ptr, ptr %agg.tmp11, align 8, !tbaa !25, !alias.scope !104
  %3 = load i32, ptr %num_iters_, align 4, !tbaa !107
  %__val.lobit.i = lshr i32 %3, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %arrayidx.i.i = getelementptr inbounds i8, ptr %2, i64 %conv5.i
  store i8 %1, ptr %arrayidx.i.i, align 1, !tbaa !59
  ret i8 %1
}

define i64 @"222"(ptr %add.ptr.i.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, ptr %v.i.i.i.i.i.i, ptr %v3.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0) {
bb:
  %1 = load i32, ptr %v.i.i.i.i.i.i, align 4
  %2 = load i32, ptr %v3.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i = icmp slt i32 %1, %2
  %3 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !55
  %4 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !55
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

define i32 @"223"(ptr %add.ptr.i.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0) {
bb:
  %1 = load i32, ptr %add.ptr.i.i.i.i.i, align 4, !tbaa !12
  %2 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !12
  %3 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !12
  %cmp.i.i.i.i.i = icmp slt i32 %3, %2
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %add.ptr2.i.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %sub12.i.i.i.i
  store i32 %1, ptr %add.ptr2.i.i.i.i.i, align 4, !tbaa !12
  ret i32 %1
}

define i64 @"224"(ptr %end_size_, ptr %this, i64 %0, i64 %1, ptr %.omp.ub) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !8
  %sub.ptr.rhs.cast = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %end_size_, align 8, !tbaa !45
  %sub.ptr.lhs.cast = ptrtoint ptr %3 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %sub = add nsw i64 %sub.ptr.div, %1
  store i64 %sub, ptr %.omp.ub, align 8, !tbaa !10
  ret i64 %sub
}

define i64 @"225"(ptr %el, i64 %0, i64 %1) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr13.i.i.i.i, i64 %1
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.030.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i32 @"226"(ptr %degrees, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %degrees, align 8, !tbaa !8
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %mul14 = shl i64 %2, %0
  %arrayidx.i36 = getelementptr inbounds i32, ptr %1, i64 %mul14
  %3 = load i32, ptr %arrayidx.i36, align 4, !tbaa !12
  ret i32 %3
}

define i64 @"227"(ptr %_M_p, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p, align 8, !tbaa !65
  %inc = add nuw nsw i64 %1, %0
  store i64 %inc, ptr %_M_p, align 8, !tbaa !65
  ret i64 %inc
}

define i64 @"228"(ptr %__begin0.sroa.0.059, i64 %0, ptr %.sroa_idx, ptr %_M_finish.i38, i64 %1) {
bb:
  %2 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !89
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %2, i64 %1
  %3 = load i32, ptr %.sroa_idx, align 4
  %retval.sroa.0.0.insert.ext.i = zext i32 %3 to i64
  %4 = load i32, ptr %__begin0.sroa.0.059, align 4
  %retval.sroa.2.0.insert.ext.i = zext i32 %4 to i64
  %retval.sroa.2.0.insert.shift.i = shl nuw i64 %retval.sroa.2.0.insert.ext.i, %0
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i
  store i64 %retval.sroa.0.0.insert.insert.i, ptr %incdec.ptr.i.i, align 4
  ret i64 %retval.sroa.0.0.insert.insert.i
}

define float @"229"(i1 %cmp.i.i.i, ptr %incdec.ptr14.i.i, float %0, ptr %scores, i64 %1) {
bb:
  %2 = load ptr, ptr %scores, align 8, !tbaa !20
  %incdec.ptr11.i.i = getelementptr inbounds float, ptr %2, i64 %1
  %3 = load float, ptr %incdec.ptr14.i.i, align 4, !tbaa !22
  %4 = select i1 %cmp.i.i.i, float %3, float %0
  %cmp.i.i.i2 = fcmp olt float %4, %3
  %spec.select.i.i = select i1 %cmp.i.i.i, ptr %incdec.ptr11.i.i, ptr %2
  %5 = load float, ptr %spec.select.i.i, align 4, !tbaa !22
  ret float %5
}

define ptr @"230"(ptr %cond.i31.i.i.i, i64 %.sroa.speculated.i.i.i.i, ptr %_M_finish.i38, i64 %0, i64 %sub.ptr.rhs.cast.i, i64 %1, i64 %sub.ptr.div.i, i1 %cmp9.i.i.i.i, i64 %2, i64 %add.i.i.i.i, ptr %_M_end_of_storage.i.i) {
bb:
  %3 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !89
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %3, i64 %0
  %sub.ptr.lhs.cast.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i2 = ashr exact i64 %sub.ptr.sub.i, %1
  %add.i.i.i.i4 = add i64 %.sroa.speculated.i.i.i.i, %sub.ptr.div.i
  %cmp7.i.i.i.i = icmp ult i64 %add.i.i.i.i, %sub.ptr.div.i
  %or.cond.i.i.i.i = or i1 %cmp7.i.i.i.i, %cmp9.i.i.i.i
  %cond.i.i.i.i = select i1 %or.cond.i.i.i.i, i64 %2, i64 %add.i.i.i.i
  %add.ptr19.i.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %cond.i31.i.i.i, i64 %cond.i.i.i.i
  store ptr %add.ptr19.i.i.i, ptr %_M_end_of_storage.i.i, align 8, !tbaa !130
  ret ptr %add.ptr19.i.i.i
}

define i32 @"231"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i32, ptr %init_val, align 4, !tbaa !12
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add7 = add i64 %ind.end, %2
  %6 = load ptr, ptr %this, align 8, !tbaa !8
  %add.ptr.1 = getelementptr inbounds i32, ptr %6, i64 %add7
  store i32 %3, ptr %add.ptr.1, align 4, !tbaa !12
  ret i32 %3
}

define i64 @"232"(ptr %__begin0.sroa.0.059, i64 %0, ptr %.sroa_idx, ptr %add.ptr.i.i.i) {
bb:
  %1 = load i32, ptr %__begin0.sroa.0.059, align 4
  %retval.sroa.2.0.insert.ext.i = zext i32 %1 to i64
  %retval.sroa.2.0.insert.shift.i = shl nuw i64 %retval.sroa.2.0.insert.ext.i, %0
  %2 = load i32, ptr %.sroa_idx, align 4
  %retval.sroa.0.0.insert.ext.i = zext i32 %2 to i64
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i
  store i64 %retval.sroa.0.0.insert.insert.i, ptr %add.ptr.i.i.i, align 4
  ret i64 %retval.sroa.0.0.insert.insert.i
}

define ptr @"233"(ptr %new_range.i.i457, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !18
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !6
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !16
  ret ptr %add.ptr.i464
}

define <8 x i32> @"234"(ptr %el, ptr %.omp.lb, i64 %index) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %offset.idx = add i64 %0, %index
  %1 = load ptr, ptr %el, align 8, !tbaa !18
  %2 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %offset.idx
  %wide.vec = load <8 x i32>, ptr %2, align 4
  ret <8 x i32> %wide.vec
}

define i64 @"235"(ptr %arrayidx.i58, ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, i64 %add7, ptr %arrayidx.i57.1) {
bb:
  %0 = load i64, ptr %arrayidx.i58, align 8, !tbaa !10
  %1 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !10
  %2 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !10
  %3 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !10
  %add7.1 = add nsw i64 %3, %add7
  %add7.2 = add nsw i64 %2, %add7.1
  %add7.3 = add nsw i64 %1, %add7.2
  %add72 = add nsw i64 %0, %add7.3
  store i64 %add7, ptr %arrayidx.i57.1, align 8, !tbaa !10
  ret i64 %add7
}

define float @"236"(ptr %scores, i32 %cond, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %scores, align 8, !tbaa !20
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %5 = sub i32 %cond, %4
  %6 = zext i32 %5 to i64
  %7 = add nuw nsw i64 %6, %0
  %n.vec = and i64 %7, %1
  %ind.end = add nsw i64 %n.vec, %2
  %arrayidx.i.prol = getelementptr inbounds float, ptr %3, i64 %ind.end
  %8 = load float, ptr %arrayidx.i.prol, align 4, !tbaa !22
  ret float %8
}

define i64 @"237"(ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !87
  %n.mod.vf = and i64 %2, %0
  %sub.prol = add nuw i64 %n.mod.vf, %1
  %conv34.prol = and i64 %sub.prol, %1
  %3 = load ptr, ptr %offsets, align 8
  %arrayidx.i492.prol = getelementptr inbounds i64, ptr %3, i64 %conv34.prol
  %4 = load i64, ptr %arrayidx.i492.prol, align 8, !tbaa !10
  ret i64 %4
}

define ptr @"238"(ptr %call.i5155, ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, ptr %end_size_.i53) {
bb:
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast.i47 = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %degrees, align 8, !tbaa !8
  %sub.ptr.rhs.cast.i48 = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i49 = sub i64 %sub.ptr.lhs.cast.i47, %sub.ptr.rhs.cast.i48
  %sub.ptr.div.i50 = ashr exact i64 %sub.ptr.sub.i49, %0
  %add13 = add nsw i64 %sub.ptr.div.i50, %1
  %add.ptr.i52 = getelementptr inbounds i64, ptr %call.i5155, i64 %add13
  store ptr %add.ptr.i52, ptr %end_size_.i53, align 8, !tbaa !54
  ret ptr %add.ptr.i52
}

define i32 @"239"(ptr %num_nodes_.i, i64 %0, i64 %1, i64 %2, ptr %add.ptr.i.1) {
bb:
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !34
  %n.mod.vf = and i64 %3, %1
  %4 = and i64 %3, %0
  %n.vec = sub nsw i64 %4, %n.mod.vf
  %indvars.iv.next = add nuw nsw i64 %n.vec, %2
  %5 = trunc i64 %indvars.iv.next to i32
  store i32 %5, ptr %add.ptr.i.1, align 4, !tbaa !129
  ret i32 %5
}

define i32 @"240"(ptr %init_val, ptr %this, i64 %.omp.iv.018) {
bb:
  %0 = load i32, ptr %init_val, align 4, !tbaa !12
  %1 = load ptr, ptr %this, align 8, !tbaa !8
  %add.ptr = getelementptr inbounds i32, ptr %1, i64 %.omp.iv.018
  store i32 %0, ptr %add.ptr, align 4, !tbaa !12
  ret i32 %0
}

define <4 x i32> @"241"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.0649, ptr %arrayidx.i536, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !10
  %3 = add i64 %2, %0
  %4 = load i32, ptr %arrayidx.i536, align 4, !tbaa !12
  %conv155 = sext i32 %4 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %5 = sub nsw i64 %3, %add156
  %6 = getelementptr inbounds i32, ptr %call171, i64 %5
  %7 = getelementptr inbounds i32, ptr %6, i64 %1
  %wide.load803 = load <4 x i32>, ptr %7, align 4, !tbaa !12
  ret <4 x i32> %wide.load803
}

define ptr @"242"(ptr %out_index.i, ptr %num_nodes_.i) {
bb:
  %0 = load i64, ptr %num_nodes_.i, align 8, !tbaa !34, !noalias !91
  %1 = load ptr, ptr %out_index.i, align 8, !tbaa !6, !noalias !91
  %arrayidx.i.i = getelementptr inbounds ptr, ptr %1, i64 %0
  %2 = load ptr, ptr %arrayidx.i.i, align 8, !tbaa !6, !noalias !91
  ret ptr %2
}

define <2 x i32> @"243"(ptr %degrees, i64 %offset.idx) {
bb:
  %0 = load ptr, ptr %degrees, align 8, !tbaa !8
  %1 = getelementptr inbounds i32, ptr %0, i64 %offset.idx
  %wide.load = load <2 x i32>, ptr %1, align 4, !tbaa !12
  ret <2 x i32> %wide.load
}

define i64 @"244"(i64 %0, ptr %offsets, ptr %num_nodes_.i, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !87
  %n.mod.vf = and i64 %2, %1
  %3 = load ptr, ptr %offsets, align 8
  %arrayidx.i493734 = getelementptr inbounds i64, ptr %3, i64 %n.mod.vf
  store i64 %0, ptr %arrayidx.i493734, align 8, !tbaa !10
  ret i64 %0
}

define float @"245"(ptr %scores, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !34
  %n.mod.vf = and i64 %2, %1
  %3 = and i64 %2, %0
  %n.vec = sub nsw i64 %3, %n.mod.vf
  %4 = load ptr, ptr %scores, align 8, !tbaa !20
  %arrayidx.i = getelementptr inbounds float, ptr %4, i64 %n.vec
  %5 = load float, ptr %arrayidx.i, align 4, !tbaa !22
  ret float %5
}

define i64 @"246"(ptr %offsets, ptr %num_nodes_.i, i32 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !87
  %2 = trunc i64 %1 to i32
  %n184.0657 = add i32 %2, %0
  %3 = zext i32 %n184.0657 to i64
  %4 = load ptr, ptr %offsets, align 8, !tbaa !43
  %arrayidx.i540 = getelementptr inbounds i64, ptr %4, i64 %3
  %5 = load i64, ptr %arrayidx.i540, align 8, !tbaa !10
  ret i64 %5
}

define i64 @"247"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %end_size_.i.i) {
bb:
  %2 = load i32, ptr %v, align 4, !tbaa !14
  %sub = add nsw i32 %2, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  %3 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !16
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %3, align 4, !tbaa.struct !19
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define ptr @"248"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, ptr %.omp.lb) {
bb:
  %1 = load i8, ptr %transpose, align 1, !tbaa !0, !range !4, !noundef !5
  %tobool.not = icmp eq i8 %1, %0
  %2 = load ptr, ptr %in_index_.i, align 8
  %3 = load ptr, ptr %out_index_.i, align 8
  %.pn = select i1 %tobool.not, ptr %3, ptr %2
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %5 = sext i32 %4 to i64
  %n_start.0.in = getelementptr inbounds ptr, ptr %.pn, i64 %5
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !6
  ret ptr %n_start.0
}

define i64 @"249"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %2) {
bb:
  %3 = load i32, ptr %v, align 4, !tbaa !14
  %sub = add nsw i32 %3, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %2, align 4, !tbaa.struct !19
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i64 @"250"(ptr %this, i64 %0, ptr %_M_p) {
bb:
  %1 = load i64, ptr %_M_p, align 8, !tbaa !65
  %arrayidx = getelementptr inbounds [312 x i64], ptr %this, i64 %0, i64 %1
  %2 = load i64, ptr %arrayidx, align 8, !tbaa !10
  ret i64 %2
}

define i32 @"251"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %5 = load ptr, ptr %el, align 8, !tbaa !18
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %ind.end
  %add.ptr.sroa_idx.prol = getelementptr inbounds i8, ptr %add.ptr.prol, i64 %2
  %6 = load i32, ptr %add.ptr.sroa_idx.prol, align 4
  ret i32 %6
}

define i32 @"252"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %el, align 8, !tbaa !18
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add15 = add i64 %ind.end, %2
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %add15
  %6 = load i32, ptr %add.ptr.1, align 4
  ret i32 %6
}

define i32 @"253"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !18
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %ind.end
  %5 = load i32, ptr %add.ptr, align 4
  ret i32 %5
}

define float @"254"(ptr %arrayidx.i.1, ptr %biggest_score, ptr %scores, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %2 = sext i32 %1 to i64
  %indvars.iv.next = add nsw i64 %2, %0
  %3 = load ptr, ptr %scores, align 8, !tbaa !20
  %arrayidx.i.12 = getelementptr inbounds float, ptr %3, i64 %indvars.iv.next
  %4 = load float, ptr %biggest_score, align 4, !tbaa !22
  %5 = load float, ptr %arrayidx.i.1, align 4, !tbaa !22
  %div9.1 = fdiv float %5, %4
  store float %div9.1, ptr %arrayidx.i.1, align 4, !tbaa !22
  ret float %div9.1
}

define float @"255"(float %delta_u.0.lcssa, ptr %deltas, ptr %add.ptr) {
bb:
  %0 = load ptr, ptr %deltas, align 8, !tbaa !20, !llvm.access.group !128
  %1 = load i32, ptr %add.ptr, align 4, !tbaa !12, !llvm.access.group !128
  %idxprom.i6.i.i = sext i32 %1 to i64
  %arrayidx.i63 = getelementptr inbounds float, ptr %0, i64 %idxprom.i6.i.i
  store float %delta_u.0.lcssa, ptr %arrayidx.i63, align 4, !tbaa !22, !llvm.access.group !128
  ret float %delta_u.0.lcssa
}

define float @"256"(ptr %arrayidx.i547, ptr %arrayidx.i548, ptr %scores, ptr %__begin3122.sroa.0.0831) {
bb:
  %0 = load float, ptr %arrayidx.i547, align 4, !tbaa !22
  %1 = load float, ptr %arrayidx.i548, align 4, !tbaa !22
  %add172 = fadd float %0, %1
  %2 = load ptr, ptr %scores, align 8
  %3 = load i32, ptr %__begin3122.sroa.0.0831, align 4, !tbaa !12
  %idxprom.i6.i.i532 = sext i32 %3 to i64
  %arrayidx.i5482 = getelementptr inbounds float, ptr %2, i64 %idxprom.i6.i.i532
  store float %add172, ptr %arrayidx.i548, align 4, !tbaa !22
  ret float %add172
}

define ptr @"257"(ptr %neighs, ptr %arrayidx.i, ptr %index, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %neighs, align 8, !tbaa !6
  %1 = load i64, ptr %arrayidx.i, align 8, !tbaa !10
  %add.ptr = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load ptr, ptr %index, align 8, !tbaa !6
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %4 = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds ptr, ptr %2, i64 %4
  store ptr %add.ptr, ptr %arrayidx, align 8, !tbaa !6
  ret ptr %add.ptr
}

define ptr @"258"(ptr %queue, ptr %shared_out_start.i, ptr %cond.i31.i.i.i, ptr %_M_finish.i.i, ptr %depth_index, i64 %0) {
bb:
  %1 = load i64, ptr %shared_out_start.i, align 8, !tbaa !28
  %2 = load ptr, ptr %queue, align 8, !tbaa !30
  %add.ptr.i = getelementptr inbounds i32, ptr %2, i64 %1
  %3 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !6
  %sub.ptr.lhs.cast.i.i.i.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %depth_index, align 8, !tbaa !6
  %sub.ptr.rhs.cast.i.i.i.i.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, %0
  %add.ptr.i.i.i = getelementptr inbounds ptr, ptr %cond.i31.i.i.i, i64 %sub.ptr.div.i.i.i.i.i
  store ptr %add.ptr.i, ptr %add.ptr.i.i.i, align 8, !tbaa !6
  ret ptr %add.ptr.i
}

define ptr @"259"(ptr %out_index_.i, ptr %arrayidx.i7, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i, i64 %4, i64 %5, i64 %xor4.i, i64 %6, ptr %mod_.i, i32 %7) {
bb:
  %8 = load ptr, ptr %out_index_.i, align 8, !tbaa !121
  %9 = load i32, ptr %mod_.i, align 4, !tbaa !126
  %10 = load i64, ptr %arrayidx.i7, align 8, !tbaa !10
  %shr.i = lshr i64 %10, %0
  %and.i = and i64 %shr.i, %1
  %xor.i2 = xor i64 %and.i, %10
  %shl.i = shl i64 %xor.i, %2
  %and3.i = and i64 %shl.i, %3
  %xor4.i4 = xor i64 %and3.i, %xor.i
  %shl5.i = shl i64 %xor4.i, %4
  %and6.i = and i64 %shl5.i, %5
  %xor7.i = xor i64 %and6.i, %xor4.i
  %shr8.i = lshr i64 %xor7.i, %6
  %xor9.i = xor i64 %shr8.i, %xor4.i
  %conv7.i = trunc i64 %xor9.i to i32
  %rem.i = urem i32 %conv7.i, %9
  %add.i = add nsw i32 %rem.i, %7
  %idxprom.i = sext i32 %add.i to i64
  %arrayidx.i = getelementptr inbounds ptr, ptr %8, i64 %idxprom.i
  %11 = load ptr, ptr %arrayidx.i, align 8, !tbaa !6
  ret ptr %11
}

define ptr @"260"(ptr %el, ptr %0, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !18
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !16
  ret ptr %add.ptr.i464
}

define i64 @"261"(ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, i64 %2, ptr %num_blocks) {
bb:
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %degrees, align 8, !tbaa !8
  %sub.ptr.rhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %sub = add nsw i64 %sub.ptr.div.i, %1
  %div38 = lshr i64 %sub, %2
  store i64 %div38, ptr %num_blocks, align 8, !tbaa !10
  ret i64 %div38
}

define i64 @"262"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57) {
bb:
  %0 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !10
  %1 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !10
  %2 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !10
  %3 = load i64, ptr %arrayidx.i58, align 8, !tbaa !10
  %add7 = add nsw i64 %3, %total.076
  %add7.1 = add nsw i64 %2, %add7
  %add7.2 = add nsw i64 %1, %add7.1
  %add7.3 = add nsw i64 %0, %add7.2
  store i64 %add7.3, ptr %arrayidx.i57, align 8, !tbaa !10
  ret i64 %add7.3
}

define i64 @"263"(ptr %add.ptr3.i.i.i, ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i32, ptr %v.i.i.i.i.i, align 4
  %1 = load i32, ptr %v3.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %0, %1
  %2 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !55
  %3 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !55
  %cmp.i.i.i.i.i = icmp eq i32 %3, %2
  %cmp7.i.i.i.i.i = icmp slt i32 %3, %2
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr4.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  %4 = load i64, ptr %add.ptr3.i.i.i, align 4
  store i64 %4, ptr %add.ptr4.i.i.i, align 4
  ret i64 %4
}

define i32 @"264"(ptr %e.sroa.5.0..sroa_idx, ptr %0, ptr %offsets, ptr %add.ptr, i64 %1) {
bb:
  %2 = load ptr, ptr %0, align 8, !tbaa !6
  %3 = load ptr, ptr %offsets, align 8, !tbaa !43
  %e.sroa.0.0.copyload = load i32, ptr %add.ptr, align 4, !tbaa.struct !19
  %conv = sext i32 %e.sroa.0.0.copyload to i64
  %arrayidx.i = getelementptr inbounds i64, ptr %3, i64 %conv
  %4 = atomicrmw add ptr %arrayidx.i, i64 %1 seq_cst, align 8
  %arrayidx = getelementptr inbounds i32, ptr %2, i64 %4
  %e.sroa.5.0.copyload = load i32, ptr %e.sroa.5.0..sroa_idx, align 4, !tbaa.struct !131
  store i32 %e.sroa.5.0.copyload, ptr %arrayidx, align 4, !tbaa !12
  ret i32 %e.sroa.5.0.copyload
}

define i32 @"265"(ptr %add.ptr3.i.i.i.i, ptr %add.ptr4.i.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr3.i.i.i.i, align 4, !tbaa !12
  store i32 %0, ptr %add.ptr4.i.i.i.i, align 4, !tbaa !12
  ret i32 %0
}

define i64 @"266"(ptr %new_range.i.i, i64 %0) {
bb:
  %1 = load ptr, ptr %new_range.i.i, align 8, !tbaa !6
  %incdec.ptr.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %0
  %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i = load i64, ptr %incdec.ptr.i.i.i.i, align 4, !tbaa.struct !19
  ret i64 %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i
}

define <8 x i32> @"267"(ptr %el, ptr %.omp.lb, i64 %index, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %offset.idx = add i64 %1, %index
  %2 = add i64 %offset.idx, %0
  %3 = load ptr, ptr %el, align 8, !tbaa !18
  %4 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %2
  %wide.vec44 = load <8 x i32>, ptr %4, align 4
  ret <8 x i32> %wide.vec44
}

define i32 @"269"(i32 %0, ptr %call171, ptr %arrayidx.i548, i64 %1, ptr %arrayidx.i549) {
bb:
  %2 = load i64, ptr %arrayidx.i548, align 8, !tbaa !10
  %add286 = add i64 %2, %1
  %3 = load i32, ptr %arrayidx.i549, align 4, !tbaa !12
  %idx.ext = sext i32 %3 to i64
  %sub287 = add i64 %add286, %idx.ext
  %arrayidx288 = getelementptr inbounds i32, ptr %call171, i64 %sub287
  store i32 %0, ptr %arrayidx288, align 4, !tbaa !12
  ret i32 %0
}

define ptr @"271"(ptr %new_range.i.i457, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !18
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %.pre.i.i476 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !6
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i476, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !24
  ret ptr %add.ptr6.i.i478
}

define i8 @"272"(ptr %0, ptr %opt_arg) {
bb:
  %1 = load i8, ptr %0, align 8, !tbaa !59
  %2 = load ptr, ptr %opt_arg, align 8, !tbaa !25
  store i8 %1, ptr %2, align 1, !tbaa !59
  ret i8 %1
}

define i32 @"273"(ptr %arrayidx.i399, i32 %0, ptr %depths, ptr %__begin3.0814) {
bb:
  %1 = load ptr, ptr %depths, align 8, !tbaa !8
  %2 = load i32, ptr %__begin3.0814, align 4, !tbaa !12
  %conv34 = sext i32 %2 to i64
  %arrayidx.i398 = getelementptr inbounds i32, ptr %1, i64 %conv34
  %3 = load i32, ptr %arrayidx.i399, align 4, !tbaa !12
  %add = add nsw i32 %3, %0
  store i32 %add, ptr %arrayidx.i398, align 4, !tbaa !12
  ret i32 %add
}

define <4 x i32> @"274"(ptr %0, ptr %call171, ptr %arrayidx.i539, i64 %1, i64 %index800, i64 %2) {
bb:
  %wide.load803 = load <4 x i32>, ptr %0, align 4, !tbaa !12
  %3 = load i64, ptr %arrayidx.i539, align 8, !tbaa !10
  %sub183 = add nsw i64 %3, %1
  %offset.idx801 = sub i64 %sub183, %index800
  %4 = getelementptr inbounds i32, ptr %call171, i64 %offset.idx801
  %5 = getelementptr inbounds i32, ptr %4, i64 %2
  store <4 x i32> %wide.load803, ptr %5, align 4, !tbaa !12
  ret <4 x i32> %wide.load803
}

define ptr @"275"(ptr %verts_at_depth.sroa.0.5, ptr %arrayidx.i466, i64 %0, i32 %1) {
bb:
  %2 = load i32, ptr %arrayidx.i466, align 4, !tbaa !12
  %conv98 = sext i32 %2 to i64
  %add.ptr.i467 = getelementptr inbounds %"class.std::vector.26", ptr %verts_at_depth.sroa.0.5, i64 %conv98
  %_M_finish.i468 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %add.ptr.i467, i64 %0, i32 1
  %3 = load ptr, ptr %_M_finish.i468, align 8, !tbaa !6
  ret ptr %3
}

define i64 @"276"(ptr %incdec.ptr126.i.i, ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr5.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %1 = load i64, ptr %incdec.ptr126.i.i, align 4
  store i64 %1, ptr %incdec.ptr5.i.i, align 4
  ret i64 %1
}

define <2 x i64> @"277"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %3, i64 %4, <2 x i64> %5, <2 x i64> %6, ptr %7, <2 x i64> %8, <2 x i64> %9, ptr %udist_, i64 %10, i64 %index15) {
bb:
  %wide.load19 = load <2 x i64>, ptr %7, align 8, !tbaa !10
  %.pre.i.i = load i64, ptr %3, align 8, !tbaa !10
  %vector.recur.init16 = insertelement <2 x i64> %2, i64 %.pre.i.i, i64 %4
  %wide.load18 = load <2 x i64>, ptr %0, align 8, !tbaa !10
  %11 = shufflevector <2 x i64> %vector.recur.init16, <2 x i64> %wide.load18, <2 x i32> <i32 1, i32 2>
  %12 = and <2 x i64> %11, %5
  %13 = and <2 x i64> %wide.load18, %1
  %14 = or <2 x i64> %13, %12
  %15 = lshr exact <2 x i64> %14, %6
  %16 = xor <2 x i64> %15, %wide.load19
  %17 = and <2 x i64> %wide.load18, %6
  %18 = icmp eq <2 x i64> %17, %8
  %19 = select <2 x i1> %18, <2 x i64> %8, <2 x i64> %9
  %20 = xor <2 x i64> %16, %19
  %21 = load ptr, ptr %udist_, align 8, !tbaa !63
  %22 = getelementptr inbounds [312 x i64], ptr %3, i64 %10, i64 %index15
  store <2 x i64> %20, ptr %22, align 8, !tbaa !10
  ret <2 x i64> %20
}

define i32 @"278"(ptr %num_nodes, i64 %0, ptr %length.i) {
bb:
  %1 = load i64, ptr %num_nodes, align 8, !tbaa !10
  %add = add nsw i64 %1, %0
  %conv.i = trunc i64 %add to i32
  store i32 %conv.i, ptr %length.i, align 4, !tbaa !12
  ret i32 %conv.i
}

define ptr @"279"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %2 = load ptr, ptr %new_range.i.i, align 8, !tbaa !6
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !16
  ret ptr %add.ptr.i
}

define i64 @"280"(ptr %arrayidx.i533, i64 %total_missing_inv.0.lcssa) {
bb:
  %0 = load i64, ptr %arrayidx.i533, align 8, !tbaa !10
  %add165 = add nsw i64 %0, %total_missing_inv.0.lcssa
  store i64 %add165, ptr %arrayidx.i533, align 8, !tbaa !10
  ret i64 %add165
}

define <4 x i32> @"281"(ptr %0, ptr %call171, i64 %tail_index.0660, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %1, i64 %index800, i64 %2) {
bb:
  %wide.load803 = load <4 x i32>, ptr %0, align 4, !tbaa !12
  %3 = load i64, ptr %arrayidx.i540, align 8, !tbaa !10
  %4 = load i32, ptr %arrayidx.i541, align 4, !tbaa !12
  %conv198 = sext i32 %4 to i64
  %add199 = add nsw i64 %3, %conv198
  %5 = load i64, ptr %arrayidx.i542, align 8, !tbaa !10
  %6 = sub i64 %5, %add199
  %n.vec793 = and i64 %6, %1
  %ind.end796 = sub i64 %tail_index.0660, %n.vec793
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !12
  %.pre731 = sext i32 %.pre717 to i64
  %sub226 = sub nsw i64 %ind.end796, %.pre731
  %offset.idx801 = sub i64 %sub226, %index800
  %7 = getelementptr inbounds i32, ptr %call171, i64 %offset.idx801
  %8 = getelementptr inbounds i32, ptr %7, i64 %2
  store <4 x i32> %wide.load803, ptr %8, align 4, !tbaa !12
  ret <4 x i32> %wide.load803
}

define float @"282"(ptr %scores, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %scores, align 8, !tbaa !20
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %2 = sext i32 %1 to i64
  %arrayidx.i = getelementptr inbounds float, ptr %0, i64 %2
  %3 = load float, ptr %arrayidx.i, align 4, !tbaa !22
  ret float %3
}

define ptr @"283"(ptr %el, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %.pre709 = load ptr, ptr %end_size_.i, align 8, !tbaa !16
  %sub.ptr.lhs.cast = ptrtoint ptr %.pre709 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !16
  ret ptr %add.ptr.i
}

define i32 @"284"(ptr %depths, ptr %__begin3.0814) {
bb:
  %0 = load ptr, ptr %depths, align 8, !tbaa !8
  %1 = load i32, ptr %__begin3.0814, align 4, !tbaa !12
  %conv34 = sext i32 %1 to i64
  %arrayidx.i439 = getelementptr inbounds i32, ptr %0, i64 %conv34
  %2 = load i32, ptr %arrayidx.i439, align 4, !tbaa !12
  ret i32 %2
}

define i64 @"285"(ptr %offsets, ptr %num_nodes_.i, i32 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8, !tbaa !43
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !87
  %4 = trunc i64 %3 to i32
  %n184.0657 = add i32 %4, %0
  %5 = zext i32 %n184.0657 to i64
  %sext = shl i64 %5, %1
  %conv202 = ashr exact i64 %sext, %1
  %arrayidx.i542 = getelementptr inbounds i64, ptr %2, i64 %conv202
  %6 = load i64, ptr %arrayidx.i542, align 8, !tbaa !10
  ret i64 %6
}

define i32 @"286"(ptr %init_val, ptr %this, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %this, align 8, !tbaa !8
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %add.ptr = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %init_val, align 4, !tbaa !12
  store i32 %2, ptr %add.ptr, align 4, !tbaa !12
  ret i32 %2
}

define i32 @"287"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %2 = load ptr, ptr %el, align 8, !tbaa !18
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %1
  %add.ptr.sroa_idx.prol = getelementptr inbounds i8, ptr %add.ptr.prol, i64 %0
  %3 = load i32, ptr %add.ptr.sroa_idx.prol, align 4
  ret i32 %3
}

define i32 @"288"(ptr %__first.addr.033.i.i, ptr %n_start.0.in) {
bb:
  %0 = load i32, ptr %__first.addr.033.i.i, align 4, !tbaa !12
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !6
  store i32 %0, ptr %n_start.0, align 4, !tbaa !12
  ret i32 %0
}

define i8 @"289"(ptr %arrayidx17.i.i, ptr %ref.tmp, i64 %conv5.i) {
bb:
  %0 = load i8, ptr %arrayidx17.i.i, align 2, !tbaa !59, !noalias !60
  %1 = load ptr, ptr %ref.tmp, align 8, !tbaa !25, !alias.scope !60
  %arrayidx.i.i = getelementptr inbounds i8, ptr %1, i64 %conv5.i
  store i8 %0, ptr %arrayidx.i.i, align 1, !tbaa !59
  ret i8 %0
}

define ptr @"290"(ptr %queue, ptr %shared_out_start.i, ptr %_M_finish.i.i) {
bb:
  %0 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !6
  %1 = load i64, ptr %shared_out_start.i, align 8, !tbaa !28
  %2 = load ptr, ptr %queue, align 8, !tbaa !30
  %add.ptr.i = getelementptr inbounds i32, ptr %2, i64 %1
  store ptr %add.ptr.i, ptr %0, align 8, !tbaa !6
  ret ptr %add.ptr.i
}

define i32 @"291"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.0649, ptr %arrayidx.i536) {
bb:
  %1 = load i64, ptr %arrayidx.i542, align 8, !tbaa !10
  %i200.0 = add nsw i64 %1, %0
  %2 = load i32, ptr %arrayidx.i536, align 4, !tbaa !12
  %conv155 = sext i32 %2 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %sub211 = sub nsw i64 %i200.0, %add156
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %3 = load i32, ptr %arrayidx212, align 4, !tbaa !12
  ret i32 %3
}

define i64 @"292"(ptr %_M_string_length.i.i.i.i, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !6
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %_M_string_length.i24.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i, i32 1
  %3 = load i64, ptr %_M_string_length.i.i.i.i, align 8, !tbaa !53
  store i64 %3, ptr %_M_string_length.i24.i.i.i, align 8, !tbaa !53
  ret i64 %3
}

define float @"293"(float %0, ptr %arrayidx.i, ptr %arrayidx.i.1, float %1, ptr %biggest_score4) {
bb:
  %2 = load float, ptr %arrayidx.i.1, align 4
  %3 = load float, ptr %arrayidx.i, align 4
  %cmp.i = fcmp olt float %0, %3
  %4 = select i1 %cmp.i, float %3, float %0
  %cmp.i.1 = fcmp olt float %1, %2
  %5 = select i1 %cmp.i.1, float %2, float %1
  store float %5, ptr %biggest_score4, align 4, !tbaa !22
  ret float %5
}

define i32 @"294"(ptr %.omp.lb, ptr %permutation, i64 %indvars.iv) {
bb:
  %0 = load ptr, ptr %permutation, align 8, !tbaa !8
  %arrayidx.i = getelementptr inbounds i32, ptr %0, i64 %indvars.iv
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %2 = sext i32 %1 to i64
  %3 = trunc i64 %2 to i32
  store i32 %3, ptr %arrayidx.i, align 4, !tbaa !12
  ret i32 %3
}

define float @"295"(ptr %scores, i64 %0) {
bb:
  %1 = load ptr, ptr %scores, align 8, !tbaa !20
  %incdec.ptr11.i.i = getelementptr inbounds float, ptr %1, i64 %0
  %2 = load float, ptr %incdec.ptr11.i.i, align 4, !tbaa !22
  ret float %2
}

define i64 @"296"(ptr %arrayidx.i492.1, ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i492.1, align 8, !tbaa !10
  %3 = load ptr, ptr %offsets, align 8
  %4 = load i64, ptr %num_nodes_.i, align 8, !tbaa !87
  %n.mod.vf = and i64 %4, %0
  %indvars.iv.next = add nsw i64 %n.mod.vf, %1
  %arrayidx.i493.1 = getelementptr inbounds i64, ptr %3, i64 %indvars.iv.next
  store i64 %2, ptr %arrayidx.i493.1, align 8, !tbaa !10
  ret i64 %2
}

define i32 @"297"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !18
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %add15 = add i64 %2, %0
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %add15
  %3 = load i32, ptr %add.ptr.1, align 4
  ret i32 %3
}

define i32 @"298"(ptr %add.ptr.i, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %add.ptr.i, align 8, !tbaa !6
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %add.ptr = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %add.ptr, align 4, !tbaa !12, !llvm.access.group !128
  ret i32 %2
}

define i64 @"299"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i78.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !19
  ret i64 %agg.tmp.sroa.0.0.copyload.i78.i.i.i.i
}

define i64 @"300"(ptr %0, ptr %_M_finish.i38, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5) {
bb:
  %6 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !89
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.18", ptr %6, i64 %1
  %7 = ptrtoint ptr %incdec.ptr.i.i to i64
  %8 = add i64 %7, %2
  %9 = sub i64 %8, %3
  %10 = lshr i64 %9, %4
  %11 = add nuw nsw i64 %10, %1
  %n.vec = and i64 %11, %5
  %12 = shl i64 %n.vec, %4
  %ind.end64 = getelementptr i8, ptr %0, i64 %12
  %13 = load i64, ptr %ind.end64, align 4, !alias.scope !99, !noalias !102
  ret i64 %13
}

define i64 @"301"(ptr %succ, i64 %sub.ptr.lhs.cast41, ptr %g_out_start, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %succ, align 8, !tbaa !83, !llvm.access.group !31
  %3 = load ptr, ptr %g_out_start, align 8, !tbaa !6, !llvm.access.group !31
  %sub.ptr.rhs.cast42 = ptrtoint ptr %3 to i64
  %sub.ptr.sub43 = sub i64 %sub.ptr.lhs.cast41, %sub.ptr.rhs.cast42
  %sub.ptr.div44 = ashr exact i64 %sub.ptr.sub43, %0
  %div1.i.i = lshr i64 %sub.ptr.div44, %1
  %arrayidx.i103 = getelementptr inbounds i64, ptr %2, i64 %div1.i.i
  %4 = load i64, ptr %arrayidx.i103, align 8, !tbaa !10, !llvm.access.group !31
  ret i64 %4
}

define ptr @"302"(ptr %cond.i31.i.i.i, ptr %_M_finish.i.i, ptr %depth_index, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !6
  %sub.ptr.lhs.cast.i.i.i.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %depth_index, align 8, !tbaa !6
  %sub.ptr.rhs.cast.i.i.i.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, %0
  %add.ptr.i.i.i = getelementptr inbounds ptr, ptr %cond.i31.i.i.i, i64 %sub.ptr.div.i.i.i.i.i
  %incdec.ptr.i.i.i = getelementptr inbounds ptr, ptr %add.ptr.i.i.i, i64 %1
  store ptr %incdec.ptr.i.i.i, ptr %_M_finish.i.i, align 8, !tbaa !67
  ret ptr %incdec.ptr.i.i.i
}

define ptr @"303"(ptr %neighs, ptr %arrayidx.i.prol, ptr %index, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %index, align 8, !tbaa !6
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !12
  %2 = sext i32 %1 to i64
  %arrayidx.prol = getelementptr inbounds ptr, ptr %0, i64 %2
  %3 = load ptr, ptr %neighs, align 8, !tbaa !6
  %4 = load i64, ptr %arrayidx.i.prol, align 8, !tbaa !10
  %add.ptr.prol = getelementptr inbounds i32, ptr %3, i64 %4
  store ptr %add.ptr.prol, ptr %arrayidx.prol, align 8, !tbaa !6
  ret ptr %add.ptr.prol
}

define i32 @"304"(ptr %num_nodes_.i, i64 %0, i64 %1, ptr %add.ptr.i) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !34
  %n.mod.vf = and i64 %2, %1
  %3 = and i64 %2, %0
  %n.vec = sub nsw i64 %3, %n.mod.vf
  %4 = trunc i64 %n.vec to i32
  store i32 %4, ptr %add.ptr.i, align 4, !tbaa !129
  ret i32 %4
}

define i32 @"305"(ptr %end_size_.i.i583, ptr %offsets, i64 %0, ptr %length.i581) {
bb:
  %.pre721 = load ptr, ptr %offsets, align 8, !tbaa !43
  %sub.ptr.rhs.cast.i.i585 = ptrtoint ptr %.pre721 to i64
  %1 = load ptr, ptr %end_size_.i.i583, align 8, !tbaa !54
  %sub.ptr.lhs.cast.i.i584 = ptrtoint ptr %1 to i64
  %sub.ptr.sub.i.i586 = sub i64 %sub.ptr.lhs.cast.i.i584, %sub.ptr.rhs.cast.i.i585
  %2 = lshr exact i64 %sub.ptr.sub.i.i586, %0
  %conv.i587 = trunc i64 %2 to i32
  store i32 %conv.i587, ptr %length.i581, align 4, !tbaa !12
  ret i32 %conv.i587
}

define i32 @"306"(i64 %indvars.iv699, ptr %incdec.ptr4.sink.i.i.i.i569, ptr %__first.addr.015.i.i563, ptr %call171, ptr %arrayidx.i550, i64 %sub.ptr.rhs.cast.i.i.i.i552, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %incdec.ptr4.sink.i.i.i.i569, align 4, !tbaa !12
  %3 = sext i32 %2 to i64
  %cmp.i.i.i570 = icmp sgt i64 %indvars.iv699, %3
  %4 = load i64, ptr %arrayidx.i550, align 8, !tbaa !10
  %add.ptr271 = getelementptr inbounds i32, ptr %call171, i64 %4
  %sub.ptr.lhs.cast.i.i.i.i551 = ptrtoint ptr %add.ptr271 to i64
  %sub.ptr.sub.i.i.i.i553 = sub i64 %sub.ptr.lhs.cast.i.i.i.i551, %sub.ptr.rhs.cast.i.i.i.i552
  %sub.ptr.div.i.i.i.i561 = lshr exact i64 %sub.ptr.sub.i.i.i.i553, %0
  %shr.i.i565 = lshr i64 %sub.ptr.div.i.i.i.i561, %1
  %incdec.ptr4.sink.i.i.i.i5692 = getelementptr inbounds i32, ptr %__first.addr.015.i.i563, i64 %shr.i.i565
  %incdec.ptr.i.i571 = getelementptr inbounds i32, ptr %incdec.ptr4.sink.i.i.i.i569, i64 %1
  %__first.addr.1.i.i574 = select i1 %cmp.i.i.i570, ptr %incdec.ptr.i.i571, ptr %__first.addr.015.i.i563
  %5 = load i32, ptr %__first.addr.1.i.i574, align 4, !tbaa !12
  ret i32 %5
}

define i32 @"307"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3) {
bb:
  %4 = load ptr, ptr %el, align 8, !tbaa !18
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !10
  %6 = sub i64 %0, %5
  %n.vec = and i64 %6, %1
  %ind.end = add i64 %5, %n.vec
  %add15 = add i64 %ind.end, %2
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %4, i64 %add15
  %add.ptr.sroa_idx.1 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %3
  %7 = load i32, ptr %add.ptr.sroa_idx.1, align 4
  ret i32 %7
}

!0 = !{!1, !1, i64 0}
!1 = !{!"bool", !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C++ TBAA"}
!4 = !{i8 0, i8 2}
!5 = !{}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !2, i64 0}
!8 = !{!9, !7, i64 0}
!9 = !{!"_ZTS7pvectorIiE", !7, i64 0, !7, i64 8, !7, i64 16}
!10 = !{!11, !11, i64 0}
!11 = !{!"long", !2, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !2, i64 0}
!14 = !{!15, !13, i64 0}
!15 = !{!"_ZTS10NodeWeightIiiE", !13, i64 0, !13, i64 4}
!16 = !{!17, !7, i64 8}
!17 = !{!"_ZTS7pvectorI8EdgePairIiiEE", !7, i64 0, !7, i64 8, !7, i64 16}
!18 = !{!17, !7, i64 0}
!19 = !{i64 0, i64 4, !12, i64 4, i64 4, !12}
!20 = !{!21, !7, i64 0}
!21 = !{!"_ZTS7pvectorIfE", !7, i64 0, !7, i64 8, !7, i64 16}
!22 = !{!23, !23, i64 0}
!23 = !{!"float", !2, i64 0}
!24 = !{!17, !7, i64 16}
!25 = !{!26, !7, i64 0}
!26 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !27, i64 0, !11, i64 8, !2, i64 16}
!27 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !7, i64 0}
!28 = !{!29, !11, i64 16}
!29 = !{!"_ZTS12SlidingQueueIiE", !7, i64 0, !11, i64 8, !11, i64 16, !11, i64 24}
!30 = !{!29, !7, i64 0}
!31 = distinct !{}
!32 = !{!33, !23, i64 0}
!33 = !{!"_ZTSSt4pairIfiE", !23, i64 0, !13, i64 4}
!34 = !{!35, !11, i64 8}
!35 = !{!"_ZTS8CSRGraphIiiLb1EE", !1, i64 0, !11, i64 8, !11, i64 16, !7, i64 24, !7, i64 32, !7, i64 40, !7, i64 48}
!36 = !{!37, !7, i64 8}
!37 = !{!"_ZTSNSt12_Vector_baseISt4pairIifESaIS1_EE17_Vector_impl_dataE", !7, i64 0, !7, i64 8, !7, i64 16}
!38 = !{!39, !11, i64 8}
!39 = !{!"_ZTSNSt24uniform_int_distributionImE10param_typeE", !11, i64 0, !11, i64 8}
!40 = !{!39, !11, i64 0}
!41 = !{!42, !11, i64 8}
!42 = !{!"_ZTS9GeneratorIiiijLi32ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEE", !13, i64 0, !11, i64 8, !11, i64 16}
!43 = !{!44, !7, i64 0}
!44 = !{!"_ZTS7pvectorIlE", !7, i64 0, !7, i64 8, !7, i64 16}
!45 = !{!9, !7, i64 8}
!46 = !{!47}
!47 = distinct !{!47, !48}
!48 = distinct !{!48, !"LVerDomain"}
!49 = !{!50}
!50 = distinct !{!50, !48}
!51 = !{!52, !23, i64 4}
!52 = !{!"_ZTSSt4pairIifE", !13, i64 0, !23, i64 4}
!53 = !{!26, !11, i64 8}
!54 = !{!44, !7, i64 8}
!55 = !{!56, !13, i64 0}
!56 = !{!"_ZTS8EdgePairIiiE", !13, i64 0, !13, i64 4}
!57 = !{!58, !7, i64 0}
!58 = !{!"_ZTSNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataE", !7, i64 0, !7, i64 8, !7, i64 16}
!59 = !{!2, !2, i64 0}
!60 = !{!61}
!61 = distinct !{!61, !62, !"_ZNSt7__cxx119to_stringEi: %agg.result"}
!62 = distinct !{!62, !"_ZNSt7__cxx119to_stringEi"}
!63 = !{!64, !7, i64 0}
!64 = !{!"_ZTS7UniDistIiSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEjE", !7, i64 0, !1, i64 8, !13, i64 12, !13, i64 16}
!65 = !{!66, !11, i64 2496}
!66 = !{!"_ZTSSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE", !2, i64 0, !11, i64 2496}
!67 = !{!68, !7, i64 8}
!68 = !{!"_ZTSNSt12_Vector_baseIPiSaIS0_EE17_Vector_impl_dataE", !7, i64 0, !7, i64 8, !7, i64 16}
!69 = !{!68, !7, i64 0}
!70 = !{!71}
!71 = distinct !{!71, !72, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_: %agg.result"}
!72 = distinct !{!72, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_"}
!73 = !{!74, !11, i64 4992}
!74 = !{!"_ZTSSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE", !2, i64 0, !11, i64 4992}
!75 = !{!76, !76, i64 0}
!76 = !{!"double", !2, i64 0}
!77 = !{!35, !1, i64 0}
!78 = !{!79, !7, i64 8}
!79 = !{!"_ZTS6Bitmap", !7, i64 0, !7, i64 8}
!80 = !{!58, !7, i64 8}
!81 = !{!29, !11, i64 8}
!82 = !{!29, !11, i64 24}
!83 = !{!79, !7, i64 0}
!84 = !{!85}
!85 = distinct !{!85, !86, !"_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm: %agg.result"}
!86 = distinct !{!86, !"_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm"}
!87 = !{!88, !11, i64 16}
!88 = !{!"_ZTS11BuilderBaseIiiiLb1EE", !7, i64 0, !1, i64 8, !1, i64 9, !1, i64 10, !11, i64 16}
!89 = !{!90, !7, i64 8}
!90 = !{!"_ZTSNSt12_Vector_baseISt4pairIfiESaIS1_EE17_Vector_impl_dataE", !7, i64 0, !7, i64 8, !7, i64 16}
!91 = !{!92}
!92 = distinct !{!92, !93, !"_ZN11BuilderBaseIiiiLb1EE11SquishGraphERK8CSRGraphIiiLb1EE: %agg.result"}
!93 = distinct !{!93, !"_ZN11BuilderBaseIiiiLb1EE11SquishGraphERK8CSRGraphIiiLb1EE"}
!94 = !{!33, !13, i64 4}
!95 = !{!96}
!96 = distinct !{!96, !97}
!97 = distinct !{!97, !"LVerDomain"}
!98 = !{!21, !7, i64 8}
!99 = !{!100}
!100 = distinct !{!100, !101, !"_ZSt19__relocate_object_aISt4pairIfiES1_SaIS1_EEvPT_PT0_RT1_: %__orig"}
!101 = distinct !{!101, !"_ZSt19__relocate_object_aISt4pairIfiES1_SaIS1_EEvPT_PT0_RT1_"}
!102 = !{!103}
!103 = distinct !{!103, !101, !"_ZSt19__relocate_object_aISt4pairIfiES1_SaIS1_EEvPT_PT0_RT1_: %__dest"}
!104 = !{!105}
!105 = distinct !{!105, !106, !"_ZNSt7__cxx119to_stringEi: %agg.result"}
!106 = distinct !{!106, !"_ZNSt7__cxx119to_stringEi"}
!107 = !{!108, !13, i64 172}
!108 = !{!"_ZTS9CLIterApp", !109, i64 0, !13, i64 172}
!109 = !{!"_ZTS5CLApp", !110, i64 0, !1, i64 155, !13, i64 156, !11, i64 160, !1, i64 168, !1, i64 169}
!110 = !{!"_ZTS6CLBase", !13, i64 8, !7, i64 16, !26, i64 24, !26, i64 56, !111, i64 88, !13, i64 112, !13, i64 116, !26, i64 120, !1, i64 152, !1, i64 153, !1, i64 154}
!111 = !{!"_ZTSSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !112, i64 0}
!112 = !{!"_ZTSSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !113, i64 0}
!113 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implE", !114, i64 0}
!114 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_Vector_impl_dataE", !7, i64 0, !7, i64 8, !7, i64 16}
!115 = !{!58, !7, i64 16}
!116 = !{!117}
!117 = distinct !{!117, !118}
!118 = distinct !{!118, !"LVerDomain"}
!119 = !{!120}
!120 = distinct !{!120, !118}
!121 = !{!35, !7, i64 24}
!122 = !{!123}
!123 = distinct !{!123, !124, !"_ZNK8CSRGraphIiiLb1EE9out_neighEim: %agg.result"}
!124 = distinct !{!124, !"_ZNK8CSRGraphIiiLb1EE9out_neighEim"}
!125 = !{!68, !7, i64 16}
!126 = !{!64, !13, i64 12}
!127 = !{!42, !11, i64 16}
!128 = distinct !{}
!129 = !{!52, !13, i64 0}
!130 = !{!90, !7, i64 16}
!131 = !{i64 0, i64 4, !12}
