%include "ex06-01.test.asm"

student_code:
  push rbp
  mov rbp, rsp

  xor rcx, rcx

  mov rax, [op1 + rcx]
  and rax, [op2 + rcx]
  mov [res + rcx], rax

  add rcx, 8

  mov rax, [op1 + rcx]
  and rax, [op2 + rcx]
  mov [res + rcx], rax

  add rcx, 8

  mov rax, [op1 + rcx]
  and rax, [op2 + rcx]
  mov [res + rcx], rax

  add rcx, 8

  mov rax, [op1 + rcx]
  and rax, [op2 + rcx]
  mov [res + rcx], rax

  add rcx, 8

  mov rax, [op1 + rcx]
  and rax, [op2 + rcx]
  mov [res + rcx], rax

  add rcx, 8

  mov rax, [op1 + rcx]
  and rax, [op2 + rcx]
  mov [res + rcx], rax

  add rcx, 8

  mov rax, [op1 + rcx]
  and rax, [op2 + rcx]
  mov [res + rcx], rax

  add rcx, 8

  mov rax, [op1 + rcx]
  and rax, [op2 + rcx]
  mov [res + rcx], rax

  xor rax, rax
  pop rbp
  ret
