%include "ex06-01.test.asm"

student_code:
  push rbp
  mov rbp, rsp

  mov rax, [op1 + 0]
  and rax, [op2 + 0]
  mov [res + 0], rax

  mov rax, [op1 + 8]
  and rax, [op2 + 8]
  mov [res + 8], rax

  mov rax, [op1 + 16]
  and rax, [op2 + 16]
  mov [res + 16], rax

  mov rax, [op1 + 24]
  and rax, [op2 + 24]
  mov [res + 24], rax

  mov rax, [op1 + 32]
  and rax, [op2 + 32]
  mov [res + 32], rax

  mov rax, [op1 + 40]
  and rax, [op2 + 40]
  mov [res + 40], rax

  mov rax, [op1 + 48]
  and rax, [op2 + 48]
  mov [res + 48], rax

  mov rax, [op1 + 56]
  and rax, [op2 + 56]
  mov [res + 56], rax

  xor rax, rax
  pop rbp
  ret
