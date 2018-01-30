global ft_isalnum

section .text

ft_isalnum:
			xor		rax, rax
			cmp		rdi, 48
			jl		end
			cmp		rdi, 57
			jle		ret_yes
			cmp		rdi, 65
			jl		end
			cmp		rdi, 90
			jle		ret_yes
			cmp		rdi, 97
			jl		end
			cmp		rdi, 122
			jle		ret_yes
			jmp		end

ret_yes:
			inc		rax

end:
			ret
