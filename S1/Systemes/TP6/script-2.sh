#! /bin/bash

if [ $# -ne 2 ]
then 
echo "arrête respecte les règles et entre deux arguments"
fi
if [ $1 -gt $2 ]
then
echo "$1 est le plus grand."
else 
echo "$1 n'est pas le plus grand."
fi
