; ModuleID = 'DNAs'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@fmt_int = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt_str = private unnamed_addr constant [3 x i8] c"%s\00"
@fmt_str.1 = private unnamed_addr constant [5 x i8] c"%.3f\00"
@fmt_str.2 = private unnamed_addr constant [3 x i8] c"%c\00"
@context = private unnamed_addr constant [5 x i8] c"here\00"
@context.3 = private unnamed_addr constant [5 x i8] c"here\00"
@fmt_int.4 = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt_str.5 = private unnamed_addr constant [3 x i8] c"%s\00"
@fmt_str.6 = private unnamed_addr constant [5 x i8] c"%.3f\00"
@fmt_str.7 = private unnamed_addr constant [3 x i8] c"%c\00"
@fmt_int.8 = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt_str.9 = private unnamed_addr constant [3 x i8] c"%s\00"
@fmt_str.10 = private unnamed_addr constant [5 x i8] c"%.3f\00"
@fmt_str.11 = private unnamed_addr constant [3 x i8] c"%c\00"
@fmt_int.12 = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt_str.13 = private unnamed_addr constant [3 x i8] c"%s\00"
@fmt_str.14 = private unnamed_addr constant [5 x i8] c"%.3f\00"
@fmt_str.15 = private unnamed_addr constant [3 x i8] c"%c\00"
@context.16 = private unnamed_addr constant [5 x i8] c"acgc\00"
@context.17 = private unnamed_addr constant [5 x i8] c"acgc\00"
@context.18 = private unnamed_addr constant [5 x i8] c"ccgt\00"
@context.19 = private unnamed_addr constant [5 x i8] c"ccgt\00"
@context.20 = private unnamed_addr constant [1 x i8] zeroinitializer
@context.21 = private unnamed_addr constant [1 x i8] zeroinitializer
@codon = global [64 x i8] c"KDKDTTTTRSRSIIMIQHQHPPPPRRRRLLLLEDEDAAAAGGGGVVVVBYBYSSSSBCWCLFLF", align 16
@.str = private unnamed_addr constant [16 x i8] c"Hello I'm in C\0A\00", align 1
@translate.start = private unnamed_addr constant [3 x i32] [i32 -1, i32 -1, i32 -1], align 4
@translate.ending = private unnamed_addr constant [3 x i32] [i32 -1, i32 -1, i32 -1], align 4
@.str.1 = private unnamed_addr constant [35 x i8] c"No possible translation available.\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"-\00", align 1

declare i32 @printf(i8*, ...)

declare double @db_exp(double, double, ...)

