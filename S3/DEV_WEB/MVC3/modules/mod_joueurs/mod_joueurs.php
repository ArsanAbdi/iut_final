<?php

include_once 'cont_joueurs.php';
include_once 'Connexion.php';

class ModJoueurs {

    private $contJoueurs;

    public function __construct() {

        Connexion :: initConnexion();

        $this -> contJoueurs = new ContJoueurs();
        $this -> contJoueurs -> exec();
    }

    public function getAffichage() {

        return $this -> contJoueurs -> getAffichage();
    }
}

?>