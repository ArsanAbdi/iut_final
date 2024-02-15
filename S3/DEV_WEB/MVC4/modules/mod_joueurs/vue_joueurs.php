<?php
include_once 'vue_generique.php';

class VueJoueurs extends VueGenerique {

    public function __construct() {


    }

    public function affiche_liste($tab) {
        
        foreach ($tab as $joueur) {
            echo '<a href="index.php?module=mod_joueurs&&action=details&&id=' . $joueur['id'] . '">' . $joueur['nom'] . '</a><br>';
        }
    }

    public function menu() {
        
        echo '<br><a href="index.php?module=mod_joueurs&&action=bienvenue">Action Bienvenue</a><br>';
        echo '<a href="index.php?module=mod_joueurs&&action=liste">Action Liste</a><br>';
        echo '<a href="index.php?module=mod_joueurs&&action=ajout">Action Formulaire</a><br>';
    }

    public function bienvenue() {
        
        echo 'Bienvenue';
    }

    public function formulaire() {

        include_once 'form_ajout.php';
    }

    public function entréJoueurRéussi() {

        echo 'Joueur entré dans la liste avec succès';
    }

    public function affiche_details($details) {
        
        echo '<p>Details : ' . $details['bio'] . '</p>';
    }
}

?>