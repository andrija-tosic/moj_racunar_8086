#include <stdio.h>
#include <string.h>
int main() {
	char prvi[10];
	char drugi[10];
	fgets(prvi, 10, stdin);
	fgets(drugi, 10, stdin);
	unsigned int prvi_br;
	unsigned int drugi_br;

	if (konv(&prvi_br, &prvi[0], strlen(prvi)-1) == 1)
		return -1;
	if (konv(&drugi_br, &drugi[0], strlen(drugi)-1) == 1)
		return -1;

	printf("%d\n", prvi_br);
	printf("%d\n", drugi_br);


	unsigned int rez = prvi_br + drugi_br;

	printf("%d", rez);

	return 0;
}