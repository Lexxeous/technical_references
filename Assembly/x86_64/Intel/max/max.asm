; nasm -f elf64 max.asm && gcc -static -o max max.o

; This program takes any quantity of decimal numbers then prints and returns the maximum value.

	global main
	extern puts

	section .text

main:
	mov rax, 0 ; xor rax, rax ; rax is the register that contains the return value by default
	cmp rdi, 2
	jge okay

	mov rdi, eargs ; otherwise, load error message into rdi
	call puts ; print the error message ; "puts" will print the contents of rdi by default
	mov rax, 1 ; set rax to 1 as return code ; non-zero to indicate error
	jmp done

okay:
	mov rcx, 1 ; rcx is going to be our counter that moves through the argument array
	
again:
	cmp rax, QWORD [rsi+rcx*8] ; rsi points to the beginning of the argument array
	jg over
	mov rax, QWORD [rsi+rcx*8] ; multiply the moving argument counter (rcx)

over:
	inc rcx ; increment the moving argument counter by 1
	cmp rcx, rdi ; rdi is the quantity of arguments ; if the quantity ≥ the argument counter, then we are done moving throught the arguments
	jl again

	mov rdi, rax
	call puts ; print the return value to display the max
	
done:
	ret

section .data

eargs: db "ERROR: No values provided.",10,0