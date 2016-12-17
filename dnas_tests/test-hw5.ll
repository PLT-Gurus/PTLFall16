; ModuleID = 'DNAs'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@fmt_int = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt_str = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@context = private unnamed_addr constant [12 x i8] c"agcgcaagcca\00"
@.str = private unnamed_addr constant [16 x i8] c"Hello I'm in C\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %hi = alloca i8*
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @context, i32 0, i32 0), i8** %hi
  %hi1 = load i8*, i8** %hi
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* %hi1)
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
  %2 = alloca i8*, align 8
  %i = alloca i32, align 4
  %length = alloca i32, align 4
  %retstr = alloca i8*, align 8
  %curr = alloca i8, align 1
  %i1 = alloca i32, align 4
  store i8* %str, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = icmp ne i8* %3, null
  br i1 %4, label %7, label %5

; <label>:5                                       ; preds = %0
  %6 = load i8*, i8** %2, align 8
  store i8* %6, i8** %1, align 8
  br label %114

; <label>:7                                       ; preds = %0
  store i32 0, i32* %i, align 4
  br label %8

; <label>:8                                       ; preds = %16, %7
  %9 = load i32, i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = load i8*, i8** %2, align 8
  %12 = getelementptr inbounds i8, i8* %11, i64 %10
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %19

; <label>:16                                      ; preds = %8
  %17 = load i32, i32* %i, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %i, align 4
  br label %8

; <label>:19                                      ; preds = %8
  %20 = load i32, i32* %i, align 4
  store i32 %20, i32* %length, align 4
  %21 = load i32, i32* %length, align 4
  %22 = sext i32 %21 to i64
  %23 = call noalias i8* @malloc(i64 %22) #2
  store i8* %23, i8** %retstr, align 8
  store i32 0, i32* %i1, align 4
  br label %24

; <label>:24                                      ; preds = %105, %19
  %25 = load i32, i32* %i1, align 4
  %26 = load i32, i32* %length, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %108

; <label>:28                                      ; preds = %24
  %29 = load i32, i32* %i1, align 4
  %30 = sext i32 %29 to i64
  %31 = load i8*, i8** %2, align 8
  %32 = getelementptr inbounds i8, i8* %31, i64 %30
  %33 = load i8, i8* %32, align 1
  store i8 %33, i8* %curr, align 1
  %34 = load i8, i8* %curr, align 1
  %35 = sext i8 %34 to i32
  %36 = icmp eq i32 %35, 65
  br i1 %36, label %41, label %37

; <label>:37                                      ; preds = %28
  %38 = load i8, i8* %curr, align 1
  %39 = sext i8 %38 to i32
  %40 = icmp eq i32 %39, 84
  br i1 %40, label %41, label %50

; <label>:41                                      ; preds = %37, %28
  %42 = load i8, i8* %curr, align 1
  %43 = sext i8 %42 to i32
  %44 = sub nsw i32 149, %43
  %45 = trunc i32 %44 to i8
  %46 = load i32, i32* %i1, align 4
  %47 = sext i32 %46 to i64
  %48 = load i8*, i8** %retstr, align 8
  %49 = getelementptr inbounds i8, i8* %48, i64 %47
  store i8 %45, i8* %49, align 1
  br label %104

; <label>:50                                      ; preds = %37
  %51 = load i8, i8* %curr, align 1
  %52 = sext i8 %51 to i32
  %53 = icmp eq i32 %52, 67
  br i1 %53, label %58, label %54

; <label>:54                                      ; preds = %50
  %55 = load i8, i8* %curr, align 1
  %56 = sext i8 %55 to i32
  %57 = icmp eq i32 %56, 71
  br i1 %57, label %58, label %67

; <label>:58                                      ; preds = %54, %50
  %59 = load i8, i8* %curr, align 1
  %60 = sext i8 %59 to i32
  %61 = sub nsw i32 138, %60
  %62 = trunc i32 %61 to i8
  %63 = load i32, i32* %i1, align 4
  %64 = sext i32 %63 to i64
  %65 = load i8*, i8** %retstr, align 8
  %66 = getelementptr inbounds i8, i8* %65, i64 %64
  store i8 %62, i8* %66, align 1
  br label %103

; <label>:67                                      ; preds = %54
  %68 = load i8, i8* %curr, align 1
  %69 = sext i8 %68 to i32
  %70 = icmp eq i32 %69, 97
  br i1 %70, label %75, label %71

; <label>:71                                      ; preds = %67
  %72 = load i8, i8* %curr, align 1
  %73 = sext i8 %72 to i32
  %74 = icmp eq i32 %73, 116
  br i1 %74, label %75, label %84

