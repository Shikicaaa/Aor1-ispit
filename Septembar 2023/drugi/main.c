#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern void procedura(char* tekst, int broj);
int main() {
	char tekst[100];
	printf("Unesite tekst\n");
	gets(tekst);
	procedura(tekst, 100);
	puts(tekst);
	return 0;
}