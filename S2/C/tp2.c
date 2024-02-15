#include <stdio.h>
#define N 10


void saisie_tab(int tab[N]) {

    int i;
    for (i = 0; i < N; i++) {

        printf("Saisie du n°%d: \n", i+1);
        scanf("%d", &tab[i]);    
    }
}

void affiche_tab(int tab[N]) {

    int i;
    for (i = 0; i < N; i++) {

        printf("%d\n", tab[i]);
    }
}

void affiche_chaine(char chaine[]) {

    int i;
    while (chaine[i] != '\0') {
        
        printf("%c", chaine[i]);
        i++;
    }
}

void copie_chaine(char ch1[], char ch2[]) {

    int i = 0;
    while (ch1[i] != '\0') {
        
        ch2[i] = ch1[i];
        i++;
    }
    ch2[i] = '\0';
    
}

int main(void) {

    // exo 1
    //int tableau[N];
    //saisie_tab(tableau);

    //exo 2
    //int tableau[N] = {1, 2, 3, 4, 5, 6, 7};
    //affiche_tab(tableau);

    // exo 3 fait

    // exo 4 
    //char tableau[] = {'A', 'R', 'S', 'A', 'N', '\0'};
    //affiche_chaine(tableau);
    //printf("\n");

    // exo 5 fait

    // exo 6
    char chaine1[N] = {'A', 'R', 'S', 'A', 'N', '\0'};
    char chaine2[N];
    copie_chaine(chaine1, chaine2);
    affiche_chaine(chaine1);
    affiche_chaine(chaine2);

    
    return 1;
}



