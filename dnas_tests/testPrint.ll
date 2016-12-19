; ModuleID = 'DNAs'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@fmt_int = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt_str = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@fmt_str.1 = private unnamed_addr constant [6 x i8] c"%.3f\0A\00"
@fmt_str.2 = private unnamed_addr constant [4 x i8] c"%c\0A\00"
@context = private unnamed_addr constant [8 x i8] c"A-T-G-C\00"
@context.3 = private unnamed_addr constant [8 x i8] c"A-T-G-C\00"
@context.4 = private unnamed_addr constant [6 x i8] c"hello\00"
@context.5 = private unnamed_addr constant [6 x i8] c"hello\00"
@context.6 = private unnamed_addr constant [5 x i8] c"atgc\00"
@context.7 = private unnamed_addr constant [5 x i8] c"atgc\00"
@context.8 = private unnamed_addr constant [5 x i8] c"gcgc\00"
@context.9 = private unnamed_addr constant [5 x i8] c"gcgc\00"
@.str = private unnamed_addr constant [16 x i8] c"Hello I'm in C\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"-\00", align 1

declare i32 @printf(i8*, ...)

declare double @db_exp(double, double, ...)

define i32 @main() {
entry:
  %oriana = alloca i8*
  %formatPep = call i8* (i8*, ...) bitcast (i8* (i8*)* @formatPep to i8* (i8*, ...)*)(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @context, i32 0, i32 0))
  %formatPep1 = call i8* (i8*, ...) bitcast (i8* (i8*)* @formatPep to i8* (i8*, ...)*)(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @context.3, i32 0, i32 0))
  store i8* %formatPep, i8** %oriana
  %hi = alloca i32
  store i32 42, i32* %hi
  %hello = alloca double
  store double 4.200000e+01, double* %hello
  %isTrue = alloca i1
  store i1 true, i1* %isTrue
  %sample = alloca i8*
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @context.4, i32 0, i32 0), i8** %sample
  %samp = alloca i8
  %getChar = call i8 (i8**, i32, ...) bitcast (i8 (i8**, i32)* @getChar to i8 (i8**, i32, ...)*)(i8** %sample, i32 0)
  %getChar2 = call i8 (i8**, i32, ...) bitcast (i8 (i8**, i32)* @getChar to i8 (i8**, i32, ...)*)(i8** %sample, i32 0)
  store i8 %getChar, i8* %samp
  %min = alloca i8*
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @context.6, i32 0, i32 0), i8** %min
  %stan = alloca i8*
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @context.8, i32 0, i32 0), i8** %stan
  %hi3 = load i32, i32* %hi
  %hi4 = load i32, i32* %hi
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_int, i32 0, i32 0), i32 %hi4)
  %isTrue5 = load i1, i1* %isTrue
  %isTrue6 = load i1, i1* %isTrue
  %print_tf = call i32 (i1, ...) bitcast (i32 (i1)* @print_tf to i32 (i1, ...)*)(i1 %isTrue6)
  %sample7 = load i8*, i8** %sample
  %sample8 = load i8*, i8** %sample
  %printf9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* %sample8)
  %samp10 = load i8, i8* %samp
  %samp11 = load i8, i8* %samp
  %printf12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str.2, i32 0, i32 0), i8 %samp11)
  %min13 = load i8*, i8** %min
  %min14 = load i8*, i8** %min
  %printf15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* %min14)
  %stan16 = load i8*, i8** %stan
  %stan17 = load i8*, i8** %stan
  %printf18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt_str, i32 0, i32 0), i8* %stan17)
  %oriana19 = load i8*, i8** %oriana
  %oriana20 = load i8*, i8** %oriana
  %oriana21 = load i8*, i8** %oriana
  %printPep = call i32 (i8*, ...) bitcast (i32 (i8*)* @printPep to i32 (i8*, ...)*)(i8* %oriana21)
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
  br label %116

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
  %25 = alloca i8*, i64 %23, align 16
  store i32 0, i32* %i1, align 4
  br label %26

; <label>:26                                      ; preds = %107, %20
  %27 = load i32, i32* %i1, align 4
  %28 = load i32, i32* %length, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %110

