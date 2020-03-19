#include "mini_uart.h"
#include "iolib.h"
#include "utils.h"

void kernel_main(void)
{
    int el;

    el = get_el ();
    printf ("EL: %d\n", el);

    echo_loop ();
}
