; ModuleID = 'DNAs'

@fmt_int = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt_str = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@context = private unnamed_addr constant [5 x i8] c"agct\00"
@context.1 = private unnamed_addr constant [8 x i8] c"uaugccu\00"
@context.2 = private unnamed_addr constant [8 x i8] c"a-k-w-y\00"

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %d1 = alloca i8*
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @context, i32 0, i32 0), i8** %d1
  %r1 = alloca i8*
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @context.1, i32 0, i32 0), i8** %r1
  %p1 = alloca i8*
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @context.2, i32 0, i32 0), i8** %p1
  %d11 = load i8*, i8** %d1
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* %d11)
  %r12 = load i8*, i8** %r1
  %printf3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* %r12)
  %p14 = load i8*, i8** %p1
  %printf5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* %p14)
  ret i32 0
}
