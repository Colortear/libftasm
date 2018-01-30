global ft_memset

section .text

ft_memset:
			mov		al, sil
			xor		r8, r8
			add		r8, rdx
			mov		rcx, rdx
			rep		stosb
			sub		rdi, r8
			mov		rax, rdi
			ret
