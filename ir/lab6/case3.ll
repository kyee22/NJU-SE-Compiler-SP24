; ModuleID = 'module'
source_filename = "module"

@a = global i32 1
@b = global i32 0

define i32 @main() {
mainEntry:
  %c = alloca i32, align 4
  store i32 3, i32* %c, align 4
  %c1 = load i32, i32* %c, align 4
  %a = load i32, i32* @a, align 4
  %tmp0 = add i32 %c1, %a
  %tmp1 = add i32 %tmp0, 1
  store i32 %tmp1, i32* @b, align 4
  %d = alloca i32, align 4
  store i32 10, i32* %d, align 4
  %a2 = load i32, i32* @a, align 4
  %b = load i32, i32* @b, align 4
  %tmp2 = add i32 %a2, %b
  %c3 = load i32, i32* %c, align 4
  %tmp3 = add i32 %tmp2, %c3
  %d4 = load i32, i32* %d, align 4
  %tmp4 = add i32 %tmp3, %d4
  ret i32 %tmp4
  ret i32 0
}
