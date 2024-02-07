; ModuleID = 'oourafft-idioms'
source_filename = "oourafft-idioms"
target triple = "riscv64"

define double @"0"(ptr %arrayidx99.i, ptr %a, ptr %arrayidx21.i, i32 %0, i32 %mul45.i, i32 %mul.i, i32 %1) {
bb:
  %2 = load double, ptr %arrayidx99.i, align 8, !tbaa !0
  %fneg100.i = fneg double %2
  %3 = load i32, ptr %arrayidx21.i, align 4, !tbaa !4
  %add22.i = add nsw i32 %3, %0
  %add46.i = add nsw i32 %add22.i, %mul45.i
  %sub.i = sub nsw i32 %add46.i, %mul.i
  %add94.i = add nsw i32 %sub.i, %mul45.i
  %add103.i = add nsw i32 %add94.i, %1
  %idxprom104.i = sext i32 %add103.i to i64
  %arrayidx105.i = getelementptr inbounds double, ptr %a, i64 %idxprom104.i
  store double %fneg100.i, ptr %arrayidx105.i, align 8, !tbaa !0
  ret double %fneg100.i
}

define double @"1"(ptr %a, ptr %arrayidx122.i, i32 %0, i32 %mul.i, i32 %1) {
bb:
  %2 = load i32, ptr %arrayidx122.i, align 4, !tbaa !4
  %add123.i = add nsw i32 %2, %0
  %add131.i = add nsw i32 %add123.i, %mul.i
  %add132.i = add nsw i32 %add131.i, %mul.i
  %add141.i = add nsw i32 %add132.i, %1
  %idxprom142.i = sext i32 %add141.i to i64
  %arrayidx143.i = getelementptr inbounds double, ptr %a, i64 %idxprom142.i
  %3 = load double, ptr %arrayidx143.i, align 8, !tbaa !0
  ret double %3
}

define double @"2"(ptr %arrayidx.i, ptr %arrayidx10.i, ptr %arrayidx38.i, ptr %arrayidx41.i, ptr %arrayidx34.i) {
bb:
  %0 = load double, ptr %arrayidx38.i, align 8, !tbaa !0
  %1 = load double, ptr %arrayidx41.i, align 8, !tbaa !0
  %sub54.i = fsub double %0, %1
  %2 = load double, ptr %arrayidx10.i, align 8, !tbaa !0
  %3 = load double, ptr %arrayidx.i, align 8, !tbaa !0
  %sub22.i = fsub double %3, %2
  %add76.i = fadd double %sub22.i, %sub54.i
  store double %add76.i, ptr %arrayidx34.i, align 8, !tbaa !0
  ret double %add76.i
}

define double @"3"(ptr %arrayidx29.i, ptr %a, i64 %0, ptr %arrayidx17.i) {
bb:
  %1 = load double, ptr %arrayidx29.i, align 8, !tbaa !0
  %2 = load i32, ptr %arrayidx17.i, align 4, !tbaa !4
  %3 = sext i32 %2 to i64
  %4 = add nsw i64 %0, %3
  %arrayidx24.i = getelementptr inbounds double, ptr %a, i64 %4
  store double %1, ptr %arrayidx24.i, align 8, !tbaa !0
  ret double %1
}

define double @"4"(ptr %arrayidx74.i, ptr %a, ptr %arrayidx21.i, i32 %0, i32 %mul45.i, i32 %mul.i, i32 %1) {
bb:
  %2 = load i32, ptr %arrayidx21.i, align 4, !tbaa !4
  %add22.i = add nsw i32 %2, %0
  %add46.i = add nsw i32 %add22.i, %mul45.i
  %sub.i = sub nsw i32 %add46.i, %mul.i
  %add78.i = add nsw i32 %sub.i, %1
  %idxprom79.i = sext i32 %add78.i to i64
  %arrayidx80.i = getelementptr inbounds double, ptr %a, i64 %idxprom79.i
  %3 = load double, ptr %arrayidx74.i, align 8, !tbaa !0
  %fneg75.i = fneg double %3
  store double %fneg75.i, ptr %arrayidx80.i, align 8, !tbaa !0
  ret double %fneg75.i
}

