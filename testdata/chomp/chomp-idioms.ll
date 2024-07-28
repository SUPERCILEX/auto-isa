; ModuleID = 'chomp-idioms'
source_filename = "chomp-idioms"
target triple = "riscv64"

%struct._list = type { ptr, ptr }
%struct._play = type { i32, ptr, ptr, ptr }

define ptr @"0"(ptr %call6, ptr %next7, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %next7, align 8, !tbaa !0
  %next72 = getelementptr inbounds %struct._list, ptr %2, i64 %0, i32 1
  store ptr %call6, ptr %next7, align 8, !tbaa !0
  ret ptr %call6
}

define ptr @"1"(ptr %call.i42, ptr %next, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %next, align 8, !tbaa !5
  %state = getelementptr inbounds %struct._play, ptr %2, i64 %0, i32 1
  store ptr %call.i42, ptr %state, align 8, !tbaa !8
  ret ptr %call.i42
}

define i32 @"2"(ptr %ncol, i32 %0, i32 %1, i32 %2, ptr %nrow, i32 %row.198, ptr %arrayidx7.i) {
bb:
  %3 = load i32, ptr %nrow, align 4
  %sub28 = add nsw i32 %3, %0
  %4 = load i32, ptr %ncol, align 4, !tbaa !9
  %sub = add nsw i32 %4, %0
  %inc = add nsw i32 %sub, %1
  %cmp.not18.i = icmp eq i32 %inc, %2
  %row.2 = select i1 %cmp.not18.i, i32 %sub28, i32 %row.198
  %inc33 = add nsw i32 %row.2, %1
  store i32 %inc33, ptr %arrayidx7.i, align 4, !tbaa !9
  ret i32 %inc33
}

define i32 @"3"(ptr %val, ptr %next) {
bb:
  %0 = load ptr, ptr %next, align 8, !tbaa !5
  %1 = load i32, ptr %val, align 4, !tbaa !9
  store i32 %1, ptr %0, align 8, !tbaa !10
  ret i32 %1
}

define ptr @"4"(ptr %next) {
bb:
  %0 = load ptr, ptr %next, align 8, !tbaa !0
  %1 = load ptr, ptr %0, align 8, !tbaa !11
  ret ptr %1
}

define i32 @"7"(ptr %arrayidx2.i, ptr %call.i, ptr %ncol, i64 %0) {
bb:
  %1 = load i32, ptr %ncol, align 4, !tbaa !9
  %conv.i = sext i32 %1 to i64
  %indvars.iv.next.i66 = add nsw i64 %conv.i, %0
  %arrayidx.i67 = getelementptr inbounds i32, ptr %call.i, i64 %indvars.iv.next.i66
  %2 = load i32, ptr %arrayidx2.i, align 4, !tbaa !9
  store i32 %2, ptr %arrayidx.i67, align 4, !tbaa !9
  ret i32 %2
}

define i32 @"8"(ptr %nrow, i32 %0, i32 %1, ptr %arrayidx7.i) {
bb:
  %2 = load i32, ptr %nrow, align 4, !tbaa !9
  %sub20 = add nsw i32 %2, %0
  %inc33 = add nsw i32 %sub20, %1
  store i32 %inc33, ptr %arrayidx7.i, align 4, !tbaa !9
  ret i32 %inc33
}

define i32 @"9"(ptr %ncol, i32 %0, i32 %1, i32 %2, ptr %nrow, i32 %row.155, ptr %arrayidx7.i) {
bb:
  %3 = load i32, ptr %ncol, align 4, !tbaa !9
  %sub16 = add nsw i32 %3, %0
  %inc = add nsw i32 %sub16, %1
  %cmp.not18.i = icmp eq i32 %inc, %2
  %4 = load i32, ptr %nrow, align 4
  %sub = add nsw i32 %4, %0
  %row.2 = select i1 %cmp.not18.i, i32 %sub, i32 %row.155
  store i32 %row.2, ptr %arrayidx7.i, align 4, !tbaa !9
  ret i32 %row.2
}

define i32 @"10"(ptr %ncol, i32 %0, i32 %1, i32 %2, ptr %nrow, i32 %row.198, ptr %arrayidx7.i) {
bb:
  %3 = load i32, ptr %nrow, align 4
  %sub28 = add nsw i32 %3, %0
  %4 = load i32, ptr %ncol, align 4, !tbaa !9
  %sub30 = add nsw i32 %4, %0
  %inc = add nsw i32 %sub30, %1
  %cmp.not18.i = icmp eq i32 %inc, %2
  %row.2 = select i1 %cmp.not18.i, i32 %sub28, i32 %row.198
  %inc33 = add nsw i32 %row.2, %1
  store i32 %inc33, ptr %arrayidx7.i, align 4, !tbaa !9
  ret i32 %inc33
}

define i32 @"11"(ptr %arrayidx, i32 %0) {
bb:
  %1 = load i32, ptr %arrayidx, align 4, !tbaa !9
  %inc6 = add nsw i32 %1, %0
  store i32 %inc6, ptr %arrayidx, align 4, !tbaa !9
  ret i32 %inc6
}

