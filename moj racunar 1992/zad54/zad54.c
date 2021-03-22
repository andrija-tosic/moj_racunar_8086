#include <stdio.h>

char format[] = "%d ";

int main() {
	int n, k, f1=1, f2=1;
	printf("k: ");
	scanf("%d", &k);
	printf("n: ");
	scanf("%d", &n);


	for (int i = 2; i < n+k; i++) {
		__asm {
			mov eax, f1
			mov ebx, f2
			add ebx, eax
			mov f1, ebx
			mov f2, eax
		}

		if (i >= n)
		{
			__asm {
				// printf("%d ", f1);
				push f1
				mov eax, offset format
				push eax
				call dword ptr printf
				add esp, 4
				add esp, 4
			}
		}
	}

	return 0;
}