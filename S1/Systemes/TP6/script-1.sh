#! /bin/bash


if [ $# -ne 1 ]
then
echo “SYNTAXE : $0 TP06”
else
echo 'ls $1'
echo "ls $1"
echo `ls $1`
fi
