import os
import sys
import time
import json

# Syntax
from ninja_syntax import Writer

# Builder
class build:
	# Init
	def __init__(self, tmp, out):
		# Current dir
		self.currentDir = os.getcwd()
		self.johnnyDir = os.path.join(self.currentDir, "bin", "johnny")
		self.confDir = os.path.join(self.currentDir, "conf")
		self.tmpDir = os.path.join(self.currentDir, tmp)
		self.outDir = os.path.join(self.currentDir, out)
		self.srcDir = os.path.join(self.currentDir, "src")
		self.buildFile = os.path.join(self.tmpDir, "build.ninja")
		
		# Ins path
		self.instructionPath = os.path.join(self.confDir, "instructions.json")
		
		# Create dirs
		self.__createDirs()
		
		# Build things
		self.hFile = open(self.buildFile, "w")
		self.writer = n = Writer(self.hFile)
		
		# Assembler things
		self.__loadConfig()

	# Info
	def __info(self, line):
		print "[INFO {0}] {1}".format(time.strftime("%d.%m.%Y - %I:%M:%S"),line)
		
	# Create dirs
	def __createDirs(self):
		# Create dirs
		if not os.path.exists(self.tmpDir):
			self.__info("Creating directory {0}".format(self.tmpDir))
			os.makedirs(self.tmpDir)
		
		if not os.path.exists(self.outDir):
			self.__info("Creating directory {0}".format(self.tmpDir))
			os.makedirs(self.outDir)
	
	# Load config
	def __loadConfig(self):
		self.confPath = os.path.join(self.confDir, "config.json")
		self.__info("Loading config {0}".format(self.confPath))
		# Config
		with open(self.confPath, "r") as f:
			self.config = json.load(f)
		
	# Assembler path
	def __assembler(self):
		return os.path.join(self.currentDir, "build", "tools", "assembler.py")
	
	# Disssembler path
	def __disassembler(self):
		return os.path.join(self.currentDir, "build", "tools", "disasembler.py")
		
	# Copy tool path
	def __copy(self):
		return os.path.join(self.currentDir, "build", "tools", "copy.py")
	
	# Rules
	def __rules(self):
		# Copy
		self.__info("Adding rule 'copy'")
		self.writer.rule("copy",
			command="python {0} $in $out".format(
				os.path.join(os.getcwd(), "build", "tools", "copy.py")
			),
			description="Copy $out")
		
		# assemble
		self.__info("Adding rule 'assemble'")
		self.writer.rule("assemble",
			command="python {0} {1} $in $out ".format(
				self.__assembler(),
				self.instructionPath
			),
			description="Assembling $in")
				
		# disassemble
		self.__info("Adding rule 'disassemble'")
		self.writer.rule("disassemble",
			command="python {0} {1} $in $out ".format(
				self.__disassembler(),
				self.instructionPath
			),
			description="Disassembling $in")
		
	# Binaries
	def copyDeps(self):
		for name in os.listdir(self.johnnyDir):
			# src dest
			src = os.path.join(self.johnnyDir, name)
			dest = os.path.join(self.outDir, name)
			
			# Path
			self.__info("[INFO] Adding deps: {0}".format(name))
			
			# Build
			self.writer.build(
				dest,
				"copy",
				src
			)
		
	# Generate build files
	def generate(self):
		# Create rules
		self.__rules()
		
		# Files
		for file in self.config["assemble"]:
			source = os.path.join(self.srcDir, file)
			destination = os.path.join(self.outDir, "assembled", file.replace(".asm", ".ram"))
			destinationdsm = os.path.join(self.outDir, "dissasembled", file)
			
			# Add source
			self.__info("Adding source {0}".format(source))

			# Copy
			self.writer.build(
				destinationdsm,
				"copy",
				source
			)	
			
			# Build
			self.writer.build(
				destination,
				"assemble",
				source,
			)
			
		# Files
		for file in self.config["disassemble"]:
			source = os.path.join(self.srcDir, file)
			destination = os.path.join(self.outDir, "dissasembled", file.replace(".ram", ".asm"))
			destinationasm = os.path.join(self.outDir, "assembled", file)
			
			# Add source
			self.__info("Adding assembled file {0}".format(source))

			# Copy
			self.writer.build(
				destinationasm,
				"copy",
				source
			)	
			
			# Build
			self.writer.build(
				destination,
				"disassemble",
				source,
				[self.instructionPath]
			)
		
if __name__ == "__main__":
	b = build(*sys.argv[1:])
	b.generate()
	b.copyDeps()
		