define i32 @lcs_length(i8* %A, i8* %B, i32 %sizeA, i32 %sizeB) {
entry:
  %A1 = alloca i8*
  store i8* %A, i8** %A1
  %B2 = alloca i8*
  store i8* %B, i8** %B2
  %sizeA3 = alloca i32
  store i32 %sizeA, i32* %sizeA3
  %sizeB4 = alloca i32
  store i32 %sizeB, i32* %sizeB4
  %sizeA5 = load i32, i32* %sizeA3
  %sizeB6 = load i32, i32* %sizeB4
  %sizeA7 = load i32, i32* %sizeA3
  %sizeB8 = load i32, i32* %sizeB4
  %bop = mul i32 %sizeA5, %sizeB6
  %C = alloca i32, i32 %bop
  %i2 = alloca i32
  store i32 0, i32* %i2
  %i29 = load i32, i32* %i2
  br label %while

while:                                            ; preds = %while_body, %entry
  %i218 = load i32, i32* %i2
  %sizeA19 = load i32, i32* %sizeA3
  %sizeB20 = load i32, i32* %sizeB4
  %sizeA21 = load i32, i32* %sizeA3
  %sizeB22 = load i32, i32* %sizeB4
  %bop23 = mul i32 %sizeA19, %sizeB20
  %i224 = load i32, i32* %i2
  %sizeA25 = load i32, i32* %sizeA3
  %sizeB26 = load i32, i32* %sizeB4
  %sizeA27 = load i32, i32* %sizeA3
  %sizeB28 = load i32, i32* %sizeB4
  %bop29 = mul i32 %sizeA25, %sizeB26
  %bop30 = icmp slt i32 %i218, %bop23
  br i1 %bop30, label %while_body, label %merge

while_body:                                       ; preds = %while
  %i210 = load i32, i32* %i2
  %C11 = getelementptr i32, i32* %C, i32 %i210
  store i32 0, i32* %C11
  %i212 = load i32, i32* %i2
  %i213 = load i32, i32* %i2
  %bop14 = add i32 %i212, 1
  %i215 = load i32, i32* %i2
  %i216 = load i32, i32* %i2
  %bop17 = add i32 %i215, 1
  store i32 %bop14, i32* %i2
  br label %while

merge:                                            ; preds = %while
  %i = alloca i32
  %sizeA31 = load i32, i32* %sizeA3
  %sizeA32 = load i32, i32* %sizeA3
  store i32 %sizeA31, i32* %i
  %j = alloca i32
  %sizeB33 = load i32, i32* %sizeB4
  %sizeB34 = load i32, i32* %sizeB4
  store i32 %sizeB33, i32* %j
  %i35 = load i32, i32* %i
  br label %while36

while36:                                          ; preds = %merge199, %merge
  %i206 = load i32, i32* %i
  %i207 = load i32, i32* %i
  %bop208 = icmp sge i32 %i206, 0
  br i1 %bop208, label %while_body37, label %merge209

while_body37:                                     ; preds = %while36
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_str, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @context.3, i32 0, i32 0))
  %j38 = load i32, i32* %j
  %j39 = load i32, i32* %j
  %printf40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_int, i32 0, i32 0), i32 %j39)
  %j41 = load i32, i32* %j
  br label %while42

while42:                                          ; preds = %merge65, %while_body37
  %j196 = load i32, i32* %j
  %j197 = load i32, i32* %j
  %bop198 = icmp sge i32 %j196, 0
  br i1 %bop198, label %while_body43, label %merge199

while_body43:                                     ; preds = %while42
  %i44 = load i32, i32* %i
  %sizeA45 = load i32, i32* %sizeA3
  %i46 = load i32, i32* %i
  %sizeA47 = load i32, i32* %sizeA3
  %bop48 = icmp eq i32 %i44, %sizeA45
  %j49 = load i32, i32* %j
  %sizeB50 = load i32, i32* %sizeB4
  %j51 = load i32, i32* %j
  %sizeB52 = load i32, i32* %sizeB4
  %bop53 = icmp eq i32 %j49, %sizeB50
  %i54 = load i32, i32* %i
  %sizeA55 = load i32, i32* %sizeA3
  %i56 = load i32, i32* %i
  %sizeA57 = load i32, i32* %sizeA3
  %bop58 = icmp eq i32 %i54, %sizeA55
  %j59 = load i32, i32* %j
  %sizeB60 = load i32, i32* %sizeB4
  %j61 = load i32, i32* %j
  %sizeB62 = load i32, i32* %sizeB4
  %bop63 = icmp eq i32 %j59, %sizeB60
  %bop64 = or i1 %bop48, %bop53
  br i1 %bop64, label %then, label %else

merge65:                                          ; preds = %merge85, %then
  %j190 = load i32, i32* %j
  %j191 = load i32, i32* %j
  %bop192 = sub i32 %j190, 1
  %j193 = load i32, i32* %j
  %j194 = load i32, i32* %j
  %bop195 = sub i32 %j193, 1
  store i32 %bop192, i32* %j
  br label %while42