define i32 @"13"(ptr %state.i, ptr %ncol, i64 %0) {
bb:
  %1 = load i32, ptr %ncol, align 4, !tbaa !9
  %conv.i = sext i32 %1 to i64
  %indvars.iv.next.i.i = add nsw i64 %conv.i, %0
  %2 = load ptr, ptr %state.i, align 8, !tbaa !8
  %arrayidx.i.i = getelementptr inbounds i32, ptr %2, i64 %indvars.iv.next.i.i
  %3 = load i32, ptr %arrayidx.i.i, align 4, !tbaa !9
  ret i32 %3
}

define i32 @"14"(ptr %call.i, ptr %ncol, i64 %0) {
bb:
  %1 = load i32, ptr %ncol, align 4, !tbaa !9
  %conv.i = sext i32 %1 to i64
  %indvars.iv.next.i66 = add nsw i64 %conv.i, %0
  %arrayidx.i67 = getelementptr inbounds i32, ptr %call.i, i64 %indvars.iv.next.i66
  %2 = load i32, ptr %arrayidx.i67, align 4, !tbaa !9
  ret i32 %2
}

define i32 @"15"(ptr %state, ptr %ncol, i64 %0) {
bb:
  %1 = load i32, ptr %ncol, align 4, !tbaa !9
  %2 = sext i32 %1 to i64
  %indvars.iv.next.i = add nsw i64 %2, %0
  %3 = load ptr, ptr %state, align 8, !tbaa !8
  %arrayidx.i = getelementptr inbounds i32, ptr %3, i64 %indvars.iv.next.i
  %4 = load i32, ptr %arrayidx.i, align 4, !tbaa !9
  ret i32 %4
}

define i32 @"16"(ptr %data1, ptr %ncol, i64 %0) {
bb:
  %1 = load i32, ptr %ncol, align 4, !tbaa !9
  %2 = sext i32 %1 to i64
  %indvars.iv.next = add nsw i64 %2, %0
  %arrayidx = getelementptr inbounds i32, ptr %data1, i64 %indvars.iv.next
  %3 = load i32, ptr %arrayidx, align 4, !tbaa !9
  ret i32 %3
}

define i32 @"17"(ptr %search.0.in) {
bb:
  %search.0 = load ptr, ptr %search.0.in, align 8, !tbaa !12
  %0 = load i32, ptr %search.0, align 8, !tbaa !10
  ret i32 %0
}

define i32 @"18"(ptr %arrayidx2.i, ptr %arrayidx.i67) {
bb:
  %0 = load i32, ptr %arrayidx2.i, align 4, !tbaa !9
  store i32 %0, ptr %arrayidx.i67, align 4, !tbaa !9
  ret i32 %0
}

define i32 @"19"(i32 %0, ptr %value) {
bb:
  %1 = load i32, ptr %value, align 4, !tbaa !9
  %sub38 = sub nsw i32 %0, %1
  store i32 %sub38, ptr %value, align 4, !tbaa !9
  ret i32 %sub38
}

define i32 @"20"(ptr %arrayidx2, ptr %data1, ptr %ncol, i64 %0) {
bb:
  %1 = load i32, ptr %arrayidx2, align 4, !tbaa !9
  %2 = load i32, ptr %ncol, align 4, !tbaa !9
  %3 = sext i32 %2 to i64
  %indvars.iv.next = add nsw i64 %3, %0
  %arrayidx = getelementptr inbounds i32, ptr %data1, i64 %indvars.iv.next
  store i32 %1, ptr %arrayidx, align 4, !tbaa !9
  ret i32 %1
}

define i32 @"21"(ptr %state.i, i64 %indvars.iv.next.i.i) {
bb:
  %0 = load ptr, ptr %state.i, align 8, !tbaa !8
  %arrayidx.i.i = getelementptr inbounds i32, ptr %0, i64 %indvars.iv.next.i.i
  %1 = load i32, ptr %arrayidx.i.i, align 4, !tbaa !9
  ret i32 %1
}

define ptr @"22"(ptr %call5, ptr %next, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %next, align 8, !tbaa !5
  %next2 = getelementptr inbounds %struct._play, ptr %2, i64 %0, i32 3
  store ptr %call5, ptr %next, align 8, !tbaa !5
  ret ptr %call5
}

define ptr @"23"(ptr %next, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %next, align 8, !tbaa !5
  %next2 = getelementptr inbounds %struct._play, ptr %2, i64 %0, i32 3
  %3 = load ptr, ptr %next, align 8, !tbaa !5
  ret ptr %3
}

!0 = !{!1, !2, i64 8}
!1 = !{!"_list", !2, i64 0, !2, i64 8}
!2 = !{!"any pointer", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !2, i64 24}
!6 = !{!"_play", !7, i64 0, !2, i64 8, !2, i64 16, !2, i64 24}
!7 = !{!"int", !3, i64 0}
!8 = !{!6, !2, i64 8}
!9 = !{!7, !7, i64 0}
!10 = !{!6, !7, i64 0}
!11 = !{!1, !2, i64 0}
!12 = !{!2, !2, i64 0}
