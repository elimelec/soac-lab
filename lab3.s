.data

.text
	#read number
	li $v0, 5
	syscall
	
	jal is_num_prime
	
	move $a0, $v0
	li $v0, 1
	syscall
	

end_prog:
	done
	
	
# $v0 <- num
# $v0 -> 1 if prime	else 0
is_num_prime:
	move $t0, $v0
	
	#check for prime
	li $t1, 2
is_num_prime__loop:
	beq $t0, $t1, is_num_prime__prime
	
	div $t0, $t1
	mfhi $t2
	beqz $t2, is_num_prime__not_prime
	
	add $t1, $t1, 1
	b is_num_prime__loop
	
is_num_prime__prime:
	li $v0, 1
	jr $ra

is_num_prime__not_prime:
	li $v0, 0
	jr $ra
	
	
