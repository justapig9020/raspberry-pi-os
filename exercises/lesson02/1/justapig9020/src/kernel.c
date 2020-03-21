#include "kernel/mini_uart.h"
#include "lib/iolib.h"
#include "arch/utils.h"

void prt_el(void)
{
    int el;
    el = get_el ();
    printf ("EL: %d\n", el);
}

void start_kernel(void)
{
    prt_el();
    echo_loop ();
}
