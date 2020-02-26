; nasm -f elf64 hello.asm && ld -o hello hello.o

	section .text 
	global _start

_start:
	mov rdi, 1
	mov rsi, msg1
	mov rdx, msg1.len
	mov rax, 1
	syscall

	mov rdi, 1
	mov rsi, msg2
	mov rdx, msg2.len
	mov rax, 1
	syscall

	mov rdi, 0
	mov rax, 60
	syscall
	hlt

	section .data nowrite align=16
	
msg1:	db 'Hello world!',10
.len: equ $-msg1
msg2:	db 'Goodbye world!',10
.len: equ $-msg2

