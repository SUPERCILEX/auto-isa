; ModuleID = 'loop_sum_branch-idioms'
source_filename = "loop_sum_branch-idioms"
target triple = "riscv64"

define i32 @"0"(i32 %storemerge1112, ptr %arrayidx, i32 %0, ptr %output) {
bb:
  %1 = load i32, ptr %arrayidx, align 4, !tbaa !0
  %mul = shl nsw i32 %1, %0
  %add = add nsw i32 %storemerge1112, %mul
  store i32 %add, ptr %output, align 4, !tbaa !0
  ret i32 %add
}

define i32 @"1"(ptr %arrayidx3, i32 %0, ptr %output) {
bb:
  %output.promoted = load i32, ptr %output, align 4, !tbaa !0
  %1 = load i32, ptr %arrayidx3, align 4, !tbaa !0
  %add4 = add nsw i32 %1, %0
  %add5 = add nsw i32 %add4, %output.promoted
  store i32 %add5, ptr %output, align 4, !tbaa !0
  ret i32 %add5
}

!0 = !{!1, !1, i64 0}
!1 = !{!"int", !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
