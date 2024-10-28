; ModuleID = 'module'
source_filename = "module"

@b1 = global i32 7
@b2 = global i32 2
@b3 = global i32 3
@b4 = global i32 4

define i32 @main() {
mainEntry:
  %result = alloca i32, align 4
  %b1 = load i32, i32* @b1, align 4
  %b2 = load i32, i32* @b2, align 4
  %tmp0 = mul i32 %b1, %b2
  %b3 = load i32, i32* @b3, align 4
  %tmp1 = add i32 %tmp0, %b3
  %b4 = load i32, i32* @b4, align 4
  %b21 = load i32, i32* @b2, align 4
  %tmp2 = sdiv i32 %b4, %b21
  %tmp3 = sub i32 %tmp1, %tmp2
  store i32 %tmp3, i32* %result, align 4
  %result2 = load i32, i32* %result, align 4
  ret i32 %result2
  ret i32 0
}
