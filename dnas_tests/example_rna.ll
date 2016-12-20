; ModuleID = 'DNAs'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@fmt_int = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt_str = private unnamed_addr constant [3 x i8] c"%s\00"
@fmt_str.1 = private unnamed_addr constant [5 x i8] c"%.3f\00"
@fmt_str.2 = private unnamed_addr constant [3 x i8] c"%c\00"
@context = private unnamed_addr constant [39 x i8] c"The length of the longest subsequence:\00"
@context.3 = private unnamed_addr constant [39 x i8] c"The length of the longest subsequence:\00"
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
@context.16 = private unnamed_addr constant [369 x i8] c"CACGCCCCAGCTCTGCCCTTGCAGAGGCAGAGTAGGGAAGAGCAAGCTGCCCGAGACGCAGGGGAAGGAGGATGAGGGCCCTGGGGATGAGCTGGGGTGAACCAGGCTCCCTTTCCTTTGCAGGTGCGAAGCCCAGCGGTGCAGAGTCCAGCAAAGGTGCAGGTATGAGGATGGACCTGATGGGTTCCTGGACCCTCCCCTCTCACCCTGGTCCCTCAGTCTCATTCCCCCACTCCTGCCACCTCCTGTCTGGCCATCAGGAAGGCCAGCCTGCTCCCCACCTGATCCTCCCAAACCCAGAGCCACCTGATGCCTGCCCCTCTGCTCCACAGCCTTTGTGTCCAAGCAGGAGGGCAGCGAGGTAGTGA\00"
@context.17 = private unnamed_addr constant [239 x i8] c"CACGCCCCAGCTCTGCCCTTGCAGAGGGAGAGGAGGGAAGAGCAAGCTGCCCGAGACGCAGGGGAAGGAGGATGAGGGCCCTGGGGATGAGCTGGGGTGAACCAGGCTCCCTTTCCTTTGCAGGTGCGAAGCCCAGCGGTGCAGAGTCCAGCAAAGGTGCAGGTATGAGGATGGACCTGATGGGTTCCTGGACCCTCCCCTCTCACCCTGGTCCCTCAGTCTCATTCCCCCACTCCTG\00"
@codon = global [64 x i8] c"KDKDTTTTRSRSIIMIQHQHPPPPRRRRLLLLEDEDAAAAGGGGVVVVBYBYSSSSBCWCLFLF", align 16
@.str = private unnamed_addr constant [16 x i8] c"Hello I'm in C\0A\00", align 1
@.str.1 = private unnamed_addr constant [35 x i8] c"No possible translation available.\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"-\00", align 1

declare i32 @printf(i8*, ...)

declare double @db_exp(double, double, ...)

