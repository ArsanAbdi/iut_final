<?php

include_once 'Connexion.php';

class ModèleEquipes extends Connexion {
    
    public function __construct() {

    }

    function getListe() {
        
        $tab = array();        

        $sqlQuery = 'SELECT * FROM equipes';
        $equipeStatement = Connexion::$bdd -> prepare($sqlQuery);
        $equipeStatement -> execute();
        
        return $equipeStatement -> fetchAll(PDO::FETCH_ASSOC);
    }

    public function envoi() {


        if(!empty($_POST['nom']) && !empty($_POST['annee']) && !empty($_POST['pays']) && !empty($_POST['desc'])) {

            $nom = $_POST['nom'];
            $année = $_POST['annee'];
            $pays = $_POST['pays'];
            $desc = $_POST['desc'];

            if($_FILES['logo']['error'] === UPLOAD_ERR_OK) {

                $logo_tmp_name = $_FILES['logo']['tmp_name'];
                $logo_name = $_FILES['logo']['name'];
                $upload_dir = 'modules/mod_equipes/logos/'; // Remplacez par le chemin vers votre dossier logos
            }

            if (move_uploaded_file($logo_tmp_name, $upload_dir . $logo_name)) {

                $énoncéRequete = "INSERT INTO equipes (nom, annee_creation, pays, logo, description) VALUES (:nom, :annee, :pays, :logo, :desc)";

                $requete = self :: $bdd -> prepare($énoncéRequete);
                $requete -> bindValue(':nom', $nom);
                $requete -> bindValue(':annee', $année);
                $requete -> bindValue(':pays', $pays);
                $requete -> bindValue(':logo', $upload_dir . $logo_name);
                $requete -> bindValue(':desc', $desc);
    
                $requete -> execute();
            }

        }
    }

    public function getDetails($id) {
        
        $stmt = self :: $bdd -> prepare('SELECT nom, annee_creation, pays, logo, description FROM equipes WHERE id = :id');
        $stmt -> bindParam(':id', $id, PDO::PARAM_INT);
        $stmt -> execute();
        return $stmt -> fetch(PDO::FETCH_ASSOC);
    }

}    
?>