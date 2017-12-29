; HelloWorld.asm
; Author: Hashim Jawad


global _start


; section for code
section .text

_start:

; System call for write /usr/include/i386-linux-gnu/asm/unistd_32.h | #define __NR_write  4

	; Print "Hello World" to Screen
	; mov instruction moves data between destination and source (move dest, source)
        ; ssize_t write(int fd, const void *buf, size_t count);
        ; syscall for write instruction
	; file descriptor for stdout 1
	; store pointer value to "Hello World!" string
	; store string lengnth
	; go ahead and do system call

	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, message
	mov edx, mlen
	int 0x80

; System call for exit  /usr/include/i386-linux-gnu/asm/unistd_32.h | #define __NR_exit   1

	; exit program gracefully
	; void exit(int status);
	; random exit code
	; go ahead and do system call

	mov eax, 0x1
	mov ebx, 0x5
	int 0x80 

; section for initilized data
section .data

	; Message Label
	; mlen stands for message length
	; equ stands for equal

	message: db "Hello World!"
	mlen   equ $-message
