; ModuleID = 'module'
source_filename = "module"

define i32 @f(i32 %0) {
fEntry:
  %i = alloca i32, align 4
  store i32 %0, i32* %i, align 4
  %i1 = load i32, i32* %i, align 4
  ret i32 %i1
}

define i32 @g(i32 %0, i32 %1) {
gEntry:
  %i = alloca i32, align 4
  store i32 %0, i32* %i, align 4
  %j = alloca i32, align 4
  store i32 %1, i32* %j, align 4
  %i1 = load i32, i32* %i, align 4
  %returnValue = call i32 @f(i32 %i1)
  %j2 = load i32, i32* %j, align 4
  %tmp0 = mul i32 2, %j2
  %tmp1 = add i32 %returnValue, %tmp0
  ret i32 %tmp1
}

define i32 @main() {
mainEntry:
  %a = alloca i32, align 4
  store i32 1, i32* %a, align 4
  %a1 = load i32, i32* %a, align 4
  %a2 = load i32, i32* %a, align 4
  %tmp2 = mul i32 2, %a2
  %returnValue = call i32 @g(i32 %a1, i32 %tmp2)
  %a3 = load i32, i32* %a, align 4
  %returnValue4 = call i32 @f(i32 %a3)
  %returnValue5 = call i32 @g(i32 %returnValue, i32 %returnValue4)
  ret i32 %returnValue5
}
