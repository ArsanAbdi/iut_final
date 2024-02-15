#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>


int main(int nbArguments, char **charv) {

    pid_t pid = -1;
    int n = atoi (charv[1]);

    if (n < 2) {

        printf("il manque un argument");
    }

    for (int i = 0; i < n; i++) {
        
        pid = fork();
        switch (pid) {
        case -1 :
            printf ("erreur sur la création du pid %d\n", i);
            exit(-1);
            break;
        case 0 :
            printf("Mon pid = %d, je me termine. \n", getpid());
            exit(i);
            break;
        
        default : /* le pere */
            printf("je suis le père en attente\n");
            break;
        }
    }

    while ((pid = wait(NULL)) != -1) {

        printf("le processus fils de PIDSyst = %d, vient de terminer\n", pid);
    }
}

