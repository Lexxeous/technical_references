; nasm -f elf64 addsub.asm && gcc -static -o addsub addsub.o -lm

; This program uses the Linux sys_write system call. See the table located here:
; https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
; https://blog.packagecloud.io/eng/2016/04/05/the-definitive-guide-to-linux-system-calls/#syscallsysret

	global main
	extern puts
	extern strtod

	section .text

main:
	push rbp ; 8 + 8 bytes of return address (16) on the stack ; aligned
	mov rbp, rsp

	cmp edi, 3 ; must have exactly 3 arguments ; ./<exec_name> <argv[1]> <argv[2]>
	je okay

	mov rdi, eargs ; otherwise, load error message into rdi
	call puts ; print the error message ; "puts" will print the contents of rdi by default
	mov eax, 1 ; set eax to 1 as default return code ; non-zero to indicate error
	jmp done

okay:
	sub rsp, 16 ; reserve 16 bytes of space for rsi and command line arguments
	mov QWORD [rbp-8], rsi	; store rsi in the reserved space ; points to the beginning of argument array

	; ADDING ------------------------------------------------------------------------------------------------------------

	call write_adding
	mov rdi, QWORD [rbp-8] ; rdi = address for argv[0]
	mov rdi, QWORD [rdi+8] ; rdi = address for argv[1]

	mov rsi, 0
	call strtod ; xmm0 = strtod(rdi = arg[1], rsi = 0) = argv[1]
	movsd QWORD [rbp-16], xmm0 ; move the double in xmm0 (argv[1]) to the stack

	mov rdi, QWORD [rbp-16] ; rdi = argv[1]
	call write_binary_qword ; print argv[1] in binary format
	call write_endl

	; -------------------------------------------------------------------------------------------------------------------

	mov rdi, QWORD [rbp-8] ; rdi = address for argv[0] ; rsi is still stored in [rbp-8]
	mov rdi, QWORD [rdi+16] ; rdi = address for argv[2]

	mov rsi, 0
	call strtod ; xmm0 = strtod(rdi = arg[2], rsi = 0) = argv[2]
	movsd QWORD [rbp-16], xmm0 ; move the double in xmm0 (argv[2]) to the stack

	mov rdi, QWORD [rbp-16]
	call write_binary_qword ; print argv[2] in binary format
	call write_endl

	; -------------------------------------------------------------------------------------------------------------------

	mov rdi, QWORD [rbp-8] ; rdi = address for argv[0] ; still [rbp-8] = rsi
	mov rdi, QWORD [rdi+8] ; rdi = address for argv[1]
	mov r15, QWORD [rbp-16] ; rdi = argv[2]

	add rdi, r15 ; rdi = argv[1] + argv[2]

	call write_binary_qword ; print result in binary format
	call write_endl

	; SUBTRACTING -------------------------------------------------------------------------------------------------------

	call write_subtracting
	mov rdi, QWORD [rbp-8] ; rdi = address for argv[0]
	mov rdi, QWORD [rdi+8] ; rdi = address for argv[1]

	mov rsi, 0
	call strtod ; xmm0 = strtod(rdi = arg[1], rsi = 0) = argv[1]
	movsd QWORD [rbp-16], xmm0 ; move the double in xmm0 (argv[1]) to the stack

	mov rdi, QWORD [rbp-16] ; rdi = argv[1]
	call write_binary_qword ; print argv[1] in binary format
	call write_endl

	; -------------------------------------------------------------------------------------------------------------------

	mov rdi, QWORD [rbp-8] ; rdi = address for argv[0] ; rsi is still stored in [rbp-8]
	mov rdi, QWORD [rdi+16] ; rdi = address for argv[2]

	mov rsi, 0
	call strtod ; xmm0 = strtod(rdi = arg[2], rsi = 0) = argv[2]
	movsd QWORD [rbp-16], xmm0 ; move the double in xmm0 (argv[2]) to the stack

	mov rdi, QWORD [rbp-16]
	call write_binary_qword ; print argv[2] in binary format
	call write_endl

	; -------------------------------------------------------------------------------------------------------------------

	mov rdi, QWORD [rbp-8] ; rdi = address for argv[0] ; still [rbp-8] = rsi
	mov rdi, QWORD [rdi+8] ; rdi = address for argv[1]
	mov r15, QWORD [rbp-16] ; rdi = argv[2]

	add rdi, r15 ; rdi = argv[1] + argv[2]

	call write_binary_qword ; print result in binary format
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
	
	; Save important data. 8 + 8 + 8 + 8 + 8 (40) bytes on the stack ; aligned
	push rcx
	push rax

	; Get high nybble and divide by four.
	and rax, 0xf0
	shr rax, 2
	mov rdi, 1
	lea rsi, [nyb + rax] ; move the address of the rax-th nybble string from <nyb> data to rsi
	mov rdx, 4
	mov rax, 1
	syscall ; sys_write (rax=1 ID) an rdx=4 byte string rdi=1 time from char* rsi
	call write_space

	; Restore the byte value.
	pop rax ; 8 + 8 + 8 + 8 (32) bytes on the stack ; aligned

	; Get low nybble and multiply by four.
	and rax, 0xf
	shl rax, 2
	mov rdi, 1
	lea rsi, [nyb + rax] ; move the address of the rax-th nybble string from <nyb> data to rsi
	mov rdx, 4
	mov rax, 1
	syscall ; sys_write (rax=1 ID) an rdx=4 byte string rdi=1 time from char* rsi
	call write_space

	; Restore the index.
	pop rcx ; 8 + 8 + 8 (24) bytes on the stack ; not aligned
	loop .top ; loop decrements the value in rcx automatically
	pop rdi
	leave ; mov rsp, rbp && pop rbp
	ret

write_space:
	mov rdi, 1
	mov rsi, space
	mov rdx, 1
	mov rax, 1
	syscall ; sys_write (rax=1 ID) an rdx=1 byte string rdi=1 time from char* rsi
	ret

write_endl:
	mov rdi, 1
	mov rsi, endl
	mov rdx, 1
	mov rax, 1
	syscall ; sys_write (rax=1 ID) an rdx=1 byte string rdi=1 time from char* rsi
	ret

write_adding:
	mov rdi, 1
	mov rsi, adding
	mov rdx, 8
	mov rax, 1
	syscall ; sys_write (rax=1 ID) an rdx=8 byte string rdi=1 time from char* rsi
	ret

write_subtracting:
	mov rdi, 1
	mov rsi, subtracting
	mov rdx, 13
	mov rax, 1
	syscall ; sys_write (rax=1 ID) an rdx=13 byte string rdi=1 time from char* rsi
	ret

done:
	leave
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

adding: db "Adding:",10
subtracting: db "Subtracting:",10
eargs: db "ERROR: Expected exactly two arguments.",10,0	
space: db " "
endl:	db 10

