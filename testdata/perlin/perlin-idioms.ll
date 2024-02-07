; ModuleID = 'perlin-idioms'
source_filename = "perlin-idioms"
target triple = "riscv64"

define i32 @"0"(ptr %p, i64 %0, ptr %arrayidx.i, i32 %and2.i) {
bb:
  %1 = load i32, ptr %arrayidx.i, align 4, !tbaa !0
  %add.i = add nsw i32 %1, %and2.i
  %idxprom9.i = sext i32 %add.i to i64
  %arrayidx10.i = getelementptr inbounds [512 x i32], ptr %p, i64 %0, i64 %idxprom9.i
  %2 = load i32, ptr %arrayidx10.i, align 4, !tbaa !0
  ret i32 %2
}

define i32 @"1"(ptr %p, i64 %0, ptr %arrayidx.i, i32 %and2.i, i32 %1) {
bb:
  %2 = load i32, ptr %arrayidx.i, align 4, !tbaa !0
  %add.i = add nsw i32 %2, %and2.i
  %add12.i = add nsw i32 %add.i, %1
  %idxprom13.i = sext i32 %add12.i to i64
  %arrayidx14.i = getelementptr inbounds [512 x i32], ptr %p, i64 %0, i64 %idxprom13.i
  %3 = load i32, ptr %arrayidx14.i, align 4, !tbaa !0
  ret i32 %3
}

!0 = !{!1, !1, i64 0}
!1 = !{!"int", !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
