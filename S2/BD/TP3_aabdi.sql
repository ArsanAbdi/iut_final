
DROP SCHEMA if exists vac cascade ;

CREATE SCHEMA vac;

SET SEARCH_PATH = vac;

-- DROP TABLE IF EXISTS Club, Pers, Groupe, GroupePers, Resa CASCADE;

CREATE TABLE vac.Club (
   idClub INTEGER PRIMARY KEY, 
   nom VARCHAR(30),
   ville VARCHAR(30),
   etoile INTEGER NOT NULL,
   capacite INTEGER NOT NULL 
);

CREATE TABLE vac.Pers (
   idPers INTEGER PRIMARY KEY, 
   nom VARCHAR(30),
   age INTEGER NOT NULL,
   ville VARCHAR(30) 
);

CREATE TABLE vac.Groupe (
   idGrp INTEGER PRIMARY KEY,
   activite VARCHAR(30) 
);

CREATE TABLE vac.GroupePers (
   idGrp INTEGER REFERENCES vac.Groupe(idGrp),
   idPers INTEGER REFERENCES vac.Pers(idPers),
   PRIMARY KEY (idPers, idGrp) 
);

CREATE TABLE vac.Resa (
   idGrp INTEGER REFERENCES vac.Groupe(idGrp),
   idClub INTEGER REFERENCES vac.Club(idClub),
   nbJour INTEGER,
   mois VARCHAR(30),
   PRIMARY KEY (idGrp, idClub) 
);


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



--1--
SELECT DISTINCT a.nom FROM Club a INNER JOIN Pers b using(ville);
SELECT DISTINCT a.nom FROM Club a INNER JOIN Pers b ON a.ville = b.ville;
SELECT nom FROM Club WHERE ville in (SELECT ville FROM Pers);
--2--
SELECT nom FROM Pers WHERE nom LIKE '%e' UNION (SELECT nom FROM Club LIMIT 4);
--3--
SELECT nom FROM Club EXCEPT SELECT nom FROM Club NATURAL JOIN Resa;
--4--
SELECT idGrp FROM Resa NATURAL JOIN Club EXCEPT SELECT idGrp FROM Resa NATURAL JOIN Club WHERE ville != 'Narbonne';
--5--
SELECT nom FROM Club NATURAL JOIN Resa GROUP BY nom HAVING count(nom) > 1;
--6--
SELECT a.nom, b.nom FROM Pers a NATURAL JOIN GroupePers NATURAL JOIN Resa INNER JOIN Club b using(idClub) GROUP BY a.nom, b.nom
EXCEPT (SELECT b.nom FROM Pers NATURAL JOIN GroupePers NATURAL JOIN Resa INNER JOIN Club b using(idClub) 
INTERSECT SELECT b.nom FROM Pers a NATURAL JOIN GroupePers NATURAL JOIN Resa INNER JOIN Club b using(idClub) WHERE a.nom = 'Leila');
--7--
SELECT DISTINCT p.nom, c.nom FROM Pers p NATURAL JOIN GroupePers NATURAL JOIN Resa INNER JOIN Club c using(idClub) WHERE c.nom != (SELECT c.nom FROM Club c NATURAL JOIN Resa NATURAL JOIN GroupePers INNER JOIN Pers p using(idPers) WHERE p.nom = 'Leila');



--TP4--

SELECT nom, avg(etoile) OVER() FROM Club;
SELECT nom, sum(capacite) OVER() FROM Club;
SELECT nom, ville, min(etoile) OVER (partition by ville) FROM Club;
SELECT ville, nom, avg(capacite) OVER (partition by ville) FROM Club;
SELECT nom, min(age) OVER (), max(age) OVER () FROM Pers;
SELECT idClub, avg(nbJour) OVER (partition by mois) FROM Club NATURAL JOIN Resa;
SELECT nom, FLOOR(avg(etoile) OVER ()) FROM Club;
SELECT nom, ville, etoile - min(etoile) OVER (partition by ville) FROM Club;
SELECT nom, avg(nbJour) OVER (partition by mois) FROM Club NATURAL JOIN Resa;
SELECT ville, nom, avg(capacite) OVER (partition by ville) FROM Club WHERE ville in (SELECT ville FROM Club INNER JOIN Pers using(ville) WHERE age >= 18);





