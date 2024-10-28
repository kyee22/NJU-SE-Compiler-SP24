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
@x2 = global i32 27
@y2 = global i32 28
@z2 = global i32 29
@a2 = global i32 30

define i32 @main() {
mainEntry:
  %l1 = alloca i32, align 4
  store i32 1, i32* %l1, align 4
  %m1 = alloca i32, align 4
  store i32 2, i32* %m1, align 4
  %n1 = alloca i32, align 4
  store i32 3, i32* %n1, align 4
  %o1 = alloca i32, align 4
  store i32 4, i32* %o1, align 4
  %p1 = alloca i32, align 4
  store i32 5, i32* %p1, align 4
  %q1 = alloca i32, align 4
  store i32 6, i32* %q1, align 4
  %r1 = alloca i32, align 4
  store i32 7, i32* %r1, align 4
  %s1 = alloca i32, align 4
  store i32 8, i32* %s1, align 4
  %t1 = alloca i32, align 4
  store i32 9, i32* %t1, align 4
  %u1 = alloca i32, align 4
  store i32 10, i32* %u1, align 4
  %v1 = alloca i32, align 4
  store i32 11, i32* %v1, align 4
  %w1 = alloca i32, align 4
  store i32 12, i32* %w1, align 4
  %x3 = alloca i32, align 4
  store i32 13, i32* %x3, align 4
  %y3 = alloca i32, align 4
  store i32 14, i32* %y3, align 4
  %z3 = alloca i32, align 4
  store i32 15, i32* %z3, align 4
  %a3 = alloca i32, align 4
  store i32 16, i32* %a3, align 4
  %b3 = alloca i32, align 4
  store i32 17, i32* %b3, align 4
  %c3 = alloca i32, align 4
  store i32 18, i32* %c3, align 4
  %d3 = alloca i32, align 4
  store i32 19, i32* %d3, align 4
  %e3 = alloca i32, align 4
  store i32 20, i32* %e3, align 4
  %f3 = alloca i32, align 4
  store i32 21, i32* %f3, align 4
  %g3 = alloca i32, align 4
  store i32 22, i32* %g3, align 4
  %h3 = alloca i32, align 4
  store i32 23, i32* %h3, align 4
  %i3 = alloca i32, align 4
  store i32 24, i32* %i3, align 4
  %j3 = alloca i32, align 4
  store i32 25, i32* %j3, align 4
  %x = load i32, i32* @x, align 4
  %y = load i32, i32* @y, align 4
  %tmp0 = add i32 %x, %y
  %z = load i32, i32* @z, align 4
  %tmp1 = add i32 %tmp0, %z
  store i32 %tmp1, i32* %l1, align 4
  %a = load i32, i32* @a, align 4
  %b = load i32, i32* @b, align 4
  %tmp2 = mul i32 %a, %b
  %c = load i32, i32* @c, align 4
  %tmp3 = sub i32 %tmp2, %c
  store i32 %tmp3, i32* %m1, align 4
  %d = load i32, i32* @d, align 4
  %e = load i32, i32* @e, align 4
  %tmp4 = sdiv i32 %d, %e
  %f = load i32, i32* @f, align 4
  %tmp5 = add i32 %tmp4, %f
  store i32 %tmp5, i32* %n1, align 4
  %g = load i32, i32* @g, align 4
  %h = load i32, i32* @h, align 4
  %tmp6 = add i32 %g, %h
  %i = load i32, i32* @i, align 4
  %j = load i32, i32* @j, align 4
  %tmp7 = sub i32 %i, %j
  %tmp8 = mul i32 %tmp6, %tmp7
  store i32 %tmp8, i32* %o1, align 4
  %k = load i32, i32* @k, align 4
  %l = load i32, i32* @l, align 4
  %tmp9 = mul i32 %k, %l
  %m = load i32, i32* @m, align 4
  %tmp10 = add i32 %tmp9, %m
  store i32 %tmp10, i32* %p1, align 4
  %l11 = load i32, i32* %l1, align 4
  %m12 = load i32, i32* %m1, align 4
  %tmp11 = sub i32 %l11, %m12
  %n13 = load i32, i32* %n1, align 4
  %tmp12 = add i32 %tmp11, %n13
  store i32 %tmp12, i32* %l1, align 4
  %o14 = load i32, i32* %o1, align 4
  %p15 = load i32, i32* %p1, align 4
  %tmp13 = mul i32 %o14, %p15
  store i32 %tmp13, i32* %o1, align 4
  %l16 = load i32, i32* %l1, align 4
  %o17 = load i32, i32* %o1, align 4
  %tmp14 = sdiv i32 %l16, %o17
  store i32 %tmp14, i32* %p1, align 4
  %r18 = load i32, i32* %r1, align 4
  %s19 = load i32, i32* %s1, align 4
  %tmp15 = add i32 %r18, %s19
  %t110 = load i32, i32* %t1, align 4
  %tmp16 = sub i32 %tmp15, %t110
  store i32 %tmp16, i32* %q1, align 4
  %v111 = load i32, i32* %v1, align 4
  %w112 = load i32, i32* %w1, align 4
  %tmp17 = mul i32 %v111, %w112
  %x313 = load i32, i32* %x3, align 4
  %tmp18 = add i32 %tmp17, %x313
  store i32 %tmp18, i32* %u1, align 4
  %a314 = load i32, i32* %a3, align 4
  %b315 = load i32, i32* %b3, align 4
  %tmp19 = add i32 %a314, %b315
  %c316 = load i32, i32* %c3, align 4
  %d317 = load i32, i32* %d3, align 4
  %tmp20 = sub i32 %c316, %d317
  %tmp21 = mul i32 %tmp19, %tmp20
  store i32 %tmp21, i32* %y3, align 4
  %e318 = load i32, i32* %e3, align 4
  %f319 = load i32, i32* %f3, align 4
  %tmp22 = add i32 %e318, %f319
  %g320 = load i32, i32* %g3, align 4
  %tmp23 = sub i32 %tmp22, %g320
  store i32 %tmp23, i32* %z3, align 4
  %result = alloca i32, align 4
  %l121 = load i32, i32* %l1, align 4
  %m122 = load i32, i32* %m1, align 4
  %tmp24 = add i32 %l121, %m122
  %n123 = load i32, i32* %n1, align 4
  %tmp25 = add i32 %tmp24, %n123
  %o124 = load i32, i32* %o1, align 4
  %tmp26 = add i32 %tmp25, %o124
  %p125 = load i32, i32* %p1, align 4
  %tmp27 = add i32 %tmp26, %p125
  %q126 = load i32, i32* %q1, align 4
  %tmp28 = add i32 %tmp27, %q126
  %u127 = load i32, i32* %u1, align 4
  %tmp29 = add i32 %tmp28, %u127
  %y328 = load i32, i32* %y3, align 4
  %tmp30 = add i32 %tmp29, %y328
  %z329 = load i32, i32* %z3, align 4
  %tmp31 = add i32 %tmp30, %z329
  store i32 %tmp31, i32* %result, align 4
  %result30 = load i32, i32* %result, align 4
  ret i32 %result30
  ret i32 0
}
