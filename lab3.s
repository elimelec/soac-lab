.data
numere_prime:
	.word 2, 3, 5, 7, 11, 13, 17, 19, 23, 29

.text
	#read number
	li $v0, 5
	syscall
	
	#result stored in $v0
	move $t0, $v0
	
	# == 2
	li $t2, 2
	beq $t0, $t2, prim
	
	# == 3
	li $t2, 3
	beq $t0, $t2, prim
	
	#check for prime
	li $t1, 2
loop_prime:
	beq $t0, $t1, prim
	
	div $t0, $t1
	mfhi $t2
	beqz $t2, ne_prim
	
	add $t1, $t1, 1
	b loop_prime
	
prim:
	#print number
	li $a0, 1
	li $v0, 1
	syscall
	b end_prog

ne_prim:
	#print number
	li $a0, 0
	li $v0, 1
	syscall
	b end_prog

end_prog:	
	done
	
	
