; ModuleID = 'richards_benchmark-idioms'
source_filename = "richards_benchmark-idioms"
target triple = "riscv64"

%struct.task = type { ptr, i32, i32, ptr, i32, ptr, i64, i64 }
%struct.packet = type { ptr, i32, i32, i32, [4 x i8] }

define ptr @"0"(ptr %0, ptr %t_wkq) {
bb:
  %1 = load ptr, ptr %0, align 8, !tbaa !0
  store ptr %1, ptr %t_wkq, align 8, !tbaa !6
  ret ptr %1
}

define ptr @"1"(ptr %pkt, ptr %arrayidx.i, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %arrayidx.i, align 8, !tbaa !9
  %t_wkq = getelementptr inbounds %struct.task, ptr %2, i64 %0, i32 3
  store ptr %pkt, ptr %t_wkq, align 8, !tbaa !0
  ret ptr %pkt
}

define ptr @"2"(ptr %0, ptr %tcb, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %tcb, align 8, !tbaa !9
  %t_wkq = getelementptr inbounds %struct.task, ptr %3, i64 %1, i32 3
  %4 = load ptr, ptr %0, align 8, !tbaa !0
  store ptr %4, ptr %t_wkq, align 8, !tbaa !6
  ret ptr %4
}

define i32 @"3"(ptr %0, ptr %1, ptr %t_state) {
bb:
  %2 = load ptr, ptr %0, align 8, !tbaa !0
  %cmp3 = icmp ne ptr %2, %1
  %cond = zext i1 %cmp3 to i32
  store i32 %cond, ptr %t_state, align 8, !tbaa !10
  ret i32 %cond
}

define ptr @"4"(ptr %tasktab, i64 %0, ptr %p_id) {
bb:
  %1 = load i32, ptr %p_id, align 8, !tbaa !11
  %conv.i = sext i32 %1 to i64
  %arrayidx.i = getelementptr inbounds [11 x ptr], ptr %tasktab, i64 %0, i64 %conv.i
  %2 = load ptr, ptr %arrayidx.i, align 8, !tbaa !9
  ret ptr %2
}

define ptr @"5"(ptr %pkt, ptr %p_kind, i32 %0, ptr %v1, ptr %v2) {
bb:
  %1 = load i32, ptr %p_kind, align 4, !tbaa !12
  %cmp1 = icmp eq i32 %1, %0
  %cond = select i1 %cmp1, ptr %v1, ptr %v2
  store ptr %pkt, ptr %cond, align 8, !tbaa !0
  ret ptr %pkt
}

define ptr @"6"(ptr %v1, ptr %ptr.addr.0.i.i) {
bb:
  %0 = load i64, ptr %v1, align 8, !tbaa !13
  %1 = inttoptr i64 %0 to ptr
  store ptr %1, ptr %ptr.addr.0.i.i, align 8, !tbaa !0
  ret ptr %1
}

define i32 @"7"(ptr %taskid, ptr %v1, i64 %0, i32 %1) {
bb:
  %2 = load i64, ptr %taskid, align 8, !tbaa !13
  %conv.i = trunc i64 %2 to i32
  %3 = load i64, ptr %v1, align 8, !tbaa !13
  %4 = inttoptr i64 %3 to ptr
  %p_id.i = getelementptr inbounds %struct.packet, ptr %4, i64 %0, i32 1
  store i32 %conv.i, ptr %p_id.i, align 8, !tbaa !11
  ret i32 %conv.i
}

define i32 @"8"(ptr %t_state, i32 %0) {
bb:
  %1 = load i32, ptr %t_state, align 8, !tbaa !10
  %and = and i32 %1, %0
  store i32 %and, ptr %t_state, align 8, !tbaa !10
  ret i32 %and
}

define i32 @"9"(ptr %0, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %0, align 8, !tbaa !14
  %t_state = getelementptr inbounds %struct.task, ptr %3, i64 %1, i32 4
  %4 = load i32, ptr %t_state, align 8, !tbaa !10
  ret i32 %4
}

