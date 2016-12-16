; ModuleID = 'DNAs'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@fmt_int = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt_str = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@context = private unnamed_addr constant [5 x i8] c"agct\00"
@context.1 = private unnamed_addr constant [8 x i8] c"uaugccu\00"
@context.2 = private unnamed_addr constant [8 x i8] c"a-k-w-y\00"
@context.3 = private unnamed_addr constant [5 x i8] c"----\00"
@.str = private unnamed_addr constant [16 x i8] c"Hello I'm in C\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %test = call i32 (i32, i32, ...) bitcast (i32 (i32, i32)* @test to i32 (i32, i32, ...)*)(i32 1, i32 1)
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
  %printf6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @context.3, i32 0, i32 0))
  %d17 = load i8*, i8** %d1
  %d18 = load i8*, i8** %d1
  %complement = call i8* (i8*, ...) bitcast (i8* (i8*)* @complement to i8* (i8*, ...)*)(i8* %d18)
  %printf9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* %complement)
  %r110 = load i8*, i8** %r1
  %r111 = load i8*, i8** %r1
  %complement12 = call i8* (i8*, ...) bitcast (i8* (i8*)* @complement to i8* (i8*, ...)*)(i8* %r111)
  %printf13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* %complement12)
  %d114 = load i8*, i8** %d1
  %transcribe = call i8* (i8*, ...) bitcast (i8* (i8*)* @transcribe to i8* (i8*, ...)*)(i8* %d114)
  %printf15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* %transcribe)
  %r116 = load i8*, i8** %r1
  %transcribe17 = call i8* (i8*, ...) bitcast (i8* (i8*)* @transcribe to i8* (i8*, ...)*)(i8* %r116)
  %printf18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* %transcribe17)
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

; Function Attrs: nounwind uwtable
define i8* @complement(i8* %str) #0 {
  %1 = alloca i8*, align 8
  %length = alloca i32, align 4
  %retstr = alloca i8*, align 8
  %curr = alloca i8, align 1
  %i = alloca i32, align 4
  store i8* %str, i8** %1, align 8
  store i32 8, i32* %length, align 4
  %2 = load i32, i32* %length, align 4
  %3 = sext i32 %2 to i64
  %4 = call noalias i8* @malloc(i64 %3) #2
  store i8* %4, i8** %retstr, align 8
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %86, %0
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* %length, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %89

; <label>:9                                       ; preds = %5
  %10 = load i32, i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = load i8*, i8** %1, align 8
  %13 = getelementptr inbounds i8, i8* %12, i64 %11
  %14 = load i8, i8* %13, align 1
  store i8 %14, i8* %curr, align 1
  %15 = load i8, i8* %curr, align 1
  %16 = sext i8 %15 to i32
  %17 = icmp eq i32 %16, 65
  br i1 %17, label %22, label %18

; <label>:18                                      ; preds = %9
  %19 = load i8, i8* %curr, align 1
  %20 = sext i8 %19 to i32
  %21 = icmp eq i32 %20, 84
  br i1 %21, label %22, label %31

; <label>:22                                      ; preds = %18, %9
  %23 = load i8, i8* %curr, align 1
  %24 = sext i8 %23 to i32
  %25 = sub nsw i32 149, %24
  %26 = trunc i32 %25 to i8
  %27 = load i32, i32* %i, align 4
  %28 = sext i32 %27 to i64
  %29 = load i8*, i8** %retstr, align 8
  %30 = getelementptr inbounds i8, i8* %29, i64 %28
  store i8 %26, i8* %30, align 1
  br label %85

; <label>:31                                      ; preds = %18
  %32 = load i8, i8* %curr, align 1
  %33 = sext i8 %32 to i32
  %34 = icmp eq i32 %33, 67
  br i1 %34, label %39, label %35

; <label>:35                                      ; preds = %31
  %36 = load i8, i8* %curr, align 1
  %37 = sext i8 %36 to i32
  %38 = icmp eq i32 %37, 71
  br i1 %38, label %39, label %48

