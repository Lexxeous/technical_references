#!/usr/bin/env python3

from rad import *
from os import environ
import sys
from capstone import *
from elftools.elf.elffile import ELFFile


OUTFILE = "basic_blocks.txt"
SECTION = "text"
JUMP_LIST = ["jo", "jno", "js", "jns", "je", "jz", "jne", "jnz", "jb", "jnae", "jc", "jnb", "jae", "jnc", "jbe", "jna", "ja",
							"jl", "jnge", "jge", "jnl", "jle", "jng", "jg", "jnle", "jp", "jpe", "jnp", "jpo", "jcxz", "jecxz", "jnbe"]


def error(msg):
	''' Print an error message. '''
	print(f"ERROR: {msg}", file=sys.stderr, flush=True)


def print_leaders_list(leaders, updated=False):
	''' Print the original and/or updated version of the leaders list. '''
	nothing = False
	if(not updated): print("Specified leaders: ", end="[")
	if(updated): print("Updated specified leaders: ", end="[")
	if(len(leaders) == 0): nothing = True
	if(not nothing):
		for l in range(0, len(leaders)):
			if(l == (len(leaders) - 1)): print(hex(leaders[l]), end="")
			else: print(hex(leaders[l]), end=", ")
	else: print("None", end="")
	print("]")
	if(nothing): print("Will start basic block analysis with the entry point.")


def main():
	'''
	Disassemble the file given on the command line and identify basic blocks.
	Add any leaders specified on the command line after the file name.
	If no leaders are specified, use the entry point.
	'''

	# Command line argument error checking.
	if(len(sys.argv) < 2):
		print("Expected one executable (binary file) as an input argument.")
		exit(1)

	filename = sys.argv[1]
	leaders = list(map(lambda x: int(x,0), sys.argv[2:]))
	print_leaders_list(leaders)
	find_and_print(filename, leaders)
	exit(0)


def find_and_print(filename, explore=[]):
	'''
	Disassemble the specified file and identify basic blocks, tracing potential
	execution flow. Addresses of an initial set of addresses to explore can be provided.
	If this set is empty, then the entry point of the ELF file is used.
	'''

	print(f"{filename}")

	with open(filename, "rb") as f:
		# Try to decode as ELF.
		try:
			elf = ELFFile(f)
		except:
			error("Could not parse the file as ELF; cannot continue.")
			exit(1)

		# Convert and check to see if we support the file.
		bits = decoder_ring.get(elf['e_ident']['EI_CLASS'], None)
		arch = decoder_ring.get(elf['e_machine'], None)
		if arch is None:
			error(f"Unsupported architecture {elf['e_machine']}")
			exit(1)
		if bits is None:
			error(f"Unsupported bit width {elf['e_ident']['EI_CLASS']}")
			exit(1)

		# Get the .text segment's data. A more aggressive version of this would grab all of the executable sections.
		section_name = "." + SECTION
		section = elf.get_section_by_name(section_name)
		if not section:
			print("No", section_name, "section found in file; file may be stripped or obfuscated.")
			exit(1)
		code = section.data()

		top_addr = section.header.sh_addr
		entry_point = elf.header.e_entry
		offset = entry_point - top_addr
		if(offset < 0 or offset >= section.header.sh_size):
			print("Entry point is not in", section_name, "section.")
			exit(1)

		# Set up options for disassembly of the text segment. If you wanted to provide access to all the executable sections, you might create one
		# instance for each section. Alternately you could just make a new instance every time you need to switch sections.
		rad = RAD(code, arch, bits, top_addr, entry_point)

		# Remove invalid addresses given at the command line
		remove_list = []
		invalid_cmd_input = False
		for a in range(0, len(explore)):
			if(not rad.in_range(explore[a])):
				invalid_cmd_input = True
				remove_list.append(explore[a])
		explore = [i for i in explore if i not in remove_list]

		# Inform the user of thier mistake at the command line, fix, and continue basic block analysis
		if(invalid_cmd_input):
			print("One or more of the leaders specified on the command line are out of range for the", section_name, "section.")
			print("The", section_name, "section begins at address", hex(top_addr), "and ends at address", hex(top_addr + rad.size - 1))
			print_leaders_list(explore, True)

		# If no leaders were given, then add the <entry_point> as a leader. Otherwise we have nothing to do!
		if(len(explore) == 0):
			explore = [entry_point]

		# Do both passes.
		bblaa = do_pass_one(explore, rad) # <bblaa> is the Basic Block Leaders Address Array of sorted integers
		do_pass_two(bblaa, rad)


