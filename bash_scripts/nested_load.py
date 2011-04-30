#!/usr/bin/python

import os
import subprocess
import sys

search = sys.argv[1]

def open_in_gvim(file_path):
    subprocess.Popen(
            'gvim %s' % (file_path), stdout=subprocess.PIPE, stderr=subprocess.PIPE,
            shell=True)

for root, dirs, files in os.walk(os.getcwd()):
    for filename in files:
        if filename == search:
            open_in_gvim(os.path.join(root, filename))
            sys.exit(0)
