; ModuleID = 'himenobmtxpa-idioms'
source_filename = "himenobmtxpa-idioms"
target triple = "riscv64"

define float @"0"(ptr %p, i64 %indvars.iv, i64 %indvars.iv1162, ptr %mdeps, ptr %mcols, i32 %0) {
bb:
  %1 = load i32, ptr %mdeps, align 4, !tbaa !0
  %2 = sext i32 %1 to i64
  %3 = mul nsw i64 %indvars.iv1162, %2
  %4 = load i32, ptr %mcols, align 8, !tbaa !6
  %mul34 = mul i32 %1, %4
  %mul36 = mul i32 %mul34, %0
  %5 = sext i32 %mul36 to i64
  %6 = add nsw i64 %3, %5
  %7 = add nsw i64 %indvars.iv, %6
  %8 = load ptr, ptr %p, align 8, !tbaa !7
  %arrayidx43 = getelementptr inbounds float, ptr %8, i64 %7
  %9 = load float, ptr %arrayidx43, align 4, !tbaa !8
  ret float %9
}

define float @"1"(float %0, ptr %wrk2, i64 %indvars.iv, ptr %mcols639, i32 %1, i32 %2, ptr %mdeps641) {
bb:
  %3 = load i32, ptr %mcols639, align 8, !tbaa !6
  %mul644 = mul nsw i32 %3, %1
  %mul6461107 = add i32 %mul644, %2
  %4 = load i32, ptr %mdeps641, align 4, !tbaa !0
  %add650 = mul i32 %mul6461107, %4
  %5 = sext i32 %add650 to i64
  %6 = add nsw i64 %indvars.iv, %5
  %7 = load ptr, ptr %wrk2, align 8, !tbaa !7
  %arrayidx653 = getelementptr inbounds float, ptr %7, i64 %6
  store float %0, ptr %arrayidx653, align 4, !tbaa !8
  ret float %0
}

define float @"2"(ptr %a, i64 %indvars.iv, ptr %mrows12, i32 %0, i32 %1, ptr %mcols13, i32 %2, ptr %mdeps15) {
bb:
  %3 = load ptr, ptr %a, align 8, !tbaa !7
  %4 = load i32, ptr %mdeps15, align 4, !tbaa !0
  %5 = load i32, ptr %mcols13, align 8, !tbaa !6
  %6 = load i32, ptr %mrows12, align 4, !tbaa !10
  %mul85 = shl nsw i32 %6, %0
  %mul871085 = add i32 %mul85, %1
  %mul891084 = mul i32 %mul871085, %5
  %add941086 = add i32 %mul891084, %2
  %add97 = mul i32 %add941086, %4
  %7 = sext i32 %add97 to i64
  %8 = add nsw i64 %indvars.iv, %7
  %arrayidx100 = getelementptr inbounds float, ptr %3, i64 %8
  %9 = load float, ptr %arrayidx100, align 4, !tbaa !8
  ret float %9
}

define float @"3"(ptr %a, i64 %indvars.iv, ptr %mrows12, i32 %0, ptr %mcols13, i32 %1, ptr %mdeps15) {
bb:
  %2 = load ptr, ptr %a, align 8, !tbaa !7
  %3 = load i32, ptr %mdeps15, align 4, !tbaa !0
  %4 = load i32, ptr %mcols13, align 8, !tbaa !6
  %5 = load i32, ptr %mrows12, align 4, !tbaa !10
  %mul491082 = add i32 %5, %0
  %mul511081 = mul i32 %mul491082, %4
  %add561083 = add i32 %mul511081, %1
  %add59 = mul i32 %add561083, %3
  %6 = sext i32 %add59 to i64
  %7 = add nsw i64 %indvars.iv, %6
  %arrayidx62 = getelementptr inbounds float, ptr %2, i64 %7
  %8 = load float, ptr %arrayidx62, align 4, !tbaa !8
  ret float %8
}

define float @"4"(ptr %arrayidx686, ptr %p, i64 %indvars.iv1192, i32 %i.11124, ptr %mcols, i32 %0, ptr %mdeps) {
bb:
  %1 = load float, ptr %arrayidx686, align 4, !tbaa !8
  %2 = load i32, ptr %mcols, align 8, !tbaa !6
  %mul695 = mul nsw i32 %i.11124, %2
  %mul6971080 = add i32 %mul695, %0
  %3 = load i32, ptr %mdeps, align 4, !tbaa !0
  %add701 = mul i32 %mul6971080, %3
  %4 = sext i32 %add701 to i64
  %5 = add nsw i64 %indvars.iv1192, %4
  %6 = load ptr, ptr %p, align 8, !tbaa !7
  %arrayidx704 = getelementptr inbounds float, ptr %6, i64 %5
  store float %1, ptr %arrayidx704, align 4, !tbaa !8
  ret float %1
}

