; ModuleID = 'tc-idioms'
source_filename = "tc-idioms"
target triple = "riscv64"

%"struct.std::pair.31" = type <{ i64, i32, [4 x i8] }>
%struct.EdgePair = type { i32, i32 }
%"struct.std::pair.65" = type { %"struct.std::pair.31", i64 }
%"struct.__gnu_parallel::_LoserTreeBase<long, std::less<long>>::_Loser" = type { i8, i32, i64 }
%"struct.__gnu_parallel::_LoserTreeBase<EdgePair<int>, std::less<EdgePair<int>>>::_Loser" = type { i8, i32, %struct.EdgePair }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char>::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char>::_Alloc_hider" = type { ptr }
%union.anon = type { i64, [8 x i8] }
%"struct.__gnu_parallel::_LoserTreeBase<int, std::less<int>>::_Loser" = type { i8, i32, i32 }
%"struct.std::pair.94" = type { ptr, ptr }
%"struct.std::pair.20" = type { i64, i64 }
%"struct.std::pair.198" = type { %struct.EdgePair, i64 }
%"struct.__gnu_parallel::_Piece" = type { i64, i64 }
%"class.std::vector" = type { %"struct.std::_Vector_base" }
%"struct.std::_Vector_base" = type { %"struct.std::_Vector_base<__gnu_parallel::_Piece<long>, std::allocator<__gnu_parallel::_Piece<long>>>::_Vector_impl" }
%"struct.std::_Vector_base<__gnu_parallel::_Piece<long>, std::allocator<__gnu_parallel::_Piece<long>>>::_Vector_impl" = type { %"struct.std::_Vector_base<__gnu_parallel::_Piece<long>, std::allocator<__gnu_parallel::_Piece<long>>>::_Vector_impl_data" }
%"struct.std::_Vector_base<__gnu_parallel::_Piece<long>, std::allocator<__gnu_parallel::_Piece<long>>>::_Vector_impl_data" = type { ptr, ptr, ptr }
%"struct.std::pair" = type { ptr, ptr }
%"class.std::mersenne_twister_engine" = type { [312 x i64], i64 }
%"struct.std::pair.176" = type { ptr, ptr }
%"struct.__gnu_parallel::_LoserTreeBase<std::pair<long, int>, std::greater<std::pair<long, int>>>::_Loser" = type { i8, i32, %"struct.std::pair.31" }

define i64 @"1"(ptr %arrayidx.i53, ptr %agg.result, ptr %end_size_.i, ptr %degrees, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i53, align 8, !tbaa !0
  %2 = load ptr, ptr %agg.result, align 8, !tbaa !4
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !7
  %sub.ptr.lhs.cast.i55 = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %degrees, align 8, !tbaa !9
  %sub.ptr.rhs.cast.i56 = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i57 = sub i64 %sub.ptr.lhs.cast.i55, %sub.ptr.rhs.cast.i56
  %sub.ptr.div.i58 = ashr exact i64 %sub.ptr.sub.i57, %0
  %arrayidx.i59 = getelementptr inbounds i64, ptr %2, i64 %sub.ptr.div.i58
  store i64 %1, ptr %arrayidx.i59, align 8, !tbaa !0
  ret i64 %1
}

define <2 x i32> @"2"(ptr %degrees, ptr %.omp.lb, i64 %0, i64 %index) {
bb:
  %1 = load ptr, ptr %degrees, align 8, !tbaa !9
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul12 = shl i64 %2, %0
  %offset.idx = add i64 %mul12, %index
  %3 = getelementptr inbounds i32, ptr %1, i64 %offset.idx
  %wide.load = load <2 x i32>, ptr %3, align 4, !tbaa !10
  ret <2 x i32> %wide.load
}

define i64 @"3"(ptr %second10, i64 %0) {
bb:
  %1 = load ptr, ptr %second10, align 8, !tbaa !12
  %incdec.ptr.i228488 = getelementptr i64, ptr %1, i64 %0
  %incdec.ptr.i228.us = getelementptr inbounds i64, ptr %incdec.ptr.i228488, i64 %0
  %2 = load i64, ptr %incdec.ptr.i228.us, align 8, !tbaa !0
  ret i64 %2
}

define <4 x i32> @"4"(<4 x i32> %0, ptr %init_val, i64 %1, ptr %this, ptr %.omp.lb, i64 %index, i64 %2) {
bb:
  %3 = load i32, ptr %init_val, align 4, !tbaa !10, !alias.scope !14
  %broadcast.splatinsert21 = insertelement <4 x i32> %0, i32 %3, i64 %1
  %broadcast.splat22 = shufflevector <4 x i32> %broadcast.splatinsert21, <4 x i32> %0, <4 x i32> zeroinitializer
  %4 = load ptr, ptr %this, align 8, !tbaa !9
  %5 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %offset.idx = add i64 %5, %index
  %6 = getelementptr inbounds i32, ptr %4, i64 %offset.idx
  %7 = getelementptr inbounds i32, ptr %6, i64 %2
  store <4 x i32> %broadcast.splat22, ptr %7, align 4, !tbaa !10, !alias.scope !17, !noalias !14
  ret <4 x i32> %broadcast.splat22
}

define ptr @"5"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, ptr %.omp.lb, i64 %1) {
bb:
  %2 = load ptr, ptr %out_index_.i, align 8
  %3 = load ptr, ptr %in_index_.i, align 8
  %4 = load i8, ptr %transpose, align 1, !tbaa !19, !range !21, !noundef !22
  %tobool.not = icmp eq i8 %4, %0
  %.sink = select i1 %tobool.not, ptr %2, ptr %3
  %5 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %6 = sext i32 %5 to i64
  %7 = add nsw i64 %6, %1
  %arrayidx.i.i.i60 = getelementptr inbounds ptr, ptr %.sink, i64 %7
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !23
  ret ptr %n_end.0
}

define i8 @"6"(ptr %arrayidx17.i.i, ptr %agg.tmp32, ptr %num_trials_, i32 %0) {
bb:
  %1 = load i8, ptr %arrayidx17.i.i, align 2, !tbaa !24, !noalias !25
  %2 = load i32, ptr %num_trials_, align 4, !tbaa !28
  %__val.lobit.i = lshr i32 %2, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %3 = load ptr, ptr %agg.tmp32, align 8, !tbaa !37, !alias.scope !25
  %arrayidx.i.i = getelementptr inbounds i8, ptr %3, i64 %conv5.i
  store i8 %1, ptr %arrayidx.i.i, align 1, !tbaa !24
  ret i8 %1
}

define i64 @"7"(ptr %degree_id_pairs, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %degree_id_pairs, align 8, !tbaa !38
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %arrayidx.i = getelementptr inbounds %"struct.std::pair.31", ptr %0, i64 %2
  %3 = load i64, ptr %arrayidx.i, align 8, !tbaa !40
  ret i64 %3
}

define i32 @"8"(ptr %init_val, ptr %this, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %this, align 8, !tbaa !9
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add.ptr.prol = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %init_val, align 4, !tbaa !10
  store i32 %2, ptr %add.ptr.prol, align 4, !tbaa !10
  ret i32 %2
}

define i64 @"9"(ptr %second.1, ptr %arrayidx.i.1, i64 %0, ptr %1) {
bb:
  %2 = load ptr, ptr %arrayidx.i.1, align 8, !tbaa !42
  %3 = load ptr, ptr %second.1, align 8, !tbaa !12
  %sub.ptr.lhs.cast.1 = ptrtoint ptr %3 to i64
  %sub.ptr.rhs.cast.1 = ptrtoint ptr %2 to i64
  %sub.ptr.sub.1 = sub i64 %sub.ptr.lhs.cast.1, %sub.ptr.rhs.cast.1
  %cmp4.1 = icmp sgt i64 %sub.ptr.sub.1, %0
  %spec.select.1 = select i1 %cmp4.1, ptr %2, ptr %1
  %4 = load i64, ptr %spec.select.1, align 8, !tbaa !0
  ret i64 %4
}

define i64 @"10"(ptr %arrayidx.i138, i64 %0) {
bb:
  %1 = load ptr, ptr %arrayidx.i138, align 8, !tbaa !42
  %incdec.ptr.i297457 = getelementptr i64, ptr %1, i64 %0
  %incdec.ptr.i297.us = getelementptr inbounds i64, ptr %incdec.ptr.i297457, i64 %0
  %2 = load i64, ptr %incdec.ptr.i297.us, align 8, !tbaa !0
  ret i64 %2
}

define ptr @"11"(ptr %el, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !43
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast = ptrtoint ptr %3 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre653 = load ptr, ptr %el, align 8, !tbaa !43
  %.pre669 = ptrtoint ptr %.pre653 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre669
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr.i424 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div14
  store ptr %add.ptr.i424, ptr %end_size_.i, align 8, !tbaa !45
  ret ptr %add.ptr.i424
}

define i64 @"12"(ptr %this, ptr %_M_finish.i.i, i64 %0, i64 %sub.ptr.rhs.cast.i.i, i64 %1, i64 %2) {
bb:
  %.pre = load ptr, ptr %this, align 8, !tbaa !23
  %3 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !46
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.65", ptr %3, i64 %0
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i = sdiv exact i64 %sub.ptr.sub.i.i, %1
  %sub.i = add nsw i64 %sub.ptr.div.i.i, %2
  %__parent.044.in.i.i = add nsw i64 %sub.i, %2
  %__parent.044.i1314.i = lshr i64 %__parent.044.in.i.i, %0
  %add.ptr.i.i.i11 = getelementptr inbounds %"struct.std::pair.65", ptr %.pre, i64 %__parent.044.i1314.i
  %4 = load i64, ptr %add.ptr.i.i.i11, align 8, !tbaa !0
  ret i64 %4
}

define <2 x i64> @"13"(ptr %_M_source, ptr %arrayidx11, i64 %0) {
bb:
  %1 = load ptr, ptr %_M_source, align 8, !tbaa !48
  %2 = load i64, ptr %arrayidx11, align 8, !tbaa !0
  %add.ptr = getelementptr %struct.EdgePair, ptr %1, i64 %2
  %next.gep247 = getelementptr i8, ptr %add.ptr, i64 %0
  %wide.load = load <2 x i64>, ptr %next.gep247, align 4
  ret <2 x i64> %wide.load
}

define i32 @"14"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, ptr %v.i.i.i.i.i.i.i, ptr %v3.i.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !51
  %3 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !51
  %cmp7.i.i.i.i.i.i.i = icmp slt i32 %2, %3
  %cmp.i.i.i.i.i.i.i = icmp eq i32 %2, %3
  %4 = load i32, ptr %v3.i.i.i.i.i.i.i, align 4
  %5 = load i32, ptr %v.i.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i.i = icmp slt i32 %5, %4
  %cond.i.i.i.i.i.i.i = select i1 %cmp.i.i.i.i.i.i.i, i1 %cmp4.i.i.i.i.i.i.i, i1 %cmp7.i.i.i.i.i.i.i
  %spec.select.i.i.i.i = select i1 %cond.i.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %__parent.020.in.i.i.i.i.i = add nsw i64 %sub12.i.i.i.i, %1
  %__parent.020.i.i56.i.i.i = lshr i64 %__parent.020.in.i.i.i.i.i, %0
  %add.ptr.i.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %__parent.020.i.i56.i.i.i
  %6 = load i32, ptr %add.ptr.i.i.i.i.i, align 4, !tbaa !51
  ret i32 %6
}

define <2 x i64> @"15"(ptr %arrayidx.i138, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %arrayidx.i138, align 8, !tbaa !42
  %incdec.ptr.i297457 = getelementptr i64, ptr %3, i64 %0
  %next.gep770 = getelementptr i8, ptr %incdec.ptr.i297457, i64 %1
  %4 = getelementptr i64, ptr %next.gep770, i64 %2
  %wide.load775 = load <2 x i64>, ptr %4, align 8, !tbaa !0
  ret <2 x i64> %wide.load775
}

define ptr @"16"(ptr %second, i64 %0, ptr %__seqs_begin.coerce) {
bb:
  %1 = load ptr, ptr %second, align 8, !tbaa !12
  %incdec.ptr.i274530 = getelementptr inbounds i64, ptr %1, i64 %0
  store ptr %incdec.ptr.i274530, ptr %__seqs_begin.coerce, align 8, !tbaa !42
  ret ptr %incdec.ptr.i274530
}

define i64 @"17"(ptr %arrayidx.i926, ptr %arrayidx356, i64 %add236.pre-phi132713501353, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx356, align 8, !tbaa !0
  %sub357 = sub nsw i64 %1, %add236.pre-phi132713501353
  %sub368 = add nsw i64 %sub357, %0
  %2 = load ptr, ptr %arrayidx.i926, align 8, !tbaa !42
  %arrayidx369 = getelementptr inbounds i64, ptr %2, i64 %sub368
  %3 = load i64, ptr %arrayidx369, align 8, !tbaa !0
  ret i64 %3
}

define <2 x i64> @"18"(ptr %arrayidx.i138, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %arrayidx.i138, align 8, !tbaa !42
  %incdec.ptr.i297457 = getelementptr i64, ptr %2, i64 %0
  %incdec.ptr.i228488 = getelementptr i64, ptr %incdec.ptr.i297457, i64 %0
  %next.gep = getelementptr i8, ptr %incdec.ptr.i228488, i64 %1
  %wide.load = load <2 x i64>, ptr %next.gep, align 8, !tbaa !0
  ret <2 x i64> %wide.load
}

define i64 @"19"(ptr %arrayidx162, ptr %__lmax.01216, ptr %arrayidx.i732, ptr %arrayidx154, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx162, align 8, !tbaa !0
  %2 = load i64, ptr %__lmax.01216, align 8, !tbaa !0
  %cmp.i734 = icmp slt i64 %1, %2
  %3 = load ptr, ptr %arrayidx.i732, align 8, !tbaa !42
  %4 = load i64, ptr %arrayidx154, align 8, !tbaa !0
  %sub161 = add nsw i64 %4, %0
  %arrayidx1622 = getelementptr inbounds i64, ptr %3, i64 %sub161
  %spec.select1148 = select i1 %cmp.i734, ptr %__lmax.01216, ptr %arrayidx162
  %5 = load i64, ptr %spec.select1148, align 8, !tbaa !0
  ret i64 %5
}

define i64 @"20"(ptr %add.ptr.i.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %add.ptr.i.i.i.i.i, align 8, !tbaa !0
  %2 = load i64, ptr %add.ptr.i.i.i.i, align 8, !tbaa !0
  %3 = load i64, ptr %add.ptr2.i.i.i.i, align 8, !tbaa !0
  %cmp.i.i.i.i.i.i = icmp slt i64 %2, %3
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %add.ptr2.i.i.i.i.i = getelementptr inbounds i64, ptr %__first, i64 %sub12.i.i.i.i
  store i64 %1, ptr %add.ptr2.i.i.i.i.i, align 8, !tbaa !0
  ret i64 %1
}

define i64 @"21"(ptr %second10, i64 %0) {
bb:
  %1 = load ptr, ptr %second10, align 8, !tbaa !12
  %incdec.ptr.i228488 = getelementptr i64, ptr %1, i64 %0
  %incdec.ptr.i228.us = getelementptr inbounds i64, ptr %incdec.ptr.i228488, i64 %0
  %2 = load i64, ptr %incdec.ptr.i228.us, align 8, !tbaa !0
  ret i64 %2
}

define i32 @"22"(ptr %_M_source.i113, ptr %_M_losers.i.i, i64 %0, i32 %1) {
bb:
  %.pre189 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !53
  %_M_source.i1132 = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<long, std::less<long>>::_Loser", ptr %.pre189, i64 %0, i32 1
  %.pre = load i32, ptr %_M_source.i113, align 4, !tbaa !56
  store i32 %.pre, ptr %_M_source.i113, align 4, !tbaa !56
  ret i32 %.pre
}

define i32 @"23"(ptr %__a.addr.029.i163, ptr %__result) {
bb:
  %0 = load i64, ptr %__result, align 8, !tbaa !23
  %1 = inttoptr i64 %0 to ptr
  %2 = load i32, ptr %__a.addr.029.i163, align 4, !tbaa !10
  store i32 %2, ptr %1, align 4, !tbaa !10
  ret i32 %2
}

define i64 @"24"(ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %__i.018.i, ptr %arrayidx7.i) {
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

define i64 @"26"(ptr %__seqs_begin.coerce) {
bb:
  %0 = load ptr, ptr %__seqs_begin.coerce, align 8, !tbaa !23
  %1 = load i64, ptr %0, align 8, !tbaa !0
  ret i64 %1
}

define i8 @"27"(ptr %arrayidx3.i, ptr %_M_losers.i.i) {
bb:
  %.pre.i = load i8, ptr %arrayidx3.i, align 1, !tbaa !19, !range !21
  %.pre189 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !53
  store i8 %.pre.i, ptr %.pre189, align 8, !tbaa !58
  ret i8 %.pre.i
}

define i64 @"28"(ptr %_M_key19.i, i64 %0, ptr %_M_losers.i.i, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !59
  %_M_key31.i178 = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<EdgePair<int>, std::less<EdgePair<int>>>::_Loser", ptr %3, i64 %1, i32 2
  %4 = load i64, ptr %_M_key19.i, align 4
  %__key.sroa.5.0.extract.shift54.i = lshr i64 %4, %0
  %__key.sroa.5.0.extract.trunc55.i = trunc i64 %__key.sroa.5.0.extract.shift54.i to i32
  %__key.sroa.5.0.insert.ext.i179 = zext i32 %__key.sroa.5.0.extract.trunc55.i to i64
  %__key.sroa.5.0.insert.shift.i180 = shl nuw i64 %__key.sroa.5.0.insert.ext.i179, %0
  %__key.sroa.0.0.extract.trunc48.i = trunc i64 %4 to i32
  %__key.sroa.0.0.insert.ext.i181 = zext i32 %__key.sroa.0.0.extract.trunc48.i to i64
  %__key.sroa.0.0.insert.insert.i182 = or i64 %__key.sroa.5.0.insert.shift.i180, %__key.sroa.0.0.insert.ext.i181
  store i64 %__key.sroa.0.0.insert.insert.i182, ptr %_M_key31.i178, align 4
  ret i64 %__key.sroa.0.0.insert.insert.i182
}

define i32 @"29"(ptr %degrees, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul13 = shl i64 %1, %0
  %2 = load ptr, ptr %degrees, align 8, !tbaa !9
  %arrayidx.i34 = getelementptr inbounds i32, ptr %2, i64 %mul13
  %3 = load i32, ptr %arrayidx.i34, align 4, !tbaa !10
  ret i32 %3
}

define i64 @"30"(ptr %second, i64 %0) {
bb:
  %1 = load ptr, ptr %second, align 8, !tbaa !12
  %incdec.ptr.i274530 = getelementptr inbounds i64, ptr %1, i64 %0
  %2 = load i64, ptr %incdec.ptr.i274530, align 8, !tbaa !0
  ret i64 %2
}

define i64 @"31"(ptr %total4, ptr %total) {
bb:
  %0 = load i64, ptr %total, align 8, !tbaa !0
  %1 = load i64, ptr %total4, align 8, !tbaa !0
  %add51 = add i64 %1, %0
  store i64 %add51, ptr %total, align 8, !tbaa !0
  ret i64 %add51
}

define i64 @"32"(ptr %arrayidx.i, i64 %0, ptr %degree_id_pairs, ptr %.omp.lb) {
bb:
  %1 = load ptr, ptr %arrayidx.i, align 8, !tbaa !23
  %sub.ptr.lhs.cast.i = ptrtoint ptr %1 to i64
  %sub.ptr.rhs.cast.i = ptrtoint ptr %1 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %3 = sext i32 %2 to i64
  %4 = load ptr, ptr %degree_id_pairs, align 8, !tbaa !38
  %arrayidx.i22 = getelementptr inbounds %"struct.std::pair.31", ptr %4, i64 %3
  store i64 %sub.ptr.div.i, ptr %arrayidx.i22, align 8, !tbaa !40
  ret i64 %sub.ptr.div.i
}

define i64 @"33"(ptr %arrayidx.i, ptr %arrayidx4.i, i64 %0, ptr %arrayidx.i48) {
bb:
  %1 = load ptr, ptr %arrayidx.i, align 8, !tbaa !23
  %sub.ptr.lhs.cast.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %arrayidx4.i, align 8, !tbaa !23
  %sub.ptr.rhs.cast.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  store i64 %sub.ptr.div.i, ptr %arrayidx.i48, align 8, !tbaa !0
  ret i64 %sub.ptr.div.i
}

define i64 @"34"(ptr %add.ptr3.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i) {
bb:
  %0 = load i64, ptr %add.ptr.i.i.i.i, align 8, !tbaa !0
  %1 = load i64, ptr %add.ptr2.i.i.i.i, align 8, !tbaa !0
  %cmp.i.i.i.i.i.i = icmp slt i64 %0, %1
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add.ptr4.i.i.i.i = getelementptr inbounds i64, ptr %__first, i64 %spec.select.i.i.i.i
  %2 = load i64, ptr %add.ptr3.i.i.i.i, align 8, !tbaa !0
  store i64 %2, ptr %add.ptr4.i.i.i.i, align 8, !tbaa !0
  ret i64 %2
}

define i64 @"35"(ptr %__seqs_begin.coerce, i64 %0) {
bb:
  %1 = load ptr, ptr %__seqs_begin.coerce, align 8, !tbaa !42
  %incdec.ptr.i274530 = getelementptr inbounds i64, ptr %1, i64 %0
  %incdec.ptr.i504 = getelementptr inbounds i64, ptr %incdec.ptr.i274530, i64 %0
  %2 = load i64, ptr %incdec.ptr.i504, align 8, !tbaa !0
  ret i64 %2
}

define i64 @"36"(ptr %_M_key.i162, ptr %_M_losers.i.i, ptr %_M_k.i.i, ptr %_M_source15.i, i32 %0, i32 %1) {
bb:
  %2 = load i64, ptr %_M_key.i162, align 8, !tbaa !0
  %.pre189 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !53
  %3 = load i32, ptr %_M_k.i.i, align 4, !tbaa !62
  %4 = load i32, ptr %_M_source15.i, align 4, !tbaa !10
  %add.i120 = add i32 %3, %4
  %__pos.050.i137 = lshr i32 %add.i120, %0
  %idxprom.i139 = zext i32 %__pos.050.i137 to i64
  %_M_key19.i148 = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<long, std::less<long>>::_Loser", ptr %.pre189, i64 %idxprom.i139, i32 2
  store i64 %2, ptr %_M_key19.i148, align 8, !tbaa !0
  ret i64 %2
}

define i32 @"37"(ptr %__seqs_begin.coerce, i64 %0, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %__seqs_begin.coerce, align 8, !tbaa !63
  %incdec.ptr.i650 = getelementptr inbounds %"struct.std::pair.31", ptr %3, i64 %0
  %second.i = getelementptr inbounds %"struct.std::pair.31", ptr %incdec.ptr.i650, i64 %1, i32 1
  %4 = load i32, ptr %second.i, align 8, !tbaa !65
  ret i32 %4
}

define i32 @"38"(ptr %second.epil, ptr %arrayidx.i.epil, i64 %0, ptr %1, i64 %2) {
bb:
  %3 = load ptr, ptr %second.epil, align 8, !tbaa !66
  %sub.ptr.lhs.cast.epil = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %arrayidx.i.epil, align 8, !tbaa !63
  %sub.ptr.rhs.cast.epil = ptrtoint ptr %4 to i64
  %sub.ptr.sub.epil = sub i64 %sub.ptr.lhs.cast.epil, %sub.ptr.rhs.cast.epil
  %cmp4.epil = icmp sgt i64 %sub.ptr.sub.epil, %0
  %spec.select.epil = select i1 %cmp4.epil, ptr %4, ptr %1
  %agg.tmp47.sroa.2.0..sroa_idx = getelementptr inbounds i8, ptr %spec.select.epil, i64 %2
  %agg.tmp47.sroa.2.0.copyload = load i32, ptr %agg.tmp47.sroa.2.0..sroa_idx, align 8
  ret i32 %agg.tmp47.sroa.2.0.copyload
}

define i32 @"39"(ptr %__seqs_begin.coerce, i64 %0, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %__seqs_begin.coerce, align 8, !tbaa !63
  %incdec.ptr.i360692 = getelementptr inbounds %"struct.std::pair.31", ptr %3, i64 %0
  %incdec.ptr.i650 = getelementptr inbounds %"struct.std::pair.31", ptr %incdec.ptr.i360692, i64 %0
  %second.i = getelementptr inbounds %"struct.std::pair.31", ptr %incdec.ptr.i650, i64 %1, i32 1
  %4 = load i32, ptr %second.i, align 8, !tbaa !65
  ret i32 %4
}

define i32 @"40"(ptr %__a.addr.029.i, ptr %__result) {
bb:
  %0 = load i32, ptr %__a.addr.029.i, align 4, !tbaa !10
  %agg.tmp61.sroa.0.0.copyload = load ptr, ptr %__result, align 8
  store i32 %0, ptr %agg.tmp61.sroa.0.0.copyload, align 4, !tbaa !10
  ret i32 %0
}

define i32 @"41"(ptr %second.1, ptr %arrayidx.i.1, i64 %0, ptr %1, i32 %2) {
bb:
  %3 = load ptr, ptr %arrayidx.i.1, align 8, !tbaa !63
  %sub.ptr.rhs.cast.1 = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %second.1, align 8, !tbaa !66
  %sub.ptr.lhs.cast.1 = ptrtoint ptr %4 to i64
  %sub.ptr.sub.1 = sub i64 %sub.ptr.lhs.cast.1, %sub.ptr.rhs.cast.1
  %cmp4.1 = icmp sgt i64 %sub.ptr.sub.1, %0
  %spec.select.1 = select i1 %cmp4.1, ptr %3, ptr %1
  %second.i.i = getelementptr inbounds %"struct.std::pair.31", ptr %spec.select.1, i64 %0, i32 1
  %5 = load i32, ptr %second.i.i, align 8, !tbaa !65
  ret i32 %5
}

define i64 @"42"(ptr %_M_string_length.i.i.i.i, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !23
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %_M_string_length.i24.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i, i32 1
  %3 = load i64, ptr %_M_string_length.i.i.i.i, align 8, !tbaa !67
  store i64 %3, ptr %_M_string_length.i24.i.i.i, align 8, !tbaa !67
  ret i64 %3
}

define i8 @"43"(i8 %0, ptr %_M_losers.i.i, ptr %_M_k.i.i, ptr %_M_source15.i, i32 %1) {
bb:
  %.pre189 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !53
  %2 = load i32, ptr %_M_k.i.i, align 4, !tbaa !62
  %3 = load i32, ptr %_M_source15.i, align 4, !tbaa !10
  %add.i120 = add i32 %2, %3
  %__pos.050.i137 = lshr i32 %add.i120, %1
  %idxprom.i139 = zext i32 %__pos.050.i137 to i64
  %arrayidx3.i140 = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<long, std::less<long>>::_Loser", ptr %.pre189, i64 %idxprom.i139
  store i8 %0, ptr %arrayidx3.i140, align 1, !tbaa !19
  ret i8 %0
}

define i64 @"44"(ptr %arrayidx23.i.i, i64 %0, ptr %1, i64 %2, i64 %3, ptr %arrayidx28.i.i, i64 %4, i64 %5, ptr %udist_, i64 %6) {
bb:
  %7 = load i64, ptr %arrayidx23.i.i, align 8, !tbaa !0
  %and24.i.i = and i64 %7, %0
  %wide.load = load <2 x i64>, ptr %1, align 8, !tbaa !0
  %vector.recur.extract = extractelement <2 x i64> %wide.load, i64 %2
  %and20.i.i = and i64 %vector.recur.extract, %3
  %or25.i.i = or i64 %and24.i.i, %and20.i.i
  %shr29.i.i = lshr exact i64 %or25.i.i, %2
  %8 = load i64, ptr %arrayidx28.i.i, align 8, !tbaa !0
  %xor30.i.i = xor i64 %shr29.i.i, %8
  %and31.i.i = and i64 %7, %2
  %tobool32.not.i.i = icmp eq i64 %and31.i.i, %4
  %cond33.i.i = select i1 %tobool32.not.i.i, i64 %4, i64 %5
  %xor34.i.i = xor i64 %xor30.i.i, %cond33.i.i
  %9 = load ptr, ptr %udist_, align 8, !tbaa !68
  %arrayidx19.i.i = getelementptr inbounds [312 x i64], ptr %9, i64 %4, i64 310
  store i64 %xor34.i.i, ptr %arrayidx19.i.i, align 8, !tbaa !0
  ret i64 %xor34.i.i
}

define i64 @"45"(ptr %arrayidx.i52, ptr %arrayidx.i52.3, ptr %arrayidx.i52.2, ptr %arrayidx.i52.1, i64 %add4, ptr %arrayidx.i51.1) {
bb:
  %0 = load i64, ptr %arrayidx.i52, align 8, !tbaa !0
  %1 = load i64, ptr %arrayidx.i52.2, align 8, !tbaa !0
  %2 = load i64, ptr %arrayidx.i52.1, align 8, !tbaa !0
  %add4.1 = add nsw i64 %2, %add4
  %add4.2 = add nsw i64 %1, %add4.1
  %3 = load i64, ptr %arrayidx.i52.3, align 8, !tbaa !0
  %add4.3 = add nsw i64 %3, %add4.2
  %add42 = add nsw i64 %0, %add4.3
  store i64 %add4, ptr %arrayidx.i51.1, align 8, !tbaa !0
  ret i64 %add4
}

define i32 @"46"(ptr %num_nodes, i64 %0, ptr %length.i) {
bb:
  %1 = load i64, ptr %num_nodes, align 8, !tbaa !0
  %add = add nsw i64 %1, %0
  %conv.i = trunc i64 %add to i32
  store i32 %conv.i, ptr %length.i, align 4, !tbaa !10
  ret i32 %conv.i
}

define i64 @"47"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %end_size_.i.i) {
bb:
  %2 = load i32, ptr %v, align 4, !tbaa !70
  %sub = add nsw i32 %2, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  %.pre.pre.i = load ptr, ptr %end_size_.i.i, align 8, !tbaa !45
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %.pre.pre.i, align 4, !tbaa.struct !72
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i64 @"48"(ptr %__first, ptr %add.ptr.i.us, ptr %add.ptr2.i.us, i64 %sub1.i.us, i64 %mul.i.us, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %add.ptr.i.us, align 8, !tbaa !0
  %3 = load i64, ptr %add.ptr2.i.us, align 8, !tbaa !0
  %cmp.i.i.i.us = icmp slt i64 %2, %3
  %spec.select.i.us = select i1 %cmp.i.i.i.us, i64 %sub1.i.us, i64 %mul.i.us
  %__parent.020.in.i.i.us = add nsw i64 %spec.select.i.us, %0
  %__parent.020.i.i.us = sdiv i64 %__parent.020.in.i.i.us, %1
  %add.ptr.i.i.us = getelementptr inbounds i64, ptr %__first, i64 %__parent.020.i.i.us
  %4 = load i64, ptr %add.ptr.i.i.us, align 8, !tbaa !0
  ret i64 %4
}

define i32 @"49"(ptr %arrayidx.i48, ptr %neighs, ptr %arrayidx.i50) {
bb:
  %0 = load ptr, ptr %neighs, align 8, !tbaa !23
  %1 = load i64, ptr %arrayidx.i50, align 8, !tbaa !0
  %arrayidx = getelementptr inbounds i32, ptr %0, i64 %1
  %2 = load i32, ptr %arrayidx.i48, align 4, !tbaa !10
  store i32 %2, ptr %arrayidx, align 4, !tbaa !10
  ret i32 %2
}

define i32 @"50"(ptr %end_size_.i.i, ptr %offsets, i64 %0, ptr %length.i) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !4
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !73
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %3 = lshr exact i64 %sub.ptr.sub.i.i, %0
  %conv.i = trunc i64 %3 to i32
  store i32 %conv.i, ptr %length.i, align 4, !tbaa !10
  ret i32 %conv.i
}

define i64 @"51"(ptr %arrayidx.i750, ptr %arrayidx251) {
bb:
  %0 = load ptr, ptr %arrayidx.i750, align 8, !tbaa !42
  %1 = load i64, ptr %arrayidx251, align 8, !tbaa !0
  %arrayidx259 = getelementptr inbounds i64, ptr %0, i64 %1
  %2 = load i64, ptr %arrayidx259, align 8, !tbaa !0
  ret i64 %2
}

define i64 @"52"(ptr %second) {
bb:
  %0 = load ptr, ptr %second, align 8, !tbaa !12
  %1 = load i64, ptr %0, align 8, !tbaa !0
  ret i64 %1
}

define i32 @"53"(ptr %__value.sroa.4.0.ref.tmp.sroa.0.0..sroa_idx.i, ptr %this, ptr %_M_finish.i.i, i64 %0, i64 %sub.ptr.rhs.cast.i.i, i64 %1, i64 %2, i64 %3, i32 %4) {
bb:
  %__value.sroa.4.0.copyload.i = load i32, ptr %__value.sroa.4.0.ref.tmp.sroa.0.0..sroa_idx.i, align 8
  %.pre = load ptr, ptr %this, align 8, !tbaa !23
  %5 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !46
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.65", ptr %5, i64 %0
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i = sdiv exact i64 %sub.ptr.sub.i.i, %1
  %sub.i = add nsw i64 %sub.ptr.div.i.i, %2
  %add.ptr.i28.i.i = getelementptr inbounds %"struct.std::pair.65", ptr %.pre, i64 %sub.i
  %second3.i.i30.i.i = getelementptr inbounds %"struct.std::pair.31", ptr %add.ptr.i28.i.i, i64 %3, i32 1
  store i32 %__value.sroa.4.0.copyload.i, ptr %second3.i.i30.i.i, align 8, !tbaa !65
  ret i32 %__value.sroa.4.0.copyload.i
}

define i32 @"54"(ptr %arrayidx.i735, ptr %arrayidx152, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx152, align 8, !tbaa !0
  %sub159 = add nsw i64 %2, %0
  %3 = load ptr, ptr %arrayidx.i735, align 8, !tbaa !63
  %arrayidx160 = getelementptr inbounds %"struct.std::pair.31", ptr %3, i64 %sub159
  %ref.tmp199.sroa.6.0.__lmax.0.sroa_idx = getelementptr inbounds i8, ptr %arrayidx160, i64 %1
  %ref.tmp199.sroa.6.0.copyload = load i32, ptr %ref.tmp199.sroa.6.0.__lmax.0.sroa_idx, align 8
  ret i32 %ref.tmp199.sroa.6.0.copyload
}

define i8 @"55"(ptr %arrayidx3.i, ptr %_M_losers.i.i, ptr %_M_k.i.i, ptr %_M_source.i112, i32 %0) {
bb:
  %.pre191 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !74
  %1 = load i32, ptr %_M_source.i112, align 4, !tbaa !77
  %2 = load i32, ptr %_M_k.i.i, align 4, !tbaa !79
  %add.i119 = add i32 %2, %1
  %__pos.050.i = lshr i32 %add.i119, %0
  %idxprom.i122 = zext i32 %__pos.050.i to i64
  %arrayidx3.i2 = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<int, std::less<int>>::_Loser", ptr %.pre191, i64 %idxprom.i122
  %.pre.i = load i8, ptr %arrayidx3.i, align 1, !tbaa !19, !range !21
  store i8 %.pre.i, ptr %arrayidx3.i, align 1, !tbaa !19
  ret i8 %.pre.i
}

