; ModuleID = 'module'
source_filename = "module"

@u = global i32 25
@v = global i32 5
@w = global i32 4
@x = global i32 6
@y = global i32 3

define i32 @main() {
mainEntry:
  %result = alloca i32, align 4
  %u = load i32, i32* @u, align 4
  %v = load i32, i32* @v, align 4
  %tmp0 = sdiv i32 %u, %v
  %w = load i32, i32* @w, align 4
  %tmp1 = mul i32 %tmp0, %w
  %x = load i32, i32* @x, align 4
  %tmp2 = add i32 %tmp1, %x
  %y = load i32, i32* @y, align 4
  %u1 = load i32, i32* @u, align 4
  %v2 = load i32, i32* @v, align 4
  %tmp3 = srem i32 %u1, %v2
  %tmp4 = mul i32 %y, %tmp3
  %tmp5 = sub i32 %tmp2, %tmp4
  store i32 %tmp5, i32* %result, align 4
  %result3 = load i32, i32* %result, align 4
  ret i32 %result3
  ret i32 0
}
