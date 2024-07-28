; ModuleID = 'pr_spmv-idioms'
source_filename = "pr_spmv-idioms"
target triple = "riscv64"

%"struct.std::pair" = type { i32, float }
%struct.EdgePair = type { i32, i32 }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char>::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char>::_Alloc_hider" = type { ptr }
%union.anon = type { i64, [8 x i8] }
%"struct.std::pair.8" = type { float, i32 }

define float @"0"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !0
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add.ptr = getelementptr inbounds float, ptr %2, i64 %ind.end
  %5 = load float, ptr %init_val, align 4, !tbaa !7
  store float %5, ptr %add.ptr, align 4, !tbaa !7
  ret float %5
}

define float @"1"(ptr %arrayidx.i.1, ptr %call5.i.i.i.i4.i.i45, ptr %num_nodes_.i, i64 %0, i64 %1, i32 %2) {
bb:
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !9
  %n.vec = and i64 %3, %0
  %indvars.iv.next = add nuw nsw i64 %n.vec, %1
  %second3.i.1 = getelementptr inbounds %"struct.std::pair", ptr %call5.i.i.i.i4.i.i45, i64 %indvars.iv.next, i32 1
  %4 = load float, ptr %arrayidx.i.1, align 4, !tbaa !7
  store float %4, ptr %second3.i.1, align 4, !tbaa !12
  ret float %4
}

define i64 @"2"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %2) {
bb:
  %3 = load ptr, ptr %new_range.i.i, align 8, !tbaa !15
  %4 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %4 to i64
  %5 = load ptr, ptr %agg.result, align 8, !tbaa !18
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %5 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = ashr exact i64 %sub.ptr.sub.i12.i.i, %2
  %add.ptr.i.i149 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div.i13.i.i
  %6 = load i32, ptr %v, align 4, !tbaa !19
  %sub = add nsw i32 %6, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %add.ptr.i.i149, align 4, !tbaa.struct !21
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"3"(i64 %indvars.iv687, ptr %incdec.ptr4.sink.i.i.i.i, ptr %__first.addr.015.i.i, ptr %neighs, ptr %arrayidx.i524, i64 %sub.ptr.rhs.cast.i.i.i.i526, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %incdec.ptr4.sink.i.i.i.i, align 4, !tbaa !22
  %3 = sext i32 %2 to i64
  %cmp.i.i.i530 = icmp sgt i64 %indvars.iv687, %3
  %4 = load i64, ptr %arrayidx.i524, align 8, !tbaa !5
  %5 = load ptr, ptr %neighs, align 8, !tbaa !15
  %add.ptr121 = getelementptr inbounds i32, ptr %5, i64 %4
  %sub.ptr.lhs.cast.i.i.i.i525 = ptrtoint ptr %add.ptr121 to i64
  %sub.ptr.sub.i.i.i.i527 = sub i64 %sub.ptr.lhs.cast.i.i.i.i525, %sub.ptr.rhs.cast.i.i.i.i526
  %sub.ptr.div.i.i.i.i = lshr exact i64 %sub.ptr.sub.i.i.i.i527, %0
  %shr.i.i = lshr i64 %sub.ptr.div.i.i.i.i, %1
  %incdec.ptr4.sink.i.i.i.i2 = getelementptr inbounds i32, ptr %__first.addr.015.i.i, i64 %shr.i.i
  %incdec.ptr.i.i = getelementptr inbounds i32, ptr %incdec.ptr4.sink.i.i.i.i, i64 %1
  %__first.addr.1.i.i = select i1 %cmp.i.i.i530, ptr %incdec.ptr.i.i, ptr %__first.addr.015.i.i
  %6 = load i32, ptr %__first.addr.1.i.i, align 4, !tbaa !22
  ret i32 %6
}

define ptr @"4"(ptr %new_range.i.i, ptr %el, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %1 = load ptr, ptr %el, align 8, !tbaa !18
  %sub.ptr.lhs.cast = ptrtoint ptr %1 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %2 = load ptr, ptr %new_range.i.i, align 8, !tbaa !15
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !23
  ret ptr %add.ptr6.i.i
}

define ptr @"5"(ptr %__args, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0) {
bb:
  %1 = load ptr, ptr %this, align 8, !tbaa !15
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %1 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %add.ptr = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i
  %2 = load ptr, ptr %__args, align 8, !tbaa !24
  store ptr %2, ptr %add.ptr, align 8, !tbaa !24
  ret ptr %2
}

define <2 x i32> @"6"(ptr %degrees, ptr %.omp.lb, i64 %0, i64 %index) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %mul12 = shl i64 %1, %0
  %offset.idx = add i64 %mul12, %index
  %2 = load ptr, ptr %degrees, align 8, !tbaa !27
  %3 = getelementptr inbounds i32, ptr %2, i64 %offset.idx
  %wide.load = load <2 x i32>, ptr %3, align 4, !tbaa !22
  ret <2 x i32> %wide.load
}

define ptr @"7"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %sub.ptr.rhs.cast = ptrtoint ptr %.pre to i64
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %2 = load ptr, ptr %new_range.i.i, align 8, !tbaa !15
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !23
  ret ptr %add.ptr6.i.i
}

define ptr @"8"(ptr %new_range.i.i457, ptr %0, ptr %el, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !18
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !18
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %3 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !15
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !23
  ret ptr %add.ptr6.i.i478
}

define ptr @"9"(ptr %in_index_.i, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %in_index_.i, align 8, !tbaa !29, !noalias !30, !llvm.access.group !33
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %3 = sext i32 %2 to i64
  %indvars.iv.next = add nsw i64 %3, %0
  %arrayidx.i.i.i = getelementptr inbounds ptr, ptr %1, i64 %indvars.iv.next
  %4 = load ptr, ptr %arrayidx.i.i.i, align 8, !tbaa !15, !llvm.access.group !33
  ret ptr %4
}

define i32 @"10"(ptr %incdec.ptr.i, ptr %add.ptr.i27.i.i.i) {
bb:
  %__value.sroa.0.0.copyload.i = load i64, ptr %incdec.ptr.i, align 4
  %__value.sroa.0.0.extract.trunc.i.i.i = trunc i64 %__value.sroa.0.0.copyload.i to i32
  store i32 %__value.sroa.0.0.extract.trunc.i.i.i, ptr %add.ptr.i27.i.i.i, align 4, !tbaa !34
  ret i32 %__value.sroa.0.0.extract.trunc.i.i.i
}

define i32 @"12"(ptr %n_start.0.in, i64 %0, ptr %diffs, ptr %.omp.lb) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !15
  %sub.ptr.lhs.cast = ptrtoint ptr %n_start.0 to i64
  %.pre134 = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %.pre134
  %1 = lshr exact i64 %sub.ptr.sub, %0
  %conv22 = trunc i64 %1 to i32
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %3 = sext i32 %2 to i64
  %4 = load ptr, ptr %diffs, align 8, !tbaa !27
  %arrayidx.i99 = getelementptr inbounds i32, ptr %4, i64 %3
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !22
  ret i32 %conv22
}

define i64 @"13"(i64 %val.coerce, ptr %new_range.i, ptr %end_size_.i, ptr %this, i64 %0) {
bb:
  %1 = load ptr, ptr %new_range.i, align 8, !tbaa !15
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i10.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %this, align 8, !tbaa !18
  %sub.ptr.rhs.cast.i11.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i12.i = sub i64 %sub.ptr.lhs.cast.i10.i, %sub.ptr.rhs.cast.i11.i
  %sub.ptr.div.i13.i = ashr exact i64 %sub.ptr.sub.i12.i, %0
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %sub.ptr.div.i13.i
  store i64 %val.coerce, ptr %add.ptr.i, align 4, !tbaa.struct !21
  ret i64 %val.coerce
}

define i64 @"14"(i64 %local_total.040, ptr %arrayidx.i36, ptr %prefix, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %prefix, align 8
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %mul14 = shl i64 %2, %0
  %arrayidx.i35 = getelementptr inbounds i64, ptr %1, i64 %mul14
  %3 = load i32, ptr %arrayidx.i36, align 4, !tbaa !22
  %conv = sext i32 %3 to i64
  %add20 = add nsw i64 %local_total.040, %conv
  store i64 %add20, ptr %arrayidx.i35, align 8, !tbaa !5
  ret i64 %add20
}

define ptr @"15"(ptr %call5.i.i.i.i4.i.i45, ptr %num_nodes_.i, i64 %0, ptr %_M_finish.i.i9.i80) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !9
  %mul.i.i.i.i.i.i = shl nuw nsw i64 %1, %0
  %scevgep.i.i.i.i.i = getelementptr i8, ptr %call5.i.i.i.i4.i.i45, i64 %mul.i.i.i.i.i.i
  store ptr %scevgep.i.i.i.i.i, ptr %_M_finish.i.i9.i80, align 8, !tbaa !36
  ret ptr %scevgep.i.i.i.i.i
}

define <2 x float> @"16"(ptr %0, ptr %1, <2 x ptr> %vector.recur, <2 x i64> %2, ptr %outgoing_contrib, i64 %index, ptr %.omp.lb) {
bb:
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %4 = sext i32 %3 to i64
  %offset.idx = add i64 %index, %4
  %5 = load ptr, ptr %outgoing_contrib, align 8, !tbaa !0
  %6 = getelementptr inbounds float, ptr %5, i64 %offset.idx
  %wide.load = load <2 x float>, ptr %0, align 4, !tbaa !7
  %wide.load32 = load <2 x ptr>, ptr %1, align 8, !tbaa !15
  %7 = ptrtoint <2 x ptr> %wide.load32 to <2 x i64>
  %8 = shufflevector <2 x ptr> %vector.recur, <2 x ptr> %wide.load32, <2 x i32> <i32 1, i32 2>
  %9 = ptrtoint <2 x ptr> %8 to <2 x i64>
  %10 = sub <2 x i64> %7, %9
  %11 = ashr exact <2 x i64> %10, %2
  %12 = sitofp <2 x i64> %11 to <2 x float>
  %13 = fdiv <2 x float> %wide.load, %12
  store <2 x float> %13, ptr %6, align 4, !tbaa !7
  ret <2 x float> %13
}

define i32 @"17"(ptr %add.ptr3.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr3.i.i.i.i, align 4, !tbaa !22
  %1 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !22
  %2 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !22
  %cmp.i.i.i.i.i = icmp slt i32 %2, %1
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add.ptr4.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i.i.i.i
  store i32 %0, ptr %add.ptr4.i.i.i.i, align 4, !tbaa !22
  ret i32 %0
}

define i64 @"18"(ptr %_M_b.i, ptr %__param, i64 %0, ptr %_M_b.i32) {
bb:
  %1 = load i64, ptr %__param, align 8, !tbaa !38
  %2 = load i64, ptr %_M_b.i, align 8, !tbaa !40
  %sub = sub i64 %2, %1
  %div31 = lshr i64 %sub, %0
  store i64 %div31, ptr %_M_b.i32, align 8, !tbaa !40
  ret i64 %div31
}

define ptr @"19"(ptr %new_range.i.i457, ptr %new_range.i.i, i64 %0, ptr %el, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %2 = load ptr, ptr %new_range.i.i, align 8, !tbaa !15
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !18
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %3 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !15
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !23
  ret ptr %add.ptr6.i.i478
}

define i32 @"20"(ptr %call171, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %0, i64 %1, i64 %total_missing_inv.1659) {
bb:
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !22
  %.pre731 = sext i32 %.pre717 to i64
  %sub222 = sub nsw i64 %total_missing_inv.1659, %.pre731
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !5
  %3 = load i64, ptr %arrayidx.i540, align 8, !tbaa !5
  %4 = load i32, ptr %arrayidx.i541, align 4, !tbaa !22
  %conv198 = sext i32 %4 to i64
  %add199 = add nsw i64 %3, %conv198
  %5 = sub i64 %2, %add199
  %n.vec793 = and i64 %5, %0
  %ind.end794 = sub i64 %2, %n.vec793
  %i200.0 = add nsw i64 %ind.end794, %1
  %sub211 = sub nsw i64 %i200.0, %sub222
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %6 = load i32, ptr %arrayidx212, align 4, !tbaa !22
  ret i32 %6
}

define ptr @"21"(ptr %out_index_.i, i32 %cond, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %out_index_.i, align 8, !tbaa !41
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %4 = sub i32 %cond, %3
  %5 = zext i32 %4 to i64
  %6 = add nuw nsw i64 %5, %0
  %n.vec = and i64 %6, %1
  %7 = sext i32 %3 to i64
  %ind.end = add nsw i64 %n.vec, %7
  %indvars.iv.next = add nsw i64 %ind.end, %0
  %arrayidx.i27 = getelementptr inbounds ptr, ptr %2, i64 %indvars.iv.next
  %8 = load ptr, ptr %arrayidx.i27, align 8, !tbaa !15
  ret ptr %8
}

define i64 @"22"(ptr %arrayidx.i140, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i143, i64 %4, i64 %5, i64 %xor4.i146, i64 %6, i64 %xor7.i149, ptr %num_nodes_, i64 %7, ptr %arrayidx.i72, i64 %xor.i75, i64 %xor4.i78, i64 %xor7.i81, i32 %8, ptr %el, ptr %.omp.lb) {
bb:
  %9 = load i64, ptr %arrayidx.i72, align 8, !tbaa !5
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
  %10 = load i64, ptr %arrayidx.i140, align 8, !tbaa !5
  %shr.i141 = lshr i64 %10, %0
  %and.i142 = and i64 %shr.i141, %1
  %xor.i1438 = xor i64 %and.i142, %10
  %shl.i144 = shl i64 %xor.i143, %2
  %and3.i145 = and i64 %shl.i144, %3
  %xor4.i14610 = xor i64 %and3.i145, %xor.i143
  %shl5.i147 = shl i64 %xor4.i146, %4
  %and6.i148 = and i64 %shl5.i147, %5
  %xor7.i14912 = xor i64 %and6.i148, %xor4.i146
  %shr8.i150 = lshr i64 %xor7.i149, %6
  %xor9.i151 = xor i64 %shr8.i150, %xor7.i149
  %conv7.i54 = trunc i64 %xor9.i151 to i32
  %11 = load i64, ptr %num_nodes_, align 8, !tbaa !42
  %12 = trunc i64 %11 to i32
  %rem.i52 = urem i32 %conv7.i54, %8
  %ref.tmp16.sroa.4.0.insert.ext = zext i32 %rem.i52 to i64
  %ref.tmp16.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp16.sroa.4.0.insert.ext, %7
  %ref.tmp16.sroa.0.0.insert.insert = or i64 %ref.tmp16.sroa.4.0.insert.shift, %ref.tmp16.sroa.0.0.insert.ext
  %13 = load ptr, ptr %el, align 8, !tbaa !18
  %14 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %mul = shl i64 %14, %6
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %13, i64 %mul
  store i64 %ref.tmp16.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp16.sroa.0.0.insert.insert
}

define <2 x ptr> @"23"(ptr %out_index_.i, i64 %index, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %2 = sext i32 %1 to i64
  %offset.idx = add i64 %index, %2
  %3 = add nsw i64 %offset.idx, %0
  %4 = load ptr, ptr %out_index_.i, align 8, !tbaa !41
  %5 = getelementptr inbounds ptr, ptr %4, i64 %3
  %wide.load32 = load <2 x ptr>, ptr %5, align 8, !tbaa !15
  ret <2 x ptr> %wide.load32
}

define i32 @"24"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %5 = load ptr, ptr %el, align 8, !tbaa !18
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %ind.end
  %add.ptr.sroa_idx = getelementptr inbounds i8, ptr %add.ptr, i64 %2
  %6 = load i32, ptr %add.ptr.sroa_idx, align 4
  ret i32 %6
}

define float @"25"(ptr %arrayidx.i.prol, ptr %arrayidx.i27.prol, ptr %arrayidx4.i.phi.trans.insert, i64 %0, ptr %outgoing_contrib, i32 %cond, ptr %.omp.lb, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %outgoing_contrib, align 8, !tbaa !0
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %5 = sub i32 %cond, %4
  %6 = zext i32 %5 to i64
  %7 = add nuw nsw i64 %6, %1
  %n.vec = and i64 %7, %2
  %8 = sext i32 %4 to i64
  %ind.end = add nsw i64 %n.vec, %8
  %arrayidx.i28.prol = getelementptr inbounds float, ptr %3, i64 %ind.end
  %9 = load float, ptr %arrayidx.i.prol, align 4, !tbaa !7
  %.pre = load ptr, ptr %arrayidx4.i.phi.trans.insert, align 8, !tbaa !15
  %sub.ptr.rhs.cast.i.prol = ptrtoint ptr %.pre to i64
  %10 = load ptr, ptr %arrayidx.i27.prol, align 8, !tbaa !15
  %sub.ptr.lhs.cast.i.prol = ptrtoint ptr %10 to i64
  %sub.ptr.sub.i.prol = sub i64 %sub.ptr.lhs.cast.i.prol, %sub.ptr.rhs.cast.i.prol
  %sub.ptr.div.i.prol = ashr exact i64 %sub.ptr.sub.i.prol, %0
  %conv12.prol = sitofp i64 %sub.ptr.div.i.prol to float
  %div13.prol = fdiv float %9, %conv12.prol
  store float %div13.prol, ptr %arrayidx.i28.prol, align 4, !tbaa !7
  ret float %div13.prol
}

define i64 @"26"(ptr %arrayidx.i59, ptr %agg.result, ptr %end_size_.i, ptr %degrees, i64 %0) {
bb:
  %1 = load ptr, ptr %agg.result, align 8, !tbaa !44
  %2 = load ptr, ptr %degrees, align 8, !tbaa !27
  %sub.ptr.rhs.cast.i62 = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !46
  %sub.ptr.lhs.cast.i61 = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i63 = sub i64 %sub.ptr.lhs.cast.i61, %sub.ptr.rhs.cast.i62
  %sub.ptr.div.i64 = ashr exact i64 %sub.ptr.sub.i63, %0
  %arrayidx.i65 = getelementptr inbounds i64, ptr %1, i64 %sub.ptr.div.i64
  %4 = load i64, ptr %arrayidx.i59, align 8, !tbaa !5
  store i64 %4, ptr %arrayidx.i65, align 8, !tbaa !5
  ret i64 %4
}

define float @"27"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load float, ptr %init_val, align 4, !tbaa !7
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %5 = load ptr, ptr %this, align 8, !tbaa !0
  %add.ptr.prol = getelementptr inbounds float, ptr %5, i64 %ind.end
  store float %2, ptr %add.ptr.prol, align 4, !tbaa !7
  ret float %2
}

define i32 @"28"(ptr %neighs, ptr %arrayidx.i523) {
bb:
  %0 = load i64, ptr %arrayidx.i523, align 8, !tbaa !5
  %1 = load ptr, ptr %neighs, align 8, !tbaa !15
  %add.ptr = getelementptr inbounds i32, ptr %1, i64 %0
  %2 = load i32, ptr %add.ptr, align 4, !tbaa !22
  ret i32 %2
}