define i32 @lcs_RNA(i8* %A, i8* %B) {
entry:
  %A1 = alloca i8*
  store i8* %A, i8** %A1
  %B2 = alloca i8*
  store i8* %B, i8** %B2
  %sizeA = alloca i32
  %A3 = load i8*, i8** %A1
  %A4 = load i8*, i8** %A1
  %strlength = call i32 (i8*, ...) bitcast (i32 (i8*)* @strlength to i32 (i8*, ...)*)(i8* %A3)
  store i32 %strlength, i32* %sizeA
  %sizeB = alloca i32
  %B5 = load i8*, i8** %B2
  %B6 = load i8*, i8** %B2
  %strlength7 = call i32 (i8*, ...) bitcast (i32 (i8*)* @strlength to i32 (i8*, ...)*)(i8* %B5)
  store i32 %strlength7, i32* %sizeB
  %arr_size = alloca i32
  %sizeA8 = load i32, i32* %sizeA
  %sizeA9 = load i32, i32* %sizeA
  %bop = add i32 %sizeA8, 1
  %sizeB10 = load i32, i32* %sizeB
  %sizeB11 = load i32, i32* %sizeB
  %bop12 = add i32 %sizeB10, 1
  %sizeA13 = load i32, i32* %sizeA
  %sizeA14 = load i32, i32* %sizeA
  %bop15 = add i32 %sizeA13, 1
  %sizeB16 = load i32, i32* %sizeB
  %sizeB17 = load i32, i32* %sizeB
  %bop18 = add i32 %sizeB16, 1
  %bop19 = mul i32 %bop, %bop12
  store i32 %bop19, i32* %arr_size
  %arr_size20 = load i32, i32* %arr_size
  %C = alloca i32, i32 %arr_size20
  %i2 = alloca i32
  store i32 0, i32* %i2
  %i221 = load i32, i32* %i2
  br label %while

while:                                            ; preds = %while_body, %entry
  %i227 = load i32, i32* %i2
  %arr_size28 = load i32, i32* %arr_size
  %i229 = load i32, i32* %i2
  %arr_size30 = load i32, i32* %arr_size
  %bop31 = icmp slt i32 %i227, %arr_size28
  br i1 %bop31, label %while_body, label %merge

while_body:                                       ; preds = %while
  %i222 = load i32, i32* %i2
  %C23 = getelementptr i32, i32* %C, i32 %i222
  store i32 0, i32* %C23
  %i224 = load i32, i32* %i2
  %i225 = load i32, i32* %i2
  %bop26 = add i32 %i224, 1
  store i32 %bop26, i32* %i2
  br label %while

merge:                                            ; preds = %while
  %i = alloca i32
  %sizeA32 = load i32, i32* %sizeA
  store i32 %sizeA32, i32* %i
  %j = alloca i32
  %sizeB33 = load i32, i32* %sizeB
  store i32 %sizeB33, i32* %j
  %sizeA34 = load i32, i32* %sizeA
  store i32 %sizeA34, i32* %i
  br label %while35

while35:                                          ; preds = %merge145, %merge
  %i149 = load i32, i32* %i
  %i150 = load i32, i32* %i
  %bop151 = icmp sge i32 %i149, 0
  br i1 %bop151, label %while_body36, label %merge152

while_body36:                                     ; preds = %while35
  %sizeB37 = load i32, i32* %sizeB
  store i32 %sizeB37, i32* %j
  br label %while38

while38:                                          ; preds = %merge61, %while_body36
  %j142 = load i32, i32* %j
  %j143 = load i32, i32* %j
  %bop144 = icmp sge i32 %j142, 0
  br i1 %bop144, label %while_body39, label %merge145

while_body39:                                     ; preds = %while38
  %i40 = load i32, i32* %i
  %sizeA41 = load i32, i32* %sizeA
  %i42 = load i32, i32* %i
  %sizeA43 = load i32, i32* %sizeA
  %bop44 = icmp eq i32 %i40, %sizeA41
  %j45 = load i32, i32* %j
  %sizeB46 = load i32, i32* %sizeB
  %j47 = load i32, i32* %j
  %sizeB48 = load i32, i32* %sizeB
  %bop49 = icmp eq i32 %j45, %sizeB46
  %i50 = load i32, i32* %i
  %sizeA51 = load i32, i32* %sizeA
  %i52 = load i32, i32* %i
  %sizeA53 = load i32, i32* %sizeA
  %bop54 = icmp eq i32 %i50, %sizeA51
  %j55 = load i32, i32* %j
  %sizeB56 = load i32, i32* %sizeB
  %j57 = load i32, i32* %j
  %sizeB58 = load i32, i32* %sizeB
  %bop59 = icmp eq i32 %j55, %sizeB56
  %bop60 = or i1 %bop44, %bop49
  br i1 %bop60, label %then, label %else

merge61:                                          ; preds = %merge76, %then
  %j139 = load i32, i32* %j
  %j140 = load i32, i32* %j
  %bop141 = sub i32 %j139, 1
  store i32 %bop141, i32* %j
  br label %while38

then:                                             ; preds = %while_body39
  %index = alloca i32
  %sizeB62 = load i32, i32* %sizeB
  %sizeA63 = load i32, i32* %sizeA
  %j64 = load i32, i32* %j
  %i65 = load i32, i32* %i
  %getIndex_result = call i32 @getIndex(i32 %i65, i32 %j64, i32 %sizeA63, i32 %sizeB62)
  store i32 %getIndex_result, i32* %index
  %index66 = load i32, i32* %index
  %C67 = getelementptr i32, i32* %C, i32 %index66
  store i32 0, i32* %C67
  br label %merge61

else:                                             ; preds = %while_body39
  %i68 = load i32, i32* %i
  %getChar = call i8 (i8**, i32, ...) bitcast (i8 (i8**, i32)* @getChar to i8 (i8**, i32, ...)*)(i8** %A1, i32 %i68)
  %j69 = load i32, i32* %j
  %getChar70 = call i8 (i8**, i32, ...) bitcast (i8 (i8**, i32)* @getChar to i8 (i8**, i32, ...)*)(i8** %B2, i32 %j69)
  %i71 = load i32, i32* %i
  %getChar72 = call i8 (i8**, i32, ...) bitcast (i8 (i8**, i32)* @getChar to i8 (i8**, i32, ...)*)(i8** %A1, i32 %i71)
  %j73 = load i32, i32* %j
  %getChar74 = call i8 (i8**, i32, ...) bitcast (i8 (i8**, i32)* @getChar to i8 (i8**, i32, ...)*)(i8** %B2, i32 %j73)
  %bop75 = icmp eq i8 %getChar, %getChar70
  br i1 %bop75, label %then77, label %else107

merge76:                                          ; preds = %else107, %then77
  br label %merge61

then77:                                           ; preds = %else
  %index1 = alloca i32
  %sizeB78 = load i32, i32* %sizeB
  %sizeA79 = load i32, i32* %sizeA
  %j80 = load i32, i32* %j
  %i81 = load i32, i32* %i
  %getIndex_result82 = call i32 @getIndex(i32 %i81, i32 %j80, i32 %sizeA79, i32 %sizeB78)
  store i32 %getIndex_result82, i32* %index1
  %index2 = alloca i32
  %sizeB83 = load i32, i32* %sizeB
  %sizeA84 = load i32, i32* %sizeA
  %j85 = load i32, i32* %j
  %j86 = load i32, i32* %j
  %bop87 = add i32 %j85, 1
  %i88 = load i32, i32* %i
  %i89 = load i32, i32* %i
  %bop90 = add i32 %i88, 1
  %getIndex_result91 = call i32 @getIndex(i32 %bop90, i32 %bop87, i32 %sizeA84, i32 %sizeB83)
  store i32 %getIndex_result91, i32* %index2
  %index292 = load i32, i32* %index2
  %C93 = getelementptr i32, i32* %C, i32 %index292
  %tmp = load i32, i32* %C93
  %index294 = load i32, i32* %index2
  %C95 = getelementptr i32, i32* %C, i32 %index294
  %tmp96 = load i32, i32* %C95
  %bop97 = add i32 1, %tmp
  %index298 = load i32, i32* %index2
  %C99 = getelementptr i32, i32* %C, i32 %index298
  %tmp100 = load i32, i32* %C99
  %index2101 = load i32, i32* %index2
  %C102 = getelementptr i32, i32* %C, i32 %index2101
  %tmp103 = load i32, i32* %C102
  %bop104 = add i32 1, %tmp100
  %index1105 = load i32, i32* %index1
  %C106 = getelementptr i32, i32* %C, i32 %index1105
  store i32 %bop97, i32* %C106
  br label %merge76

else107:                                          ; preds = %else
  %index3 = alloca i32
  %sizeB108 = load i32, i32* %sizeB
  %sizeA109 = load i32, i32* %sizeA
  %j110 = load i32, i32* %j
  %i111 = load i32, i32* %i
  %i112 = load i32, i32* %i
  %bop113 = add i32 %i111, 1
  %getIndex_result114 = call i32 @getIndex(i32 %bop113, i32 %j110, i32 %sizeA109, i32 %sizeB108)
  store i32 %getIndex_result114, i32* %index3
  %index4 = alloca i32
  %sizeB115 = load i32, i32* %sizeB
  %sizeA116 = load i32, i32* %sizeA
  %j117 = load i32, i32* %j
  %j118 = load i32, i32* %j
  %bop119 = add i32 %j117, 1
  %i120 = load i32, i32* %i
  %getIndex_result121 = call i32 @getIndex(i32 %i120, i32 %bop119, i32 %sizeA116, i32 %sizeB115)
  store i32 %getIndex_result121, i32* %index4
  %index5 = alloca i32
  %sizeB122 = load i32, i32* %sizeB
  %sizeA123 = load i32, i32* %sizeA
  %j124 = load i32, i32* %j
  %i125 = load i32, i32* %i
  %getIndex_result126 = call i32 @getIndex(i32 %i125, i32 %j124, i32 %sizeA123, i32 %sizeB122)
  store i32 %getIndex_result126, i32* %index5
  %firstVal = alloca i32
  %index3127 = load i32, i32* %index3
  %C128 = getelementptr i32, i32* %C, i32 %index3127
  %tmp129 = load i32, i32* %C128
  store i32 %tmp129, i32* %firstVal
  %secondVal = alloca i32
  %index4130 = load i32, i32* %index4
  %C131 = getelementptr i32, i32* %C, i32 %index4130
  %tmp132 = load i32, i32* %C131
  store i32 %tmp132, i32* %secondVal
  %max = alloca i32
  %secondVal133 = load i32, i32* %secondVal
  %firstVal134 = load i32, i32* %firstVal
  %getMax_result = call i32 @getMax(i32 %firstVal134, i32 %secondVal133)
  store i32 %getMax_result, i32* %max
  %max135 = load i32, i32* %max
  %max136 = load i32, i32* %max
  %index5137 = load i32, i32* %index5
  %C138 = getelementptr i32, i32* %C, i32 %index5137
  store i32 %max135, i32* %C138
  br label %merge76

merge145:                                         ; preds = %while38
  %i146 = load i32, i32* %i
  %i147 = load i32, i32* %i
  %bop148 = sub i32 %i146, 1
  store i32 %bop148, i32* %i
  br label %while35

merge152:                                         ; preds = %while35
  store i32 0, i32* %i
  store i32 0, i32* %j
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_str.2, i32 0, i32 0), i8 10)
  br label %while153