then:                                             ; preds = %while_body43
  %index = alloca i32
  %sizeB66 = load i32, i32* %sizeB4
  %sizeA67 = load i32, i32* %sizeA3
  %j68 = load i32, i32* %j
  %i69 = load i32, i32* %i
  %getIndex_result = call i32 @getIndex(i32 %i69, i32 %j68, i32 %sizeA67, i32 %sizeB66)
  %sizeB70 = load i32, i32* %sizeB4
  %sizeA71 = load i32, i32* %sizeA3
  %j72 = load i32, i32* %j
  %i73 = load i32, i32* %i
  %getIndex_result74 = call i32 @getIndex(i32 %i73, i32 %j72, i32 %sizeA71, i32 %sizeB70)
  store i32 %getIndex_result, i32* %index
  %index75 = load i32, i32* %index
  %C76 = getelementptr i32, i32* %C, i32 %index75
  store i32 0, i32* %C76
  br label %merge65

else:                                             ; preds = %while_body43
  %i77 = load i32, i32* %i
  %getChar = call i8 (i8**, i32, ...) bitcast (i8 (i8**, i32)* @getChar to i8 (i8**, i32, ...)*)(i8** %A1, i32 %i77)
  %j78 = load i32, i32* %j
  %getChar79 = call i8 (i8**, i32, ...) bitcast (i8 (i8**, i32)* @getChar to i8 (i8**, i32, ...)*)(i8** %B2, i32 %j78)
  %i80 = load i32, i32* %i
  %getChar81 = call i8 (i8**, i32, ...) bitcast (i8 (i8**, i32)* @getChar to i8 (i8**, i32, ...)*)(i8** %A1, i32 %i80)
  %j82 = load i32, i32* %j
  %getChar83 = call i8 (i8**, i32, ...) bitcast (i8 (i8**, i32)* @getChar to i8 (i8**, i32, ...)*)(i8** %B2, i32 %j82)
  %bop84 = icmp eq i8 %getChar, %getChar79
  br i1 %bop84, label %then86, label %else130

merge85:                                          ; preds = %else130, %then86
  br label %merge65

then86:                                           ; preds = %else
  %index1 = alloca i32
  %sizeB87 = load i32, i32* %sizeB4
  %sizeA88 = load i32, i32* %sizeA3
  %j89 = load i32, i32* %j
  %i90 = load i32, i32* %i
  %getIndex_result91 = call i32 @getIndex(i32 %i90, i32 %j89, i32 %sizeA88, i32 %sizeB87)
  %sizeB92 = load i32, i32* %sizeB4
  %sizeA93 = load i32, i32* %sizeA3
  %j94 = load i32, i32* %j
  %i95 = load i32, i32* %i
  %getIndex_result96 = call i32 @getIndex(i32 %i95, i32 %j94, i32 %sizeA93, i32 %sizeB92)
  store i32 %getIndex_result91, i32* %index1
  %index2 = alloca i32
  %sizeB97 = load i32, i32* %sizeB4
  %sizeA98 = load i32, i32* %sizeA3
  %j99 = load i32, i32* %j
  %j100 = load i32, i32* %j
  %bop101 = add i32 %j99, 1
  %i102 = load i32, i32* %i
  %i103 = load i32, i32* %i
  %bop104 = add i32 %i102, 1
  %getIndex_result105 = call i32 @getIndex(i32 %bop104, i32 %bop101, i32 %sizeA98, i32 %sizeB97)
  %sizeB106 = load i32, i32* %sizeB4
  %sizeA107 = load i32, i32* %sizeA3
  %j108 = load i32, i32* %j
  %j109 = load i32, i32* %j
  %bop110 = add i32 %j108, 1
  %i111 = load i32, i32* %i
  %i112 = load i32, i32* %i
  %bop113 = add i32 %i111, 1
  %getIndex_result114 = call i32 @getIndex(i32 %bop113, i32 %bop110, i32 %sizeA107, i32 %sizeB106)
  store i32 %getIndex_result105, i32* %index2
  %index2115 = load i32, i32* %index2
  %C116 = getelementptr i32, i32* %C, i32 %index2115
  %tmp = load i32, i32* %C116
  %index2117 = load i32, i32* %index2
  %C118 = getelementptr i32, i32* %C, i32 %index2117
  %tmp119 = load i32, i32* %C118
  %bop120 = add i32 1, %tmp
  %index2121 = load i32, i32* %index2
  %C122 = getelementptr i32, i32* %C, i32 %index2121
  %tmp123 = load i32, i32* %C122
  %index2124 = load i32, i32* %index2
  %C125 = getelementptr i32, i32* %C, i32 %index2124
  %tmp126 = load i32, i32* %C125
  %bop127 = add i32 1, %tmp123
  %index1128 = load i32, i32* %index1
  %C129 = getelementptr i32, i32* %C, i32 %index1128
  store i32 %bop120, i32* %C129
  br label %merge85

