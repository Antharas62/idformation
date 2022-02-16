<?php
require_once "./models/class_Model.php";
require_once "./models/class_livre.php";


class LivreManager extends Model{
    private $livres = [];

    public function __construct()
    {
        
    }

    public function ajoutLivre($livre){
        $this-> livres[] = $livre;
    }

    public function getLivres(){return $this->livres;}

    public function chargementLivres(){
        $req = $this->getBdd() -> prepare("SELECT * FROM `livres` ORDER BY id_livre");
        $req -> execute();
        $mesLivres = $req->fetchAll(PDO::FETCH_ASSOC);
        $req->closeCursor();

        foreach ($mesLivres as $value) {
            $l = new Livre($value["id_livre"],$value["titre"],$value["nbPages"],$value["image"]);
            $this->ajoutLivre($l);
        }
    }


}

