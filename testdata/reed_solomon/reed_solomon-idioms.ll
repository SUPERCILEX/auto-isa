; ModuleID = 'reed_solomon-idioms'
source_filename = "reed_solomon-idioms"
target triple = "riscv64"

define i8 @"0"(ptr %arrayidx45, ptr %arrayidx48) {
bb:
  %0 = load i32, ptr %arrayidx45, align 4, !tbaa !0
  %conv46 = trunc i32 %0 to i8
  store i8 %conv46, ptr %arrayidx48, align 1, !tbaa !4
  ret i8 %conv46
}

define i32 @"1"(i32 %0, ptr %index_of, i64 %1, ptr %2) {
bb:
  %3 = load i32, ptr %2, align 16, !tbaa !0
  %idxprom8.i = sext i32 %3 to i64
  %arrayidx9.i = getelementptr inbounds [256 x i32], ptr %index_of, i64 %1, i64 %idxprom8.i
  store i32 %0, ptr %arrayidx9.i, align 4, !tbaa !0
  ret i32 %0
}

define i32 @"2"(ptr %alpha_to, i64 %0, ptr %arrayidx262.i, ptr %arrayidx242.i, i32 %1) {
bb:
  %2 = load i32, ptr %arrayidx242.i, align 4, !tbaa !0
  %3 = load i32, ptr %arrayidx262.i, align 4, !tbaa !0
  %add263.i = add nsw i32 %3, %2
  %rem264.i = srem i32 %add263.i, %1
  %idxprom265.i = sext i32 %rem264.i to i64
  %arrayidx266.i = getelementptr inbounds [256 x i32], ptr %alpha_to, i64 %0, i64 %idxprom265.i
  %4 = load i32, ptr %arrayidx266.i, align 4, !tbaa !0
  ret i32 %4
}

define i32 @"3"(ptr %index_of, i64 %0, ptr %1, ptr %arrayidx5.i65) {
bb:
  %2 = load i32, ptr %1, align 4, !tbaa !0
  %3 = load i32, ptr %arrayidx5.i65, align 4, !tbaa !0
  %xor.i66 = xor i32 %2, %3
  %idxprom6.i = sext i32 %xor.i66 to i64
  %arrayidx7.i = getelementptr inbounds [256 x i32], ptr %index_of, i64 %0, i64 %idxprom6.i
  %4 = load i32, ptr %arrayidx7.i, align 4, !tbaa !0
  ret i32 %4
}

define i32 @"4"(ptr %alpha_to, i64 %0, ptr %arrayidx13.i, i32 %1, i32 %2) {
bb:
  %3 = load i32, ptr %arrayidx13.i, align 4, !tbaa !0
  %add.i = add nsw i32 %3, %1
  %rem.i = srem i32 %add.i, %2
  %idxprom14.i = sext i32 %rem.i to i64
  %arrayidx15.i = getelementptr inbounds [256 x i32], ptr %alpha_to, i64 %0, i64 %idxprom14.i
  %4 = load i32, ptr %arrayidx15.i, align 4, !tbaa !0
  ret i32 %4
}

define i32 @"5"(i32 %0, ptr %index_of, i64 %1, ptr %arrayidx14.i, i32 %2) {
bb:
  %3 = load i32, ptr %arrayidx14.i, align 4, !tbaa !0
  %shl28.i = shl i32 %3, %2
  %idxprom34.i = sext i32 %shl28.i to i64
  %arrayidx35.i = getelementptr inbounds [256 x i32], ptr %index_of, i64 %1, i64 %idxprom34.i
  store i32 %0, ptr %arrayidx35.i, align 4, !tbaa !0
  ret i32 %0
}

define i32 @"6"(i32 %0, ptr %index_of, i64 %1, ptr %arrayidx14.i, i32 %2, ptr %3, i32 %4) {
bb:
  %5 = load i32, ptr %arrayidx14.i, align 4, !tbaa !0
  %xor20.i = shl i32 %5, %2
  %6 = load i32, ptr %3, align 16, !tbaa !0
  %7 = xor i32 %xor20.i, %6
  %xor22.i = xor i32 %7, %4
  %idxprom34.i = sext i32 %xor22.i to i64
  %arrayidx35.i = getelementptr inbounds [256 x i32], ptr %index_of, i64 %1, i64 %idxprom34.i
  store i32 %0, ptr %arrayidx35.i, align 4, !tbaa !0
  ret i32 %0
}

