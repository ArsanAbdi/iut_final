#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <string.h>
#include <wait.h>

int main(int argc, char *argv[]) {
    
    pid_t pid = -1;
    FILE *file = fopen("partage.txt", "w+");
    int status = 0;

    for (int i = 0; i < strlen(argv[1]); i++) {

        pid = fork();
        switch(pid) {

            case -1:

                exit(-1);
                break;

            case 0:

                fprintf(file, "F %d\t%s\n", getpid(), argv[1]);
                exit(i);
                break;

            default:

                break;
        }
    }

    while (pid = wait(NULL) != -1) {

        //fprintf(file, "je suis le père, et je n'ai plus de fils, il n'y a que moi\n");
        fprintf(file, "le processus fils de PIDSyst = %d, vient de terminer\n", getpid());
    }
    return 0;
}
