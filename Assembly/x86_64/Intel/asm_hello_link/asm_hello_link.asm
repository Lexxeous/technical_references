; nasm -f elf64 asm_hello_link.asm && ld -o asm_hello_link asm_hello_link.o -T asm_hello_link.link

	section .text 
	global xyzzy

xyzzy:
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

