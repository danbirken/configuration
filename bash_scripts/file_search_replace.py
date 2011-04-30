#!/usr/bin/python

import os
import sys
import tempfile
import shutil

search = sys.argv[1]
replace = sys.argv[2]
files = sys.argv[3:]

for filename in files:
	if filename.endswith('.fsr'):
		continue

	temp_file = filename + '.fsr'

	if not os.path.isfile(os.path.join(os.getcwd(), filename)):
		continue

	pre_file = open(os.path.join(os.getcwd(), filename))
	post_file = open(os.path.join(os.getcwd(), temp_file), 'w')

	for line in pre_file:
		post_file.write(line.replace(search, replace))
	
	pre_file.close()
	post_file.close()

	shutil.move(temp_file, filename)
