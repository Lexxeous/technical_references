; nasm -f elf64 stack.asm && ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o stack /usr/lib/x86_64-linux-gnu/crt1.o /usr/lib/x86_64-linux-gnu/crti.o stack.o /usr/lib/x86_64-linux-gnu/crtn.o -lc

	default rel ; use relative addressing by default
	global main
	extern printf
	
	section .text

main:
	; Boilerplate preservation of the base and stack pointers
	push rbp
	mov rbp, rsp

	; Put some stuff on the stack.
	mov rax, 17
	push rax
	mov rax, 0xf000f000eeee4444
	push rax
	lea rax, [rel .over] ; trick NASM into assembling lea rax, [rip]
.over:
	push rax
	call show_stack
	leave
	ret


; Show the eight quadwords on the stack starting at EBP. This routine clobbers all registers, so save important.
show_stack:
	mov rax, 0
	mov rdi, head
	call printf wrt ..plt ; "wrt" is the "With Respect To" keyword for NASM
	mov rcx, 8
.top:
	mov r15, rcx
	mov rax, 0
	mov rdi, stack
	lea rsi, [rbp+r15*8-8]
	lea rdx, [r15*8-8]
	mov rcx, [rbp+r15*8-8]
	call printf wrt ..plt ; ".plt" is a section, add another '.' to make it a "target"
	mov rcx, r15
	loop .top
	ret
	

	section .data
head:
	db "Address            ",9
	db "ebp      ",9
	db "Content",10,0

stack:
	db "0x%016lx ",9,"[rbp+%d] ",9,"0x%016lx",10,0 ; string formatting for each quadword

