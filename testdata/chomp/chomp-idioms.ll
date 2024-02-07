; ModuleID = 'chomp-idioms'
source_filename = "chomp-idioms"
target triple = "riscv64"

%struct._play = type { i32, ptr, ptr, ptr }
%struct._list = type { ptr, ptr }

define i32 @"0"(ptr %arrayidx2, ptr %data1, ptr %ncol, i64 %0) {
bb:
  %1 = load i32, ptr %arrayidx2, align 4, !tbaa !0
  %2 = load i32, ptr %ncol, align 4, !tbaa !0
  %3 = sext i32 %2 to i64
  %indvars.iv.next = add nsw i64 %3, %0
  %arrayidx = getelementptr inbounds i32, ptr %data1, i64 %indvars.iv.next
  store i32 %1, ptr %arrayidx, align 4, !tbaa !0
  ret i32 %1
}

define i32 @"2"(ptr %search.0.in) {
bb:
  %search.0 = load ptr, ptr %search.0.in, align 8, !tbaa !4
  %0 = load i32, ptr %search.0, align 8, !tbaa !6
  ret i32 %0
}

define i32 @"3"(ptr %state, ptr %ncol, i64 %0) {
bb:
  %1 = load i32, ptr %ncol, align 4, !tbaa !0
  %2 = sext i32 %1 to i64
  %indvars.iv.next.i = add nsw i64 %2, %0
  %3 = load ptr, ptr %state, align 8, !tbaa !8
  %arrayidx.i = getelementptr inbounds i32, ptr %3, i64 %indvars.iv.next.i
  %4 = load i32, ptr %arrayidx.i, align 4, !tbaa !0
  ret i32 %4
}

define i32 @"4"(ptr %nrow, ptr %arrayidx) {
bb:
  %0 = load i32, ptr %nrow, align 4, !tbaa !0
  store i32 %0, ptr %arrayidx, align 4, !tbaa !0
  ret i32 %0
}

define i32 @"5"(ptr %ncol, i32 %0, i32 %1, i32 %2, ptr %nrow, i32 %row.198, ptr %arrayidx7.i) {
bb:
  %3 = load i32, ptr %ncol, align 4, !tbaa !0
  %sub = add nsw i32 %3, %0
  %inc = add nsw i32 %sub, %1
  %cmp.not18.i = icmp eq i32 %inc, %2
  %4 = load i32, ptr %nrow, align 4
  %sub28 = add nsw i32 %4, %0
  %row.2 = select i1 %cmp.not18.i, i32 %sub28, i32 %row.198
  %inc33 = add nsw i32 %row.2, %1
  store i32 %inc33, ptr %arrayidx7.i, align 4, !tbaa !0
  ret i32 %inc33
}

define i32 @"6"(ptr %call.i, ptr %ncol, i64 %0) {
bb:
  %1 = load i32, ptr %ncol, align 4, !tbaa !0
  %conv.i = sext i32 %1 to i64
  %indvars.iv.next.i66 = add nsw i64 %conv.i, %0
  %arrayidx.i67 = getelementptr inbounds i32, ptr %call.i, i64 %indvars.iv.next.i66
  %2 = load i32, ptr %arrayidx.i67, align 4, !tbaa !0
  ret i32 %2
}

define i32 @"7"(ptr %arrayidx2.i, ptr %call.i, ptr %ncol, i64 %0) {
bb:
  %1 = load i32, ptr %arrayidx2.i, align 4, !tbaa !0
  %2 = load i32, ptr %ncol, align 4, !tbaa !0
  %conv.i = sext i32 %2 to i64
  %indvars.iv.next.i66 = add nsw i64 %conv.i, %0
  %arrayidx.i67 = getelementptr inbounds i32, ptr %call.i, i64 %indvars.iv.next.i66
  store i32 %1, ptr %arrayidx.i67, align 4, !tbaa !0
  ret i32 %1
}

define i32 @"9"(ptr %arrayidx, i32 %0) {
bb:
  %1 = load i32, ptr %arrayidx, align 4, !tbaa !0
  %inc6 = add nsw i32 %1, %0
  store i32 %inc6, ptr %arrayidx, align 4, !tbaa !0
  ret i32 %inc6
}

define ptr @"10"(ptr %search.0.in, i64 %0, i32 %1) {
bb:
  %search.0 = load ptr, ptr %search.0.in, align 8, !tbaa !4
  %state = getelementptr inbounds %struct._play, ptr %search.0, i64 %0, i32 1
  %2 = load ptr, ptr %state, align 8, !tbaa !8
  ret ptr %2
}

define i32 @"11"(ptr %state.i, ptr %ncol, i64 %0) {
bb:
  %1 = load ptr, ptr %state.i, align 8, !tbaa !8
  %2 = load i32, ptr %ncol, align 4, !tbaa !0
  %conv.i = sext i32 %2 to i64
  %indvars.iv.next.i.i = add nsw i64 %conv.i, %0
  %arrayidx.i.i = getelementptr inbounds i32, ptr %1, i64 %indvars.iv.next.i.i
  %3 = load i32, ptr %arrayidx.i.i, align 4, !tbaa !0
  ret i32 %3
}