define double @"5"(ptr %arrayidx134.i, ptr %a, ptr %arrayidx122.i, i32 %0, i32 %mul.i) {
bb:
  %1 = load double, ptr %arrayidx134.i, align 8, !tbaa !0
  %2 = load i32, ptr %arrayidx122.i, align 4, !tbaa !4
  %add123.i = add nsw i32 %2, %0
  %add131.i = add nsw i32 %add123.i, %mul.i
  %add132.i = add nsw i32 %add131.i, %mul.i
  %idxprom139.i = sext i32 %add132.i to i64
  %arrayidx140.i = getelementptr inbounds double, ptr %a, i64 %idxprom139.i
  store double %1, ptr %arrayidx140.i, align 8, !tbaa !0
  ret double %1
}

define double @"6"(ptr %arrayidx51.i, ptr %a, ptr %arrayidx21.i, i32 %0, i32 %mul45.i, i32 %1) {
bb:
  %2 = load double, ptr %arrayidx51.i, align 8, !tbaa !0
  %fneg52.i = fneg double %2
  %3 = load i32, ptr %arrayidx21.i, align 4, !tbaa !4
  %add22.i = add nsw i32 %3, %0
  %add46.i = add nsw i32 %add22.i, %mul45.i
  %add55.i = add nsw i32 %add46.i, %1
  %idxprom56.i = sext i32 %add55.i to i64
  %arrayidx57.i = getelementptr inbounds double, ptr %a, i64 %idxprom56.i
  store double %fneg52.i, ptr %arrayidx57.i, align 8, !tbaa !0
  ret double %fneg52.i
}

define double @"7"(ptr %arrayidx94, ptr %a, ptr %arrayidx21, i32 %0, i32 %mul44, i32 %mul, i32 %1) {
bb:
  %2 = load double, ptr %arrayidx94, align 8, !tbaa !0
  %3 = load i32, ptr %arrayidx21, align 4, !tbaa !4
  %add22 = add nsw i32 %3, %0
  %add45 = add nsw i32 %add22, %mul44
  %sub = sub nsw i32 %add45, %mul
  %add89 = add nsw i32 %sub, %mul44
  %add97 = add nsw i32 %add89, %1
  %idxprom98 = sext i32 %add97 to i64
  %arrayidx99 = getelementptr inbounds double, ptr %a, i64 %idxprom98
  store double %2, ptr %arrayidx99, align 8, !tbaa !0
  ret double %2
}

define double @"8"(ptr %arrayidx99, ptr %a, i64 %0, ptr %arrayidx17, i64 %1, i64 %2, i64 %3, i64 %4) {
bb:
  %5 = load i32, ptr %arrayidx17, align 4, !tbaa !4
  %6 = sext i32 %5 to i64
  %7 = add nsw i64 %0, %6
  %8 = add nsw i64 %7, %1
  %9 = add nsw i64 %8, %2
  %10 = add nsw i64 %9, %3
  %11 = add nsw i64 %10, %4
  %arrayidx94 = getelementptr inbounds double, ptr %a, i64 %11
  %12 = load double, ptr %arrayidx99, align 8, !tbaa !0
  store double %12, ptr %arrayidx94, align 8, !tbaa !0
  ret double %12
}

define double @"9"(ptr %arrayidx38, ptr %arrayidx42, ptr %arrayidx43, ptr %arrayidx51, ptr %arrayidx52, ptr %arrayidx39, ptr %arrayidx40, ptr %arrayidx54, ptr %arrayidx55) {
bb:
  %0 = load double, ptr %arrayidx42, align 8, !tbaa !0
  %1 = load double, ptr %arrayidx43, align 8, !tbaa !0
  %sub50 = fsub double %0, %1
  %2 = load double, ptr %arrayidx52, align 8, !tbaa !0
  %3 = load double, ptr %arrayidx51, align 8, !tbaa !0
  %sub59 = fsub double %3, %2
  %add72 = fadd double %sub50, %sub59
  %4 = load double, ptr %arrayidx54, align 8, !tbaa !0
  %5 = load double, ptr %arrayidx55, align 8, !tbaa !0
  %sub62 = fsub double %4, %5
  %6 = load double, ptr %arrayidx40, align 8, !tbaa !0
  %7 = load double, ptr %arrayidx39, align 8, !tbaa !0
  %sub47 = fsub double %7, %6
  %sub71 = fsub double %sub47, %sub62
  %add75 = fadd double %add72, %sub71
  %8 = load double, ptr %arrayidx38, align 8, !tbaa !0
  %mul76 = fmul double %8, %add75
  store double %mul76, ptr %arrayidx43, align 8, !tbaa !0
  ret double %mul76
}

