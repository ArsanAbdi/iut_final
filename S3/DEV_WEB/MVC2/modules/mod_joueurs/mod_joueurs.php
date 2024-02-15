<?php

require_once 'cont_joueurs.php';
require_once 'vue_joueurs.php';
require_once 'modele_joueurs.php';

class ModJoueurs {

    private $contJoueurs;
    private $vueJoueurs;
    private $modeleJoueurs;
    private $action;

    public function __construct($action) {

        $this -> contJouers = new ContJoueurs();
        $this -> vueJoueurs = new VueJoueurs();
        $this -> modeleJoueurs = new ModeleJoueurs();
        $this -> action = $action;
    }


    public function exec() {
        switch($this->action) {

            case 'bienvenue':

                $this->contJoueurs->bienvenue();
                break;

            case 'liste':

                $this->contJoueurs->liste();
                break;

            case 'details':

                $this->contJoueurs->details();
                break;

            default:

                $this->vueJoueurs->menu();
                break;
        }
    }
}

?>