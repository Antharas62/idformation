<?php
require_once "./models/class_livreManager.php";

class LivreController{
    private $livreManager;

    public function __construct()
    {
        $this->livreManager = new LivreManager();
        $this->livreManager -> chargementLivres();
    }

    public function afficherLivres(){
        $livres = $this->livreManager -> getLivres();
        require "./views/livres.view.php";
    }

}