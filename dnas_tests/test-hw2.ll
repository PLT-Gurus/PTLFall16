; ModuleID = 'DNAs'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@fmt_int = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt_str = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@context = private unnamed_addr constant [14 x i8] c"Hello World !\00"
@context.1 = private unnamed_addr constant [14 x i8] c"What is next?\00"
@.str = private unnamed_addr constant [16 x i8] c"Hello I'm in C\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %i = alloca i32
  store i32 1, i32* %i
  store i32 1, i32* %i
  br label %while

while:                                            ; preds = %while_body, %entry
  %i2 = load i32, i32* %i
  %bop3 = icmp slt i32 %i2, 2
  br i1 %bop3, label %while_body, label %merge

while_body:                                       ; preds = %while
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @context, i32 0, i32 0))
  %i1 = load i32, i32* %i
  %bop = add i32 %i1, 1
  store i32 %bop, i32* %i
  br label %while

merge:                                            ; preds = %while
  br label %while4

while4:                                           ; preds = %while_body5, %merge
  %i9 = load i32, i32* %i
  %bop10 = icmp sgt i32 %i9, 1
  br i1 %bop10, label %while_body5, label %merge11

while_body5:                                      ; preds = %while4
  %i6 = load i32, i32* %i
  %bop7 = sub i32 %i6, 1
  store i32 %bop7, i32* %i
  %printf8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @context.1, i32 0, i32 0))
  br label %while4

merge11:                                          ; preds = %while4
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
