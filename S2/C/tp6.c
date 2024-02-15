#include <stdio.h>
#include <stdlib.h>

typedef struct point2D {

    float x;
    float y;
} point2D;

typedef struct liste_point2D {

    point2D p;
    struct liste_point2D *suivant;
    
    
} liste_point2D;

struct liste_point2D *nouvelleListe (point2D p) {

    liste_point2D *liste = (liste_point2D*) malloc(sizeof(liste_point2D));
    liste -> p = p;
    liste -> suivant = NULL;
    return liste;
}

struct liste_point2D *inserer (struct liste_point2D *maliste, point2D p) {

    maliste = nouvelleListe(p);
    maliste -> suivant = maliste;
    return maliste;
    
}

struct liste_point2D *supprimerPremier (liste_point2D *maliste) {

    liste_point2D *liste = maliste -> suivant;
    free(maliste);
    return maliste;
}

void parcourir (liste_point2D *maliste) {

    while (maliste != NULL) {
        
        printf("(%f, %f)\n", maliste -> p.x, maliste -> p.y);
        maliste = maliste -> suivant;
    }  
}

// exo 2 //

typedef struct l_etudiants {

    char *nom;
    float sem1;
    float sem2;
    float moyenne;
    struct l_etudiants *suivant;
} listeEtud;

listeEtud *nouvelleListeEtud (char *nom, float s1, float s2) {

    listeEtud *liste;
    liste = (listeEtud*) malloc(sizeof(listeEtud));

    int i = 0;
    while (nom[i] != '\0') {
        
        liste->nom[i] = nom[i];
    }
    
    
    liste->sem1 = s1;
    liste->sem2 = s2;

    liste->suivant = NULL;

    return liste;
}

listeEtud *insererEtud (listeEtud *liste, char *nom, float s1, float s2) {

    listeEtud *maNouvelleListe = nouvelleListeEtud(nom, s1, s2);
    maNouvelleListe -> suivant = liste;
    return maNouvelleListe;

}


int main (void) {

    nouvelleListeEtud("cg",5.4,21.5);

    return 1;
}
