; ModuleID = 'DNAs'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@fmt_int = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt_str = private unnamed_addr constant [3 x i8] c"%s\00"
@fmt_str.1 = private unnamed_addr constant [5 x i8] c"%.3f\00"
@fmt_str.2 = private unnamed_addr constant [3 x i8] c"%c\00"
@context = private unnamed_addr constant [21 x i8] c"./Demo/bonegla.FASTA\00"
@context.3 = private unnamed_addr constant [10 x i8] c"ATGCCCTTA\00"
@context.4 = private unnamed_addr constant [13 x i8] c"GUGUUUGUAUAA\00"
@codon = global [64 x i8] c"KDKDTTTTRSRSIIMIQHQHPPPPRRRRLLLLEDEDAAAAGGGGVVVVBYBYSSSSBCWCLFLF", align 16
@.str = private unnamed_addr constant [16 x i8] c"Hello I'm in C\0A\00", align 1
<<<<<<< HEAD:dnas_tests/demo.ll
@.str.1 = private unnamed_addr constant [35 x i8] c"No possible translation available.\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"-\00", align 1
=======
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@translate.start = private unnamed_addr constant [3 x i32] [i32 -1, i32 -1, i32 -1], align 4
@translate.ending = private unnamed_addr constant [3 x i32] [i32 -1, i32 -1, i32 -1], align 4
@.str.2 = private unnamed_addr constant [35 x i8] c"No possible translation available.\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%c\0A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"-\00", align 1
>>>>>>> 74281514c0d5373961f1dfe626450df5ecc89383:dnas_testsOld/demo.ll

declare i32 @printf(i8*, ...)

declare double @db_exp(double, double, ...)

define i32 @main() {
entry:
  %d1 = alloca i8*
  %readFASTAFile = call i8* (i8*, ...) bitcast (i8* (i8*)* @readFASTAFile to i8* (i8*, ...)*)(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @context, i32 0, i32 0))
  store i8* %readFASTAFile, i8** %d1
  %d2 = alloca i8*
  store i8* getelementptr inbounds ([10 x i8], [10 x i8]* @context.3, i32 0, i32 0), i8** %d2
  %r1 = alloca i8*
  %d21 = load i8*, i8** %d2
  %d22 = load i8*, i8** %d2
  %transcribe = call i8* (i8*, ...) bitcast (i8* (i8*)* @transcribe to i8* (i8*, ...)*)(i8* %d22)
  store i8* %transcribe, i8** %r1
  %d23 = load i8*, i8** %d2
  %d24 = load i8*, i8** %d2
  %transcribe5 = call i8* (i8*, ...) bitcast (i8* (i8*)* @transcribe to i8* (i8*, ...)*)(i8* %d24)
  %d26 = load i8*, i8** %d2
  %d27 = load i8*, i8** %d2
  %transcribe8 = call i8* (i8*, ...) bitcast (i8* (i8*)* @transcribe to i8* (i8*, ...)*)(i8* %d27)
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_str, i32 0, i32 0), i8* %transcribe8)
  %r2 = alloca i8*
  store i8* getelementptr inbounds ([13 x i8], [13 x i8]* @context.4, i32 0, i32 0), i8** %r2
  %p2 = alloca i8*
  %r29 = load i8*, i8** %r2
  %r210 = load i8*, i8** %r2
  %translate = call i8* (i8*, ...) bitcast (i8* (i8*)* @translate to i8* (i8*, ...)*)(i8* %r210)
  store i8* %translate, i8** %p2
  %printf11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_str.2, i32 0, i32 0), i8 10)
  %r212 = load i8*, i8** %r2
  %r213 = load i8*, i8** %r2
  %printf14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_str, i32 0, i32 0), i8* %r213)
  %printf15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_str.2, i32 0, i32 0), i8 10)
