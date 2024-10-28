
	.data
b1:
	.word 7

	.data
b2:
	.word 2

	.data
b3:
	.word 3

	.data
b4:
	.word 4

	.text
	.globl main
main:
	addi   sp sp 0
	la     t1 b1
	lw     t3 0(t1)
	la     t1 b2
	lw     t4 0(t1)
	mul    t5 t3 t4
	la     t1 b3
	lw     t4 0(t1)
	add    t3 t5 t4
	la     t1 b4
	lw     t4 0(t1)
	la     t1 b2
	lw     t5 0(t1)
	div    t6 t4 t5
	sub    t5 t3 t6
	mv     t2 t5
	mv     t5 t2
	addi   sp sp 0
	mv     a0 t5
	li     a7 93
	ecall
	li     t0 0
	addi   sp sp 0
	mv     a0 t0
	li     a7 93
	ecall
