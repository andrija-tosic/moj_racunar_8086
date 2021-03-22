#include <stdio.h>
extern long long sum(int);
int main() {
	int n, m, mat[16][16];
	printf("n: ");
	scanf_s("%d", &n);
	printf("m: ");
	scanf_s("%d", &m);
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++)
			scanf_s("%d", &mat[i][j]);
		mat[i][m] = -1;
	}
	
	for (int i = 0; i < n; i++) {
		long long a = sum(mat[i]);
		mat[i][1] = a & 0x00000000FFFFFFFF;	
		mat[i][0] = a >> 32;
	}
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++)
			printf("%d ", mat[i][j]);
		printf("\n");
	}

	return 0;
}