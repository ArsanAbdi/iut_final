<?php

include_once 'cont_equipes.php';
include_once 'Connexion.php';

class ModEquipes {
    
    public function __construct() {

        $controleur = new ContEquipes();

        Connexion::initConnexion();
        $controleur->exec();

    }

}

?>