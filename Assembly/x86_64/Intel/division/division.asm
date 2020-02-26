; nasm -f elf64 division.asm && gcc -o division -no-pie division.o

	extern atol

	section .text
	global main

	SYS_WRITE equ 1
	STDOUT equ 1
	STDERR equ 2

%define numerator QWORD [rbp-8]
%define denominator QWORD [rbp-16]
%define argv(index) QWORD [rsi+8*(index)]

%macro fail 1
	; Fail! Provide the label of an error (created using the err
	; macro below) and make sure there is a local .exit label.
	mov rdi, STDERR ; Using stderr.
	mov rsi, [rip+%1]
	mov rdx, %{1}.len
	mov rax, SYS_WRITE
	syscall
	mov rax, %{1}.errno
	jmp .exit
%endmacro

%macro str 1
	; Macro to declare a string.  This declares the string and
	; also creates a local value with the string length.
	%00: db %1
	.len equ $-%00
%endmacro

%macro err 2
	; Macro to declare an error message.  This declares an
	; error message and also an errno value to return.  The
	; string length and errno value are local values.
	%00: db %1
	.len equ $-%00
	.errno equ %2
%endmacro

	;============================================================
	; Entry point from C runtime.
	; Expects two integer arguments in argv.
	; Prints the decimal quotient using both signed and unsigned
	; division.
	;============================================================
main:
	; Expect to get two values on the command line as arguments.
	; The first is the dividend (or numerator) and the second is
	; the divisor (or denominator).  Both are assumed to be
	; integers and are parsed using atol.

	; On entry we have the following:
	; EDI holds argc
	; RSI points to argv (on stack)
	; RDX points to envp (on stack after argv)

	push rbp
	mov rbp, rsp
	sub rsp, 16

	; Make sure there are two arguments.
	cmp edi, 3
	je .argok
	fail BADARG

.argok:	; Parse the two arguments and place them on the stack.

	; Parse the first argument (the dividend) and print it.
	push rsi
	mov rdi, argv(1)
	call atol
	mov numerator, rax
	mov rdi, NUMSTR
	mov rsi, NUMSTR.len
	call write_str
	mov rdi, rax
	call write_hex_qword
	call write_endl
	
	; Parse the second argument (the divisor) and print it.
	pop rsi
	mov rdi, argv(2)
	call atol
	mov denominator, rax
	mov rdi, DENSTR
	mov rsi, DENSTR.len
	call write_str
	mov rdi, rax
	call write_hex_qword
	call write_endl

	; Let's compute and print the signed quotient and remainder.
	call write_endl
	mov rdi, SIGSTR
	mov rsi, SIGSTR.len
	call write_str
	call write_endl
	mov rdi, QUOSTR
	mov rsi, QUOSTR.len
	call write_str
	mov rax, numerator
	mov rbx, denominator
	xor rdx, rdx
	idiv rbx
	push rdx
	mov rdi, rax
	call write_hex_qword
	call write_endl
	mov rdi, REMSTR
	mov rsi, REMSTR.len
	call write_str
	pop rdi
	call write_hex_qword
	call write_endl
	
	; Let's compute and print the unsigned quotient and remainder.
	call write_endl
	mov rdi, UNSSTR
	mov rsi, UNSSTR.len
	call write_str
	call write_endl
	mov rdi, QUOSTR
	mov rsi, QUOSTR.len
	call write_str
	mov rax, numerator
	mov rbx, denominator
	xor rdx, rdx
	div rbx
	push rdx
	mov rdi, rax
	call write_hex_qword
	call write_endl
	mov rdi, REMSTR
	mov rsi, REMSTR.len
	call write_str
	pop rdi
	call write_hex_qword
	call write_endl

	; Done. Return success.
	mov rax, 0
	jmp .exit

.exit:
	leave
	ret


	;-------------------------------------------------------
	; Print a string.
	; Pointer is in rdi, length in rsi.
	; Clobbers: none
	;-------------------------------------------------------
write_str:
	push rbp
	mov rbp, rsp
	push rdx
	push rax
	mov rax, SYS_WRITE
	mov rdx, rsi
	mov rsi, rdi
	mov rdi, STDOUT
	syscall
	pop rax
	pop rdx
	leave
	ret


	;-------------------------------------------------------
	; Print a newline.
	; Clobbers: none
	;-------------------------------------------------------
write_endl:
	push rbp
	mov rbp, rsp
	push rdi
	push rsi
	mov rdi, ENDL
	mov rsi, 1
	call write_str
	pop rsi
	pop rdi
	leave
	ret


	;-------------------------------------------------------
	; Print the value in rdi as a 16-bit hex value.
	; Clobbers: rax, rcx, rdi, rsi
	;-------------------------------------------------------
write_hex_qword:
	push rbp
	mov rbp, rsp
	mov rcx, 16
	push r14
	mov r14, rdi
	sub rsp, 16
.top:
	mov rbx, 16
	mov rax, r14
	xor rdx, rdx
	div rbx
	mov r14, rax
	mov al, BYTE [HEXDIGITS+rdx]
	mov BYTE [rsp+rcx], al
	loop .top
	mov rdi, STDOUT
	lea rsi, [rsp+1]
	mov rdx, 16
	mov rax, SYS_WRITE
	syscall
	pop r14
	leave
	ret


	section .data

NUMSTR:	str 'dividend:  '
DENSTR:	str 'divisor:   '
QUOSTR:	str 'quotient:  '
REMSTR:	str 'remainder: '
SIGSTR: str 'Signed Division'
UNSSTR: str 'Unsigned Division'
ENDL:   db 10
HEXDIGITS: db '0123456789abcdef'
BADARG: err {'ERROR: Expect exactly two arguments.',10}, 1

