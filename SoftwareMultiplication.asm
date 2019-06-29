;software multiplication program
;arguments are stored in global variables
;result is returned in register D

	JMP main

;global variables
varA:
	DB 0
varB:
	DB 0

multiply:
	MOV C, 0
	MOV D, 0
.multiplyLoop:
	MOV A, [varA]
	AND A, 1
	JZ dontAdd	; if 1, add
	ADD D, [varB]
dontAdd:
	
	MOV A, [varA]	;shift varA right by 1
	SHR A, 1
	MOV [varA], A

	JNZ moreToGo	;if(done) return
	RET
moreToGo:
	MOV A, [varB]	;shift varB left by 1
	SHL A, 1
	MOV [varB], A

	JMP .multiplyLoop

main:
	MOV [varA], 21
	MOV [varB], 3
	CALL multiply
	HLT