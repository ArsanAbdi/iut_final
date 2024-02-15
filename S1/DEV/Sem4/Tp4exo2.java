import java.util.Scanner;
public class Tp4exo2 {

    public static void main (String[]args) {
        Scanner scanner = new Scanner(System.in).useDelimiter("\n");

        int nombrePair;
        int nombre;
        int c1;
        int c2;
        int c3;
        
/*      // Un int pair compris entre 0 et 100 inclus.
        nombrePair = 0;
            
        while (nombrePair <= 50){
            System.out.println(nombrePair * 2);
            nombrePair++;
        }
*/

/*      // Un int non nul qui doit être pair si il est positif mais impair si il est négatif.

        System.out.print("Saisie d'un entier non nul qui doit être pair si il est positif mais impair si il est négatif: ");
        nombre = scanner.nextInt();
            while (nombre == 0 || (nombre % 2 == 0 && nombre < 0) || (nombre > 0 && (nombre % 2 > 0 || nombre % 2 < 0))) {
                System.out.print("ça ne respecte pas la consigne, entre un nouveau nombre: ");
                nombre = scanner.nextInt();
            }
*/
        // Trois int positifs ou nuls c1, c2, c3  tels que c1 < c2 < c3.

/*      System.out.print("entre trois entiers positifs ou nuls c1, c2, c3  tels que c1 < c2 < c3, entre c1: ");
        c1 =scanner.nextInt();
        System.out.print("entre trois entiers positifs ou nuls c1, c2, c3  tels que c1 < c2 < c3, entre c2: ");
        c2 =scanner.nextInt();
        System.out.print("entre trois entiers positifs ou nuls c1, c2, c3  tels que c1 < c2 < c3, entre c3: ");
        c3 =scanner.nextInt();

            while (c1 < 0 || c2 < 0 || c3 < 0) {
                System.out.print("tu respectes pas la consigne");
                System.out.print("entre trois entiers positifs ou nuls c1, c2, c3  tels que c1 < c2 < c3, entre c1: ");
                c1 =scanner.nextInt();
                System.out.print("entre trois entiers positifs ou nuls c1, c2, c3  tels que c1 < c2 < c3, entre c2: ");
                c2 =scanner.nextInt();
                System.out.print("entre trois entiers positifs ou nuls c1, c2, c3  tels que c1 < c2 < c3, entre c3: ");
                c3 =scanner.nextInt();
            }
            while (c1 > c2 || c1 > c3 || c2 > c3) {
                System.out.println("tu respectes pas la consigne");
                System.out.print("entre trois entiers positifs ou nuls c1, c2, c3  tels que c1 < c2 < c3, entre c1: ");
                c1 =scanner.nextInt();
                System.out.print("entre trois entiers positifs ou nuls c1, c2, c3  tels que c1 < c2 < c3, entre c2: ");
                c2 =scanner.nextInt();
                System.out.print("entre trois entiers positifs ou nuls c1, c2, c3  tels que c1 < c2 < c3, entre c3: ");
                c3 =scanner.nextInt();
            }*/
        
        //(avancé) Trois int positifs ou nuls c1, c2, c3  tels que c1 < c2 < c3 ou c1 > c2 > c3.
        
        System.out.print("entre trois entiers positifs ou nuls c1, c2, c3  tels que c1 < c2 < c3 ou c1 > c2 > c3: ");
       	c1 =scanner.nextInt();
       	System.out.print("entre trois entiers positifs ou nuls c1, c2, c3  tels que c1 < c2 < c3 ou c1 > c2 > c3: ");
       	c2 =scanner.nextInt();
       	System.out.print("entre trois entiers positifs ou nuls c1, c2, c3  tels que c1 < c2 < c3 ou c1 > c2 > c3: ");
       	c3 =scanner.nextInt();
       	
       		while ((c1 < 0 || c2 < 0 || c3 < 0) || (c2 >= c1 && c2 >= c3) || (c2 <= c1 && c2 <= c3)) {
       			System.out.println("Réessaye");
       			System.out.print("entre trois entiers positifs ou nuls c1, c2, c3  tels que c1 < c2 < c3 ou c1 > c2 > c3: ");
       	       	c1 =scanner.nextInt();
       	       	System.out.print("entre trois entiers positifs ou nuls c1, c2, c3  tels que c1 < c2 < c3 ou c1 > c2 > c3: ");
       	       	c2 =scanner.nextInt();
       	       	System.out.print("entre trois entiers positifs ou nuls c1, c2, c3  tels que c1 < c2 < c3 ou c1 > c2 > c3: ");
       	       	c3 =scanner.nextInt();
       		}
       		System.out.println("weeee");
        	
        
        
        
        
			
            



        scanner.close();
    }

}
