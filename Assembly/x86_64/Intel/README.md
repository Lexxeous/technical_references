# <img src="../../../.pics/Lexxeous/lexx_headshot_clear.png" width="90px"/> Lexxeous's Intel x86_64 README: <img src="../../../.pics/Assembly/x86_64/Intel/intel_nasm_logo.png" width="130"/>

> The **Intel** syntax was originally used in the documentation of the Intel processor and is the dialect primarily used in Windows operating systems.

### External References:

1. [Unofficial Instruction Documentation](https://www.felixcloutier.com/x86/index.html)
2. [System Calls Table](https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/)
3. [System Calls Guide](https://blog.packagecloud.io/eng/2016/04/05/the-definitive-guide-to-linux-system-calls/#syscallsysret)

### General:

> The flag `-lm` refers to the `C` math library because the math functions are not part of the `C` standard library.

```bash
nasm -f elf64 <filename>.asm # compile assembly into 64-bit binary/object file
gcc -static -o <filename> <filename>.o -lm # link the binary/object file into an executable
./<filename> <args> # run the executable with a set of arguments
```

> The default syntax for the `GCC` compiler is **AT&T**, but **Intel** syntax is also supported using:

```bash
$ gcc -masm=Intel -o <exec_name> <prog_name>.c
```

**Intel** chips are little-endian.

You can define single line macros with: `%define <macro_name>(<arg>) <instruction>(<arg>)`.

Using `global <func_name>` exports the contents of the file/function to be used in other compiled/linked programs.

### Instructions:

> The source for an instruction is right hand side, while the destination is the left hand side: `<instruction> <lhs>, <rhs>` --> `<instruction> <destination>, <source>`

`test <reg_name>, <reg_name>` is a bitwise `AND` operation that will only return `0` if `<reg_name>` already contains `0`.

`xchg <reg_name> <reg_name>` is a `nop`

`ret` simply sets the instruction pointer and returns. It transfers control to the return address located on the stack. DO NOT USE `ret` in the middle of a program, especially if you have not cleaned up the stack!!!

`leave` puts the base pointer (`esp`/`rsp`) back on the stack (`esp`/`rsp`).

`loop` automatically decrements the value in register `ecx`.

`mov` is effectively a copy operation like: `mov LHS, RHS`. The RHS gets copied into the LHS, while the RHS retains its original value.

`movsd` stands for "Move Static Double" and is used for moving values that are larger than 64 bits (80 bits, 128 bits (`xmm<n>`), etc.) into 64-bit registers.

`lea` stands for "Load Effective Address". This command is capable of doing quick addressing calculations and assigning the value to a register like: `lea <reg_name>, [<base> + <idx>*<scale> + displacement]`.

`syscall` takes the value in `rax` to determine what system call to use. It reaches down into the kernel of the operating system (ring 0) to use a system function. It also clobbers `rcx` by saving the current value of the instruction pointer (`rip`) into it.

### External Functions:

`strtod` uses `rdi` and `rsi` as default arguments, and the result is stored in `xmm0`.

`sqrt` uses what is in register `xmm0` and stores the result in `xmm0`. You must store the original value in a secondary register (or on the stack) if you don't want to lose/overwrite it.

`printf`'s first argument by default is `rdi`. It also needs to know how many formatted items (`%f`, `%d`, `%i`, `%c`, etc...) to print, which is retrieved from `eax`. `printf` also clobbers `eax`. `printf` uses the `xmm<n>` registers as the data to print in order from `xmm0` to `xmm15`.

`puts`, by default, will write what is in `rdi`.

### Sections:

Using `section .text` denotes a section that is meant as executable code. It gets accumulated into the **code segment (CS)** of the resulting executable.

Using `section .data` denotes a section that is meant as non-executable code, but rather data that is to be used for convenience within the program. It gets accumuleted into the **data segment (DS)** of the resulting executable.

Using `section .bcc` denotes a section that is meant for modifiable data. The **Block Started by Symbol (BSS)** area is of fixed size capable of storing modifiable variables. This section is adjacent to the data segment (DS).

### Registers:

#### x86 16-Bit Registers:

| Name                | Abbrv. |  Aliasing  |
|:--------------------|:------:|:-----------|
| Accumulator         |   AX   | AX = AH.AL |
| Base                |   BX   | BX = BH.BL |
| Counter             |   CX   | CX = CH.CL |
| Data                |   DX   | DX = DH.DL |
| Base Pointer        |   BP   |            |
| Source Index        |   SI   |            |
| Destination Index   |   DI   |            |
| Stack Pointer       |   SP   |            |
| Instruction Pointer |   IP   |            |

#### x86 32-Bit Registers (Extended):

| Name                | Abbrv. |  Aliasing          |
|:--------------------|:------:|:-------------------|
| Accumulator         |  EAX   | EAX = (16 bits).AX |
| Base                |  EBX   | EBX = (16 bits).BX |
| Counter             |  ECX   | ECX = (16 bits).CX |
| Data                |  EDX   | EDX = (16 bits).DX |
| Base Pointer        |  EBP   |                    |
| Source Index        |  ESI   |                    |
| Destination Index   |  EDI   |                    |
| Stack Pointer       |  ESP   |                    |
| Instruction Pointer |  EIP   |                    |

#### x86_64 64-Bit Registers:

| Name                           | Abbrv.      |  Aliasing           |
|:-------------------------------|:-----------:|:--------------------|
| Accumulator                    |  RAX (R0)   | RAX = (32 bits).EAX |
| Base                           |  RBX (R1)   | RBX = (32 bits).EBX |
| Counter                        |  RCX (R2)   | RCX = (32 bits).ECX |
| Data                           |  RDX (R3)   | RDX = (32 bits).EDX |
| Base Pointer                   |  RBP (R4)   |                     |
| Source Index                   |  RSI (R5)   |                     |
| Destination Index              |  RDI (R6)   |                     |
| Stack Pointer                  |  RSP (R7)   |                     |
| General Purpose Register (GPR) |  R8         |                     |
| General Purpose Register (GPR) |  R9         |                     |
| General Purpose Register (GPR) |  R10        |                     |
| General Purpose Register (GPR) |  R11        |                     |
| General Purpose Register (GPR) |  R12        |                     |
| General Purpose Register (GPR) |  R13        |                     |
| General Purpose Register (GPR) |  R14        |                     |
| General Purpose Register (GPR) |  R15        |                     |
| Instruction Pointer            |  RIP        |                     |

<img src="../../../.pics/Assembly/x86_64/Intel/registers.png" width="600px"/>

#### x86_64 Segment Registers:

| Name            | Abbrv. |   Version  |
|:----------------|:------:|:-----------|
| Code Segment    |   CS   |   80286+   |
| Data Segment    |   DS   |   80286+   |
| Stack Segment   |   SS   |   80286+   |
| Extra Segment   |   ES   |   80286+   |
| General Segment |   FS   |   80386+   |
| General Segment |   GS   |   80386+   |

`eax` (`rax`) is the default register that will be the return value for a function call.

`edi` (`rdi`), by default, contains the number of arguments passed into the function.

`esi` (`rsi`), by default, contains a memory address pointer that points to the beginning of the argument array.

> There is only a subset of registers that are preserved through external function calls (`rbp`, `rbx`, `r12`, `r13`, `r14`, & `r15`). **All other registers value are not guarunteed to stay the same through calls to external functions. All other register values can potentially be clobbered.** To avoid data corruption, you must learn what registers are clobbered for certain external function calls.

### Addressing:

<img src="../../../.pics/Assembly/x86_64/Intel/addressing.png" width="450px"/>

> An address in memory can be accessed using the following format: `[<base> + <index>*<scale> + displacement]`. Where `<base>` & `<index>` are registers, `<displacement>` is an integer, and `<scale>` is 1, 2, 4, or 8; `<scale>` needs to match the size of the data types your are skipping over in terms of bytes (4 for 32-bit unsigned integers, 1 for characters, etc).

> **GPR `<base>` and `<index>` sizes MUST be the same (16-bit register each, 32-bit register each, or 64-bit register each)!**

### Flags:

#### x86 16-Bit FLAGS:

| Bit#  |  Mask  | Abbrv. | Description                                  | Category |  =1                   |    =0                   |
|:-----:|:------:|:------:|:---------------------------------------------|:--------:|:----------------------|:------------------------|
|   0   | 0x0001 |   CF   | Carry                                        |  Status  | Carry (CY)            | No Carry (NC)           |
|   1   | 0x0002 |        | Reserved, always 1 in EFLAGS                 |          |                       |                         |
|   2   | 0x0004 |   PF   | Parity                                       |  Status  | Parity Even (PE)      | Parity Odd (PO)         |
|   3   | 0x0008 |        | Reserved                                     |          |                       |                         |
|   4   | 0x0010 |   AF   | Adjust                                       |  Status  | Auxiliary Carry (AC)  | No Auxiliary Carry (NA) |
|   5   | 0x0020 |        | Reserved                                     |          |                       |                         |
|   6   | 0x0040 |   ZF   | Zero                                         |  Status  | Zero (ZR)             | Not Zero (NZ)           |
|   7   | 0x0080 |   SF   | Sign                                         |  Status  | Negative (NG)         | Positive (PL)           |
|   8   | 0x0100 |   TF   | Trap                                         |  Control |                       |                         |
|   9   | 0x0200 |   IF   | Interrupt Enable                             |  Control | Enable Interrupt (EI) | Disable Interrupt (DI)  |
|   10  | 0x0400 |   DF   | Direction                                    |  Control | Down/Decrement (DN)   | Up/Increment (UP)       |
|   11  | 0x0800 |   OF   | Overflow                                     |  Status  |                       |                         |
| 12~13 | 0x3000 |  IOPL  | I/O privilege level (80286+), always 1 prior |  System  |                       |                         |
|   14  | 0x4000 |   NT   | Nested Task (80286+), always 1 prior         |  System  |                       |                         |
|   15  | 0x8000 |        | Reserved (1 on 8086 & 80186), (0 on 80286+)  |          |                       |                         |

`pushf` pushes the 16 bits of FLAGS to the top of the stack. </br>
`popf` loads 16 bits from the top of the stack into FLAGS. </br>

`lahf` moves bits 0 through 7 of FLAGS into AH. </br>
`sahf` moves AH into bits 0 through 7 of FLAGS. </br>

#### x86 32-Bit EFLAGS:

| Bit#  |  Mask       | Abbrv. | Description                          | Category |
|:-----:|:-----------:|:------:|:-------------------------------------|:--------:|
|   16  | 0x0001_0000 |   RF   | Resume (80386+)                      |  System  |
|   17  | 0x0002_0000 |   VM   | Virtual 8086 Mode (80386+)           |  System  |
|   18  | 0x0004_0000 |   AC   | Alignment Check (486SX+)             |  System  |
|   19  | 0x0008_0000 |  VIF   | Virtual Interrupt (Pentium+)         |  System  |
|   20  | 0x0010_0000 |  VIP   | Virtual Interrupt Pending (Pentium+) |  System  |	
|   21  | 0x0020_0000 |   ID   | Can use CPUID (Pentium+)             |  System  |
| 22~31 | 0xFFC0_0000 |        | Reserved                             |  System  |

`pushfd` pushes the 32 bits of EFLAGS to the top of the stack. </br>
`popfd` loads 32 bits from the top of the stack into EFLAGS. </br>

#### x86_64 64-Bit RFLAGS:

| Bit#  |  Mask                 | Abbrv. | Description                | Category |
|:-----:|:---------------------:|:------:|:---------------------------|:--------:|
| 32~63 | 0xFFFF_FFFF_0000_0000 |        | Reserved                   |          |

`pushfq` pushes the 64 bits of RFLAGS to the top of the stack. </br>
`popfq` loads 64 bits from the top of the stack into RFLAGS. </br>

### Stack Management:

To allocate space on the stack use `sub rsp, <val>`, if this value does not align the stack onto a 16-byte boundary (for which the system expects) it can cause problems. Use another line `and rsp, -16` to clear the lower 4 bytes of the stack pointer to align it.

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

### Inline Assembly:

> The syntax for inline assembly mostly follows the same rules as the parent syntax (i.e., **Intel** or **AT&T**), and the compiler used, so check for compatibility before barging in. The following documentation will be for **Intel Assembly** and the `GCC` compiler.

Inline assembly code can be used with `GCC` and other compilers, as long as the language and the hardware system supports it. In some cases, programmers use inline assembly blocks to prohibit the compilers from making automatic optimizations to thier code (which could otherwise break some code that they wrote intentionally, e.g., for loop delay function with no actionable instructions nested in the middle).

> Keywords like `asm`, `typeof`, `volatile`, & `inline` may not available in programs compiled with `-ansi` or `-std` (although `inline` can be used in a program compiled with `-std=c99` or a later standard).
The way to solve these problems is to put a double underscore (`__`) at the beginning and end of each problematical keyword. For example, use `__asm__` instead of `asm`, and `__inline__` instead of inline.

Creating an inline assembly code block in `C` is fairly simple, but gets more complex when dealing with details:

```c
__asm__ (
  "assembly code" // all assembly code lines are strings and will end with a new line character ('\n')
  "comes first" // all sections are separated by a colon character (':')
  : outputs // the "outputs" and "inputs" sections connect values from a C program to registers
  : inputs
  : clobbers // the "clobbers" section identifies the registers that will be changed (clobbered)
)
```

> ***The syntax for connecting the outputs and inputs between the `C` program and the assembly can be very cryptic; you will need to follow constraints mentioned [here](https://gcc.gnu.org/onlinedocs/gcc/Using-Assembly-Language-with-C.html).***

As an example, below is a `C` code sample that includes inline assembly.

```c
// gcc -c -m32 -masm=intel main.c && gcc -o main main.o -m32 -masm=intel

#include <stdio.h>

int main(void) {
	int value = 17;
	int incr = 12;
	printf("value=%d and incr=%d\n", value, incr);

	__asm__(
		"mov eax, %[value]\n"
		"add eax, %[incr]\n"
		"mov %[value], eax\n" // instructions
		: [value] "=r"(value) // outputs <value> in eax
		: "0"(value), [incr] "r"(incr) // inputs <value> into eax, and <incr> into any general purpose register
		: "eax", "cc" // clobbers eax and condition FLAGS
	);

	printf("value=%d and incr=%d\n", value, incr);
	return 0;
}
```