define <4 x float> @"29"(<4 x float> %0, ptr %init_val, i64 %1, ptr %this, ptr %.omp.lb, i64 %index, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %offset.idx = add i64 %3, %index
  %4 = load ptr, ptr %this, align 8, !tbaa !0
  %5 = getelementptr inbounds float, ptr %4, i64 %offset.idx
  %6 = getelementptr inbounds float, ptr %5, i64 %2
  %7 = load float, ptr %init_val, align 4, !tbaa !7, !alias.scope !47
  %broadcast.splatinsert21 = insertelement <4 x float> %0, float %7, i64 %1
  %broadcast.splat22 = shufflevector <4 x float> %broadcast.splatinsert21, <4 x float> %0, <4 x i32> zeroinitializer
  store <4 x float> %broadcast.splat22, ptr %6, align 4, !tbaa !7, !alias.scope !50, !noalias !47
  ret <4 x float> %broadcast.splat22
}

define <2 x i64> @"31"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %rng, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
bb:
  %wide.load91 = load <2 x i64>, ptr %0, align 8, !tbaa !5
  %10 = and <2 x i64> %wide.load91, %1
  %11 = load i64, ptr %rng, align 8, !tbaa !5
  %vector.recur.init89 = insertelement <2 x i64> %2, i64 %11, i64 %3
  %12 = shufflevector <2 x i64> %vector.recur.init89, <2 x i64> %wide.load91, <2 x i32> <i32 1, i32 2>
  %13 = and <2 x i64> %12, %4
  %14 = or <2 x i64> %10, %13
  %15 = lshr exact <2 x i64> %14, %5
  %wide.load92 = load <2 x i64>, ptr %6, align 8, !tbaa !5
  %16 = xor <2 x i64> %15, %wide.load92
  %17 = and <2 x i64> %wide.load91, %5
  %18 = icmp eq <2 x i64> %17, %7
  %19 = select <2 x i1> %18, <2 x i64> %7, <2 x i64> %8
  %20 = xor <2 x i64> %16, %19
  store <2 x i64> %20, ptr %9, align 8, !tbaa !5
  ret <2 x i64> %20
}

define i32 @"32"(ptr %degrees, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %mul12 = shl i64 %1, %0
  %2 = load ptr, ptr %degrees, align 8, !tbaa !27
  %arrayidx.i32 = getelementptr inbounds i32, ptr %2, i64 %mul12
  %3 = load i32, ptr %arrayidx.i32, align 4, !tbaa !22
  ret i32 %3
}

define i32 @"33"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !22
  %3 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !22
  %cmp.i.i.i.i.i = icmp slt i32 %3, %2
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %__parent.020.in.i.i.i.i.i = add nsw i64 %sub12.i.i.i.i, %1
  %__parent.020.i.i45.i.i.i = lshr i64 %__parent.020.in.i.i.i.i.i, %0
  %add.ptr.i.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %__parent.020.i.i45.i.i.i
  %4 = load i32, ptr %add.ptr.i.i.i.i.i, align 4, !tbaa !22
  ret i32 %4
}

define double @"34"(ptr %error, ptr %error4) {
bb:
  %0 = load double, ptr %error4, align 8, !tbaa !52
  %1 = load double, ptr %error, align 8, !tbaa !52
  %add33 = fadd double %1, %0
  store double %add33, ptr %error, align 8, !tbaa !52
  ret double %add33
}

define i64 @"35"(ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %__i.018.i, ptr %arrayidx7.i) {
bb:
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %add10 = add i64 %5, %0
  %rem.i.i.i = and i64 %add10, %1
  %shr.i = lshr i64 %rem.i.i.i, %2
  %xor.i = xor i64 %shr.i, %3
  %mul.i = mul nuw nsw i64 %xor.i, %4
  %add.i = add nuw i64 %mul.i, %__i.018.i
  %rem.i.i17.i = and i64 %add.i, %1
  store i64 %rem.i.i17.i, ptr %arrayidx7.i, align 8, !tbaa !5
  ret i64 %rem.i.i17.i
}

define ptr @"36"(ptr %new_range.i.i, ptr %el, i64 %sub.ptr.rhs.cast, i64 %0, ptr %end_size_.i) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !18
  %sub.ptr.lhs.cast = ptrtoint ptr %1 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %2 = load ptr, ptr %new_range.i.i, align 8, !tbaa !15
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !16
  ret ptr %add.ptr.i
}

define float @"37"(ptr %scores, i32 %cond, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %scores, align 8, !tbaa !0
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %4 = sub i32 %cond, %3
  %5 = zext i32 %4 to i64
  %6 = add nuw nsw i64 %5, %0
  %n.vec = and i64 %6, %1
  %7 = sext i32 %3 to i64
  %ind.end = add nsw i64 %n.vec, %7
  %arrayidx.i.prol = getelementptr inbounds float, ptr %2, i64 %ind.end
  %8 = load float, ptr %arrayidx.i.prol, align 4, !tbaa !7
  ret float %8
}

define i32 @"38"(ptr %num_nodes_.i, i64 %0, ptr %add.ptr.i.prol) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !9
  %n.vec = and i64 %1, %0
  %2 = trunc i64 %n.vec to i32
  store i32 %2, ptr %add.ptr.i.prol, align 4, !tbaa !54
  ret i32 %2
}

define i64 @"39"(i64 %0, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %this, align 8, !tbaa !15
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %1
  %_M_string_length.i24.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i, i32 1
  store i64 %0, ptr %_M_string_length.i24.i.i.i, align 8, !tbaa !55
  ret i64 %0
}

define ptr @"40"(ptr %new_range.i.i457, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !18
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %3 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !15
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !23
  ret ptr %add.ptr6.i.i478
}

define <4 x i32> @"41"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.1659, ptr %arrayidx.i541, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !5
  %3 = add i64 %2, %0
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !22
  %.pre731 = sext i32 %.pre717 to i64
  %sub222 = sub nsw i64 %total_missing_inv.1659, %.pre731
  %4 = sub nsw i64 %3, %sub222
  %5 = getelementptr inbounds i32, ptr %call171, i64 %4
  %6 = getelementptr inbounds i32, ptr %5, i64 %1
  %wide.load803 = load <4 x i32>, ptr %6, align 4, !tbaa !22
  ret <4 x i32> %wide.load803
}

define i32 @"42"(ptr %n_start.0.in, i64 %0) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !15
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %1 = load i32, ptr %incdec.ptr12.i.i.i.i, align 4, !tbaa !22
  ret i32 %1
}

define ptr @"43"(ptr %new_range.i.i457, ptr %0, ptr %el, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !18
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !18
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %3 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !15
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !16
  ret ptr %add.ptr.i464
}

define float @"44"(float %0, ptr %num_nodes_.i, ptr %base_score) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !9
  %conv = sitofp i64 %1 to float
  %div3 = fdiv float %0, %conv
  store float %div3, ptr %base_score, align 4, !tbaa !7
  ret float %div3
}

define i64 @"45"(ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57.2) {
bb:
  %0 = load i64, ptr %arrayidx.i58, align 8, !tbaa !5
  %add7 = add nsw i64 %0, %total.076
  %1 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !5
  %add7.1 = add nsw i64 %1, %add7
  store i64 %add7.1, ptr %arrayidx.i57.2, align 8, !tbaa !5
  ret i64 %add7.1
}

define i64 @"46"(ptr %arrayidx.i535, i64 %total_missing_inv.0649, ptr %arrayidx.i536, ptr %offsets, i64 %indvars.iv691) {
bb:
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !44
  %arrayidx.i5352 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %indvars.iv691
  %0 = load i64, ptr %arrayidx.i535, align 8, !tbaa !5
  %1 = load i32, ptr %arrayidx.i536, align 4, !tbaa !22
  %conv155 = sext i32 %1 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %add152 = add nsw i64 %0, %add156
  store i64 %add152, ptr %arrayidx.i535, align 8, !tbaa !5
  ret i64 %add152
}

define i64 @"47"(ptr %arrayidx3.i.i91, i64 %0, ptr %1, i64 %2, i64 %3, ptr %arrayidx7.i.i95, i64 %4, i64 %5, ptr %arrayidx.i.i88) {
bb:
  %6 = load i64, ptr %arrayidx3.i.i91, align 8, !tbaa !5
  %and4.i.i92 = and i64 %6, %0
  %wide.load392 = load <2 x i64>, ptr %1, align 8, !tbaa !5
  %vector.recur.extract395 = extractelement <2 x i64> %wide.load392, i64 %2
  %and.i.i89 = and i64 %vector.recur.extract395, %3
  %or.i.i93 = or i64 %and4.i.i92, %and.i.i89
  %shr.i.i96 = lshr exact i64 %or.i.i93, %2
  %7 = load i64, ptr %arrayidx7.i.i95, align 8, !tbaa !5
  %xor.i.i97 = xor i64 %shr.i.i96, %7
  %and8.i.i98 = and i64 %6, %2
  %tobool.not.i.i99 = icmp eq i64 %and8.i.i98, %4
  %cond.i.i100 = select i1 %tobool.not.i.i99, i64 %4, i64 %5
  %xor9.i.i101 = xor i64 %xor.i.i97, %cond.i.i100
  store i64 %xor9.i.i101, ptr %arrayidx.i.i88, align 8, !tbaa !5
  ret i64 %xor9.i.i101
}

define i32 @"48"(ptr %add.ptr.i.i, ptr %__first, ptr %add.ptr.i, ptr %add.ptr2.i, i64 %sub1.i, i64 %mul.i) {
bb:
  %0 = load i32, ptr %add.ptr.i.i, align 4, !tbaa !22
  %1 = load i32, ptr %add.ptr2.i, align 4, !tbaa !22
  %2 = load i32, ptr %add.ptr.i, align 4, !tbaa !22
  %cmp.i.i = icmp slt i32 %2, %1
  %spec.select.i = select i1 %cmp.i.i, i64 %sub1.i, i64 %mul.i
  %add.ptr2.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i
  store i32 %0, ptr %add.ptr2.i.i, align 4, !tbaa !22
  ret i32 %0
}

define ptr @"49"(ptr %new_range.i.i, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !18
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %3 = load ptr, ptr %new_range.i.i, align 8, !tbaa !15
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !16
  ret ptr %add.ptr.i464
}

define i32 @"50"(ptr %__first, ptr %add.ptr.i, ptr %add.ptr2.i, i64 %sub1.i, i64 %mul.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr2.i, align 4, !tbaa !22
  %3 = load i32, ptr %add.ptr.i, align 4, !tbaa !22
  %cmp.i.i = icmp slt i32 %3, %2
  %spec.select.i = select i1 %cmp.i.i, i64 %sub1.i, i64 %mul.i
  %__parent.020.in.i.i = add nsw i64 %spec.select.i, %0
  %__parent.020.i.i = sdiv i64 %__parent.020.in.i.i, %1
  %add.ptr.i.i = getelementptr inbounds i32, ptr %__first, i64 %__parent.020.i.i
  %4 = load i32, ptr %add.ptr.i.i, align 4, !tbaa !22
  ret i32 %4
}

define i32 @"51"(ptr %end_size_.i.i583, i64 %sub.ptr.rhs.cast.i.i585, i64 %0, ptr %length.i581) {
bb:
  %1 = load ptr, ptr %end_size_.i.i583, align 8, !tbaa !56
  %sub.ptr.lhs.cast.i.i584 = ptrtoint ptr %1 to i64
  %sub.ptr.sub.i.i586 = sub i64 %sub.ptr.lhs.cast.i.i584, %sub.ptr.rhs.cast.i.i585
  %2 = lshr exact i64 %sub.ptr.sub.i.i586, %0
  %conv.i587 = trunc i64 %2 to i32
  store i32 %conv.i587, ptr %length.i581, align 4, !tbaa !22
  ret i32 %conv.i587
}

define <2 x float> @"52"(ptr %0, ptr %1, <2 x ptr> %2, ptr %arrayidx4.i.phi.trans.insert, i64 %3, <2 x i64> %4, ptr %outgoing_contrib, i64 %index, ptr %.omp.lb) {
bb:
  %wide.load32 = load <2 x ptr>, ptr %1, align 8, !tbaa !15
  %5 = ptrtoint <2 x ptr> %wide.load32 to <2 x i64>
  %.pre = load ptr, ptr %arrayidx4.i.phi.trans.insert, align 8, !tbaa !15
  %vector.recur.init = insertelement <2 x ptr> %2, ptr %.pre, i64 %3
  %6 = shufflevector <2 x ptr> %vector.recur.init, <2 x ptr> %wide.load32, <2 x i32> <i32 1, i32 2>
  %7 = ptrtoint <2 x ptr> %6 to <2 x i64>
  %8 = sub <2 x i64> %5, %7
  %9 = ashr exact <2 x i64> %8, %4
  %10 = sitofp <2 x i64> %9 to <2 x float>
  %wide.load = load <2 x float>, ptr %0, align 4, !tbaa !7
  %11 = fdiv <2 x float> %wide.load, %10
  %12 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %13 = sext i32 %12 to i64
  %offset.idx = add i64 %index, %13
  %14 = load ptr, ptr %outgoing_contrib, align 8, !tbaa !0
  %15 = getelementptr inbounds float, ptr %14, i64 %offset.idx
  store <2 x float> %11, ptr %15, align 4, !tbaa !7
  ret <2 x float> %11
}

define i32 @"53"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr122.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %1 = load i32, ptr %incdec.ptr122.i.i, align 4, !tbaa !57
  ret i32 %1
}

define float @"55"(ptr %arrayidx.i, ptr %arrayidx.i27, ptr %arrayidx.i27.1, i64 %0, ptr %outgoing_contrib, i32 %cond, ptr %.omp.lb, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %arrayidx.i27.1, align 8, !tbaa !15
  %sub.ptr.rhs.cast.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %arrayidx.i27, align 8, !tbaa !15
  %sub.ptr.lhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %conv12 = sitofp i64 %sub.ptr.div.i to float
  %5 = load float, ptr %arrayidx.i, align 4, !tbaa !7
  %div13 = fdiv float %5, %conv12
  %6 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %7 = sext i32 %6 to i64
  %8 = sub i32 %cond, %6
  %9 = zext i32 %8 to i64
  %10 = add nuw nsw i64 %9, %1
  %n.vec = and i64 %10, %2
  %ind.end = add nsw i64 %n.vec, %7
  %11 = load ptr, ptr %outgoing_contrib, align 8, !tbaa !0
  %arrayidx.i28 = getelementptr inbounds float, ptr %11, i64 %ind.end
  store float %div13, ptr %arrayidx.i28, align 4, !tbaa !7
  ret float %div13
}

define i8 @"56"(ptr %arrayidx.i17.i, ptr %ref.tmp, i64 %conv5.i, i64 %idxprom1.i.i) {
bb:
  %0 = load i8, ptr %arrayidx.i17.i, align 1, !tbaa !59, !noalias !60
  %1 = load ptr, ptr %ref.tmp, align 8, !tbaa !24, !alias.scope !60
  %arrayidx.i.i = getelementptr inbounds i8, ptr %1, i64 %conv5.i
  %arrayidx2.i.i = getelementptr inbounds i8, ptr %arrayidx.i.i, i64 %idxprom1.i.i
  store i8 %0, ptr %arrayidx2.i.i, align 1, !tbaa !59
  ret i8 %0
}

