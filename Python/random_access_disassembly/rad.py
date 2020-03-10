#!/usr/bin/env python3

# Helpful functions and a random disassembly class to assist in disassembly with Python.

import sys
from capstone import *
from capstone.x86 import X86_REG_RIP
from capstone.x86_const import *
from elftools.elf.elffile import ELFFile

# Convert from ELF tools to constants used by Capstone.
decoder_ring = {
	'EM_386': CS_ARCH_X86,
	'EM_X86_64': CS_ARCH_X86,
	'ELFCLASS32': CS_MODE_32,
	'ELFCLASS64': CS_MODE_64
}

def is_mem(oper):
	'''Provided with an operand, determine if it is a memory reference.'''
	return oper.type == X86_OP_MEM

def is_imm(oper):
	'''Provided with an operand, determine if it is immediate.'''
	return oper.type == X86_OP_IMM

def is_reg(oper):
	'''Provided with an operand, determine if it is a register.'''
	return oper.type == X86_OP_REG

def is_rip_relative(oper):
	''' Determine if an operand is RIP-relative. If so, return the offset. Otherwise, return None '''
	if(oper.type == X86_OP_MEM and oper.value.mem.base == X86_REG_RIP):
		return oper.value.mem.disp
	return None

class AddressException(Exception):
	"""Address is out of bounds."""
	def __init__(self, address, offset, size):
		self.address = address
		self.offset = offset
		self.size = size

	def __str__(self):
		return "Address Out Of Bounds: 0x%x is not in [0x%x, 0x%x]" % (
			self.address, self.offset, self.offset+self.size
		)


class RAD:
	'''Provide a random access disassembler (RAD).'''
	def __init__(self, code, arch, bits, offset, entry_point):
		'''
		Start disassembly of the provided code blob.

		Arguments:
			code -- The binary blob of the code.
			arch -- The architecture, as defined by Capstone.
			bits -- The bit width, as defined by Capstone.
			offset -- The code offset to use.
			entry_point -- The program's official entry point address.
		'''
		# Set up options for disassembly of the text segment.
		self.md = Cs(arch, bits)
		self.md.skipdata = True
		self.md.detail = True
		self.code = code
		self.offset = offset
		self.entry_point = entry_point
		self.size = len(code)

	def at(self, address):
		'''
		Try to disassemble and return the instruction starting at
		the given address. Note that the address is relative to the
		offset provided at creation, and that an AddressException is
		thrown when the address is out of bounds (below the offset or
		above the offset plus the length of the binary blob).
		'''
		index = address - self.offset
		if(index < 0 or index >= self.size):
			raise AddressException(address, self.offset, self.size)

		# The maximun length of an x86-64 instruction is 15 bytes. You can
		# exceed this with prefix bytes and the like, but you will get an
		# "general protection" (GP) exception on the processor. So don't do that.
		return next(self.md.disasm(self.code[index:index+15], address, count=1))

	def in_range(self, address):
		'''Determine if an address is in range (not outside the specified section).'''
		index = address - self.offset
		return(index >= 0 and index < self.size)


def main():
	print("Hello assembly world.")

if __name__ == "__main__":
	main()
