; ModuleID = 'graphs-idioms'
source_filename = "graphs-idioms"
target triple = "riscv64"

%"struct.boost::detail::adj_list_gen<boost::adjacency_list<boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>, boost::no_property, boost::listS>::config::stored_vertex" = type { %"struct.boost::detail::adj_list_gen<boost::adjacency_list<boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>, boost::no_property, boost::listS>::config::rand_stored_vertex" }
%"struct.boost::detail::adj_list_gen<boost::adjacency_list<boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>, boost::no_property, boost::listS>::config::rand_stored_vertex" = type { %"class.std::vector.47", %"struct.boost::property" }
%"class.std::vector.47" = type { %"struct.std::_Vector_base.48" }
%"struct.std::_Vector_base.48" = type { %"struct.std::_Vector_base<boost::detail::stored_edge_property<unsigned long, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, std::allocator<boost::detail::stored_edge_property<unsigned long, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>>>::_Vector_impl" }
%"struct.std::_Vector_base<boost::detail::stored_edge_property<unsigned long, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, std::allocator<boost::detail::stored_edge_property<unsigned long, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>>>::_Vector_impl" = type { %"struct.std::_Vector_base<boost::detail::stored_edge_property<unsigned long, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, std::allocator<boost::detail::stored_edge_property<unsigned long, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>>>::_Vector_impl_data" }
%"struct.std::_Vector_base<boost::detail::stored_edge_property<unsigned long, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, std::allocator<boost::detail::stored_edge_property<unsigned long, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>>>::_Vector_impl_data" = type { ptr, ptr, ptr }
%"struct.boost::property" = type <{ i64, %"struct.boost::no_property", [7 x i8] }>
%"struct.boost::no_property" = type { i8 }
%"struct.boost::unordered::detail::ptr_bucket" = type { ptr }
%"struct.boost::unordered::detail::ptr_node" = type { %"struct.boost::unordered::detail::ptr_bucket", i64, %"struct.boost::unordered::detail::value_base" }
%"struct.boost::unordered::detail::value_base" = type { %"struct.boost::detail::aligned_storage::aligned_storage_imp.63" }
%"struct.boost::detail::aligned_storage::aligned_storage_imp.63" = type { %"union.boost::detail::aligned_storage::aligned_storage_imp<40, 8>::data_t" }
%"union.boost::detail::aligned_storage::aligned_storage_imp<40, 8>::data_t" = type { [40 x i8] }
%"struct.boost::unordered::detail::ptr_node.75" = type { %"struct.boost::unordered::detail::ptr_bucket", i64, %"struct.boost::unordered::detail::value_base.76" }
%"struct.boost::unordered::detail::value_base.76" = type { %"struct.boost::detail::aligned_storage::aligned_storage_imp.77" }
%"struct.boost::detail::aligned_storage::aligned_storage_imp.77" = type { %"union.boost::detail::aligned_storage::aligned_storage_imp<16, 8>::data_t" }
%"union.boost::detail::aligned_storage::aligned_storage_imp<16, 8>::data_t" = type { [16 x i8] }
%"class.boost::detail::stored_edge_property" = type { %"class.boost::detail::stored_edge", %"class.std::unique_ptr" }
%"class.boost::detail::stored_edge" = type { i64 }
%"class.std::unique_ptr" = type { %"struct.std::__uniq_ptr_data" }
%"struct.std::__uniq_ptr_data" = type { %"class.std::__uniq_ptr_impl" }
%"class.std::__uniq_ptr_impl" = type { %"class.std::tuple" }
%"class.std::tuple" = type { %"struct.std::_Tuple_impl" }
%"struct.std::_Tuple_impl" = type { %"struct.std::_Head_base.53" }
%"struct.std::_Head_base.53" = type { ptr }
%"class.std::ios_base" = type { ptr, i64, i64, i32, i32, i32, ptr, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, ptr, %"class.std::locale" }
%"struct.std::ios_base::_Words" = type { ptr, i64 }
%"class.std::locale" = type { ptr }

define ptr @"0"(ptr %m_vertices.i.i, ptr %_M_finish.i.i.i, i64 %0, i64 %1) {
bb:
  %2 = load ptr, ptr %m_vertices.i.i, align 8, !tbaa !0
  %sub.ptr.rhs.cast.i.i.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %_M_finish.i.i.i, align 8, !tbaa !5
  %sub.ptr.lhs.cast.i.i.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i
  %sub.ptr.div.i.i.i.i = sdiv exact i64 %sub.ptr.sub.i.i.i.i, %0
  %n.vec = and i64 %sub.ptr.div.i.i.i.i, %1
  %add.ptr.i.i.i.i545 = getelementptr inbounds %"struct.boost::detail::adj_list_gen<boost::adjacency_list<boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>, boost::no_property, boost::listS>::config::stored_vertex", ptr %2, i64 %n.vec
  %4 = load ptr, ptr %add.ptr.i.i.i.i545, align 8, !tbaa !6
  ret ptr %4
}

define ptr @"1"(ptr %0) {
bb:
  %1 = load ptr, ptr %0, align 8, !tbaa !8
  %2 = load ptr, ptr %1, align 8, !tbaa !8
  ret ptr %2
}

define ptr @"2"(ptr %Q, ptr %_M_map_size.i.i, i64 %add4.i, i64 %0, i64 %add.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_map_size.i.i, align 8, !tbaa !10
  %sub.i = sub i64 %2, %add4.i
  %div88.i = lshr i64 %sub.i, %0
  %3 = load ptr, ptr %Q, align 8, !tbaa !12
  %add.ptr.i150 = getelementptr inbounds ptr, ptr %3, i64 %div88.i
  %add.ptr70.i = getelementptr inbounds ptr, ptr %add.ptr.i150, i64 %add.i
  %add.ptr71.i = getelementptr inbounds ptr, ptr %add.ptr70.i, i64 %1
  %4 = load ptr, ptr %add.ptr71.i, align 8, !tbaa !15
  ret ptr %4
}

define ptr @"3"(ptr %this, ptr %_M_map_size, i64 %add4, i64 %0, i64 %cond, i64 %add, i64 %1, ptr %_M_node) {
bb:
  %2 = load i64, ptr %_M_map_size, align 8, !tbaa !10
  %sub = sub i64 %2, %add4
  %div88 = lshr i64 %sub, %0
  %3 = load ptr, ptr %this, align 8, !tbaa !12
  %add.ptr = getelementptr inbounds ptr, ptr %3, i64 %div88
  %add.ptr9 = getelementptr inbounds ptr, ptr %add.ptr, i64 %cond
  %add.ptr70 = getelementptr inbounds ptr, ptr %add.ptr9, i64 %add
  %add.ptr71 = getelementptr inbounds ptr, ptr %add.ptr70, i64 %1
  store ptr %add.ptr71, ptr %_M_node, align 8, !tbaa !16
  ret ptr %add.ptr71
}

define ptr @"4"(ptr %buckets_, ptr %bucket_count_.i, ptr %incdec.ptr.i.i.i.i.i.i, i64 %0, i64 %1, i64 %mul.i.i.i.i.i.i.i.1, ptr %first.sroa.0.08.i.i.i.i.i, i64 %mul.i.i.i.i.i.i.i, i64 %seed.09.i.i.i.i.i, i64 %2, i64 %3, i64 %not.i.i, i64 %4, i64 %add.i.i, i64 %5, i64 %6, i64 %add4.i.i, i64 %7, i64 %add10.i.i, i64 %8, i64 %9) {
bb:
  %10 = load ptr, ptr %buckets_, align 8, !tbaa !17
  %11 = load i8, ptr %first.sroa.0.08.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i = sext i8 %11 to i64
  %mul.i.i.i.i.i.i.i2 = mul i64 %conv.i.i.i.i.i.i.i.i, %0
  %shr.i.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i.i, %1
  %xor.i.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i.i, %mul.i.i.i.i.i.i.i
  %mul1.i.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i.i, %0
  %xor2.i.i.i.i.i.i.i = xor i64 %mul1.i.i.i.i.i.i.i, %seed.09.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i = mul i64 %xor2.i.i.i.i.i.i.i, %0
  %add.i.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i.i, %2
  %12 = load i8, ptr %incdec.ptr.i.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.1 = sext i8 %12 to i64
  %mul.i.i.i.i.i.i.i.14 = mul i64 %conv.i.i.i.i.i.i.i.i.1, %0
  %shr.i.i.i.i.i.i.i.1 = lshr i64 %mul.i.i.i.i.i.i.i.1, %1
  %xor.i.i.i.i.i.i.i.1 = xor i64 %shr.i.i.i.i.i.i.i.1, %mul.i.i.i.i.i.i.i.1
  %mul1.i.i.i.i.i.i.i.1 = mul i64 %xor.i.i.i.i.i.i.i.1, %0
  %xor2.i.i.i.i.i.i.i.1 = xor i64 %mul1.i.i.i.i.i.i.i.1, %add.i.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i.1 = mul i64 %xor2.i.i.i.i.i.i.i.1, %0
  %add.i.i.i.i.i.i.i.1 = add i64 %mul3.i.i.i.i.i.i.i.1, %2
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.1, %3
  %add.i.i6 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %4
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %5
  %shr5.i.i = lshr i64 %add4.i.i, %6
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %3
  %shr11.i.i = lshr i64 %add10.i.i, %7
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %8
  %13 = load i64, ptr %bucket_count_.i, align 8, !tbaa !23
  %sub.i.i = add i64 %13, %9
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %add.ptr.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %10, i64 %and.i.i
  %add.ptr.i.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %10, i64 %13
  store ptr %add.ptr.i.i, ptr %add.ptr.i, align 8, !tbaa !8
  ret ptr %add.ptr.i.i
}

define ptr @"5"(ptr %n.0.lcssa, ptr %buckets_, ptr %first.sroa.0.08.i.i.i.i.i.unr, i64 %0, i64 %1, i64 %mul.i.i.i.i.i.i.i.epil, i64 %seed.09.i.i.i.i.i.unr, i64 %2, i64 %3, i64 %not.i.i, i64 %4, i64 %add.i.i, i64 %5, i64 %6, i64 %add4.i.i, i64 %7, i64 %add10.i.i, i64 %8, ptr %bucket_count_.i, i64 %9) {
bb:
  %10 = load ptr, ptr %buckets_, align 8, !tbaa !17
  %11 = load i8, ptr %first.sroa.0.08.i.i.i.i.i.unr, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.epil = sext i8 %11 to i64
  %mul.i.i.i.i.i.i.i.epil2 = mul i64 %conv.i.i.i.i.i.i.i.i.epil, %0
  %shr.i.i.i.i.i.i.i.epil = lshr i64 %mul.i.i.i.i.i.i.i.epil, %1
  %xor.i.i.i.i.i.i.i.epil = xor i64 %shr.i.i.i.i.i.i.i.epil, %mul.i.i.i.i.i.i.i.epil
  %mul1.i.i.i.i.i.i.i.epil = mul i64 %xor.i.i.i.i.i.i.i.epil, %0
  %xor2.i.i.i.i.i.i.i.epil = xor i64 %mul1.i.i.i.i.i.i.i.epil, %seed.09.i.i.i.i.i.unr
  %mul3.i.i.i.i.i.i.i.epil = mul i64 %xor2.i.i.i.i.i.i.i.epil, %0
  %add.i.i.i.i.i.i.i.epil = add i64 %mul3.i.i.i.i.i.i.i.epil, %2
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.epil, %3
  %add.i.i4 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %4
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i6 = mul i64 %xor.i.i, %5
  %shr5.i.i = lshr i64 %add4.i.i, %6
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i8 = mul i64 %xor6.i.i, %3
  %shr11.i.i = lshr i64 %add10.i.i, %7
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %8
  %12 = load i64, ptr %bucket_count_.i, align 8, !tbaa !23
  %sub.i.i = add i64 %12, %9
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %add.ptr.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %10, i64 %and.i.i
  %.pre = load ptr, ptr %n.0.lcssa, align 8, !tbaa !8
  store ptr %.pre, ptr %add.ptr.i, align 8, !tbaa !8
  ret ptr %.pre
}

define ptr @"6"(ptr %0, ptr %1) {
bb:
  %2 = load ptr, ptr %1, align 8, !tbaa !8
  %3 = load ptr, ptr %0, align 8, !tbaa !8
  store ptr %3, ptr %2, align 8, !tbaa !8
  ret ptr %3
}

define ptr @"7"(ptr %prev.092, ptr %add.ptr.i) {
bb:
  %0 = load ptr, ptr %add.ptr.i, align 8, !tbaa !8
  %1 = load ptr, ptr %prev.092, align 8, !tbaa !8
  store ptr %1, ptr %0, align 8, !tbaa !8
  ret ptr %1
}

define ptr @"8"(ptr %0, ptr %buckets_, ptr %first.sroa.0.08.i.i.i.i.i.unr, i64 %1, i64 %2, i64 %mul.i.i.i.i.i.i.i.epil, i64 %seed.09.i.i.i.i.i.unr, i64 %3, i64 %4, i64 %not.i.i, i64 %5, i64 %add.i.i, i64 %6, i64 %7, i64 %add4.i.i, i64 %8, i64 %add10.i.i, i64 %9, ptr %bucket_count_.i, i64 %10) {
bb:
  %11 = load ptr, ptr %buckets_, align 8, !tbaa !17
  %12 = load i8, ptr %first.sroa.0.08.i.i.i.i.i.unr, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.epil = sext i8 %12 to i64
  %mul.i.i.i.i.i.i.i.epil2 = mul i64 %conv.i.i.i.i.i.i.i.i.epil, %1
  %shr.i.i.i.i.i.i.i.epil = lshr i64 %mul.i.i.i.i.i.i.i.epil, %2
  %xor.i.i.i.i.i.i.i.epil = xor i64 %shr.i.i.i.i.i.i.i.epil, %mul.i.i.i.i.i.i.i.epil
  %mul1.i.i.i.i.i.i.i.epil = mul i64 %xor.i.i.i.i.i.i.i.epil, %1
  %xor2.i.i.i.i.i.i.i.epil = xor i64 %mul1.i.i.i.i.i.i.i.epil, %seed.09.i.i.i.i.i.unr
  %mul3.i.i.i.i.i.i.i.epil = mul i64 %xor2.i.i.i.i.i.i.i.epil, %1
  %add.i.i.i.i.i.i.i.epil = add i64 %mul3.i.i.i.i.i.i.i.epil, %3
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.epil, %4
  %add.i.i4 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %5
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i6 = mul i64 %xor.i.i, %6
  %shr5.i.i = lshr i64 %add4.i.i, %7
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i8 = mul i64 %xor6.i.i, %4
  %shr11.i.i = lshr i64 %add10.i.i, %8
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %9
  %13 = load i64, ptr %bucket_count_.i, align 8, !tbaa !23
  %sub.i.i = add i64 %13, %10
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %add.ptr.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %11, i64 %and.i.i
  %14 = load ptr, ptr %0, align 8, !tbaa !8
  store ptr %14, ptr %add.ptr.i, align 8, !tbaa !8
  ret ptr %14
}

define ptr @"9"(ptr %m_vertices.i.i, ptr %ei.sroa.0.01105, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %m_vertices.i.i, align 8, !tbaa !0, !noalias !24
  %3 = load i64, ptr %ei.sroa.0.01105, align 8, !tbaa !10, !noalias !25
  %add.ptr.i.i.i719 = getelementptr inbounds %"struct.boost::detail::adj_list_gen<boost::adjacency_list<boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>, boost::no_property, boost::listS>::config::stored_vertex", ptr %2, i64 %3
  %_M_finish.i.i720 = getelementptr inbounds %"struct.std::_Vector_base<boost::detail::stored_edge_property<unsigned long, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, std::allocator<boost::detail::stored_edge_property<unsigned long, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>>>::_Vector_impl_data", ptr %add.ptr.i.i.i719, i64 %0, i32 1
  %4 = load ptr, ptr %_M_finish.i.i720, align 8, !tbaa !15, !noalias !32
  ret ptr %4
}

define ptr @"10"(ptr %call5.i.i4.i.i, ptr %_M_map_size.i.i, i64 %0, i64 %.sroa.speculated.i, ptr %_M_node.i.i.i139, ptr %_M_node.i.i.i, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %_M_map_size.i.i, align 8, !tbaa !10
  %add37.i = add i64 %3, %0
  %add38.i = add i64 %add37.i, %.sroa.speculated.i
  %4 = load ptr, ptr %_M_node.i.i.i139, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i.i.i = ptrtoint ptr %4 to i64
  %5 = load ptr, ptr %_M_node.i.i.i, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i.i = ptrtoint ptr %5 to i64
  %sub.ptr.sub.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i, %sub.ptr.rhs.cast.i.i.i
  %sub.ptr.div.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i, %1
  %add4.i = add nsw i64 %sub.ptr.div.i.i.i, %0
  %sub40.i = sub nsw i64 %add38.i, %add4.i
  %div4187.i = lshr i64 %sub40.i, %2
  %add.ptr42.i = getelementptr inbounds ptr, ptr %call5.i.i4.i.i, i64 %div4187.i
  store ptr %add.ptr42.i, ptr %_M_node.i.i.i, align 8, !tbaa !16
  ret ptr %add.ptr42.i
}

define i64 @"11"(ptr %bucket_count_.i.i.i, i64 %0, ptr %incdec.ptr.i.i.i.i.i.i, i64 %1, i64 %2, i64 %mul.i.i.i.i.i.i.i.1, ptr %first.sroa.0.08.i.i.i.i.i, i64 %mul.i.i.i.i.i.i.i, i64 %seed.09.i.i.i.i.i, i64 %3, i64 %4, i64 %not.i.i, i64 %5, i64 %add.i.i, i64 %6, i64 %7, i64 %add4.i.i, i64 %8, i64 %add10.i.i, i64 %9, i64 %10, ptr %bucket_info_.i.i) {
bb:
  %11 = load i8, ptr %first.sroa.0.08.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i = sext i8 %11 to i64
  %mul.i.i.i.i.i.i.i2 = mul i64 %conv.i.i.i.i.i.i.i.i, %1
  %shr.i.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i.i, %2
  %xor.i.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i.i, %mul.i.i.i.i.i.i.i
  %mul1.i.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i.i, %1
  %xor2.i.i.i.i.i.i.i = xor i64 %mul1.i.i.i.i.i.i.i, %seed.09.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i = mul i64 %xor2.i.i.i.i.i.i.i, %1
  %add.i.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i.i, %3
  %12 = load i8, ptr %incdec.ptr.i.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.1 = sext i8 %12 to i64
  %mul.i.i.i.i.i.i.i.14 = mul i64 %conv.i.i.i.i.i.i.i.i.1, %1
  %shr.i.i.i.i.i.i.i.1 = lshr i64 %mul.i.i.i.i.i.i.i.1, %2
  %xor.i.i.i.i.i.i.i.1 = xor i64 %shr.i.i.i.i.i.i.i.1, %mul.i.i.i.i.i.i.i.1
  %mul1.i.i.i.i.i.i.i.1 = mul i64 %xor.i.i.i.i.i.i.i.1, %1
  %xor2.i.i.i.i.i.i.i.1 = xor i64 %mul1.i.i.i.i.i.i.i.1, %add.i.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i.1 = mul i64 %xor2.i.i.i.i.i.i.i.1, %1
  %add.i.i.i.i.i.i.i.1 = add i64 %mul3.i.i.i.i.i.i.i.1, %3
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.1, %4
  %add.i.i6 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %5
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %6
  %shr5.i.i = lshr i64 %add4.i.i, %7
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %4
  %shr11.i.i = lshr i64 %add10.i.i, %8
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %9
  %13 = load i64, ptr %bucket_count_.i.i.i, align 8, !tbaa !23
  %sub.i.i.i.i = add i64 %13, %0
  %and.i.i.i.i = and i64 %sub.i.i.i.i, %add14.i.i
  %and.i.i.i = and i64 %and.i.i.i.i, %10
  store i64 %and.i.i.i, ptr %bucket_info_.i.i, align 8, !tbaa !35
  ret i64 %and.i.i.i
}

