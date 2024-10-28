
	.data
g1:
	.word 1

	.data
g2:
	.word 2

	.data
g3:
	.word 3

	.data
g4:
	.word 4

	.data
g5:
	.word 5

	.data
g6:
	.word 6

	.data
g7:
	.word 7

	.data
g8:
	.word 8

	.data
g9:
	.word 9

	.data
g10:
	.word 10

	.data
g11:
	.word 11

	.data
g12:
	.word 12

	.data
g13:
	.word 13

	.data
g14:
	.word 14

	.data
g15:
	.word 15

	.data
g16:
	.word 16

	.data
g17:
	.word 17

	.data
g18:
	.word 18

	.data
g19:
	.word 19

	.data
g20:
	.word 20

	.text
	.globl main
main:
	addi   sp sp -4
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
	sw     t0 0(sp)
	li     t0 20
	mv     a3 t0
	la     t1 g1
	lw     a4 0(t1)
	la     t1 g2
	lw     a5 0(t1)
	add    a6 a4 a5
	la     t1 g3
	lw     a5 0(t1)
	la     t1 g4
	lw     a4 0(t1)
	mul    a2 a5 a4
	sub    a4 a6 a2
	mv     t2 a4
	la     t1 g5
	lw     a4 0(t1)
	la     t1 g6
	lw     a2 0(t1)
	div    a6 a4 a2
	la     t1 g7
	lw     a2 0(t1)
	add    a4 a6 a2
	la     t1 g8
	lw     a2 0(t1)
	sub    a6 a4 a2
	mv     t3 a6
	la     t1 g9
	lw     a6 0(t1)
	la     t1 g10
	lw     a2 0(t1)
	mul    a4 a6 a2
	la     t1 g11
	lw     a2 0(t1)
	sub    a6 a4 a2
	la     t1 g12
	lw     a2 0(t1)
	add    a4 a6 a2
	mv     t4 a4
	la     t1 g13
	lw     a4 0(t1)
	la     t1 g14
	lw     a2 0(t1)
	la     t1 g15
	lw     a6 0(t1)
	add    a5 a2 a6
	div    a6 a4 a5
	mv     t5 a6
	la     t1 g16
	lw     a6 0(t1)
	la     t1 g17
	lw     a5 0(t1)
	la     t1 g18
	lw     a4 0(t1)
	mul    a2 a5 a4
	sub    a4 a6 a2
	mv     t6 a4
	mv     a4 t2
	mv     a2 t3
	add    a6 a4 a2
	mv     a2 t4
	sub    a4 a6 a2
	mv     t2 a4
	mv     a4 t5
	mv     a2 t6
	mul    a6 a4 a2
	mv     t5 a6
	mv     a6 t2
	mv     a2 t3
	mv     a4 t4
	add    a5 a2 a4
	div    a4 a6 a5
	mv     t6 a4
	mv     a4 s1
	mv     s1 s2
	add    s2 a4 s1
	mv     s1 s3
	sub    s3 s2 s1
	mv     s0 s3
	mv     s3 s5
	mv     s5 s6
	mul    s6 s3 s5
	mv     s5 s7
	add    s7 s6 s5
	mv     s4 s7
	mv     s7 s9
	mv     s9 s10
	add    s10 s7 s9
	mv     s9 s11
	mv     s11 a1
	sub    a1 s9 s11
	mul    s11 s10 a1
	mv     s8 s11
	mv     s11 a3
	mv     a3 s0
	sub    a1 s11 a3
	sw     a1 0(sp)
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
	mv     t2 s4
	add    s4 s0 t2
	mv     t2 s8
	add    s8 s4 t2
	lw     t2 0(sp)
	add    s4 s8 t2
	mv     a1 s4
	mv     s4 a1
	addi   sp sp 4
	mv     a0 s4
	li     a7 93
	ecall
	li     t0 0
	addi   sp sp 4
	mv     a0 t0
	li     a7 93
	ecall