while153:                                         ; preds = %merge164, %merge152
  %i223 = load i32, i32* %i
  %sizeA224 = load i32, i32* %sizeA
  %i226 = load i32, i32* %i
  %sizeA227 = load i32, i32* %sizeA
  %bop228 = icmp slt i32 %i223, %sizeA224
  %j229 = load i32, i32* %j
  %sizeB230 = load i32, i32* %sizeB
  %j231 = load i32, i32* %j
  %sizeB232 = load i32, i32* %sizeB
  %bop233 = icmp slt i32 %j229, %sizeB230
  %i234 = load i32, i32* %i
  %sizeA235 = load i32, i32* %sizeA
  %i236 = load i32, i32* %i
  %sizeA237 = load i32, i32* %sizeA
  %bop238 = icmp slt i32 %i234, %sizeA235
  %j239 = load i32, i32* %j
  %sizeB240 = load i32, i32* %sizeB
  %j241 = load i32, i32* %j
  %sizeB242 = load i32, i32* %sizeB
  %bop243 = icmp slt i32 %j239, %sizeB240
  %bop244 = and i1 %bop228, %bop233
  br i1 %bop244, label %while_body154, label %merge245

while_body154:                                    ; preds = %while153
  %i155 = load i32, i32* %i
  %getChar156 = call i8 (i8**, i32, ...) bitcast (i8 (i8**, i32)* @getChar to i8 (i8**, i32, ...)*)(i8** %A1, i32 %i155)
  %j157 = load i32, i32* %j
  %getChar158 = call i8 (i8**, i32, ...) bitcast (i8 (i8**, i32)* @getChar to i8 (i8**, i32, ...)*)(i8** %B2, i32 %j157)
  %i159 = load i32, i32* %i
  %getChar160 = call i8 (i8**, i32, ...) bitcast (i8 (i8**, i32)* @getChar to i8 (i8**, i32, ...)*)(i8** %A1, i32 %i159)
  %j161 = load i32, i32* %j
  %getChar162 = call i8 (i8**, i32, ...) bitcast (i8 (i8**, i32)* @getChar to i8 (i8**, i32, ...)*)(i8** %B2, i32 %j161)
  %bop163 = icmp eq i8 %getChar156, %getChar158
  br i1 %bop163, label %then165, label %else174

merge164:                                         ; preds = %merge212, %then165
  br label %while153

then165:                                          ; preds = %while_body154
  %temp = alloca i8
  %i166 = load i32, i32* %i
  %getChar167 = call i8 (i8**, i32, ...) bitcast (i8 (i8**, i32)* @getChar to i8 (i8**, i32, ...)*)(i8** %A1, i32 %i166)
  store i8 %getChar167, i8* %temp
  %i168 = load i32, i32* %i
  %i169 = load i32, i32* %i
  %bop170 = add i32 %i168, 1
  store i32 %bop170, i32* %i
  %j171 = load i32, i32* %j
  %j172 = load i32, i32* %j
  %bop173 = add i32 %j171, 1
  store i32 %bop173, i32* %j
  br label %merge164

