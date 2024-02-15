package SourceDepart;

/**
 * @author mariannesimonot
 */
public  class Enseignant {
    public static int compteur = 0;
    private int identifiant;
    private String nom;

    public Enseignant(String nom) {
	this.nom = nom;
	this.identifiant = compteur;
	compteur++;
    }

    public int getIdentifiant() {
	return identifiant;
    }

    public String getNom() {
	return nom;
    }

 

    @Override
    public String toString() {
	return ( nom );
    }

}
