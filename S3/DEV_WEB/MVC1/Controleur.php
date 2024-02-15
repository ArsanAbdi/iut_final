<?php

include_once 'Modèle.php';
include_once 'Vue.php';

class Controleur {

    private $modèle;
    private $vue;
    private $action;

    public function __construct() {

        $this -> modèle = new Modèle();
        $this -> vue = new Vue();
        $this -> action = isset($_GET['action']) ? $_GET['action'] : 'bienvenue';

    }

    public function liste() {

        //$this -> vue -> affiche_liste($this -> modèle -> getListe());
        $this -> vue -> affiche_liste_sans_details($this -> modèle -> getVraieListe());

    }

    public function bienvenue() {
        
        echo ' <br> bienvenue';
    }

    public function exec() {

        $this->vue->menu();
        switch($this->action){

            case 'bienvenue':

                $this -> bienvenue();
                break;

            case 'liste':

                $this -> liste();
                break;

            case 'details':

                $this -> details();
                break;

            default:
                $this -> menu();
                break;
        }
    }

    /*public function details() {

        $this -> vue -> affiche_bio($this -> modèle -> getVraieListe());
    }*/

    /*public function details() {
        
        // Récupérez l'ID du joueur à partir des paramètres de l'URL
        $idJoueur = isset($_GET['id']) ? $_GET['id'] : null;
    
        if ($idJoueur !== null) {
            // Appelez la méthode getDescription() du modèle avec l'ID du joueur
            $descriptionJoueur = $this->modèle->getDescription($idJoueur);
    
            if ($descriptionJoueur !== null) {
                // Utilisez la vue pour afficher la description du joueur
                $this->vue->affiche_bio($descriptionJoueur);
            } else {
                // Gérer le cas où le joueur n'a pas été trouvé
                echo "Joueur non trouvé.";
            }
        } else {
            // Gérer le cas où l'ID du joueur n'est pas spécifié
            echo "ID du joueur non spécifié.";
        }
    }*/


    /*public function details() {
        
        if (isset($_GET['id'])) {
            
            $id = $_GET['id'];
            $joueur = $this->modèle->getDescription($id);
            if ($joueur) {
                
                $this->vue->affiche_bio($joueur);
            } 
            else {
                
                echo "Joueur introuvable.";
            }
        } 
        else {
            
            echo "ID du joueur non spécifié.";
        }
    }*/


    public function details(){
        
        $id = isset($_GET['id']) ? $_GET['id'] : null;

        if ($id !== null){
            
            $details = $this -> modèle -> getDesc($id);

            if($details !== null){
                
                $this -> vue -> affiche_bio($details);
            }
        }
        else {
            
            echo 'id null';
        }
    }
}



?>