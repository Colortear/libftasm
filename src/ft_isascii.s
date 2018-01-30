global ft_isascii

section .text

ft_isascii:
			; clear rax
			xor		rax, rax
			; compare arg1 to 0
			cmp		rdi, 0
			; if the comparison returns negative jump to end
			js		end
			; compare rdi to 128
			cmp		rdi, 128
			; if the result is not negative (arg1 is unsigned greater
			; than 128) then return 
			jns		end
			; make rax = 1
			inc		rax

end:
			ret
