
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
xx2:
	.word 27

	.data
y2:
	.word 28

	.data
z2:
	.word 29

	.data
aa2:
	.word 30

	.data
b2:
	.word 31

	.data
c2:
	.word 32

	.data
d2:
	.word 33

	.data
e2:
	.word 34

	.data
ff2:
	.word 35

	.data
g2:
	.word 36

	.data
h2:
	.word 37

	.data
i2:
	.word 38

	.data
j2:
	.word 39

	.data
k2:
	.word 40

	.text
	.globl main
main:
	addi   sp sp -84
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
	mv     s4 t0
	li     t0 11
	mv     s5 t0
	li     t0 12
	mv     s6 t0
	li     t0 13
	mv     s7 t0
	li     t0 14
	mv     s8 t0
	li     t0 15
	mv     s9 t0
	li     t0 16
	mv     s10 t0
	li     t0 17
	mv     s11 t0
	li     t0 18
	mv     a1 t0
	li     t0 19
	mv     a2 t0
	li     t0 20
	sw     t0 80(sp)
	li     t0 21
	sw     t0 76(sp)
	li     t0 22
	sw     t0 72(sp)
	li     t0 23
	sw     t0 68(sp)
	li     t0 24
	sw     t0 0(sp)
	li     t0 25
	sw     t0 4(sp)
	li     t0 26
	sw     t0 8(sp)
	li     t0 27
	sw     t0 12(sp)
	li     t0 28
	sw     t0 16(sp)
	li     t0 29
	sw     t0 20(sp)
	li     t0 30
	sw     t0 24(sp)
	li     t0 31
	sw     t0 28(sp)
	li     t0 32
	sw     t0 32(sp)
	li     t0 33
	sw     t0 36(sp)
	li     t0 34
	sw     t0 40(sp)
	li     t0 35
	sw     t0 44(sp)
	li     t0 36
	sw     t0 48(sp)
	li     t0 37
	sw     t0 52(sp)
	li     t0 38
	sw     t0 56(sp)
	li     t0 39
	sw     t0 60(sp)
	li     t0 40
	sw     t0 64(sp)
	la     t1 x
	lw     a6 0(t1)
	la     t1 y
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 z
	lw     a5 0(t1)
	la     t1 a
	lw     a6 0(t1)
	add    a3 a5 a6
	mul    a6 a4 a3
	la     t1 b
	lw     a3 0(t1)
	la     t1 c
	lw     a4 0(t1)
	add    a5 a3 a4
	la     t1 d
	lw     a4 0(t1)
	div    a3 a5 a4
	sub    a4 a6 a3
	la     t1 x
	sw     a4 0(t1)
	la     t1 e
	lw     a4 0(t1)
	la     t1 f
	lw     a3 0(t1)
	mul    a6 a4 a3
	la     t1 g
	lw     a3 0(t1)
	add    a4 a6 a3
	la     t1 h
	lw     a3 0(t1)
	sub    a6 a4 a3
	la     t1 i
	lw     a3 0(t1)
	add    a4 a6 a3
	la     t1 e
	sw     a4 0(t1)
	la     t1 j
	lw     a4 0(t1)
	la     t1 k
	lw     a3 0(t1)
	mul    a6 a4 a3
	la     t1 l
	lw     a3 0(t1)
	mul    a4 a6 a3
	la     t1 m
	lw     a3 0(t1)
	la     t1 n
	lw     a6 0(t1)
	div    a5 a3 a6
	sub    a6 a4 a5
	la     t1 o
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 j
	sw     a4 0(t1)
	la     t1 p
	lw     a4 0(t1)
	la     t1 q
	lw     a5 0(t1)
	add    a6 a4 a5
	la     t1 r
	lw     a5 0(t1)
	la     t1 s
	lw     a4 0(t1)
	add    a3 a5 a4
	mul    a4 a6 a3
	la     t1 t
	lw     a3 0(t1)
	div    a6 a4 a3
	la     t1 u
	lw     a3 0(t1)
	sub    a4 a6 a3
	la     t1 p
	sw     a4 0(t1)
	la     t1 v
	lw     a4 0(t1)
	la     t1 w
	lw     a3 0(t1)
	sub    a6 a4 a3
	la     t1 xx2
	lw     a3 0(t1)
	la     t1 y2
	lw     a4 0(t1)
	mul    a5 a3 a4
	add    a4 a6 a5
	la     t1 z2
	lw     a5 0(t1)
	sub    a6 a4 a5
	la     t1 aa2
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 v
	sw     a4 0(t1)
	la     t1 b2
	lw     a4 0(t1)
	la     t1 c2
	lw     a5 0(t1)
	mul    a6 a4 a5
	la     t1 d2
	lw     a5 0(t1)
	sub    a4 a6 a5
	la     t1 e2
	lw     a5 0(t1)
	la     t1 ff2
	lw     a6 0(t1)
	mul    a3 a5 a6
	add    a6 a4 a3
	la     t1 g2
	lw     a3 0(t1)
	sub    a4 a6 a3
	la     t1 b2
	sw     a4 0(t1)
	la     t1 h2
	lw     a4 0(t1)
	la     t1 i2
	lw     a3 0(t1)
	la     t1 j2
	lw     a6 0(t1)
	mul    a5 a3 a6
	add    a6 a4 a5
	la     t1 k2
	lw     a5 0(t1)
	sub    a4 a6 a5
	la     t1 l
	lw     a5 0(t1)
	la     t1 m
	lw     a6 0(t1)
	mul    a3 a5 a6
	add    a6 a4 a3
	la     t1 h2
	sw     a6 0(t1)
	mv     a6 t2
	mv     a3 t3
	add    a4 a6 a3
	mv     a3 t4
	mv     a6 t5
	add    a5 a3 a6
	mul    a6 a4 a5
	mv     a5 t6
	mv     a4 s0
	add    a3 a5 a4
	mv     a4 s1
	div    a5 a3 a4
	sub    a4 a6 a5
	mv     t2 a4
	mv     a4 s2
	mv     a5 s3
	mul    a6 a4 a5
	mv     a5 s4
	add    a4 a6 a5
	mv     a5 s5
	sub    a6 a4 a5
	mv     a5 s6
	add    a4 a6 a5
	mv     s2 a4
	mv     a4 s7
	mv     a5 s8
	mul    a6 a4 a5
	mv     a5 s9
	mul    a4 a6 a5
	mv     a5 s10
	mv     a6 s11
	div    a3 a5 a6
	sub    a6 a4 a3
	mv     a3 a1
	add    a4 a6 a3
	mv     s7 a4
	mv     a4 a2
	lw     a3 80(sp)
	add    a6 a4 a3
	lw     a3 76(sp)
	lw     a4 72(sp)
	add    a5 a3 a4
	mul    a4 a6 a5
	lw     a5 68(sp)
	div    a6 a4 a5
	lw     a5 0(sp)
	sub    a4 a6 a5
	mv     a2 a4
	lw     a4 4(sp)
	lw     a5 8(sp)
	sub    a6 a4 a5
	lw     a5 12(sp)
	lw     a4 16(sp)
	mul    a3 a5 a4
	add    a4 a6 a3
	lw     a3 20(sp)
	sub    a6 a4 a3
	lw     a3 24(sp)
	add    a4 a6 a3
	sw     a4 4(sp)
	lw     a4 28(sp)
	lw     a3 32(sp)
	mul    a6 a4 a3
	lw     a3 36(sp)
	sub    a4 a6 a3
	lw     a3 40(sp)
	lw     a6 44(sp)
	mul    a5 a3 a6
	add    a6 a4 a5
	lw     a5 48(sp)
	sub    a4 a6 a5
	sw     a4 28(sp)
	lw     a4 52(sp)
	lw     a5 56(sp)
	lw     a6 60(sp)
	mul    a3 a5 a6
	add    a6 a4 a3
	lw     a3 64(sp)
	sub    a4 a6 a3
	mv     a3 s9
	mv     a6 s10
	mul    a5 a3 a6
	add    a6 a4 a5
	sw     a6 52(sp)
	la     t1 x
	lw     a6 0(t1)
	la     t1 y
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 z
	lw     a5 0(t1)
	add    a6 a4 a5
	la     t1 a
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 b
	lw     a5 0(t1)
	add    a6 a4 a5
	la     t1 c
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 d
	lw     a5 0(t1)
	add    a6 a4 a5
	la     t1 e
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 f
	lw     a5 0(t1)
	add    a6 a4 a5
	la     t1 g
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 h
	lw     a5 0(t1)
	add    a6 a4 a5
	la     t1 i
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 j
	lw     a5 0(t1)
	add    a6 a4 a5
	la     t1 k
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 l
	lw     a5 0(t1)
	add    a6 a4 a5
	la     t1 m
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 n
	lw     a5 0(t1)
	add    a6 a4 a5
	la     t1 o
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 p
	lw     a5 0(t1)
	add    a6 a4 a5
	la     t1 q
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 r
	lw     a5 0(t1)
	add    a6 a4 a5
	la     t1 s
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 t
	lw     a5 0(t1)
	add    a6 a4 a5
	la     t1 u
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 v
	lw     a5 0(t1)
	add    a6 a4 a5
	la     t1 w
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 xx2
	lw     a5 0(t1)
	add    a6 a4 a5
	la     t1 y2
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 z2
	lw     a5 0(t1)
	add    a6 a4 a5
	la     t1 aa2
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 b2
	lw     a5 0(t1)
	add    a6 a4 a5
	la     t1 c2
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 d2
	lw     a5 0(t1)
	add    a6 a4 a5
	la     t1 e2
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 ff2
	lw     a5 0(t1)
	add    a6 a4 a5
	la     t1 g2
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 h2
	lw     a5 0(t1)
	add    a6 a4 a5
	la     t1 i2
	lw     a5 0(t1)
	add    a4 a6 a5
	la     t1 j2
	lw     a5 0(t1)
	add    a6 a4 a5
	la     t1 k2
	lw     a5 0(t1)
	add    a4 a6 a5
	mv     a5 t2
	add    t2 a4 a5
	mv     a5 t3
	add    t3 t2 a5
	mv     a5 t4
	add    t4 t3 a5
	mv     a5 t5
	add    t5 t4 a5
	mv     a5 t6
	add    t6 t5 a5
	mv     a5 s0
	add    s0 t6 a5
	mv     a5 s1
	add    s1 s0 a5
	mv     a5 s2
	add    s2 s1 a5
	mv     a5 s3
	add    s3 s2 a5
	mv     a5 s4
	add    s4 s3 a5
	mv     a5 s5
	add    s5 s4 a5
	mv     a5 s6
	add    s6 s5 a5
	mv     a5 s7
	add    s7 s6 a5
	mv     a5 s8
	add    s8 s7 a5
	mv     a5 s9
	add    s9 s8 a5
	mv     a5 s10
	add    s10 s9 a5
	mv     a5 s11
	add    s11 s10 a5
	mv     a5 a1
	add    a1 s11 a5
	mv     a5 a2
	add    a2 a1 a5
	lw     a5 80(sp)
	add    a1 a2 a5
	lw     a5 76(sp)
	add    a2 a1 a5
	lw     a5 72(sp)
	add    a1 a2 a5
	lw     a5 68(sp)
	add    a2 a1 a5
	lw     a5 0(sp)
	add    a1 a2 a5
	lw     a5 4(sp)
	add    a2 a1 a5
	lw     a5 8(sp)
	add    a1 a2 a5
	lw     a5 12(sp)
	add    a2 a1 a5
	lw     a5 16(sp)
	add    a1 a2 a5
	lw     a5 20(sp)
	add    a2 a1 a5
	lw     a5 24(sp)
	add    a1 a2 a5
	lw     a5 28(sp)
	add    a2 a1 a5
	lw     a5 32(sp)
	add    a1 a2 a5
	lw     a5 36(sp)
	add    a2 a1 a5
	lw     a5 40(sp)
	add    a1 a2 a5
	lw     a5 44(sp)
	add    a2 a1 a5
	lw     a5 48(sp)
	add    a1 a2 a5
	lw     a5 52(sp)
	add    a2 a1 a5
	lw     a5 56(sp)
	add    a1 a2 a5
	lw     a5 60(sp)
	add    a2 a1 a5
	lw     a5 64(sp)
	add    a1 a2 a5
	addi   sp sp 84
	mv     a0 a1
	li     a7 93
	ecall
	li     t0 0
	addi   sp sp 84
	mv     a0 t0
	li     a7 93
	ecall
