; ModuleID = 'loop_sum_simple-idioms'
source_filename = "loop_sum_simple-idioms"
target triple = "riscv64"

define i32 @"0"(ptr %arrayidx2, ptr %arrayidx, ptr %output) {
bb:
  %0 = load i32, ptr %arrayidx, align 4, !tbaa !0
  %1 = load i32, ptr %arrayidx2, align 4, !tbaa !0
  %add = add nsw i32 %1, %0
  %output.promoted = load i32, ptr %output, align 4, !tbaa !0
  %add3 = add nsw i32 %add, %output.promoted
  store i32 %add3, ptr %output, align 4, !tbaa !0
  ret i32 %add3
}

!0 = !{!1, !1, i64 0}
!1 = !{!"int", !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