define i64 @"57"(ptr %new_range.i.i, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %new_range.i.i, align 8, !tbaa !15
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr13.i.i.i.i, i64 %1
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.030.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define float @"58"(ptr %arrayidx.i, ptr %arrayidx.i124, i64 %sub.ptr.rhs.cast.i, i64 %0, ptr %arrayidx.i132, ptr %incoming_sums, ptr %__begin2.0160) {
bb:
  %1 = load float, ptr %arrayidx.i132, align 4, !tbaa !7
  %2 = load float, ptr %arrayidx.i, align 4, !tbaa !7
  %3 = load ptr, ptr %arrayidx.i124, align 8, !tbaa !15
  %sub.ptr.lhs.cast.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %conv18 = sitofp i64 %sub.ptr.div.i to float
  %div19 = fdiv float %2, %conv18
  %add = fadd float %div19, %1
  %4 = load ptr, ptr %incoming_sums, align 8
  %5 = load i32, ptr %__begin2.0160, align 4, !tbaa !22
  %conv28 = sext i32 %5 to i64
  %arrayidx.i1322 = getelementptr inbounds float, ptr %4, i64 %conv28
  store float %add, ptr %arrayidx.i132, align 4, !tbaa !7
  ret float %add
}

define i64 @"59"(ptr %new_range.i.i, i64 %0) {
bb:
  %1 = load ptr, ptr %new_range.i.i, align 8, !tbaa !15
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %0
  %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !21
  ret i64 %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i
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

define i32 @"61"(ptr %arrayidx212, ptr %call171, i64 %tail_index.0660, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i542, align 8, !tbaa !5
  %2 = load i64, ptr %arrayidx.i540, align 8, !tbaa !5
  %3 = load i32, ptr %arrayidx.i541, align 4, !tbaa !22
  %conv198 = sext i32 %3 to i64
  %add199 = add nsw i64 %2, %conv198
  %4 = sub i64 %1, %add199
  %n.vec793 = and i64 %4, %0
  %ind.end796 = sub i64 %tail_index.0660, %n.vec793
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !22
  %.pre731 = sext i32 %.pre717 to i64
  %sub226 = sub nsw i64 %ind.end796, %.pre731
  %arrayidx213 = getelementptr inbounds i32, ptr %call171, i64 %sub226
  %5 = load i32, ptr %arrayidx212, align 4, !tbaa !22
  store i32 %5, ptr %arrayidx213, align 4, !tbaa !22
  ret i32 %5
}

define i8 @"62"(ptr %label) {
bb:
  %0 = load ptr, ptr %label, align 8, !tbaa !24, !noalias !63
  %1 = load i8, ptr %0, align 1, !tbaa !59
  ret i8 %1
}

define i32 @"63"(ptr %call171, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %0, i64 %1, i64 %total_missing_inv.0649, ptr %arrayidx.i536) {
bb:
  %2 = load i32, ptr %arrayidx.i536, align 4, !tbaa !22
  %conv155 = sext i32 %2 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %3 = load i64, ptr %arrayidx.i542, align 8, !tbaa !5
  %4 = load i64, ptr %arrayidx.i540, align 8, !tbaa !5
  %5 = load i32, ptr %arrayidx.i541, align 4, !tbaa !22
  %conv198 = sext i32 %5 to i64
  %add199 = add nsw i64 %4, %conv198
  %6 = sub i64 %3, %add199
  %n.vec793 = and i64 %6, %0
  %ind.end794 = sub i64 %3, %n.vec793
  %i200.0 = add nsw i64 %ind.end794, %1
  %sub211 = sub nsw i64 %i200.0, %add156
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %7 = load i32, ptr %arrayidx212, align 4, !tbaa !22
  ret i32 %7
}

define i64 @"64"(ptr %arrayidx.i, ptr %prefix, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %prefix, align 8
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %mul14 = shl i64 %2, %0
  %arrayidx.i35 = getelementptr inbounds i64, ptr %1, i64 %mul14
  %3 = load i64, ptr %arrayidx.i, align 8, !tbaa !5
  store i64 %3, ptr %arrayidx.i35, align 8, !tbaa !5
  ret i64 %3
}

define ptr @"65"(ptr %new_range.i.i, ptr %el, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !18
  %sub.ptr.rhs.cast = ptrtoint ptr %1 to i64
  %sub.ptr.lhs.cast = ptrtoint ptr %1 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %2 = load ptr, ptr %new_range.i.i, align 8, !tbaa !15
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !23
  ret ptr %add.ptr6.i.i
}

define float @"66"(ptr %arrayidx.i.prol, ptr %arrayidx.i27.prol, ptr %0, i64 %1, i64 %2, ptr %outgoing_contrib, i32 %cond, ptr %.omp.lb, i64 %3) {
bb:
  %4 = load ptr, ptr %outgoing_contrib, align 8, !tbaa !0
  %5 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %6 = sub i32 %cond, %5
  %7 = zext i32 %6 to i64
  %8 = add nuw nsw i64 %7, %1
  %n.vec = and i64 %8, %3
  %9 = sext i32 %5 to i64
  %ind.end = add nsw i64 %n.vec, %9
  %arrayidx.i28.prol = getelementptr inbounds float, ptr %4, i64 %ind.end
  %10 = load float, ptr %arrayidx.i.prol, align 4, !tbaa !7
  %wide.load32 = load <2 x ptr>, ptr %0, align 8, !tbaa !15
  %vector.recur.extract = extractelement <2 x ptr> %wide.load32, i64 %1
  %sub.ptr.rhs.cast.i.prol = ptrtoint ptr %vector.recur.extract to i64
  %11 = load ptr, ptr %arrayidx.i27.prol, align 8, !tbaa !15
  %sub.ptr.lhs.cast.i.prol = ptrtoint ptr %11 to i64
  %sub.ptr.sub.i.prol = sub i64 %sub.ptr.lhs.cast.i.prol, %sub.ptr.rhs.cast.i.prol
  %sub.ptr.div.i.prol = ashr exact i64 %sub.ptr.sub.i.prol, %2
  %conv12.prol = sitofp i64 %sub.ptr.div.i.prol to float
  %div13.prol = fdiv float %10, %conv12.prol
  store float %div13.prol, ptr %arrayidx.i28.prol, align 4, !tbaa !7
  ret float %div13.prol
}

define i32 @"67"(ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !57
  %3 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !57
  %cmp7.i.i.i.i.i = icmp slt i32 %3, %2
  %4 = load i32, ptr %v.i.i.i.i.i, align 4
  %5 = load i32, ptr %v3.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %4, %5
  %cmp.i.i.i.i.i = icmp eq i32 %3, %2
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %__parent.020.in.i.i.i.i = add nsw i64 %spec.select.i.i.i, %0
  %__parent.020.i.i.i.i = sdiv i64 %__parent.020.in.i.i.i.i, %1
  %add.ptr.i.i.i.i16 = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %__parent.020.i.i.i.i
  %6 = load i32, ptr %add.ptr.i.i.i.i16, align 4, !tbaa !57
  ret i32 %6
}

define i64 @"68"(ptr %rng, i64 %0, ptr %arrayidx42.i.i124, i64 %1, i64 %2, ptr %arrayidx49.i.i128, i64 %3, i64 %4) {
bb:
  %5 = load i64, ptr %rng, align 8, !tbaa !5
  %and52.i.i131 = and i64 %5, %2
  %tobool53.not.i.i132 = icmp eq i64 %and52.i.i131, %3
  %cond54.i.i133 = select i1 %tobool53.not.i.i132, i64 %3, i64 %4
  %6 = load i64, ptr %arrayidx49.i.i128, align 8, !tbaa !5
  %7 = load i64, ptr %arrayidx42.i.i124, align 8, !tbaa !5
  %and43.i.i125 = and i64 %7, %1
  %and46.i.i126 = and i64 %5, %0
  %or47.i.i127 = or i64 %and46.i.i126, %and43.i.i125
  %shr50.i.i129 = lshr exact i64 %or47.i.i127, %2
  %xor51.i.i130 = xor i64 %shr50.i.i129, %6
  %xor55.i.i134 = xor i64 %xor51.i.i130, %cond54.i.i133
  store i64 %xor55.i.i134, ptr %arrayidx42.i.i124, align 8, !tbaa !5
  ret i64 %xor55.i.i134
}

define i64 @"69"(ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57.3) {
bb:
  %0 = load i64, ptr %arrayidx.i58, align 8, !tbaa !5
  %add7 = add nsw i64 %0, %total.076
  %1 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !5
  %add7.1 = add nsw i64 %1, %add7
  %2 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !5
  %add7.2 = add nsw i64 %2, %add7.1
  store i64 %add7.2, ptr %arrayidx.i57.3, align 8, !tbaa !5
  ret i64 %add7.2
}

define ptr @"70"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !18
  %sub.ptr.rhs.cast = ptrtoint ptr %2 to i64
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %3 = load ptr, ptr %new_range.i.i, align 8, !tbaa !15
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !23
  ret ptr %add.ptr6.i.i
}

define ptr @"71"(ptr %call.i, ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, i64 %2, ptr %end_size_.i40) {
bb:
  %3 = load ptr, ptr %degrees, align 8, !tbaa !27
  %sub.ptr.rhs.cast.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %end_size_.i, align 8, !tbaa !46
  %sub.ptr.lhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %sub = add nsw i64 %sub.ptr.div.i, %1
  %div38 = lshr i64 %sub, %2
  %add.ptr.i = getelementptr inbounds i64, ptr %call.i, i64 %div38
  store ptr %add.ptr.i, ptr %end_size_.i40, align 8, !tbaa !56
  ret ptr %add.ptr.i
}

define i64 @"72"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !66
  %inc.i71 = add nuw nsw i64 %1, %0
  %inc.i207 = add nuw nsw i64 %inc.i71, %0
  %inc.i139 = add nuw nsw i64 %inc.i207, %0
  store i64 %inc.i139, ptr %_M_p.i.i.i, align 8, !tbaa !66
  ret i64 %inc.i139
}

define i64 @"73"(ptr %add.ptr.i.i.i.i16, ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !57
  %1 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !57
  %cmp7.i.i.i.i.i = icmp slt i32 %1, %0
  %2 = load i32, ptr %v.i.i.i.i.i, align 4
  %3 = load i32, ptr %v3.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %2, %3
  %cmp.i.i.i.i.i = icmp eq i32 %1, %0
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr2.i.i.i.i23 = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  %4 = load i64, ptr %add.ptr.i.i.i.i16, align 4
  store i64 %4, ptr %add.ptr2.i.i.i.i23, align 4
  ret i64 %4
}

define ptr @"74"(ptr %index.i139, ptr %0) {
bb:
  %1 = load ptr, ptr %index.i139, align 8, !tbaa !15
  store ptr %1, ptr %0, align 8
  ret ptr %1
}

define i64 @"75"(ptr %arrayidx.i58.epil, i64 %total.076.epil, ptr %call.i4145, ptr %num_blocks) {
bb:
  %0 = load i64, ptr %num_blocks, align 8, !tbaa !5
  %arrayidx.i = getelementptr inbounds i64, ptr %call.i4145, i64 %0
  %1 = load i64, ptr %arrayidx.i58.epil, align 8, !tbaa !5
  %add7.epil = add nsw i64 %1, %total.076.epil
  store i64 %add7.epil, ptr %arrayidx.i, align 8, !tbaa !5
  ret i64 %add7.epil
}

define i64 @"76"(ptr %_M_string_length.i.i.i, i64 %call, ptr %__dnew.i.i.i) {
bb:
  %0 = load i64, ptr %_M_string_length.i.i.i, align 8, !tbaa !55, !noalias !68
  %sub.i.i.i = sub i64 %0, %call
  store i64 %sub.i.i.i, ptr %__dnew.i.i.i, align 8, !tbaa !5, !noalias !68
  ret i64 %sub.i.i.i
}

define i64 @"77"(ptr %arrayidx.i27, i64 %0, ptr %arrayidx.i25, ptr %el, ptr %.omp.lb) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %2 = load ptr, ptr %el, align 8, !tbaa !18
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %1
  %3 = load i32, ptr %arrayidx.i25, align 4, !tbaa !22
  %ref.tmp.sroa.0.0.insert.ext = zext i32 %3 to i64
  %4 = load i32, ptr %arrayidx.i27, align 4, !tbaa !22
  %ref.tmp.sroa.4.0.insert.ext = zext i32 %4 to i64
  %ref.tmp.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp.sroa.4.0.insert.ext, %0
  %ref.tmp.sroa.0.0.insert.insert = or i64 %ref.tmp.sroa.4.0.insert.shift, %ref.tmp.sroa.0.0.insert.ext
  store i64 %ref.tmp.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp.sroa.0.0.insert.insert
}

define i32 @"78"(ptr %call171, ptr %arrayidx.i547, ptr %arrayidx.i546) {
bb:
  %0 = load i32, ptr %arrayidx.i546, align 4, !tbaa !22
  %conv246 = sext i32 %0 to i64
  %1 = load i64, ptr %arrayidx.i547, align 8, !tbaa !5
  %add247 = add nsw i64 %1, %conv246
  %arrayidx257 = getelementptr inbounds i32, ptr %call171, i64 %add247
  %2 = load i32, ptr %arrayidx257, align 4, !tbaa !22
  ret i32 %2
}

define ptr @"79"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, ptr %.omp.lb, i64 %1) {
bb:
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %3 = sext i32 %2 to i64
  %4 = add nsw i64 %3, %1
  %5 = load i8, ptr %transpose, align 1, !tbaa !71, !range !72, !noundef !73
  %tobool.not = icmp eq i8 %5, %0
  %6 = load ptr, ptr %in_index_.i, align 8
  %7 = load ptr, ptr %out_index_.i, align 8
  %.sink = select i1 %tobool.not, ptr %7, ptr %6
  %arrayidx.i.i.i60 = getelementptr inbounds ptr, ptr %.sink, i64 %4
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !15
  ret ptr %n_end.0
}

define i32 @"80"(ptr %n_start.0.in, i64 %0, i64 %1, ptr %diffs, ptr %.omp.lb) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !15
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr12.i.i.i.i to i64
  %.pre134 = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %.pre134
  %2 = lshr exact i64 %sub.ptr.sub, %1
  %conv22 = trunc i64 %2 to i32
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %4 = sext i32 %3 to i64
  %5 = load ptr, ptr %diffs, align 8, !tbaa !27
  %arrayidx.i99 = getelementptr inbounds i32, ptr %5, i64 %4
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !22
  ret i32 %conv22
}

define i64 @"81"(ptr %offsets, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %offsets, align 8, !tbaa !44
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %2 = sext i32 %1 to i64
  %arrayidx.i = getelementptr inbounds i64, ptr %0, i64 %2
  %3 = load i64, ptr %arrayidx.i, align 8, !tbaa !5
  ret i64 %3
}

define <2 x i64> @"82"(ptr %0, ptr %offsets, ptr %num_nodes_.i, i64 %1, i64 %index770, i64 %2) {
bb:
  %wide.load = load <2 x i64>, ptr %0, align 8, !tbaa !5
  %3 = load ptr, ptr %offsets, align 8
  %4 = load i64, ptr %num_nodes_.i, align 8, !tbaa !74
  %5 = and i64 %4, %1
  %offset.idx = sub i64 %5, %index770
  %6 = getelementptr inbounds i64, ptr %3, i64 %offset.idx
  %7 = getelementptr inbounds i64, ptr %6, i64 %2
  store <2 x i64> %wide.load, ptr %7, align 8, !tbaa !5
  ret <2 x i64> %wide.load
}

define i64 @"83"(ptr %offsets, ptr %num_nodes_.i) {
bb:
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !44
  %0 = load i64, ptr %num_nodes_.i, align 8, !tbaa !74
  %arrayidx.i533 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %0
  %1 = load i64, ptr %arrayidx.i533, align 8, !tbaa !5
  ret i64 %1
}

define i64 @"84"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !74
  %sext = shl i64 %1, %0
  %conv202 = ashr exact i64 %sext, %0
  %2 = load ptr, ptr %offsets, align 8, !tbaa !44
  %arrayidx.i542 = getelementptr inbounds i64, ptr %2, i64 %conv202
  %3 = load i64, ptr %arrayidx.i542, align 8, !tbaa !5
  ret i64 %3
}

define ptr @"85"(ptr %neighs, ptr %arrayidx.i.1, ptr %index, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %index, align 8, !tbaa !15
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %3 = sext i32 %2 to i64
  %indvars.iv.next = add nsw i64 %3, %0
  %arrayidx.1 = getelementptr inbounds ptr, ptr %1, i64 %indvars.iv.next
  %4 = load ptr, ptr %neighs, align 8, !tbaa !15
  %5 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !5
  %add.ptr.1 = getelementptr inbounds i32, ptr %4, i64 %5
  store ptr %add.ptr.1, ptr %arrayidx.1, align 8, !tbaa !15
  ret ptr %add.ptr.1
}

define float @"86"(ptr %top_k) {
bb:
  %0 = load ptr, ptr %top_k, align 8, !tbaa !15
  %kvp.sroa.0.0.copyload = load float, ptr %0, align 4
  ret float %kvp.sroa.0.0.copyload
}

define ptr @"87"(ptr %cond.i31.i.i.i, ptr %_M_finish.i38, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4) {
bb:
  %5 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !76
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
  store ptr %incdec.ptr.i.i.i, ptr %_M_finish.i38, align 8, !tbaa !76
  ret ptr %incdec.ptr.i.i.i
}

define i64 @"88"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %end_size_.i.i) {
bb:
  %.pre.pre.i = load ptr, ptr %end_size_.i.i, align 8, !tbaa !16
  %2 = load i32, ptr %v, align 4, !tbaa !19
  %sub = add nsw i32 %2, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %.pre.pre.i, align 4, !tbaa.struct !21
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define ptr @"89"(ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %0) {
bb:
  %1 = load ptr, ptr %new_range.i.i, align 8, !tbaa !15
  %2 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %agg.result, align 8, !tbaa !18
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = ashr exact i64 %sub.ptr.sub.i12.i.i, %0
  %add.ptr.i.i149 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %sub.ptr.div.i13.i.i
  store ptr %add.ptr.i.i149, ptr %end_size_.i.i, align 8, !tbaa !16
  ret ptr %add.ptr.i.i149
}

define i64 @"90"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !21
  ret i64 %agg.tmp.sroa.0.0.copyload.i73.i.i.i.i
}

define i32 @"91"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, ptr %v.i.i.i.i.i.i, ptr %v3.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !57
  %3 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !57
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
  %6 = load i32, ptr %add.ptr.i.i.i.i.i, align 4, !tbaa !57
  ret i32 %6
}

define float @"92"(ptr %arrayidx.i, ptr %call5.i.i.i.i4.i.i45, ptr %num_nodes_.i, i64 %0, i32 %1) {
bb:
  %2 = load float, ptr %arrayidx.i, align 4, !tbaa !7
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !9
  %n.vec = and i64 %3, %0
  %second3.i = getelementptr inbounds %"struct.std::pair", ptr %call5.i.i.i.i4.i.i45, i64 %n.vec, i32 1
  store float %2, ptr %second3.i, align 4, !tbaa !12
  ret float %2
}

define i64 @"93"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57.epil) {
bb:
  %0 = load i64, ptr %arrayidx.i58, align 8, !tbaa !5
  %add7 = add nsw i64 %0, %total.076
  %1 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !5
  %add7.1 = add nsw i64 %1, %add7
  %2 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !5
  %add7.2 = add nsw i64 %2, %add7.1
  %3 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !5
  %add7.3 = add nsw i64 %3, %add7.2
  store i64 %add7.3, ptr %arrayidx.i57.epil, align 8, !tbaa !5
  ret i64 %add7.3
}

define i32 @"94"(ptr %call171, ptr %arrayidx.i548, ptr %arrayidx.i549, ptr %arrayidx.i550, i64 %sub.ptr.rhs.cast.i.i.i.i552, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i550, align 8, !tbaa !5
  %add.ptr271 = getelementptr inbounds i32, ptr %call171, i64 %2
  %sub.ptr.lhs.cast.i.i.i.i551 = ptrtoint ptr %add.ptr271 to i64
  %sub.ptr.sub.i.i.i.i553 = sub i64 %sub.ptr.lhs.cast.i.i.i.i551, %sub.ptr.rhs.cast.i.i.i.i552
  %sub.ptr.div.i.i.i.i561 = lshr exact i64 %sub.ptr.sub.i.i.i.i553, %0
  %shr.i.i565 = lshr i64 %sub.ptr.div.i.i.i.i561, %1
  %3 = load i64, ptr %arrayidx.i548, align 8, !tbaa !5
  %add.ptr263 = getelementptr inbounds i32, ptr %call171, i64 %3
  %4 = load i32, ptr %arrayidx.i549, align 4, !tbaa !22
  %idx.ext = sext i32 %4 to i64
  %add.ptr266 = getelementptr inbounds i32, ptr %add.ptr263, i64 %idx.ext
  %incdec.ptr4.sink.i.i.i.i569 = getelementptr inbounds i32, ptr %add.ptr266, i64 %shr.i.i565
  %5 = load i32, ptr %incdec.ptr4.sink.i.i.i.i569, align 4, !tbaa !22
  ret i32 %5
}

define <2 x i64> @"95"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %rng, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
bb:
  %.pre.i.i85 = load i64, ptr %rng, align 8, !tbaa !5
  %vector.recur.init390 = insertelement <2 x i64> %2, i64 %.pre.i.i85, i64 %3
  %wide.load392 = load <2 x i64>, ptr %0, align 8, !tbaa !5
  %10 = shufflevector <2 x i64> %vector.recur.init390, <2 x i64> %wide.load392, <2 x i32> <i32 1, i32 2>
  %11 = and <2 x i64> %10, %4
  %12 = and <2 x i64> %wide.load392, %1
  %13 = or <2 x i64> %12, %11
  %14 = lshr exact <2 x i64> %13, %5
  %wide.load393 = load <2 x i64>, ptr %6, align 8, !tbaa !5
  %15 = xor <2 x i64> %14, %wide.load393
  %16 = and <2 x i64> %wide.load392, %5
  %17 = icmp eq <2 x i64> %16, %7
  %18 = select <2 x i1> %17, <2 x i64> %7, <2 x i64> %8
  %19 = xor <2 x i64> %15, %18
  store <2 x i64> %19, ptr %9, align 8, !tbaa !5
  ret <2 x i64> %19
}

