%include "ex05-02.inc.asm"

SECTION .data
; RESULT VARIABLE! DO NOT EDIT!
res: dq 0x0, 0x0, 0x0, 0x0

; INPUT VARIABLES. PUT YOU VALUES HERE!
op1: dq 0x1bbdd0e310101010, 0x2448d1e411111111, 0xd44ec1d401010101, 0xc112d0e310101010
op2: dq 0x1010101010101010, 0x1111111111111111, 0x0101010101010101, 0x1010101010101010


SECTION .text
global main:function
main:
  push rbp
  mov rbp, rsp

  mov rcx, 0

  mov rax, [op1 + 8 * rcx]
  sub rax, [op2 + 8 * rcx]
  mov [res + 8 * rcx], rax

  inc rcx

  mov rax, [op1 + 8 * rcx]
  sbb rax, [op2 + 8 * rcx]
  mov [res + 8 * rcx], rax

  inc rcx

  mov rax, [op1 + 8 * rcx]
  sbb rax, [op2 + 8 * rcx]
  mov [res + 8 * rcx], rax

  inc rcx

  mov rax, [op1 + 8 * rcx]
  sbb rax, [op2 + 8 * rcx]
  mov [res + 8 * rcx], rax

  PRINT_RESULT_256

  xor rax, rax
  pop rbp
  ret
