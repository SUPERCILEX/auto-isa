; ModuleID = 'salsa20-idioms'
source_filename = "salsa20-idioms"
target triple = "riscv64"

define i32 @"0"(ptr %outbuf, i64 %0, ptr %ptr, i32 %1, i32 %2) {
bb:
  %3 = load i32, ptr %ptr, align 4, !tbaa !0
  %add = add i32 %3, %1
  %and = and i32 %add, %2
  %idxprom = zext i32 %and to i64
  %arrayidx = getelementptr inbounds [16 x i32], ptr %outbuf, i64 %0, i64 %idxprom
  %4 = load i32, ptr %arrayidx, align 4, !tbaa !0
  ret i32 %4
}

define i32 @"1"(i32 %or218, i32 %or42, ptr %x) {
bb:
  %x.promoted = load i32, ptr %x, align 16, !tbaa !0
  %xor44 = xor i32 %or42, %x.promoted
  %xor220 = xor i32 %or218, %xor44
  store i32 %xor220, ptr %x, align 16, !tbaa !0
  ret i32 %xor220
}

define i32 @"2"(ptr %ptr, i32 %0, i32 %1) {
bb:
  %ptr.promoted = load i32, ptr %ptr, align 4, !tbaa !0
  %add.i = add i32 %ptr.promoted, %0
  %and.i = and i32 %add.i, %1
  store i32 %and.i, ptr %ptr, align 4, !tbaa !0
  ret i32 %and.i
}

define i32 @"3"(ptr %ptr, i32 %0, i32 %1) {
bb:
  %2 = load i32, ptr %ptr, align 4, !tbaa !0
  %add = add i32 %2, %0
  %and = and i32 %add, %1
  store i32 %and, ptr %ptr, align 4, !tbaa !0
  ret i32 %and
}

define i32 @"4"(ptr %arrayidx361, ptr %arrayidx359, ptr %arrayidx364) {
bb:
  %0 = load i32, ptr %arrayidx359, align 4, !tbaa !0
  %1 = load i32, ptr %arrayidx361, align 4, !tbaa !0
  %add362 = add i32 %1, %0
  store i32 %add362, ptr %arrayidx364, align 4, !tbaa !0
  ret i32 %add362
}

!0 = !{!1, !1, i64 0}
!1 = !{!"int", !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