else130:                                          ; preds = %else
  %index3 = alloca i32
  %sizeB131 = load i32, i32* %sizeB4
  %sizeA132 = load i32, i32* %sizeA3
  %j133 = load i32, i32* %j
  %i134 = load i32, i32* %i
  %i135 = load i32, i32* %i
  %bop136 = add i32 %i134, 1
  %getIndex_result137 = call i32 @getIndex(i32 %bop136, i32 %j133, i32 %sizeA132, i32 %sizeB131)
  %sizeB138 = load i32, i32* %sizeB4
  %sizeA139 = load i32, i32* %sizeA3
  %j140 = load i32, i32* %j
  %i141 = load i32, i32* %i
  %i142 = load i32, i32* %i
  %bop143 = add i32 %i141, 1
  %getIndex_result144 = call i32 @getIndex(i32 %bop143, i32 %j140, i32 %sizeA139, i32 %sizeB138)
  store i32 %getIndex_result137, i32* %index3
  %index4 = alloca i32
  %sizeB145 = load i32, i32* %sizeB4
  %sizeA146 = load i32, i32* %sizeA3
  %j147 = load i32, i32* %j
  %j148 = load i32, i32* %j
  %bop149 = add i32 %j147, 1
  %i150 = load i32, i32* %i
  %getIndex_result151 = call i32 @getIndex(i32 %i150, i32 %bop149, i32 %sizeA146, i32 %sizeB145)
  %sizeB152 = load i32, i32* %sizeB4
  %sizeA153 = load i32, i32* %sizeA3
  %j154 = load i32, i32* %j
  %j155 = load i32, i32* %j
  %bop156 = add i32 %j154, 1
  %i157 = load i32, i32* %i
  %getIndex_result158 = call i32 @getIndex(i32 %i157, i32 %bop156, i32 %sizeA153, i32 %sizeB152)
  store i32 %getIndex_result151, i32* %index4
  %index5 = alloca i32
  %sizeB159 = load i32, i32* %sizeB4
  %sizeA160 = load i32, i32* %sizeA3
  %j161 = load i32, i32* %j
  %i162 = load i32, i32* %i
  %getIndex_result163 = call i32 @getIndex(i32 %i162, i32 %j161, i32 %sizeA160, i32 %sizeB159)
  %sizeB164 = load i32, i32* %sizeB4
  %sizeA165 = load i32, i32* %sizeA3
  %j166 = load i32, i32* %j
  %i167 = load i32, i32* %i
  %getIndex_result168 = call i32 @getIndex(i32 %i167, i32 %j166, i32 %sizeA165, i32 %sizeB164)
  store i32 %getIndex_result163, i32* %index5
  %firstVal = alloca i32
  %index3169 = load i32, i32* %index3
  %C170 = getelementptr i32, i32* %C, i32 %index3169
  %tmp171 = load i32, i32* %C170
  %index3172 = load i32, i32* %index3
  %C173 = getelementptr i32, i32* %C, i32 %index3172
  %tmp174 = load i32, i32* %C173
  store i32 %tmp171, i32* %firstVal
  %secondVal = alloca i32
  %index4175 = load i32, i32* %index4
  %C176 = getelementptr i32, i32* %C, i32 %index4175
  %tmp177 = load i32, i32* %C176
  %index4178 = load i32, i32* %index4
  %C179 = getelementptr i32, i32* %C, i32 %index4178
  %tmp180 = load i32, i32* %C179
  store i32 %tmp177, i32* %secondVal
  %max = alloca i32
  %secondVal181 = load i32, i32* %secondVal
  %firstVal182 = load i32, i32* %firstVal
  %getMax_result = call i32 @getMax(i32 %firstVal182, i32 %secondVal181)
  %secondVal183 = load i32, i32* %secondVal
  %firstVal184 = load i32, i32* %firstVal
  %getMax_result185 = call i32 @getMax(i32 %firstVal184, i32 %secondVal183)
  store i32 %getMax_result, i32* %max
  %max186 = load i32, i32* %max
  %max187 = load i32, i32* %max
  %index5188 = load i32, i32* %index5
  %C189 = getelementptr i32, i32* %C, i32 %index5188
  store i32 %max186, i32* %C189
  br label %merge85

