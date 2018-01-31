global ft_memcpy

section .text

ft_memcpy:
			xor		r8, r8
			add		r8, rdx
			mov		rcx, rdx
			rep		movsb
			mov		rax, rdi
			sub		rax, r8
			ret
