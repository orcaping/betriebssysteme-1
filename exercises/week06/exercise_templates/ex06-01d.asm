%include "ex06-01.test.asm"

student_code:
  push rbp
  mov rbp, rsp

  xor rcx, rcx

loop:
  mov rax, [op1 + 8 * rcx]
  and rax, [op2 + 8 * rcx]
  mov [res + 8 * rcx], rax

  inc rcx 
  cmp rcx, 8
  jne loop

  xor rax, rax
  pop rbp
  ret
