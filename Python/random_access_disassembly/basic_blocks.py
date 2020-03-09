#!/usr/bin/env python3

from rad import *
from os import environ
import sys
from capstone import *
from elftools.elf.elffile import ELFFile

# $ DEBUG=address python3 basic_blocks.py

OUTFILE = "basic_blocks.txt"
SECTION = "text"
JUMP_LIST = ["jo", "jno", "js", "jns", "je", "jz", "jne", "jnz", "jb", "jnae", "jc", "jnb", "jae", "jnc", "jbe", "jna", "ja",
							"jl", "jnge", "jge", "jnl", "jle", "jng", "jg", "jnle", "jp", "jpe", "jnp", "jpo", "jcxz", "jecxz", "jnbe"]


def error(msg):
	print(f"ERROR: {msg}", file=sys.stderr, flush=True)


def print_leaders_list(leaders, updated=False):
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

		# Set up options for disassembly of the text segment. If you wanted to
		# provide access to all the executable sections, you might create one
		# instance for each section. Alternately you could just make a new
		# instance every time you need to switch sections.
		rad = RAD(code, arch, bits, top_addr, entry_point)

		# Remove invalid addresses given at the command line
		invalid_cmd_input = False
		for a in range(0, len(explore)):
			if(not rad.in_range(explore[a])):
				invalid_cmd_input = True
				del explore[a]

		# Inform the user of thier mistake at the command line, fix, and continue basic block analysis
		if(invalid_cmd_input):
			print("One or more of the leaders specified on the command line are out of range for the", section_name, "section.")
			print_leaders_list(explore, True)

		# If no leaders were given, then add the <entry_point> as a leader. Otherwise we have nothing to do!
		if(len(explore) == 0):
			explore = [entry_point]

		# Do both passes.
		bblaa = do_pass_one(explore, rad) # <bblaa> is the Basic Block Leaders Address Array of sorted integers
		do_pass_two(bblaa, rad)
		print()

def do_pass_one(explore, rad):
	'''
	The variable <explore> will be the start of <bblaa> to return as leaders will be appended and disassembled
	in the second pass.

	rad.at(<addr>).address is the specified instruction address
	rad.at(<addr>).mnemonic is the LHS of the instruction
	rad.at(<addr>).op_str is the RHS of the instruction
	'''

	print("\nStarting pass 1...")
	print("Gathering basic block leader addresses...")
	ep = rad.entry_point
	if(len(explore) == 1 and explore[0] == ep): # no leaders specified on the command line
		print("No leaders specified on the command line, entry point is:", hex(ep))

	with open(SECTION + "_section.txt", 'w') as of:
		for i in rad.md.disasm(rad.code, rad.offset):
			if(len(i.operands) == 1 and i.op_str.startswith("0x")):
				loc = int(i.op_str, 0)
			else:
				loc = "none"
			nxt = i.address + i.size

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

			if(i.mnemonic in ["hlt", "ret"]):
				if(nxt not in explore and rad.in_range(nxt)): explore.append(nxt)

			if(i.mnemonic in JUMP_LIST):
				if(nxt not in explore and rad.in_range(nxt)): explore.append(nxt)
				if(loc not in explore and loc != "none" and rad.in_range(loc)): explore.append(loc)

		explore.sort() # put all the addresses in acending order
		print(explore, file=of)
		print("Done with pass 1.")
		print("There were", len(explore), "basic block leaders found in", sys.argv[1])
		of.close()

		return explore


def do_pass_two(bblaa, rad):
	print("\nStarting pass 2...")
	print("Constructing basic blocks...")

	with open(OUTFILE, 'w') as bbf:
		for addr_idx in range(0, len(bblaa)):
			curr_leader = bblaa[addr_idx]
			nxt_leader = -1
			if(addr_idx >= len(bblaa)):
				nxt_leader = rad.size
			else:
				nxt_leader = bblaa[addr_idx+1]

			print("Basic block at:", hex(bblaa[addr_idx]), file=bbf)
			for i in rad.md.disasm(rad.code[curr_leader:nxt_leader], curr_leader):
				print("  %s\t%s" % (i.mnemonic, i.op_str), file=bbf)
				# if(1 in i.groups or 2 in i.groups or 3 in i.groups or 5 in i.groups or 7 in i.groups): break
		bbf.close()


	print("Done with pass 2.")
	print("See \"" + OUTFILE + "\" for all basic blocks constructed from", sys.argv[1])


if __name__ == "__main__":
	main()