define i8 @"12"(ptr %from_id_str, i64 %0) {
bb:
  %1 = load ptr, ptr %from_id_str, align 8, !tbaa !39
  %incdec.ptr.i.i.i.i.i.i.i.i = getelementptr inbounds i8, ptr %1, i64 %0
  %2 = load i8, ptr %incdec.ptr.i.i.i.i.i.i.i.i, align 1, !tbaa !22
  ret i8 %2
}

define ptr @"13"(ptr %n.0.lcssa, i64 %0, i32 %1) {
bb:
  %.pre = load ptr, ptr %n.0.lcssa, align 8, !tbaa !8
  %value_base_.i.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_node", ptr %.pre, i64 %0, i32 2
  %2 = load ptr, ptr %value_base_.i.i, align 8, !tbaa !39
  ret ptr %2
}

define ptr @"14"(ptr %cond.i65, i64 %.sroa.speculated.i, ptr %_M_finish.i, ptr %this, i64 %0, i64 %sub.ptr.div.i, i1 %cmp9.i, i64 %1, i64 %add.i, ptr %_M_end_of_storage) {
bb:
  %2 = load ptr, ptr %_M_finish.i, align 8, !tbaa !5
  %sub.ptr.lhs.cast.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %this, align 8, !tbaa !0
  %sub.ptr.rhs.cast.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i2 = sdiv exact i64 %sub.ptr.sub.i, %0
  %add.i4 = add i64 %.sroa.speculated.i, %sub.ptr.div.i
  %cmp7.i = icmp ult i64 %add.i, %sub.ptr.div.i
  %or.cond.i = or i1 %cmp7.i, %cmp9.i
  %cond.i = select i1 %or.cond.i, i64 %1, i64 %add.i
  %add.ptr40 = getelementptr inbounds %"struct.boost::detail::adj_list_gen<boost::adjacency_list<boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>, boost::no_property, boost::listS>::config::stored_vertex", ptr %cond.i65, i64 %cond.i
  store ptr %add.ptr40, ptr %_M_end_of_storage, align 8, !tbaa !42
  ret ptr %add.ptr40
}

define i64 @"15"(ptr %second.i.i.i.i, i64 %0, i64 %1, i64 %mul.i.i2.i.i.i.i, ptr %value_base_.i.i, i64 %mul.i.i.i.i.i.i, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %add.i.i, i64 %7, i64 %8, i64 %add4.i.i, i64 %9, i64 %10, i64 %add10.i.i, i64 %11, ptr %bucket_count_.i, i64 %12, i64 %13, ptr %add.ptr.i.i, i64 %14, i32 %15) {
bb:
  %16 = load i64, ptr %second.i.i.i.i, align 8, !tbaa !10
  %mul.i.i2.i.i.i.i2 = mul i64 %16, %0
  %shr.i.i3.i.i.i.i = lshr i64 %mul.i.i2.i.i.i.i, %1
  %xor.i.i4.i.i.i.i = xor i64 %shr.i.i3.i.i.i.i, %mul.i.i2.i.i.i.i
  %mul1.i.i5.i.i.i.i = mul i64 %xor.i.i4.i.i.i.i, %0
  %17 = load i64, ptr %value_base_.i.i, align 8, !tbaa !10
  %mul.i.i.i.i.i.i4 = mul i64 %17, %0
  %shr.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i, %1
  %xor.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i, %mul.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i, %2
  %add.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i, %3
  %xor2.i.i6.i.i.i.i = xor i64 %mul1.i.i5.i.i.i.i, %add.i.i.i.i.i.i
  %not.i.i = mul i64 %xor2.i.i6.i.i.i.i, %4
  %add.i.i6 = add i64 %not.i.i, %5
  %shr.i.i = lshr i64 %add.i.i, %6
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %7
  %shr5.i.i = lshr i64 %add4.i.i, %8
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %9
  %shr11.i.i = lshr i64 %add10.i.i, %10
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %11
  %18 = load i64, ptr %bucket_count_.i, align 8, !tbaa !43
  %sub.i.i = add i64 %18, %12
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %and.i = and i64 %and.i.i, %13
  %19 = load ptr, ptr %add.ptr.i.i, align 8, !tbaa !8
  %bucket_info_ = getelementptr inbounds %"struct.boost::unordered::detail::ptr_node.75", ptr %19, i64 %14, i32 1
  store i64 %and.i, ptr %bucket_info_, align 8, !tbaa !47
  ret i64 %and.i
}

define i8 @"16"(ptr %arrayidx.i74, i32 %0, ptr %ei.sroa.0.0170, i32 %1, i32 %2, i32 %3, i32 %shl8.i95, ptr %data.i73, i64 %4) {
bb:
  %5 = load ptr, ptr %data.i73, align 8, !tbaa !51
  %6 = load i64, ptr %ei.sroa.0.0170, align 8, !tbaa !10, !noalias !24
  %div6.i = lshr i64 %6, %4
  %arrayidx.i742 = getelementptr inbounds i8, ptr %5, i64 %div6.i
  %7 = load i8, ptr %arrayidx.i74, align 1, !tbaa !22
  %conv.i89 = zext i8 %7 to i32
  %call.tr.i76 = trunc i64 %6 to i32
  %8 = shl i32 %call.tr.i76, %1
  %sh_prom.i77 = and i32 %8, %2
  %9 = shl nuw nsw i32 %0, %sh_prom.i77
  %not.i93 = xor i32 %9, %3
  %and.i94 = and i32 %conv.i89, %not.i93
  %or.i96 = or i32 %and.i94, %shl8.i95
  %conv9.i97 = trunc i32 %or.i96 to i8
  store i8 %conv9.i97, ptr %arrayidx.i74, align 1, !tbaa !22
  ret i8 %conv9.i97
}

define ptr @"17"(ptr %buckets_, ptr %bucket_count_.i, ptr %second.i.i.i.i, i64 %0, i64 %1, i64 %mul.i.i2.i.i.i.i, ptr %value_base_.i.i, i64 %mul.i.i.i.i.i.i, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %add.i.i, i64 %7, i64 %8, i64 %add4.i.i, i64 %9, i64 %10, i64 %add10.i.i, i64 %11, i64 %12) {
bb:
  %13 = load ptr, ptr %buckets_, align 8, !tbaa !54
  %14 = load i64, ptr %second.i.i.i.i, align 8, !tbaa !10
  %mul.i.i2.i.i.i.i2 = mul i64 %14, %0
  %shr.i.i3.i.i.i.i = lshr i64 %mul.i.i2.i.i.i.i, %1
  %xor.i.i4.i.i.i.i = xor i64 %shr.i.i3.i.i.i.i, %mul.i.i2.i.i.i.i
  %mul1.i.i5.i.i.i.i = mul i64 %xor.i.i4.i.i.i.i, %0
  %15 = load i64, ptr %value_base_.i.i, align 8, !tbaa !10
  %mul.i.i.i.i.i.i4 = mul i64 %15, %0
  %shr.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i, %1
  %xor.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i, %mul.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i, %2
  %add.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i, %3
  %xor2.i.i6.i.i.i.i = xor i64 %mul1.i.i5.i.i.i.i, %add.i.i.i.i.i.i
  %not.i.i = mul i64 %xor2.i.i6.i.i.i.i, %4
  %add.i.i6 = add i64 %not.i.i, %5
  %shr.i.i = lshr i64 %add.i.i, %6
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %7
  %shr5.i.i = lshr i64 %add4.i.i, %8
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %9
  %shr11.i.i = lshr i64 %add10.i.i, %10
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %11
  %16 = load i64, ptr %bucket_count_.i, align 8, !tbaa !43
  %sub.i.i = add i64 %16, %12
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %add.ptr.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %13, i64 %and.i.i
  %add.ptr.i.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %13, i64 %16
  store ptr %add.ptr.i.i, ptr %add.ptr.i, align 8, !tbaa !8
  ret ptr %add.ptr.i.i
}

define ptr @"18"(ptr %m_vertices.i.i, ptr %_M_finish.i.i.i, i64 %0, i64 %1, i64 %2, i32 %3) {
bb:
  %4 = load ptr, ptr %m_vertices.i.i, align 8, !tbaa !0
  %sub.ptr.rhs.cast.i.i.i.i = ptrtoint ptr %4 to i64
  %5 = load ptr, ptr %_M_finish.i.i.i, align 8, !tbaa !5
  %sub.ptr.lhs.cast.i.i.i.i = ptrtoint ptr %5 to i64
  %sub.ptr.sub.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i, %sub.ptr.rhs.cast.i.i.i.i
  %sub.ptr.div.i.i.i.i = sdiv exact i64 %sub.ptr.sub.i.i.i.i, %0
  %n.vec = and i64 %sub.ptr.div.i.i.i.i, %1
  %add.ptr.i.i.i.i545 = getelementptr inbounds %"struct.boost::detail::adj_list_gen<boost::adjacency_list<boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>, boost::no_property, boost::listS>::config::stored_vertex", ptr %4, i64 %n.vec
  %_M_finish.i.i.i546 = getelementptr inbounds %"struct.std::_Vector_base<boost::detail::stored_edge_property<unsigned long, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, std::allocator<boost::detail::stored_edge_property<unsigned long, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>>>::_Vector_impl_data", ptr %add.ptr.i.i.i.i545, i64 %2, i32 1
  %6 = load ptr, ptr %_M_finish.i.i.i546, align 8, !tbaa !55
  ret ptr %6
}

define i64 @"20"(ptr %_M_finish.i.i, ptr %m_vertices.i, i64 %0, i64 %1, ptr %ref.tmp76) {
bb:
  %2 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !5
  %sub.ptr.lhs.cast.i12.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %m_vertices.i, align 8, !tbaa !0
  %sub.ptr.rhs.cast.i13.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i14.i = sub i64 %sub.ptr.lhs.cast.i12.i, %sub.ptr.rhs.cast.i13.i
  %sub.ptr.div.i15.i = sdiv exact i64 %sub.ptr.sub.i14.i, %0
  %sub6.i = add nsw i64 %sub.ptr.div.i15.i, %1
  store i64 %sub6.i, ptr %ref.tmp76, align 8, !tbaa !56
  ret i64 %sub6.i
}

define i8 @"21"(ptr %from_id_str) {
bb:
  %0 = load ptr, ptr %from_id_str, align 8, !tbaa !39
  %1 = load i8, ptr %0, align 1, !tbaa !22
  ret i8 %1
}

define ptr @"22"(ptr %buckets_.i.i.i, ptr %bucket_count_.i.i.i, i64 %0, ptr %incdec.ptr.i.i.i.i.i.i, i64 %1, i64 %2, i64 %mul.i.i.i.i.i.i.i.1, ptr %first.sroa.0.08.i.i.i.i.i, i64 %mul.i.i.i.i.i.i.i, i64 %seed.09.i.i.i.i.i, i64 %3, i64 %4, i64 %not.i.i, i64 %5, i64 %add.i.i, i64 %6, i64 %7, i64 %add4.i.i, i64 %8, i64 %add10.i.i, i64 %9) {
bb:
  %10 = load ptr, ptr %buckets_.i.i.i, align 8, !tbaa !17
  %11 = load i8, ptr %first.sroa.0.08.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i = sext i8 %11 to i64
  %mul.i.i.i.i.i.i.i2 = mul i64 %conv.i.i.i.i.i.i.i.i, %1
  %shr.i.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i.i, %2
  %xor.i.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i.i, %mul.i.i.i.i.i.i.i
  %mul1.i.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i.i, %1
  %xor2.i.i.i.i.i.i.i = xor i64 %mul1.i.i.i.i.i.i.i, %seed.09.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i = mul i64 %xor2.i.i.i.i.i.i.i, %1
  %add.i.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i.i, %3
  %12 = load i8, ptr %incdec.ptr.i.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.1 = sext i8 %12 to i64
  %mul.i.i.i.i.i.i.i.14 = mul i64 %conv.i.i.i.i.i.i.i.i.1, %1
  %shr.i.i.i.i.i.i.i.1 = lshr i64 %mul.i.i.i.i.i.i.i.1, %2
  %xor.i.i.i.i.i.i.i.1 = xor i64 %shr.i.i.i.i.i.i.i.1, %mul.i.i.i.i.i.i.i.1
  %mul1.i.i.i.i.i.i.i.1 = mul i64 %xor.i.i.i.i.i.i.i.1, %1
  %xor2.i.i.i.i.i.i.i.1 = xor i64 %mul1.i.i.i.i.i.i.i.1, %add.i.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i.1 = mul i64 %xor2.i.i.i.i.i.i.i.1, %1
  %add.i.i.i.i.i.i.i.1 = add i64 %mul3.i.i.i.i.i.i.i.1, %3
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.1, %4
  %add.i.i6 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %5
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %6
  %shr5.i.i = lshr i64 %add4.i.i, %7
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %4
  %shr11.i.i = lshr i64 %add10.i.i, %8
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %9
  %13 = load i64, ptr %bucket_count_.i.i.i, align 8, !tbaa !23
  %sub.i.i.i.i = add i64 %13, %0
  %and.i.i.i.i = and i64 %sub.i.i.i.i, %add14.i.i
  %add.ptr.i.i.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %10, i64 %and.i.i.i.i
  %add.ptr.i.i.i.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %10, i64 %13
  store ptr %add.ptr.i.i.i.i, ptr %add.ptr.i.i.i, align 8, !tbaa !8
  ret ptr %add.ptr.i.i.i.i
}

define ptr @"23"(ptr %buckets_.i.i.i, ptr %bucket_count_.i.i.i, i64 %0, ptr %first.sroa.0.08.i.i.i.i.i.unr, i64 %1, i64 %2, i64 %mul.i.i.i.i.i.i.i.epil, i64 %seed.09.i.i.i.i.i.unr, i64 %3, i64 %4, i64 %not.i.i, i64 %5, i64 %add.i.i, i64 %6, i64 %7, i64 %add4.i.i, i64 %8, i64 %add10.i.i, i64 %9) {
bb:
  %10 = load i8, ptr %first.sroa.0.08.i.i.i.i.i.unr, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.epil = sext i8 %10 to i64
  %mul.i.i.i.i.i.i.i.epil2 = mul i64 %conv.i.i.i.i.i.i.i.i.epil, %1
  %shr.i.i.i.i.i.i.i.epil = lshr i64 %mul.i.i.i.i.i.i.i.epil, %2
  %xor.i.i.i.i.i.i.i.epil = xor i64 %shr.i.i.i.i.i.i.i.epil, %mul.i.i.i.i.i.i.i.epil
  %mul1.i.i.i.i.i.i.i.epil = mul i64 %xor.i.i.i.i.i.i.i.epil, %1
  %xor2.i.i.i.i.i.i.i.epil = xor i64 %mul1.i.i.i.i.i.i.i.epil, %seed.09.i.i.i.i.i.unr
  %mul3.i.i.i.i.i.i.i.epil = mul i64 %xor2.i.i.i.i.i.i.i.epil, %1
  %add.i.i.i.i.i.i.i.epil = add i64 %mul3.i.i.i.i.i.i.i.epil, %3
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.epil, %4
  %add.i.i4 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %5
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i6 = mul i64 %xor.i.i, %6
  %shr5.i.i = lshr i64 %add4.i.i, %7
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i8 = mul i64 %xor6.i.i, %4
  %shr11.i.i = lshr i64 %add10.i.i, %8
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %9
  %11 = load i64, ptr %bucket_count_.i.i.i, align 8, !tbaa !23
  %sub.i.i.i.i = add i64 %11, %0
  %and.i.i.i.i = and i64 %sub.i.i.i.i, %add14.i.i
  %12 = load ptr, ptr %buckets_.i.i.i, align 8, !tbaa !17
  %add.ptr.i.i.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %12, i64 %and.i.i.i.i
  %add.ptr.i.i.i.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %12, i64 %11
  store ptr %add.ptr.i.i.i.i, ptr %add.ptr.i.i.i, align 8, !tbaa !8
  ret ptr %add.ptr.i.i.i.i
}

define ptr @"24"(ptr %0, ptr %n.0.lcssa) {
bb:
  %.pre = load ptr, ptr %n.0.lcssa, align 8, !tbaa !8
  %1 = load ptr, ptr %0, align 8, !tbaa !8
  store ptr %1, ptr %.pre, align 8, !tbaa !8
  ret ptr %1
}

define ptr @"25"(ptr %_M_finish.i.i.i.i, i64 %0, ptr %m_vertices.i, i64 %u, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %m_vertices.i, align 8, !tbaa !0
  %add.ptr.i.i = getelementptr inbounds %"struct.boost::detail::adj_list_gen<boost::adjacency_list<boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>, boost::no_property, boost::listS>::config::stored_vertex", ptr %3, i64 %u
  %_M_finish.i.i.i.i2 = getelementptr inbounds %"struct.std::_Vector_base<boost::detail::stored_edge_property<unsigned long, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, std::allocator<boost::detail::stored_edge_property<unsigned long, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>>>::_Vector_impl_data", ptr %add.ptr.i.i, i64 %1, i32 1
  %4 = load ptr, ptr %_M_finish.i.i.i.i, align 8, !tbaa !55
  %incdec.ptr.i.i.i.i = getelementptr inbounds %"class.boost::detail::stored_edge_property", ptr %4, i64 %0
  store ptr %incdec.ptr.i.i.i.i, ptr %_M_finish.i.i.i.i, align 8, !tbaa !55
  ret ptr %incdec.ptr.i.i.i.i
}