define ptr @"56"(ptr %arrayidx.epil, ptr %arrayidx12.epil, ptr %arrayidx12.1, ptr %second3.i.epil) {
bb:
  %0 = load i64, ptr %arrayidx12.epil, align 8, !tbaa !0
  %1 = load i64, ptr %arrayidx12.1, align 8, !tbaa !0
  %sub.epil = sub nsw i64 %0, %1
  %2 = load ptr, ptr %arrayidx.epil, align 8, !tbaa !23
  %add.ptr.epil = getelementptr inbounds i64, ptr %2, i64 %sub.epil
  store ptr %add.ptr.epil, ptr %second3.i.epil, align 8, !tbaa !12
  ret ptr %add.ptr.epil
}

define i64 @"57"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !80
  %inc.i70 = add nuw nsw i64 %1, %0
  %inc.i63 = add nuw nsw i64 %inc.i70, %0
  store i64 %inc.i63, ptr %_M_p.i.i.i, align 8, !tbaa !80
  ret i64 %inc.i63
}

define ptr @"58"(ptr %new_range.i.i, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %0) {
bb:
  %1 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast = ptrtoint ptr %1 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !23
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !45
  ret ptr %add.ptr.i
}

define ptr @"59"(ptr %new_range.i.i417, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_capacity_.i.i.i) {
bb:
  %3 = load ptr, ptr %el, align 8, !tbaa !43
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre653 = load ptr, ptr %el, align 8, !tbaa !43
  %.pre669 = ptrtoint ptr %.pre653 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre669
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %.pre.i.i436 = load ptr, ptr %new_range.i.i417, align 8, !tbaa !23
  %add.ptr6.i.i438 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i436, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i438, ptr %end_capacity_.i.i.i, align 8, !tbaa !82
  ret ptr %add.ptr6.i.i438
}

define i64 @"60"(i64 %add29, ptr %__n, ptr %__num_threads, i64 %conv9, i64 %indvars.iv.next55, i64 %div, i64 %add28, ptr %arrayidx25.1) {
bb:
  %0 = load i16, ptr %__num_threads, align 2, !tbaa !83
  %.fr58 = freeze i16 %0
  %conv92 = zext i16 %.fr58 to i64
  %1 = load i64, ptr %__n, align 8, !tbaa !0
  %div4 = sdiv i64 %1, %conv9
  %cond.1 = add i64 %add29, %div
  %rem = srem i64 %1, %conv9
  %cmp27.1 = icmp sgt i64 %rem, %indvars.iv.next55
  %add28.1 = zext i1 %cmp27.1 to i64
  %add29.1 = add i64 %cond.1, %add28.1
  %cond = add i64 %add29.1, %div
  %add296 = add i64 %cond, %add28
  store i64 %add29, ptr %arrayidx25.1, align 8, !tbaa !0
  ret i64 %add29
}

define ptr @"61"(ptr %__seqs_begin.coerce, i64 %0) {
bb:
  %1 = load ptr, ptr %__seqs_begin.coerce, align 8, !tbaa !42
  %incdec.ptr.i274530 = getelementptr inbounds i64, ptr %1, i64 %0
  store ptr %incdec.ptr.i274530, ptr %__seqs_begin.coerce, align 8, !tbaa !42
  ret ptr %incdec.ptr.i274530
}

define ptr @"62"(ptr %__block_begins, ptr %__num_threads) {
bb:
  %0 = load ptr, ptr %__block_begins, align 8, !tbaa !23
  %1 = load i16, ptr %__num_threads, align 2, !tbaa !83
  %wide.trip.count227 = zext i16 %1 to i64
  %arrayidx87 = getelementptr inbounds %"struct.std::pair.94", ptr %0, i64 %wide.trip.count227
  %2 = load ptr, ptr %arrayidx87, align 8, !tbaa !84
  ret ptr %2
}

define i32 @"63"(ptr %degrees, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul12 = shl i64 %1, %0
  %2 = load ptr, ptr %degrees, align 8, !tbaa !9
  %arrayidx.i31 = getelementptr inbounds i32, ptr %2, i64 %mul12
  %3 = load i32, ptr %arrayidx.i31, align 4, !tbaa !10
  ret i32 %3
}

define i64 @"64"(ptr %arrayidx.i138, i64 %0) {
bb:
  %1 = load ptr, ptr %arrayidx.i138, align 8, !tbaa !42
  %incdec.ptr.i228488 = getelementptr i64, ptr %1, i64 %0
  %incdec.ptr.i228.us = getelementptr inbounds i64, ptr %incdec.ptr.i228488, i64 %0
  %2 = load i64, ptr %incdec.ptr.i228.us, align 8, !tbaa !0
  ret i64 %2
}

define <2 x i64> @"65"(ptr %0, <2 x i64> %1, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %udist_, i64 %7, i64 %index15) {
bb:
  %wide.load18 = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %8 = and <2 x i64> %wide.load18, %3
  %9 = icmp eq <2 x i64> %8, %5
  %10 = select <2 x i1> %9, <2 x i64> %5, <2 x i64> %6
  %11 = shufflevector <2 x i64> %wide.load18, <2 x i64> %wide.load18, <2 x i32> <i32 1, i32 2>
  %12 = and <2 x i64> %11, %2
  %13 = and <2 x i64> %wide.load18, %1
  %14 = or <2 x i64> %13, %12
  %15 = lshr exact <2 x i64> %14, %3
  %wide.load19 = load <2 x i64>, ptr %4, align 8, !tbaa !0
  %16 = xor <2 x i64> %15, %wide.load19
  %17 = xor <2 x i64> %16, %10
  %18 = load ptr, ptr %udist_, align 8, !tbaa !68
  %19 = getelementptr inbounds [312 x i64], ptr %18, i64 %7, i64 %index15
  store <2 x i64> %17, ptr %19, align 8, !tbaa !0
  ret <2 x i64> %17
}

define i64 @"66"(ptr %arrayidx.i138, i64 %0) {
bb:
  %1 = load ptr, ptr %arrayidx.i138, align 8, !tbaa !42
  %incdec.ptr.i297457 = getelementptr i64, ptr %1, i64 %0
  %incdec.ptr.i228488 = getelementptr i64, ptr %incdec.ptr.i297457, i64 %0
  %incdec.ptr.i228.us = getelementptr inbounds i64, ptr %incdec.ptr.i228488, i64 %0
  %2 = load i64, ptr %incdec.ptr.i228.us, align 8, !tbaa !0
  ret i64 %2
}

define i32 @"67"(ptr %__seqs_begin.coerce, i64 %0, i32 %1) {
bb:
  %.pre.i.i = load ptr, ptr %__seqs_begin.coerce, align 8, !tbaa !23
  %second.i.i.i.i.i.i.i.i = getelementptr inbounds %"struct.std::pair.31", ptr %.pre.i.i, i64 %0, i32 1
  %2 = load i32, ptr %second.i.i.i.i.i.i.i.i, align 8, !tbaa !65
  ret i32 %2
}

define i64 @"68"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %end_size_.i.i) {
bb:
  %2 = load i32, ptr %v, align 4, !tbaa !70
  %sub = add nsw i32 %2, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  %3 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !45
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %3, align 4, !tbaa.struct !72
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"69"(ptr %call148, ptr %arrayidx.i504, ptr %arrayidx.i505) {
bb:
  %0 = load i64, ptr %arrayidx.i504, align 8, !tbaa !0
  %add.ptr227 = getelementptr inbounds i32, ptr %call148, i64 %0
  %1 = load i32, ptr %arrayidx.i505, align 4, !tbaa !10
  %idx.ext = sext i32 %1 to i64
  %add.ptr230 = getelementptr inbounds i32, ptr %add.ptr227, i64 %idx.ext
  %2 = load i32, ptr %add.ptr230, align 4, !tbaa !10
  ret i32 %2
}

define <2 x i64> @"70"(ptr %arrayidx.i138, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %arrayidx.i138, align 8, !tbaa !42
  %incdec.ptr.i297457 = getelementptr i64, ptr %3, i64 %0
  %incdec.ptr.i228488 = getelementptr i64, ptr %incdec.ptr.i297457, i64 %0
  %next.gep = getelementptr i8, ptr %incdec.ptr.i228488, i64 %1
  %4 = getelementptr i64, ptr %next.gep, i64 %2
  %wide.load750 = load <2 x i64>, ptr %4, align 8, !tbaa !0
  ret <2 x i64> %wide.load750
}

define i8 @"71"(ptr %arrayidx.i17.i, ptr %agg.tmp32, ptr %num_trials_, i32 %0, i64 %idxprom1.i.i) {
bb:
  %1 = load i8, ptr %arrayidx.i17.i, align 1, !tbaa !24, !noalias !25
  %2 = load i32, ptr %num_trials_, align 4, !tbaa !28
  %__val.lobit.i = lshr i32 %2, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %3 = load ptr, ptr %agg.tmp32, align 8, !tbaa !37, !alias.scope !25
  %arrayidx.i.i = getelementptr inbounds i8, ptr %3, i64 %conv5.i
  %arrayidx2.i.i = getelementptr inbounds i8, ptr %arrayidx.i.i, i64 %idxprom1.i.i
  store i8 %1, ptr %arrayidx2.i.i, align 1, !tbaa !24
  ret i8 %1
}

define ptr @"72"(ptr %call.i, ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, i64 %2, ptr %end_size_.i34) {
bb:
  %3 = load ptr, ptr %degrees, align 8, !tbaa !9
  %sub.ptr.rhs.cast.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %end_size_.i, align 8, !tbaa !7
  %sub.ptr.lhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %sub = add nsw i64 %sub.ptr.div.i, %1
  %div32 = lshr i64 %sub, %2
  %add.ptr.i = getelementptr inbounds i64, ptr %call.i, i64 %div32
  store ptr %add.ptr.i, ptr %end_size_.i34, align 8, !tbaa !73
  ret ptr %add.ptr.i
}

define i64 @"73"(ptr %arrayidx.i50, i64 %0, ptr %offsets, ptr %arrayidx.i49) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !4
  %2 = load i32, ptr %arrayidx.i49, align 4, !tbaa !10
  %conv16 = sext i32 %2 to i64
  %arrayidx.i502 = getelementptr inbounds i64, ptr %1, i64 %conv16
  %3 = load i64, ptr %arrayidx.i50, align 8, !tbaa !0
  %inc = add nsw i64 %3, %0
  store i64 %inc, ptr %arrayidx.i50, align 8, !tbaa !0
  ret i64 %inc
}

define i64 @"74"(ptr %second.i.phi.trans.insert.i.i, ptr %this, ptr %_M_finish.i.i, i64 %0, i64 %sub.ptr.rhs.cast.i.i, i64 %1, i64 %2, i32 %3) {
bb:
  %.pre = load ptr, ptr %this, align 8, !tbaa !23
  %4 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !86
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.20", ptr %4, i64 %0
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i = ashr exact i64 %sub.ptr.sub.i.i, %1
  %sub.i = add nsw i64 %sub.ptr.div.i.i, %2
  %second3.i.i.i = getelementptr inbounds %"struct.std::pair.20", ptr %.pre, i64 %sub.i, i32 1
  %.pre.i.i = load i64, ptr %second.i.phi.trans.insert.i.i, align 8, !tbaa !0
  store i64 %.pre.i.i, ptr %second3.i.i.i, align 8, !tbaa !88
  ret i64 %.pre.i.i
}

define i32 @"75"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !43
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %ind.end
  %5 = load i32, ptr %add.ptr.prol, align 4
  ret i32 %5
}

define i64 @"76"(ptr %max_seen.i, i32 %0, ptr %num_nodes_) {
bb:
  %1 = load i32, ptr %max_seen.i, align 4, !tbaa !10
  %add = add nsw i32 %1, %0
  %conv = sext i32 %add to i64
  store i64 %conv, ptr %num_nodes_, align 8, !tbaa !90
  ret i64 %conv
}

define ptr @"77"(ptr %new_range.i.i, ptr %end_size_.i, ptr %el, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !23
  %1 = load ptr, ptr %el, align 8, !tbaa !43
  %sub.ptr.rhs.cast = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !82
  ret ptr %add.ptr6.i.i
}

define i32 @"78"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %el, align 8, !tbaa !43
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %ind.end
  %add.ptr.sroa_idx.prol = getelementptr inbounds i8, ptr %add.ptr.prol, i64 %2
  %6 = load i32, ptr %add.ptr.sroa_idx.prol, align 4
  ret i32 %6
}

define i64 @"79"(ptr %arrayidx.i, i64 %0) {
bb:
  %1 = load ptr, ptr %arrayidx.i, align 8, !tbaa !42
  %incdec.ptr.i251521 = getelementptr inbounds i64, ptr %1, i64 %0
  %2 = load i64, ptr %incdec.ptr.i251521, align 8, !tbaa !0
  ret i64 %2
}

define i64 @"80"(ptr %0, i64 %1, ptr %arrayidx42.i.i, i64 %2, i64 %3, ptr %arrayidx49.i.i, i64 %4, i64 %5, ptr %udist_, i64 %6) {
bb:
  %7 = load ptr, ptr %udist_, align 8, !tbaa !68
  %arrayidx42.i.i2 = getelementptr inbounds [312 x i64], ptr %0, i64 %4, i64 311
  %8 = load i64, ptr %0, align 8, !tbaa !0
  %and52.i.i = and i64 %8, %3
  %tobool53.not.i.i = icmp eq i64 %and52.i.i, %4
  %cond54.i.i = select i1 %tobool53.not.i.i, i64 %4, i64 %5
  %9 = load i64, ptr %arrayidx42.i.i, align 8, !tbaa !0
  %and43.i.i = and i64 %9, %2
  %and46.i.i = and i64 %8, %1
  %or47.i.i = or i64 %and46.i.i, %and43.i.i
  %shr50.i.i = lshr exact i64 %or47.i.i, %3
  %10 = load i64, ptr %arrayidx49.i.i, align 8, !tbaa !0
  %xor51.i.i = xor i64 %shr50.i.i, %10
  %xor55.i.i = xor i64 %xor51.i.i, %cond54.i.i
  store i64 %xor55.i.i, ptr %arrayidx42.i.i, align 8, !tbaa !0
  ret i64 %xor55.i.i
}

define i64 @"81"(ptr %offsets, ptr %num_nodes_.i, i32 %0, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !90
  %3 = trunc i64 %2 to i32
  %n160.0604 = add i32 %3, %0
  %4 = zext i32 %n160.0604 to i64
  %sext = shl i64 %4, %1
  %conv176 = ashr exact i64 %sext, %1
  %5 = load ptr, ptr %offsets, align 8, !tbaa !4
  %arrayidx.i498 = getelementptr inbounds i64, ptr %5, i64 %conv176
  %6 = load i64, ptr %arrayidx.i498, align 8, !tbaa !0
  ret i64 %6
}

define i32 @"82"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !43
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %2
  %add.ptr.sroa_idx.prol = getelementptr inbounds i8, ptr %add.ptr.prol, i64 %0
  %3 = load i32, ptr %add.ptr.sroa_idx.prol, align 4
  ret i32 %3
}

define ptr @"83"(ptr %__r.sroa.0.0220.epil, ptr %arrayidx84.epil, ptr %__return_value) {
bb:
  %0 = load i64, ptr %arrayidx84.epil, align 8, !tbaa !0
  %add.ptr.i.epil = getelementptr inbounds i32, ptr %__r.sroa.0.0220.epil, i64 %0
  store ptr %add.ptr.i.epil, ptr %__return_value, align 8, !tbaa.struct !92
  ret ptr %add.ptr.i.epil
}

define i32 @"84"(ptr %el, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %1 = load ptr, ptr %el, align 8, !tbaa !43
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %0
  %2 = load i32, ptr %add.ptr, align 4
  ret i32 %2
}

define i32 @"85"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3) {
bb:
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add15 = add i64 %ind.end, %2
  %6 = load ptr, ptr %el, align 8, !tbaa !43
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %6, i64 %add15
  %add.ptr.sroa_idx.1 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %3
  %7 = load i32, ptr %add.ptr.sroa_idx.1, align 4
  ret i32 %7
}

define i32 @"86"(ptr %second, ptr %arrayidx.i, i64 %0, ptr %1, i32 %2) {
bb:
  %3 = load ptr, ptr %arrayidx.i, align 8, !tbaa !63
  %4 = load ptr, ptr %second, align 8, !tbaa !66
  %sub.ptr.lhs.cast = ptrtoint ptr %4 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %3 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %cmp4 = icmp sgt i64 %sub.ptr.sub, %0
  %spec.select = select i1 %cmp4, ptr %3, ptr %1
  %second.i.i = getelementptr inbounds %"struct.std::pair.31", ptr %spec.select, i64 %0, i32 1
  %5 = load i32, ptr %second.i.i, align 8, !tbaa !65
  ret i32 %5
}

define i32 @"87"(ptr %second, ptr %arrayidx.i, i64 %0, ptr %1, i64 %2) {
bb:
  %3 = load ptr, ptr %arrayidx.i, align 8, !tbaa !63
  %4 = load ptr, ptr %second, align 8, !tbaa !66
  %sub.ptr.lhs.cast = ptrtoint ptr %4 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %3 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %cmp4 = icmp sgt i64 %sub.ptr.sub, %0
  %spec.select = select i1 %cmp4, ptr %3, ptr %1
  %agg.tmp47.sroa.2.0..sroa_idx = getelementptr inbounds i8, ptr %spec.select, i64 %2
  %agg.tmp47.sroa.2.0.copyload = load i32, ptr %agg.tmp47.sroa.2.0..sroa_idx, align 8
  ret i32 %agg.tmp47.sroa.2.0.copyload
}

define i64 @"88"(ptr %__arbitrary_element.0.lcssa217, i64 %0, ptr %_M_losers.i.i, ptr %_M_k.i.i, ptr %_M_source.i116, i32 %1, i32 %2) {
bb:
  %3 = load i32, ptr %_M_source.i116, align 4, !tbaa !93
  %4 = load i32, ptr %_M_k.i.i, align 4, !tbaa !95
  %add.i123 = add i32 %4, %3
  %__pos.062.i = lshr i32 %add.i123, %1
  %idxprom.i127 = zext i32 %__pos.062.i to i64
  %.pre.i126 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !59
  %_M_key19.i = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<EdgePair<int>, std::less<EdgePair<int>>>::_Loser", ptr %.pre.i126, i64 %idxprom.i127, i32 2
  %agg.tmp46.sroa.0.0.copyload = load i64, ptr %__arbitrary_element.0.lcssa217, align 4, !tbaa.struct !72
  %__key.sroa.0.0.extract.trunc.i = trunc i64 %agg.tmp46.sroa.0.0.copyload to i32
  %__key.sroa.0.0.insert.ext45.i = zext i32 %__key.sroa.0.0.extract.trunc.i to i64
  %__key.sroa.5.0.extract.shift.i = lshr i64 %agg.tmp46.sroa.0.0.copyload, %0
  %__key.sroa.5.0.extract.trunc.i = trunc i64 %__key.sroa.5.0.extract.shift.i to i32
  %__key.sroa.5.0.insert.ext50.i = zext i32 %__key.sroa.5.0.extract.trunc.i to i64
  %__key.sroa.5.0.insert.shift51.i = shl nuw i64 %__key.sroa.5.0.insert.ext50.i, %0
  %__key.sroa.0.0.insert.insert47.i = or i64 %__key.sroa.5.0.insert.shift51.i, %__key.sroa.0.0.insert.ext45.i
  store i64 %__key.sroa.0.0.insert.insert47.i, ptr %_M_key19.i, align 4
  ret i64 %__key.sroa.0.0.insert.insert47.i
}

define i32 @"89"(ptr %init_val, ptr %this, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %init_val, align 4, !tbaa !10
  %1 = load ptr, ptr %this, align 8, !tbaa !9
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add.ptr = getelementptr inbounds i32, ptr %1, i64 %2
  store i32 %0, ptr %add.ptr, align 4, !tbaa !10
  ret i32 %0
}

define ptr @"90"(ptr %0, ptr %1, i64 %2, i1 %cmp7.i.i.i.i, ptr %arrayidx.i, i64 %3, ptr %__begin2.__begin1.i.i) {
bb:
  %4 = load ptr, ptr %arrayidx.i, align 8, !tbaa !23
  %5 = load i64, ptr %1, align 4
  %__element1.sroa.6.0.extract.shift.i.i = lshr i64 %5, %2
  %__element1.sroa.6.0.extract.trunc.i.i = trunc i64 %__element1.sroa.6.0.extract.shift.i.i to i32
  %6 = load i64, ptr %0, align 4
  %__element2.sroa.5.0.extract.shift.i.i = lshr i64 %6, %2
  %__element2.sroa.5.0.extract.trunc.i.i = trunc i64 %__element2.sroa.5.0.extract.shift.i.i to i32
  %cmp4.i.i.i.i = icmp slt i32 %__element2.sroa.5.0.extract.trunc.i.i, %__element1.sroa.6.0.extract.trunc.i.i
  %__element2.sroa.0.0.extract.trunc.i.i = trunc i64 %6 to i32
  %__element1.sroa.0.0.extract.trunc.i.i = trunc i64 %5 to i32
  %cmp.i.i.i.i = icmp eq i32 %__element2.sroa.0.0.extract.trunc.i.i, %__element1.sroa.0.0.extract.trunc.i.i
  %cond.i.i.i.i = select i1 %cmp.i.i.i.i, i1 %cmp4.i.i.i.i, i1 %cmp7.i.i.i.i
  %..i.i = select i1 %cond.i.i.i.i, ptr %0, ptr %1
  %add.ptr.i.i = getelementptr inbounds %struct.EdgePair, ptr %..i.i, i64 %3
  store ptr %add.ptr.i.i, ptr %__begin2.__begin1.i.i, align 8, !tbaa !23
  ret ptr %add.ptr.i.i
}

define i64 @"91"(ptr %arrayidx.i52.epil, i64 %total.070.epil, ptr %arrayidx.i51.epil) {
bb:
  %0 = load i64, ptr %arrayidx.i52.epil, align 8, !tbaa !0
  %add4.epil = add nsw i64 %0, %total.070.epil
  store i64 %add4.epil, ptr %arrayidx.i51.epil, align 8, !tbaa !0
  ret i64 %add4.epil
}

define i64 @"92"(ptr %arrayidx.i52.1, ptr %arrayidx.i52, i64 %total.070, ptr %arrayidx.i51.2) {
bb:
  %0 = load i64, ptr %arrayidx.i52, align 8, !tbaa !0
  %add4 = add nsw i64 %0, %total.070
  %1 = load i64, ptr %arrayidx.i52.1, align 8, !tbaa !0
  %add4.1 = add nsw i64 %1, %add4
  store i64 %add4.1, ptr %arrayidx.i51.2, align 8, !tbaa !0
  ret i64 %add4.1
}

define i64 @"93"(ptr %__arbitrary_element.1.lcssa, ptr %0, ptr %_M_k.i.i, i32 %conv18, i32 %1) {
bb:
  %2 = load i32, ptr %_M_k.i.i, align 4, !tbaa !95
  %add.i = add i32 %2, %conv18
  %idxprom5.i = zext i32 %add.i to i64
  %_M_key7.i = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<EdgePair<int>, std::less<EdgePair<int>>>::_Loser", ptr %0, i64 %idxprom5.i, i32 2
  %3 = load i64, ptr %__arbitrary_element.1.lcssa, align 4
  store i64 %3, ptr %_M_key7.i, align 4
  ret i64 %3
}

define i64 @"94"(ptr %arrayidx.i, i64 %sub.ptr.rhs.cast.i, i64 %0, ptr %degree_id_pairs, i64 %indvars.iv) {
bb:
  %1 = load ptr, ptr %arrayidx.i, align 8, !tbaa !23
  %sub.ptr.lhs.cast.i = ptrtoint ptr %1 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %2 = load ptr, ptr %degree_id_pairs, align 8, !tbaa !38
  %arrayidx.i22 = getelementptr inbounds %"struct.std::pair.31", ptr %2, i64 %indvars.iv
  store i64 %sub.ptr.div.i, ptr %arrayidx.i22, align 8, !tbaa !40
  ret i64 %sub.ptr.div.i
}

define ptr @"95"(ptr %arrayidx.epil, ptr %arrayidx12.epil, i64 %.unr, ptr %second3.i.epil) {
bb:
  %0 = load ptr, ptr %arrayidx.epil, align 8, !tbaa !23
  %1 = load i64, ptr %arrayidx12.epil, align 8, !tbaa !0
  %sub.epil = sub nsw i64 %1, %.unr
  %add.ptr.epil = getelementptr inbounds i64, ptr %0, i64 %sub.epil
  store ptr %add.ptr.epil, ptr %second3.i.epil, align 8, !tbaa !12
  ret ptr %add.ptr.epil
}

define i32 @"96"(ptr %__a.addr.029.i163, ptr %__r.sroa.0.0220, ptr %arrayidx84, ptr %arrayidx84.1, ptr %arrayidx84.2, ptr %arrayidx84.3, ptr %arrayidx84.4, ptr %arrayidx84.5, ptr %arrayidx84.6, ptr %arrayidx84.7) {
bb:
  %0 = load i64, ptr %arrayidx84.4, align 8, !tbaa !0
  %1 = load i64, ptr %arrayidx84.3, align 8, !tbaa !0
  %2 = load i64, ptr %arrayidx84.1, align 8, !tbaa !0
  %3 = load i64, ptr %arrayidx84, align 8, !tbaa !0
  %add.ptr.i = getelementptr inbounds i32, ptr %__r.sroa.0.0220, i64 %3
  %add.ptr.i.1 = getelementptr inbounds i32, ptr %add.ptr.i, i64 %2
  %4 = load i64, ptr %arrayidx84.2, align 8, !tbaa !0
  %add.ptr.i.2 = getelementptr inbounds i32, ptr %add.ptr.i.1, i64 %4
  %add.ptr.i.3 = getelementptr inbounds i32, ptr %add.ptr.i.2, i64 %1
  %add.ptr.i.4 = getelementptr inbounds i32, ptr %add.ptr.i.3, i64 %0
  %5 = load i64, ptr %arrayidx84.5, align 8, !tbaa !0
  %add.ptr.i.5 = getelementptr inbounds i32, ptr %add.ptr.i.4, i64 %5
  %6 = load i64, ptr %arrayidx84.6, align 8, !tbaa !0
  %add.ptr.i.6 = getelementptr inbounds i32, ptr %add.ptr.i.5, i64 %6
  %7 = load i64, ptr %arrayidx84.7, align 8, !tbaa !0
  %add.ptr.i.7 = getelementptr inbounds i32, ptr %add.ptr.i.6, i64 %7
  %8 = load i32, ptr %__a.addr.029.i163, align 4, !tbaa !10
  store i32 %8, ptr %add.ptr.i.7, align 4, !tbaa !10
  ret i32 %8
}

define i64 @"97"(ptr %arrayidx162, ptr %__lmax.01265, ptr %v.i.i, ptr %v3.i.i, ptr %arrayidx.i736, ptr %arrayidx154, i64 %0) {
bb:
  %1 = load i32, ptr %v3.i.i, align 4
  %2 = load i32, ptr %v.i.i, align 4
  %cmp4.i.i = icmp slt i32 %2, %1
  %3 = load i32, ptr %arrayidx162, align 4, !tbaa !51
  %4 = load i32, ptr %__lmax.01265, align 4, !tbaa !51
  %cmp7.i.i = icmp slt i32 %3, %4
  %cmp.i.i = icmp eq i32 %3, %4
  %cond.i.i = select i1 %cmp.i.i, i1 %cmp4.i.i, i1 %cmp7.i.i
  %5 = load ptr, ptr %arrayidx.i736, align 8, !tbaa !96
  %6 = load i64, ptr %arrayidx154, align 8, !tbaa !0
  %sub161 = add nsw i64 %6, %0
  %arrayidx1622 = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %sub161
  %spec.select1197 = select i1 %cond.i.i, ptr %__lmax.01265, ptr %arrayidx162
  %7 = load i64, ptr %spec.select1197, align 4
  ret i64 %7
}

define i32 @"98"(ptr %this, ptr %_M_finish.i.i, i64 %0, i64 %sub.ptr.rhs.cast.i.i, i64 %1, i64 %2, i64 %3, i32 %4) {
bb:
  %5 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !98
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.198", ptr %5, i64 %0
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i = ashr exact i64 %sub.ptr.sub.i.i, %1
  %sub.i = add nsw i64 %sub.ptr.div.i.i, %2
  %__parent.042.in.i.i = add nsw i64 %sub.i, %2
  %__parent.042.i1112.i = lshr i64 %__parent.042.in.i.i, %0
  %.pre = load ptr, ptr %this, align 8, !tbaa !23
  %add.ptr.i.i.i11 = getelementptr inbounds %"struct.std::pair.198", ptr %.pre, i64 %__parent.042.i1112.i
  %v.i.i.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %add.ptr.i.i.i11, i64 %3, i32 1
  %6 = load i32, ptr %v.i.i.i.i.i.i, align 4
  ret i32 %6
}

define i32 @"99"(ptr %.omp.lb, ptr %degree_id_pairs, i64 %indvars.iv, i32 %0) {
bb:
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %3 = trunc i64 %2 to i32
  %4 = load ptr, ptr %degree_id_pairs, align 8, !tbaa !38
  %second3.i = getelementptr inbounds %"struct.std::pair.31", ptr %4, i64 %indvars.iv, i32 1
  store i32 %3, ptr %second3.i, align 8, !tbaa !65
  ret i32 %3
}

define ptr @"100"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !43
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !23
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !45
  ret ptr %add.ptr.i
}

define ptr @"102"(ptr %__seqs_begin.coerce, i64 %0) {
bb:
  %1 = load ptr, ptr %__seqs_begin.coerce, align 8, !tbaa !42
  %incdec.ptr.i274530 = getelementptr inbounds i64, ptr %1, i64 %0
  store ptr %incdec.ptr.i274530, ptr %__seqs_begin.coerce, align 8, !tbaa !42
  ret ptr %incdec.ptr.i274530
}

define ptr @"103"(ptr %_M_finish.i.i.i.i.i870, i64 %0) {
bb:
  %1 = load ptr, ptr %_M_finish.i.i.i.i.i870, align 8, !tbaa !23
  %incdec.ptr.i.i912 = getelementptr inbounds %"struct.std::pair.20", ptr %1, i64 %0
  store ptr %incdec.ptr.i.i912, ptr %_M_finish.i.i.i.i.i870, align 8, !tbaa !86
  ret ptr %incdec.ptr.i.i912
}

define <2 x i64> @"104"(ptr %arrayidx.i138, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %arrayidx.i138, align 8, !tbaa !42
  %incdec.ptr.i297457 = getelementptr i64, ptr %2, i64 %0
  %next.gep770 = getelementptr i8, ptr %incdec.ptr.i297457, i64 %1
  %wide.load774 = load <2 x i64>, ptr %next.gep770, align 8, !tbaa !0
  ret <2 x i64> %wide.load774
}

define i8 @"105"(ptr %_M_losers.i.i, ptr %_M_k.i.i, ptr %_M_source.i113, i32 %0) {
bb:
  %1 = load i32, ptr %_M_k.i.i, align 4, !tbaa !62
  %.pre = load i32, ptr %_M_source.i113, align 4, !tbaa !56
  %add.i120 = add i32 %1, %.pre
  %__pos.050.i = lshr i32 %add.i120, %0
  %idxprom.i123 = zext i32 %__pos.050.i to i64
  %.pre189 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !53
  %arrayidx3.i = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<long, std::less<long>>::_Loser", ptr %.pre189, i64 %idxprom.i123
  %.pre.i = load i8, ptr %arrayidx3.i, align 1, !tbaa !19, !range !21
  ret i8 %.pre.i
}

define i32 @"106"(ptr %call148, ptr %arrayidx.i498, i64 %0, i64 %total_missing_inv.1606, ptr %arrayidx.i497) {
bb:
  %1 = load i64, ptr %arrayidx.i498, align 8, !tbaa !0
  %i174.0 = add nsw i64 %1, %0
  %.pre659 = load i32, ptr %arrayidx.i497, align 4, !tbaa !10
  %.pre670 = sext i32 %.pre659 to i64
  %sub193 = sub nsw i64 %total_missing_inv.1606, %.pre670
  %sub183 = sub nsw i64 %i174.0, %sub193
  %arrayidx184 = getelementptr inbounds i32, ptr %call148, i64 %sub183
  %2 = load i32, ptr %arrayidx184, align 4, !tbaa !10
  ret i32 %2
}

define i64 @"107"(ptr %arrayidx.i52.3, ptr %arrayidx.i52.2, ptr %arrayidx.i52.1, ptr %arrayidx.i52, i64 %total.070, ptr %arrayidx.i51) {
bb:
  %0 = load i64, ptr %arrayidx.i52.2, align 8, !tbaa !0
  %1 = load i64, ptr %arrayidx.i52, align 8, !tbaa !0
  %add4 = add nsw i64 %1, %total.070
  %2 = load i64, ptr %arrayidx.i52.1, align 8, !tbaa !0
  %add4.1 = add nsw i64 %2, %add4
  %add4.2 = add nsw i64 %0, %add4.1
  %3 = load i64, ptr %arrayidx.i52.3, align 8, !tbaa !0
  %add4.3 = add nsw i64 %3, %add4.2
  store i64 %add4.3, ptr %arrayidx.i51, align 8, !tbaa !0
  ret i64 %add4.3
}

define i64 @"108"(ptr %second10, i64 %0) {
bb:
  %1 = load ptr, ptr %second10, align 8, !tbaa !12
  %incdec.ptr.i228488 = getelementptr i64, ptr %1, i64 %0
  %incdec.ptr.i297457 = getelementptr i64, ptr %incdec.ptr.i228488, i64 %0
  %incdec.ptr.i297.us = getelementptr inbounds i64, ptr %incdec.ptr.i297457, i64 %0
  %2 = load i64, ptr %incdec.ptr.i297.us, align 8, !tbaa !0
  ret i64 %2
}

define i64 @"109"(i64 %add6.i, ptr %__size, i64 %conv.i, i64 %indvars.iv.next.i, i64 %div.i, i64 %add.i.2, i64 %add.i.3, i64 %add.i, ptr %incdec.ptr.i) {
bb:
  %0 = load i64, ptr %__size, align 8, !tbaa !0
  %div.i2 = sdiv i64 %0, %conv.i
  %cond.i.1 = add i64 %add6.i, %div.i
  %rem.i = srem i64 %0, %conv.i
  %cmp5.i.1 = icmp sgt i64 %rem.i, %indvars.iv.next.i
  %add.i.1 = zext i1 %cmp5.i.1 to i64
  %add6.i.1 = add i64 %cond.i.1, %add.i.1
  %cond.i.2 = add i64 %add6.i.1, %div.i
  %add6.i.2 = add i64 %cond.i.2, %add.i.2
  %cond.i.3 = add i64 %add6.i.2, %div.i
  %add6.i.3 = add i64 %cond.i.3, %add.i.3
  %cond.i = add i64 %add6.i.3, %div.i
  %add6.i4 = add i64 %cond.i, %add.i
  store i64 %add6.i, ptr %incdec.ptr.i, align 8, !tbaa !0
  ret i64 %add6.i
}

