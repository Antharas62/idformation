<?php ob_start() ?>

<p>contenu page d'accueil</p>

<?php
$titre = "Bibliothèque MGA";
$content = ob_get_clean();
require "./views/template.view.php";

