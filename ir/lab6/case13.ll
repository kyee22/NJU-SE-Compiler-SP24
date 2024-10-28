; ModuleID = 'module'
source_filename = "module"

@a = global i32 10
@b = global i32 20
@c = global i32 30
@d = global i32 40
@e = global i32 50
@f = global i32 60
@g = global i32 70
@h = global i32 80
@i = global i32 90
@j = global i32 100
@k = global i32 110
@l = global i32 120
@m = global i32 130
@n = global i32 140
@o = global i32 150
@p = global i32 160
@q = global i32 170
@r = global i32 180
@s = global i32 190
@t = global i32 200
@u = global i32 210
@v = global i32 220
@w = global i32 230
@x = global i32 240
@y = global i32 250
@z = global i32 260
@aa = global i32 270
@bb = global i32 280
@cc = global i32 290
@dd = global i32 300

define i32 @main() {
mainEntry:
  %globalSum = alloca i32, align 4
  %a = load i32, i32* @a, align 4
  %b = load i32, i32* @b, align 4
  %tmp0 = add i32 %a, %b
  %c = load i32, i32* @c, align 4
  %tmp1 = add i32 %tmp0, %c
  %d = load i32, i32* @d, align 4
  %tmp2 = add i32 %tmp1, %d
  %e = load i32, i32* @e, align 4
  %tmp3 = add i32 %tmp2, %e
  %f = load i32, i32* @f, align 4
  %tmp4 = add i32 %tmp3, %f
  %g = load i32, i32* @g, align 4
  %tmp5 = add i32 %tmp4, %g
  %h = load i32, i32* @h, align 4
  %tmp6 = add i32 %tmp5, %h
  %i = load i32, i32* @i, align 4
  %tmp7 = add i32 %tmp6, %i
  %j = load i32, i32* @j, align 4
  %tmp8 = add i32 %tmp7, %j
  %k = load i32, i32* @k, align 4
  %tmp9 = add i32 %tmp8, %k
  %l = load i32, i32* @l, align 4
  %tmp10 = add i32 %tmp9, %l
  %m = load i32, i32* @m, align 4
  %tmp11 = add i32 %tmp10, %m
  %n = load i32, i32* @n, align 4
  %tmp12 = add i32 %tmp11, %n
  %o = load i32, i32* @o, align 4
  %tmp13 = add i32 %tmp12, %o
  %p = load i32, i32* @p, align 4
  %tmp14 = add i32 %tmp13, %p
  %q = load i32, i32* @q, align 4
  %tmp15 = add i32 %tmp14, %q
  %r = load i32, i32* @r, align 4
  %tmp16 = add i32 %tmp15, %r
  %s = load i32, i32* @s, align 4
  %tmp17 = add i32 %tmp16, %s
  %t = load i32, i32* @t, align 4
  %tmp18 = add i32 %tmp17, %t
  %u = load i32, i32* @u, align 4
  %tmp19 = add i32 %tmp18, %u
  %v = load i32, i32* @v, align 4
  %tmp20 = add i32 %tmp19, %v
  %w = load i32, i32* @w, align 4
  %tmp21 = add i32 %tmp20, %w
  %x = load i32, i32* @x, align 4
  %tmp22 = add i32 %tmp21, %x
  %y = load i32, i32* @y, align 4
  %tmp23 = add i32 %tmp22, %y
  %z = load i32, i32* @z, align 4
  %tmp24 = add i32 %tmp23, %z
  %aa = load i32, i32* @aa, align 4
  %tmp25 = add i32 %tmp24, %aa
  %bb = load i32, i32* @bb, align 4
  %tmp26 = add i32 %tmp25, %bb
  %cc = load i32, i32* @cc, align 4
  %tmp27 = add i32 %tmp26, %cc
  %dd = load i32, i32* @dd, align 4
  %tmp28 = add i32 %tmp27, %dd
  store i32 %tmp28, i32* %globalSum, align 4
  %a1 = alloca i32, align 4
  store i32 1, i32* %a1, align 4
  %b2 = alloca i32, align 4
  store i32 2, i32* %b2, align 4
  %c3 = alloca i32, align 4
  store i32 3, i32* %c3, align 4
  %d4 = alloca i32, align 4
  store i32 4, i32* %d4, align 4
  %e5 = alloca i32, align 4
  store i32 5, i32* %e5, align 4
  %f6 = alloca i32, align 4
  store i32 6, i32* %f6, align 4
  %g7 = alloca i32, align 4
  store i32 7, i32* %g7, align 4
  %h8 = alloca i32, align 4
  store i32 8, i32* %h8, align 4
  %i9 = alloca i32, align 4
  store i32 9, i32* %i9, align 4
  %j10 = alloca i32, align 4
  store i32 10, i32* %j10, align 4
  %k11 = alloca i32, align 4
  store i32 11, i32* %k11, align 4
  %l12 = alloca i32, align 4
  store i32 12, i32* %l12, align 4
  %m13 = alloca i32, align 4
  store i32 13, i32* %m13, align 4
  %n14 = alloca i32, align 4
  store i32 14, i32* %n14, align 4
  %o15 = alloca i32, align 4
  store i32 15, i32* %o15, align 4
  %p16 = alloca i32, align 4
  store i32 16, i32* %p16, align 4
  %q17 = alloca i32, align 4
  store i32 17, i32* %q17, align 4
  %r18 = alloca i32, align 4
  store i32 18, i32* %r18, align 4
  %s19 = alloca i32, align 4
  store i32 19, i32* %s19, align 4
  %t20 = alloca i32, align 4
  store i32 20, i32* %t20, align 4
  %u21 = alloca i32, align 4
  store i32 21, i32* %u21, align 4
  %v22 = alloca i32, align 4
  store i32 22, i32* %v22, align 4
  %w23 = alloca i32, align 4
  store i32 23, i32* %w23, align 4
  %x24 = alloca i32, align 4
  store i32 24, i32* %x24, align 4
  %y25 = alloca i32, align 4
  store i32 25, i32* %y25, align 4
  %z26 = alloca i32, align 4
  store i32 26, i32* %z26, align 4
  %aa27 = alloca i32, align 4
  store i32 27, i32* %aa27, align 4
  %bb28 = alloca i32, align 4
  store i32 28, i32* %bb28, align 4
  %cc29 = alloca i32, align 4
  store i32 29, i32* %cc29, align 4
  %dd30 = alloca i32, align 4
  store i32 30, i32* %dd30, align 4
  %localSum = alloca i32, align 4
  %a31 = load i32, i32* %a1, align 4
  %b32 = load i32, i32* %b2, align 4
  %tmp29 = add i32 %a31, %b32
  %c33 = load i32, i32* %c3, align 4
  %d34 = load i32, i32* %d4, align 4
  %tmp30 = mul i32 %c33, %d34
  %tmp31 = sub i32 %tmp29, %tmp30
  store i32 %tmp31, i32* %localSum, align 4
  %temp1 = alloca i32, align 4
  %e35 = load i32, i32* %e5, align 4
  %f36 = load i32, i32* %f6, align 4
  %tmp32 = sdiv i32 %e35, %f36
  %g37 = load i32, i32* %g7, align 4
  %tmp33 = add i32 %tmp32, %g37
  %h38 = load i32, i32* %h8, align 4
  %tmp34 = sub i32 %tmp33, %h38
  store i32 %tmp34, i32* %temp1, align 4
  %temp2 = alloca i32, align 4
  %i39 = load i32, i32* %i9, align 4
  %j40 = load i32, i32* %j10, align 4
  %tmp35 = mul i32 %i39, %j40
  %k41 = load i32, i32* %k11, align 4
  %tmp36 = sub i32 %tmp35, %k41
  %l42 = load i32, i32* %l12, align 4
  %tmp37 = add i32 %tmp36, %l42
  store i32 %tmp37, i32* %temp2, align 4
  %temp3 = alloca i32, align 4
  %m43 = load i32, i32* %m13, align 4
  %n44 = load i32, i32* %n14, align 4
  %o45 = load i32, i32* %o15, align 4
  %tmp38 = add i32 %n44, %o45
  %tmp39 = sdiv i32 %m43, %tmp38
  store i32 %tmp39, i32* %temp3, align 4
  %temp4 = alloca i32, align 4
  %p46 = load i32, i32* %p16, align 4
  %q47 = load i32, i32* %q17, align 4
  %r48 = load i32, i32* %r18, align 4
  %tmp40 = mul i32 %q47, %r48
  %tmp41 = sub i32 %p46, %tmp40
  store i32 %tmp41, i32* %temp4, align 4
  %temp5 = alloca i32, align 4
  %s49 = load i32, i32* %s19, align 4
  %t50 = load i32, i32* %t20, align 4
  %tmp42 = add i32 %s49, %t50
  %u51 = load i32, i32* %u21, align 4
  %tmp43 = sub i32 %tmp42, %u51
  store i32 %tmp43, i32* %temp5, align 4
  %temp6 = alloca i32, align 4
  %v52 = load i32, i32* %v22, align 4
  %w53 = load i32, i32* %w23, align 4
  %tmp44 = mul i32 %v52, %w53
  %x54 = load i32, i32* %x24, align 4
  %tmp45 = add i32 %tmp44, %x54
  store i32 %tmp45, i32* %temp6, align 4
  %temp7 = alloca i32, align 4
  %y55 = load i32, i32* %y25, align 4
  %z56 = load i32, i32* %z26, align 4
  %tmp46 = sub i32 %y55, %z56
  %aa57 = load i32, i32* %aa27, align 4
  %bb58 = load i32, i32* %bb28, align 4
  %tmp47 = add i32 %aa57, %bb58
  %tmp48 = sdiv i32 %tmp46, %tmp47
  store i32 %tmp48, i32* %temp7, align 4
  %temp8 = alloca i32, align 4
  %cc59 = load i32, i32* %cc29, align 4
  %dd60 = load i32, i32* %dd30, align 4
  %a61 = load i32, i32* %a1, align 4
  %tmp49 = sub i32 %dd60, %a61
  %tmp50 = mul i32 %cc59, %tmp49
  %b62 = load i32, i32* %b2, align 4
  %tmp51 = add i32 %tmp50, %b62
  store i32 %tmp51, i32* %temp8, align 4
  %temp9 = alloca i32, align 4
  %c63 = load i32, i32* %c3, align 4
  %d64 = load i32, i32* %d4, align 4
  %tmp52 = add i32 %c63, %d64
  %e65 = load i32, i32* %e5, align 4
  %tmp53 = mul i32 %tmp52, %e65
  %f66 = load i32, i32* %f6, align 4
  %tmp54 = sub i32 %tmp53, %f66
  store i32 %tmp54, i32* %temp9, align 4
  %temp10 = alloca i32, align 4
  %g67 = load i32, i32* %g7, align 4
  %h68 = load i32, i32* %h8, align 4
  %i69 = load i32, i32* %i9, align 4
  %tmp55 = mul i32 %h68, %i69
  %tmp56 = add i32 %g67, %tmp55
  %j70 = load i32, i32* %j10, align 4
  %tmp57 = sub i32 %tmp56, %j70
  store i32 %tmp57, i32* %temp10, align 4
  %complex1 = alloca i32, align 4
  %temp171 = load i32, i32* %temp1, align 4
  %temp272 = load i32, i32* %temp2, align 4
  %tmp58 = mul i32 %temp171, %temp272
  %temp373 = load i32, i32* %temp3, align 4
  %tmp59 = sub i32 %tmp58, %temp373
  store i32 %tmp59, i32* %complex1, align 4
  %complex2 = alloca i32, align 4
  %temp474 = load i32, i32* %temp4, align 4
  %temp575 = load i32, i32* %temp5, align 4
  %tmp60 = add i32 %temp474, %temp575
  %temp676 = load i32, i32* %temp6, align 4
  %temp777 = load i32, i32* %temp7, align 4
  %tmp61 = sub i32 %temp676, %temp777
  %tmp62 = sdiv i32 %tmp60, %tmp61
  store i32 %tmp62, i32* %complex2, align 4
  %complex3 = alloca i32, align 4
  %temp878 = load i32, i32* %temp8, align 4
  %temp979 = load i32, i32* %temp9, align 4
  %tmp63 = mul i32 %temp878, %temp979
  %temp1080 = load i32, i32* %temp10, align 4
  %tmp64 = add i32 %tmp63, %temp1080
  store i32 %tmp64, i32* %complex3, align 4
  %complex4 = alloca i32, align 4
  %complex181 = load i32, i32* %complex1, align 4
  %complex282 = load i32, i32* %complex2, align 4
  %tmp65 = add i32 %complex181, %complex282
  %complex383 = load i32, i32* %complex3, align 4
  %tmp66 = sub i32 %tmp65, %complex383
  store i32 %tmp66, i32* %complex4, align 4
  %complex5 = alloca i32, align 4
  %complex484 = load i32, i32* %complex4, align 4
  %temp185 = load i32, i32* %temp1, align 4
  %temp286 = load i32, i32* %temp2, align 4
  %tmp67 = sdiv i32 %temp185, %temp286
  %tmp68 = mul i32 %complex484, %tmp67
  store i32 %tmp68, i32* %complex5, align 4
  %shadowTest1 = alloca i32, align 4
  %a87 = load i32, i32* %a1, align 4
  %b88 = load i32, i32* %b2, align 4
  %tmp69 = add i32 %a87, %b88
  %c89 = load i32, i32* %c3, align 4
  %d90 = load i32, i32* %d4, align 4
  %tmp70 = mul i32 %c89, %d90
  %tmp71 = add i32 %tmp69, %tmp70
  %e91 = load i32, i32* %e5, align 4
  %tmp72 = sub i32 %tmp71, %e91
  store i32 %tmp72, i32* %shadowTest1, align 4
  %shadowTest2 = alloca i32, align 4
  %f92 = load i32, i32* %f6, align 4
  %g93 = load i32, i32* %g7, align 4
  %tmp73 = sdiv i32 %f92, %g93
  %h94 = load i32, i32* %h8, align 4
  %i95 = load i32, i32* %i9, align 4
  %tmp74 = sub i32 %h94, %i95
  %tmp75 = add i32 %tmp73, %tmp74
  store i32 %tmp75, i32* %shadowTest2, align 4
  %shadowTest3 = alloca i32, align 4
  %j96 = load i32, i32* %j10, align 4
  %k97 = load i32, i32* %k11, align 4
  %l98 = load i32, i32* %l12, align 4
  %tmp76 = sub i32 %k97, %l98
  %tmp77 = mul i32 %j96, %tmp76
  %m99 = load i32, i32* %m13, align 4
  %tmp78 = sdiv i32 %tmp77, %m99
  store i32 %tmp78, i32* %shadowTest3, align 4
  %shadowTest4 = alloca i32, align 4
  %n100 = load i32, i32* %n14, align 4
  %o101 = load i32, i32* %o15, align 4
  %p102 = load i32, i32* %p16, align 4
  %tmp79 = mul i32 %o101, %p102
  %tmp80 = add i32 %n100, %tmp79
  %q103 = load i32, i32* %q17, align 4
  %tmp81 = sub i32 %tmp80, %q103
  store i32 %tmp81, i32* %shadowTest4, align 4
  %shadowTest5 = alloca i32, align 4
  %r104 = load i32, i32* %r18, align 4
  %s105 = load i32, i32* %s19, align 4
  %t106 = load i32, i32* %t20, align 4
  %tmp82 = sdiv i32 %s105, %t106
  %tmp83 = sub i32 %r104, %tmp82
  %u107 = load i32, i32* %u21, align 4
  %tmp84 = add i32 %tmp83, %u107
  store i32 %tmp84, i32* %shadowTest5, align 4
  %result = alloca i32, align 4
  %globalSum108 = load i32, i32* %globalSum, align 4
  %localSum109 = load i32, i32* %localSum, align 4
  %tmp85 = add i32 %globalSum108, %localSum109
  %temp1110 = load i32, i32* %temp1, align 4
  %tmp86 = add i32 %tmp85, %temp1110
  %temp2111 = load i32, i32* %temp2, align 4
  %tmp87 = add i32 %tmp86, %temp2111
  %temp3112 = load i32, i32* %temp3, align 4
  %tmp88 = add i32 %tmp87, %temp3112
  %temp4113 = load i32, i32* %temp4, align 4
  %tmp89 = add i32 %tmp88, %temp4113
  %temp5114 = load i32, i32* %temp5, align 4
  %tmp90 = add i32 %tmp89, %temp5114
  %temp6115 = load i32, i32* %temp6, align 4
  %tmp91 = add i32 %tmp90, %temp6115
  %temp7116 = load i32, i32* %temp7, align 4
  %tmp92 = add i32 %tmp91, %temp7116
  %temp8117 = load i32, i32* %temp8, align 4
  %tmp93 = add i32 %tmp92, %temp8117
  %temp9118 = load i32, i32* %temp9, align 4
  %tmp94 = add i32 %tmp93, %temp9118
  %temp10119 = load i32, i32* %temp10, align 4
  %tmp95 = add i32 %tmp94, %temp10119
  %complex1120 = load i32, i32* %complex1, align 4
  %tmp96 = add i32 %tmp95, %complex1120
  %complex2121 = load i32, i32* %complex2, align 4
  %tmp97 = add i32 %tmp96, %complex2121
  %complex3122 = load i32, i32* %complex3, align 4
  %tmp98 = add i32 %tmp97, %complex3122
  %complex4123 = load i32, i32* %complex4, align 4
  %tmp99 = add i32 %tmp98, %complex4123
  %complex5124 = load i32, i32* %complex5, align 4
  %tmp100 = add i32 %tmp99, %complex5124
  %shadowTest1125 = load i32, i32* %shadowTest1, align 4
  %tmp101 = add i32 %tmp100, %shadowTest1125
  %shadowTest2126 = load i32, i32* %shadowTest2, align 4
  %tmp102 = add i32 %tmp101, %shadowTest2126
  %shadowTest3127 = load i32, i32* %shadowTest3, align 4
  %tmp103 = add i32 %tmp102, %shadowTest3127
  %shadowTest4128 = load i32, i32* %shadowTest4, align 4
  %tmp104 = add i32 %tmp103, %shadowTest4128
  %shadowTest5129 = load i32, i32* %shadowTest5, align 4
  %tmp105 = add i32 %tmp104, %shadowTest5129
  store i32 %tmp105, i32* %result, align 4
  %result130 = load i32, i32* %result, align 4
  ret i32 %result130
  ret i32 0
}
