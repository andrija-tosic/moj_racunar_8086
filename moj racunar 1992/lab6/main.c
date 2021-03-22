#include <stdio.h>
int A, B, C, D, E, F;
short niz[16];
char format[] = " %hu";
int main() {

	printf("unos A, B, C: \n");
	scanf("%d %d %d", &A, &B, &C);

	D = zbir(A, B, C);

	E = A * D - 4 * B;

	printf("\nC naredba A*D - 4*B: %d", E);

	__asm {
		mov eax, A
		imul D; rez u EDX : EAX
		mov ebx, B
		shl ebx, 2

		sub eax, ebx
		mov F, eax
	}

	printf("\nasm isecak A*D - 4*B: %d", F);

	printf("\nunos n: ");
	scanf("%d", &A);

	for (int i = 0; i < A; i++) {
		printf("unos elementa niza: ");
		scanf("%hd", &niz[i]);
	}
	printf("\n adresa niza: %x", niz);

	nula(niz, A, B, C);


	__asm {
		mov esi, offset niz
		xor edi, edi
	petlja:
		xor eax,eax
		mov ax, word ptr[esi + edi]
		push eax
		mov eax, offset format
		push eax
		call dword ptr printf
		add esp, 4
		add esp, 4
		
		mov edx, A
		shl edx, 1 ; duzina u bajtovima

		add edi, 2 ; korak za short
		cmp edi, edx
		jb petlja
	}

	return 0;
}