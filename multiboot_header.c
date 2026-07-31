__attribute__((section(".multiboot")))
const unsigned long multiboot_header[] = {
    0x1BADB002,            // magic
    0x00,                  // flags
    -(0x1BADB002)          // checksum
};
