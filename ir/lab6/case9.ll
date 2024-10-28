; ModuleID = 'module'
source_filename = "module"

@x = global i32 1
@y = global i32 2
@z = global i32 3
@a = global i32 4
@b = global i32 5
@c = global i32 6
@d = global i32 7
@e = global i32 8
@f = global i32 9
@g = global i32 10
@h = global i32 11
@i = global i32 12
@j = global i32 13
@k = global i32 14
@l = global i32 15
@m = global i32 16
@n = global i32 17
@o = global i32 18
@p = global i32 19
@q = global i32 20
@r = global i32 21
@s = global i32 22
@t = global i32 23
@u = global i32 24
@v = global i32 25
@w = global i32 26
@xx2 = global i32 27
@y2 = global i32 28
@z2 = global i32 29
@aa2 = global i32 30
@b2 = global i32 31
@c2 = global i32 32
@d2 = global i32 33
@e2 = global i32 34
@ff2 = global i32 35
@g2 = global i32 36
@h2 = global i32 37
@i2 = global i32 38
@j2 = global i32 39
@k2 = global i32 40

define i32 @main() {
mainEntry:
  %x1 = alloca i32, align 4
  store i32 1, i32* %x1, align 4
  %y1 = alloca i32, align 4
  store i32 2, i32* %y1, align 4
  %z1 = alloca i32, align 4
  store i32 3, i32* %z1, align 4
  %a1 = alloca i32, align 4
  store i32 4, i32* %a1, align 4
  %b1 = alloca i32, align 4
  store i32 5, i32* %b1, align 4
  %c1 = alloca i32, align 4
  store i32 6, i32* %c1, align 4
  %d1 = alloca i32, align 4
  store i32 7, i32* %d1, align 4
  %e1 = alloca i32, align 4
  store i32 8, i32* %e1, align 4
  %f1 = alloca i32, align 4
  store i32 9, i32* %f1, align 4
  %g1 = alloca i32, align 4
  store i32 10, i32* %g1, align 4
  %h1 = alloca i32, align 4
  store i32 11, i32* %h1, align 4
  %i1 = alloca i32, align 4
  store i32 12, i32* %i1, align 4
  %j1 = alloca i32, align 4
  store i32 13, i32* %j1, align 4
  %k1 = alloca i32, align 4
  store i32 14, i32* %k1, align 4
  %l1 = alloca i32, align 4
  store i32 15, i32* %l1, align 4
  %m1 = alloca i32, align 4
  store i32 16, i32* %m1, align 4
  %n1 = alloca i32, align 4
  store i32 17, i32* %n1, align 4
  %o1 = alloca i32, align 4
  store i32 18, i32* %o1, align 4
  %p1 = alloca i32, align 4
  store i32 19, i32* %p1, align 4
  %q1 = alloca i32, align 4
  store i32 20, i32* %q1, align 4
  %r1 = alloca i32, align 4
  store i32 21, i32* %r1, align 4
  %s1 = alloca i32, align 4
  store i32 22, i32* %s1, align 4
  %t1 = alloca i32, align 4
  store i32 23, i32* %t1, align 4
  %u1 = alloca i32, align 4
  store i32 24, i32* %u1, align 4
  %v1 = alloca i32, align 4
  store i32 25, i32* %v1, align 4
  %w1 = alloca i32, align 4
  store i32 26, i32* %w1, align 4
  %x3 = alloca i32, align 4
  store i32 27, i32* %x3, align 4
  %y3 = alloca i32, align 4
  store i32 28, i32* %y3, align 4
  %z3 = alloca i32, align 4
  store i32 29, i32* %z3, align 4
  %a3 = alloca i32, align 4
  store i32 30, i32* %a3, align 4
  %b3 = alloca i32, align 4
  store i32 31, i32* %b3, align 4
  %c3 = alloca i32, align 4
  store i32 32, i32* %c3, align 4
  %d3 = alloca i32, align 4
  store i32 33, i32* %d3, align 4
  %e3 = alloca i32, align 4
  store i32 34, i32* %e3, align 4
  %f3 = alloca i32, align 4
  store i32 35, i32* %f3, align 4
  %g3 = alloca i32, align 4
  store i32 36, i32* %g3, align 4
  %h3 = alloca i32, align 4
  store i32 37, i32* %h3, align 4
  %i3 = alloca i32, align 4
  store i32 38, i32* %i3, align 4
  %j3 = alloca i32, align 4
  store i32 39, i32* %j3, align 4
  %k3 = alloca i32, align 4
  store i32 40, i32* %k3, align 4
  %x = load i32, i32* @x, align 4
  %y = load i32, i32* @y, align 4
  %tmp0 = add i32 %x, %y
  %z = load i32, i32* @z, align 4
  %a = load i32, i32* @a, align 4
  %tmp1 = add i32 %z, %a
  %tmp2 = mul i32 %tmp0, %tmp1
  %b = load i32, i32* @b, align 4
  %c = load i32, i32* @c, align 4
  %tmp3 = add i32 %b, %c
  %d = load i32, i32* @d, align 4
  %tmp4 = sdiv i32 %tmp3, %d
  %tmp5 = sub i32 %tmp2, %tmp4
  store i32 %tmp5, i32* @x, align 4
  %e = load i32, i32* @e, align 4
  %f = load i32, i32* @f, align 4
  %tmp6 = mul i32 %e, %f
  %g = load i32, i32* @g, align 4
  %tmp7 = add i32 %tmp6, %g
  %h = load i32, i32* @h, align 4
  %tmp8 = sub i32 %tmp7, %h
  %i = load i32, i32* @i, align 4
  %tmp9 = add i32 %tmp8, %i
  store i32 %tmp9, i32* @e, align 4
  %j = load i32, i32* @j, align 4
  %k = load i32, i32* @k, align 4
  %tmp10 = mul i32 %j, %k
  %l = load i32, i32* @l, align 4
  %tmp11 = mul i32 %tmp10, %l
  %m = load i32, i32* @m, align 4
  %n = load i32, i32* @n, align 4
  %tmp12 = sdiv i32 %m, %n
  %tmp13 = sub i32 %tmp11, %tmp12
  %o = load i32, i32* @o, align 4
  %tmp14 = add i32 %tmp13, %o
  store i32 %tmp14, i32* @j, align 4
  %p = load i32, i32* @p, align 4
  %q = load i32, i32* @q, align 4
  %tmp15 = add i32 %p, %q
  %r = load i32, i32* @r, align 4
  %s = load i32, i32* @s, align 4
  %tmp16 = add i32 %r, %s
  %tmp17 = mul i32 %tmp15, %tmp16
  %t = load i32, i32* @t, align 4
  %tmp18 = sdiv i32 %tmp17, %t
  %u = load i32, i32* @u, align 4
  %tmp19 = sub i32 %tmp18, %u
  store i32 %tmp19, i32* @p, align 4
  %v = load i32, i32* @v, align 4
  %w = load i32, i32* @w, align 4
  %tmp20 = sub i32 %v, %w
  %xx2 = load i32, i32* @xx2, align 4
  %y2 = load i32, i32* @y2, align 4
  %tmp21 = mul i32 %xx2, %y2
  %tmp22 = add i32 %tmp20, %tmp21
  %z2 = load i32, i32* @z2, align 4
  %tmp23 = sub i32 %tmp22, %z2
  %aa2 = load i32, i32* @aa2, align 4
  %tmp24 = add i32 %tmp23, %aa2
  store i32 %tmp24, i32* @v, align 4
  %b2 = load i32, i32* @b2, align 4
  %c2 = load i32, i32* @c2, align 4
  %tmp25 = mul i32 %b2, %c2
  %d2 = load i32, i32* @d2, align 4
  %tmp26 = sub i32 %tmp25, %d2
  %e2 = load i32, i32* @e2, align 4
  %ff2 = load i32, i32* @ff2, align 4
  %tmp27 = mul i32 %e2, %ff2
  %tmp28 = add i32 %tmp26, %tmp27
  %g2 = load i32, i32* @g2, align 4
  %tmp29 = sub i32 %tmp28, %g2
  store i32 %tmp29, i32* @b2, align 4
  %h2 = load i32, i32* @h2, align 4
  %i2 = load i32, i32* @i2, align 4
  %j2 = load i32, i32* @j2, align 4
  %tmp30 = mul i32 %i2, %j2
  %tmp31 = add i32 %h2, %tmp30
  %k2 = load i32, i32* @k2, align 4
  %tmp32 = sub i32 %tmp31, %k2
  %l2 = load i32, i32* @l, align 4
  %m3 = load i32, i32* @m, align 4
  %tmp33 = mul i32 %l2, %m3
  %tmp34 = add i32 %tmp32, %tmp33
  store i32 %tmp34, i32* @h2, align 4
  %x14 = load i32, i32* %x1, align 4
  %y15 = load i32, i32* %y1, align 4
  %tmp35 = add i32 %x14, %y15
  %z16 = load i32, i32* %z1, align 4
  %a17 = load i32, i32* %a1, align 4
  %tmp36 = add i32 %z16, %a17
  %tmp37 = mul i32 %tmp35, %tmp36
  %b18 = load i32, i32* %b1, align 4
  %c19 = load i32, i32* %c1, align 4
  %tmp38 = add i32 %b18, %c19
  %d110 = load i32, i32* %d1, align 4
  %tmp39 = sdiv i32 %tmp38, %d110
  %tmp40 = sub i32 %tmp37, %tmp39
  store i32 %tmp40, i32* %x1, align 4
  %e111 = load i32, i32* %e1, align 4
  %f112 = load i32, i32* %f1, align 4
  %tmp41 = mul i32 %e111, %f112
  %g113 = load i32, i32* %g1, align 4
  %tmp42 = add i32 %tmp41, %g113
  %h114 = load i32, i32* %h1, align 4
  %tmp43 = sub i32 %tmp42, %h114
  %i115 = load i32, i32* %i1, align 4
  %tmp44 = add i32 %tmp43, %i115
  store i32 %tmp44, i32* %e1, align 4
  %j116 = load i32, i32* %j1, align 4
  %k117 = load i32, i32* %k1, align 4
  %tmp45 = mul i32 %j116, %k117
  %l118 = load i32, i32* %l1, align 4
  %tmp46 = mul i32 %tmp45, %l118
  %m119 = load i32, i32* %m1, align 4
  %n120 = load i32, i32* %n1, align 4
  %tmp47 = sdiv i32 %m119, %n120
  %tmp48 = sub i32 %tmp46, %tmp47
  %o121 = load i32, i32* %o1, align 4
  %tmp49 = add i32 %tmp48, %o121
  store i32 %tmp49, i32* %j1, align 4
  %p122 = load i32, i32* %p1, align 4
  %q123 = load i32, i32* %q1, align 4
  %tmp50 = add i32 %p122, %q123
  %r124 = load i32, i32* %r1, align 4
  %s125 = load i32, i32* %s1, align 4
  %tmp51 = add i32 %r124, %s125
  %tmp52 = mul i32 %tmp50, %tmp51
  %t126 = load i32, i32* %t1, align 4
  %tmp53 = sdiv i32 %tmp52, %t126
  %u127 = load i32, i32* %u1, align 4
  %tmp54 = sub i32 %tmp53, %u127
  store i32 %tmp54, i32* %p1, align 4
  %v128 = load i32, i32* %v1, align 4
  %w129 = load i32, i32* %w1, align 4
  %tmp55 = sub i32 %v128, %w129
  %x330 = load i32, i32* %x3, align 4
  %y331 = load i32, i32* %y3, align 4
  %tmp56 = mul i32 %x330, %y331
  %tmp57 = add i32 %tmp55, %tmp56
  %z332 = load i32, i32* %z3, align 4
  %tmp58 = sub i32 %tmp57, %z332
  %a333 = load i32, i32* %a3, align 4
  %tmp59 = add i32 %tmp58, %a333
  store i32 %tmp59, i32* %v1, align 4
  %b334 = load i32, i32* %b3, align 4
  %c335 = load i32, i32* %c3, align 4
  %tmp60 = mul i32 %b334, %c335
  %d336 = load i32, i32* %d3, align 4
  %tmp61 = sub i32 %tmp60, %d336
  %e337 = load i32, i32* %e3, align 4
  %f338 = load i32, i32* %f3, align 4
  %tmp62 = mul i32 %e337, %f338
  %tmp63 = add i32 %tmp61, %tmp62
  %g339 = load i32, i32* %g3, align 4
  %tmp64 = sub i32 %tmp63, %g339
  store i32 %tmp64, i32* %b3, align 4
  %h340 = load i32, i32* %h3, align 4
  %i341 = load i32, i32* %i3, align 4
  %j342 = load i32, i32* %j3, align 4
  %tmp65 = mul i32 %i341, %j342
  %tmp66 = add i32 %h340, %tmp65
  %k343 = load i32, i32* %k3, align 4
  %tmp67 = sub i32 %tmp66, %k343
  %l144 = load i32, i32* %l1, align 4
  %m145 = load i32, i32* %m1, align 4
  %tmp68 = mul i32 %l144, %m145
  %tmp69 = add i32 %tmp67, %tmp68
  store i32 %tmp69, i32* %h3, align 4
  %x46 = load i32, i32* @x, align 4
  %y47 = load i32, i32* @y, align 4
  %tmp70 = add i32 %x46, %y47
  %z48 = load i32, i32* @z, align 4
  %tmp71 = add i32 %tmp70, %z48
  %a49 = load i32, i32* @a, align 4
  %tmp72 = add i32 %tmp71, %a49
  %b50 = load i32, i32* @b, align 4
  %tmp73 = add i32 %tmp72, %b50
  %c51 = load i32, i32* @c, align 4
  %tmp74 = add i32 %tmp73, %c51
  %d52 = load i32, i32* @d, align 4
  %tmp75 = add i32 %tmp74, %d52
  %e53 = load i32, i32* @e, align 4
  %tmp76 = add i32 %tmp75, %e53
  %f54 = load i32, i32* @f, align 4
  %tmp77 = add i32 %tmp76, %f54
  %g55 = load i32, i32* @g, align 4
  %tmp78 = add i32 %tmp77, %g55
  %h56 = load i32, i32* @h, align 4
  %tmp79 = add i32 %tmp78, %h56
  %i57 = load i32, i32* @i, align 4
  %tmp80 = add i32 %tmp79, %i57
  %j58 = load i32, i32* @j, align 4
  %tmp81 = add i32 %tmp80, %j58
  %k59 = load i32, i32* @k, align 4
  %tmp82 = add i32 %tmp81, %k59
  %l60 = load i32, i32* @l, align 4
  %tmp83 = add i32 %tmp82, %l60
  %m61 = load i32, i32* @m, align 4
  %tmp84 = add i32 %tmp83, %m61
  %n62 = load i32, i32* @n, align 4
  %tmp85 = add i32 %tmp84, %n62
  %o63 = load i32, i32* @o, align 4
  %tmp86 = add i32 %tmp85, %o63
  %p64 = load i32, i32* @p, align 4
  %tmp87 = add i32 %tmp86, %p64
  %q65 = load i32, i32* @q, align 4
  %tmp88 = add i32 %tmp87, %q65
  %r66 = load i32, i32* @r, align 4
  %tmp89 = add i32 %tmp88, %r66
  %s67 = load i32, i32* @s, align 4
  %tmp90 = add i32 %tmp89, %s67
  %t68 = load i32, i32* @t, align 4
  %tmp91 = add i32 %tmp90, %t68
  %u69 = load i32, i32* @u, align 4
  %tmp92 = add i32 %tmp91, %u69
  %v70 = load i32, i32* @v, align 4
  %tmp93 = add i32 %tmp92, %v70
  %w71 = load i32, i32* @w, align 4
  %tmp94 = add i32 %tmp93, %w71
  %xx272 = load i32, i32* @xx2, align 4
  %tmp95 = add i32 %tmp94, %xx272
  %y273 = load i32, i32* @y2, align 4
  %tmp96 = add i32 %tmp95, %y273
  %z274 = load i32, i32* @z2, align 4
  %tmp97 = add i32 %tmp96, %z274
  %aa275 = load i32, i32* @aa2, align 4
  %tmp98 = add i32 %tmp97, %aa275
  %b276 = load i32, i32* @b2, align 4
  %tmp99 = add i32 %tmp98, %b276
  %c277 = load i32, i32* @c2, align 4
  %tmp100 = add i32 %tmp99, %c277
  %d278 = load i32, i32* @d2, align 4
  %tmp101 = add i32 %tmp100, %d278
  %e279 = load i32, i32* @e2, align 4
  %tmp102 = add i32 %tmp101, %e279
  %ff280 = load i32, i32* @ff2, align 4
  %tmp103 = add i32 %tmp102, %ff280
  %g281 = load i32, i32* @g2, align 4
  %tmp104 = add i32 %tmp103, %g281
  %h282 = load i32, i32* @h2, align 4
  %tmp105 = add i32 %tmp104, %h282
  %i283 = load i32, i32* @i2, align 4
  %tmp106 = add i32 %tmp105, %i283
  %j284 = load i32, i32* @j2, align 4
  %tmp107 = add i32 %tmp106, %j284
  %k285 = load i32, i32* @k2, align 4
  %tmp108 = add i32 %tmp107, %k285
  %x186 = load i32, i32* %x1, align 4
  %tmp109 = add i32 %tmp108, %x186
  %y187 = load i32, i32* %y1, align 4
  %tmp110 = add i32 %tmp109, %y187
  %z188 = load i32, i32* %z1, align 4
  %tmp111 = add i32 %tmp110, %z188
  %a189 = load i32, i32* %a1, align 4
  %tmp112 = add i32 %tmp111, %a189
  %b190 = load i32, i32* %b1, align 4
  %tmp113 = add i32 %tmp112, %b190
  %c191 = load i32, i32* %c1, align 4
  %tmp114 = add i32 %tmp113, %c191
  %d192 = load i32, i32* %d1, align 4
  %tmp115 = add i32 %tmp114, %d192
  %e193 = load i32, i32* %e1, align 4
  %tmp116 = add i32 %tmp115, %e193
  %f194 = load i32, i32* %f1, align 4
  %tmp117 = add i32 %tmp116, %f194
  %g195 = load i32, i32* %g1, align 4
  %tmp118 = add i32 %tmp117, %g195
  %h196 = load i32, i32* %h1, align 4
  %tmp119 = add i32 %tmp118, %h196
  %i197 = load i32, i32* %i1, align 4
  %tmp120 = add i32 %tmp119, %i197
  %j198 = load i32, i32* %j1, align 4
  %tmp121 = add i32 %tmp120, %j198
  %k199 = load i32, i32* %k1, align 4
  %tmp122 = add i32 %tmp121, %k199
  %l1100 = load i32, i32* %l1, align 4
  %tmp123 = add i32 %tmp122, %l1100
  %m1101 = load i32, i32* %m1, align 4
  %tmp124 = add i32 %tmp123, %m1101
  %n1102 = load i32, i32* %n1, align 4
  %tmp125 = add i32 %tmp124, %n1102
  %o1103 = load i32, i32* %o1, align 4
  %tmp126 = add i32 %tmp125, %o1103
  %p1104 = load i32, i32* %p1, align 4
  %tmp127 = add i32 %tmp126, %p1104
  %q1105 = load i32, i32* %q1, align 4
  %tmp128 = add i32 %tmp127, %q1105
  %r1106 = load i32, i32* %r1, align 4
  %tmp129 = add i32 %tmp128, %r1106
  %s1107 = load i32, i32* %s1, align 4
  %tmp130 = add i32 %tmp129, %s1107
  %t1108 = load i32, i32* %t1, align 4
  %tmp131 = add i32 %tmp130, %t1108
  %u1109 = load i32, i32* %u1, align 4
  %tmp132 = add i32 %tmp131, %u1109
  %v1110 = load i32, i32* %v1, align 4
  %tmp133 = add i32 %tmp132, %v1110
  %w1111 = load i32, i32* %w1, align 4
  %tmp134 = add i32 %tmp133, %w1111
  %x3112 = load i32, i32* %x3, align 4
  %tmp135 = add i32 %tmp134, %x3112
  %y3113 = load i32, i32* %y3, align 4
  %tmp136 = add i32 %tmp135, %y3113
  %z3114 = load i32, i32* %z3, align 4
  %tmp137 = add i32 %tmp136, %z3114
  %a3115 = load i32, i32* %a3, align 4
  %tmp138 = add i32 %tmp137, %a3115
  %b3116 = load i32, i32* %b3, align 4
  %tmp139 = add i32 %tmp138, %b3116
  %c3117 = load i32, i32* %c3, align 4
  %tmp140 = add i32 %tmp139, %c3117
  %d3118 = load i32, i32* %d3, align 4
  %tmp141 = add i32 %tmp140, %d3118
  %e3119 = load i32, i32* %e3, align 4
  %tmp142 = add i32 %tmp141, %e3119
  %f3120 = load i32, i32* %f3, align 4
  %tmp143 = add i32 %tmp142, %f3120
  %g3121 = load i32, i32* %g3, align 4
  %tmp144 = add i32 %tmp143, %g3121
  %h3122 = load i32, i32* %h3, align 4
  %tmp145 = add i32 %tmp144, %h3122
  %i3123 = load i32, i32* %i3, align 4
  %tmp146 = add i32 %tmp145, %i3123
  %j3124 = load i32, i32* %j3, align 4
  %tmp147 = add i32 %tmp146, %j3124
  %k3125 = load i32, i32* %k3, align 4
  %tmp148 = add i32 %tmp147, %k3125
  ret i32 %tmp148
  ret i32 0
}
