factorial:
	blez $a0, BaseCase
	
	RecursiveStep:
		# Salvo i dati su stack
		subi $sp, $sp, 8
		sw $ra, 0($sp)
		sw $a0, 4($sp)
		
		subi $a0, $a0, 1
		jal factorial
		
		# Recupero i dati da stack
		lw $a0, 4($sp)
		lw $ra, 0($sp)
		addi $sp, $sp, 8
		
		mul $v0, $v0, $a0
		
		jr $ra
		
	BaseCase:
		addi $v0, $zero, 1
		
		jr $ra