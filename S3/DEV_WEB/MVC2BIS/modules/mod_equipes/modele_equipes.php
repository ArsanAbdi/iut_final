<?php

include_once 'Connexion.php';

class ModèleEquipes extends Connexion {
    
    public function __construct() {
    }

    function getListe() {
        $tab = array();        

        $sqlQuery = 'SELECT * FROM equipes';
        $JoueursStatement = Connexion::$bdd -> prepare($sqlQuery);
        $JoueursStatement -> execute();
        
        return $JoueursStatement->fetchAll(PDO::FETCH_ASSOC);
    }

}

?>