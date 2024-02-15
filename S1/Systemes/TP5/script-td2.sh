#! /bin/bash

# Affiche « Bonjour [Prénom] [Nom] 
# Affiche « Je suis le script [Nom du script]
# Cherche tous les fichiers contenant votre prénom
# Cherche tous les fichiers contenant votre nom

echo "Bonjour $1 $2"
echo "Je suis le script $0"
cd ~/prive
find -type f -name "*tp*"
