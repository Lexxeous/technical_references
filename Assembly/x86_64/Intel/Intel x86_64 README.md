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

`mov` is effectively a copy operation like: `mov LHS, RHS`. The RHS gets copied into the LHS, while the RHS retains its original value.

`movsd` stands for "Move Static Double" and is used for moving values that are larger than 64 bits (80 bits, 128 bits (`xmm<n>`), etc.) into 64-bit registers.

### External Functions:

`strtod` uses `rdi` and `rsi` as default arguments, and the result is stored in `xmm0`.

`sqrt` uses what is in register `xmm0` and stores the result in `xmm0`. You must store the original value in a secondary register if you don't want to lose/overwrite it.

`printf`'s first argument by default is `rdi`. It also needs to know how many floats (`%f`) to print, which is retrieved from `eax`.

`puts`, by default, will write what is in `RDI`.

### Sections:

Using `section .text` denotes a section that is meant as executable code. It gets accumulated into the **code segment (CS)** of the resulting executable.

Using `section .data` denotes a section that is meant as non-executable code, but rather data that is to be used for convenience within the program. It gets accumuleted into the **data segment (DS)** of the resulting executable.

Using `section .bcc` denotes a section that is meant for modifiable data. The Block Started by Symbol (BSS) area is of fixed size capable of storing modifiable variables. This section is adjacent to the data segment (DS).

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

`eax` (`rax`) is the default register that will be the return value for a function call

`edi` (`rdi`), by default, contains the number of arguments passed into the function

`esi` (`rsi`), by default, contains a memory address pointer that points to the beginning of the argument array

### Addressing:

> An address in memory can be accessed using the following format: `[<base> + <index>*<scale> + displacement]`. Where `<base>` & `<index>` are registers, `<displacement>` is an integer, and `<scale>` is 1, 2, 4, or 8.

> **GPR `<base>` and `<index>` sizes MUST be the same (16-bit register each, 32-bit register each, or 64-bit register each)!**

<img src="../../../.pics/Assembly/x86_64/Intel/addressing.png" width="450px"/>

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