define i64 @"26"(ptr %_M_finish.i.i.i, ptr %m_vertices.i.i, i64 %0, ptr %agg.tmp) {
bb:
  %1 = load ptr, ptr %m_vertices.i.i, align 8, !tbaa !0
  %sub.ptr.rhs.cast.i.i.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %_M_finish.i.i.i, align 8, !tbaa !5
  %sub.ptr.lhs.cast.i.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i, %sub.ptr.rhs.cast.i.i.i
  %sub.ptr.div.i.i.i = sdiv exact i64 %sub.ptr.sub.i.i.i, %0
  store i64 %sub.ptr.div.i.i.i, ptr %agg.tmp, align 8, !tbaa !58
  ret i64 %sub.ptr.div.i.i.i
}

define ptr @"27"(ptr %call5.i.i4.i.i, ptr %_M_map_size.i.i, i64 %0, i64 %.sroa.speculated.i, ptr %_M_node.i.i.i139, ptr %_M_node.i.i.i, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %_M_map_size.i.i, align 8, !tbaa !10
  %add37.i = add i64 %3, %0
  %add38.i = add i64 %add37.i, %.sroa.speculated.i
  %4 = load ptr, ptr %_M_node.i.i.i139, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i.i.i = ptrtoint ptr %4 to i64
  %5 = load ptr, ptr %_M_node.i.i.i, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i.i = ptrtoint ptr %5 to i64
  %sub.ptr.sub.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i, %sub.ptr.rhs.cast.i.i.i
  %sub.ptr.div.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i, %1
  %add4.i = add nsw i64 %sub.ptr.div.i.i.i, %0
  %sub40.i = sub nsw i64 %add38.i, %add4.i
  %div4187.i = lshr i64 %sub40.i, %2
  %add.ptr42.i = getelementptr inbounds ptr, ptr %call5.i.i4.i.i, i64 %div4187.i
  %6 = load ptr, ptr %add.ptr42.i, align 8, !tbaa !15
  ret ptr %6
}

define ptr @"28"(ptr %buckets_, ptr %bucket_count_.i, ptr %first.sroa.0.08.i.i.i.i.i.unr, i64 %0, i64 %1, i64 %mul.i.i.i.i.i.i.i.epil, i64 %seed.09.i.i.i.i.i.unr, i64 %2, i64 %3, i64 %not.i.i, i64 %4, i64 %add.i.i, i64 %5, i64 %6, i64 %add4.i.i, i64 %7, i64 %add10.i.i, i64 %8, i64 %9) {
bb:
  %10 = load ptr, ptr %buckets_, align 8, !tbaa !17
  %11 = load i8, ptr %first.sroa.0.08.i.i.i.i.i.unr, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.epil = sext i8 %11 to i64
  %mul.i.i.i.i.i.i.i.epil2 = mul i64 %conv.i.i.i.i.i.i.i.i.epil, %0
  %shr.i.i.i.i.i.i.i.epil = lshr i64 %mul.i.i.i.i.i.i.i.epil, %1
  %xor.i.i.i.i.i.i.i.epil = xor i64 %shr.i.i.i.i.i.i.i.epil, %mul.i.i.i.i.i.i.i.epil
  %mul1.i.i.i.i.i.i.i.epil = mul i64 %xor.i.i.i.i.i.i.i.epil, %0
  %xor2.i.i.i.i.i.i.i.epil = xor i64 %mul1.i.i.i.i.i.i.i.epil, %seed.09.i.i.i.i.i.unr
  %mul3.i.i.i.i.i.i.i.epil = mul i64 %xor2.i.i.i.i.i.i.i.epil, %0
  %add.i.i.i.i.i.i.i.epil = add i64 %mul3.i.i.i.i.i.i.i.epil, %2
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.epil, %3
  %add.i.i4 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %4
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i6 = mul i64 %xor.i.i, %5
  %shr5.i.i = lshr i64 %add4.i.i, %6
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i8 = mul i64 %xor6.i.i, %3
  %shr11.i.i = lshr i64 %add10.i.i, %7
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %8
  %12 = load i64, ptr %bucket_count_.i, align 8, !tbaa !23
  %sub.i.i = add i64 %12, %9
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %add.ptr.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %10, i64 %and.i.i
  %add.ptr.i.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %10, i64 %12
  store ptr %add.ptr.i.i, ptr %add.ptr.i, align 8, !tbaa !8
  ret ptr %add.ptr.i.i
}

define i8 @"29"(ptr %data.i, ptr %sources_begin.addr.0168, i64 %0) {
bb:
  %1 = load ptr, ptr %data.i, align 8, !tbaa !51
  %2 = load i64, ptr %sources_begin.addr.0168, align 8, !tbaa !10
  %div22.i = lshr i64 %2, %0
  %arrayidx.i = getelementptr inbounds i8, ptr %1, i64 %div22.i
  %3 = load i8, ptr %arrayidx.i, align 1, !tbaa !22
  ret i8 %3
}

define ptr @"30"(ptr %call5.i.i4.i.i, ptr %_M_map_size.i.i, i64 %0, i64 %.sroa.speculated.i, ptr %_M_node.i.i.i139, ptr %_M_node.i.i.i, i64 %1, i64 %2, i64 %add.i, i64 %3) {
bb:
  %4 = load ptr, ptr %_M_node.i.i.i139, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i.i.i = ptrtoint ptr %4 to i64
  %5 = load ptr, ptr %_M_node.i.i.i, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i.i = ptrtoint ptr %5 to i64
  %sub.ptr.sub.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i, %sub.ptr.rhs.cast.i.i.i
  %sub.ptr.div.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i, %1
  %add4.i = add nsw i64 %sub.ptr.div.i.i.i, %0
  %6 = load i64, ptr %_M_map_size.i.i, align 8, !tbaa !10
  %add37.i = add i64 %6, %0
  %add38.i = add i64 %add37.i, %.sroa.speculated.i
  %sub40.i = sub nsw i64 %add38.i, %add4.i
  %div4187.i = lshr i64 %sub40.i, %2
  %add.ptr42.i = getelementptr inbounds ptr, ptr %call5.i.i4.i.i, i64 %div4187.i
  %add.ptr70.i = getelementptr inbounds ptr, ptr %add.ptr42.i, i64 %add.i
  %add.ptr71.i = getelementptr inbounds ptr, ptr %add.ptr70.i, i64 %3
  store ptr %add.ptr71.i, ptr %_M_node.i.i.i139, align 8, !tbaa !16
  ret ptr %add.ptr71.i
}

define i64 @"31"(ptr %_ZSt4cerr, i64 %0) {
bb:
  %vtable.i = load ptr, ptr %_ZSt4cerr, align 8, !tbaa !61
  %vbase.offset.ptr.i = getelementptr i8, ptr %vtable.i, i64 %0
  %vbase.offset.i = load i64, ptr %vbase.offset.ptr.i, align 8
  ret i64 %vbase.offset.i
}

define i64 @"32"(ptr %size_.i, i64 %0) {
bb:
  %1 = load i64, ptr %size_.i, align 8, !tbaa !63
  %inc.i.i = add i64 %1, %0
  store i64 %inc.i.i, ptr %size_.i, align 8, !tbaa !63
  ret i64 %inc.i.i
}

define ptr @"33"(ptr %call5.i.i.i.i, ptr %call5.i.i4.i.i, ptr %_M_map_size.i.i, i64 %0, i64 %.sroa.speculated.i, ptr %_M_node.i.i.i139, ptr %_M_node.i.i.i, i64 %1, i64 %2, i64 %add.i, i64 %3) {
bb:
  %4 = load ptr, ptr %_M_node.i.i.i139, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i.i.i = ptrtoint ptr %4 to i64
  %5 = load ptr, ptr %_M_node.i.i.i, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i.i = ptrtoint ptr %5 to i64
  %sub.ptr.sub.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i, %sub.ptr.rhs.cast.i.i.i
  %sub.ptr.div.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i, %1
  %add4.i = add nsw i64 %sub.ptr.div.i.i.i, %0
  %6 = load i64, ptr %_M_map_size.i.i, align 8, !tbaa !10
  %add37.i = add i64 %6, %0
  %add38.i = add i64 %add37.i, %.sroa.speculated.i
  %sub40.i = sub nsw i64 %add38.i, %add4.i
  %div4187.i = lshr i64 %sub40.i, %2
  %add.ptr42.i = getelementptr inbounds ptr, ptr %call5.i.i4.i.i, i64 %div4187.i
  %add.ptr70.i = getelementptr inbounds ptr, ptr %add.ptr42.i, i64 %add.i
  %add.ptr71.i = getelementptr inbounds ptr, ptr %add.ptr70.i, i64 %3
  %add.ptr.i = getelementptr inbounds ptr, ptr %add.ptr71.i, i64 %2
  store ptr %call5.i.i.i.i, ptr %add.ptr.i, align 8, !tbaa !15
  ret ptr %call5.i.i.i.i
}

define i64 @"34"(ptr %incdec.ptr.i.i.i.i.i.i, i64 %0, i64 %1, i64 %mul.i.i.i.i.i.i.i.1, ptr %first.sroa.0.08.i.i.i.i.i, i64 %mul.i.i.i.i.i.i.i, i64 %seed.09.i.i.i.i.i, i64 %2, i64 %3, i64 %not.i.i, i64 %4, i64 %add.i.i, i64 %5, i64 %6, i64 %add4.i.i, i64 %7, i64 %add10.i.i, i64 %8, ptr %bucket_count_.i, i64 %9, i64 %10, ptr %11, i64 %12, i32 %13) {
bb:
  %14 = load ptr, ptr %11, align 8, !tbaa !8
  %bucket_info_ = getelementptr inbounds %"struct.boost::unordered::detail::ptr_node", ptr %14, i64 %12, i32 1
  %15 = load i8, ptr %first.sroa.0.08.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i = sext i8 %15 to i64
  %mul.i.i.i.i.i.i.i2 = mul i64 %conv.i.i.i.i.i.i.i.i, %0
  %shr.i.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i.i, %1
  %xor.i.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i.i, %mul.i.i.i.i.i.i.i
  %mul1.i.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i.i, %0
  %xor2.i.i.i.i.i.i.i = xor i64 %mul1.i.i.i.i.i.i.i, %seed.09.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i = mul i64 %xor2.i.i.i.i.i.i.i, %0
  %add.i.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i.i, %2
  %16 = load i8, ptr %incdec.ptr.i.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.1 = sext i8 %16 to i64
  %mul.i.i.i.i.i.i.i.14 = mul i64 %conv.i.i.i.i.i.i.i.i.1, %0
  %shr.i.i.i.i.i.i.i.1 = lshr i64 %mul.i.i.i.i.i.i.i.1, %1
  %xor.i.i.i.i.i.i.i.1 = xor i64 %shr.i.i.i.i.i.i.i.1, %mul.i.i.i.i.i.i.i.1
  %mul1.i.i.i.i.i.i.i.1 = mul i64 %xor.i.i.i.i.i.i.i.1, %0
  %xor2.i.i.i.i.i.i.i.1 = xor i64 %mul1.i.i.i.i.i.i.i.1, %add.i.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i.1 = mul i64 %xor2.i.i.i.i.i.i.i.1, %0
  %add.i.i.i.i.i.i.i.1 = add i64 %mul3.i.i.i.i.i.i.i.1, %2
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.1, %3
  %add.i.i6 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %4
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %5
  %shr5.i.i = lshr i64 %add4.i.i, %6
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %3
  %shr11.i.i = lshr i64 %add10.i.i, %7
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %8
  %17 = load i64, ptr %bucket_count_.i, align 8, !tbaa !23
  %sub.i.i = add i64 %17, %9
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %and.i = and i64 %and.i.i, %10
  store i64 %and.i, ptr %bucket_info_, align 8, !tbaa !35
  ret i64 %and.i
}

define ptr @"35"(ptr %call5.i.i4.i.i, ptr %_M_map_size.i.i, i64 %0, i64 %.sroa.speculated.i, ptr %_M_node.i.i.i139, ptr %_M_node.i.i.i, i64 %1, i64 %2, i64 %add.i, i64 %3) {
bb:
  %4 = load ptr, ptr %_M_node.i.i.i139, align 8, !tbaa !16
  %sub.ptr.lhs.cast.i.i.i = ptrtoint ptr %4 to i64
  %5 = load ptr, ptr %_M_node.i.i.i, align 8, !tbaa !16
  %sub.ptr.rhs.cast.i.i.i = ptrtoint ptr %5 to i64
  %sub.ptr.sub.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i, %sub.ptr.rhs.cast.i.i.i
  %sub.ptr.div.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i, %1
  %add4.i = add nsw i64 %sub.ptr.div.i.i.i, %0
  %6 = load i64, ptr %_M_map_size.i.i, align 8, !tbaa !10
  %add37.i = add i64 %6, %0
  %add38.i = add i64 %add37.i, %.sroa.speculated.i
  %sub40.i = sub nsw i64 %add38.i, %add4.i
  %div4187.i = lshr i64 %sub40.i, %2
  %add.ptr42.i = getelementptr inbounds ptr, ptr %call5.i.i4.i.i, i64 %div4187.i
  %add.ptr70.i = getelementptr inbounds ptr, ptr %add.ptr42.i, i64 %add.i
  %add.ptr71.i = getelementptr inbounds ptr, ptr %add.ptr70.i, i64 %3
  %7 = load ptr, ptr %add.ptr71.i, align 8, !tbaa !15
  ret ptr %7
}

define ptr @"36"(ptr %buckets_.i.i.i, ptr %bucket_count_.i.i.i, i64 %0, ptr %incdec.ptr.i.i.i.i.i.i, i64 %1, i64 %2, i64 %mul.i.i.i.i.i.i.i.1, ptr %first.sroa.0.08.i.i.i.i.i, i64 %mul.i.i.i.i.i.i.i, i64 %seed.09.i.i.i.i.i, i64 %3, i64 %4, i64 %not.i.i, i64 %5, i64 %add.i.i, i64 %6, i64 %7, i64 %add4.i.i, i64 %8, i64 %add10.i.i, i64 %9) {
bb:
  %10 = load ptr, ptr %buckets_.i.i.i, align 8, !tbaa !17
  %11 = load i8, ptr %first.sroa.0.08.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i = sext i8 %11 to i64
  %mul.i.i.i.i.i.i.i2 = mul i64 %conv.i.i.i.i.i.i.i.i, %1
  %shr.i.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i.i, %2
  %xor.i.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i.i, %mul.i.i.i.i.i.i.i
  %mul1.i.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i.i, %1
  %xor2.i.i.i.i.i.i.i = xor i64 %mul1.i.i.i.i.i.i.i, %seed.09.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i = mul i64 %xor2.i.i.i.i.i.i.i, %1
  %add.i.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i.i, %3
  %12 = load i8, ptr %incdec.ptr.i.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.1 = sext i8 %12 to i64
  %mul.i.i.i.i.i.i.i.14 = mul i64 %conv.i.i.i.i.i.i.i.i.1, %1
  %shr.i.i.i.i.i.i.i.1 = lshr i64 %mul.i.i.i.i.i.i.i.1, %2
  %xor.i.i.i.i.i.i.i.1 = xor i64 %shr.i.i.i.i.i.i.i.1, %mul.i.i.i.i.i.i.i.1
  %mul1.i.i.i.i.i.i.i.1 = mul i64 %xor.i.i.i.i.i.i.i.1, %1
  %xor2.i.i.i.i.i.i.i.1 = xor i64 %mul1.i.i.i.i.i.i.i.1, %add.i.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i.1 = mul i64 %xor2.i.i.i.i.i.i.i.1, %1
  %add.i.i.i.i.i.i.i.1 = add i64 %mul3.i.i.i.i.i.i.i.1, %3
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.1, %4
  %add.i.i6 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %5
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %6
  %shr5.i.i = lshr i64 %add4.i.i, %7
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %4
  %shr11.i.i = lshr i64 %add10.i.i, %8
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %9
  %13 = load i64, ptr %bucket_count_.i.i.i, align 8, !tbaa !23
  %sub.i.i.i.i = add i64 %13, %0
  %and.i.i.i.i = and i64 %sub.i.i.i.i, %add14.i.i
  %add.ptr.i.i.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %10, i64 %and.i.i.i.i
  %14 = load ptr, ptr %add.ptr.i.i.i, align 8, !tbaa !8
  ret ptr %14
}

define ptr @"37"(ptr %0, ptr %buckets_, ptr %incdec.ptr.i.i.i.i.i.i, i64 %1, i64 %2, i64 %mul.i.i.i.i.i.i.i.1, ptr %first.sroa.0.08.i.i.i.i.i, i64 %mul.i.i.i.i.i.i.i, i64 %seed.09.i.i.i.i.i, i64 %3, i64 %4, i64 %not.i.i, i64 %5, i64 %add.i.i, i64 %6, i64 %7, i64 %add4.i.i, i64 %8, i64 %add10.i.i, i64 %9, ptr %bucket_count_.i, i64 %10) {
bb:
  %11 = load ptr, ptr %buckets_, align 8, !tbaa !17
  %12 = load i8, ptr %first.sroa.0.08.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i = sext i8 %12 to i64
  %mul.i.i.i.i.i.i.i2 = mul i64 %conv.i.i.i.i.i.i.i.i, %1
  %shr.i.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i.i, %2
  %xor.i.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i.i, %mul.i.i.i.i.i.i.i
  %mul1.i.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i.i, %1
  %xor2.i.i.i.i.i.i.i = xor i64 %mul1.i.i.i.i.i.i.i, %seed.09.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i = mul i64 %xor2.i.i.i.i.i.i.i, %1
  %add.i.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i.i, %3
  %13 = load i8, ptr %incdec.ptr.i.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.1 = sext i8 %13 to i64
  %mul.i.i.i.i.i.i.i.14 = mul i64 %conv.i.i.i.i.i.i.i.i.1, %1
  %shr.i.i.i.i.i.i.i.1 = lshr i64 %mul.i.i.i.i.i.i.i.1, %2
  %xor.i.i.i.i.i.i.i.1 = xor i64 %shr.i.i.i.i.i.i.i.1, %mul.i.i.i.i.i.i.i.1
  %mul1.i.i.i.i.i.i.i.1 = mul i64 %xor.i.i.i.i.i.i.i.1, %1
  %xor2.i.i.i.i.i.i.i.1 = xor i64 %mul1.i.i.i.i.i.i.i.1, %add.i.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i.1 = mul i64 %xor2.i.i.i.i.i.i.i.1, %1
  %add.i.i.i.i.i.i.i.1 = add i64 %mul3.i.i.i.i.i.i.i.1, %3
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.1, %4
  %add.i.i6 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %5
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %6
  %shr5.i.i = lshr i64 %add4.i.i, %7
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %4
  %shr11.i.i = lshr i64 %add10.i.i, %8
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %9
  %14 = load i64, ptr %bucket_count_.i, align 8, !tbaa !23
  %sub.i.i = add i64 %14, %10
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %add.ptr.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %11, i64 %and.i.i
  %15 = load ptr, ptr %0, align 8, !tbaa !8
  store ptr %15, ptr %add.ptr.i, align 8, !tbaa !8
  ret ptr %15
}

