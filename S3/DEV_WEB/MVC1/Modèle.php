<?php

include_once 'Connexion.php';

class Modèle extends Connexion {

    public function __construct() {


    }

    public function getListe() {

        $tab = array(

            array("id" => 1, "nom" => 'Zidane'),
            array("id" => 2, "nom" => 'Henry'),
            array("id" => 3, "nom" => 'Mbappe'),
            array("id" => 4, "nom" => 'Rami')
        );

        return $tab;
    }

    public function getVraieListe() {

        $query = 'SELECT * FROM joueurs2';
        $stmt = self :: $bdd -> prepare($query);
        $stmt -> execute();


        //$resultat = self::$bdd -> query($query);

        return $stmt -> fetchAll(PDO :: FETCH_ASSOC);
    }


    /*public function getDescription($id) {

        foreach ($this -> getVraieListe() as $joueur) {

            if ($joueur['id'] == $id) {

                return $joueur['bio'];
            }
        }
        return null;
    }*/

    /*public function getDescription($id) {
        
        $query = "SELECT bio FROM joueurs2 WHERE id = :id";
        $stmt = self::$bdd->prepare($query);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }*/

    public function getDesc($id){
        
        $query = 'SELECT bio FROM joueurs2 WHERE id = :id';
        $stmt = self :: $bdd -> prepare($query);
        $stmt -> bindParam(':id', $id, PDO :: PARAM_INT);
        $stmt -> execute();
    
        return $stmt -> fetch(PDO :: FETCH_ASSOC);
    }

}





?> 