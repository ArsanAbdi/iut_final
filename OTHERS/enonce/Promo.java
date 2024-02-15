package enonce;

import java.util.Collection;
import java.util.Comparator;
import java.util.SortedSet;
import java.util.TreeSet;
import java.util.stream.Collectors;

public class Promo {

    private SortedSet<Etudiant> etudiants;

    public Promo() {
	Comparator<Etudiant> cc = (e1, e2) -> {
	    if (e1.getNom().equals(e2.getNom())) {
		return e1.getNumeroEtudiant() - e2.getNumeroEtudiant();
	    } else {
		return e1.getNom().compareTo(e2.getNom());
	    }
	};
	this.etudiants = new TreeSet<>(cc);
    }

    public void ajouter(Etudiant e) {
	etudiants.add(e);
    }

    public double moyennePromo() {
	// ToDo
	return 0;
    }

}
