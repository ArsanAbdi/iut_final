#! /bin/bash


#Affiche « Bonjour »
#Demande le nom de l’utilisateur
#Affiche « Bienvenue [Nom], quel processus voulez-vous rechercher aujourd’hui ? »
#Saisi le nom de processus
#Retrouve dans la table de processus tous les processus dont le nom contient l’élément saisi
#précédemment.



echo "Bonjour"
read -p "Quel est ton nom: " nom
echo "Bienvenue $nom, quel processus voulez-vous recherchez aujourd'hui ?"
read -p "Saisie du nom du processus: " nomprocessus
echo $nomprocessus
ps -ely | grep $nomprocessus
