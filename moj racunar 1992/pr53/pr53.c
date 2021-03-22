#include <stdio.h>

int main()
{
    char recenica[] = "VELika u MALA slova";
    char mala[20];
    to_lower(mala, recenica);
    printf("Mala slova: %s", mala);
    return 0;
}