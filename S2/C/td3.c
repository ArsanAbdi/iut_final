#include <stdio.h>
#include <stdlib.h>

typedef struct joueur {

    char *nom;
    char *derniers_resultats;
    int sexe;
    int date_naissance;
} Joueur;

Joueur nouveauJoueur (char *n, int date_naissance, int sexe) {

    Joueur j;


    j.nom = (char*) malloc (strlen(n) + 1);

    strcpy(j.nom, n);
    
    j.date_naissance = date_naissance;
    j.sexe = sexe;

    j.derniers_resultats = (char*) malloc(1);
    j.derniers_resultats[0] = '\0';

}

typedef struct liste_joueurs {

    Joueur joueur;
    struct liste_joueurs *next;
} ListeJoueurs;