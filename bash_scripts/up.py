#!/usr/bin/python

import sys

try:
    count = int(sys.argv[1])
except:
    count = 1

print 'cd %s' % ('/'.join(['..'] * count))
