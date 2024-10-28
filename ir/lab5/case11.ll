; ModuleID = 'module'
source_filename = "module"

define i32 @func1(i32 %0, i32 %1, i32 %2) {
func1Entry:
  %x = alloca i32, align 4
  store i32 %0, i32* %x, align 4
  %y = alloca i32, align 4
  store i32 %1, i32* %y, align 4
  %z = alloca i32, align 4
  store i32 %2, i32* %z, align 4
  %z1 = load i32, i32* %z, align 4
  %tmp0 = icmp eq i32 %z1, 0
  %tmp1 = zext i1 %tmp0 to i32
  %tmp2 = icmp ne i32 %tmp1, 0
  br i1 %tmp2, label %IF_TRUE, label %IF_FALSE

IF_TRUE:                                          ; preds = %func1Entry
  %x2 = load i32, i32* %x, align 4
  %y3 = load i32, i32* %y, align 4
  %tmp3 = add i32 %x2, %y3
  ret i32 %tmp3
  br label %IF_END

IF_FALSE:                                         ; preds = %func1Entry
  %y4 = load i32, i32* %y, align 4
  %z5 = load i32, i32* %z, align 4
  %tmp4 = icmp sgt i32 %y4, %z5
  %tmp5 = zext i1 %tmp4 to i32
  %tmp6 = icmp ne i32 %tmp5, 0
  br i1 %tmp6, label %IF_TRUE6, label %IF_FALSE7

IF_END:                                           ; preds = %IF_END8, %IF_TRUE
  ret i32 0

IF_TRUE6:                                         ; preds = %IF_FALSE
  %x9 = load i32, i32* %x, align 4
  %y10 = load i32, i32* %y, align 4
  %z11 = load i32, i32* %z, align 4
  %tmp7 = sub i32 %y10, %z11
  %returnValue = call i32 @func1(i32 %x9, i32 %tmp7, i32 0)
  ret i32 %returnValue
  br label %IF_END8

IF_FALSE7:                                        ; preds = %IF_FALSE
  %y12 = load i32, i32* %y, align 4
  %z13 = load i32, i32* %z, align 4
  %tmp8 = add i32 %y12, %z13
  ret i32 %tmp8
  br label %IF_END8

IF_END8:                                          ; preds = %IF_FALSE7, %IF_TRUE6
  br label %IF_END
}

define i32 @func2(i32 %0, i32 %1) {
func2Entry:
  %x = alloca i32, align 4
  store i32 %0, i32* %x, align 4
  %y = alloca i32, align 4
  store i32 %1, i32* %y, align 4
  %y1 = load i32, i32* %y, align 4
  %tmp9 = icmp ne i32 %y1, 0
  br i1 %tmp9, label %IF_TRUE, label %IF_FALSE

IF_TRUE:                                          ; preds = %func2Entry
  %x2 = load i32, i32* %x, align 4
  %y3 = load i32, i32* %y, align 4
  %tmp10 = srem i32 %x2, %y3
  %returnValue = call i32 @func2(i32 %tmp10, i32 0)
  ret i32 %returnValue
  br label %IF_END

IF_FALSE:                                         ; preds = %func2Entry
  %x4 = load i32, i32* %x, align 4
  ret i32 %x4
  br label %IF_END

IF_END:                                           ; preds = %IF_FALSE, %IF_TRUE
  ret i32 0
}

define i32 @func3(i32 %0, i32 %1) {
func3Entry:
  %x = alloca i32, align 4
  store i32 %0, i32* %x, align 4
  %y = alloca i32, align 4
  store i32 %1, i32* %y, align 4
  %y1 = load i32, i32* %y, align 4
  %tmp11 = icmp eq i32 %y1, 0
  %tmp12 = zext i1 %tmp11 to i32
  %tmp13 = icmp ne i32 %tmp12, 0
  br i1 %tmp13, label %IF_TRUE, label %IF_FALSE

IF_TRUE:                                          ; preds = %func3Entry
  %x2 = load i32, i32* %x, align 4
  %tmp14 = add i32 %x2, 1
  ret i32 %tmp14
  br label %IF_END

IF_FALSE:                                         ; preds = %func3Entry
  %x3 = load i32, i32* %x, align 4
  %y4 = load i32, i32* %y, align 4
  %tmp15 = add i32 %x3, %y4
  %returnValue = call i32 @func3(i32 %tmp15, i32 0)
  ret i32 %returnValue
  br label %IF_END

IF_END:                                           ; preds = %IF_FALSE, %IF_TRUE
  ret i32 0
}

define i32 @func4(i32 %0, i32 %1, i32 %2) {
func4Entry:
  %x = alloca i32, align 4
  store i32 %0, i32* %x, align 4
  %y = alloca i32, align 4
  store i32 %1, i32* %y, align 4
  %z = alloca i32, align 4
  store i32 %2, i32* %z, align 4
  %x1 = load i32, i32* %x, align 4
  %tmp16 = icmp ne i32 %x1, 0
  br i1 %tmp16, label %IF_TRUE, label %IF_FALSE

IF_TRUE:                                          ; preds = %func4Entry
  %y2 = load i32, i32* %y, align 4
  ret i32 %y2
  br label %IF_END

IF_FALSE:                                         ; preds = %func4Entry
  %z3 = load i32, i32* %z, align 4
  ret i32 %z3
  br label %IF_END

IF_END:                                           ; preds = %IF_FALSE, %IF_TRUE
  ret i32 0
}