define float @"96"(ptr %arrayidx.i, ptr %arrayidx.i27, ptr %0, i64 %1, i64 %2, ptr %outgoing_contrib, i32 %cond, ptr %.omp.lb, i64 %3) {
bb:
  %wide.load32 = load <2 x ptr>, ptr %0, align 8, !tbaa !15
  %vector.recur.extract = extractelement <2 x ptr> %wide.load32, i64 %1
  %sub.ptr.rhs.cast.i = ptrtoint ptr %vector.recur.extract to i64
  %4 = load ptr, ptr %arrayidx.i27, align 8, !tbaa !15
  %sub.ptr.lhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %2
  %conv12 = sitofp i64 %sub.ptr.div.i to float
  %5 = load float, ptr %arrayidx.i, align 4, !tbaa !7
  %div13 = fdiv float %5, %conv12
  %6 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %7 = sext i32 %6 to i64
  %8 = sub i32 %cond, %6
  %9 = zext i32 %8 to i64
  %10 = add nuw nsw i64 %9, %1
  %n.vec = and i64 %10, %3
  %ind.end = add nsw i64 %n.vec, %7
  %11 = load ptr, ptr %outgoing_contrib, align 8, !tbaa !0
  %arrayidx.i28 = getelementptr inbounds float, ptr %11, i64 %ind.end
  store float %div13, ptr %arrayidx.i28, align 4, !tbaa !7
  ret float %div13
}

define i64 @"97"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !66
  %inc.i71 = add nuw nsw i64 %2, %1
  %arrayidx.i65 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i71
  %3 = load i64, ptr %arrayidx.i65, align 8, !tbaa !5
  ret i64 %3
}

define ptr @"98"(ptr %new_range.i.i, ptr %end_capacity_.i.i, ptr %agg.result, i64 %0) {
bb:
  %1 = load ptr, ptr %new_range.i.i, align 8, !tbaa !15
  %2 = load ptr, ptr %end_capacity_.i.i, align 8, !tbaa !23
  %sub.ptr.lhs.cast.i7.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %agg.result, align 8, !tbaa !18
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i9.i = sub i64 %sub.ptr.lhs.cast.i7.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.sub.i9.fr.i = freeze i64 %sub.ptr.sub.i9.i
  %mul.i = ashr exact i64 %sub.ptr.sub.i9.fr.i, %0
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %mul.i
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i, align 8, !tbaa !23
  ret ptr %add.ptr6.i.i
}

define i64 @"99"(ptr %arrayidx.i, i64 %0, ptr %offsets, ptr %__begin0.0640) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !44
  %e.sroa.0.0.copyload = load i32, ptr %__begin0.0640, align 4, !tbaa.struct !21
  %conv = sext i32 %e.sroa.0.0.copyload to i64
  %arrayidx.i2 = getelementptr inbounds i64, ptr %1, i64 %conv
  %2 = load i64, ptr %arrayidx.i, align 8, !tbaa !5
  %inc = add nsw i64 %2, %0
  store i64 %inc, ptr %arrayidx.i, align 8, !tbaa !5
  ret i64 %inc
}

define i64 @"100"(i32 %shl19, ptr %arrayidx.i61, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i63, i64 %4, i64 %5, i64 %xor4.i, i64 %6, i64 %xor7.i, i32 %7, i32 %8, i32 %9, i32 %conv, i64 %10, i64 %ref.tmp30.sroa.0.0.insert.ext, ptr %el, ptr %.omp.lb) {
bb:
  %11 = load i64, ptr %arrayidx.i61, align 8, !tbaa !5
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
  %12 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %mul = shl i64 %12, %6
  %13 = load ptr, ptr %el, align 8, !tbaa !18
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %13, i64 %mul
  store i64 %ref.tmp30.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp30.sroa.0.0.insert.insert
}

define ptr @"101"(ptr %new_range.i.i, ptr %0, ptr %el, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !18
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !18
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %3 = load ptr, ptr %new_range.i.i, align 8, !tbaa !15
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !16
  ret ptr %add.ptr.i464
}

define ptr @"102"(ptr %el, ptr %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !18
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !18
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !16
  ret ptr %add.ptr.i464
}

define i64 @"103"(i64 %lsum.036, ptr %arrayidx.i32, ptr %local_sums, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %local_sums, align 8, !tbaa !44
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %arrayidx.i = getelementptr inbounds i64, ptr %0, i64 %1
  %2 = load i32, ptr %arrayidx.i32, align 4, !tbaa !22
  %conv = sext i32 %2 to i64
  %add16 = add nsw i64 %lsum.036, %conv
  store i64 %add16, ptr %arrayidx.i, align 8, !tbaa !5
  ret i64 %add16
}

define i32 @"104"(ptr %arrayidx212, ptr %call171, ptr %arrayidx.i539, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i539, align 8, !tbaa !5
  %sub183 = add nsw i64 %1, %0
  %arrayidx213 = getelementptr inbounds i32, ptr %call171, i64 %sub183
  %2 = load i32, ptr %arrayidx212, align 4, !tbaa !22
  store i32 %2, ptr %arrayidx213, align 4, !tbaa !22
  ret i32 %2
}

define float @"105"(ptr %_M_finish.i38, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !76
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %2, i64 %0
  %add.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %incdec.ptr.i.i, i64 %1
  %3 = load float, ptr %add.ptr.i.i, align 4, !tbaa !34
  ret float %3
}

define i64 @"106"(ptr %arrayidx.i.i, ptr %0, i64 %1, ptr %2) {
bb:
  %3 = load ptr, ptr %arrayidx.i.i, align 8, !tbaa !15, !noalias !78
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %0, align 8, !tbaa !15, !noalias !78
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i = ashr exact i64 %sub.ptr.sub.i.i, %1
  store i64 %sub.ptr.div.i.i, ptr %2, align 8, !alias.scope !78
  ret i64 %sub.ptr.div.i.i
}

define <2 x float> @"107"(ptr %0, ptr %1, <2 x i64> %2, ptr %outgoing_contrib, i64 %index, ptr %.omp.lb) {
bb:
  %wide.load32 = load <2 x ptr>, ptr %1, align 8, !tbaa !15
  %3 = ptrtoint <2 x ptr> %wide.load32 to <2 x i64>
  %4 = shufflevector <2 x ptr> %wide.load32, <2 x ptr> %wide.load32, <2 x i32> <i32 1, i32 2>
  %5 = ptrtoint <2 x ptr> %4 to <2 x i64>
  %6 = sub <2 x i64> %3, %5
  %7 = ashr exact <2 x i64> %6, %2
  %8 = sitofp <2 x i64> %7 to <2 x float>
  %wide.load = load <2 x float>, ptr %0, align 4, !tbaa !7
  %9 = fdiv <2 x float> %wide.load, %8
  %10 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %11 = sext i32 %10 to i64
  %offset.idx = add i64 %index, %11
  %12 = load ptr, ptr %outgoing_contrib, align 8, !tbaa !0
  %13 = getelementptr inbounds float, ptr %12, i64 %offset.idx
  store <2 x float> %9, ptr %13, align 4, !tbaa !7
  ret <2 x float> %9
}

define i8 @"108"(i8 %0, ptr %ref.tmp, ptr %__dnew.i.i.i) {
bb:
  %1 = load ptr, ptr %ref.tmp, align 8, !tbaa !24, !alias.scope !63
  %2 = load i64, ptr %__dnew.i.i.i, align 8, !tbaa !5, !noalias !63
  %arrayidx.i.i.i.i = getelementptr inbounds i8, ptr %1, i64 %2
  store i8 %0, ptr %arrayidx.i.i.i.i, align 1, !tbaa !59
  ret i8 %0
}

define i32 @"109"(i32 %conv22, ptr %diffs, i64 %indvars.iv) {
bb:
  %0 = load ptr, ptr %diffs, align 8, !tbaa !27
  %arrayidx.i99 = getelementptr inbounds i32, ptr %0, i64 %indvars.iv
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !22
  ret i32 %conv22
}

define i32 @"110"(ptr %neighs, ptr %arrayidx.i523, ptr %arrayidx.i524, i64 %sub.ptr.rhs.cast.i.i.i.i526, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i523, align 8, !tbaa !5
  %3 = load ptr, ptr %neighs, align 8, !tbaa !15
  %add.ptr = getelementptr inbounds i32, ptr %3, i64 %2
  %4 = load i64, ptr %arrayidx.i524, align 8, !tbaa !5
  %add.ptr121 = getelementptr inbounds i32, ptr %3, i64 %4
  %sub.ptr.lhs.cast.i.i.i.i525 = ptrtoint ptr %add.ptr121 to i64
  %sub.ptr.sub.i.i.i.i527 = sub i64 %sub.ptr.lhs.cast.i.i.i.i525, %sub.ptr.rhs.cast.i.i.i.i526
  %sub.ptr.div.i.i.i.i = lshr exact i64 %sub.ptr.sub.i.i.i.i527, %0
  %shr.i.i = lshr i64 %sub.ptr.div.i.i.i.i, %1
  %incdec.ptr4.sink.i.i.i.i = getelementptr inbounds i32, ptr %add.ptr, i64 %shr.i.i
  %5 = load i32, ptr %incdec.ptr4.sink.i.i.i.i, align 4, !tbaa !22
  ret i32 %5
}

define i32 @"111"(ptr %.sroa_idx.phi.trans.insert.i, ptr %second.i.i.i.i.i) {
bb:
  %.pre43.i = load i32, ptr %.sroa_idx.phi.trans.insert.i, align 4
  store i32 %.pre43.i, ptr %second.i.i.i.i.i, align 4, !tbaa !81
  ret i32 %.pre43.i
}

define i32 @"112"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %3 = sub i64 %0, %2
  %n.vec = and i64 %3, %1
  %ind.end = add i64 %2, %n.vec
  %4 = load ptr, ptr %el, align 8, !tbaa !18
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %4, i64 %ind.end
  %5 = load i32, ptr %add.ptr.prol, align 4
  ret i32 %5
}

define i32 @"113"(ptr %arrayidx.i.i.i60, ptr %n_start.0.in, i64 %0, ptr %diffs, ptr %.omp.lb) {
bb:
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !15
  %sub.ptr.lhs.cast = ptrtoint ptr %n_end.0 to i64
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !15
  %.pre134 = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %.pre134
  %1 = lshr exact i64 %sub.ptr.sub, %0
  %conv22 = trunc i64 %1 to i32
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %3 = sext i32 %2 to i64
  %4 = load ptr, ptr %diffs, align 8, !tbaa !27
  %arrayidx.i99 = getelementptr inbounds i32, ptr %4, i64 %3
  store i32 %conv22, ptr %arrayidx.i99, align 4, !tbaa !22
  ret i32 %conv22
}

define <4 x float> @"114"(<2 x float> %0, ptr %1, ptr %2) {
bb:
  %wide.load = load <2 x float>, ptr %1, align 4, !tbaa !7, !alias.scope !82
  %interleaved.vec = shufflevector <2 x float> %0, <2 x float> %wide.load, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x float> %interleaved.vec, ptr %2, align 4, !tbaa !59
  ret <4 x float> %interleaved.vec
}

define i32 @"115"(ptr %incdec.ptr.i, i64 %0, ptr %second3.i29.i.i.i) {
bb:
  %__value.sroa.0.0.copyload.i = load i64, ptr %incdec.ptr.i, align 4
  %__value.sroa.3.0.extract.shift.i.i.i = lshr i64 %__value.sroa.0.0.copyload.i, %0
  %__value.sroa.3.0.extract.trunc.i.i.i = trunc i64 %__value.sroa.3.0.extract.shift.i.i.i to i32
  store i32 %__value.sroa.3.0.extract.trunc.i.i.i, ptr %second3.i29.i.i.i, align 4, !tbaa !81
  ret i32 %__value.sroa.3.0.extract.trunc.i.i.i
}

define i32 @"116"(ptr %el, i64 %0, i64 %1, i32 %2) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr122.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %v3.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr122.i.i, i64 %1, i32 1
  %3 = load i32, ptr %v3.i.i.i.i, align 4
  ret i32 %3
}

define i64 @"117"(ptr %arrayidx.i492, ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !74
  %n.mod.vf = and i64 %1, %0
  %2 = load ptr, ptr %offsets, align 8
  %arrayidx.i493 = getelementptr inbounds i64, ptr %2, i64 %n.mod.vf
  %3 = load i64, ptr %arrayidx.i492, align 8, !tbaa !5
  store i64 %3, ptr %arrayidx.i493, align 8, !tbaa !5
  ret i64 %3
}

define i32 @"118"(ptr %num_nodes_.i, i32 %0, ptr %.omp.ub) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !9
  %conv = trunc i64 %1 to i32
  %sub3 = add nsw i32 %conv, %0
  store i32 %sub3, ptr %.omp.ub, align 4, !tbaa !22
  ret i32 %sub3
}

define i32 @"119"(ptr %arrayidx.i.i.i) {
bb:
  %0 = load ptr, ptr %arrayidx.i.i.i, align 8, !tbaa !15, !llvm.access.group !33
  %1 = load i32, ptr %0, align 4, !tbaa !22, !llvm.access.group !33
  ret i32 %1
}

define i64 @"120"(ptr %arrayidx.i533, i64 %total_missing_inv.0649, ptr %arrayidx.i536, ptr %offsets, ptr %num_nodes_.i) {
bb:
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !44
  %0 = load i64, ptr %num_nodes_.i, align 8, !tbaa !74
  %arrayidx.i5332 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %0
  %1 = load i32, ptr %arrayidx.i536, align 4, !tbaa !22
  %conv155 = sext i32 %1 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %2 = load i64, ptr %arrayidx.i533, align 8, !tbaa !5
  %add165 = add nsw i64 %2, %add156
  store i64 %add165, ptr %arrayidx.i533, align 8, !tbaa !5
  ret i64 %add165
}

define float @"121"(float %0, ptr %scores, ptr %.omp.lb) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %2 = sext i32 %1 to i64
  %3 = load ptr, ptr %scores, align 8, !tbaa !0, !llvm.access.group !33
  %arrayidx.i51 = getelementptr inbounds float, ptr %3, i64 %2
  store float %0, ptr %arrayidx.i51, align 4, !tbaa !7, !llvm.access.group !33
  ret float %0
}

define i32 @"122"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.1659, ptr %arrayidx.i541) {
bb:
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !22
  %.pre731 = sext i32 %.pre717 to i64
  %sub222 = sub nsw i64 %total_missing_inv.1659, %.pre731
  %1 = load i64, ptr %arrayidx.i542, align 8, !tbaa !5
  %i200.0 = add nsw i64 %1, %0
  %sub211 = sub nsw i64 %i200.0, %sub222
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %2 = load i32, ptr %arrayidx212, align 4, !tbaa !22
  ret i32 %2
}

define i32 @"123"(ptr %n_start.0.in, i64 %0, i64 %1) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !15
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds i32, ptr %incdec.ptr12.i.i.i.i, i64 %1
  %2 = load i32, ptr %__first.addr.030.i.i, align 4, !tbaa !22
  ret i32 %2
}

define i64 @"124"(ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %__i.018.i, i64 %add.i, i64 %inc.i, ptr %arrayidx7.i.1) {
bb:
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !5
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
  store i64 %rem.i.i17.i.1, ptr %arrayidx7.i.1, align 8, !tbaa !5
  ret i64 %rem.i.i17.i.1
}

define i32 @"125"(ptr %degrees, i64 %mul12, i64 %umin, ptr %.omp.lb, i64 %indvar, i64 %0, i64 %n.mod.vf) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %2 = add i64 %1, %indvar
  %3 = shl i64 %2, %0
  %4 = sub i64 %umin, %3
  %n.vec = sub i64 %4, %n.mod.vf
  %ind.end = add i64 %mul12, %n.vec
  %5 = load ptr, ptr %degrees, align 8, !tbaa !27
  %arrayidx.i32 = getelementptr inbounds i32, ptr %5, i64 %ind.end
  %6 = load i32, ptr %arrayidx.i32, align 4, !tbaa !22
  ret i32 %6
}

define float @"126"(ptr %scores, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %scores, align 8, !tbaa !0
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !9
  %n.vec = and i64 %3, %0
  %indvars.iv.next = add nuw nsw i64 %n.vec, %1
  %arrayidx.i.1 = getelementptr inbounds float, ptr %2, i64 %indvars.iv.next
  %4 = load float, ptr %arrayidx.i.1, align 4, !tbaa !7
  ret float %4
}

define <2 x i64> @"127"(ptr %0, <2 x i64> %1, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %7) {
bb:
  %wide.load392 = load <2 x i64>, ptr %0, align 8, !tbaa !5
  %8 = shufflevector <2 x i64> %wide.load392, <2 x i64> %wide.load392, <2 x i32> <i32 1, i32 2>
  %9 = and <2 x i64> %8, %2
  %10 = and <2 x i64> %wide.load392, %1
  %11 = or <2 x i64> %10, %9
  %12 = lshr exact <2 x i64> %11, %3
  %wide.load393 = load <2 x i64>, ptr %4, align 8, !tbaa !5
  %13 = xor <2 x i64> %12, %wide.load393
  %14 = and <2 x i64> %wide.load392, %3
  %15 = icmp eq <2 x i64> %14, %5
  %16 = select <2 x i1> %15, <2 x i64> %5, <2 x i64> %6
  %17 = xor <2 x i64> %13, %16
  store <2 x i64> %17, ptr %7, align 8, !tbaa !5
  ret <2 x i64> %17
}

define i64 @"128"(ptr %arrayidx.i27, i64 %0, ptr %arrayidx.i25, ptr %el, i64 %.omp.iv.030) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !18
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %.omp.iv.030
  %2 = load i32, ptr %arrayidx.i25, align 4, !tbaa !22
  %ref.tmp.sroa.0.0.insert.ext = zext i32 %2 to i64
  %3 = load i32, ptr %arrayidx.i27, align 4, !tbaa !22
  %ref.tmp.sroa.4.0.insert.ext = zext i32 %3 to i64
  %ref.tmp.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp.sroa.4.0.insert.ext, %0
  %ref.tmp.sroa.0.0.insert.insert = or i64 %ref.tmp.sroa.4.0.insert.shift, %ref.tmp.sroa.0.0.insert.ext
  store i64 %ref.tmp.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp.sroa.0.0.insert.insert
}

define i32 @"129"(ptr %neighs, ptr %arrayidx.i522) {
bb:
  %0 = load ptr, ptr %neighs, align 8, !tbaa !15
  %1 = load i64, ptr %arrayidx.i522, align 8, !tbaa !5
  %arrayidx112 = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %arrayidx112, align 4, !tbaa !22
  ret i32 %2
}

define i64 @"130"(ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !57
  %1 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !57
  %cmp7.i.i.i.i.i = icmp slt i32 %1, %0
  %2 = load i32, ptr %v.i.i.i.i.i, align 4
  %3 = load i32, ptr %v3.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %2, %3
  %cmp.i.i.i.i.i = icmp eq i32 %1, %0
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr3.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  %4 = load i64, ptr %add.ptr3.i.i.i, align 4
  ret i64 %4
}

define ptr @"131"(ptr %neighs, ptr %arrayidx.i.1, ptr %index, i64 %indvars.iv.next) {
bb:
  %0 = load ptr, ptr %neighs, align 8, !tbaa !15
  %1 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !5
  %add.ptr.1 = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load ptr, ptr %index, align 8, !tbaa !15
  %arrayidx.1 = getelementptr inbounds ptr, ptr %2, i64 %indvars.iv.next
  store ptr %add.ptr.1, ptr %arrayidx.1, align 8, !tbaa !15
  ret ptr %add.ptr.1
}