else174:                                          ; preds = %while_body154
  %sizeB175 = load i32, i32* %sizeB
  %sizeA176 = load i32, i32* %sizeA
  %j177 = load i32, i32* %j
  %i178 = load i32, i32* %i
  %i179 = load i32, i32* %i
  %bop180 = add i32 %i178, 1
  %getIndex_result181 = call i32 @getIndex(i32 %bop180, i32 %j177, i32 %sizeA176, i32 %sizeB175)
  %C182 = getelementptr i32, i32* %C, i32 %getIndex_result181
  %tmp183 = load i32, i32* %C182
  %sizeB184 = load i32, i32* %sizeB
  %sizeA185 = load i32, i32* %sizeA
  %j186 = load i32, i32* %j
  %j187 = load i32, i32* %j
  %bop188 = add i32 %j186, 1
  %i189 = load i32, i32* %i
  %getIndex_result190 = call i32 @getIndex(i32 %i189, i32 %bop188, i32 %sizeA185, i32 %sizeB184)
  %C191 = getelementptr i32, i32* %C, i32 %getIndex_result190
  %tmp192 = load i32, i32* %C191
  %sizeB193 = load i32, i32* %sizeB
  %sizeA194 = load i32, i32* %sizeA
  %j195 = load i32, i32* %j
  %i196 = load i32, i32* %i
  %i197 = load i32, i32* %i
  %bop198 = add i32 %i196, 1
  %getIndex_result199 = call i32 @getIndex(i32 %bop198, i32 %j195, i32 %sizeA194, i32 %sizeB193)
  %C200 = getelementptr i32, i32* %C, i32 %getIndex_result199
  %tmp201 = load i32, i32* %C200
  %sizeB202 = load i32, i32* %sizeB
  %sizeA203 = load i32, i32* %sizeA
  %j204 = load i32, i32* %j
  %j205 = load i32, i32* %j
  %bop206 = add i32 %j204, 1
  %i207 = load i32, i32* %i
  %getIndex_result208 = call i32 @getIndex(i32 %i207, i32 %bop206, i32 %sizeA203, i32 %sizeB202)
  %C209 = getelementptr i32, i32* %C, i32 %getIndex_result208
  %tmp210 = load i32, i32* %C209
  %bop211 = icmp sge i32 %tmp183, %tmp192
  br i1 %bop211, label %then213, label %else217

merge212:                                         ; preds = %else217, %then213
  br label %merge164

then213:                                          ; preds = %else174
  %i214 = load i32, i32* %i
  %i215 = load i32, i32* %i
  %bop216 = add i32 %i214, 1
  store i32 %bop216, i32* %i
  br label %merge212

else217:                                          ; preds = %else174
  %j218 = load i32, i32* %j
  %j219 = load i32, i32* %j
  %bop220 = add i32 %j218, 1
  store i32 %bop220, i32* %j
  br label %merge212

merge245:                                         ; preds = %while153
  %printf246 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_str, i32 0, i32 0), i8* getelementptr inbounds ([39 x i8], [39 x i8]* @context.3, i32 0, i32 0))
  %printf247 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_str.2, i32 0, i32 0), i8 10)
  %printf248 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_str.2, i32 0, i32 0), i8 9)
  %C249 = getelementptr i32, i32* %C, i32 0
  %tmp250 = load i32, i32* %C249
  %C251 = getelementptr i32, i32* %C, i32 0
  %tmp252 = load i32, i32* %C251
  %printf253 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_int, i32 0, i32 0), i32 %tmp252)
  %printf254 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_str.2, i32 0, i32 0), i8 10)
  %C255 = getelementptr i32, i32* %C, i32 0
  %tmp256 = load i32, i32* %C255
  ret i32 %tmp256
}

define i32 @getIndex(i32 %x, i32 %y, i32 %col, i32 %row) {
entry:
  %x1 = alloca i32
  store i32 %x, i32* %x1
  %y2 = alloca i32
  store i32 %y, i32* %y2
  %col3 = alloca i32
  store i32 %col, i32* %col3
  %row4 = alloca i32
  store i32 %row, i32* %row4
  %row5 = load i32, i32* %row4
  %x6 = load i32, i32* %x1
  %row7 = load i32, i32* %row4
  %x8 = load i32, i32* %x1
  %bop = mul i32 %row5, %x6
  %y9 = load i32, i32* %y2
  %row10 = load i32, i32* %row4
  %x11 = load i32, i32* %x1
  %row12 = load i32, i32* %row4
  %x13 = load i32, i32* %x1
  %bop14 = mul i32 %row10, %x11
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
  %result9 = load i32, i32* %result
  ret i32 %result9

then:                                             ; preds = %entry
  %x7 = load i32, i32* %x1
  store i32 %x7, i32* %result
  br label %merge

else:                                             ; preds = %entry
  %y8 = load i32, i32* %y2
  store i32 %y8, i32* %result
  br label %merge
}

define i32 @main() {
entry:
  %d1 = alloca i8*
  store i8* getelementptr inbounds ([369 x i8], [369 x i8]* @context.16, i32 0, i32 0), i8** %d1
  %p1 = alloca i8*
  %d11 = load i8*, i8** %d1
  %d12 = load i8*, i8** %d1
  %transcribe = call i8* (i8*, ...) bitcast (i8* (i8*)* @transcribe to i8* (i8*, ...)*)(i8* %d12)
  store i8* %transcribe, i8** %p1
  %p13 = load i8*, i8** %p1
  %p14 = load i8*, i8** %p1
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_str.13, i32 0, i32 0), i8* %p14)
  %printf5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_str.15, i32 0, i32 0), i8 10)
  %printf6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_str.15, i32 0, i32 0), i8 10)
  %d2 = alloca i8*
  store i8* getelementptr inbounds ([239 x i8], [239 x i8]* @context.17, i32 0, i32 0), i8** %d2
  %p2 = alloca i8*
  %d27 = load i8*, i8** %d2
  %d28 = load i8*, i8** %d2
  %transcribe9 = call i8* (i8*, ...) bitcast (i8* (i8*)* @transcribe to i8* (i8*, ...)*)(i8* %d28)
  store i8* %transcribe9, i8** %p2
  %p210 = load i8*, i8** %p2
  %p211 = load i8*, i8** %p2
  %printf12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_str.13, i32 0, i32 0), i8* %p211)
  %printf13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt_str.15, i32 0, i32 0), i8 10)
  %res = alloca i32
  %p214 = load i8*, i8** %p2
  %p115 = load i8*, i8** %p1
  %lcs_RNA_result = call i32 @lcs_RNA(i8* %p115, i8* %p214)
  store i32 %lcs_RNA_result, i32* %res
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
  br label %99

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

; <label>:26                                      ; preds = %91, %20
  %27 = load i32, i32* %i1, align 4
  %28 = load i32, i32* %length, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %94

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
  %42 = icmp eq i32 %41, 97
  br i1 %42, label %43, label %47