<<<<<<< HEAD:dnas_tests/demo.ll
  %r216 = load i8*, i8** %r2
  %r217 = load i8*, i8** %r2
  %translate18 = call i8* (i8*, ...) bitcast (i8* (i8*)* @translate to i8* (i8*, ...)*)(i8* %r217)
  %r219 = load i8*, i8** %r2
  %r220 = load i8*, i8** %r2
  %translate21 = call i8* (i8*, ...) bitcast (i8* (i8*)* @translate to i8* (i8*, ...)*)(i8* %r220)
  %printf22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_str, i32 0, i32 0), i8* %translate21)
  %p223 = load i8*, i8** %p2
  %p224 = load i8*, i8** %p2
  %printf25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_str, i32 0, i32 0), i8* %p224)
=======
  %p216 = load i8*, i8** %p2
  %p217 = load i8*, i8** %p2
  %printf18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_str, i32 0, i32 0), i8* %p217)
>>>>>>> 74281514c0d5373961f1dfe626450df5ecc89383:dnas_testsOld/demo.ll
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
  br label %111

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

; <label>:26                                      ; preds = %103, %20
  %27 = load i32, i32* %i1, align 4
  %28 = load i32, i32* %length, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %106

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
  br i1 %42, label %43, label %51

; <label>:43                                      ; preds = %39, %30
  %44 = load i8, i8* %curr, align 1
  %45 = sext i8 %44 to i32
  %46 = sub nsw i32 149, %45
  %47 = trunc i32 %46 to i8
  %48 = load i32, i32* %i1, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i8, i8* %25, i64 %49
  store i8 %47, i8* %50, align 1
  br label %102

; <label>:51                                      ; preds = %39
  %52 = load i8, i8* %curr, align 1
  %53 = sext i8 %52 to i32
  %54 = icmp eq i32 %53, 67
  br i1 %54, label %59, label %55

; <label>:55                                      ; preds = %51
  %56 = load i8, i8* %curr, align 1
  %57 = sext i8 %56 to i32
  %58 = icmp eq i32 %57, 71
  br i1 %58, label %59, label %67

; <label>:59                                      ; preds = %55, %51
  %60 = load i8, i8* %curr, align 1
  %61 = sext i8 %60 to i32
  %62 = sub nsw i32 138, %61
  %63 = trunc i32 %62 to i8
  %64 = load i32, i32* %i1, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i8, i8* %25, i64 %65
  store i8 %63, i8* %66, align 1
  br label %101

; <label>:67                                      ; preds = %55
  %68 = load i8, i8* %curr, align 1
  %69 = sext i8 %68 to i32
  %70 = icmp eq i32 %69, 97
  br i1 %70, label %75, label %71

; <label>:71                                      ; preds = %67
  %72 = load i8, i8* %curr, align 1
  %73 = sext i8 %72 to i32
  %74 = icmp eq i32 %73, 116
  br i1 %74, label %75, label %83

; <label>:75                                      ; preds = %71, %67
  %76 = load i8, i8* %curr, align 1
  %77 = sext i8 %76 to i32
  %78 = sub nsw i32 181, %77
  %79 = trunc i32 %78 to i8
  %80 = load i32, i32* %i1, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i8, i8* %25, i64 %81
  store i8 %79, i8* %82, align 1
  br label %100

; <label>:83                                      ; preds = %71
  %84 = load i8, i8* %curr, align 1
  %85 = sext i8 %84 to i32
  %86 = icmp eq i32 %85, 99
  br i1 %86, label %91, label %87

; <label>:87                                      ; preds = %83
  %88 = load i8, i8* %curr, align 1
  %89 = sext i8 %88 to i32
  %90 = icmp eq i32 %89, 103
  br i1 %90, label %91, label %99

; <label>:91                                      ; preds = %87, %83
  %92 = load i8, i8* %curr, align 1
  %93 = sext i8 %92 to i32
  %94 = sub nsw i32 170, %93
  %95 = trunc i32 %94 to i8
  %96 = load i32, i32* %i1, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i8, i8* %25, i64 %97
  store i8 %95, i8* %98, align 1
  br label %99

; <label>:99                                      ; preds = %91, %87
  br label %100

; <label>:100                                     ; preds = %99, %75
  br label %101

; <label>:101                                     ; preds = %100, %59
  br label %102

; <label>:102                                     ; preds = %101, %43
  br label %103

; <label>:103                                     ; preds = %102
  %104 = load i32, i32* %i1, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %i1, align 4
  br label %26