define i64 @"110"(ptr %arrayidx.i.i.i162, ptr %arrayidx.i7.i.i164, i64 %0, ptr %arrayidx.i.i.i129, ptr %arrayidx.i7.i.i131, ptr %__size.i) {
bb:
  %1 = load ptr, ptr %arrayidx.i7.i.i164, align 8, !tbaa !23
  %sub.ptr.rhs.cast.i.i166 = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %arrayidx.i.i.i162, align 8, !tbaa !23
  %sub.ptr.lhs.cast.i.i165 = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i167 = sub i64 %sub.ptr.lhs.cast.i.i165, %sub.ptr.rhs.cast.i.i166
  %sub.ptr.div13.i = ashr exact i64 %sub.ptr.sub.i.i167, %0
  %3 = load ptr, ptr %arrayidx.i.i.i129, align 8, !tbaa !23
  %sub.ptr.lhs.cast.i.i132 = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %arrayidx.i7.i.i131, align 8, !tbaa !23
  %sub.ptr.rhs.cast.i.i133 = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i.i134 = sub i64 %sub.ptr.lhs.cast.i.i132, %sub.ptr.rhs.cast.i.i133
  %sub.ptr.div.i226 = ashr exact i64 %sub.ptr.sub.i.i134, %0
  %add.i227 = add nsw i64 %sub.ptr.div13.i, %sub.ptr.div.i226
  store i64 %add.i227, ptr %__size.i, align 8, !tbaa !0
  ret i64 %add.i227
}

define i64 @"111"(i64 %0, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %this, align 8, !tbaa !23
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %1
  %_M_string_length.i24.i.i.i = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i, i32 1
  store i64 %0, ptr %_M_string_length.i24.i.i.i, align 8, !tbaa !67
  ret i64 %0
}

define i64 @"112"(ptr %bulk_prefix, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %bulk_prefix, align 8, !tbaa !4
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds i64, ptr %0, i64 %1
  %2 = load i64, ptr %arrayidx.i, align 8, !tbaa !0
  ret i64 %2
}

define i32 @"113"(ptr %call148, ptr %arrayidx.i498, ptr %arrayidx.i496, ptr %arrayidx.i497, i64 %0, i64 %1, i64 %total_missing_inv.0596, ptr %arrayidx.i492) {
bb:
  %2 = load i32, ptr %arrayidx.i497, align 4, !tbaa !10
  %conv172 = sext i32 %2 to i64
  %3 = load i64, ptr %arrayidx.i496, align 8, !tbaa !0
  %add173 = add nsw i64 %3, %conv172
  %4 = load i64, ptr %arrayidx.i498, align 8, !tbaa !0
  %5 = sub i64 %4, %add173
  %n.vec733 = and i64 %5, %0
  %ind.end734 = sub i64 %4, %n.vec733
  %i174.0 = add nsw i64 %ind.end734, %1
  %6 = load i32, ptr %arrayidx.i492, align 4, !tbaa !10
  %conv137 = sext i32 %6 to i64
  %add138 = add nsw i64 %total_missing_inv.0596, %conv137
  %sub183 = sub nsw i64 %i174.0, %add138
  %arrayidx184 = getelementptr inbounds i32, ptr %call148, i64 %sub183
  %7 = load i32, ptr %arrayidx184, align 4, !tbaa !10
  ret i32 %7
}

define i64 @"114"(ptr %add.ptr.i.i.i.i.i, ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, ptr %v.i.i.i.i.i.i.i, ptr %v3.i.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0) {
bb:
  %1 = load i32, ptr %add.ptr.i.i.i.i, align 4, !tbaa !51
  %2 = load i32, ptr %add.ptr2.i.i.i.i, align 4, !tbaa !51
  %cmp7.i.i.i.i.i.i.i = icmp slt i32 %1, %2
  %cmp.i.i.i.i.i.i.i = icmp eq i32 %1, %2
  %3 = load i32, ptr %v3.i.i.i.i.i.i.i, align 4
  %4 = load i32, ptr %v.i.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i.i = icmp slt i32 %4, %3
  %cond.i.i.i.i.i.i.i = select i1 %cmp.i.i.i.i.i.i.i, i1 %cmp4.i.i.i.i.i.i.i, i1 %cmp7.i.i.i.i.i.i.i
  %spec.select.i.i.i.i = select i1 %cond.i.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %add.ptr2.i.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %sub12.i.i.i.i
  %5 = load i64, ptr %add.ptr.i.i.i.i.i, align 4
  store i64 %5, ptr %add.ptr2.i.i.i.i.i, align 4
  ret i64 %5
}

define i32 @"115"(i64 %sub.ptr.lhs.cast, ptr %n_start.0.in, i64 %0, ptr %diffs, i64 %indvars.iv) {
bb:
  %1 = load ptr, ptr %diffs, align 8, !tbaa !9
  %arrayidx.i94 = getelementptr inbounds i32, ptr %1, i64 %indvars.iv
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !23
  %sub.ptr.rhs.cast.i.i.i.i = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast.i.i.i.i
  %2 = lshr exact i64 %sub.ptr.sub, %0
  %conv22 = trunc i64 %2 to i32
  store i32 %conv22, ptr %arrayidx.i94, align 4, !tbaa !10
  ret i32 %conv22
}

define <2 x i64> @"116"(ptr %arrayidx.i138, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %arrayidx.i138, align 8, !tbaa !42
  %incdec.ptr.i228488 = getelementptr i64, ptr %2, i64 %0
  %next.gep = getelementptr i8, ptr %incdec.ptr.i228488, i64 %1
  %wide.load = load <2 x i64>, ptr %next.gep, align 8, !tbaa !0
  ret <2 x i64> %wide.load
}

define i64 @"117"(ptr %__result, i64 %0, ptr %__lengths, i64 %idxprom53) {
bb:
  %agg.tmp61.sroa.0.0.copyload = load ptr, ptr %__result, align 8
  %sub.ptr.lhs.cast.i = ptrtoint ptr %agg.tmp61.sroa.0.0.copyload to i64
  %sub.ptr.rhs.cast.i = ptrtoint ptr %agg.tmp61.sroa.0.0.copyload to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %1 = load ptr, ptr %__lengths, align 8, !tbaa !23
  %arrayidx75 = getelementptr inbounds i64, ptr %1, i64 %idxprom53
  store i64 %sub.ptr.div.i, ptr %arrayidx75, align 8, !tbaa !0
  ret i64 %sub.ptr.div.i
}

define i64 @"118"(i64 %__pos.049, ptr %__n, ptr %__num_threads, i64 %conv9, i64 %indvars.iv54, i64 %div, i64 %add28.1, ptr %arrayidx34) {
bb:
  %0 = load i64, ptr %__n, align 8, !tbaa !0
  %rem = srem i64 %0, %conv9
  %cmp27 = icmp sgt i64 %rem, %indvars.iv54
  %add28 = zext i1 %cmp27 to i64
  %1 = load i16, ptr %__num_threads, align 2, !tbaa !83
  %.fr58 = freeze i16 %1
  %conv92 = zext i16 %.fr58 to i64
  %div4 = sdiv i64 %0, %conv9
  %cond = add i64 %__pos.049, %div
  %add29 = add i64 %cond, %add28
  %cond.1 = add i64 %add29, %div
  %add29.1 = add i64 %cond.1, %add28.1
  store i64 %add29.1, ptr %arrayidx34, align 8, !tbaa !0
  ret i64 %add29.1
}

define i32 @"119"(ptr %second.epil, ptr %arrayidx.i.epil, i64 %0, ptr %1, i32 %2) {
bb:
  %3 = load ptr, ptr %second.epil, align 8, !tbaa !66
  %sub.ptr.lhs.cast.epil = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %arrayidx.i.epil, align 8, !tbaa !63
  %sub.ptr.rhs.cast.epil = ptrtoint ptr %4 to i64
  %sub.ptr.sub.epil = sub i64 %sub.ptr.lhs.cast.epil, %sub.ptr.rhs.cast.epil
  %cmp4.epil = icmp sgt i64 %sub.ptr.sub.epil, %0
  %spec.select.epil = select i1 %cmp4.epil, ptr %4, ptr %1
  %second.i.i = getelementptr inbounds %"struct.std::pair.31", ptr %spec.select.epil, i64 %0, i32 1
  %5 = load i32, ptr %second.i.i, align 8, !tbaa !65
  ret i32 %5
}

define <2 x i64> @"120"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %rng, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
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

define i32 @"121"(ptr %_M_source15.i155, ptr %_M_losers.i.i, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !59
  %_M_source28.i177 = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<EdgePair<int>, std::less<EdgePair<int>>>::_Loser", ptr %2, i64 %0, i32 1
  %3 = load i32, ptr %_M_source15.i155, align 4, !tbaa !10
  store i32 %3, ptr %_M_source28.i177, align 4, !tbaa !93
  ret i32 %3
}

define <4 x i32> @"122"(ptr %call148, ptr %arrayidx.i498, i64 %0, i64 %total_missing_inv.1606, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i498, align 8, !tbaa !0
  %3 = add i64 %2, %0
  %4 = sub nsw i64 %3, %total_missing_inv.1606
  %5 = getelementptr inbounds i32, ptr %call148, i64 %4
  %6 = getelementptr inbounds i32, ptr %5, i64 %1
  %wide.load743 = load <4 x i32>, ptr %6, align 4, !tbaa !10
  ret <4 x i32> %wide.load743
}

define i32 @"123"(ptr %n_start.0.in, i64 %0, i64 %1, ptr %diffs, ptr %.omp.lb) {
bb:
  %2 = load ptr, ptr %diffs, align 8, !tbaa !9
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %4 = sext i32 %3 to i64
  %arrayidx.i94 = getelementptr inbounds i32, ptr %2, i64 %4
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !23
  %sub.ptr.rhs.cast.i.i.i.i = ptrtoint ptr %n_start.0 to i64
  %incdec.ptr7.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast.i.i.i.i
  %5 = lshr exact i64 %sub.ptr.sub, %1
  %conv22 = trunc i64 %5 to i32
  store i32 %conv22, ptr %arrayidx.i94, align 4, !tbaa !10
  ret i32 %conv22
}

define i64 @"124"(ptr %arrayidx.i, i64 %0) {
bb:
  %1 = load ptr, ptr %arrayidx.i, align 8, !tbaa !42
  %incdec.ptr.i205471 = getelementptr inbounds i64, ptr %1, i64 %0
  %incdec.ptr.i251521 = getelementptr inbounds i64, ptr %incdec.ptr.i205471, i64 %0
  %2 = load i64, ptr %incdec.ptr.i251521, align 8, !tbaa !0
  ret i64 %2
}

define i32 @"125"(ptr %arrayidx184, ptr %call148, ptr %arrayidx.i495, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx.i495, align 8, !tbaa !0
  %sub159 = add nsw i64 %1, %0
  %arrayidx185 = getelementptr inbounds i32, ptr %call148, i64 %sub159
  %2 = load i32, ptr %arrayidx184, align 4, !tbaa !10
  store i32 %2, ptr %arrayidx185, align 4, !tbaa !10
  ret i32 %2
}

define <4 x i32> @"126"(ptr %call148, ptr %arrayidx.i498, i64 %0, i64 %total_missing_inv.0596, ptr %arrayidx.i492, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i498, align 8, !tbaa !0
  %3 = add i64 %2, %0
  %4 = load i32, ptr %arrayidx.i492, align 4, !tbaa !10
  %conv137 = sext i32 %4 to i64
  %add138 = add nsw i64 %total_missing_inv.0596, %conv137
  %5 = sub nsw i64 %3, %add138
  %6 = getelementptr inbounds i32, ptr %call148, i64 %5
  %7 = getelementptr inbounds i32, ptr %6, i64 %1
  %wide.load743 = load <4 x i32>, ptr %7, align 4, !tbaa !10
  ret <4 x i32> %wide.load743
}

define i32 @"127"(i64 %indvars.iv643, ptr %incdec.ptr4.sink.i.i.i.i525, ptr %__first.addr.015.i.i519, ptr %call148, ptr %arrayidx.i506, i64 %sub.ptr.rhs.cast.i.i.i.i508, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i506, align 8, !tbaa !0
  %add.ptr234 = getelementptr inbounds i32, ptr %call148, i64 %2
  %sub.ptr.lhs.cast.i.i.i.i507 = ptrtoint ptr %add.ptr234 to i64
  %sub.ptr.sub.i.i.i.i509 = sub i64 %sub.ptr.lhs.cast.i.i.i.i507, %sub.ptr.rhs.cast.i.i.i.i508
  %sub.ptr.div.i.i.i.i517 = lshr exact i64 %sub.ptr.sub.i.i.i.i509, %0
  %shr.i.i521 = lshr i64 %sub.ptr.div.i.i.i.i517, %1
  %incdec.ptr4.sink.i.i.i.i5252 = getelementptr inbounds i32, ptr %__first.addr.015.i.i519, i64 %shr.i.i521
  %incdec.ptr.i.i527 = getelementptr inbounds i32, ptr %incdec.ptr4.sink.i.i.i.i525, i64 %1
  %3 = load i32, ptr %incdec.ptr4.sink.i.i.i.i525, align 4, !tbaa !10
  %4 = sext i32 %3 to i64
  %cmp.i.i.i526 = icmp sgt i64 %indvars.iv643, %4
  %__first.addr.1.i.i530 = select i1 %cmp.i.i.i526, ptr %incdec.ptr.i.i527, ptr %__first.addr.015.i.i519
  %5 = load i32, ptr %__first.addr.1.i.i530, align 4, !tbaa !10
  ret i32 %5
}

define i64 @"128"(ptr %second6, i64 %0) {
bb:
  %1 = load ptr, ptr %second6, align 8, !tbaa !12
  %incdec.ptr.i251521 = getelementptr inbounds i64, ptr %1, i64 %0
  %2 = load i64, ptr %incdec.ptr.i251521, align 8, !tbaa !0
  ret i64 %2
}

define i64 @"129"(ptr %arrayidx.i25, i64 %0, ptr %arrayidx.i23, ptr %el, i64 %.omp.iv.028) {
bb:
  %1 = load i32, ptr %arrayidx.i23, align 4, !tbaa !10
  %ref.tmp.sroa.0.0.insert.ext = zext i32 %1 to i64
  %2 = load i32, ptr %arrayidx.i25, align 4, !tbaa !10
  %ref.tmp.sroa.4.0.insert.ext = zext i32 %2 to i64
  %ref.tmp.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp.sroa.4.0.insert.ext, %0
  %ref.tmp.sroa.0.0.insert.insert = or i64 %ref.tmp.sroa.4.0.insert.shift, %ref.tmp.sroa.0.0.insert.ext
  %3 = load ptr, ptr %el, align 8, !tbaa !43
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %.omp.iv.028
  store i64 %ref.tmp.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp.sroa.0.0.insert.insert
}

define <4 x i32> @"130"(<4 x i32> %0, ptr %init_val, i64 %1, ptr %this, ptr %.omp.lb, i64 %index) {
bb:
  %2 = load i32, ptr %init_val, align 4, !tbaa !10, !alias.scope !14
  %broadcast.splatinsert21 = insertelement <4 x i32> %0, i32 %2, i64 %1
  %broadcast.splat22 = shufflevector <4 x i32> %broadcast.splatinsert21, <4 x i32> %0, <4 x i32> zeroinitializer
  %3 = load ptr, ptr %this, align 8, !tbaa !9
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %offset.idx = add i64 %4, %index
  %5 = getelementptr inbounds i32, ptr %3, i64 %offset.idx
  store <4 x i32> %broadcast.splat22, ptr %5, align 4, !tbaa !10, !alias.scope !17, !noalias !14
  ret <4 x i32> %broadcast.splat22
}

define <4 x i32> @"131"(ptr %call148, ptr %arrayidx.i498, i64 %0, i64 %total_missing_inv.1606, ptr %arrayidx.i497, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i498, align 8, !tbaa !0
  %3 = add i64 %2, %0
  %4 = load i32, ptr %arrayidx.i497, align 4, !tbaa !10
  %conv172 = sext i32 %4 to i64
  %sub193 = sub nsw i64 %total_missing_inv.1606, %conv172
  %5 = sub nsw i64 %3, %sub193
  %6 = getelementptr inbounds i32, ptr %call148, i64 %5
  %7 = getelementptr inbounds i32, ptr %6, i64 %1
  %wide.load743 = load <4 x i32>, ptr %7, align 4, !tbaa !10
  ret <4 x i32> %wide.load743
}

define i32 @"132"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i32, ptr %init_val, align 4, !tbaa !10
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add7 = add i64 %ind.end, %2
  %6 = load ptr, ptr %this, align 8, !tbaa !9
  %add.ptr.1 = getelementptr inbounds i32, ptr %6, i64 %add7
  store i32 %3, ptr %add.ptr.1, align 4, !tbaa !10
  ret i32 %3
}

define <2 x i64> @"133"(ptr %arrayidx.i138, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %arrayidx.i138, align 8, !tbaa !42
  %incdec.ptr.i297457 = getelementptr i64, ptr %3, i64 %0
  %incdec.ptr.i228488 = getelementptr i64, ptr %incdec.ptr.i297457, i64 %0
  %next.gep = getelementptr i8, ptr %incdec.ptr.i228488, i64 %1
  %4 = getelementptr i64, ptr %next.gep, i64 %2
  %wide.load750 = load <2 x i64>, ptr %4, align 8, !tbaa !0
  ret <2 x i64> %wide.load750
}

define ptr @"134"(ptr %arrayidx, ptr %__num_threads, ptr %_M_pieces, i64 %indvars.iv, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %arrayidx, align 8, !tbaa !100
  %3 = load i16, ptr %__num_threads, align 2, !tbaa !83
  %.fr58 = freeze i16 %3
  %conv11 = zext i16 %.fr58 to i64
  %add.ptr.i = getelementptr inbounds %"struct.__gnu_parallel::_Piece", ptr %2, i64 %conv11
  %4 = load ptr, ptr %_M_pieces, align 8, !tbaa !102
  %arrayidx2 = getelementptr inbounds %"class.std::vector", ptr %4, i64 %indvars.iv
  %_M_finish.i.i = getelementptr inbounds %"struct.std::_Vector_base<__gnu_parallel::_Piece<long>, std::allocator<__gnu_parallel::_Piece<long>>>::_Vector_impl_data", ptr %arrayidx, i64 %0, i32 1
  store ptr %add.ptr.i, ptr %_M_finish.i.i, align 8, !tbaa !104
  ret ptr %add.ptr.i
}

define i64 @"135"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %add.ptr.i.i.i.i, align 8, !tbaa !0
  %3 = load i64, ptr %add.ptr2.i.i.i.i, align 8, !tbaa !0
  %cmp.i.i.i.i.i.i = icmp slt i64 %2, %3
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add10.i.i.i.i = shl i64 %spec.select.i.i.i.i, %0
  %sub12.i.i.i.i = or i64 %add10.i.i.i.i, %0
  %__parent.020.in.i.i.i.i.i = add nsw i64 %sub12.i.i.i.i, %1
  %__parent.020.i.i45.i.i.i = lshr i64 %__parent.020.in.i.i.i.i.i, %0
  %add.ptr.i.i.i.i.i = getelementptr inbounds i64, ptr %__first, i64 %__parent.020.i.i45.i.i.i
  %4 = load i64, ptr %add.ptr.i.i.i.i.i, align 8, !tbaa !0
  ret i64 %4
}

define i64 @"136"(ptr %arrayidx.i, i64 %0) {
bb:
  %1 = load ptr, ptr %arrayidx.i, align 8, !tbaa !42
  %incdec.ptr.i251521 = getelementptr inbounds i64, ptr %1, i64 %0
  %incdec.ptr.i205471 = getelementptr inbounds i64, ptr %incdec.ptr.i251521, i64 %0
  %2 = load i64, ptr %incdec.ptr.i205471, align 8, !tbaa !0
  ret i64 %2
}

define i64 @"137"(ptr %second, ptr %arrayidx.i, i64 %0, ptr %1) {
bb:
  %2 = load ptr, ptr %arrayidx.i, align 8, !tbaa !42
  %sub.ptr.rhs.cast = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %second, align 8, !tbaa !12
  %sub.ptr.lhs.cast = ptrtoint ptr %3 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %cmp4 = icmp sgt i64 %sub.ptr.sub, %0
  %spec.select = select i1 %cmp4, ptr %2, ptr %1
  %4 = load i64, ptr %spec.select, align 8, !tbaa !0
  ret i64 %4
}

define <2 x i64> @"138"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %3, i64 %4, <2 x i64> %5, <2 x i64> %6, ptr %7, <2 x i64> %8, <2 x i64> %9, ptr %udist_, i64 %10, i64 %index15) {
bb:
  %wide.load18 = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %11 = and <2 x i64> %wide.load18, %6
  %12 = icmp eq <2 x i64> %11, %8
  %13 = select <2 x i1> %12, <2 x i64> %8, <2 x i64> %9
  %.pre.i.i = load i64, ptr %3, align 8, !tbaa !0
  %vector.recur.init16 = insertelement <2 x i64> %2, i64 %.pre.i.i, i64 %4
  %14 = shufflevector <2 x i64> %vector.recur.init16, <2 x i64> %wide.load18, <2 x i32> <i32 1, i32 2>
  %15 = and <2 x i64> %14, %5
  %16 = and <2 x i64> %wide.load18, %1
  %17 = or <2 x i64> %16, %15
  %18 = lshr exact <2 x i64> %17, %6
  %wide.load19 = load <2 x i64>, ptr %7, align 8, !tbaa !0
  %19 = xor <2 x i64> %18, %wide.load19
  %20 = xor <2 x i64> %19, %13
  %21 = load ptr, ptr %udist_, align 8, !tbaa !68
  %22 = getelementptr inbounds [312 x i64], ptr %3, i64 %10, i64 %index15
  store <2 x i64> %20, ptr %22, align 8, !tbaa !0
  ret <2 x i64> %20
}

define i64 @"139"(ptr %arrayidx.i, i64 %0) {
bb:
  %1 = load ptr, ptr %arrayidx.i, align 8, !tbaa !42
  %incdec.ptr.i251521 = getelementptr inbounds i64, ptr %1, i64 %0
  %incdec.ptr.i205471 = getelementptr inbounds i64, ptr %incdec.ptr.i251521, i64 %0
  %2 = load i64, ptr %incdec.ptr.i205471, align 8, !tbaa !0
  ret i64 %2
}

define ptr @"140"(ptr %arrayidx.i114, i64 %0, ptr %__seqs_begin.coerce, ptr %_M_source.i113) {
bb:
  %1 = load ptr, ptr %arrayidx.i114, align 8, !tbaa !42
  %incdec.ptr = getelementptr inbounds i64, ptr %1, i64 %0
  %.pre = load i32, ptr %_M_source.i113, align 4, !tbaa !56
  %conv36 = sext i32 %.pre to i64
  %arrayidx.i1142 = getelementptr inbounds %"struct.std::pair", ptr %__seqs_begin.coerce, i64 %conv36
  store ptr %incdec.ptr, ptr %arrayidx.i114, align 8, !tbaa !42
  ret ptr %incdec.ptr
}

define ptr @"141"(ptr %neighs, ptr %arrayidx.i.prol, ptr %index, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %arrayidx.i.prol, align 8, !tbaa !0
  %1 = load ptr, ptr %neighs, align 8, !tbaa !23
  %add.ptr.prol = getelementptr inbounds i32, ptr %1, i64 %0
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %3 = sext i32 %2 to i64
  %4 = load ptr, ptr %index, align 8, !tbaa !23
  %arrayidx.prol = getelementptr inbounds ptr, ptr %4, i64 %3
  store ptr %add.ptr.prol, ptr %arrayidx.prol, align 8, !tbaa !23
  ret ptr %add.ptr.prol
}

define ptr @"142"(ptr %neighs, ptr %arrayidx.i.1, ptr %index, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %index, align 8, !tbaa !23
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %3 = sext i32 %2 to i64
  %indvars.iv.next = add nsw i64 %3, %0
  %arrayidx.1 = getelementptr inbounds ptr, ptr %1, i64 %indvars.iv.next
  %4 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !0
  %5 = load ptr, ptr %neighs, align 8, !tbaa !23
  %add.ptr.1 = getelementptr inbounds i32, ptr %5, i64 %4
  store ptr %add.ptr.1, ptr %arrayidx.1, align 8, !tbaa !23
  ret ptr %add.ptr.1
}

define i64 @"143"(ptr %udist_, i64 %0, ptr %_M_p.i) {
bb:
  %.pre = load i64, ptr %_M_p.i, align 8, !tbaa !105
  %1 = load ptr, ptr %udist_, align 8, !tbaa !68
  %arrayidx.i7 = getelementptr inbounds [312 x i64], ptr %1, i64 %0, i64 %.pre
  %2 = load i64, ptr %arrayidx.i7, align 8, !tbaa !0
  ret i64 %2
}

define i64 @"144"(i64 %val.coerce, ptr %new_range.i, ptr %end_size_.i, ptr %this, i64 %0) {
bb:
  %1 = load ptr, ptr %new_range.i, align 8, !tbaa !23
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast.i10.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %this, align 8, !tbaa !43
  %sub.ptr.rhs.cast.i11.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i12.i = sub i64 %sub.ptr.lhs.cast.i10.i, %sub.ptr.rhs.cast.i11.i
  %sub.ptr.div.i13.i = ashr exact i64 %sub.ptr.sub.i12.i, %0
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %sub.ptr.div.i13.i
  store i64 %val.coerce, ptr %add.ptr.i, align 4, !tbaa.struct !72
  ret i64 %val.coerce
}

define i64 @"145"(ptr %second.epil, ptr %arrayidx.i.epil, i64 %0, ptr %1) {
bb:
  %2 = load ptr, ptr %arrayidx.i.epil, align 8, !tbaa !42
  %sub.ptr.rhs.cast.epil = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %second.epil, align 8, !tbaa !12
  %sub.ptr.lhs.cast.epil = ptrtoint ptr %3 to i64
  %sub.ptr.sub.epil = sub i64 %sub.ptr.lhs.cast.epil, %sub.ptr.rhs.cast.epil
  %cmp4.epil = icmp sgt i64 %sub.ptr.sub.epil, %0
  %spec.select.epil = select i1 %cmp4.epil, ptr %2, ptr %1
  %4 = load i64, ptr %spec.select.epil, align 8, !tbaa !0
  ret i64 %4
}

define i64 @"146"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !80
  %inc.i70 = add nuw nsw i64 %1, %0
  %inc.i206 = add nuw nsw i64 %inc.i70, %0
  %inc.i138 = add nuw nsw i64 %inc.i206, %0
  store i64 %inc.i138, ptr %_M_p.i.i.i, align 8, !tbaa !80
  ret i64 %inc.i138
}

define ptr @"147"(ptr %new_range.i.i, ptr %0, ptr %el, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !23
  %3 = load ptr, ptr %el, align 8, !tbaa !43
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre653 = load ptr, ptr %el, align 8, !tbaa !43
  %.pre669 = ptrtoint ptr %.pre653 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre669
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %add.ptr.i424 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div14
  store ptr %add.ptr.i424, ptr %end_size_.i, align 8, !tbaa !45
  ret ptr %add.ptr.i424
}

define i64 @"148"(ptr %arrayidx.i452.1, ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !90
  %4 = and i64 %3, %0
  %indvars.iv.next = add nsw i64 %4, %1
  %arrayidx.i453.1 = getelementptr inbounds i64, ptr %2, i64 %indvars.iv.next
  %5 = load i64, ptr %arrayidx.i452.1, align 8, !tbaa !0
  store i64 %5, ptr %arrayidx.i453.1, align 8, !tbaa !0
  ret i64 %5
}

define i64 @"149"(ptr %arrayidx.i138, i64 %0) {
bb:
  %1 = load ptr, ptr %arrayidx.i138, align 8, !tbaa !42
  %incdec.ptr.i297457 = getelementptr i64, ptr %1, i64 %0
  %incdec.ptr.i228488 = getelementptr i64, ptr %incdec.ptr.i297457, i64 %0
  %incdec.ptr.i228.us = getelementptr inbounds i64, ptr %incdec.ptr.i228488, i64 %0
  %2 = load i64, ptr %incdec.ptr.i228.us, align 8, !tbaa !0
  ret i64 %2
}

define i64 @"150"(ptr %arrayidx.i52.epil, i64 %total.070.epil, ptr %call.i3539, ptr %num_blocks) {
bb:
  %0 = load i64, ptr %num_blocks, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds i64, ptr %call.i3539, i64 %0
  %1 = load i64, ptr %arrayidx.i52.epil, align 8, !tbaa !0
  %add4.epil = add nsw i64 %1, %total.070.epil
  store i64 %add4.epil, ptr %arrayidx.i, align 8, !tbaa !0
  ret i64 %add4.epil
}

define i64 @"151"(ptr %add.ptr.i.i.i11, ptr %this, ptr %_M_finish.i.i, i64 %0, i64 %sub.ptr.rhs.cast.i.i, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !86
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.20", ptr %3, i64 %0
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i = ashr exact i64 %sub.ptr.sub.i.i, %1
  %sub.i = add nsw i64 %sub.ptr.div.i.i, %2
  %.pre = load ptr, ptr %this, align 8, !tbaa !23
  %add.ptr.i26.i.i = getelementptr inbounds %"struct.std::pair.20", ptr %.pre, i64 %sub.i
  %4 = load i64, ptr %add.ptr.i.i.i11, align 8, !tbaa !0
  store i64 %4, ptr %add.ptr.i26.i.i, align 8, !tbaa !107
  ret i64 %4
}

define i64 @"152"(ptr %.omp.lb, i64 %0, i64 %1, ptr %rng) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add10 = add i64 %2, %0
  %rem.i.i.i = and i64 %add10, %1
  store i64 %rem.i.i.i, ptr %rng, align 8, !tbaa !0
  ret i64 %rem.i.i.i
}

define ptr @"153"(ptr %new_range.i.i417, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !43
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %.pre653 = load ptr, ptr %el, align 8, !tbaa !43
  %.pre669 = ptrtoint ptr %.pre653 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre669
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %.pre.i.i436 = load ptr, ptr %new_range.i.i417, align 8, !tbaa !23
  %add.ptr6.i.i438 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i436, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i438, ptr %end_capacity_.i.i.i, align 8, !tbaa !82
  ret ptr %add.ptr6.i.i438
}

define <8 x i32> @"154"(ptr %el, ptr %.omp.lb, i64 %index, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %offset.idx = add i64 %1, %index
  %2 = add i64 %offset.idx, %0
  %3 = load ptr, ptr %el, align 8, !tbaa !43
  %4 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %2
  %wide.vec44 = load <8 x i32>, ptr %4, align 4
  ret <8 x i32> %wide.vec44
}

define i32 @"155"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add15 = add i64 %ind.end, %2
  %5 = load ptr, ptr %el, align 8, !tbaa !43
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %add15
  %6 = load i32, ptr %add.ptr.1, align 4
  ret i32 %6
}

define i64 @"156"(ptr %arrayidx.i, ptr %prefix, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %prefix, align 8
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul13 = shl i64 %2, %0
  %arrayidx.i33 = getelementptr inbounds i64, ptr %1, i64 %mul13
  %3 = load i64, ptr %arrayidx.i, align 8, !tbaa !0
  store i64 %3, ptr %arrayidx.i33, align 8, !tbaa !0
  ret i64 %3
}

define i8 @"157"(i8 %0, ptr %_M_losers.i.i, ptr %_M_k.i.i, i32 %conv18) {
bb:
  %1 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !59
  %2 = load i32, ptr %_M_k.i.i, align 4, !tbaa !95
  %add.i = add i32 %2, %conv18
  %idxprom5.i = zext i32 %add.i to i64
  %arrayidx11.i = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<EdgePair<int>, std::less<EdgePair<int>>>::_Loser", ptr %1, i64 %idxprom5.i
  store i8 %0, ptr %arrayidx11.i, align 4, !tbaa !108
  ret i8 %0
}

define i64 @"158"(ptr %__arbitrary_element.0.lcssa217, i64 %0, ptr %_M_key19.i, ptr %_M_losers.i.i, ptr %_M_k.i.i, ptr %_M_source.i116, i32 %1, i32 %2) {
bb:
  %3 = load i32, ptr %_M_source.i116, align 4, !tbaa !93
  %4 = load i32, ptr %_M_k.i.i, align 4, !tbaa !95
  %add.i123 = add i32 %4, %3
  %__pos.062.i = lshr i32 %add.i123, %1
  %idxprom.i127 = zext i32 %__pos.062.i to i64
  %.pre.i126 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !59
  %_M_key19.i2 = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<EdgePair<int>, std::less<EdgePair<int>>>::_Loser", ptr %.pre.i126, i64 %idxprom.i127, i32 2
  %5 = load i64, ptr %_M_key19.i, align 4
  %__key.sroa.0.0.extract.trunc48.i = trunc i64 %5 to i32
  %__key.sroa.0.0.insert.ext45.i = zext i32 %__key.sroa.0.0.extract.trunc48.i to i64
  %agg.tmp46.sroa.0.0.copyload = load i64, ptr %__arbitrary_element.0.lcssa217, align 4, !tbaa.struct !72
  %__key.sroa.5.0.extract.shift.i = lshr i64 %agg.tmp46.sroa.0.0.copyload, %0
  %__key.sroa.5.0.extract.trunc.i = trunc i64 %__key.sroa.5.0.extract.shift.i to i32
  %__key.sroa.5.0.insert.ext50.i = zext i32 %__key.sroa.5.0.extract.trunc.i to i64
  %__key.sroa.5.0.insert.shift51.i = shl nuw i64 %__key.sroa.5.0.insert.ext50.i, %0
  %__key.sroa.0.0.insert.insert47.i = or i64 %__key.sroa.5.0.insert.shift51.i, %__key.sroa.0.0.insert.ext45.i
  store i64 %__key.sroa.0.0.insert.insert47.i, ptr %_M_key19.i, align 4
  ret i64 %__key.sroa.0.0.insert.insert47.i
}

define i32 @"159"(ptr %_M_source.i113, ptr %_M_losers.i.i, ptr %_M_k.i.i, i32 %0, i32 %1) {
bb:
  %.pre = load i32, ptr %_M_source.i113, align 4, !tbaa !56
  %2 = load i32, ptr %_M_k.i.i, align 4, !tbaa !62
  %add.i120 = add i32 %2, %0
  %__pos.050.i = lshr i32 %add.i120, %1
  %idxprom.i123 = zext i32 %__pos.050.i to i64
  %.pre189 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !53
  %_M_source15.i = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<long, std::less<long>>::_Loser", ptr %.pre189, i64 %idxprom.i123, i32 1
  store i32 %.pre, ptr %_M_source15.i, align 4, !tbaa !10
  ret i32 %.pre
}

define i64 @"160"(ptr %offsets, ptr %num_nodes_.i) {
bb:
  %.pre658.pre = load ptr, ptr %offsets, align 8, !tbaa !4
  %.pre656 = load i64, ptr %num_nodes_.i, align 8, !tbaa !90
  %arrayidx.i489 = getelementptr inbounds i64, ptr %.pre658.pre, i64 %.pre656
  %0 = load i64, ptr %arrayidx.i489, align 8, !tbaa !0
  ret i64 %0
}

define i8 @"161"(ptr %_M_losers.i.i, ptr %_M_k.i.i, ptr %_M_source.i112, i32 %0) {
bb:
  %.pre191 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !74
  %1 = load i32, ptr %_M_source.i112, align 4, !tbaa !77
  %2 = load i32, ptr %_M_k.i.i, align 4, !tbaa !79
  %add.i119 = add i32 %2, %1
  %__pos.050.i = lshr i32 %add.i119, %0
  %idxprom.i122 = zext i32 %__pos.050.i to i64
  %arrayidx3.i = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<int, std::less<int>>::_Loser", ptr %.pre191, i64 %idxprom.i122
  %.pre.i = load i8, ptr %arrayidx3.i, align 1, !tbaa !19, !range !21
  ret i8 %.pre.i
}