; <label>:43                                      ; preds = %39, %30
  %44 = load i32, i32* %i1, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8, i8* %25, i64 %45
  store i8 84, i8* %46, align 1
  br label %90

; <label>:47                                      ; preds = %39
  %48 = load i8, i8* %curr, align 1
  %49 = sext i8 %48 to i32
  %50 = icmp eq i32 %49, 84
  br i1 %50, label %55, label %51

; <label>:51                                      ; preds = %47
  %52 = load i8, i8* %curr, align 1
  %53 = sext i8 %52 to i32
  %54 = icmp eq i32 %53, 116
  br i1 %54, label %55, label %59

; <label>:55                                      ; preds = %51, %47
  %56 = load i32, i32* %i1, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8, i8* %25, i64 %57
  store i8 65, i8* %58, align 1
  br label %89

; <label>:59                                      ; preds = %51
  %60 = load i8, i8* %curr, align 1
  %61 = sext i8 %60 to i32
  %62 = icmp eq i32 %61, 71
  br i1 %62, label %67, label %63

; <label>:63                                      ; preds = %59
  %64 = load i8, i8* %curr, align 1
  %65 = sext i8 %64 to i32
  %66 = icmp eq i32 %65, 103
  br i1 %66, label %67, label %71

; <label>:67                                      ; preds = %63, %59
  %68 = load i32, i32* %i1, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8* %25, i64 %69
  store i8 67, i8* %70, align 1
  br label %88

; <label>:71                                      ; preds = %63
  %72 = load i8, i8* %curr, align 1
  %73 = sext i8 %72 to i32
  %74 = icmp eq i32 %73, 67
  br i1 %74, label %79, label %75

; <label>:75                                      ; preds = %71
  %76 = load i8, i8* %curr, align 1
  %77 = sext i8 %76 to i32
  %78 = icmp eq i32 %77, 99
  br i1 %78, label %79, label %83

; <label>:79                                      ; preds = %75, %71
  %80 = load i32, i32* %i1, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i8, i8* %25, i64 %81
  store i8 71, i8* %82, align 1
  br label %87

; <label>:83                                      ; preds = %75
  %84 = load i32, i32* %i1, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i8, i8* %25, i64 %85
  store i8 71, i8* %86, align 1
  br label %87

; <label>:87                                      ; preds = %83, %79
  br label %88

; <label>:88                                      ; preds = %87, %67
  br label %89

; <label>:89                                      ; preds = %88, %55
  br label %90

; <label>:90                                      ; preds = %89, %43
  br label %91

; <label>:91                                      ; preds = %90
  %92 = load i32, i32* %i1, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %i1, align 4
  br label %26

; <label>:94                                      ; preds = %26
  %95 = load i32, i32* %length, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i8, i8* %25, i64 %96
  store i8 0, i8* %97, align 1
  store i8* %25, i8** %1, align 8
  %98 = load i8*, i8** %3, align 8
  call void @llvm.stackrestore(i8* %98)
  br label %99

; <label>:99                                      ; preds = %94, %6
  %100 = load i8*, i8** %1, align 8
  ret i8* %100
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
  %retstr = alloca i8*, align 8
  %curr = alloca i8, align 1
  store i8* %str, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = icmp ne i8* %3, null
  br i1 %4, label %7, label %5

; <label>:5                                       ; preds = %0
  %6 = load i8*, i8** %2, align 8
  store i8* %6, i8** %1, align 8
  br label %98

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
  %23 = call noalias i8* @malloc(i64 %22) #1
  store i8* %23, i8** %retstr, align 8
  store i32 0, i32* %i, align 4
  br label %24

; <label>:24                                      ; preds = %89, %19
  %25 = load i32, i32* %i, align 4
  %26 = load i32, i32* %length, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %92

; <label>:28                                      ; preds = %24
  %29 = load i32, i32* %i, align 4
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
  %40 = icmp eq i32 %39, 97
  br i1 %40, label %41, label %46

; <label>:41                                      ; preds = %37, %28
  %42 = load i32, i32* %i, align 4
  %43 = sext i32 %42 to i64
  %44 = load i8*, i8** %retstr, align 8
  %45 = getelementptr inbounds i8, i8* %44, i64 %43
  store i8 85, i8* %45, align 1
  br label %88

; <label>:46                                      ; preds = %37
  %47 = load i8, i8* %curr, align 1
  %48 = sext i8 %47 to i32
  %49 = icmp eq i32 %48, 84
  br i1 %49, label %54, label %50

; <label>:50                                      ; preds = %46
  %51 = load i8, i8* %curr, align 1
  %52 = sext i8 %51 to i32
  %53 = icmp eq i32 %52, 116
  br i1 %53, label %54, label %59

; <label>:54                                      ; preds = %50, %46
  %55 = load i32, i32* %i, align 4
  %56 = sext i32 %55 to i64
  %57 = load i8*, i8** %retstr, align 8
  %58 = getelementptr inbounds i8, i8* %57, i64 %56
  store i8 65, i8* %58, align 1
  br label %87

; <label>:59                                      ; preds = %50
  %60 = load i8, i8* %curr, align 1
  %61 = sext i8 %60 to i32
  %62 = icmp eq i32 %61, 71
  br i1 %62, label %67, label %63

; <label>:63                                      ; preds = %59
  %64 = load i8, i8* %curr, align 1
  %65 = sext i8 %64 to i32
  %66 = icmp eq i32 %65, 103
  br i1 %66, label %67, label %72

; <label>:67                                      ; preds = %63, %59
  %68 = load i32, i32* %i, align 4
  %69 = sext i32 %68 to i64
  %70 = load i8*, i8** %retstr, align 8
  %71 = getelementptr inbounds i8, i8* %70, i64 %69
  store i8 67, i8* %71, align 1
  br label %86

; <label>:72                                      ; preds = %63
  %73 = load i8, i8* %curr, align 1
  %74 = sext i8 %73 to i32
  %75 = icmp eq i32 %74, 67
  br i1 %75, label %80, label %76

