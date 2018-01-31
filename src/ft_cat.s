global ft_cat

section .data

			STDOUT	equ 1
			BUFSIZE	equ 1024
			WRITE	equ 1
			READ	equ 0

section	.bss

buffer:		resb 1024

section .text

ft_cat:
			cmp		rdi, 0
			jl		end
			mov		r8, rdi			; save fd
			mov		rsi, buffer		; set arg2 to buffer
			
read_file:
			mov		rdi, r8			; set arg1 to fd
			mov		rdx, BUFSIZE	; set arg3 to buffer size
			mov		rax, READ		; set rax to READ
			syscall					; call read
			cmp		rax, 0			; check if read bytes
			jle		end				; if not return
			mov		rdx, rax		; else move the bytes read to size arg
			mov		rdi, STDOUT		; set arg1 to STDOUT
			mov		rax, WRITE		; set write call code
			syscall					; call write
			jmp		read_file		; loop back to top

end:
			ret
