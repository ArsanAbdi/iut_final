import java.util.Scanner;
	
public class Tarifs2 {
		final static double ENFANT = 0.25;
		final static double JEUNEVIEUX = 0.80;
		final static double AUTRES = 1.20;
		final static double RED = 0.70;

		public static void main(String[]args) {
		Scanner scanner = new Scanner (System.in).useDelimiter("\n");

		int age;
		int ville;
		double tarif;

		System.out.print("t'es d'où: ");
		ville = scanner.nextInt();

		if (ville < 0 || ville > 1) {
			System.out.println("erreur");
		}
			else {
			System.out.print("ton âge: ");
			age = scanner.nextInt();
			

				if (age <= 0 || age > 122) {
					System.out.println("Sors de mon bus");
				}
				else {
					if (age <= 3) {
						tarif = ENFANT;
					}
					else if (age < 20 || age >= 65) {
						tarif = JEUNEVIEUX;
					}
					else {
						tarif = AUTRES;
					}

					if (ville == 1) {
						tarif = tarif * RED;
					}	

				}

			}

		

		

		scanner.close();
	}

}
