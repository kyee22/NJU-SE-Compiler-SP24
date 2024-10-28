
	.text
	.globl main
main:
	addi   sp sp 0
	li     t0 3
	addi   sp sp 0
	mv     a0 t0
	li     a7 93
	ecall
	li     t0 0
	addi   sp sp 0
	mv     a0 t0
	li     a7 93
	ecall
