<!DOCTYPE html>

<html lang = "en">
    <head>
        <meta charset = "UTF-8">
        <meta name = "viewport" content = "width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <body>

        <form action = "index.php?module=mod_utilisateurs&&action=connexion" method = "POST">

            <label for = "texte">
                C'est l'heure de la CONNEXION à votre compte:</br>

                Nom d'utilisateur: <input type = "text" name = "user" required maxlength = "20" size = " 30px">
                Mot de passe: <input type = "password" name = "motdepasse" required maxlength = "20" size = " 30px">

            </label>
            <input type = "submit" value = "Se connecter">
        </form>
        
    </body>
</html>