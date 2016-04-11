.data
Prompt: 	.asciiz 	"An integer n value >1 : "
Prompt2: 	.asciiz 	"An integer k value >1 : "
PrintfFormat:	.asciiz 	"Aranjamente = %g\n\n"
		.align		2
PrintfPar:	.word		PrintfFormat
PrintfValue:	.space		8


		.text
		.global	main
main:

;;#################### ASTA E N



		;*** Read value from n stdin into R1
		addi		r1,r0,Prompt
		jal		InputUnsigned 
		
		;*** init values
		add r6, r1, r0
		movi2fp 	f10,r1		;R1 -> D0	D0..Count register
		cvti2d		f20,f10
		addi		r2,r0,1 	;1 -> D2	D2..result
		movi2fp		f11,r2
		cvti2d		f2,f11
		movd		f4,f2		;1-> D4 	D4..Constant 1
		
		
		;*** Break loop if D0 = 1
LoopPeN:		led		f20,f22		;D0<=1 ?
		bfpt		FinishLaN
		
		;*** Multiplication and next loop
		multd		f2,f2,f20
		subd		f20,f20,f4
		j		LoopPeN

FinishLaN: 	;*** write result to stdout
		
		sd		PrintfValue,f2
		addi		r14,r0,PrintfPar
		trap		5


		
;;#################### ASTA E K



;*** Read value from n stdin into R1
		addi		r1,r0,Prompt2
		jal		InputUnsigned 
		
		;*** init values
		add r8, r1, r0
		sub r1,r6, r1
		movi2fp 	f10,r1		;R1 -> D0	D0..Count register
		cvti2d		f20,f10
		addi		r2,r0,1 	;1 -> D2	D2..result
		movi2fp		f11,r2
		cvti2d		f8,f11
		movd		f4,f8		;1-> D4 	D4..Constant 1
		
		
		;*** Break loop if D0 = 1
LoopPeK:		led		f20,f22		;D0<=1 ?
		bfpt		FinishLaK
		
		;*** Multiplication and next loop
		multd		f8,f8,f20
		subd		f20,f20,f4
		j		LoopPeK

FinishLaK: 	;*** write result to stdout
		sd		PrintfValue,f8
		addi		r14,r0,PrintfPar
		trap		5

		
; INMPARTIRE DE AIA INTRE N SI K
		
		divd f12, f2, f8
		sd		PrintfValue,f12
		addi		r14,r0,PrintfPar
		trap		5
		
; IN F12 SUNT ARANJAMENTELEEEEE
		

		
		
		
		
		
		
		
		add r1, r8, r0
		movi2fp 	f10,r1		;R1 -> D0	D0..Count register
		cvti2d		f20,f10
		addi		r2,r0,1 	;1 -> D2	D2..result
		movi2fp		f11,r2
		cvti2d		f6,f11
		movd		f4,f6		;1-> D4 	D4..Constant 1
		
		
		;*** Break loop if D0 = 1
LoopPeK2:		led		f20,f22		;D0<=1 ?
		bfpt		FinishLaK2
		
		;*** Multiplication and next loop
		multd		f6,f6,f20
		subd		f20,f20,f4
		j		LoopPeK2

FinishLaK2: 	;*** write result to stdout
		sd		PrintfValue,f6
		addi		r14,r0,PrintfPar
		trap		5
		
		
		
		divd f14, f12, f6
		sd		PrintfValue,f14
		addi		r14,r0,PrintfPar
		trap		5
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		;*** end
		trap		0