; <label>:30                                      ; preds = %26
  %31 = load i32, i32* %i1, align 4
  %32 = sext i32 %31 to i64
  %33 = load i8*, i8** %2, align 8
  %34 = getelementptr inbounds i8, i8* %33, i64 %32
  %35 = load i8, i8* %34, align 1
  store i8 %35, i8* %curr, align 1
  %36 = load i8, i8* %curr, align 1
  %37 = sext i8 %36 to i32
  %38 = icmp eq i32 %37, 65
  br i1 %38, label %43, label %39

; <label>:39                                      ; preds = %30
  %40 = load i8, i8* %curr, align 1
  %41 = sext i8 %40 to i32
  %42 = icmp eq i32 %41, 84
  br i1 %42, label %43, label %52

; <label>:43                                      ; preds = %39, %30
  %44 = load i8, i8* %curr, align 1
  %45 = sext i8 %44 to i32
  %46 = sub nsw i32 149, %45
  %47 = sext i32 %46 to i64
  %48 = inttoptr i64 %47 to i8*
  %49 = load i32, i32* %i1, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8*, i8** %25, i64 %50
  store i8* %48, i8** %51, align 8
  br label %106

; <label>:52                                      ; preds = %39
  %53 = load i8, i8* %curr, align 1
  %54 = sext i8 %53 to i32
  %55 = icmp eq i32 %54, 67
  br i1 %55, label %60, label %56

; <label>:56                                      ; preds = %52
  %57 = load i8, i8* %curr, align 1
  %58 = sext i8 %57 to i32
  %59 = icmp eq i32 %58, 71
  br i1 %59, label %60, label %69

; <label>:60                                      ; preds = %56, %52
  %61 = load i8, i8* %curr, align 1
  %62 = sext i8 %61 to i32
  %63 = sub nsw i32 138, %62
  %64 = sext i32 %63 to i64
  %65 = inttoptr i64 %64 to i8*
  %66 = load i32, i32* %i1, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i8*, i8** %25, i64 %67
  store i8* %65, i8** %68, align 8
  br label %105

; <label>:69                                      ; preds = %56
  %70 = load i8, i8* %curr, align 1
  %71 = sext i8 %70 to i32
  %72 = icmp eq i32 %71, 97
  br i1 %72, label %77, label %73

; <label>:73                                      ; preds = %69
  %74 = load i8, i8* %curr, align 1
  %75 = sext i8 %74 to i32
  %76 = icmp eq i32 %75, 116
  br i1 %76, label %77, label %86

; <label>:77                                      ; preds = %73, %69
  %78 = load i8, i8* %curr, align 1
  %79 = sext i8 %78 to i32
  %80 = sub nsw i32 181, %79
  %81 = sext i32 %80 to i64
  %82 = inttoptr i64 %81 to i8*
  %83 = load i32, i32* %i1, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i8*, i8** %25, i64 %84
  store i8* %82, i8** %85, align 8
  br label %104

; <label>:86                                      ; preds = %73
  %87 = load i8, i8* %curr, align 1
  %88 = sext i8 %87 to i32
  %89 = icmp eq i32 %88, 99
  br i1 %89, label %94, label %90

; <label>:90                                      ; preds = %86
  %91 = load i8, i8* %curr, align 1
  %92 = sext i8 %91 to i32
  %93 = icmp eq i32 %92, 103
  br i1 %93, label %94, label %103

; <label>:94                                      ; preds = %90, %86
  %95 = load i8, i8* %curr, align 1
  %96 = sext i8 %95 to i32
  %97 = sub nsw i32 170, %96
  %98 = sext i32 %97 to i64
  %99 = inttoptr i64 %98 to i8*
  %100 = load i32, i32* %i1, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i8*, i8** %25, i64 %101
  store i8* %99, i8** %102, align 8
  br label %103

; <label>:103                                     ; preds = %94, %90
  br label %104

; <label>:104                                     ; preds = %103, %77
  br label %105

; <label>:105                                     ; preds = %104, %60
  br label %106

; <label>:106                                     ; preds = %105, %43
  br label %107

; <label>:107                                     ; preds = %106
  %108 = load i32, i32* %i1, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* %i1, align 4
  br label %26

; <label>:110                                     ; preds = %26
  %111 = load i32, i32* %length, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i8*, i8** %25, i64 %112
  store i8* null, i8** %113, align 8
  %114 = bitcast i8** %25 to i8*
  store i8* %114, i8** %1, align 8
  %115 = load i8*, i8** %3, align 8
  call void @llvm.stackrestore(i8* %115)
  br label %116

; <label>:116                                     ; preds = %110, %6
  %117 = load i8*, i8** %1, align 8
  ret i8* %117
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #1

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #1

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

