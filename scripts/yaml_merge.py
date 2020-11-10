import sys
import traceback
import yaml

if sys.argv[1] == "--pyyaml-version":
	try:
		print("pyyaml", yaml.__version__)
		sys.exit(0)
	except SystemExit:
		sys.exit(0)
	except:
		print("Could not get pyyaml version")
		sys.exit(3)
	
if len(sys.argv) < 4:
	print("Error: Not enough args")
