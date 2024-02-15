<?php

class VueJoueurs {

    public function __construct() {


    }

    public function affiche_liste_complete($tableau) {

        foreach ($tableau as $valTab) {

            //echo '<br>' . $valTab['id'] . ' - ' . $valTab['nom'] . ' - ' . $valTab['bio'];
            echo "<br> <a href='index.php?action=details&id={$valTab['id']}'>" . $valTab['id'] . ' - ' . $valTab['nom'] . ' - ' . $valTab['bio'] . '</a><br>';        }
    }

    public function affiche_liste_sans_details($tableau) {

        foreach ($tableau as $valTab) {

            //echo '<br>' . $valTab['id'] . ' - ' . $valTab['nom'] . ' - ' . $valTab['bio'];
            echo "<br> <a href='index.php?action=details&id={$valTab['id']}'>" . $valTab['id'] . ' - ' . $valTab['nom'] . '</a><br>';}
    }

    public function menu() {

        echo "<a href = 'index.php?action=bienvenue'> Bienvenue à vous </a> <br>";
        echo "<a href = 'index.php?action=liste'> L'affichage de la liste </a> <br>";
    }

    /*public function affiche_bio($tableau) {

        foreach ($tableau as $valTab) {

            echo $valTab['bio'];
        }
    }*/

    public function affiche_bio($details) {
        
        echo '<br><br> bio du joueur: ' . $details['bio'] . '</p>';
    }
}

$tab = array(

    array("id" => 1, "nom" => 'Zidane'),
    array("id" => 2, "nom" => 'Henry'),
    array("id" => 3, "nom" => 'Mbappe'),
    array("id"=> 4, "nom" => 'Rami')

);

//$vue = new VueJoueurs();

//$vue -> affiche_liste($tab);



?>