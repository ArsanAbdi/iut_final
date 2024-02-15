#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>


//28 est le pere de 29
//28 est le pere de 30
//29 est le pere de 30

/*void main() {
    //printf("%d\n", getppid());
    for (int i = 0; i < 2; i++) {

        pid_t pid = fork();

        switch(pid) {

            case -1:

                perror("error");
                break;
            case 0:

                if (i % 2 == 0) {
                    
                    printf("un pid = %d et getppid() = %d\n", getpid(), getppid());
                    pid = fork();
                    switch(pid) {

                        case -1:
                            perror("error"); break;
                        case 0:
                            printf("je suis le fils de %d\n", getppid()); break;
                        default: 
                            break;
                    }
                }
                else {

                    printf("mon pid est = %d, et je suis le fils de = %d\n", getpid(), getppid());
                }
                exit(i);
                break;

            default: 

                if (i % 2 == 0) {
                    
                    printf("qui suis-je ? pere ou fils ? sachant que le resultat du getpid() = %d\n", getpid());
                }
                break;
        }
    }
    
}*/

int main(int argc, char *argv[]) { //argv[1] taille argv[2] chaine

    if (argc < 3 || argv[2] == NULL) {
        
        perror("pas assez d'argument ou chaine vide");
        return -1;
    }
    int nbProcessus = 2;
    int taille = atoi(argv[1]);

    char *chaine = argv[2];
    //printf("%s\n", chaine);

    printf("%c\n", chaine[0]);
    printf("%c\n", chaine[1]);

    int chaineInt[taille];

    for (int i = 0; i < taille; i++) {
        
        chaineInt[i] = (int) chaine[i];
    }
    

    printf("%d\n", chaineInt[0]);
    printf("%d\n", chaineInt[1]);

    pid_t pid;

    int prodDroit = 1; int prodGauche = 1;
    int tabMult[nbProcessus];
    for (int i = 0; i < nbProcessus; i++) {

        pid = fork();
        switch (pid) {

            case -1:

                perror("erreur sur la creation du processus");
                exit(-1);
                break;

            case 0:

                if (i % 2 == 0) {
                    
                    for (int j = 0; i < taille / 2; j++) {
                        
                        prodDroit = prodDroit * chaineInt[i];
                    }
                    tabMult[1] = prodDroit;
                }
                else {

                    for (int j = taille / 2; j < taille; j++) {
                        
                        prodGauche = prodGauche * chaineInt[i];
                    }
                    tabMult[0] = prodGauche;
                }
                exit(i);
                break;

            default:

                break;
        }
    }

    while ((pid = wait(NULL)) != -1);
    printf("bonjour\n");

    int resultat = tabMult[0] * tabMult[1];
    

    return 0;
}
