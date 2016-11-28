; ModuleID = 'DNAs'

@fmt_int = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt_str = private unnamed_addr constant [4 x i8] c"%s\0A\00"

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  ret i32 0
}