define float @"5"(ptr %a, i64 %indvars.iv, ptr %mrows12, i32 %0, i32 %1, ptr %mcols13, i32 %2, ptr %mdeps15) {
bb:
  %3 = load ptr, ptr %a, align 8, !tbaa !7
  %4 = load i32, ptr %mrows12, align 4, !tbaa !10
  %mul562 = mul nsw i32 %4, %0
  %mul5641103 = add i32 %mul562, %1
  %5 = load i32, ptr %mcols13, align 8, !tbaa !6
  %mul5661102 = mul i32 %mul5641103, %5
  %add5711105 = add i32 %mul5661102, %2
  %6 = load i32, ptr %mdeps15, align 4, !tbaa !0
  %add574 = mul i32 %add5711105, %6
  %7 = sext i32 %add574 to i64
  %8 = add nsw i64 %indvars.iv, %7
  %arrayidx577 = getelementptr inbounds float, ptr %3, i64 %8
  %9 = load float, ptr %arrayidx577, align 4, !tbaa !8
  ret float %9
}

define float @"6"(float %conv, ptr %mrows, i32 %0, ptr %Mat, i64 %indvars.iv, ptr %mdeps, ptr %mcols, i32 %i.057, i32 %1) {
bb:
  %2 = load i32, ptr %mrows, align 4, !tbaa !10
  %sub = add nsw i32 %2, %0
  %mul10 = mul nsw i32 %sub, %sub
  %conv11 = sitofp i32 %mul10 to float
  %div = fdiv float %conv, %conv11
  %3 = load i32, ptr %mdeps, align 4, !tbaa !0
  %4 = load i32, ptr %mcols, align 8, !tbaa !6
  %mul19 = mul nsw i32 %4, %i.057
  %mul2151 = add i32 %mul19, %1
  %add24 = mul i32 %3, %mul2151
  %5 = sext i32 %add24 to i64
  %6 = add nsw i64 %indvars.iv, %5
  %7 = load ptr, ptr %Mat, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds float, ptr %7, i64 %6
  store float %div, ptr %arrayidx, align 4, !tbaa !8
  ret float %div
}

define float @"7"(float %val, ptr %Mat, i64 %indvars.iv, ptr %mdeps, ptr %mcols, ptr %mrows, i32 %l, i32 %i.049, i32 %0) {
bb:
  %1 = load i32, ptr %mdeps, align 4, !tbaa !0
  %2 = load i32, ptr %mrows, align 4, !tbaa !10
  %mul = mul nsw i32 %2, %l
  %mul942 = add i32 %mul, %i.049
  %3 = load i32, ptr %mcols, align 8, !tbaa !6
  %mul1141 = mul i32 %3, %mul942
  %add43 = add i32 %mul1141, %0
  %add18 = mul i32 %1, %add43
  %4 = sext i32 %add18 to i64
  %5 = add nsw i64 %indvars.iv, %4
  %6 = load ptr, ptr %Mat, align 8, !tbaa !7
  %arrayidx = getelementptr inbounds float, ptr %6, i64 %5
  store float %val, ptr %arrayidx, align 4, !tbaa !8
  ret float %val
}

define float @"8"(ptr %a, i64 %indvars.iv, ptr %mcols13, i32 %0, i32 %1, ptr %mdeps15) {
bb:
  %2 = load ptr, ptr %a, align 8, !tbaa !7
  %3 = load i32, ptr %mdeps15, align 4, !tbaa !0
  %4 = load i32, ptr %mcols13, align 8, !tbaa !6
  %mul18 = mul nsw i32 %4, %0
  %mul201104 = add i32 %mul18, %1
  %add23 = mul i32 %mul201104, %3
  %5 = sext i32 %add23 to i64
  %6 = add nsw i64 %indvars.iv, %5
  %arrayidx = getelementptr inbounds float, ptr %2, i64 %6
  %7 = load float, ptr %arrayidx, align 4, !tbaa !8
  ret float %7
}

define i32 @"9"(ptr %tm, ptr %second.base_sec) {
bb:
  %0 = load i64, ptr %tm, align 8, !tbaa !11
  %conv = trunc i64 %0 to i32
  store i32 %conv, ptr %second.base_sec, align 4, !tbaa !14
  ret i32 %conv
}

!0 = !{!1, !5, i64 20}
!1 = !{!"Mat", !2, i64 0, !5, i64 8, !5, i64 12, !5, i64 16, !5, i64 20}
!2 = !{!"any pointer", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!"int", !3, i64 0}
!6 = !{!1, !5, i64 16}
!7 = !{!1, !2, i64 0}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !3, i64 0}
!10 = !{!1, !5, i64 12}
!11 = !{!12, !13, i64 0}
!12 = !{!"timeval", !13, i64 0, !13, i64 8}
!13 = !{!"long", !3, i64 0}
!14 = !{!5, !5, i64 0}
