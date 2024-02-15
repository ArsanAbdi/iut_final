#include <stdio.h>

void echange ( int *var1, int *var2) {

    int pivot;
    pivot = *var1;
    *var1 = *var2;
    *var2 = pivot;
    printf("%d\n", *var1);
    printf("%d\n", *var2);

}

void affiche_chaine(char *chaine) {

    while (*chaine != '\0') {
        
        printf("%c", *chaine);
        chaine++;
    }
    printf("\n");
}

struct Point2D {

    float x;
    float y;
}

typedef Point2D;

Point2D milieux (Point2D p1, Point2D p2) {

    Point2D milieu;
    milieu.x = (p1.x + p2.x) / 2;
    milieu.y = (p1.y + p2.y) / 2;

    printf("%f\n%f\n", milieu.x, milieu.y);
}

Point2D symetrie_orig(Point2D *p1) {

    (*p1).x = -1 * (*p1).x;
    (*p1).y = -1 * (*p1).y;
    printf("%f\n%f", milieu.x, milieu.y);
}

int main() {

    //int i = 2, y = 4;
    //int *p1 = &i, *p2 = &y;
    //echange(p1, p2);
    //return 0;
    //char chaine[] = {"Bonjour"};
    //affiche_chaine(chaine);
    Point2D point = {1, 1};
    Point2D *ppoint = &point;
    //Point2D p2 = {3, 4};
    //milieux(p1, p2);
    return 0;
}