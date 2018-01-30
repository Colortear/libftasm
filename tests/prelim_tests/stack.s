section .data
			SYS_WRITE	equ 1
			STDIN		equ 1
			SYS_EXIT	equ 60
			EXIT_CODE	equ 0

			NEW_LINE	db 0xa
			WRONG_ARGC	db "Must be two command line argument", 0xa

section .text
		global _start

_start:
			; pop argc onto rcx
			pop 		rcx
			; compare argc value in rcx to the desired argument amount
			cmp			rcx, 3
			; if compare returns false jump to error message and exit
			jne			argcError

			; move to next pointer on stack (start of argv)
			add			rsp, 8
			; pop this value onto rsi
			pop			rsi
			; call the str_to_int label on argument
			call		str_to_int

			; move the value converted in str_to_int onto r10 to save for later
			mov			r10, rax
			; pop the next argument from the stack onto rsi
			pop			rsi
			; call str_to_int again on new arg
			call		str_to_int
			; move the return of str_to_int onto rax
			mov			r11, rax

			; add the two converted values together. store in r10
			add			r10, r11
			; place the resulting value in rax
			mov			rax, r10
			; zero out r12 to be used as iterator
			xor			r12, r12
			; set r8 to newline
			add			r8, 0xa
			; push newline onto stack to be printed later
			push		r8
			; clear r8 bits for later use
			xor			r8, r8
			; jump to convert rax to a string thats printable
			jmp			int_to_str

str_to_int:
			; make rax 0
			xor			rax, rax
			; set rcx value to 10
			mov			rcx, 10

next:
			; compare the first byte pointed to by rsi and 
			cmp			[rsi], byte 0
			; if rsi is zero return the string
			je			return_str
			; place first byte of rsi in bl (lower 8 bits of rbx)
			mov			bl, [rsi]
			; subtract 48 from bl (bl - '0')
			sub			bl, 48
			; multiply rcx by the value in rax (rax * 10)
			mul			rcx
			; add rbx to rax (rax + bl)
			add			rax, rbx
			; move one char forward in string
			inc			rsi
			; jump to beginning
			jmp			next

return_str:
			; move flow back to the start label
			ret

int_to_str:
			; make rdx 0
			mov			rdx, 0
			; set rbx to 10
			mov			rbx, 10
			; divide the resulting value in rax by 10
			div			rbx
			; add '0' to rdx (automatically receives rax % rbx)
			add			rdx, 48
			; null terminate rdx ?????????????????
			add			rdx, 0x0
			; push rdx onto the stack
			push		rdx
			; add one to r12
			inc			r12
			; compare rax to null
			cmp			rax, 0x0
			; if it doesnt equal null return to beginning of int_to_str
			jne			int_to_str
			; else print the number
			jmp			print

print:
			; set rax to 1
			mov			rax, 1
			; multiply by r12 setting rax to r12 value
			inc			r12
			mul			r12
			; set r12 to 8 because stack registers are byte increments
			mov			r12, 8
			; multiply rax value by 8
			mul			r12
			; set rdx to rax value so rax can be used by system
			mov			rdx, rax

			; set rax to write call number
			mov			rax, SYS_WRITE
			; set rdit to STDIN
			mov			rdi, STDIN
			; set rsi (second argument) to stack pointer
			mov			rsi, rsp
			; write to screen
			syscall

			; go to exit
			jmp			exit

argcError:
			mov			rax, 1
			mov			rdi, 1
			mov			rsi, WRONG_ARGC
			mov			rdx, 34
			syscall
			jmp			exit

exit:
			; set rax to exit call (60)
			mov			rax, SYS_EXIT
			; set rdi to the exit code (0)
			mov			rdi, EXIT_CODE
			; terminate
			syscall
