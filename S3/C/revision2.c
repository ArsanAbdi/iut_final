#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>

int main() {

    int b = 0;
    for(int i = 0; i < 10; i++) {
        
        b++;
        pid_t p2;
        switch(p2) {

            case -1:
                perror("erreur création processus");
                exit(-1);
                break;
            case 0:
                printf("processus fils crée\n");
                p2 = fork();
                b++;
                printf("recreation %d\n",b);
                break;
            default: 
                break;    

        }
    }
    return 0;
}