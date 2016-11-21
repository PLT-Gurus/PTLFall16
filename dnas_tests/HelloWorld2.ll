; ModuleID = 'DNAs'

@fmt_int = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt_str = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@context = private unnamed_addr constant [16 x i8] c"\22Hello World !\22\00"
@context.1 = private unnamed_addr constant [16 x i8] c"\22What is next?\22\00"

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
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @context, i32 0, i32 0))
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
  %printf8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @context.1, i32 0, i32 0))
  br label %while4

merge11:                                          ; preds = %while4
  ret i32 0
}