; <label>:106                                     ; preds = %26
  %107 = load i32, i32* %length, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i8, i8* %25, i64 %108
  store i8 0, i8* %109, align 1
  store i8* %25, i8** %1, align 8
  %110 = load i8*, i8** %3, align 8
  call void @llvm.stackrestore(i8* %110)
  br label %111

; <label>:111                                     ; preds = %106, %6
  %112 = load i8*, i8** %1, align 8
  ret i8* %112
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
  br label %110

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
  %107 = load i32, i32* %length, align 4
  %108 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %107)
  store i8* %25, i8** %1, align 8
  %109 = load i8*, i8** %3, align 8
  call void @llvm.stackrestore(i8* %109)
  br label %110

; <label>:110                                     ; preds = %103, %6
  %111 = load i8*, i8** %1, align 8
  ret i8* %111
}

; Function Attrs: nounwind uwtable
define i32 @char_num(i8 signext %a) #0 {
  %1 = alloca i8, align 1
  %ret = alloca i32, align 4
  store i8 %a, i8* %1, align 1
  store i32 0, i32* %ret, align 4
  %2 = load i8, i8* %1, align 1
  %3 = sext i8 %2 to i32
  %4 = icmp eq i32 %3, 65
  br i1 %4, label %9, label %5

; <label>:5                                       ; preds = %0
  %6 = load i8, i8* %1, align 1
  %7 = sext i8 %6 to i32
  %8 = icmp eq i32 %7, 97
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %5, %0
  store i32 0, i32* %ret, align 4
  br label %40

; <label>:10                                      ; preds = %5
  %11 = load i8, i8* %1, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, 67
  br i1 %13, label %18, label %14

; <label>:14                                      ; preds = %10
  %15 = load i8, i8* %1, align 1
  %16 = sext i8 %15 to i32
  %17 = icmp eq i32 %16, 99
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %14, %10
  store i32 1, i32* %ret, align 4
  br label %39

; <label>:19                                      ; preds = %14
  %20 = load i8, i8* %1, align 1
  %21 = sext i8 %20 to i32
  %22 = icmp eq i32 %21, 71
  br i1 %22, label %27, label %23

; <label>:23                                      ; preds = %19
  %24 = load i8, i8* %1, align 1
  %25 = sext i8 %24 to i32
  %26 = icmp eq i32 %25, 103
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %23, %19
  store i32 2, i32* %ret, align 4
  br label %38

; <label>:28                                      ; preds = %23
  %29 = load i8, i8* %1, align 1
  %30 = sext i8 %29 to i32
  %31 = icmp eq i32 %30, 85
  br i1 %31, label %36, label %32

; <label>:32                                      ; preds = %28
  %33 = load i8, i8* %1, align 1
  %34 = sext i8 %33 to i32
  %35 = icmp eq i32 %34, 117
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %32, %28
  store i32 3, i32* %ret, align 4
  br label %37

; <label>:37                                      ; preds = %36, %32
  br label %38

; <label>:38                                      ; preds = %37, %27
  br label %39

; <label>:39                                      ; preds = %38, %18
  br label %40

; <label>:40                                      ; preds = %39, %9
  %41 = load i32, i32* %ret, align 4
  ret i32 %41
}

; Function Attrs: nounwind uwtable
define i32 @codon_number(i8 signext %a, i8 signext %b, i8 signext %c) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  store i8 %a, i8* %1, align 1
  store i8 %b, i8* %2, align 1
  store i8 %c, i8* %3, align 1
  %4 = load i8, i8* %1, align 1
  %5 = call i32 @char_num(i8 signext %4)
  %6 = mul nsw i32 %5, 16
  %7 = load i8, i8* %2, align 1
  %8 = call i32 @char_num(i8 signext %7)
  %9 = mul nsw i32 %8, 4
  %10 = add nsw i32 %6, %9
  %11 = load i8, i8* %3, align 1
  %12 = call i32 @char_num(i8 signext %11)
  %13 = add nsw i32 %10, %12
  ret i32 %13
}

