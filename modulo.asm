.globl Modulo

.data
	

.text
Modulo:
	# inizializzo i registri a 0
	mul $t0, $t0, $zero
	mul $t1, $t1, $zero
	mul $t2, $t2, $zero
	
	# imposto il numeratore in $t0
	addi $t0, $zero, 20
	
	# imposto il denominatore in $t1
	addi $t1, $zero, 4  # $t1 denominatore
	
	Start:
		# se numeratore < denominatore vai a End
		blt $t0, $t1, End
		# numeratore = numeratore - denominatore
		sub $t0, $t0, $t1
		# incremento il contatore
		addi $t2, $t2, 1
		# torno a Start
		j Start
	
	End:
		# stampo il resto
		li $v0, 1
		add $a0, $t0, $zero
		syscall