define i32 @"10"(ptr %tcb, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %tcb, align 8, !tbaa !9
  %t_state = getelementptr inbounds %struct.task, ptr %2, i64 %0, i32 4
  %3 = load i32, ptr %t_state, align 8, !tbaa !10
  ret i32 %3
}

define i32 @"11"(ptr %t_state, i32 %0, ptr %arrayidx.i, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %arrayidx.i, align 8, !tbaa !9
  %t_state2 = getelementptr inbounds %struct.task, ptr %3, i64 %1, i32 4
  %4 = load i32, ptr %t_state, align 8, !tbaa !10
  %or = or i32 %4, %0
  store i32 %or, ptr %t_state, align 8, !tbaa !10
  ret i32 %or
}

define i64 @"12"(ptr %t_id, ptr %taskid) {
bb:
  %0 = load i32, ptr %t_id, align 8, !tbaa !15
  %conv = sext i32 %0 to i64
  store i64 %conv, ptr %taskid, align 8, !tbaa !13
  ret i64 %conv
}

define ptr @"13"(ptr %tasktab, i64 %0, i64 %1, ptr %v1, i64 %2) {
bb:
  %3 = load i64, ptr %v1, align 8, !tbaa !13
  %sub = sub nsw i64 %1, %3
  %sext = shl i64 %sub, %2
  %conv.i.i = ashr exact i64 %sext, %2
  %arrayidx.i.i = getelementptr inbounds [11 x ptr], ptr %tasktab, i64 %0, i64 %conv.i.i
  %4 = load ptr, ptr %arrayidx.i.i, align 8, !tbaa !9
  ret ptr %4
}

define i32 @"14"(i64 %0, ptr %v1, ptr %p_id) {
bb:
  %1 = load i64, ptr %v1, align 8, !tbaa !13
  %sub = sub nsw i64 %0, %1
  %conv = trunc i64 %sub to i32
  store i32 %conv, ptr %p_id, align 8, !tbaa !11
  ret i32 %conv
}

define ptr @"15"(ptr %v1, ptr %arrayidx.i.i, i64 %0, i32 %1) {
bb:
  %2 = load i64, ptr %v1, align 8, !tbaa !13
  %3 = inttoptr i64 %2 to ptr
  %4 = load ptr, ptr %arrayidx.i.i, align 8, !tbaa !9
  %t_wkq.i = getelementptr inbounds %struct.task, ptr %4, i64 %0, i32 3
  store ptr %3, ptr %t_wkq.i, align 8, !tbaa !0
  ret ptr %3
}

define i32 @"17"(ptr %v1, i64 %0, i32 %1) {
bb:
  %2 = load i64, ptr %v1, align 8, !tbaa !13
  %3 = inttoptr i64 %2 to ptr
  %p_a1 = getelementptr inbounds %struct.packet, ptr %3, i64 %0, i32 3
  %4 = load i32, ptr %p_a1, align 8, !tbaa !16
  ret i32 %4
}

define i64 @"18"(ptr %v2, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %v2, align 8, !tbaa !13
  %cmp3 = icmp sgt i64 %2, %0
  %inc = add nsw i64 %2, %1
  %spec.store.select = select i1 %cmp3, i64 %1, i64 %inc
  store i64 %spec.store.select, ptr %v2, align 8
  ret i64 %spec.store.select
}

define i32 @"19"(ptr %t_state, i32 %0, ptr %tcb, i64 %1, i32 %2) {
bb:
  %3 = load i32, ptr %t_state, align 8, !tbaa !10
  %or = or i32 %3, %0
  %4 = load ptr, ptr %tcb, align 8, !tbaa !9
  %t_state2 = getelementptr inbounds %struct.task, ptr %4, i64 %1, i32 4
  store i32 %or, ptr %t_state, align 8, !tbaa !10
  ret i32 %or
}

