<?php

include_once 'vue_equipes.php';
include_once 'modele_equipes.php';

class ContEquipes {

    private $modele;
    private $vue;
    private $action;

    public function __construct() {
        
        $this -> modele = new ModèleEquipes();
        $this -> vue = new VueEquipes();
        $this -> action = isset($_GET['action']) ? $_GET['action'] : '';
    }

    public function exec() {

        $this -> vue -> menu();
        switch($this -> action) {
            
            case 'bienvenue':
                
                $this -> vue -> bienvenue();
                break;
            
            case 'liste':
                
                $this -> vue -> affiche_liste($this -> modele -> getListe());
                break;

            case 'details':

                $this -> vue -> affiche_details_team($this -> modele -> getDetails($_GET['id']));
                break;
            
            case 'ajout_equipes':

                $this -> vue -> formulaire();
                break;

            case 'envoi':

                $this -> modele -> envoi();
                break;
        }
    }

    public function getAffichage() {

        return $this -> vue -> getAffichage();
    }

}

?>