; <label>:76                                      ; preds = %72
  %77 = load i8, i8* %curr, align 1
  %78 = sext i8 %77 to i32
  %79 = icmp eq i32 %78, 99
  br i1 %79, label %80, label %85

; <label>:80                                      ; preds = %76, %72
  %81 = load i32, i32* %i, align 4
  %82 = sext i32 %81 to i64
  %83 = load i8*, i8** %retstr, align 8
  %84 = getelementptr inbounds i8, i8* %83, i64 %82
  store i8 71, i8* %84, align 1
  br label %85

; <label>:85                                      ; preds = %80, %76
  br label %86

; <label>:86                                      ; preds = %85, %67
  br label %87

; <label>:87                                      ; preds = %86, %54
  br label %88

; <label>:88                                      ; preds = %87, %41
  br label %89

; <label>:89                                      ; preds = %88
  %90 = load i32, i32* %i, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %i, align 4
  br label %24

; <label>:92                                      ; preds = %24
  %93 = load i32, i32* %length, align 4
  %94 = sext i32 %93 to i64
  %95 = load i8*, i8** %retstr, align 8
  %96 = getelementptr inbounds i8, i8* %95, i64 %94
  store i8 0, i8* %96, align 1
  %97 = load i8*, i8** %retstr, align 8
  store i8* %97, i8** %1, align 8
  br label %98

; <label>:98                                      ; preds = %92, %5
  %99 = load i8*, i8** %1, align 8
  ret i8* %99
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

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
  %ret = alloca i32, align 4
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
  store i32 %13, i32* %ret, align 4
  %14 = load i32, i32* %ret, align 4
  ret i32 %14
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
  %retstr = alloca i8*, align 8
  %index = alloca i32, align 4
  %i1 = alloca i32, align 4
  %length2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %curr = alloca i32, align 4
  %i2 = alloca i32, align 4
  store i8* %str, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = icmp ne i8* %4, null
  br i1 %5, label %8, label %6

; <label>:6                                       ; preds = %0
  %7 = load i8*, i8** %2, align 8
  store i8* %7, i8** %1, align 8
  br label %261

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
  %142 = load i32, i32* %i, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [3 x i32], [3 x i32]* %start, i64 0, i64 %143
  %145 = load i32, i32* %144, align 4
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
  br label %261

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
  %183 = sext i32 %182 to i64
  %184 = call noalias i8* @malloc(i64 %183) #1
  store i8* %184, i8** %retstr, align 8
  %185 = load i32, i32* %a, align 4
  store i32 %185, i32* %i1, align 4
  br label %186

; <label>:186                                     ; preds = %221, %168
  %187 = load i32, i32* %i1, align 4
  %188 = load i32, i32* %b, align 4
  %189 = icmp slt i32 %187, %188
  br i1 %189, label %190, label %224

; <label>:190                                     ; preds = %186
  %191 = load i32, i32* %i1, align 4
  %192 = sext i32 %191 to i64
  %193 = load i8*, i8** %2, align 8
  %194 = getelementptr inbounds i8, i8* %193, i64 %192
  %195 = load i8, i8* %194, align 1
  %196 = load i32, i32* %i1, align 4
  %197 = add nsw i32 %196, 1
  %198 = sext i32 %197 to i64
  %199 = load i8*, i8** %2, align 8
  %200 = getelementptr inbounds i8, i8* %199, i64 %198
  %201 = load i8, i8* %200, align 1
  %202 = load i32, i32* %i1, align 4
  %203 = add nsw i32 %202, 2
  %204 = sext i32 %203 to i64
  %205 = load i8*, i8** %2, align 8
  %206 = getelementptr inbounds i8, i8* %205, i64 %204
  %207 = load i8, i8* %206, align 1
  %208 = call i32 @codon_number(i8 signext %195, i8 signext %201, i8 signext %207)
  store i32 %208, i32* %temp, align 4
  %209 = load i32, i32* %i1, align 4
  %210 = load i32, i32* %a, align 4
  %211 = sub nsw i32 %209, %210
  %212 = sdiv i32 %211, 3
  store i32 %212, i32* %index, align 4
  %213 = load i32, i32* %temp, align 4
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds [64 x i8], [64 x i8]* @codon, i64 0, i64 %214
  %216 = load i8, i8* %215, align 1
  %217 = load i32, i32* %index, align 4
  %218 = sext i32 %217 to i64
  %219 = load i8*, i8** %retstr, align 8
  %220 = getelementptr inbounds i8, i8* %219, i64 %218
  store i8 %216, i8* %220, align 1
  br label %221

; <label>:221                                     ; preds = %190
  %222 = load i32, i32* %i1, align 4
  %223 = add nsw i32 %222, 3
  store i32 %223, i32* %i1, align 4
  br label %186

; <label>:224                                     ; preds = %186
  %225 = load i32, i32* %ret_size, align 4
  %226 = sub nsw i32 %225, 1
  %227 = sext i32 %226 to i64
  %228 = load i8*, i8** %retstr, align 8
  %229 = getelementptr inbounds i8, i8* %228, i64 %227
  store i8 0, i8* %229, align 1
  %230 = load i32, i32* %ret_size, align 4
  %231 = sub nsw i32 %230, 1
  store i32 %231, i32* %length2, align 4
  %232 = load i32, i32* %length2, align 4
  %233 = zext i32 %232 to i64
  %234 = call i8* @llvm.stacksave()
  store i8* %234, i8** %3, align 8
  %235 = alloca i8, i64 %233, align 16
  store i32 0, i32* %i2, align 4
  br label %236

; <label>:236                                     ; preds = %252, %224
  %237 = load i32, i32* %i2, align 4
  %238 = load i32, i32* %length2, align 4
  %239 = icmp slt i32 %237, %238
  br i1 %239, label %240, label %255

