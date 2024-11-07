%include "ex06-02.test.asm"

student_code:
  push rbp
  mov rbp, rsp

  cmp rdi, 0
  jz exit

  xor rcx, rcx

loop:
  mov rax, [op1 + 8 * rcx]
  and rax, [op2 + 8 * rcx]
  mov [res + 8 * rcx], rax

  dec rdi
  cmp rdi, 0
  jne loop

exit:
  xor rax, rax
  pop rbp
  ret
