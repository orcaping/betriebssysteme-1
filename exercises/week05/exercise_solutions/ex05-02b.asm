%include "ex05-02.inc.asm"

SECTION .data
; RESULT VARIABLE! DO NOT EDIT!
res: dq 0x0, 0x0, 0x0, 0x0

; INPUT VARIABLES. PUT YOU VALUES HERE!
op1: dq 0xcc33dd44ee55ff66, 0xaa11bb22
op2: dq 0x0101010101010101, 0x01010101

SECTION .text
global main:function
main:
  push rbp
  mov rbp, rsp

  mov rcx, 0

  mov rax, [op1 + 8 * rcx]
  or rax, [op2 + 8 * rcx]
  mov [res + 8 * rcx], rax

  inc rcx

  mov rax, [op1 + 8 * rcx]
  or rax, [op2 + 8 * rcx]
  mov [res + 8 * rcx], rax

  PRINT_RESULT_128

  xor rax, rax
  pop rbp
  ret
