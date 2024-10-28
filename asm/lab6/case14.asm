
	.text
	.globl main
main:
	addi   sp sp 0
	li     t0 21
	mv     t3 t0
	mv     t5 t3
	mv     t4 t5
	mv     t5 t4
	li     t1 1
	add    t6 t5 t1
	mv     t2 t6
	mv     t5 t3
	li     t1 7
	mul    t3 t5 t1
	mv     t6 t3
	mv     t5 t6
	mv     s0 t2
	sub    t2 t5 s0
	mv     t3 t2
	mv     s0 t6
	mv     t6 t4
	sub    t4 s0 t6
	mv     t2 t4
	mv     t4 t2
	li     t1 1
	mul    t6 t4 t1
	li     t1 1
	mul    t4 t6 t1
	li     t1 1
	mul    t6 t4 t1
	mv     t2 t6
	mv     t6 t3
	mv     t3 t2
	add    t2 t6 t3
	addi   sp sp 0
	mv     a0 t2
	li     a7 93
	ecall
	li     t0 0
	addi   sp sp 0
	mv     a0 t0
	li     a7 93
	ecall
