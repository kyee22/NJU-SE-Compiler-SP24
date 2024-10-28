; ModuleID = 'module'
source_filename = "module"

@a = global i32 10

define i32 @main() {
mainEntry:
  %a = load i32, i32* @a, align 4
  %tmp0 = icmp ne i32 %a, 10
  %tmp1 = zext i1 %tmp0 to i32
  %tmp2 = icmp ne i32 %tmp1, 0
  br i1 %tmp2, label %IF_TRUE, label %IF_FALSE

IF_TRUE:                                          ; preds = %mainEntry
  store i32 2, i32* @a, align 4
  br label %IF_END

IF_FALSE:                                         ; preds = %mainEntry
  store i32 20, i32* @a, align 4
  br label %IF_END

IF_END:                                           ; preds = %IF_FALSE, %IF_TRUE
  %a1 = load i32, i32* @a, align 4
  ret i32 %a1
}
