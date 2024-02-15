<?php

include_once 'modules/mod_joueurs/mod_joueurs.php';
include_once 'modules/mod_equipes/mod_equipes.php';

$actionindex = (isset($_GET['module'])) ? $_GET['module'] : 'index.php';

switch($actionindex){
    case 'mod_joueurs' :
        echo '<br><a href="index.php">RetourIndex</a><br><br>';
        $module = New ModJoueurs();
        break;
    case 'mod_equipes' :
        echo '<br><a href="index.php">RetourIndex</a><br>';
        $module = new ModEquipes();
        break;
    default :
        echo '<br><a href="index.php?module=mod_joueurs">Action Module 1</a><br>';
        echo '<a href="index.php?module=mod_equipes">Action Module 2</a><br>';
        break;
}


?>