define i64 @"132"(ptr %arrayidx.i535, i64 %total_missing_inv.0649, ptr %offsets, i64 %indvars.iv691) {
bb:
  %.pre716.pre = load ptr, ptr %offsets, align 8, !tbaa !44
  %arrayidx.i5352 = getelementptr inbounds i64, ptr %.pre716.pre, i64 %indvars.iv691
  %0 = load i64, ptr %arrayidx.i535, align 8, !tbaa !5
  %add152 = add nsw i64 %0, %total_missing_inv.0649
  store i64 %add152, ptr %arrayidx.i535, align 8, !tbaa !5
  ret i64 %add152
}

define i64 @"133"(ptr %__first.addr.033.i.i, ptr %el, i64 %0) {
bb:
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.033.i.i, align 4
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  store i64 %agg.tmp.sroa.0.0.copyload.i.i.i, ptr %incdec.ptr13.i.i.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i64 @"134"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !66
  %inc.i71 = add nuw nsw i64 %2, %1
  %inc.i207 = add nuw nsw i64 %inc.i71, %1
  %arrayidx.i140 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i207
  %3 = load i64, ptr %arrayidx.i140, align 8, !tbaa !5
  ret i64 %3
}

define ptr @"135"(ptr %this, i64 %0, i32 %1, ptr %__first.addr.07.i.i.i.i) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !15
  %3 = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %2, i64 %0, i32 2
  store ptr %3, ptr %__first.addr.07.i.i.i.i, align 8, !tbaa !24, !alias.scope !85, !noalias !88
  ret ptr %3
}

define i64 @"136"(ptr %new_range.i.i) {
bb:
  %0 = load ptr, ptr %new_range.i.i, align 8, !tbaa !15
  %agg.tmp.sroa.0.0.copyload.i.i.i.i.i = load i64, ptr %0, align 4, !tbaa.struct !21
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i.i.i
}

define i32 @"137"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i) {
bb:
  %0 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !22
  %1 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !22
  %cmp.i.i.i.i.i = icmp slt i32 %1, %0
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add.ptr3.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %spec.select.i.i.i.i
  %2 = load i32, ptr %add.ptr3.i.i.i.i, align 4, !tbaa !22
  ret i32 %2
}

define i64 @"138"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !66
  %inc.i71 = add nuw nsw i64 %2, %1
  %arrayidx.i208 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i71
  %3 = load i64, ptr %arrayidx.i208, align 8, !tbaa !5
  ret i64 %3
}

define i32 @"139"(ptr %el, i64 %.omp.iv.040, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !18
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %.omp.iv.040
  %add.ptr.sroa_idx = getelementptr inbounds i8, ptr %add.ptr, i64 %0
  %2 = load i32, ptr %add.ptr.sroa_idx, align 4
  ret i32 %2
}

define i32 @"140"(ptr %call171, ptr %arrayidx.i548, ptr %arrayidx.i549) {
bb:
  %0 = load i64, ptr %arrayidx.i548, align 8, !tbaa !5
  %add.ptr263 = getelementptr inbounds i32, ptr %call171, i64 %0
  %1 = load i32, ptr %arrayidx.i549, align 4, !tbaa !22
  %idx.ext = sext i32 %1 to i64
  %add.ptr266 = getelementptr inbounds i32, ptr %add.ptr263, i64 %idx.ext
  %2 = load i32, ptr %add.ptr266, align 4, !tbaa !22
  ret i32 %2
}

define i64 @"141"(ptr %.omp.lb, i64 %0, i64 %1, ptr %rng) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %add10 = add i64 %2, %0
  %rem.i.i.i = and i64 %add10, %1
  store i64 %rem.i.i.i, ptr %rng, align 8, !tbaa !5
  ret i64 %rem.i.i.i
}

define i64 @"142"(ptr %__first.addr.07.i.i.i.i.i.i.i, ptr %cond.i31.i.i.i, ptr %_M_finish.i38, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4) {
bb:
  %5 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !76
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %5, i64 %0
  %6 = ptrtoint ptr %incdec.ptr.i.i to i64
  %7 = add i64 %6, %1
  %8 = sub i64 %7, %2
  %9 = lshr i64 %8, %3
  %10 = add nuw nsw i64 %9, %0
  %n.vec = and i64 %10, %4
  %11 = shl i64 %n.vec, %3
  %ind.end = getelementptr i8, ptr %cond.i31.i.i.i, i64 %11
  %12 = load i64, ptr %__first.addr.07.i.i.i.i.i.i.i, align 4, !alias.scope !90, !noalias !93
  store i64 %12, ptr %ind.end, align 4, !alias.scope !93, !noalias !90
  ret i64 %12
}

define i64 @"143"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !66
  %inc.i71 = add nuw nsw i64 %1, %0
  %inc.i207 = add nuw nsw i64 %inc.i71, %0
  store i64 %inc.i207, ptr %_M_p.i.i.i, align 8, !tbaa !66
  ret i64 %inc.i207
}

define float @"144"(ptr %arrayidx.i.1, ptr %arrayidx.i27.1, ptr %arrayidx.i27, i64 %0, ptr %outgoing_contrib, i64 %indvars.iv.next) {
bb:
  %1 = load ptr, ptr %outgoing_contrib, align 8, !tbaa !0
  %arrayidx.i28.1 = getelementptr inbounds float, ptr %1, i64 %indvars.iv.next
  %2 = load float, ptr %arrayidx.i.1, align 4, !tbaa !7
  %3 = load ptr, ptr %arrayidx.i27, align 8, !tbaa !15
  %sub.ptr.rhs.cast.i.1 = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %arrayidx.i27.1, align 8, !tbaa !15
  %sub.ptr.lhs.cast.i.1 = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i.1 = sub i64 %sub.ptr.lhs.cast.i.1, %sub.ptr.rhs.cast.i.1
  %sub.ptr.div.i.1 = ashr exact i64 %sub.ptr.sub.i.1, %0
  %conv12.1 = sitofp i64 %sub.ptr.div.i.1 to float
  %div13.1 = fdiv float %2, %conv12.1
  store float %div13.1, ptr %arrayidx.i28.1, align 4, !tbaa !7
  ret float %div13.1
}

define <4 x float> @"145"(<4 x float> %0, ptr %init_val, i64 %1, ptr %this, ptr %.omp.lb, i64 %index) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %offset.idx = add i64 %2, %index
  %3 = load ptr, ptr %this, align 8, !tbaa !0
  %4 = getelementptr inbounds float, ptr %3, i64 %offset.idx
  %5 = load float, ptr %init_val, align 4, !tbaa !7, !alias.scope !47
  %broadcast.splatinsert21 = insertelement <4 x float> %0, float %5, i64 %1
  %broadcast.splat22 = shufflevector <4 x float> %broadcast.splatinsert21, <4 x float> %0, <4 x i32> zeroinitializer
  store <4 x float> %broadcast.splat22, ptr %4, align 4, !tbaa !7, !alias.scope !50, !noalias !47
  ret <4 x float> %broadcast.splat22
}

define i32 @"146"(ptr %__first, ptr %add.ptr.i.us, ptr %add.ptr2.i.us, i64 %sub1.i.us, i64 %mul.i.us, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr2.i.us, align 4, !tbaa !22
  %3 = load i32, ptr %add.ptr.i.us, align 4, !tbaa !22
  %cmp.i.i.us = icmp slt i32 %3, %2
  %spec.select.i.us = select i1 %cmp.i.i.us, i64 %sub1.i.us, i64 %mul.i.us
  %__parent.020.in.i.i.us = add nsw i64 %spec.select.i.us, %0
  %__parent.020.i.i.us = sdiv i64 %__parent.020.in.i.i.us, %1
  %add.ptr.i.i.us = getelementptr inbounds i32, ptr %__first, i64 %__parent.020.i.i.us
  %4 = load i32, ptr %add.ptr.i.i.us, align 4, !tbaa !22
  ret i32 %4
}

define <4 x i32> @"147"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.1659, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !5
  %3 = add i64 %2, %0
  %4 = sub nsw i64 %3, %total_missing_inv.1659
  %5 = getelementptr inbounds i32, ptr %call171, i64 %4
  %6 = getelementptr inbounds i32, ptr %5, i64 %1
  %wide.load803 = load <4 x i32>, ptr %6, align 4, !tbaa !22
  ret <4 x i32> %wide.load803
}

define i64 @"148"(ptr %arrayidx, ptr %new_range, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %1 = load ptr, ptr %new_range, align 8, !tbaa !15
  %arrayidx7 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %0
  %2 = load i64, ptr %arrayidx, align 4
  store i64 %2, ptr %arrayidx7, align 4
  ret i64 %2
}

define i32 @"149"(ptr %el, i64 %0, i32 %1) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %v.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0, i32 1
  %2 = load i32, ptr %v.i.i.i.i, align 4
  ret i32 %2
}

define i64 @"150"(ptr %__begin0.sroa.0.059, i64 %0, ptr %.sroa_idx, ptr %cond.i31.i.i.i, ptr %_M_finish.i38, i64 %1, i64 %sub.ptr.rhs.cast.i, i64 %2) {
bb:
  %3 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !76
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

define float @"151"(ptr %arrayidx.i.prol, ptr %arrayidx.i27.prol, i64 %sub.ptr.rhs.cast.i.prol, i64 %0, ptr %outgoing_contrib, i64 %indvars.iv.ph) {
bb:
  %1 = load float, ptr %arrayidx.i.prol, align 4, !tbaa !7
  %2 = load ptr, ptr %arrayidx.i27.prol, align 8, !tbaa !15
  %sub.ptr.lhs.cast.i.prol = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.prol = sub i64 %sub.ptr.lhs.cast.i.prol, %sub.ptr.rhs.cast.i.prol
  %sub.ptr.div.i.prol = ashr exact i64 %sub.ptr.sub.i.prol, %0
  %conv12.prol = sitofp i64 %sub.ptr.div.i.prol to float
  %div13.prol = fdiv float %1, %conv12.prol
  %3 = load ptr, ptr %outgoing_contrib, align 8, !tbaa !0
  %arrayidx.i28.prol = getelementptr inbounds float, ptr %3, i64 %indvars.iv.ph
  store float %div13.prol, ptr %arrayidx.i28.prol, align 4, !tbaa !7
  ret float %div13.prol
}

define <2 x i64> @"152"(ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %index770, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !74
  %3 = and i64 %2, %0
  %offset.idx = sub i64 %3, %index770
  %4 = add nuw i64 %offset.idx, %0
  %5 = and i64 %4, %0
  %6 = load ptr, ptr %offsets, align 8
  %7 = getelementptr inbounds i64, ptr %6, i64 %5
  %8 = getelementptr inbounds i64, ptr %7, i64 %1
  %wide.load = load <2 x i64>, ptr %8, align 8, !tbaa !5
  ret <2 x i64> %wide.load
}

define i8 @"153"(ptr %arrayidx.i17.i, ptr %agg.tmp11, ptr %max_iters_, i32 %0, i64 %idxprom1.i.i) {
bb:
  %1 = load i32, ptr %max_iters_, align 4, !tbaa !95
  %__val.lobit.i = lshr i32 %1, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %2 = load ptr, ptr %agg.tmp11, align 8, !tbaa !24, !alias.scope !103
  %arrayidx.i.i = getelementptr inbounds i8, ptr %2, i64 %conv5.i
  %arrayidx2.i.i = getelementptr inbounds i8, ptr %arrayidx.i.i, i64 %idxprom1.i.i
  %3 = load i8, ptr %arrayidx.i17.i, align 1, !tbaa !59, !noalias !103
  store i8 %3, ptr %arrayidx2.i.i, align 1, !tbaa !59
  ret i8 %3
}

define i64 @"154"(ptr %arrayidx.i492.prol, ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i492.prol, align 8, !tbaa !5
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !74
  %n.mod.vf = and i64 %3, %0
  %arrayidx.i493.prol = getelementptr inbounds i64, ptr %2, i64 %n.mod.vf
  store i64 %1, ptr %arrayidx.i493.prol, align 8, !tbaa !5
  ret i64 %1
}

define i32 @"155"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %add15 = add i64 %2, %0
  %3 = load ptr, ptr %el, align 8, !tbaa !18
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %add15
  %add.ptr.sroa_idx.1 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %1
  %4 = load i32, ptr %add.ptr.sroa_idx.1, align 4
  ret i32 %4
}

define i64 @"156"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %call.i4145, ptr %num_blocks) {
bb:
  %0 = load i64, ptr %num_blocks, align 8, !tbaa !5
  %arrayidx.i = getelementptr inbounds i64, ptr %call.i4145, i64 %0
  %1 = load i64, ptr %arrayidx.i58, align 8, !tbaa !5
  %add7 = add nsw i64 %1, %total.076
  %2 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !5
  %add7.1 = add nsw i64 %2, %add7
  %3 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !5
  %add7.2 = add nsw i64 %3, %add7.1
  %4 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !5
  %add7.3 = add nsw i64 %4, %add7.2
  store i64 %add7.3, ptr %arrayidx.i, align 8, !tbaa !5
  ret i64 %add7.3
}

define i64 @"157"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i = load i64, ptr %incdec.ptr.i.i.i.i, align 4, !tbaa.struct !21
  ret i64 %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i
}

define i64 @"158"(ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !74
  %n.mod.vf = and i64 %2, %0
  %sub = add nuw i64 %n.mod.vf, %1
  %conv34 = and i64 %sub, %1
  %3 = load ptr, ptr %offsets, align 8
  %arrayidx.i492 = getelementptr inbounds i64, ptr %3, i64 %conv34
  %4 = load i64, ptr %arrayidx.i492, align 8, !tbaa !5
  ret i64 %4
}

define i32 @"159"(ptr %el, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %1 = load ptr, ptr %el, align 8, !tbaa !18
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %0
  %2 = load i32, ptr %add.ptr, align 4
  ret i32 %2
}

define i32 @"160"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %2 = load ptr, ptr %el, align 8, !tbaa !18
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %1
  %add.ptr.sroa_idx = getelementptr inbounds i8, ptr %add.ptr, i64 %0
  %3 = load i32, ptr %add.ptr.sroa_idx, align 4
  ret i32 %3
}

define i64 @"161"(ptr %arrayidx.i18.i, ptr %0, i64 %1, ptr %2) {
bb:
  %3 = load ptr, ptr %0, align 8, !tbaa !15, !noalias !78
  %sub.ptr.rhs.cast.i20.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %arrayidx.i18.i, align 8, !tbaa !15, !noalias !78
  %sub.ptr.lhs.cast.i19.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i21.i = sub i64 %sub.ptr.lhs.cast.i19.i, %sub.ptr.rhs.cast.i20.i
  %sub.ptr.div.i22.i = ashr exact i64 %sub.ptr.sub.i21.i, %1
  %div.i.i = sdiv i64 %sub.ptr.div.i22.i, %1
  store i64 %div.i.i, ptr %2, align 8, !alias.scope !78
  ret i64 %div.i.i
}

define ptr @"162"(ptr %out_index_.i, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %out_index_.i, align 8, !tbaa !41
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %2 = sext i32 %1 to i64
  %arrayidx4.i.phi.trans.insert = getelementptr inbounds ptr, ptr %0, i64 %2
  %.pre = load ptr, ptr %arrayidx4.i.phi.trans.insert, align 8, !tbaa !15
  ret ptr %.pre
}

define float @"163"(ptr %scores, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %1 = sext i32 %0 to i64
  %2 = load ptr, ptr %scores, align 8, !tbaa !0, !llvm.access.group !33
  %arrayidx.i51 = getelementptr inbounds float, ptr %2, i64 %1
  %3 = load float, ptr %arrayidx.i51, align 4, !tbaa !7, !llvm.access.group !33
  ret float %3
}

define float @"164"(ptr %init_val, ptr %this, ptr %.omp.lb) {
bb:
  %0 = load float, ptr %init_val, align 4, !tbaa !7
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %2 = load ptr, ptr %this, align 8, !tbaa !0
  %add.ptr.prol = getelementptr inbounds float, ptr %2, i64 %1
  store float %0, ptr %add.ptr.prol, align 4, !tbaa !7
  ret float %0
}

define <2 x i32> @"165"(ptr %degrees, ptr %.omp.lb, i64 %0, i64 %index, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %mul12 = shl i64 %2, %0
  %offset.idx = add i64 %mul12, %index
  %3 = load ptr, ptr %degrees, align 8, !tbaa !27
  %4 = getelementptr inbounds i32, ptr %3, i64 %offset.idx
  %5 = getelementptr inbounds i32, ptr %4, i64 %1
  %wide.load42 = load <2 x i32>, ptr %5, align 4, !tbaa !22
  ret <2 x i32> %wide.load42
}

define i64 @"166"(ptr %offsets, ptr %arrayidx112, i32 %0) {
bb:
  %1 = load i32, ptr %arrayidx112, align 4, !tbaa !22
  %add117 = add nsw i32 %1, %0
  %conv118 = sext i32 %add117 to i64
  %.pre716.pre727 = load ptr, ptr %offsets, align 8, !tbaa !44
  %arrayidx.i524 = getelementptr inbounds i64, ptr %.pre716.pre727, i64 %conv118
  %2 = load i64, ptr %arrayidx.i524, align 8, !tbaa !5
  ret i64 %2
}

define float @"167"(ptr %scores, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load ptr, ptr %scores, align 8, !tbaa !0
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !9
  %n.vec = and i64 %2, %0
  %arrayidx.i = getelementptr inbounds float, ptr %1, i64 %n.vec
  %3 = load float, ptr %arrayidx.i, align 4, !tbaa !7
  ret float %3
}

define ptr @"168"(ptr %cond.i31, i64 %.sroa.speculated.i, ptr %_M_finish.i.i, ptr %this, i64 %0, i64 %sub.ptr.div.i.i, i1 %cmp9.i, i64 %1, i64 %add.i, ptr %_M_end_of_storage) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !15
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !106
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i2 = ashr exact i64 %sub.ptr.sub.i.i, %0
  %add.i4 = add i64 %.sroa.speculated.i, %sub.ptr.div.i.i
  %cmp7.i = icmp ult i64 %add.i, %sub.ptr.div.i.i
  %or.cond.i = or i1 %cmp7.i, %cmp9.i
  %cond.i = select i1 %or.cond.i, i64 %1, i64 %add.i
  %add.ptr19 = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %cond.i
  store ptr %add.ptr19, ptr %_M_end_of_storage, align 8, !tbaa !107
  ret ptr %add.ptr19
}

define i64 @"169"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !66
  %inc.i71 = add nuw nsw i64 %1, %0
  %inc.i64 = add nuw nsw i64 %inc.i71, %0
  store i64 %inc.i64, ptr %_M_p.i.i.i, align 8, !tbaa !66
  ret i64 %inc.i64
}

define <2 x float> @"171"(ptr %scores, i64 %index, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %1 = sext i32 %0 to i64
  %offset.idx = add i64 %index, %1
  %2 = load ptr, ptr %scores, align 8, !tbaa !0
  %3 = getelementptr inbounds float, ptr %2, i64 %offset.idx
  %wide.load = load <2 x float>, ptr %3, align 4, !tbaa !7
  ret <2 x float> %wide.load
}

