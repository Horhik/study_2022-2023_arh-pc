nasm -f elf -g -l ./$1.lst ./$1.asm
ld -m elf_i386 -o ./$1 ./$1.o