define double @"10"(ptr %arrayidx89.i, ptr %arrayidx91.i) {
bb:
  %0 = load double, ptr %arrayidx91.i, align 8, !tbaa !0
  %1 = load double, ptr %arrayidx89.i, align 8, !tbaa !0
  %add105.i = fadd double %1, %0
  store double %add105.i, ptr %arrayidx89.i, align 8, !tbaa !0
  ret double %add105.i
}

define double @"11"(ptr %arrayidx71.i, ptr %a, ptr %arrayidx21.i, i32 %0, i32 %mul45.i, i32 %mul.i) {
bb:
  %1 = load i32, ptr %arrayidx21.i, align 4, !tbaa !4
  %add22.i = add nsw i32 %1, %0
  %add46.i = add nsw i32 %add22.i, %mul45.i
  %sub.i = sub nsw i32 %add46.i, %mul.i
  %idxprom76.i = sext i32 %sub.i to i64
  %arrayidx77.i = getelementptr inbounds double, ptr %a, i64 %idxprom76.i
  %2 = load double, ptr %arrayidx71.i, align 8, !tbaa !0
  store double %2, ptr %arrayidx77.i, align 8, !tbaa !0
  ret double %2
}

define double @"12"(ptr %a, ptr %arrayidx21.i, i32 %0, i32 %mul45.i, i32 %mul.i) {
bb:
  %1 = load i32, ptr %arrayidx21.i, align 4, !tbaa !4
  %add22.i = add nsw i32 %1, %0
  %add46.i = add nsw i32 %add22.i, %mul45.i
  %sub.i = sub nsw i32 %add46.i, %mul.i
  %idxprom76.i = sext i32 %sub.i to i64
  %arrayidx77.i = getelementptr inbounds double, ptr %a, i64 %idxprom76.i
  %2 = load double, ptr %arrayidx77.i, align 8, !tbaa !0
  ret double %2
}

define double @"13"(ptr %a, ptr %arrayidx21.i, i32 %0, i32 %mul45.i, i32 %mul.i, i32 %1) {
bb:
  %2 = load i32, ptr %arrayidx21.i, align 4, !tbaa !4
  %add22.i = add nsw i32 %2, %0
  %add46.i = add nsw i32 %add22.i, %mul45.i
  %sub.i = sub nsw i32 %add46.i, %mul.i
  %add78.i = add nsw i32 %sub.i, %1
  %idxprom79.i = sext i32 %add78.i to i64
  %arrayidx80.i = getelementptr inbounds double, ptr %a, i64 %idxprom79.i
  %3 = load double, ptr %arrayidx80.i, align 8, !tbaa !0
  ret double %3
}

define double @"14"(ptr %arrayidx38, ptr %arrayidx39, ptr %arrayidx40, ptr %arrayidx54, ptr %arrayidx55, ptr %arrayidx42, ptr %arrayidx43, ptr %arrayidx51, ptr %arrayidx52) {
bb:
  %0 = load double, ptr %arrayidx38, align 8, !tbaa !0
  %1 = load double, ptr %arrayidx54, align 8, !tbaa !0
  %2 = load double, ptr %arrayidx55, align 8, !tbaa !0
  %sub62 = fsub double %1, %2
  %3 = load double, ptr %arrayidx40, align 8, !tbaa !0
  %4 = load double, ptr %arrayidx39, align 8, !tbaa !0
  %sub47 = fsub double %4, %3
  %sub71 = fsub double %sub47, %sub62
  %5 = load double, ptr %arrayidx42, align 8, !tbaa !0
  %6 = load double, ptr %arrayidx43, align 8, !tbaa !0
  %sub50 = fsub double %5, %6
  %7 = load double, ptr %arrayidx52, align 8, !tbaa !0
  %8 = load double, ptr %arrayidx51, align 8, !tbaa !0
  %sub59 = fsub double %8, %7
  %add72 = fadd double %sub50, %sub59
  %sub73 = fsub double %sub71, %add72
  %mul = fmul double %0, %sub73
  store double %mul, ptr %arrayidx40, align 8, !tbaa !0
  ret double %mul
}