; <label>:75                                      ; preds = %71, %67
  %76 = load i8, i8* %curr, align 1
  %77 = sext i8 %76 to i32
  %78 = sub nsw i32 181, %77
  %79 = trunc i32 %78 to i8
  %80 = load i32, i32* %i1, align 4
  %81 = sext i32 %80 to i64
  %82 = load i8*, i8** %retstr, align 8
  %83 = getelementptr inbounds i8, i8* %82, i64 %81
  store i8 %79, i8* %83, align 1
  br label %102

; <label>:84                                      ; preds = %71
  %85 = load i8, i8* %curr, align 1
  %86 = sext i8 %85 to i32
  %87 = icmp eq i32 %86, 99
  br i1 %87, label %92, label %88

; <label>:88                                      ; preds = %84
  %89 = load i8, i8* %curr, align 1
  %90 = sext i8 %89 to i32
  %91 = icmp eq i32 %90, 103
  br i1 %91, label %92, label %101

; <label>:92                                      ; preds = %88, %84
  %93 = load i8, i8* %curr, align 1
  %94 = sext i8 %93 to i32
  %95 = sub nsw i32 170, %94
  %96 = trunc i32 %95 to i8
  %97 = load i32, i32* %i1, align 4
  %98 = sext i32 %97 to i64
  %99 = load i8*, i8** %retstr, align 8
  %100 = getelementptr inbounds i8, i8* %99, i64 %98
  store i8 %96, i8* %100, align 1
  br label %101

; <label>:101                                     ; preds = %92, %88
  br label %102

; <label>:102                                     ; preds = %101, %75
  br label %103

; <label>:103                                     ; preds = %102, %58
  br label %104

; <label>:104                                     ; preds = %103, %41
  br label %105

; <label>:105                                     ; preds = %104
  %106 = load i32, i32* %i1, align 4
  %107 = add nsw i32 %106, 1
  store i32 %107, i32* %i1, align 4
  br label %24

; <label>:108                                     ; preds = %24
  %109 = load i32, i32* %length, align 4
  %110 = sext i32 %109 to i64
  %111 = load i8*, i8** %retstr, align 8
  %112 = getelementptr inbounds i8, i8* %111, i64 %110
  store i8 0, i8* %112, align 1
  %113 = load i8*, i8** %retstr, align 8
  store i8* %113, i8** %1, align 8
  br label %114

; <label>:114                                     ; preds = %108, %5
  %115 = load i8*, i8** %1, align 8
  ret i8* %115
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define i8* @transcribe(i8* %str) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %i = alloca i32, align 4
  %length = alloca i32, align 4
  %retstr = alloca i8*, align 8
  %curr = alloca i8, align 1
  %i1 = alloca i32, align 4
  store i8* %str, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = icmp ne i8* %3, null
  br i1 %4, label %7, label %5

; <label>:5                                       ; preds = %0
  %6 = load i8*, i8** %2, align 8
  store i8* %6, i8** %1, align 8
  br label %112

; <label>:7                                       ; preds = %0
  store i32 0, i32* %i, align 4
  br label %8

; <label>:8                                       ; preds = %16, %7
  %9 = load i32, i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = load i8*, i8** %2, align 8
  %12 = getelementptr inbounds i8, i8* %11, i64 %10
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %19

; <label>:16                                      ; preds = %8
  %17 = load i32, i32* %i, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %i, align 4
  br label %8

; <label>:19                                      ; preds = %8
  %20 = load i32, i32* %i, align 4
  store i32 %20, i32* %length, align 4
  %21 = load i32, i32* %length, align 4
  %22 = sext i32 %21 to i64
  %23 = call noalias i8* @malloc(i64 %22) #2
  store i8* %23, i8** %retstr, align 8
  store i32 0, i32* %i1, align 4
  br label %24

; <label>:24                                      ; preds = %103, %19
  %25 = load i32, i32* %i1, align 4
  %26 = load i32, i32* %length, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %106

; <label>:28                                      ; preds = %24
  %29 = load i32, i32* %i1, align 4
  %30 = sext i32 %29 to i64
  %31 = load i8*, i8** %2, align 8
  %32 = getelementptr inbounds i8, i8* %31, i64 %30
  %33 = load i8, i8* %32, align 1
  store i8 %33, i8* %curr, align 1
  %34 = load i8, i8* %curr, align 1
  %35 = sext i8 %34 to i32
  %36 = icmp eq i32 %35, 84
  br i1 %36, label %37, label %42

