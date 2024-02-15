#include <stdlib.h>
#include <stdio.h>
#include <string.h>

typedef struct joueur {

    char *nom; 
    char *derniers_resultats;
    int sexe;
    int date_naissance;
} Joueur;

//exo1

Joueur nouveauJoueur (char *n, int date_naissance, int sexe) {

    Joueur j;

    j.nom = (char*) malloc (strlen(n) + 1);
    strcpy(j.nom, n);

    j.date_naissance = date_naissance;
    j.sexe = sexe;

    j.derniers_resultats = (char*) malloc(1);
    j.derniers_resultats[0] = '\0';

    return j;
}

//exo2

typedef struct liste_joueurs {

    Joueur j;
    struct liste_joueurs *next;
} Liste_joueurs;

//exo3 

int ajout_victoire (Joueur *j) {

    j->derniers_resultats = (char*) realloc(j->derniers_resultats, strlen(j->derniers_resultats) + 2);

    j->derniers_resultats[strlen(j->derniers_resultats)] = 'V';

    if (j->derniers_resultats[strlen(j->derniers_resultats) - 1] != 'V') {

        return 0;
    }
    else {

        return 1;
    }
}

//exo4 

int ajout_defaite (Joueur *j) {

    j->derniers_resultats = (char*) realloc(j->derniers_resultats, strlen(j->derniers_resultats) + 2);

    j->derniers_resultats[strlen(j->derniers_resultats)] = 'D';

    if (j->derniers_resultats[strlen(j->derniers_resultats) - 1] != 'D') {

        return 0;
    }
    else {

        return 1;
    }
}

//exo5

int recherche_joueur (char *nom, Joueur *tab, int taille_tab) {

    int i;

    for (i = 0; i < taille_tab; i++) {

        if (strcmp(tab[i].nom, nom)) {

            return i;
        }
    }
    return -1;
}

//exo6

void affiche_joueur (Joueur j) {

    printf("%s\t", j.nom);
    printf("%s\t", j.derniers_resultats);
    printf("%d\t", j.sexe);
    printf("%d\t\n", j.date_naissance);
}

//exo8first

Liste_joueurs *ajout_joueur (Joueur j, Liste_joueurs *liste) {


}


//exo7

Liste_joueurs *creer_liste_jeunes (Joueur *tab, int taille_tab, int date_min) {

    Liste_joueurs *l = (Liste_joueurs*) malloc(sizeof(Liste_joueurs)); 

    int i;
    for (i = 0; i < taille_tab; i++) {
        
        if (tab[i].date_naissance >= date_min) {
            
            l = realloc(l, sizeof(Liste_joueurs) + 1);
            l->j = tab[i];
            l->next = NULL; 
        }
        
    }
    
}

//exo8second

void supprimer_tab_joueurs (Joueur *tab, int taille_tab) {

    int i;
    for (i = 0; i < taille_tab; i++) {

        free(tab[i].derniers_resultats);
        free(tab[i].nom);
    }
    free(tab);

}


int main () {

    Joueur arsan = nouveauJoueur("arsan", 2004, 1);

    Joueur *j = &arsan;


    ajout_victoire(j);
    affiche_joueur(arsan);

    ajout_defaite(j);
    affiche_joueur(arsan);

    int loose = ajout_defaite(j);
    printf("%d\n", loose);

}
