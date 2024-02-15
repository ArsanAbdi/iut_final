<?php

include_once 'modele_joueurs.php';
include_once 'vue_joueurs.php';
include_once 'Connexion.php';

class ContJoueurs {

    private $modèle;
    private $vue;
    private $action;

    public function __construct() {
        $this -> modèle = new ModèleJoueurs();
        $this -> vue = new VueJoueurs();
        $this -> action = isset($_GET['action']) ? $_GET['action'] : 'bienvenue';

    }

    public function liste() {
        
        $this -> vue -> affiche_liste($this -> modèle -> getListe());
    }

    public function bienvenue() {
        
        $this -> vue -> bienvenue();
    }

    public function exec() {
        
        $this -> vue -> menu();
        switch($this -> action) {
            case 'bienvenue' :
                
                $this -> bienvenue();
                break;
            case 'liste' :
                
                $this -> liste();
                break;
            case 'details' :
                
                $this -> details();
                break;
            case 'ajout' : 

                $this -> formulaire();
                break;
            case 'envoi' :

                $this -> modèle -> envoi();
                $this -> vue -> affichageVictoire();
                break;
            default :
                
                $this -> vue -> menu(); 
                break;
        }
    }

    public function formulaire() {

        $this -> vue -> formulaire();
    }

    public function details() {
        
        $id = isset($_GET['id']) ? $_GET['id'] : null;

        if ($id !== null){
            $details = $this -> modèle -> getDetails($id);

            if($details !== null){
                $this->vue->affiche_details($details);
            }
            else {
                echo 'joueur non conforme';
            }
        }
        else{
            echo 'id non conforme';
        }

    }
}


?>