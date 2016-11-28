; ModuleID = 'DNAs'

@fmt_int = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt_str = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@context = private unnamed_addr constant [6 x i8] c"hello\00"
@context.1 = private unnamed_addr constant [3 x i8] c"hi\00"

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %hi = alloca i8*
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @context, i32 0, i32 0), i8** %hi
  %hi1 = load i8*, i8** %hi
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* %hi1)
  %printf2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @context.1, i32 0, i32 0))
  ret i32 0
}
