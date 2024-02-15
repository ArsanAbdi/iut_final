#include <stdio.h>
#include <stdlib.h>

typedef struct employe {

    char *nom;
    int date_debut_contrat;
    int categorie;
    float salaire;
} Employe;

//exo1//
Employe nouvelEmploye (char *n, int date, int cat, float sal) {

    Employe e1;

    e1.nom = malloc (sizeof(char) + 1);
    e1.nom = n;

    e1.date_debut_contrat = date;
    e1.categorie = cat;
    e1.salaire = sal;
}
//exo2//
int rechercheEmploye (char *nom, Employe *tab, int taille_tab) {

    int i;
    for (i = 0; i < taille_tab; i++) {
        
        if (tab[i].nom == nom) {

            return i;
        }
    }
    return -1;   
}
//exo3//
int nbEmployesSalaire (Employe *tab, int taille_tab, float salaire_min) {

    int comptage = 0;
    int i;
    for (i = 0; i < taille_tab; i++) {

        if (tab[i].salaire >= salaire_min) {
            
            comptage++;
        }
        
    }
    return comptage;
}
//exo4//
Employe *creerTabEmployes (Employe *tab, int taille_tab, float salaire_min) {

    int taille_tab_final;
    taille_tab_final = nbEmployesSalaire(tab, taille_tab, salaire_min);
    
    Employe *tabEmployeFinal;
    tabEmployeFinal = malloc (sizeof(Employe) * taille_tab_final);

    int i;
    for (i = 0; i < taille_tab_final; i++) {
        
        if (tab[i].salaire >= salaire_min) {

            tabEmployeFinal[i].nom = tab[i].nom;
            tabEmployeFinal[i].date_debut_contrat = tab[i].date_debut_contrat;
            tabEmployeFinal[i].categorie = tab[i].categorie;
            tabEmployeFinal[i].salaire = tab[i].salaire;
        }
    }
    return tabEmployeFinal;
}
//exo5//
void modifie_cat_employe (Employe *e, int nouvelle_cat) {

    e->categorie = nouvelle_cat;
}

int main(int argc, char const *argv[]) {

    Employe e1 = nouvelEmploye("arsan", 2012, 12, 20.5);
    printf("%d\n", e1.date_debut_contrat);

    return 0;
}