; <label>:37                                      ; preds = %28
  %38 = load i32, i32* %i1, align 4
  %39 = sext i32 %38 to i64
  %40 = load i8*, i8** %retstr, align 8
  %41 = getelementptr inbounds i8, i8* %40, i64 %39
  store i8 65, i8* %41, align 1
  br label %102

; <label>:42                                      ; preds = %28
  %43 = load i8, i8* %curr, align 1
  %44 = sext i8 %43 to i32
  %45 = icmp eq i32 %44, 67
  br i1 %45, label %50, label %46

; <label>:46                                      ; preds = %42
  %47 = load i8, i8* %curr, align 1
  %48 = sext i8 %47 to i32
  %49 = icmp eq i32 %48, 71
  br i1 %49, label %50, label %59

; <label>:50                                      ; preds = %46, %42
  %51 = load i8, i8* %curr, align 1
  %52 = sext i8 %51 to i32
  %53 = sub nsw i32 138, %52
  %54 = trunc i32 %53 to i8
  %55 = load i32, i32* %i1, align 4
  %56 = sext i32 %55 to i64
  %57 = load i8*, i8** %retstr, align 8
  %58 = getelementptr inbounds i8, i8* %57, i64 %56
  store i8 %54, i8* %58, align 1
  br label %101

; <label>:59                                      ; preds = %46
  %60 = load i8, i8* %curr, align 1
  %61 = sext i8 %60 to i32
  %62 = icmp eq i32 %61, 116
  br i1 %62, label %63, label %68

; <label>:63                                      ; preds = %59
  %64 = load i32, i32* %i1, align 4
  %65 = sext i32 %64 to i64
  %66 = load i8*, i8** %retstr, align 8
  %67 = getelementptr inbounds i8, i8* %66, i64 %65
  store i8 65, i8* %67, align 1
  br label %100

; <label>:68                                      ; preds = %59
  %69 = load i8, i8* %curr, align 1
  %70 = sext i8 %69 to i32
  %71 = icmp eq i32 %70, 99
  br i1 %71, label %76, label %72

; <label>:72                                      ; preds = %68
  %73 = load i8, i8* %curr, align 1
  %74 = sext i8 %73 to i32
  %75 = icmp eq i32 %74, 103
  br i1 %75, label %76, label %85

; <label>:76                                      ; preds = %72, %68
  %77 = load i8, i8* %curr, align 1
  %78 = sext i8 %77 to i32
  %79 = sub nsw i32 170, %78
  %80 = trunc i32 %79 to i8
  %81 = load i32, i32* %i1, align 4
  %82 = sext i32 %81 to i64
  %83 = load i8*, i8** %retstr, align 8
  %84 = getelementptr inbounds i8, i8* %83, i64 %82
  store i8 %80, i8* %84, align 1
  br label %99

; <label>:85                                      ; preds = %72
  %86 = load i8, i8* %curr, align 1
  %87 = sext i8 %86 to i32
  %88 = icmp eq i32 %87, 65
  br i1 %88, label %93, label %89

; <label>:89                                      ; preds = %85
  %90 = load i8, i8* %curr, align 1
  %91 = sext i8 %90 to i32
  %92 = icmp eq i32 %91, 97
  br i1 %92, label %93, label %98

; <label>:93                                      ; preds = %89, %85
  %94 = load i32, i32* %i1, align 4
  %95 = sext i32 %94 to i64
  %96 = load i8*, i8** %retstr, align 8
  %97 = getelementptr inbounds i8, i8* %96, i64 %95
  store i8 85, i8* %97, align 1
  br label %98

; <label>:98                                      ; preds = %93, %89
  br label %99

; <label>:99                                      ; preds = %98, %76
  br label %100

; <label>:100                                     ; preds = %99, %63
  br label %101

; <label>:101                                     ; preds = %100, %50
  br label %102

; <label>:102                                     ; preds = %101, %37
  br label %103

; <label>:103                                     ; preds = %102
  %104 = load i32, i32* %i1, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %i1, align 4
  br label %24

; <label>:106                                     ; preds = %24
  %107 = load i32, i32* %length, align 4
  %108 = sext i32 %107 to i64
  %109 = load i8*, i8** %retstr, align 8
  %110 = getelementptr inbounds i8, i8* %109, i64 %108
  store i8 0, i8* %110, align 1
  %111 = load i8*, i8** %retstr, align 8
  store i8* %111, i8** %1, align 8
  br label %112

; <label>:112                                     ; preds = %106, %5
  %113 = load i8*, i8** %1, align 8
  ret i8* %113
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
