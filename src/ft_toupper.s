; check an int and if its ascii representation is lowercase then set it to its
; upper case form
section .text
	global ft_toupper

ft_toupper:
				; set arg1 to rax
				mov		rdi, rax
				; make comparison between rax and 'a'
				cmp		rax, 97
				; if less than, jump to return
				jle		ft_toupper_ret
				; compare rax to 'z'
				cmp		rax, 122
				; if greater jump to return
				jge		ft_toupper_ret
				; else subtract the diff between 'a' and 'A'
				sub		rax, 32

ft_toupper_ret:
				; return
				ret
