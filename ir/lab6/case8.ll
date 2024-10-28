; ModuleID = 'module'
source_filename = "module"

@i = global i32 15
@j = global i32 3
@k = global i32 2

define i32 @main() {
mainEntry:
  %result = alloca i32, align 4
  %i = load i32, i32* @i, align 4
  %j = load i32, i32* @j, align 4
  %tmp0 = add i32 %i, %j
  %k = load i32, i32* @k, align 4
  %tmp1 = mul i32 %tmp0, %k
  %i1 = load i32, i32* @i, align 4
  %j2 = load i32, i32* @j, align 4
  %tmp2 = sdiv i32 %i1, %j2
  %tmp3 = sub i32 %tmp1, %tmp2
  %i3 = load i32, i32* @i, align 4
  %j4 = load i32, i32* @j, align 4
  %tmp4 = srem i32 %i3, %j4
  %tmp5 = add i32 %tmp3, %tmp4
  store i32 %tmp5, i32* %result, align 4
  %result5 = load i32, i32* %result, align 4
  ret i32 %result5
  ret i32 0
}
