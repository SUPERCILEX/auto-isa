; ModuleID = 'pointer_chase-idioms'
source_filename = "pointer_chase-idioms"
target triple = "riscv64"

%struct.Data = type { i32, i32 }
%struct.Node = type { i32, i32, i32, i32, ptr, ptr }

define i32 @"0"(ptr %data) {
bb:
  %0 = load ptr, ptr %data, align 8, !tbaa !0
  %1 = load i32, ptr %0, align 4, !tbaa !6
  ret i32 %1
}

define i32 @"1"(ptr %data, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %data, align 8, !tbaa !0
  %data12 = getelementptr inbounds %struct.Data, ptr %2, i64 %0, i32 1
  %3 = load i32, ptr %data12, align 4, !tbaa !8
  ret i32 %3
}

define i32 @"2"(ptr %data12, ptr %0, ptr %result) {
bb:
  %1 = load i32, ptr %0, align 4, !tbaa !6
  %2 = load i32, ptr %data12, align 4, !tbaa !8
  %add = add nsw i32 %2, %1
  %result.promoted = load i32, ptr %result, align 4, !tbaa !9
  %add3 = add nsw i32 %add, %result.promoted
  store i32 %add3, ptr %result, align 4, !tbaa !9
  ret i32 %add3
}

define i32 @"3"(ptr %data12, ptr %0, i32 %add39, ptr %result) {
bb:
  %1 = load i32, ptr %0, align 4, !tbaa !6
  %2 = load i32, ptr %data12, align 4, !tbaa !8
  %add = add nsw i32 %2, %1
  %add3 = add nsw i32 %add, %add39
  store i32 %add3, ptr %result, align 4, !tbaa !9
  ret i32 %add3
}

define ptr @"4"(ptr %next, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %next, align 8, !tbaa !10
  %data = getelementptr inbounds %struct.Node, ptr %2, i64 %0, i32 5
  %3 = load ptr, ptr %data, align 8, !tbaa !0
  ret ptr %3
}

!0 = !{!1, !5, i64 24}
!1 = !{!"Node", !2, i64 0, !2, i64 4, !2, i64 8, !2, i64 12, !5, i64 16, !5, i64 24}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!"any pointer", !3, i64 0}
!6 = !{!7, !2, i64 0}
!7 = !{!"Data", !2, i64 0, !2, i64 4}
!8 = !{!7, !2, i64 4}
!9 = !{!2, !2, i64 0}
!10 = !{!1, !5, i64 16}
