import sys
import json
from asm import assembler

class build:
	def __init__(self, instruction, src, out):
		self.instructionPath = instruction
		self.srcPath = src
		self.dstPath = out

		# Config
		with open(self.instructionPath, "r") as f:
			self.instructions = json.load(f)

		self.assembler = assembler(self.instructions)
	
	# Nice
	def assemble(self):
		self.assembler.assemble(self.srcPath, self.dstPath)
	
if __name__ == "__main__":
	b = build(*sys.argv[1:])
	b.assemble()