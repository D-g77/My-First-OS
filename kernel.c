#include <stdint.h>

static uint16_t* const VGA = (uint16_t*)0xB8000;
static int cursor_x = 0;
static int cursor_y = 0;

static const int VGA_WIDTH = 80;
static const int VGA_HEIGHT = 25;
static void putc(char c) {
    if (c == '\n') {
        cursor_x = 0;
        cursor_y++;
        return;
    }

    int pos = cursor_y * VGA_WIDTH + cursor_x;
    VGA[pos] = (uint16_t)c | (0x07 << 8); // light grey on black

    cursor_x++;
    if (cursor_x >= VGA_WIDTH) {
        cursor_x = 0;
        cursor_y++;
    }
}
void puts(const char* s) {
    while (*s) {
        putc(*s++);
    }
}
void kernel_main() {
    puts("Hello, World!\n");
    puts("My very first operating system!\n");
    puts("Welcome!\n");

    while (1) { }
}
