.data
	vettore: .word 11, 35, 223, 17, 29, 95
	N: .word 6
	
.text
	lw $t0,vettore($zero)
	lw $t1,N
	li $t2,1
	
	for:
		beq $t2,$t1,endFor
		sll $t4,$t2,2
		lw $t3,vettore($t4)
		if: # se vettore[t2] > $t0 allora imposto $t0 = vettore[$t2]
			ble $t3,$t0,endIf
			add $t0, $t3, $zero
		endIf:
			addi $t2,$t2,1
			j for
	
	
	endFor:
		li $v0,1
		add $a0, $zero, $t0
		syscall