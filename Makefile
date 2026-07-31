CC = gcc
LD = ld

CFLAGS = -m32 -ffreestanding -O2 -Wall -Wextra
LDFLAGS = -m elf_i386 -T link.ld

OBJ = kernel.o multiboot_header.o
KERNEL = kernel.bin

all: $(KERNEL)

kernel.o: kernel.c
	$(CC) $(CFLAGS) -c kernel.c -o kernel.o

multiboot_header.o: multiboot_header.c
	$(CC) $(CFLAGS) -c multiboot_header.c -o multiboot_header.o

$(KERNEL): $(OBJ)
	$(LD) $(LDFLAGS) -o $(KERNEL) $(OBJ)

install:
	mkdir -p iso/boot/grub
	cp $(KERNEL) iso/boot/
	cp grub.cfg iso/boot/grub/

clean:
	rm -f *.o $(KERNEL)
