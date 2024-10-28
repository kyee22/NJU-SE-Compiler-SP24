
	.data
GLOBAL_CONST1:
	.word 15

	.data
GLOBAL_CONST2:
	.word 8

	.data
GLOBAL_CONST3:
	.word 3

	.data
globalVar1:
	.word 50

	.data
globalVar2:
	.word 35

	.text
	.globl main
main:
	addi   sp sp 0
	li     t0 12
	mv     t2 t0
	li     t0 24
	mv     t3 t0
	li     t0 36
	mv     t4 t0
	li     t0 48
	mv     t5 t0
	li     t0 60
	mv     t6 t0
	li     t0 72
	mv     s0 t0
	li     t0 84
	mv     s1 t0
	li     t0 96
	mv     s1 t0
	li     t0 1
	mv     s1 t0
	li     t0 120
	mv     s1 t0
	li     t0 132
	mv     s1 t0
	li     t0 144
	mv     s1 t0
	li     t0 156
	mv     s1 t0
	li     t0 168
	mv     s1 t0
	li     t0 180
	mv     s1 t0
	li     t0 192
	mv     s1 t0
	li     t0 204
	mv     s1 t0
	li     t0 216
	mv     s1 t0
	li     t0 228
	mv     s1 t0
	li     t0 240
	mv     s1 t0
	li     t0 252
	mv     s1 t0
	mv     s2 t2
	mv     s3 t3
	add    s4 s2 s3
	mv     s3 t4
	mv     s2 t5
	div    s5 s3 s2
	mul    s2 s4 s5
	mv     s1 s2
	la     t1 GLOBAL_CONST1
	lw     s5 0(t1)
	mv     s4 t2
	mul    s3 s5 s4
	mv     s4 t3
	add    s5 s3 s4
	mv     s4 t6
	mv     s3 s0
	div    s6 s4 s3
	div    s3 s5 s6
	mv     s2 s3
	la     t1 GLOBAL_CONST2
	lw     s6 0(t1)
	mv     s5 t5
	mv     s4 t2
	mv     s7 t3
	div    s8 s4 s7
	mul    s7 s5 s8
	add    s8 s6 s7
	la     t1 GLOBAL_CONST3
	lw     s7 0(t1)
	li     t1 1
	add    s6 s7 t1
	rem    s7 s8 s6
	mv     s3 s7
	mv     s6 t2
	mv     s8 t3
	sub    s5 s6 s8
	li     t0 0
	sub    s8 t0 s5
	la     t1 GLOBAL_CONST1
	lw     s5 0(t1)
	mul    s6 s8 s5
	mv     s5 s0
	mv     s8 t6
	div    s4 s5 s8
	add    s8 s6 s4
	mv     s4 t5
	mv     s6 t4
	div    s5 s4 s6
	div    s6 s8 s5
	mv     s7 s6
	mv     s5 t2
	la     t1 GLOBAL_CONST3
	lw     s8 0(t1)
	sub    s4 s5 s8
	mv     s4 t3
	mv     s5 t4
	div    s9 s4 s5
	mul    s5 s8 s9
	mv     s6 s5
	mv     s9 t2
	mv     s8 t3
	mul    s4 s9 s8
	la     t1 GLOBAL_CONST2
	lw     s8 0(t1)
	sub    s9 s4 s8
	la     t1 GLOBAL_CONST1
	lw     s8 0(t1)
	mv     s4 t5
	div    s10 s8 s4
	add    s4 s9 s10
	mv     s5 s4
	mv     s10 t4
	mv     s9 t3
	div    s8 s10 s9
	la     t1 GLOBAL_CONST1
	lw     s9 0(t1)
	mv     s10 t2
	sub    s11 s9 s10
	mul    s10 s8 s11
	li     t0 0
	sub    s11 t0 s10
	mv     s10 s0
	mv     s8 t6
	div    s9 s10 s8
	rem    s8 s11 s9
	mv     s4 s8
	mv     s4 t2
	mv     s9 t3
	add    s11 s4 s9
	mv     s9 t4
	sub    s4 s11 s9
	mv     s9 t5
	la     t1 GLOBAL_CONST3
	lw     s11 0(t1)
	div    s10 s9 s11
	mul    s11 s4 s10
	mv     s8 s11
	la     t1 GLOBAL_CONST2
	lw     s8 0(t1)
	mv     s10 t2
	mv     s4 t3
	rem    s9 s10 s4
	mul    s4 s8 s9
	mv     s9 t4
	mv     s8 t5
	sub    s10 s9 s8
	add    s8 s4 s10
	mv     s10 t6
	mv     s4 s0
	div    s9 s10 s4
	rem    s4 s8 s9
	mv     s11 s4
	mv     s11 t2
	mv     s9 t3
	mv     s8 t4
	sub    s10 s9 s8
	mul    s8 s11 s10
	la     t1 GLOBAL_CONST1
	lw     s10 0(t1)
	add    s11 s8 s10
	mv     s10 t5
	la     t1 GLOBAL_CONST2
	lw     s8 0(t1)
	div    s9 s10 s8
	div    s8 s11 s9
	mv     s4 s8
	mv     s4 t2
	mv     s9 t3
	mv     s11 t4
	sub    s10 s9 s11
	mul    s11 s4 s10
	la     t1 GLOBAL_CONST3
	lw     s10 0(t1)
	rem    s4 s11 s10
	mv     s10 t5
	mv     s11 t6
	div    s9 s10 s11
	add    s11 s4 s9
	li     t0 0
	sub    s9 t0 s11
	mv     s8 s9
	mv     s8 t2
	mv     s11 t3
	add    s4 s8 s11
	la     t1 GLOBAL_CONST1
	lw     s11 0(t1)
	mv     s8 t4
	sub    s10 s11 s8
	mul    s8 s4 s10
	mv     s10 t5
	la     t1 GLOBAL_CONST2
	lw     s4 0(t1)
	div    s11 s10 s4
	rem    s4 s8 s11
	mv     s9 s4
	la     t1 GLOBAL_CONST3
	lw     s9 0(t1)
	mv     s11 t2
	mv     s8 t3
	div    s10 s11 s8
	add    s8 s9 s10
	mv     s10 t4
	mv     s9 t5
	div    s11 s10 s9
	mul    s9 s8 s11
	mv     s4 s9
	mv     s4 t2
	mv     s11 t3
	mv     s8 t4
	sub    s10 s11 s8
	la     t1 GLOBAL_CONST1
	lw     s8 0(t1)
	mul    s11 s10 s8
	add    s8 s4 s11
	li     t0 0
	sub    s11 t0 s8
	mv     s8 t5
	mv     s4 t6
	div    s10 s8 s4
	div    s4 s11 s10
	mv     s9 s4
	mv     s9 t2
	mv     s10 t3
	mv     s11 t4
	add    s8 s10 s11
	rem    s11 s9 s8
	la     t1 GLOBAL_CONST2
	lw     s8 0(t1)
	mv     s9 t5
	sub    s10 s8 s9
	mul    s9 s11 s10
	mv     s4 s9
	mv     s4 t2
	mv     s10 t3
	sub    s11 s4 s10
	li     t0 0
	sub    s10 t0 s11
	mv     s11 t4
	la     t1 GLOBAL_CONST3
	lw     s4 0(t1)
	div    s8 s11 s4
	mul    s4 s10 s8
	mv     s8 t5
	mv     s10 t6
	mv     s11 s0
	div    a1 s10 s11
	div    s11 s8 a1
	rem    a1 s4 s11
	mv     s9 a1
	mv     s9 t2
	mv     s11 t3
	la     t1 GLOBAL_CONST2
	lw     s4 0(t1)
	add    s8 s11 s4
	div    s4 s9 s8
	mv     s8 t4
	mv     s9 t5
	mv     s11 t6
	sub    s10 s9 s11
	rem    s11 s8 s10
	mul    s10 s4 s11
	mv     a1 s10
	la     t1 GLOBAL_CONST3
	lw     a1 0(t1)
	mv     s11 t2
	mv     s4 t3
	sub    s8 s11 s4
	mul    s4 a1 s8
	mv     s8 t4
	mv     a1 t5
	div    s11 s8 a1
	add    a1 s4 s11
	mv     s11 t6
	mv     s4 s0
	div    s8 s11 s4
	rem    s4 a1 s8
	mv     s10 s4
	mv     s10 t2
	la     t1 GLOBAL_CONST1
	lw     s8 0(t1)
	add    a1 s10 s8
	li     t0 0
	sub    s8 t0 a1
	mv     a1 t3
	mv     s10 t4
	sub    s11 a1 s10
	mul    s10 s8 s11
	mv     s11 t5
	la     t1 GLOBAL_CONST2
	lw     s8 0(t1)
	div    a1 s11 s8
	div    s8 s10 a1
	mv     s4 s8
	mv     s4 t2
	mv     a1 t3
	mv     s10 t4
	add    s11 a1 s10
	mul    s10 s4 s11
	la     t1 GLOBAL_CONST3
	lw     s11 0(t1)
	sub    s4 s10 s11
	mv     s11 t5
	mv     s10 t6
	mv     a1 s0
	add    s9 s10 a1
	div    a1 s11 s9
	div    s9 s4 a1
	mv     s8 s9
	la     t1 GLOBAL_CONST2
	lw     s8 0(t1)
	mv     a1 t2
	mv     s4 t3
	rem    s11 a1 s4
	sub    s4 s8 s11
	mv     s11 t4
	mv     s8 t5
	div    a1 s11 s8
	mul    s8 s4 a1
	mv     s9 s8
	la     t1 GLOBAL_CONST1
	lw     s9 0(t1)
	mv     a1 t2
	mv     s4 t3
	mul    s11 a1 s4
	mv     s4 t4
	mv     a1 t5
	div    s10 s4 a1
	div    a1 s11 s10
	add    s10 s9 a1
	li     t0 0
	sub    a1 t0 s10
	mv     s8 a1
	mv     s8 t2
	mv     s10 t3
	sub    s9 s8 s10
	la     t1 GLOBAL_CONST3
	lw     s10 0(t1)
	mv     s8 t4
	add    s11 s10 s8
	mul    s8 s9 s11
	mv     s11 t5
	mv     s9 t6
	div    s10 s11 s9
	div    s9 s8 s10
	mv     a1 s9
	mv     a1 t2
	mv     s10 t3
	add    s8 a1 s10
	li     t0 0
	sub    s10 t0 s8
	mv     s8 t4
	la     t1 GLOBAL_CONST1
	lw     a1 0(t1)
	rem    s11 s8 a1
	mul    a1 s10 s11
	mv     s11 t5
	mv     s10 t6
	mv     s8 s0
	add    s4 s10 s8
	div    s8 s11 s4
	div    s4 a1 s8
	mv     s9 s4
	mv     s9 t2
	mv     s8 t3
	mv     a1 t4
	sub    s11 s8 a1
	mul    a1 s9 s11
	la     t1 GLOBAL_CONST2
	lw     s11 0(t1)
	sub    s9 a1 s11
	mv     s11 t5
	la     t1 GLOBAL_CONST1
	lw     a1 0(t1)
	add    s8 s11 a1
	rem    a1 s9 s8
	mv     s4 a1
	la     t1 GLOBAL_CONST1
	lw     s4 0(t1)
	mv     s8 t2
	mv     s9 t3
	add    s11 s8 s9
	div    s9 s4 s11
	mv     s11 t4
	mv     s4 t5
	mv     s8 t6
	sub    s10 s4 s8
	rem    s8 s11 s10
	mul    s10 s9 s8
	mv     a1 s10
	mv     a1 t2
	mv     s8 t3
	mul    s9 a1 s8
	mv     s8 t4
	sub    a1 s9 s8
	la     t1 GLOBAL_CONST3
	lw     s8 0(t1)
	add    s9 a1 s8
	mv     s8 t5
	mv     a1 t6
	mv     s11 s0
	add    s4 a1 s11
	div    s11 s8 s4
	rem    s4 s9 s11
	mv     s10 s4
	mv     s10 t2
	la     t1 GLOBAL_CONST2
	lw     s11 0(t1)
	add    s9 s10 s11
	li     t0 0
	sub    s11 t0 s9
	mv     s9 t3
	mv     s10 t4
	sub    s8 s9 s10
	mul    s10 s11 s8
	mv     s8 t5
	mv     s11 s0
	rem    s9 s8 s11
	div    s11 s10 s9
	mv     s4 s11
	mv     s4 t2
	mv     s9 t3
	la     t1 GLOBAL_CONST1
	lw     s10 0(t1)
	mul    s8 s9 s10
	rem    s10 s4 s8
	mv     s8 t4
	mv     s4 t5
	sub    s9 s8 s4
	add    s4 s10 s9
	mv     s9 t6
	mv     s10 s0
	add    s8 s9 s10
	rem    s10 s4 s8
	mv     s11 s10
	mv     s11 t2
	mv     t2 t3
	mv     t3 t4
	add    t4 t2 t3
	mul    t3 s11 t4
	la     t1 GLOBAL_CONST3
	lw     t4 0(t1)
	sub    s11 t3 t4
	mv     t4 t5
	mv     t5 t6
	mv     t6 s0
	add    s0 t5 t6
	rem    t6 t4 s0
	div    s0 s11 t6
	mv     s10 s0
	mv     s0 s1
	mv     s1 s2
	add    s2 s0 s1
	mv     s1 s3
	mv     s3 s7
	mul    s7 s1 s3
	mv     s3 s6
	mv     s6 s5
	add    s5 s3 s6
	div    s6 s7 s5
	sub    s5 s2 s6
	li     t1 256
	rem    s6 s5 t1
	addi   sp sp 0
	mv     a0 s6
	li     a7 93
	ecall
	li     t0 0
	addi   sp sp 0
	mv     a0 t0
	li     a7 93
	ecall
