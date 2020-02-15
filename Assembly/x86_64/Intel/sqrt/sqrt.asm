; nasm -f elf64 sqrt.asm && gcc -static -o sqrt sqrt.o -lm

	global main
	extern printf
	extern strtod ; string to double
	extern sqrt
	extern puts

	section .text
	
main:
	; Usual function boilerplate.  It's a good idea to include this even
	; if you don't plan to modify the stack.  You can always remove it
	; later.
	push rbp
	mov rbp, rsp

	; Save our arguments on the stack because we are going to call other
	; functions, and it is easier than trying to save rsi and edi every
	; time.
	;
	; We want to save edi (an int), and rsi (a quad word).  We really don't
	; need to save rdx (the environment pointer), so we won't.  We do want
	; to reserve space for a temporary value, so we will want 8 more bytes.
	;
	; The stack grows "backward" in memory.  That is, as you push items
	; the stack pointer is decreased.  So to reserve memory on the stack
	; we just subtract the space needed.  Additonally, it is a Good Idea
	; for the stack to be aligned on a 16-byte boundary.
	; 
	; Prior to the call, the stack was aligned.  Then the call pushed the
	; return address (8 bytes) on the stack, and the stack was not aligned.
	; Then we pushed rbp (8 bytes) and it was aligned again.  So we need to
	; reserve a multiple of 16 to make sure it is still aligned.  The least
	; multiple of 16 that is greater or equal to 20 is 32.
	; 
	; A strategy you sometimes see is to reserve what you need, then force
	; alignment.
	; 
	; sub rsp, 20
	; and rsp, -16
	sub rsp, 32		; Reserve space for edi and rsi and align.
	mov DWORD [rbp-4], edi	; Store edi in the reserved space.
	mov QWORD [rbp-12], rsi	; Store rsi in the reserved space.
	; Remember the stack grows backward, so if we stored at [rbp] we would
	; overwrite the old stack!  The first mov will put the four bytes of
	; edi in [rbp-4], [rbp-3], [rbp-2], and [rbp-1].

	; Check to see if we got exactly two arguments (the program name and
	; the floating point value).
	cmp edi, 2
	je okay1
	mov rdi, eargs
	call puts
	mov eax, 1 ; Return non-zero to indicate error.
	jmp done

okay1:
	; Let's set up to call strtod.  We want rdi to hold the pointer to
	; the argument string. We know rsi has not been modified yet, but
	; it is a good defensive strategy to pull the value from memory.
	mov rdi, QWORD [rbp-12] ; First argument
	mov rdi, QWORD [rdi+8] ; The second argument is here.
	mov rsi, 0 ; Second argument to strtod should be NULL.
	call strtod

	; Stash the returned floating point value, which will be in xmm0.
	movsd QWORD [rbp-20], xmm0

	; Let's call sqrt.  The first (and only) floating point value is
	; already in xmm0, so we are ready to call right now.
	call sqrt

	; We want to set up for the print statement.  We want the original
	; value in xmm0, and the square root in xmm1.
	movsd xmm1, xmm0
	movsd xmm0, QWORD [rbp-20]
	mov rdi, fmt
	mov eax, 2
	call printf

	; Usual function boilerplate.  It's a good idea to include this even
	; if you don't plan to modify the stack.  You can alawys remove it
	; later.  We'll use the leave instruction here, and return zero from
	; main to indicate success.
	mov eax, 0 ; The return value for main is an int.

done:
	leave
	ret

	section .data
eargs: db "ERROR: Expected exactly one argument.",10,0
fmt: db "sqrt(%f) = %f",10,0

