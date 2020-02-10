; nasm -f elf64 binary.asm && gcc -static -o binary binary.o

; This program uses the Linux sys_write system call. See the table located here:
; https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
; https://blog.packagecloud.io/eng/2016/04/05/the-definitive-guide-to-linux-system-calls/#syscallsysret

	global main

	section .text

main:
	mov rdi, 0xff00f043210099aa ; static immediate value input
	call write_binary_qword
	call write_endl
	mov rax, 0
	ret

write_binary_qword:
	; Store rdi on the stack. At this point rdi is occupying
	; the following addresses: rbp-1 through rbp-8.
	push rbp ; 8 + 8 byte return address (16) on the stack ; aligned
	mov rbp, rsp
	
	push rdi ; 8 + 8 + 8 (24) bytes on the stack ; not aligned
	mov rcx, 8 ; counter variable for 8 bytes to convert

.top:
	; Zero out rax. While assigning to eax would zero the high
	; bits of rax, assigning to ah or al will not.
	mov rax, 0

	; Get the next byte to print. We have arranged to get them
	; in order from highest order to lowest (big endian).
	mov al, BYTE [rbp+rcx-9] ; stores the next byte in rax ;
	
	; Save important data. 8 + 8 + 8 + 8 + 8 (40) bytes on the stack ; not aligned
	push rcx
	push rax

	; Get high nybble and divide by four.
	and rax, 0xf0
	shr rax, 2
	mov rdi, 1
	lea rsi, [nyb + rax]
	mov rdx, 4
	mov rax, 1
	syscall
	call write_space

	; Restore the byte value.
	pop rax ; 8 + 8 + 8 + 8 (32) bytes on the stack ; aligned

	; Get low nybble and multiply by four.
	and rax, 0xf
	shl rax, 2
	mov rdi, 1
	lea rsi, [nyb + rax]
	mov rdx, 4
	mov rax, 1
	syscall
	call write_space

	; Restore the index.
	pop rcx ; 8 + 8 + 8 (24) bytes on the stack ; not aligned
	loop .top ; loop decrements the value in rcx automatically
	leave
	ret

write_space:
	mov rdi, 1
	mov rsi, space
	mov rdx, 1
	mov rax, 1
	syscall
	ret

write_endl:
	mov rdi, 1
	mov rsi, endl
	mov rdx, 1
	mov rax, 1
	syscall
	ret

	section .data

nyb:
	db "0000"
	db "0001"
	db "0010"
	db "0011"
	db "0100"
	db "0101"
	db "0110"
	db "0111"
	db "1000"
	db "1001"
	db "1010"
	db "1011"
	db "1100"
	db "1101"
	db "1110"
	db "1111"
	
space: db " "
endl:	db 10

