; ModuleID = 'evalloop-idioms'
source_filename = "evalloop-idioms"
target triple = "riscv64"

define i32 @"0"(ptr %sum, i32 %code) {
bb:
  %0 = load i32, ptr %sum, align 4, !tbaa !0
  %add = add i32 %0, %code
  store i32 %add, ptr %sum, align 4, !tbaa !0
  ret i32 %add
}

define ptr @"1"(ptr %eval.dispatch, i64 %0, ptr %p.addr.32.sink277) {
bb:
  %1 = load i32, ptr %p.addr.32.sink277, align 4, !tbaa !0
  %idxprom121 = sext i32 %1 to i64
  %arrayidx122 = getelementptr inbounds [32 x ptr], ptr %eval.dispatch, i64 %0, i64 %idxprom121
  %indirect.goto.dest = load ptr, ptr %arrayidx122, align 8, !tbaa !4
  ret ptr %indirect.goto.dest
}

!0 = !{!1, !1, i64 0}
!1 = !{!"int", !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !2, i64 0}
