#!/usr/bin/python

import os
import re
import subprocess
import sys
import time

import termcolor

args = sys.argv[1:]

def _run_status():
    top_level_dir = subprocess.Popen(
            ['/usr/bin/git', 'rev-parse', '--show-toplevel'],
            stdout=subprocess.PIPE).communicate()[0]

    output = subprocess.Popen(
            ['/usr/bin/git', 'status'], stdout=subprocess.PIPE).communicate()[0]
    files = set()
    cl_name = None
    for line in output.split('\n'):
        if line.strip():
            if 'new file' in line or 'modified' in line:
                data = line.split(':')
                files.add(
                    (
                        os.path.abspath(data[-1].strip())[len(top_level_dir):],
                        data[-1].strip(),
                    )
                )

    return top_level_dir, sorted(list(files))

def parse_nums(nums):
    number_list = set()
    for num in nums:
        if num.startswith('-'):
            number_list.discard(int(num[1:]))
        elif '-' in num:
            start, finish = num.split('-')
            number_list.update(range(int(start), int(finish)+1))
        else:
            number_list.add(int(num))
    return list(number_list)

if not len(args):
    output = []
    for index, file in enumerate(_run_status()[1]):
        if file[0].startswith('includes/models'):
            output.append(
                termcolor.colored(
                    '%s\\t%s (%s)' % (index, file[0], index), 'green', attrs=['bold']))
        elif file[0].startswith('includes'):
            output.append(
                termcolor.colored(
                    '%s\\t%s (%s)' % (index, file[0], index), 'cyan'))
        elif file[0].startswith('template/twig/email'):
            output.append(
                termcolor.colored(
                    '%s\\t%s (%s)' % (index, file[0], index), 'red', attrs=['bold']))
        elif file[0].startswith('template/twig'):
            output.append(
                termcolor.colored('%s\\t%s (%s)' % (index, file[0], index), 'magenta'))
        elif file[0].startswith('migrations'):
            output.append(
                termcolor.colored(
                    '%s\\t%s (%s)' % (index, file[0], index), 'white', attrs=['bold']))
        else:
            output.append('%s\\t%s (%s)' % (index, file[0], index))
    print 'echo -e %s' % ('\\n'.join(output))
else:
    command = args[0]
    top_level_dir, status = _run_status()
    if len(args) == 1:
        file_list = []
    else:
        number_list = parse_nums(args[1:])
        file_list = [status[int(number)][1] for number in number_list]

    if command == 'rt':
       print 'cd %s' % top_level_dir
    if command == 'd':
        subprocess.Popen(
                '/usr/bin/git difftool --tool=tkdiff %s' % (' '.join(file_list)),
                shell=True).communicate()
    elif command == 'commit':
        subprocess.Popen(
                '/usr/bin/git commit %s' % (' '.join(file_list)),
                shell=True).communicate()
    elif command == 'co':
        subprocess.Popen(
                '/usr/bin/git checkout %s' % (' '.join(file_list)),
                shell=True).communicate()
    elif command == 'g':
        for filename in file_list:
            output = subprocess.Popen(
                'gvim %s' % (filename),
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                shell=True)
    elif command == 'a':
        subprocess.Popen(
                '/usr/bin/git add %s' % (' '.join(file_list)),
                shell=True).communicate()
    elif command == 'touch':
        subprocess.Popen(
                'touch %s' % (' '.join(file_list)),
                shell=True).communicate()
    elif command == 'cd':
        print 'cd ./%s' % (os.path.dirname(file_list[0]))