define i64 @"162"(ptr %second, i64 %0) {
bb:
  %1 = load ptr, ptr %second, align 8, !tbaa !12
  %incdec.ptr.i274530 = getelementptr inbounds i64, ptr %1, i64 %0
  %incdec.ptr.i504 = getelementptr inbounds i64, ptr %incdec.ptr.i274530, i64 %0
  %2 = load i64, ptr %incdec.ptr.i504, align 8, !tbaa !0
  ret i64 %2
}

define i32 @"163"(ptr %num_nodes_.i, i32 %0, ptr %.omp.ub) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !109
  %conv = trunc i64 %1 to i32
  %sub3 = add nsw i32 %conv, %0
  store i32 %sub3, ptr %.omp.ub, align 4, !tbaa !10
  ret i32 %sub3
}

define i8 @"164"(ptr %arrayidx3.i, ptr %_M_losers.i.i, ptr %_M_k.i.i, ptr %_M_source.i113, i32 %0) {
bb:
  %1 = load i32, ptr %_M_k.i.i, align 4, !tbaa !62
  %.pre = load i32, ptr %_M_source.i113, align 4, !tbaa !56
  %add.i120 = add i32 %1, %.pre
  %__pos.050.i = lshr i32 %add.i120, %0
  %idxprom.i123 = zext i32 %__pos.050.i to i64
  %.pre189 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !53
  %arrayidx3.i2 = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<long, std::less<long>>::_Loser", ptr %.pre189, i64 %idxprom.i123
  %.pre.i = load i8, ptr %arrayidx3.i, align 1, !tbaa !19, !range !21
  store i8 %.pre.i, ptr %arrayidx3.i, align 1, !tbaa !19
  ret i8 %.pre.i
}

define i32 @"165"(ptr %_M_source.i112, ptr %_M_losers.i.i, ptr %_M_k.i.i, i32 %0) {
bb:
  %1 = load i32, ptr %_M_source.i112, align 4, !tbaa !77
  %.pre191 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !74
  %2 = load i32, ptr %_M_k.i.i, align 4, !tbaa !79
  %add.i119 = add i32 %2, %1
  %__pos.050.i = lshr i32 %add.i119, %0
  %idxprom.i122 = zext i32 %__pos.050.i to i64
  %_M_source15.i = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<int, std::less<int>>::_Loser", ptr %.pre191, i64 %idxprom.i122, i32 1
  store i32 %1, ptr %_M_source15.i, align 4, !tbaa !10
  ret i32 %1
}

define i64 @"166"(ptr %arrayidx.i18.i, ptr %0, i64 %1, ptr %2) {
bb:
  %3 = load ptr, ptr %0, align 8, !tbaa !23, !noalias !111
  %sub.ptr.rhs.cast.i20.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %arrayidx.i18.i, align 8, !tbaa !23, !noalias !111
  %sub.ptr.lhs.cast.i19.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i21.i = sub i64 %sub.ptr.lhs.cast.i19.i, %sub.ptr.rhs.cast.i20.i
  %sub.ptr.div.i22.i = ashr exact i64 %sub.ptr.sub.i21.i, %1
  %div.i.i = sdiv i64 %sub.ptr.div.i22.i, %1
  store i64 %div.i.i, ptr %2, align 8, !alias.scope !111
  ret i64 %div.i.i
}

define i64 @"167"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !80
  %inc.i70 = add nuw nsw i64 %2, %1
  %inc.i206 = add nuw nsw i64 %inc.i70, %1
  %arrayidx.i139 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i206
  %3 = load i64, ptr %arrayidx.i139, align 8, !tbaa !0
  ret i64 %3
}

define ptr @"168"(ptr %__seqs_begin.coerce, i64 %0) {
bb:
  %1 = load ptr, ptr %__seqs_begin.coerce, align 8, !tbaa !42
  %incdec.ptr.i504 = getelementptr inbounds i64, ptr %1, i64 %0
  %incdec.ptr.i274530 = getelementptr inbounds i64, ptr %incdec.ptr.i504, i64 %0
  store ptr %incdec.ptr.i274530, ptr %__seqs_begin.coerce, align 8, !tbaa !42
  ret ptr %incdec.ptr.i274530
}

define i64 @"169"(ptr %add.ptr.i.i.i.i18, ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i.i, ptr %v3.i.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i32, ptr %v.i.i.i.i.i.i, align 4
  %1 = load i32, ptr %v3.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i = icmp slt i32 %0, %1
  %2 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !51
  %3 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !51
  %cmp.i.i.i.i.i.i = icmp eq i32 %2, %3
  %cmp7.i.i.i.i.i.i = icmp slt i32 %2, %3
  %cond.i.i.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i1 %cmp4.i.i.i.i.i.i, i1 %cmp7.i.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr2.i.i.i.i25 = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  %4 = load i64, ptr %add.ptr.i.i.i.i18, align 4
  store i64 %4, ptr %add.ptr2.i.i.i.i25, align 4
  ret i64 %4
}

define i32 @"170"(ptr %__first.addr.033.i.i, ptr %n_start.0.in, i64 %0) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !23
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %1 = load i32, ptr %__first.addr.033.i.i, align 4, !tbaa !10
  store i32 %1, ptr %incdec.ptr12.i.i.i.i, align 4, !tbaa !10
  ret i32 %1
}

define i64 @"171"(ptr %arrayidx.i736, ptr %arrayidx186, ptr %arrayidx185, i64 %0) {
bb:
  %1 = load ptr, ptr %arrayidx.i736, align 8, !tbaa !42
  %2 = load i64, ptr %arrayidx185, align 8, !tbaa !0
  %3 = load i64, ptr %arrayidx186, align 8, !tbaa !0
  %add187 = add nsw i64 %3, %2
  %div188 = sdiv i64 %add187, %0
  %arrayidx196 = getelementptr inbounds i64, ptr %1, i64 %div188
  %4 = load i64, ptr %arrayidx196, align 8, !tbaa !0
  ret i64 %4
}

define i64 @"172"(ptr %arrayidx.i, i64 %0) {
bb:
  %1 = load ptr, ptr %arrayidx.i, align 8, !tbaa !42
  %incdec.ptr.i251521 = getelementptr inbounds i64, ptr %1, i64 %0
  %2 = load i64, ptr %incdec.ptr.i251521, align 8, !tbaa !0
  ret i64 %2
}

define ptr @"173"(ptr %_M_pieces, ptr %0, i64 %1) {
bb:
  %2 = load i64, ptr %0, align 8
  %3 = load ptr, ptr %_M_pieces, align 8, !tbaa !102
  %delete.end13 = getelementptr inbounds %"class.std::vector", ptr %3, i64 %2
  %arraydestroy.element = getelementptr inbounds %"class.std::vector", ptr %delete.end13, i64 %1
  %4 = load ptr, ptr %arraydestroy.element, align 8, !tbaa !100
  ret ptr %4
}

define i64 @"174"(ptr %arrayidx.i138) {
bb:
  %0 = load ptr, ptr %arrayidx.i138, align 8, !tbaa !42
  %1 = load i64, ptr %0, align 8, !tbaa !0
  ret i64 %1
}

define i64 @"175"(i64 %__pos.049, ptr %__n, ptr %__num_threads, i64 %conv9, i64 %indvars.iv54, i64 %div, i64 %add28.1, ptr %arrayidx25.epil) {
bb:
  %0 = load i64, ptr %__n, align 8, !tbaa !0
  %rem = srem i64 %0, %conv9
  %cmp27 = icmp sgt i64 %rem, %indvars.iv54
  %add28 = zext i1 %cmp27 to i64
  %1 = load i16, ptr %__num_threads, align 2, !tbaa !83
  %.fr58 = freeze i16 %1
  %conv92 = zext i16 %.fr58 to i64
  %div4 = sdiv i64 %0, %conv9
  %cond = add i64 %__pos.049, %div
  %add29 = add i64 %cond, %add28
  %cond.1 = add i64 %add29, %div
  %add29.1 = add i64 %cond.1, %add28.1
  store i64 %add29.1, ptr %arrayidx25.epil, align 8, !tbaa !0
  ret i64 %add29.1
}

define <2 x i64> @"176"(ptr %arrayidx.i138, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %arrayidx.i138, align 8, !tbaa !42
  %incdec.ptr.i297457 = getelementptr i64, ptr %2, i64 %0
  %incdec.ptr.i228488 = getelementptr i64, ptr %incdec.ptr.i297457, i64 %0
  %next.gep = getelementptr i8, ptr %incdec.ptr.i228488, i64 %1
  %wide.load = load <2 x i64>, ptr %next.gep, align 8, !tbaa !0
  ret <2 x i64> %wide.load
}

define ptr @"177"(ptr %arrayidx.i114, i64 %0, ptr %__seqs_begin.coerce, ptr %_M_source15.i) {
bb:
  %1 = load ptr, ptr %arrayidx.i114, align 8, !tbaa !42
  %incdec.ptr = getelementptr inbounds i64, ptr %1, i64 %0
  %2 = load i32, ptr %_M_source15.i, align 4, !tbaa !10
  %conv36 = sext i32 %2 to i64
  %arrayidx.i1142 = getelementptr inbounds %"struct.std::pair", ptr %__seqs_begin.coerce, i64 %conv36
  store ptr %incdec.ptr, ptr %arrayidx.i114, align 8, !tbaa !42
  ret ptr %incdec.ptr
}

define i32 @"178"(ptr %neighs, ptr %arrayidx.i479) {
bb:
  %0 = load i64, ptr %arrayidx.i479, align 8, !tbaa !0
  %1 = load ptr, ptr %neighs, align 8, !tbaa !23
  %add.ptr = getelementptr inbounds i32, ptr %1, i64 %0
  %2 = load i32, ptr %add.ptr, align 4, !tbaa !10
  ret i32 %2
}

define i64 @"179"(ptr %second6, i64 %0) {
bb:
  %1 = load ptr, ptr %second6, align 8, !tbaa !12
  %incdec.ptr.i251521 = getelementptr inbounds i64, ptr %1, i64 %0
  %2 = load i64, ptr %incdec.ptr.i251521, align 8, !tbaa !0
  ret i64 %2
}

define i64 @"180"(ptr %add.ptr, ptr %arrayidx, i64 %0, i64 %1, ptr %arrayidx4, i64 %2, i64 %3) {
bb:
  %4 = load i64, ptr %arrayidx, align 8, !tbaa !0
  %5 = shl i64 %4, %0
  %6 = add i64 %5, %1
  %7 = load i64, ptr %arrayidx4, align 8, !tbaa !0
  %8 = shl i64 %7, %0
  %9 = sub i64 %6, %8
  %10 = lshr exact i64 %9, %0
  %11 = add nuw nsw i64 %10, %2
  %n.vec = and i64 %11, %3
  %12 = shl i64 %n.vec, %0
  %ind.end244 = getelementptr i8, ptr %add.ptr, i64 %12
  %13 = load i64, ptr %ind.end244, align 4
  ret i64 %13
}

define i32 @"181"(ptr %n_start.0.in, i64 %0, ptr %diffs, ptr %.omp.lb) {
bb:
  %1 = load ptr, ptr %diffs, align 8, !tbaa !9
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %3 = sext i32 %2 to i64
  %arrayidx.i94 = getelementptr inbounds i32, ptr %1, i64 %3
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !23
  %sub.ptr.rhs.cast.i.i.i.i = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.lhs.cast = ptrtoint ptr %n_start.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast.i.i.i.i
  %4 = lshr exact i64 %sub.ptr.sub, %0
  %conv22 = trunc i64 %4 to i32
  store i32 %conv22, ptr %arrayidx.i94, align 4, !tbaa !10
  ret i32 %conv22
}

define i64 @"182"(ptr %this, ptr %_M_finish.i.i, i64 %0, i64 %sub.ptr.rhs.cast.i.i, i64 %1, i64 %2) {
bb:
  %.pre = load ptr, ptr %this, align 8, !tbaa !23
  %3 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !86
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.20", ptr %3, i64 %0
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i = ashr exact i64 %sub.ptr.sub.i.i, %1
  %sub.i = add nsw i64 %sub.ptr.div.i.i, %2
  %__parent.042.in.i.i = add nsw i64 %sub.i, %2
  %__parent.042.i1112.i = lshr i64 %__parent.042.in.i.i, %0
  %add.ptr.i.i.i11 = getelementptr inbounds %"struct.std::pair.20", ptr %.pre, i64 %__parent.042.i1112.i
  %4 = load i64, ptr %add.ptr.i.i.i11, align 8, !tbaa !0
  ret i64 %4
}

define ptr @"183"(ptr %new_range.i.i417, ptr %new_range.i.i, i64 %0, ptr %el, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !23
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  %sub.ptr.lhs.cast11 = ptrtoint ptr %incdec.ptr13.i.i.i.i to i64
  %.pre653 = load ptr, ptr %el, align 8, !tbaa !43
  %.pre669 = ptrtoint ptr %.pre653 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre669
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %.pre.i.i436 = load ptr, ptr %new_range.i.i417, align 8, !tbaa !23
  %add.ptr6.i.i438 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i436, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i438, ptr %end_capacity_.i.i.i, align 8, !tbaa !82
  ret ptr %add.ptr6.i.i438
}

define i32 @"184"(ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i.i, ptr %v3.i.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %v.i.i.i.i.i.i, align 4
  %3 = load i32, ptr %v3.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i = icmp slt i32 %2, %3
  %4 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !51
  %5 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !51
  %cmp.i.i.i.i.i.i = icmp eq i32 %4, %5
  %cmp7.i.i.i.i.i.i = icmp slt i32 %4, %5
  %cond.i.i.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i1 %cmp4.i.i.i.i.i.i, i1 %cmp7.i.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %__parent.020.in.i.i.i.i = add nsw i64 %spec.select.i.i.i, %0
  %__parent.020.i.i.i.i = sdiv i64 %__parent.020.in.i.i.i.i, %1
  %add.ptr.i.i.i.i18 = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %__parent.020.i.i.i.i
  %6 = load i32, ptr %add.ptr.i.i.i.i18, align 4, !tbaa !51
  ret i32 %6
}

define i32 @"185"(ptr %__seqs_begin.coerce, i64 %0, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %__seqs_begin.coerce, align 8, !tbaa !63
  %incdec.ptr.i650 = getelementptr inbounds %"struct.std::pair.31", ptr %3, i64 %0
  %second.i = getelementptr inbounds %"struct.std::pair.31", ptr %incdec.ptr.i650, i64 %1, i32 1
  %4 = load i32, ptr %second.i, align 8, !tbaa !65
  ret i32 %4
}

define i64 @"186"(ptr %__result, i64 %0, ptr %__lengths, i64 %idxprom53) {
bb:
  %agg.tmp61.sroa.0.0.copyload = load ptr, ptr %__result, align 8
  %sub.ptr.lhs.cast.i = ptrtoint ptr %agg.tmp61.sroa.0.0.copyload to i64
  %sub.ptr.rhs.cast.i = ptrtoint ptr %agg.tmp61.sroa.0.0.copyload to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %1 = load ptr, ptr %__lengths, align 8, !tbaa !23
  %arrayidx75 = getelementptr inbounds i64, ptr %1, i64 %idxprom53
  store i64 %sub.ptr.div.i, ptr %arrayidx75, align 8, !tbaa !0
  ret i64 %sub.ptr.div.i
}

define ptr @"187"(ptr %cond.i31.i.i.i, i64 %.sroa.speculated.i.i.i.i, ptr %_M_finish.i.i, ptr %this, i64 %0, i64 %sub.ptr.div.i.i.i.i.i, i1 %cmp9.i.i.i.i, i64 %1, i64 %add.i.i.i.i, ptr %_M_end_of_storage.i.i) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !23
  %sub.ptr.rhs.cast.i.i.i.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !23
  %sub.ptr.lhs.cast.i.i.i.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i2 = ashr exact i64 %sub.ptr.sub.i.i.i.i.i, %0
  %add.i.i.i.i4 = add i64 %.sroa.speculated.i.i.i.i, %sub.ptr.div.i.i.i.i.i
  %cmp7.i.i.i.i = icmp ult i64 %add.i.i.i.i, %sub.ptr.div.i.i.i.i.i
  %or.cond.i.i.i.i = or i1 %cmp7.i.i.i.i, %cmp9.i.i.i.i
  %cond.i.i.i.i = select i1 %or.cond.i.i.i.i, i64 %1, i64 %add.i.i.i.i
  %add.ptr19.i.i.i = getelementptr inbounds %"struct.std::pair.20", ptr %cond.i31.i.i.i, i64 %cond.i.i.i.i
  store ptr %add.ptr19.i.i.i, ptr %_M_end_of_storage.i.i, align 8, !tbaa !114
  ret ptr %add.ptr19.i.i.i
}

define i32 @"188"(ptr %second, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %second, align 8, !tbaa !66
  %incdec.ptr.i360692 = getelementptr inbounds %"struct.std::pair.31", ptr %2, i64 %0
  %second.i.i.i.i240 = getelementptr inbounds %"struct.std::pair.31", ptr %incdec.ptr.i360692, i64 %0, i32 1
  %3 = load i32, ptr %second.i.i.i.i240, align 8, !tbaa !65
  ret i32 %3
}

define <4 x i32> @"189"(ptr %0, ptr %call148, i64 %tail_index.0607, ptr %arrayidx.i498, ptr %arrayidx.i496, ptr %arrayidx.i497, i64 %1, i64 %index740, i64 %2) {
bb:
  %.pre659 = load i32, ptr %arrayidx.i497, align 4, !tbaa !10
  %.pre670 = sext i32 %.pre659 to i64
  %3 = load i32, ptr %arrayidx.i497, align 4, !tbaa !10
  %conv172 = sext i32 %3 to i64
  %4 = load i64, ptr %arrayidx.i496, align 8, !tbaa !0
  %add173 = add nsw i64 %4, %conv172
  %5 = load i64, ptr %arrayidx.i498, align 8, !tbaa !0
  %6 = sub i64 %5, %add173
  %n.vec733 = and i64 %6, %1
  %ind.end736 = sub i64 %tail_index.0607, %n.vec733
  %sub197 = sub nsw i64 %ind.end736, %.pre670
  %offset.idx741 = sub i64 %sub197, %index740
  %7 = getelementptr inbounds i32, ptr %call148, i64 %offset.idx741
  %8 = getelementptr inbounds i32, ptr %7, i64 %2
  %wide.load743 = load <4 x i32>, ptr %0, align 4, !tbaa !10
  store <4 x i32> %wide.load743, ptr %8, align 4, !tbaa !10
  ret <4 x i32> %wide.load743
}

define ptr @"190"(ptr %el, i64 %0, i64 %sub.ptr.rhs.cast, i64 %1, ptr %end_size_.i) {
bb:
  %2 = load ptr, ptr %el, align 8, !tbaa !43
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !45
  ret ptr %add.ptr.i
}

define i64 @"191"(ptr %second10, i64 %0) {
bb:
  %1 = load ptr, ptr %second10, align 8, !tbaa !12
  %incdec.ptr.i228488 = getelementptr i64, ptr %1, i64 %0
  %incdec.ptr.i297457 = getelementptr i64, ptr %incdec.ptr.i228488, i64 %0
  %2 = load i64, ptr %incdec.ptr.i297457, align 8, !tbaa !0
  ret i64 %2
}

define i32 @"192"(i32 %0, ptr %cond.i65.i, i64 %sub.ptr.div.i.i200, ptr %retval.i, i64 %sub.ptr.rhs.cast.i, i64 %1, ptr %add.ptr.i202, ptr %intersection.sroa.14.2307) {
bb:
  %.pre.i = load ptr, ptr %retval.i, align 8
  %sub.ptr.lhs.cast.i = ptrtoint ptr %.pre.i to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %1
  %cmp4.i = icmp ugt i64 %sub.ptr.div.i.i200, %sub.ptr.div.i
  %spec.select = select i1 %cmp4.i, ptr %add.ptr.i202, ptr %intersection.sroa.14.2307
  %sub.ptr.lhs.cast.i.i197 = ptrtoint ptr %spec.select to i64
  %sub.ptr.sub.i.i199 = sub i64 %sub.ptr.lhs.cast.i.i197, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i.i234 = lshr exact i64 %sub.ptr.sub.i.i199, %1
  %add.ptr.i248 = getelementptr inbounds i32, ptr %cond.i65.i, i64 %sub.ptr.div.i.i234
  store i32 %0, ptr %add.ptr.i248, align 4, !tbaa !10
  ret i32 %0
}

define i8 @"193"(ptr %label) {
bb:
  %0 = load ptr, ptr %label, align 8, !tbaa !37, !noalias !115
  %1 = load i8, ptr %0, align 1, !tbaa !24
  ret i8 %1
}

define i32 @"194"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i32, ptr %init_val, align 4, !tbaa !10
  %3 = load ptr, ptr %this, align 8, !tbaa !9
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %5 = sub i64 %0, %4
  %n.vec = and i64 %5, %1
  %ind.end = add i64 %4, %n.vec
  %add.ptr = getelementptr inbounds i32, ptr %3, i64 %ind.end
  store i32 %2, ptr %add.ptr, align 4, !tbaa !10
  ret i32 %2
}

define i32 @"195"(ptr %arrayidx.i, i64 %0, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %arrayidx.i, align 8, !tbaa !63
  %incdec.ptr.i249608 = getelementptr inbounds %"struct.std::pair.31", ptr %3, i64 %0
  %incdec.ptr.i323680 = getelementptr inbounds %"struct.std::pair.31", ptr %incdec.ptr.i249608, i64 %0
  %second.i321 = getelementptr inbounds %"struct.std::pair.31", ptr %incdec.ptr.i323680, i64 %1, i32 1
  %4 = load i32, ptr %second.i321, align 8, !tbaa !65
  ret i32 %4
}

define ptr @"196"(ptr %__args, ptr %cond.i31, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0) {
bb:
  %1 = load ptr, ptr %this, align 8, !tbaa !23
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %1 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %add.ptr = getelementptr inbounds %"class.std::__cxx11::basic_string", ptr %cond.i31, i64 %sub.ptr.div.i
  %2 = load ptr, ptr %__args, align 8, !tbaa !37
  store ptr %2, ptr %add.ptr, align 8, !tbaa !37
  ret ptr %2
}

define ptr @"197"(ptr %arrayidx.i) {
bb:
  %0 = load ptr, ptr %arrayidx.i, align 8, !tbaa !42
  store ptr %0, ptr %arrayidx.i, align 8, !tbaa !42
  ret ptr %0
}

define i32 @"198"(ptr %_M_source15.i147, ptr %_M_losers.i.i, ptr %_M_k.i.i, i32 %0, i32 %1) {
bb:
  %2 = load i32, ptr %_M_source15.i147, align 4, !tbaa !10
  %3 = load i32, ptr %_M_k.i.i, align 4, !tbaa !62
  %add.i120 = add i32 %3, %0
  %__pos.050.i = lshr i32 %add.i120, %1
  %idxprom.i123 = zext i32 %__pos.050.i to i64
  %.pre189 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !53
  %_M_source15.i = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<long, std::less<long>>::_Loser", ptr %.pre189, i64 %idxprom.i123, i32 1
  store i32 %2, ptr %_M_source15.i, align 4, !tbaa !10
  ret i32 %2
}

define i64 @"199"(ptr %arrayidx.i735, ptr %arrayidx152, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx152, align 8, !tbaa !0
  %sub159 = add nsw i64 %1, %0
  %2 = load ptr, ptr %arrayidx.i735, align 8, !tbaa !63
  %arrayidx160 = getelementptr inbounds %"struct.std::pair.31", ptr %2, i64 %sub159
  %ref.tmp199.sroa.0.0.copyload = load i64, ptr %arrayidx160, align 8
  ret i64 %ref.tmp199.sroa.0.0.copyload
}

define i8 @"200"(i8 %0, ptr %_M_losers.i.i, ptr %_M_k.i.i, ptr %_M_source.i112, i32 %1) {
bb:
  %.pre191 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !74
  %2 = load i32, ptr %_M_source.i112, align 4, !tbaa !77
  %3 = load i32, ptr %_M_k.i.i, align 4, !tbaa !79
  %add.i119 = add i32 %3, %2
  %__pos.050.i136 = lshr i32 %add.i119, %1
  %idxprom.i138 = zext i32 %__pos.050.i136 to i64
  %arrayidx3.i139 = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<int, std::less<int>>::_Loser", ptr %.pre191, i64 %idxprom.i138
  store i8 %0, ptr %arrayidx3.i139, align 1, !tbaa !19
  ret i8 %0
}

define i32 @"201"(ptr %__seqs_begin.coerce, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %__seqs_begin.coerce, align 8, !tbaa !63
  %incdec.ptr.i360692 = getelementptr inbounds %"struct.std::pair.31", ptr %2, i64 %0
  %second.i.i.i.i240 = getelementptr inbounds %"struct.std::pair.31", ptr %incdec.ptr.i360692, i64 %0, i32 1
  %3 = load i32, ptr %second.i.i.i.i240, align 8, !tbaa !65
  ret i32 %3
}

define i64 @"202"(ptr %incdec.ptr126.i.i, ptr %el, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !43
  %incdec.ptr5.i.i = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %0
  %2 = load i64, ptr %incdec.ptr126.i.i, align 4
  store i64 %2, ptr %incdec.ptr5.i.i, align 4
  ret i64 %2
}

define i64 @"203"(ptr %arrayidx.i452.prol, ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !90
  %3 = and i64 %2, %0
  %arrayidx.i453.prol = getelementptr inbounds i64, ptr %1, i64 %3
  %4 = load i64, ptr %arrayidx.i452.prol, align 8, !tbaa !0
  store i64 %4, ptr %arrayidx.i453.prol, align 8, !tbaa !0
  ret i64 %4
}

define i64 @"204"(ptr %arrayidx.i452, ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !90
  %2 = and i64 %1, %0
  %3 = load ptr, ptr %offsets, align 8
  %arrayidx.i453 = getelementptr inbounds i64, ptr %3, i64 %2
  %4 = load i64, ptr %arrayidx.i452, align 8, !tbaa !0
  store i64 %4, ptr %arrayidx.i453, align 8, !tbaa !0
  ret i64 %4
}

define ptr @"205"(ptr %new_range.i.i417, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1, ptr %el, ptr %end_capacity_.i.i.i) {
bb:
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre653 = load ptr, ptr %el, align 8, !tbaa !43
  %.pre669 = ptrtoint ptr %.pre653 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre669
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %.pre.i.i436 = load ptr, ptr %new_range.i.i417, align 8, !tbaa !23
  %add.ptr6.i.i438 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i436, i64 %sub.ptr.div14
  store ptr %add.ptr6.i.i438, ptr %end_capacity_.i.i.i, align 8, !tbaa !82
  ret ptr %add.ptr6.i.i438
}

define i64 @"206"(i64 %lsum.035, ptr %arrayidx.i31, ptr %local_sums, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %arrayidx.i31, align 4, !tbaa !10
  %conv = sext i32 %0 to i64
  %add16 = add nsw i64 %lsum.035, %conv
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %2 = load ptr, ptr %local_sums, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i64, ptr %2, i64 %1
  store i64 %add16, ptr %arrayidx.i, align 8, !tbaa !0
  ret i64 %add16
}

define i32 @"207"(ptr %call148, ptr %arrayidx.i498, ptr %arrayidx.i496, ptr %arrayidx.i497, i64 %0, i64 %1, i64 %total_missing_inv.1606) {
bb:
  %2 = load i32, ptr %arrayidx.i497, align 4, !tbaa !10
  %conv172 = sext i32 %2 to i64
  %3 = load i64, ptr %arrayidx.i496, align 8, !tbaa !0
  %add173 = add nsw i64 %3, %conv172
  %4 = load i64, ptr %arrayidx.i498, align 8, !tbaa !0
  %5 = sub i64 %4, %add173
  %n.vec733 = and i64 %5, %0
  %ind.end734 = sub i64 %4, %n.vec733
  %i174.0 = add nsw i64 %ind.end734, %1
  %.pre659 = load i32, ptr %arrayidx.i497, align 4, !tbaa !10
  %.pre670 = sext i32 %.pre659 to i64
  %sub193 = sub nsw i64 %total_missing_inv.1606, %.pre670
  %sub183 = sub nsw i64 %i174.0, %sub193
  %arrayidx184 = getelementptr inbounds i32, ptr %call148, i64 %sub183
  %6 = load i32, ptr %arrayidx184, align 4, !tbaa !10
  ret i32 %6
}

define <2 x i64> @"208"(ptr %0, <4 x ptr> %1, <2 x i64> %2, ptr %3) {
bb:
  %wide.vec1391 = load <4 x ptr>, ptr %0, align 8, !tbaa !23
  %strided.vec1395 = shufflevector <4 x ptr> %wide.vec1391, <4 x ptr> %1, <2 x i32> <i32 1, i32 3>
  %4 = ptrtoint <2 x ptr> %strided.vec1395 to <2 x i64>
  %strided.vec1393 = shufflevector <4 x ptr> %wide.vec1391, <4 x ptr> %1, <2 x i32> <i32 0, i32 2>
  %5 = ptrtoint <2 x ptr> %strided.vec1393 to <2 x i64>
  %6 = sub <2 x i64> %4, %5
  %7 = ashr exact <2 x i64> %6, %2
  store <2 x i64> %7, ptr %3, align 8, !tbaa !0
  ret <2 x i64> %7
}

define i64 @"209"(ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, i64 %2, ptr %num_blocks) {
bb:
  %3 = load ptr, ptr %degrees, align 8, !tbaa !9
  %sub.ptr.rhs.cast.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %end_size_.i, align 8, !tbaa !7
  %sub.ptr.lhs.cast.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %sub = add nsw i64 %sub.ptr.div.i, %1
  %div32 = lshr i64 %sub, %2
  store i64 %div32, ptr %num_blocks, align 8, !tbaa !0
  ret i64 %div32
}

define i64 @"210"(ptr %arrayidx, ptr %new_range, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %1 = load ptr, ptr %new_range, align 8, !tbaa !23
  %arrayidx7 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %0
  %2 = load i64, ptr %arrayidx, align 4
  store i64 %2, ptr %arrayidx7, align 4
  ret i64 %2
}

define i64 @"211"(ptr %arrayidx.i, i64 %0) {
bb:
  %1 = load ptr, ptr %arrayidx.i, align 8, !tbaa !42
  %incdec.ptr.i251521 = getelementptr inbounds i64, ptr %1, i64 %0
  %2 = load i64, ptr %incdec.ptr.i251521, align 8, !tbaa !0
  ret i64 %2
}

define ptr @"212"(ptr %el, ptr %0, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %.pre653 = load ptr, ptr %el, align 8, !tbaa !43
  %3 = load ptr, ptr %el, align 8, !tbaa !43
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre669 = ptrtoint ptr %.pre653 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre669
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %add.ptr.i424 = getelementptr inbounds %struct.EdgePair, ptr %.pre653, i64 %sub.ptr.div14
  store ptr %add.ptr.i424, ptr %end_size_.i, align 8, !tbaa !45
  ret ptr %add.ptr.i424
}

define i32 @"213"(ptr %num_nodes_.i, ptr %mod_.i.i) {
bb:
  %0 = load i64, ptr %num_nodes_.i, align 8, !tbaa !109
  %1 = trunc i64 %0 to i32
  store i32 %1, ptr %mod_.i.i, align 4, !tbaa !118
  ret i32 %1
}

define <2 x i64> @"214"(ptr %arrayidx.i138, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %arrayidx.i138, align 8, !tbaa !42
  %incdec.ptr.i228488 = getelementptr i64, ptr %3, i64 %0
  %next.gep = getelementptr i8, ptr %incdec.ptr.i228488, i64 %1
  %4 = getelementptr i64, ptr %next.gep, i64 %2
  %wide.load750 = load <2 x i64>, ptr %4, align 8, !tbaa !0
  ret <2 x i64> %wide.load750
}

define i64 @"215"(ptr %num_edges_, i64 %0, i64 %1, i64 %2, ptr %.omp.ub) {
bb:
  %3 = load i64, ptr %num_edges_, align 8, !tbaa !119
  %sub3 = add nuw i64 %3, %0
  %div35 = lshr i64 %sub3, %1
  %sub4 = add nsw i64 %div35, %2
  store i64 %sub4, ptr %.omp.ub, align 8, !tbaa !0
  ret i64 %sub4
}

define i64 @"216"(ptr %0, i64 %1, ptr %_M_losers.i.i, i64 %2, i32 %3) {
bb:
  %4 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !59
  %_M_key31.i178 = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<EdgePair<int>, std::less<EdgePair<int>>>::_Loser", ptr %4, i64 %2, i32 2
  %agg.tmp49.sroa.0.0.copyload = load i64, ptr %0, align 4, !tbaa.struct !72
  %__key.sroa.5.0.extract.shift.i133 = lshr i64 %agg.tmp49.sroa.0.0.copyload, %1
  %__key.sroa.5.0.extract.trunc.i134 = trunc i64 %__key.sroa.5.0.extract.shift.i133 to i32
  %__key.sroa.5.0.insert.ext.i179 = zext i32 %__key.sroa.5.0.extract.trunc.i134 to i64
  %__key.sroa.5.0.insert.shift.i180 = shl nuw i64 %__key.sroa.5.0.insert.ext.i179, %1
  %__key.sroa.0.0.extract.trunc.i132 = trunc i64 %agg.tmp49.sroa.0.0.copyload to i32
  %__key.sroa.0.0.insert.ext.i181 = zext i32 %__key.sroa.0.0.extract.trunc.i132 to i64
  %__key.sroa.0.0.insert.insert.i182 = or i64 %__key.sroa.5.0.insert.shift.i180, %__key.sroa.0.0.insert.ext.i181
  store i64 %__key.sroa.0.0.insert.insert.i182, ptr %_M_key31.i178, align 4
  ret i64 %__key.sroa.0.0.insert.insert.i182
}

define i32 @"217"(ptr %arrayidx.i.i.i60, ptr %n_start.0.in, i64 %0, ptr %diffs, ptr %.omp.lb) {
bb:
  %1 = load ptr, ptr %diffs, align 8, !tbaa !9
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %3 = sext i32 %2 to i64
  %arrayidx.i94 = getelementptr inbounds i32, ptr %1, i64 %3
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !23
  %sub.ptr.rhs.cast.i.i.i.i = ptrtoint ptr %n_start.0 to i64
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !23
  %sub.ptr.lhs.cast = ptrtoint ptr %n_end.0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast.i.i.i.i
  %4 = lshr exact i64 %sub.ptr.sub, %0
  %conv22 = trunc i64 %4 to i32
  store i32 %conv22, ptr %arrayidx.i94, align 4, !tbaa !10
  ret i32 %conv22
}

define i32 @"218"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %2 = load ptr, ptr %el, align 8, !tbaa !43
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %1
  %add.ptr.sroa_idx = getelementptr inbounds i8, ptr %add.ptr, i64 %0
  %3 = load i32, ptr %add.ptr.sroa_idx, align 4
  ret i32 %3
}

define i64 @"219"(ptr %arrayidx.i84, ptr %_M_losers.i.i) {
bb:
  %0 = load i64, ptr %arrayidx.i84, align 8
  %1 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !121
  store i64 %0, ptr %1, align 8
  ret i64 %0
}

define i64 @"220"(ptr %__first.addr.012.i.i.i, ptr %arrayidx20, ptr %arrayidx, i64 %0, i64 %1, ptr %arrayidx4, i64 %2, i64 %3) {
bb:
  %4 = load i64, ptr %arrayidx, align 8, !tbaa !0
  %5 = shl i64 %4, %0
  %6 = add i64 %5, %1
  %7 = load i64, ptr %arrayidx4, align 8, !tbaa !0
  %8 = shl i64 %7, %0
  %9 = sub i64 %6, %8
  %10 = lshr exact i64 %9, %0
  %11 = add nuw nsw i64 %10, %2
  %n.vec = and i64 %11, %3
  %12 = shl i64 %n.vec, %0
  %13 = load ptr, ptr %arrayidx20, align 8, !tbaa !23
  %ind.end = getelementptr i8, ptr %13, i64 %12
  %14 = load i64, ptr %__first.addr.012.i.i.i, align 4
  store i64 %14, ptr %ind.end, align 4
  ret i64 %14
}

