.PHONY: all run
all: kmain.o start.o kernel

start.o: start.s
	yasm -f elf -o start.o start.s

kmain.o: kmain.c
	gcc -c kmain.c -o kmain.o -std=c99 -ffreestanding -m32

kernel: kmain.o start.o Makefile
	ld -m elf_i386 -T link.ld -o kernel kmain.o start.o

run: kernel
	qemu-system-i386 -kernel kernel

# Other demos
boot.img: boot.s
	yasm -f bin -o boot.img boot.s