define i32 @"7"(ptr %0, i32 %mask.059.i) {
bb:
  %1 = load i32, ptr %0, align 16, !tbaa !0
  %xor.i = xor i32 %1, %mask.059.i
  store i32 %xor.i, ptr %0, align 16, !tbaa !0
  ret i32 %xor.i
}

define i32 @"8"(ptr %arrayidx165.i, ptr %arrayidx172.i) {
bb:
  %0 = load i32, ptr %arrayidx165.i, align 4, !tbaa !0
  store i32 %0, ptr %arrayidx172.i, align 4, !tbaa !0
  ret i32 %0
}

define i32 @"9"(ptr %arrayidx.i85, ptr %arrayidx10.i) {
bb:
  %0 = load i32, ptr %arrayidx10.i, align 4, !tbaa !0
  %1 = load i32, ptr %arrayidx.i85, align 4, !tbaa !0
  %xor.i93 = xor i32 %1, %0
  store i32 %xor.i93, ptr %arrayidx.i85, align 4, !tbaa !0
  ret i32 %xor.i93
}

define i32 @"10"(ptr %arrayidx165.i, ptr %elp.i, i64 %0, i64 %1, i32 %2, ptr %arrayidx100.i, ptr %arrayidx102.i, i32 %indvars.i, i32 %q.1.i, i32 %3) {
bb:
  %4 = load i32, ptr %arrayidx100.i, align 4, !tbaa !0
  %5 = load i32, ptr %arrayidx102.i, align 4, !tbaa !0
  %cmp103.i = icmp slt i32 %4, %5
  %spec.select920.i = select i1 %cmp103.i, i32 %indvars.i, i32 %q.1.i
  %add112.i = sub i32 %2, %spec.select920.i
  %sub170.i = add i32 %add112.i, %3
  %idxprom171.i = sext i32 %sub170.i to i64
  %arrayidx172.i = getelementptr inbounds [18 x [16 x i32]], ptr %elp.i, i64 %0, i64 %1, i64 %idxprom171.i
  %6 = load i32, ptr %arrayidx165.i, align 4, !tbaa !0
  store i32 %6, ptr %arrayidx172.i, align 4, !tbaa !0
  ret i32 %6
}

define i32 @"11"(ptr %arrayidx553.i, ptr %err.i, i64 %0, ptr %arrayidx512.i) {
bb:
  %1 = load i32, ptr %arrayidx512.i, align 4, !tbaa !0
  %idxprom513.i = sext i32 %1 to i64
  %arrayidx514.i = getelementptr inbounds [255 x i32], ptr %err.i, i64 %0, i64 %idxprom513.i
  %2 = load i32, ptr %arrayidx553.i, align 4, !tbaa !0
  store i32 %2, ptr %arrayidx514.i, align 4, !tbaa !0
  ret i32 %2
}

define i32 @"12"(ptr %arrayidx14.i, i32 %0, ptr %1, i32 %2, ptr %arrayidx30.i) {
bb:
  %3 = load i32, ptr %arrayidx14.i, align 4, !tbaa !0
  %xor20.i = shl i32 %3, %0
  %4 = load i32, ptr %1, align 16, !tbaa !0
  %5 = xor i32 %xor20.i, %4
  %xor22.i = xor i32 %5, %2
  store i32 %xor22.i, ptr %arrayidx30.i, align 4, !tbaa !0
  ret i32 %xor22.i
}

define i32 @"13"(ptr %arrayidx14.i, i32 %0, ptr %arrayidx30.i) {
bb:
  %1 = load i32, ptr %arrayidx14.i, align 4, !tbaa !0
  %shl28.i = shl i32 %1, %0
  store i32 %shl28.i, ptr %arrayidx30.i, align 4, !tbaa !0
  ret i32 %shl28.i
}

