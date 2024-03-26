.data
	matrice: 	.word 0:400
	LATO:		.word 20

.text

	main:
		li $a0, 0
		li $a1, 0
		lw $a2, LATO
		li $t0, 0
	cicloY:
		beq $a1, $a2, fine
	cicloX:
		beq $a0, $a2, nextY
		
		jal is_diagonal
		beqz $v0, nextX
		jal leggi_elemento
		add $t0, $t0, $v0
	
	nextX:
		addi $a0, $a0, 1
		j cicloX
	
	nextY:
		addi $a1, $a1, 1
		li $a0, 0
		j cicloY
	
	fine:
		move $a0, $t0
		li $v0, 1
		syscall
		li $v0, 10
		syscall
		
is_diagonal:
	beq $a0, $a1, yes
	add $v0, $a0, $a1
	addi $v0, $v0, 1
	beq $v0, $a2, yes
	li $v0, 0
	jr $ra

	yes:
		li $v0, 1
		jr $ra
		
leggi_elemento:
	mul $v0, $a1, $a2
	add $v0, $v0, $a0
	sll $v0, $v0, 2
	lw $v0, matrice($v0)
	jr $ra