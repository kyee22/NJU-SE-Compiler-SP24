; ModuleID = 'module'
source_filename = "module"

define i32 @main() {
mainEntry:
  %main = alloca i32, align 4
  store i32 10, i32* %main, align 4
  %main1 = load i32, i32* %main, align 4
  ret i32 %main1
  ret i32 0
}
