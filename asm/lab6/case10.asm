
	.data
x:
	.word 1

	.data
y:
	.word 2

	.data
z:
	.word 3

	.data
a:
	.word 4

	.data
b:
	.word 5

	.data
c:
	.word 6

	.data
d:
	.word 7

	.data
e:
	.word 8

	.data
f:
	.word 9

	.data
g:
	.word 10

	.data
h:
	.word 11

	.data
i:
	.word 12

	.data
j:
	.word 13

	.data
k:
	.word 14

	.data
l:
	.word 15

	.data
m:
	.word 16

	.data
n:
	.word 17

	.data
o:
	.word 18

	.data
p:
	.word 19

	.data
q:
	.word 20

	.data
r:
	.word 21

	.data
s:
	.word 22

	.data
t:
	.word 23

	.data
u:
	.word 24

	.data
v:
	.word 25

	.data
w:
	.word 26

	.data
x2:
	.word 27

	.data
y2:
	.word 28

	.data
z2:
	.word 29

	.data
a2:
	.word 30

	.text
	.globl main
main:
	addi   sp sp -12
	li     t0 1
	mv     t2 t0
	li     t0 2
	mv     t3 t0
	li     t0 3
	mv     t4 t0
	li     t0 4
	mv     t5 t0
	li     t0 5
	mv     t6 t0
	li     t0 6
	mv     s0 t0
	li     t0 7
	mv     s1 t0
	li     t0 8
	mv     s2 t0
	li     t0 9
	mv     s3 t0
	li     t0 10
	sw     t0 8(sp)
	li     t0 11
	mv     s5 t0
	li     t0 12
	mv     s6 t0
	li     t0 13
	mv     s7 t0
	li     t0 14
	sw     t0 4(sp)
	li     t0 15
	sw     t0 0(sp)
	li     t0 16
	mv     s10 t0
	li     t0 17
	mv     s11 t0
	li     t0 18
	mv     a1 t0
	li     t0 19
	mv     a2 t0
	li     t0 20
	mv     a3 t0
	li     t0 21
	mv     a4 t0
	li     t0 22
	mv     a5 t0
	li     t0 23
	mv     a6 t0
	li     t0 24
	mv     a6 t0
	li     t0 25
	mv     a6 t0
	la     t1 x
	lw     a6 0(t1)
	la     t1 y
	lw     s9 0(t1)
	add    s8 a6 s9
	la     t1 z
	lw     s9 0(t1)
	add    a6 s8 s9
	mv     t2 a6
	la     t1 a
	lw     a6 0(t1)
	la     t1 b
	lw     s9 0(t1)
	mul    s8 a6 s9
	la     t1 c
	lw     s9 0(t1)
	sub    a6 s8 s9
	mv     t3 a6
	la     t1 d
	lw     a6 0(t1)
	la     t1 e
	lw     s9 0(t1)
	div    s8 a6 s9
	la     t1 f
	lw     s9 0(t1)
	add    a6 s8 s9
	mv     t4 a6
	la     t1 g
	lw     a6 0(t1)
	la     t1 h
	lw     s9 0(t1)
	add    s8 a6 s9
	la     t1 i
	lw     s9 0(t1)
	la     t1 j
	lw     a6 0(t1)
	sub    s4 s9 a6
	mul    a6 s8 s4
	mv     t5 a6
	la     t1 k
	lw     a6 0(t1)
	la     t1 l
	lw     s4 0(t1)
	mul    s8 a6 s4
	la     t1 m
	lw     s4 0(t1)
	add    a6 s8 s4
	mv     t6 a6
	mv     a6 t2
	mv     s4 t3
	sub    s8 a6 s4
	mv     s4 t4
	add    a6 s8 s4
	mv     t2 a6
	mv     a6 t5
	mv     s4 t6
	mul    s8 a6 s4
	mv     t5 s8
	mv     s8 t2
	mv     s4 t5
	div    a6 s8 s4
	mv     t6 a6
	mv     a6 s1
	mv     s1 s2
	add    s2 a6 s1
	mv     s1 s3
	sub    s3 s2 s1
	mv     s0 s3
	mv     s3 s5
	mv     s5 s6
	mul    s6 s3 s5
	mv     s5 s7
	add    s7 s6 s5
	sw     s7 8(sp)
	mv     s7 s10
	mv     s10 s11
	add    s11 s7 s10
	mv     s10 a1
	mv     a1 a2
	sub    a2 s10 a1
	mul    a1 s11 a2
	sw     a1 4(sp)
	mv     a1 a3
	mv     a3 a4
	add    a4 a1 a3
	mv     a3 a5
	sub    a5 a4 a3
	sw     a5 0(sp)
	mv     a3 t2
	mv     t2 t3
	add    t3 a3 t2
	mv     t2 t4
	add    t4 t3 t2
	mv     t2 t5
	add    t5 t4 t2
	mv     t2 t6
	add    t6 t5 t2
	mv     t2 s0
	add    s0 t6 t2
	lw     t2 8(sp)
	add    t6 s0 t2
	lw     t2 4(sp)
	add    s0 t6 t2
	lw     t2 0(sp)
	add    t6 s0 t2
	mv     a5 t6
	mv     t6 a5
	addi   sp sp 12
	mv     a0 t6
	li     a7 93
	ecall
	li     t0 0
	addi   sp sp 12
	mv     a0 t0
	li     a7 93
	ecall
