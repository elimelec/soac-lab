.data
sir:
	.word 2,1,7,9,5
	
	
.text

.globl main

main:
	li $a0, 0

tsgata:
	bnez $a0, term
	li  $a0,1
	li  $a1, 5 # a1=n-1
	li $a2, 0 # a2=j, indicele în sir

for:
	sub  $a2, $a2, $a1
	beqz $a2, tsgata
	add $a2, $a1, $a2
	la $t0, sir
	li $t1, 4
	mul $a3, $a2, $t1
	add $a3, $t0, $a3 # adr=sir+4*j
	lw $t2, ($a3) # sir[j]
	add $t4, $a2, 1
	mul $a3, $t4, $t1
	add $a3, $t0, $a3
	lw $t3, ($a3) # sir[j+1]
	sub $t2, $t2, $t3
	bgtz $t2, schimba
	add $a2, $a2, 1
	j for
	
schimba:
	add $t2, $t2, $t3
	add $t5, $t2, $0
	add $t2, $t3, $0 # t2=sir[j+1]
	add $t3, $t5, $0 # t3=sir[j]
	sw  $t3, ($a3)
	sub $a3, $a3, $t1
	sw $t2, ($a3)
	li $a0, 0
	j  for

term:
	done
