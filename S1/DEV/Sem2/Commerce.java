import java.util.Scanner;


public class Commerce {


		public static void main (String[]args) {

		Scanner scanner = new Scanner (System.in).useDelimiter("\n");

		int prix;
		
		System.out.println("Entrez le montant des achats:");

		prix = scanner.nextInt();

		double prixFinal = prix - 100;
		double reductionDuPrix = prixFinal * 0.95;
		double apresReduction = 100 + reductionDuPrix;

		String clientDuCommerce;

		clientDuCommerce = scanner.nextLine();

		if (prix > 100) 
			System.out.println("Vous bénéficiez d'une réduction sur vos achat, ils vous reviennent donc à " + apresReduction);
				 
		else if (prix > 0) { 
			System.out.println("Le montant est de" + prix);
		     }
		else {
			System.out.println("Vous n'avez rien acheté. Ne revenez plus ici !!");
		}

scanner.close();


						    }

}
		
