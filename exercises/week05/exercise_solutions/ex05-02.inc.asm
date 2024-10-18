BITS 64

DEFAULT rel

%define PRINT_RESULT_128 call print_result_128
%define PRINT_RESULT_256 call print_result_256

extern printf

SECTION .data
format_128: db "result = 0x%016llx%016llx", 10, 0
format_256: db "result = 0x%016llx%016llx%016llx%016llx", 10, 0

SECTION .text
print_result_128:
  push rbp
  mov rbp, rsp
  push rdi
  push r11

  mov rdi, format_128
  mov r11, 2
  call print_result

  pop r11
  pop rdi
  pop rbp
  ret

print_result_256:
  push rbp
  mov rbp, rsp
  push rdi
  push r11

  mov rdi, format_256
  mov r11, 4
  call print_result

  pop r11
  pop rdi
  pop rbp
  ret

print_result:
  push rbp,
  mov rbp, rsp

  push rax
  push rsi
  push rdx
  push rcx
  push r8
  push r8

  xor rax, rax
  cmp r11, 2
  je .load2
  mov rsi, [res + 24]
  mov rdx, [res + 16]
  mov rcx, [res +  8]
  mov r8,  [res +  0]
  jmp .work

print_result.load2:
  mov rsi, [res + 8]
  mov rdx, [res + 0]

print_result.work:
  call printf

  pop r8
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rax

  pop rbp
  ret
