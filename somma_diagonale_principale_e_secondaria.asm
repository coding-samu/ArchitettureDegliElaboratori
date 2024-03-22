.data
	matrice2D: .word 1,2,3,4,5,6,7,8,9 # 1+5+9 = 15 | 3 + 7 = 10 | 25
	DIM: .word 3 # lato della matrice

.text
	main: 
		li $t0, 0 # coordinata x (colonne)
		li $t1, 0 # coordinata y (righe)
		li $t2, 0 # somma iniziale
		lw $t3, DIM # lato della matrice
		subi $t7, $t3, 1 # imposto il contatore inverso
	for:
		# Se y >= DIM allora esco
		bge $t1, $t3, endFor
		# Sommo x e y
		add $t4, $t0, $t1
		# Imposto l'indice
		sll $t5,$t4,2
		# Carico l'elemento all'indice $t5 in $t6
		lw $t6,matrice2D($t5)
		# Sommo a $t2 l'elemento messo in memoria nel registro $t6
		add $t2, $t2, $t6
		# Incremento y
		addi $t1, $t1, 1
		# Incremento x
		add $t0, $t0, $t3
		
		sll $t8,$t7,2
		beq $t7, $t4,uguali
		lw $t6,matrice2D($t8)
		add $t2, $t2, $t6
		uguali:
		add $t7,$t7,$t3
		subi $t7,$t7,1
		j for
		
	endFor:

		li $v0,1
		add $a0,$zero,$t2
		syscall
		