define <2 x i64> @"172"(ptr %0, <2 x i64> %1, <2 x i64> %vector.recur90, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %7) {
bb:
  %wide.load91 = load <2 x i64>, ptr %0, align 8, !tbaa !5
  %8 = and <2 x i64> %wide.load91, %1
  %9 = shufflevector <2 x i64> %vector.recur90, <2 x i64> %wide.load91, <2 x i32> <i32 1, i32 2>
  %10 = and <2 x i64> %9, %2
  %11 = or <2 x i64> %8, %10
  %12 = lshr exact <2 x i64> %11, %3
  %wide.load92 = load <2 x i64>, ptr %4, align 8, !tbaa !5
  %13 = xor <2 x i64> %12, %wide.load92
  %14 = and <2 x i64> %wide.load91, %3
  %15 = icmp eq <2 x i64> %14, %5
  %16 = select <2 x i1> %15, <2 x i64> %5, <2 x i64> %6
  %17 = xor <2 x i64> %13, %16
  store <2 x i64> %17, ptr %7, align 8, !tbaa !5
  ret <2 x i64> %17
}

define <2 x i64> @"173"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %.omp.lb, i64 %3, i64 %4, i64 %5, <2 x i64> %6, <2 x i64> %7, ptr %8, <2 x i64> %9, <2 x i64> %10, ptr %11) {
bb:
  %wide.load91 = load <2 x i64>, ptr %0, align 8, !tbaa !5
  %12 = and <2 x i64> %wide.load91, %1
  %13 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %add8 = add i64 %13, %3
  %rem.i.i.i = and i64 %add8, %4
  %vector.recur.init89 = insertelement <2 x i64> %2, i64 %rem.i.i.i, i64 %5
  %14 = shufflevector <2 x i64> %vector.recur.init89, <2 x i64> %wide.load91, <2 x i32> <i32 1, i32 2>
  %15 = and <2 x i64> %14, %6
  %16 = or <2 x i64> %12, %15
  %17 = lshr exact <2 x i64> %16, %7
  %wide.load92 = load <2 x i64>, ptr %8, align 8, !tbaa !5
  %18 = xor <2 x i64> %17, %wide.load92
  %19 = and <2 x i64> %wide.load91, %7
  %20 = icmp eq <2 x i64> %19, %9
  %21 = select <2 x i1> %20, <2 x i64> %9, <2 x i64> %10
  %22 = xor <2 x i64> %18, %21
  store <2 x i64> %22, ptr %11, align 8, !tbaa !5
  ret <2 x i64> %22
}

define i64 @"174"(ptr %__first.addr.033.i.i, ptr %new_range.i.i, i64 %0) {
bb:
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.033.i.i, align 4
  %1 = load ptr, ptr %new_range.i.i, align 8, !tbaa !15
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %0
  store i64 %agg.tmp.sroa.0.0.copyload.i.i.i, ptr %incdec.ptr13.i.i.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i8 @"175"(i8 %storemerge.i.i, ptr %agg.tmp11, ptr %max_iters_, i32 %0) {
bb:
  %1 = load ptr, ptr %agg.tmp11, align 8, !tbaa !24, !alias.scope !103
  %2 = load i32, ptr %max_iters_, align 4, !tbaa !95
  %__val.lobit.i = lshr i32 %2, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %arrayidx.i.i = getelementptr inbounds i8, ptr %1, i64 %conv5.i
  store i8 %storemerge.i.i, ptr %arrayidx.i.i, align 1, !tbaa !59
  ret i8 %storemerge.i.i
}

define i64 @"176"(ptr %num_edges_, i64 %0, i64 %1, i64 %2, ptr %.omp.ub) {
bb:
  %3 = load i64, ptr %num_edges_, align 8, !tbaa !108
  %sub3 = add nuw i64 %3, %0
  %div36 = lshr i64 %sub3, %1
  %sub4 = add nsw i64 %div36, %2
  store i64 %sub4, ptr %.omp.ub, align 8, !tbaa !5
  ret i64 %sub4
}

define ptr @"177"(ptr %call.i134135, ptr %num_nodes, i64 %0, ptr %end_size_.i) {
bb:
  %1 = load i64, ptr %num_nodes, align 8, !tbaa !5
  %add = add nsw i64 %1, %0
  %add.ptr.i = getelementptr inbounds i64, ptr %call.i134135, i64 %add
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !56
  ret ptr %add.ptr.i
}

define i64 @"178"(ptr %offsets, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %2 = sext i32 %1 to i64
  %indvars.iv.next = add nsw i64 %2, %0
  %3 = load ptr, ptr %offsets, align 8, !tbaa !44
  %arrayidx.i.1 = getelementptr inbounds i64, ptr %3, i64 %indvars.iv.next
  %4 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !5
  ret i64 %4
}

define i64 @"179"(ptr %arrayidx.i58.epil, i64 %total.076.epil, ptr %arrayidx.i57.epil) {
bb:
  %0 = load i64, ptr %arrayidx.i58.epil, align 8, !tbaa !5
  %add7.epil = add nsw i64 %0, %total.076.epil
  store i64 %add7.epil, ptr %arrayidx.i57.epil, align 8, !tbaa !5
  ret i64 %add7.epil
}

define i64 @"180"(ptr %el) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %agg.tmp.sroa.0.0.copyload.i.i.i.i.i = load i64, ptr %.pre, align 4, !tbaa.struct !21
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i.i.i
}

define i64 @"181"(ptr %max_seen.i, i32 %0, ptr %num_nodes_) {
bb:
  %1 = load i32, ptr %max_seen.i, align 4, !tbaa !22
  %add = add nsw i32 %1, %0
  %conv = sext i32 %add to i64
  store i64 %conv, ptr %num_nodes_, align 8, !tbaa !74
  ret i64 %conv
}

define i32 @"182"(ptr %num_nodes_.i, i64 %0, i64 %1, ptr %add.ptr.i.1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !9
  %n.vec = and i64 %2, %0
  %indvars.iv.next = add nuw nsw i64 %n.vec, %1
  %3 = trunc i64 %indvars.iv.next to i32
  store i32 %3, ptr %add.ptr.i.1, align 4, !tbaa !54
  ret i32 %3
}

define i32 @"183"(ptr %__first.addr.033.i.i, ptr %n_start.0.in, i64 %0) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !15
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %1 = load i32, ptr %__first.addr.033.i.i, align 4, !tbaa !22
  store i32 %1, ptr %incdec.ptr12.i.i.i.i, align 4, !tbaa !22
  ret i32 %1
}

define i32 @"184"(ptr %end_size_.i, ptr %offsets, i64 %0, ptr %length.i138) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !44
  %sub.ptr.rhs.cast.i.i142 = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !56
  %sub.ptr.lhs.cast.i.i141 = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i143 = sub i64 %sub.ptr.lhs.cast.i.i141, %sub.ptr.rhs.cast.i.i142
  %3 = lshr exact i64 %sub.ptr.sub.i.i143, %0
  %conv.i144 = trunc i64 %3 to i32
  store i32 %conv.i144, ptr %length.i138, align 4, !tbaa !22
  ret i32 %conv.i144
}

define float @"185"(ptr %arrayidx.i, ptr %arrayidx.i124, ptr %0, i64 %1, ptr %arrayidx.i132, ptr %incoming_sums, ptr %__begin2.0160) {
bb:
  %2 = load float, ptr %arrayidx.i132, align 4, !tbaa !7
  %.pre = load ptr, ptr %0, align 8, !tbaa !15
  %sub.ptr.rhs.cast.i = ptrtoint ptr %.pre to i64
  %3 = load ptr, ptr %arrayidx.i124, align 8, !tbaa !15
  %sub.ptr.lhs.cast.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %1
  %conv18 = sitofp i64 %sub.ptr.div.i to float
  %4 = load float, ptr %arrayidx.i, align 4, !tbaa !7
  %div19 = fdiv float %4, %conv18
  %add = fadd float %div19, %2
  %5 = load ptr, ptr %incoming_sums, align 8
  %6 = load i32, ptr %__begin2.0160, align 4, !tbaa !22
  %conv28 = sext i32 %6 to i64
  %arrayidx.i1322 = getelementptr inbounds float, ptr %5, i64 %conv28
  store float %add, ptr %arrayidx.i132, align 4, !tbaa !7
  ret float %add
}

define float @"186"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %add7 = add i64 %1, %0
  %2 = load ptr, ptr %this, align 8, !tbaa !0
  %add.ptr.1 = getelementptr inbounds float, ptr %2, i64 %add7
  %3 = load float, ptr %init_val, align 4, !tbaa !7
  store float %3, ptr %add.ptr.1, align 4, !tbaa !7
  ret float %3
}

define i8 @"187"(ptr %arrayidx17.i.i, ptr %agg.tmp11, ptr %max_iters_, i32 %0) {
bb:
  %1 = load i8, ptr %arrayidx17.i.i, align 2, !tbaa !59, !noalias !103
  %2 = load i32, ptr %max_iters_, align 4, !tbaa !95
  %__val.lobit.i = lshr i32 %2, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %3 = load ptr, ptr %agg.tmp11, align 8, !tbaa !24, !alias.scope !103
  %arrayidx.i.i = getelementptr inbounds i8, ptr %3, i64 %conv5.i
  store i8 %1, ptr %arrayidx.i.i, align 1, !tbaa !59
  ret i8 %1
}

define i64 @"188"(ptr %add.ptr.i.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, ptr %v.i.i.i.i.i.i, ptr %v3.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %add.ptr.i.i.i.i.i, align 4
  %2 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !57
  %3 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !57
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

define i32 @"189"(ptr %add.ptr.i.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0) {
bb:
  %1 = load i32, ptr %add.ptr.i.i.i.i.i, align 4, !tbaa !22
  %2 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !22
  %3 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !22
  %cmp.i.i.i.i.i = icmp slt i32 %3, %2
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %add.ptr2.i.i.i.i.i = getelementptr inbounds i32, ptr %__first, i64 %sub12.i.i.i.i
  store i32 %1, ptr %add.ptr2.i.i.i.i.i, align 4, !tbaa !22
  ret i32 %1
}

define i64 @"190"(ptr %end_size_, ptr %this, i64 %0, i64 %1, ptr %.omp.ub) {
bb:
  %2 = load ptr, ptr %end_size_, align 8, !tbaa !109
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %this, align 8, !tbaa !0
  %sub.ptr.rhs.cast = ptrtoint ptr %3 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %sub = add nsw i64 %sub.ptr.div, %1
  store i64 %sub, ptr %.omp.ub, align 8, !tbaa !5
  ret i64 %sub
}

define i64 @"191"(ptr %el, i64 %0, i64 %1) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds %struct.EdgePair, ptr %incdec.ptr13.i.i.i.i, i64 %1
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.030.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i32 @"192"(ptr %degrees, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %mul14 = shl i64 %1, %0
  %2 = load ptr, ptr %degrees, align 8, !tbaa !27
  %arrayidx.i36 = getelementptr inbounds i32, ptr %2, i64 %mul14
  %3 = load i32, ptr %arrayidx.i36, align 4, !tbaa !22
  ret i32 %3
}

define i64 @"193"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !66
  %inc.i71 = add nuw nsw i64 %1, %0
  store i64 %inc.i71, ptr %_M_p.i.i.i, align 8, !tbaa !66
  ret i64 %inc.i71
}

define i64 @"194"(ptr %__begin0.sroa.0.059, i64 %0, ptr %.sroa_idx, ptr %_M_finish.i38, i64 %1) {
bb:
  %2 = load i32, ptr %__begin0.sroa.0.059, align 4
  %retval.sroa.2.0.insert.ext.i = zext i32 %2 to i64
  %retval.sroa.2.0.insert.shift.i = shl nuw i64 %retval.sroa.2.0.insert.ext.i, %0
  %3 = load i32, ptr %.sroa_idx, align 4
  %retval.sroa.0.0.insert.ext.i = zext i32 %3 to i64
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i
  %4 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !76
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %4, i64 %1
  store i64 %retval.sroa.0.0.insert.insert.i, ptr %incdec.ptr.i.i, align 4
  ret i64 %retval.sroa.0.0.insert.insert.i
}

define ptr @"195"(ptr %cond.i31.i.i.i, i64 %.sroa.speculated.i.i.i.i, ptr %_M_finish.i38, i64 %0, i64 %sub.ptr.rhs.cast.i, i64 %1, i64 %sub.ptr.div.i, i1 %cmp9.i.i.i.i, i64 %2, i64 %add.i.i.i.i, ptr %_M_end_of_storage.i.i) {
bb:
  %3 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !76
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %3, i64 %0
  %sub.ptr.lhs.cast.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i2 = ashr exact i64 %sub.ptr.sub.i, %1
  %add.i.i.i.i4 = add i64 %.sroa.speculated.i.i.i.i, %sub.ptr.div.i
  %cmp7.i.i.i.i = icmp ult i64 %add.i.i.i.i, %sub.ptr.div.i
  %or.cond.i.i.i.i = or i1 %cmp7.i.i.i.i, %cmp9.i.i.i.i
  %cond.i.i.i.i = select i1 %or.cond.i.i.i.i, i64 %2, i64 %add.i.i.i.i
  %add.ptr19.i.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %cond.i31.i.i.i, i64 %cond.i.i.i.i
  store ptr %add.ptr19.i.i.i, ptr %_M_end_of_storage.i.i, align 8, !tbaa !110
  ret ptr %add.ptr19.i.i.i
}

define float @"196"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add7 = add i64 %ind.end, %2
  %5 = load ptr, ptr %this, align 8, !tbaa !0
  %add.ptr.1 = getelementptr inbounds float, ptr %5, i64 %add7
  %6 = load float, ptr %init_val, align 4, !tbaa !7
  store float %6, ptr %add.ptr.1, align 4, !tbaa !7
  ret float %6
}

define i64 @"197"(ptr %__begin0.sroa.0.059, i64 %0, ptr %.sroa_idx, ptr %add.ptr.i.i.i) {
bb:
  %1 = load i32, ptr %.sroa_idx, align 4
  %retval.sroa.0.0.insert.ext.i = zext i32 %1 to i64
  %2 = load i32, ptr %__begin0.sroa.0.059, align 4
  %retval.sroa.2.0.insert.ext.i = zext i32 %2 to i64
  %retval.sroa.2.0.insert.shift.i = shl nuw i64 %retval.sroa.2.0.insert.ext.i, %0
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i
  store i64 %retval.sroa.0.0.insert.insert.i, ptr %add.ptr.i.i.i, align 4
  ret i64 %retval.sroa.0.0.insert.insert.i
}

define ptr @"198"(ptr %new_range.i.i457, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !18
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %3 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !15
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !16
  ret ptr %add.ptr.i464
}

define <8 x i32> @"199"(ptr %el, ptr %.omp.lb, i64 %index) {
bb:
  %0 = load ptr, ptr %el, align 8, !tbaa !18
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %offset.idx = add i64 %1, %index
  %2 = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %offset.idx
  %wide.vec = load <8 x i32>, ptr %2, align 4
  ret <8 x i32> %wide.vec
}

define i64 @"200"(ptr %arrayidx.i58, ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, i64 %add7, ptr %arrayidx.i57.1) {
bb:
  %0 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !5
  %add7.1 = add nsw i64 %0, %add7
  %1 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !5
  %add7.2 = add nsw i64 %1, %add7.1
  %2 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !5
  %add7.3 = add nsw i64 %2, %add7.2
  %3 = load i64, ptr %arrayidx.i58, align 8, !tbaa !5
  %add72 = add nsw i64 %3, %add7.3
  store i64 %add7, ptr %arrayidx.i57.1, align 8, !tbaa !5
  ret i64 %add7
}

define i64 @"201"(ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !74
  %n.mod.vf = and i64 %3, %0
  %sub.prol = add nuw i64 %n.mod.vf, %1
  %conv34.prol = and i64 %sub.prol, %1
  %arrayidx.i492.prol = getelementptr inbounds i64, ptr %2, i64 %conv34.prol
  %4 = load i64, ptr %arrayidx.i492.prol, align 8, !tbaa !5
  ret i64 %4
}

define float @"202"(ptr %arrayidx.i, ptr %arrayidx.i27, ptr %arrayidx4.i.phi.trans.insert, i64 %0, ptr %outgoing_contrib, i32 %cond, ptr %.omp.lb, i64 %1, i64 %2) {
bb:
  %.pre = load ptr, ptr %arrayidx4.i.phi.trans.insert, align 8, !tbaa !15
  %sub.ptr.rhs.cast.i = ptrtoint ptr %.pre to i64
  %3 = load ptr, ptr %arrayidx.i27, align 8, !tbaa !15
  %sub.ptr.lhs.cast.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %conv12 = sitofp i64 %sub.ptr.div.i to float
  %4 = load float, ptr %arrayidx.i, align 4, !tbaa !7
  %div13 = fdiv float %4, %conv12
  %5 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %6 = sext i32 %5 to i64
  %7 = sub i32 %cond, %5
  %8 = zext i32 %7 to i64
  %9 = add nuw nsw i64 %8, %1
  %n.vec = and i64 %9, %2
  %ind.end = add nsw i64 %n.vec, %6
  %10 = load ptr, ptr %outgoing_contrib, align 8, !tbaa !0
  %arrayidx.i28 = getelementptr inbounds float, ptr %10, i64 %ind.end
  store float %div13, ptr %arrayidx.i28, align 4, !tbaa !7
  ret float %div13
}

define float @"203"(ptr %init_val, ptr %this, i64 %.omp.iv.018) {
bb:
  %0 = load float, ptr %init_val, align 4, !tbaa !7
  %1 = load ptr, ptr %this, align 8, !tbaa !0
  %add.ptr = getelementptr inbounds float, ptr %1, i64 %.omp.iv.018
  store float %0, ptr %add.ptr, align 4, !tbaa !7
  ret float %0
}

define ptr @"204"(ptr %call.i5155, ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, ptr %end_size_.i53) {
bb:
  %2 = load ptr, ptr %degrees, align 8, !tbaa !27
  %sub.ptr.rhs.cast.i48 = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !46
  %sub.ptr.lhs.cast.i47 = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i49 = sub i64 %sub.ptr.lhs.cast.i47, %sub.ptr.rhs.cast.i48
  %sub.ptr.div.i50 = ashr exact i64 %sub.ptr.sub.i49, %0
  %add13 = add nsw i64 %sub.ptr.div.i50, %1
  %add.ptr.i52 = getelementptr inbounds i64, ptr %call.i5155, i64 %add13
  store ptr %add.ptr.i52, ptr %end_size_.i53, align 8, !tbaa !56
  ret ptr %add.ptr.i52
}

define <4 x i32> @"205"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.0649, ptr %arrayidx.i536, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !5
  %3 = add i64 %2, %0
  %4 = load i32, ptr %arrayidx.i536, align 4, !tbaa !22
  %conv155 = sext i32 %4 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %5 = sub nsw i64 %3, %add156
  %6 = getelementptr inbounds i32, ptr %call171, i64 %5
  %7 = getelementptr inbounds i32, ptr %6, i64 %1
  %wide.load803 = load <4 x i32>, ptr %7, align 4, !tbaa !22
  ret <4 x i32> %wide.load803
}

