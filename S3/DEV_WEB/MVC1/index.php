<?php

include_once 'Connexion.php';
include_once 'Controleur.php';
include_once 'Modèle.php';
include_once 'Vue.php';

Connexion :: initConnexion();

$controleur = new Controleur();
$controleur -> exec();

?>