define ptr @"20"(ptr %tcb) {
bb:
  %0 = load ptr, ptr %tcb, align 8, !tbaa !9
  %1 = load ptr, ptr %0, align 8, !tbaa !14
  ret ptr %1
}

define ptr @"21"(ptr %t_wkq) {
bb:
  %0 = load ptr, ptr %t_wkq, align 8, !tbaa !6
  %1 = load ptr, ptr %0, align 8, !tbaa !0
  ret ptr %1
}

define i8 @"22"(ptr %alphabet, i64 %0, ptr %v2, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %v2, align 8, !tbaa !13
  %cmp3 = icmp sgt i64 %3, %1
  %inc = add nsw i64 %3, %2
  %spec.store.select = select i1 %cmp3, i64 %2, i64 %inc
  %arrayidx = getelementptr inbounds [28 x i8], ptr %alphabet, i64 %0, i64 %spec.store.select
  %4 = load i8, ptr %arrayidx, align 1, !tbaa !17
  ret i8 %4
}

define i32 @"23"(ptr %t_state, i32 %0, ptr %arrayidx.i, i64 %1, i32 %2) {
bb:
  %3 = load ptr, ptr %arrayidx.i, align 8, !tbaa !9
  %t_state2 = getelementptr inbounds %struct.task, ptr %3, i64 %1, i32 4
  %4 = load i32, ptr %t_state, align 8, !tbaa !10
  %and = and i32 %4, %0
  store i32 %and, ptr %t_state, align 8, !tbaa !10
  ret i32 %and
}

define ptr @"24"(ptr %p_kind, i32 %0, ptr %v1, ptr %v2) {
bb:
  %1 = load i32, ptr %p_kind, align 4, !tbaa !12
  %cmp1 = icmp eq i32 %1, %0
  %cond = select i1 %cmp1, ptr %v1, ptr %v2
  %2 = load ptr, ptr %cond, align 8, !tbaa !0
  ret ptr %2
}

define ptr @"25"(ptr %0, ptr %1, i64 %2, i32 %3) {
bb:
  %4 = load ptr, ptr %1, align 8, !tbaa !14
  %t_wkq = getelementptr inbounds %struct.task, ptr %4, i64 %2, i32 3
  %5 = load ptr, ptr %0, align 8, !tbaa !0
  store ptr %5, ptr %t_wkq, align 8, !tbaa !6
  ret ptr %5
}

define ptr @"26"(ptr %v1) {
bb:
  %0 = load i64, ptr %v1, align 8, !tbaa !13
  %1 = inttoptr i64 %0 to ptr
  %2 = load ptr, ptr %1, align 8, !tbaa !0
  ret ptr %2
}

define ptr @"27"(ptr %v1, ptr %ptr.addr.0.i.i) {
bb:
  %0 = load i64, ptr %v1, align 8, !tbaa !13
  %1 = inttoptr i64 %0 to ptr
  %2 = load ptr, ptr %ptr.addr.0.i.i, align 8, !tbaa !0
  store ptr %1, ptr %2, align 8, !tbaa !0
  ret ptr %1
}

define i8 @"28"(ptr %v1, i64 %0, i32 %1, ptr %p_a1) {
bb:
  %2 = load i64, ptr %v1, align 8, !tbaa !13
  %3 = inttoptr i64 %2 to ptr
  %4 = load i32, ptr %p_a1, align 8, !tbaa !16
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds %struct.packet, ptr %3, i64 %0, i32 4, i64 %idxprom
  %5 = load i8, ptr %arrayidx, align 1, !tbaa !17
  ret i8 %5
}

define i32 @"29"(ptr %layout, i32 %0) {
bb:
  %1 = load i32, ptr %layout, align 4, !tbaa !18
  %dec = add nsw i32 %1, %0
  store i32 %dec, ptr %layout, align 4, !tbaa !18
  ret i32 %dec
}

