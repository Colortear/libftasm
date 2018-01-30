global ft_isalpha

section .text

ft_isalpha:
			xor		rax, rax
			cmp		rdi, 0
			jz		end
			cmp		rdi, 97
			jl		less
			cmp		rdi, 122
			jg		end
			inc		rax
			jmp		end

less:
			cmp		rdi, 65
			jl		end
			cmp		rdi, 90
			jg		end
			inc		rax
			jmp		end

end:
			ret
