#!/usr/bin/python

import os
import sys

if os.path.exists('/tmp/ssh_auth_sock'):
    print 'export SSH_AUTH_SOCK=/tmp/ssh_auth_sock'
    sys.exit(0)

keyring_dirs = []

for directory in os.listdir('/tmp'):
    if directory.startswith('keyring-'):
        full_dir = os.path.join('/tmp', directory)
        keyring_dirs.append((
                os.stat(full_dir).st_mtime,
                full_dir
        ))

keyring_dirs.sort()
print 'export SSH_AUTH_SOCK=' + keyring_dirs[0][1] + '/socket.ssh'
os.symlink(keyring_dirs[0][1] + '/socket.ssh', '/tmp/ssh_auth_sock')