define i64 @"38"(ptr %second, ptr %ref.tmp76) {
bb:
  %0 = load i64, ptr %second, align 8, !tbaa !64
  store i64 %0, ptr %ref.tmp76, align 8, !tbaa !56
  ret i64 %0
}

define ptr @"39"(ptr %cond.i65, ptr %_M_finish.i, ptr %this, i64 %0, i64 %__n) {
bb:
  %1 = load ptr, ptr %_M_finish.i, align 8, !tbaa !5
  %sub.ptr.lhs.cast.i = ptrtoint ptr %1 to i64
  %2 = load ptr, ptr %this, align 8, !tbaa !0
  %sub.ptr.rhs.cast.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i
  %sub.ptr.div.i = sdiv exact i64 %sub.ptr.sub.i, %0
  %add.ptr = getelementptr inbounds %"struct.boost::detail::adj_list_gen<boost::adjacency_list<boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>, boost::no_property, boost::listS>::config::stored_vertex", ptr %cond.i65, i64 %sub.ptr.div.i
  %add.ptr37 = getelementptr inbounds %"struct.boost::detail::adj_list_gen<boost::adjacency_list<boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>, boost::no_property, boost::listS>::config::stored_vertex", ptr %add.ptr, i64 %__n
  store ptr %add.ptr37, ptr %_M_finish.i, align 8, !tbaa !5
  ret ptr %add.ptr37
}

define i64 @"40"(ptr %first.sroa.0.08.i.i.i.i.i.unr, i64 %0, i64 %1, i64 %mul.i.i.i.i.i.i.i.epil, i64 %seed.09.i.i.i.i.i.unr, i64 %2, i64 %3, i64 %not.i.i, i64 %4, i64 %add.i.i, i64 %5, i64 %6, i64 %add4.i.i, i64 %7, i64 %add10.i.i, i64 %8, ptr %bucket_count_.i, i64 %9, i64 %10, ptr %11, i64 %12, i32 %13) {
bb:
  %14 = load ptr, ptr %11, align 8, !tbaa !8
  %bucket_info_.i80 = getelementptr inbounds %"struct.boost::unordered::detail::ptr_node", ptr %14, i64 %12, i32 1
  %15 = load i8, ptr %first.sroa.0.08.i.i.i.i.i.unr, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.epil = sext i8 %15 to i64
  %mul.i.i.i.i.i.i.i.epil2 = mul i64 %conv.i.i.i.i.i.i.i.i.epil, %0
  %shr.i.i.i.i.i.i.i.epil = lshr i64 %mul.i.i.i.i.i.i.i.epil, %1
  %xor.i.i.i.i.i.i.i.epil = xor i64 %shr.i.i.i.i.i.i.i.epil, %mul.i.i.i.i.i.i.i.epil
  %mul1.i.i.i.i.i.i.i.epil = mul i64 %xor.i.i.i.i.i.i.i.epil, %0
  %xor2.i.i.i.i.i.i.i.epil = xor i64 %mul1.i.i.i.i.i.i.i.epil, %seed.09.i.i.i.i.i.unr
  %mul3.i.i.i.i.i.i.i.epil = mul i64 %xor2.i.i.i.i.i.i.i.epil, %0
  %add.i.i.i.i.i.i.i.epil = add i64 %mul3.i.i.i.i.i.i.i.epil, %2
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.epil, %3
  %add.i.i4 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %4
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i6 = mul i64 %xor.i.i, %5
  %shr5.i.i = lshr i64 %add4.i.i, %6
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i8 = mul i64 %xor6.i.i, %3
  %shr11.i.i = lshr i64 %add10.i.i, %7
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %8
  %16 = load i64, ptr %bucket_count_.i, align 8, !tbaa !23
  %sub.i.i = add i64 %16, %9
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %or.i = or i64 %and.i.i, %10
  store i64 %or.i, ptr %bucket_info_.i80, align 8, !tbaa !35
  ret i64 %or.i
}

define ptr @"41"(ptr %this, ptr %_M_map_size, i64 %add4, i64 %0, i64 %cond, ptr %_M_node3) {
bb:
  %1 = load i64, ptr %_M_map_size, align 8, !tbaa !10
  %sub = sub i64 %1, %add4
  %div88 = lshr i64 %sub, %0
  %2 = load ptr, ptr %this, align 8, !tbaa !12
  %add.ptr = getelementptr inbounds ptr, ptr %2, i64 %div88
  %add.ptr9 = getelementptr inbounds ptr, ptr %add.ptr, i64 %cond
  store ptr %add.ptr9, ptr %_M_node3, align 8, !tbaa !16
  ret ptr %add.ptr9
}

define ptr @"42"(ptr %buckets_.i.i.i.i, ptr %second.i.i.i.i, i64 %0, i64 %1, i64 %mul.i.i2.i.i.i.i, ptr %k, i64 %mul.i.i.i.i.i.i, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %add.i.i, i64 %7, i64 %8, i64 %add4.i.i, i64 %9, i64 %10, i64 %add10.i.i, i64 %11, ptr %bucket_count_.i.i, i64 %12) {
bb:
  %13 = load ptr, ptr %buckets_.i.i.i.i, align 8, !tbaa !54
  %14 = load i64, ptr %bucket_count_.i.i, align 8, !tbaa !43
  %sub.i.i.i = add i64 %14, %12
  %15 = load i64, ptr %k, align 8, !tbaa !10
  %mul.i.i.i.i.i.i2 = mul i64 %15, %0
  %shr.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i, %1
  %xor.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i, %mul.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i, %2
  %add.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i, %3
  %16 = load i64, ptr %second.i.i.i.i, align 8
  %mul.i.i2.i.i.i.i4 = mul i64 %16, %0
  %shr.i.i3.i.i.i.i = lshr i64 %mul.i.i2.i.i.i.i, %1
  %xor.i.i4.i.i.i.i = xor i64 %shr.i.i3.i.i.i.i, %mul.i.i2.i.i.i.i
  %mul1.i.i5.i.i.i.i = mul i64 %xor.i.i4.i.i.i.i, %0
  %xor2.i.i6.i.i.i.i = xor i64 %mul1.i.i5.i.i.i.i, %add.i.i.i.i.i.i
  %not.i.i = mul i64 %xor2.i.i6.i.i.i.i, %4
  %add.i.i6 = add i64 %not.i.i, %5
  %shr.i.i = lshr i64 %add.i.i, %6
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %7
  %shr5.i.i = lshr i64 %add4.i.i, %8
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %9
  %shr11.i.i = lshr i64 %add10.i.i, %10
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %11
  %and.i.i.i = and i64 %add14.i.i, %sub.i.i.i
  %add.ptr.i.i.i.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %13, i64 %and.i.i.i
  %17 = load ptr, ptr %add.ptr.i.i.i.i, align 8, !tbaa !8
  ret ptr %17
}

define ptr @"43"(ptr %this, ptr %_M_map_size, i64 %add4, i64 %0, i64 %cond) {
bb:
  %1 = load i64, ptr %_M_map_size, align 8, !tbaa !10
  %sub = sub i64 %1, %add4
  %div88 = lshr i64 %sub, %0
  %2 = load ptr, ptr %this, align 8, !tbaa !12
  %add.ptr = getelementptr inbounds ptr, ptr %2, i64 %div88
  %add.ptr9 = getelementptr inbounds ptr, ptr %add.ptr, i64 %cond
  %3 = load ptr, ptr %add.ptr9, align 8, !tbaa !15
  ret ptr %3
}

define i8 @"44"(ptr %from_id_str, i64 %0) {
bb:
  %1 = load ptr, ptr %from_id_str, align 8, !tbaa !39
  %incdec.ptr.i.i.i.i.i.i.i.i.1 = getelementptr inbounds i8, ptr %1, i64 %0
  %2 = load i8, ptr %incdec.ptr.i.i.i.i.i.i.i.i.1, align 1, !tbaa !22
  ret i8 %2
}

define ptr @"45"(ptr %0, ptr %buckets_, ptr %incdec.ptr.i.i.i.i.i.i, i64 %1, i64 %2, i64 %mul.i.i.i.i.i.i.i.1, ptr %first.sroa.0.08.i.i.i.i.i, i64 %mul.i.i.i.i.i.i.i, i64 %seed.09.i.i.i.i.i, i64 %3, i64 %4, i64 %not.i.i, i64 %5, i64 %add.i.i, i64 %6, i64 %7, i64 %add4.i.i, i64 %8, i64 %add10.i.i, i64 %9, ptr %bucket_count_.i, i64 %10) {
bb:
  %11 = load ptr, ptr %buckets_, align 8, !tbaa !17
  %12 = load i8, ptr %first.sroa.0.08.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i = sext i8 %12 to i64
  %mul.i.i.i.i.i.i.i2 = mul i64 %conv.i.i.i.i.i.i.i.i, %1
  %shr.i.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i.i, %2
  %xor.i.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i.i, %mul.i.i.i.i.i.i.i
  %mul1.i.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i.i, %1
  %xor2.i.i.i.i.i.i.i = xor i64 %mul1.i.i.i.i.i.i.i, %seed.09.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i = mul i64 %xor2.i.i.i.i.i.i.i, %1
  %add.i.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i.i, %3
  %13 = load i8, ptr %incdec.ptr.i.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.1 = sext i8 %13 to i64
  %mul.i.i.i.i.i.i.i.14 = mul i64 %conv.i.i.i.i.i.i.i.i.1, %1
  %shr.i.i.i.i.i.i.i.1 = lshr i64 %mul.i.i.i.i.i.i.i.1, %2
  %xor.i.i.i.i.i.i.i.1 = xor i64 %shr.i.i.i.i.i.i.i.1, %mul.i.i.i.i.i.i.i.1
  %mul1.i.i.i.i.i.i.i.1 = mul i64 %xor.i.i.i.i.i.i.i.1, %1
  %xor2.i.i.i.i.i.i.i.1 = xor i64 %mul1.i.i.i.i.i.i.i.1, %add.i.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i.1 = mul i64 %xor2.i.i.i.i.i.i.i.1, %1
  %add.i.i.i.i.i.i.i.1 = add i64 %mul3.i.i.i.i.i.i.i.1, %3
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.1, %4
  %add.i.i6 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %5
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %6
  %shr5.i.i = lshr i64 %add4.i.i, %7
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %4
  %shr11.i.i = lshr i64 %add10.i.i, %8
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %9
  %14 = load i64, ptr %bucket_count_.i, align 8, !tbaa !23
  %sub.i.i = add i64 %14, %10
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %add.ptr.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %11, i64 %and.i.i
  %15 = load ptr, ptr %0, align 8, !tbaa !8
  store ptr %15, ptr %add.ptr.i, align 8, !tbaa !8
  ret ptr %15
}

define ptr @"46"(ptr %buckets_.i.i.i, ptr %bucket_count_.i.i435) {
bb:
  %0 = load i64, ptr %bucket_count_.i.i435, align 8, !tbaa !43
  %1 = load ptr, ptr %buckets_.i.i.i, align 8, !tbaa !54
  %add.ptr.i.i.i.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %1, i64 %0
  %2 = load ptr, ptr %add.ptr.i.i.i.i, align 8, !tbaa !8
  ret ptr %2
}

define i64 @"47"(ptr %incdec.ptr.i.i.i.i.i.i, i64 %0, i64 %1, i64 %mul.i.i.i.i.i.i.i.1, ptr %first.sroa.0.08.i.i.i.i.i, i64 %mul.i.i.i.i.i.i.i, i64 %seed.09.i.i.i.i.i, i64 %2, i64 %3, i64 %not.i.i, i64 %4, i64 %add.i.i, i64 %5, i64 %6, i64 %add4.i.i, i64 %7, i64 %add10.i.i, i64 %8, ptr %bucket_count_.i, i64 %9, i64 %10, ptr %11, i64 %12, i32 %13) {
bb:
  %14 = load ptr, ptr %11, align 8, !tbaa !8
  %bucket_info_.i80 = getelementptr inbounds %"struct.boost::unordered::detail::ptr_node", ptr %14, i64 %12, i32 1
  %15 = load i8, ptr %first.sroa.0.08.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i = sext i8 %15 to i64
  %mul.i.i.i.i.i.i.i2 = mul i64 %conv.i.i.i.i.i.i.i.i, %0
  %shr.i.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i.i, %1
  %xor.i.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i.i, %mul.i.i.i.i.i.i.i
  %mul1.i.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i.i, %0
  %xor2.i.i.i.i.i.i.i = xor i64 %mul1.i.i.i.i.i.i.i, %seed.09.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i = mul i64 %xor2.i.i.i.i.i.i.i, %0
  %add.i.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i.i, %2
  %16 = load i8, ptr %incdec.ptr.i.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.1 = sext i8 %16 to i64
  %mul.i.i.i.i.i.i.i.14 = mul i64 %conv.i.i.i.i.i.i.i.i.1, %0
  %shr.i.i.i.i.i.i.i.1 = lshr i64 %mul.i.i.i.i.i.i.i.1, %1
  %xor.i.i.i.i.i.i.i.1 = xor i64 %shr.i.i.i.i.i.i.i.1, %mul.i.i.i.i.i.i.i.1
  %mul1.i.i.i.i.i.i.i.1 = mul i64 %xor.i.i.i.i.i.i.i.1, %0
  %xor2.i.i.i.i.i.i.i.1 = xor i64 %mul1.i.i.i.i.i.i.i.1, %add.i.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i.1 = mul i64 %xor2.i.i.i.i.i.i.i.1, %0
  %add.i.i.i.i.i.i.i.1 = add i64 %mul3.i.i.i.i.i.i.i.1, %2
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.1, %3
  %add.i.i6 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %4
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %5
  %shr5.i.i = lshr i64 %add4.i.i, %6
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %3
  %shr11.i.i = lshr i64 %add10.i.i, %7
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %8
  %17 = load i64, ptr %bucket_count_.i, align 8, !tbaa !23
  %sub.i.i = add i64 %17, %9
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %or.i = or i64 %and.i.i, %10
  store i64 %or.i, ptr %bucket_info_.i80, align 8, !tbaa !35
  ret i64 %or.i
}

define ptr @"48"(ptr %n.0.lcssa) {
bb:
  %.pre = load ptr, ptr %n.0.lcssa, align 8, !tbaa !8
  %0 = load ptr, ptr %.pre, align 8, !tbaa !8
  ret ptr %0
}

define ptr @"49"(ptr %0, ptr %buckets_, ptr %bucket_count_.i) {
bb:
  %1 = load ptr, ptr %0, align 8, !tbaa !8
  %2 = load i64, ptr %bucket_count_.i, align 8, !tbaa !23
  %3 = load ptr, ptr %buckets_, align 8, !tbaa !17
  %add.ptr.i.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %3, i64 %2
  store ptr %1, ptr %add.ptr.i.i, align 8, !tbaa !8
  ret ptr %1
}

define i64 @"50"(ptr %_M_finish.i.i, ptr %m_vertices.i, i64 %0, i64 %1, ptr %second.i) {
bb:
  %2 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !5
  %sub.ptr.lhs.cast.i12.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %m_vertices.i, align 8, !tbaa !0
  %sub.ptr.rhs.cast.i13.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i14.i = sub i64 %sub.ptr.lhs.cast.i12.i, %sub.ptr.rhs.cast.i13.i
  %sub.ptr.div.i15.i = sdiv exact i64 %sub.ptr.sub.i14.i, %0
  %sub6.i = add nsw i64 %sub.ptr.div.i15.i, %1
  store i64 %sub6.i, ptr %second.i, align 8, !tbaa !10
  ret i64 %sub6.i
}

define ptr @"51"(ptr %0) {
bb:
  %1 = load ptr, ptr %0, align 8, !tbaa !8
  %.pre = load ptr, ptr %1, align 8, !tbaa !8
  ret ptr %.pre
}

define i64 @"52"(ptr %__dnew.i.i, ptr %0) {
bb:
  %1 = load i64, ptr %__dnew.i.i, align 8, !tbaa !10
  store i64 %1, ptr %0, align 8, !tbaa !22
  ret i64 %1
}

define ptr @"53"(ptr %this, i64 %__new_size, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %this, align 8, !tbaa !0
  %add.ptr = getelementptr inbounds %"struct.boost::detail::adj_list_gen<boost::adjacency_list<boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>, boost::no_property, boost::listS>::config::stored_vertex", ptr %2, i64 %__new_size
  %_M_finish.i.i.i.i.i.i.i = getelementptr inbounds %"struct.std::_Vector_base<boost::detail::stored_edge_property<unsigned long, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, std::allocator<boost::detail::stored_edge_property<unsigned long, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>>>::_Vector_impl_data", ptr %add.ptr, i64 %0, i32 1
  %3 = load ptr, ptr %_M_finish.i.i.i.i.i.i.i, align 8, !tbaa !55
  ret ptr %3
}

define ptr @"54"(ptr %_M_finish.i, i64 %0) {
bb:
  %1 = load ptr, ptr %_M_finish.i, align 8, !tbaa !5
  %incdec.ptr.i.i.i.prol = getelementptr inbounds %"struct.boost::detail::adj_list_gen<boost::adjacency_list<boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>, boost::no_property, boost::listS>::config::stored_vertex", ptr %1, i64 %0
  store ptr %incdec.ptr.i.i.i.prol, ptr %_M_finish.i, align 8, !tbaa !5
  ret ptr %incdec.ptr.i.i.i.prol
}

define i8 @"55"(i8 %0, ptr %file_path, ptr %__dnew.i.i) {
bb:
  %1 = load i64, ptr %__dnew.i.i, align 8, !tbaa !10
  %2 = load ptr, ptr %file_path, align 8, !tbaa !39
  %arrayidx.i.i.i = getelementptr inbounds i8, ptr %2, i64 %1
  store i8 %0, ptr %arrayidx.i.i.i, align 1, !tbaa !22
  ret i8 %0
}

