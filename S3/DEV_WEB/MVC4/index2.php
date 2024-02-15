<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Le meilleur site de Football</title>
    <link rel="stylesheet" href="bonsoir2.css">
</head>
<body>
    <header>
        
        <a href="http://localhost/~aabdi/MVC4/index.php"><h1>Nom Du Site</h1></a>
        <?php $menu->afficheMenu(); ?>
    </header>

    <div class="container">
        <main>
            <?php echo $tampon; ?>
        </main>
    </div>

    <footer>
        <ul>
            <li>Contact: aabdi@iut.univ-paris8.fr</li>
            <li>Informations Légales: RGPD</li>
            <li>Politique de Confidentialité</li>
        </ul>
    </footer>
</body>
</html>

