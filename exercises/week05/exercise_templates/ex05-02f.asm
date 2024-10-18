%include "ex05-02.inc.asm"

SECTION .data
; RESULT VARIABLE. DO NOT EDIT!
res: dq 0x0, 0x0, 0x0, 0x0

; INPUT VARIABLES. PUT YOU VALUES HERE!
op1: dq 0x3344556677889900, 0xaabbccddeeff1122, 0xf000
op2: dq 0xccbbaa9988776700, 0x554433221100eedd, 0xc

SECTION .text
global main:function
main:
  push rbp
  mov rbp, rsp

  mov rcx, 0

  mov rax, [op1 + 8 * rcx]
  add rax, [op2 + 8 * rcx]
  mov [res + 8 * rcx], rax

  inc rcx

  mov rax, [op1 + 8 * rcx]
  adc rax, [op2 + 8 * rcx]
  mov [res + 8 * rcx], rax

  inc rcx

  mov rax, [op1 + 8 * rcx]
  adc rax, [op2 + 8 * rcx]
  mov [res + 8 * rcx], rax

  PRINT_RESULT_128

  xor rax, rax
  pop rbp
  ret