; <label>:240                                     ; preds = %236
  %241 = load i32, i32* %i2, align 4
  %242 = sext i32 %241 to i64
  %243 = load i8*, i8** %retstr, align 8
  %244 = getelementptr inbounds i8, i8* %243, i64 %242
  %245 = load i8, i8* %244, align 1
  %246 = sext i8 %245 to i32
  store i32 %246, i32* %curr, align 4
  %247 = load i32, i32* %curr, align 4
  %248 = trunc i32 %247 to i8
  %249 = load i32, i32* %i2, align 4
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds i8, i8* %235, i64 %250
  store i8 %248, i8* %251, align 1
  br label %252

; <label>:252                                     ; preds = %240
  %253 = load i32, i32* %i2, align 4
  %254 = add nsw i32 %253, 1
  store i32 %254, i32* %i2, align 4
  br label %236

; <label>:255                                     ; preds = %236
  %256 = load i32, i32* %length2, align 4
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds i8, i8* %235, i64 %257
  store i8 0, i8* %258, align 1
  %259 = load i8*, i8** %retstr, align 8
  store i8* %259, i8** %1, align 8
  %260 = load i8*, i8** %3, align 8
  call void @llvm.stackrestore(i8* %260)
  br label %261

; <label>:261                                     ; preds = %255, %166, %6
  %262 = load i8*, i8** %1, align 8
  ret i8* %262
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
declare double @pow(double, double) #2

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

; Function Attrs: nounwind uwtable
define zeroext i1 @testValid(i8* %input, i8 signext %type) #0 {
  %1 = alloca i1, align 1
  %2 = alloca i8*, align 8
  %3 = alloca i8, align 1
  %size = alloca i32, align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %i2 = alloca i32, align 4
  store i8* %input, i8** %2, align 8
  store i8 %type, i8* %3, align 1
  store i32 0, i32* %size, align 4
  br label %4

; <label>:4                                       ; preds = %12, %0
  %5 = load i32, i32* %size, align 4
  %6 = sext i32 %5 to i64
  %7 = load i8*, i8** %2, align 8
  %8 = getelementptr inbounds i8, i8* %7, i64 %6
  %9 = load i8, i8* %8, align 1
  %10 = sext i8 %9 to i32
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %15

; <label>:12                                      ; preds = %4
  %13 = load i32, i32* %size, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %size, align 4
  br label %4

; <label>:15                                      ; preds = %4
  %16 = load i8, i8* %3, align 1
  %17 = sext i8 %16 to i32
  %18 = icmp eq i32 %17, 100
  br i1 %18, label %19, label %94

; <label>:19                                      ; preds = %15
  store i32 0, i32* %i, align 4
  br label %20

; <label>:20                                      ; preds = %90, %19
  %21 = load i32, i32* %i, align 4
  %22 = load i32, i32* %size, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %93

; <label>:24                                      ; preds = %20
  %25 = load i32, i32* %i, align 4
  %26 = sext i32 %25 to i64
  %27 = load i8*, i8** %2, align 8
  %28 = getelementptr inbounds i8, i8* %27, i64 %26
  %29 = load i8, i8* %28, align 1
  %30 = sext i8 %29 to i32
  %31 = icmp ne i32 %30, 97
  br i1 %31, label %32, label %89

; <label>:32                                      ; preds = %24
  %33 = load i32, i32* %i, align 4
  %34 = sext i32 %33 to i64
  %35 = load i8*, i8** %2, align 8
  %36 = getelementptr inbounds i8, i8* %35, i64 %34
  %37 = load i8, i8* %36, align 1
  %38 = sext i8 %37 to i32
  %39 = icmp ne i32 %38, 116
  br i1 %39, label %40, label %89

; <label>:40                                      ; preds = %32
  %41 = load i32, i32* %i, align 4
  %42 = sext i32 %41 to i64
  %43 = load i8*, i8** %2, align 8
  %44 = getelementptr inbounds i8, i8* %43, i64 %42
  %45 = load i8, i8* %44, align 1
  %46 = sext i8 %45 to i32
  %47 = icmp ne i32 %46, 103
  br i1 %47, label %48, label %89

; <label>:48                                      ; preds = %40
  %49 = load i32, i32* %i, align 4
  %50 = sext i32 %49 to i64
  %51 = load i8*, i8** %2, align 8
  %52 = getelementptr inbounds i8, i8* %51, i64 %50
  %53 = load i8, i8* %52, align 1
  %54 = sext i8 %53 to i32
  %55 = icmp ne i32 %54, 99
  br i1 %55, label %56, label %89

; <label>:56                                      ; preds = %48
  %57 = load i32, i32* %i, align 4
  %58 = sext i32 %57 to i64
  %59 = load i8*, i8** %2, align 8
  %60 = getelementptr inbounds i8, i8* %59, i64 %58
  %61 = load i8, i8* %60, align 1
  %62 = sext i8 %61 to i32
  %63 = icmp ne i32 %62, 65
  br i1 %63, label %64, label %89

; <label>:64                                      ; preds = %56
  %65 = load i32, i32* %i, align 4
  %66 = sext i32 %65 to i64
  %67 = load i8*, i8** %2, align 8
  %68 = getelementptr inbounds i8, i8* %67, i64 %66
  %69 = load i8, i8* %68, align 1
  %70 = sext i8 %69 to i32
  %71 = icmp ne i32 %70, 84
  br i1 %71, label %72, label %89

; <label>:72                                      ; preds = %64
  %73 = load i32, i32* %i, align 4
  %74 = sext i32 %73 to i64
  %75 = load i8*, i8** %2, align 8
  %76 = getelementptr inbounds i8, i8* %75, i64 %74
  %77 = load i8, i8* %76, align 1
  %78 = sext i8 %77 to i32
  %79 = icmp ne i32 %78, 71
  br i1 %79, label %80, label %89

; <label>:80                                      ; preds = %72
  %81 = load i32, i32* %i, align 4
  %82 = sext i32 %81 to i64
  %83 = load i8*, i8** %2, align 8
  %84 = getelementptr inbounds i8, i8* %83, i64 %82
  %85 = load i8, i8* %84, align 1
  %86 = sext i8 %85 to i32
  %87 = icmp ne i32 %86, 67
  br i1 %87, label %88, label %89

