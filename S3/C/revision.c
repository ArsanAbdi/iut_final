#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>

int main(int argc, char *argv[]) {

    if (argc < 2) {

        perror("pas assez d'arguments");
        return -1;
    }

    pid_t pid = -1;
    int nbProcessus = atoi(argv[1]);

    FILE *filePair = fopen("pair.txt", "w+");
    FILE *fileImpair = fopen("impair.txt", "w+");

    for (int i = 0; i < nbProcessus; ++i) {

        pid = fork();
        switch (pid) {

            case -1:

                perror("erreur sur création du processus");
                exit(0);
                break;
            case 0:

                if (i % 2 == 0) {

                    fprintf(filePair, "indice: %d\t et pidSyst: %d\n", i, getpid());
                }
                else {

                    fprintf(fileImpair, "indice: %d\t et pidSyst: %d\n", i, getpid());
                }
                exit(i);
                break;
            default:

                break;
        }
    }
    fclose(filePair);
    fclose(fileImpair);

    while ((pid = wait(NULL)) != -1);
    printf("bonjour\n");

    pid_t pid2 = fork();

    if (pid2 == -1) {

        perror("processus pas crée");
        return -1;
    }

    int c;
    FILE *pair = fopen("pair.txt", "r");
    FILE *impair = fopen("impair.txt", "r");

        if (pid2 != 0) {

            while((c = fgetc(pair)) != EOF) {

                printf("%c", (char) c);
            }
        }
        else {

            while((c = fgetc(impair)) != EOF) {

                printf("%c", (char) c);
            }
        }


}