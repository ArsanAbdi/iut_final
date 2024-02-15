<?php

include_once 'vue_utilisateurs.php';
include_once 'modele_utilisateurs.php';


class ContUtilisateurs {

    private $modèleUtilisateurs;
    private $vueUtilisateurs;
    private $action;

    public function __construct() {

        $this -> modèleUtilisateurs = new ModèleUtilisateurs();
        $this -> vueUtilisateurs = new VueUtilisateurs();
        $this -> action = isset($_GET['action']) ? $_GET['action'] : '';
    }

    public function inscription() {

        $result = $this -> modèleUtilisateurs -> envoi();

        if($result) {

            $this -> vueUtilisateurs -> inscriptionRéussie();
        }
        else {

            $this -> vueUtilisateurs -> inscriptionÉchouée();
        }
    }

    public function deconnexion() {
        
        unset($_SESSION['utilisateur']);
    }

    public function exec() {

        $this -> vueUtilisateurs -> menu();
        switch($this -> action) {

            case 'bienvenue' : 

                $this -> vueUtilisateurs -> bienvenue();
                break;

            case 'formulaireInscription' :
                
                $this -> vueUtilisateurs -> formulaireInscription();
                break;

            case 'formulaireConnexion' :

                $this -> vueUtilisateurs -> formulaireConnexion();
                break;

            case 'envoi' :

                //$this -> modèleUtilisateurs -> envoi();
                $this -> inscription();
                break;

            case 'connexion' :
                
                $this -> modèleUtilisateurs -> connexion();
                break;

            case 'deconnexion' :

                $this -> deconnexion();
                break;
        }
    }


    public function getAffichage() {

        return $this -> vueUtilisateurs -> getAffichage();
    }

}
?>