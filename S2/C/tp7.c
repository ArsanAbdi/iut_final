#include <stdio.h>

int afficherFichier (char *chemin) {

    FILE *fichier = fopen(chemin, "rb");

    if (fichier == NULL) {
        
        return -1;
    }
    else {


    }
}


typedef struct Point3D {

    float x;
    float y;
    float z;
} point3D;

point3D *chargeFigure (char *chemin, int *tailleTab) {

    
}

int main() {
    // Création d'une nouvelle liste avec un étudiant
    Etudiants *liste = nouvelleListeE("Alice", 12.5, 15.5);
    
    // Ajout d'un nouvel étudiant en début de liste
    liste = insererE(liste, "Bob", 10.0, 14.0);
    
    // Ajout d'un autre étudiant en début de liste
    liste = insererE(liste, "Charlie", 13.0, 16.0);
    
    // Parcours et affichage des éléments de la liste
    parcourirE(liste);
    
    // Calcul et affichage des moyennes des étudiants
    calculMoy(liste);
    parcourirE(liste);
    
    // Affichage des notes d'un étudiant en particulier
    afficheNotesEtudiant(liste, "Bob");
    
    // Affichage des notes de plusieurs étudiants
    char *noms[] = {"Alice", "Charlie"};
    afficheNotesEtudiants(liste, noms, 2);