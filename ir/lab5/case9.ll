; ModuleID = 'module'
source_filename = "module"

@g = global i32 1

define void @foo() {
fooEntry:
  %g = load i32, i32* @g, align 4
  %tmp0 = icmp sgt i32 %g, 0
  %tmp1 = zext i1 %tmp0 to i32
  %tmp2 = icmp ne i32 %tmp1, 0
  br i1 %tmp2, label %IF_TRUE, label %IF_FALSE

IF_TRUE:                                          ; preds = %fooEntry
  %g1 = load i32, i32* @g, align 4
  %tmp3 = add i32 %g1, 1
  store i32 %tmp3, i32* @g, align 4
  br label %IF_END

IF_FALSE:                                         ; preds = %fooEntry
  br label %IF_END

IF_END:                                           ; preds = %IF_FALSE, %IF_TRUE
  ret void
}

define void @t() {
tEntry:
  %g = load i32, i32* @g, align 4
  %tmp4 = add i32 %g, 1
  store i32 %tmp4, i32* @g, align 4
  ret void
  ret void
}

define i32 @bar() {
barEntry:
  %g = load i32, i32* @g, align 4
  %tmp5 = icmp sgt i32 %g, 0
  %tmp6 = zext i1 %tmp5 to i32
  %tmp7 = icmp ne i32 %tmp6, 0
  br i1 %tmp7, label %IF_TRUE, label %IF_FALSE

IF_TRUE:                                          ; preds = %barEntry
  %g1 = load i32, i32* @g, align 4
  %tmp8 = add i32 %g1, 1
  store i32 %tmp8, i32* @g, align 4
  br label %IF_END

IF_FALSE:                                         ; preds = %barEntry
  br label %IF_END

IF_END:                                           ; preds = %IF_FALSE, %IF_TRUE
  %g2 = load i32, i32* @g, align 4
  ret i32 %g2
  ret i32 0
}

define i32 @main() {
mainEntry:
  call void @foo()
  call void @t()
  %returnValue = call i32 @bar()
  ret i32 %returnValue
  ret i32 0
}
