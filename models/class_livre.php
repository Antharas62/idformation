<?php

class Livre{
  private $id;
  private $titre;
  private $nbPages;
  private $image;

  public function __construct($id,$titre,$nbPages,$image)
  {
    $this->id = $id;
    $this->titre = $titre;
    $this->nbPages = $nbPages;
    $this->image = $image;
  }

  public function getId(){return $this->id;}

  public function getTitre(){return $this->titre;}
  public function setTitre($title){return $this->titre = $title;}

  public function getNbPages(){return $this->nbPages;}
  public function setNbPages($page){return $this->nbPages = $page;}

  public function getImage(){return $this->image;}
  public function setImage($image){return $this->image = $image;}
}