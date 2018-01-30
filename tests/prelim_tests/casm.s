global	printHelloWorld

section .text
printHelloWorld:
				; arg 1
				mov 	r10, rdi
				; arg 2
				mov 	r11, rsi
				; call write
				mov		rax, 1
				mov 	rdi, 1
				mov		rsi, r10
				mov		rdx, r11
				syscall
				ret
