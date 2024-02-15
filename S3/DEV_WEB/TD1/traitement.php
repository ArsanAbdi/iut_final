<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <?php
        
        if (isset($_GET['validation'])) {

            echo "Hello World <br><br><br><br>"; 
            echo "Nom: ". $text = $_GET['text']. "<br>";
            echo "Genre: ". $genre = $_GET['genre']. "<br>";
            echo "CheckBox: ". $checkbox = $_GET['validation'];
            //var_dump($_GET);


        }
        else {

            echo "t'as pas coché la case";
        }

    ?>
</body>
</html>