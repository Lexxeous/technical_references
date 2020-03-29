; nasm -f elf64 copy.asm && gcc -o copy copy.o

	default rel
	global main
	extern puts

	section .text

main:
	push rbp
	mov rbp, rsp
	lea rax, [.go]
	jmp rax
	hlt

	; Copy the string from the data section to the bss section.
	align 16
.go:
	lea rsi, [str]
	lea rdi, [pad]
	mov rcx, str.len
	rep movsb

	; Find the exclamation mark and replace it with a period.
	lea rdi, [pad]
	mov al, '!'
	mov rcx, str.len
	repne scasb
	mov [rdi-1], BYTE '.'

	; Overwrite the terminating null character in the bss copy.
	lea rdi, [str+str.len-1]
	mov [rdi], byte 'F'
	
	; Print the string from the data section.
	lea rdi, [str]
	call puts WRT ..plt

	; Print the string from the bss section.
	lea rdi, [pad]
	call puts WRT ..plt

	mov eax, 0
	leave
	ret


	section .data
str:	db 'Hello world! This is a longish string.', 10, 0
	.len equ $-str
	db 'Run on string.', 10, 0


	section .bss
pad: resb str.len ; reserve enough bytes to store the same length as <str>

