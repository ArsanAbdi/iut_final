<?php

include_once 'Connexion.php';

class ModèleJoueurs extends Connexion {

    public function __construct() {


    }

    public function getListe() {

        $tab = self :: $bdd -> query("SELECT * FROM joueurs2");
        return $tab->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getDetails($id) {
        
        $stmt = self :: $bdd -> prepare('SELECT bio FROM joueurs2 WHERE id = :id');
        $stmt -> bindParam(':id', $id, PDO::PARAM_INT);
        $stmt -> execute();
        return $stmt -> fetch(PDO::FETCH_ASSOC);
    }

    public function envoi() {

        if(!empty($_POST['nom']) && !empty($_POST['bio'])) {

            $nom = $_POST['nom'];
            $bio = $_POST['bio'];

            $énoncéRequete = "INSERT INTO joueurs2 (nom, bio) VALUES (:nom, :bio)";

            $requete = self :: $bdd -> prepare($énoncéRequete);
            $requete -> bindValue(':nom', $nom);
            $requete -> bindValue(':bio', $bio);

            $requete -> execute();

        }
    }

}

?>