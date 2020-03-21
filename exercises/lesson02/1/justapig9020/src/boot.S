#include "arch/mm.h"
#include "arch/sysregs.h"

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

.macro init_uart
    mov    x0, #BAUD_RATE
    bl     uart_init
.endm


.globl _start
_start:
    get_mpid
    cbz    x0, master        // Hang for all non-primary CPU
    b      proc_hang

master:
    clean_bss
    mov sp, #LOW_MEMORY     // EL3 sp

    init_uart
    bl  prt_el

	ldr	x0, =SCTLR_VALUE_MMU_DISABLED
	msr	sctlr_el1, x0		

	ldr	x0, =HCR_VALUE
	msr	hcr_el2, x0

	ldr	x0, =SCR_VALUE
	msr	scr_el3, x0

	ldr	x0, =SPSR_VALUE
	msr	spsr_el3, x0

	adr	x0, el1_entry		
	msr	elr_el3, x0

	eret		

el1_entry:
    mov sp, #LOW_MEMORY  // EL1 sp
    b      start_kernel


proc_hang:
    b    proc_hang
