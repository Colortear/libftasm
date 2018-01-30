global ft_isprint

section .text

ft_isprint:
			xor		rax, rax
			cmp		rdi, 32
			jl		end
			cmp		rdi, 126
			jg		end
			inc		rax

end:
			ret			