define i32 @"14"(ptr %index_of, i64 %0, ptr %arrayidx5.i) {
bb:
  %1 = load i32, ptr %arrayidx5.i, align 4, !tbaa !0
  %idxprom12.i = sext i32 %1 to i64
  %arrayidx13.i = getelementptr inbounds [256 x i32], ptr %index_of, i64 %0, i64 %idxprom12.i
  %2 = load i32, ptr %arrayidx13.i, align 4, !tbaa !0
  ret i32 %2
}

define i32 @"15"(ptr %alpha_to, i64 %0, ptr %arrayidx53.i, i32 %1, ptr %arrayidx149.i, ptr %arrayidx156.i) {
bb:
  %2 = load i32, ptr %arrayidx149.i, align 4, !tbaa !0
  %3 = load i32, ptr %arrayidx53.i, align 4, !tbaa !0
  %add154.i = add nsw i32 %3, %1
  %sub157.i = add i32 %add154.i, %2
  %4 = load i32, ptr %arrayidx156.i, align 4, !tbaa !0
  %add162.i = sub i32 %sub157.i, %4
  %rem163.i = srem i32 %add162.i, %1
  %idxprom164.i = sext i32 %rem163.i to i64
  %arrayidx165.i = getelementptr inbounds [256 x i32], ptr %alpha_to, i64 %0, i64 %idxprom164.i
  %5 = load i32, ptr %arrayidx165.i, align 4, !tbaa !0
  ret i32 %5
}

define i32 @"16"(ptr %arrayidx20.i, ptr %arrayidx5.i) {
bb:
  %0 = load i32, ptr %arrayidx20.i, align 4, !tbaa !0
  store i32 %0, ptr %arrayidx5.i, align 4, !tbaa !0
  ret i32 %0
}

define i32 @"17"(i32 %0, ptr %arrayidx208.i, ptr %arrayidx212.i) {
bb:
  %1 = load i32, ptr %arrayidx208.i, align 4, !tbaa !0
  %sub209.i = sub nsw i32 %0, %1
  store i32 %sub209.i, ptr %arrayidx212.i, align 4, !tbaa !0
  ret i32 %sub209.i
}

define i32 @"18"(ptr %arrayidx514.i, ptr %arrayidx532.i, ptr %err.i, i64 %0, ptr %arrayidx512.i) {
bb:
  %1 = load i32, ptr %arrayidx514.i, align 4, !tbaa !0
  %2 = load i32, ptr %arrayidx532.i, align 4, !tbaa !0
  %xor537.i = xor i32 %1, %2
  %3 = load i32, ptr %arrayidx512.i, align 4, !tbaa !0
  %idxprom513.i = sext i32 %3 to i64
  %arrayidx514.i2 = getelementptr inbounds [255 x i32], ptr %err.i, i64 %0, i64 %idxprom513.i
  store i32 %xor537.i, ptr %arrayidx514.i, align 4, !tbaa !0
  ret i32 %xor537.i
}

define i32 @"19"(ptr %alpha_to, i64 %0, ptr %arrayidx527.i, i32 %1, ptr %arrayidx521.i, i32 %2) {
bb:
  %3 = load i32, ptr %arrayidx527.i, align 4, !tbaa !0
  %mul528.i = mul nsw i32 %3, %1
  %4 = load i32, ptr %arrayidx521.i, align 4, !tbaa !0
  %add529.i = add nsw i32 %mul528.i, %4
  %rem530.i = srem i32 %add529.i, %2
  %idxprom531.i = sext i32 %rem530.i to i64
  %arrayidx532.i = getelementptr inbounds [256 x i32], ptr %alpha_to, i64 %0, i64 %idxprom531.i
  %5 = load i32, ptr %arrayidx532.i, align 4, !tbaa !0
  ret i32 %5
}

