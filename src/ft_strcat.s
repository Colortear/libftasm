global ft_strcat

section .text

ft_strcat:
			xor		rcx, rcx
			cmp		rdi, 0
			jz		end
			cmp		rsi, 0
			jz		end

s1:
			mov		al, byte[rdi + rcx]
			cmp		al, 0
			jz		set_it
			inc		rcx
			jmp		s1

set_it:
			xor		r10, r10

cat:
			mov 	al, byte[rsi + r10]
			cmp 	al, 0
			jz		end
			mov		byte[rdi + rcx], al
			inc		rcx
			inc		r10
			jmp		cat

end:
			mov		byte[rdi + rcx], 0
			mov		rax, rdi
			ret
