--------------
--- ABDI Arsan
--- TP n*2
--------------
--- Exo 1 ----

--partie 1--

DROP SCHEMA IF EXISTS vac CASCADE;

CREATE SCHEMA vac;

--DROP TABLE IF EXISTS Club, Pers, Groupe, GroupePers, Resa; 

CREATE TABLE vac.Club (
   idClub INTEGER, 
   nom VARCHAR(30),
   ville VARCHAR(30),
   etoile INTEGER,
   capacite INTEGER,

   CONSTRAINT pK_Club PRIMARY KEY (idClub)
   );

CREATE TABLE vac.Pers (
   idPers INTEGER  , 
   nom VARCHAR(30),
   age INTEGER,
   ville VARCHAR(30) ,

   CONSTRAINT pK_Pers PRIMARY KEY (idPers)
   );

CREATE TABLE vac.Groupe (
   idGrp INTEGER,
   activite VARCHAR(30) ,

   CONSTRAINT pK_Grp PRIMARY KEY (idGrp)
   );

CREATE TABLE vac.GroupePers (
   idGrp INTEGER ,
   idPers INTEGER ,

   CONSTRAINT fK_GroupePers_Groupe FOREIGN KEY (idGrp) REFERENCES vac.Groupe(idGrp),
   CONSTRAINT fK_GroupePers_Pers FOREIGN KEY (idPers) REFERENCES vac.Pers(idPers),

   CONSTRAINT pK_GroupePers PRIMARY KEY (idGrp, idPers)
   );

CREATE TABLE vac.Resa (
   idGrp INTEGER,
   idClub INTEGER,
   nbJour INTEGER,
   mois VARCHAR(30),

   CONSTRAINT fK_Resa_Groupe FOREIGN KEY (idGrp) REFERENCES vac.Groupe(idGrp),
   CONSTRAINT fK_Resa_Club FOREIGN KEY (idClub) REFERENCES vac.Club(idClub),

   CONSTRAINT pK_Resa PRIMARY KEY (idGrp, idClub)
   );

SET search_path TO vac public;

INSERT INTO vac.Pers VALUES (20, 'John' , 50, 'Narbonne'); 
INSERT INTO vac.Pers VALUES (21, 'Leila' , 30, 'Narbonne'); 
INSERT INTO vac.Pers VALUES (22, 'Fabrice' , 18, 'Lille'); 
INSERT INTO vac.Pers VALUES (23, 'Alice' , 15, 'Narbonne'); 
INSERT INTO vac.Pers VALUES (24, 'Marie' , 17, 'Toulon'); 
INSERT INTO vac.Pers VALUES (25, 'Farid' , 48, 'Toulon'); 
INSERT INTO vac.Pers VALUES (26, 'Pierre' , 60, 'Lille'); 
INSERT INTO vac.Pers VALUES (27, 'Lydie' , 38, 'Montreuil'); 


INSERT INTO vac.Club VALUES(31,'Le soleil du midi', 'Narbonne', 4, 100);
INSERT INTO vac.Club VALUES(32,'Le pavillon bleu', 'Narbonne', 4, 150);
INSERT INTO vac.Club VALUES(33,'Le fun nautique', 'Narbonne', 5, 60);
INSERT INTO vac.Club VALUES(34,'Le nordiste', 'Lille', 4, 150);
INSERT INTO vac.Club VALUES(35,'Le vent marin', 'Toulon', 3, 100);
INSERT INTO vac.Club VALUES(36,'Le sable fin', 'Toulon', 5, 110);

INSERT INTO vac.Groupe VALUES(101,'Randonnée');
INSERT INTO vac.Groupe VALUES(102,'Baignade');
INSERT INTO vac.Groupe VALUES(103,'Pêche');
INSERT INTO vac.Groupe VALUES(104,'Cyclisme');
INSERT INTO vac.Groupe VALUES(105,'Pétanque');

INSERT INTO vac.GroupePers VALUES(101,20);
INSERT INTO vac.GroupePers VALUES(101,26);
INSERT INTO vac.GroupePers VALUES(102,20);
INSERT INTO vac.GroupePers VALUES(102,21);
INSERT INTO vac.GroupePers VALUES(102,23);
INSERT INTO vac.GroupePers VALUES(103,24);
INSERT INTO vac.GroupePers VALUES(103,25);
INSERT INTO vac.GroupePers VALUES(104,22);
INSERT INTO vac.GroupePers VALUES(104,23);
INSERT INTO vac.GroupePers VALUES(104,24);
INSERT INTO vac.GroupePers VALUES(105,20);

INSERT INTO vac.Resa VALUES(102, 33, 3, 'mai');
INSERT INTO vac.Resa VALUES(105, 31, 3, 'juin');
INSERT INTO vac.Resa VALUES(105, 32, 2, 'avril');
INSERT INTO vac.Resa VALUES(103, 36, 2, 'avril');
INSERT INTO vac.Resa VALUES(103, 34, 4, 'mai');
INSERT INTO vac.Resa VALUES(103, 33, 3, 'juin');
INSERT INTO vac.Resa VALUES(104, 32, 3, 'juin');


--partie 2--

--Rajoutez une personne qui s’appelle Bruno, qui a 33 ans et habite Nice.--

INSERT INTO Pers VALUES(28, 'Bruno', 33, 'Nice');

--Donnez les noms des clubs d’au moins 3 étoiles et réservés en juin pour au plus 4 jours.--

SELECT nom FROM Club NATURAL JOIN Resa WHERE etoile >= 3 AND nbjour <= 4 AND mois ='juin';

--Donnez les noms des personnes qui ont fait une réservation d’au moins 4 jours.--

SELECT nom  FROM Resa NATURAL JOIN GroupePers NATURAL JOIN Pers  WHERE nbjour >= 4;

--Donnez les noms des personnes ayant réservé dans un club dont le nom contient le mot ‘soleil’.--

SELECT p.nom FROM Club c NATURAL JOIN Resa r NATURAL JOIN GroupePers g INNER JOIN Pers p using(idPers) WHERE c.nom LIKE '%soleil%';

