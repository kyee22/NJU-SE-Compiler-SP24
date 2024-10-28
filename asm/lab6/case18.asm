
	.data
B:
	.word 10

	.text
	.globl main
main:
	addi   sp sp 0
	li     t0 1
	mv     t2 t0
	li     t0 2
	mv     t3 t0
	mv     t4 t2
	mv     t5 t3
	add    t6 t4 t5
	mv     t5 t3
	mv     t4 t2
	sub    s0 t5 t4
	add    t4 t6 s0
	mv     s0 t3
	mv     t3 t2
	sub    t6 s0 t3
	mv     t3 t2
	sub    t2 t6 t3
	add    t3 t4 t2
	addi   sp sp 0
	mv     a0 t3
	li     a7 93
	ecall
	li     t0 0
	addi   sp sp 0
	mv     a0 t0
	li     a7 93
	ecall
