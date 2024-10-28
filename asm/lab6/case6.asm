
	.data
u:
	.word 25

	.data
v:
	.word 5

	.data
w:
	.word 4

	.data
x:
	.word 6

	.data
y:
	.word 3

	.text
	.globl main
main:
	addi   sp sp 0
	la     t1 u
	lw     t3 0(t1)
	la     t1 v
	lw     t4 0(t1)
	div    t5 t3 t4
	la     t1 w
	lw     t4 0(t1)
	mul    t3 t5 t4
	la     t1 x
	lw     t4 0(t1)
	add    t5 t3 t4
	la     t1 y
	lw     t4 0(t1)
	la     t1 u
	lw     t3 0(t1)
	la     t1 v
	lw     t6 0(t1)
	rem    s0 t3 t6
	mul    t6 t4 s0
	sub    s0 t5 t6
	mv     t2 s0
	mv     s0 t2
	addi   sp sp 0
	mv     a0 s0
	li     a7 93
	ecall
	li     t0 0
	addi   sp sp 0
	mv     a0 t0
	li     a7 93
	ecall
