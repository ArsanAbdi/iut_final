package com.grille.appliatrous.algos;

import modele.Grille;
import modele.Sommet;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.PriorityQueue;

public class AEtoile {

	private Grille g;
	private Sommet source, cible;
	/**
	 * Associe à chaque sommet son coût minimal d'accès depuis le sommet source
	 */
	private Map<Sommet, Double> couts;
	/**
	 * Associe à chaque sommet son prédécesseur dans le chemin de coût minimal vers le sommet source
	 */
	private Map<Sommet, Sommet> predecesseurs;

	public AEtoile(Grille g, Sommet source, Sommet cible) {
		this.g = g;
		this.source = source;
		this.cible = cible;
		couts = new HashMap<>();
		predecesseurs = new HashMap<>();
		algoAEtoile();
	}

	private void algoAEtoile() {
		PriorityQueue<SommetCout> fifo = new PriorityQueue<>();
		// TODO
	}

	/**
	 * Distance de Manhattan
	 * 
	 * @param cible
	 * @param source
	 * @return la distance de Manhattan entre les sommet cible et source
	 */
	private double heuristique(Sommet cible, Sommet source) {
		// TODO
		return 0;
	}

	public ArrayList<Sommet> cheminVersSource() {
		ArrayList<Sommet> chemin = new ArrayList<>();
		//TODO
		return chemin;
	}

	/*************************************************
	 **** Pas de modifications à faire ci-dessous ****
	 *************************************************/

	public void setSource(Sommet source) {
		this.source = source;
		clear();
		algoAEtoile();
	}

	public void setG(Grille g) {
		this.g = g;
		clear();
		algoAEtoile();
	}

	private void clear() {
		this.couts.clear();
		this.predecesseurs.clear();
	}
}
