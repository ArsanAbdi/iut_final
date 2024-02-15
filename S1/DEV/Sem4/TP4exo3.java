import java.util.Scanner;

public class TP4exo3 {

	public static void main (String[] args) {
		Scanner scanner = new Scanner(System.in).useDelimiter("\n");
		
		int depart;
		
		System.out.print("Entier de départ : ");
		depart = scanner.nextInt();
		
		
		for (int i = depart ; i >= 0 ; i--) {
			System.out.print(i + " ");
		}
		
		System.out.println();
		System.out.println("C'est fini !");
		
		scanner.close();
	}
	
}