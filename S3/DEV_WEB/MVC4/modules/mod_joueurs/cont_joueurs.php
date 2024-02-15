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
        $this -> action = isset($_GET['action']) ? $_GET['action'] : 'Bienvenue sur la page Joueur';

    }

    public function exec() {
        
        $this -> vue -> menu();
        switch($this -> action) {
            case 'bienvenue' :
                
                $this -> vue -> bienvenue();
                break;
            case 'liste' :
                
                $this -> vue -> affiche_liste($this -> modèle -> getListe());
                break;
            case 'details' :
                
                $this -> details();
                break;
            case 'ajout' : 

                $this -> vue -> formulaire();
                break;
            case 'envoi' :

                $this -> modèle -> envoi();
                $this -> vue -> entréJoueurRéussi();
                break;
        }
    }

    public function details() {
        
        $id = isset($_GET['id']) ? $_GET['id'] : null;

        if ($id !== null) {

            $details = $this -> modèle -> getDetails($id);

            if($details !== null) {
                
                $this -> vue -> affiche_details($details);
            }
            else {
                
                echo 'joueur non conforme';
            }
        }
        else {
            
            echo 'id non conforme';
        }

    }

    public function getAffichage() {

        return $this -> vue -> getAffichage();
    }
}


?>