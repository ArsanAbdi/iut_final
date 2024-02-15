package SourceDepart;

public class Cours {

    private String intitule;
    private Enseignant responsable;
    private Niveau niveau;

    public Cours(String intitule, Enseignant responsable, Niveau niveau) {
	super();
	this.intitule = intitule;
	this.responsable = responsable;
	this.niveau = niveau;
    }

    public Enseignant getResponsable() {
	return responsable;
    }

    public void setResponsable(Enseignant responsable) {
	this.responsable = responsable;
    }

    public String getIntitule() {
	return intitule;
    }

    public Niveau getNiveau() {
	return niveau;
    }

    @Override
    public String toString() {
	return "Cours [intitule=" + intitule + ", responsable=" + responsable
		+ ", niveau=" + niveau + "]" + "\n";
    }

    @Override
    public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result
		+ ((intitule == null) ? 0 : intitule.hashCode());
	result = prime * result + ((niveau == null) ? 0 : niveau.hashCode());
	return result;
    }

    @Override
    public boolean equals(Object obj) {
	if (this == obj) return true;
	if (obj == null) return false;
	if (!(obj instanceof Cours)) return false;
	Cours other = (Cours) obj;
	if (intitule == null) {
	    if (other.intitule != null) return false;
	} else if (!intitule.equals(other.intitule)) return false;
	if (niveau != other.niveau) return false;
	return true;
    }
}
