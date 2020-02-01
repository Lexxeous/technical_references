; nasm -f elf64 max.asm
; gcc -static -o max max.o
; ./max <args>


	global max

	section .text

; push rbp
; mov rbp, rsp
max:
	mov rax, 0 ; xor rax, rax ; eax (rax) is the register that contains the return value by default
	cmp edi, 0 ; test rdi, rdi ; "test" is a bitwise "AND" operation that will only result in 0 if <register> = 0
	je out
	mov ecx, 0 ; ecx is going to be our counter that moves through the argument array

loop:
	cmp eax, DWORD [rsi+rcx*4] ; esi (rsi) points to the beginning of the argument array
	jg over
	mov eax, DWORD [rsi+rcx*4] ; multiply the moving argument counter (rcx) by 4 for the size of an unsigned integer (32 bits)

over:
	inc ecx ; increment the moving argument counter by 1
	cmp ecx, edi ; edi is the quantity of arguments ; if the quantity ≥ the argument counter, then we are done moving throught the arguments
	jl loop
	
out:
; mov rsp, rbp
; pop rbp
ret
