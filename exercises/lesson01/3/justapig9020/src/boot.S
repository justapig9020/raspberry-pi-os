#include "mm.h"

.section ".text.boot"

.macro clean_bss
    adr    x0, bss_begin
    adr    x1, bss_end
    sub    x1, x1, x0
    bl     memzero
.endm

.macro get_mpid
    mrs x0, mpidr_el1
    and x0, x0, #0xFF
.endm

.globl _start
_start:
    get_mpid
    cbz    x0, master        // Hang for all non-primary CPU
    b      set_stk 

master:
    clean_bss
    mov    sp, #LOW_MEMORY
    mov    x0, #BAUD_RATE
    bl     uart_init
    get_mpid
    b      start_kernel

set_stk:
    mov  x1, #PAGE_SIZE
    mul  x1, x1, x0
    mov  x2, #LOW_MEMORY
    add  x1, x1, x2
    mov  sp, x1

start_kernel:
    bl   kernel_main
    b    proc_hang

proc_hang:
    b    proc_hang
