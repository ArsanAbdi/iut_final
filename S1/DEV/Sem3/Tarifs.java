import java.util.Scanner;
	
public class Tarifs {
		public static void main(String[]args) {
		Scanner scanner = new Scanner (System.in).useDelimiter("\n");
		

		int votreAge;
		int votreVille;
		
		System.out.print("Saisissez votre âge: ");
		votreAge = scanner.nextInt();

		System.out.print("Saisissez votre ville: ");
		votreVille = scanner.nextInt();

		
		if (votreAge <= 0 || votreAge > 122) {
			System.out.println("Sortez de mon bus.");	
		}
		else {  
			if (votreVille == 1) {
			
				if (votreAge > 0 && votreAge <= 3) {
					System.out.println("Vous devez 18 centimes.");	
				}
				else if (votreAge < 20 && votreAge >= 65) {
					System.out.println("Vous devez 56 centimes.");
				}
				else {
					System.out.println("Vous devez 84 centimes.");
				}
			}
			else {
				
				if (votreAge > 0 && votreAge <= 3) {
					System.out.println("Vous devez 25 centimes.");	
				}
				else if (votreAge < 20 && votreAge >= 65) {
					System.out.println("Vous devez 80 centimes.");
				}
				else {
					System.out.println("Vous devez 1 euro et 20 centimes.");
				}
			}
		}
		

		

		

		scanner.close();
	}

}
