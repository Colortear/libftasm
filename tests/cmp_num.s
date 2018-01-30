section .data
num1: equ 100
num2: equ 5
msg:
	db	"sum is correct", 10

section	.text
	global	_start

_start:
	; rax = num1;
	mov		rax, num1
	; rbx = num2;
	mov		rbx, num2
	; rax += rbx;
	add		rax, rbx
	; if (rax != 150)
	cmp		rax, 150
	; exit(1);
	jne		.exit
	; else
	jmp		.rightSum

.rightSum:
	;; write(
	mov		rax, 1
	;; STDOUT,
	mov		rdi, 1
	;; msg,
	mov		rsi, msg
	;; 15);
	mov 	rdx, 15
	;; run syscall
	syscall
	; exit
	jmp 	.exit

.exit:

	mov		rax, 60
	mov		rdi, 0
	syscall