define i64 @"56"(ptr %first.sroa.0.08.i.i.i.i.i.unr, i64 %0, i64 %1, i64 %mul.i.i.i.i.i.i.i.epil, i64 %seed.09.i.i.i.i.i.unr, i64 %2, i64 %3, i64 %not.i.i, i64 %4, i64 %add.i.i, i64 %5, i64 %6, i64 %add4.i.i, i64 %7, i64 %add10.i.i, i64 %8, ptr %bucket_count_.i, i64 %9, i64 %10, ptr %n.0.lcssa, i64 %11, i32 %12) {
bb:
  %.pre = load ptr, ptr %n.0.lcssa, align 8, !tbaa !8
  %bucket_info_ = getelementptr inbounds %"struct.boost::unordered::detail::ptr_node", ptr %.pre, i64 %11, i32 1
  %13 = load i8, ptr %first.sroa.0.08.i.i.i.i.i.unr, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.epil = sext i8 %13 to i64
  %mul.i.i.i.i.i.i.i.epil2 = mul i64 %conv.i.i.i.i.i.i.i.i.epil, %0
  %shr.i.i.i.i.i.i.i.epil = lshr i64 %mul.i.i.i.i.i.i.i.epil, %1
  %xor.i.i.i.i.i.i.i.epil = xor i64 %shr.i.i.i.i.i.i.i.epil, %mul.i.i.i.i.i.i.i.epil
  %mul1.i.i.i.i.i.i.i.epil = mul i64 %xor.i.i.i.i.i.i.i.epil, %0
  %xor2.i.i.i.i.i.i.i.epil = xor i64 %mul1.i.i.i.i.i.i.i.epil, %seed.09.i.i.i.i.i.unr
  %mul3.i.i.i.i.i.i.i.epil = mul i64 %xor2.i.i.i.i.i.i.i.epil, %0
  %add.i.i.i.i.i.i.i.epil = add i64 %mul3.i.i.i.i.i.i.i.epil, %2
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.epil, %3
  %add.i.i4 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %4
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i6 = mul i64 %xor.i.i, %5
  %shr5.i.i = lshr i64 %add4.i.i, %6
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i8 = mul i64 %xor6.i.i, %3
  %shr11.i.i = lshr i64 %add10.i.i, %7
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %8
  %14 = load i64, ptr %bucket_count_.i, align 8, !tbaa !23
  %sub.i.i = add i64 %14, %9
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %and.i = and i64 %and.i.i, %10
  store i64 %and.i, ptr %bucket_info_, align 8, !tbaa !35
  ret i64 %and.i
}

define ptr @"57"(ptr %0, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %0, align 8, !tbaa !8
  %value_base_.i.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_node", ptr %3, i64 %1, i32 2
  %4 = load ptr, ptr %value_base_.i.i, align 8, !tbaa !39
  ret ptr %4
}

define ptr @"59"(ptr %0, ptr %buckets_, ptr %first.sroa.0.08.i.i.i.i.i.unr, i64 %1, i64 %2, i64 %mul.i.i.i.i.i.i.i.epil, i64 %seed.09.i.i.i.i.i.unr, i64 %3, i64 %4, i64 %not.i.i, i64 %5, i64 %add.i.i, i64 %6, i64 %7, i64 %add4.i.i, i64 %8, i64 %add10.i.i, i64 %9, ptr %bucket_count_.i, i64 %10) {
bb:
  %11 = load ptr, ptr %buckets_, align 8, !tbaa !17
  %12 = load i8, ptr %first.sroa.0.08.i.i.i.i.i.unr, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.epil = sext i8 %12 to i64
  %mul.i.i.i.i.i.i.i.epil2 = mul i64 %conv.i.i.i.i.i.i.i.i.epil, %1
  %shr.i.i.i.i.i.i.i.epil = lshr i64 %mul.i.i.i.i.i.i.i.epil, %2
  %xor.i.i.i.i.i.i.i.epil = xor i64 %shr.i.i.i.i.i.i.i.epil, %mul.i.i.i.i.i.i.i.epil
  %mul1.i.i.i.i.i.i.i.epil = mul i64 %xor.i.i.i.i.i.i.i.epil, %1
  %xor2.i.i.i.i.i.i.i.epil = xor i64 %mul1.i.i.i.i.i.i.i.epil, %seed.09.i.i.i.i.i.unr
  %mul3.i.i.i.i.i.i.i.epil = mul i64 %xor2.i.i.i.i.i.i.i.epil, %1
  %add.i.i.i.i.i.i.i.epil = add i64 %mul3.i.i.i.i.i.i.i.epil, %3
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.epil, %4
  %add.i.i4 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %5
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i6 = mul i64 %xor.i.i, %6
  %shr5.i.i = lshr i64 %add4.i.i, %7
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i8 = mul i64 %xor6.i.i, %4
  %shr11.i.i = lshr i64 %add10.i.i, %8
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %9
  %13 = load i64, ptr %bucket_count_.i, align 8, !tbaa !23
  %sub.i.i = add i64 %13, %10
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %add.ptr.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %11, i64 %and.i.i
  %14 = load ptr, ptr %0, align 8, !tbaa !8
  store ptr %14, ptr %add.ptr.i, align 8, !tbaa !8
  ret ptr %14
}

define ptr @"60"(ptr %0, ptr %1) {
bb:
  %2 = load ptr, ptr %1, align 8, !tbaa !8
  %3 = load ptr, ptr %0, align 8, !tbaa !8
  store ptr %3, ptr %2, align 8, !tbaa !8
  ret ptr %3
}

define ptr @"61"(ptr %buckets_, ptr %bucket_count_.i) {
bb:
  %0 = load i64, ptr %bucket_count_.i, align 8, !tbaa !23
  %1 = load ptr, ptr %buckets_, align 8, !tbaa !17
  %add.ptr.i.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %1, i64 %0
  %2 = load ptr, ptr %add.ptr.i.i, align 8, !tbaa !8
  ret ptr %2
}

define ptr @"62"(ptr %buckets_.i.i.i, ptr %bucket_count_.i, i64 %0, i64 %key_hash) {
bb:
  %1 = load i64, ptr %bucket_count_.i, align 8, !tbaa !23
  %sub.i.i = add i64 %1, %0
  %and.i.i = and i64 %sub.i.i, %key_hash
  %2 = load ptr, ptr %buckets_.i.i.i, align 8, !tbaa !17
  %add.ptr.i.i.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %2, i64 %and.i.i
  %3 = load ptr, ptr %add.ptr.i.i.i, align 8, !tbaa !8
  ret ptr %3
}

define i64 @"63"(ptr %second.i.i.i.i, i64 %0, i64 %1, i64 %mul.i.i2.i.i.i.i, ptr %value_base_.i.i, i64 %mul.i.i.i.i.i.i, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %add.i.i, i64 %7, i64 %8, i64 %add4.i.i, i64 %9, i64 %10, i64 %add10.i.i, i64 %11, ptr %bucket_count_.i, i64 %12, i64 %13, ptr %14, i64 %15, i32 %16) {
bb:
  %17 = load i64, ptr %second.i.i.i.i, align 8, !tbaa !10
  %mul.i.i2.i.i.i.i2 = mul i64 %17, %0
  %shr.i.i3.i.i.i.i = lshr i64 %mul.i.i2.i.i.i.i, %1
  %xor.i.i4.i.i.i.i = xor i64 %shr.i.i3.i.i.i.i, %mul.i.i2.i.i.i.i
  %mul1.i.i5.i.i.i.i = mul i64 %xor.i.i4.i.i.i.i, %0
  %18 = load i64, ptr %value_base_.i.i, align 8, !tbaa !10
  %mul.i.i.i.i.i.i4 = mul i64 %18, %0
  %shr.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i, %1
  %xor.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i, %mul.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i, %2
  %add.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i, %3
  %xor2.i.i6.i.i.i.i = xor i64 %mul1.i.i5.i.i.i.i, %add.i.i.i.i.i.i
  %not.i.i = mul i64 %xor2.i.i6.i.i.i.i, %4
  %add.i.i6 = add i64 %not.i.i, %5
  %shr.i.i = lshr i64 %add.i.i, %6
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %7
  %shr5.i.i = lshr i64 %add4.i.i, %8
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %9
  %shr11.i.i = lshr i64 %add10.i.i, %10
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %11
  %19 = load i64, ptr %bucket_count_.i, align 8, !tbaa !43
  %sub.i.i = add i64 %19, %12
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %and.i = and i64 %and.i.i, %13
  %20 = load ptr, ptr %14, align 8, !tbaa !8
  %bucket_info_ = getelementptr inbounds %"struct.boost::unordered::detail::ptr_node.75", ptr %20, i64 %15, i32 1
  store i64 %and.i, ptr %bucket_info_, align 8, !tbaa !47
  ret i64 %and.i
}

define ptr @"64"(ptr %_M_start.i.i, i64 %0) {
bb:
  %1 = load ptr, ptr %_M_start.i.i, align 8, !tbaa !66
  %incdec.ptr.i.i62 = getelementptr inbounds i64, ptr %1, i64 %0
  store ptr %incdec.ptr.i.i62, ptr %_M_start.i.i, align 8, !tbaa !67
  ret ptr %incdec.ptr.i.i62
}

define i32 @"65"(ptr %arrayidx.i.i.i.i.i, i32 %0, ptr %vis.coerce, ptr %ei.sroa.0.0170) {
bb:
  %1 = load i64, ptr %ei.sroa.0.0170, align 8, !tbaa !10, !noalias !24
  %arrayidx.i6.i.i.i.i = getelementptr inbounds i32, ptr %vis.coerce, i64 %1
  %2 = load i32, ptr %arrayidx.i.i.i.i.i, align 4, !tbaa !68
  %add.i.i.i.i = add nsw i32 %2, %0
  store i32 %add.i.i.i.i, ptr %arrayidx.i6.i.i.i.i, align 4, !tbaa !68
  ret i32 %add.i.i.i.i
}

define i64 @"66"(ptr %second.i.i.i.i, i64 %0, i64 %1, i64 %mul.i.i2.i.i.i.i, ptr %value_base_.i.i, i64 %mul.i.i.i.i.i.i, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %add.i.i, i64 %7, i64 %8, i64 %add4.i.i, i64 %9, i64 %10, i64 %add10.i.i, i64 %11, ptr %bucket_count_.i, i64 %12, i64 %13, ptr %n.0.lcssa, i64 %14, i32 %15) {
bb:
  %16 = load i64, ptr %second.i.i.i.i, align 8, !tbaa !10
  %mul.i.i2.i.i.i.i2 = mul i64 %16, %0
  %shr.i.i3.i.i.i.i = lshr i64 %mul.i.i2.i.i.i.i, %1
  %xor.i.i4.i.i.i.i = xor i64 %shr.i.i3.i.i.i.i, %mul.i.i2.i.i.i.i
  %mul1.i.i5.i.i.i.i = mul i64 %xor.i.i4.i.i.i.i, %0
  %17 = load i64, ptr %value_base_.i.i, align 8, !tbaa !10
  %mul.i.i.i.i.i.i4 = mul i64 %17, %0
  %shr.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i, %1
  %xor.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i, %mul.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i, %2
  %add.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i, %3
  %xor2.i.i6.i.i.i.i = xor i64 %mul1.i.i5.i.i.i.i, %add.i.i.i.i.i.i
  %not.i.i = mul i64 %xor2.i.i6.i.i.i.i, %4
  %add.i.i6 = add i64 %not.i.i, %5
  %shr.i.i = lshr i64 %add.i.i, %6
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %7
  %shr5.i.i = lshr i64 %add4.i.i, %8
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %9
  %shr11.i.i = lshr i64 %add10.i.i, %10
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %11
  %18 = load i64, ptr %bucket_count_.i, align 8, !tbaa !43
  %sub.i.i = add i64 %18, %12
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %and.i = and i64 %and.i.i, %13
  %.pre = load ptr, ptr %n.0.lcssa, align 8, !tbaa !8
  %bucket_info_ = getelementptr inbounds %"struct.boost::unordered::detail::ptr_node.75", ptr %.pre, i64 %14, i32 1
  store i64 %and.i, ptr %bucket_info_, align 8, !tbaa !47
  ret i64 %and.i
}

define ptr @"67"(ptr %Q, ptr %_M_map_size.i.i, i64 %add4.i, i64 %0, ptr %_M_node.i.i.i) {
bb:
  %1 = load i64, ptr %_M_map_size.i.i, align 8, !tbaa !10
  %sub.i = sub i64 %1, %add4.i
  %div88.i = lshr i64 %sub.i, %0
  %2 = load ptr, ptr %Q, align 8, !tbaa !12
  %add.ptr.i150 = getelementptr inbounds ptr, ptr %2, i64 %div88.i
  store ptr %add.ptr.i150, ptr %_M_node.i.i.i, align 8, !tbaa !16
  ret ptr %add.ptr.i150
}

define ptr @"68"(ptr %0, ptr %buckets_, ptr %second.i.i.i.i, i64 %1, i64 %2, i64 %mul.i.i2.i.i.i.i, ptr %value_base_.i.i, i64 %mul.i.i.i.i.i.i, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %add.i.i, i64 %8, i64 %9, i64 %add4.i.i, i64 %10, i64 %11, i64 %add10.i.i, i64 %12, ptr %bucket_count_.i, i64 %13) {
bb:
  %14 = load ptr, ptr %buckets_, align 8, !tbaa !54
  %15 = load i64, ptr %second.i.i.i.i, align 8, !tbaa !10
  %mul.i.i2.i.i.i.i2 = mul i64 %15, %1
  %shr.i.i3.i.i.i.i = lshr i64 %mul.i.i2.i.i.i.i, %2
  %xor.i.i4.i.i.i.i = xor i64 %shr.i.i3.i.i.i.i, %mul.i.i2.i.i.i.i
  %mul1.i.i5.i.i.i.i = mul i64 %xor.i.i4.i.i.i.i, %1
  %16 = load i64, ptr %value_base_.i.i, align 8, !tbaa !10
  %mul.i.i.i.i.i.i4 = mul i64 %16, %1
  %shr.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i, %2
  %xor.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i, %mul.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i, %3
  %add.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i, %4
  %xor2.i.i6.i.i.i.i = xor i64 %mul1.i.i5.i.i.i.i, %add.i.i.i.i.i.i
  %not.i.i = mul i64 %xor2.i.i6.i.i.i.i, %5
  %add.i.i6 = add i64 %not.i.i, %6
  %shr.i.i = lshr i64 %add.i.i, %7
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %8
  %shr5.i.i = lshr i64 %add4.i.i, %9
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %10
  %shr11.i.i = lshr i64 %add10.i.i, %11
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %12
  %17 = load i64, ptr %bucket_count_.i, align 8, !tbaa !43
  %sub.i.i = add i64 %17, %13
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %add.ptr.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %14, i64 %and.i.i
  %18 = load ptr, ptr %0, align 8, !tbaa !8
  store ptr %18, ptr %add.ptr.i, align 8, !tbaa !8
  ret ptr %18
}

define i64 @"69"(ptr %bucket_count_.i.i.i, i64 %0, ptr %first.sroa.0.08.i.i.i.i.i.unr, i64 %1, i64 %2, i64 %mul.i.i.i.i.i.i.i.epil, i64 %seed.09.i.i.i.i.i.unr, i64 %3, i64 %4, i64 %not.i.i, i64 %5, i64 %add.i.i, i64 %6, i64 %7, i64 %add4.i.i, i64 %8, i64 %add10.i.i, i64 %9, i64 %10, ptr %bucket_info_.i.i) {
bb:
  %11 = load i8, ptr %first.sroa.0.08.i.i.i.i.i.unr, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.epil = sext i8 %11 to i64
  %mul.i.i.i.i.i.i.i.epil2 = mul i64 %conv.i.i.i.i.i.i.i.i.epil, %1
  %shr.i.i.i.i.i.i.i.epil = lshr i64 %mul.i.i.i.i.i.i.i.epil, %2
  %xor.i.i.i.i.i.i.i.epil = xor i64 %shr.i.i.i.i.i.i.i.epil, %mul.i.i.i.i.i.i.i.epil
  %mul1.i.i.i.i.i.i.i.epil = mul i64 %xor.i.i.i.i.i.i.i.epil, %1
  %xor2.i.i.i.i.i.i.i.epil = xor i64 %mul1.i.i.i.i.i.i.i.epil, %seed.09.i.i.i.i.i.unr
  %mul3.i.i.i.i.i.i.i.epil = mul i64 %xor2.i.i.i.i.i.i.i.epil, %1
  %add.i.i.i.i.i.i.i.epil = add i64 %mul3.i.i.i.i.i.i.i.epil, %3
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.epil, %4
  %add.i.i4 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %5
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i6 = mul i64 %xor.i.i, %6
  %shr5.i.i = lshr i64 %add4.i.i, %7
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i8 = mul i64 %xor6.i.i, %4
  %shr11.i.i = lshr i64 %add10.i.i, %8
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %9
  %12 = load i64, ptr %bucket_count_.i.i.i, align 8, !tbaa !23
  %sub.i.i.i.i = add i64 %12, %0
  %and.i.i.i.i = and i64 %sub.i.i.i.i, %add14.i.i
  %and.i.i.i = and i64 %and.i.i.i.i, %10
  store i64 %and.i.i.i, ptr %bucket_info_.i.i, align 8, !tbaa !35
  ret i64 %and.i.i.i
}

define ptr @"70"(ptr %this, i64 %__new_size, ptr %_M_finish.i) {
bb:
  %0 = load ptr, ptr %this, align 8, !tbaa !0
  %add.ptr = getelementptr inbounds %"struct.boost::detail::adj_list_gen<boost::adjacency_list<boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>, boost::no_property, boost::listS>::config::stored_vertex", ptr %0, i64 %__new_size
  store ptr %add.ptr, ptr %_M_finish.i, align 8, !tbaa !5
  ret ptr %add.ptr
}

define ptr @"71"(ptr %0, ptr %buckets_, ptr %second.i.i.i.i, i64 %1, i64 %2, i64 %mul.i.i2.i.i.i.i, ptr %value_base_.i.i, i64 %mul.i.i.i.i.i.i, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %add.i.i, i64 %8, i64 %9, i64 %add4.i.i, i64 %10, i64 %11, i64 %add10.i.i, i64 %12, ptr %bucket_count_.i, i64 %13) {
bb:
  %14 = load ptr, ptr %buckets_, align 8, !tbaa !54
  %15 = load i64, ptr %second.i.i.i.i, align 8, !tbaa !10
  %mul.i.i2.i.i.i.i2 = mul i64 %15, %1
  %shr.i.i3.i.i.i.i = lshr i64 %mul.i.i2.i.i.i.i, %2
  %xor.i.i4.i.i.i.i = xor i64 %shr.i.i3.i.i.i.i, %mul.i.i2.i.i.i.i
  %mul1.i.i5.i.i.i.i = mul i64 %xor.i.i4.i.i.i.i, %1
  %16 = load i64, ptr %value_base_.i.i, align 8, !tbaa !10
  %mul.i.i.i.i.i.i4 = mul i64 %16, %1
  %shr.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i, %2
  %xor.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i, %mul.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i, %3
  %add.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i, %4
  %xor2.i.i6.i.i.i.i = xor i64 %mul1.i.i5.i.i.i.i, %add.i.i.i.i.i.i
  %not.i.i = mul i64 %xor2.i.i6.i.i.i.i, %5
  %add.i.i6 = add i64 %not.i.i, %6
  %shr.i.i = lshr i64 %add.i.i, %7
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %8
  %shr5.i.i = lshr i64 %add4.i.i, %9
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %10
  %shr11.i.i = lshr i64 %add10.i.i, %11
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %12
  %17 = load i64, ptr %bucket_count_.i, align 8, !tbaa !43
  %sub.i.i = add i64 %17, %13
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %add.ptr.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %14, i64 %and.i.i
  %18 = load ptr, ptr %0, align 8, !tbaa !8
  store ptr %18, ptr %add.ptr.i, align 8, !tbaa !8
  ret ptr %18
}

