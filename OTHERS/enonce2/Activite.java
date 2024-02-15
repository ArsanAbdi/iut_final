package clubSport.enonce;

import java.util.ArrayList;
import java.util.Collection;

public class Activite {

    private String nom;
    private int capacite;
    private Collection<Personne> inscrits;

    public Activite(String nom, int capacite) {
	this.nom = nom;
	this.capacite = capacite;
	this.inscrits = new ArrayList<>();
    }

    public void inscrire() {
	// to do
    }

}
