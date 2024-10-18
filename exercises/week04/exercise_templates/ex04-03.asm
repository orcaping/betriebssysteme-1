BITS 64

SECTION .data
firstVar:
  dq 0x1337
otherVar:
  dq 0xcafe

SECTION .text
global _start
_start:
  mov rax, [firstVar]
  mov rbx, [otherVar]
  mov [firstVar], rbx
  mov [otherVar], rax