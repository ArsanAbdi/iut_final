-- Création de tables sans contraintes

DROP TABLE IF EXISTS Club, Pers, Groupe, GroupePers, Resa; 

CREATE TABLE Club (
   idClub INTEGER, 
   nom VARCHAR(30),
   ville VARCHAR(30),
   etoile INTEGER,
   capacite INTEGER
   );

CREATE TABLE Pers (
   idPers INTEGER  , 
   nom VARCHAR(30),
   age INTEGER,
   ville VARCHAR(30) 
   );

CREATE TABLE Groupe (
   idGrp INTEGER,
   activite VARCHAR(30) 
   );

CREATE TABLE GroupePers (
   idGrp INTEGER ,
   idPers INTEGER 
   );

CREATE TABLE Resa (
   idGrp INTEGER,
   idClub INTEGER,
   nbJour INTEGER,
   mois VARCHAR(30)
   );