define i32 @"20"(ptr %alpha_to, i64 %0, ptr %arrayidx553.i, i32 %1, ptr %arrayidx575.i, i32 %q.6958.i) {
bb:
  %2 = load i32, ptr %arrayidx553.i, align 4, !tbaa !0
  %sub586.i = add i32 %2, %1
  %3 = load i32, ptr %arrayidx575.i, align 4, !tbaa !0
  %add576.i = add nsw i32 %3, %q.6958.i
  %rem581.i = srem i32 %add576.i, %1
  %add587.i = sub i32 %sub586.i, %rem581.i
  %rem588.i = srem i32 %add587.i, %1
  %idxprom589.i = sext i32 %rem588.i to i64
  %arrayidx590.i = getelementptr inbounds [256 x i32], ptr %alpha_to, i64 %0, i64 %idxprom589.i
  %4 = load i32, ptr %arrayidx590.i, align 4, !tbaa !0
  ret i32 %4
}

define i32 @"21"(ptr %alpha_to, i64 %0, ptr %arrayidx553.i, i32 %1, i32 %rem581.i) {
bb:
  %2 = load i32, ptr %arrayidx553.i, align 4, !tbaa !0
  %sub586.i = add i32 %2, %1
  %add587.i = sub i32 %sub586.i, %rem581.i
  %rem588.i = srem i32 %add587.i, %1
  %idxprom589.i = sext i32 %rem588.i to i64
  %arrayidx590.i = getelementptr inbounds [256 x i32], ptr %alpha_to, i64 %0, i64 %idxprom589.i
  %3 = load i32, ptr %arrayidx590.i, align 4, !tbaa !0
  ret i32 %3
}

define i32 @"22"(ptr %index_of, i64 %0, ptr %arrayidx572.i, i32 %1) {
bb:
  %2 = load i32, ptr %arrayidx572.i, align 4, !tbaa !0
  %xor573.i = xor i32 %2, %1
  %idxprom574.i = sext i32 %xor573.i to i64
  %arrayidx575.i = getelementptr inbounds [256 x i32], ptr %index_of, i64 %0, i64 %idxprom574.i
  %3 = load i32, ptr %arrayidx575.i, align 4, !tbaa !0
  ret i32 %3
}

define i32 @"23"(ptr %arrayidx15.i, ptr %arrayidx20.i, ptr %arrayidx5.i) {
bb:
  %0 = load i32, ptr %arrayidx15.i, align 4, !tbaa !0
  %1 = load i32, ptr %arrayidx20.i, align 4, !tbaa !0
  %xor.i77 = xor i32 %0, %1
  store i32 %xor.i77, ptr %arrayidx5.i, align 4, !tbaa !0
  ret i32 %xor.i77
}

define i32 @"24"(ptr %arrayidx, ptr %arrayidx2) {
bb:
  %0 = load i8, ptr %arrayidx, align 1, !tbaa !4
  %conv = zext i8 %0 to i32
  store i32 %conv, ptr %arrayidx2, align 4, !tbaa !0
  ret i32 %conv
}

define i32 @"25"(ptr %l.i, i64 %0, ptr %arrayidx100.i, ptr %arrayidx102.i, i32 %indvars.i, i32 %q.1.i) {
bb:
  %1 = load i32, ptr %arrayidx100.i, align 4, !tbaa !0
  %2 = load i32, ptr %arrayidx102.i, align 4, !tbaa !0
  %cmp103.i = icmp slt i32 %1, %2
  %spec.select920.i = select i1 %cmp103.i, i32 %indvars.i, i32 %q.1.i
  %idxprom110.i = sext i32 %spec.select920.i to i64
  %arrayidx111.i = getelementptr inbounds [18 x i32], ptr %l.i, i64 %0, i64 %idxprom110.i
  %3 = load i32, ptr %arrayidx111.i, align 4, !tbaa !0
  ret i32 %3
}

define i32 @"26"(ptr %arrayidx339.i, i32 %0, i32 %1) {
bb:
  %2 = load i32, ptr %arrayidx339.i, align 4, !tbaa !0
  %add344.i = add nsw i32 %2, %0
  %rem345.i = srem i32 %add344.i, %1
  store i32 %rem345.i, ptr %arrayidx339.i, align 4, !tbaa !0
  ret i32 %rem345.i
}

!0 = !{!1, !1, i64 0}
!1 = !{!"int", !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = !{!2, !2, i64 0}
