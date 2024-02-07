; ModuleID = 'lowercase-idioms'
source_filename = "lowercase-idioms"
target triple = "riscv64"

define i16 @"0"(ptr %arrayidx.i.i, i16 %0, i16 %1, i16 %2, i16 %3, ptr %arrayidx3.i.i) {
bb:
  %4 = load i16, ptr %arrayidx.i.i, align 2, !tbaa !0, !alias.scope !4, !noalias !7
  %5 = add i16 %4, %0
  %6 = icmp ult i16 %5, %1
  %shl.i.i.i = select i1 %6, i16 %2, i16 %3
  %or.i.i.i = or i16 %shl.i.i.i, %4
  store i16 %or.i.i.i, ptr %arrayidx3.i.i, align 2, !tbaa !0, !alias.scope !7, !noalias !4
  ret i16 %or.i.i.i
}

!0 = !{!1, !1, i64 0}
!1 = !{!"short", !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = !{!5}
!5 = distinct !{!5, !6, !"lower_StringImpl: %data"}
!6 = distinct !{!6, !"lower_StringImpl"}
!7 = !{!8}
!8 = distinct !{!8, !6, !"lower_StringImpl: %output"}
