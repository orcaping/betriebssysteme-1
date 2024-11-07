BITS 64
DEFAULT rel

number_of_qwords equ 8

SECTION .bss
res: resq number_of_qwords + 1

SECTION .rodata
format_actual:
  db "actual   = ", 0
format_expected:
  db "expected = ", 0
format_number_head:
  db "0x%016llx", 0
format_number_tail:
  db "_%016llx", 0
format_number_end:
  db 10, 0
format_mismatch:
  db "Your result does not match the expected result! First mismatch at byte no. %d", 10, 0
format_overflow:
  db "You produced an overflow. You probably miscalculated the number of iterations!", 10, 0
format_ok:
  db "Well done! Your result matches the expected result!", 10, 0
number_expected:
  dq 0x1010101010101010, 0x0202020202020202, 0x3030303030303030, 0x0404040404040404, 0x5050505050505050, 0x0606060606060606, 0x7070707070707070, 0x0808080808080808

SECTION .data
op1:
  dq 0x1111111111111111, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444, 0x5555555555555555, 0x6666666666666666, 0x7777777777777777, 0x8888888888888888, 0x1337
op2:
  dq 0xf0f0f0f0f0f0f0f0, 0x0f0f0f0f0f0f0f0f, 0xf0f0f0f0f0f0f0f0, 0x0f0f0f0f0f0f0f0f, 0xf0f0f0f0f0f0f0f0, 0x0f0f0f0f0f0f0f0f, 0xf0f0f0f0f0f0f0f0, 0x0f0f0f0f0f0f0f0f, 0xffff

SECTION .text

global check:function
global op1
global op2
global res
extern printf

print_leadin:
  push rbp
  mov rbp, rsp

  xor rax, rax
  call [printf wrt ..got]

  pop rbp
  ret

print_number:
  push rbp,
  mov rbp, rsp
  push r12

  mov r12, rdi
  mov rbx, number_of_qwords - 1

  xor rax,rax
  mov rdi, format_number_head
  mov rsi, [r12 + 8 * rbx]
  call [printf wrt ..got]
  dec rbx

  jz .print_end

.print_loop:
  xor rax,rax
  mov rdi, format_number_tail
  mov rsi, [r12 + 8 * rbx]
  call [printf wrt ..got]
  dec rbx
  cmp rbx, -1
  jg .print_loop

.print_end:
  xor rax,rax
  mov rdi, format_number_end
  call [printf wrt ..got]

  pop r12
  pop rbp
  ret

check_result:
  push rbp,
  mov rbp, rsp

  mov rdi, res
  mov rsi, number_expected
  mov rcx, number_of_qwords * 8
  repe cmpsb

  pop rbp
  ret

check_overflow:
  push rbp,
  mov rbp, rsp

  mov r11, [res + 8 * number_of_qwords]
  cmp r11, 0

  pop rbp
  ret

check:
  push rbp,
  mov rbp, rsp

  call check_result
  jne .not_equal
  call check_overflow
  jne .overflow
  xor rax, rax
  mov rdi, format_ok
  call [printf wrt ..got]
  jmp .exit

.not_equal:
  mov rsi, 8 * number_of_qwords
  sub rsi, rcx
  xor rax, rax
  mov rdi, format_mismatch
  call [printf wrt ..got]
  mov rdi, format_expected
  call print_leadin
  mov rdi, number_expected
  call print_number
  mov rdi, format_actual
  call print_leadin
  mov rdi, res
  call print_number
  jmp .exit

.overflow:
  xor rax, rax
  mov rdi, format_overflow
  call [printf wrt ..got]

.exit:
  pop rbp
  ret
