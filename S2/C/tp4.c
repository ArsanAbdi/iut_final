#include <stdio.h>

// exo 2 //
struct Comptage {

    char car;
    int compt;
}
    
typedef Comptage;

Comptage p1;

// exo 3 //
Comptage creer_comptage(char c) {

    p1.car = c;
    p1.compt = 0;
    return p1;
}

// exo 4 //
int recherche_tab(char c, Comptage * tab, int taille_tab) {

    int i;
    for (i = 0; i < taille_tab; i++) {
        
        if ((*tab).car == c) {

            return i;
        }
    }
    return -1;
}

// exo 5 //
int ajout_comptage(char c, Comptage * tab, int * taille_tab) {


}

    













int main()
{

    return 0;
}
