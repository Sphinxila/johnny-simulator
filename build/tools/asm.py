##########################################
# Author: Philip IF 1.1
# Project: ABBTS - Johnny Simulator 
# Descr: Assembler for Johnny
##########################################

import os

# Assembler
class assembler:
	# Init
	def __init__(self, instructions = []):
		# Default instruction set
		self.instructions = instructions
	
	# Translate
	def __translate(self, filename, line, str):
		# Data (strip string to avoid wrong list sizes)
		data = str.strip().split(' ')
		
		# Validate line
		if (len(data) > 3):
			raise ValueError("Invalid line: {0} in {1} element size {2}".format(line,filename, len(data)))

		# Retrieve values
		address = int(data[0])
		asm = data[1].strip()
		value = data[2].strip().zfill(3)
				
		# Data
		if asm in self.instructions:
			self.dict[address] = {"asm" : self.instructions[asm], "value" :  value}
		elif asm == 'RAM':
			self.dict[address] = {"asm" : 'RAM' , "value" :  value}
		else:
			raise ValueError("Invalid asm instruction line:{0} '{1}' (address {3}) in {2}".format(line,asm,filename,address))
		
	# Assemble
	def assemble(self, path, out):
		self.dict = {}
	
		# Default line number starts 1
		lnr = 1
		
		# Instructions
		instructions = []
		with open(path, "r") as f:
			for line in f:
				self.__translate(path, lnr, line)
				lnr = lnr + 1	# Update count
		
		
		# Format
		for i in range(0,1000):
			if i in self.dict:
				# Data
				data = self.dict[i]
				
				# Create str
				if (data["asm"] == "RAM"):
					str = data["value"]
				else:
					str = "{}{}".format(data["asm"],data["value"])
			else:
				str = "000"
			instructions.append(str)

		# Write output
		with open(out, "w+") as f:
			f.write("\n".join(instructions))

# Disassembler
class disassembler:
	# Init
	def __init__(self, instructions = []):
		# Default instruction set
		self.instructions = instructions
		
		# Default value len
		self.valueLen = 3
	
	# Get asm
	def getAsm(self, ins):
		for key, elem in self.instructions.items():
			if elem != "":
				if int(elem) == int(ins):
					return key
		return None
				
	# Translate
	def __translate(self, filename, line, buffer):
		# Strip string if whitespaces
		buffer = buffer.strip()
		
		# Check
		if len(buffer) < 3:
			raise ValueError("Invalid format: {0} in {1} content: {2}".format(line, filename, buffer))
	
		# Append list
		list = []
	
		# Default
		if len(buffer) > 3:
			# Data
			ins = buffer[:len(buffer)-self.valueLen]
			value = buffer[-self.valueLen:]
			
			# Instructions
			asm = self.getAsm(ins)
			
			# Check
			if (asm == None):
				raise ValueError("Invalid integer (ASM  key): {0} in {1} content: {2}".format(line,filename, buffer))

			# Data
			list.append(str(line-1))
			list.append(asm)	# ASM
			list.append(value)	# Value
		# Preset values (RAM)
		else:
			list.append(str(line-1))
			list.append('RAM')
			list.append(buffer)
		
		# list
		return " ".join(list)
		
	# Assemble
	def disassemble(self, path, out):
		# Default line number starts 1
		lnr = 1
		
		# Instructions
		instructions = []
		with open(path, "r") as f:
			for line in f:
				if len(line) > 0:
					instructions.append(self.__translate(path, lnr, line))
					lnr = lnr + 1	# Update count
		
		# Write output
		with open(out, "w+") as f:
			f.write("\n".join(instructions))
			