define double @"15"(ptr %arrayidx80.i, ptr %a, i64 %0, ptr %arrayidx17.i, i64 %1, i64 %2) {
bb:
  %3 = load double, ptr %arrayidx80.i, align 8, !tbaa !0
  %fneg81.i = fneg double %3
  %4 = load i32, ptr %arrayidx17.i, align 4, !tbaa !4
  %5 = sext i32 %4 to i64
  %6 = add nsw i64 %0, %5
  %7 = add nsw i64 %6, %1
  %8 = add nsw i64 %7, %1
  %9 = add nsw i64 %8, %2
  %arrayidx74.i = getelementptr inbounds double, ptr %a, i64 %9
  store double %fneg81.i, ptr %arrayidx74.i, align 8, !tbaa !0
  ret double %fneg81.i
}

define double @"16"(ptr %arrayidx96.i, ptr %a, ptr %arrayidx21.i, i32 %0, i32 %mul45.i, i32 %mul.i) {
bb:
  %1 = load i32, ptr %arrayidx21.i, align 4, !tbaa !4
  %add22.i = add nsw i32 %1, %0
  %add46.i = add nsw i32 %add22.i, %mul45.i
  %sub.i = sub nsw i32 %add46.i, %mul.i
  %add94.i = add nsw i32 %sub.i, %mul45.i
  %idxprom101.i = sext i32 %add94.i to i64
  %arrayidx102.i = getelementptr inbounds double, ptr %a, i64 %idxprom101.i
  %2 = load double, ptr %arrayidx96.i, align 8, !tbaa !0
  store double %2, ptr %arrayidx102.i, align 8, !tbaa !0
  ret double %2
}

define double @"17"(ptr %a, i64 %0, ptr %arrayidx17.i, i64 %1, i64 %2) {
bb:
  %3 = load i32, ptr %arrayidx17.i, align 4, !tbaa !4
  %4 = sext i32 %3 to i64
  %5 = add nsw i64 %0, %4
  %6 = add nsw i64 %5, %1
  %7 = add nsw i64 %6, %1
  %8 = add nsw i64 %7, %1
  %9 = add nsw i64 %8, %2
  %arrayidx99.i = getelementptr inbounds double, ptr %a, i64 %9
  %10 = load double, ptr %arrayidx99.i, align 8, !tbaa !0
  ret double %10
}

define double @"18"(ptr %arrayidx105.i, ptr %a, i64 %0, ptr %arrayidx17.i, i64 %1, i64 %2) {
bb:
  %3 = load double, ptr %arrayidx105.i, align 8, !tbaa !0
  %fneg106.i = fneg double %3
  %4 = load i32, ptr %arrayidx17.i, align 4, !tbaa !4
  %5 = sext i32 %4 to i64
  %6 = add nsw i64 %0, %5
  %7 = add nsw i64 %6, %1
  %8 = add nsw i64 %7, %1
  %9 = add nsw i64 %8, %1
  %10 = add nsw i64 %9, %2
  %arrayidx99.i = getelementptr inbounds double, ptr %a, i64 %10
  store double %fneg106.i, ptr %arrayidx99.i, align 8, !tbaa !0
  ret double %fneg106.i
}

define double @"19"(ptr %arrayidx) {
bb:
  %0 = load double, ptr %arrayidx, align 8, !tbaa !0
  %fneg = fneg double %0
  store double %fneg, ptr %arrayidx, align 8, !tbaa !0
  ret double %fneg
}