define ptr @"206"(ptr %out_index.i, ptr %num_nodes_.i) {
bb:
  %0 = load ptr, ptr %out_index.i, align 8, !tbaa !15, !noalias !78
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !9, !noalias !78
  %arrayidx.i.i = getelementptr inbounds ptr, ptr %0, i64 %1
  %2 = load ptr, ptr %arrayidx.i.i, align 8, !tbaa !15, !noalias !78
  ret ptr %2
}

define <2 x i32> @"207"(ptr %degrees, i64 %offset.idx) {
bb:
  %0 = load ptr, ptr %degrees, align 8, !tbaa !27
  %1 = getelementptr inbounds i32, ptr %0, i64 %offset.idx
  %wide.load = load <2 x i32>, ptr %1, align 4, !tbaa !22
  ret <2 x i32> %wide.load
}

define i64 @"208"(i64 %0, ptr %offsets, ptr %num_nodes_.i, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !74
  %n.mod.vf = and i64 %2, %1
  %3 = load ptr, ptr %offsets, align 8
  %arrayidx.i493734 = getelementptr inbounds i64, ptr %3, i64 %n.mod.vf
  store i64 %0, ptr %arrayidx.i493734, align 8, !tbaa !5
  ret i64 %0
}

define i64 @"209"(ptr %offsets, ptr %num_nodes_.i, i32 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !44
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !74
  %3 = trunc i64 %2 to i32
  %n184.0657 = add i32 %3, %0
  %4 = zext i32 %n184.0657 to i64
  %arrayidx.i540 = getelementptr inbounds i64, ptr %1, i64 %4
  %5 = load i64, ptr %arrayidx.i540, align 8, !tbaa !5
  ret i64 %5
}

define ptr @"210"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, ptr %.omp.lb) {
bb:
  %1 = load i8, ptr %transpose, align 1, !tbaa !71, !range !72, !noundef !73
  %tobool.not = icmp eq i8 %1, %0
  %2 = load ptr, ptr %in_index_.i, align 8
  %3 = load ptr, ptr %out_index_.i, align 8
  %.pn = select i1 %tobool.not, ptr %3, ptr %2
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %5 = sext i32 %4 to i64
  %n_start.0.in = getelementptr inbounds ptr, ptr %.pn, i64 %5
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !15
  ret ptr %n_start.0
}

define i64 @"211"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %end_size_.i.i) {
bb:
  %2 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !16
  %3 = load i32, ptr %v, align 4, !tbaa !19
  %sub = add nsw i32 %3, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %2, align 4, !tbaa.struct !21
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i64 @"212"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %2) {
bb:
  %3 = load i32, ptr %v, align 4, !tbaa !19
  %sub = add nsw i32 %3, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %2, align 4, !tbaa.struct !21
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"213"(ptr %top_k, i64 %0) {
bb:
  %1 = load ptr, ptr %top_k, align 8, !tbaa !15
  %kvp.sroa.5.0.call22.sroa_idx = getelementptr inbounds i8, ptr %1, i64 %0
  %kvp.sroa.5.0.copyload = load i32, ptr %kvp.sroa.5.0.call22.sroa_idx, align 4
  ret i32 %kvp.sroa.5.0.copyload
}

define i32 @"214"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %5 = load ptr, ptr %el, align 8, !tbaa !18
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %ind.end
  %add.ptr.sroa_idx.prol = getelementptr inbounds i8, ptr %add.ptr.prol, i64 %2
  %6 = load i32, ptr %add.ptr.sroa_idx.prol, align 4
  ret i32 %6
}

define i32 @"215"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add15 = add i64 %ind.end, %2
  %5 = load ptr, ptr %el, align 8, !tbaa !18
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %add15
  %6 = load i32, ptr %add.ptr.1, align 4
  ret i32 %6
}

define i32 @"216"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %3 = sub i64 %0, %2
  %n.vec = and i64 %3, %1
  %ind.end = add i64 %2, %n.vec
  %4 = load ptr, ptr %el, align 8, !tbaa !18
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %4, i64 %ind.end
  %5 = load i32, ptr %add.ptr, align 4
  ret i32 %5
}

define ptr @"217"(ptr %neighs, ptr %arrayidx.i, ptr %index, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %1 = sext i32 %0 to i64
  %2 = load ptr, ptr %index, align 8, !tbaa !15
  %arrayidx = getelementptr inbounds ptr, ptr %2, i64 %1
  %3 = load ptr, ptr %neighs, align 8, !tbaa !15
  %4 = load i64, ptr %arrayidx.i, align 8, !tbaa !5
  %add.ptr = getelementptr inbounds i32, ptr %3, i64 %4
  store ptr %add.ptr, ptr %arrayidx, align 8, !tbaa !15
  ret ptr %add.ptr
}

define i64 @"218"(ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, i64 %2, ptr %num_blocks) {
bb:
  %3 = load ptr, ptr %degrees, align 8, !tbaa !27
  %sub.ptr.rhs.cast.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %end_size_.i, align 8, !tbaa !46
  %sub.ptr.lhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %sub = add nsw i64 %sub.ptr.div.i, %1
  %div38 = lshr i64 %sub, %2
  store i64 %div38, ptr %num_blocks, align 8, !tbaa !5
  ret i64 %div38
}

define i64 @"219"(ptr %arrayidx.i58.3, ptr %arrayidx.i58.2, ptr %arrayidx.i58.1, ptr %arrayidx.i58, i64 %total.076, ptr %arrayidx.i57) {
bb:
  %0 = load i64, ptr %arrayidx.i58, align 8, !tbaa !5
  %add7 = add nsw i64 %0, %total.076
  %1 = load i64, ptr %arrayidx.i58.1, align 8, !tbaa !5
  %add7.1 = add nsw i64 %1, %add7
  %2 = load i64, ptr %arrayidx.i58.2, align 8, !tbaa !5
  %add7.2 = add nsw i64 %2, %add7.1
  %3 = load i64, ptr %arrayidx.i58.3, align 8, !tbaa !5
  %add7.3 = add nsw i64 %3, %add7.2
  store i64 %add7.3, ptr %arrayidx.i57, align 8, !tbaa !5
  ret i64 %add7.3
}

define i64 @"220"(ptr %add.ptr3.i.i.i, ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i, ptr %v3.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i64, ptr %add.ptr3.i.i.i, align 4
  %1 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !57
  %2 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !57
  %cmp7.i.i.i.i.i = icmp slt i32 %2, %1
  %3 = load i32, ptr %v.i.i.i.i.i, align 4
  %4 = load i32, ptr %v3.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i = icmp slt i32 %3, %4
  %cmp.i.i.i.i.i = icmp eq i32 %2, %1
  %cond.i.i.i.i.i = select i1 %cmp.i.i.i.i.i, i1 %cmp4.i.i.i.i.i, i1 %cmp7.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr4.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  store i64 %0, ptr %add.ptr4.i.i.i, align 4
  ret i64 %0
}

define float @"221"(ptr %scores, i32 %cond, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %3 = sub i32 %cond, %2
  %4 = zext i32 %3 to i64
  %5 = add nuw nsw i64 %4, %0
  %n.vec = and i64 %5, %1
  %6 = sext i32 %2 to i64
  %ind.end = add nsw i64 %n.vec, %6
  %7 = load ptr, ptr %scores, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds float, ptr %7, i64 %ind.end
  %8 = load float, ptr %arrayidx.i, align 4, !tbaa !7
  ret float %8
}

define ptr @"222"(ptr %el, ptr %0, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !18
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %add.ptr.i464 = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div14
  store ptr %add.ptr.i464, ptr %end_size_.i, align 8, !tbaa !16
  ret ptr %add.ptr.i464
}

define i32 @"223"(ptr %e.sroa.5.0..sroa_idx, ptr %0, ptr %offsets, ptr %add.ptr, i64 %1) {
bb:
  %e.sroa.0.0.copyload = load i32, ptr %add.ptr, align 4, !tbaa.struct !21
  %conv = sext i32 %e.sroa.0.0.copyload to i64
  %2 = load ptr, ptr %offsets, align 8, !tbaa !44
  %arrayidx.i = getelementptr inbounds i64, ptr %2, i64 %conv
  %3 = atomicrmw add ptr %arrayidx.i, i64 %1 seq_cst, align 8
  %4 = load ptr, ptr %0, align 8, !tbaa !15
  %arrayidx = getelementptr inbounds i32, ptr %4, i64 %3
  %e.sroa.5.0.copyload = load i32, ptr %e.sroa.5.0..sroa_idx, align 4, !tbaa.struct !111
  store i32 %e.sroa.5.0.copyload, ptr %arrayidx, align 4, !tbaa !22
  ret i32 %e.sroa.5.0.copyload
}

define float @"224"(ptr %arrayidx.i.1, ptr %second3.i.1) {
bb:
  %0 = load float, ptr %arrayidx.i.1, align 4, !tbaa !7
  store float %0, ptr %second3.i.1, align 4, !tbaa !12
  ret float %0
}

define i64 @"225"(ptr %new_range.i.i, i64 %0) {
bb:
  %1 = load ptr, ptr %new_range.i.i, align 8, !tbaa !15
  %incdec.ptr.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %0
  %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i = load i64, ptr %incdec.ptr.i.i.i.i, align 4, !tbaa.struct !21
  ret i64 %agg.tmp.sroa.0.0.copyload.i58.i.i.i.i
}

define <8 x i32> @"226"(ptr %el, ptr %.omp.lb, i64 %index, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !18
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %offset.idx = add i64 %2, %index
  %3 = add i64 %offset.idx, %0
  %4 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %3
  %wide.vec44 = load <8 x i32>, ptr %4, align 4
  ret <8 x i32> %wide.vec44
}

define i32 @"228"(i32 %0, ptr %call171, ptr %arrayidx.i548, i64 %1, ptr %arrayidx.i549) {
bb:
  %2 = load i64, ptr %arrayidx.i548, align 8, !tbaa !5
  %add286 = add i64 %2, %1
  %3 = load i32, ptr %arrayidx.i549, align 4, !tbaa !22
  %idx.ext = sext i32 %3 to i64
  %sub287 = add i64 %add286, %idx.ext
  %arrayidx288 = getelementptr inbounds i32, ptr %call171, i64 %sub287
  store i32 %0, ptr %arrayidx288, align 4, !tbaa !22
  ret i32 %0
}

define ptr @"230"(ptr %new_range.i.i457, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %.pre711 = load ptr, ptr %el, align 8, !tbaa !18
  %.pre730 = ptrtoint ptr %.pre711 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre730
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %2 = load ptr, ptr %new_range.i.i457, align 8, !tbaa !15
  %add.ptr6.i.i478 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i478, ptr %end_capacity_.i.i.i, align 8, !tbaa !23
  ret ptr %add.ptr6.i.i478
}

define i8 @"231"(ptr %0, ptr %opt_arg) {
bb:
  %1 = load i8, ptr %0, align 8, !tbaa !59
  %2 = load ptr, ptr %opt_arg, align 8, !tbaa !24
  store i8 %1, ptr %2, align 1, !tbaa !59
  ret i8 %1
}

define <4 x i32> @"232"(ptr %0, ptr %call171, ptr %arrayidx.i539, i64 %1, i64 %index800, i64 %2) {
bb:
  %3 = load i64, ptr %arrayidx.i539, align 8, !tbaa !5
  %sub183 = add nsw i64 %3, %1
  %offset.idx801 = sub i64 %sub183, %index800
  %4 = getelementptr inbounds i32, ptr %call171, i64 %offset.idx801
  %5 = getelementptr inbounds i32, ptr %4, i64 %2
  %wide.load803 = load <4 x i32>, ptr %0, align 4, !tbaa !22
  store <4 x i32> %wide.load803, ptr %5, align 4, !tbaa !22
  ret <4 x i32> %wide.load803
}

define i64 @"233"(ptr %incdec.ptr126.i.i, ptr %el, i64 %0) {
bb:
  %1 = load i64, ptr %incdec.ptr126.i.i, align 4
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr5.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  store i64 %1, ptr %incdec.ptr5.i.i, align 4
  ret i64 %1
}

define float @"234"(ptr %arrayidx.i.prol, ptr %call5.i.i.i.i4.i.i45, ptr %num_nodes_.i, i64 %0, i32 %1) {
bb:
  %2 = load float, ptr %arrayidx.i.prol, align 4, !tbaa !7
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !9
  %n.vec = and i64 %3, %0
  %second3.i.prol = getelementptr inbounds %"struct.std::pair", ptr %call5.i.i.i.i4.i.i45, i64 %n.vec, i32 1
  store float %2, ptr %second3.i.prol, align 4, !tbaa !12
  ret float %2
}

define i32 @"235"(ptr %num_nodes, i64 %0, ptr %length.i) {
bb:
  %1 = load i64, ptr %num_nodes, align 8, !tbaa !5
  %add = add nsw i64 %1, %0
  %conv.i = trunc i64 %add to i32
  store i32 %conv.i, ptr %length.i, align 4, !tbaa !22
  ret i32 %conv.i
}

define ptr @"236"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %2 = load ptr, ptr %new_range.i.i, align 8, !tbaa !15
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !16
  ret ptr %add.ptr.i
}

define ptr @"237"(ptr %el, i64 %sub.ptr.rhs.cast, i64 %0, ptr %end_size_.i) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !18
  %sub.ptr.lhs.cast = ptrtoint ptr %1 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !16
  ret ptr %add.ptr.i
}

define i64 @"238"(ptr %arrayidx.i533, i64 %total_missing_inv.0.lcssa) {
bb:
  %0 = load i64, ptr %arrayidx.i533, align 8, !tbaa !5
  %add165 = add nsw i64 %0, %total_missing_inv.0.lcssa
  store i64 %add165, ptr %arrayidx.i533, align 8, !tbaa !5
  ret i64 %add165
}

define <4 x i32> @"239"(ptr %0, ptr %call171, i64 %tail_index.0660, ptr %arrayidx.i542, ptr %arrayidx.i540, ptr %arrayidx.i541, i64 %1, i64 %index800, i64 %2) {
bb:
  %3 = load i64, ptr %arrayidx.i542, align 8, !tbaa !5
  %4 = load i64, ptr %arrayidx.i540, align 8, !tbaa !5
  %5 = load i32, ptr %arrayidx.i541, align 4, !tbaa !22
  %conv198 = sext i32 %5 to i64
  %add199 = add nsw i64 %4, %conv198
  %6 = sub i64 %3, %add199
  %n.vec793 = and i64 %6, %1
  %ind.end796 = sub i64 %tail_index.0660, %n.vec793
  %.pre717 = load i32, ptr %arrayidx.i541, align 4, !tbaa !22
  %.pre731 = sext i32 %.pre717 to i64
  %sub226 = sub nsw i64 %ind.end796, %.pre731
  %offset.idx801 = sub i64 %sub226, %index800
  %7 = getelementptr inbounds i32, ptr %call171, i64 %offset.idx801
  %8 = getelementptr inbounds i32, ptr %7, i64 %2
  %wide.load803 = load <4 x i32>, ptr %0, align 4, !tbaa !22
  store <4 x i32> %wide.load803, ptr %8, align 4, !tbaa !22
  ret <4 x i32> %wide.load803
}

define i32 @"240"(ptr %num_nodes_.i, i64 %0, ptr %add.ptr.i) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !9
  %n.vec = and i64 %1, %0
  %2 = trunc i64 %n.vec to i32
  store i32 %2, ptr %add.ptr.i, align 4, !tbaa !54
  ret i32 %2
}

define float @"241"(ptr %scores, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !9
  %n.vec = and i64 %1, %0
  %2 = load ptr, ptr %scores, align 8, !tbaa !0
  %arrayidx.i.prol = getelementptr inbounds float, ptr %2, i64 %n.vec
  %3 = load float, ptr %arrayidx.i.prol, align 4, !tbaa !7
  ret float %3
}

define i64 @"242"(ptr %offsets, ptr %num_nodes_.i, i32 %0, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !74
  %3 = trunc i64 %2 to i32
  %n184.0657 = add i32 %3, %0
  %4 = zext i32 %n184.0657 to i64
  %sext = shl i64 %4, %1
  %conv202 = ashr exact i64 %sext, %1
  %5 = load ptr, ptr %offsets, align 8, !tbaa !44
  %arrayidx.i542 = getelementptr inbounds i64, ptr %5, i64 %conv202
  %6 = load i64, ptr %arrayidx.i542, align 8, !tbaa !5
  ret i64 %6
}

define i32 @"243"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %2 = load ptr, ptr %el, align 8, !tbaa !18
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %1
  %add.ptr.sroa_idx.prol = getelementptr inbounds i8, ptr %add.ptr.prol, i64 %0
  %3 = load i32, ptr %add.ptr.sroa_idx.prol, align 4
  ret i32 %3
}

define float @"244"(ptr %init_val, ptr %this, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %this, align 8, !tbaa !0
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %add.ptr = getelementptr inbounds float, ptr %0, i64 %1
  %2 = load float, ptr %init_val, align 4, !tbaa !7
  store float %2, ptr %add.ptr, align 4, !tbaa !7
  ret float %2
}

define i32 @"245"(ptr %__first.addr.033.i.i, ptr %n_start.0.in) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !15
  %0 = load i32, ptr %__first.addr.033.i.i, align 4, !tbaa !22
  store i32 %0, ptr %n_start.0, align 4, !tbaa !22
  ret i32 %0
}

define double @"246"(ptr %0, ptr %1, ptr %2) {
bb:
  %3 = load ptr, ptr %2, align 8
  %4 = load double, ptr %0, align 8, !tbaa !52
  %5 = load double, ptr %1, align 8, !tbaa !52
  %add = fadd double %4, %5
  store double %add, ptr %0, align 8, !tbaa !52
  ret double %add
}

define i8 @"247"(ptr %arrayidx17.i.i, ptr %ref.tmp, i64 %conv5.i) {
bb:
  %0 = load i8, ptr %arrayidx17.i.i, align 2, !tbaa !59, !noalias !60
  %1 = load ptr, ptr %ref.tmp, align 8, !tbaa !24, !alias.scope !60
  %arrayidx.i.i = getelementptr inbounds i8, ptr %1, i64 %conv5.i
  store i8 %0, ptr %arrayidx.i.i, align 1, !tbaa !59
  ret i8 %0
}

define i32 @"248"(ptr %e.sroa.4.0..sroa_idx, ptr %el, ptr %arrayidx.i) {
bb:
  %e.sroa.4.0.copyload = load i32, ptr %e.sroa.4.0..sroa_idx, align 4, !tbaa.struct !111
  %0 = load ptr, ptr %el, align 8, !tbaa !18
  %1 = load i64, ptr %arrayidx.i, align 8, !tbaa !5
  %arrayidx = getelementptr inbounds i32, ptr %0, i64 %1
  store i32 %e.sroa.4.0.copyload, ptr %arrayidx, align 4, !tbaa !22
  ret i32 %e.sroa.4.0.copyload
}

