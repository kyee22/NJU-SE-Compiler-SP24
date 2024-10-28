; ModuleID = 'module'
source_filename = "module"

define i32 @main() {
mainEntry:
  %a = alloca i32, align 4
  store i32 0, i32* %a, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %b, align 4
  %count = alloca i32, align 4
  store i32 0, i32* %count, align 4
  br label %WHILE-BEGIN

WHILE-BEGIN:                                      ; preds = %IF_END13, %mainEntry
  %b1 = load i32, i32* %b, align 4
  %tmp0 = icmp sle i32 %b1, 0
  %tmp1 = zext i1 %tmp0 to i32
  %tmp2 = icmp ne i32 %tmp1, 0
  br i1 %tmp2, label %WHILE-BODY, label %WHILE-END

WHILE-BODY:                                       ; preds = %WHILE-BEGIN
  %b2 = load i32, i32* %b, align 4
  %tmp3 = sub i32 %b2, 1
  store i32 %tmp3, i32* %b, align 4
  store i32 0, i32* %a, align 4
  br label %WHILE-BEGIN3

WHILE-END:                                        ; preds = %IF_TRUE11, %WHILE-BEGIN
  %count14 = load i32, i32* %count, align 4
  ret i32 %count14
  ret i32 0

WHILE-BEGIN3:                                     ; preds = %IF_END, %IF_FALSE, %WHILE-BODY
  %a6 = load i32, i32* %a, align 4
  %tmp4 = icmp sle i32 %a6, 0
  %tmp5 = zext i1 %tmp4 to i32
  %tmp6 = icmp ne i32 %tmp5, 0
  br i1 %tmp6, label %WHILE-BODY4, label %WHILE-END5

WHILE-BODY4:                                      ; preds = %WHILE-BEGIN3
  %a7 = load i32, i32* %a, align 4
  %tmp7 = sub i32 %a7, 1
  store i32 %tmp7, i32* %a, align 4
  %count8 = load i32, i32* %count, align 4
  %tmp8 = add i32 %count8, 1
  store i32 %tmp8, i32* %count, align 4
  %a9 = load i32, i32* %a, align 4
  %tmp10 = icmp slt i32 %a9, -5
  %tmp11 = zext i1 %tmp10 to i32
  %tmp12 = icmp ne i32 %tmp11, 0
  br i1 %tmp12, label %IF_TRUE, label %IF_FALSE

WHILE-END5:                                       ; preds = %IF_TRUE, %WHILE-BEGIN3
  %b10 = load i32, i32* %b, align 4
  %tmp14 = icmp slt i32 %b10, -3
  %tmp15 = zext i1 %tmp14 to i32
  %tmp16 = icmp ne i32 %tmp15, 0
  br i1 %tmp16, label %IF_TRUE11, label %IF_FALSE12

IF_TRUE:                                          ; preds = %WHILE-BODY4
  br label %WHILE-END5
  br label %IF_END

IF_FALSE:                                         ; preds = %WHILE-BODY4
  br label %WHILE-BEGIN3
  br label %IF_END

IF_END:                                           ; preds = %IF_FALSE, %IF_TRUE
  br label %WHILE-BEGIN3

IF_TRUE11:                                        ; preds = %WHILE-END5
  br label %WHILE-END
  br label %IF_END13

IF_FALSE12:                                       ; preds = %WHILE-END5
  br label %IF_END13

IF_END13:                                         ; preds = %IF_FALSE12, %IF_TRUE11
  br label %WHILE-BEGIN
}