define double @"20"(ptr %arrayidx48.i, ptr %a, ptr %arrayidx21.i, i32 %0, i32 %mul45.i) {
bb:
  %1 = load i32, ptr %arrayidx21.i, align 4, !tbaa !4
  %add22.i = add nsw i32 %1, %0
  %add46.i = add nsw i32 %add22.i, %mul45.i
  %idxprom53.i = sext i32 %add46.i to i64
  %arrayidx54.i = getelementptr inbounds double, ptr %a, i64 %idxprom53.i
  %2 = load double, ptr %arrayidx48.i, align 8, !tbaa !0
  store double %2, ptr %arrayidx54.i, align 8, !tbaa !0
  ret double %2
}

define double @"21"(ptr %arrayidx.i, ptr %arrayidx10.i, ptr %arrayidx38.i, ptr %arrayidx41.i) {
bb:
  %0 = load double, ptr %arrayidx38.i, align 8, !tbaa !0
  %1 = load double, ptr %arrayidx41.i, align 8, !tbaa !0
  %sub54.i = fsub double %0, %1
  %2 = load double, ptr %arrayidx10.i, align 8, !tbaa !0
  %3 = load double, ptr %arrayidx.i, align 8, !tbaa !0
  %sub22.i = fsub double %3, %2
  %sub69.i = fsub double %sub22.i, %sub54.i
  store double %sub69.i, ptr %arrayidx10.i, align 8, !tbaa !0
  ret double %sub69.i
}

define double @"22"(ptr %arrayidx14.i, ptr %arrayidx17.i28, ptr %arrayidx38.i, ptr %arrayidx41.i) {
bb:
  %0 = load double, ptr %arrayidx14.i, align 8, !tbaa !0
  %fneg.i27 = fneg double %0
  %1 = load double, ptr %arrayidx17.i28, align 8, !tbaa !0
  %sub.i29 = fsub double %fneg.i27, %1
  %2 = load double, ptr %arrayidx41.i, align 8, !tbaa !0
  %3 = load double, ptr %arrayidx38.i, align 8, !tbaa !0
  %add42.i = fadd double %3, %2
  %add65.i = fadd double %sub.i29, %add42.i
  store double %add65.i, ptr %arrayidx38.i, align 8, !tbaa !0
  ret double %add65.i
}

define double @"23"(ptr %arrayidx27.i, ptr %a, ptr %arrayidx21.i, i32 %0, i32 %1) {
bb:
  %2 = load double, ptr %arrayidx27.i, align 8, !tbaa !0
  %fneg.i = fneg double %2
  %3 = load i32, ptr %arrayidx21.i, align 4, !tbaa !4
  %add22.i = add nsw i32 %3, %0
  %add30.i = add nsw i32 %add22.i, %1
  %idxprom31.i = sext i32 %add30.i to i64
  %arrayidx32.i = getelementptr inbounds double, ptr %a, i64 %idxprom31.i
  store double %fneg.i, ptr %arrayidx32.i, align 8, !tbaa !0
  ret double %fneg.i
}

define double @"24"(ptr %arrayidx14.i, ptr %arrayidx17.i28, ptr %arrayidx38.i, ptr %arrayidx41.i) {
bb:
  %0 = load double, ptr %arrayidx38.i, align 8, !tbaa !0
  %1 = load double, ptr %arrayidx41.i, align 8, !tbaa !0
  %add42.i = fadd double %0, %1
  %2 = load double, ptr %arrayidx14.i, align 8, !tbaa !0
  %fneg.i27 = fneg double %2
  %3 = load double, ptr %arrayidx17.i28, align 8, !tbaa !0
  %sub.i29 = fsub double %fneg.i27, %3
  %sub58.i = fsub double %sub.i29, %add42.i
  store double %sub58.i, ptr %arrayidx14.i, align 8, !tbaa !0
  ret double %sub58.i
}

