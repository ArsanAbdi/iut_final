<?php

include_once 'vue_generique.php';

class VueUtilisateurs extends VueGenerique {

    public function __construct() {

    }

    public function menu() {

        echo '<br><a href="index.php?module=mod_utilisateurs&&action=bienvenue">Action Bienvenue</a><br>';    
    }

    public function formulaireInscription() {

        include_once 'form_inscription.php';
    }

    public function inscriptionRéussie() {

        echo 'INSCRIPTION RÉUSSIE';
    }

    public function inscriptionÉchouée() {

        echo 'INSCRIPTION ÉCHOUÉE';
    }

    public function bienvenue() {
        
        echo 'Bienvenue';
    }

    public function formulaireConnexion() {

        include_once 'form_connexion.php';
    }
}
?>