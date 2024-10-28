; ModuleID = 'module'
source_filename = "module"

define i32 @main() {
mainEntry:
  %x = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 21, i32* %k, align 4
  %y = alloca i32, align 4
  %k1 = load i32, i32* %k, align 4
  store i32 %k1, i32* %y, align 4
  %y2 = load i32, i32* %y, align 4
  %tmp1 = add i32 %y2, 1
  store i32 %tmp1, i32* %x, align 4
  %n = alloca i32, align 4
  %k3 = load i32, i32* %k, align 4
  %tmp2 = mul i32 %k3, 7
  store i32 %tmp2, i32* %n, align 4
  %z = alloca i32, align 4
  %n4 = load i32, i32* %n, align 4
  %x5 = load i32, i32* %x, align 4
  %tmp3 = sub i32 %n4, %x5
  store i32 %tmp3, i32* %z, align 4
  %w = alloca i32, align 4
  %n6 = load i32, i32* %n, align 4
  %y7 = load i32, i32* %y, align 4
  %tmp4 = sub i32 %n6, %y7
  store i32 %tmp4, i32* %w, align 4
  %w8 = load i32, i32* %w, align 4
  %tmp5 = mul i32 %w8, 1
  %tmp6 = mul i32 %tmp5, 1
  %tmp7 = mul i32 %tmp6, 1
  store i32 %tmp7, i32* %w, align 4
  %z9 = load i32, i32* %z, align 4
  %w10 = load i32, i32* %w, align 4
  %tmp8 = add i32 %z9, %w10
  ret i32 %tmp8
  ret i32 0
}
