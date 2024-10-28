
	.data
i:
	.word 15

	.data
j:
	.word 3

	.data
k:
	.word 2

	.text
	.globl main
main:
	addi   sp sp 0
	la     t1 i
	lw     t3 0(t1)
	la     t1 j
	lw     t4 0(t1)
	add    t5 t3 t4
	la     t1 k
	lw     t4 0(t1)
	mul    t3 t5 t4
	la     t1 i
	lw     t4 0(t1)
	la     t1 j
	lw     t5 0(t1)
	div    t6 t4 t5
	sub    t5 t3 t6
	la     t1 i
	lw     t6 0(t1)
	la     t1 j
	lw     t3 0(t1)
	rem    t4 t6 t3
	add    t3 t5 t4
	mv     t2 t3
	mv     t3 t2
	addi   sp sp 0
	mv     a0 t3
	li     a7 93
	ecall
	li     t0 0
	addi   sp sp 0
	mv     a0 t0
	li     a7 93
	ecall
