global ft_bzero

section .text

ft_bzero:
				; compare rdi for no input 
				cmp		rdi, 0
				; if null return
				jz		return
				mov		rbx, rdi
				mov		rax, rsi

ft_bzero_loop:
				cmp		rax, 0
				jle		return
				dec		rax
				mov		byte[rbx], 0
				inc		rbx
				dec		rax
				jmp		ft_bzero_loop
return:
				ret
