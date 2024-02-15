package SourceDepart;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.InputMismatchException;
import java.util.Scanner;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;
import java.util.function.Predicate;

public class Departement {

    private ArrayList<Enseignant> enseignants;
    private ArrayList<Cours> lesCours;



    public Departement() {
	enseignants = new ArrayList<Enseignant>();
	 lesCours = new ArrayList<Cours>();

    }

  
    public void ajouter(Enseignant e) {
	enseignants.add(e);
    }

    public Enseignant getEnseignant(int i) {
	return enseignants.get(i);
    }

  

  

   

    @Override
    public String toString() {
	return "Departement [enseignants=" + enseignants + "\n lesCours= \n"
		+ lesCours + "]";
    }

    
    public void ajouter(Cours c)  {
    	boolean dejaLa=false;
    	for (Cours leCours : lesCours) {
    		if (leCours.equals(c)) {
    			dejaLa=true;
    		}
    	}
    	if(!dejaLa)
    		lesCours.add(c);
    }

 
  

  
 
   
}
