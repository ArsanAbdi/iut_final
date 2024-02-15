<!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Le meilleur site de Football</title>
        </head>
    <body>
        <header>
            <h1>
                Nom Du Site
            </h1>
            <?php $menu -> afficheMenu(); ?>
        </header>

            <?php echo ''.$tampon; ?>
        <main>
            <?php 
                include_once 'index.php';
                if (isset($_SESSION['utilisateur'])) {

                    echo '<a div = "liens1" href="index.php?module=mod_utilisateurs&&action=deconnexion">Action Deconnexion</a></br>';
                }
                else {
                            
                    echo '<a div = "liens1" href="index.php?module=mod_utilisateurs&&action=formulaireConnexion">Action Formulaire Connexion</a><spacer>';
                    echo '<a div = "liens1" href="index.php?module=mod_utilisateurs&&action=formulaireInscription">Action Formulaire inscription</a></br>';
                }
                echo '<a class = "lienFort" href = "index.php?module=mod_joueurs">Action Module Joueurs</a>';
                echo '<a class = "lienFort" href = "index.php?module=mod_equipes">Action Module Equipes</a>';
                echo '<a class = "lienFort" href = "index.php?module=mod_utilisateurs">Action Module Utilisateurs</a>';
                echo '</br>';
                echo $tampon;

            ?>
        </main>
        <footer>

            <ul>
                <li>
                    Contact: aabdi@iut.univ-paris8.fr
                </li>
                <li>
                    Informations Légales: RGPD
                </li>
                <li>
                    Politique de Confidentialité
                </li>
            </ul>
        </footer>
    </body>
</html>


