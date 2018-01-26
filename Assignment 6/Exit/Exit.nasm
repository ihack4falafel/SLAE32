section .text

global _start

_start:
  push 2       ; push 2 to the stack
  pop eax      ; store 2 in accumulator register
  dec eax      ; decrement accumulator by one
  mov ebx, eax ; move 1 to base register
  int 0x80     ; ping kernel and execute exit()
