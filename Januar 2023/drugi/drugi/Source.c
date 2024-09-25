#include <stdio.h>
#include <stdlib.h>
extern void fja(int n, char* niz, int* x, int* y, float* z);
int main() {
	char niz[100];
	int n;
	float A;
	printf("Unesite velicinu niza:");
	scanf("%d", &n);
	getchar();
	printf("Unesite Z:");
	scanf("%f", &A);
	getchar();
	for (int i = 0; i < n; i++) {
		scanf("%c", &niz[i]);
		getchar();
	}
	fja(n, niz, &niz[0], &niz[n - 1], &A);
	return 0;
}