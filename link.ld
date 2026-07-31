ENTRY(kernel_main)

SECTIONS
{
    /* Load the kernel at the 1MB mark (standard Multiboot load address) */
    . = 1M;

    /* Multiboot header MUST be first */
    .multiboot :
    {
        *(.multiboot)
    }

    /* Kernel code */
    .text :
    {
        *(.text*)
    }

    /* Read-only data */
    .rodata :
    {
        *(.rodata*)
    }

    /* Initialized data */
    .data :
    {
        *(.data*)
    }

    /* Uninitialized data (zeroed at boot) */
    .bss :
    {
        *(.bss*)
        *(COMMON)
    }
}
