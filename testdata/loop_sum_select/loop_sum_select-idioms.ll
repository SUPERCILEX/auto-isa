; ModuleID = 'loop_sum_select-idioms'
source_filename = "loop_sum_select-idioms"
target triple = "riscv64"

define i32 @"0"(ptr %output, i1 %cmp1, ptr %arrayidx, i32 %0, i32 %1) {
bb:
  %2 = load i32, ptr %arrayidx, align 4, !tbaa !0
  %add4 = add nsw i32 %2, %1
  %mul = shl nsw i32 %2, %0
  %storemerge.v = select i1 %cmp1, i32 %mul, i32 %add4
  %output.promoted = load i32, ptr %output, align 4, !tbaa !0
  %storemerge = add nsw i32 %output.promoted, %storemerge.v
  store i32 %storemerge, ptr %output, align 4, !tbaa !0
  ret i32 %storemerge
}

!0 = !{!1, !1, i64 0}
!1 = !{!"int", !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
