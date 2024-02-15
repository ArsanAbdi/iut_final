<?php
include_once 'vue_generique.php';

class VueJoueurs extends VueGenerique {

    public function __construct() {


    }

    public function affiche_liste($tab) {
        
        foreach ($tab as $joueur) {
            echo '<a href="index.php?module=mod_joueurs&&action=details&id=' . $joueur['id'] . '">' . $joueur['nom'] . '</a><br>';
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

    public function affichageVictoire() {

        echo 'Cest réussi tes bon';
    }

    public function affiche_details($details) {
        
        echo '<p>Details : ' . $details['bio'] . '</p>';
    }
}

$tab = array(

    array("id" => 1, "nom" => 'Zidane'),
    array("id" => 2, "nom" => 'Henry'),
    array("id" => 3, "nom" => 'Mbappe'),
    array("id"=> 4, "nom" => 'Rami')

);

?>