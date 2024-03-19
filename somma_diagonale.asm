.data
	matrice2D: .word 1,2,3,4,5,6,7,8,9
	DIM: .word 3 # lato della matrice
.text
	main: 
		li $t0, 0 # coordinata x (colonne)
		li $t1, 0 # coordinata y (righe)
		li $t2, 0 # somma iniziale
		lw $t3, DIM # lato della matrice
	
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
		j for
		
	endFor:
		