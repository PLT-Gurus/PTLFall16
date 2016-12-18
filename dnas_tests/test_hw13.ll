; ModuleID = 'DNAs'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@fmt_int = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt_str = private unnamed_addr constant [3 x i8] c"%s\00"
@context = private unnamed_addr constant [4 x i8] c"abc\00"
@context.1 = private unnamed_addr constant [4 x i8] c"def\00"
@context.2 = private unnamed_addr constant [5 x i8] c"atgc\00"
@.str = private unnamed_addr constant [16 x i8] c"Hello I'm in C\0A\00", align 1

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %hi = alloca i8*
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @context, i32 0, i32 0), i8** %hi
  %hello = alloca i8*
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @context.1, i32 0, i32 0), i8** %hello
  %sample = alloca i8*
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @context.2, i32 0, i32 0), i8** %sample
  %another = alloca i8*
  %sample1 = load i8*, i8** %sample
  %transcribe = call i8* (i8*, ...) bitcast (i8* (i8*)* @transcribe to i8* (i8*, ...)*)(i8* %sample1)
  store i8* %transcribe, i8** %another
  %another2 = load i8*, i8** %another
  %another3 = load i8*, i8** %another
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_str, i32 0, i32 0), i8* %another3)
  %third = alloca i8*
  %hello4 = load i8*, i8** %hello
  %hi5 = load i8*, i8** %hi
  %hello6 = load i8*, i8** %hello
  %hi7 = load i8*, i8** %hi
  %hello8 = load i8*, i8** %hello
  %concat = call i8* (i8*, i8*, ...) bitcast (i8* (i8*, i8*)* @concat to i8* (i8*, i8*, ...)*)(i8* %hi7, i8* %hello8)
  store i8* %concat, i8** %third
  %third9 = load i8*, i8** %third
  %third10 = load i8*, i8** %third
  %printf11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_str, i32 0, i32 0), i8* %third10)
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
  %3 = alloca i8*, align 8
  %curr = alloca i8, align 1
  %i1 = alloca i32, align 4
  store i8* %str, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = icmp ne i8* %4, null
  br i1 %5, label %8, label %6

; <label>:6                                       ; preds = %0
  %7 = load i8*, i8** %2, align 8
  store i8* %7, i8** %1, align 8
  br label %108

; <label>:8                                       ; preds = %0
  store i32 0, i32* %i, align 4
  br label %9

; <label>:9                                       ; preds = %17, %8
  %10 = load i32, i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = load i8*, i8** %2, align 8
  %13 = getelementptr inbounds i8, i8* %12, i64 %11
  %14 = load i8, i8* %13, align 1
  %15 = sext i8 %14 to i32
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %20

; <label>:17                                      ; preds = %9
  %18 = load i32, i32* %i, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %i, align 4
  br label %9

; <label>:20                                      ; preds = %9
  %21 = load i32, i32* %i, align 4
  store i32 %21, i32* %length, align 4
  %22 = load i32, i32* %length, align 4
  %23 = zext i32 %22 to i64
  %24 = call i8* @llvm.stacksave()
  store i8* %24, i8** %3, align 8
  %25 = alloca i8, i64 %23, align 16
  store i32 0, i32* %i1, align 4
  br label %26

; <label>:26                                      ; preds = %100, %20
  %27 = load i32, i32* %i1, align 4
  %28 = load i32, i32* %length, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %103

; <label>:30                                      ; preds = %26
  %31 = load i32, i32* %i1, align 4
  %32 = sext i32 %31 to i64
  %33 = load i8*, i8** %2, align 8
  %34 = getelementptr inbounds i8, i8* %33, i64 %32
  %35 = load i8, i8* %34, align 1
  store i8 %35, i8* %curr, align 1
  %36 = load i8, i8* %curr, align 1
  %37 = sext i8 %36 to i32
  %38 = icmp eq i32 %37, 84
  br i1 %38, label %39, label %43

; <label>:39                                      ; preds = %30
  %40 = load i32, i32* %i1, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i8, i8* %25, i64 %41
  store i8 65, i8* %42, align 1
  br label %99

; <label>:43                                      ; preds = %30
  %44 = load i8, i8* %curr, align 1
  %45 = sext i8 %44 to i32
  %46 = icmp eq i32 %45, 67
  br i1 %46, label %51, label %47

; <label>:47                                      ; preds = %43
  %48 = load i8, i8* %curr, align 1
  %49 = sext i8 %48 to i32
  %50 = icmp eq i32 %49, 71
  br i1 %50, label %51, label %59

; <label>:51                                      ; preds = %47, %43
  %52 = load i8, i8* %curr, align 1
  %53 = sext i8 %52 to i32
  %54 = sub nsw i32 138, %53
  %55 = trunc i32 %54 to i8
  %56 = load i32, i32* %i1, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8, i8* %25, i64 %57
  store i8 %55, i8* %58, align 1
  br label %98

; <label>:59                                      ; preds = %47
  %60 = load i8, i8* %curr, align 1
  %61 = sext i8 %60 to i32
  %62 = icmp eq i32 %61, 116
  br i1 %62, label %63, label %67

; <label>:63                                      ; preds = %59
  %64 = load i32, i32* %i1, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i8, i8* %25, i64 %65
  store i8 65, i8* %66, align 1
  br label %97

; <label>:67                                      ; preds = %59
  %68 = load i8, i8* %curr, align 1
  %69 = sext i8 %68 to i32
  %70 = icmp eq i32 %69, 99
  br i1 %70, label %75, label %71

; <label>:71                                      ; preds = %67
  %72 = load i8, i8* %curr, align 1
  %73 = sext i8 %72 to i32
  %74 = icmp eq i32 %73, 103
  br i1 %74, label %75, label %83

