.data

.text
	li $v0, 5
	syscall
	
	jal is_num_prime
	
	move $a0, $v0
	li $v0, 1
	syscall
	

end_prog:
	done
	

# is_num_prime	
# $v0 <- num
# $v0 -> 1 if prime	else 0
# uses $t0, $t1, $t2
is_num_prime:
	move $t0, $v0
	
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
	b is_num_prime__ret

is_num_prime__not_prime:
	li $v0, 0
	b is_num_prime__ret

is_num_prime__ret:
	jr $ra

	
	