define i32 @"221"(ptr %__a.addr.029.i188, ptr %__result, ptr %arrayidx107, ptr %arrayidx107.1, ptr %arrayidx107.2, ptr %arrayidx107.3, ptr %arrayidx107.4, ptr %arrayidx107.5, ptr %arrayidx107.6, ptr %arrayidx107.7) {
bb:
  %0 = load i64, ptr %arrayidx107.5, align 8, !tbaa !0
  %1 = load i64, ptr %arrayidx107.4, align 8, !tbaa !0
  %2 = load i64, ptr %arrayidx107.1, align 8, !tbaa !0
  %3 = load i64, ptr %arrayidx107, align 8, !tbaa !0
  %4 = load i64, ptr %__result, align 8, !tbaa !23
  %5 = inttoptr i64 %4 to ptr
  %add.ptr.i209 = getelementptr inbounds i32, ptr %5, i64 %3
  %add.ptr.i209.1 = getelementptr inbounds i32, ptr %add.ptr.i209, i64 %2
  %6 = load i64, ptr %arrayidx107.2, align 8, !tbaa !0
  %add.ptr.i209.2 = getelementptr inbounds i32, ptr %add.ptr.i209.1, i64 %6
  %7 = load i64, ptr %arrayidx107.3, align 8, !tbaa !0
  %add.ptr.i209.3 = getelementptr inbounds i32, ptr %add.ptr.i209.2, i64 %7
  %add.ptr.i209.4 = getelementptr inbounds i32, ptr %add.ptr.i209.3, i64 %1
  %add.ptr.i209.5 = getelementptr inbounds i32, ptr %add.ptr.i209.4, i64 %0
  %8 = load i64, ptr %arrayidx107.6, align 8, !tbaa !0
  %add.ptr.i209.6 = getelementptr inbounds i32, ptr %add.ptr.i209.5, i64 %8
  %9 = load i64, ptr %arrayidx107.7, align 8, !tbaa !0
  %add.ptr.i209.7 = getelementptr inbounds i32, ptr %add.ptr.i209.6, i64 %9
  %10 = load i32, ptr %__a.addr.029.i188, align 4, !tbaa !10
  store i32 %10, ptr %add.ptr.i209.7, align 4, !tbaa !10
  ret i32 %10
}

define i64 @"223"(i64 %add29, ptr %__n, ptr %__num_threads, i64 %conv9, i64 %indvars.iv.next55, i64 %div, i64 %add28, ptr %arrayidx25.1) {
bb:
  %.pre = load i16, ptr %__num_threads, align 2, !tbaa !83
  %conv92 = zext i16 %.pre to i64
  %0 = load i64, ptr %__n, align 8, !tbaa !0
  %div4 = sdiv i64 %0, %conv9
  %cond.1 = add i64 %add29, %div
  %rem = srem i64 %0, %conv9
  %cmp27.1 = icmp sgt i64 %rem, %indvars.iv.next55
  %add28.1 = zext i1 %cmp27.1 to i64
  %add29.1 = add i64 %cond.1, %add28.1
  %cond = add i64 %add29.1, %div
  %add296 = add i64 %cond, %add28
  store i64 %add29, ptr %arrayidx25.1, align 8, !tbaa !0
  ret i64 %add29
}

define ptr @"224"(ptr %__seqs_begin.coerce, i64 %0) {
bb:
  %.pre63.i.i = load ptr, ptr %__seqs_begin.coerce, align 8, !tbaa !23
  %add.ptr.i.i = getelementptr inbounds i64, ptr %.pre63.i.i, i64 %0
  store ptr %add.ptr.i.i, ptr %__seqs_begin.coerce, align 8, !tbaa !23
  ret ptr %add.ptr.i.i
}

define <2 x i64> @"225"(ptr %second10, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %second10, align 8, !tbaa !12
  %incdec.ptr.i228488 = getelementptr i64, ptr %3, i64 %0
  %next.gep = getelementptr i8, ptr %incdec.ptr.i228488, i64 %1
  %4 = getelementptr i64, ptr %next.gep, i64 %2
  %wide.load750 = load <2 x i64>, ptr %4, align 8, !tbaa !0
  ret <2 x i64> %wide.load750
}

define i64 @"226"(ptr %arrayidx.i138, i64 %0) {
bb:
  %1 = load ptr, ptr %arrayidx.i138, align 8, !tbaa !42
  %incdec.ptr.i297457 = getelementptr i64, ptr %1, i64 %0
  %incdec.ptr.i228488 = getelementptr i64, ptr %incdec.ptr.i297457, i64 %0
  %incdec.ptr.i228.us = getelementptr inbounds i64, ptr %incdec.ptr.i228488, i64 %0
  %2 = load i64, ptr %incdec.ptr.i228.us, align 8, !tbaa !0
  ret i64 %2
}

define ptr @"227"(ptr %second6, i64 %0, ptr %arrayidx.i) {
bb:
  %1 = load ptr, ptr %second6, align 8, !tbaa !12
  %incdec.ptr.i205471 = getelementptr inbounds i64, ptr %1, i64 %0
  %incdec.ptr.i251521 = getelementptr inbounds i64, ptr %incdec.ptr.i205471, i64 %0
  store ptr %incdec.ptr.i251521, ptr %arrayidx.i, align 8, !tbaa !42
  ret ptr %incdec.ptr.i251521
}

define i64 @"228"(ptr %offsets, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !4
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %3 = sext i32 %2 to i64
  %indvars.iv.next = add nsw i64 %3, %0
  %arrayidx.i.1 = getelementptr inbounds i64, ptr %1, i64 %indvars.iv.next
  %4 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !0
  ret i64 %4
}

define ptr @"229"(ptr %arrayidx.i138) {
bb:
  %0 = load ptr, ptr %arrayidx.i138, align 8, !tbaa !42
  store ptr %0, ptr %arrayidx.i138, align 8, !tbaa !42
  ret ptr %0
}

define ptr @"230"(ptr %arrayidx.i113, i64 %0, ptr %__seqs_begin.coerce, ptr %_M_source.i112) {
bb:
  %1 = load ptr, ptr %arrayidx.i113, align 8, !tbaa !84
  %incdec.ptr = getelementptr inbounds i32, ptr %1, i64 %0
  %2 = load i32, ptr %_M_source.i112, align 4, !tbaa !77
  %conv36 = sext i32 %2 to i64
  %arrayidx.i1132 = getelementptr inbounds %"struct.std::pair.94", ptr %__seqs_begin.coerce, i64 %conv36
  store ptr %incdec.ptr, ptr %arrayidx.i113, align 8, !tbaa !84
  ret ptr %incdec.ptr
}

define i64 @"231"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %2) {
bb:
  %3 = load i32, ptr %v, align 4, !tbaa !70
  %sub = add nsw i32 %3, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  %4 = load ptr, ptr %new_range.i.i, align 8, !tbaa !23
  %5 = load ptr, ptr %agg.result, align 8, !tbaa !43
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %5 to i64
  %6 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %6 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = ashr exact i64 %sub.ptr.sub.i12.i.i, %2
  %add.ptr.i.i149 = getelementptr inbounds %struct.EdgePair, ptr %4, i64 %sub.ptr.div.i13.i.i
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %add.ptr.i.i149, align 4, !tbaa.struct !72
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i64 @"232"(ptr %__first.addr.033.i.i, ptr %el, i64 %0) {
bb:
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.033.i.i, align 4
  %1 = load ptr, ptr %el, align 8, !tbaa !43
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %0
  store i64 %agg.tmp.sroa.0.0.copyload.i.i.i, ptr %incdec.ptr13.i.i.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i32 @"233"(ptr %call148, ptr %0, ptr %arrayidx.i502) {
bb:
  %1 = load i32, ptr %arrayidx.i502, align 4, !tbaa !10
  %conv213 = sext i32 %1 to i64
  %.pre660 = load i64, ptr %0, align 8, !tbaa !0
  %add214 = add nsw i64 %.pre660, %conv213
  %arrayidx223 = getelementptr inbounds i32, ptr %call148, i64 %add214
  %2 = load i32, ptr %arrayidx223, align 4, !tbaa !10
  ret i32 %2
}

define i32 @"234"(i32 %conv18, ptr %_M_losers.i.i, ptr %_M_k.i.i, i32 %0) {
bb:
  %1 = load i32, ptr %_M_k.i.i, align 4, !tbaa !95
  %add.i = add i32 %1, %conv18
  %idxprom5.i = zext i32 %add.i to i64
  %2 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !59
  %_M_source.i = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<EdgePair<int>, std::less<EdgePair<int>>>::_Loser", ptr %2, i64 %idxprom5.i, i32 1
  store i32 %conv18, ptr %_M_source.i, align 4, !tbaa !93
  ret i32 %conv18
}

define ptr @"235"(ptr %el, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1) {
bb:
  %.pre653 = load ptr, ptr %el, align 8, !tbaa !43
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre669 = ptrtoint ptr %.pre653 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre669
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr.i424 = getelementptr inbounds %struct.EdgePair, ptr %.pre653, i64 %sub.ptr.div14
  store ptr %add.ptr.i424, ptr %end_size_.i, align 8, !tbaa !45
  ret ptr %add.ptr.i424
}

define ptr @"236"(ptr %__seqs_begin.coerce, ptr %_M_source.i113) {
bb:
  %.pre = load i32, ptr %_M_source.i113, align 4, !tbaa !56
  %conv36 = sext i32 %.pre to i64
  %arrayidx.i114 = getelementptr inbounds %"struct.std::pair", ptr %__seqs_begin.coerce, i64 %conv36
  %0 = load ptr, ptr %arrayidx.i114, align 8, !tbaa !42
  ret ptr %0
}

define i32 @"237"(ptr %arrayidx.i7.i.i.phi.trans.insert) {
bb:
  %.pre = load ptr, ptr %arrayidx.i7.i.i.phi.trans.insert, align 8, !tbaa !23
  %0 = load i32, ptr %.pre, align 4, !tbaa !10, !llvm.access.group !124
  ret i32 %0
}

define ptr @"238"(ptr %__seqs_begin.coerce, ptr %_M_source.i112) {
bb:
  %0 = load i32, ptr %_M_source.i112, align 4, !tbaa !77
  %conv36 = sext i32 %0 to i64
  %arrayidx.i113 = getelementptr inbounds %"struct.std::pair.94", ptr %__seqs_begin.coerce, i64 %conv36
  %1 = load ptr, ptr %arrayidx.i113, align 8, !tbaa !84
  ret ptr %1
}

define i32 @"239"(ptr %second5.i.i.i.i.i.i.i, ptr %this, ptr %_M_finish.i.i, i64 %0, i64 %sub.ptr.rhs.cast.i.i, i64 %1, i64 %2, i64 %3, i32 %4) {
bb:
  %5 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !46
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.65", ptr %5, i64 %0
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i = sdiv exact i64 %sub.ptr.sub.i.i, %1
  %sub.i = add nsw i64 %sub.ptr.div.i.i, %2
  %.pre = load ptr, ptr %this, align 8, !tbaa !23
  %add.ptr.i26.i.i = getelementptr inbounds %"struct.std::pair.65", ptr %.pre, i64 %sub.i
  %second3.i.i.i.i = getelementptr inbounds %"struct.std::pair.31", ptr %add.ptr.i26.i.i, i64 %3, i32 1
  %6 = load i32, ptr %second5.i.i.i.i.i.i.i, align 8, !tbaa !10
  store i32 %6, ptr %second3.i.i.i.i, align 8, !tbaa !65
  ret i32 %6
}

define i32 @"240"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %5 = load ptr, ptr %el, align 8, !tbaa !43
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %5, i64 %ind.end
  %add.ptr.sroa_idx = getelementptr inbounds i8, ptr %add.ptr, i64 %2
  %6 = load i32, ptr %add.ptr.sroa_idx, align 4
  ret i32 %6
}

define i32 @"241"(ptr %second6, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %second6, align 8, !tbaa !125
  %v.i.i.i311 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %0, i32 1
  %3 = load i32, ptr %v.i.i.i311, align 4
  ret i32 %3
}

define <2 x i64> @"242"(ptr %0, <2 x i64> %1, <2 x i64> %vector.recur90, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %7) {
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

define i64 @"243"(i64 %__pos.049, ptr %__n, ptr %__num_threads, i64 %conv9, i64 %indvars.iv54, i64 %div, i64 %add28.1, ptr %arrayidx34) {
bb:
  %0 = load i64, ptr %__n, align 8, !tbaa !0
  %rem = srem i64 %0, %conv9
  %cmp27 = icmp sgt i64 %rem, %indvars.iv54
  %add28 = zext i1 %cmp27 to i64
  %.pre = load i16, ptr %__num_threads, align 2, !tbaa !83
  %conv92 = zext i16 %.pre to i64
  %div4 = sdiv i64 %0, %conv9
  %cond = add i64 %__pos.049, %div
  %add29 = add i64 %cond, %add28
  %cond.1 = add i64 %add29, %div
  %add29.1 = add i64 %cond.1, %add28.1
  store i64 %add29.1, ptr %arrayidx34, align 8, !tbaa !0
  ret i64 %add29.1
}

define i32 @"244"(ptr %arrayidx.i738, ptr %arrayidx186, ptr %arrayidx185, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %arrayidx.i738, align 8, !tbaa !63
  %3 = load i64, ptr %arrayidx185, align 8, !tbaa !0
  %4 = load i64, ptr %arrayidx186, align 8, !tbaa !0
  %add187 = add nsw i64 %4, %3
  %div188 = sdiv i64 %add187, %0
  %arrayidx196 = getelementptr inbounds %"struct.std::pair.31", ptr %2, i64 %div188
  %ref.tmp193.sroa.6.0.arrayidx196.sroa_idx = getelementptr inbounds i8, ptr %arrayidx196, i64 %1
  %ref.tmp193.sroa.6.0.copyload = load i32, ptr %ref.tmp193.sroa.6.0.arrayidx196.sroa_idx, align 8
  ret i32 %ref.tmp193.sroa.6.0.copyload
}

define i64 @"246"(ptr %arrayidx.i207, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i210, i64 %4, i64 %5, i64 %xor4.i213, i64 %6, i64 %xor7.i216, ptr %num_nodes_, i64 %7, ptr %arrayidx.i64, i64 %xor.i66, i64 %xor4.i, i64 %xor7.i, i32 %8, ptr %el, ptr %.omp.lb) {
bb:
  %9 = load ptr, ptr %el, align 8, !tbaa !43
  %10 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul = shl i64 %10, %6
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %9, i64 %mul
  %11 = load i64, ptr %arrayidx.i207, align 8, !tbaa !0
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
  %12 = load i64, ptr %num_nodes_, align 8, !tbaa !126
  %13 = trunc i64 %12 to i32
  %rem.i51 = urem i32 %conv.i41, %8
  %ref.tmp15.sroa.4.0.insert.ext = zext i32 %rem.i51 to i64
  %ref.tmp15.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp15.sroa.4.0.insert.ext, %7
  %14 = load i64, ptr %arrayidx.i64, align 8, !tbaa !0
  %shr.i65 = lshr i64 %14, %0
  %and.i = and i64 %shr.i65, %1
  %xor.i668 = xor i64 %and.i, %14
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
  store i64 %ref.tmp15.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp15.sroa.0.0.insert.insert
}

define i8 @"247"(i8 %0, ptr %_M_losers.i.i, ptr %_M_k.i.i, ptr %_M_source.i113, i32 %1) {
bb:
  %.pre189 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !53
  %2 = load i32, ptr %_M_k.i.i, align 4, !tbaa !62
  %.pre = load i32, ptr %_M_source.i113, align 4, !tbaa !56
  %add.i120 = add i32 %2, %.pre
  %__pos.050.i137 = lshr i32 %add.i120, %1
  %idxprom.i139 = zext i32 %__pos.050.i137 to i64
  %arrayidx3.i140 = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<long, std::less<long>>::_Loser", ptr %.pre189, i64 %idxprom.i139
  store i8 %0, ptr %arrayidx3.i140, align 1, !tbaa !19
  ret i8 %0
}

define i32 @"248"(ptr %.omp.lb, ptr %new_ids, ptr %second) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %1 = sext i32 %0 to i64
  %2 = trunc i64 %1 to i32
  %3 = load i32, ptr %second, align 8, !tbaa !65
  %conv16 = sext i32 %3 to i64
  %4 = load ptr, ptr %new_ids, align 8, !tbaa !9
  %arrayidx.i31 = getelementptr inbounds i32, ptr %4, i64 %conv16
  store i32 %2, ptr %arrayidx.i31, align 4, !tbaa !10
  ret i32 %2
}

define i64 @"249"(ptr %offsets, ptr %num_nodes_.i, i32 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8, !tbaa !4
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !90
  %3 = trunc i64 %2 to i32
  %n160.0604 = add i32 %3, %0
  %4 = zext i32 %n160.0604 to i64
  %arrayidx.i496 = getelementptr inbounds i64, ptr %1, i64 %4
  %5 = load i64, ptr %arrayidx.i496, align 8, !tbaa !0
  ret i64 %5
}

define i64 @"250"(ptr %_M_string_length.i.i.i, i64 %call, ptr %__dnew.i.i.i) {
bb:
  %0 = load i64, ptr %_M_string_length.i.i.i, align 8, !tbaa !67, !noalias !127
  %sub.i.i.i = sub i64 %0, %call
  store i64 %sub.i.i.i, ptr %__dnew.i.i.i, align 8, !tbaa !0, !noalias !127
  ret i64 %sub.i.i.i
}

define ptr @"251"(ptr %__seqs_begin.coerce, i64 %0) {
bb:
  %1 = load ptr, ptr %__seqs_begin.coerce, align 8, !tbaa !42
  %incdec.ptr.i504 = getelementptr inbounds i64, ptr %1, i64 %0
  %incdec.ptr.i274530 = getelementptr inbounds i64, ptr %incdec.ptr.i504, i64 %0
  store ptr %incdec.ptr.i274530, ptr %__seqs_begin.coerce, align 8, !tbaa !42
  ret ptr %incdec.ptr.i274530
}

define i64 @"252"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !90
  %sext = shl i64 %1, %0
  %conv176 = ashr exact i64 %sext, %0
  %2 = load ptr, ptr %offsets, align 8, !tbaa !4
  %arrayidx.i498 = getelementptr inbounds i64, ptr %2, i64 %conv176
  %3 = load i64, ptr %arrayidx.i498, align 8, !tbaa !0
  ret i64 %3
}

define i64 @"253"(ptr %__seqs_begin.coerce, i64 %0) {
bb:
  %1 = load ptr, ptr %__seqs_begin.coerce, align 8, !tbaa !42
  %incdec.ptr.i274530 = getelementptr inbounds i64, ptr %1, i64 %0
  %incdec.ptr.i504 = getelementptr inbounds i64, ptr %incdec.ptr.i274530, i64 %0
  %2 = load i64, ptr %incdec.ptr.i504, align 8, !tbaa !0
  ret i64 %2
}

define i32 @"254"(ptr %e.sroa.5.0..sroa_idx, ptr %0, ptr %offsets, ptr %add.ptr, i64 %1) {
bb:
  %e.sroa.0.0.copyload = load i32, ptr %add.ptr, align 4, !tbaa.struct !72
  %conv = sext i32 %e.sroa.0.0.copyload to i64
  %2 = load ptr, ptr %offsets, align 8, !tbaa !4
  %arrayidx.i = getelementptr inbounds i64, ptr %2, i64 %conv
  %3 = atomicrmw add ptr %arrayidx.i, i64 %1 seq_cst, align 8
  %4 = load ptr, ptr %0, align 8, !tbaa !23
  %arrayidx = getelementptr inbounds i32, ptr %4, i64 %3
  %e.sroa.5.0.copyload = load i32, ptr %e.sroa.5.0..sroa_idx, align 4, !tbaa.struct !130
  store i32 %e.sroa.5.0.copyload, ptr %arrayidx, align 4, !tbaa !10
  ret i32 %e.sroa.5.0.copyload
}

define i32 @"255"(ptr %this, ptr %_M_finish.i.i, i64 %0, i64 %sub.ptr.rhs.cast.i.i, i64 %1, i64 %2, i64 %3, i32 %4) {
bb:
  %.pre = load ptr, ptr %this, align 8, !tbaa !23
  %5 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !46
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.65", ptr %5, i64 %0
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i = sdiv exact i64 %sub.ptr.sub.i.i, %1
  %sub.i = add nsw i64 %sub.ptr.div.i.i, %2
  %__parent.044.in.i.i = add nsw i64 %sub.i, %2
  %__parent.044.i1314.i = lshr i64 %__parent.044.in.i.i, %0
  %add.ptr.i.i.i11 = getelementptr inbounds %"struct.std::pair.65", ptr %.pre, i64 %__parent.044.i1314.i
  %second.i.i27.phi.trans.insert.i.i = getelementptr inbounds %"struct.std::pair.31", ptr %add.ptr.i.i.i11, i64 %3, i32 1
  %.pre.i.i = load i32, ptr %second.i.i27.phi.trans.insert.i.i, align 8, !tbaa !10
  ret i32 %.pre.i.i
}

define i32 @"256"(ptr %call148, ptr %arrayidx.i504, ptr %arrayidx.i505, ptr %arrayidx.i506, i64 %sub.ptr.rhs.cast.i.i.i.i508, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i504, align 8, !tbaa !0
  %add.ptr227 = getelementptr inbounds i32, ptr %call148, i64 %2
  %3 = load i32, ptr %arrayidx.i505, align 4, !tbaa !10
  %idx.ext = sext i32 %3 to i64
  %add.ptr230 = getelementptr inbounds i32, ptr %add.ptr227, i64 %idx.ext
  %4 = load i64, ptr %arrayidx.i506, align 8, !tbaa !0
  %add.ptr234 = getelementptr inbounds i32, ptr %call148, i64 %4
  %sub.ptr.lhs.cast.i.i.i.i507 = ptrtoint ptr %add.ptr234 to i64
  %sub.ptr.sub.i.i.i.i509 = sub i64 %sub.ptr.lhs.cast.i.i.i.i507, %sub.ptr.rhs.cast.i.i.i.i508
  %sub.ptr.div.i.i.i.i517 = lshr exact i64 %sub.ptr.sub.i.i.i.i509, %0
  %shr.i.i521 = lshr i64 %sub.ptr.div.i.i.i.i517, %1
  %incdec.ptr4.sink.i.i.i.i525 = getelementptr inbounds i32, ptr %add.ptr230, i64 %shr.i.i521
  %5 = load i32, ptr %incdec.ptr4.sink.i.i.i.i525, align 4, !tbaa !10
  ret i32 %5
}

define i64 @"257"(ptr %arrayidx.i88, ptr %0, i64 %1, ptr %num_edges_.i) {
bb:
  %2 = load ptr, ptr %0, align 8, !tbaa !23
  %sub.ptr.rhs.cast.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %arrayidx.i88, align 8, !tbaa !23
  %sub.ptr.lhs.cast.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %1
  %div.i = sdiv i64 %sub.ptr.div.i, %1
  store i64 %div.i, ptr %num_edges_.i, align 8, !tbaa !131
  ret i64 %div.i
}

define i64 @"258"(ptr %__seqs_begin.coerce, i64 %0) {
bb:
  %1 = load ptr, ptr %__seqs_begin.coerce, align 8, !tbaa !42
  %incdec.ptr.i504 = getelementptr inbounds i64, ptr %1, i64 %0
  %2 = load i64, ptr %incdec.ptr.i504, align 8, !tbaa !0
  ret i64 %2
}

define <2 x i64> @"259"(ptr %arrayidx.i138, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %arrayidx.i138, align 8, !tbaa !42
  %incdec.ptr.i228488 = getelementptr i64, ptr %3, i64 %0
  %next.gep = getelementptr i8, ptr %incdec.ptr.i228488, i64 %1
  %4 = getelementptr i64, ptr %next.gep, i64 %2
  %wide.load750 = load <2 x i64>, ptr %4, align 8, !tbaa !0
  ret <2 x i64> %wide.load750
}

define i64 @"260"(i64 %inc129131, ptr %__begin3.0133, ptr %it.1, ptr %total4) {
bb:
  %0 = load i32, ptr %__begin3.0133, align 4, !tbaa !10, !llvm.access.group !124
  %1 = load i32, ptr %it.1, align 4, !tbaa !10, !llvm.access.group !124
  %cmp32 = icmp eq i32 %0, %1
  %inc = zext i1 %cmp32 to i64
  %spec.select = add i64 %inc129131, %inc
  store i64 %spec.select, ptr %total4, align 8, !tbaa !0
  ret i64 %spec.select
}

define ptr @"261"(ptr %arrayidx.i113, i64 %0, ptr %__seqs_begin.coerce, ptr %_M_source.i112) {
bb:
  %1 = load ptr, ptr %arrayidx.i113, align 8, !tbaa !84
  %incdec.ptr = getelementptr inbounds i32, ptr %1, i64 %0
  %2 = load i32, ptr %_M_source.i112, align 4, !tbaa !77
  %conv36 = sext i32 %2 to i64
  %arrayidx.i1132 = getelementptr inbounds %"struct.std::pair.94", ptr %__seqs_begin.coerce, i64 %conv36
  store ptr %incdec.ptr, ptr %arrayidx.i113, align 8, !tbaa !84
  ret ptr %incdec.ptr
}

define i8 @"263"(ptr %arrayidx3.i, ptr %_M_losers.i.i, ptr %_M_k.i.i, ptr %_M_source15.i, i32 %0) {
bb:
  %1 = load i32, ptr %_M_k.i.i, align 4, !tbaa !62
  %2 = load i32, ptr %_M_source15.i, align 4, !tbaa !10
  %add.i120 = add i32 %1, %2
  %__pos.050.i = lshr i32 %add.i120, %0
  %idxprom.i123 = zext i32 %__pos.050.i to i64
  %.pre189 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !53
  %arrayidx3.i2 = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<long, std::less<long>>::_Loser", ptr %.pre189, i64 %idxprom.i123
  %.pre.i = load i8, ptr %arrayidx3.i, align 1, !tbaa !19, !range !21
  store i8 %.pre.i, ptr %arrayidx3.i, align 1, !tbaa !19
  ret i8 %.pre.i
}

define i64 @"264"(ptr %__first, ptr %add.ptr.i.i.i.i, ptr %add.ptr2.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i) {
bb:
  %0 = load i64, ptr %add.ptr.i.i.i.i, align 8, !tbaa !0
  %1 = load i64, ptr %add.ptr2.i.i.i.i, align 8, !tbaa !0
  %cmp.i.i.i.i.i.i = icmp slt i64 %0, %1
  %spec.select.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i64 %sub1.i.i.i.i, i64 %mul.i.i.i.i
  %add.ptr3.i.i.i.i = getelementptr inbounds i64, ptr %__first, i64 %spec.select.i.i.i.i
  %2 = load i64, ptr %add.ptr3.i.i.i.i, align 8, !tbaa !0
  ret i64 %2
}

define i64 @"265"(ptr %arrayidx.i735, ptr %arrayidx152, i64 %0) {
bb:
  %1 = load i64, ptr %arrayidx152, align 8, !tbaa !0
  %sub159 = add nsw i64 %1, %0
  %2 = load ptr, ptr %arrayidx.i735, align 8, !tbaa !63
  %arrayidx160 = getelementptr inbounds %"struct.std::pair.31", ptr %2, i64 %sub159
  %3 = load i64, ptr %arrayidx160, align 8, !tbaa !40
  ret i64 %3
}

define i8 @"266"(ptr %_M_losers.i.i, ptr %_M_k.i.i, ptr %_M_source15.i, i32 %0) {
bb:
  %1 = load i32, ptr %_M_k.i.i, align 4, !tbaa !62
  %2 = load i32, ptr %_M_source15.i, align 4, !tbaa !10
  %add.i120 = add i32 %1, %2
  %__pos.050.i = lshr i32 %add.i120, %0
  %idxprom.i123 = zext i32 %__pos.050.i to i64
  %.pre189 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !53
  %arrayidx3.i = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<long, std::less<long>>::_Loser", ptr %.pre189, i64 %idxprom.i123
  %.pre.i = load i8, ptr %arrayidx3.i, align 1, !tbaa !19, !range !21
  ret i8 %.pre.i
}

define i64 @"267"(ptr %__arbitrary_element.0.lcssa193, ptr %_M_losers.i.i, ptr %_M_k.i.i, ptr %_M_source.i113, i32 %0, i32 %1) {
bb:
  %2 = load i64, ptr %__arbitrary_element.0.lcssa193, align 8, !tbaa !0
  %.pre189 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !53
  %3 = load i32, ptr %_M_k.i.i, align 4, !tbaa !62
  %.pre = load i32, ptr %_M_source.i113, align 4, !tbaa !56
  %add.i120 = add i32 %3, %.pre
  %__pos.050.i = lshr i32 %add.i120, %0
  %idxprom.i123 = zext i32 %__pos.050.i to i64
  %_M_key19.i = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<long, std::less<long>>::_Loser", ptr %.pre189, i64 %idxprom.i123, i32 2
  store i64 %2, ptr %_M_key19.i, align 8, !tbaa !0
  ret i64 %2
}

define <2 x i64> @"268"(ptr %0, <2 x i64> %1, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %7) {
bb:
  %wide.load = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %8 = shufflevector <2 x i64> %wide.load, <2 x i64> %wide.load, <2 x i32> <i32 1, i32 2>
  %9 = and <2 x i64> %8, %2
  %10 = and <2 x i64> %wide.load, %1
  %11 = or <2 x i64> %10, %9
  %12 = lshr exact <2 x i64> %11, %3
  %wide.load18 = load <2 x i64>, ptr %4, align 8, !tbaa !0
  %13 = xor <2 x i64> %12, %wide.load18
  %14 = and <2 x i64> %wide.load, %3
  %15 = icmp eq <2 x i64> %14, %5
  %16 = select <2 x i1> %15, <2 x i64> %5, <2 x i64> %6
  %17 = xor <2 x i64> %13, %16
  store <2 x i64> %17, ptr %7, align 8, !tbaa !0
  ret <2 x i64> %17
}

define i64 @"270"(ptr %__first.addr.033.i.i, ptr %new_range.i.i, i64 %0) {
bb:
  %agg.tmp.sroa.0.0.copyload.i.i.i = load i64, ptr %__first.addr.033.i.i, align 4
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !23
  %incdec.ptr13.i.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %0
  store i64 %agg.tmp.sroa.0.0.copyload.i.i.i, ptr %incdec.ptr13.i.i.i.i, align 4
  ret i64 %agg.tmp.sroa.0.0.copyload.i.i.i
}

define i64 @"271"(ptr %_M_key19.i, i64 %0, ptr %_M_losers.i.i, ptr %_M_k.i.i, ptr %_M_source.i116, i32 %1, i32 %2) {
bb:
  %3 = load i32, ptr %_M_source.i116, align 4, !tbaa !93
  %4 = load i32, ptr %_M_k.i.i, align 4, !tbaa !95
  %add.i123 = add i32 %4, %3
  %__pos.062.i = lshr i32 %add.i123, %1
  %idxprom.i127 = zext i32 %__pos.062.i to i64
  %.pre.i126 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !59
  %_M_key19.i2 = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<EdgePair<int>, std::less<EdgePair<int>>>::_Loser", ptr %.pre.i126, i64 %idxprom.i127, i32 2
  %5 = load i64, ptr %_M_key19.i, align 4
  %__key.sroa.0.0.extract.trunc48.i = trunc i64 %5 to i32
  %__key.sroa.0.0.insert.ext45.i = zext i32 %__key.sroa.0.0.extract.trunc48.i to i64
  %__key.sroa.5.0.extract.shift54.i = lshr i64 %5, %0
  %__key.sroa.5.0.extract.trunc55.i = trunc i64 %__key.sroa.5.0.extract.shift54.i to i32
  %__key.sroa.5.0.insert.ext50.i = zext i32 %__key.sroa.5.0.extract.trunc55.i to i64
  %__key.sroa.5.0.insert.shift51.i = shl nuw i64 %__key.sroa.5.0.insert.ext50.i, %0
  %__key.sroa.0.0.insert.insert47.i = or i64 %__key.sroa.5.0.insert.shift51.i, %__key.sroa.0.0.insert.ext45.i
  store i64 %__key.sroa.0.0.insert.insert47.i, ptr %_M_key19.i, align 4
  ret i64 %__key.sroa.0.0.insert.insert47.i
}

define i64 @"272"(ptr %0, i64 %1, ptr %_M_key19.i, ptr %_M_losers.i.i, i64 %2, i32 %3) {
bb:
  %4 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !59
  %_M_key31.i178 = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<EdgePair<int>, std::less<EdgePair<int>>>::_Loser", ptr %4, i64 %2, i32 2
  %agg.tmp49.sroa.0.0.copyload = load i64, ptr %0, align 4, !tbaa.struct !72
  %__key.sroa.5.0.extract.shift.i133 = lshr i64 %agg.tmp49.sroa.0.0.copyload, %1
  %__key.sroa.5.0.extract.trunc.i134 = trunc i64 %__key.sroa.5.0.extract.shift.i133 to i32
  %__key.sroa.5.0.insert.ext.i179 = zext i32 %__key.sroa.5.0.extract.trunc.i134 to i64
  %__key.sroa.5.0.insert.shift.i180 = shl nuw i64 %__key.sroa.5.0.insert.ext.i179, %1
  %5 = load i64, ptr %_M_key19.i, align 4
  %__key.sroa.0.0.extract.trunc48.i = trunc i64 %5 to i32
  %__key.sroa.0.0.insert.ext.i181 = zext i32 %__key.sroa.0.0.extract.trunc48.i to i64
  %__key.sroa.0.0.insert.insert.i182 = or i64 %__key.sroa.5.0.insert.shift.i180, %__key.sroa.0.0.insert.ext.i181
  store i64 %__key.sroa.0.0.insert.insert.i182, ptr %_M_key31.i178, align 4
  ret i64 %__key.sroa.0.0.insert.insert.i182
}

define i8 @"273"(i8 %0, ptr %ref.tmp, ptr %__dnew.i.i.i) {
bb:
  %1 = load i64, ptr %__dnew.i.i.i, align 8, !tbaa !0, !noalias !115
  %2 = load ptr, ptr %ref.tmp, align 8, !tbaa !37, !alias.scope !115
  %arrayidx.i.i.i.i = getelementptr inbounds i8, ptr %2, i64 %1
  store i8 %0, ptr %arrayidx.i.i.i.i, align 1, !tbaa !24
  ret i8 %0
}

define i64 @"274"(ptr %__first, ptr %add.ptr.i, ptr %add.ptr2.i, i64 %sub1.i, i64 %mul.i, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %add.ptr.i, align 8, !tbaa !0
  %3 = load i64, ptr %add.ptr2.i, align 8, !tbaa !0
  %cmp.i.i.i = icmp slt i64 %2, %3
  %spec.select.i = select i1 %cmp.i.i.i, i64 %sub1.i, i64 %mul.i
  %__parent.020.in.i.i = add nsw i64 %spec.select.i, %0
  %__parent.020.i.i = sdiv i64 %__parent.020.in.i.i, %1
  %add.ptr.i.i = getelementptr inbounds i64, ptr %__first, i64 %__parent.020.i.i
  %4 = load i64, ptr %add.ptr.i.i, align 8, !tbaa !0
  ret i64 %4
}