define i32 @func5(i32 %0) {
func5Entry:
  %x = alloca i32, align 4
  store i32 %0, i32* %x, align 4
  %x1 = load i32, i32* %x, align 4
  %tmp17 = icmp slt i32 %x1, 0
  %tmp18 = zext i1 %tmp17 to i32
  %tmp19 = icmp ne i32 %tmp18, 0
  br i1 %tmp19, label %IF_TRUE, label %IF_FALSE

IF_TRUE:                                          ; preds = %func5Entry
  %x2 = load i32, i32* %x, align 4
  %tmp20 = sub i32 0, %x2
  ret i32 %tmp20
  br label %IF_END

IF_FALSE:                                         ; preds = %func5Entry
  br label %IF_END

IF_END:                                           ; preds = %IF_FALSE, %IF_TRUE
  %x3 = load i32, i32* %x, align 4
  ret i32 %x3
  ret i32 0
}

define i32 @func6(i32 %0, i32 %1) {
func6Entry:
  %x = alloca i32, align 4
  store i32 %0, i32* %x, align 4
  %y = alloca i32, align 4
  store i32 %1, i32* %y, align 4
  %x1 = load i32, i32* %x, align 4
  %tmp21 = icmp ne i32 %x1, 0
  %addr = alloca i32, align 4
  br i1 %tmp21, label %AND_TRUE, label %AND_FALSE

AND_FALSE:                                        ; preds = %func6Entry
  store i32 %x1, i32* %addr, align 4
  br label %AND_END

AND_TRUE:                                         ; preds = %func6Entry
  %y2 = load i32, i32* %y, align 4
  store i32 %y2, i32* %addr, align 4
  br label %AND_END

AND_END:                                          ; preds = %AND_FALSE, %AND_TRUE
  %tmp22 = load i32, i32* %addr, align 4
  %tmp23 = icmp ne i32 %tmp22, 0
  %tmp24 = zext i1 %tmp23 to i32
  %tmp25 = icmp ne i32 %tmp24, 0
  br i1 %tmp25, label %IF_TRUE, label %IF_FALSE

IF_TRUE:                                          ; preds = %AND_END
  ret i32 1
  br label %IF_END

IF_FALSE:                                         ; preds = %AND_END
  ret i32 0
  br label %IF_END

IF_END:                                           ; preds = %IF_FALSE, %IF_TRUE
  ret i32 0
}

define i32 @func7(i32 %0) {
func7Entry:
  %x = alloca i32, align 4
  store i32 %0, i32* %x, align 4
  %x1 = load i32, i32* %x, align 4
  %tmp26 = icmp ne i32 0, %x1
  %tmp27 = xor i1 %tmp26, true
  %tmp28 = zext i1 %tmp27 to i32
  %tmp29 = icmp ne i32 %tmp28, 0
  br i1 %tmp29, label %IF_TRUE, label %IF_FALSE

IF_TRUE:                                          ; preds = %func7Entry
  ret i32 1
  br label %IF_END

IF_FALSE:                                         ; preds = %func7Entry
  ret i32 0
  br label %IF_END

IF_END:                                           ; preds = %IF_FALSE, %IF_TRUE
  ret i32 0
}

define i32 @main() {
mainEntry:
  %i1 = alloca i32, align 4
  store i32 1, i32* %i1, align 4
  %i2 = alloca i32, align 4
  store i32 2, i32* %i2, align 4
  %i3 = alloca i32, align 4
  store i32 3, i32* %i3, align 4
  %i4 = alloca i32, align 4
  store i32 4, i32* %i4, align 4
  %v1 = alloca i32, align 4
  store i32 4, i32* %v1, align 4
  %v2 = alloca i32, align 4
  store i32 5, i32* %v2, align 4
  %v3 = alloca i32, align 4
  store i32 6, i32* %v3, align 4
  %v4 = alloca i32, align 4
  store i32 7, i32* %v4, align 4
  %result = alloca i32, align 4
  %i11 = load i32, i32* %i1, align 4
  %returnValue = call i32 @func7(i32 %i11)
  %i22 = load i32, i32* %i2, align 4
  %returnValue3 = call i32 @func7(i32 %i22)
  %returnValue4 = call i32 @func6(i32 %returnValue, i32 %returnValue3)
  %v15 = load i32, i32* %v1, align 4
  %v26 = load i32, i32* %v2, align 4
  %returnValue7 = call i32 @func4(i32 %returnValue4, i32 %v15, i32 %v26)
  %v38 = load i32, i32* %v3, align 4
  %returnValue9 = call i32 @func3(i32 %returnValue7, i32 %v38)
  %v410 = load i32, i32* %v4, align 4
  %returnValue11 = call i32 @func2(i32 %returnValue9, i32 %v410)
  %v112 = load i32, i32* %v1, align 4
  %v213 = load i32, i32* %v2, align 4
  %returnValue14 = call i32 @func3(i32 %v112, i32 %v213)
  %returnValue15 = call i32 @func5(i32 %returnValue14)
  %v316 = load i32, i32* %v3, align 4
  %i417 = load i32, i32* %i4, align 4
  %returnValue18 = call i32 @func2(i32 %v316, i32 %i417)
  %returnValue19 = call i32 @func7(i32 %returnValue18)
  %returnValue20 = call i32 @func1(i32 %returnValue11, i32 %returnValue15, i32 %returnValue19)
  store i32 %returnValue20, i32* %result, align 4
  %result21 = load i32, i32* %result, align 4
  ret i32 %result21
  ret i32 0
}