merge199:                                         ; preds = %while42
  %i200 = load i32, i32* %i
  %i201 = load i32, i32* %i
  %bop202 = sub i32 %i200, 1
  %i203 = load i32, i32* %i
  %i204 = load i32, i32* %i
  %bop205 = sub i32 %i203, 1
  store i32 %bop202, i32* %i
  br label %while36

merge209:                                         ; preds = %while36
  store i32 0, i32* %i
  br label %while210

while210:                                         ; preds = %while_body211, %merge209
  %i222 = load i32, i32* %i
  %sizeA223 = load i32, i32* %sizeA3
  %sizeB224 = load i32, i32* %sizeB4
  %sizeA225 = load i32, i32* %sizeA3
  %sizeB226 = load i32, i32* %sizeB4
  %bop227 = mul i32 %sizeA223, %sizeB224
  %i228 = load i32, i32* %i
  %sizeA229 = load i32, i32* %sizeA3
  %sizeB230 = load i32, i32* %sizeB4
  %sizeA231 = load i32, i32* %sizeA3
  %sizeB232 = load i32, i32* %sizeB4
  %bop233 = mul i32 %sizeA229, %sizeB230
  %bop234 = icmp slt i32 %i222, %bop227
  br i1 %bop234, label %while_body211, label %merge235

while_body211:                                    ; preds = %while210
  %i214 = load i32, i32* %i
  %i217 = load i32, i32* %i
  %bop218 = add i32 %i214, 1
  %i219 = load i32, i32* %i
  %i220 = load i32, i32* %i
  %bop221 = add i32 %i219, 1
  store i32 %bop218, i32* %i
  br label %while210

merge235:                                         ; preds = %while210
  %result = alloca i32
  %C236 = getelementptr i32, i32* %C, i32 0
  %tmp237 = load i32, i32* %C236
  %C238 = getelementptr i32, i32* %C, i32 0
  %tmp239 = load i32, i32* %C238
  store i32 %tmp237, i32* %result
  %result240 = load i32, i32* %result
  ret i32 %result240
}

define i32 @getIndex(i32 %x, i32 %y, i32 %sizeA, i32 %sizeB) {
entry:
  %x1 = alloca i32
  store i32 %x, i32* %x1
  %y2 = alloca i32
  store i32 %y, i32* %y2
  %sizeA3 = alloca i32
  store i32 %sizeA, i32* %sizeA3
  %sizeB4 = alloca i32
  store i32 %sizeB, i32* %sizeB4
  %sizeA5 = load i32, i32* %sizeA3
  %x6 = load i32, i32* %x1
  %sizeA7 = load i32, i32* %sizeA3
  %x8 = load i32, i32* %x1
  %bop = mul i32 %sizeA5, %x6
  %y9 = load i32, i32* %y2
  %sizeA10 = load i32, i32* %sizeA3
  %x11 = load i32, i32* %x1
  %sizeA12 = load i32, i32* %sizeA3
  %x13 = load i32, i32* %x1
  %bop14 = mul i32 %sizeA10, %x11
  %y15 = load i32, i32* %y2
  %bop16 = add i32 %bop, %y9
  ret i32 %bop16
}