define ptr @"72"(ptr %call5.i.i.i, i64 %.sroa.speculated.i, ptr %_M_finish.i.i, ptr %this, i64 %0, i64 %sub.ptr.div.i.i, i1 %cmp9.i, i64 %1, i64 %add.i, ptr %_M_end_of_storage) {
bb:
  %2 = load ptr, ptr %_M_finish.i.i, align 8, !tbaa !55
  %sub.ptr.lhs.cast.i.i = ptrtoint ptr %2 to i64
  %3 = load ptr, ptr %this, align 8, !tbaa !15
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %3 to i64
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i.i2 = ashr exact i64 %sub.ptr.sub.i.i, %0
  %add.i4 = add i64 %.sroa.speculated.i, %sub.ptr.div.i.i
  %cmp7.i = icmp ult i64 %add.i, %sub.ptr.div.i.i
  %or.cond.i = or i1 %cmp7.i, %cmp9.i
  %cond.i = select i1 %or.cond.i, i64 %1, i64 %add.i
  %add.ptr29 = getelementptr inbounds %"class.boost::detail::stored_edge_property", ptr %call5.i.i.i, i64 %cond.i
  store ptr %add.ptr29, ptr %_M_end_of_storage, align 8, !tbaa !70
  ret ptr %add.ptr29
}

define ptr @"73"(ptr %Q, ptr %_M_map_size.i.i, i64 %add4.i, i64 %0, i64 %add.i, i64 %1, ptr %_M_node.i.i.i139) {
bb:
  %2 = load i64, ptr %_M_map_size.i.i, align 8, !tbaa !10
  %sub.i = sub i64 %2, %add4.i
  %div88.i = lshr i64 %sub.i, %0
  %3 = load ptr, ptr %Q, align 8, !tbaa !12
  %add.ptr.i150 = getelementptr inbounds ptr, ptr %3, i64 %div88.i
  %add.ptr70.i = getelementptr inbounds ptr, ptr %add.ptr.i150, i64 %add.i
  %add.ptr71.i = getelementptr inbounds ptr, ptr %add.ptr70.i, i64 %1
  store ptr %add.ptr71.i, ptr %_M_node.i.i.i139, align 8, !tbaa !16
  ret ptr %add.ptr71.i
}

define i64 @"74"(ptr %first.sroa.0.08.i.i.i.i.i.unr, i64 %0, i64 %1, i64 %mul.i.i.i.i.i.i.i.epil, i64 %seed.09.i.i.i.i.i.unr, i64 %2, i64 %3, i64 %not.i.i, i64 %4, i64 %add.i.i, i64 %5, i64 %6, i64 %add4.i.i, i64 %7, i64 %add10.i.i, i64 %8, ptr %bucket_count_.i, i64 %9, i64 %10, ptr %11, i64 %12, i32 %13) {
bb:
  %14 = load ptr, ptr %11, align 8, !tbaa !8
  %bucket_info_ = getelementptr inbounds %"struct.boost::unordered::detail::ptr_node", ptr %14, i64 %12, i32 1
  %15 = load i8, ptr %first.sroa.0.08.i.i.i.i.i.unr, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.epil = sext i8 %15 to i64
  %mul.i.i.i.i.i.i.i.epil2 = mul i64 %conv.i.i.i.i.i.i.i.i.epil, %0
  %shr.i.i.i.i.i.i.i.epil = lshr i64 %mul.i.i.i.i.i.i.i.epil, %1
  %xor.i.i.i.i.i.i.i.epil = xor i64 %shr.i.i.i.i.i.i.i.epil, %mul.i.i.i.i.i.i.i.epil
  %mul1.i.i.i.i.i.i.i.epil = mul i64 %xor.i.i.i.i.i.i.i.epil, %0
  %xor2.i.i.i.i.i.i.i.epil = xor i64 %mul1.i.i.i.i.i.i.i.epil, %seed.09.i.i.i.i.i.unr
  %mul3.i.i.i.i.i.i.i.epil = mul i64 %xor2.i.i.i.i.i.i.i.epil, %0
  %add.i.i.i.i.i.i.i.epil = add i64 %mul3.i.i.i.i.i.i.i.epil, %2
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.epil, %3
  %add.i.i4 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %4
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i6 = mul i64 %xor.i.i, %5
  %shr5.i.i = lshr i64 %add4.i.i, %6
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i8 = mul i64 %xor6.i.i, %3
  %shr11.i.i = lshr i64 %add10.i.i, %7
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %8
  %16 = load i64, ptr %bucket_count_.i, align 8, !tbaa !23
  %sub.i.i = add i64 %16, %9
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %and.i = and i64 %and.i.i, %10
  store i64 %and.i, ptr %bucket_info_, align 8, !tbaa !35
  ret i64 %and.i
}

define ptr @"75"(ptr %n.0.lcssa, ptr %buckets_, ptr %incdec.ptr.i.i.i.i.i.i, i64 %0, i64 %1, i64 %mul.i.i.i.i.i.i.i.1, ptr %first.sroa.0.08.i.i.i.i.i, i64 %mul.i.i.i.i.i.i.i, i64 %seed.09.i.i.i.i.i, i64 %2, i64 %3, i64 %not.i.i, i64 %4, i64 %add.i.i, i64 %5, i64 %6, i64 %add4.i.i, i64 %7, i64 %add10.i.i, i64 %8, ptr %bucket_count_.i, i64 %9) {
bb:
  %10 = load ptr, ptr %buckets_, align 8, !tbaa !17
  %11 = load i8, ptr %first.sroa.0.08.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i = sext i8 %11 to i64
  %mul.i.i.i.i.i.i.i2 = mul i64 %conv.i.i.i.i.i.i.i.i, %0
  %shr.i.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i.i, %1
  %xor.i.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i.i, %mul.i.i.i.i.i.i.i
  %mul1.i.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i.i, %0
  %xor2.i.i.i.i.i.i.i = xor i64 %mul1.i.i.i.i.i.i.i, %seed.09.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i = mul i64 %xor2.i.i.i.i.i.i.i, %0
  %add.i.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i.i, %2
  %12 = load i8, ptr %incdec.ptr.i.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.1 = sext i8 %12 to i64
  %mul.i.i.i.i.i.i.i.14 = mul i64 %conv.i.i.i.i.i.i.i.i.1, %0
  %shr.i.i.i.i.i.i.i.1 = lshr i64 %mul.i.i.i.i.i.i.i.1, %1
  %xor.i.i.i.i.i.i.i.1 = xor i64 %shr.i.i.i.i.i.i.i.1, %mul.i.i.i.i.i.i.i.1
  %mul1.i.i.i.i.i.i.i.1 = mul i64 %xor.i.i.i.i.i.i.i.1, %0
  %xor2.i.i.i.i.i.i.i.1 = xor i64 %mul1.i.i.i.i.i.i.i.1, %add.i.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i.1 = mul i64 %xor2.i.i.i.i.i.i.i.1, %0
  %add.i.i.i.i.i.i.i.1 = add i64 %mul3.i.i.i.i.i.i.i.1, %2
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.1, %3
  %add.i.i6 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %4
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %5
  %shr5.i.i = lshr i64 %add4.i.i, %6
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %3
  %shr11.i.i = lshr i64 %add10.i.i, %7
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %8
  %13 = load i64, ptr %bucket_count_.i, align 8, !tbaa !23
  %sub.i.i = add i64 %13, %9
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %add.ptr.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %10, i64 %and.i.i
  %.pre = load ptr, ptr %n.0.lcssa, align 8, !tbaa !8
  store ptr %.pre, ptr %add.ptr.i, align 8, !tbaa !8
  ret ptr %.pre
}

define ptr @"76"(ptr %buckets_.i.i.i, ptr %bucket_count_.i.i.i, i64 %0, ptr %second.i.i.i.i, i64 %1, i64 %2, i64 %mul.i.i2.i.i.i.i, ptr %k, i64 %mul.i.i.i.i.i.i, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %add.i.i, i64 %8, i64 %9, i64 %add4.i.i, i64 %10, i64 %11, i64 %add10.i.i, i64 %12) {
bb:
  %13 = load i64, ptr %k, align 8, !tbaa !10
  %mul.i.i.i.i.i.i2 = mul i64 %13, %1
  %shr.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i, %2
  %xor.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i, %mul.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i, %3
  %add.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i, %4
  %14 = load i64, ptr %second.i.i.i.i, align 8
  %mul.i.i2.i.i.i.i4 = mul i64 %14, %1
  %shr.i.i3.i.i.i.i = lshr i64 %mul.i.i2.i.i.i.i, %2
  %xor.i.i4.i.i.i.i = xor i64 %shr.i.i3.i.i.i.i, %mul.i.i2.i.i.i.i
  %mul1.i.i5.i.i.i.i = mul i64 %xor.i.i4.i.i.i.i, %1
  %xor2.i.i6.i.i.i.i = xor i64 %mul1.i.i5.i.i.i.i, %add.i.i.i.i.i.i
  %not.i.i = mul i64 %xor2.i.i6.i.i.i.i, %5
  %add.i.i6 = add i64 %not.i.i, %6
  %shr.i.i = lshr i64 %add.i.i, %7
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %8
  %shr5.i.i = lshr i64 %add4.i.i, %9
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %10
  %shr11.i.i = lshr i64 %add10.i.i, %11
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %12
  %15 = load i64, ptr %bucket_count_.i.i.i, align 8, !tbaa !43
  %sub.i.i.i.i17 = add i64 %15, %0
  %and.i.i.i.i18 = and i64 %sub.i.i.i.i17, %add14.i.i
  %16 = load ptr, ptr %buckets_.i.i.i, align 8, !tbaa !54
  %add.ptr.i.i.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %16, i64 %and.i.i.i.i18
  %add.ptr.i.i.i.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %16, i64 %15
  store ptr %add.ptr.i.i.i.i, ptr %add.ptr.i.i.i, align 8, !tbaa !8
  ret ptr %add.ptr.i.i.i.i
}

define ptr @"77"(ptr %0, ptr %n.0.lcssa) {
bb:
  %1 = load ptr, ptr %0, align 8, !tbaa !8
  %.pre = load ptr, ptr %n.0.lcssa, align 8, !tbaa !8
  store ptr %1, ptr %.pre, align 8, !tbaa !8
  ret ptr %1
}

define ptr @"78"(ptr %Q, ptr %_M_map_size.i.i, i64 %add4.i, i64 %0) {
bb:
  %1 = load i64, ptr %_M_map_size.i.i, align 8, !tbaa !10
  %sub.i = sub i64 %1, %add4.i
  %div88.i = lshr i64 %sub.i, %0
  %2 = load ptr, ptr %Q, align 8, !tbaa !12
  %add.ptr.i150 = getelementptr inbounds ptr, ptr %2, i64 %div88.i
  %3 = load ptr, ptr %add.ptr.i150, align 8, !tbaa !15
  ret ptr %3
}

define ptr @"79"(ptr %call5.i.i.i.i, ptr %Q, ptr %_M_map_size.i.i, i64 %add4.i, i64 %0, i64 %add.i, i64 %1) {
bb:
  %2 = load i64, ptr %_M_map_size.i.i, align 8, !tbaa !10
  %sub.i = sub i64 %2, %add4.i
  %div88.i = lshr i64 %sub.i, %0
  %3 = load ptr, ptr %Q, align 8, !tbaa !12
  %add.ptr.i150 = getelementptr inbounds ptr, ptr %3, i64 %div88.i
  %add.ptr70.i = getelementptr inbounds ptr, ptr %add.ptr.i150, i64 %add.i
  %add.ptr71.i = getelementptr inbounds ptr, ptr %add.ptr70.i, i64 %1
  %add.ptr.i = getelementptr inbounds ptr, ptr %add.ptr71.i, i64 %0
  store ptr %call5.i.i.i.i, ptr %add.ptr.i, align 8, !tbaa !15
  ret ptr %call5.i.i.i.i
}

define ptr @"80"(ptr %this, i64 %__new_size) {
bb:
  %0 = load ptr, ptr %this, align 8, !tbaa !0
  %add.ptr = getelementptr inbounds %"struct.boost::detail::adj_list_gen<boost::adjacency_list<boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>>, boost::vecS, boost::vecS, boost::directedS, boost::property<boost::vertex_index_t, unsigned long>, boost::property<boost::edge_index_t, std::__cxx11::basic_string<char>>, boost::no_property, boost::listS>::config::stored_vertex", ptr %0, i64 %__new_size
  %1 = load ptr, ptr %add.ptr, align 8, !tbaa !6
  ret ptr %1
}

define ptr @"81"(ptr %_M_ctype.i.i) {
bb:
  %0 = load ptr, ptr %_M_ctype.i.i, align 8, !tbaa !71
  %vtable.i.i.i = load ptr, ptr %0, align 8, !tbaa !61
  ret ptr %vtable.i.i.i
}

define i64 @"82"(ptr %incdec.ptr.i.i.i.i.i.i, i64 %0, i64 %1, i64 %mul.i.i.i.i.i.i.i.1, ptr %first.sroa.0.08.i.i.i.i.i, i64 %mul.i.i.i.i.i.i.i, i64 %seed.09.i.i.i.i.i, i64 %2, i64 %3, i64 %not.i.i, i64 %4, i64 %add.i.i, i64 %5, i64 %6, i64 %add4.i.i, i64 %7, i64 %add10.i.i, i64 %8, ptr %bucket_count_.i, i64 %9, i64 %10, ptr %add.ptr.i.i, i64 %11, i32 %12) {
bb:
  %13 = load ptr, ptr %add.ptr.i.i, align 8, !tbaa !8
  %bucket_info_ = getelementptr inbounds %"struct.boost::unordered::detail::ptr_node", ptr %13, i64 %11, i32 1
  %14 = load i8, ptr %first.sroa.0.08.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i = sext i8 %14 to i64
  %mul.i.i.i.i.i.i.i2 = mul i64 %conv.i.i.i.i.i.i.i.i, %0
  %shr.i.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i.i, %1
  %xor.i.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i.i, %mul.i.i.i.i.i.i.i
  %mul1.i.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i.i, %0
  %xor2.i.i.i.i.i.i.i = xor i64 %mul1.i.i.i.i.i.i.i, %seed.09.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i = mul i64 %xor2.i.i.i.i.i.i.i, %0
  %add.i.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i.i, %2
  %15 = load i8, ptr %incdec.ptr.i.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.1 = sext i8 %15 to i64
  %mul.i.i.i.i.i.i.i.14 = mul i64 %conv.i.i.i.i.i.i.i.i.1, %0
  %shr.i.i.i.i.i.i.i.1 = lshr i64 %mul.i.i.i.i.i.i.i.1, %1
  %xor.i.i.i.i.i.i.i.1 = xor i64 %shr.i.i.i.i.i.i.i.1, %mul.i.i.i.i.i.i.i.1
  %mul1.i.i.i.i.i.i.i.1 = mul i64 %xor.i.i.i.i.i.i.i.1, %0
  %xor2.i.i.i.i.i.i.i.1 = xor i64 %mul1.i.i.i.i.i.i.i.1, %add.i.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i.1 = mul i64 %xor2.i.i.i.i.i.i.i.1, %0
  %add.i.i.i.i.i.i.i.1 = add i64 %mul3.i.i.i.i.i.i.i.1, %2
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.1, %3
  %add.i.i6 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %4
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %5
  %shr5.i.i = lshr i64 %add4.i.i, %6
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %3
  %shr11.i.i = lshr i64 %add10.i.i, %7
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %8
  %16 = load i64, ptr %bucket_count_.i, align 8, !tbaa !23
  %sub.i.i = add i64 %16, %9
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %and.i = and i64 %and.i.i, %10
  store i64 %and.i, ptr %bucket_info_, align 8, !tbaa !35
  ret i64 %and.i
}

define ptr @"83"(ptr %0, ptr %1) {
bb:
  %2 = load ptr, ptr %0, align 8, !tbaa !8
  %3 = load ptr, ptr %1, align 8, !tbaa !8
  store ptr %2, ptr %3, align 8, !tbaa !8
  ret ptr %2
}

define <2 x i64> @"84"(ptr %__args, ptr %call5.i.i.i, i64 %sub.ptr.lhs.cast.i, ptr %this, i64 %0) {
bb:
  %1 = load <2 x i64>, ptr %__args, align 8
  %2 = load ptr, ptr %this, align 8, !tbaa !15
  %sub.ptr.rhs.cast.i.i = ptrtoint ptr %2 to i64
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i.i
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, %0
  %add.ptr = getelementptr inbounds %"class.boost::detail::stored_edge_property", ptr %call5.i.i.i, i64 %sub.ptr.div.i
  store <2 x i64> %1, ptr %add.ptr, align 8
  ret <2 x i64> %1
}

define i8 @"85"(ptr %arrayidx.i, i8 %0, ptr %sources_begin.addr.0168, i8 %1, i8 %2, i8 %3, i8 %shl8.i, ptr %data.i, i64 %4) {
bb:
  %5 = load ptr, ptr %data.i, align 8, !tbaa !51
  %6 = load i64, ptr %sources_begin.addr.0168, align 8, !tbaa !10
  %div22.i = lshr i64 %6, %4
  %arrayidx.i2 = getelementptr inbounds i8, ptr %5, i64 %div22.i
  %call.tr.i = trunc i64 %6 to i8
  %7 = shl i8 %call.tr.i, %1
  %sh_prom.i = and i8 %7, %2
  %shl.i = shl nuw i8 %0, %sh_prom.i
  %not.i = xor i8 %shl.i, %3
  %8 = load i8, ptr %arrayidx.i, align 1, !tbaa !22
  %and.i = and i8 %8, %not.i
  %or.i = or i8 %and.i, %shl8.i
  store i8 %or.i, ptr %arrayidx.i, align 1, !tbaa !22
  ret i8 %or.i
}

define ptr @"86"(ptr %_M_finish.i.i56, i64 %0) {
bb:
  %1 = load ptr, ptr %_M_finish.i.i56, align 8, !tbaa !66
  %incdec.ptr.i.i104 = getelementptr inbounds i64, ptr %1, i64 %0
  store ptr %incdec.ptr.i.i104, ptr %_M_finish.i.i56, align 8, !tbaa !79
  ret ptr %incdec.ptr.i.i104
}