define double @"25"(ptr %a, ptr %arrayidx21.i, i32 %0, i32 %mul45.i, i32 %mul.i, i32 %1) {
bb:
  %2 = load i32, ptr %arrayidx21.i, align 4, !tbaa !4
  %add22.i = add nsw i32 %2, %0
  %add46.i = add nsw i32 %add22.i, %mul45.i
  %sub.i = sub nsw i32 %add46.i, %mul.i
  %add94.i = add nsw i32 %sub.i, %mul45.i
  %add103.i = add nsw i32 %add94.i, %1
  %idxprom104.i = sext i32 %add103.i to i64
  %arrayidx105.i = getelementptr inbounds double, ptr %a, i64 %idxprom104.i
  %3 = load double, ptr %arrayidx105.i, align 8, !tbaa !0
  ret double %3
}

define i32 @"26"(ptr %arrayidx2.i, i32 %shr.i, ptr %arrayidx5.i) {
bb:
  %0 = load i32, ptr %arrayidx2.i, align 4, !tbaa !4
  %add.i = add nsw i32 %0, %shr.i
  store i32 %add.i, ptr %arrayidx5.i, align 4, !tbaa !4
  ret i32 %add.i
}

define double @"27"(ptr %arrayidx32.i, ptr %a, i64 %0, ptr %arrayidx17.i, i64 %1) {
bb:
  %2 = load i32, ptr %arrayidx17.i, align 4, !tbaa !4
  %3 = sext i32 %2 to i64
  %4 = add nsw i64 %0, %3
  %5 = add nsw i64 %4, %1
  %arrayidx27.i = getelementptr inbounds double, ptr %a, i64 %5
  %6 = load double, ptr %arrayidx32.i, align 8, !tbaa !0
  %fneg33.i = fneg double %6
  store double %fneg33.i, ptr %arrayidx27.i, align 8, !tbaa !0
  ret double %fneg33.i
}

define double @"28"(ptr %a, i64 %0, ptr %arrayidx17.i, i64 %1) {
bb:
  %2 = load i32, ptr %arrayidx17.i, align 4, !tbaa !4
  %3 = sext i32 %2 to i64
  %4 = add nsw i64 %0, %3
  %5 = add nsw i64 %4, %1
  %arrayidx27.i = getelementptr inbounds double, ptr %a, i64 %5
  %6 = load double, ptr %arrayidx27.i, align 8, !tbaa !0
  ret double %6
}

define double @"29"(ptr %arrayidx57.i, ptr %a, i64 %0, ptr %arrayidx17.i, i64 %1, i64 %2) {
bb:
  %3 = load double, ptr %arrayidx57.i, align 8, !tbaa !0
  %fneg58.i = fneg double %3
  %4 = load i32, ptr %arrayidx17.i, align 4, !tbaa !4
  %5 = sext i32 %4 to i64
  %6 = add nsw i64 %0, %5
  %7 = add nsw i64 %6, %1
  %8 = add nsw i64 %7, %2
  %arrayidx51.i = getelementptr inbounds double, ptr %a, i64 %8
  store double %fneg58.i, ptr %arrayidx51.i, align 8, !tbaa !0
  ret double %fneg58.i
}

define double @"30"(ptr %a, i64 %0, ptr %arrayidx17.i, i64 %1, i64 %2) {
bb:
  %3 = load i32, ptr %arrayidx17.i, align 4, !tbaa !4
  %4 = sext i32 %3 to i64
  %5 = add nsw i64 %0, %4
  %6 = add nsw i64 %5, %1
  %7 = add nsw i64 %6, %1
  %8 = add nsw i64 %7, %2
  %arrayidx74.i = getelementptr inbounds double, ptr %a, i64 %8
  %9 = load double, ptr %arrayidx74.i, align 8, !tbaa !0
  ret double %9
}

define double @"31"(ptr %arrayidx137.i, ptr %a, ptr %arrayidx122.i, i32 %0, i32 %mul.i, i32 %1) {
bb:
  %2 = load double, ptr %arrayidx137.i, align 8, !tbaa !0
  %fneg138.i = fneg double %2
  %3 = load i32, ptr %arrayidx122.i, align 4, !tbaa !4
  %add123.i = add nsw i32 %3, %0
  %add131.i = add nsw i32 %add123.i, %mul.i
  %add132.i = add nsw i32 %add131.i, %mul.i
  %add141.i = add nsw i32 %add132.i, %1
  %idxprom142.i = sext i32 %add141.i to i64
  %arrayidx143.i = getelementptr inbounds double, ptr %a, i64 %idxprom142.i
  store double %fneg138.i, ptr %arrayidx143.i, align 8, !tbaa !0
  ret double %fneg138.i
}

