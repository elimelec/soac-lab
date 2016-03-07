.data
numere_prime:
	.word 2, 3, 5, 7, 11, 13, 17, 19, 23, 29

.text
	li $t5, 10
	li $t1, 0
	la $t3, numere_prime
	
Jmekerie:
	lw $t2, ($t3)
	add $t3, $t3, 4
	
	add $t1, $t1, $t2
	sub $t5, $t5, 1
	bgez $t5, Jmekerie
	
	move $a0, $t1
	li $v0, 1
	syscall
	done
	
