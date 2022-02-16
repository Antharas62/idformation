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

    public function getLivreById($id){
        foreach ($this->livres as $value) {
            if($value->getId() === $id){
                return $value;
            }
        }
    }

    public function ajoutLivreBd($titre,$nbPages,$image){
        $req = "
        INSERT INTO livres (titre, nbPages, image)
        values (:titre, :nbPages, :image)";
        $stmt = $this->getBdd()->prepare($req);
        $stmt->bindValue(":titre",$titre,PDO::PARAM_STR);
        $stmt->bindValue(":nbPages",$nbPages,PDO::PARAM_INT);
        $stmt->bindValue(":image",$image,PDO::PARAM_STR);
        $resultat = $stmt->execute();
        $stmt->closeCursor();

        if($resultat > 0){
            $livre = new Livre($this->getBdd()->lastInsertId(),$titre,$nbPages,$image);
            $this->ajoutLivre($livre);
        }        
    }

    public function suppressionLivreBD($id){
        $req = "
        DELETE FROM livres WHERE id_livre = :idLivre
        ";
        $stmt = $this->getBdd()->prepare($req);
        $stmt->bindValue(":idLivre",$id,PDO::PARAM_INT);
        $resultat = $stmt->execute();
        $stmt->closeCursor();
        if($resultat > 0){
            $livre = $this->getLivreById($id);
            unset($livre);
        }
    }

    public function modificationLivreBD($id,$titre,$nbPages,$image){
        $req = "
        update livres 
        set titre = :titre, nbPages = :nbPages, image = :image
        where id_livre = :id";
        $stmt = $this->getBdd()->prepare($req);
        $stmt->bindValue(":id",$id,PDO::PARAM_INT);
        $stmt->bindValue(":titre",$titre,PDO::PARAM_STR);
        $stmt->bindValue(":nbPages",$nbPages,PDO::PARAM_INT);
        $stmt->bindValue(":image",$image,PDO::PARAM_STR);
        $resultat = $stmt->execute();
        $stmt->closeCursor();

        if($resultat > 0){
            $this->getLivreById($id)->setTitre($titre);
            $this->getLivreById($id)->setTitre($nbPages);
            $this->getLivreById($id)->setTitre($image);
        }
    }




}

