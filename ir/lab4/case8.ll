; ModuleID = 'module'
source_filename = "module"

define i32 @main() {
mainEntry:
  %num = alloca i32, align 4
  store i32 5, i32* %num, align 4
  %num1 = load i32, i32* %num, align 4
  %tmp0 = icmp ne i32 0, %num1
  %tmp1 = xor i1 %tmp0, true
  %tmp2 = zext i1 %tmp1 to i32
  ret i32 %tmp2
}
