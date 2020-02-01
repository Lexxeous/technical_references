; Compile: nasm -f elf64 sqrt.asm
; Run: gcc -static -o sqrt sqrt.o -lm

	global main
	extern printf
	extern strtod ; string to double
	extern sqrt
	extern puts

	section .text
	
main:
	push rbp
	mov rbp, rsp
	sub rsp, 32		; Reserve space for edi and rsi and align.
	mov DWORD [rbp-4], edi	; Store edi in the reserved space.
	mov QWORD [rbp-12], rsi	; Store rsi in the reserved space.
	cmp edi, 2
	je okay1
	mov rdi, eargs
	call puts
	mov eax, 1 ; Return non-zero to indicate error.
	jmp done

okay1:
	mov rdi, QWORD [rbp-12]
	mov rdi, QWORD [rdi+8] ; The second argument is here.
	mov rsi, 0 ; Second argument to strtod should be NULL.
	call strtod
	movsd QWORD [rbp-20], xmm0
	call sqrt
	movsd xmm1, xmm0
	movsd xmm0, QWORD [rbp-20]
	mov rdi, fmt
	mov eax, 2
	call printf

done:
	leave
	ret

	section .data
eargs: db "ERROR: Expected exactly one argument.",10,0
fmt: db "sqrt(%f) = %f",10,0

