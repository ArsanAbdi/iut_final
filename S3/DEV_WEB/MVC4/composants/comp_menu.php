<?php


class CompMenu {
    private $menu;

    public function __construct() {


        $this -> menu = '<nav><ul>';

        $this -> menu .= '<li><a href="index.php?module=mod_joueurs">Action Joueurs</a></li>';
        $this -> menu .= '<li><a href="index.php?module=mod_equipes">Action Equipes</a></li>';


        $user = isset($_SESSION['utilisateur']); // Vérifier si l'utilisateur est connecté
        if ($user) {
            
            $this -> menu .= '<li><a href="index.php?module=mod_utilisateurs&action=deconnexion">Déconnexion</a></li>';
        } 
        else {
            
            $this -> menu .= '<li><a href="index.php?module=mod_utilisateurs&action=formulaireConnexion">Connexion</a></li>';
            $this -> menu .= '<li><a href="index.php?module=mod_utilisateurs&action=formulaireInscription">Inscription</a></li>';
        }
        
        $this -> menu .= '</ul></nav>';
    }

    public function afficheMenu() {
        
        echo $this -> menu;
    }
}


?>