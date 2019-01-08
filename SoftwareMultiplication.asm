;A = arg
;B = base pointer

	MOV B, SP	; initialize base pointer
	JMP main

multiply(int, int):
	; Push BP to stack and then create new Stack frame
	PUSH B
	MOV B, SP

	; Declare local variable, equal to first argument
	MOV A, B
	ADD A, 4
	MOV A, [A]
	PUSH A

	; Declare local variable, equal to second argument
	MOV A, B
	ADD A, 3
	MOV A, [A]
	PUSH A

	PUSH 0		;declare output variable

	; Put first variable in C
	MOV A, B
	MOV C, [A]	;stores in C

	; Put second variable in D
	MOV A, B
	SUB A, 1	;2nd variable
	MOV D, [A]	;stores in D

	;multiply
	SHL D, 7

	;return a variable
	MOV A, B
	ADD A, 4	;get address of first argument and set in A
	MOV [A], D	;returns D

	; leave
	MOV SP, B 
	POP B

	RET
	
main:
	PUSH 5
	PUSH 3
	CALL multiply(int, int)
	ADD SP, 1	;get rid of non returned arguments
	HLT
