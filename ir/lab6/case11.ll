; ModuleID = 'module'
source_filename = "module"

@g1 = global i32 1
@g2 = global i32 2
@g3 = global i32 3
@g4 = global i32 4
@g5 = global i32 5
@g6 = global i32 6
@g7 = global i32 7
@g8 = global i32 8
@g9 = global i32 9
@g10 = global i32 10
@g11 = global i32 11
@g12 = global i32 12
@g13 = global i32 13
@g14 = global i32 14
@g15 = global i32 15
@g16 = global i32 16
@g17 = global i32 17
@g18 = global i32 18
@g19 = global i32 19
@g20 = global i32 20

define i32 @main() {
mainEntry:
  %l1 = alloca i32, align 4
  store i32 1, i32* %l1, align 4
  %l2 = alloca i32, align 4
  store i32 2, i32* %l2, align 4
  %l3 = alloca i32, align 4
  store i32 3, i32* %l3, align 4
  %l4 = alloca i32, align 4
  store i32 4, i32* %l4, align 4
  %l5 = alloca i32, align 4
  store i32 5, i32* %l5, align 4
  %l6 = alloca i32, align 4
  store i32 6, i32* %l6, align 4
  %l7 = alloca i32, align 4
  store i32 7, i32* %l7, align 4
  %l8 = alloca i32, align 4
  store i32 8, i32* %l8, align 4
  %l9 = alloca i32, align 4
  store i32 9, i32* %l9, align 4
  %l10 = alloca i32, align 4
  store i32 10, i32* %l10, align 4
  %l11 = alloca i32, align 4
  store i32 11, i32* %l11, align 4
  %l12 = alloca i32, align 4
  store i32 12, i32* %l12, align 4
  %l13 = alloca i32, align 4
  store i32 13, i32* %l13, align 4
  %l14 = alloca i32, align 4
  store i32 14, i32* %l14, align 4
  %l15 = alloca i32, align 4
  store i32 15, i32* %l15, align 4
  %l16 = alloca i32, align 4
  store i32 16, i32* %l16, align 4
  %l17 = alloca i32, align 4
  store i32 17, i32* %l17, align 4
  %l18 = alloca i32, align 4
  store i32 18, i32* %l18, align 4
  %l19 = alloca i32, align 4
  store i32 19, i32* %l19, align 4
  %l20 = alloca i32, align 4
  store i32 20, i32* %l20, align 4
  %g1 = load i32, i32* @g1, align 4
  %g2 = load i32, i32* @g2, align 4
  %tmp0 = add i32 %g1, %g2
  %g3 = load i32, i32* @g3, align 4
  %g4 = load i32, i32* @g4, align 4
  %tmp1 = mul i32 %g3, %g4
  %tmp2 = sub i32 %tmp0, %tmp1
  store i32 %tmp2, i32* %l1, align 4
  %g5 = load i32, i32* @g5, align 4
  %g6 = load i32, i32* @g6, align 4
  %tmp3 = sdiv i32 %g5, %g6
  %g7 = load i32, i32* @g7, align 4
  %tmp4 = add i32 %tmp3, %g7
  %g8 = load i32, i32* @g8, align 4
  %tmp5 = sub i32 %tmp4, %g8
  store i32 %tmp5, i32* %l2, align 4
  %g9 = load i32, i32* @g9, align 4
  %g10 = load i32, i32* @g10, align 4
  %tmp6 = mul i32 %g9, %g10
  %g11 = load i32, i32* @g11, align 4
  %tmp7 = sub i32 %tmp6, %g11
  %g12 = load i32, i32* @g12, align 4
  %tmp8 = add i32 %tmp7, %g12
  store i32 %tmp8, i32* %l3, align 4
  %g13 = load i32, i32* @g13, align 4
  %g14 = load i32, i32* @g14, align 4
  %g15 = load i32, i32* @g15, align 4
  %tmp9 = add i32 %g14, %g15
  %tmp10 = sdiv i32 %g13, %tmp9
  store i32 %tmp10, i32* %l4, align 4
  %g16 = load i32, i32* @g16, align 4
  %g17 = load i32, i32* @g17, align 4
  %g18 = load i32, i32* @g18, align 4
  %tmp11 = mul i32 %g17, %g18
  %tmp12 = sub i32 %g16, %tmp11
  store i32 %tmp12, i32* %l5, align 4
  %l110 = load i32, i32* %l1, align 4
  %l211 = load i32, i32* %l2, align 4
  %tmp13 = add i32 %l110, %l211
  %l312 = load i32, i32* %l3, align 4
  %tmp14 = sub i32 %tmp13, %l312
  store i32 %tmp14, i32* %l1, align 4
  %l413 = load i32, i32* %l4, align 4
  %l514 = load i32, i32* %l5, align 4
  %tmp15 = mul i32 %l413, %l514
  store i32 %tmp15, i32* %l4, align 4
  %l115 = load i32, i32* %l1, align 4
  %l216 = load i32, i32* %l2, align 4
  %l317 = load i32, i32* %l3, align 4
  %tmp16 = add i32 %l216, %l317
  %tmp17 = sdiv i32 %l115, %tmp16
  store i32 %tmp17, i32* %l5, align 4
  %l718 = load i32, i32* %l7, align 4
  %l819 = load i32, i32* %l8, align 4
  %tmp18 = add i32 %l718, %l819
  %l920 = load i32, i32* %l9, align 4
  %tmp19 = sub i32 %tmp18, %l920
  store i32 %tmp19, i32* %l6, align 4
  %l1121 = load i32, i32* %l11, align 4
  %l1222 = load i32, i32* %l12, align 4
  %tmp20 = mul i32 %l1121, %l1222
  %l1323 = load i32, i32* %l13, align 4
  %tmp21 = add i32 %tmp20, %l1323
  store i32 %tmp21, i32* %l10, align 4
  %l1524 = load i32, i32* %l15, align 4
  %l1625 = load i32, i32* %l16, align 4
  %tmp22 = add i32 %l1524, %l1625
  %l1726 = load i32, i32* %l17, align 4
  %l1827 = load i32, i32* %l18, align 4
  %tmp23 = sub i32 %l1726, %l1827
  %tmp24 = mul i32 %tmp22, %tmp23
  store i32 %tmp24, i32* %l14, align 4
  %l2028 = load i32, i32* %l20, align 4
  %l629 = load i32, i32* %l6, align 4
  %tmp25 = sub i32 %l2028, %l629
  store i32 %tmp25, i32* %l19, align 4
  %result = alloca i32, align 4
  %l130 = load i32, i32* %l1, align 4
  %l231 = load i32, i32* %l2, align 4
  %tmp26 = add i32 %l130, %l231
  %l332 = load i32, i32* %l3, align 4
  %tmp27 = add i32 %tmp26, %l332
  %l433 = load i32, i32* %l4, align 4
  %tmp28 = add i32 %tmp27, %l433
  %l534 = load i32, i32* %l5, align 4
  %tmp29 = add i32 %tmp28, %l534
  %l635 = load i32, i32* %l6, align 4
  %tmp30 = add i32 %tmp29, %l635
  %l1036 = load i32, i32* %l10, align 4
  %tmp31 = add i32 %tmp30, %l1036
  %l1437 = load i32, i32* %l14, align 4
  %tmp32 = add i32 %tmp31, %l1437
  %l1938 = load i32, i32* %l19, align 4
  %tmp33 = add i32 %tmp32, %l1938
  store i32 %tmp33, i32* %result, align 4
  %result39 = load i32, i32* %result, align 4
  ret i32 %result39
  ret i32 0
}