define ptr @"249"(ptr %out_index_.i, i32 %cond, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %out_index_.i, align 8, !tbaa !41
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %4 = sub i32 %cond, %3
  %5 = zext i32 %4 to i64
  %6 = add nuw nsw i64 %5, %0
  %n.vec = and i64 %6, %1
  %7 = sext i32 %3 to i64
  %ind.end = add nsw i64 %n.vec, %7
  %indvars.iv.next.prol = add nsw i64 %ind.end, %0
  %arrayidx.i27.prol = getelementptr inbounds ptr, ptr %2, i64 %indvars.iv.next.prol
  %8 = load ptr, ptr %arrayidx.i27.prol, align 8, !tbaa !15
  ret ptr %8
}

define i64 @"250"(ptr %_M_string_length.i23.i.i.i.phi.trans.insert, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !15
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %_M_string_length.i24.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i, i32 1
  %.pre = load i64, ptr %_M_string_length.i23.i.i.i.phi.trans.insert, align 8, !tbaa !55
  store i64 %.pre, ptr %_M_string_length.i24.i.i.i, align 8, !tbaa !55
  ret i64 %.pre
}

define i32 @"251"(ptr %call171, ptr %arrayidx.i542, i64 %0, i64 %total_missing_inv.0649, ptr %arrayidx.i536) {
bb:
  %1 = load i32, ptr %arrayidx.i536, align 4, !tbaa !22
  %conv155 = sext i32 %1 to i64
  %add156 = add nsw i64 %total_missing_inv.0649, %conv155
  %2 = load i64, ptr %arrayidx.i542, align 8, !tbaa !5
  %i200.0 = add nsw i64 %2, %0
  %sub211 = sub nsw i64 %i200.0, %add156
  %arrayidx212 = getelementptr inbounds i32, ptr %call171, i64 %sub211
  %3 = load i32, ptr %arrayidx212, align 4, !tbaa !22
  ret i32 %3
}

define i32 @"252"(ptr %.omp.lb, ptr %permutation, i64 %indvars.iv) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %1 = sext i32 %0 to i64
  %2 = trunc i64 %1 to i32
  %3 = load ptr, ptr %permutation, align 8, !tbaa !27
  %arrayidx.i = getelementptr inbounds i32, ptr %3, i64 %indvars.iv
  store i32 %2, ptr %arrayidx.i, align 4, !tbaa !22
  ret i32 %2
}

define i64 @"253"(ptr %arrayidx.i492.1, ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !74
  %n.mod.vf = and i64 %3, %0
  %indvars.iv.next = add nsw i64 %n.mod.vf, %1
  %arrayidx.i493.1 = getelementptr inbounds i64, ptr %2, i64 %indvars.iv.next
  %4 = load i64, ptr %arrayidx.i492.1, align 8, !tbaa !5
  store i64 %4, ptr %arrayidx.i493.1, align 8, !tbaa !5
  ret i64 %4
}

define i32 @"254"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %add15 = add i64 %1, %0
  %2 = load ptr, ptr %el, align 8, !tbaa !18
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %add15
  %3 = load i32, ptr %add.ptr.1, align 4
  ret i32 %3
}

define i64 @"255"(ptr %this, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %1 = load ptr, ptr %this, align 8, !tbaa !18
  %arrayidx = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %0
  %2 = load i64, ptr %arrayidx, align 4
  ret i64 %2
}

define i64 @"256"(ptr %el, i64 %0) {
bb:
  %.pre = load ptr, ptr %el, align 8, !tbaa !18
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre, i64 %0
  %agg.tmp.sroa.0.0.copyload.i78.i.i.i.i = load i64, ptr %incdec.ptr13.i.i.i.i, align 4, !tbaa.struct !21
  ret i64 %agg.tmp.sroa.0.0.copyload.i78.i.i.i.i
}

define i64 @"257"(ptr %0, ptr %_M_finish.i38, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5) {
bb:
  %6 = load ptr, ptr %_M_finish.i38, align 8, !tbaa !76
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.8", ptr %6, i64 %1
  %7 = ptrtoint ptr %incdec.ptr.i.i to i64
  %8 = add i64 %7, %2
  %9 = sub i64 %8, %3
  %10 = lshr i64 %9, %4
  %11 = add nuw nsw i64 %10, %1
  %n.vec = and i64 %11, %5
  %12 = shl i64 %n.vec, %4
  %ind.end64 = getelementptr i8, ptr %0, i64 %12
  %13 = load i64, ptr %ind.end64, align 4, !alias.scope !90, !noalias !93
  ret i64 %13
}

define float @"258"(ptr %arrayidx.i.1, ptr %arrayidx.i27.1, ptr %arrayidx.i27, i64 %0, ptr %outgoing_contrib, i32 %cond, ptr %.omp.lb, i64 %1, i64 %2) {
bb:
  %3 = load float, ptr %arrayidx.i.1, align 4, !tbaa !7
  %4 = load ptr, ptr %arrayidx.i27, align 8, !tbaa !15
  %sub.ptr.rhs.cast.i.1 = ptrtoint ptr %4 to i64
  %5 = load ptr, ptr %arrayidx.i27.1, align 8, !tbaa !15
  %sub.ptr.lhs.cast.i.1 = ptrtoint ptr %5 to i64
  %sub.ptr.sub.i.1 = sub i64 %sub.ptr.lhs.cast.i.1, %sub.ptr.rhs.cast.i.1
  %sub.ptr.div.i.1 = ashr exact i64 %sub.ptr.sub.i.1, %0
  %conv12.1 = sitofp i64 %sub.ptr.div.i.1 to float
  %div13.1 = fdiv float %3, %conv12.1
  %6 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %7 = sext i32 %6 to i64
  %8 = sub i32 %cond, %6
  %9 = zext i32 %8 to i64
  %10 = add nuw nsw i64 %9, %1
  %n.vec = and i64 %10, %2
  %ind.end = add nsw i64 %n.vec, %7
  %indvars.iv.next = add nsw i64 %ind.end, %1
  %11 = load ptr, ptr %outgoing_contrib, align 8, !tbaa !0
  %arrayidx.i28.1 = getelementptr inbounds float, ptr %11, i64 %indvars.iv.next
  store float %div13.1, ptr %arrayidx.i28.1, align 4, !tbaa !7
  ret float %div13.1
}

define ptr @"259"(ptr %neighs, ptr %arrayidx.i.prol, ptr %index, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %index, align 8, !tbaa !15
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %2 = sext i32 %1 to i64
  %arrayidx.prol = getelementptr inbounds ptr, ptr %0, i64 %2
  %3 = load ptr, ptr %neighs, align 8, !tbaa !15
  %4 = load i64, ptr %arrayidx.i.prol, align 8, !tbaa !5
  %add.ptr.prol = getelementptr inbounds i32, ptr %3, i64 %4
  store ptr %add.ptr.prol, ptr %arrayidx.prol, align 8, !tbaa !15
  ret ptr %add.ptr.prol
}

define float @"260"(ptr %arrayidx.i, ptr %arrayidx.i27, ptr %arrayidx.i27.prol, i64 %0, ptr %outgoing_contrib, i32 %cond, ptr %.omp.lb, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %arrayidx.i27.prol, align 8, !tbaa !15
  %sub.ptr.rhs.cast.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %arrayidx.i27, align 8, !tbaa !15
  %sub.ptr.lhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %conv12 = sitofp i64 %sub.ptr.div.i to float
  %5 = load float, ptr %arrayidx.i, align 4, !tbaa !7
  %div13 = fdiv float %5, %conv12
  %6 = load i32, ptr %.omp.lb, align 4, !tbaa !22
  %7 = sext i32 %6 to i64
  %8 = sub i32 %cond, %6
  %9 = zext i32 %8 to i64
  %10 = add nuw nsw i64 %9, %1
  %n.vec = and i64 %10, %2
  %ind.end = add nsw i64 %n.vec, %7
  %11 = load ptr, ptr %outgoing_contrib, align 8, !tbaa !0
  %arrayidx.i28 = getelementptr inbounds float, ptr %11, i64 %ind.end
  store float %div13, ptr %arrayidx.i28, align 4, !tbaa !7
  ret float %div13
}

define i32 @"261"(ptr %end_size_.i.i583, ptr %offsets, i64 %0, ptr %length.i581) {
bb:
  %1 = load ptr, ptr %end_size_.i.i583, align 8, !tbaa !56
  %sub.ptr.lhs.cast.i.i584 = ptrtoint ptr %1 to i64
  %.pre721 = load ptr, ptr %offsets, align 8, !tbaa !44
  %sub.ptr.rhs.cast.i.i585 = ptrtoint ptr %.pre721 to i64
  %sub.ptr.sub.i.i586 = sub i64 %sub.ptr.lhs.cast.i.i584, %sub.ptr.rhs.cast.i.i585
  %2 = lshr exact i64 %sub.ptr.sub.i.i586, %0
  %conv.i587 = trunc i64 %2 to i32
  store i32 %conv.i587, ptr %length.i581, align 4, !tbaa !22
  ret i32 %conv.i587
}

define i32 @"262"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3) {
bb:
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !5
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add15 = add i64 %ind.end, %2
  %6 = load ptr, ptr %el, align 8, !tbaa !18
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %6, i64 %add15
  %add.ptr.sroa_idx.1 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %3
  %7 = load i32, ptr %add.ptr.sroa_idx.1, align 4
  ret i32 %7
}

define i32 @"263"(i64 %indvars.iv699, ptr %incdec.ptr4.sink.i.i.i.i569, ptr %__first.addr.015.i.i563, ptr %call171, ptr %arrayidx.i550, i64 %sub.ptr.rhs.cast.i.i.i.i552, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i550, align 8, !tbaa !5
  %add.ptr271 = getelementptr inbounds i32, ptr %call171, i64 %2
  %sub.ptr.lhs.cast.i.i.i.i551 = ptrtoint ptr %add.ptr271 to i64
  %sub.ptr.sub.i.i.i.i553 = sub i64 %sub.ptr.lhs.cast.i.i.i.i551, %sub.ptr.rhs.cast.i.i.i.i552
  %sub.ptr.div.i.i.i.i561 = lshr exact i64 %sub.ptr.sub.i.i.i.i553, %0
  %shr.i.i565 = lshr i64 %sub.ptr.div.i.i.i.i561, %1
  %incdec.ptr4.sink.i.i.i.i5692 = getelementptr inbounds i32, ptr %__first.addr.015.i.i563, i64 %shr.i.i565
  %incdec.ptr.i.i571 = getelementptr inbounds i32, ptr %incdec.ptr4.sink.i.i.i.i569, i64 %1
  %3 = load i32, ptr %incdec.ptr4.sink.i.i.i.i569, align 4, !tbaa !22
  %4 = sext i32 %3 to i64
  %cmp.i.i.i570 = icmp sgt i64 %indvars.iv699, %4
  %__first.addr.1.i.i574 = select i1 %cmp.i.i.i570, ptr %incdec.ptr.i.i571, ptr %__first.addr.015.i.i563
  %5 = load i32, ptr %__first.addr.1.i.i574, align 4, !tbaa !22
  ret i32 %5
}

define ptr @"264"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, i64 %1) {
bb:
  %2 = load i8, ptr %transpose, align 1, !tbaa !71, !range !72, !noundef !73
  %tobool.not = icmp eq i8 %2, %0
  %3 = load ptr, ptr %in_index_.i, align 8
  %4 = load ptr, ptr %out_index_.i, align 8
  %.sink = select i1 %tobool.not, ptr %4, ptr %3
  %arrayidx.i.i.i60 = getelementptr inbounds ptr, ptr %.sink, i64 %1
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !15
  ret ptr %n_end.0
}

!0 = !{!1, !2, i64 0}
!1 = !{!"_ZTS7pvectorIfE", !2, i64 0, !2, i64 8, !2, i64 16}
!2 = !{!"any pointer", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !3, i64 0}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !3, i64 0}
!9 = !{!10, !6, i64 8}
!10 = !{!"_ZTS8CSRGraphIiiLb1EE", !11, i64 0, !6, i64 8, !6, i64 16, !2, i64 24, !2, i64 32, !2, i64 40, !2, i64 48}
!11 = !{!"bool", !3, i64 0}
!12 = !{!13, !8, i64 4}
!13 = !{!"_ZTSSt4pairIifE", !14, i64 0, !8, i64 4}
!14 = !{!"int", !3, i64 0}
!15 = !{!2, !2, i64 0}
!16 = !{!17, !2, i64 8}
!17 = !{!"_ZTS7pvectorI8EdgePairIiiEE", !2, i64 0, !2, i64 8, !2, i64 16}
!18 = !{!17, !2, i64 0}
!19 = !{!20, !14, i64 0}
!20 = !{!"_ZTS10NodeWeightIiiE", !14, i64 0, !14, i64 4}
!21 = !{i64 0, i64 4, !22, i64 4, i64 4, !22}
!22 = !{!14, !14, i64 0}
!23 = !{!17, !2, i64 16}
!24 = !{!25, !2, i64 0}
!25 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !26, i64 0, !6, i64 8, !3, i64 16}
!26 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !2, i64 0}
!27 = !{!28, !2, i64 0}
!28 = !{!"_ZTS7pvectorIiE", !2, i64 0, !2, i64 8, !2, i64 16}
!29 = !{!10, !2, i64 40}
!30 = !{!31}
!31 = distinct !{!31, !32, !"_ZNK8CSRGraphIiiLb1EE8in_neighEim: %agg.result"}
!32 = distinct !{!32, !"_ZNK8CSRGraphIiiLb1EE8in_neighEim"}
!33 = distinct !{}
!34 = !{!35, !8, i64 0}
!35 = !{!"_ZTSSt4pairIfiE", !8, i64 0, !14, i64 4}
!36 = !{!37, !2, i64 8}
!37 = !{!"_ZTSNSt12_Vector_baseISt4pairIifESaIS1_EE17_Vector_impl_dataE", !2, i64 0, !2, i64 8, !2, i64 16}
!38 = !{!39, !6, i64 0}
!39 = !{!"_ZTSNSt24uniform_int_distributionImE10param_typeE", !6, i64 0, !6, i64 8}
!40 = !{!39, !6, i64 8}
!41 = !{!10, !2, i64 24}
!42 = !{!43, !6, i64 8}
!43 = !{!"_ZTS9GeneratorIiiijLi32ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEE", !14, i64 0, !6, i64 8, !6, i64 16}
!44 = !{!45, !2, i64 0}
!45 = !{!"_ZTS7pvectorIlE", !2, i64 0, !2, i64 8, !2, i64 16}
!46 = !{!28, !2, i64 8}
!47 = !{!48}
!48 = distinct !{!48, !49}
!49 = distinct !{!49, !"LVerDomain"}
!50 = !{!51}
!51 = distinct !{!51, !49}
!52 = !{!53, !53, i64 0}
!53 = !{!"double", !3, i64 0}
!54 = !{!13, !14, i64 0}
!55 = !{!25, !6, i64 8}
!56 = !{!45, !2, i64 8}
!57 = !{!58, !14, i64 0}
!58 = !{!"_ZTS8EdgePairIiiE", !14, i64 0, !14, i64 4}
!59 = !{!3, !3, i64 0}
!60 = !{!61}
!61 = distinct !{!61, !62, !"_ZNSt7__cxx119to_stringEi: %agg.result"}
!62 = distinct !{!62, !"_ZNSt7__cxx119to_stringEi"}
!63 = !{!64}
!64 = distinct !{!64, !65, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_: %agg.result"}
!65 = distinct !{!65, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_"}
!66 = !{!67, !6, i64 4992}
!67 = !{!"_ZTSSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE", !3, i64 0, !6, i64 4992}
!68 = !{!69}
!69 = distinct !{!69, !70, !"_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm: %agg.result"}
!70 = distinct !{!70, !"_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm"}
!71 = !{!11, !11, i64 0}
!72 = !{i8 0, i8 2}
!73 = !{}
!74 = !{!75, !6, i64 16}
!75 = !{!"_ZTS11BuilderBaseIiiiLb1EE", !2, i64 0, !11, i64 8, !11, i64 9, !11, i64 10, !6, i64 16}
!76 = !{!77, !2, i64 8}
!77 = !{!"_ZTSNSt12_Vector_baseISt4pairIfiESaIS1_EE17_Vector_impl_dataE", !2, i64 0, !2, i64 8, !2, i64 16}
!78 = !{!79}
!79 = distinct !{!79, !80, !"_ZN11BuilderBaseIiiiLb1EE11SquishGraphERK8CSRGraphIiiLb1EE: %agg.result"}
!80 = distinct !{!80, !"_ZN11BuilderBaseIiiiLb1EE11SquishGraphERK8CSRGraphIiiLb1EE"}
!81 = !{!35, !14, i64 4}
!82 = !{!83}
!83 = distinct !{!83, !84}
!84 = distinct !{!84, !"LVerDomain"}
!85 = !{!86}
!86 = distinct !{!86, !87, !"_ZSt19__relocate_object_aINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_SaIS5_EEvPT_PT0_RT1_: %__orig"}
!87 = distinct !{!87, !"_ZSt19__relocate_object_aINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_SaIS5_EEvPT_PT0_RT1_"}
!88 = !{!89}
!89 = distinct !{!89, !87, !"_ZSt19__relocate_object_aINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES5_SaIS5_EEvPT_PT0_RT1_: %__dest"}
!90 = !{!91}
!91 = distinct !{!91, !92, !"_ZSt19__relocate_object_aISt4pairIfiES1_SaIS1_EEvPT_PT0_RT1_: %__orig"}
!92 = distinct !{!92, !"_ZSt19__relocate_object_aISt4pairIfiES1_SaIS1_EEvPT_PT0_RT1_"}
!93 = !{!94}
!94 = distinct !{!94, !92, !"_ZSt19__relocate_object_aISt4pairIfiES1_SaIS1_EEvPT_PT0_RT1_: %__dest"}
!95 = !{!96, !14, i64 172}
!96 = !{!"_ZTS10CLPageRank", !97, i64 0, !14, i64 172, !53, i64 176}
!97 = !{!"_ZTS5CLApp", !98, i64 0, !11, i64 155, !14, i64 156, !6, i64 160, !11, i64 168, !11, i64 169}
!98 = !{!"_ZTS6CLBase", !14, i64 8, !2, i64 16, !25, i64 24, !25, i64 56, !99, i64 88, !14, i64 112, !14, i64 116, !25, i64 120, !11, i64 152, !11, i64 153, !11, i64 154}
!99 = !{!"_ZTSSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !100, i64 0}
!100 = !{!"_ZTSSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !101, i64 0}
!101 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implE", !102, i64 0}
!102 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_Vector_impl_dataE", !2, i64 0, !2, i64 8, !2, i64 16}
!103 = !{!104}
!104 = distinct !{!104, !105, !"_ZNSt7__cxx119to_stringEi: %agg.result"}
!105 = distinct !{!105, !"_ZNSt7__cxx119to_stringEi"}
!106 = !{!102, !2, i64 8}
!107 = !{!102, !2, i64 16}
!108 = !{!43, !6, i64 16}
!109 = !{!1, !2, i64 8}
!110 = !{!77, !2, i64 16}
!111 = !{i64 0, i64 4, !22}
