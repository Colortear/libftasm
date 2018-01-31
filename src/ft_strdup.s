global ft_strdup
extern malloc

section .text

ft_strdup:
			xor		al, al
			xor		rcx, rcx
			dec		rcx
			repne	scasb
;			inc		rcx
			not		rcx
			; return pointer to the beginning of src
			sub		rdi, rcx
			; move the pointer to rbx for safekeeping
			mov		rbx, rdi
			; place the length of string in rdi for malloc to use
			mov		rdi, rcx
			call	malloc WRT ..plt
			; add the src pointer to arg2
			mov		rsi, rbx
			; place length in rcx for use by rep
			mov		rcx, rdi
			; place newly malloc'd pointer in rdi
			mov		rdi, rax
			; save length in r8
			mov		r8, rcx
			; possible fix?
			inc		rcx
			; copy
			rep		movsb
			; move pointer back to starting position
			sub		rdi, r8
			; move pointer to return address
			mov		rdi, rax
			ret
