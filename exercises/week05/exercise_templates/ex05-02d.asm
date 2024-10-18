%include "ex05-02.inc.asm"

SECTION .data
; RESULT VARIABLE. DO NOT EDIT!
res: dq 0x0, 0x0, 0x0, 0x0

; INPUT VARIABLES. PUT YOU VALUES HERE!
op1: dq 0xcc33dd44ee55ff66, 0x12345678aa11bb22, 0x8badf00dc001d00d, 0x1337cafedeadbeef
op2: dq 0x0011001100110011, 0x1100110011001100, 0x0101010101010101, 0x1010101010101010

SECTION .text
global main:function
main:
  push rbp
  mov rbp, rsp

  mov rcx, 0

  mov rax, [op1 + 8 * rcx] 
  and rax, [op2 + 8 * rcx] 
  mov [res + 8 * rcx], rax

  inc rcx

  mov rax, [op1 + 8 * rcx] 
  and rax, [op2 + 8 * rcx] 
  mov [res + 8 * rcx], rax

  inc rcx

  mov rax, [op1 + 8 * rcx] 
  and rax, [op2 + 8 * rcx] 
  mov [res + 8 * rcx], rax

  inc rcx

  mov rax, [op1 + 8 * rcx]
  and rax, [op2 + 8 * rcx]
  mov [res + 8 * rcx], rax

  PRINT_RESULT_256

    mov rcx, 0

  mov rax, [op1 + 8 * rcx] 
  or rax, [op2 + 8 * rcx] 
  mov [res + 8 * rcx], rax

  inc rcx

  mov rax, [op1 + 8 * rcx] 
  or rax, [op2 + 8 * rcx] 
  mov [res + 8 * rcx], rax

  inc rcx

  mov rax, [op1 + 8 * rcx] 
  or rax, [op2 + 8 * rcx] 
  mov [res + 8 * rcx], rax

  inc rcx

  mov rax, [op1 + 8 * rcx]
  or rax, [op2 + 8 * rcx]
  mov [res + 8 * rcx], rax

  PRINT_RESULT_256

  mov rcx, 0

  mov rax, [op1 + 8 * rcx] 
  xor rax, [op2 + 8 * rcx] 
  mov [res + 8 * rcx], rax

  inc rcx

  mov rax, [op1 + 8 * rcx] 
  xor rax, [op2 + 8 * rcx] 
  mov [res + 8 * rcx], rax

  inc rcx

  mov rax, [op1 + 8 * rcx] 
  xor rax, [op2 + 8 * rcx] 
  mov [res + 8 * rcx], rax

  inc rcx

  mov rax, [op1 + 8 * rcx]
  xor rax, [op2 + 8 * rcx]
  mov [res + 8 * rcx], rax

  PRINT_RESULT_256

  xor rax, rax
  pop rbp
  ret
