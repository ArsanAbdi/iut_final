#! /bin/bash


echo "Script $0 - Nombre d'arguments : $#"
echo "Bonjour $1"
echo "Vous avez demandé le listing du repertoire $2"
cd $2
ls
echo "Le script est à présent terminé"
#ça ne sera pas lu

# role de $# ça renvoie le nombre d'arguments
# role de $0 afficher le nom du script
# role de $1 de renvoyer mon prénom 
# role de $2 aller dans le repertoire racine
