; Filename: sqrt_list.asm
; Author: Jonathan A. Gibson
; Compile: nasm -f elf64 sqrt_list.asm
; Link: gcc -static -o sqrt sqrt_list.o -lm
; Run: ./sqrt_list <value(s)>

	global main
	extern printf
	extern strtod ; string to double
	extern sqrt
	extern puts

	section .text
	
main:
	; Boilerplate to preserve the state of the stack
	push rbp
	mov rbp, rsp

	sub rsp, 32 ; "sub rsp, 20" & "and rsp, -16" ; reserve space for edi and rsi and align the stack
	
	mov DWORD [rbp-4], edi	; store edi in the reserved space ; the quantity of arguments
	mov QWORD [rbp-12], rsi	; store rsi in the reserved space ; points to the beginning of argument array

	cmp edi, 2 ; need at least 2 arguments for a valid run ; ./<executable> <value(s)>
	jge okay1 ; quantity of arguments must be at least 2

	mov rdi, eargs ; otherwise, load error message into rdi
	call puts ; print the error message ; "puts" will print the contents of rdi by default
	mov eax, 1 ; set eax to 1 as default return code ; non-zero to indicate error
	jmp done

okay1:
	mov ecx, 1 ; use ecx to as counter for the argument array

again:
	mov rdi, QWORD [rbp-12] ; rdi = addr for argv[0]
	mov rdi, QWORD [rdi+rcx*8] ; rdi = addr for argv[ecx]

	mov rsi, 0 ; second argument to "strtod" should be NULL (\0 = 0).
	call strtod ; first argument is rdi, second argument is rsi, stores result in xmm0 ; xmm0 = original
	movsd QWORD [rbp-20], xmm0 ; store the original value on the top 8 bytes of the stack
	call sqrt ; calculates the result ; xmm0 = sqrt(xmm0); xmm0 = result
	movsd xmm1, xmm0 ; move the result to xmm1 ; xmm1 = result
	movsd xmm0, QWORD [rbp-20] ; move the original to xmm0 ; xmm0 = original

	mov rdi, fmt ; move the formatted print string to rdi ; printf also prints rdi by default
	mov eax, 2 ; move 2 into eax ; printf requires the quantity of xmm<n> registers to print for the "%f" symbols
	call printf ; print the result

	inc ecx ; increment the argument counter
	cmp ecx, edi ; compare the argument array counter with edi on the stack
	jl again

done:
	mov eax, 0 ; return code = 0 = success
	; clear the top 20 bytes of the stack so there are no loose ends
	leave
	ret

	section .data

eargs: db "ERROR: Expected at least one argument.",10,0
fmt: db "sqrt(%f) = %f",10,0 ; "%f" will print xmm0, xmm1, xmm2, ..., xmm<n> from left to right in the string when stored in rdi ; eax tells how many to print

