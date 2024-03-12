.data
	vettore: .word 0, 1, 10, 1, 7, 1
	N: .word 6
	accapo: .asciiz "\n"
	
.text
	lw $t0,vettore($zero)
	lw $t1,N
	li $t2,1
	add $t5, $zero, $t0 # somma pari
	add $t6, $zero, $zero # somma dispari
	addi $t7, $zero, 2
	for:
		beq $t2,$t1,endFor
		sll $t4,$t2,2
		lw $t3,vettore($t4)
		
		div $t2,$t7
		mfhi $t8
		# caso dipari
		beqz $t8, pari
		add $t6, $t6, $t3
		j fineCasi
		# caso pari
		pari:
			add $t5, $t5, $t3
		fineCasi:
		
		if: # se vettore[t2] > $t0 allora imposto $t0 = vettore[$t2]
			ble $t3,$t0,endIf
			add $t0, $t3, $zero
		endIf:
			addi $t2,$t2,1
			j for		
	
	endFor:
		
		# Stampa massimo
		li $v0,1
		add $a0, $zero, $t0
		syscall
		
		li $v0,4
		la $a0,accapo
		syscall
		
		# Stampa somma pari
		li $v0,1
		add $a0, $zero, $t5
		syscall
		
		li $v0,4
		la $a0,accapo
		syscall
		
		# Stampa somma dispari
		li $v0,1
		add $a0, $zero, $t6
		syscall
		
