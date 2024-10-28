; ModuleID = 'module'
source_filename = "module"

define i32 @main() {
mainEntry:
  %a = alloca i32, align 4
  store i32 0, i32* %a, align 4
  %count = alloca i32, align 4
  store i32 0, i32* %count, align 4
  br label %WHILE-BEGIN

WHILE-BEGIN:                                      ; preds = %IF_END, %mainEntry
  %a1 = load i32, i32* %a, align 4
  %tmp0 = icmp sle i32 %a1, 0
  %tmp1 = zext i1 %tmp0 to i32
  %tmp2 = icmp ne i32 %tmp1, 0
  br i1 %tmp2, label %WHILE-BODY, label %WHILE-END

WHILE-BODY:                                       ; preds = %WHILE-BEGIN
  %a2 = load i32, i32* %a, align 4
  %tmp3 = sub i32 %a2, 1
  store i32 %tmp3, i32* %a, align 4
  %count3 = load i32, i32* %count, align 4
  %tmp4 = add i32 %count3, 1
  store i32 %tmp4, i32* %count, align 4
  %a4 = load i32, i32* %a, align 4
  %tmp6 = icmp slt i32 %a4, -20
  %tmp7 = zext i1 %tmp6 to i32
  %tmp8 = icmp ne i32 %tmp7, 0
  br i1 %tmp8, label %IF_TRUE, label %IF_FALSE

WHILE-END:                                        ; preds = %IF_TRUE, %WHILE-BEGIN
  %count5 = load i32, i32* %count, align 4
  ret i32 %count5
  ret i32 0

IF_TRUE:                                          ; preds = %WHILE-BODY
  br label %WHILE-END
  br label %IF_END

IF_FALSE:                                         ; preds = %WHILE-BODY
  br label %IF_END

IF_END:                                           ; preds = %IF_FALSE, %IF_TRUE
  br label %WHILE-BEGIN
}