define i32 @"30"(ptr %0, ptr %1, ptr %2, i64 %3, i32 %4) {
bb:
  %5 = load ptr, ptr %2, align 8, !tbaa !14
  %t_state = getelementptr inbounds %struct.task, ptr %5, i64 %3, i32 4
  %6 = load ptr, ptr %0, align 8, !tbaa !0
  %cmp3 = icmp ne ptr %6, %1
  %cond = zext i1 %cmp3 to i32
  store i32 %cond, ptr %t_state, align 8, !tbaa !10
  ret i32 %cond
}

define i32 @"31"(ptr %0, ptr %1, ptr %tcb, i64 %2, i32 %3) {
bb:
  %4 = load ptr, ptr %tcb, align 8, !tbaa !9
  %t_state = getelementptr inbounds %struct.task, ptr %4, i64 %2, i32 4
  %5 = load ptr, ptr %0, align 8, !tbaa !0
  %cmp3 = icmp ne ptr %5, %1
  %cond = zext i1 %cmp3 to i32
  store i32 %cond, ptr %t_state, align 8, !tbaa !10
  ret i32 %cond
}

define ptr @"32"(ptr %tcb, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %tcb, align 8, !tbaa !9
  %t_fn = getelementptr inbounds %struct.task, ptr %2, i64 %0, i32 5
  %3 = load ptr, ptr %t_fn, align 8, !tbaa !19
  ret ptr %3
}

define i64 @"33"(ptr %v1, i64 %0, i64 %1) {
bb:
  %2 = load i64, ptr %v1, align 8, !tbaa !13
  %3 = lshr i64 %2, %0
  %and3 = and i64 %3, %1
  store i64 %and3, ptr %v1, align 8, !tbaa !13
  ret i64 %and3
}

define i64 @"34"(ptr %v1, i64 %0, i64 %1, i64 %2) {
bb:
  %3 = load i64, ptr %v1, align 8, !tbaa !13
  %4 = lshr i64 %3, %0
  %and3 = and i64 %4, %1
  %xor = xor i64 %and3, %2
  store i64 %xor, ptr %v1, align 8, !tbaa !13
  ret i64 %xor
}

define i64 @"35"(i64 %0, ptr %v1) {
bb:
  %1 = load i64, ptr %v1, align 8, !tbaa !13
  %sub = sub nsw i64 %0, %1
  store i64 %sub, ptr %v1, align 8, !tbaa !13
  ret i64 %sub
}

define ptr @"36"(ptr %0, ptr %tcb) {
bb:
  %1 = load ptr, ptr %0, align 8, !tbaa !14
  store ptr %1, ptr %tcb, align 8, !tbaa !9
  ret ptr %1
}

define i64 @"37"(ptr %0, ptr %v1) {
bb:
  %1 = load ptr, ptr %0, align 8, !tbaa !0
  %2 = ptrtoint ptr %1 to i64
  store i64 %2, ptr %v1, align 8, !tbaa !13
  ret i64 %2
}

define ptr @"38"(ptr %v1, ptr %arrayidx.i.i, i64 %0, i32 %1) {
bb:
  %2 = load i64, ptr %v1, align 8, !tbaa !13
  %3 = inttoptr i64 %2 to ptr
  %4 = load ptr, ptr %arrayidx.i.i, align 8, !tbaa !9
  %t_wkq.i = getelementptr inbounds %struct.task, ptr %4, i64 %0, i32 3
  store ptr %3, ptr %t_wkq.i, align 8, !tbaa !6
  ret ptr %3
}

define i32 @"39"(ptr %t_state, i32 %0) {
bb:
  %1 = load i32, ptr %t_state, align 8, !tbaa !10
  %or = or i32 %1, %0
  store i32 %or, ptr %t_state, align 8, !tbaa !10
  ret i32 %or
}

define ptr @"40"(ptr %pkt, ptr %arrayidx.i, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %arrayidx.i, align 8, !tbaa !9
  %t_wkq = getelementptr inbounds %struct.task, ptr %2, i64 %0, i32 3
  store ptr %pkt, ptr %t_wkq, align 8, !tbaa !6
  ret ptr %pkt
}

