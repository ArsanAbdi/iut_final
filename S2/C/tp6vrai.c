/*
#include<stdio.h>
#include<malloc.h>
 
typedef struct point2D {

    float x;
    float y;
}Point2D;
 
typedef struct liste_point2D{
 
    Point2D p;
    struct liste_point2D*suiv;
 
}ListePoint2D;
 
typedef struct l_etudiants {
 
    char * nom;
    float sem1;
    float sem2;
    float moyenne;
    struct l_etudiants * suiv;
}L_etudiants;
 
ListePoint2D * nouvelleListeP2D(Point2D p){
 
    ListePoint2D * liste=(ListePoint2D*)malloc(sizeof(ListePoint2D));
    liste->p=p;
    liste->suiv=NULL;
    return liste;
}
 
ListePoint2D * inserer(struct liste_point2D*maliste,Point2D p){
 
ListePoint2D *liste=nouvelleListeP2D(p);
liste->suiv=maliste;
return liste;
 
}
 
struct liste_point2D*supprimerPremier(struct liste_point2D*maliste){
 
ListePoint2D *liste=maliste->suiv;
free(maliste);
return liste;
 
}
 
void parcourir(struct liste_point2D *maliste){
 
while(maliste!=NULL){
 
printf("%f %f",maliste->p.x,maliste->p.y);
maliste=maliste->suiv;
 
}
 
}
 
/*int * rechercher(struct liste_point2D *maliste,Point2D p,int * taille){
 
int t[0];
int i;
for (i=0;maliste!=NULL;i++){
 
if(p.x==maliste->p.x && p.y==maliste->p.y){
t=
}
 
}
 
}
 
L_etudiants * nouvelleListeE(char*nom,float s1, float s2){
 
    int i=0;
    L_etudiants * liste=(L_etudiants*)malloc(sizeof(L_etudiants));
 
    liste->sem1=s1;
    liste->sem2=s2;
    while( nom[i]!=0 ){

        liste->nom[i]=nom[i];
        i++;
    }
return liste;
}
 
L_etudiants * insererE(L_etudiants * l,char * nom, float s1, float s2){
 
L_etudiants *liste = nouvelleListeE(nom,s1,s2);
liste->suiv=l;
return l;
 
}
 
void parcourirE (L_etudiants *l){
 
while(l!=NULL){
 
printf("%s ",l->nom);
printf("%f %f",l->sem1,l->sem2);
l=l->suiv;
 
}

}
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct etudiants {
    char* nom;
    float sem1;
    float sem2;
    float moyenne;
    struct etudiants* suiv;
} Etudiant;

Etudiant* nouvelleListeE(char* nom, float s1, float s2) {
    Etudiant* e = malloc(sizeof(Etudiant));
    e->nom = malloc(sizeof(char) * (strlen(nom) + 1));
    strcpy(e->nom, nom);
    e->sem1 = s1;
    e->sem2 = s2;
    e->moyenne = (s1 + s2) / 2;
    e->suiv = NULL;
    return e;
}

Etudiant* insererE(Etudiant* l, char* nom, float s1, float s2) {
    Etudiant* e = nouvelleListeE(nom, s1, s2);
    e->suiv = l;
    return e;
}
 
void main(){

// Création d'une nouvelle liste avec un étudiant
    Etudiant *liste = nouvelleListeE("Alice", 12.5, 15.5);
    
    // Ajout d'un nouvel étudiant en début de liste
    liste = insererE(liste, "Bob", 10.0, 14.0);
    
    // Ajout d'un autre étudiant en début de liste
    liste = insererE(liste, "Charlie", 13.0, 16.0);

    printf("%f, %f, %s\n", liste[1].sem1, liste[1].sem2, liste[1].nom);
 
}