; <label>:39                                      ; preds = %35, %31
  %40 = load i8, i8* %curr, align 1
  %41 = sext i8 %40 to i32
  %42 = sub nsw i32 138, %41
  %43 = trunc i32 %42 to i8
  %44 = load i32, i32* %i, align 4
  %45 = sext i32 %44 to i64
  %46 = load i8*, i8** %retstr, align 8
  %47 = getelementptr inbounds i8, i8* %46, i64 %45
  store i8 %43, i8* %47, align 1
  br label %84

; <label>:48                                      ; preds = %35
  %49 = load i8, i8* %curr, align 1
  %50 = sext i8 %49 to i32
  %51 = icmp eq i32 %50, 97
  br i1 %51, label %56, label %52

; <label>:52                                      ; preds = %48
  %53 = load i8, i8* %curr, align 1
  %54 = sext i8 %53 to i32
  %55 = icmp eq i32 %54, 116
  br i1 %55, label %56, label %65

; <label>:56                                      ; preds = %52, %48
  %57 = load i8, i8* %curr, align 1
  %58 = sext i8 %57 to i32
  %59 = sub nsw i32 181, %58
  %60 = trunc i32 %59 to i8
  %61 = load i32, i32* %i, align 4
  %62 = sext i32 %61 to i64
  %63 = load i8*, i8** %retstr, align 8
  %64 = getelementptr inbounds i8, i8* %63, i64 %62
  store i8 %60, i8* %64, align 1
  br label %83

; <label>:65                                      ; preds = %52
  %66 = load i8, i8* %curr, align 1
  %67 = sext i8 %66 to i32
  %68 = icmp eq i32 %67, 99
  br i1 %68, label %73, label %69

; <label>:69                                      ; preds = %65
  %70 = load i8, i8* %curr, align 1
  %71 = sext i8 %70 to i32
  %72 = icmp eq i32 %71, 103
  br i1 %72, label %73, label %82

; <label>:73                                      ; preds = %69, %65
  %74 = load i8, i8* %curr, align 1
  %75 = sext i8 %74 to i32
  %76 = sub nsw i32 170, %75
  %77 = trunc i32 %76 to i8
  %78 = load i32, i32* %i, align 4
  %79 = sext i32 %78 to i64
  %80 = load i8*, i8** %retstr, align 8
  %81 = getelementptr inbounds i8, i8* %80, i64 %79
  store i8 %77, i8* %81, align 1
  br label %82

; <label>:82                                      ; preds = %73, %69
  br label %83

; <label>:83                                      ; preds = %82, %56
  br label %84

; <label>:84                                      ; preds = %83, %39
  br label %85

; <label>:85                                      ; preds = %84, %22
  br label %86

; <label>:86                                      ; preds = %85
  %87 = load i32, i32* %i, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %i, align 4
  br label %5

; <label>:89                                      ; preds = %5
  %90 = load i32, i32* %length, align 4
  %91 = sext i32 %90 to i64
  %92 = load i8*, i8** %retstr, align 8
  %93 = getelementptr inbounds i8, i8* %92, i64 %91
  store i8 0, i8* %93, align 1
  %94 = load i8*, i8** %retstr, align 8
  ret i8* %94
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define i8* @transcribe(i8* %str) #0 {
  %1 = alloca i8*, align 8
  %length = alloca i32, align 4
  %retstr = alloca i8*, align 8
  %curr = alloca i8, align 1
  %i = alloca i32, align 4
  store i8* %str, i8** %1, align 8
  store i32 8, i32* %length, align 4
  %2 = load i32, i32* %length, align 4
  %3 = sext i32 %2 to i64
  %4 = call noalias i8* @malloc(i64 %3) #2
  store i8* %4, i8** %retstr, align 8
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %84, %0
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* %length, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %87

; <label>:9                                       ; preds = %5
  %10 = load i32, i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = load i8*, i8** %1, align 8
  %13 = getelementptr inbounds i8, i8* %12, i64 %11
  %14 = load i8, i8* %13, align 1
  store i8 %14, i8* %curr, align 1
  %15 = load i8, i8* %curr, align 1
  %16 = sext i8 %15 to i32
  %17 = icmp eq i32 %16, 84
  br i1 %17, label %18, label %23

; <label>:18                                      ; preds = %9
  %19 = load i32, i32* %i, align 4
  %20 = sext i32 %19 to i64
  %21 = load i8*, i8** %retstr, align 8
  %22 = getelementptr inbounds i8, i8* %21, i64 %20
  store i8 65, i8* %22, align 1
  br label %83