; Function Attrs: nounwind uwtable
define i32 @strlength(i8* %input) #0 {
  %1 = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %input, i8** %1, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %10, %0
  %3 = load i32, i32* %i, align 4
  %4 = sext i32 %3 to i64
  %5 = load i8*, i8** %1, align 8
  %6 = getelementptr inbounds i8, i8* %5, i64 %4
  %7 = load i8, i8* %6, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %13

; <label>:10                                      ; preds = %2
  %11 = load i32, i32* %i, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %i, align 4
  br label %2

; <label>:13                                      ; preds = %2
  %14 = load i32, i32* %i, align 4
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define i8* @readFASTAFile(i8* %string) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %file = alloca %struct._IO_FILE*, align 8
  %code = alloca [10000 x i8], align 16
  %n = alloca i64, align 8
  %c = alloca i32, align 4
  %start = alloca i32, align 4
  store i8* %string, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = call %struct._IO_FILE* @fopen(i8* %3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %4, %struct._IO_FILE** %file, align 8
  store i64 0, i64* %n, align 8
  store i32 -1, i32* %start, align 4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %file, align 8
  %6 = icmp eq %struct._IO_FILE* %5, null
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i8* null, i8** %1, align 8
  br label %73

; <label>:8                                       ; preds = %0
  br label %9

; <label>:9                                       ; preds = %68, %18, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %file, align 8
  %11 = call i32 @fgetc(%struct._IO_FILE* %10)
  store i32 %11, i32* %c, align 4
  %12 = icmp ne i32 %11, -1
  br i1 %12, label %13, label %69

; <label>:13                                      ; preds = %9
  %14 = load i32, i32* %c, align 4
  %15 = trunc i32 %14 to i8
  %16 = sext i8 %15 to i32
  %17 = icmp eq i32 %16, 10
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %13
  store i32 1, i32* %start, align 4
  br label %9

; <label>:19                                      ; preds = %13
  %20 = load i32, i32* %start, align 4
  %21 = icmp sge i32 %20, 0
  br i1 %21, label %22, label %68

; <label>:22                                      ; preds = %19
  %23 = load i32, i32* %c, align 4
  %24 = trunc i32 %23 to i8
  %25 = sext i8 %24 to i32
  %26 = icmp eq i32 %25, 97
  br i1 %26, label %62, label %27

; <label>:27                                      ; preds = %22
  %28 = load i32, i32* %c, align 4
  %29 = trunc i32 %28 to i8
  %30 = sext i8 %29 to i32
  %31 = icmp eq i32 %30, 116
  br i1 %31, label %62, label %32

; <label>:32                                      ; preds = %27
  %33 = load i32, i32* %c, align 4
  %34 = trunc i32 %33 to i8
  %35 = sext i8 %34 to i32
  %36 = icmp eq i32 %35, 103
  br i1 %36, label %62, label %37

; <label>:37                                      ; preds = %32
  %38 = load i32, i32* %c, align 4
  %39 = trunc i32 %38 to i8
  %40 = sext i8 %39 to i32
  %41 = icmp eq i32 %40, 99
  br i1 %41, label %62, label %42

; <label>:42                                      ; preds = %37
  %43 = load i32, i32* %c, align 4
  %44 = trunc i32 %43 to i8
  %45 = sext i8 %44 to i32
  %46 = icmp eq i32 %45, 65
  br i1 %46, label %62, label %47

; <label>:47                                      ; preds = %42
  %48 = load i32, i32* %c, align 4
  %49 = trunc i32 %48 to i8
  %50 = sext i8 %49 to i32
  %51 = icmp eq i32 %50, 84
  br i1 %51, label %62, label %52

; <label>:52                                      ; preds = %47
  %53 = load i32, i32* %c, align 4
  %54 = trunc i32 %53 to i8
  %55 = sext i8 %54 to i32
  %56 = icmp eq i32 %55, 71
  br i1 %56, label %62, label %57

; <label>:57                                      ; preds = %52
  %58 = load i32, i32* %c, align 4
  %59 = trunc i32 %58 to i8
  %60 = sext i8 %59 to i32
  %61 = icmp eq i32 %60, 67
  br i1 %61, label %62, label %68

; <label>:62                                      ; preds = %57, %52, %47, %42, %37, %32, %27, %22
  %63 = load i32, i32* %c, align 4
  %64 = trunc i32 %63 to i8
  %65 = load i64, i64* %n, align 8
  %66 = add i64 %65, 1
  store i64 %66, i64* %n, align 8
  %67 = getelementptr inbounds [10000 x i8], [10000 x i8]* %code, i64 0, i64 %65
  store i8 %64, i8* %67, align 1
  br label %68

; <label>:68                                      ; preds = %62, %57, %19
  br label %9

; <label>:69                                      ; preds = %9
  %70 = load i64, i64* %n, align 8
  %71 = getelementptr inbounds [10000 x i8], [10000 x i8]* %code, i64 0, i64 %70
  store i8 0, i8* %71, align 1
  %72 = getelementptr inbounds [10000 x i8], [10000 x i8]* %code, i32 0, i32 0
  store i8* %72, i8** %1, align 8
  br label %73

; <label>:73                                      ; preds = %69, %7
  %74 = load i8*, i8** %1, align 8
  ret i8* %74
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i32 @fgetc(%struct._IO_FILE*) #2

; Function Attrs: nounwind uwtable
define i8* @readFile(i8* %string) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %file = alloca %struct._IO_FILE*, align 8
  %code = alloca [10000 x i8], align 16
  %n = alloca i64, align 8
  %c = alloca i32, align 4
  %start = alloca i32, align 4
  store i8* %string, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = call %struct._IO_FILE* @fopen(i8* %3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %4, %struct._IO_FILE** %file, align 8
  store i64 0, i64* %n, align 8
  store i32 -1, i32* %start, align 4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %file, align 8
  %6 = icmp eq %struct._IO_FILE* %5, null
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i8* null, i8** %1, align 8
  br label %23

; <label>:8                                       ; preds = %0
  br label %9

; <label>:9                                       ; preds = %13, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %file, align 8
  %11 = call i32 @fgetc(%struct._IO_FILE* %10)
  store i32 %11, i32* %c, align 4
  %12 = icmp ne i32 %11, -1
  br i1 %12, label %13, label %19

; <label>:13                                      ; preds = %9
  %14 = load i32, i32* %c, align 4
  %15 = trunc i32 %14 to i8
  %16 = load i64, i64* %n, align 8
  %17 = add i64 %16, 1
  store i64 %17, i64* %n, align 8
  %18 = getelementptr inbounds [10000 x i8], [10000 x i8]* %code, i64 0, i64 %16
  store i8 %15, i8* %18, align 1
  br label %9

; <label>:19                                      ; preds = %9
  %20 = load i64, i64* %n, align 8
  %21 = getelementptr inbounds [10000 x i8], [10000 x i8]* %code, i64 0, i64 %20
  store i8 0, i8* %21, align 1
  %22 = getelementptr inbounds [10000 x i8], [10000 x i8]* %code, i32 0, i32 0
  store i8* %22, i8** %1, align 8
  br label %23

; <label>:23                                      ; preds = %19, %7
  %24 = load i8*, i8** %1, align 8
  ret i8* %24
}

; Function Attrs: nounwind uwtable
define i32 @mod(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = srem i32 %3, %4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @exp_ii(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = sitofp i32 %3 to double
  %5 = load i32, i32* %2, align 4
  %6 = sitofp i32 %5 to double
  %7 = call double @pow(double %4, double %6) #1
  %8 = fptosi double %7 to i32
  ret i32 %8
}

; Function Attrs: nounwind
declare double @pow(double, double) #3

; Function Attrs: nounwind uwtable
define double @exp_di(double %a, i32 %b) #0 {
  %1 = alloca double, align 8
  %2 = alloca i32, align 4
  store double %a, double* %1, align 8
  store i32 %b, i32* %2, align 4
  %3 = load double, double* %1, align 8
  %4 = load i32, i32* %2, align 4
  %5 = sitofp i32 %4 to double
  %6 = call double @pow(double %3, double %5) #1
  ret double %6
}

; Function Attrs: nounwind uwtable
define double @exp_id(i32 %a, double %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  store i32 %a, i32* %1, align 4
  store double %b, double* %2, align 8
  %3 = load i32, i32* %1, align 4
  %4 = sitofp i32 %3 to double
  %5 = load double, double* %2, align 8
  %6 = call double @pow(double %4, double %5) #1
  ret double %6
}

; Function Attrs: nounwind uwtable
define double @exp_dd(double %a, double %b) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  store double %a, double* %1, align 8
  store double %b, double* %2, align 8
  %3 = load double, double* %1, align 8
  %4 = load double, double* %2, align 8
  %5 = call double @pow(double %3, double %4) #1
  ret double %5
}

