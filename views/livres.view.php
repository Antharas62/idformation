<?php
// require "./models/class_livreManager.php";

// $livre1 = new Livre(1,"Algorythmique selon H2PROG",300,"algo.png");
// $livre2 = new Livre(2,"Le virus asiatique",200,"virus.png");
// $livre3 = new Livre(3,"La france du 19ème",100,"france.png");
// $livre4 = new Livre(4,"Le Javascript Client",500,"JS.png");

// $manager = new LivreManager();
// $manager -> chargementLivres();

// $manager -> ajoutLivre($livre1);
// $manager -> ajoutLivre($livre2);
// $manager -> ajoutLivre($livre3);
// $manager -> ajoutLivre($livre4);
?>

<?php ob_start() ?>

<table class="table text-center">
  <thead class="bg-dark text-white">
    <tr>
      <th>Image</th>
      <th>Titre</th>
      <th>Nombres de pages</th>
      <th colspan="2">Actions</th>
    </tr>
  </thead>
  <tbody>
    <?php 
    for ($i=0; $i < count($livres); $i++):?>
    <tr>
      <th><img src="./images/<?= $livres[$i]->getImage() ?>" width="60px"></th>
      <td class="align-middle"><?= $livres[$i] -> getTitre() ?></td>
      <td class="align-middle"><?= $livres[$i] -> getNbPages() ?></td>
      <td class="align-middle"><a href="" class="btn btn-warning">Modifier</a></td>
      <td class="align-middle"><a href="" class="btn btn-danger">Supprimer</a></td>
    </tr>
    <?php endfor ?>
  </tbody>
</table>

<a href="" class="btn btn-success d-block">Ajouter</a>

<?php
$titre = "Les livres de la bibliothèque";
$content = ob_get_clean();
require "./views/template.view.php";

