<!DOCTYPE html>

<html lang = "en">
    <head>
        <meta charset = "UTF-8">
        <meta name = "viewport" content = "width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>

    <body>

        <form action="index.php?module=mod_equipes&&action=envoi" method="POST" enctype="multipart/form-data">

            <label for = "texte">

                Nom de l'équipe:   <input type = "text" name = "nom" required maxlength = "30" size = " 30px"><br>
                Année de création: <input type = "date" name = "annee" required maxlength = "20" size = " 30px"><br>
                Pays:              <input type = "text" name = "pays" required maxlength = "20" size = " 30px"><br>
                Logo de l'équipe:  <input type = "file" name = "logo" required maxlength = "300" size = " 30px"><br>
                Description:       <input type = "text" name = "desc" required size = " 30px">
            </label>

            <input type = "submit" value = "Ajouter">
        
        </form>
    </body>
</html>