; <label>:23                                      ; preds = %9
  %24 = load i8, i8* %curr, align 1
  %25 = sext i8 %24 to i32
  %26 = icmp eq i32 %25, 67
  br i1 %26, label %31, label %27

; <label>:27                                      ; preds = %23
  %28 = load i8, i8* %curr, align 1
  %29 = sext i8 %28 to i32
  %30 = icmp eq i32 %29, 71
  br i1 %30, label %31, label %40

; <label>:31                                      ; preds = %27, %23
  %32 = load i8, i8* %curr, align 1
  %33 = sext i8 %32 to i32
  %34 = sub nsw i32 138, %33
  %35 = trunc i32 %34 to i8
  %36 = load i32, i32* %i, align 4
  %37 = sext i32 %36 to i64
  %38 = load i8*, i8** %retstr, align 8
  %39 = getelementptr inbounds i8, i8* %38, i64 %37
  store i8 %35, i8* %39, align 1
  br label %82

; <label>:40                                      ; preds = %27
  %41 = load i8, i8* %curr, align 1
  %42 = sext i8 %41 to i32
  %43 = icmp eq i32 %42, 116
  br i1 %43, label %44, label %49

; <label>:44                                      ; preds = %40
  %45 = load i32, i32* %i, align 4
  %46 = sext i32 %45 to i64
  %47 = load i8*, i8** %retstr, align 8
  %48 = getelementptr inbounds i8, i8* %47, i64 %46
  store i8 65, i8* %48, align 1
  br label %81

; <label>:49                                      ; preds = %40
  %50 = load i8, i8* %curr, align 1
  %51 = sext i8 %50 to i32
  %52 = icmp eq i32 %51, 99
  br i1 %52, label %57, label %53

; <label>:53                                      ; preds = %49
  %54 = load i8, i8* %curr, align 1
  %55 = sext i8 %54 to i32
  %56 = icmp eq i32 %55, 103
  br i1 %56, label %57, label %66

; <label>:57                                      ; preds = %53, %49
  %58 = load i8, i8* %curr, align 1
  %59 = sext i8 %58 to i32
  %60 = sub nsw i32 170, %59
  %61 = trunc i32 %60 to i8
  %62 = load i32, i32* %i, align 4
  %63 = sext i32 %62 to i64
  %64 = load i8*, i8** %retstr, align 8
  %65 = getelementptr inbounds i8, i8* %64, i64 %63
  store i8 %61, i8* %65, align 1
  br label %80

; <label>:66                                      ; preds = %53
  %67 = load i8, i8* %curr, align 1
  %68 = sext i8 %67 to i32
  %69 = icmp eq i32 %68, 65
  br i1 %69, label %74, label %70

; <label>:70                                      ; preds = %66
  %71 = load i8, i8* %curr, align 1
  %72 = sext i8 %71 to i32
  %73 = icmp eq i32 %72, 97
  br i1 %73, label %74, label %79

; <label>:74                                      ; preds = %70, %66
  %75 = load i32, i32* %i, align 4
  %76 = sext i32 %75 to i64
  %77 = load i8*, i8** %retstr, align 8
  %78 = getelementptr inbounds i8, i8* %77, i64 %76
  store i8 85, i8* %78, align 1
  br label %79

; <label>:79                                      ; preds = %74, %70
  br label %80

; <label>:80                                      ; preds = %79, %57
  br label %81

; <label>:81                                      ; preds = %80, %44
  br label %82

; <label>:82                                      ; preds = %81, %31
  br label %83

; <label>:83                                      ; preds = %82, %18
  br label %84

; <label>:84                                      ; preds = %83
  %85 = load i32, i32* %i, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, i32* %i, align 4
  br label %5

; <label>:87                                      ; preds = %5
  %88 = load i32, i32* %length, align 4
  %89 = sext i32 %88 to i64
  %90 = load i8*, i8** %retstr, align 8
  %91 = getelementptr inbounds i8, i8* %90, i64 %89
  store i8 0, i8* %91, align 1
  %92 = load i8*, i8** %retstr, align 8
  ret i8* %92
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
