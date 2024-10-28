
	.text
	.globl main
main:
	addi   sp sp 0
	li     t0 10
	mv     t2 t0
	mv     t4 t2
	li     t1 1
	add    t5 t4 t1
	mv     t3 t5
	mv     t4 t2
	mv     t2 t3
	mul    t3 t4 t2
	li     t1 1
	add    t2 t3 t1
	mv     t5 t2
	mv     t2 t5
	li     t1 66
	rem    t5 t2 t1
	addi   sp sp 0
	mv     a0 t5
	li     a7 93
	ecall
	li     t0 0
	addi   sp sp 0
	mv     a0 t0
	li     a7 93
	ecall
