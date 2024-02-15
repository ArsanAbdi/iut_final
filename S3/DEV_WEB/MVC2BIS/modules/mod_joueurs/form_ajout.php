<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>

    <body>

        <form action="index.php?module=mod_joueurs&&action=envoi" method= "POST">

            <label for="texte">

                Nom: <input type="text" name="nom" required maxlength = "20" size= " 30px">
                Bio: <input type="text" name="bio" required maxlength = "20" size= " 30px">

            </label>

            <input type="submit" value= "Ajouter">
        </form>

    
        <?php
        
        
        ?>
    </body>
</html>