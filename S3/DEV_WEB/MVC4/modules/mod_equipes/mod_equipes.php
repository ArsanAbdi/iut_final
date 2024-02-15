<?php

include_once 'cont_equipes.php';
include_once 'Connexion.php';

class ModEquipes {
    
    private $controleur;

    public function __construct() {

        $this -> controleur = new ContEquipes();

        Connexion :: initConnexion();
        $this -> controleur -> exec();
    }

    public function getAffichage() {

        return $this -> controleur -> getAffichage();
    }

}

?>