; Function Attrs: nounwind uwtable
define i8* @translate(i8* %str) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %i = alloca i32, align 4
  %length = alloca i32, align 4
  %start = alloca [3 x i32], align 4
  %ending = alloca [3 x i32], align 4
  %temp = alloca i32, align 4
  %retdef = alloca i8*, align 8
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  %ret_size = alloca i32, align 4
  %3 = alloca i8*, align 8
  %index = alloca i32, align 4
  %i1 = alloca i32, align 4
  %length2 = alloca i32, align 4
  %curr = alloca i32, align 4
  %i2 = alloca i32, align 4
  store i8* %str, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = icmp ne i8* %4, null
  br i1 %5, label %8, label %6

; <label>:6                                       ; preds = %0
  %7 = load i8*, i8** %2, align 8
  store i8* %7, i8** %1, align 8
<<<<<<< HEAD:dnas_tests/demo.ll
  br label %257
=======
  br label %213
>>>>>>> 74281514c0d5373961f1dfe626450df5ecc89383:dnas_testsOld/demo.ll

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
  store i32 0, i32* %i, align 4
  br label %22

; <label>:22                                      ; preds = %32, %20
  %23 = load i32, i32* %i, align 4
  %24 = icmp slt i32 %23, 3
  br i1 %24, label %25, label %35

; <label>:25                                      ; preds = %22
  %26 = load i32, i32* %i, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [3 x i32], [3 x i32]* %start, i64 0, i64 %27
  store i32 -1, i32* %28, align 4
  %29 = load i32, i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [3 x i32], [3 x i32]* %ending, i64 0, i64 %30
  store i32 -1, i32* %31, align 4
  br label %32

; <label>:32                                      ; preds = %25
  %33 = load i32, i32* %i, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %i, align 4
  br label %22

; <label>:35                                      ; preds = %22
  store i32 0, i32* %temp, align 4
  store i32 0, i32* %i, align 4
  br label %36

; <label>:36                                      ; preds = %119, %35
  %37 = load i32, i32* %i, align 4
  %38 = load i32, i32* %length, align 4
  %39 = sub nsw i32 %38, 2
  %40 = icmp slt i32 %37, %39
  br i1 %40, label %41, label %122

; <label>:41                                      ; preds = %36
  %42 = load i32, i32* %i, align 4
  %43 = sext i32 %42 to i64
  %44 = load i8*, i8** %2, align 8
  %45 = getelementptr inbounds i8, i8* %44, i64 %43
  %46 = load i8, i8* %45, align 1
  %47 = load i32, i32* %i, align 4
  %48 = add nsw i32 %47, 1
  %49 = sext i32 %48 to i64
  %50 = load i8*, i8** %2, align 8
  %51 = getelementptr inbounds i8, i8* %50, i64 %49
  %52 = load i8, i8* %51, align 1
  %53 = load i32, i32* %i, align 4
  %54 = add nsw i32 %53, 2
  %55 = sext i32 %54 to i64
  %56 = load i8*, i8** %2, align 8
  %57 = getelementptr inbounds i8, i8* %56, i64 %55
  %58 = load i8, i8* %57, align 1
  %59 = call i32 @codon_number(i8 signext %46, i8 signext %52, i8 signext %58)
  store i32 %59, i32* %temp, align 4
  %60 = load i32, i32* %temp, align 4
  %61 = icmp eq i32 %60, 14
  br i1 %61, label %65, label %62

; <label>:62                                      ; preds = %41
  %63 = load i32, i32* %temp, align 4
  %64 = icmp eq i32 %63, 46
  br i1 %64, label %65, label %79

; <label>:65                                      ; preds = %62, %41
  %66 = load i32, i32* %i, align 4
  %67 = srem i32 %66, 3
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [3 x i32], [3 x i32]* %start, i64 0, i64 %68
  %70 = load i32, i32* %69, align 4
  %71 = icmp eq i32 %70, -1
  br i1 %71, label %72, label %78

; <label>:72                                      ; preds = %65
  %73 = load i32, i32* %i, align 4
  %74 = load i32, i32* %i, align 4
  %75 = srem i32 %74, 3
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [3 x i32], [3 x i32]* %start, i64 0, i64 %76
  store i32 %73, i32* %77, align 4
  br label %78

