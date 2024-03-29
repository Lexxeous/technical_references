; nasm -f elf64 -l malloc.lst malloc.asm && gcc -o malloc malloc.o

	section .text
	global main
	extern malloc
	default rel

%macro sys_write 2
	; Macro to write the contents of a buffer. The buffer is
	; the first argument, and the length of the buffer in bytes
	; is the second argument. Output goes to standard output.
	mov eax, 1
	mov edi, 1
	lea rsi, [%1]
	mov rdx, %2
	syscall
%endmacro

%macro addbuf 1
	; Add the given byte to the buffer. The buffer is indexed by RSI, and RSI is decremented.
	dec esi
	lea r11, [rel buffer]
	mov byte [r11+rsi], %1
%endmacro

%macro sys_brk 1
	; Macro to invoke sys_brk with the given argument. The return value is in RAX.
	mov eax, 12
	mov rdi, %1
	syscall
%endmacro

%macro sys_exit 1
	; Invoke sys_exit with the given exit value.
	mov eax, 60
	mov edi, %1
	syscall
%endmacro

%macro str 1
	; Macro to declare a string. This declares the string and also creates a local value with the string length.
	%00: db %1
	.len equ $-%00
%endmacro

separator equ '_'

; Entry point.
main:   
	push rbp
	mov rbp, rsp

	; Display current brk.
	sys_write msg, msg.len
	sys_brk 0
	mov rdi, rax
	call hexprint

	; Reserve 32 KiB = 0x8000.
	mov rdi, 32*1024
	call malloc wrt ..plt

	; Write the return value from malloc.
	push rax
	sys_write result, result.len
	pop rdi
	call hexprint

	; Write the new brk.
	sys_write msg2, msg2.len
	sys_brk 0
	mov rdi, rax
	call hexprint
	leave
	ret

; Print the value in RDI in hexadecimal.
hexprint:
	; Every group of four digits is separated by the separator character. RDI is preserved.
	push rbp
	mov rbp, rsp
	push rbx
	push rdi

	mov ecx, 16
	mov esi, buffer.len
	lea rbx, [rel hexdigits]
	jmp .skip

.top:   test cx, 0x3
	jnz .skip
	addbuf separator
.skip
	mov al, dil
	and al, 0xf
	xlatb
	addbuf al
	shr rdi, 4
	loop .top

	sys_write prefix, 2
	sys_write buffer, buffer.len
	sys_write nl, 1

	pop rdi
	pop rdx
	leave
	ret


	section .data

msg: str "Getting current break value... "
result: str "Return value from malloc... "
msg2: str "Getting new break value... "
hexdigits: db "0123456789abcdef"
nl: db 10
prefix: db '0x'

	section .bss

align 16
buffer: resb 4*4+3
.len equ $-buffer

