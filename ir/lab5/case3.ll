; ModuleID = 'module'
source_filename = "module"

@gg = global i32 0

define i32 @false() {
falseEntry:
  %gg = load i32, i32* @gg, align 4
  %tmp0 = add i32 %gg, 1
  store i32 %tmp0, i32* @gg, align 4
  ret i32 0
  ret i32 0
}

define i32 @true() {
trueEntry:
  %gg = load i32, i32* @gg, align 4
  %tmp1 = add i32 %gg, 1
  store i32 %tmp1, i32* @gg, align 4
  ret i32 1
  ret i32 0
}

define i32 @main() {
mainEntry:
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %returnValue = call i32 @true()
  %tmp2 = icmp ne i32 %returnValue, 0
  %addr = alloca i32, align 4
  br i1 %tmp2, label %AND_TRUE, label %AND_FALSE

AND_FALSE:                                        ; preds = %mainEntry
  store i32 %returnValue, i32* %addr, align 4
  br label %AND_END

AND_TRUE:                                         ; preds = %mainEntry
  %returnValue1 = call i32 @false()
  store i32 %returnValue1, i32* %addr, align 4
  br label %AND_END

AND_END:                                          ; preds = %AND_FALSE, %AND_TRUE
  %tmp3 = load i32, i32* %addr, align 4
  %tmp4 = icmp ne i32 %tmp3, 0
  %tmp5 = zext i1 %tmp4 to i32
  %tmp6 = icmp ne i32 %tmp5, 0
  br i1 %tmp6, label %IF_TRUE, label %IF_FALSE

IF_TRUE:                                          ; preds = %AND_END
  store i32 1, i32* %x, align 4
  br label %IF_END

IF_FALSE:                                         ; preds = %AND_END
  store i32 2, i32* %x, align 4
  br label %IF_END

IF_END:                                           ; preds = %IF_FALSE, %IF_TRUE
  %returnValue2 = call i32 @false()
  %tmp7 = icmp ne i32 %returnValue2, 0
  %addr3 = alloca i32, align 4
  br i1 %tmp7, label %OR_TRUE, label %OR_FALSE

OR_FALSE:                                         ; preds = %IF_END
  %returnValue4 = call i32 @true()
  store i32 %returnValue4, i32* %addr3, align 4
  br label %OR_END

OR_TRUE:                                          ; preds = %IF_END
  store i32 %returnValue2, i32* %addr3, align 4
  br label %OR_END

OR_END:                                           ; preds = %OR_TRUE, %OR_FALSE
  %tmp8 = load i32, i32* %addr3, align 4
  %tmp9 = icmp ne i32 %tmp8, 0
  %tmp10 = zext i1 %tmp9 to i32
  %tmp11 = icmp ne i32 %tmp10, 0
  br i1 %tmp11, label %IF_TRUE5, label %IF_FALSE6

IF_TRUE5:                                         ; preds = %OR_END
  store i32 1, i32* %y, align 4
  br label %IF_END7

IF_FALSE6:                                        ; preds = %OR_END
  store i32 2, i32* %y, align 4
  br label %IF_END7

IF_END7:                                          ; preds = %IF_FALSE6, %IF_TRUE5
  %x8 = load i32, i32* %x, align 4
  %tmp12 = mul i32 %x8, 100
  %y9 = load i32, i32* %y, align 4
  %tmp13 = mul i32 %y9, 10
  %tmp14 = add i32 %tmp12, %tmp13
  %gg = load i32, i32* @gg, align 4
  %tmp15 = add i32 %tmp14, %gg
  ret i32 %tmp15
  ret i32 0
}
