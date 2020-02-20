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
    section = elf.get_section_by_name('.text')
    if not section:
      print("No .text section found in file; file may be stripped or obfuscated.")
      exit()
    code = section.data()

    # Set up options for disassembly of the text segment.
    md = Cs(arch, bits)
    md.skipdata = True
    md.detail = True

    # Track whether we have found branches.
    branches = False

    # Disassemble.
    for i in md.disasm(code, 0x1000):
      print("0x%x:\t%s\t%s" %(i.address, i.mnemonic, i.op_str))
      if 1 in i.groups or 7 in i.groups:
        branchesranches = True

    if branches:
      print("Contains branches.")
    print


if __name__ == "__main__":
    main()