def do_pass_one(explore, rad):
	'''
	The variable <explore> will be the start of <bblaa> to return as leaders will be appended and disassembled
	in the second pass.

	.address is the specified instruction address
	.mnemonic is the LHS of the instruction
	.op_str is the RHS of the instruction
	.operands is a list of comma separated items on the RHS of the instruction
	.size if the length of the curent instruction in bytes
	'''

	print("\nStarting pass 1...")
	print("Gathering basic block leader addresses...")
	ep = rad.entry_point
	if(len(explore) == 1 and explore[0] == ep): # no leaders specified on the command line
		print("No leaders specified on the command line, entry point is:", hex(ep))

	with open(SECTION + "_section.txt", 'w') as of:
		for i in rad.md.disasm(rad.code, rad.offset):
			nxt = i.address + i.size
			if(len(i.operands) == 1):
				if(is_imm(i.operands[0])): loc = i.operands[0].value.imm
				elif(is_reg(i.operands[0])): loc = i.operands[0].value.reg
				elif(is_mem(i.operands[0])):
					displacement = is_rip_relative(i.operands[0])
					if(displacement != None): loc = nxt + displacement
				else: loc = "none"
			
			print("0x%x:\t%s\t%s\n\tNEXT: 0x%x\tJUMPTO: %s" %(i.address, i.mnemonic, i.op_str, nxt, loc), file=of)

			if(1 in i.groups and 7 in i.groups): # conditional jump ; target and next instruction are leaders ; end block
				if(nxt not in explore and rad.in_range(nxt)): explore.append(nxt)
				if(loc not in explore and loc != "none" and rad.in_range(loc)): explore.append(loc)

			elif(2 in i.groups and 7 in i.groups): # call <addr> ; target and next instruction are leaders ; end block
				if(nxt not in explore and rad.in_range(nxt)): explore.append(nxt)
				if(loc not in explore and loc != "none" and rad.in_range(loc)): explore.append(loc)

			elif(1 in i.groups): # unconditional jump ; target is a leader ; end block
				if(loc not in explore and loc != "none" and rad.in_range(loc)): explore.append(loc)

			elif(2 in i.groups): # call <addr> ; target and next instruction are leaders ; end block
				if(nxt not in explore and rad.in_range(nxt)): explore.append(nxt)
				if(loc not in explore and loc != "none" and rad.in_range(loc)): explore.append(loc)

			elif(3 in i.groups): # return ; end block
				if(nxt not in explore and rad.in_range(nxt)): explore.append(nxt)

			elif(4 in i.groups): # interrupt ; instruction after interrupt is a leader
				if(nxt not in explore and rad.in_range(nxt)): explore.append(nxt)

			elif(5 in i.groups): # interrupt return ; end block
				if(nxt not in explore and rad.in_range(nxt)): explore.append(nxt)

			elif(6 in i.groups): # privilege ; ignore
				if(nxt not in explore and rad.in_range(nxt)): explore.append(nxt)

			elif(7 in i.groups): # conditional jump ; target and next instruction are leaders ; end block
				if(nxt not in explore and rad.in_range(nxt)): explore.append(nxt)
				if(loc not in explore and loc != "none" and rad.in_range(loc)): explore.append(loc)

		explore.sort() # put all the addresses in acending order
		print(explore, file=of)
		print("Done with pass 1.")
		print("There were", (len(explore)-1), "basic block leaders found in", sys.argv[1])
		of.close()

		return explore


def pass_two_done(file_handler, idx, end):
	''' Finish the second pass. '''
	file_handler.close()
	print("Done with pass 2.")
	print("Some", (idx - 1), "out of", (end - 1), "basic blocks were discovered and printed.")
	print("See \"" + OUTFILE + "\" for all basic blocks constructed from", sys.argv[1])
	exit()


def do_pass_two(bblaa, rad):
	''' Start printing the basic blocks that were gathered from the first pass. '''
	print("\nStarting pass 2...")
	print("Constructing basic blocks...")

	with open(OUTFILE, 'w') as bbf:
		idx = 1 # index for bblaa
		end = len(bblaa)
		print("block at: " + str(hex(bblaa[0])), file=bbf)
		for i in rad.md.disasm(rad.code, bblaa[idx - 1]):
			between_leaders = i.address >= bblaa[idx - 1] and i.address < bblaa[idx] # look backwards to avoid segfault

			# To catch all jump/branch type instructions
			if((1 in i.groups or 7 in i.groups or 2 in i.groups or i.mnemonic in JUMP_LIST) and between_leaders):
				print("  %s\t%s" %(i.mnemonic, i.op_str), file=bbf)
				idx = idx + 1
				if(idx >= end):
					print("next: unknown", file=bbf)
					pass_two_done(bbf, idx, end)
				print("true: " + str(i.op_str), file=bbf)
				print("false: " + str(hex(bblaa[idx - 1])), file=bbf)
				print("\nblock at: " + str(hex(bblaa[idx - 1])), file=bbf)

			# If "hlt" or "ret" or out of bounds
			if(((i.mnemonic == "hlt" or 3 in i.groups) and between_leaders) or (i.address >= bblaa[idx])):
				print("  %s\t%s" %(i.mnemonic, i.op_str), file=bbf)
				idx = idx + 1
				if(idx >= end):
					print("next: unknown", file=bbf)
					pass_two_done(bbf, idx, end)
				print("next: " + str(hex(bblaa[idx - 1])), file=bbf)
				print("\nblock at: " + str(hex(bblaa[idx - 1])), file=bbf)

			try:
				if(between_leaders):
					print("  %s\t%s" %(i.mnemonic, i.op_str), file=bbf)
			except:
				break

if __name__ == "__main__":
	main()