define double @"32"(ptr %arrayidx.i, ptr %arrayidx10.i, ptr %arrayidx32.i31, ptr %arrayidx34.i) {
bb:
  %0 = load double, ptr %arrayidx10.i, align 8, !tbaa !0
  %1 = load double, ptr %arrayidx.i, align 8, !tbaa !0
  %add11.i = fadd double %1, %0
  %2 = load double, ptr %arrayidx32.i31, align 8, !tbaa !0
  %3 = load double, ptr %arrayidx34.i, align 8, !tbaa !0
  %add35.i = fadd double %2, %3
  %sub62.i = fsub double %add11.i, %add35.i
  store double %sub62.i, ptr %arrayidx32.i31, align 8, !tbaa !0
  ret double %sub62.i
}

define double @"33"(ptr %a, i64 %0, ptr %arrayidx17.i) {
bb:
  %1 = load i32, ptr %arrayidx17.i, align 4, !tbaa !4
  %2 = sext i32 %1 to i64
  %3 = add nsw i64 %0, %2
  %arrayidx24.i = getelementptr inbounds double, ptr %a, i64 %3
  %4 = load double, ptr %arrayidx24.i, align 8, !tbaa !0
  ret double %4
}

define double @"34"(ptr %a, ptr %arrayidx21.i, i32 %0) {
bb:
  %1 = load i32, ptr %arrayidx21.i, align 4, !tbaa !4
  %add22.i = add nsw i32 %1, %0
  %idxprom28.i = sext i32 %add22.i to i64
  %arrayidx29.i = getelementptr inbounds double, ptr %a, i64 %idxprom28.i
  %2 = load double, ptr %arrayidx29.i, align 8, !tbaa !0
  ret double %2
}

define double @"35"(ptr %a, i64 %0, ptr %arrayidx17.i, i64 %1, i64 %2) {
bb:
  %3 = load i32, ptr %arrayidx17.i, align 4, !tbaa !4
  %4 = sext i32 %3 to i64
  %5 = add nsw i64 %0, %4
  %6 = add nsw i64 %5, %1
  %7 = add nsw i64 %6, %2
  %arrayidx51.i = getelementptr inbounds double, ptr %a, i64 %7
  %8 = load double, ptr %arrayidx51.i, align 8, !tbaa !0
  ret double %8
}

define double @"36"(ptr %arrayidx102.i, ptr %a, i64 %0, ptr %arrayidx17.i, i64 %1) {
bb:
  %2 = load double, ptr %arrayidx102.i, align 8, !tbaa !0
  %3 = load i32, ptr %arrayidx17.i, align 4, !tbaa !4
  %4 = sext i32 %3 to i64
  %5 = add nsw i64 %0, %4
  %6 = add nsw i64 %5, %1
  %7 = add nsw i64 %6, %1
  %8 = add nsw i64 %7, %1
  %arrayidx96.i = getelementptr inbounds double, ptr %a, i64 %8
  store double %2, ptr %arrayidx96.i, align 8, !tbaa !0
  ret double %2
}

define double @"37"(ptr %arrayidx.i, ptr %arrayidx10.i, ptr %arrayidx32.i31, ptr %arrayidx34.i) {
bb:
  %0 = load double, ptr %arrayidx10.i, align 8, !tbaa !0
  %1 = load double, ptr %arrayidx.i, align 8, !tbaa !0
  %add11.i = fadd double %1, %0
  %2 = load double, ptr %arrayidx32.i31, align 8, !tbaa !0
  %3 = load double, ptr %arrayidx34.i, align 8, !tbaa !0
  %add35.i = fadd double %2, %3
  %add55.i32 = fadd double %add11.i, %add35.i
  store double %add55.i32, ptr %arrayidx.i, align 8, !tbaa !0
  ret double %add55.i32
}

