#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>
#include <unistd.h>

                                /* EXO 1 */

/*int main() {

    int i = 0;
    pid_t pid;

    pid = fork();
    i++;
    if (pid == 0) {
        
        i++;
        printf("i = %d", i);
        printf("pid = %d\n", getpid());
    }

    printf("i = %d", i);
    printf("pid = %d\n", getpid());
    exit(0);

    (a) le programme affiche i = 1 suivi de la valeur que renvoie getpid() qui corresond 
    au pidSys de celui qui appelle getpid() et fait la même chose avec i = 2 et encore avec i = 1
    (b) sur le programme
    (c) processus père (7, 8, 10, 11, 12, 17, 18, 19, 20) et processus fils (11, 12, 13, 14, 15, 16, 17, 18, 19, 20)
 
    
}*/

/*int main(int argc, char const *argv[]) {
    
    pid_t pid1;
    pid_t pid2;
    
    pid1 = fork();
    pid2 = fork();

    if (pid1 == 0) {
    
        if (pid2 == 0) {
        
            printf("pid2 = %d\n", getpid());
            exit(0);
        }
        printf("pid1 = %d\n", getpid());
        exit(0);
    
    }
    printf("pid3 = %d\n", getpid());
    exit(0);
}*/

/*int main(int argc, char const *arg[]) {

    pid_t pid;
    int i;
    FILE *fich = NULL;

    fich = fopen("nombres.txt", "a");
    pid = fork();
    if (pid == 0) {
        
        for (i = 0; i < 6; i++) {
            
            fprintf(fich, "%d", i);
        }
        exit(0);
        
    }

    for (i = 6; i < 10; i++) {
            
        fprintf(fich, "%d", i);
    }
    exit(0);
}*/





                                /* EXO 2 */


int main () {

    const int LIMIT = 100;
    pid_t pid;

    FILE *fd = NULL;
    fopen("pair.txt", "a");
    fd = fopen("nombres.txt", "w");

    pid = fork();
    if (pid != 0) {
        
        for (int i = 0; i < LIMIT; i += 2) {
            
            while (fopen("pair.txt", "r") == NULL);
            
                fprintf(fd, "%d\n", i);
                fflush(fd);                
                remove("pair.txt");
                fopen("impair.txt", "a");
                
        }
    }
    else {
        
        for (int i = 1; i < LIMIT; i += 2) {
            
            while (fopen("impair.txt", "r") == NULL);
                
                fprintf(fd, "%d\n", i);
                fflush(fd);
                remove("impair.txt");
                fopen("pair.txt", "a");
        }
        exit(0);
    }
    fclose(fd);
    exit(0);
}