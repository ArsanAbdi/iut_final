#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <string.h>

int main(int argc, char const *argv[]) {
    
    if (argc < 6) {

        perror("pas assez de paramètres positionnels");
    }

    int tab[5];

    for (size_t i = 1; i < argc; i++) {

        tab[i - 1] = atoi(argv[i]); 
    }

    for (size_t j = 0; j < argc; j++) {
        
        printf("nb: %d\n", tab[j]);
    }
}
