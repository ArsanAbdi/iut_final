<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    
    <body>
    

    <?php

        $bdd = new PDO('mysql:host=database-etudiants.iut.univ-paris8.fr;dbname=dutinfopw201610', 'dutinfopw201610', 'tanehyhu');

        if(!empty($_GET['texte'])) {

            $texte = $_GET['texte'];

            $énoncéRequete = "INSERT INTO tabletest (texte) VALUES (:text)";

            $requete = $bdd->prepare($énoncéRequete);
            $requete->bindValue(':text', $texte);

            $requete->execute();

        }
    ?>

    </body>
</html>