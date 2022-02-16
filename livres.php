<?php ob_start() ?>

<table class="table text-center">
  <thead>
    <tr>
      <th>Image</th>
      <th>Titre</th>
      <th>Nombres de pages</th>
      <th colspan="2">Actions</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th><img src="" alt="algo"></th>
      <td class="align-middle">Algorythmique selon H2PROG</td>
      <td class="align-middle">300</td>
      <td class="align-middle"><a href="" class="btn btn-warning">Modifier</a></td>
      <td class="align-middle"><a href="" class="btn btn-danger">Supprimer</a></td>
    </tr>
    <tr>
      <th><img src="" alt="virus"></th>
      <td class="align-middle">Le vrius asiatique</td>
      <td class="align-middle">200</td>
      <td class="align-middle"><a href="" class="btn btn-warning">Modifier</a></td>
      <td class="align-middle"><a href="" class="btn btn-danger">Supprimer</a></td>
    </tr>
  </tbody>
</table>

<a href="" class="btn btn-success d-block">Ajouter</a>

<?php
$titre = "Les livres de la bibliothèque";
$content = ob_get_clean();
require "template.php";