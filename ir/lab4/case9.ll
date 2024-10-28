; ModuleID = 'module'
source_filename = "module"

@gConst = global i32 10
@gVar = global i32 20

define i32 @main() {
mainEntry:
  %localConst = alloca i32, align 4
  store i32 30, i32* %localConst, align 4
  %localVar = alloca i32, align 4
  store i32 40, i32* %localVar, align 4
  %anotherVar = alloca i32, align 4
  %localVar1 = load i32, i32* %localVar, align 4
  store i32 %localVar1, i32* %anotherVar, align 4
  %sum = alloca i32, align 4
  %localVar2 = load i32, i32* %localVar, align 4
  %localConst3 = load i32, i32* %localConst, align 4
  %tmp0 = add i32 %localVar2, %localConst3
  store i32 %tmp0, i32* %sum, align 4
  %total = alloca i32, align 4
  %gVar = load i32, i32* @gVar, align 4
  %gConst = load i32, i32* @gConst, align 4
  %tmp1 = add i32 %gVar, %gConst
  %sum4 = load i32, i32* %sum, align 4
  %tmp2 = add i32 %tmp1, %sum4
  store i32 %tmp2, i32* %total, align 4
  %total5 = load i32, i32* %total, align 4
  ret i32 %total5
  ret i32 0
}