; <label>:78                                      ; preds = %72, %65
  br label %79

; <label>:79                                      ; preds = %78, %62
  %80 = load i32, i32* %temp, align 4
  %81 = icmp eq i32 %80, 48
  br i1 %81, label %88, label %82

; <label>:82                                      ; preds = %79
  %83 = load i32, i32* %temp, align 4
  %84 = icmp eq i32 %83, 50
  br i1 %84, label %88, label %85

; <label>:85                                      ; preds = %82
  %86 = load i32, i32* %temp, align 4
  %87 = icmp eq i32 %86, 56
  br i1 %87, label %88, label %118

; <label>:88                                      ; preds = %85, %82, %79
  %89 = load i32, i32* %i, align 4
  %90 = srem i32 %89, 3
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [3 x i32], [3 x i32]* %start, i64 0, i64 %91
  %93 = load i32, i32* %92, align 4
  %94 = icmp ne i32 %93, -1
  br i1 %94, label %95, label %117

; <label>:95                                      ; preds = %88
  %96 = load i32, i32* %i, align 4
  %97 = srem i32 %96, 3
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [3 x i32], [3 x i32]* %ending, i64 0, i64 %98
  %100 = load i32, i32* %99, align 4
  %101 = icmp eq i32 %100, -1
  br i1 %101, label %102, label %116

; <label>:102                                     ; preds = %95
  %103 = load i32, i32* %i, align 4
  %104 = load i32, i32* %i, align 4
  %105 = srem i32 %104, 3
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [3 x i32], [3 x i32]* %start, i64 0, i64 %106
  %108 = load i32, i32* %107, align 4
  %109 = icmp sgt i32 %103, %108
  br i1 %109, label %110, label %116

; <label>:110                                     ; preds = %102
  %111 = load i32, i32* %i, align 4
  %112 = load i32, i32* %i, align 4
  %113 = srem i32 %112, 3
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [3 x i32], [3 x i32]* %ending, i64 0, i64 %114
  store i32 %111, i32* %115, align 4
  br label %116

; <label>:116                                     ; preds = %110, %102, %95
  br label %117

; <label>:117                                     ; preds = %116, %88
  br label %118

; <label>:118                                     ; preds = %117, %85
  br label %119

; <label>:119                                     ; preds = %118
  %120 = load i32, i32* %i, align 4
  %121 = add nsw i32 %120, 1
  store i32 %121, i32* %i, align 4
  br label %36

; <label>:122                                     ; preds = %36
  store i32 -1, i32* %temp, align 4
  store i32 0, i32* %i, align 4
  br label %123

<<<<<<< HEAD:dnas_tests/demo.ll
; <label>:123                                     ; preds = %160, %122
  %124 = load i32, i32* %i, align 4
  %125 = icmp slt i32 %124, 3
  br i1 %125, label %126, label %163

; <label>:126                                     ; preds = %123
  %127 = load i32, i32* %i, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [3 x i32], [3 x i32]* %start, i64 0, i64 %128
  %130 = load i32, i32* %129, align 4
  %131 = icmp ne i32 %130, -1
  br i1 %131, label %132, label %159

; <label>:132                                     ; preds = %126
  %133 = load i32, i32* %i, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [3 x i32], [3 x i32]* %ending, i64 0, i64 %134
  %136 = load i32, i32* %135, align 4
  %137 = icmp ne i32 %136, -1
  br i1 %137, label %138, label %159

; <label>:138                                     ; preds = %132
  %139 = load i32, i32* %temp, align 4
  %140 = icmp ne i32 %139, -1
  br i1 %140, label %141, label %153

; <label>:141                                     ; preds = %138
=======
; <label>:132                                     ; preds = %126, %111
  store i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.2, i32 0, i32 0), i8** %retdef, align 8
  %133 = load i32, i32* %temp, align 4
  %134 = icmp eq i32 %133, -1
  br i1 %134, label %135, label %137

; <label>:135                                     ; preds = %132
  %136 = load i8*, i8** %retdef, align 8
  store i8* %136, i8** %1, align 8
  br label %213

