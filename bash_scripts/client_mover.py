#!/usr/bin/python

import os
import sys

client_path = os.path.join(
    os.path.expanduser('~'),
    'clients'
)

client_dirs = os.listdir(client_path)

if len(sys.argv) < 2:
    sys.exit(1)

for directory_name in sorted(directory_name.lower() for directory_name in client_dirs):
    if directory_name.startswith(sys.argv[1]):
        print 'cd', os.path.join(client_path, directory_name)
        sys.exit(0)
