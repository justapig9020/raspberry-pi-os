static int _i2s(int src, char **dis)
{
    int ret;
    ret = 1;

    if (src / 10) {
        ret += _i2s(src / 10, dis);
        (*dis)++;
    }
    **dis = (src % 10) + '0';
    (*dis)[1] = '\0';
    return ret;

}

int i2s(int src, char *dis)
{
    char **dis_ptr;
    dis_ptr = &dis;

    return _i2s(src, dis_ptr);
}

char h2s(char c)
{
    switch (c) {
        case 0 ... 9:
            return ('0' + c);
        break;
        case 10 ... 15:
            return ('A' + c - 10);
        break;
    }
    return 0x00;
}

static int _i2h(int src, char **dis)
{
    int ret;
    
    ret = 1;

    if (src >> 4) {
        ret += _i2h(src >> 4, dis);
        (*dis)++;
    }
    **dis = h2s((char)(src & 0xf));
    return ret;
}

int i2h(int src, char *dis)
{
    char **dis_ptr;
    dis_ptr = &dis;
    return _i2h(src, dis_ptr);
}
