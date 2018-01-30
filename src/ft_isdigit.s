global ft_isdigit

section .text

ft_isdigit:
			xor		rax, rax
			cmp		rdi, 48
			jle		return
			cmp		rdi, 57
			jge		return
			inc		rax

return:
			ret
