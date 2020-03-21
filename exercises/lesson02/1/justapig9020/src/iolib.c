#include "kernel/mini_uart.h"
#include "lib/memctl.h"
#include "lib/va_arg.h"
#include "lib/numlib.h"

#define TYPE_NUN 3

static char in_buf;

int prt_int(char *arg, char *o_ptr)
{
    int num;
    int len;

    num = 0;
    len = 0;

    mem_cpy (arg, &num, sizeof(int));
    len = i2s (num, o_ptr);

    return len;
}

int prt_hex(char *arg, char *o_ptr)
{
    char buf[16];
    int i;
    unsigned int val;
    int ret;

    val = *(unsigned int *)arg;

    *(o_ptr++) = '0';
    *(o_ptr++) = 'x';

    ret = 2;
    ret += i2h (val, o_ptr);

    return ret;
}

int prt_chr(char *arg, char *o_ptr)
{
    *o_ptr = *arg & 0xff;
    return 0;
}

static int prt_parser(const char **c, void *arg, char *o_ptr)
{
    switch (**c) {
        case 'd':
            return prt_int (arg, o_ptr);
        break;
        case 'l':
            return 0;
        break;
        case 'x':
            return prt_hex (arg, o_ptr);
        break;
        case 'c':
            return prt_chr(arg, o_ptr);
        break;
    }
    return -1;
}

int _printf(int _pad1, int _pad2, int _pad3, int _pad4, int _pad5, int _pad6, int _pad7, int _pad8,const char *s, ...)
{
    int len;
    void *arg_ptr;
    char o_buf[0x100];

    len = 0;
    arg_ptr = get_va_head (s);

    while (*s != '\0') {
        switch (*s) {
            case '%':
                s++;
                len += prt_parser (&s, arg_ptr, &(o_buf[len]));
                next_va (arg_ptr);
            break;
            case '\n':
                o_buf[len++] = '\n';
            break;
            default:
                o_buf[len++] = *s;
            break;
        }
        s++;
    }

    o_buf[len] = '\0';
    uart_send_string (o_buf);
    return len;
}

// TODO scanf get interger and hex
char is_end(char c)
{
    return ' ' == c || '\r' == c;
}

char is_num(char c)
{
    return '0' >= c || '9' <= c;
}

int get_int(int *arg)
{
    char c;
    int num;
     
    num = 0;

    while (1) {
        c = uart_recv ();
        if (is_end (c))
            break;
        if (is_num (c))
            return -1;
        num *= 10;
        num += c - '0';
    }
    *arg = num;
    return 0;
}

int get_hex(int *ard)
{
    return 0;
}

int get_parser(const char **c, void *arg)
{
    int ret = 0;
    /*

    ret = 0;

    switch (**c) {
        case 'd':
            get_int (arg);
        break;
        case 'x':
            get_hex (arg);
        break;
    }
    */
    return ret;
}

int _scanf(int _pad1, int _pad2, int _pad3, int _pad4, int _pad5, int _pad6, int _pad7, int _pad8, const char *s, ...)
{
    int ret = 0;
    /*
    int i;
    char val;
    void *arg_ptr;
    
    i = 0;
    ret = 0;
    arg_ptr = get_va_head (s);

    while (*s != '\0') {
        switch (*s) {
            case '%':
                get_parser (&s, arg_ptr);
            break;
            default:
                val = uart_recv ();
                if (val != *s)
                    return -1;
            break;   
        }
        s++;
    }
*/
    return ret;
}

void __attribute__((noreturn)) echo_loop()
{
    char rcv;
    while (1) {
        rcv = uart_recv ();
        uart_send (rcv);
        if (rcv == '\r')
            uart_send ('\n');
    }
}
