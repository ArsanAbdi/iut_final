import java.util.Scanner;

public class TP4exo4 {
	final static double PI = 3.14;
	public static void main (String[]args) {
		Scanner scanner = new Scanner(System.in).useDelimiter ("\n");
		
		double r;
		System.out.print("Saisie le rayon du cercle: ");
		r = scanner.nextDouble();

		while (r >= 0) {

			double circonference = 2*PI*r;
			double aire = 2*PI*r*r;
			
			System.out.println("circonférence: " + circonference);
			System.out.println("aire: " + aire);		
			
			System.out.print("Saisie le rayon du cercle: ");
			r = scanner.nextDouble();
		}
		
		System.out.println("Au revoir");
		
		
		
		
		scanner.close();
	}
}