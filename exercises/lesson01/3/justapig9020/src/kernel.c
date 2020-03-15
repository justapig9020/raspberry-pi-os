#include "mini_uart.h"
#include "iolib.h"
#include "utils.h"

static volatile unsigned char inited = 0;
void kernel_main(int n)
{
    char rcv;
    
    //if (0 == n)
    //    uart_init (BAUD_RATE);

    while(inited < n);
    printf ("Hello, this is processer %d\n", n);
    inited++;

    while (3 == n) {
        rcv = uart_recv();
        uart_send(rcv);
        if ('\r' == rcv)
            uart_send('\n');
    }
}