define i32 @getMax(i32 %x, i32 %y) {
entry:
  %x1 = alloca i32
  store i32 %x, i32* %x1
  %y2 = alloca i32
  store i32 %y, i32* %y2
  %result = alloca i32
  store i32 -1, i32* %result
  %x3 = load i32, i32* %x1
  %y4 = load i32, i32* %y2
  %x5 = load i32, i32* %x1
  %y6 = load i32, i32* %y2
  %bop = icmp sgt i32 %x3, %y4
  br i1 %bop, label %then, label %else

merge:                                            ; preds = %else, %then
  %result11 = load i32, i32* %result
  ret i32 %result11

then:                                             ; preds = %entry
  %x7 = load i32, i32* %x1
  %x8 = load i32, i32* %x1
  store i32 %x7, i32* %result
  br label %merge

else:                                             ; preds = %entry
  %y9 = load i32, i32* %y2
  %y10 = load i32, i32* %y2
  store i32 %y9, i32* %result
  br label %merge
}

define i32 @main() {
entry:
  %sample = alloca i8*
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @context.16, i32 0, i32 0), i8** %sample
  %sample2 = alloca i8*
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @context.18, i32 0, i32 0), i8** %sample2
  %empty = alloca i8*
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @context.20, i32 0, i32 0), i8** %empty
  %tempResult = alloca i32
  %sample21 = load i8*, i8** %sample2
  %sample3 = load i8*, i8** %sample
  %lcs_length_result = call i32 @lcs_length(i8* %sample3, i8* %sample21, i32 4, i32 4)
  %sample24 = load i8*, i8** %sample2
  %sample5 = load i8*, i8** %sample
  %lcs_length_result6 = call i32 @lcs_length(i8* %sample5, i8* %sample24, i32 4, i32 4)
  store i32 %lcs_length_result, i32* %tempResult
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
  store i8* %str, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = icmp ne i8* %4, null
  br i1 %5, label %8, label %6

; <label>:6                                       ; preds = %0
  %7 = load i8*, i8** %2, align 8
  store i8* %7, i8** %1, align 8
  br label %199

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
  %22 = bitcast [3 x i32]* %start to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %22, i8* bitcast ([3 x i32]* @translate.start to i8*), i64 12, i32 4, i1 false)
  %23 = bitcast [3 x i32]* %ending to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %23, i8* bitcast ([3 x i32]* @translate.ending to i8*), i64 12, i32 4, i1 false)
  store i32 0, i32* %i, align 4
  br label %24

; <label>:24                                      ; preds = %107, %20
  %25 = load i32, i32* %i, align 4
  %26 = load i32, i32* %length, align 4
  %27 = sub nsw i32 %26, 2
  %28 = icmp slt i32 %25, %27
  br i1 %28, label %29, label %110

; <label>:29                                      ; preds = %24
  %30 = load i32, i32* %i, align 4
  %31 = sext i32 %30 to i64
  %32 = load i8*, i8** %2, align 8
  %33 = getelementptr inbounds i8, i8* %32, i64 %31
  %34 = load i8, i8* %33, align 1
  %35 = load i32, i32* %i, align 4
  %36 = add nsw i32 %35, 1
  %37 = sext i32 %36 to i64
  %38 = load i8*, i8** %2, align 8
  %39 = getelementptr inbounds i8, i8* %38, i64 %37
  %40 = load i8, i8* %39, align 1
  %41 = load i32, i32* %i, align 4
  %42 = add nsw i32 %41, 2
  %43 = sext i32 %42 to i64
  %44 = load i8*, i8** %2, align 8
  %45 = getelementptr inbounds i8, i8* %44, i64 %43
  %46 = load i8, i8* %45, align 1
  %47 = call i32 @codon_number(i8 signext %34, i8 signext %40, i8 signext %46)
  store i32 %47, i32* %temp, align 4
  %48 = load i32, i32* %temp, align 4
  %49 = icmp eq i32 %48, 14
  br i1 %49, label %53, label %50

