#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/*Exo 1*/
char *inverseChaine(char *chaine) {

    int tailleCh = strlen(chaine);
    char *chInverse = (char *) malloc(sizeof(char) * tailleCh);

    for (int i = 0; i < tailleCh; i++) {
        
        //chInverse[(tailleCh - 1) - i] = chaine[i];
        *(chInverse + tailleCh - 1 - i) = *(chaine + i);
    }
    return chInverse;
}

char *litChaine(void) {

    int compteur = 0;
    char *chaine = (char *) malloc (sizeof(char));
    int lu = 0;
    while ((lu = getc(stdin)) != '\n' && lu != EOF) {
        
        *(chaine + compteur) = (char) lu;
        chaine = (char *) realloc (chaine, sizeof(char) * (compteur + 1));
        compteur++;
    }
    *(chaine + compteur) = '\0';
    return chaine;
}
/*Exo 2*/

/*char * litFichier(char * nomFichier){
    FILE *fichier;
    int c;
    char *chaine = (char*)malloc(sizeof(char));
    int i= 0;
    fichier = fopen(nomFichier,"r");
    
    while ((c = fgetc(fichier)) != EOF && fichier != NULL){
      
      *(chaine + i)= (char) c;
      i++;
      chaine=(char*) realloc(chaine, sizeof(char)*i);
    }
    *(chaine + i) = 0;
    fclose(fichier);
    return chaine;

}*/

char *litFichier2(char * nomFichier){
    
    FILE *fichier;
    int c;
    char *chaine = (char*) malloc(sizeof(char));
    int i = 0;
    fichier = fopen(nomFichier,"r");
    
    while ((c = fgetc(fichier)) != EOF && fichier != NULL){
      
      *(chaine + i)= (char) c;
      i++;
      chaine=(char*) realloc(chaine, sizeof(char)*i);
    }
    *(chaine + i) = 0;
    fclose(fichier);
    return chaine;

}

char *litLigne(FILE * pf){
    
    int c;
    char *chaine = (char*) malloc(sizeof(char));
    int i = 0;
    
    while (((c = fgetc(pf)) == "\n") && pf != NULL){
        
        *(chaine + i) = (char)c;
        i++;
        chaine = (char*) realloc(chaine, sizeof(char)*i);
    }
    *(chaine+i)= 0;
    return chaine;
}
/*Exo 3*/

int **saisitMatrice(int taille) {
    
    int **matrice = (int **)malloc(taille * sizeof(int *));
    
    for (int i = 0; i < taille; i++) {
        
        matrice[i] = (int *)malloc(taille * sizeof(int));
        
        for (int j = 0; j < taille; j++) {
            
            printf("Saisissez l'élément [%d][%d] : ", i, j);
            scanf("%d", &matrice[i][j]);
        }
    }
    return matrice;
}

int **saisitMatriceFich(int taille, char* nomFich) {
    
    FILE *fichier = fopen(nomFich, "r");
    
    if (fichier == NULL) {
        
        printf("Erreur lors de l'ouverture du fichier.\n");
        exit(1);
    }

    int **matrice = (int **)malloc(taille * sizeof(int *));
    
    for (int i = 0; i < taille; i++) {
        
        matrice[i] = (int *)malloc(taille * sizeof(int));
        
        for (int j = 0; j < taille; j++) {
            
            if (fscanf(fichier, "%d", &matrice[i][j]) != 1) {
                
                printf("Erreur de lecture dans le fichier.\n");
                exit(1);
            }
        }
    }

    fclose(fichier);
    return matrice;
}

void afficheMatrice(int taille, int** m) {
    
    for (int i = 0; i < taille; i++) {
        
        for (int j = 0; j < taille; j++) {
            
            printf("%d\t", m[i][j]);
        }
        printf("\n");
    }
}

void afficheMatriceFich(int taille, int** m, char* nomFich) {
    
    FILE *fichier = fopen(nomFich, "w");
    
    if (fichier == NULL) {
        
        printf("Erreur lors de l'ouverture du fichier.\n");
        exit(1);
    }

    for (int i = 0; i < taille; i++) {
        
        for (int j = 0; j < taille; j++) {
            
            fprintf(fichier, "%d\n", m[i][j]);
        }
    }
    fclose(fichier);
}

void libereMatrice(int taille, int** m) {
    
    for (int i = 0; i < taille; i++) {
        
        free(m[i]);
    }
    free(m);
}
/*Exo 4*/

struct Point2D {

    float x;
    float y;
} typedef Point2D;

Point2D milieux(Point2D p1, Point2D p2) {

    Point2D milieu;
    milieu.x = (p1.x + p2.x) / 2;
    milieu.y = (p1.y + p2.y) / 2;

    printf("%f\n%f\n", milieu.x, milieu.y);
}

int main(int argc, char const *argv[]) {
    
    /*char *ch = (char *) malloc (sizeof(char) * 10);
    strcpy(ch, "MALHEUREUSEMENT");
    int tailleCh = strlen(ch);
    if (tailleCh >= 1) {
        
        char *chInverse = (char *) malloc (sizeof(char) * tailleCh);
        chInverse = inverseChaine(ch);
        printf("%s \n", chInverse);
    }*/

    /*char *chaine = litChaine();
    printf("Voici ce que vous avez saisi: %s \n", chaine);*/ 

    return 0;
}
