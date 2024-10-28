; ModuleID = 'module'
source_filename = "module"

@A = global i32 5
@B = global i32 10
@C = global i32 15
@D = global i32 20
@globalVar1 = global i32 100
@globalVar2 = global i32 200

define i32 @main() {
mainEntry:
  %localVar1 = alloca i32, align 4
  %A = load i32, i32* @A, align 4
  store i32 %A, i32* %localVar1, align 4
  %localVar2 = alloca i32, align 4
  %B = load i32, i32* @B, align 4
  store i32 %B, i32* %localVar2, align 4
  %localVar3 = alloca i32, align 4
  %C = load i32, i32* @C, align 4
  store i32 %C, i32* %localVar3, align 4
  %localVar4 = alloca i32, align 4
  %D = load i32, i32* @D, align 4
  store i32 %D, i32* %localVar4, align 4
  %temp1 = alloca i32, align 4
  %localVar11 = load i32, i32* %localVar1, align 4
  %localVar22 = load i32, i32* %localVar2, align 4
  %tmp0 = add i32 %localVar11, %localVar22
  store i32 %tmp0, i32* %temp1, align 4
  %temp2 = alloca i32, align 4
  %localVar33 = load i32, i32* %localVar3, align 4
  %localVar44 = load i32, i32* %localVar4, align 4
  %tmp1 = sub i32 %localVar33, %localVar44
  store i32 %tmp1, i32* %temp2, align 4
  %temp3 = alloca i32, align 4
  %temp15 = load i32, i32* %temp1, align 4
  %temp26 = load i32, i32* %temp2, align 4
  %tmp2 = mul i32 %temp15, %temp26
  store i32 %tmp2, i32* %temp3, align 4
  %temp4 = alloca i32, align 4
  %temp37 = load i32, i32* %temp3, align 4
  %tmp3 = sdiv i32 %temp37, 5
  store i32 %tmp3, i32* %temp4, align 4
  %temp48 = load i32, i32* %temp4, align 4
  store i32 %temp48, i32* %localVar1, align 4
  %localVar19 = load i32, i32* %localVar1, align 4
  %globalVar1 = load i32, i32* @globalVar1, align 4
  %tmp4 = add i32 %localVar19, %globalVar1
  store i32 %tmp4, i32* %localVar2, align 4
  %localVar210 = load i32, i32* %localVar2, align 4
  %globalVar2 = load i32, i32* @globalVar2, align 4
  %tmp5 = sub i32 %localVar210, %globalVar2
  store i32 %tmp5, i32* %localVar3, align 4
  %localVar311 = load i32, i32* %localVar3, align 4
  %tmp6 = mul i32 %localVar311, 2
  store i32 %tmp6, i32* %localVar4, align 4
  %finalResult = alloca i32, align 4
  %localVar412 = load i32, i32* %localVar4, align 4
  %tmp7 = add i32 %localVar412, 255
  store i32 %tmp7, i32* %finalResult, align 4
  %finalResult13 = load i32, i32* %finalResult, align 4
  ret i32 %finalResult13
  ret i32 0
}