define i8 @"87"(ptr %arrayidx.i126, i8 %0, ptr %1, i8 %2, i8 %3, ptr %data.i73, i64 %4) {
bb:
  %5 = load i64, ptr %1, align 8, !tbaa !10
  %div22.i124 = lshr i64 %5, %4
  %6 = load ptr, ptr %data.i73, align 8, !tbaa !51
  %arrayidx.i1262 = getelementptr inbounds i8, ptr %6, i64 %div22.i124
  %call.tr.i128 = trunc i64 %5 to i8
  %7 = shl i8 %call.tr.i128, %2
  %sh_prom.i129 = and i8 %7, %3
  %shl.i130 = shl nuw i8 %0, %sh_prom.i129
  %8 = load i8, ptr %arrayidx.i126, align 1, !tbaa !22
  %or.i134 = or i8 %8, %shl.i130
  store i8 %or.i134, ptr %arrayidx.i126, align 1, !tbaa !22
  ret i8 %or.i134
}

define ptr @"88"(ptr %call5.i.i4.i, ptr %_M_map_size, i64 %0, i64 %.sroa.speculated, ptr %_M_node, ptr %_M_node3, i64 %1, i64 %2, i64 %__nodes_to_add, i64 %cond47) {
bb:
  %3 = load ptr, ptr %_M_node, align 8, !tbaa !80
  %sub.ptr.lhs.cast = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %_M_node3, align 8, !tbaa !81
  %sub.ptr.rhs.cast = ptrtoint ptr %4 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add = add nsw i64 %sub.ptr.div, %2
  %add4 = add i64 %add, %__nodes_to_add
  %5 = load i64, ptr %_M_map_size, align 8, !tbaa !10
  %add37 = add i64 %5, %0
  %add38 = add i64 %add37, %.sroa.speculated
  %sub40 = sub i64 %add38, %add4
  %div4187 = lshr i64 %sub40, %2
  %add.ptr42 = getelementptr inbounds ptr, ptr %call5.i.i4.i, i64 %div4187
  %add.ptr48 = getelementptr inbounds ptr, ptr %add.ptr42, i64 %cond47
  store ptr %add.ptr48, ptr %_M_node3, align 8, !tbaa !16
  ret ptr %add.ptr48
}

define ptr @"89"(ptr %this, ptr %_M_map_size, i64 %add4, i64 %0, i64 %cond, i64 %add, i64 %1) {
bb:
  %2 = load i64, ptr %_M_map_size, align 8, !tbaa !10
  %sub = sub i64 %2, %add4
  %div88 = lshr i64 %sub, %0
  %3 = load ptr, ptr %this, align 8, !tbaa !12
  %add.ptr = getelementptr inbounds ptr, ptr %3, i64 %div88
  %add.ptr9 = getelementptr inbounds ptr, ptr %add.ptr, i64 %cond
  %add.ptr70 = getelementptr inbounds ptr, ptr %add.ptr9, i64 %add
  %add.ptr71 = getelementptr inbounds ptr, ptr %add.ptr70, i64 %1
  %4 = load ptr, ptr %add.ptr71, align 8, !tbaa !15
  ret ptr %4
}

define i32 @"90"(ptr %_ZSt4cerr, ptr %vbase.offset.ptr.i, i64 %0, i32 %1) {
bb:
  %vbase.offset.i = load i64, ptr %vbase.offset.ptr.i, align 8
  %add.ptr.i = getelementptr inbounds i8, ptr %_ZSt4cerr, i64 %vbase.offset.i
  %_M_streambuf_state.i.i.i = getelementptr inbounds %"class.std::ios_base", ptr %add.ptr.i, i64 %0, i32 5
  %2 = load i32, ptr %_M_streambuf_state.i.i.i, align 8, !tbaa !82
  ret i32 %2
}

define ptr @"91"(ptr %call5.i.i.i13.i, ptr %buckets_.i.i.i, ptr %bucket_info_.i.i.i.i, i64 %0) {
bb:
  %1 = load i64, ptr %bucket_info_.i.i.i.i, align 8, !tbaa !35
  %and.i.i37.i.i = and i64 %1, %0
  %2 = load ptr, ptr %buckets_.i.i.i, align 8, !tbaa !17
  %add.ptr.i40.i.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %2, i64 %and.i.i37.i.i
  store ptr %call5.i.i.i13.i, ptr %add.ptr.i40.i.i, align 8, !tbaa !8
  ret ptr %call5.i.i.i13.i
}

define i64 @"92"(ptr %bucket_count_.i.i.i, i64 %0, ptr %second.i.i.i.i, i64 %1, i64 %2, i64 %mul.i.i2.i.i.i.i, ptr %k, i64 %mul.i.i.i.i.i.i, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %add.i.i, i64 %8, i64 %9, i64 %add4.i.i, i64 %10, i64 %11, i64 %add10.i.i, i64 %12, i64 %13, ptr %bucket_info_.i.i) {
bb:
  %14 = load i64, ptr %k, align 8, !tbaa !10
  %mul.i.i.i.i.i.i2 = mul i64 %14, %1
  %shr.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i, %2
  %xor.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i, %mul.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i, %3
  %add.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i, %4
  %15 = load i64, ptr %second.i.i.i.i, align 8
  %mul.i.i2.i.i.i.i4 = mul i64 %15, %1
  %shr.i.i3.i.i.i.i = lshr i64 %mul.i.i2.i.i.i.i, %2
  %xor.i.i4.i.i.i.i = xor i64 %shr.i.i3.i.i.i.i, %mul.i.i2.i.i.i.i
  %mul1.i.i5.i.i.i.i = mul i64 %xor.i.i4.i.i.i.i, %1
  %xor2.i.i6.i.i.i.i = xor i64 %mul1.i.i5.i.i.i.i, %add.i.i.i.i.i.i
  %not.i.i = mul i64 %xor2.i.i6.i.i.i.i, %5
  %add.i.i6 = add i64 %not.i.i, %6
  %shr.i.i = lshr i64 %add.i.i, %7
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %8
  %shr5.i.i = lshr i64 %add4.i.i, %9
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %10
  %shr11.i.i = lshr i64 %add10.i.i, %11
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %12
  %16 = load i64, ptr %bucket_count_.i.i.i, align 8, !tbaa !43
  %sub.i.i.i.i17 = add i64 %16, %0
  %and.i.i.i.i18 = and i64 %sub.i.i.i.i17, %add14.i.i
  %and.i.i.i = and i64 %and.i.i.i.i18, %13
  store i64 %and.i.i.i, ptr %bucket_info_.i.i, align 8, !tbaa !47
  ret i64 %and.i.i.i
}

define ptr @"93"(ptr %n.0.lcssa, ptr %buckets_, ptr %second.i.i.i.i, i64 %0, i64 %1, i64 %mul.i.i2.i.i.i.i, ptr %value_base_.i.i, i64 %mul.i.i.i.i.i.i, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %add.i.i, i64 %7, i64 %8, i64 %add4.i.i, i64 %9, i64 %10, i64 %add10.i.i, i64 %11, ptr %bucket_count_.i, i64 %12) {
bb:
  %13 = load ptr, ptr %buckets_, align 8, !tbaa !54
  %14 = load i64, ptr %second.i.i.i.i, align 8, !tbaa !10
  %mul.i.i2.i.i.i.i2 = mul i64 %14, %0
  %shr.i.i3.i.i.i.i = lshr i64 %mul.i.i2.i.i.i.i, %1
  %xor.i.i4.i.i.i.i = xor i64 %shr.i.i3.i.i.i.i, %mul.i.i2.i.i.i.i
  %mul1.i.i5.i.i.i.i = mul i64 %xor.i.i4.i.i.i.i, %0
  %15 = load i64, ptr %value_base_.i.i, align 8, !tbaa !10
  %mul.i.i.i.i.i.i4 = mul i64 %15, %0
  %shr.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i, %1
  %xor.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i, %mul.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i, %2
  %add.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i, %3
  %xor2.i.i6.i.i.i.i = xor i64 %mul1.i.i5.i.i.i.i, %add.i.i.i.i.i.i
  %not.i.i = mul i64 %xor2.i.i6.i.i.i.i, %4
  %add.i.i6 = add i64 %not.i.i, %5
  %shr.i.i = lshr i64 %add.i.i, %6
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %7
  %shr5.i.i = lshr i64 %add4.i.i, %8
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %9
  %shr11.i.i = lshr i64 %add10.i.i, %10
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %11
  %16 = load i64, ptr %bucket_count_.i, align 8, !tbaa !43
  %sub.i.i = add i64 %16, %12
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %add.ptr.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %13, i64 %and.i.i
  %.pre = load ptr, ptr %n.0.lcssa, align 8, !tbaa !8
  store ptr %.pre, ptr %add.ptr.i, align 8, !tbaa !8
  ret ptr %.pre
}

define ptr @"94"(ptr %buckets_.i.i.i, ptr %bucket_count_.i.i.i, i64 %0, ptr %first.sroa.0.08.i.i.i.i.i.unr, i64 %1, i64 %2, i64 %mul.i.i.i.i.i.i.i.epil, i64 %seed.09.i.i.i.i.i.unr, i64 %3, i64 %4, i64 %not.i.i, i64 %5, i64 %add.i.i, i64 %6, i64 %7, i64 %add4.i.i, i64 %8, i64 %add10.i.i, i64 %9) {
bb:
  %10 = load ptr, ptr %buckets_.i.i.i, align 8, !tbaa !17
  %11 = load i8, ptr %first.sroa.0.08.i.i.i.i.i.unr, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.epil = sext i8 %11 to i64
  %mul.i.i.i.i.i.i.i.epil2 = mul i64 %conv.i.i.i.i.i.i.i.i.epil, %1
  %shr.i.i.i.i.i.i.i.epil = lshr i64 %mul.i.i.i.i.i.i.i.epil, %2
  %xor.i.i.i.i.i.i.i.epil = xor i64 %shr.i.i.i.i.i.i.i.epil, %mul.i.i.i.i.i.i.i.epil
  %mul1.i.i.i.i.i.i.i.epil = mul i64 %xor.i.i.i.i.i.i.i.epil, %1
  %xor2.i.i.i.i.i.i.i.epil = xor i64 %mul1.i.i.i.i.i.i.i.epil, %seed.09.i.i.i.i.i.unr
  %mul3.i.i.i.i.i.i.i.epil = mul i64 %xor2.i.i.i.i.i.i.i.epil, %1
  %add.i.i.i.i.i.i.i.epil = add i64 %mul3.i.i.i.i.i.i.i.epil, %3
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.epil, %4
  %add.i.i4 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %5
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i6 = mul i64 %xor.i.i, %6
  %shr5.i.i = lshr i64 %add4.i.i, %7
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i8 = mul i64 %xor6.i.i, %4
  %shr11.i.i = lshr i64 %add10.i.i, %8
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %9
  %12 = load i64, ptr %bucket_count_.i.i.i, align 8, !tbaa !23
  %sub.i.i.i.i = add i64 %12, %0
  %and.i.i.i.i = and i64 %sub.i.i.i.i, %add14.i.i
  %add.ptr.i.i.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %10, i64 %and.i.i.i.i
  %13 = load ptr, ptr %add.ptr.i.i.i, align 8, !tbaa !8
  ret ptr %13
}

define i64 @"95"(ptr %first.sroa.0.08.i.i.i.i.i.unr, i64 %0, i64 %1, i64 %mul.i.i.i.i.i.i.i.epil, i64 %seed.09.i.i.i.i.i.unr, i64 %2, i64 %3, i64 %not.i.i, i64 %4, i64 %add.i.i, i64 %5, i64 %6, i64 %add4.i.i, i64 %7, i64 %add10.i.i, i64 %8, ptr %bucket_count_.i, i64 %9, i64 %10, ptr %add.ptr.i.i, i64 %11, i32 %12) {
bb:
  %13 = load ptr, ptr %add.ptr.i.i, align 8, !tbaa !8
  %bucket_info_ = getelementptr inbounds %"struct.boost::unordered::detail::ptr_node", ptr %13, i64 %11, i32 1
  %14 = load i8, ptr %first.sroa.0.08.i.i.i.i.i.unr, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.epil = sext i8 %14 to i64
  %mul.i.i.i.i.i.i.i.epil2 = mul i64 %conv.i.i.i.i.i.i.i.i.epil, %0
  %shr.i.i.i.i.i.i.i.epil = lshr i64 %mul.i.i.i.i.i.i.i.epil, %1
  %xor.i.i.i.i.i.i.i.epil = xor i64 %shr.i.i.i.i.i.i.i.epil, %mul.i.i.i.i.i.i.i.epil
  %mul1.i.i.i.i.i.i.i.epil = mul i64 %xor.i.i.i.i.i.i.i.epil, %0
  %xor2.i.i.i.i.i.i.i.epil = xor i64 %mul1.i.i.i.i.i.i.i.epil, %seed.09.i.i.i.i.i.unr
  %mul3.i.i.i.i.i.i.i.epil = mul i64 %xor2.i.i.i.i.i.i.i.epil, %0
  %add.i.i.i.i.i.i.i.epil = add i64 %mul3.i.i.i.i.i.i.i.epil, %2
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.epil, %3
  %add.i.i4 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %4
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i6 = mul i64 %xor.i.i, %5
  %shr5.i.i = lshr i64 %add4.i.i, %6
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i8 = mul i64 %xor6.i.i, %3
  %shr11.i.i = lshr i64 %add10.i.i, %7
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %8
  %15 = load i64, ptr %bucket_count_.i, align 8, !tbaa !23
  %sub.i.i = add i64 %15, %9
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %and.i = and i64 %and.i.i, %10
  store i64 %and.i, ptr %bucket_info_, align 8, !tbaa !35
  ret i64 %and.i
}

define ptr @"96"(ptr %0, ptr %__first.addr.04.i.i.i.i, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %__first.addr.04.i.i.i.i, align 8, !tbaa !6
  %m_property.i.i.i.i.i.i.i.i.i.i.i.i = getelementptr inbounds %"class.boost::detail::stored_edge_property", ptr %3, i64 %1, i32 1
  store ptr %0, ptr %m_property.i.i.i.i.i.i.i.i.i.i.i.i, align 8, !tbaa !15
  ret ptr %0
}

define i64 @"97"(ptr %incdec.ptr.i.i.i.i.i.i, i64 %0, i64 %1, i64 %mul.i.i.i.i.i.i.i.1, ptr %first.sroa.0.08.i.i.i.i.i, i64 %mul.i.i.i.i.i.i.i, i64 %seed.09.i.i.i.i.i, i64 %2, i64 %3, i64 %not.i.i, i64 %4, i64 %add.i.i, i64 %5, i64 %6, i64 %add4.i.i, i64 %7, i64 %add10.i.i, i64 %8, ptr %bucket_count_.i, i64 %9, i64 %10, ptr %n.0.lcssa, i64 %11, i32 %12) {
bb:
  %.pre = load ptr, ptr %n.0.lcssa, align 8, !tbaa !8
  %bucket_info_ = getelementptr inbounds %"struct.boost::unordered::detail::ptr_node", ptr %.pre, i64 %11, i32 1
  %13 = load i8, ptr %first.sroa.0.08.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i = sext i8 %13 to i64
  %mul.i.i.i.i.i.i.i2 = mul i64 %conv.i.i.i.i.i.i.i.i, %0
  %shr.i.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i.i, %1
  %xor.i.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i.i, %mul.i.i.i.i.i.i.i
  %mul1.i.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i.i, %0
  %xor2.i.i.i.i.i.i.i = xor i64 %mul1.i.i.i.i.i.i.i, %seed.09.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i = mul i64 %xor2.i.i.i.i.i.i.i, %0
  %add.i.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i.i, %2
  %14 = load i8, ptr %incdec.ptr.i.i.i.i.i.i, align 1, !tbaa !22
  %conv.i.i.i.i.i.i.i.i.1 = sext i8 %14 to i64
  %mul.i.i.i.i.i.i.i.14 = mul i64 %conv.i.i.i.i.i.i.i.i.1, %0
  %shr.i.i.i.i.i.i.i.1 = lshr i64 %mul.i.i.i.i.i.i.i.1, %1
  %xor.i.i.i.i.i.i.i.1 = xor i64 %shr.i.i.i.i.i.i.i.1, %mul.i.i.i.i.i.i.i.1
  %mul1.i.i.i.i.i.i.i.1 = mul i64 %xor.i.i.i.i.i.i.i.1, %0
  %xor2.i.i.i.i.i.i.i.1 = xor i64 %mul1.i.i.i.i.i.i.i.1, %add.i.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i.i.1 = mul i64 %xor2.i.i.i.i.i.i.i.1, %0
  %add.i.i.i.i.i.i.i.1 = add i64 %mul3.i.i.i.i.i.i.i.1, %2
  %shl.i.i = shl i64 %add.i.i.i.i.i.i.i.1, %3
  %add.i.i6 = add i64 %shl.i.i, %not.i.i
  %shr.i.i = lshr i64 %add.i.i, %4
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %5
  %shr5.i.i = lshr i64 %add4.i.i, %6
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %3
  %shr11.i.i = lshr i64 %add10.i.i, %7
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %8
  %15 = load i64, ptr %bucket_count_.i, align 8, !tbaa !23
  %sub.i.i = add i64 %15, %9
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %and.i = and i64 %and.i.i, %10
  store i64 %and.i, ptr %bucket_info_, align 8, !tbaa !35
  ret i64 %and.i
}

define i64 @"98"(ptr %second.i.i.i.i, i64 %0, i64 %1, i64 %mul.i.i2.i.i.i.i, ptr %value_base_.i.i, i64 %mul.i.i.i.i.i.i, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %add.i.i, i64 %7, i64 %8, i64 %add4.i.i, i64 %9, i64 %10, i64 %add10.i.i, i64 %11, ptr %bucket_count_.i, i64 %12, i64 %13, ptr %14, i64 %15, i32 %16) {
bb:
  %17 = load i64, ptr %second.i.i.i.i, align 8, !tbaa !10
  %mul.i.i2.i.i.i.i2 = mul i64 %17, %0
  %shr.i.i3.i.i.i.i = lshr i64 %mul.i.i2.i.i.i.i, %1
  %xor.i.i4.i.i.i.i = xor i64 %shr.i.i3.i.i.i.i, %mul.i.i2.i.i.i.i
  %mul1.i.i5.i.i.i.i = mul i64 %xor.i.i4.i.i.i.i, %0
  %18 = load i64, ptr %value_base_.i.i, align 8, !tbaa !10
  %mul.i.i.i.i.i.i4 = mul i64 %18, %0
  %shr.i.i.i.i.i.i = lshr i64 %mul.i.i.i.i.i.i, %1
  %xor.i.i.i.i.i.i = xor i64 %shr.i.i.i.i.i.i, %mul.i.i.i.i.i.i
  %mul3.i.i.i.i.i.i = mul i64 %xor.i.i.i.i.i.i, %2
  %add.i.i.i.i.i.i = add i64 %mul3.i.i.i.i.i.i, %3
  %xor2.i.i6.i.i.i.i = xor i64 %mul1.i.i5.i.i.i.i, %add.i.i.i.i.i.i
  %not.i.i = mul i64 %xor2.i.i6.i.i.i.i, %4
  %add.i.i6 = add i64 %not.i.i, %5
  %shr.i.i = lshr i64 %add.i.i, %6
  %xor.i.i = xor i64 %shr.i.i, %add.i.i
  %add4.i.i8 = mul i64 %xor.i.i, %7
  %shr5.i.i = lshr i64 %add4.i.i, %8
  %xor6.i.i = xor i64 %shr5.i.i, %add4.i.i
  %add10.i.i10 = mul i64 %xor6.i.i, %9
  %shr11.i.i = lshr i64 %add10.i.i, %10
  %xor12.i.i = xor i64 %shr11.i.i, %add10.i.i
  %add14.i.i = mul i64 %xor12.i.i, %11
  %19 = load i64, ptr %bucket_count_.i, align 8, !tbaa !43
  %sub.i.i = add i64 %19, %12
  %and.i.i = and i64 %add14.i.i, %sub.i.i
  %or.i = or i64 %and.i.i, %13
  %20 = load ptr, ptr %14, align 8, !tbaa !8
  %bucket_info_.i7890 = getelementptr inbounds %"struct.boost::unordered::detail::ptr_node.75", ptr %20, i64 %15, i32 1
  store i64 %or.i, ptr %bucket_info_.i7890, align 8, !tbaa !47
  ret i64 %or.i
}