; <label>:50                                      ; preds = %29
  %51 = load i32, i32* %temp, align 4
  %52 = icmp eq i32 %51, 46
  br i1 %52, label %53, label %67

; <label>:53                                      ; preds = %50, %29
  %54 = load i32, i32* %i, align 4
  %55 = srem i32 %54, 3
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [3 x i32], [3 x i32]* %start, i64 0, i64 %56
  %58 = load i32, i32* %57, align 4
  %59 = icmp eq i32 %58, -1
  br i1 %59, label %60, label %66

; <label>:60                                      ; preds = %53
  %61 = load i32, i32* %i, align 4
  %62 = load i32, i32* %i, align 4
  %63 = srem i32 %62, 3
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [3 x i32], [3 x i32]* %start, i64 0, i64 %64
  store i32 %61, i32* %65, align 4
  br label %66

; <label>:66                                      ; preds = %60, %53
  br label %67

; <label>:67                                      ; preds = %66, %50
  %68 = load i32, i32* %temp, align 4
  %69 = icmp eq i32 %68, 48
  br i1 %69, label %76, label %70

; <label>:70                                      ; preds = %67
  %71 = load i32, i32* %temp, align 4
  %72 = icmp eq i32 %71, 50
  br i1 %72, label %76, label %73

; <label>:73                                      ; preds = %70
  %74 = load i32, i32* %temp, align 4
  %75 = icmp eq i32 %74, 56
  br i1 %75, label %76, label %106

; <label>:76                                      ; preds = %73, %70, %67
  %77 = load i32, i32* %i, align 4
  %78 = srem i32 %77, 3
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [3 x i32], [3 x i32]* %start, i64 0, i64 %79
  %81 = load i32, i32* %80, align 4
  %82 = icmp ne i32 %81, -1
  br i1 %82, label %83, label %105

; <label>:83                                      ; preds = %76
  %84 = load i32, i32* %i, align 4
  %85 = srem i32 %84, 3
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [3 x i32], [3 x i32]* %ending, i64 0, i64 %86
  %88 = load i32, i32* %87, align 4
  %89 = icmp eq i32 %88, -1
  br i1 %89, label %90, label %104

; <label>:90                                      ; preds = %83
  %91 = load i32, i32* %i, align 4
  %92 = load i32, i32* %i, align 4
  %93 = srem i32 %92, 3
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [3 x i32], [3 x i32]* %start, i64 0, i64 %94
  %96 = load i32, i32* %95, align 4
  %97 = icmp sgt i32 %91, %96
  br i1 %97, label %98, label %104

; <label>:98                                      ; preds = %90
  %99 = load i32, i32* %i, align 4
  %100 = load i32, i32* %i, align 4
  %101 = srem i32 %100, 3
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [3 x i32], [3 x i32]* %ending, i64 0, i64 %102
  store i32 %99, i32* %103, align 4
  br label %104

; <label>:104                                     ; preds = %98, %90, %83
  br label %105

; <label>:105                                     ; preds = %104, %76
  br label %106

; <label>:106                                     ; preds = %105, %73
  br label %107

; <label>:107                                     ; preds = %106
  %108 = load i32, i32* %i, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* %i, align 4
  br label %24

; <label>:110                                     ; preds = %24
  store i32 -1, i32* %temp, align 4
  store i32 0, i32* %i, align 4
  br label %111

; <label>:111                                     ; preds = %129, %110
  %112 = load i32, i32* %i, align 4
  %113 = icmp slt i32 %112, 3
  br i1 %113, label %114, label %132

; <label>:114                                     ; preds = %111
  %115 = load i32, i32* %i, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [3 x i32], [3 x i32]* %start, i64 0, i64 %116
  %118 = load i32, i32* %117, align 4
  %119 = icmp ne i32 %118, -1
  br i1 %119, label %120, label %128

