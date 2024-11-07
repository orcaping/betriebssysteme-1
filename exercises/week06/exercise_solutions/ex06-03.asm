%include "ex06-03.test.asm"
 
student_code:
  push rbp
  mov rbp, rsp
 
  xor rcx, rcx

  ; Speziallfall: Sofern die Zahl 0 quadwords enthält,
  ; soll gar kein Code ausgeführt werden.
  cmp rdi, 0
  jz exit

  clc
 
loop:
  mov rax, [op1 + 8 * rcx]
  adc rax, [op2 + 8 * rcx]
 
  mov [res + 8 * rcx], rax

  inc rcx
  dec rdi
  jnz loop
 
exit:
  xor rax, rax
  pop rbp
  ret
