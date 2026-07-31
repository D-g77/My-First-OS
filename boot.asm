; boot.asm - 512-byte BIOS bootloader (NASM syntax)

BITS 16
ORG 0x7C00

start:
    mov si, msg

.print_loop:
    lodsb              ; AL = [SI], SI++
    or al, al
    jz .done
    mov ah, 0x0E       ; teletype output
    mov bh, 0x00
    mov bl, 0x07       ; light grey
    int 0x10
    jmp .print_loop

.done:
    jmp $

msg: db "This is my first OS come see it and its loading yay", 0

; Pad to 510 bytes
times 510 - ($ - $$) db 0

; Boot signature
dw 0xAA55
