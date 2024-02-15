<?php

class VueEquipes {

    public function __construct() {
    }

    function menu() {
            
            echo '<br> <a href="index.php?module=mod_equipes&&action=bienvenue">Bienvenue</a> <br>';
            echo '<a href="index.php?module=mod_equipes&&action=liste">Liste</a> <br>'; 
    }

    function afficheListe ($arr) {
        foreach($arr as $key => $value){
            echo $key. "<br>";
            if(is_array($value)){
                foreach($value as $key => $value){
                     echo $key." : ".$value."<br>";

                }

            }

            echo "<br>";

          }
    
    }

}

?>