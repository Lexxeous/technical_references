# <img src="../../../.pics/Lexxeous/lexx_headshot_clear.png" width="90px"/> Lexxeous's AT&T x86_64 README: <img src="../../../.pics/Assembly/x86_64/AT&T/att_nasm_logo.png" width="140"/>

> The **AT&T** syntax was created by Bell Labs (who created Unix) and is only common in the Unix/Linux operating systems.

### External References:



### General:

> The **AT&T** syntax is very similar to the **Intel** syntax, but includes some extra characters to make instructions more explicit:

  * `$` (gets prepended to the front of a number (hexidecimal, binary, decimal, etc...) to clearly indicate that an immediate value will follow)
  * `%` (gets prepended to the front of a register name to clearly indicate that a register will follow)
  * `b` (gets appended to the end of an instruction to clearly indicate that the instruction will be dealing with 8-bit values, byte)
  * `w` (gets appended to the end of an instruction to clearly indicate that the instruction will be dealing with 16-bit values, word)
  * `l` (gets appended to the end of an instruction to clearly indicate that the instruction will be dealing with 32-bit values, long word)
  * `q` (gets appended to the end of an instruction to clearly indicate that the instruction will be dealing with 64-bit values, quad word)

### Instructions:

> The source for an instruction is left hand side, while the destination is the right hand side: `<instruction> <lhs>, <rhs>` --> `<instruction> <source>, <destination>`

### External Functions:



### Sections:



### Registers:



#### x86 16-Bit Registers:



#### x86 32-Bit Registers (Extended):



#### x86_64 64-Bit Registers:



#### x86_64 Segment Registers:



### Addressing:

For example, the following 2 instructions represent the exact same addressing for **Intel** and **AT&T** assembly, using the "load effective address" (`lea`) instruction:

**Intel**: `lea eax, fs: [rcx+rax*2-0x4a]`

**AT&T**: `lea %fs: $-0x4a (%rcx, %rax, 2), eax`

where,

  * `<base>` = `rcx`
  * `<index>` = `rcx`
  * `<scale>` = 2
  * `<displacement>` = -0x4a

### Flags:



#### x86 16-Bit FLAGS:



#### x86 32-Bit EFLAGS:



#### x86_64 64-Bit RFLAGS:



### Stack Management:



### Inline Assembly:


