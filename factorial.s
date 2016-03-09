.text

.globl main

main:
	subu $sp, $sp, 32 # Cadrul de stiva de 32 bytes
	sw $ra, 20($sp) # Salveaza adresa de revenire
	sw $fp, 16($sp) # Salveaza vechiul pointer de cadru
	addu $fp, $sp, 32 # Seteaza noul pointer de cadru

	li  $a0, 10 # Pune argumentul în $a0
	jal fact # Apeleaza rutina de calcul a factorialului
	la $a0, $LC # Pune adresa string-ului de afisat în $a0
	li  $v0, 4 # Pune codul operatiei în v0
	syscall # Afiseaza mesaj

	mflo $a0 # Salveaza rezultatul în a0
	li $v0, 1 # Pune codul operatiei în v0
	syscall # Afiseaza valoarea factorialului
	lw $ra, 20($sp) # Reface adresa de revenire

	lw $fp, 16($sp) # Reface pointer-ul de cadru
	addu $sp, $sp, 32 # Reface cadrul de stiva
	done # Încheiere program

	
.data

$LC:
	.ascii "The factorial of 10 is = "

.text

fact:
	subu $sp, $sp, 32 # Cadrul de stiva este de 32 bytes
	sw $ra, 20($sp) # Salveaza adresa de revenire
	sw $fp, 16($sp) # Salveaza vechiul pointer de cadru
	addu $fp, $sp, 32 # Seteaza noul pointer de cadru
	sw $a0, 0($fp) # Salveaza argumentul (n)


	lw $2, 0($fp) # Load n
	bgtz $2, $L2 # Branch if n>0
	li $2, 1 # Returneaza 1
	j $L1 # Salt la codul de revenire

$L2:
	lw $3, 0($fp) # Load n
	subu $2, $3, 1 # Calculeaza n-1
	move $a0, $2 # Muta valoarea în $a0
	jal fact # Reapeleaza rutina de calcul a factorialului
	lw $3, 0($fp) # Load n
	mul $2, $2, $3 # Calculeaza fact(n-1)*n

$L1: # Rezultatul în $2
	lw $ra, 20($sp) # Restaureaza $ra
	lw $fp, 16($sp) # Restaureaza $fp
	addu $sp, $sp, 32 # Reface cadrul de stiva
	j $ra # Revenire în programul apelant
