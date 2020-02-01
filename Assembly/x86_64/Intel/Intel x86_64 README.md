# Intel x86_64 README

### General:

```bash
nasm -f elf64 <filename>.asm # compile assembly into 64-bit binary/object file
gcc -static -o <filename> <filename>.o -lm # link the binary/object file into an executable
./<filename> <args> # run the executable with a set of arguments
```

The flag `-lm` refers to the `C` math library because the math functions are not part of the `C` standard library.

Intel chips are little-endian

An address can be referenced as: `[<base_pointer> + <index>*<scale> + <displacement>]`, where the scale needs to match the size of the data types your are skipping over in terms of bytes (4 for 32-bit unsigned integers, 1 for characters, etc).

You can define single line macros with: `%define <macro_name>(<arg>) <instruction>(<arg>)`.

Using `global <func_name>` exports the contents of the file/function to be used in other compiled/linked programs.

### Instructions:

`test <reg_name>, <reg_name>` is a bitwise `AND` operation that will only return `0` if `<reg_name>` already contains `0`.

`xchg <reg_name> <reg_name>` is a `nop`

`ret` simply sets the instruction pointer and returns. It transfers control to the return address located on the stack. DO NOT USE `ret` in the middle of a program, especially if you have not cleaned up the stack!!!

`leave` puts the base pointer (`esp`/`rsp`) back on the stack (`esp`/`rsp`).

`loop` automatically decrements the value in register `ECX`.

`movsd` stands for "Move Static Double" and is used for moving values that are larger than 64 bits (80 bits, 128 bits (`xmm<n>`), etc.) into 64-bit registers.

### External Functions:

`strtod` uses `rdi` and `rsi` as default arguments, and the result is stored in `xmm0`.

`sqrt` uses what is in register `xmm0` and stores the result in `xmm0`. You must store the original value in a secondary register if you don't want to lose/overwrite it.

`printf`'s first argument by default is `rdi`. It also needs to know how many floats (`%f`) to print, which is retrieved from `eax`.

### Sections:

Using `section .text` denotes a section that is meant as executable code. It gets accumulated into the **code segment (CS)** of the resulting executable.

Using `section .data` denotes a section that is meant as non-executable code, but rather data that is to be used for convenience within the program. It gets accumuleted into the **data segment (DS)** of the resulting executable.

Using `section .bcc` denotes............

### Registers:

`eax` (`rax`) is the default register that will be the return value for a function call

`edi` (`rdi`), by default, contains the number of arguments passed into the function

`esi` (`rsi`), by default, contains a memory address pointer that points to the beginnin of the argument array

### Stack Management:

To allocate space on the stack use `sub rsp, <val>`, if this value does not align the stack onto a 16-bit boundary (for which the system expects) it can cause problems. Use another line `and rsp, -16` to clear the lower 4 bits of the stack pointer to align it.

In general, the boiler plate instructions for conserving the state of the stack, before and after the actions of a program are:

```asm
push rbp
mov rbp, rsp
;
; body
;
mov rsp, rbp
pop rbp
ret
```





