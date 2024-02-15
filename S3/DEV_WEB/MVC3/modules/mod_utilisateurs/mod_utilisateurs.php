<?php

include_once 'cont_utilisateurs.php';
include_once 'Connexion.php';

class ModUtilisateurs {

    private $contUtilisateurs;

    public function __construct() {

        Connexion :: initConnexion();

        $this -> contUtilisateurs = new ContUtilisateurs();
        $this -> contUtilisateurs -> exec();
    }

    public function getAffichage() {

        return $this -> contUtilisateurs -> getAffichage();
    }
}

?>