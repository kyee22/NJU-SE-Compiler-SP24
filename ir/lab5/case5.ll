; ModuleID = 'module'
source_filename = "module"

@a = global i32 0
@b = global i32 0
@c = global i32 0

define i32 @foo() {
fooEntry:
  %a = load i32, i32* @a, align 4
  %tmp0 = icmp sgt i32 %a, 0
  %tmp1 = zext i1 %tmp0 to i32
  %tmp2 = icmp ne i32 %tmp1, 0
  br i1 %tmp2, label %IF_TRUE, label %IF_FALSE

IF_TRUE:                                          ; preds = %fooEntry
  store i32 1, i32* @c, align 4
  br label %IF_END

IF_FALSE:                                         ; preds = %fooEntry
  br label %IF_END

IF_END:                                           ; preds = %IF_FALSE, %IF_TRUE
  %c = load i32, i32* @c, align 4
  ret i32 %c
}

define i32 @bar() {
barEntry:
  %a = load i32, i32* @a, align 4
  %tmp3 = icmp sgt i32 %a, 0
  %tmp4 = zext i1 %tmp3 to i32
  %tmp5 = icmp ne i32 %tmp4, 0
  br i1 %tmp5, label %IF_TRUE, label %IF_FALSE

IF_TRUE:                                          ; preds = %barEntry
  store i32 1, i32* @c, align 4
  br label %IF_END

IF_FALSE:                                         ; preds = %barEntry
  %b = load i32, i32* @b, align 4
  %tmp6 = icmp sgt i32 %b, 0
  %tmp7 = zext i1 %tmp6 to i32
  %tmp8 = icmp ne i32 %tmp7, 0
  br i1 %tmp8, label %IF_TRUE1, label %IF_FALSE2

IF_END:                                           ; preds = %IF_END3, %IF_TRUE
  %c = load i32, i32* @c, align 4
  ret i32 %c

IF_TRUE1:                                         ; preds = %IF_FALSE
  store i32 2, i32* @c, align 4
  br label %IF_END3

IF_FALSE2:                                        ; preds = %IF_FALSE
  br label %IF_END3

IF_END3:                                          ; preds = %IF_FALSE2, %IF_TRUE1
  br label %IF_END
}

define i32 @main() {
mainEntry:
  %a = load i32, i32* @a, align 4
  %tmp9 = icmp sgt i32 %a, 0
  %tmp10 = zext i1 %tmp9 to i32
  %tmp11 = icmp ne i32 %tmp10, 0
  br i1 %tmp11, label %IF_TRUE, label %IF_FALSE

IF_TRUE:                                          ; preds = %mainEntry
  store i32 1, i32* @c, align 4
  br label %IF_END

IF_FALSE:                                         ; preds = %mainEntry
  %b = load i32, i32* @b, align 4
  %tmp12 = icmp sgt i32 %b, 0
  %tmp13 = zext i1 %tmp12 to i32
  %tmp14 = icmp ne i32 %tmp13, 0
  br i1 %tmp14, label %IF_TRUE1, label %IF_FALSE2

IF_END:                                           ; preds = %IF_END3, %IF_TRUE
  %c = load i32, i32* @c, align 4
  ret i32 %c

IF_TRUE1:                                         ; preds = %IF_FALSE
  store i32 2, i32* @c, align 4
  br label %IF_END3

IF_FALSE2:                                        ; preds = %IF_FALSE
  store i32 3, i32* @c, align 4
  br label %IF_END3

IF_END3:                                          ; preds = %IF_FALSE2, %IF_TRUE1
  br label %IF_END
}
