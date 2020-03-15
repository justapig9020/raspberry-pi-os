#include "mm.h"

.section ".text.boot"

.macro clean_bss
    adr    x0, bss_begin
    adr    x1, bss_end
    sub    x1, x1, x0
    bl     memzero
.endm

.globl _start
_start:
    mrs    x0, mpidr_el1        
    and    x0, x0,#0xFF        // Check processor id
    cbz    x0, master        // Hang for all non-primary CPU
    b    others
    b    proc_hang

proc_hang: 
    b     proc_hang

master:
    clean_bss
    mov    sp, #LOW_MEMORY 
    mrs    x0, mpidr_el1        
    and    x0, x0, #0xFF
    bl    main_kernel_main
    b     proc_hang        // should never come here

others:
    mrs  x0, mpidr_el1        
    and  x0, x0,#0xFF        // Check processor id
    mov  x1, PAGE_SIZE
    mul  x1, x1, x0
    mov  x2, #LOW_MEMORY
    add  x1, x1, x2
    mov  sp, x1
    bl   others_kernel_main
    b    proc_hang
