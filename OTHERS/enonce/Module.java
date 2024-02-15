package enonce;
public class Module {

    private String nom;
    private Niveau niveau;

    public Module(String nom, Niveau niveau) {
	super();
	this.nom = nom;
	this.niveau = niveau;
    }

    public String getNom() {
	return nom;
    }

    public Niveau getNiveau() {
	return niveau;
    }

    @Override
    public String toString() {
	return "Module [nom=" + nom + ", niveau=" + niveau + "]";
    }

}