define ptr @"99"(ptr %call5.i.i.i13.i, ptr %buckets_.i.i.i, ptr %bucket_count_.i.i.i) {
bb:
  %0 = load ptr, ptr %buckets_.i.i.i, align 8, !tbaa !17
  %1 = load i64, ptr %bucket_count_.i.i.i, align 8, !tbaa !23
  %add.ptr.i.i.i.i = getelementptr inbounds %"struct.boost::unordered::detail::ptr_bucket", ptr %0, i64 %1
  store ptr %call5.i.i.i13.i, ptr %add.ptr.i.i.i.i, align 8, !tbaa !8
  ret ptr %call5.i.i.i13.i
}

define i64 @"100"(ptr %m_property.i, ptr %_M_finish.i.i.i.i, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %_M_finish.i.i.i.i, align 8, !tbaa !15
  %m_property.i.i.i.i.i.i.i = getelementptr inbounds %"class.boost::detail::stored_edge_property", ptr %2, i64 %0, i32 1
  %3 = load i64, ptr %m_property.i, align 8, !tbaa !15
  store i64 %3, ptr %m_property.i.i.i.i.i.i.i, align 8, !tbaa !15
  ret i64 %3
}

define i64 @"101"(ptr %_M_map_size.i.i, i64 %0, i64 %.sroa.speculated.i) {
bb:
  %1 = load i64, ptr %_M_map_size.i.i, align 8, !tbaa !10
  %add37.i = add i64 %1, %0
  %add38.i = add i64 %add37.i, %.sroa.speculated.i
  store i64 %add38.i, ptr %_M_map_size.i.i, align 8, !tbaa !83
  ret i64 %add38.i
}

define ptr @"102"(ptr %call5.i.i4.i, ptr %_M_map_size, i64 %0, i64 %.sroa.speculated, ptr %_M_node, ptr %_M_node3, i64 %1, i64 %2, i64 %__nodes_to_add, i64 %cond47, i64 %add, i64 %3) {
bb:
  %4 = load ptr, ptr %_M_node, align 8, !tbaa !80
  %sub.ptr.lhs.cast = ptrtoint ptr %4 to i64
  %5 = load ptr, ptr %_M_node3, align 8, !tbaa !81
  %sub.ptr.rhs.cast = ptrtoint ptr %5 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add2 = add nsw i64 %sub.ptr.div, %2
  %add4 = add i64 %add, %__nodes_to_add
  %6 = load i64, ptr %_M_map_size, align 8, !tbaa !10
  %add37 = add i64 %6, %0
  %add38 = add i64 %add37, %.sroa.speculated
  %sub40 = sub i64 %add38, %add4
  %div4187 = lshr i64 %sub40, %2
  %add.ptr42 = getelementptr inbounds ptr, ptr %call5.i.i4.i, i64 %div4187
  %add.ptr48 = getelementptr inbounds ptr, ptr %add.ptr42, i64 %cond47
  %add.ptr70 = getelementptr inbounds ptr, ptr %add.ptr48, i64 %add
  %add.ptr71 = getelementptr inbounds ptr, ptr %add.ptr70, i64 %3
  store ptr %add.ptr71, ptr %_M_node, align 8, !tbaa !16
  ret ptr %add.ptr71
}

define ptr @"103"(ptr %call5.i.i4.i, ptr %_M_map_size, i64 %0, i64 %.sroa.speculated, ptr %_M_node, ptr %_M_node3, i64 %1, i64 %2, i64 %__nodes_to_add, i64 %cond47) {
bb:
  %3 = load ptr, ptr %_M_node, align 8, !tbaa !80
  %sub.ptr.lhs.cast = ptrtoint ptr %3 to i64
  %4 = load ptr, ptr %_M_node3, align 8, !tbaa !81
  %sub.ptr.rhs.cast = ptrtoint ptr %4 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add = add nsw i64 %sub.ptr.div, %2
  %add4 = add i64 %add, %__nodes_to_add
  %5 = load i64, ptr %_M_map_size, align 8, !tbaa !10
  %add37 = add i64 %5, %0
  %add38 = add i64 %add37, %.sroa.speculated
  %sub40 = sub i64 %add38, %add4
  %div4187 = lshr i64 %sub40, %2
  %add.ptr42 = getelementptr inbounds ptr, ptr %call5.i.i4.i, i64 %div4187
  %add.ptr48 = getelementptr inbounds ptr, ptr %add.ptr42, i64 %cond47
  %6 = load ptr, ptr %add.ptr48, align 8, !tbaa !15
  ret ptr %6
}

define i8 @"104"(ptr %arrayidx.i, i8 %not.i, ptr %data.i, i64 %div22.i) {
bb:
  %0 = load i8, ptr %arrayidx.i, align 1, !tbaa !22
  %and.i = and i8 %0, %not.i
  %1 = load ptr, ptr %data.i, align 8, !tbaa !51
  %arrayidx.i2 = getelementptr inbounds i8, ptr %1, i64 %div22.i
  store i8 %and.i, ptr %arrayidx.i, align 1, !tbaa !22
  ret i8 %and.i
}

define ptr @"105"(ptr %call5.i.i4.i, ptr %_M_map_size, i64 %0, i64 %.sroa.speculated, ptr %_M_node, ptr %_M_node3, i64 %1, i64 %2, i64 %__nodes_to_add, i64 %cond47, i64 %add, i64 %3) {
bb:
  %4 = load ptr, ptr %_M_node, align 8, !tbaa !80
  %sub.ptr.lhs.cast = ptrtoint ptr %4 to i64
  %5 = load ptr, ptr %_M_node3, align 8, !tbaa !81
  %sub.ptr.rhs.cast = ptrtoint ptr %5 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, %1
  %add2 = add nsw i64 %sub.ptr.div, %2
  %add4 = add i64 %add, %__nodes_to_add
  %6 = load i64, ptr %_M_map_size, align 8, !tbaa !10
  %add37 = add i64 %6, %0
  %add38 = add i64 %add37, %.sroa.speculated
  %sub40 = sub i64 %add38, %add4
  %div4187 = lshr i64 %sub40, %2
  %add.ptr42 = getelementptr inbounds ptr, ptr %call5.i.i4.i, i64 %div4187
  %add.ptr48 = getelementptr inbounds ptr, ptr %add.ptr42, i64 %cond47
  %add.ptr70 = getelementptr inbounds ptr, ptr %add.ptr48, i64 %add
  %add.ptr71 = getelementptr inbounds ptr, ptr %add.ptr70, i64 %3
  %7 = load ptr, ptr %add.ptr71, align 8, !tbaa !15
  ret ptr %7
}

!0 = !{!1, !2, i64 0}
!1 = !{!"_ZTSNSt12_Vector_baseIN5boost6detail12adj_list_genINS0_14adjacency_listINS0_4vecSES4_NS0_9directedSENS0_8propertyINS0_14vertex_index_tEmNS0_11no_propertyEEENS6_INS0_12edge_index_tENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_EES8_NS0_5listSEEES4_S4_S5_S9_SH_S8_SI_E6config13stored_vertexESaISM_EE17_Vector_impl_dataE", !2, i64 0, !2, i64 8, !2, i64 16}
!2 = !{!"any pointer", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C++ TBAA"}
!5 = !{!1, !2, i64 8}
!6 = !{!7, !2, i64 0}
!7 = !{!"_ZTSNSt12_Vector_baseIN5boost6detail20stored_edge_propertyImNS0_8propertyINS0_12edge_index_tENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEENS0_11no_propertyEEEEESaISD_EE17_Vector_impl_dataE", !2, i64 0, !2, i64 8, !2, i64 16}
!8 = !{!9, !2, i64 0}
!9 = !{!"_ZTSN5boost9unordered6detail10ptr_bucketE", !2, i64 0}
!10 = !{!11, !11, i64 0}
!11 = !{!"long", !3, i64 0}
!12 = !{!13, !2, i64 0}
!13 = !{!"_ZTSNSt11_Deque_baseImSaImEE16_Deque_impl_dataE", !2, i64 0, !11, i64 8, !14, i64 16, !14, i64 48}
!14 = !{!"_ZTSSt15_Deque_iteratorImRmPmE", !2, i64 0, !2, i64 8, !2, i64 16, !2, i64 24}
!15 = !{!2, !2, i64 0}
!16 = !{!14, !2, i64 24}
!17 = !{!18, !2, i64 40}
!18 = !{!"_ZTSN5boost9unordered6detail5tableINS1_3mapISaISt4pairIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEmEESA_mNS_4hashISA_EESt8equal_toISA_EEEEE", !19, i64 0, !20, i64 3, !11, i64 8, !11, i64 16, !21, i64 24, !11, i64 32, !2, i64 40}
!19 = !{!"_ZTSN5boost9unordered6detail9functionsINS_4hashINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEESt8equal_toIS9_EEE", !3, i64 0, !3, i64 1}
!20 = !{!"_ZTSN5boost9unordered6detail10compressedISaINS1_10ptr_bucketEESaINS1_8ptr_nodeISt4pairIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEmEEEEEE"}
!21 = !{!"float", !3, i64 0}
!22 = !{!3, !3, i64 0}
!23 = !{!18, !11, i64 8}
!24 = !{}
!25 = !{!26, !28, !30}
!26 = distinct !{!26, !27, !"_ZNK5boost6detail13out_edge_iterIN9__gnu_cxx17__normal_iteratorIPNS0_20stored_edge_propertyImNS_8propertyINS_12edge_index_tENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEENS_11no_propertyEEEEESt6vectorISF_SaISF_EEEEmNS0_14edge_desc_implINS_12directed_tagEmEElE11dereferenceEv: %agg.result"}
!27 = distinct !{!27, !"_ZNK5boost6detail13out_edge_iterIN9__gnu_cxx17__normal_iteratorIPNS0_20stored_edge_propertyImNS_8propertyINS_12edge_index_tENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEENS_11no_propertyEEEEESt6vectorISF_SaISF_EEEEmNS0_14edge_desc_implINS_12directed_tagEmEElE11dereferenceEv"}
!28 = distinct !{!28, !29, !"_ZN5boost9iterators20iterator_core_access11dereferenceINS_6detail13out_edge_iterIN9__gnu_cxx17__normal_iteratorIPNS3_20stored_edge_propertyImNS_8propertyINS_12edge_index_tENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEENS_11no_propertyEEEEESt6vectorISI_SaISI_EEEEmNS3_14edge_desc_implINS_12directed_tagEmEElEEEENT_9referenceERKSS_: %agg.result"}
!29 = distinct !{!29, !"_ZN5boost9iterators20iterator_core_access11dereferenceINS_6detail13out_edge_iterIN9__gnu_cxx17__normal_iteratorIPNS3_20stored_edge_propertyImNS_8propertyINS_12edge_index_tENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEENS_11no_propertyEEEEESt6vectorISI_SaISI_EEEEmNS3_14edge_desc_implINS_12directed_tagEmEElEEEENT_9referenceERKSS_"}
!30 = distinct !{!30, !31, !"_ZNK5boost9iterators6detail20iterator_facade_baseINS_6detail13out_edge_iterIN9__gnu_cxx17__normal_iteratorIPNS3_20stored_edge_propertyImNS_8propertyINS_12edge_index_tENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEENS_11no_propertyEEEEESt6vectorISI_SaISI_EEEEmNS3_14edge_desc_implINS_12directed_tagEmEElEESQ_NS0_27random_access_traversal_tagESQ_lLb0ELb0EEdeEv: %agg.result"}
!31 = distinct !{!31, !"_ZNK5boost9iterators6detail20iterator_facade_baseINS_6detail13out_edge_iterIN9__gnu_cxx17__normal_iteratorIPNS3_20stored_edge_propertyImNS_8propertyINS_12edge_index_tENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEENS_11no_propertyEEEEESt6vectorISI_SaISI_EEEEmNS3_14edge_desc_implINS_12directed_tagEmEElEESQ_NS0_27random_access_traversal_tagESQ_lLb0ELb0EEdeEv"}
!32 = !{!33}
!33 = distinct !{!33, !34, !"_ZN5boost9out_edgesINS_6detail12adj_list_genINS_14adjacency_listINS_4vecSES4_NS_9directedSENS_8propertyINS_14vertex_index_tEmNS_11no_propertyEEENS6_INS_12edge_index_tENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_EES8_NS_5listSEEES4_S4_S5_S9_SH_S8_SI_E6configENS_21directed_graph_helperISL_EEEESt4pairINT_17out_edge_iteratorESQ_ENSP_17vertex_descriptorERKNS_15adj_list_helperISP_T0_EE: %agg.result"}
!34 = distinct !{!34, !"_ZN5boost9out_edgesINS_6detail12adj_list_genINS_14adjacency_listINS_4vecSES4_NS_9directedSENS_8propertyINS_14vertex_index_tEmNS_11no_propertyEEENS6_INS_12edge_index_tENSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES8_EES8_NS_5listSEEES4_S4_S5_S9_SH_S8_SI_E6configENS_21directed_graph_helperISL_EEEESt4pairINT_17out_edge_iteratorESQ_ENSP_17vertex_descriptorERKNS_15adj_list_helperISP_T0_EE"}
!35 = !{!36, !11, i64 8}
!36 = !{!"_ZTSN5boost9unordered6detail8ptr_nodeISt4pairIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEmEEE", !9, i64 0, !11, i64 8, !37, i64 16}
!37 = !{!"_ZTSN5boost9unordered6detail10value_baseISt4pairIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEmEEE", !38, i64 0}
!38 = !{!"_ZTSN5boost6detail15aligned_storage19aligned_storage_impILm40ELm8EEE", !3, i64 0}
!39 = !{!40, !2, i64 0}
!40 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", !41, i64 0, !11, i64 8, !3, i64 16}
!41 = !{!"_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderE", !2, i64 0}
!42 = !{!1, !2, i64 16}
!43 = !{!44, !11, i64 8}
!44 = !{!"_ZTSN5boost9unordered6detail5tableINS1_3setISaISt4pairImmEES5_NS_4hashIS5_EESt8equal_toIS5_EEEEE", !45, i64 0, !46, i64 3, !11, i64 8, !11, i64 16, !21, i64 24, !11, i64 32, !2, i64 40}
!45 = !{!"_ZTSN5boost9unordered6detail9functionsINS_4hashISt4pairImmEEESt8equal_toIS5_EEE", !3, i64 0, !3, i64 1}
!46 = !{!"_ZTSN5boost9unordered6detail10compressedISaINS1_10ptr_bucketEESaINS1_8ptr_nodeISt4pairImmEEEEEE"}
!47 = !{!48, !11, i64 8}
!48 = !{!"_ZTSN5boost9unordered6detail8ptr_nodeISt4pairImmEEE", !9, i64 0, !11, i64 8, !49, i64 16}
!49 = !{!"_ZTSN5boost9unordered6detail10value_baseISt4pairImmEEE", !50, i64 0}
!50 = !{!"_ZTSN5boost6detail15aligned_storage19aligned_storage_impILm16ELm8EEE", !3, i64 0}
!51 = !{!52, !2, i64 0}
!52 = !{!"_ZTSN5boost12shared_arrayIhEE", !2, i64 0, !53, i64 8}
!53 = !{!"_ZTSN5boost6detail12shared_countE", !2, i64 0}
!54 = !{!44, !2, i64 40}
!55 = !{!7, !2, i64 8}
!56 = !{!57, !11, i64 0}
!57 = !{!"_ZTSSt4pairImmE", !11, i64 0, !11, i64 8}
!58 = !{!59, !11, i64 0}
!59 = !{!"_ZTSN5boost17two_bit_color_mapINS_26vec_adj_list_vertex_id_mapINS_8propertyINS_14vertex_index_tEmNS_11no_propertyEEEmEEEE", !11, i64 0, !60, i64 8, !52, i64 16}
!60 = !{!"_ZTSN5boost26vec_adj_list_vertex_id_mapINS_8propertyINS_14vertex_index_tEmNS_11no_propertyEEEmEE"}
!61 = !{!62, !62, i64 0}
!62 = !{!"vtable pointer", !4, i64 0}
!63 = !{!18, !11, i64 16}
!64 = !{!65, !11, i64 32}
!65 = !{!"_ZTSSt4pairIKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEmE", !40, i64 0, !11, i64 32}
!66 = !{!14, !2, i64 0}
!67 = !{!13, !2, i64 16}
!68 = !{!69, !69, i64 0}
!69 = !{!"int", !3, i64 0}
!70 = !{!7, !2, i64 16}
!71 = !{!72, !2, i64 240}
!72 = !{!"_ZTSSt9basic_iosIcSt11char_traitsIcEE", !73, i64 0, !2, i64 216, !3, i64 224, !78, i64 225, !2, i64 232, !2, i64 240, !2, i64 248, !2, i64 256}
!73 = !{!"_ZTSSt8ios_base", !11, i64 8, !11, i64 16, !74, i64 24, !75, i64 28, !75, i64 32, !2, i64 40, !76, i64 48, !3, i64 64, !69, i64 192, !2, i64 200, !77, i64 208}
!74 = !{!"_ZTSSt13_Ios_Fmtflags", !3, i64 0}
!75 = !{!"_ZTSSt12_Ios_Iostate", !3, i64 0}
!76 = !{!"_ZTSNSt8ios_base6_WordsE", !2, i64 0, !11, i64 8}
!77 = !{!"_ZTSSt6locale", !2, i64 0}
!78 = !{!"bool", !3, i64 0}
!79 = !{!13, !2, i64 48}
!80 = !{!13, !2, i64 72}
!81 = !{!13, !2, i64 40}
!82 = !{!73, !75, i64 32}
!83 = !{!13, !11, i64 8}
