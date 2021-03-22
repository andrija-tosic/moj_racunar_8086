#include <stdio.h>
#include <stdlib.h>

unsigned int bcdtoi(const char* niz, const unsigned int n)
{
	_asm {
		mov eax, 0 // sumirace se vrednost broja
		mov ecx, n
		mov esi, niz
		add esi, n
		dec esi; krecemo obilazak sa kraja niza
		petlja :
		xor ebx, ebx
			mov bl, byte ptr[esi]; tekuci element niza
			cmp bl, 10; provera validnosti, proveriti
			jg nevalidan
			mov edx, eax
			// umesto mnozenja sa deset, mnozicemo sa 2 i sa 8 i sabrati to
			shl edx, 1; x 2
			jc nevalidan //bilo koji izlazni prenos znači prekoračenje
			shl eax, 1
			jc nevalidan
			shl eax, 1;
		jc nevalidan
			shl eax, 1; 3 puta x2 = x8
			jc nevalidan
			add eax, edx; x 10
			jc nevalidan
			add eax, ebx; +tekuci
			jc nevalidan
			dec esi; sledeci element
			loop petlja
			jmp kraj
			nevalidan :
		mov eax, 0
			kraj : }
}

void main(void) {
	int n, i, j;
	char* niz;
	printf("Unesite duzinu niza\n");
	scanf_s("%d", &n);

	niz = calloc(n + 1, sizeof(char));
	char* bcdniz = calloc(n + 1, sizeof(char)); //takodje, mogla je i staticka	alokacija

		printf("Unesite niz BCD cifara, počev od cifre najmanje tezine:\n");
	for (i = 0; i < n; i++)
		scanf_s("%d", &niz[i]);

	printf("vrednost konverzije: %u\n", bcdtoi(niz, n));
}