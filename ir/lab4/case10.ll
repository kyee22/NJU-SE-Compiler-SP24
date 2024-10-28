; ModuleID = 'module'
source_filename = "module"

@CONST_1 = global i32 10
@CONST_2 = global i32 20
@CONST_3 = global i32 30
@CONST_4 = global i32 40
@globalVar1 = global i32 5
@globalVar2 = global i32 15
@globalVar3 = global i32 25
@globalVar4 = global i32 35
@globalVar5 = global i32 45

define i32 @main() {
mainEntry:
  %localVar1 = alloca i32, align 4
  store i32 2, i32* %localVar1, align 4
  %localVar2 = alloca i32, align 4
  store i32 4, i32* %localVar2, align 4
  %localVar3 = alloca i32, align 4
  store i32 6, i32* %localVar3, align 4
  %localVar4 = alloca i32, align 4
  store i32 8, i32* %localVar4, align 4
  %localVar5 = alloca i32, align 4
  store i32 0, i32* %localVar5, align 4
  %localVar6 = alloca i32, align 4
  store i32 1, i32* %localVar6, align 4
  %localVar7 = alloca i32, align 4
  store i32 0, i32* %localVar7, align 4
  %localVar8 = alloca i32, align 4
  store i32 0, i32* %localVar8, align 4
  %localVar11 = load i32, i32* %localVar1, align 4
  %localVar22 = load i32, i32* %localVar2, align 4
  %tmp0 = add i32 %localVar11, %localVar22
  %localVar33 = load i32, i32* %localVar3, align 4
  %tmp1 = mul i32 %tmp0, %localVar33
  store i32 %tmp1, i32* %localVar5, align 4
  %localVar44 = load i32, i32* %localVar4, align 4
  %localVar55 = load i32, i32* %localVar5, align 4
  %tmp2 = sub i32 %localVar44, %localVar55
  store i32 %tmp2, i32* %localVar6, align 4
  %temp1 = alloca i32, align 4
  %globalVar1 = load i32, i32* @globalVar1, align 4
  %CONST_1 = load i32, i32* @CONST_1, align 4
  %tmp3 = mul i32 %globalVar1, %CONST_1
  store i32 %tmp3, i32* %temp1, align 4
  %temp2 = alloca i32, align 4
  %globalVar2 = load i32, i32* @globalVar2, align 4
  %CONST_2 = load i32, i32* @CONST_2, align 4
  %tmp4 = add i32 %globalVar2, %CONST_2
  store i32 %tmp4, i32* %temp2, align 4
  %temp3 = alloca i32, align 4
  %temp16 = load i32, i32* %temp1, align 4
  %temp27 = load i32, i32* %temp2, align 4
  %tmp5 = sub i32 %temp16, %temp27
  store i32 %tmp5, i32* %temp3, align 4
  %temp38 = load i32, i32* %temp3, align 4
  %localVar69 = load i32, i32* %localVar6, align 4
  %tmp6 = mul i32 %temp38, %localVar69
  store i32 %tmp6, i32* %localVar7, align 4
  %localVar710 = load i32, i32* %localVar7, align 4
  %CONST_3 = load i32, i32* @CONST_3, align 4
  %tmp7 = add i32 %localVar710, %CONST_3
  store i32 %tmp7, i32* %localVar8, align 4
  %intermediateResult1 = alloca i32, align 4
  %globalVar3 = load i32, i32* @globalVar3, align 4
  %localVar511 = load i32, i32* %localVar5, align 4
  %tmp8 = sub i32 %globalVar3, %localVar511
  store i32 %tmp8, i32* %intermediateResult1, align 4
  %intermediateResult2 = alloca i32, align 4
  %intermediateResult112 = load i32, i32* %intermediateResult1, align 4
  %globalVar4 = load i32, i32* @globalVar4, align 4
  %tmp9 = mul i32 %intermediateResult112, %globalVar4
  store i32 %tmp9, i32* %intermediateResult2, align 4
  %intermediateResult3 = alloca i32, align 4
  %intermediateResult213 = load i32, i32* %intermediateResult2, align 4
  %CONST_4 = load i32, i32* @CONST_4, align 4
  %tmp10 = sdiv i32 %intermediateResult213, %CONST_4
  store i32 %tmp10, i32* %intermediateResult3, align 4
  %finalResult = alloca i32, align 4
  %intermediateResult314 = load i32, i32* %intermediateResult3, align 4
  %globalVar5 = load i32, i32* @globalVar5, align 4
  %tmp11 = add i32 %intermediateResult314, %globalVar5
  store i32 %tmp11, i32* %finalResult, align 4
  %finalResult15 = load i32, i32* %finalResult, align 4
  ret i32 %finalResult15
  ret i32 0
}
