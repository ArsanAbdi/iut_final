<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);

session_start(); //la session est initialisée.
include_once 'modules/mod_joueurs/mod_joueurs.php';
include_once 'modules/mod_equipes/mod_equipes.php';
include_once 'modules/mod_utilisateurs/mod_utilisateurs.php';
require_once 'Connexion.php';
require_once 'composants/comp_menu.php';

Connexion :: initConnexion();

$actionindex = (isset($_GET['module'])) ? $_GET['module'] : 'index.php';
$tampon = '';
$module = null;

switch($actionindex) {

    case 'mod_joueurs' :

        $module = New ModJoueurs();
        break;

    case 'mod_equipes' :
        
        $module = new ModEquipes();
        break;

    case 'mod_utilisateurs' :
        
        $module = new ModUtilisateurs();
        break;
}

if ($module !== null) {

    $tampon = $module -> getAffichage();
}

$menu = new CompMenu();
include_once 'index2.php';
?>