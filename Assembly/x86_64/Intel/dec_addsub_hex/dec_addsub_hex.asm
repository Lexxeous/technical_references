; nasm -f elf64 dec_addsub_hex.asm && gcc -static -o dec_addsub_hex dec_addsub_hex.o -lm

; This program uses the Linux sys_write system call. See the table located here:
; https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
; https://blog.packagecloud.io/eng/2016/04/05/the-definitive-guide-to-linux-system-calls/#syscallsysret

; This program will take two hexidecimal inputs, and print the hexidecimal results of thier addition and subtraction.

	global main
	extern puts ; does not require stack to be aligned
	extern atol ; does not require stack to be aligned

	section .text

main:
	push rbp ; 8 + 8 bytes of return address (16) on the stack ; aligned
	mov rbp, rsp

	; Error checking
	cmp edi, 3 ; must have exactly 3 arguments ; ./<exec_name> <argv[1]> <argv[2]>
	je okay ; if exactly 2 arguments

	; ERROR
	mov rdi, eargs ; otherwise, load error message into rdi
	call puts ; print the error message ; "puts" will print the contents of rdi by default
	mov eax, 1 ; set eax to 1 as return code ; non-zero to indicate error
	jmp done

okay:
	push r12 ; will store the addition result
	push r13 ; will store the subtraction result
	push r14 ; will store the first argument (argv[1])
	push r15 ; will store the second argument (argv[2])

	; -------------------------------------------------------------------------------------------------------------------

	push rsi
	call write_adding
	pop rsi
	mov rdi, QWORD [rsi+8] ; rdi = address for argv[1]

	push rsi
	call atol ; rax = atol(rdi = arg[1]) = argv[1]
	mov r14, rax

	mov rdi, r14 ; rdi = argv[1]
	call write_hex_qword ; print argv[1] in hexidecimal format
	call write_endl
	pop rsi

	; -------------------------------------------------------------------------------------------------------------------

	mov rdi, QWORD [rsi+16] ; rdi = address for argv[2]

	push rsi
	call atol ; rax = atol(rdi = arg[2]) = argv[2]
	mov r15, rax

	mov rdi, r15
	call write_hex_qword ; print argv[2] in hexidecimal format
	call write_endl

	; -------------------------------------------------------------------------------------------------------------------

	; Use r12 to do addition
	mov r12, r14
	add r12, r15
	mov rdi, r12
	call write_hex_qword ; print the addition result in hexidecimal format
	call write_endl

	; -------------------------------------------------------------------------------------------------------------------

	call write_subtracting

	mov rdi, r14
	call write_hex_qword ; print argv[1] in hexidecimal format
	call write_endl

	mov rdi, r15
	call write_hex_qword ; print argv[2] in hexidecimal format
	call write_endl

	; Use r13 to do subtraction
	mov r13, r14
	sub r13, r15
	mov rdi, r13
	call write_hex_qword ; print the subtraction result in hexidecimal format
	call write_endl

	; Return 0 for success and restore the pushed register values
	mov rax, 0
	pop rsi
	pop r15
	pop r14
	pop r13
	pop r12
	jmp done

	; -------------------------------------------------------------------------------------------------------------------

write_hex_qword:
	; Store rdi on the stack. At this point rdi is occupying
	; the following addresses: rbp-1 through rbp-8.
	push rbp
	mov rbp, rsp
	
	push rdi
	mov rcx, 8 ; counter variable for 8 bytes to convert

.top:
	; Zero out rax. While assigning to eax would zero the high
	; bits of rax, assigning to ah or al will not.
	mov rax, 0

	; Get the next byte to print. We have arranged to get them
	; in order from highest order to lowest (big endian).
	mov al, BYTE [rbp+rcx-9] ; stores the next byte in rax
	
	; Save important data.
	push rcx
	push rax

	; Get high nybble and divide by eight.
	and rax, 0xf0
	shr rax, 4
	mov rdi, 1
	lea rsi, [hex_nyb + rax] ; move the address of the rax-th nybble char from <hex_nyb> data to rsi
	mov rdx, 1
	mov rax, 1
	syscall ; sys_write (rax=1 ID) an rdx=1 byte char rdi=1 time from char* rsi

	pop rax ; restore the byte value

	; Get low nybble.
	and rax, 0xf
	mov rdi, 1
	lea rsi, [hex_nyb + rax] ; move the address of the rax-th nybble char from <hex_nyb> data to rsi
	mov rdx, 1
	mov rax, 1
	syscall ; sys_write (rax=1 ID) an rdx=1 byte char rdi=1 time from char* rsi

	pop rcx ; restore the index
	loop .top ; loop decrements the value of rcx automatically
	pop rdi
	leave ; mov rsp, rbp && pop rbp
	ret

	; -------------------------------------------------------------------------------------------------------------------

write_space:
	mov rdi, 1
	mov rsi, space
	mov rdx, 1
	mov rax, 1
	syscall ; sys_write (rax=1 ID) an rdx=1 byte string rdi=1 time from char* rsi
	ret

	; -------------------------------------------------------------------------------------------------------------------

write_endl:
	mov rdi, 1
	mov rsi, endl
	mov rdx, 1
	mov rax, 1
	syscall ; sys_write (rax=1 ID) an rdx=1 byte string rdi=1 time from char* rsi
	ret

	; -------------------------------------------------------------------------------------------------------------------

write_adding:
	mov rdi, 1
	mov rsi, adding
	mov rdx, 8
	mov rax, 1
	syscall ; sys_write (rax=1 ID) an rdx=8 byte string rdi=1 time from char* rsi
	ret

	; -------------------------------------------------------------------------------------------------------------------

write_subtracting:
	mov rdi, 1
	mov rsi, subtracting
	mov rdx, 13
	mov rax, 1
	syscall ; sys_write (rax=1 ID) an rdx=13 byte string rdi=1 time from char* rsi
	ret

	; -------------------------------------------------------------------------------------------------------------------

done:
	leave
	ret

	; -------------------------------------------------------------------------------------------------------------------

	section .data
hex_nyb:
	db '0'
	db '1'
	db '2'
	db '3'
	db '4'
	db '5'
	db '6'
	db '7'
	db '8'
	db '9'
	db 'a'
	db 'b'
	db 'c'
	db 'd'
	db 'e'
	db 'f'

adding: db "Adding:",10
subtracting: db "Subtracting:",10
eargs: db "ERROR: Expected exactly two arguments.",10,0	
space: db " "
endl:	db 10

