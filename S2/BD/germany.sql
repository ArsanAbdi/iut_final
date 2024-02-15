/* -----------------------------------------------------------------------
BASE de DONNEES : IUT de Montreuil
Version : 2.0
Auteur : Matthias TRUPIN - Baptiste BLANCHET - Arsan ABDI
Date début création : 20/03/2023
Date fin création : 05/04/2023
------------------------------------------------------------------------- */

DROP SCHEMA IF EXISTS germany CASCADE;
CREATE SCHEMA germany;

SET search_path TO germany, public; 

CREATE TABLE sports (

	idEpreuve INT ,
	epreuve VARCHAR (50) ,
	genre VARCHAR (8) ,
	edition INT ,

	CONSTRAINT pK_sports PRIMARY KEY (idEpreuve),

	CONSTRAINT CHK_sports CHECK (genre = 'masculin' OR genre = 'feminin' OR genre = 'mixte')
);

CREATE TABLE sportifs (

	idSportif INT ,
	nom VARCHAR (50) ,
	prenom VARCHAR (50) ,
	ndate DATE ,

	CONSTRAINT pK_sportifs PRIMARY KEY (idSportif)
);

CREATE TABLE medailles (

	idEpreuve INT ,
	idSportif INT ,
	couleur VARCHAR (50) ,

	CONSTRAINT pK_medailles PRIMARY KEY (idEpreuve, idSportif) ,
	CONSTRAINT fK_medailles_sports FOREIGN KEY (idEpreuve) REFERENCES germany.sports (idEpreuve) ,
	CONSTRAINT fK_medailles_sportifs FOREIGN KEY (idSportif) REFERENCES germany.sportifs (idSportif)
);


INSERT INTO germany.sports (idEpreuve, epreuve, genre, edition) VALUES
 	(1, 'athletisme', 'masculin', 2016),
	(2, 'football', 'feminin', 2016),
	(3, 'handball', 'masculin', 2016),
	(4, 'football', 'masculin', 2016),
	(5, 'judo', 'feminin', 2016);

INSERT INTO germany.sportifs (idSportif, nom, prenom, ndate) VALUES
 	(1, 'Bauer', 'Robert', '09/04/1995'),
	(2, 'Laudehr', 'Simone', '12/07/86'),
	(3, 'Gnabry', 'Serge', '14/07/95'),
	(4, 'Wiede', 'Fabian', '08/02/1994'),
	(5, 'Vargas-Koch', 'Laura', '29/06/1990');

INSERT INTO germany.medailles (idEpreuve, idSportif, couleur) VALUES
 	(4, 3, 'argent'),
	(4, 1, 'argent'),
	(5, 5, 'bronze'),
	(2, 2, 'or'),
	(3, 4, 'bronze');

--Trouvez par épreuve, le nombre de sportifs y ayant participé
SELECT epreuve, genre, count (idEpreuve) FROM sports NATURAL JOIN medailles GROUP BY (epreuve, genre);

--le prenom des sportifs ayant déjâ gagner une médaille triés par ordre alphabétique
SELECT prenom FROM sportifs NATURAL JOIN medailles ORDER BY prenom;

-- trouvez le prenom et la couleur de medaille des sportifs ayant gagnés des médailles excepté ceux qui ont gagnés des médailles d'or   
SELECT prenom, couleur FROM sportifs NATURAL JOIN medailles EXCEPT SELECT prenom, couleur FROM sportifs NATURAL JOIN medailles WHERE couleur = 'or';

-- les prénoms des sportifs ayant déja remporté une médaille lors d'une épreuve masculine
SELECT prenom FROM sportifs NATURAL JOIN medailles INNER JOIN sports using(idEpreuve) WHERE genre = 'masculin';

-- pour chaque couleur de médailles, trouvez le nombre de médailles gagnées
SELECT couleur, count(couleur) FROM medailles GROUP BY couleur;

--pour chaque édition, le nombre d'épreuves réalisés
SELECT edition, count(idEpreuve) OVER (PARTITION BY edition) FROM sports;

--la vue
CREATE VIEW berlin AS SELECT couleur, count(couleur) FROM medailles GROUP BY couleur;


--les droits 

GRANT CONNECT ON DATABASE aabdi TO stefan;
GRANT USAGE ON SCHEMA germany TO stefan;
GRANT SELECT ON berlin TO stefan;

