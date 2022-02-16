<?php
require_once "./controllers/class_livreController.controller.php";
$livreController = new LivreController();

if(empty($_GET["page"])){
    require "./views/accueil.view.php";
} else {
    switch ($_GET["page"]) {
        case 'accueil':
            require "./views/accueil.view.php";
        break;

        case 'livres':
            $livreController->afficherLivres();
        break;
        


        default:
            # code...
        break;
    }
}