BITS 64
DEFAULT rel

number_of_qwords equ 12

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
  dq 0x8d7cc0d4010280e8, 0x8984500d0230ba08, 0x428098042400ba20, 0x52106000014b1000, 0x202050038d200498, 0xd70c108002005121, 0x5808430194901910, 0xb00000014a048008, 0x0802c00448444478, 0x024c910814830820, 0x05b014e403822210, 0x0100470ba08051a2, 0x0

SECTION .data
op1:
  dq 0xcd7cfcf44197b0e9, 0x9d94506f62b8ba09, 0x77c9ba343c81fb30, 0xde14620045cb3d40, 0xef3150e38db42e9e, 0xd71ed5ad02c0516f, 0x5b29f7dd94d61973, 0xba78e6495f04a0d8, 0xe8dae1476fee5cf9, 0x964cb10e14a31d2a, 0xcfb09cfcd3823a16, 0x117d5f1ba8c551eb, 0x1337
op2:
  dq 0xaffec0deb102cafe, 0x8badf00d1337babe, 0x42b4dc0de428bea7, 0x7331ed0c3b4b1007, 0x202ad20bad2014d8, 0xffcd18d09f00dd21, 0x789a4321fdb9fb10, 0xb0071007cafe900d, 0x1c07d8acd854c47a, 0x22fed388bdd36af1, 0x15b536e603dba270, 0x2700c76bf1b2f5a2, 0xffff

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
