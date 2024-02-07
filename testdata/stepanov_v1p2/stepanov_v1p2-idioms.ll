; ModuleID = 'stepanov_v1p2-idioms'
source_filename = "stepanov_v1p2-idioms"
target triple = "riscv64"

define double @"0"(double %0, ptr %dpb) {
bb:
  %1 = load ptr, ptr %dpb, align 8, !tbaa !0
  store double %0, ptr %1, align 8, !tbaa !4
  ret double %0
}

define i32 @"1"(ptr %current_test, i32 %0) {
bb:
  %1 = load i32, ptr %current_test, align 4, !tbaa !6
  %inc8 = add nsw i32 %1, %0
  store i32 %inc8, ptr %current_test, align 4, !tbaa !6
  ret i32 %inc8
}

define double @"2"(ptr %dpb, i64 %indvars.iv.i) {
bb:
  %0 = load ptr, ptr %dpb, align 8, !tbaa !0
  %arrayidx.i = getelementptr inbounds double, ptr %0, i64 %indvars.iv.i
  %1 = load double, ptr %arrayidx.i, align 8, !tbaa !4
  ret double %1
}

define double @"3"(i64 %call.i16, ptr %start_time, double %0, double %1, ptr %result_times, i64 %2, ptr %current_test) {
bb:
  %3 = load i64, ptr %start_time, align 8, !tbaa !8
  %sub.i = sub nsw i64 %call.i16, %3
  %conv.i = sitofp i64 %sub.i to double
  %div.i = fdiv double %conv.i, %0
  %add.i = fadd double %div.i, %1
  %4 = load i32, ptr %current_test, align 4, !tbaa !6
  %idxprom9 = sext i32 %4 to i64
  %arrayidx10 = getelementptr inbounds [20 x double], ptr %result_times, i64 %2, i64 %idxprom9
  store double %add.i, ptr %arrayidx10, align 8, !tbaa !4
  ret double %add.i
}

define double @"4"(ptr %rdpb, i64 %0) {
bb:
  %agg.tmp13.sroa.0.0.copyload = load ptr, ptr %rdpb, align 8, !tbaa.struct !10
  %incdec.ptr.i.i.i.i155 = getelementptr inbounds double, ptr %agg.tmp13.sroa.0.0.copyload, i64 %0
  %1 = load double, ptr %incdec.ptr.i.i.i.i155, align 8, !tbaa !4
  ret double %1
}

define double @"5"(ptr %dpb) {
bb:
  %0 = load ptr, ptr %dpb, align 8, !tbaa !0
  %1 = load double, ptr %0, align 8, !tbaa !4
  ret double %1
}

!0 = !{!1, !1, i64 0}
!1 = !{!"any pointer", !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C++ TBAA"}
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !2, i64 0}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !2, i64 0}
!8 = !{!9, !9, i64 0}
!9 = !{!"long", !2, i64 0}
!10 = !{i64 0, i64 8, !0}
