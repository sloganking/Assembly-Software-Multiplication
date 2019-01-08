;A = arg
;B = base pointer

	MOV B, SP	; initialize base pointer
	JMP main

multiply:
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
	CALL multiply
	HLT
