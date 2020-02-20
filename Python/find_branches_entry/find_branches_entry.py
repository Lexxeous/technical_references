#!/usr/bin/env python3
''' Will disassemble an executable. '''

import sys
from capstone import *
from elftools.elf.elffile import ELFFile

# Convert from ELF tools to constants used by Capstone.
decoder_ring = {
  'EM_386': CS_ARCH_X86,
  'EM_X86_64': CS_ARCH_X86,
  'ELFCLASS32': CS_MODE_32,
  'ELFCLASS64': CS_MODE_64
}

def main():
  for filename in sys.argv[1:]:
    print("%s:"%filename)
  with open(filename, "rb") as f:
  # Try to decode as ELF.
    try:
      elf = ELFFile(f)
    except:
      print("Could not parse the file as ELF; cannot continue.")
      exit()

    # Convert and check to see if we support the file.
    bits = decoder_ring.get(elf['e_ident']['EI_CLASS'], None)
    arch = decoder_ring.get(elf['e_machine'], None)
    if arch is None:
      print("Unsupported architecture %s" % elf['e_machine'])
      exit()
    if bits is None:
      print("Unsupported bit width %s" % elf['e_ident']['EI_CLASS'])
      exit()

    # Get the .text segment's data.
    section_name = ".text"
    section = elf.get_section_by_name(section_name)
    if not section:
      print("No", section_name, "section found in file; file may be stripped or obfuscated.")
      exit()
    code = section.data()

    # Set up options for disassembly of the text segment.
    md = Cs(arch, bits)
    md.skipdata = True
    md.detail = True

    # Track whether we have found branches.
    branches = False

    # Disassemble the ELF file.
    # dis_start = 0x401265
    # dis_start = 0x401505
    # dis_start = 0x4017a5
    dis_start = 0x401a45
    with open("disassembly.txt", 'w') as f:
      for i in md.disasm(code, dis_start):
        print("0x%x:\t%s\t%s" %(i.address, i.mnemonic, i.op_str), file=f)
        if 1 in i.groups or 7 in i.groups:
          branches = True

    if branches:
      print("Contains branches.")
    print


if __name__ == "__main__":
    main()


'''
pip3 install pyinstaller
pyinstaller find_branches_entry.py

Executable is in the dist/find_branches_entry/ directory.


readelf -h find_branches_entry
ELF Header:
  Magic:   7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00 
  Class:                             ELF64
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              EXEC (Executable file)
  Machine:                           Advanced Micro Devices X86-64
  Version:                           0x1
  Entry point address:               0x401a45
  Start of program headers:          64 (bytes into file)
  Start of section headers:          1877280 (bytes into file)
  Flags:                             0x0
  Size of this header:               64 (bytes)
  Size of program headers:           56 (bytes)
  Number of program headers:         8
  Size of section headers:           64 (bytes)
  Number of section headers:         29
  Section header string table index: 28


readelf -s find_branches_entry | grep _start
33: 0000000000000000     0 FUNC    GLOBAL DEFAULT  UND __libc_start_main@GLIBC_2.2.5 (3)
40: 0000000000000000     0 NOTYPE  WEAK   DEFAULT  UND __gmon_start__
'''
