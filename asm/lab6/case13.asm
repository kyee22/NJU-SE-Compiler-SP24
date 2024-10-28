
	.data
a:
	.word 10

	.data
b:
	.word 20

	.data
c:
	.word 30

	.data
d:
	.word 40

	.data
e:
	.word 50

	.data
f:
	.word 60

	.data
g:
	.word 70

	.data
h:
	.word 80

	.data
i:
	.word 90

	.data
j:
	.word 100

	.data
k:
	.word 110

	.data
l:
	.word 120

	.data
m:
	.word 130

	.data
n:
	.word 140

	.data
o:
	.word 150

	.data
p:
	.word 160

	.data
q:
	.word 170

	.data
r:
	.word 180

	.data
s:
	.word 190

	.data
t:
	.word 200

	.data
u:
	.word 210

	.data
v:
	.word 220

	.data
w:
	.word 230

	.data
x:
	.word 240

	.data
y:
	.word 250

	.data
z:
	.word 260

	.data
aa:
	.word 270

	.data
bb:
	.word 280

	.data
cc:
	.word 290

	.data
dd:
	.word 300

	.text
	.globl main
main:
	addi   sp sp -76
	la     t1 a
	lw     t3 0(t1)
	la     t1 b
	lw     t4 0(t1)
	add    t5 t3 t4
	la     t1 c
	lw     t4 0(t1)
	add    t3 t5 t4
	la     t1 d
	lw     t4 0(t1)
	add    t5 t3 t4
	la     t1 e
	lw     t4 0(t1)
	add    t3 t5 t4
	la     t1 f
	lw     t4 0(t1)
	add    t5 t3 t4
	la     t1 g
	lw     t4 0(t1)
	add    t3 t5 t4
	la     t1 h
	lw     t4 0(t1)
	add    t5 t3 t4
	la     t1 i
	lw     t4 0(t1)
	add    t3 t5 t4
	la     t1 j
	lw     t4 0(t1)
	add    t5 t3 t4
	la     t1 k
	lw     t4 0(t1)
	add    t3 t5 t4
	la     t1 l
	lw     t4 0(t1)
	add    t5 t3 t4
	la     t1 m
	lw     t4 0(t1)
	add    t3 t5 t4
	la     t1 n
	lw     t4 0(t1)
	add    t5 t3 t4
	la     t1 o
	lw     t4 0(t1)
	add    t3 t5 t4
	la     t1 p
	lw     t4 0(t1)
	add    t5 t3 t4
	la     t1 q
	lw     t4 0(t1)
	add    t3 t5 t4
	la     t1 r
	lw     t4 0(t1)
	add    t5 t3 t4
	la     t1 s
	lw     t4 0(t1)
	add    t3 t5 t4
	la     t1 t
	lw     t4 0(t1)
	add    t5 t3 t4
	la     t1 u
	lw     t4 0(t1)
	add    t3 t5 t4
	la     t1 v
	lw     t4 0(t1)
	add    t5 t3 t4
	la     t1 w
	lw     t4 0(t1)
	add    t3 t5 t4
	la     t1 x
	lw     t4 0(t1)
	add    t5 t3 t4
	la     t1 y
	lw     t4 0(t1)
	add    t3 t5 t4
	la     t1 z
	lw     t4 0(t1)
	add    t5 t3 t4
	la     t1 aa
	lw     t4 0(t1)
	add    t3 t5 t4
	la     t1 bb
	lw     t4 0(t1)
	add    t5 t3 t4
	la     t1 cc
	lw     t4 0(t1)
	add    t3 t5 t4
	la     t1 dd
	lw     t4 0(t1)
	add    t5 t3 t4
	sw     t5 0(sp)
	li     t0 1
	mv     t5 t0
	li     t0 2
	mv     t4 t0
	li     t0 3
	mv     t3 t0
	li     t0 4
	mv     t6 t0
	li     t0 5
	mv     s0 t0
	li     t0 6
	mv     s1 t0
	li     t0 7
	mv     s2 t0
	li     t0 8
	mv     s3 t0
	li     t0 9
	mv     s4 t0
	li     t0 10
	mv     s5 t0
	li     t0 11
	sw     t0 48(sp)
	li     t0 12
	sw     t0 44(sp)
	li     t0 13
	sw     t0 40(sp)
	li     t0 14
	sw     t0 36(sp)
	li     t0 15
	sw     t0 28(sp)
	li     t0 16
	sw     t0 24(sp)
	li     t0 17
	sw     t0 20(sp)
	li     t0 18
	sw     t0 16(sp)
	li     t0 19
	sw     t0 12(sp)
	li     t0 20
	sw     t0 8(sp)
	li     t0 21
	sw     t0 4(sp)
	li     t0 22
	mv     a6 t0
	li     t0 23
	mv     t2 t0
	li     t0 24
	mv     a5 t0
	li     t0 25
	mv     a4 t0
	li     t0 26
	mv     a3 t0
	li     t0 27
	mv     a2 t0
	li     t0 28
	mv     a1 t0
	li     t0 29
	mv     s11 t0
	li     t0 30
	mv     s10 t0
	mv     s9 t5
	mv     s8 t4
	add    s7 s9 s8
	mv     s8 t3
	mv     s9 t6
	mul    s6 s8 s9
	sub    s9 s7 s6
	sw     s9 32(sp)
	mv     s6 s0
	mv     s7 s1
	div    s8 s6 s7
	mv     s7 s2
	add    s6 s8 s7
	mv     s7 s3
	sub    s8 s6 s7
	sw     s8 60(sp)
	mv     s7 s4
	mv     s6 s5
	mul    s8 s7 s6
	lw     s6 48(sp)
	sub    s7 s8 s6
	lw     s6 44(sp)
	add    s8 s7 s6
	sw     s8 52(sp)
	lw     s6 40(sp)
	lw     s7 36(sp)
	lw     s8 28(sp)
	add    s9 s7 s8
	div    s8 s6 s9
	sw     s8 56(sp)
	lw     s9 24(sp)
	lw     s6 20(sp)
	lw     s7 16(sp)
	mul    s8 s6 s7
	sub    s7 s9 s8
	sw     s7 64(sp)
	lw     s8 12(sp)
	lw     s9 8(sp)
	add    s6 s8 s9
	lw     s9 4(sp)
	sub    s8 s6 s9
	mv     s7 s8
	mv     s9 a6
	mv     a6 t2
	mul    t2 s9 a6
	mv     a6 a5
	add    a5 t2 a6
	mv     s8 a5
	mv     a6 a4
	mv     a4 a3
	sub    a3 a6 a4
	mv     a4 a2
	mv     a2 a1
	add    a1 a4 a2
	div    a2 a3 a1
	mv     a5 a2
	mv     a1 s11
	mv     s11 s10
	mv     s10 t5
	sub    a3 s11 s10
	mul    s10 a1 a3
	mv     a3 t4
	add    a1 s10 a3
	mv     a2 a1
	mv     a3 t3
	mv     s10 t6
	add    s11 a3 s10
	mv     s10 s0
	mul    a3 s11 s10
	mv     s10 s1
	sub    s11 a3 s10
	mv     a1 s11
	mv     s10 s2
	mv     a3 s3
	mv     a4 s4
	mul    a6 a3 a4
	add    a4 s10 a6
	mv     a6 s5
	sub    s10 a4 a6
	mv     s11 s10
	lw     a6 60(sp)
	lw     a4 52(sp)
	mul    a3 a6 a4
	lw     a4 56(sp)
	sub    a6 a3 a4
	mv     s10 a6
	lw     a4 64(sp)
	mv     a3 s7
	add    t2 a4 a3
	mv     a3 s8
	mv     a4 a5
	sub    s9 a3 a4
	div    a4 t2 s9
	mv     a6 a4
	mv     s9 a2
	mv     t2 a1
	mul    a3 s9 t2
	mv     t2 s11
	add    s9 a3 t2
	mv     a4 s9
	mv     t2 s10
	mv     a3 a6
	add    s6 t2 a3
	mv     a3 a4
	sub    t2 s6 a3
	sw     t2 72(sp)
	lw     a3 72(sp)
	lw     s6 60(sp)
	lw     t2 52(sp)
	div    s9 s6 t2
	mul    t2 a3 s9
	sw     t2 68(sp)
	mv     s9 t5
	mv     t5 t4
	add    t4 s9 t5
	mv     t5 t3
	mv     t3 t6
	mul    t6 t5 t3
	add    t3 t4 t6
	mv     t6 s0
	sub    s0 t3 t6
	mv     t2 s0
	mv     t6 s1
	mv     s1 s2
	div    s2 t6 s1
	mv     s1 s3
	mv     s3 s4
	sub    s4 s1 s3
	add    s3 s2 s4
	mv     s0 s3
	mv     s4 s5
	lw     s5 48(sp)
	lw     s2 44(sp)
	sub    s1 s5 s2
	mul    s2 s4 s1
	lw     s1 40(sp)
	div    s4 s2 s1
	mv     s3 s4
	lw     s1 36(sp)
	lw     s2 28(sp)
	lw     s5 24(sp)
	mul    t6 s2 s5
	add    s5 s1 t6
	lw     t6 20(sp)
	sub    s1 s5 t6
	mv     s4 s1
	lw     t6 16(sp)
	lw     s5 12(sp)
	lw     s2 8(sp)
	div    t3 s5 s2
	sub    s2 t6 t3
	lw     t3 4(sp)
	add    t6 s2 t3
	mv     s1 t6
	lw     t3 0(sp)
	lw     s2 32(sp)
	add    s5 t3 s2
	lw     s2 60(sp)
	add    t3 s5 s2
	lw     s2 52(sp)
	add    s5 t3 s2
	lw     s2 56(sp)
	add    t3 s5 s2
	lw     s2 64(sp)
	add    s5 t3 s2
	mv     s2 s7
	add    s7 s5 s2
	mv     s2 s8
	add    s8 s7 s2
	mv     s2 a5
	add    a5 s8 s2
	mv     s2 a2
	add    a2 a5 s2
	mv     s2 a1
	add    a1 a2 s2
	mv     s2 s11
	add    s11 a1 s2
	mv     s2 s10
	add    s10 s11 s2
	mv     s2 a6
	add    a6 s10 s2
	mv     s2 a4
	add    a4 a6 s2
	lw     s2 72(sp)
	add    a6 a4 s2
	lw     s2 68(sp)
	add    a4 a6 s2
	mv     s2 t2
	add    t2 a4 s2
	mv     s2 s0
	add    s0 t2 s2
	mv     s2 s3
	add    s3 s0 s2
	mv     s2 s4
	add    s4 s3 s2
	mv     s2 s1
	add    s1 s4 s2
	mv     t6 s1
	mv     s1 t6
	addi   sp sp 76
	mv     a0 s1
	li     a7 93
	ecall
	li     t0 0
	addi   sp sp 76
	mv     a0 t0
	li     a7 93
	ecall