; Function Attrs: nounwind uwtable
define i32 @double2int(double %d) #0 {
  %1 = alloca double, align 8
  store double %d, double* %1, align 8
  %2 = load double, double* %1, align 8
  %3 = fptosi double %2 to i32
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define double @int2double(i32 %i) #0 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = sitofp i32 %2 to double
  ret double %3
}

; Function Attrs: nounwind uwtable
define i32 @print_tf(i1 zeroext %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  %3 = zext i1 %b to i8
  store i8 %3, i8* %2, align 1
  %4 = load i8, i8* %2, align 1
  %5 = trunc i8 %4 to i1
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0))
  store i32 %7, i32* %1, align 4
  br label %10

; <label>:8                                       ; preds = %0
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0))
  store i32 %9, i32* %1, align 4
  br label %10

; <label>:10                                      ; preds = %8, %6
  %11 = load i32, i32* %1, align 4
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define signext i8 @getChar(i8** %input, i32 %index) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i8**, align 8
  %3 = alloca i32, align 4
  %i = alloca i32, align 4
  %temp = alloca i8, align 1
  store i8** %input, i8*** %2, align 8
  store i32 %index, i32* %3, align 4
  %4 = load i8**, i8*** %2, align 8
  %5 = icmp eq i8** %4, null
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  store i8 -1, i8* %1, align 1
  br label %46

