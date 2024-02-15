<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <?php

        $dsn = 'mysql:host=database-etudiants.iut.univ-paris8.fr;dbname=dutinfopw201610';
        $user = 'dutinfopw201610';
        $password = 'tanehyhu';
        $bdd = new PDO($dsn, $user, $password);

        try {

            $requete = $bdd->query("SELECT * FROM tabletest");
            $resultats = $requete->fetchALL(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {

            echo "Erreur de connexion à la base de données : " . $e->getMessage();
        }

        // Affichage des résultats
        foreach ($resultats as $ligne) {
            
            foreach ($ligne as $colonne => $valeur) {
                
                echo "$colonne : $valeur<br>";
            }
            echo "<br>";
        }

        /*$php = 'SELECT id, texte, FROM tabletest WHERE id= :num';
        $sth = $bdd->prepare($php, [PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY]);
        $sth->execute(['num' => 1]);
        $red = $sth->fetchAll();
        */


    ?>
</body>
</html>
