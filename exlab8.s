.data
prompt_n:
	.asciiz "Tastati n: "
prompt_numar:
	.asciiz "Baga un numar: "
prompt_cmmdc:
	.asciiz "CMMDC: "
n:
	
numar:
	.space 1
numere:
	.space 100

.text

# afisare mesaj citire N
la $a0, prompt_n	       # adresa sirului de tiparit
li $v0, 4		       # codul apelului sistem pentru afisare de string
syscall		       # afiseaza sirul

# citire N
li $v0, 5          # codul apelului sistem pentru citire string de la tastatura
syscall
move $t0, $v0
blez $t0, end_loop

# afisare mesaj citire numar
la $a0, prompt_numar	       # adresa sirului de tiparit
li $v0, 4		       # codul apelului sistem pentru afisare de string
syscall		       # afiseaza sirul

# citire N1
li $v0, 5          
syscall
move $t1, $v0 
blez $t1, end_loop

# afisare mesaj citire numar
la $a0, prompt_numar	      
li $v0, 4		       
syscall		       

# citire N2
li $v0, 5
syscall
move $t2, $v0
blez $t2, end_loop





## CEMEMEDECE
li $t5, 0
loop_cmmmdc:
	add $t5, $t5, 1
	div $t1, $t5 #Catul  LO restul  HI. mfhi mflo
	mfhi $t6
	bnez $t6, loop_cmmmdc
	
	div $t2, $t5 #Catul  LO restul  HI. mfhi mflo
	mfhi $t6
	bnez $t6, loop_cmmmdc
	
	move $t7, $t5
	
	bge $t5, $t1, end_cmmdc
	bge $t5, $t2, end_cmmdc
	
	j loop_cmmmdc
	
end_cmmdc:

	la $a0, prompt_cmmdc	       
	li $v0, 4		      
	syscall		     
	
	move $a0, $t7	       
	li $v0, 1		       
	syscall		       


#li $t1, -1
#loop:
#	add $t1, $t1, 1
#	la $a0, numar	       # adresa unde se va memora sirul 
#	li $v0, 5
#	syscall
#	move $t2, $v0
#	sub $t3, $t2, 1
#	blez $t3, end_loop
#	add $t4, $t1, numar
#	sb $t2, ($t4)
#	sub $t3, $t1, $t0
#	beqz $t3, end_loop
#	j loop       

end_loop:		
done		       # se revine din program
