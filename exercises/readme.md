### Flatform Binary
nasm filename.asm

### ELF Binary
nasm -felf64 filename.asm
ld filename.o -o filename.elf

### Compile C Programm
clang filename.c -o filename

#### Print out specific section ofhexdump for C
objdump -j .text -h filename