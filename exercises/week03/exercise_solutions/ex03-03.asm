hello: db 'Hello World',13,10
hello_length: equ $ - hello
extern _start
_start:
  mov rax, 1             ; Nummer des System Call 'write'
  mov rdi, 1             ; Ausgabe Filedescriptor 'stdout'
  mov rsi, hello         ; Startadresse des strings
  mov rdx, hello_length  ; Länge des Strings
  syscall                ; System Call ausführen (ruft Funktion im OS auf)

  mov rax, 60            ; Nummer des System Call 'exit'
  mov rdi, 0             ; Code der von 'exit' an das OS gemeldet wird
  syscall                ; System Call ausführen (ruft Funktion im OS auf)