; <label>:137                                     ; preds = %132
  %138 = load i32, i32* %i, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [3 x i32], [3 x i32]* %ending, i64 0, i64 %139
  %141 = load i32, i32* %140, align 4
  store i32 %141, i32* %b, align 4
>>>>>>> 74281514c0d5373961f1dfe626450df5ecc89383:dnas_testsOld/demo.ll
  %142 = load i32, i32* %i, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [3 x i32], [3 x i32]* %start, i64 0, i64 %143
  %145 = load i32, i32* %144, align 4
<<<<<<< HEAD:dnas_tests/demo.ll
  %146 = load i32, i32* %temp, align 4
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [3 x i32], [3 x i32]* %start, i64 0, i64 %147
  %149 = load i32, i32* %148, align 4
  %150 = icmp slt i32 %145, %149
  br i1 %150, label %151, label %153

; <label>:151                                     ; preds = %141
  %152 = load i32, i32* %i, align 4
  store i32 %152, i32* %temp, align 4
  br label %153

; <label>:153                                     ; preds = %151, %141, %138
  %154 = load i32, i32* %temp, align 4
  %155 = icmp eq i32 %154, -1
  br i1 %155, label %156, label %158

; <label>:156                                     ; preds = %153
  %157 = load i32, i32* %i, align 4
  store i32 %157, i32* %temp, align 4
  br label %158

; <label>:158                                     ; preds = %156, %153
  br label %159

; <label>:159                                     ; preds = %158, %132, %126
  br label %160

; <label>:160                                     ; preds = %159
  %161 = load i32, i32* %i, align 4
  %162 = add nsw i32 %161, 1
  store i32 %162, i32* %i, align 4
  br label %123

; <label>:163                                     ; preds = %123
  store i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.1, i32 0, i32 0), i8** %retdef, align 8
  %164 = load i32, i32* %temp, align 4
  %165 = icmp eq i32 %164, -1
  br i1 %165, label %166, label %168

; <label>:166                                     ; preds = %163
  %167 = load i8*, i8** %retdef, align 8
  store i8* %167, i8** %1, align 8
  br label %257

; <label>:168                                     ; preds = %163
  %169 = load i32, i32* %temp, align 4
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds [3 x i32], [3 x i32]* %ending, i64 0, i64 %170
  %172 = load i32, i32* %171, align 4
  store i32 %172, i32* %b, align 4
  %173 = load i32, i32* %temp, align 4
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [3 x i32], [3 x i32]* %start, i64 0, i64 %174
  %176 = load i32, i32* %175, align 4
  store i32 %176, i32* %a, align 4
  %177 = load i32, i32* %b, align 4
  %178 = load i32, i32* %a, align 4
  %179 = sub nsw i32 %177, %178
  %180 = sdiv i32 %179, 3
  %181 = add nsw i32 %180, 1
  store i32 %181, i32* %ret_size, align 4
  %182 = load i32, i32* %ret_size, align 4
  %183 = zext i32 %182 to i64
  %184 = call i8* @llvm.stacksave()
  store i8* %184, i8** %3, align 8
  %185 = alloca i8, i64 %183, align 16
  %186 = load i32, i32* %a, align 4
  store i32 %186, i32* %i1, align 4
  br label %187

; <label>:187                                     ; preds = %221, %168
  %188 = load i32, i32* %i1, align 4
  %189 = load i32, i32* %b, align 4
  %190 = icmp slt i32 %188, %189
  br i1 %190, label %191, label %224

