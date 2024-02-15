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
        $this->action = isset($_GET['action']) ? $_GET['action'] : 'bienvenue';
    }

    public function bienvenue() {
        $this->vue->menu();
    }

    public function liste() {
        $liste = $this -> modele -> getListe();
        $this -> vue -> afficheListe($liste);
    }

    public function exec() {
        switch($this -> action) {
            
            case 'bienvenue':
                
                $this -> bienvenue();
                break;
            
            case 'liste':
                
                $this -> liste();
                break;
        }
    }

}

?>