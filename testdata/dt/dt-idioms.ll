; ModuleID = 'dt-idioms'
source_filename = "dt-idioms"
target triple = "riscv64"

define double @"0"(ptr %dvec2, i64 %i.012.i) {
bb:
  %0 = load ptr, ptr %dvec2, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds double, ptr %0, i64 %i.012.i
  %1 = load double, ptr %arrayidx.i, align 8, !tbaa !4, !alias.scope !6, !noalias !9
  ret double %1
}

define double @"1"(ptr %dvec1) {
bb:
  %0 = load ptr, ptr %dvec1, align 8, !tbaa !0
  %1 = load double, ptr %0, align 8, !tbaa !4
  ret double %1
}

define double @"2"(ptr %arrayidx4.i, ptr %arrayidx.i, ptr %dvec1, i64 %i.012.i) {
bb:
  %0 = load ptr, ptr %dvec1, align 8, !tbaa !0
  %arrayidx4.i2 = getelementptr inbounds double, ptr %0, i64 %i.012.i
  %1 = load double, ptr %arrayidx4.i, align 8, !tbaa !4, !alias.scope !9, !noalias !6
  %2 = load double, ptr %arrayidx.i, align 8, !tbaa !4, !alias.scope !6, !noalias !9
  %div.i = fdiv double %1, %2
  store double %div.i, ptr %arrayidx4.i, align 8, !tbaa !4, !alias.scope !9, !noalias !6
  ret double %div.i
}

define double @"3"(double %mul, ptr %dvec1, i64 %i.018) {
bb:
  %0 = load ptr, ptr %dvec1, align 8, !tbaa !0
  %arrayidx = getelementptr inbounds double, ptr %0, i64 %i.018
  store double %mul, ptr %arrayidx, align 8, !tbaa !4
  ret double %mul
}

!0 = !{!1, !1, i64 0}
!1 = !{!"any pointer", !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !2, i64 0}
!6 = !{!7}
!7 = distinct !{!7, !8, !"double_array_divs_variable: %dvec2"}
!8 = distinct !{!8, !"double_array_divs_variable"}
!9 = !{!10}
!10 = distinct !{!10, !8, !"double_array_divs_variable: %dvec1"}