define i32 @"41"(ptr %p_a1, i32 %0, ptr %v1, i64 %1, i32 %2) {
bb:
  %3 = load i64, ptr %v1, align 8, !tbaa !13
  %4 = inttoptr i64 %3 to ptr
  %p_a12 = getelementptr inbounds %struct.packet, ptr %4, i64 %1, i32 3
  %5 = load i32, ptr %p_a1, align 8, !tbaa !16
  %add = add nsw i32 %5, %0
  store i32 %add, ptr %p_a1, align 8, !tbaa !16
  ret i32 %add
}

define i64 @"42"(ptr %v1, ptr %tcb, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %tcb, align 8, !tbaa !9
  %t_v19 = getelementptr inbounds %struct.task, ptr %2, i64 %0, i32 6
  %3 = load i64, ptr %v1, align 8, !tbaa !13
  store i64 %3, ptr %t_v19, align 8, !tbaa !20
  ret i64 %3
}

define ptr @"43"(ptr %arrayidx.i, i64 %0, i32 %1) {
bb:
  %2 = load ptr, ptr %arrayidx.i, align 8, !tbaa !9
  %t_wkq = getelementptr inbounds %struct.task, ptr %2, i64 %0, i32 3
  %3 = load ptr, ptr %t_wkq, align 8, !tbaa !0
  ret ptr %3
}

define i32 @"44"(ptr %t_state.i8, i32 %0, ptr %1, i64 %2, i32 %3) {
bb:
  %4 = load ptr, ptr %1, align 8, !tbaa !9
  %t_state.i82 = getelementptr inbounds %struct.task, ptr %4, i64 %2, i32 4
  %5 = load i32, ptr %t_state.i8, align 8, !tbaa !10
  %and.i = and i32 %5, %0
  store i32 %and.i, ptr %t_state.i8, align 8, !tbaa !10
  ret i32 %and.i
}

define i32 @"45"(ptr %arrayidx, ptr %v2, i64 %0, i32 %1) {
bb:
  %2 = load i64, ptr %v2, align 8, !tbaa !13
  %3 = inttoptr i64 %2 to ptr
  %p_a110 = getelementptr inbounds %struct.packet, ptr %3, i64 %0, i32 3
  %4 = load i8, ptr %arrayidx, align 1, !tbaa !17
  %conv = sext i8 %4 to i32
  store i32 %conv, ptr %p_a110, align 8, !tbaa !16
  ret i32 %conv
}

define i32 @"46"(ptr %taskid, ptr %p_id) {
bb:
  %0 = load i64, ptr %taskid, align 8, !tbaa !13
  %conv = trunc i64 %0 to i32
  store i32 %conv, ptr %p_id, align 8, !tbaa !11
  ret i32 %conv
}

!0 = !{!1, !2, i64 0}
!1 = !{!"packet", !2, i64 0, !5, i64 8, !5, i64 12, !5, i64 16, !3, i64 20}
!2 = !{!"any pointer", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!"int", !3, i64 0}
!6 = !{!7, !2, i64 16}
!7 = !{!"task", !2, i64 0, !5, i64 8, !5, i64 12, !2, i64 16, !5, i64 24, !2, i64 32, !8, i64 40, !8, i64 48}
!8 = !{!"long", !3, i64 0}
!9 = !{!2, !2, i64 0}
!10 = !{!7, !5, i64 24}
!11 = !{!1, !5, i64 8}
!12 = !{!1, !5, i64 12}
!13 = !{!8, !8, i64 0}
!14 = !{!7, !2, i64 0}
!15 = !{!7, !5, i64 8}
!16 = !{!1, !5, i64 16}
!17 = !{!3, !3, i64 0}
!18 = !{!5, !5, i64 0}
!19 = !{!7, !2, i64 32}
!20 = !{!7, !8, i64 40}
