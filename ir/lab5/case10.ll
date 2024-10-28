; ModuleID = 'module'
source_filename = "module"

@g = global i32 0

define void @foo() {
fooEntry:
  %g = load i32, i32* @g, align 4
  %tmp0 = icmp sgt i32 %g, 0
  %tmp1 = zext i1 %tmp0 to i32
  %tmp2 = icmp ne i32 %tmp1, 0
  br i1 %tmp2, label %IF_TRUE, label %IF_FALSE

IF_TRUE:                                          ; preds = %fooEntry
  ret void
  br label %IF_END

IF_FALSE:                                         ; preds = %fooEntry
  br label %IF_END

IF_END:                                           ; preds = %IF_FALSE, %IF_TRUE
  ret void
  ret void
}

define i32 @main() {
mainEntry:
  call void @foo()
  %g = load i32, i32* @g, align 4
  ret i32 %g
  ret i32 0
}
