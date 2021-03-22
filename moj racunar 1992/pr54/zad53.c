#include <stdio.h>
#include <string.h>

int isPal(char* rec, int n) {
	__asm {
		mov ecx, n
		dec ecx
		xor edx, edx
		xor eax, eax
		xor ebx, ebx
		mov esi, rec
	petlja:
		mov al, byte ptr [esi+edx]
		mov bl, byte ptr [esi+ecx]

		cmp al, bl
		jne nije_palindrom
		cmp ecx, edx
		je jeste
		inc edx
	loop petlja
	jeste:
		xor eax,eax
		inc eax
		jmp izlaz

	nije_palindrom:
		xor eax, eax
	izlaz:
	}
}

int main()
{
	char recenica[20];
	fgets(recenica, 20, stdin);
	char* token = strtok(recenica, " ");
	printf("%X\n", &token[0]);

	while (token != NULL) {
		printf("%d\n", isPal(token, strlen(token)));
		token = strtok(NULL, " ");
	}

	return 0;
}