; <label>:7                                       ; preds = %0
  %8 = load i8**, i8*** %2, align 8
  %9 = getelementptr inbounds i8*, i8** %8, i64 0
  %10 = load i8*, i8** %9, align 8
  %11 = getelementptr inbounds i8, i8* %10, i64 0
  %12 = load i8, i8* %11, align 1
  %13 = sext i8 %12 to i32
  %14 = sext i32 %13 to i64
  %15 = inttoptr i64 %14 to i8*
  %16 = icmp eq i8* %15, null
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %7
  store i8 -1, i8* %1, align 1
  br label %46

; <label>:18                                      ; preds = %7
  store i32 0, i32* %i, align 4
  br label %19

; <label>:19                                      ; preds = %29, %18
  %20 = load i32, i32* %i, align 4
  %21 = sext i32 %20 to i64
  %22 = load i8**, i8*** %2, align 8
  %23 = getelementptr inbounds i8*, i8** %22, i64 0
  %24 = load i8*, i8** %23, align 8
  %25 = getelementptr inbounds i8, i8* %24, i64 %21
  %26 = load i8, i8* %25, align 1
  %27 = sext i8 %26 to i32
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %32

; <label>:29                                      ; preds = %19
  %30 = load i32, i32* %i, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %i, align 4
  br label %19

; <label>:32                                      ; preds = %19
  %33 = load i32, i32* %3, align 4
  %34 = load i32, i32* %i, align 4
  %35 = icmp sge i32 %33, %34
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %32
  store i8 -1, i8* %1, align 1
  br label %46

; <label>:37                                      ; preds = %32
  %38 = load i32, i32* %3, align 4
  %39 = sext i32 %38 to i64
  %40 = load i8**, i8*** %2, align 8
  %41 = getelementptr inbounds i8*, i8** %40, i64 0
  %42 = load i8*, i8** %41, align 8
  %43 = getelementptr inbounds i8, i8* %42, i64 %39
  %44 = load i8, i8* %43, align 1
  store i8 %44, i8* %temp, align 1
  %45 = load i8, i8* %temp, align 1
  store i8 %45, i8* %1, align 1
  br label %46

; <label>:46                                      ; preds = %37, %36, %17, %6
  %47 = load i8, i8* %1, align 1
  ret i8 %47
}

; Function Attrs: nounwind uwtable
define i8* @formatPep(i8* %input) #0 {
  %1 = alloca i8*, align 8
  %i = alloca i32, align 4
  %2 = alloca i8*, align 8
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i8* %input, i8** %1, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %11, %0
  %4 = load i32, i32* %i, align 4
  %5 = sext i32 %4 to i64
  %6 = load i8*, i8** %1, align 8
  %7 = getelementptr inbounds i8, i8* %6, i64 %5
  %8 = load i8, i8* %7, align 1
  %9 = sext i8 %8 to i32
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %14

