; ModuleID = 'DNAs'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@fmt_int = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt_str = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@context = private unnamed_addr constant [10 x i8] c"# i loop#\00"
@context.1 = private unnamed_addr constant [29 x i8] c"# i loop scope # Value of k:\00"
@context.2 = private unnamed_addr constant [29 x i8] c"# global scope # Value of k:\00"
@context.3 = private unnamed_addr constant [31 x i8] c"# global scope # Value of cnt:\00"
@.str = private unnamed_addr constant [16 x i8] c"Hello I'm in C\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %i = alloca i32
  store i32 0, i32* %i
  %j = alloca i32
  store i32 0, i32* %j
  %k = alloca i32
  store i32 0, i32* %k
  %cnt = alloca i32
  store i32 0, i32* %cnt
  br label %while

while:                                            ; preds = %merge, %entry
  %i22 = load i32, i32* %i
  %bop23 = icmp slt i32 %i22, 10
  br i1 %bop23, label %while_body, label %merge24

while_body:                                       ; preds = %while
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @context, i32 0, i32 0))
  %i1 = load i32, i32* %i
  %bop = add i32 %i1, 1
  store i32 %bop, i32* %i
  %k2 = alloca i32
  %i3 = load i32, i32* %i
  store i32 %i3, i32* %k2
  %i4 = load i32, i32* %i
  store i32 %i4, i32* %j
  br label %while5

while5:                                           ; preds = %while_body6, %while_body
  %j17 = load i32, i32* %j
  %bop18 = icmp slt i32 %j17, 10
  br i1 %bop18, label %while_body6, label %merge

while_body6:                                      ; preds = %while5
  %k7 = alloca i32
  %i8 = load i32, i32* %i
  %j9 = load i32, i32* %j
  %bop10 = mul i32 %i8, %j9
  store i32 %bop10, i32* %k7
  %cnt11 = load i32, i32* %cnt
  %bop12 = add i32 %cnt11, 1
  store i32 %bop12, i32* %cnt
  %k13 = load i32, i32* %k7
  %printf14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i32 0, i32 0), i32 %k13)
  %j15 = load i32, i32* %j
  %bop16 = add i32 %j15, 1
  store i32 %bop16, i32* %j
  br label %while5

merge:                                            ; preds = %while5
  %printf19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @context.1, i32 0, i32 0))
  %k20 = load i32, i32* %k2
  %printf21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i32 0, i32 0), i32 %k20)
  br label %while

merge24:                                          ; preds = %while
  %printf25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @context.2, i32 0, i32 0))
  %k26 = load i32, i32* %k
  %printf27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i32 0, i32 0), i32 %k26)
  %printf28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @context.3, i32 0, i32 0))
  %cnt29 = load i32, i32* %cnt
  %printf30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i32 0, i32 0), i32 %cnt29)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @test(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0))
  %4 = load i32, i32* %1, align 4
  %5 = load i32, i32* %2, align 4
  %6 = add nsw i32 %4, %5
  ret i32 %6
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