define i64 @"275"(ptr %arrayidx.i491, i64 %total_missing_inv.0596, ptr %offsets, i64 %indvars.iv635) {
bb:
  %.pre658.pre = load ptr, ptr %offsets, align 8, !tbaa !4
  %arrayidx.i4912 = getelementptr inbounds i64, ptr %.pre658.pre, i64 %indvars.iv635
  %0 = load i64, ptr %arrayidx.i491, align 8, !tbaa !0
  %add134 = add nsw i64 %0, %total_missing_inv.0596
  store i64 %add134, ptr %arrayidx.i491, align 8, !tbaa !0
  ret i64 %add134
}

define i64 @"276"(ptr %arrayidx356, i64 %add236.pre-phi132713501353, ptr %call34, ptr %second353) {
bb:
  %0 = load i64, ptr %arrayidx356, align 8, !tbaa !0
  %sub357 = sub nsw i64 %0, %add236.pre-phi132713501353
  %1 = load i64, ptr %second353, align 8, !tbaa !88
  %arrayidx3562 = getelementptr inbounds i64, ptr %call34, i64 %1
  store i64 %sub357, ptr %arrayidx356, align 8, !tbaa !0
  ret i64 %sub357
}

define ptr @"277"(ptr %_M_finish.i, i64 %__n) {
bb:
  %0 = load ptr, ptr %_M_finish.i, align 8, !tbaa !104
  %add.ptr.i.i.i.i.i = getelementptr inbounds %"struct.__gnu_parallel::_Piece", ptr %0, i64 %__n
  store ptr %add.ptr.i.i.i.i.i, ptr %_M_finish.i, align 8, !tbaa !104
  ret ptr %add.ptr.i.i.i.i.i
}

define i32 @"278"(ptr %n_start.0.in, i64 %0, i64 %1) {
bb:
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !23
  %incdec.ptr12.i.i.i.i = getelementptr inbounds i32, ptr %n_start.0, i64 %0
  %__first.addr.030.i.i = getelementptr inbounds i32, ptr %incdec.ptr12.i.i.i.i, i64 %1
  %2 = load i32, ptr %__first.addr.030.i.i, align 4, !tbaa !10
  ret i32 %2
}

define i32 @"279"(i32 %0, ptr %new_ids, ptr %second) {
bb:
  %1 = load i32, ptr %second, align 8, !tbaa !65
  %conv16 = sext i32 %1 to i64
  %2 = load ptr, ptr %new_ids, align 8, !tbaa !9
  %arrayidx.i31 = getelementptr inbounds i32, ptr %2, i64 %conv16
  store i32 %0, ptr %arrayidx.i31, align 4, !tbaa !10
  ret i32 %0
}

define i64 @"280"(ptr %arrayidx.i25, i64 %0, ptr %arrayidx.i23, ptr %el, ptr %.omp.lb) {
bb:
  %1 = load i32, ptr %arrayidx.i23, align 4, !tbaa !10
  %ref.tmp.sroa.0.0.insert.ext = zext i32 %1 to i64
  %2 = load i32, ptr %arrayidx.i25, align 4, !tbaa !10
  %ref.tmp.sroa.4.0.insert.ext = zext i32 %2 to i64
  %ref.tmp.sroa.4.0.insert.shift = shl nuw i64 %ref.tmp.sroa.4.0.insert.ext, %0
  %ref.tmp.sroa.0.0.insert.insert = or i64 %ref.tmp.sroa.4.0.insert.shift, %ref.tmp.sroa.0.0.insert.ext
  %3 = load ptr, ptr %el, align 8, !tbaa !43
  %4 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %4
  store i64 %ref.tmp.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp.sroa.0.0.insert.insert
}

define i64 @"281"(i64 %__pos.020.i.epil, ptr %__size, i64 %conv.i, i64 %indvars.iv.i.epil, ptr %__s.addr.019.i.epil) {
bb:
  %0 = load i64, ptr %__size, align 8, !tbaa !0
  %div.i = sdiv i64 %0, %conv.i
  %cond.i.epil = add i64 %__pos.020.i.epil, %div.i
  %rem.i = srem i64 %0, %conv.i
  %cmp5.i.epil = icmp sgt i64 %rem.i, %indvars.iv.i.epil
  %add.i.epil = zext i1 %cmp5.i.epil to i64
  %add6.i.epil = add i64 %cond.i.epil, %add.i.epil
  store i64 %add6.i.epil, ptr %__s.addr.019.i.epil, align 8, !tbaa !0
  ret i64 %add6.i.epil
}

define i64 @"282"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load ptr, ptr %offsets, align 8
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !90
  %3 = and i64 %2, %0
  %sub.prol = add nuw i64 %3, %0
  %conv32.prol = and i64 %sub.prol, %0
  %arrayidx.i452.prol = getelementptr inbounds i64, ptr %1, i64 %conv32.prol
  %4 = load i64, ptr %arrayidx.i452.prol, align 8, !tbaa !0
  ret i64 %4
}

define ptr @"283"(ptr %el, ptr %0, i64 %1, i64 %sub.ptr.rhs.cast, i64 %2, ptr %end_size_.i) {
bb:
  %3 = load ptr, ptr %el, align 8, !tbaa !43
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %1
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %2
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre653 = load ptr, ptr %el, align 8, !tbaa !43
  %.pre669 = ptrtoint ptr %.pre653 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre669
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %2
  %add.ptr.i424 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %sub.ptr.div14
  store ptr %add.ptr.i424, ptr %end_size_.i, align 8, !tbaa !45
  ret ptr %add.ptr.i424
}

define i64 @"284"(ptr %_M_p.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !80
  %inc.i70 = add nuw nsw i64 %1, %0
  %inc.i206 = add nuw nsw i64 %inc.i70, %0
  store i64 %inc.i206, ptr %_M_p.i.i.i, align 8, !tbaa !80
  ret i64 %inc.i206
}

define <2 x i32> @"285"(ptr %degrees, ptr %.omp.lb, i64 %0, i64 %index, i64 %1) {
bb:
  %2 = load ptr, ptr %degrees, align 8, !tbaa !9
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul12 = shl i64 %3, %0
  %offset.idx = add i64 %mul12, %index
  %4 = getelementptr inbounds i32, ptr %2, i64 %offset.idx
  %5 = getelementptr inbounds i32, ptr %4, i64 %1
  %wide.load41 = load <2 x i32>, ptr %5, align 4, !tbaa !10
  ret <2 x i32> %wide.load41
}

define i64 @"286"(ptr %_M_source, ptr %arrayidx11) {
bb:
  %0 = load ptr, ptr %_M_source, align 8, !tbaa !48
  %1 = load i64, ptr %arrayidx11, align 8, !tbaa !0
  %add.ptr = getelementptr %struct.EdgePair, ptr %0, i64 %1
  %2 = load i64, ptr %add.ptr, align 4
  ret i64 %2
}

define i32 @"287"(i32 %storemerge190, ptr %_M_losers.i.i, i64 %0, i32 %1) {
bb:
  %.pre189 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !53
  %_M_source.i113 = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<long, std::less<long>>::_Loser", ptr %.pre189, i64 %0, i32 1
  store i32 %storemerge190, ptr %_M_source.i113, align 4, !tbaa !56
  ret i32 %storemerge190
}

define <2 x i64> @"288"(ptr %second10, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %second10, align 8, !tbaa !12
  %incdec.ptr.i228488 = getelementptr i64, ptr %2, i64 %0
  %incdec.ptr.i297457 = getelementptr i64, ptr %incdec.ptr.i228488, i64 %0
  %next.gep770 = getelementptr i8, ptr %incdec.ptr.i297457, i64 %1
  %wide.load774 = load <2 x i64>, ptr %next.gep770, align 8, !tbaa !0
  ret <2 x i64> %wide.load774
}

define i32 @"289"(ptr %__seqs_begin.coerce, i64 %0, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %__seqs_begin.coerce, align 8, !tbaa !63
  %incdec.ptr.i360692 = getelementptr inbounds %"struct.std::pair.31", ptr %3, i64 %0
  %incdec.ptr.i650 = getelementptr inbounds %"struct.std::pair.31", ptr %incdec.ptr.i360692, i64 %0
  %second.i = getelementptr inbounds %"struct.std::pair.31", ptr %incdec.ptr.i650, i64 %1, i32 1
  %4 = load i32, ptr %second.i, align 8, !tbaa !65
  ret i32 %4
}

define i64 @"290"(ptr %.omp.lb, i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %__i.018.i, i64 %add.i, i64 %inc.i, ptr %arrayidx7.i.1) {
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

define <2 x i64> @"291"(ptr %arrayidx.i138, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %arrayidx.i138, align 8, !tbaa !42
  %incdec.ptr.i228488 = getelementptr i64, ptr %2, i64 %0
  %next.gep = getelementptr i8, ptr %incdec.ptr.i228488, i64 %1
  %wide.load = load <2 x i64>, ptr %next.gep, align 8, !tbaa !0
  ret <2 x i64> %wide.load
}

define i64 @"292"(ptr %arrayidx39, ptr %__sd, i64 %0, i32 %1) {
bb:
  %2 = load i16, ptr %__sd, align 8, !tbaa !132
  %wide.trip.count = zext i16 %2 to i64
  %n.vec = and i64 %wide.trip.count, %0
  %3 = load ptr, ptr %arrayidx39, align 8, !tbaa !100
  %_M_end = getelementptr inbounds %"struct.__gnu_parallel::_Piece", ptr %3, i64 %n.vec, i32 1
  %4 = load i64, ptr %_M_end, align 8, !tbaa !133
  ret i64 %4
}

define ptr @"293"(ptr %new_range.i.i, ptr %end_size_.i.i, ptr %agg.result, i64 %0) {
bb:
  %1 = load ptr, ptr %new_range.i.i, align 8, !tbaa !23
  %2 = load ptr, ptr %agg.result, align 8, !tbaa !43
  %sub.ptr.rhs.cast.i11.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %end_size_.i.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast.i10.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i12.i.i = sub i64 %sub.ptr.lhs.cast.i10.i.i, %sub.ptr.rhs.cast.i11.i.i
  %sub.ptr.div.i13.i.i = ashr exact i64 %sub.ptr.sub.i12.i.i, %0
  %add.ptr.i.i149 = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %sub.ptr.div.i13.i.i
  store ptr %add.ptr.i.i149, ptr %end_size_.i.i, align 8, !tbaa !45
  ret ptr %add.ptr.i.i149
}

define i32 @"294"(i32 %0, i64 %sub.ptr.div.i.i200, ptr %retval.i, i64 %sub.ptr.rhs.cast.i, i64 %1, ptr %add.ptr.i202, ptr %intersection.sroa.14.2307) {
bb:
  %.pre.i = load ptr, ptr %retval.i, align 8
  %sub.ptr.lhs.cast.i = ptrtoint ptr %.pre.i to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %1
  %cmp4.i = icmp ugt i64 %sub.ptr.div.i.i200, %sub.ptr.div.i
  %spec.select = select i1 %cmp4.i, ptr %add.ptr.i202, ptr %intersection.sroa.14.2307
  store i32 %0, ptr %spec.select, align 4, !tbaa !10
  ret i32 %0
}

define i32 @"295"(ptr %second, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %second, align 8, !tbaa !66
  %second.i.i.i.i240 = getelementptr inbounds %"struct.std::pair.31", ptr %2, i64 %0, i32 1
  %3 = load i32, ptr %second.i.i.i.i240, align 8, !tbaa !65
  ret i32 %3
}

define ptr @"296"(ptr %new_range.i.i, ptr %end_capacity_.i.i, ptr %agg.result, i64 %0) {
bb:
  %1 = load ptr, ptr %agg.result, align 8, !tbaa !43
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %end_capacity_.i.i, align 8, !tbaa !82
  %sub.ptr.lhs.cast.i7.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i9.i = sub i64 %sub.ptr.lhs.cast.i7.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.sub.i9.fr.i = freeze i64 %sub.ptr.sub.i9.i
  %mul.i = ashr exact i64 %sub.ptr.sub.i9.fr.i, %0
  %3 = load ptr, ptr %new_range.i.i, align 8, !tbaa !23
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %mul.i
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i, align 8, !tbaa !82
  ret ptr %add.ptr6.i.i
}

define i64 @"297"(ptr %arrayidx.i732, ptr %arrayidx154, i64 %0) {
bb:
  %1 = load ptr, ptr %arrayidx.i732, align 8, !tbaa !42
  %2 = load i64, ptr %arrayidx154, align 8, !tbaa !0
  %sub161 = add nsw i64 %2, %0
  %arrayidx162 = getelementptr inbounds i64, ptr %1, i64 %sub161
  %3 = load i64, ptr %arrayidx162, align 8, !tbaa !0
  ret i64 %3
}

define ptr @"298"(ptr %second, i64 %0, ptr %__seqs_begin.coerce) {
bb:
  %1 = load ptr, ptr %second, align 8, !tbaa !12
  %incdec.ptr.i274530 = getelementptr inbounds i64, ptr %1, i64 %0
  store ptr %incdec.ptr.i274530, ptr %__seqs_begin.coerce, align 8, !tbaa !42
  ret ptr %incdec.ptr.i274530
}

define i64 @"299"(ptr %v, i32 %0, i64 %1, i64 %agg.tmp93.sroa.0.0.insert.ext, ptr %2) {
bb:
  %3 = load i32, ptr %v, align 4, !tbaa !70
  %sub = add nsw i32 %3, %0
  %agg.tmp.sroa.2.0.insert.ext = zext i32 %sub to i64
  %agg.tmp.sroa.2.0.insert.shift = shl nuw i64 %agg.tmp.sroa.2.0.insert.ext, %1
  %agg.tmp.sroa.0.0.insert.insert = or i64 %agg.tmp.sroa.2.0.insert.shift, %agg.tmp93.sroa.0.0.insert.ext
  store i64 %agg.tmp.sroa.0.0.insert.insert, ptr %2, align 4, !tbaa.struct !72
  ret i64 %agg.tmp.sroa.0.0.insert.insert
}

define i32 @"300"(ptr %el, i64 %.omp.iv.040.ph, i64 %0) {
bb:
  %1 = load ptr, ptr %el, align 8, !tbaa !43
  %add.ptr.prol = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %.omp.iv.040.ph
  %add.ptr.sroa_idx.prol = getelementptr inbounds i8, ptr %add.ptr.prol, i64 %0
  %2 = load i32, ptr %add.ptr.sroa_idx.prol, align 4
  ret i32 %2
}

define ptr @"301"(ptr %__seqs_begin.coerce, ptr %_M_source15.i) {
bb:
  %0 = load i32, ptr %_M_source15.i, align 4, !tbaa !10
  %conv36 = sext i32 %0 to i64
  %arrayidx.i114 = getelementptr inbounds %"struct.std::pair", ptr %__seqs_begin.coerce, i64 %conv36
  %1 = load ptr, ptr %arrayidx.i114, align 8, !tbaa !42
  ret ptr %1
}

define ptr @"302"(ptr %arrayidx.1, ptr %arrayidx12.1, ptr %arrayidx12, ptr %second3.i.1) {
bb:
  %0 = load i64, ptr %arrayidx12, align 8, !tbaa !0
  %1 = load i64, ptr %arrayidx12.1, align 8, !tbaa !0
  %sub.1 = sub nsw i64 %1, %0
  %2 = load ptr, ptr %arrayidx.1, align 8, !tbaa !23
  %add.ptr.1 = getelementptr inbounds i64, ptr %2, i64 %sub.1
  store ptr %add.ptr.1, ptr %second3.i.1, align 8, !tbaa !12
  ret ptr %add.ptr.1
}

define ptr @"303"(ptr %__r.sroa.0.0220, ptr %arrayidx84, ptr %arrayidx84.1, ptr %arrayidx84.2, ptr %arrayidx84.3, ptr %arrayidx84.4, ptr %arrayidx84.5, ptr %arrayidx84.6, ptr %arrayidx84.7, ptr %__return_value) {
bb:
  %0 = load i64, ptr %arrayidx84.4, align 8, !tbaa !0
  %1 = load i64, ptr %arrayidx84.3, align 8, !tbaa !0
  %2 = load i64, ptr %arrayidx84.1, align 8, !tbaa !0
  %3 = load i64, ptr %arrayidx84, align 8, !tbaa !0
  %add.ptr.i = getelementptr inbounds i32, ptr %__r.sroa.0.0220, i64 %3
  %add.ptr.i.1 = getelementptr inbounds i32, ptr %add.ptr.i, i64 %2
  %4 = load i64, ptr %arrayidx84.2, align 8, !tbaa !0
  %add.ptr.i.2 = getelementptr inbounds i32, ptr %add.ptr.i.1, i64 %4
  %add.ptr.i.3 = getelementptr inbounds i32, ptr %add.ptr.i.2, i64 %1
  %add.ptr.i.4 = getelementptr inbounds i32, ptr %add.ptr.i.3, i64 %0
  %5 = load i64, ptr %arrayidx84.5, align 8, !tbaa !0
  %add.ptr.i.5 = getelementptr inbounds i32, ptr %add.ptr.i.4, i64 %5
  %6 = load i64, ptr %arrayidx84.6, align 8, !tbaa !0
  %add.ptr.i.6 = getelementptr inbounds i32, ptr %add.ptr.i.5, i64 %6
  %7 = load i64, ptr %arrayidx84.7, align 8, !tbaa !0
  %add.ptr.i.7 = getelementptr inbounds i32, ptr %add.ptr.i.6, i64 %7
  store ptr %add.ptr.i.7, ptr %__return_value, align 8, !tbaa.struct !92
  ret ptr %add.ptr.i.7
}

define <2 x i64> @"304"(ptr %_M_source, ptr %arrayidx11, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %_M_source, align 8, !tbaa !48
  %3 = load i64, ptr %arrayidx11, align 8, !tbaa !0
  %add.ptr = getelementptr %struct.EdgePair, ptr %2, i64 %3
  %next.gep247 = getelementptr i8, ptr %add.ptr, i64 %0
  %4 = getelementptr i64, ptr %next.gep247, i64 %1
  %wide.load249 = load <2 x i64>, ptr %4, align 4
  ret <2 x i64> %wide.load249
}

define i32 @"305"(ptr %init_val, ptr %this, i64 %.omp.iv.018.prol) {
bb:
  %0 = load ptr, ptr %this, align 8, !tbaa !9
  %add.ptr.prol = getelementptr inbounds i32, ptr %0, i64 %.omp.iv.018.prol
  %1 = load i32, ptr %init_val, align 4, !tbaa !10
  store i32 %1, ptr %add.ptr.prol, align 4, !tbaa !10
  ret i32 %1
}

define i64 @"306"(ptr %0, ptr %1, i64 %2, i1 %cmp7.i.i.i.i, i64 %__element2.sroa.5.0.extract.shift.i.i, i64 %__element1.sroa.6.0.extract.shift.i.i, i1 %cond.i.i.i.i, i64 %3, ptr %__target.addr.061.i.i) {
bb:
  %4 = load i64, ptr %1, align 4
  %__element1.sroa.6.0.extract.shift.i.i2 = lshr i64 %4, %2
  %__element1.sroa.6.0.extract.trunc.i.i = trunc i64 %__element1.sroa.6.0.extract.shift.i.i to i32
  %5 = load i64, ptr %0, align 4
  %__element2.sroa.5.0.extract.shift.i.i4 = lshr i64 %5, %2
  %__element2.sroa.5.0.extract.trunc.i.i = trunc i64 %__element2.sroa.5.0.extract.shift.i.i to i32
  %cmp4.i.i.i.i = icmp slt i32 %__element2.sroa.5.0.extract.trunc.i.i, %__element1.sroa.6.0.extract.trunc.i.i
  %__element2.sroa.0.0.extract.trunc.i.i = trunc i64 %5 to i32
  %__element1.sroa.0.0.extract.trunc.i.i = trunc i64 %4 to i32
  %cmp.i.i.i.i = icmp eq i32 %__element2.sroa.0.0.extract.trunc.i.i, %__element1.sroa.0.0.extract.trunc.i.i
  %cond.i.i.i.i6 = select i1 %cmp.i.i.i.i, i1 %cmp4.i.i.i.i, i1 %cmp7.i.i.i.i
  %__element2.sroa.5.0.extract.shift.__element1.sroa.6.0.extract.shift.i.i = select i1 %cond.i.i.i.i, i64 %__element2.sroa.5.0.extract.shift.i.i, i64 %__element1.sroa.6.0.extract.shift.i.i
  %__element1.sroa.6.0.insert.shift.i.i = shl nuw i64 %__element2.sroa.5.0.extract.shift.__element1.sroa.6.0.extract.shift.i.i, %2
  %.69.i.i = select i1 %cond.i.i.i.i, i64 %5, i64 %4
  %__element1.sroa.0.0.insert.ext.i.i = and i64 %.69.i.i, %3
  %__element1.sroa.0.0.insert.insert.i.i = or i64 %__element1.sroa.6.0.insert.shift.i.i, %__element1.sroa.0.0.insert.ext.i.i
  store i64 %__element1.sroa.0.0.insert.insert.i.i, ptr %__target.addr.061.i.i, align 4
  ret i64 %__element1.sroa.0.0.insert.insert.i.i
}

define i32 @"307"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %3 = sub i64 %0, %2
  %n.vec = and i64 %3, %1
  %ind.end = add i64 %2, %n.vec
  %4 = load ptr, ptr %el, align 8, !tbaa !43
  %add.ptr = getelementptr inbounds %struct.EdgePair, ptr %4, i64 %ind.end
  %5 = load i32, ptr %add.ptr, align 4
  ret i32 %5
}

define i64 @"308"(i64 %local_total.038, ptr %arrayidx.i34, ptr %prefix, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %prefix, align 8
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul13 = shl i64 %2, %0
  %arrayidx.i33 = getelementptr inbounds i64, ptr %1, i64 %mul13
  %3 = load i32, ptr %arrayidx.i34, align 4, !tbaa !10
  %conv = sext i32 %3 to i64
  %add18 = add nsw i64 %local_total.038, %conv
  store i64 %add18, ptr %arrayidx.i33, align 8, !tbaa !0
  ret i64 %add18
}

define ptr @"309"(ptr %out_index_.i, ptr %.omp.lb) {
bb:
  %0 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %1 = sext i32 %0 to i64
  %2 = load ptr, ptr %out_index_.i, align 8, !tbaa !135, !noalias !22, !llvm.access.group !124
  %arrayidx.i7.i.i.phi.trans.insert = getelementptr inbounds ptr, ptr %2, i64 %1
  %.pre = load ptr, ptr %arrayidx.i7.i.i.phi.trans.insert, align 8, !tbaa !23
  ret ptr %.pre
}

define ptr @"310"(ptr %neighs, ptr %arrayidx.i, ptr %index, ptr %.omp.lb) {
bb:
  %0 = load i64, ptr %arrayidx.i, align 8, !tbaa !0
  %1 = load ptr, ptr %neighs, align 8, !tbaa !23
  %add.ptr = getelementptr inbounds i32, ptr %1, i64 %0
  %2 = load ptr, ptr %index, align 8, !tbaa !23
  %3 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %4 = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds ptr, ptr %2, i64 %4
  store ptr %add.ptr, ptr %arrayidx, align 8, !tbaa !23
  ret ptr %add.ptr
}

define i8 @"311"(ptr %arrayidx17.i.i, ptr %ref.tmp, i64 %conv5.i) {
bb:
  %0 = load ptr, ptr %ref.tmp, align 8, !tbaa !37, !alias.scope !136
  %arrayidx.i.i = getelementptr inbounds i8, ptr %0, i64 %conv5.i
  %1 = load i8, ptr %arrayidx17.i.i, align 2, !tbaa !24, !noalias !136
  store i8 %1, ptr %arrayidx.i.i, align 1, !tbaa !24
  ret i8 %1
}

define i64 @"312"(ptr %_M_key.i162, ptr %_M_losers.i.i, ptr %_M_k.i.i, ptr %_M_source.i113, i32 %0, i32 %1) {
bb:
  %2 = load i64, ptr %_M_key.i162, align 8, !tbaa !0
  %.pre189 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !53
  %3 = load i32, ptr %_M_k.i.i, align 4, !tbaa !62
  %.pre = load i32, ptr %_M_source.i113, align 4, !tbaa !56
  %add.i120 = add i32 %3, %.pre
  %__pos.050.i137 = lshr i32 %add.i120, %0
  %idxprom.i139 = zext i32 %__pos.050.i137 to i64
  %_M_key19.i148 = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<long, std::less<long>>::_Loser", ptr %.pre189, i64 %idxprom.i139, i32 2
  store i64 %2, ptr %_M_key19.i148, align 8, !tbaa !0
  ret i64 %2
}

define i32 @"313"(ptr %__a.addr.029.i163, ptr %__r.sroa.0.0220.epil, ptr %arrayidx84.epil) {
bb:
  %0 = load i64, ptr %arrayidx84.epil, align 8, !tbaa !0
  %add.ptr.i.epil = getelementptr inbounds i32, ptr %__r.sroa.0.0220.epil, i64 %0
  %1 = load i32, ptr %__a.addr.029.i163, align 4, !tbaa !10
  store i32 %1, ptr %add.ptr.i.epil, align 4, !tbaa !10
  ret i32 %1
}

define i32 @"314"(ptr %call148, ptr %arrayidx.i498, i64 %0, i64 %total_missing_inv.0596, ptr %arrayidx.i492) {
bb:
  %1 = load i64, ptr %arrayidx.i498, align 8, !tbaa !0
  %i174.0 = add nsw i64 %1, %0
  %2 = load i32, ptr %arrayidx.i492, align 4, !tbaa !10
  %conv137 = sext i32 %2 to i64
  %add138 = add nsw i64 %total_missing_inv.0596, %conv137
  %sub183 = sub nsw i64 %i174.0, %add138
  %arrayidx184 = getelementptr inbounds i32, ptr %call148, i64 %sub183
  %3 = load i32, ptr %arrayidx184, align 4, !tbaa !10
  ret i32 %3
}

define i64 @"315"(ptr %__arbitrary_element.1.lcssa, ptr %_M_losers.i.i, ptr %_M_k.i.i, i32 %conv18, i32 %0) {
bb:
  %1 = load i32, ptr %_M_k.i.i, align 4, !tbaa !95
  %add.i = add i32 %1, %conv18
  %idxprom5.i = zext i32 %add.i to i64
  %2 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !59
  %_M_key7.i = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<EdgePair<int>, std::less<EdgePair<int>>>::_Loser", ptr %2, i64 %idxprom5.i, i32 2
  %3 = load i64, ptr %__arbitrary_element.1.lcssa, align 4
  store i64 %3, ptr %_M_key7.i, align 4
  ret i64 %3
}

define i32 @"316"(ptr %second6, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %second6, align 8, !tbaa !66
  %second.i247604 = getelementptr inbounds %"struct.std::pair.31", ptr %2, i64 %0, i32 1
  %3 = load i32, ptr %second.i247604, align 8, !tbaa !65
  ret i32 %3
}

define ptr @"317"(ptr %second10, i64 %0, ptr %arrayidx.i144) {
bb:
  %1 = load ptr, ptr %second10, align 8, !tbaa !66
  %incdec.ptr.i286638 = getelementptr inbounds %"struct.std::pair.31", ptr %1, i64 %0
  store ptr %incdec.ptr.i286638, ptr %arrayidx.i144, align 8, !tbaa !63
  ret ptr %incdec.ptr.i286638
}

define ptr @"318"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !23
  %2 = load ptr, ptr %el, align 8, !tbaa !43
  %sub.ptr.rhs.cast = ptrtoint ptr %2 to i64
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !82
  ret ptr %add.ptr6.i.i
}

define i64 @"319"(ptr %arrayidx.i491, i64 %total_missing_inv.0596, ptr %arrayidx.i492, ptr %offsets, i64 %indvars.iv635) {
bb:
  %.pre658.pre = load ptr, ptr %offsets, align 8, !tbaa !4
  %arrayidx.i4912 = getelementptr inbounds i64, ptr %.pre658.pre, i64 %indvars.iv635
  %0 = load i32, ptr %arrayidx.i492, align 4, !tbaa !10
  %conv137 = sext i32 %0 to i64
  %add138 = add nsw i64 %total_missing_inv.0596, %conv137
  %1 = load i64, ptr %arrayidx.i491, align 8, !tbaa !0
  %add134 = add nsw i64 %1, %add138
  store i64 %add134, ptr %arrayidx.i491, align 8, !tbaa !0
  ret i64 %add134
}

define i64 @"320"(ptr %_M_p.i, i64 %0, ptr %udist_, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %udist_, align 8, !tbaa !68
  %_M_p.i2 = getelementptr inbounds %"class.std::mersenne_twister_engine", ptr %3, i64 %1, i32 1
  %.pre = load i64, ptr %_M_p.i, align 8, !tbaa !105
  %inc.i = add nuw nsw i64 %.pre, %0
  store i64 %inc.i, ptr %_M_p.i, align 8, !tbaa !105
  ret i64 %inc.i
}

define i64 @"321"(ptr %arrayidx.i52.2, ptr %arrayidx.i52.1, ptr %arrayidx.i52, i64 %total.070, ptr %arrayidx.i51.3) {
bb:
  %0 = load i64, ptr %arrayidx.i52.2, align 8, !tbaa !0
  %1 = load i64, ptr %arrayidx.i52, align 8, !tbaa !0
  %add4 = add nsw i64 %1, %total.070
  %2 = load i64, ptr %arrayidx.i52.1, align 8, !tbaa !0
  %add4.1 = add nsw i64 %2, %add4
  %add4.2 = add nsw i64 %0, %add4.1
  store i64 %add4.2, ptr %arrayidx.i51.3, align 8, !tbaa !0
  ret i64 %add4.2
}

define ptr @"322"(ptr %neighs, ptr %arrayidx.i.1, ptr %index, i64 %indvars.iv.next) {
bb:
  %0 = load ptr, ptr %index, align 8, !tbaa !23
  %arrayidx.1 = getelementptr inbounds ptr, ptr %0, i64 %indvars.iv.next
  %1 = load i64, ptr %arrayidx.i.1, align 8, !tbaa !0
  %2 = load ptr, ptr %neighs, align 8, !tbaa !23
  %add.ptr.1 = getelementptr inbounds i32, ptr %2, i64 %1
  store ptr %add.ptr.1, ptr %arrayidx.1, align 8, !tbaa !23
  ret ptr %add.ptr.1
}

define i32 @"323"(ptr %arrayidx.i, ptr %degrees, i64 %indvars.iv) {
bb:
  %0 = load ptr, ptr %degrees, align 8, !tbaa !9
  %arrayidx.i29 = getelementptr inbounds i32, ptr %0, i64 %indvars.iv
  %1 = load i64, ptr %arrayidx.i, align 8, !tbaa !40
  %conv9 = trunc i64 %1 to i32
  store i32 %conv9, ptr %arrayidx.i29, align 4, !tbaa !10
  ret i32 %conv9
}

define i32 @"324"(ptr %arrayidx184, ptr %call148, i64 %tail_index.0607, ptr %arrayidx.i498, ptr %arrayidx.i496, ptr %arrayidx.i497, i64 %0) {
bb:
  %.pre659 = load i32, ptr %arrayidx.i497, align 4, !tbaa !10
  %.pre670 = sext i32 %.pre659 to i64
  %1 = load i32, ptr %arrayidx.i497, align 4, !tbaa !10
  %conv172 = sext i32 %1 to i64
  %2 = load i64, ptr %arrayidx.i496, align 8, !tbaa !0
  %add173 = add nsw i64 %2, %conv172
  %3 = load i64, ptr %arrayidx.i498, align 8, !tbaa !0
  %4 = sub i64 %3, %add173
  %n.vec733 = and i64 %4, %0
  %ind.end736 = sub i64 %tail_index.0607, %n.vec733
  %sub197 = sub nsw i64 %ind.end736, %.pre670
  %arrayidx185 = getelementptr inbounds i32, ptr %call148, i64 %sub197
  %5 = load i32, ptr %arrayidx184, align 4, !tbaa !10
  store i32 %5, ptr %arrayidx185, align 4, !tbaa !10
  ret i32 %5
}

define i64 @"325"(ptr %__first.addr.012.i.i.i, ptr %arrayidx20) {
bb:
  %0 = load ptr, ptr %arrayidx20, align 8, !tbaa !23
  %1 = load i64, ptr %__first.addr.012.i.i.i, align 4
  store i64 %1, ptr %0, align 4
  ret i64 %1
}

define ptr @"326"(ptr %__seqs_begin.coerce, ptr %_M_source.i116) {
bb:
  %0 = load i32, ptr %_M_source.i116, align 4, !tbaa !93
  %conv36 = sext i32 %0 to i64
  %arrayidx.i117 = getelementptr inbounds %"struct.std::pair.176", ptr %__seqs_begin.coerce, i64 %conv36
  %1 = load ptr, ptr %arrayidx.i117, align 8, !tbaa !96
  ret ptr %1
}

define <2 x i64> @"327"(ptr %arrayidx.i138, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %arrayidx.i138, align 8, !tbaa !42
  %incdec.ptr.i297457 = getelementptr i64, ptr %3, i64 %0
  %incdec.ptr.i228488 = getelementptr i64, ptr %incdec.ptr.i297457, i64 %0
  %next.gep = getelementptr i8, ptr %incdec.ptr.i228488, i64 %1
  %4 = getelementptr i64, ptr %next.gep, i64 %2
  %wide.load750 = load <2 x i64>, ptr %4, align 8, !tbaa !0
  ret <2 x i64> %wide.load750
}

define i32 @"328"(ptr %__seqs_begin.coerce, i64 %0) {
bb:
  %.pre.i.i = load ptr, ptr %__seqs_begin.coerce, align 8, !tbaa !23
  %__element1.sroa.6.0..sroa_idx.i.i = getelementptr inbounds i8, ptr %.pre.i.i, i64 %0
  %__element1.sroa.6.0.copyload.i.i = load i32, ptr %__element1.sroa.6.0..sroa_idx.i.i, align 8
  ret i32 %__element1.sroa.6.0.copyload.i.i
}

define i64 @"329"(ptr %this, i64 %0, ptr %_M_p) {
bb:
  %1 = load i64, ptr %_M_p, align 8, !tbaa !105
  %arrayidx = getelementptr inbounds [312 x i64], ptr %this, i64 %0, i64 %1
  %2 = load i64, ptr %arrayidx, align 8, !tbaa !0
  ret i64 %2
}

define <2 x i64> @"330"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %.omp.lb, i64 %3, i64 %4, i64 %5, <2 x i64> %6, <2 x i64> %7, ptr %8, <2 x i64> %9, <2 x i64> %10, ptr %11) {
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

define ptr @"331"(ptr %cond.i31.i.i.i, i64 %.sroa.speculated.i.i.i.i, ptr %_M_finish.i.i, ptr %this, i64 %0, i64 %sub.ptr.div.i.i.i.i.i, i1 %cmp9.i.i.i.i, i64 %1, i64 %add.i.i.i.i, ptr %_M_end_of_storage.i.i) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !23
  %sub.ptr.rhs.cast.i.i.i.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !23
  %sub.ptr.lhs.cast.i.i.i.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i.i
  %sub.ptr.div.i.i.i.i.i2 = sdiv exact i64 %sub.ptr.sub.i.i.i.i.i, %0
  %add.i.i.i.i4 = add i64 %.sroa.speculated.i.i.i.i, %sub.ptr.div.i.i.i.i.i
  %cmp7.i.i.i.i = icmp ult i64 %add.i.i.i.i, %sub.ptr.div.i.i.i.i.i
  %or.cond.i.i.i.i = or i1 %cmp7.i.i.i.i, %cmp9.i.i.i.i
  %cond.i.i.i.i = select i1 %or.cond.i.i.i.i, i64 %1, i64 %add.i.i.i.i
  %add.ptr19.i.i.i = getelementptr inbounds %"struct.std::pair.65", ptr %cond.i31.i.i.i, i64 %cond.i.i.i.i
  store ptr %add.ptr19.i.i.i, ptr %_M_end_of_storage.i.i, align 8, !tbaa !139
  ret ptr %add.ptr19.i.i.i
}