; <label>:120                                     ; preds = %114
  %121 = load i32, i32* %i, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [3 x i32], [3 x i32]* %ending, i64 0, i64 %122
  %124 = load i32, i32* %123, align 4
  %125 = icmp ne i32 %124, -1
  br i1 %125, label %126, label %128

; <label>:126                                     ; preds = %120
  %127 = load i32, i32* %i, align 4
  store i32 %127, i32* %temp, align 4
  br label %132

; <label>:128                                     ; preds = %120, %114
  br label %129

; <label>:129                                     ; preds = %128
  %130 = load i32, i32* %i, align 4
  %131 = add nsw i32 %130, 1
  store i32 %131, i32* %i, align 4
  br label %111

; <label>:132                                     ; preds = %126, %111
  store i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.1, i32 0, i32 0), i8** %retdef, align 8
  %133 = load i32, i32* %temp, align 4
  %134 = icmp eq i32 %133, -1
  br i1 %134, label %135, label %137

; <label>:135                                     ; preds = %132
  %136 = load i8*, i8** %retdef, align 8
  store i8* %136, i8** %1, align 8
  br label %199

; <label>:137                                     ; preds = %132
  %138 = load i32, i32* %i, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [3 x i32], [3 x i32]* %ending, i64 0, i64 %139
  %141 = load i32, i32* %140, align 4
  store i32 %141, i32* %b, align 4
  %142 = load i32, i32* %i, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [3 x i32], [3 x i32]* %start, i64 0, i64 %143
  %145 = load i32, i32* %144, align 4
  store i32 %145, i32* %a, align 4
  %146 = load i32, i32* %b, align 4
  %147 = load i32, i32* %a, align 4
  %148 = sub nsw i32 %146, %147
  %149 = sdiv i32 %148, 2
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

; <label>:156                                     ; preds = %190, %137
  %157 = load i32, i32* %i1, align 4
  %158 = load i32, i32* %b, align 4
  %159 = icmp slt i32 %157, %158
  br i1 %159, label %160, label %193

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
  %183 = load i32, i32* %temp, align 4
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds [64 x i8], [64 x i8]* @codon, i64 0, i64 %184
  %186 = load i8, i8* %185, align 1
  %187 = load i32, i32* %index, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds i8, i8* %154, i64 %188
  store i8 %186, i8* %189, align 1
  br label %190

; <label>:190                                     ; preds = %160
  %191 = load i32, i32* %i1, align 4
  %192 = add nsw i32 %191, 3
  store i32 %192, i32* %i1, align 4
  br label %156

; <label>:193                                     ; preds = %156
  %194 = load i32, i32* %index, align 4
  %195 = add nsw i32 %194, 1
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds i8, i8* %154, i64 %196
  store i8 0, i8* %197, align 1
  store i8* %154, i8** %1, align 8
  %198 = load i8*, i8** %3, align 8
  call void @llvm.stackrestore(i8* %198)
  br label %199

; <label>:199                                     ; preds = %193, %135, %6
  %200 = load i8*, i8** %1, align 8
  ret i8* %200
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i8* @translate2(i8* %str) #0 {
  %1 = alloca i8*, align 8
  store i8* %str, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = call i8* @transcribe(i8* %2)
  %4 = call i8* @translate(i8* %3)
  ret i8* %4
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
  %4 = call %struct._IO_FILE* @fopen(i8* %3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
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

declare %struct._IO_FILE* @fopen(i8*, i8*) #3

declare i32 @fgetc(%struct._IO_FILE*) #3

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
  %4 = call %struct._IO_FILE* @fopen(i8* %3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
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
declare double @pow(double, double) #4

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
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0))
  store i32 %7, i32* %1, align 4
  br label %10

; <label>:8                                       ; preds = %0
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i32 0, i32 0))
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
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0), i32 %26)
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0))
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
  %40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0), i32 %39)
  ret i32 1
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { argmemonly nounwind }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
