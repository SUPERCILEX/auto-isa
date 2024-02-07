; ModuleID = 'queens-idioms'
source_filename = "queens-idioms"
target triple = "riscv64"

define i32 @"0"(ptr %bakdiag, i64 %0, i32 %add, ptr %files) {
bb:
  %1 = load i32, ptr %files, align 4, !tbaa !0
  %sub = add i32 %add, %1
  %idxprom5 = sext i32 %sub to i64
  %arrayidx6 = getelementptr inbounds [199 x i32], ptr %bakdiag, i64 %0, i64 %idxprom5
  %2 = load i32, ptr %arrayidx6, align 4, !tbaa !0
  ret i32 %2
}

define i8 @"1"(ptr %arrayidx1) {
bb:
  %0 = load ptr, ptr %arrayidx1, align 8, !tbaa !4
  %1 = load i8, ptr %0, align 1, !tbaa !6
  ret i8 %1
}

define i8 @"2"(ptr %arrayidx1, i64 %0) {
bb:
  %1 = load ptr, ptr %arrayidx1, align 8, !tbaa !4
  %incdec.ptr89 = getelementptr inbounds i8, ptr %1, i64 %0
  %2 = load i8, ptr %incdec.ptr89, align 1, !tbaa !6
  ret i8 %2
}

define i64 @"3"(ptr %solutions, i64 %0) {
bb:
  %1 = load i64, ptr %solutions, align 8, !tbaa !7
  %inc = add i64 %1, %0
  store i64 %inc, ptr %solutions, align 8, !tbaa !7
  ret i64 %inc
}

define ptr @"4"(ptr %argv, ptr %progname) {
bb:
  %0 = load ptr, ptr %argv, align 8, !tbaa !4
  store ptr %0, ptr %progname, align 8, !tbaa !4
  ret ptr %0
}

define i8 @"5"(ptr %arrayidx1, i64 %0) {
bb:
  %1 = load ptr, ptr %arrayidx1, align 8, !tbaa !4
  %incdec.ptr89 = getelementptr inbounds i8, ptr %1, i64 %0
  %incdec.ptr = getelementptr inbounds i8, ptr %incdec.ptr89, i64 %0
  %2 = load i8, ptr %incdec.ptr, align 1, !tbaa !6
  ret i8 %2
}

define i32 @"6"(i32 %level, ptr %bakdiag, i64 %0, i32 %add, ptr %files) {
bb:
  %1 = load i32, ptr %files, align 4, !tbaa !0
  %sub = add i32 %add, %1
  %idxprom5 = sext i32 %sub to i64
  %arrayidx6 = getelementptr inbounds [199 x i32], ptr %bakdiag, i64 %0, i64 %idxprom5
  store i32 %level, ptr %arrayidx6, align 4, !tbaa !0
  ret i32 %level
}

!0 = !{!1, !1, i64 0}
!1 = !{!"int", !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !2, i64 0}
!6 = !{!2, !2, i64 0}
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !2, i64 0}
