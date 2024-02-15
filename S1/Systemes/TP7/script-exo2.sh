#! /bin/bash

if [ $# -ne 2 ]
 then 
  echo "Syntaxe du script $0 mauvaise. Il faut deux arguments."
 exit 1
fi

[ $1 -eq $1 ] 2>> /dev/null
if [ $? -ne 0 ]
 then 
  echo "Syntaxe du script $0 mauvaise. Il faut un entier pour $1."
 exit 2
fi

if [ $1 -lt 0 ]

 then 
  echo "Syntaxe du script $0 mauvaise. Il ne faut pas que $1 < 0."
 exit 3
fi

[ $2 -eq $2 ] 2>> /dev/null
if [ $? -ne 0 ]
 then 
  echo "Syntaxe du script $0 mauvaise. Il faut un entier pour $2."
 exit 4
fi

if [ $2 -lt 0 ]
 then 
  echo "Syntaxe du script $0 mauvaise. Il ne faut pas que $2 < 0."
 exit 5
fi

if [ $1 -gt $2 ]
 then
  debut=$2
  fin=$1
else 
  debut=$1
  fin=$2
fi

for i in `seq $debut $fin`
 do ((compteur=$compteur+$i))
done
 echo "$compteur"
exit 0
