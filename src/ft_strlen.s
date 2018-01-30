global ft_strlen

section .text

ft_strlen:
			xor		al, al
			xor		rcx, rcx
			dec		rcx
			repne	scasb
			inc		rcx
			not		rcx
			mov		rax, rcx
			ret
