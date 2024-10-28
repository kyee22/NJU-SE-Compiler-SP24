
	.data
a:
	.word 1

	.data
b:
	.word 0

	.text
	.globl main
main:
	addi   sp sp 0
	li     t0 3
	mv     t2 t0
	mv     t3 t2
	la     t1 a
	lw     t4 0(t1)
	add    t5 t3 t4
	li     t1 1
	add    t4 t5 t1
	la     t1 b
	sw     t4 0(t1)
	li     t0 10
	mv     t4 t0
	la     t1 a
	lw     t5 0(t1)
	la     t1 b
	lw     t3 0(t1)
	add    t6 t5 t3
	mv     t3 t2
	add    t2 t6 t3
	mv     t3 t4
	add    t4 t2 t3
	addi   sp sp 0
	mv     a0 t4
	li     a7 93
	ecall
	li     t0 0
	addi   sp sp 0
	mv     a0 t0
	li     a7 93
	ecall
