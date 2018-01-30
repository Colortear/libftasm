global ft_puts
global find_len

section .data
			NEWLINE	db	0xa

section .text

ft_puts:
			xor		rax, rax
			cmp		rdi, 0
			jz		end
			xor		rdx, rdx
			mov		rsi, rdi
			call	find_len

			mov		rdi, 1
			mov		rax, 1
			syscall
			mov		rax, 1
			mov		rsi, NEWLINE
			mov		rdx, 1
			syscall
			jmp		end
end:
			ret

find_len:
			cmp		byte[rsi + rdx], 0
			jz		ret_fl
			inc		rdx
			jmp		find_len

ret_fl:
			ret
