; ModuleID = 'exptree-idioms'
source_filename = "exptree-idioms"
target triple = "riscv64"

%struct.Comb = type { i32, i32, i32 }

define i32 @"0"(ptr %workList, i32 %add, ptr %listLength) {
bb:
  %0 = load ptr, ptr %workList, align 8, !tbaa !0
  %1 = load i32, ptr %listLength, align 4, !tbaa !4
  %sub = add i32 %add, %1
  %idxprom = sext i32 %sub to i64
  %arrayidx = getelementptr inbounds i32, ptr %0, i64 %idxprom
  %2 = load i32, ptr %arrayidx, align 4, !tbaa !4
  ret i32 %2
}

define i32 @"1"(ptr %operand2.i134, i32 %working1.0, ptr %workList, ptr %listLength, i32 %searchDepth) {
bb:
  %0 = load ptr, ptr %workList, align 8, !tbaa !0
  %1 = load i32, ptr %listLength, align 4, !tbaa !4
  %add73 = add nsw i32 %1, %searchDepth
  %idxprom74 = sext i32 %add73 to i64
  %arrayidx75 = getelementptr inbounds i32, ptr %0, i64 %idxprom74
  %2 = load i32, ptr %operand2.i134, align 4, !tbaa !6
  %add.i = add nsw i32 %2, %working1.0
  store i32 %add.i, ptr %arrayidx75, align 4, !tbaa !4
  ret i32 %add.i
}

define i32 @"2"(ptr %arrayidx.i, ptr %solution, i64 %indvars.iv.i) {
bb:
  %0 = load i32, ptr %arrayidx.i, align 4, !tbaa !8
  %1 = load ptr, ptr %solution, align 8, !tbaa !0
  %arrayidx2.i = getelementptr inbounds %struct.Comb, ptr %1, i64 %indvars.iv.i
  store i32 %0, ptr %arrayidx2.i, align 4, !tbaa !8
  ret i32 %0
}

define i32 @"3"(ptr %arrayidx32, ptr %operand29.i, ptr %workList, ptr %listLength, i32 %searchDepth) {
bb:
  %0 = load ptr, ptr %workList, align 8, !tbaa !0
  %1 = load i32, ptr %listLength, align 4, !tbaa !4
  %add73 = add nsw i32 %1, %searchDepth
  %idxprom74 = sext i32 %add73 to i64
  %arrayidx75 = getelementptr inbounds i32, ptr %0, i64 %idxprom74
  %2 = load i32, ptr %operand29.i, align 4, !tbaa !6
  %3 = load i32, ptr %arrayidx32, align 4, !tbaa !4
  %div.i = sdiv i32 %3, %2
  store i32 %div.i, ptr %arrayidx75, align 4, !tbaa !4
  ret i32 %div.i
}

define i32 @"4"(ptr %arrayidx, ptr %arrayidx2) {
bb:
  %0 = load i32, ptr %arrayidx, align 4, !tbaa !4
  store i32 %0, ptr %arrayidx2, align 4, !tbaa !4
  ret i32 %0
}

define i32 @"5"(ptr %operand26.i, i32 %working1.0, ptr %workList, ptr %listLength, i32 %searchDepth) {
bb:
  %0 = load ptr, ptr %workList, align 8, !tbaa !0
  %1 = load i32, ptr %listLength, align 4, !tbaa !4
  %add73 = add nsw i32 %1, %searchDepth
  %idxprom74 = sext i32 %add73 to i64
  %arrayidx75 = getelementptr inbounds i32, ptr %0, i64 %idxprom74
  %2 = load i32, ptr %operand26.i, align 4, !tbaa !6
  %mul.i = mul nsw i32 %2, %working1.0
  store i32 %mul.i, ptr %arrayidx75, align 4, !tbaa !4
  ret i32 %mul.i
}

define i32 @"6"(i32 %working1.0, ptr %operand23.i, ptr %workList, ptr %listLength, i32 %searchDepth) {
bb:
  %0 = load ptr, ptr %workList, align 8, !tbaa !0
  %1 = load i32, ptr %listLength, align 4, !tbaa !4
  %add73 = add nsw i32 %1, %searchDepth
  %idxprom74 = sext i32 %add73 to i64
  %arrayidx75 = getelementptr inbounds i32, ptr %0, i64 %idxprom74
  %2 = load i32, ptr %operand23.i, align 4, !tbaa !6
  %sub.i = sub nsw i32 %working1.0, %2
  store i32 %sub.i, ptr %arrayidx75, align 4, !tbaa !4
  ret i32 %sub.i
}

define i32 @"7"(ptr %arrayidx32, ptr %combList, i64 %idxprom62) {
bb:
  %0 = load ptr, ptr %combList, align 8, !tbaa !0
  %arrayidx63 = getelementptr inbounds %struct.Comb, ptr %0, i64 %idxprom62
  %1 = load i32, ptr %arrayidx32, align 4, !tbaa !4
  store i32 %1, ptr %arrayidx63, align 4, !tbaa !8
  ret i32 %1
}

define i32 @"8"(i32 %working1.0, ptr %combList, i64 %idxprom62) {
bb:
  %0 = load ptr, ptr %combList, align 8, !tbaa !0
  %arrayidx63 = getelementptr inbounds %struct.Comb, ptr %0, i64 %idxprom62
  store i32 %working1.0, ptr %arrayidx63, align 4, !tbaa !8
  ret i32 %working1.0
}

define i32 @"9"(ptr %combList, i64 %indvars.iv.i) {
bb:
  %0 = load ptr, ptr %combList, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds %struct.Comb, ptr %0, i64 %indvars.iv.i
  %1 = load i32, ptr %arrayidx.i, align 4, !tbaa !8
  ret i32 %1
}

define i32 @"10"(i32 %retval.0.i, ptr %workList, ptr %listLength, i32 %searchDepth) {
bb:
  %0 = load ptr, ptr %workList, align 8, !tbaa !0
  %1 = load i32, ptr %listLength, align 4, !tbaa !4
  %add73 = add nsw i32 %1, %searchDepth
  %idxprom74 = sext i32 %add73 to i64
  %arrayidx75 = getelementptr inbounds i32, ptr %0, i64 %idxprom74
  store i32 %retval.0.i, ptr %arrayidx75, align 4, !tbaa !4
  ret i32 %retval.0.i
}

define i32 @"11"(ptr %nbNodes, i32 %0) {
bb:
  %1 = load i32, ptr %nbNodes, align 4, !tbaa !4
  %inc = add nsw i32 %1, %0
  store i32 %inc, ptr %nbNodes, align 4, !tbaa !4
  ret i32 %inc
}

!0 = !{!1, !1, i64 0}
!1 = !{!"any pointer", !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !2, i64 0}
!6 = !{!7, !5, i64 4}
!7 = !{!"", !5, i64 0, !5, i64 4, !5, i64 8}
!8 = !{!7, !5, i64 0}
