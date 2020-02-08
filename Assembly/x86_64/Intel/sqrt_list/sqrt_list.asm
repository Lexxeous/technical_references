; nasm -f elf64 max.asm && gcc -static -o max max.o -lm

	global main ; allow this code to be used externally
	extern printf ; "printf" manipulates the value in ecx
	extern strtod ; string to double
	extern sqrt ; caluculates sqare root of xmm0 and stores in xmm0
	extern puts ; put string

	section .text ; section of executable code
	
main:
	push rbp ; push the base pointer onto the stack
	mov rbp, rsp ; boilerplate to preserve the state of the stack

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
	mov r15, 1 ; use r15 to as counter for the argument array ; "printf" manipulates the value of in ecx

again:
	mov rdi, QWORD [rbp-12] ; rdi = address for argv[0]
	mov rdi, QWORD [rdi+r15*8] ; rdi = address for argv[r15] ; 8 bytes is the size of a double
	./sqrtlist 49 4
	mov rsi, 0 ; second argument to "strtod" should be NULL (\0 = 0).
	call strtod ; first argument is rdi, second argument is rsi, stores result in xmm0 ; xmm0 = original
	movsd QWORD [rbp-20], xmm0 ; store the original value on the stack
	call sqrt ; calculates the result ; xmm0 = sqrt(xmm0); xmm0 = result
	movsd xmm1, xmm0 ; move the result to xmm1 ; xmm1 = result
	movsd xmm0, QWORD [rbp-20] ; move the original to xmm0 ; xmm0 = original

	mov rdi, fmt ; move the formatted print string to rdi ; printf also prints rdi by default
	mov eax, 2 ; move 2 into eax ; printf requires the quantity of xmm<n> registers to print for the "%f" symbols
	call printf ; print the result

	inc r15 ; increment the argument counter
	cmp r15, QWORD [rbp-4] ; compare the argument array counter with edi on the stack
	jl again

done:
	mov eax, 0 ; return code = 0 = success
	; clear the top 20 bytes of the stack so there are no loose ends ???
	add rsp, 32 ; move the stack pointer back to where the base pointer was pushed
	pop rbp
	ret

	section .data ; section of non-executable code

eargs: db "ERROR: Expected at least one argument.",10,0
fmt: db "sqrt(%f) = %f",10,0 ; "%f" will print xmm0, xmm1, xmm2, ..., xmm<n> from left to right in the string when stored in rdi ; eax tells how many to print

; What the stack should look like:
; rsp
; -32         -24    -20         -12         -4     rbp           
; -40         -32    -28         -20         -12    -8          -0                     
;  |   extra   |extra |  arg[n]   |    rsi    | edi  |    rbp    |
;  | 0000_0000 | 0000 | 0000_0000 | 0000_0000 | 0000 | 0000_0000 |
;  |           |      |           |           |      |           |







