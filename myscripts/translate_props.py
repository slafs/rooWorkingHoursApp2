#!/usr/bin/python
#encoding: utf-8
from __future__ import with_statement

import sys

USAGE = """
    %s <file.properties>
"""

if len(sys.argv) < 2:
    print "USAGE"
    print USAGE % sys.argv[0]
    sys.exit(1)

with open(sys.argv[1]) as f:
    s = f.read().decode('UTF-8')
    
    #r = lambda x: unichr(ord(x))

    #print map(r,s)

    #for l in s:
    #    print unichr(ord(l)),
    print repr(s).replace('\\n', '\n').replace('\\xf3', '\\u00F3')[2:-1]

