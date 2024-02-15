/* -----------------------------------------------------------------------
BASE de DONNEES : IUT
Version : 2.0
Auteur : Mario CATALDI 
Date création : 10/10/2022
------------------------------------------------------------------------- */
/* Essai de BD SQL.*/
DROP SCHEMA IF EXISTS athletisme CASCADE;
CREATE SCHEMA athletisme;

DROP TABLE IF EXISTS athletisme.discipline CASCADE ; -- CASCADE car objet VIEW, etc. possible pour ma BD
DROP TABLE IF EXISTS athletisme.pays CASCADE ; 
DROP TABLE IF EXISTS athletisme.athlete CASCADE ; 
DROP TABLE IF EXISTS athletisme.competition CASCADE ;




CREATE TABLE athletisme.discipline (
	idDiscipline INT,
	nom VARCHAR(32) ,
	recordMonde time,
    CONSTRAINT pk_discipline PRIMARY KEY (idDiscipline)
);

CREATE TABLE athletisme.pays (
	nom VARCHAR(32),
	budget INT,
    CONSTRAINT pk_pays PRIMARY KEY (nom)
);

CREATE TABLE athletisme.athlete (
	idAthlete INT,
	nom VARCHAR(32) ,
	prenom VARCHAR(32) ,
	dateNaissance date,
	pays VARCHAR(32),
    CONSTRAINT pk_athlete PRIMARY KEY (idAthlete),
	CONSTRAINT fk_athlete_pays FOREIGN KEY (pays) REFERENCES athletisme.pays (nom)
    );

CREATE TABLE athletisme.competition (
	idAthlete INT,
	idDiscipline INT, 
	dossard INT,
	temps time,
	classement INT, 
	annee INT,
	CONSTRAINT pk_competition PRIMARY KEY (idAthlete, idDiscipline, annee),
	CONSTRAINT fk_competition_athlete FOREIGN KEY (idAthlete) REFERENCES athletisme.athlete (idAthlete),
	CONSTRAINT fk_competion_discipline FOREIGN KEY (idDiscipline) REFERENCES athletisme.discipline (idDiscipline)
);




-- table discipline
INSERT INTO athletisme.discipline (idDiscipline, nom, recordMonde) VALUES 
	(0, '100 mètres','00:00:09.580'),
	(1, '200 mètres','00:00:19.190'),
	(2, '5000 mètres','00:12:35.360'),
	(3, 'marathon','02:01:09.000'),
	(4, '400m haies', '00:00:46.700')
	;

-- table pays
INSERT INTO athletisme.pays(nom, budget) VALUES 
	('Espagne', 250000), 
	('France', 300000), 
	('Italie', 150000), 
	('États-Unis', 1000000), 
	('Pays-Bas', 100000),
	('Canada', 300000),
	('Ouganda', 20000),
	('Kenya', 80000),
	('Belgique', 130000),
	('Norvége', 200000),
	('Brésil', 100000)
;


INSERT INTO athletisme.athlete  (idAthlete, nom, prenom, dateNaissance, pays) VALUES 
(0, 'Jacobs', 'Marcell', '1994-09-26', 'Italie'),
(1, 'Kerley', 'Fred', '1995-05-07', 'États-Unis'),
(2, 'De Grasse', 'Andre', '1994-11-10', 'Canada'),
(3, 'Baker', 'Ronnie', '1993-10-15', 'États-Unis'),
(4, 'Bednarek', 'Kenneth', '1998-10-14', 'États-Unis'),
(5, 'Lyles', 'Noah', '1997-07-18', 'États-Unis'),
(6, 'Cheptegei', 'Joshua', '1996-09-12', 'Ouganda'),
(7, 'Ahmed', 'Mohammed', '1997-07-18', 'Canada'),
(8, 'Chelimo', 'Paul', '1990-10-27', 'États-Unis'),
(9, 'Kipchoge', 'Eliud', '1984-11-05', 'Kenya'),
(10, 'Nageeye', 'Abdi', '1989-03-02', 'Pays-Bas'),
(11, 'Abdi', 'Bashir', '1989-02-10', 'Belgique'),
(12, 'Lamdassem', 'Ayad', '1981-10-11', 'Espagne'),
(13, 'Navarro', 'Nicolas', '1991-12-03', 'France'),
(14, 'Karsten', 'Warholm', '1996-02-26', 'Norvége'),
(15, 'Rai', 'Benjamin', '1997-07-27', 'États-Unis'),
(16, 'Alison', 'Dos Santos', '2000-03-06', 'Brésil')
;


INSERT INTO athletisme.competition (idAthlete, idDiscipline, dossard, temps, classement, annee) VALUES 
	(0, 0, 8, '00:00:09.800', 1, 2021),
	(1, 0, 18, '00:00:09.840', 2, 2021),
	(2, 0, 21, '00:00:09.890', 3, 2021),
	(3, 0, 6, '00:00:09.950', 5, 2021),
	(2, 1, 1, '00:00:19.620', 1, 2022),
	(4, 1, 33, '00:00:19.680', 2, 2022),
	(5, 1, 19, '00:00:19.740', 3, 2022),
	(6, 2, 119, '00:12:58.150', 1, 2021),
	(7, 2, 269, '00:12:58.610', 2, 2021),
	(8, 2, 90, '00:12:59.050', 3, 2021),	
	(9, 3, 1, '02:08:38.000', 1, 2022),	
	(10, 3, 25, '02:09:58.000', 2, 2022),	
	(11, 3, 39, '02:10:00.000', 3, 2022),	
	(12, 3, 147, '02:10:16.000', 5, 2022),
    (13, 3, 201, '02:12:50.000', 12, 2022),
	(14, 4, 37, '00:00:45.940',1, 2022),
	(15, 4, 7, '00:00:46.870',2, 2021),
	(16, 4, 209, '00:00:47.120',3, 2022)
	;	
