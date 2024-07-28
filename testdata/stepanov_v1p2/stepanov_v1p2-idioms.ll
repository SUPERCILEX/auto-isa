; ModuleID = 'stepanov_v1p2-idioms'
source_filename = "stepanov_v1p2-idioms"
target triple = "riscv64"

define double @"0"(ptr %rdpb, i64 %0) {
bb:
  %agg.tmp13.sroa.0.0.copyload = load ptr, ptr %rdpb, align 8, !tbaa.struct !0
  %incdec.ptr.i.i.i.i155 = getelementptr inbounds double, ptr %agg.tmp13.sroa.0.0.copyload, i64 %0
  %1 = load double, ptr %incdec.ptr.i.i.i.i155, align 8, !tbaa !5
  ret double %1
}

define double @"1"(i64 %call.i16, ptr %start_time, double %0, double %1, ptr %result_times, i64 %2, ptr %current_test) {
bb:
  %3 = load i32, ptr %current_test, align 4, !tbaa !7
  %idxprom9 = sext i32 %3 to i64
  %arrayidx10 = getelementptr inbounds [20 x double], ptr %result_times, i64 %2, i64 %idxprom9
  %4 = load i64, ptr %start_time, align 8, !tbaa !9
  %sub.i = sub nsw i64 %call.i16, %4
  %conv.i = sitofp i64 %sub.i to double
  %div.i = fdiv double %conv.i, %0
  %add.i = fadd double %div.i, %1
  store double %add.i, ptr %arrayidx10, align 8, !tbaa !5
  ret double %add.i
}

define double @"2"(double %0, ptr %dpb) {
bb:
  %1 = load ptr, ptr %dpb, align 8, !tbaa !1
  store double %0, ptr %1, align 8, !tbaa !5
  ret double %0
}

define double @"3"(ptr %dpb, i64 %indvars.iv.i) {
bb:
  %0 = load ptr, ptr %dpb, align 8, !tbaa !1
  %arrayidx.i = getelementptr inbounds double, ptr %0, i64 %indvars.iv.i
  %1 = load double, ptr %arrayidx.i, align 8, !tbaa !5
  ret double %1
}

define double @"4"(ptr %dpb) {
bb:
  %0 = load ptr, ptr %dpb, align 8, !tbaa !1
  %1 = load double, ptr %0, align 8, !tbaa !5
  ret double %1
}

define i32 @"5"(ptr %current_test, i32 %0) {
bb:
  %1 = load i32, ptr %current_test, align 4, !tbaa !7
  %inc8 = add nsw i32 %1, %0
  store i32 %inc8, ptr %current_test, align 4, !tbaa !7
  ret i32 %inc8
}

!0 = !{i64 0, i64 8, !1}
!1 = !{!2, !2, i64 0}
!2 = !{!"any pointer", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !3, i64 0}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !3, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"long", !3, i64 0}
