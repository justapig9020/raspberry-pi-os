#include "mini_uart.h"
#include "iolib.h"

static volatile unsigned char inited = 0;
void main_kernel_main(int n)
{
    char rcv;
    if (!inited) {
        uart_init(BAUD_RATE);
    }

    printf ("\nThis is main processer\n");
    printf ("Hello, from processer %d\n", n);
    inited++;

    while (1) {
        rcv = uart_recv();
        uart_send(rcv);
        if ('\r' == rcv)
            uart_send('\n');
    }
}

void others_kernel_main(int n)
{
    while(inited < n);
    printf ("\nThis is not main processer\n");
    printf ("Hello, from processer %d\n", n);
    inited++;
    while (1);
}
