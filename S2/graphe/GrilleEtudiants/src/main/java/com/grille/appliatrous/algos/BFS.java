package com.grille.appliatrous.algos;

import modele.Grille;
import modele.Sommet;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

public class BFS {
	/**
	 * Le graphe (ou grille) sur lequel on travaille
	 */
	private Grille g;
	/**
	 * Le sommet source de l'algo
	 */
	private Sommet source;
	/**
	 * Liste des sommets de la composante connexe de g obtenue par un parcours en largeur depuis le sommet source
	 */
	private ArrayList<Sommet> parcours;
	/**
	 * Chaque sommet (clé) est associé à son prédécesseur (valeur) du parcours en largeur
	 */
	private Map<Sommet, Sommet> predecesseurs;

	public BFS(Grille g, Sommet source) {
		this.g = g;
		this.source = source;
		parcours = new ArrayList<>();
		predecesseurs = new HashMap<Sommet, Sommet>();
		algoBFS();
	}

	/**
	 * Exécute l'algo BFS sur g à partir du sommet source Remplit la liste parcours avec les sommets dans l'ordre de
	 * visite Remplit la map predecesseurs en indiquant quel est le prédécesseur de chaque sommet Le prédécesseur du
	 * sommet source est le sommet null
	 */
	private void algoBFS() {
		LinkedList<Sommet> fifo = new LinkedList<>();
		parcours = new ArrayList<>();
		Sommet k = this.source;
		this.parcours.add(k);
		fifo.addFirst(k);

		while (!fifo.isEmpty()) {

			k = fifo.removeLast();
			for (Sommet s: g.adjacents(k)) {

				if (!this.parcours.contains(s)) {

					this.parcours.add(s);
					fifo.addFirst(s);
					predecesseurs.put(s, k);
				}
			}
		}
	}

	/**
	 * Retourne une liste donnant la suite des sommets depuis la cible jusqu'à la source
	 * 
	 * @param cible
	 * @return le chemin sous forme de liste de sommets
	 */
	public ArrayList<Sommet> cheminVersSource(Sommet cible) {
		ArrayList<Sommet> chemin = new ArrayList<>();

		for (int i = 0; i < this.parcours.size(); i++) {

			chemin.add(this.parcours.get(this.parcours.size() - i));

			for (i = 0; i < chemin.size(); i++) {

				System.out.println("sommet " + (i + 1) + ": " + chemin.get(i));
			}
		}

		return chemin;
	}

	/*************************************************
	 **** Pas de modifications à faire ci-dessous ****
	 *************************************************/

	public ArrayList<Sommet> getParcours() {
		return parcours;
	}

	public Map<Sommet, Sommet> getPredecesseurs() {
		return predecesseurs;
	}

	/**
	 * Mise à jour quand la source est modifiée suite à un clic droit
	 * 
	 * @param source
	 *            le nouveau sommet source
	 */
	public void setSource(Sommet source) {
		this.source = source;
		clear();
		algoBFS();
	}

	/**
	 * Mise à jour suite au changement de graphe
	 * 
	 * @param g
	 *            le nouveau graphe
	 */
	public void setG(Grille g) {
		this.g = g;
		clear();
		algoBFS();
	}

	private void clear() {
		this.parcours.clear();
		this.predecesseurs.clear();
	}

}
