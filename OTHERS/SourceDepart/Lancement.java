package SourceDepart;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Set;

public class Lancement {

    public static void main(String[] args) throws Exception {
	Enseignant x = new Enseignant("Homps");
	Enseignant y = new Enseignant("Simonot");
	Enseignant z = new Enseignant("Aquil");

	// tests de Cours
	Cours c1 = new Cours("M212", x, Niveau.L1);
	Cours c5 = new Cours("M213", x, Niveau.L1);
	Cours c6 = new Cours("M214", z, Niveau.L1);
	Cours c2 = new Cours("M212", y, Niveau.L3);
	Cours c7 = new Cours("M216", z, Niveau.L3);
	Cours c3 = new Cours("M310", y, Niveau.L2);
	Cours c4 = new Cours("M213", x, Niveau.L2);
	Cours c9 = new Cours("M214", y, Niveau.L2);
	Cours c8 = new Cours("M215", y, Niveau.L2);
	Cours c10 = new Cours("M215", x, Niveau.M1);
	Cours c11 = new Cours("M212", z, Niveau.M1);
	Cours c12 = new Cours("M211", x, Niveau.M1);
	Cours c13 = new Cours("M213", y, Niveau.M2);
	Cours c14 = new Cours("M212", z, Niveau.M2);
	Cours c15 = new Cours("M212", x, Niveau.M2);
	
	//exercice 1.a
	System.out.println(c1.equals(c2));
	System.out.println(c1.equals(c14));
	System.out.println(c14.equals(c15));
	
	

	Departement info = new Departement();
	info.ajouter(x);
	info.ajouter(y);
	info.ajouter(z);

	info.ajouter(c1);
	info.ajouter(c2);
	info.ajouter(c3);
	info.ajouter(c4);
	info.ajouter(c5);
	info.ajouter(c6);
	info.ajouter(c7);
	info.ajouter(c8);
	info.ajouter(c9);
	info.ajouter(c10);
	info.ajouter(c11);
	info.ajouter(c12);
	info.ajouter(c13);
	info.ajouter(c14);
	System.out.println(info);

	//Exercice 1b
	info.ajouter(c15);
	System.out.println( info);

	

	
    }
}