define i32 @"12"(ptr %ncol, i32 %0, i32 %1, i32 %2, ptr %nrow, i32 %row.198, ptr %arrayidx7.i) {
bb:
  %3 = load i32, ptr %ncol, align 4, !tbaa !0
  %sub30 = add nsw i32 %3, %0
  %inc = add nsw i32 %sub30, %1
  %cmp.not18.i = icmp eq i32 %inc, %2
  %4 = load i32, ptr %nrow, align 4
  %sub28 = add nsw i32 %4, %0
  %row.2 = select i1 %cmp.not18.i, i32 %sub28, i32 %row.198
  %inc33 = add nsw i32 %row.2, %1
  store i32 %inc33, ptr %arrayidx7.i, align 4, !tbaa !0
  ret i32 %inc33
}

define i32 @"13"(ptr %val, ptr %next) {
bb:
  %0 = load ptr, ptr %next, align 8, !tbaa !9
  %1 = load i32, ptr %val, align 4, !tbaa !0
  store i32 %1, ptr %0, align 8, !tbaa !6
  ret i32 %1
}

define i32 @"14"(i32 %0, ptr %value) {
bb:
  %1 = load i32, ptr %value, align 4, !tbaa !0
  %sub38 = sub nsw i32 %0, %1
  store i32 %sub38, ptr %value, align 4, !tbaa !0
  ret i32 %sub38
}

define ptr @"15"(ptr %call5, ptr %next, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %next, align 8, !tbaa !9
  %next2 = getelementptr inbounds %struct._play, ptr %2, i64 %0, i32 3
  store ptr %call5, ptr %next, align 8, !tbaa !9
  ret ptr %call5
}

define i32 @"16"(ptr %ncol, i32 %0, i32 %1, i32 %2, ptr %nrow, i32 %row.155, ptr %arrayidx7.i) {
bb:
  %3 = load i32, ptr %nrow, align 4
  %sub = add nsw i32 %3, %0
  %4 = load i32, ptr %ncol, align 4, !tbaa !0
  %sub16 = add nsw i32 %4, %0
  %inc = add nsw i32 %sub16, %1
  %cmp.not18.i = icmp eq i32 %inc, %2
  %row.2 = select i1 %cmp.not18.i, i32 %sub, i32 %row.155
  store i32 %row.2, ptr %arrayidx7.i, align 4, !tbaa !0
  ret i32 %row.2
}

define i32 @"17"(ptr %data1, ptr %ncol, i64 %0) {
bb:
  %1 = load i32, ptr %ncol, align 4, !tbaa !0
  %2 = sext i32 %1 to i64
  %indvars.iv.next = add nsw i64 %2, %0
  %arrayidx = getelementptr inbounds i32, ptr %data1, i64 %indvars.iv.next
  %3 = load i32, ptr %arrayidx, align 4, !tbaa !0
  ret i32 %3
}

define i32 @"18"(ptr %nrow, i32 %0, i32 %1, ptr %arrayidx7.i) {
bb:
  %2 = load i32, ptr %nrow, align 4, !tbaa !0
  %sub20 = add nsw i32 %2, %0
  %inc33 = add nsw i32 %sub20, %1
  store i32 %inc33, ptr %arrayidx7.i, align 4, !tbaa !0
  ret i32 %inc33
}

define ptr @"19"(ptr %call6, ptr %next7, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %next7, align 8, !tbaa !10
  %next72 = getelementptr inbounds %struct._list, ptr %2, i64 %0, i32 1
  store ptr %call6, ptr %next7, align 8, !tbaa !10
  ret ptr %call6
}

define ptr @"20"(ptr %next, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %next, align 8, !tbaa !9
  %next2 = getelementptr inbounds %struct._play, ptr %2, i64 %0, i32 3
  %3 = load ptr, ptr %next, align 8, !tbaa !9
  ret ptr %3
}

define ptr @"22"(ptr %call.i42, ptr %next, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %next, align 8, !tbaa !9
  %state = getelementptr inbounds %struct._play, ptr %2, i64 %0, i32 1
  store ptr %call.i42, ptr %state, align 8, !tbaa !8
  ret ptr %call.i42
}

define ptr @"23"(ptr %next) {
bb:
  %0 = load ptr, ptr %next, align 8, !tbaa !10
  %1 = load ptr, ptr %0, align 8, !tbaa !12
  ret ptr %1
}

!0 = !{!1, !1, i64 0}
!1 = !{!"int", !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !2, i64 0}
!6 = !{!7, !1, i64 0}
!7 = !{!"_play", !1, i64 0, !5, i64 8, !5, i64 16, !5, i64 24}
!8 = !{!7, !5, i64 8}
!9 = !{!7, !5, i64 24}
!10 = !{!11, !5, i64 8}
!11 = !{!"_list", !5, i64 0, !5, i64 8}
!12 = !{!11, !5, i64 0}