define <2 x i64> @"332"(ptr %0, ptr %offsets, ptr %num_nodes_.i, i64 %1, i64 %index710, i64 %2) {
bb:
  %wide.load = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %3 = load ptr, ptr %offsets, align 8
  %4 = load i64, ptr %num_nodes_.i, align 8, !tbaa !90
  %5 = and i64 %4, %1
  %offset.idx = sub i64 %5, %index710
  %6 = getelementptr inbounds i64, ptr %3, i64 %offset.idx
  %7 = getelementptr inbounds i64, ptr %6, i64 %2
  store <2 x i64> %wide.load, ptr %7, align 8, !tbaa !0
  ret <2 x i64> %wide.load
}

define i8 @"333"(ptr %arrayidx3.i, ptr %_M_losers.i.i) {
bb:
  %.pre66.i = load i8, ptr %arrayidx3.i, align 1, !tbaa !19, !range !21
  %0 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !59
  store i8 %.pre66.i, ptr %0, align 4, !tbaa !108
  ret i8 %.pre66.i
}

define ptr @"334"(ptr %new_range.i.i, ptr %end_size_.i, ptr %el, i64 %0, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !23
  %1 = load ptr, ptr %el, align 8, !tbaa !43
  %sub.ptr.rhs.cast = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !82
  ret ptr %add.ptr6.i.i
}

define ptr @"335"(ptr %call.i4549, ptr %end_size_.i, ptr %degrees, i64 %0, i64 %1, ptr %end_size_.i47) {
bb:
  %2 = load ptr, ptr %degrees, align 8, !tbaa !9
  %sub.ptr.rhs.cast.i42 = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %end_size_.i, align 8, !tbaa !7
  %sub.ptr.lhs.cast.i41 = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i43 = sub i64 %sub.ptr.lhs.cast.i41, %sub.ptr.rhs.cast.i42
  %sub.ptr.div.i44 = ashr exact i64 %sub.ptr.sub.i43, %0
  %add9 = add nsw i64 %sub.ptr.div.i44, %1
  %add.ptr.i46 = getelementptr inbounds i64, ptr %call.i4549, i64 %add9
  store ptr %add.ptr.i46, ptr %end_size_.i47, align 8, !tbaa !73
  ret ptr %add.ptr.i46
}

define i64 @"336"(i64 %__pos.020.i, ptr %__size, i64 %conv.i, i64 %indvars.iv.i, i64 %div.i, i64 %add.i.1, i64 %add.i.2, i64 %add.i.3, ptr %__s.addr.019.i) {
bb:
  %0 = load i64, ptr %__size, align 8, !tbaa !0
  %div.i2 = sdiv i64 %0, %conv.i
  %cond.i = add i64 %__pos.020.i, %div.i
  %rem.i = srem i64 %0, %conv.i
  %cmp5.i = icmp sgt i64 %rem.i, %indvars.iv.i
  %add.i = zext i1 %cmp5.i to i64
  %add6.i = add i64 %cond.i, %add.i
  %cond.i.1 = add i64 %add6.i, %div.i
  %add6.i.1 = add i64 %cond.i.1, %add.i.1
  %cond.i.2 = add i64 %add6.i.1, %div.i
  %add6.i.2 = add i64 %cond.i.2, %add.i.2
  %cond.i.3 = add i64 %add6.i.2, %div.i
  %add6.i.3 = add i64 %cond.i.3, %add.i.3
  store i64 %add6.i.3, ptr %__s.addr.019.i, align 8, !tbaa !0
  ret i64 %add6.i.3
}

define ptr @"337"(ptr %new_range.i.i, ptr %el, i64 %0, i64 %1, ptr %end_capacity_.i.i.i) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !23
  %2 = load ptr, ptr %el, align 8, !tbaa !43
  %sub.ptr.rhs.cast = ptrtoint ptr %2 to i64
  %incdec.ptr7.i.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %0
  %sub.ptr.lhs.cast = ptrtoint ptr %incdec.ptr7.i.i to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr6.i.i = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div
  store ptr %add.ptr6.i.i, ptr %end_capacity_.i.i.i, align 8, !tbaa !82
  ret ptr %add.ptr6.i.i
}

define ptr @"338"(ptr %arrayidx, i64 %conv11, ptr %_M_pieces, i64 %indvars.iv, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %_M_pieces, align 8, !tbaa !102
  %arrayidx2 = getelementptr inbounds %"class.std::vector", ptr %2, i64 %indvars.iv
  %_M_finish.i.i = getelementptr inbounds %"struct.std::_Vector_base<__gnu_parallel::_Piece<long>, std::allocator<__gnu_parallel::_Piece<long>>>::_Vector_impl_data", ptr %arrayidx, i64 %0, i32 1
  %3 = load ptr, ptr %arrayidx, align 8, !tbaa !100
  %add.ptr.i = getelementptr inbounds %"struct.__gnu_parallel::_Piece", ptr %3, i64 %conv11
  store ptr %add.ptr.i, ptr %_M_finish.i.i, align 8, !tbaa !104
  ret ptr %add.ptr.i
}

define i64 @"339"(ptr %end_size_.i, ptr %this, i64 %0, i64 %1, ptr %.omp.ub) {
bb:
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %this, align 8, !tbaa !43
  %sub.ptr.rhs.cast.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %sub2 = add nsw i64 %sub.ptr.div.i, %1
  store i64 %sub2, ptr %.omp.ub, align 8, !tbaa !0
  ret i64 %sub2
}

define ptr @"340"(ptr %out_index_.i, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load ptr, ptr %out_index_.i, align 8, !tbaa !135, !noalias !22, !llvm.access.group !124
  %2 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %3 = sext i32 %2 to i64
  %indvars.iv.next = add nsw i64 %3, %0
  %arrayidx.i.i.i = getelementptr inbounds ptr, ptr %1, i64 %indvars.iv.next
  %4 = load ptr, ptr %arrayidx.i.i.i, align 8, !tbaa !23, !llvm.access.group !124
  ret ptr %4
}

define ptr @"341"(ptr %index, ptr %arrayidx.i46, i32 %0) {
bb:
  %1 = load i32, ptr %arrayidx.i46, align 4, !tbaa !10
  %add25 = add nsw i32 %1, %0
  %idxprom26 = sext i32 %add25 to i64
  %2 = load ptr, ptr %index, align 8, !tbaa !23
  %arrayidx27 = getelementptr inbounds ptr, ptr %2, i64 %idxprom26
  %3 = load ptr, ptr %arrayidx27, align 8, !tbaa !23
  ret ptr %3
}

define i64 @"342"(ptr %arrayidx23.i, i64 %0, ptr %1, i64 %2, i64 %3, ptr %arrayidx28.i, i64 %4, i64 %5, ptr %arrayidx19.i) {
bb:
  %6 = load i64, ptr %arrayidx23.i, align 8, !tbaa !0
  %and31.i = and i64 %6, %2
  %tobool32.not.i = icmp eq i64 %and31.i, %4
  %cond33.i = select i1 %tobool32.not.i, i64 %4, i64 %5
  %7 = load i64, ptr %arrayidx28.i, align 8, !tbaa !0
  %and24.i = and i64 %6, %0
  %wide.load28 = load <2 x i64>, ptr %1, align 8, !tbaa !0
  %vector.recur.extract31 = extractelement <2 x i64> %wide.load28, i64 %2
  %and20.i = and i64 %vector.recur.extract31, %3
  %or25.i = or i64 %and24.i, %and20.i
  %shr29.i = lshr exact i64 %or25.i, %2
  %xor30.i = xor i64 %shr29.i, %7
  %xor34.i = xor i64 %xor30.i, %cond33.i
  store i64 %xor34.i, ptr %arrayidx19.i, align 8, !tbaa !0
  ret i64 %xor34.i
}

define i64 @"343"(i32 %shl19, ptr %arrayidx.i61, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i63, i64 %4, i64 %5, i64 %xor4.i, i64 %6, i64 %xor7.i, i32 %7, i32 %8, i32 %9, i32 %conv, i64 %10, i64 %ref.tmp30.sroa.0.0.insert.ext, ptr %el, ptr %.omp.lb) {
bb:
  %11 = load i64, ptr %arrayidx.i61, align 8, !tbaa !0
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
  %12 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %mul = shl i64 %12, %6
  %13 = load ptr, ptr %el, align 8, !tbaa !43
  %arrayidx.i = getelementptr inbounds %struct.EdgePair, ptr %13, i64 %mul
  store i64 %ref.tmp30.sroa.0.0.insert.insert, ptr %arrayidx.i, align 4
  ret i64 %ref.tmp30.sroa.0.0.insert.insert
}

define i32 @"344"(ptr %el, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add15 = add i64 %2, %0
  %3 = load ptr, ptr %el, align 8, !tbaa !43
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %3, i64 %add15
  %add.ptr.sroa_idx.1 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %1
  %4 = load i32, ptr %add.ptr.sroa_idx.1, align 4
  ret i32 %4
}

define <2 x i64> @"345"(ptr %0, <2 x i64> %1, <2 x i64> %2, ptr %this, i64 %3, <2 x i64> %4, <2 x i64> %5, ptr %6, <2 x i64> %7, <2 x i64> %8, ptr %9) {
bb:
  %wide.load = load <2 x i64>, ptr %0, align 8, !tbaa !0
  %.pre.i = load i64, ptr %this, align 8, !tbaa !0
  %vector.recur.init = insertelement <2 x i64> %2, i64 %.pre.i, i64 %3
  %10 = shufflevector <2 x i64> %vector.recur.init, <2 x i64> %wide.load, <2 x i32> <i32 1, i32 2>
  %11 = and <2 x i64> %10, %4
  %12 = and <2 x i64> %wide.load, %1
  %13 = or <2 x i64> %12, %11
  %14 = lshr exact <2 x i64> %13, %5
  %wide.load18 = load <2 x i64>, ptr %6, align 8, !tbaa !0
  %15 = xor <2 x i64> %14, %wide.load18
  %16 = and <2 x i64> %wide.load, %5
  %17 = icmp eq <2 x i64> %16, %7
  %18 = select <2 x i1> %17, <2 x i64> %7, <2 x i64> %8
  %19 = xor <2 x i64> %15, %18
  store <2 x i64> %19, ptr %9, align 8, !tbaa !0
  ret <2 x i64> %19
}

define <2 x i32> @"346"(ptr %degrees, i64 %offset.idx) {
bb:
  %0 = load ptr, ptr %degrees, align 8, !tbaa !9
  %1 = getelementptr inbounds i32, ptr %0, i64 %offset.idx
  %wide.load = load <2 x i32>, ptr %1, align 4, !tbaa !10
  ret <2 x i32> %wide.load
}

define i64 @"347"(ptr %arrayidx.i52, i64 %total.070, ptr %arrayidx.i51.1) {
bb:
  %0 = load i64, ptr %arrayidx.i52, align 8, !tbaa !0
  %add4 = add nsw i64 %0, %total.070
  store i64 %add4, ptr %arrayidx.i51.1, align 8, !tbaa !0
  ret i64 %add4
}

define i32 @"348"(ptr %second, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %second, align 8, !tbaa !66
  %incdec.ptr.i360692 = getelementptr inbounds %"struct.std::pair.31", ptr %2, i64 %0
  %second.i.i.i.i240 = getelementptr inbounds %"struct.std::pair.31", ptr %incdec.ptr.i360692, i64 %0, i32 1
  %3 = load i32, ptr %second.i.i.i.i240, align 8, !tbaa !65
  ret i32 %3
}

define ptr @"349"(ptr %__result, ptr %__return_value) {
bb:
  %0 = load i64, ptr %__result, align 8, !tbaa !23
  %1 = inttoptr i64 %0 to ptr
  store ptr %1, ptr %__return_value, align 8, !tbaa.struct !92
  ret ptr %1
}

define <2 x i64> @"350"(ptr %arrayidx.i138, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %arrayidx.i138, align 8, !tbaa !42
  %incdec.ptr.i297457 = getelementptr i64, ptr %2, i64 %0
  %incdec.ptr.i228488 = getelementptr i64, ptr %incdec.ptr.i297457, i64 %0
  %next.gep = getelementptr i8, ptr %incdec.ptr.i228488, i64 %1
  %wide.load = load <2 x i64>, ptr %next.gep, align 8, !tbaa !0
  ret <2 x i64> %wide.load
}

define i32 @"351"(i64 %indvars.iv631, ptr %incdec.ptr4.sink.i.i.i.i, ptr %__first.addr.015.i.i, ptr %neighs, ptr %arrayidx.i480, i64 %sub.ptr.rhs.cast.i.i.i.i482, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i480, align 8, !tbaa !0
  %3 = load ptr, ptr %neighs, align 8, !tbaa !23
  %add.ptr105 = getelementptr inbounds i32, ptr %3, i64 %2
  %sub.ptr.lhs.cast.i.i.i.i481 = ptrtoint ptr %add.ptr105 to i64
  %sub.ptr.sub.i.i.i.i483 = sub i64 %sub.ptr.lhs.cast.i.i.i.i481, %sub.ptr.rhs.cast.i.i.i.i482
  %sub.ptr.div.i.i.i.i = lshr exact i64 %sub.ptr.sub.i.i.i.i483, %0
  %shr.i.i = lshr i64 %sub.ptr.div.i.i.i.i, %1
  %incdec.ptr4.sink.i.i.i.i2 = getelementptr inbounds i32, ptr %__first.addr.015.i.i, i64 %shr.i.i
  %incdec.ptr.i.i = getelementptr inbounds i32, ptr %incdec.ptr4.sink.i.i.i.i, i64 %1
  %4 = load i32, ptr %incdec.ptr4.sink.i.i.i.i, align 4, !tbaa !10
  %5 = sext i32 %4 to i64
  %cmp.i.i.i486 = icmp sgt i64 %indvars.iv631, %5
  %__first.addr.1.i.i = select i1 %cmp.i.i.i486, ptr %incdec.ptr.i.i, ptr %__first.addr.015.i.i
  %6 = load i32, ptr %__first.addr.1.i.i, align 4, !tbaa !10
  ret i32 %6
}

define ptr @"352"(ptr %out_index_.i, ptr %arrayidx.i7, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i, i64 %4, i64 %5, i64 %xor4.i, i64 %6, ptr %mod_.i, i32 %7) {
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
  %9 = load i32, ptr %mod_.i, align 4, !tbaa !118
  %rem.i = urem i32 %conv7.i, %9
  %add.i = add nsw i32 %rem.i, %7
  %idxprom.i = sext i32 %add.i to i64
  %10 = load ptr, ptr %out_index_.i, align 8, !tbaa !135
  %arrayidx.i = getelementptr inbounds ptr, ptr %10, i64 %idxprom.i
  %11 = load ptr, ptr %arrayidx.i, align 8, !tbaa !23
  ret ptr %11
}

define i64 @"353"(ptr %scevgep, ptr %__last.addr.012.i.i.1) {
bb:
  %0 = load i64, ptr %scevgep, align 8, !tbaa !0
  store i64 %0, ptr %__last.addr.012.i.i.1, align 8, !tbaa !0
  ret i64 %0
}

define i64 @"354"(ptr %add.ptr.i181.us, ptr %add.ptr.i182.us, i64 %0, ptr %arrayidx67.us, i64 %indvars.iv223, i32 %1) {
bb:
  %2 = load ptr, ptr %add.ptr.i182.us, align 8, !tbaa !42
  %sub.ptr.rhs.cast.us = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %add.ptr.i181.us, align 8, !tbaa !23
  %sub.ptr.lhs.cast.us = ptrtoint ptr %3 to i64
  %sub.ptr.sub.us = sub i64 %sub.ptr.lhs.cast.us, %sub.ptr.rhs.cast.us
  %sub.ptr.div.us = ashr exact i64 %sub.ptr.sub.us, %0
  %4 = load ptr, ptr %arrayidx67.us, align 8, !tbaa !100
  %_M_end.us = getelementptr inbounds %"struct.__gnu_parallel::_Piece", ptr %4, i64 %indvars.iv223, i32 1
  store i64 %sub.ptr.div.us, ptr %_M_end.us, align 8, !tbaa !133
  ret i64 %sub.ptr.div.us
}

define ptr @"355"(ptr %second10, i64 %0, ptr %arrayidx.i138) {
bb:
  %1 = load ptr, ptr %second10, align 8, !tbaa !12
  %incdec.ptr.i297457 = getelementptr i64, ptr %1, i64 %0
  store ptr %incdec.ptr.i297457, ptr %arrayidx.i138, align 8, !tbaa !42
  ret ptr %incdec.ptr.i297457
}

define i32 @"356"(ptr %arrayidx.i, ptr %degrees, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %degrees, align 8, !tbaa !9
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %arrayidx.i29 = getelementptr inbounds i32, ptr %0, i64 %2
  %3 = load i64, ptr %arrayidx.i, align 8, !tbaa !40
  %conv9 = trunc i64 %3 to i32
  store i32 %conv9, ptr %arrayidx.i29, align 4, !tbaa !10
  ret i32 %conv9
}

define i64 @"357"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !80
  %inc.i70 = add nuw nsw i64 %2, %1
  %arrayidx.i64 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i70
  %3 = load i64, ptr %arrayidx.i64, align 8, !tbaa !0
  ret i64 %3
}

define i32 @"358"(i32 %0, ptr %call148, ptr %arrayidx.i504, i64 %1, ptr %arrayidx.i505) {
bb:
  %2 = load i64, ptr %arrayidx.i504, align 8, !tbaa !0
  %add248 = add i64 %2, %1
  %3 = load i32, ptr %arrayidx.i505, align 4, !tbaa !10
  %idx.ext = sext i32 %3 to i64
  %sub249 = add i64 %add248, %idx.ext
  %arrayidx250 = getelementptr inbounds i32, ptr %call148, i64 %sub249
  store i32 %0, ptr %arrayidx250, align 4, !tbaa !10
  ret i32 %0
}

define i32 @"359"(ptr %el, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add15 = add i64 %1, %0
  %2 = load ptr, ptr %el, align 8, !tbaa !43
  %add.ptr.1 = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %add15
  %3 = load i32, ptr %add.ptr.1, align 4
  ret i32 %3
}

define i64 @"360"(i64 %__pos.049, ptr %__n, ptr %__num_threads, i64 %conv9, i64 %indvars.iv54, i64 %div, i64 %add28.1, ptr %arrayidx25.epil) {
bb:
  %0 = load i64, ptr %__n, align 8, !tbaa !0
  %rem = srem i64 %0, %conv9
  %cmp27 = icmp sgt i64 %rem, %indvars.iv54
  %add28 = zext i1 %cmp27 to i64
  %.pre = load i16, ptr %__num_threads, align 2, !tbaa !83
  %conv92 = zext i16 %.pre to i64
  %div4 = sdiv i64 %0, %conv9
  %cond = add i64 %__pos.049, %div
  %add29 = add i64 %cond, %add28
  %cond.1 = add i64 %add29, %div
  %add29.1 = add i64 %cond.1, %add28.1
  store i64 %add29.1, ptr %arrayidx25.epil, align 8, !tbaa !0
  ret i64 %add29.1
}

define i64 @"361"(ptr %arrayidx.i.i, ptr %0, i64 %1, ptr %2) {
bb:
  %3 = load ptr, ptr %0, align 8, !tbaa !23, !noalias !111
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %arrayidx.i.i, align 8, !tbaa !23, !noalias !111
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %4 to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i = ashr exact i64 %sub.ptr.sub.i.i, %1
  store i64 %sub.ptr.div.i.i, ptr %2, align 8, !alias.scope !111
  ret i64 %sub.ptr.div.i.i
}

define i32 @"362"(ptr %_M_source.i116, ptr %_M_losers.i.i, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !59
  %_M_source28.i177 = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<EdgePair<int>, std::less<EdgePair<int>>>::_Loser", ptr %2, i64 %0, i32 1
  %3 = load i32, ptr %_M_source.i116, align 4, !tbaa !93
  store i32 %3, ptr %_M_source28.i177, align 4, !tbaa !93
  ret i32 %3
}

define i64 @"363"(ptr %rng, i64 %0, ptr %_M_p.i.i.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_p.i.i.i, align 8, !tbaa !80
  %inc.i70 = add nuw nsw i64 %2, %1
  %arrayidx.i207 = getelementptr inbounds [624 x i64], ptr %rng, i64 %0, i64 %inc.i70
  %3 = load i64, ptr %arrayidx.i207, align 8, !tbaa !0
  ret i64 %3
}

define i64 @"364"(ptr %offsets, ptr %num_nodes_.i, i64 %0) {
bb:
  %1 = load i64, ptr %num_nodes_.i, align 8, !tbaa !90
  %2 = and i64 %1, %0
  %sub = add nuw i64 %2, %0
  %conv32 = and i64 %sub, %0
  %3 = load ptr, ptr %offsets, align 8
  %arrayidx.i452 = getelementptr inbounds i64, ptr %3, i64 %conv32
  %4 = load i64, ptr %arrayidx.i452, align 8, !tbaa !0
  ret i64 %4
}

define i32 @"365"(ptr %degrees, i64 %mul12, i64 %umin, ptr %.omp.lb, i64 %indvar, i64 %0, i64 %n.mod.vf) {
bb:
  %1 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %2 = add i64 %1, %indvar
  %3 = shl i64 %2, %0
  %4 = sub i64 %umin, %3
  %n.vec = sub i64 %4, %n.mod.vf
  %ind.end = add i64 %mul12, %n.vec
  %5 = load ptr, ptr %degrees, align 8, !tbaa !9
  %arrayidx.i31 = getelementptr inbounds i32, ptr %5, i64 %ind.end
  %6 = load i32, ptr %arrayidx.i31, align 4, !tbaa !10
  ret i32 %6
}

define i64 @"366"(ptr %arrayidx.i52.3, ptr %arrayidx.i52.2, ptr %arrayidx.i52.1, ptr %arrayidx.i52, i64 %total.070, ptr %call.i3539, ptr %num_blocks) {
bb:
  %0 = load i64, ptr %num_blocks, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds i64, ptr %call.i3539, i64 %0
  %1 = load i64, ptr %arrayidx.i52.2, align 8, !tbaa !0
  %2 = load i64, ptr %arrayidx.i52, align 8, !tbaa !0
  %add4 = add nsw i64 %2, %total.070
  %3 = load i64, ptr %arrayidx.i52.1, align 8, !tbaa !0
  %add4.1 = add nsw i64 %3, %add4
  %add4.2 = add nsw i64 %1, %add4.1
  %4 = load i64, ptr %arrayidx.i52.3, align 8, !tbaa !0
  %add4.3 = add nsw i64 %4, %add4.2
  store i64 %add4.3, ptr %arrayidx.i, align 8, !tbaa !0
  ret i64 %add4.3
}

define i64 @"367"(ptr %add.ptr.i.i, ptr %__first, ptr %add.ptr.i, ptr %add.ptr2.i, i64 %sub1.i, i64 %mul.i) {
bb:
  %0 = load i64, ptr %add.ptr.i, align 8, !tbaa !0
  %1 = load i64, ptr %add.ptr2.i, align 8, !tbaa !0
  %cmp.i.i.i = icmp slt i64 %0, %1
  %spec.select.i = select i1 %cmp.i.i.i, i64 %sub1.i, i64 %mul.i
  %add.ptr2.i.i = getelementptr inbounds i64, ptr %__first, i64 %spec.select.i
  %2 = load i64, ptr %add.ptr.i.i, align 8, !tbaa !0
  store i64 %2, ptr %add.ptr2.i.i, align 8, !tbaa !0
  ret i64 %2
}

define ptr @"368"(ptr %__offset, i64 %0, ptr %__block_begins, i64 %idxprom) {
bb:
  %1 = load ptr, ptr %__block_begins, align 8, !tbaa !23
  %arrayidx51 = getelementptr inbounds %"struct.std::pair.94", ptr %1, i64 %idxprom
  %2 = load ptr, ptr %__offset, align 16, !tbaa !23
  %add.ptr34 = getelementptr inbounds i32, ptr %2, i64 %0
  store ptr %add.ptr34, ptr %arrayidx51, align 8, !tbaa !84
  ret ptr %add.ptr34
}

define i32 @"370"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !9
  %3 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %4 = sub i64 %0, %3
  %n.vec = and i64 %4, %1
  %ind.end = add i64 %3, %n.vec
  %add.ptr.prol = getelementptr inbounds i32, ptr %2, i64 %ind.end
  %5 = load i32, ptr %init_val, align 4, !tbaa !10
  store i32 %5, ptr %add.ptr.prol, align 4, !tbaa !10
  ret i32 %5
}

define i32 @"371"(ptr %arrayidx.i735, ptr %arrayidx152, i64 %0, i64 %1, i32 %2) {
bb:
  %3 = load i64, ptr %arrayidx152, align 8, !tbaa !0
  %sub159 = add nsw i64 %3, %0
  %4 = load ptr, ptr %arrayidx.i735, align 8, !tbaa !63
  %arrayidx160 = getelementptr inbounds %"struct.std::pair.31", ptr %4, i64 %sub159
  %second.i.i.i = getelementptr inbounds %"struct.std::pair.31", ptr %arrayidx160, i64 %1, i32 1
  %5 = load i32, ptr %second.i.i.i, align 8, !tbaa !65
  ret i32 %5
}

define <2 x ptr> @"372"(<2 x ptr> %0, ptr %1, i64 %2, ptr %3, i64 %4, ptr %5, ptr %6) {
bb:
  %7 = load ptr, ptr %1, align 8, !tbaa !42, !alias.scope !140
  %8 = insertelement <2 x ptr> %0, ptr %7, i64 %2
  %9 = load ptr, ptr %3, align 8, !tbaa !42, !alias.scope !140
  %10 = insertelement <2 x ptr> %8, ptr %9, i64 %4
  %wide.load = load <2 x i64>, ptr %5, align 8, !tbaa !0
  %11 = getelementptr inbounds i64, <2 x ptr> %10, <2 x i64> %wide.load
  store <2 x ptr> %11, ptr %6, align 8, !tbaa !23, !alias.scope !143, !noalias !140
  ret <2 x ptr> %11
}

define i64 @"373"(ptr %add.ptr.i.i.i.i.i, ptr %add.ptr2.i.i.i.i.i) {
bb:
  %0 = load i64, ptr %add.ptr.i.i.i.i.i, align 8, !tbaa !0
  store i64 %0, ptr %add.ptr2.i.i.i.i.i, align 8, !tbaa !0
  ret i64 %0
}

define i64 @"374"(ptr %_M_finish.i.i, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !86
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.20", ptr %2, i64 %0
  %add.ptr.i.i = getelementptr inbounds %"struct.std::pair.20", ptr %incdec.ptr.i.i, i64 %1
  %__value.sroa.0.0.copyload.i = load i64, ptr %add.ptr.i.i, align 8
  ret i64 %__value.sroa.0.0.copyload.i
}

define i64 @"375"(ptr %__num_threads, ptr %call7) {
bb:
  %0 = load i16, ptr %__num_threads, align 2, !tbaa !83
  %.fr58 = freeze i16 %0
  %1 = zext i16 %.fr58 to i64
  store i64 %1, ptr %call7, align 16
  ret i64 %1
}

define ptr @"376"(ptr %cond.i65, i64 %.sroa.speculated.i, ptr %_M_finish.i, ptr %this, i64 %0, i64 %sub.ptr.div.i, i1 %cmp9.i, i64 %1, i64 %add.i, ptr %_M_end_of_storage) {
bb:
  %2 = load ptr, ptr %_M_finish.i, align 8, !tbaa !104
  %sub.ptr.lhs.cast.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %this, align 8, !tbaa !100
  %sub.ptr.rhs.cast.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i2 = lshr exact i64 %sub.ptr.sub.i, %0
  %add.i4 = add i64 %.sroa.speculated.i, %sub.ptr.div.i
  %cmp7.i = icmp ult i64 %add.i, %sub.ptr.div.i
  %or.cond.i = or i1 %cmp7.i, %cmp9.i
  %cond.i = select i1 %or.cond.i, i64 %1, i64 %add.i
  %add.ptr40 = getelementptr inbounds %"struct.__gnu_parallel::_Piece", ptr %cond.i65, i64 %cond.i
  store ptr %add.ptr40, ptr %_M_end_of_storage, align 8, !tbaa !145
  ret ptr %add.ptr40
}

define i64 @"377"(ptr %second10) {
bb:
  %0 = load ptr, ptr %second10, align 8, !tbaa !12
  %1 = load i64, ptr %0, align 8, !tbaa !0
  ret i64 %1
}

define <2 x i64> @"378"(ptr %second10, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %second10, align 8, !tbaa !12
  %incdec.ptr.i228488 = getelementptr i64, ptr %2, i64 %0
  %next.gep = getelementptr i8, ptr %incdec.ptr.i228488, i64 %1
  %wide.load = load <2 x i64>, ptr %next.gep, align 8, !tbaa !0
  ret <2 x i64> %wide.load
}

define ptr @"379"(ptr %arrayidx.i, i64 %0, i64 %__max_length.addr.0.lcssa.i.i83) {
bb:
  %.pre65.i.i81 = load ptr, ptr %arrayidx.i, align 8, !tbaa !23
  %add.ptr3.i.i = getelementptr inbounds i64, ptr %.pre65.i.i81, i64 %0
  %add.ptr12.i.i = getelementptr inbounds i64, ptr %add.ptr3.i.i, i64 %__max_length.addr.0.lcssa.i.i83
  store ptr %add.ptr12.i.i, ptr %arrayidx.i, align 8, !tbaa !23
  ret ptr %add.ptr12.i.i
}

define ptr @"380"(ptr %__seqs_begin.coerce, i64 %0) {
bb:
  %1 = load ptr, ptr %__seqs_begin.coerce, align 8, !tbaa !42
  %incdec.ptr.i274530 = getelementptr inbounds i64, ptr %1, i64 %0
  store ptr %incdec.ptr.i274530, ptr %__seqs_begin.coerce, align 8, !tbaa !42
  ret ptr %incdec.ptr.i274530
}

define i64 @"381"(ptr %second.epil, ptr %arrayidx.i.epil, i64 %0, ptr %1) {
bb:
  %2 = load ptr, ptr %arrayidx.i.epil, align 8, !tbaa !42
  %sub.ptr.rhs.cast.epil = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %second.epil, align 8, !tbaa !12
  %sub.ptr.lhs.cast.epil = ptrtoint ptr %3 to i64
  %sub.ptr.sub.epil = sub i64 %sub.ptr.lhs.cast.epil, %sub.ptr.rhs.cast.epil
  %cmp4.epil = icmp sgt i64 %sub.ptr.sub.epil, %0
  %spec.select.epil = select i1 %cmp4.epil, ptr %2, ptr %1
  %4 = load i64, ptr %spec.select.epil, align 8, !tbaa !0
  ret i64 %4
}

define ptr @"382"(ptr %cond.i65, ptr %_M_finish.i, ptr %this, i64 %0, i64 %__n) {
bb:
  %1 = load ptr, ptr %_M_finish.i, align 8, !tbaa !104
  %sub.ptr.lhs.cast.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %this, align 8, !tbaa !100
  %sub.ptr.rhs.cast.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = lshr exact i64 %sub.ptr.sub.i, %0
  %add.ptr = getelementptr inbounds %"struct.__gnu_parallel::_Piece", ptr %cond.i65, i64 %sub.ptr.div.i
  %add.ptr37 = getelementptr inbounds %"struct.__gnu_parallel::_Piece", ptr %add.ptr, i64 %__n
  store ptr %add.ptr37, ptr %_M_finish.i, align 8, !tbaa !104
  ret ptr %add.ptr37
}

define ptr @"383"(ptr %__seqs_begin.coerce, ptr %_M_source.i112) {
bb:
  %0 = load i32, ptr %_M_source.i112, align 4, !tbaa !77
  %conv36 = sext i32 %0 to i64
  %arrayidx.i113 = getelementptr inbounds %"struct.std::pair.94", ptr %__seqs_begin.coerce, i64 %conv36
  %1 = load ptr, ptr %arrayidx.i113, align 8, !tbaa !84
  ret ptr %1
}

define i32 @"384"(ptr %_M_source15.i, ptr %_M_losers.i.i, ptr %_M_k.i.i, ptr %_M_source.i112, i32 %0) {
bb:
  %1 = load i32, ptr %_M_source15.i, align 4, !tbaa !10
  %.pre191 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !74
  %2 = load i32, ptr %_M_source.i112, align 4, !tbaa !77
  %3 = load i32, ptr %_M_k.i.i, align 4, !tbaa !79
  %add.i119 = add i32 %3, %2
  %__pos.050.i = lshr i32 %add.i119, %0
  %idxprom.i122 = zext i32 %__pos.050.i to i64
  %_M_source15.i2 = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<int, std::less<int>>::_Loser", ptr %.pre191, i64 %idxprom.i122, i32 1
  store i32 %1, ptr %_M_source15.i, align 4, !tbaa !10
  ret i32 %1
}

define ptr @"385"(ptr %el, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %0) {
bb:
  %1 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast = ptrtoint ptr %1 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %0
  %2 = load ptr, ptr %el, align 8, !tbaa !43
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %2, i64 %sub.ptr.div
  store ptr %add.ptr.i, ptr %end_size_.i, align 8, !tbaa !45
  ret ptr %add.ptr.i
}

define i64 @"386"(ptr %this, i64 %0, ptr %arrayidx42.i, i64 %1, i64 %2, ptr %arrayidx49.i, i64 %3, i64 %4) {
bb:
  %5 = load i64, ptr %arrayidx42.i, align 8, !tbaa !0
  %and43.i = and i64 %5, %1
  %6 = load i64, ptr %this, align 8, !tbaa !0
  %and46.i = and i64 %6, %0
  %or47.i = or i64 %and46.i, %and43.i
  %shr50.i = lshr exact i64 %or47.i, %2
  %7 = load i64, ptr %arrayidx49.i, align 8, !tbaa !0
  %xor51.i = xor i64 %shr50.i, %7
  %and52.i = and i64 %6, %2
  %tobool53.not.i = icmp eq i64 %and52.i, %3
  %cond54.i = select i1 %tobool53.not.i, i64 %3, i64 %4
  %xor55.i = xor i64 %xor51.i, %cond54.i
  store i64 %xor55.i, ptr %arrayidx42.i, align 8, !tbaa !0
  ret i64 %xor55.i
}

define i32 @"387"(ptr %neighs, ptr %arrayidx.i479, ptr %arrayidx.i480, i64 %sub.ptr.rhs.cast.i.i.i.i482, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %arrayidx.i479, align 8, !tbaa !0
  %3 = load ptr, ptr %neighs, align 8, !tbaa !23
  %add.ptr = getelementptr inbounds i32, ptr %3, i64 %2
  %4 = load i64, ptr %arrayidx.i480, align 8, !tbaa !0
  %add.ptr105 = getelementptr inbounds i32, ptr %3, i64 %4
  %sub.ptr.lhs.cast.i.i.i.i481 = ptrtoint ptr %add.ptr105 to i64
  %sub.ptr.sub.i.i.i.i483 = sub i64 %sub.ptr.lhs.cast.i.i.i.i481, %sub.ptr.rhs.cast.i.i.i.i482
  %sub.ptr.div.i.i.i.i = lshr exact i64 %sub.ptr.sub.i.i.i.i483, %0
  %shr.i.i = lshr i64 %sub.ptr.div.i.i.i.i, %1
  %incdec.ptr4.sink.i.i.i.i = getelementptr inbounds i32, ptr %add.ptr, i64 %shr.i.i
  %5 = load i32, ptr %incdec.ptr4.sink.i.i.i.i, align 4, !tbaa !10
  ret i32 %5
}

