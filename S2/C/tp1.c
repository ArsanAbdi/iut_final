#include <stdio.h>
int main(void) {

// exo 1
/*
	int a = 10; int b = 12;
	int pivot;
	printf("la valeur de a: %d et b: %d\n", a, b);

	pivot = a; a = b; b = pivot;
	printf("la valeur de a: %d et b: %d\n", a, b);

	printf("adresse de a: %p et b: %p\n", &a, &b);
*/

// exo 2
/*

	unsigned short int a = 1; int nbBit = 0; // on choisit 1 car égal à 0001

	while (a != 0) {

		nbBit = nbBit + 1;
		a = a << 1;	
	}
	printf("nombre de bit: %d\n", nbBit);
*/

// exo 3

	unsigned int nbUser; unsigned int nbBit = 32; int mask = 1; int bit;

	printf("Saisie d'un nombre: \t");
	scanf("%d", &nbUser); 

	for (int i = 0; i <= nbBit; i++) {

		if ((mask&nbUser) > 0) {

			bit = 1;
		}
		else {

			bit = 0;
		}
		printf("%d", bit);
		mask = mask << 1;
	}
	
}
