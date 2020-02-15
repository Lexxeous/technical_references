; nasm -f elf64 binary.asm && gcc -static -o binary binary.o

; This program uses the Linux sys_write system call. See the table located here:
; https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
; https://blog.packagecloud.io/eng/2016/04/05/the-definitive-guide-to-linux-system-calls/#syscallsysret

; This program will take one decimal input and print the value in binary.

	global main
	extern puts
	extern atol

	section .text

main:
	push rbp ; 8 + 8 bytes of return address (16) on the stack ; aligned
	mov rbp, rsp

	; Error checking
	cmp edi, 2 ; must have exactly 2 arguments ; ./<exec_name> <argv[1]>
	je okay ; if exactly 2 arguments

	; ERROR
	mov rdi, eargs ; otherwise, load error message into rdi
	call puts ; print the error message ; "puts" will print the contents of rdi by default
	mov eax, 1 ; set eax to 1 as return code ; non-zero to indicate error
	jmp done

okay:
	mov rdi, [rsi+8] ; user input value
	call atol ; rax = atol(rdi = arg[1]) = argv[1]
	mov rdi, rax
	call write_binary_qword
	call write_endl
	mov rax, 0
	jmp done

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
	lea rsi, [bin_nyb + rax]
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
	lea rsi, [bin_nyb + rax]
	mov rdx, 4
	mov rax, 1
	syscall
	call write_space

	; Restore the index.
	pop rcx ; 8 + 8 + 8 (24) bytes on the stack ; not aligned
	loop .top ; loop decrements the value in rcx automatically
	pop rdi
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

done:
	leave
	ret

	section .data

bin_nyb:
	db "0000" ; +0 bytes
	db "0001" ; +4 bytes
	db "0010" ; +8 bytes
	db "0011" ; +12 bytes
	db "0100" ; +16 bytes
	db "0101" ; +20 bytes
	db "0110" ; +24 bytes
	db "0111" ; +28 bytes
	db "1000" ; +32 bytes
	db "1001" ; +36 bytes
	db "1010" ; +40 bytes
	db "1011" ; +44 bytes
	db "1100" ; +48 bytes
	db "1101" ; +52 bytes
	db "1110" ; +56 bytes
	db "1111" ; +60 bytes
	
space: db " "
endl:	db 10
eargs: db "ERROR: Expected exactly one argument.",10,0	