define i64 @"388"(i64 %0, ptr %offsets, ptr %num_nodes_.i, i64 %1) {
bb:
  %2 = load i64, ptr %num_nodes_.i, align 8, !tbaa !90
  %3 = and i64 %2, %1
  %4 = load ptr, ptr %offsets, align 8
  %arrayidx.i453672 = getelementptr inbounds i64, ptr %4, i64 %3
  store i64 %0, ptr %arrayidx.i453672, align 8, !tbaa !0
  ret i64 %0
}

define ptr @"390"(ptr %0, ptr %1, i64 %2, i1 %cmp7.i.i.i.i, ptr %arrayidx.i, ptr %__seqs_begin.coerce, i64 %3, ptr %__begin2.__begin1.i.i) {
bb:
  %4 = load ptr, ptr %arrayidx.i, align 8, !tbaa !23
  %5 = load ptr, ptr %__seqs_begin.coerce, align 8, !tbaa !23
  %6 = load i64, ptr %1, align 4
  %__element1.sroa.6.0.extract.shift.i.i = lshr i64 %6, %2
  %__element1.sroa.6.0.extract.trunc.i.i = trunc i64 %__element1.sroa.6.0.extract.shift.i.i to i32
  %7 = load i64, ptr %0, align 4
  %__element2.sroa.5.0.extract.shift.i.i = lshr i64 %7, %2
  %__element2.sroa.5.0.extract.trunc.i.i = trunc i64 %__element2.sroa.5.0.extract.shift.i.i to i32
  %cmp4.i.i.i.i = icmp slt i32 %__element2.sroa.5.0.extract.trunc.i.i, %__element1.sroa.6.0.extract.trunc.i.i
  %__element2.sroa.0.0.extract.trunc.i.i = trunc i64 %7 to i32
  %__element1.sroa.0.0.extract.trunc.i.i = trunc i64 %6 to i32
  %cmp.i.i.i.i = icmp eq i32 %__element2.sroa.0.0.extract.trunc.i.i, %__element1.sroa.0.0.extract.trunc.i.i
  %cond.i.i.i.i = select i1 %cmp.i.i.i.i, i1 %cmp4.i.i.i.i, i1 %cmp7.i.i.i.i
  %..i.i = select i1 %cond.i.i.i.i, ptr %0, ptr %5
  %add.ptr.i.i = getelementptr inbounds %struct.EdgePair, ptr %..i.i, i64 %3
  store ptr %add.ptr.i.i, ptr %__begin2.__begin1.i.i, align 8, !tbaa !23
  ret ptr %add.ptr.i.i
}

define i32 @"391"(ptr %_M_source.i116, ptr %_M_losers.i.i, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !59
  %_M_source28.i177 = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<EdgePair<int>, std::less<EdgePair<int>>>::_Loser", ptr %2, i64 %0, i32 1
  %3 = load i32, ptr %_M_source.i116, align 4, !tbaa !93
  store i32 %3, ptr %_M_source28.i177, align 4, !tbaa !93
  ret i32 %3
}

define i64 @"392"(ptr %0, ptr %1, ptr %2) {
bb:
  %3 = load ptr, ptr %2, align 8
  %4 = load i64, ptr %1, align 8, !tbaa !0
  %5 = load i64, ptr %0, align 8, !tbaa !0
  %add = add i64 %5, %4
  store i64 %add, ptr %1, align 8, !tbaa !0
  ret i64 %add
}

define ptr @"393"(ptr %call.i3539, ptr %num_blocks, i64 %0, ptr %end_size_.i37) {
bb:
  %1 = load i64, ptr %num_blocks, align 8, !tbaa !0
  %add1 = add i64 %1, %0
  %add.ptr.i36 = getelementptr inbounds i64, ptr %call.i3539, i64 %add1
  store ptr %add.ptr.i36, ptr %end_size_.i37, align 8, !tbaa !73
  ret ptr %add.ptr.i36
}

define <2 x i64> @"394"(ptr %__first, <2 x i64> %0) {
bb:
  %1 = load <2 x i64>, ptr %__first, align 4
  %2 = shufflevector <2 x i64> %1, <2 x i64> %0, <2 x i32> <i32 1, i32 0>
  store <2 x i64> %2, ptr %__first, align 4
  ret <2 x i64> %2
}

define i64 @"395"(ptr %offsets, ptr %.omp.lb) {
bb:
  %0 = load ptr, ptr %offsets, align 8, !tbaa !4
  %1 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %2 = sext i32 %1 to i64
  %arrayidx.i = getelementptr inbounds i64, ptr %0, i64 %2
  %3 = load i64, ptr %arrayidx.i, align 8, !tbaa !0
  ret i64 %3
}

define ptr @"396"(ptr %arrayidx.i117, i64 %0, ptr %__seqs_begin.coerce, ptr %_M_source.i116) {
bb:
  %1 = load ptr, ptr %arrayidx.i117, align 8, !tbaa !96
  %incdec.ptr = getelementptr inbounds %struct.EdgePair, ptr %1, i64 %0
  %2 = load i32, ptr %_M_source.i116, align 4, !tbaa !93
  %conv36 = sext i32 %2 to i64
  %arrayidx.i1172 = getelementptr inbounds %"struct.std::pair.176", ptr %__seqs_begin.coerce, i64 %conv36
  store ptr %incdec.ptr, ptr %arrayidx.i117, align 8, !tbaa !96
  ret ptr %incdec.ptr
}

define i32 @"397"(ptr %init_val, ptr %this, ptr %.omp.lb, i64 %0) {
bb:
  %1 = load i32, ptr %init_val, align 4, !tbaa !10
  %2 = load i64, ptr %.omp.lb, align 8, !tbaa !0
  %add7 = add i64 %2, %0
  %3 = load ptr, ptr %this, align 8, !tbaa !9
  %add.ptr.1 = getelementptr inbounds i32, ptr %3, i64 %add7
  store i32 %1, ptr %add.ptr.1, align 4, !tbaa !10
  ret i32 %1
}

define <2 x i64> @"398"(ptr %offsets, ptr %num_nodes_.i, i64 %0, i64 %index710, i64 %1) {
bb:
  %2 = load ptr, ptr %offsets, align 8
  %3 = load i64, ptr %num_nodes_.i, align 8, !tbaa !90
  %4 = and i64 %3, %0
  %offset.idx = sub i64 %4, %index710
  %5 = add nuw i64 %offset.idx, %0
  %6 = and i64 %5, %0
  %7 = getelementptr inbounds i64, ptr %2, i64 %6
  %8 = getelementptr inbounds i64, ptr %7, i64 %1
  %wide.load = load <2 x i64>, ptr %8, align 8, !tbaa !0
  ret <2 x i64> %wide.load
}

define ptr @"399"(ptr %out_index_.i, ptr %arrayidx.i7, i64 %0, i64 %1, i64 %2, i64 %3, i64 %xor.i, i64 %4, i64 %5, i64 %xor4.i, i64 %6, ptr %mod_.i) {
bb:
  %7 = load ptr, ptr %out_index_.i, align 8, !tbaa !135
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
  %9 = load i32, ptr %mod_.i, align 4, !tbaa !118
  %rem.i = urem i32 %conv7.i, %9
  %idxprom3.i = sext i32 %rem.i to i64
  %arrayidx4.i = getelementptr inbounds ptr, ptr %7, i64 %idxprom3.i
  %10 = load ptr, ptr %arrayidx4.i, align 8, !tbaa !23
  ret ptr %10
}

define <4 x i32> @"400"(ptr %0, ptr %call148, ptr %arrayidx.i495, i64 %1, i64 %index740, i64 %2) {
bb:
  %3 = load i64, ptr %arrayidx.i495, align 8, !tbaa !0
  %sub159 = add nsw i64 %3, %1
  %offset.idx741 = sub i64 %sub159, %index740
  %4 = getelementptr inbounds i32, ptr %call148, i64 %offset.idx741
  %5 = getelementptr inbounds i32, ptr %4, i64 %2
  %wide.load743 = load <4 x i32>, ptr %0, align 4, !tbaa !10
  store <4 x i32> %wide.load743, ptr %5, align 4, !tbaa !10
  ret <4 x i32> %wide.load743
}

define i64 @"401"(ptr %_M_losers, i64 %idxprom5) {
bb:
  %0 = load ptr, ptr %_M_losers, align 8, !tbaa !121
  %arrayidx6 = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<std::pair<long, int>, std::greater<std::pair<long, int>>>::_Loser", ptr %0, i64 %idxprom5
  %1 = load i64, ptr %arrayidx6, align 8
  ret i64 %1
}

define ptr @"402"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, ptr %.omp.lb) {
bb:
  %1 = load i8, ptr %transpose, align 1, !tbaa !19, !range !21, !noundef !22
  %tobool.not = icmp eq i8 %1, %0
  %2 = load ptr, ptr %in_index_.i, align 8
  %3 = load ptr, ptr %out_index_.i, align 8
  %.pn = select i1 %tobool.not, ptr %3, ptr %2
  %4 = load i32, ptr %.omp.lb, align 4, !tbaa !10
  %5 = sext i32 %4 to i64
  %n_start.0.in = getelementptr inbounds ptr, ptr %.pn, i64 %5
  %n_start.0 = load ptr, ptr %n_start.0.in, align 8, !tbaa !23
  ret ptr %n_start.0
}

define i8 @"403"(i8 %storemerge.i.i, ptr %agg.tmp32, ptr %num_trials_, i32 %0) {
bb:
  %1 = load i32, ptr %num_trials_, align 4, !tbaa !28
  %__val.lobit.i = lshr i32 %1, %0
  %conv5.i = zext i32 %__val.lobit.i to i64
  %2 = load ptr, ptr %agg.tmp32, align 8, !tbaa !37, !alias.scope !25
  %arrayidx.i.i = getelementptr inbounds i8, ptr %2, i64 %conv5.i
  store i8 %storemerge.i.i, ptr %arrayidx.i.i, align 1, !tbaa !24
  ret i8 %storemerge.i.i
}

define <2 x i64> @"404"(ptr %0, <2 x i64> %1, <2 x i64> %vector.recur17, <2 x i64> %2, <2 x i64> %3, ptr %4, <2 x i64> %5, <2 x i64> %6, ptr %udist_, i64 %7, i64 %index15) {
bb:
  %8 = load ptr, ptr %udist_, align 8, !tbaa !68
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

define i64 @"405"(ptr %arrayidx.i489, i64 %total_missing_inv.0596, ptr %arrayidx.i492, ptr %offsets, ptr %num_nodes_.i) {
bb:
  %0 = load i32, ptr %arrayidx.i492, align 4, !tbaa !10
  %conv137 = sext i32 %0 to i64
  %add138 = add nsw i64 %total_missing_inv.0596, %conv137
  %1 = load i64, ptr %arrayidx.i489, align 8, !tbaa !0
  %add144 = add nsw i64 %1, %add138
  %.pre658.pre = load ptr, ptr %offsets, align 8, !tbaa !4
  %.pre656 = load i64, ptr %num_nodes_.i, align 8, !tbaa !90
  %arrayidx.i4892 = getelementptr inbounds i64, ptr %.pre658.pre, i64 %.pre656
  store i64 %add144, ptr %arrayidx.i489, align 8, !tbaa !0
  ret i64 %add144
}

define i64 @"406"(ptr %add.ptr.i.i.i11, ptr %this, ptr %_M_finish.i.i, i64 %0, i64 %sub.ptr.rhs.cast.i.i, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %add.ptr.i.i.i11, align 8, !tbaa !0
  %4 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !46
  %incdec.ptr.i.i = getelementptr inbounds %"struct.std::pair.65", ptr %4, i64 %0
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %incdec.ptr.i.i to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i = sdiv exact i64 %sub.ptr.sub.i.i, %1
  %sub.i = add nsw i64 %sub.ptr.div.i.i, %2
  %.pre = load ptr, ptr %this, align 8, !tbaa !23
  %add.ptr.i26.i.i = getelementptr inbounds %"struct.std::pair.65", ptr %.pre, i64 %sub.i
  store i64 %3, ptr %add.ptr.i26.i.i, align 8, !tbaa !40
  ret i64 %3
}

define ptr @"407"(ptr %arrayidx, ptr %__num_threads, ptr %_M_pieces, i64 %indvars.iv, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %arrayidx, align 8, !tbaa !100
  %.pre = load i16, ptr %__num_threads, align 2, !tbaa !83
  %conv11 = zext i16 %.pre to i64
  %add.ptr.i = getelementptr inbounds %"struct.__gnu_parallel::_Piece", ptr %2, i64 %conv11
  %3 = load ptr, ptr %_M_pieces, align 8, !tbaa !102
  %arrayidx2 = getelementptr inbounds %"class.std::vector", ptr %3, i64 %indvars.iv
  %_M_finish.i.i = getelementptr inbounds %"struct.std::_Vector_base<__gnu_parallel::_Piece<long>, std::allocator<__gnu_parallel::_Piece<long>>>::_Vector_impl_data", ptr %arrayidx, i64 %0, i32 1
  store ptr %add.ptr.i, ptr %_M_finish.i.i, align 8, !tbaa !104
  ret ptr %add.ptr.i
}

define i64 @"408"(ptr %_M_b.i, ptr %__param, i64 %0, ptr %_M_b.i32) {
bb:
  %1 = load i64, ptr %_M_b.i, align 8, !tbaa !146
  %2 = load i64, ptr %__param, align 8, !tbaa !148
  %sub = sub i64 %1, %2
  %div31 = lshr i64 %sub, %0
  store i64 %div31, ptr %_M_b.i32, align 8, !tbaa !146
  ret i64 %div31
}

define i64 @"409"(ptr %arrayidx74.epil, ptr %arrayidx77.epil, ptr %arrayidx81, i64 %indvars.iv218.unr, i32 %0) {
bb:
  %1 = load ptr, ptr %arrayidx81, align 8, !tbaa !100
  %_M_end84.epil = getelementptr inbounds %"struct.__gnu_parallel::_Piece", ptr %1, i64 %indvars.iv218.unr, i32 1
  %2 = load i64, ptr %arrayidx74.epil, align 8, !tbaa !0
  %3 = load i64, ptr %arrayidx77.epil, align 8, !tbaa !0
  %sub78.epil = sub nsw i64 %2, %3
  store i64 %sub78.epil, ptr %_M_end84.epil, align 8, !tbaa !133
  ret i64 %sub78.epil
}

define ptr @"410"(ptr %arrayidx.i, i64 %0) {
bb:
  %1 = load ptr, ptr %arrayidx.i, align 8, !tbaa !42
  %incdec.ptr.i205471 = getelementptr inbounds i64, ptr %1, i64 %0
  %incdec.ptr.i251521 = getelementptr inbounds i64, ptr %incdec.ptr.i205471, i64 %0
  store ptr %incdec.ptr.i251521, ptr %arrayidx.i, align 8, !tbaa !42
  ret ptr %incdec.ptr.i251521
}

define i64 @"411"(ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i.i, ptr %v3.i.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i32, ptr %v.i.i.i.i.i.i, align 4
  %1 = load i32, ptr %v3.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i = icmp slt i32 %0, %1
  %2 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !51
  %3 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !51
  %cmp.i.i.i.i.i.i = icmp eq i32 %2, %3
  %cmp7.i.i.i.i.i.i = icmp slt i32 %2, %3
  %cond.i.i.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i1 %cmp4.i.i.i.i.i.i, i1 %cmp7.i.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr3.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  %4 = load i64, ptr %add.ptr3.i.i.i, align 4
  ret i64 %4
}

define <2 x ptr> @"412"(<2 x ptr> %0, ptr %1, i64 %2, ptr %3, i64 %4, ptr %5) {
bb:
  %6 = load ptr, ptr %1, align 8, !tbaa !12, !alias.scope !149
  %7 = insertelement <2 x ptr> %0, ptr %6, i64 %2
  %8 = load ptr, ptr %3, align 8, !tbaa !12, !alias.scope !149
  %9 = insertelement <2 x ptr> %7, ptr %8, i64 %4
  store <2 x ptr> %9, ptr %5, align 8, !tbaa !23, !alias.scope !152, !noalias !149
  ret <2 x ptr> %9
}

define i64 @"413"(ptr %arrayidx.i52.3, ptr %arrayidx.i52.2, ptr %arrayidx.i52.1, ptr %arrayidx.i52, i64 %total.070, ptr %arrayidx.i51.epil) {
bb:
  %0 = load i64, ptr %arrayidx.i52.2, align 8, !tbaa !0
  %1 = load i64, ptr %arrayidx.i52, align 8, !tbaa !0
  %add4 = add nsw i64 %1, %total.070
  %2 = load i64, ptr %arrayidx.i52.1, align 8, !tbaa !0
  %add4.1 = add nsw i64 %2, %add4
  %add4.2 = add nsw i64 %0, %add4.1
  %3 = load i64, ptr %arrayidx.i52.3, align 8, !tbaa !0
  %add4.3 = add nsw i64 %3, %add4.2
  store i64 %add4.3, ptr %arrayidx.i51.epil, align 8, !tbaa !0
  ret i64 %add4.3
}

define <2 x i64> @"414"(ptr %second10, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load ptr, ptr %second10, align 8, !tbaa !12
  %incdec.ptr.i228488 = getelementptr i64, ptr %3, i64 %0
  %incdec.ptr.i297457 = getelementptr i64, ptr %incdec.ptr.i228488, i64 %0
  %next.gep770 = getelementptr i8, ptr %incdec.ptr.i297457, i64 %1
  %4 = getelementptr i64, ptr %next.gep770, i64 %2
  %wide.load775 = load <2 x i64>, ptr %4, align 8, !tbaa !0
  ret <2 x i64> %wide.load775
}

define i8 @"415"(ptr %arrayidx.i17.i, ptr %ref.tmp, i64 %conv5.i, i64 %idxprom1.i.i) {
bb:
  %0 = load ptr, ptr %ref.tmp, align 8, !tbaa !37, !alias.scope !136
  %arrayidx.i.i = getelementptr inbounds i8, ptr %0, i64 %conv5.i
  %arrayidx2.i.i = getelementptr inbounds i8, ptr %arrayidx.i.i, i64 %idxprom1.i.i
  %1 = load i8, ptr %arrayidx.i17.i, align 1, !tbaa !24, !noalias !136
  store i8 %1, ptr %arrayidx2.i.i, align 1, !tbaa !24
  ret i8 %1
}

define i64 @"416"(ptr %second, ptr %arrayidx.i, i64 %0, ptr %1) {
bb:
  %2 = load ptr, ptr %arrayidx.i, align 8, !tbaa !42
  %sub.ptr.rhs.cast = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %second, align 8, !tbaa !12
  %sub.ptr.lhs.cast = ptrtoint ptr %3 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %cmp4 = icmp sgt i64 %sub.ptr.sub, %0
  %spec.select = select i1 %cmp4, ptr %2, ptr %1
  %4 = load i64, ptr %spec.select, align 8, !tbaa !0
  ret i64 %4
}

define i64 @"417"(ptr %arrayidx.i, i64 %0) {
bb:
  %1 = load ptr, ptr %arrayidx.i, align 8, !tbaa !42
  %incdec.ptr.i251521 = getelementptr inbounds i64, ptr %1, i64 %0
  %2 = load i64, ptr %incdec.ptr.i251521, align 8, !tbaa !0
  ret i64 %2
}

define i64 @"418"(ptr %_M_p, i64 %0) {
bb:
  %1 = load i64, ptr %_M_p, align 8, !tbaa !105
  %inc = add nuw nsw i64 %1, %0
  store i64 %inc, ptr %_M_p, align 8, !tbaa !105
  ret i64 %inc
}

define ptr @"419"(ptr %__seqs_begin.coerce, i64 %__max_length.addr.057.i.i) {
bb:
  %.pre63.i.i = load ptr, ptr %__seqs_begin.coerce, align 8, !tbaa !23
  %add.ptr8.i.i = getelementptr inbounds i64, ptr %.pre63.i.i, i64 %__max_length.addr.057.i.i
  store ptr %add.ptr8.i.i, ptr %__seqs_begin.coerce, align 8, !tbaa !23
  ret ptr %add.ptr8.i.i
}

define ptr @"420"(ptr %new_range.i.i, ptr %0, ptr %end_size_.i, i64 %sub.ptr.rhs.cast, i64 %1, ptr %el) {
bb:
  %.pre.i.i = load ptr, ptr %new_range.i.i, align 8, !tbaa !23
  %2 = load ptr, ptr %end_size_.i, align 8, !tbaa !45
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add.ptr.i = getelementptr inbounds %struct.EdgePair, ptr %0, i64 %sub.ptr.div
  %sub.ptr.lhs.cast11 = ptrtoint ptr %add.ptr.i to i64
  %.pre653 = load ptr, ptr %el, align 8, !tbaa !43
  %.pre669 = ptrtoint ptr %.pre653 to i64
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast11, %.pre669
  %sub.ptr.div14 = ashr exact i64 %sub.ptr.sub13, %1
  %add.ptr.i424 = getelementptr inbounds %struct.EdgePair, ptr %.pre.i.i, i64 %sub.ptr.div14
  store ptr %add.ptr.i424, ptr %end_size_.i, align 8, !tbaa !45
  ret ptr %add.ptr.i424
}

define i64 @"421"(ptr %add.ptr3.i.i.i, ptr %__first, ptr %add.ptr.i.i.i, ptr %add.ptr2.i.i.i, ptr %v.i.i.i.i.i.i, ptr %v3.i.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i) {
bb:
  %0 = load i32, ptr %v.i.i.i.i.i.i, align 4
  %1 = load i32, ptr %v3.i.i.i.i.i.i, align 4
  %cmp4.i.i.i.i.i.i = icmp slt i32 %0, %1
  %2 = load i32, ptr %add.ptr.i.i.i, align 4, !tbaa !51
  %3 = load i32, ptr %add.ptr2.i.i.i, align 4, !tbaa !51
  %cmp.i.i.i.i.i.i = icmp eq i32 %2, %3
  %cmp7.i.i.i.i.i.i = icmp slt i32 %2, %3
  %cond.i.i.i.i.i.i = select i1 %cmp.i.i.i.i.i.i, i1 %cmp4.i.i.i.i.i.i, i1 %cmp7.i.i.i.i.i.i
  %spec.select.i.i.i = select i1 %cond.i.i.i.i.i.i, i64 %sub1.i.i.i, i64 %mul.i.i.i
  %add.ptr4.i.i.i = getelementptr inbounds %struct.EdgePair, ptr %__first, i64 %spec.select.i.i.i
  %4 = load i64, ptr %add.ptr3.i.i.i, align 4
  store i64 %4, ptr %add.ptr4.i.i.i, align 4
  ret i64 %4
}

define ptr @"422"(ptr %transpose, i8 %0, ptr %out_index_.i, ptr %in_index_.i, i64 %1) {
bb:
  %2 = load ptr, ptr %out_index_.i, align 8
  %3 = load ptr, ptr %in_index_.i, align 8
  %4 = load i8, ptr %transpose, align 1, !tbaa !19, !range !21, !noundef !22
  %tobool.not = icmp eq i8 %4, %0
  %.sink = select i1 %tobool.not, ptr %2, ptr %3
  %arrayidx.i.i.i60 = getelementptr inbounds ptr, ptr %.sink, i64 %1
  %n_end.0 = load ptr, ptr %arrayidx.i.i.i60, align 8, !tbaa !23
  ret ptr %n_end.0
}

define i32 @"423"(ptr %num_nodes_.i, i32 %0, i64 %1, i64 %2, i32 %3, i32 %conv14.i.i, ptr %4) {
bb:
  %5 = load i64, ptr %num_nodes_.i, align 8, !tbaa !109
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

define i64 @"424"(ptr %__arbitrary_element.0.lcssa193, ptr %_M_losers.i.i, i64 %0, i32 %1) {
bb:
  %.pre189 = load ptr, ptr %_M_losers.i.i, align 8, !tbaa !53
  %_M_key31.i158 = getelementptr inbounds %"struct.__gnu_parallel::_LoserTreeBase<long, std::less<long>>::_Loser", ptr %.pre189, i64 %0, i32 2
  %2 = load i64, ptr %__arbitrary_element.0.lcssa193, align 8, !tbaa !0
  store i64 %2, ptr %_M_key31.i158, align 8, !tbaa !154
  ret i64 %2
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
!12 = !{!13, !6, i64 8}
!13 = !{!"_ZTSSt4pairIPlS0_E", !6, i64 0, !6, i64 8}
!14 = !{!15}
!15 = distinct !{!15, !16}
!16 = distinct !{!16, !"LVerDomain"}
!17 = !{!18}
!18 = distinct !{!18, !16}
!19 = !{!20, !20, i64 0}
!20 = !{!"bool", !2, i64 0}
!21 = !{i8 0, i8 2}
!22 = !{}
!23 = !{!6, !6, i64 0}
!24 = !{!2, !2, i64 0}
!25 = !{!26}
!26 = distinct !{!26, !27, !"_ZNSt7__cxx119to_stringEi: %agg.result"}
!27 = distinct !{!27, !"_ZNSt7__cxx119to_stringEi"}
!28 = !{!29, !11, i64 156}
!29 = !{!"_ZTS5CLApp", !30, i64 0, !20, i64 155, !11, i64 156, !1, i64 160, !20, i64 168, !20, i64 169}
!30 = !{!"_ZTS6CLBase", !11, i64 8, !6, i64 16, !31, i64 24, !31, i64 56, !33, i64 88, !11, i64 112, !11, i64 116, !31, i64 120, !20, i64 152, !20, i64 153, !20, i64 154}
!31 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !32, i64 0, !1, i64 8, !2, i64 16}
!32 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !6, i64 0}
!33 = !{!"_ZTSSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !34, i64 0}
!34 = !{!"_ZTSSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE", !35, i64 0}
!35 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE12_Vector_implE", !36, i64 0}
!36 = !{!"_ZTSNSt12_Vector_baseINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_Vector_impl_dataE", !6, i64 0, !6, i64 8, !6, i64 16}
!37 = !{!31, !6, i64 0}
!38 = !{!39, !6, i64 0}
!39 = !{!"_ZTS7pvectorISt4pairIliEE", !6, i64 0, !6, i64 8, !6, i64 16}
!40 = !{!41, !1, i64 0}
!41 = !{!"_ZTSSt4pairIliE", !1, i64 0, !11, i64 8}
!42 = !{!13, !6, i64 0}
!43 = !{!44, !6, i64 0}
!44 = !{!"_ZTS7pvectorI8EdgePairIiiEE", !6, i64 0, !6, i64 8, !6, i64 16}
!45 = !{!44, !6, i64 8}
!46 = !{!47, !6, i64 8}
!47 = !{!"_ZTSNSt12_Vector_baseISt4pairIS0_IliElESaIS2_EE17_Vector_impl_dataE", !6, i64 0, !6, i64 8, !6, i64 16}
!48 = !{!49, !6, i64 8}
!49 = !{!"_ZTSN14__gnu_parallel17_PMWMSSortingDataIP8EdgePairIiiEEE", !50, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !6, i64 32, !6, i64 40, !6, i64 48}
!50 = !{!"short", !2, i64 0}
!51 = !{!52, !11, i64 0}
!52 = !{!"_ZTS8EdgePairIiiE", !11, i64 0, !11, i64 4}
!53 = !{!54, !6, i64 16}
!54 = !{!"_ZTSN14__gnu_parallel14_LoserTreeBaseIlSt4lessIlEEE", !11, i64 0, !11, i64 4, !11, i64 8, !11, i64 12, !6, i64 16, !55, i64 24, !20, i64 25}
!55 = !{!"_ZTSSt4lessIlE"}
!56 = !{!57, !11, i64 4}
!57 = !{!"_ZTSN14__gnu_parallel14_LoserTreeBaseIlSt4lessIlEE6_LoserE", !20, i64 0, !11, i64 4, !1, i64 8}
!58 = !{!57, !20, i64 0}
!59 = !{!60, !6, i64 16}
!60 = !{!"_ZTSN14__gnu_parallel14_LoserTreeBaseI8EdgePairIiiESt4lessIS2_EEE", !11, i64 0, !11, i64 4, !11, i64 8, !11, i64 12, !6, i64 16, !61, i64 24, !20, i64 25}
!61 = !{!"_ZTSSt4lessI8EdgePairIiiEE"}
!62 = !{!54, !11, i64 4}
!63 = !{!64, !6, i64 0}
!64 = !{!"_ZTSSt4pairIPS_IliES1_E", !6, i64 0, !6, i64 8}
!65 = !{!41, !11, i64 8}
!66 = !{!64, !6, i64 8}
!67 = !{!31, !1, i64 8}
!68 = !{!69, !6, i64 0}
!69 = !{!"_ZTS7UniDistIiSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EEjE", !6, i64 0, !20, i64 8, !11, i64 12, !11, i64 16}
!70 = !{!71, !11, i64 0}
!71 = !{!"_ZTS10NodeWeightIiiE", !11, i64 0, !11, i64 4}
!72 = !{i64 0, i64 4, !10, i64 4, i64 4, !10}
!73 = !{!5, !6, i64 8}
!74 = !{!75, !6, i64 16}
!75 = !{!"_ZTSN14__gnu_parallel14_LoserTreeBaseIiSt4lessIiEEE", !11, i64 0, !11, i64 4, !11, i64 8, !11, i64 12, !6, i64 16, !76, i64 24, !20, i64 25}
!76 = !{!"_ZTSSt4lessIiE"}
!77 = !{!78, !11, i64 4}
!78 = !{!"_ZTSN14__gnu_parallel14_LoserTreeBaseIiSt4lessIiEE6_LoserE", !20, i64 0, !11, i64 4, !11, i64 8}
!79 = !{!75, !11, i64 4}
!80 = !{!81, !1, i64 4992}
!81 = !{!"_ZTSSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE", !2, i64 0, !1, i64 4992}
!82 = !{!44, !6, i64 16}
!83 = !{!50, !50, i64 0}
!84 = !{!85, !6, i64 0}
!85 = !{!"_ZTSSt4pairIPiS0_E", !6, i64 0, !6, i64 8}
!86 = !{!87, !6, i64 8}
!87 = !{!"_ZTSNSt12_Vector_baseISt4pairIllESaIS1_EE17_Vector_impl_dataE", !6, i64 0, !6, i64 8, !6, i64 16}
!88 = !{!89, !1, i64 8}
!89 = !{!"_ZTSSt4pairIllE", !1, i64 0, !1, i64 8}
!90 = !{!91, !1, i64 16}
!91 = !{!"_ZTS11BuilderBaseIiiiLb1EE", !6, i64 0, !20, i64 8, !20, i64 9, !20, i64 10, !1, i64 16}
!92 = !{i64 0, i64 8, !23}
!93 = !{!94, !11, i64 4}
!94 = !{!"_ZTSN14__gnu_parallel14_LoserTreeBaseI8EdgePairIiiESt4lessIS2_EE6_LoserE", !20, i64 0, !11, i64 4, !52, i64 8}
!95 = !{!60, !11, i64 4}
!96 = !{!97, !6, i64 0}
!97 = !{!"_ZTSSt4pairIP8EdgePairIiiES2_E", !6, i64 0, !6, i64 8}
!98 = !{!99, !6, i64 8}
!99 = !{!"_ZTSNSt12_Vector_baseISt4pairI8EdgePairIiiElESaIS3_EE17_Vector_impl_dataE", !6, i64 0, !6, i64 8, !6, i64 16}
!100 = !{!101, !6, i64 0}
!101 = !{!"_ZTSNSt12_Vector_baseIN14__gnu_parallel6_PieceIlEESaIS2_EE17_Vector_impl_dataE", !6, i64 0, !6, i64 8, !6, i64 16}
!102 = !{!103, !6, i64 48}
!103 = !{!"_ZTSN14__gnu_parallel17_PMWMSSortingDataIPlEE", !50, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !6, i64 32, !6, i64 40, !6, i64 48}
!104 = !{!101, !6, i64 8}
!105 = !{!106, !1, i64 2496}
!106 = !{!"_ZTSSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE", !2, i64 0, !1, i64 2496}
!107 = !{!89, !1, i64 0}
!108 = !{!94, !20, i64 0}
!109 = !{!110, !1, i64 8}
!110 = !{!"_ZTS8CSRGraphIiiLb1EE", !20, i64 0, !1, i64 8, !1, i64 16, !6, i64 24, !6, i64 32, !6, i64 40, !6, i64 48}
!111 = !{!112}
!112 = distinct !{!112, !113, !"_ZN11BuilderBaseIiiiLb1EE11SquishGraphERK8CSRGraphIiiLb1EE: %agg.result"}
!113 = distinct !{!113, !"_ZN11BuilderBaseIiiiLb1EE11SquishGraphERK8CSRGraphIiiLb1EE"}
!114 = !{!87, !6, i64 16}
!115 = !{!116}
!116 = distinct !{!116, !117, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_: %agg.result"}
!117 = distinct !{!117, !"_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_"}
!118 = !{!69, !11, i64 12}
!119 = !{!120, !1, i64 16}
!120 = !{!"_ZTS9GeneratorIiiijLi32ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEE", !11, i64 0, !1, i64 8, !1, i64 16}
!121 = !{!122, !6, i64 16}
!122 = !{!"_ZTSN14__gnu_parallel14_LoserTreeBaseISt4pairIliESt7greaterIS2_EEE", !11, i64 0, !11, i64 4, !11, i64 8, !11, i64 12, !6, i64 16, !123, i64 24, !20, i64 25}
!123 = !{!"_ZTSSt7greaterISt4pairIliEE"}
!124 = distinct !{}
!125 = !{!97, !6, i64 8}
!126 = !{!120, !1, i64 8}
!127 = !{!128}
!128 = distinct !{!128, !129, !"_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm: %agg.result"}
!129 = distinct !{!129, !"_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6substrEmm"}
!130 = !{i64 0, i64 4, !10}
!131 = !{!110, !1, i64 16}
!132 = !{!103, !50, i64 0}
!133 = !{!134, !1, i64 8}
!134 = !{!"_ZTSN14__gnu_parallel6_PieceIlEE", !1, i64 0, !1, i64 8}
!135 = !{!110, !6, i64 24}
!136 = !{!137}
!137 = distinct !{!137, !138, !"_ZNSt7__cxx119to_stringEi: %agg.result"}
!138 = distinct !{!138, !"_ZNSt7__cxx119to_stringEi"}
!139 = !{!47, !6, i64 16}
!140 = !{!141}
!141 = distinct !{!141, !142}
!142 = distinct !{!142, !"LVerDomain"}
!143 = !{!144}
!144 = distinct !{!144, !142}
!145 = !{!101, !6, i64 16}
!146 = !{!147, !1, i64 8}
!147 = !{!"_ZTSNSt24uniform_int_distributionImE10param_typeE", !1, i64 0, !1, i64 8}
!148 = !{!147, !1, i64 0}
!149 = !{!150}
!150 = distinct !{!150, !151}
!151 = distinct !{!151, !"LVerDomain"}
!152 = !{!153}
!153 = distinct !{!153, !151}
!154 = !{!57, !1, i64 8}
