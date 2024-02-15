<?php


class CompMenu {
    private $menu;

    public function __construct() {
        $this -> menu = '<nav><ul>';
        $this -> menu = '<li><a href="index.php?module=joueurs">Liste des Joueurs</a></li>';
        $this -> menu = '<li><a href="index.php?module=equipes">Liste des Équipes</a></li>';
        $utilisateurConnecte = isset($_SESSION['user_id']); 

        if ($utilisateurConnecte) {
            
            $this -> menu = '<li><a href="index.php?module=connexion&action=deconnexion">Déconnexion</a></li>';
        } 
        else {
            
            $this -> menu = '<li><a href="index.php?module=connexion&action=connexion">Connexion</a></li>';
            $this -> menu = '<li><a href="index.php?module=connexion&action=afficher">Inscription</a></li>';
        }
        
        $this -> menu = '</ul></nav>';
    }

    public function afficheMenu() {
        
        echo $this -> menu;
    }
}


?>