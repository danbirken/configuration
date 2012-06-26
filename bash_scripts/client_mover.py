#!/usr/bin/python

import os
import sys

client_dirs = os.listdir('/home/dan/clients/')

if len(sys.argv) < 2:
    sys.exit(1)

for directory_name in sorted(directory_name.lower() for directory_name in client_dirs):
    if directory_name.startswith(sys.argv[1]):
        print 'cd /home/dan/clients/%s/' % directory_name
        sys.exit(0)
