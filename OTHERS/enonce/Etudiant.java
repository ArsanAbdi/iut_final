package enonce;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class Etudiant {
    public static int compteur = 0;
    private int numeroEtudiant;
    private String nom;
    private List<Note> notes;

    public Etudiant(String nom, List<Note> notes) {
	this.nom = nom;
	this.notes = notes;
	this.numeroEtudiant = compteur;
	compteur++;
    }

    public String getNom() {
	return nom;
    }

    @Override
    public String toString() {
	return "Etudiant [nom=" + nom + ", notes=" + notes + "]";
    }

    public int getNumeroEtudiant() {
	return numeroEtudiant;
    }

}