; <label>:191                                     ; preds = %187
  %192 = load i32, i32* %i1, align 4
  %193 = sext i32 %192 to i64
  %194 = load i8*, i8** %2, align 8
  %195 = getelementptr inbounds i8, i8* %194, i64 %193
  %196 = load i8, i8* %195, align 1
  %197 = load i32, i32* %i1, align 4
  %198 = add nsw i32 %197, 1
  %199 = sext i32 %198 to i64
  %200 = load i8*, i8** %2, align 8
  %201 = getelementptr inbounds i8, i8* %200, i64 %199
  %202 = load i8, i8* %201, align 1
  %203 = load i32, i32* %i1, align 4
  %204 = add nsw i32 %203, 2
  %205 = sext i32 %204 to i64
  %206 = load i8*, i8** %2, align 8
  %207 = getelementptr inbounds i8, i8* %206, i64 %205
  %208 = load i8, i8* %207, align 1
  %209 = call i32 @codon_number(i8 signext %196, i8 signext %202, i8 signext %208)
  store i32 %209, i32* %temp, align 4
  %210 = load i32, i32* %i1, align 4
  %211 = load i32, i32* %a, align 4
  %212 = sub nsw i32 %210, %211
  %213 = sdiv i32 %212, 3
  store i32 %213, i32* %index, align 4
  %214 = load i32, i32* %temp, align 4
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds [64 x i8], [64 x i8]* @codon, i64 0, i64 %215
  %217 = load i8, i8* %216, align 1
  %218 = load i32, i32* %index, align 4
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds i8, i8* %185, i64 %219
  store i8 %217, i8* %220, align 1
  br label %221

; <label>:221                                     ; preds = %191
  %222 = load i32, i32* %i1, align 4
  %223 = add nsw i32 %222, 3
  store i32 %223, i32* %i1, align 4
  br label %187

; <label>:224                                     ; preds = %187
  %225 = load i32, i32* %ret_size, align 4
  %226 = sub nsw i32 %225, 1
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds i8, i8* %185, i64 %227
  store i8 0, i8* %228, align 1
  %229 = load i32, i32* %ret_size, align 4
  %230 = sub nsw i32 %229, 1
  store i32 %230, i32* %length2, align 4
  %231 = load i32, i32* %length2, align 4
  %232 = zext i32 %231 to i64
  %233 = alloca i8, i64 %232, align 16
  store i32 0, i32* %i2, align 4
  br label %234

; <label>:234                                     ; preds = %249, %224
  %235 = load i32, i32* %i2, align 4
  %236 = load i32, i32* %length2, align 4
  %237 = icmp slt i32 %235, %236
  br i1 %237, label %238, label %252

; <label>:238                                     ; preds = %234
  %239 = load i32, i32* %i2, align 4
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds i8, i8* %185, i64 %240
  %242 = load i8, i8* %241, align 1
  %243 = sext i8 %242 to i32
  store i32 %243, i32* %curr, align 4
  %244 = load i32, i32* %curr, align 4
  %245 = trunc i32 %244 to i8
  %246 = load i32, i32* %i2, align 4
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds i8, i8* %233, i64 %247
  store i8 %245, i8* %248, align 1
  br label %249

; <label>:249                                     ; preds = %238
  %250 = load i32, i32* %i2, align 4
  %251 = add nsw i32 %250, 1
  store i32 %251, i32* %i2, align 4
  br label %234

; <label>:252                                     ; preds = %234
  %253 = load i32, i32* %length2, align 4
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds i8, i8* %233, i64 %254
  store i8 0, i8* %255, align 1
  store i8* %233, i8** %1, align 8
  %256 = load i8*, i8** %3, align 8
  call void @llvm.stackrestore(i8* %256)
  br label %257

; <label>:257                                     ; preds = %252, %166, %6
  %258 = load i8*, i8** %1, align 8
  ret i8* %258
=======
  store i32 %145, i32* %a, align 4
  %146 = load i32, i32* %b, align 4
  %147 = load i32, i32* %a, align 4
  %148 = sub nsw i32 %146, %147
  %149 = sdiv i32 %148, 3
  %150 = add nsw i32 %149, 1
  store i32 %150, i32* %ret_size, align 4
  %151 = load i32, i32* %ret_size, align 4
  %152 = zext i32 %151 to i64
  %153 = call i8* @llvm.stacksave()
  store i8* %153, i8** %3, align 8
  %154 = alloca i8, i64 %152, align 16
  %155 = load i32, i32* %a, align 4
  store i32 %155, i32* %i1, align 4
  br label %156