; <label>:11                                      ; preds = %3
  %12 = load i32, i32* %i, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %i, align 4
  br label %3

; <label>:14                                      ; preds = %3
  %15 = load i32, i32* %i, align 4
  %16 = zext i32 %15 to i64
  %17 = call i8* @llvm.stacksave()
  store i8* %17, i8** %2, align 8
  %18 = alloca i8, i64 %16, align 16
  store i32 0, i32* %j, align 4
  store i32 0, i32* %k, align 4
  br label %19

; <label>:19                                      ; preds = %43, %14
  %20 = load i32, i32* %k, align 4
  %21 = load i32, i32* %i, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %46

; <label>:23                                      ; preds = %19
  %24 = load i32, i32* %k, align 4
  %25 = sext i32 %24 to i64
  %26 = load i8*, i8** %1, align 8
  %27 = getelementptr inbounds i8, i8* %26, i64 %25
  %28 = load i8, i8* %27, align 1
  %29 = sext i8 %28 to i32
  %30 = icmp ne i32 %29, 45
  br i1 %30, label %31, label %42

; <label>:31                                      ; preds = %23
  %32 = load i32, i32* %k, align 4
  %33 = sext i32 %32 to i64
  %34 = load i8*, i8** %1, align 8
  %35 = getelementptr inbounds i8, i8* %34, i64 %33
  %36 = load i8, i8* %35, align 1
  %37 = load i32, i32* %j, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8* %18, i64 %38
  store i8 %36, i8* %39, align 1
  %40 = load i32, i32* %j, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %j, align 4
  br label %42

; <label>:42                                      ; preds = %31, %23
  br label %43

; <label>:43                                      ; preds = %42
  %44 = load i32, i32* %k, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, i32* %k, align 4
  br label %19

; <label>:46                                      ; preds = %19
  br label %47

; <label>:47                                      ; preds = %51, %46
  %48 = load i32, i32* %j, align 4
  %49 = load i32, i32* %i, align 4
  %50 = icmp sle i32 %48, %49
  br i1 %50, label %51, label %57

; <label>:51                                      ; preds = %47
  %52 = load i32, i32* %j, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8* %18, i64 %53
  store i8 0, i8* %54, align 1
  %55 = load i32, i32* %j, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %j, align 4
  br label %47

; <label>:57                                      ; preds = %47
  %58 = load i8*, i8** %2, align 8
  call void @llvm.stackrestore(i8* %58)
  ret i8* %18
}

; Function Attrs: nounwind uwtable
define i32 @printPep(i8* %input) #0 {
  %1 = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %temp = alloca i8, align 1
  store i8* %input, i8** %1, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %10, %0
  %3 = load i32, i32* %i, align 4
  %4 = sext i32 %3 to i64
  %5 = load i8*, i8** %1, align 8
  %6 = getelementptr inbounds i8, i8* %5, i64 %4
  %7 = load i8, i8* %6, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %13

; <label>:10                                      ; preds = %2
  %11 = load i32, i32* %i, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %i, align 4
  br label %2

; <label>:13                                      ; preds = %2
  store i32 0, i32* %j, align 4
  br label %14

; <label>:14                                      ; preds = %29, %13
  %15 = load i32, i32* %j, align 4
  %16 = load i32, i32* %i, align 4
  %17 = sub nsw i32 %16, 1
  %18 = icmp slt i32 %15, %17
  br i1 %18, label %19, label %32

; <label>:19                                      ; preds = %14
  %20 = load i32, i32* %j, align 4
  %21 = sext i32 %20 to i64
  %22 = load i8*, i8** %1, align 8
  %23 = getelementptr inbounds i8, i8* %22, i64 %21
  %24 = load i8, i8* %23, align 1
  store i8 %24, i8* %temp, align 1
  %25 = load i8, i8* %temp, align 1
  %26 = sext i8 %25 to i32
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32 %26)
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0))
  br label %29

; <label>:29                                      ; preds = %19
  %30 = load i32, i32* %j, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %j, align 4
  br label %14

; <label>:32                                      ; preds = %14
  %33 = load i32, i32* %i, align 4
  %34 = sub nsw i32 %33, 1
  %35 = sext i32 %34 to i64
  %36 = load i8*, i8** %1, align 8
  %37 = getelementptr inbounds i8, i8* %36, i64 %35
  %38 = load i8, i8* %37, align 1
  %39 = sext i8 %38 to i32
  %40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32 %39)
  ret i32 1
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
