<?php

include_once 'Connexion.php';

class ModèleUtilisateurs extends Connexion {

    public function __construct() {


    }

    /*public function envoi() {

        if(!empty($_POST['user']) && !empty($_POST['motdepasse'])) {

            $login = $_POST['user'];
            $mdp = $_POST['motdepasse'];
            $mdpHash = password_hash($mdp, PASSWORD_DEFAULT);

            $énoncéRequete = "INSERT INTO utilisateurs (login, mdp) VALUES (:user, :motdepasse)";

            $requete = self :: $bdd -> prepare($énoncéRequete);
            $requete -> bindValue(':user', $login);
            $requete -> bindValue(':motdepasse', $mdpHash);

            return $requete -> execute();
        }
    }*/

    public function envoi() {
        if(!empty($_POST['user']) && !empty($_POST['motdepasse'])) {
            $login = $_POST['user'];
            $mdp = $_POST['motdepasse'];

            // Vérifier si l'utilisateur existe déjà
            if ($this->utilisateurExiste($login)) {
                // L'utilisateur existe déjà, retourner false ou un code d'erreur
                return false;
            }

            $mdpHash = password_hash($mdp, PASSWORD_DEFAULT);
            $énoncéRequete = "INSERT INTO utilisateurs (login, mdp) VALUES (:user, :motdepasse)";
            $requete = self :: $bdd -> prepare($énoncéRequete);
            $requete -> bindValue(':user', $login);
            $requete -> bindValue(':motdepasse', $mdpHash);

            return $requete -> execute();
        }
        // Si les champs ne sont pas remplis, retourner false ou un code d'erreur
        return false;
    }

    // Une nouvelle méthode pour vérifier si l'utilisateur existe déjà
    private function utilisateurExiste($login) {
        $énoncéRequête = "SELECT COUNT(*) FROM utilisateurs WHERE login = :user";
        $requête = self :: $bdd -> prepare($énoncéRequête);
        $requête -> bindParam(':user', $login, PDO::PARAM_STR);
        $requête -> execute();

        $nombreUtilisateurs = $requête -> fetchColumn();
        return $nombreUtilisateurs > 0;
    }

    public function connexion() {

        if(!empty($_POST['user']) && !empty($_POST['motdepasse'])) {

            $login = $_POST['user'];
            $mdp = $_POST['motdepasse'];

            $énoncéRequête = "SELECT mdp FROM utilisateurs WHERE login = :user";
            $requête = self :: $bdd -> prepare($énoncéRequête);
            $requête -> bindParam(':user', $login, PDO::PARAM_STR);
            $requête -> execute();

            $resultat = $requête -> fetch(PDO::FETCH_ASSOC);
            $mdpHash = $resultat['mdp'];


            if (password_verify($mdp, $mdpHash)) {

                $_SESSION['utilisateur'] = $login;
            }
        }
    }
}

?>