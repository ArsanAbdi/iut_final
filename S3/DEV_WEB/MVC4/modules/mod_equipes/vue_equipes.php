<?php
include_once 'vue_generique.php';

class VueEquipes extends VueGenerique {

    public function __construct() {


    }

    function menu() {
            
            echo '<br> <a href="index.php?module=mod_equipes&&action=bienvenue">Action Bienvenue</a> <br>';
            echo '<a href="index.php?module=mod_equipes&&action=ajout_equipes">Action Formulaire</a> <br>'; 
            echo '<a href="index.php?module=mod_equipes&&action=liste">Liste</a> <br>'; 
    }

    function affiche_details_team($arr) {
        
        foreach($arr as $key => $value) {

            if($key == "logo") {

                echo $key. ":" . '<img src="' . $value .'">';
            }
            else  {

                echo $key . " : " . $value;
            }
            echo "<br>";
        }
    }    

    public function affiche_liste($tab) {

        foreach($tab as $team) {

            echo '<a href="index.php?module=mod_equipes&&action=details&&id=' . $team['id'] . '">' . $team['nom'] . '</a><br>'; 
        }
    }
    public function bienvenue() {
        
        echo 'Bienvenue';
    }

    public function formulaire() {
        
        include_once 'form_ajout.php';
    }

}

?>