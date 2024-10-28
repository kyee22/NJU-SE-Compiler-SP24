; ModuleID = 'module'
source_filename = "module"

@ax = global i32 10
@ay = global i32 20
@az = global i32 5

define i32 @main() {
mainEntry:
  %result = alloca i32, align 4
  %ax = load i32, i32* @ax, align 4
  %ay = load i32, i32* @ay, align 4
  %az = load i32, i32* @az, align 4
  %tmp0 = sub i32 %ay, %az
  %tmp1 = mul i32 %ax, %tmp0
  %az1 = load i32, i32* @az, align 4
  %tmp2 = add i32 %az1, 1
  %tmp3 = sdiv i32 %tmp1, %tmp2
  %ax2 = load i32, i32* @ax, align 4
  %ay3 = load i32, i32* @ay, align 4
  %tmp4 = sub i32 %ax2, %ay3
  %tmp5 = srem i32 %tmp3, %tmp4
  store i32 %tmp5, i32* %result, align 4
  %result4 = load i32, i32* %result, align 4
  ret i32 %result4
  ret i32 0
}
