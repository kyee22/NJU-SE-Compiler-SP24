; ModuleID = 'module'
source_filename = "module"

define i32 @main() {
mainEntry:
  %num = alloca i32, align 4
  store i32 2, i32* %num, align 4
  %num1 = load i32, i32* %num, align 4
  %tmp0 = icmp ne i32 %num1, 0
  br i1 %tmp0, label %IF_TRUE, label %IF_FALSE

IF_TRUE:                                          ; preds = %mainEntry
  %num2 = load i32, i32* %num, align 4
  ret i32 %num2
  br label %IF_END

IF_FALSE:                                         ; preds = %mainEntry
  br label %IF_END

IF_END:                                           ; preds = %IF_FALSE, %IF_TRUE
  %num3 = load i32, i32* %num, align 4
  %tmp1 = sub i32 0, %num3
  ret i32 %tmp1
}
