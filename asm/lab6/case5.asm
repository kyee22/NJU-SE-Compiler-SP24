
	.data
ax:
	.word 10

	.data
ay:
	.word 20

	.data
az:
	.word 5

	.text
	.globl main
main:
	addi   sp sp 0
	la     t1 ax
	lw     t3 0(t1)
	la     t1 ay
	lw     t4 0(t1)
	la     t1 az
	lw     t5 0(t1)
	sub    t6 t4 t5
	mul    t5 t3 t6
	la     t1 az
	lw     t6 0(t1)
	li     t1 1
	add    t3 t6 t1
	div    t6 t5 t3
	la     t1 ax
	lw     t3 0(t1)
	la     t1 ay
	lw     t5 0(t1)
	sub    t4 t3 t5
	rem    t5 t6 t4
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
