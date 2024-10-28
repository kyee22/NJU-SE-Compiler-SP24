; ModuleID = 'module'
source_filename = "module"

@B = global i32 10

define i32 @main() {
mainEntry:
  %A = alloca i32, align 4
  store i32 1, i32* %A, align 4
  %B = alloca i32, align 4
  store i32 2, i32* %B, align 4
  %A1 = load i32, i32* %A, align 4
  %B2 = load i32, i32* %B, align 4
  %tmp0 = add i32 %A1, %B2
  %B3 = load i32, i32* %B, align 4
  %A4 = load i32, i32* %A, align 4
  %tmp1 = sub i32 %B3, %A4
  %tmp2 = add i32 %tmp0, %tmp1
  %B5 = load i32, i32* %B, align 4
  %A6 = load i32, i32* %A, align 4
  %tmp3 = sub i32 %B5, %A6
  %A7 = load i32, i32* %A, align 4
  %tmp4 = sub i32 %tmp3, %A7
  %tmp5 = add i32 %tmp2, %tmp4
  ret i32 %tmp5
  ret i32 0
}
