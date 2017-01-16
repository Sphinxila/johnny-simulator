import shutil
import sys

# Copy
def main(src, dest):
	shutil.copy(src, dest)
	
if __name__ == "__main__":
	main(*sys.argv[1:])
	