; <label>:156                                     ; preds = %204, %137
  %157 = load i32, i32* %i1, align 4
  %158 = load i32, i32* %b, align 4
  %159 = icmp slt i32 %157, %158
  br i1 %159, label %160, label %207

; <label>:160                                     ; preds = %156
  %161 = load i32, i32* %i1, align 4
  %162 = sext i32 %161 to i64
  %163 = load i8*, i8** %2, align 8
  %164 = getelementptr inbounds i8, i8* %163, i64 %162
  %165 = load i8, i8* %164, align 1
  %166 = load i32, i32* %i1, align 4
  %167 = add nsw i32 %166, 1
  %168 = sext i32 %167 to i64
  %169 = load i8*, i8** %2, align 8
  %170 = getelementptr inbounds i8, i8* %169, i64 %168
  %171 = load i8, i8* %170, align 1
  %172 = load i32, i32* %i1, align 4
  %173 = add nsw i32 %172, 2
  %174 = sext i32 %173 to i64
  %175 = load i8*, i8** %2, align 8
  %176 = getelementptr inbounds i8, i8* %175, i64 %174
  %177 = load i8, i8* %176, align 1
  %178 = call i32 @codon_number(i8 signext %165, i8 signext %171, i8 signext %177)
  store i32 %178, i32* %temp, align 4
  %179 = load i32, i32* %i1, align 4
  %180 = load i32, i32* %a, align 4
  %181 = sub nsw i32 %179, %180
  %182 = sdiv i32 %181, 3
  store i32 %182, i32* %index, align 4
  %183 = load i32, i32* %index, align 4
  %184 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %183)
  %185 = load i32, i32* %temp, align 4
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds [64 x i8], [64 x i8]* @codon, i64 0, i64 %186
  %188 = load i8, i8* %187, align 1
  %189 = load i32, i32* %index, align 4
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds i8, i8* %154, i64 %190
  store i8 %188, i8* %191, align 1
  %192 = load i32, i32* %temp, align 4
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds [64 x i8], [64 x i8]* @codon, i64 0, i64 %193
  %195 = load i8, i8* %194, align 1
  %196 = sext i8 %195 to i32
  %197 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i32 %196)
  %198 = load i32, i32* %index, align 4
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds i8, i8* %154, i64 %199
  %201 = load i8, i8* %200, align 1
  %202 = sext i8 %201 to i32
  %203 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i32 %202)
  br label %204

; <label>:204                                     ; preds = %160
  %205 = load i32, i32* %i1, align 4
  %206 = add nsw i32 %205, 3
  store i32 %206, i32* %i1, align 4
  br label %156

; <label>:207                                     ; preds = %156
  %208 = load i32, i32* %index, align 4
  %209 = add nsw i32 %208, 1
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds i8, i8* %154, i64 %210
  store i8 0, i8* %211, align 1
  store i8* %154, i8** %1, align 8
  %212 = load i8*, i8** %3, align 8
  call void @llvm.stackrestore(i8* %212)
  br label %213

; <label>:213                                     ; preds = %207, %135, %6
  %214 = load i8*, i8** %1, align 8
  ret i8* %214
>>>>>>> 74281514c0d5373961f1dfe626450df5ecc89383:dnas_testsOld/demo.ll
}

; Function Attrs: nounwind uwtable
define i8* @translate2(i8* %str) #0 {
  %1 = alloca i8*, align 8
  %str1 = alloca i8*, align 8
  %str2 = alloca i8*, align 8
  store i8* %str, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = call i8* @transcribe(i8* %2)
  store i8* %3, i8** %str1, align 8
  %4 = load i8*, i8** %str1, align 8
  %5 = call i8* @translate(i8* %4)
  store i8* %5, i8** %str2, align 8
  %6 = load i8*, i8** %str2, align 8
  ret i8* %6
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
  %4 = call %struct._IO_FILE* @fopen(i8* %3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
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
  %4 = call %struct._IO_FILE* @fopen(i8* %3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
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
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i32 0, i32 0))
  store i32 %7, i32* %1, align 4
  br label %10

; <label>:8                                       ; preds = %0
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0))
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
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0), i32 %26)
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0))
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
  %40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0), i32 %39)
  ret i32 1
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
