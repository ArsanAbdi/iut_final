<?php

include_once 'vue_equipes.php';
include_once 'modele_equipes.php';

class ContEquipes {

    private $modele;
    private $vue;
    private $action;

    public function __construct() {
        
        $this->modele = new ModèleEquipes();
        $this->vue = new VueEquipes();
        $this->action = isset($_GET['action']) ? $_GET['action'] : '';
    }

    public function bienvenue() {
        
        $this -> vue -> bienvenue();
    }

    public function liste() {
        
        $liste = $this -> modele -> getListe();
        $this -> vue -> afficheListe($liste);
    }

    public function exec() {

        $this -> vue -> menu();
        switch($this -> action) {
            
            case 'bienvenue':
                
                $this -> bienvenue();
                break;
            
            case 'liste':
                
                $this -> liste();
                break;
        }
    }

    public function getAffichage() {

        return $this -> vue-> getAffichage();
    }

}

?>