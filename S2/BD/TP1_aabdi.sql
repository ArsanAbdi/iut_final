--------------
--- ABDI Arsan
--- TP n*1
--------------
--- Exo 1
--- Q1

DROP SCHEMA IF EXISTS etudes CASCADE;

CREATE SCHEMA etudes;

CREATE TABLE 	etudes.etude(

	idEtud INT,
	nomEtud VARCHAR (50),
	fraisScol INT,
	discipline VARCHAR (50),
	cours1 VARCHAR (50),
	cours2 VARCHAR (50),
	cours3 VARCHAR (50),

	CONSTRAINT pk_etude PRIMARY KEY (idEtud)

);

INSERT INTO etudes.etude (idEtud, nomEtud, fraisScol, discipline, cours1, cours2, cours3)

	VALUES  (1, 'Alice Dubois', 200, 'Economie', 'Economie1', 'Biologie1', NULL),
		(2, 'Bob Dupont', 500, 'Informatique', 'Biologie1', 'Intro Business', 'Programmation2'),
		(3, 'Chris Durand', 400, 'Médecine', 'Biologie2', NULL, NULL),
		(4, 'Diana Duclos', 850, 'Dentaire', NULL, NULL, NULL),
		(5, 'Eliot Martin', 0, NULL, NULL, NULL, NULL);

INSERT INTO etudes.etude (idEtud, nomEtud) VALUES (9, 'Arsan Abdi');
UPDATE etudes.etude SET nomEtud = 'Lionel Messi' WHERE nomEtud = 'Arsan Abdi';
UPDATE etudes.etude SET nomEtud = 'Neymar Jr', fraisScol = 200, discipline = 'Football', cours1 = 'Dribbles' WHERE nomEtud = 'Lionel Messi';
DELETE FROm etudes.etude WHERE idEtud = 3;

