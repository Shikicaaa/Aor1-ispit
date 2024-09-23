#include <stdio.h>
#include <stdlib.h>

extern int procedura(int* niz, int n);
main() {
	int n = 5;
	int m = 6;
	int** mat = (int**)malloc(m * sizeof(int*));
	for (int i = 0; i < n; i++) {
		mat[i] = (int*)malloc(m * sizeof(int));
		for (int j = 0; j < m; j++) {
			mat[i][j] = j + i;
			printf("%d ", mat[i][j]);
		}
		printf("\n");
		procedura(mat[i], m);
	}
	printf("\n");
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			printf("%d ", mat[i][j]);
		}
		printf("\n");
	}
	free(mat);
}