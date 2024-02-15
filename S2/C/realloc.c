#include <stdio.h>
#include <stdlib.h>

int main (void) {

    int *a = malloc(sizeof(int) * 5);

    for (int i = 0; i < 5; i++) {

        a[i] = i;
    }

    for (int i = 0; i < 5; i++) {
        
        printf("a[%d] = %d\n", i, a[i]);
    }

    printf("\n");

    a = realloc(a, sizeof(int) * 10);


    for (int i = 5; i < 10; i++) {
        
        a[i] = i;
    }
    

    for (int i = 0; i < 10; i++) {
        
        printf("a[%d] = %d\n", i, a[i]);
    }

    
}