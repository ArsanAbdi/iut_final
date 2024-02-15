<?php

class Connexion {

    protected static $bdd;

    public static function initConnexion() {
        
        $dsn = 'mysql:host=database-etudiants.iut.univ-paris8.fr;dbname=dutinfopw201610';
        $user = 'dutinfopw201610';
        $mdp = 'tanehyhu';

        try {
            
            self :: $bdd = new PDO($dsn, $user, $mdp);
        } catch (PDOException $e) {
            
            die('Erreur de connexion : ' . $e -> getMessage());
        }
    }
}

?>