; ModuleID = 'module'
source_filename = "module"

@GLOBAL_CONST1 = global i32 15
@GLOBAL_CONST2 = global i32 8
@GLOBAL_CONST3 = global i32 3
@globalVar1 = global i32 50
@globalVar2 = global i32 35

define i32 @main() {
mainEntry:
  %x = alloca i32, align 4
  store i32 12, i32* %x, align 4
  %y = alloca i32, align 4
  store i32 24, i32* %y, align 4
  %z = alloca i32, align 4
  store i32 36, i32* %z, align 4
  %w = alloca i32, align 4
  store i32 48, i32* %w, align 4
  %u = alloca i32, align 4
  store i32 60, i32* %u, align 4
  %v = alloca i32, align 4
  store i32 72, i32* %v, align 4
  %m = alloca i32, align 4
  store i32 84, i32* %m, align 4
  %n = alloca i32, align 4
  store i32 96, i32* %n, align 4
  %p = alloca i32, align 4
  store i32 1, i32* %p, align 4
  %q = alloca i32, align 4
  store i32 120, i32* %q, align 4
  %r = alloca i32, align 4
  store i32 132, i32* %r, align 4
  %s = alloca i32, align 4
  store i32 144, i32* %s, align 4
  %t = alloca i32, align 4
  store i32 156, i32* %t, align 4
  %l = alloca i32, align 4
  store i32 168, i32* %l, align 4
  %o = alloca i32, align 4
  store i32 180, i32* %o, align 4
  %a = alloca i32, align 4
  store i32 192, i32* %a, align 4
  %b = alloca i32, align 4
  store i32 204, i32* %b, align 4
  %c = alloca i32, align 4
  store i32 216, i32* %c, align 4
  %d = alloca i32, align 4
  store i32 228, i32* %d, align 4
  %e = alloca i32, align 4
  store i32 240, i32* %e, align 4
  %f = alloca i32, align 4
  store i32 252, i32* %f, align 4
  %temp1 = alloca i32, align 4
  %x1 = load i32, i32* %x, align 4
  %y2 = load i32, i32* %y, align 4
  %tmp0 = add i32 %x1, %y2
  %z3 = load i32, i32* %z, align 4
  %w4 = load i32, i32* %w, align 4
  %tmp1 = sdiv i32 %z3, %w4
  %tmp2 = mul i32 %tmp0, %tmp1
  store i32 %tmp2, i32* %temp1, align 4
  %temp2 = alloca i32, align 4
  %GLOBAL_CONST1 = load i32, i32* @GLOBAL_CONST1, align 4
  %x5 = load i32, i32* %x, align 4
  %tmp3 = mul i32 %GLOBAL_CONST1, %x5
  %y6 = load i32, i32* %y, align 4
  %tmp4 = add i32 %tmp3, %y6
  %u7 = load i32, i32* %u, align 4
  %v8 = load i32, i32* %v, align 4
  %tmp5 = sdiv i32 %u7, %v8
  %tmp6 = sdiv i32 %tmp4, %tmp5
  store i32 %tmp6, i32* %temp2, align 4
  %temp3 = alloca i32, align 4
  %GLOBAL_CONST2 = load i32, i32* @GLOBAL_CONST2, align 4
  %w9 = load i32, i32* %w, align 4
  %x10 = load i32, i32* %x, align 4
  %y11 = load i32, i32* %y, align 4
  %tmp7 = sdiv i32 %x10, %y11
  %tmp8 = mul i32 %w9, %tmp7
  %tmp9 = add i32 %GLOBAL_CONST2, %tmp8
  %GLOBAL_CONST3 = load i32, i32* @GLOBAL_CONST3, align 4
  %tmp10 = add i32 %GLOBAL_CONST3, 1
  %tmp11 = srem i32 %tmp9, %tmp10
  store i32 %tmp11, i32* %temp3, align 4
  %temp4 = alloca i32, align 4
  %x12 = load i32, i32* %x, align 4
  %y13 = load i32, i32* %y, align 4
  %tmp12 = sub i32 %x12, %y13
  %tmp13 = sub i32 0, %tmp12
  %GLOBAL_CONST114 = load i32, i32* @GLOBAL_CONST1, align 4
  %tmp14 = mul i32 %tmp13, %GLOBAL_CONST114
  %v15 = load i32, i32* %v, align 4
  %u16 = load i32, i32* %u, align 4
  %tmp15 = sdiv i32 %v15, %u16
  %tmp16 = add i32 %tmp14, %tmp15
  %w17 = load i32, i32* %w, align 4
  %z18 = load i32, i32* %z, align 4
  %tmp17 = sdiv i32 %w17, %z18
  %tmp18 = sdiv i32 %tmp16, %tmp17
  store i32 %tmp18, i32* %temp4, align 4
  %temp5 = alloca i32, align 4
  %x19 = load i32, i32* %x, align 4
  %GLOBAL_CONST320 = load i32, i32* @GLOBAL_CONST3, align 4
  %tmp19 = sub i32 %x19, %GLOBAL_CONST320
  %tmp20 = icmp ne i32 0, %tmp19
  %tmp21 = xor i1 %tmp20, true
  %tmp22 = zext i1 %tmp21 to i32
  %y21 = load i32, i32* %y, align 4
  %z22 = load i32, i32* %z, align 4
  %tmp23 = sdiv i32 %y21, %z22
  %tmp24 = mul i32 %tmp22, %tmp23
  store i32 %tmp24, i32* %temp5, align 4
  %temp6 = alloca i32, align 4
  %x23 = load i32, i32* %x, align 4
  %y24 = load i32, i32* %y, align 4
  %tmp25 = mul i32 %x23, %y24
  %GLOBAL_CONST225 = load i32, i32* @GLOBAL_CONST2, align 4
  %tmp26 = sub i32 %tmp25, %GLOBAL_CONST225
  %GLOBAL_CONST126 = load i32, i32* @GLOBAL_CONST1, align 4
  %w27 = load i32, i32* %w, align 4
  %tmp27 = sdiv i32 %GLOBAL_CONST126, %w27
  %tmp28 = add i32 %tmp26, %tmp27
  store i32 %tmp28, i32* %temp6, align 4
  %temp7 = alloca i32, align 4
  %z28 = load i32, i32* %z, align 4
  %y29 = load i32, i32* %y, align 4
  %tmp29 = sdiv i32 %z28, %y29
  %GLOBAL_CONST130 = load i32, i32* @GLOBAL_CONST1, align 4
  %x31 = load i32, i32* %x, align 4
  %tmp30 = sub i32 %GLOBAL_CONST130, %x31
  %tmp31 = mul i32 %tmp29, %tmp30
  %tmp32 = sub i32 0, %tmp31
  %v32 = load i32, i32* %v, align 4
  %u33 = load i32, i32* %u, align 4
  %tmp33 = sdiv i32 %v32, %u33
  %tmp34 = srem i32 %tmp32, %tmp33
  store i32 %tmp34, i32* %temp7, align 4
  %temp8 = alloca i32, align 4
  %x34 = load i32, i32* %x, align 4
  %y35 = load i32, i32* %y, align 4
  %tmp35 = add i32 %x34, %y35
  %z36 = load i32, i32* %z, align 4
  %tmp36 = sub i32 %tmp35, %z36
  %w37 = load i32, i32* %w, align 4
  %GLOBAL_CONST338 = load i32, i32* @GLOBAL_CONST3, align 4
  %tmp37 = sdiv i32 %w37, %GLOBAL_CONST338
  %tmp38 = mul i32 %tmp36, %tmp37
  store i32 %tmp38, i32* %temp8, align 4
  %temp9 = alloca i32, align 4
  %GLOBAL_CONST239 = load i32, i32* @GLOBAL_CONST2, align 4
  %x40 = load i32, i32* %x, align 4
  %y41 = load i32, i32* %y, align 4
  %tmp39 = srem i32 %x40, %y41
  %tmp40 = mul i32 %GLOBAL_CONST239, %tmp39
  %z42 = load i32, i32* %z, align 4
  %w43 = load i32, i32* %w, align 4
  %tmp41 = sub i32 %z42, %w43
  %tmp42 = add i32 %tmp40, %tmp41
  %u44 = load i32, i32* %u, align 4
  %v45 = load i32, i32* %v, align 4
  %tmp43 = sdiv i32 %u44, %v45
  %tmp44 = srem i32 %tmp42, %tmp43
  store i32 %tmp44, i32* %temp9, align 4
  %temp10 = alloca i32, align 4
  %x46 = load i32, i32* %x, align 4
  %y47 = load i32, i32* %y, align 4
  %z48 = load i32, i32* %z, align 4
  %tmp45 = sub i32 %y47, %z48
  %tmp46 = mul i32 %x46, %tmp45
  %GLOBAL_CONST149 = load i32, i32* @GLOBAL_CONST1, align 4
  %tmp47 = add i32 %tmp46, %GLOBAL_CONST149
  %w50 = load i32, i32* %w, align 4
  %GLOBAL_CONST251 = load i32, i32* @GLOBAL_CONST2, align 4
  %tmp48 = sdiv i32 %w50, %GLOBAL_CONST251
  %tmp49 = sdiv i32 %tmp47, %tmp48
  store i32 %tmp49, i32* %temp10, align 4
  %temp11 = alloca i32, align 4
  %x52 = load i32, i32* %x, align 4
  %y53 = load i32, i32* %y, align 4
  %z54 = load i32, i32* %z, align 4
  %tmp50 = sub i32 %y53, %z54
  %tmp51 = mul i32 %x52, %tmp50
  %GLOBAL_CONST355 = load i32, i32* @GLOBAL_CONST3, align 4
  %tmp52 = srem i32 %tmp51, %GLOBAL_CONST355
  %w56 = load i32, i32* %w, align 4
  %u57 = load i32, i32* %u, align 4
  %tmp53 = sdiv i32 %w56, %u57
  %tmp54 = add i32 %tmp52, %tmp53
  %tmp55 = sub i32 0, %tmp54
  store i32 %tmp55, i32* %temp11, align 4
  %temp12 = alloca i32, align 4
  %x58 = load i32, i32* %x, align 4
  %y59 = load i32, i32* %y, align 4
  %tmp56 = add i32 %x58, %y59
  %GLOBAL_CONST160 = load i32, i32* @GLOBAL_CONST1, align 4
  %z61 = load i32, i32* %z, align 4
  %tmp57 = sub i32 %GLOBAL_CONST160, %z61
  %tmp58 = mul i32 %tmp56, %tmp57
  %w62 = load i32, i32* %w, align 4
  %GLOBAL_CONST263 = load i32, i32* @GLOBAL_CONST2, align 4
  %tmp59 = sdiv i32 %w62, %GLOBAL_CONST263
  %tmp60 = srem i32 %tmp58, %tmp59
  store i32 %tmp60, i32* %temp12, align 4
  %temp13 = alloca i32, align 4
  %GLOBAL_CONST364 = load i32, i32* @GLOBAL_CONST3, align 4
  %x65 = load i32, i32* %x, align 4
  %y66 = load i32, i32* %y, align 4
  %tmp61 = sdiv i32 %x65, %y66
  %tmp62 = add i32 %GLOBAL_CONST364, %tmp61
  %z67 = load i32, i32* %z, align 4
  %w68 = load i32, i32* %w, align 4
  %tmp63 = sdiv i32 %z67, %w68
  %tmp64 = mul i32 %tmp62, %tmp63
  store i32 %tmp64, i32* %temp13, align 4
  %temp14 = alloca i32, align 4
  %x69 = load i32, i32* %x, align 4
  %y70 = load i32, i32* %y, align 4
  %z71 = load i32, i32* %z, align 4
  %tmp65 = sub i32 %y70, %z71
  %GLOBAL_CONST172 = load i32, i32* @GLOBAL_CONST1, align 4
  %tmp66 = mul i32 %tmp65, %GLOBAL_CONST172
  %tmp67 = add i32 %x69, %tmp66
  %tmp68 = sub i32 0, %tmp67
  %w73 = load i32, i32* %w, align 4
  %u74 = load i32, i32* %u, align 4
  %tmp69 = sdiv i32 %w73, %u74
  %tmp70 = sdiv i32 %tmp68, %tmp69
  store i32 %tmp70, i32* %temp14, align 4
  %temp15 = alloca i32, align 4
  %x75 = load i32, i32* %x, align 4
  %y76 = load i32, i32* %y, align 4
  %z77 = load i32, i32* %z, align 4
  %tmp71 = add i32 %y76, %z77
  %tmp72 = srem i32 %x75, %tmp71
  %GLOBAL_CONST278 = load i32, i32* @GLOBAL_CONST2, align 4
  %w79 = load i32, i32* %w, align 4
  %tmp73 = sub i32 %GLOBAL_CONST278, %w79
  %tmp74 = mul i32 %tmp72, %tmp73
  store i32 %tmp74, i32* %temp15, align 4
  %temp16 = alloca i32, align 4
  %x80 = load i32, i32* %x, align 4
  %y81 = load i32, i32* %y, align 4
  %tmp75 = sub i32 %x80, %y81
  %tmp76 = sub i32 0, %tmp75
  %z82 = load i32, i32* %z, align 4
  %GLOBAL_CONST383 = load i32, i32* @GLOBAL_CONST3, align 4
  %tmp77 = sdiv i32 %z82, %GLOBAL_CONST383
  %tmp78 = mul i32 %tmp76, %tmp77
  %w84 = load i32, i32* %w, align 4
  %u85 = load i32, i32* %u, align 4
  %v86 = load i32, i32* %v, align 4
  %tmp79 = sdiv i32 %u85, %v86
  %tmp80 = sdiv i32 %w84, %tmp79
  %tmp81 = srem i32 %tmp78, %tmp80
  store i32 %tmp81, i32* %temp16, align 4
  %temp17 = alloca i32, align 4
  %x87 = load i32, i32* %x, align 4
  %y88 = load i32, i32* %y, align 4
  %GLOBAL_CONST289 = load i32, i32* @GLOBAL_CONST2, align 4
  %tmp82 = add i32 %y88, %GLOBAL_CONST289
  %tmp83 = sdiv i32 %x87, %tmp82
  %z90 = load i32, i32* %z, align 4
  %w91 = load i32, i32* %w, align 4
  %u92 = load i32, i32* %u, align 4
  %tmp84 = sub i32 %w91, %u92
  %tmp85 = srem i32 %z90, %tmp84
  %tmp86 = mul i32 %tmp83, %tmp85
  store i32 %tmp86, i32* %temp17, align 4
  %temp18 = alloca i32, align 4
  %GLOBAL_CONST393 = load i32, i32* @GLOBAL_CONST3, align 4
  %x94 = load i32, i32* %x, align 4
  %y95 = load i32, i32* %y, align 4
  %tmp87 = sub i32 %x94, %y95
  %tmp88 = mul i32 %GLOBAL_CONST393, %tmp87
  %z96 = load i32, i32* %z, align 4
  %w97 = load i32, i32* %w, align 4
  %tmp89 = sdiv i32 %z96, %w97
  %tmp90 = add i32 %tmp88, %tmp89
  %u98 = load i32, i32* %u, align 4
  %v99 = load i32, i32* %v, align 4
  %tmp91 = sdiv i32 %u98, %v99
  %tmp92 = srem i32 %tmp90, %tmp91
  store i32 %tmp92, i32* %temp18, align 4
  %temp19 = alloca i32, align 4
  %x100 = load i32, i32* %x, align 4
  %GLOBAL_CONST1101 = load i32, i32* @GLOBAL_CONST1, align 4
  %tmp93 = add i32 %x100, %GLOBAL_CONST1101
  %tmp94 = sub i32 0, %tmp93
  %y102 = load i32, i32* %y, align 4
  %z103 = load i32, i32* %z, align 4
  %tmp95 = sub i32 %y102, %z103
  %tmp96 = mul i32 %tmp94, %tmp95
  %w104 = load i32, i32* %w, align 4
  %GLOBAL_CONST2105 = load i32, i32* @GLOBAL_CONST2, align 4
  %tmp97 = sdiv i32 %w104, %GLOBAL_CONST2105
  %tmp98 = sdiv i32 %tmp96, %tmp97
  store i32 %tmp98, i32* %temp19, align 4
  %temp20 = alloca i32, align 4
  %x106 = load i32, i32* %x, align 4
  %y107 = load i32, i32* %y, align 4
  %z108 = load i32, i32* %z, align 4
  %tmp99 = add i32 %y107, %z108
  %tmp100 = mul i32 %x106, %tmp99
  %GLOBAL_CONST3109 = load i32, i32* @GLOBAL_CONST3, align 4
  %tmp101 = sub i32 %tmp100, %GLOBAL_CONST3109
  %w110 = load i32, i32* %w, align 4
  %u111 = load i32, i32* %u, align 4
  %v112 = load i32, i32* %v, align 4
  %tmp102 = add i32 %u111, %v112
  %tmp103 = sdiv i32 %w110, %tmp102
  %tmp104 = sdiv i32 %tmp101, %tmp103
  store i32 %tmp104, i32* %temp20, align 4
  %temp21 = alloca i32, align 4
  %GLOBAL_CONST2113 = load i32, i32* @GLOBAL_CONST2, align 4
  %x114 = load i32, i32* %x, align 4
  %y115 = load i32, i32* %y, align 4
  %tmp105 = srem i32 %x114, %y115
  %tmp106 = sub i32 %GLOBAL_CONST2113, %tmp105
  %z116 = load i32, i32* %z, align 4
  %w117 = load i32, i32* %w, align 4
  %tmp107 = sdiv i32 %z116, %w117
  %tmp108 = mul i32 %tmp106, %tmp107
  store i32 %tmp108, i32* %temp21, align 4
  %temp22 = alloca i32, align 4
  %GLOBAL_CONST1118 = load i32, i32* @GLOBAL_CONST1, align 4
  %x119 = load i32, i32* %x, align 4
  %y120 = load i32, i32* %y, align 4
  %tmp109 = mul i32 %x119, %y120
  %z121 = load i32, i32* %z, align 4
  %w122 = load i32, i32* %w, align 4
  %tmp110 = sdiv i32 %z121, %w122
  %tmp111 = sdiv i32 %tmp109, %tmp110
  %tmp112 = add i32 %GLOBAL_CONST1118, %tmp111
  %tmp113 = sub i32 0, %tmp112
  store i32 %tmp113, i32* %temp22, align 4
  %temp23 = alloca i32, align 4
  %x123 = load i32, i32* %x, align 4
  %y124 = load i32, i32* %y, align 4
  %tmp114 = sub i32 %x123, %y124
  %GLOBAL_CONST3125 = load i32, i32* @GLOBAL_CONST3, align 4
  %z126 = load i32, i32* %z, align 4
  %tmp115 = add i32 %GLOBAL_CONST3125, %z126
  %tmp116 = mul i32 %tmp114, %tmp115
  %w127 = load i32, i32* %w, align 4
  %u128 = load i32, i32* %u, align 4
  %tmp117 = sdiv i32 %w127, %u128
  %tmp118 = sdiv i32 %tmp116, %tmp117
  store i32 %tmp118, i32* %temp23, align 4
  %temp24 = alloca i32, align 4
  %x129 = load i32, i32* %x, align 4
  %y130 = load i32, i32* %y, align 4
  %tmp119 = add i32 %x129, %y130
  %tmp120 = sub i32 0, %tmp119
  %z131 = load i32, i32* %z, align 4
  %GLOBAL_CONST1132 = load i32, i32* @GLOBAL_CONST1, align 4
  %tmp121 = srem i32 %z131, %GLOBAL_CONST1132
  %tmp122 = mul i32 %tmp120, %tmp121
  %w133 = load i32, i32* %w, align 4
  %u134 = load i32, i32* %u, align 4
  %v135 = load i32, i32* %v, align 4
  %tmp123 = add i32 %u134, %v135
  %tmp124 = sdiv i32 %w133, %tmp123
  %tmp125 = sdiv i32 %tmp122, %tmp124
  store i32 %tmp125, i32* %temp24, align 4
  %temp25 = alloca i32, align 4
  %x136 = load i32, i32* %x, align 4
  %y137 = load i32, i32* %y, align 4
  %z138 = load i32, i32* %z, align 4
  %tmp126 = sub i32 %y137, %z138
  %tmp127 = mul i32 %x136, %tmp126
  %GLOBAL_CONST2139 = load i32, i32* @GLOBAL_CONST2, align 4
  %tmp128 = sub i32 %tmp127, %GLOBAL_CONST2139
  %w140 = load i32, i32* %w, align 4
  %GLOBAL_CONST1141 = load i32, i32* @GLOBAL_CONST1, align 4
  %tmp129 = add i32 %w140, %GLOBAL_CONST1141
  %tmp130 = srem i32 %tmp128, %tmp129
  store i32 %tmp130, i32* %temp25, align 4
  %temp26 = alloca i32, align 4
  %GLOBAL_CONST1142 = load i32, i32* @GLOBAL_CONST1, align 4
  %x143 = load i32, i32* %x, align 4
  %y144 = load i32, i32* %y, align 4
  %tmp131 = add i32 %x143, %y144
  %tmp132 = sdiv i32 %GLOBAL_CONST1142, %tmp131
  %z145 = load i32, i32* %z, align 4
  %w146 = load i32, i32* %w, align 4
  %u147 = load i32, i32* %u, align 4
  %tmp133 = sub i32 %w146, %u147
  %tmp134 = srem i32 %z145, %tmp133
  %tmp135 = mul i32 %tmp132, %tmp134
  store i32 %tmp135, i32* %temp26, align 4
  %temp27 = alloca i32, align 4
  %x148 = load i32, i32* %x, align 4
  %y149 = load i32, i32* %y, align 4
  %tmp136 = mul i32 %x148, %y149
  %z150 = load i32, i32* %z, align 4
  %tmp137 = sub i32 %tmp136, %z150
  %GLOBAL_CONST3151 = load i32, i32* @GLOBAL_CONST3, align 4
  %tmp138 = add i32 %tmp137, %GLOBAL_CONST3151
  %w152 = load i32, i32* %w, align 4
  %u153 = load i32, i32* %u, align 4
  %v154 = load i32, i32* %v, align 4
  %tmp139 = add i32 %u153, %v154
  %tmp140 = sdiv i32 %w152, %tmp139
  %tmp141 = srem i32 %tmp138, %tmp140
  store i32 %tmp141, i32* %temp27, align 4
  %temp28 = alloca i32, align 4
  %x155 = load i32, i32* %x, align 4
  %GLOBAL_CONST2156 = load i32, i32* @GLOBAL_CONST2, align 4
  %tmp142 = add i32 %x155, %GLOBAL_CONST2156
  %tmp143 = sub i32 0, %tmp142
  %y157 = load i32, i32* %y, align 4
  %z158 = load i32, i32* %z, align 4
  %tmp144 = sub i32 %y157, %z158
  %tmp145 = mul i32 %tmp143, %tmp144
  %w159 = load i32, i32* %w, align 4
  %v160 = load i32, i32* %v, align 4
  %tmp146 = srem i32 %w159, %v160
  %tmp147 = sdiv i32 %tmp145, %tmp146
  store i32 %tmp147, i32* %temp28, align 4
  %temp29 = alloca i32, align 4
  %x161 = load i32, i32* %x, align 4
  %y162 = load i32, i32* %y, align 4
  %GLOBAL_CONST1163 = load i32, i32* @GLOBAL_CONST1, align 4
  %tmp148 = mul i32 %y162, %GLOBAL_CONST1163
  %tmp149 = srem i32 %x161, %tmp148
  %z164 = load i32, i32* %z, align 4
  %w165 = load i32, i32* %w, align 4
  %tmp150 = sub i32 %z164, %w165
  %tmp151 = add i32 %tmp149, %tmp150
  %u166 = load i32, i32* %u, align 4
  %v167 = load i32, i32* %v, align 4
  %tmp152 = add i32 %u166, %v167
  %tmp153 = srem i32 %tmp151, %tmp152
  store i32 %tmp153, i32* %temp29, align 4
  %temp30 = alloca i32, align 4
  %x168 = load i32, i32* %x, align 4
  %y169 = load i32, i32* %y, align 4
  %z170 = load i32, i32* %z, align 4
  %tmp154 = add i32 %y169, %z170
  %tmp155 = mul i32 %x168, %tmp154
  %GLOBAL_CONST3171 = load i32, i32* @GLOBAL_CONST3, align 4
  %tmp156 = sub i32 %tmp155, %GLOBAL_CONST3171
  %w172 = load i32, i32* %w, align 4
  %u173 = load i32, i32* %u, align 4
  %v174 = load i32, i32* %v, align 4
  %tmp157 = add i32 %u173, %v174
  %tmp158 = srem i32 %w172, %tmp157
  %tmp159 = sdiv i32 %tmp156, %tmp158
  store i32 %tmp159, i32* %temp30, align 4
  %temp1175 = load i32, i32* %temp1, align 4
  %temp2176 = load i32, i32* %temp2, align 4
  %tmp160 = add i32 %temp1175, %temp2176
  %temp3177 = load i32, i32* %temp3, align 4
  %temp4178 = load i32, i32* %temp4, align 4
  %tmp161 = mul i32 %temp3177, %temp4178
  %temp5179 = load i32, i32* %temp5, align 4
  %temp6180 = load i32, i32* %temp6, align 4
  %tmp162 = add i32 %temp5179, %temp6180
  %tmp163 = sdiv i32 %tmp161, %tmp162
  %tmp164 = sub i32 %tmp160, %tmp163
  %tmp165 = srem i32 %tmp164, 256
  ret i32 %tmp165
  ret i32 0
}
