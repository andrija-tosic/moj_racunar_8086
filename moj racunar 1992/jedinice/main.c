#include <stdio.h>
int jedinice(int adr, int br, int n);

short niz[16];
int n, br;
int k;

int main() {
	printf("n: ");
	scanf_s("%d", &n);
	printf("br: ");
	scanf_s("%d", &br);
	for (int i = 0; i < br; i++)
		scanf_s("%hu", &niz[i]);
	_asm {
		mov eax, n
		push eax
		mov eax, br
		push eax
		mov eax, offset niz
		push eax
		call jedinice
		add esp, 3*4
		
		mov k, eax
	}
	printf("k: %d", k);
}