; <label>:75                                      ; preds = %71, %67
  %76 = load i8, i8* %curr, align 1
  %77 = sext i8 %76 to i32
  %78 = sub nsw i32 170, %77
  %79 = trunc i32 %78 to i8
  %80 = load i32, i32* %i1, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i8, i8* %25, i64 %81
  store i8 %79, i8* %82, align 1
  br label %96

; <label>:83                                      ; preds = %71
  %84 = load i8, i8* %curr, align 1
  %85 = sext i8 %84 to i32
  %86 = icmp eq i32 %85, 65
  br i1 %86, label %91, label %87

; <label>:87                                      ; preds = %83
  %88 = load i8, i8* %curr, align 1
  %89 = sext i8 %88 to i32
  %90 = icmp eq i32 %89, 97
  br i1 %90, label %91, label %95

; <label>:91                                      ; preds = %87, %83
  %92 = load i32, i32* %i1, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i8, i8* %25, i64 %93
  store i8 85, i8* %94, align 1
  br label %95

; <label>:95                                      ; preds = %91, %87
  br label %96

; <label>:96                                      ; preds = %95, %75
  br label %97

; <label>:97                                      ; preds = %96, %63
  br label %98

; <label>:98                                      ; preds = %97, %51
  br label %99

; <label>:99                                      ; preds = %98, %39
  br label %100

; <label>:100                                     ; preds = %99
  %101 = load i32, i32* %i1, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, i32* %i1, align 4
  br label %26

; <label>:103                                     ; preds = %26
  %104 = load i32, i32* %length, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i8, i8* %25, i64 %105
  store i8 0, i8* %106, align 1
  store i8* %25, i8** %1, align 8
  %107 = load i8*, i8** %3, align 8
  call void @llvm.stackrestore(i8* %107)
  br label %108

; <label>:108                                     ; preds = %103, %6
  %109 = load i8*, i8** %1, align 8
  ret i8* %109
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #2

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #2

; Function Attrs: nounwind uwtable
define i8* @concat(i8* %input1, i8* %input2) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %length = alloca i32, align 4
  %3 = alloca i8*, align 8
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i8* %input1, i8** %1, align 8
  store i8* %input2, i8** %2, align 8
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %12, %0
  %5 = load i32, i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = load i8*, i8** %1, align 8
  %8 = getelementptr inbounds i8, i8* %7, i64 %6
  %9 = load i8, i8* %8, align 1
  %10 = sext i8 %9 to i32
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %15

; <label>:12                                      ; preds = %4
  %13 = load i32, i32* %i, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %4

; <label>:15                                      ; preds = %4
  store i32 0, i32* %j, align 4
  br label %16

; <label>:16                                      ; preds = %24, %15
  %17 = load i32, i32* %j, align 4
  %18 = sext i32 %17 to i64
  %19 = load i8*, i8** %2, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 %18
  %21 = load i8, i8* %20, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %27

; <label>:24                                      ; preds = %16
  %25 = load i32, i32* %j, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %j, align 4
  br label %16

; <label>:27                                      ; preds = %16
  %28 = load i32, i32* %i, align 4
  %29 = load i32, i32* %j, align 4
  %30 = add nsw i32 %28, %29
  store i32 %30, i32* %length, align 4
  %31 = load i32, i32* %length, align 4
  %32 = zext i32 %31 to i64
  %33 = call i8* @llvm.stacksave()
  store i8* %33, i8** %3, align 8
  %34 = alloca i8, i64 %32, align 16
  store i32 0, i32* %k, align 4
  br label %35

; <label>:35                                      ; preds = %48, %27
  %36 = load i32, i32* %k, align 4
  %37 = load i32, i32* %i, align 4
  %38 = icmp slt i32 %36, %37
  br i1 %38, label %39, label %51

; <label>:39                                      ; preds = %35
  %40 = load i32, i32* %k, align 4
  %41 = sext i32 %40 to i64
  %42 = load i8*, i8** %1, align 8
  %43 = getelementptr inbounds i8, i8* %42, i64 %41
  %44 = load i8, i8* %43, align 1
  %45 = load i32, i32* %k, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8* %34, i64 %46
  store i8 %44, i8* %47, align 1
  br label %48

; <label>:48                                      ; preds = %39
  %49 = load i32, i32* %k, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %k, align 4
  br label %35

; <label>:51                                      ; preds = %35
  store i32 0, i32* %l, align 4
  br label %52

; <label>:52                                      ; preds = %67, %51
  %53 = load i32, i32* %l, align 4
  %54 = load i32, i32* %i, align 4
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %56, label %70

; <label>:56                                      ; preds = %52
  %57 = load i32, i32* %l, align 4
  %58 = sext i32 %57 to i64
  %59 = load i8*, i8** %2, align 8
  %60 = getelementptr inbounds i8, i8* %59, i64 %58
  %61 = load i8, i8* %60, align 1
  %62 = load i32, i32* %i, align 4
  %63 = load i32, i32* %l, align 4
  %64 = add nsw i32 %62, %63
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i8, i8* %34, i64 %65
  store i8 %61, i8* %66, align 1
  br label %67

; <label>:67                                      ; preds = %56
  %68 = load i32, i32* %l, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %l, align 4
  br label %52

; <label>:70                                      ; preds = %52
  %71 = load i32, i32* %length, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i8, i8* %34, i64 %72
  store i8 0, i8* %73, align 1
  %74 = load i8*, i8** %3, align 8
  call void @llvm.stackrestore(i8* %74)
  ret i8* %34
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
