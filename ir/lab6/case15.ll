; ModuleID = 'module'
source_filename = "module"

define i32 @main() {
mainEntry:
  %x = alloca i32, align 4
  store i32 10, i32* %x, align 4
  %y = alloca i32, align 4
  %x1 = load i32, i32* %x, align 4
  %tmp0 = add i32 %x1, 1
  store i32 %tmp0, i32* %y, align 4
  %z = alloca i32, align 4
  %x2 = load i32, i32* %x, align 4
  %y3 = load i32, i32* %y, align 4
  %tmp1 = mul i32 %x2, %y3
  %tmp2 = add i32 %tmp1, 1
  store i32 %tmp2, i32* %z, align 4
  %z4 = load i32, i32* %z, align 4
  %tmp3 = srem i32 %z4, 66
  ret i32 %tmp3
  ret i32 0
}
