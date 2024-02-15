import java.util.Scanner;

/*Développez un programme qui affiche le résultat au baccalauréat
 *Le programme demande la saisie d'un double compris entre 0 et 20 (la moyenne au baccalauréat), puis, selon le cas, affiche :

    •."moyenne incorrecte" lorsque la valeur saisie est négative ou strictement supérieure à 20 ; 

    •."refusé" lorsque la valeur saisie est strictement inférieure à 8 ; 

    •."doit passer l'oral de rattrapage" lorsque la valeur saisie est comprise entre 8 inclus et 10 exclus ; 

    •."admis mention passable" lorsque la valeur saisie est comprise entre 10 inclus et 12 exclus ; 

    •."admis mention assez bien" lorsque la valeur saisie est comprise entre 12 inclus et 14 exclus ; 

    •."admis mention bien" lorsque la valeur saisie est comprise entre 14 inclus et 16 exclus ; 

    •."admis mention très bien" lorsque la valeur saisie est supérieure ou égale à 16. 

 

b. Étendez votre programme de manière à gérer l'oral de rattrapage : dans le cas où le candidat doit passer le rattrapage, votre programme demandera la saisie de la moyenne finale après passage du rattrapage et affichera "refusé" ou bien "admis mention passable".

Essayez votre programme avec plusieurs cas pour vérifier qu'il fonctionne correctement. 
 */

public class Moyenne {
	public static void main(String[]args) {
		Scanner scanner = new Scanner (System.in).useDelimiter("\n");
		System.out.println("Entrez votre moyenne: ");
		double laMoyenne = scanner.nextDouble();

		if (laMoyenne > 20 && laMoyenne < 0) 
			System.out.println("moyenne vraiment incorrecte");
		
		else if (laMoyenne < 8)
			System.out.println("refusé un peu");

		else if (laMoyenne >= 8 && laMoyenne < 10)
			System.out.println("aÏe de peu dommage retente la prochaine fois ou rattrapage");
		










scanner.close();
     }


}