; <label>:88                                      ; preds = %80
  store i1 false, i1* %1, align 1
  br label %188

; <label>:89                                      ; preds = %80, %72, %64, %56, %48, %40, %32, %24
  br label %90

; <label>:90                                      ; preds = %89
  %91 = load i32, i32* %i, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* %i, align 4
  br label %20

; <label>:93                                      ; preds = %20
  br label %94

; <label>:94                                      ; preds = %93, %15
  %95 = load i8, i8* %3, align 1
  %96 = sext i8 %95 to i32
  %97 = icmp eq i32 %96, 114
  br i1 %97, label %98, label %173

; <label>:98                                      ; preds = %94
  store i32 0, i32* %i1, align 4
  br label %99

; <label>:99                                      ; preds = %169, %98
  %100 = load i32, i32* %i1, align 4
  %101 = load i32, i32* %size, align 4
  %102 = icmp slt i32 %100, %101
  br i1 %102, label %103, label %172

; <label>:103                                     ; preds = %99
  %104 = load i32, i32* %i1, align 4
  %105 = sext i32 %104 to i64
  %106 = load i8*, i8** %2, align 8
  %107 = getelementptr inbounds i8, i8* %106, i64 %105
  %108 = load i8, i8* %107, align 1
  %109 = sext i8 %108 to i32
  %110 = icmp ne i32 %109, 97
  br i1 %110, label %111, label %168

; <label>:111                                     ; preds = %103
  %112 = load i32, i32* %i1, align 4
  %113 = sext i32 %112 to i64
  %114 = load i8*, i8** %2, align 8
  %115 = getelementptr inbounds i8, i8* %114, i64 %113
  %116 = load i8, i8* %115, align 1
  %117 = sext i8 %116 to i32
  %118 = icmp ne i32 %117, 117
  br i1 %118, label %119, label %168

; <label>:119                                     ; preds = %111
  %120 = load i32, i32* %i1, align 4
  %121 = sext i32 %120 to i64
  %122 = load i8*, i8** %2, align 8
  %123 = getelementptr inbounds i8, i8* %122, i64 %121
  %124 = load i8, i8* %123, align 1
  %125 = sext i8 %124 to i32
  %126 = icmp ne i32 %125, 103
  br i1 %126, label %127, label %168

; <label>:127                                     ; preds = %119
  %128 = load i32, i32* %i1, align 4
  %129 = sext i32 %128 to i64
  %130 = load i8*, i8** %2, align 8
  %131 = getelementptr inbounds i8, i8* %130, i64 %129
  %132 = load i8, i8* %131, align 1
  %133 = sext i8 %132 to i32
  %134 = icmp ne i32 %133, 99
  br i1 %134, label %135, label %168

; <label>:135                                     ; preds = %127
  %136 = load i32, i32* %i1, align 4
  %137 = sext i32 %136 to i64
  %138 = load i8*, i8** %2, align 8
  %139 = getelementptr inbounds i8, i8* %138, i64 %137
  %140 = load i8, i8* %139, align 1
  %141 = sext i8 %140 to i32
  %142 = icmp ne i32 %141, 65
  br i1 %142, label %143, label %168

; <label>:143                                     ; preds = %135
  %144 = load i32, i32* %i1, align 4
  %145 = sext i32 %144 to i64
  %146 = load i8*, i8** %2, align 8
  %147 = getelementptr inbounds i8, i8* %146, i64 %145
  %148 = load i8, i8* %147, align 1
  %149 = sext i8 %148 to i32
  %150 = icmp ne i32 %149, 85
  br i1 %150, label %151, label %168

; <label>:151                                     ; preds = %143
  %152 = load i32, i32* %i1, align 4
  %153 = sext i32 %152 to i64
  %154 = load i8*, i8** %2, align 8
  %155 = getelementptr inbounds i8, i8* %154, i64 %153
  %156 = load i8, i8* %155, align 1
  %157 = sext i8 %156 to i32
  %158 = icmp ne i32 %157, 71
  br i1 %158, label %159, label %168

; <label>:159                                     ; preds = %151
  %160 = load i32, i32* %i1, align 4
  %161 = sext i32 %160 to i64
  %162 = load i8*, i8** %2, align 8
  %163 = getelementptr inbounds i8, i8* %162, i64 %161
  %164 = load i8, i8* %163, align 1
  %165 = sext i8 %164 to i32
  %166 = icmp ne i32 %165, 67
  br i1 %166, label %167, label %168

; <label>:167                                     ; preds = %159
  store i1 false, i1* %1, align 1
  br label %188

; <label>:168                                     ; preds = %159, %151, %143, %135, %127, %119, %111, %103
  br label %169

; <label>:169                                     ; preds = %168
  %170 = load i32, i32* %i1, align 4
  %171 = add nsw i32 %170, 1
  store i32 %171, i32* %i1, align 4
  br label %99

; <label>:172                                     ; preds = %99
  br label %173

; <label>:173                                     ; preds = %172, %94
  %174 = load i8, i8* %3, align 1
  %175 = sext i8 %174 to i32
  %176 = icmp eq i32 %175, 112
  br i1 %176, label %177, label %187

; <label>:177                                     ; preds = %173
  store i32 0, i32* %i2, align 4
  br label %178

; <label>:178                                     ; preds = %183, %177
  %179 = load i32, i32* %i2, align 4
  %180 = load i32, i32* %size, align 4
  %181 = icmp slt i32 %179, %180
  br i1 %181, label %182, label %186

; <label>:182                                     ; preds = %178
  br label %183

; <label>:183                                     ; preds = %182
  %184 = load i32, i32* %i2, align 4
  %185 = add nsw i32 %184, 1
  store i32 %185, i32* %i2, align 4
  br label %178

; <label>:186                                     ; preds = %178
  br label %187

; <label>:187                                     ; preds = %186, %173
  store i1 true, i1* %1, align 1
  br label %188

; <label>:188                                     ; preds = %187, %167, %88
  %189 = load i1, i1* %1, align 1
  ret i1 %189
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