define double @"38"(ptr %arrayidx95.i, ptr %arrayidx99.i23) {
bb:
  %0 = load double, ptr %arrayidx99.i23, align 8, !tbaa !0
  %1 = load double, ptr %arrayidx95.i, align 8, !tbaa !0
  %fneg109.i = fneg double %1
  %sub113.i = fsub double %fneg109.i, %0
  store double %sub113.i, ptr %arrayidx95.i, align 8, !tbaa !0
  ret double %sub113.i
}

define double @"39"(ptr %arrayidx54.i, ptr %a, i64 %0, ptr %arrayidx17.i, i64 %1) {
bb:
  %2 = load i32, ptr %arrayidx17.i, align 4, !tbaa !4
  %3 = sext i32 %2 to i64
  %4 = add nsw i64 %0, %3
  %5 = add nsw i64 %4, %1
  %arrayidx48.i = getelementptr inbounds double, ptr %a, i64 %5
  %6 = load double, ptr %arrayidx54.i, align 8, !tbaa !0
  store double %6, ptr %arrayidx48.i, align 8, !tbaa !0
  ret double %6
}

define double @"40"(ptr %a, ptr %arrayidx21.i, i32 %0, i32 %1) {
bb:
  %2 = load i32, ptr %arrayidx21.i, align 4, !tbaa !4
  %add22.i = add nsw i32 %2, %0
  %add30.i = add nsw i32 %add22.i, %1
  %idxprom31.i = sext i32 %add30.i to i64
  %arrayidx32.i = getelementptr inbounds double, ptr %a, i64 %idxprom31.i
  %3 = load double, ptr %arrayidx32.i, align 8, !tbaa !0
  ret double %3
}

define double @"41"(ptr %arrayidx89.i, ptr %arrayidx91.i) {
bb:
  %0 = load double, ptr %arrayidx89.i, align 8, !tbaa !0
  %1 = load double, ptr %arrayidx91.i, align 8, !tbaa !0
  %sub92.i = fsub double %0, %1
  store double %sub92.i, ptr %arrayidx91.i, align 8, !tbaa !0
  ret double %sub92.i
}

define double @"42"(ptr %arrayidx77.i, ptr %a, i64 %0, ptr %arrayidx17.i, i64 %1) {
bb:
  %2 = load double, ptr %arrayidx77.i, align 8, !tbaa !0
  %3 = load i32, ptr %arrayidx17.i, align 4, !tbaa !4
  %4 = sext i32 %3 to i64
  %5 = add nsw i64 %0, %4
  %6 = add nsw i64 %5, %1
  %7 = add nsw i64 %6, %1
  %arrayidx71.i = getelementptr inbounds double, ptr %a, i64 %7
  store double %2, ptr %arrayidx71.i, align 8, !tbaa !0
  ret double %2
}

define double @"43"(ptr %arrayidx24.i, ptr %a, ptr %arrayidx21.i, i32 %0) {
bb:
  %1 = load double, ptr %arrayidx24.i, align 8, !tbaa !0
  %2 = load i32, ptr %arrayidx21.i, align 4, !tbaa !4
  %add22.i = add nsw i32 %2, %0
  %idxprom28.i = sext i32 %add22.i to i64
  %arrayidx29.i = getelementptr inbounds double, ptr %a, i64 %idxprom28.i
  store double %1, ptr %arrayidx29.i, align 8, !tbaa !0
  ret double %1
}

define double @"44"(ptr %a, ptr %arrayidx21.i, i32 %0, i32 %mul45.i, i32 %1) {
bb:
  %2 = load i32, ptr %arrayidx21.i, align 4, !tbaa !4
  %add22.i = add nsw i32 %2, %0
  %add46.i = add nsw i32 %add22.i, %mul45.i
  %add55.i = add nsw i32 %add46.i, %1
  %idxprom56.i = sext i32 %add55.i to i64
  %arrayidx57.i = getelementptr inbounds double, ptr %a, i64 %idxprom56.i
  %3 = load double, ptr %arrayidx57.i, align 8, !tbaa !0
  ret double %3
}

!0 = !{!1, !1, i64 0}
!1 = !{!"double", !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !2, i64 0}
