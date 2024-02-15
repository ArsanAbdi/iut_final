import java.util.Scanner; 

public class MultipleDeDeuxTroisCinq {

	public static void main(String[]args) {

		Scanner scanner = new Scanner (System.in).useDelimiter("\n");

		int leNombre;

		System.out.print("Entrez l'entier: ");
		leNombre = scanner.nextInt();

		if (leNombre % 2 == 0) {
			System.out.println("pair");
		}
		else {	
			System.out.println("impair");
		}

		if (leNombre % 5 == 0) {
			System.out.println("multiple de 5");
		}
		else {
			System.out.println("pas multiple de 5");
		}

		if (leNombre % 3 == 0) {
			System.out.println("multiple de 3");
		}
		else {
			System.out.println("pas multiple de 3");



		scanner.close();
	}
	

}
}
