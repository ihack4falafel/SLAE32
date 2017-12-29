; HelloWorld.asm
; Author: Hashim Jawad


global _start


; code goes here
section .text

_start:

; system call for write /usr/include/i386-linux-gnu/asm/unistd_32.h | #define __NR_write  4

	; print "Hello World" to screen
	; mov instruction moves data between destination and source (move dest, source)
        ; ssize_t write(int fd, const void *buf, size_t count);
        ; syscall for write instruction
	; file descriptor for stdout 1
	; store pointer value to "Hello World!" string, used message lable
	; store string lengnth
	; go ahead and interrupt to do system call

	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, message
	mov edx, mlen
	int 0x80

; system call for exit  /usr/include/i386-linux-gnu/asm/unistd_32.h | #define __NR_exit   1

	; exit program gracefully
	; void exit(int status);
	; random exit code
	; go ahead and interrupt to do system call

	mov eax, 0x1
	mov ebx, 0x5
	int 0x80 

; initilized data goes here
section .data

	; message Label
	; mlen stands for message length
	; equ stands for equal
	; db stands for define byte

	message: db "Hello World!"
	mlen   equ $-message
