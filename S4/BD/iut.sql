/* -----------------------------------------------------------------------
BASE de DONNEES : IUT
Version : 2.0
Auteur : Mario CATALDI - Myriam Lamolle
Date création : 24/06/2022
------------------------------------------------------------------------- */
/* Essai de BD SQL.*/
DROP SCHEMA IF EXISTS iut cascade;
CREATE SCHEMA iut;

DROP TABLE IF EXISTS iut.notes CASCADE ; -- CASCADE car objet VIEW, etc. possible pour ma BD
DROP TABLE IF EXISTS iut.ressource CASCADE;
DROP TABLE IF EXISTS iut.enseignant CASCADE ;
DROP TABLE IF EXISTS iut.personne CASCADE ;

DROP TABLE IF EXISTS iut.discipline CASCADE ; -- CASCADE car objet VIEW, etc. possible pour ma BD
DROP TABLE IF EXISTS iut.pays CASCADE ; 
DROP TABLE IF EXISTS iut.personne CASCADE ; 
DROP TABLE IF EXISTS iut.competition CASCADE ;

CREATE TABLE iut.discipline (
	idDiscipline INT,
	nom VARCHAR(32) ,
	recordMonde time,
    CONSTRAINT pk_discipline PRIMARY KEY (idDiscipline)
);

CREATE TABLE iut.pays (
	nom VARCHAR(32),
	budget INT,
    CONSTRAINT pk_pays PRIMARY KEY (nom)
);


CREATE TABLE iut.enseignant (
	idEns INT,
	nom VARCHAR(32) ,
	prenom VARCHAR(32) ,
	dept VARCHAR(32),
    CONSTRAINT pk_enseignant PRIMARY KEY (idEns)
);

CREATE TABLE iut.semestre (

	idSemestre INT,
	semestre INT,

	CONSTRAINT pk_semestre PRIMARY KEY (idSemestre)
);

CREATE TABLE iut.dates (

	idDate INT,
	idSemestre INT,
	jour INT,
	mois INT,
	annee INT,

	CONSTRAINT pk_dates PRIMARY KEY (idDate),
	CONSTRAINT dates FOREIGN KEY (idSemestre) REFERENCES iut.semestre (idSemestre)

);

CREATE TABLE iut.groupe (

	idGroupe INT,
	intitule VARCHAR(10),

	CONSTRAINT pk_groupe PRIMARY KEY (idGroupe)
);

CREATE TABLE iut.personne (
	idpers INT NOT NULL,
	nom VARCHAR(32) NOT NULL,
	prenom VARCHAR(32) NOT NULL,
	dateNaissance date,
	idGroupe INT NOT NULL,
	pays VARCHAR(32),
    CONSTRAINT pk_personne PRIMARY KEY (idpers),
	CONSTRAINT fk_personne_groupe FOREIGN KEY (idGroupe) REFERENCES iut.groupe (idGroupe),
	CONSTRAINT fk_personne_pays FOREIGN KEY (pays) REFERENCES iut.pays (nom)
);

CREATE TABLE iut.competition (
	idPersonne INT,
	idDiscipline INT, 
	dossard INT,
	temps time,
	classement INT, 
	idDate INT,
	CONSTRAINT pk_competition PRIMARY KEY (idPersonne, idDiscipline, idDate),
	CONSTRAINT fk_competition_personne FOREIGN KEY (idPersonne) REFERENCES iut.personne (idpers),
	CONSTRAINT fk_competion_discipline FOREIGN KEY (idDiscipline) REFERENCES iut.discipline (idDiscipline),
	CONSTRAINT fk_competition_dates FOREIGN KEY (idDate) REFERENCES iut.dates (idDate)
);

CREATE TABLE iut.ressource (
	idres VARCHAR(8),
	nom VARCHAR(128),
	semestre INT,
	coef FLOAT,
	responsable INT,
    CONSTRAINT pk_ressource PRIMARY KEY (idRes),
	CONSTRAINT fk_ressource_enseignant FOREIGN KEY (responsable) REFERENCES iut.enseignant (idEns),
	CONSTRAINT fk_ressource_semestre FOREIGN KEY (semestre) REFERENCES iut.semestre (idSemestre)
    );

CREATE TABLE iut.notes (
	idetud INT,
	idres VARCHAR(8), 
	idDate INT,
	note FLOAT(2),
	idEns INT,
	CONSTRAINT pk_notes PRIMARY KEY (idEtud, idRes),
	CONSTRAINT fk_notes_etudiant FOREIGN KEY (idEtud) REFERENCES iut.personne (idpers),
	CONSTRAINT fk_notes_ressource FOREIGN KEY (idRes) REFERENCES iut.ressource (idres),
	CONSTRAINT fk_notes_dates FOREIGN KEY (idDate) REFERENCES iut.dates (idDate),
	CONSTRAINT fk_notes_enseignant FOREIGN KEY (idEns) REFERENCES iut.enseignant (idEns)
);

-- table pays
INSERT INTO iut.pays(nom, budget) VALUES 
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


-- table enseignant
INSERT INTO iut.enseignant (idEns, nom, prenom, dept) VALUES 
	(0, 'Rety', 'Jean-Hugues','INFO'),
	(1, 'Lamolle','Myriam','INFO'),
	(2, 'Homps','Marc','INFO'),
	(3, 'Simonot','Marianne','INFO'),
	(4, 'Ricordeau', 'Anne','INFO'),
	(5, 'Georges','Rémi','INFO'),
	(6, 'Delmas','Guylain','INFO'),
	(7, 'Nauwynck','Nédra','INFO'),
	(8, 'Bonnot','Philippe','INFO'),
	(9, 'Clément-Comparot','Véronique','INFO'),
	(10, 'Bossard','Aurélien','INFO'),
	(11, 'Cataldi','Mario','INFO'),
	(12, 'Golven', 'Amélie','INFO'),
	(13, 'Ballay-Dally', 'Charlotte', 'QLIO'), 
	(14, 'Groff', 'Geoffrey','INFO'),
	(15, 'Bellabes', 'Sihem','INFO'),
	(21, 'Chebbi', 'Imen', NULL), 
	(22, 'Tobbelem', 'Jocelin', NULL), 
	(23, 'Mockel', 'Mehdi', NULL), 
	(24, 'Mourel', 'Frédéric', NULL), 
	(25, 'Nyzam', 'Valentin', NULL),
	(30, 'Kamal','Rachida', NULL) ;
	
INSERT INTO iut.semestre (idSemestre, semestre) VALUES 

	(1, 1),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(2, 2);

INSERT INTO iut.dates (idDate, idSemestre, jour, mois, annee) VALUES 

	(1, 1, 12, 1, 2024),
	(2, 2, 3, 4, 2022),
	(3, 3, 29, 9, 2021),
	(4, 4, 21, 12, 2022),
	(5, 5, 9, 11, 2023),
	(7, NULL, 9, 4, 2017),
	(8, NULL, 3, 9, 2016),	
	(9, NULL, 27, 11, 2014),
	(6, 6, 1, 7, 2019);

INSERT INTO iut.groupe  (idGroupe, intitule) VALUES
	(1, 'A1'),
	(2, 'A2'),
	(3, 'B1'),
	(4, 'B2'),
	(5, 'C1'),
	(6, 'C2');

-- table etudiant
INSERT INTO iut.personne (idpers, nom, prenom, dateNaissance, idGroupe, pays) VALUES 
(0, 'Turing','Michel', NULL, 1, NULL), 
(1, 'Roning', 'Ada', NULL, 2, NULL), 
(2, 'Barty', 'Charles', NULL, 3, NULL),
(3, 'Berry', 'Gérard', NULL, 4, NULL), 
(4, 'Finland', 'Michel', NULL, 2, NULL), 
(5, 'Meyer', 'Bertrand', NULL, 6, NULL), 
(6, 'Wirth', 'Niklaus', NULL, 1, NULL), 
(7, 'Talon', 'Achille', NULL, 1, NULL), 
(8, 'Rubens', 'Marc', NULL, 2, NULL), 
(9, 'Menner', 'Philippe', NULL, 1, NULL),
(10, 'Jacobs', 'Marcell', NULL, 3, NULL),
(11, 'Kerley', 'Fred', NULL, 5, NULL),
(12, 'De Grasse', 'Andre', NULL, 2, NULL),
(13, 'Baker', 'Ronnie', NULL, 1, NULL),
(14, 'Bednarek', 'Kenneth', NULL, 3, NULL),
(15, 'Lyles', 'Noah', NULL, 4, NULL),
(16, 'Cheptegei', 'Joshua', NULL, 3, NULL),
(17, 'Ahmed', 'Mohammed', NULL, 5, NULL),
(18, 'Chelimo', 'Paul', NULL, 3, NULL),
(19, 'Kipchoge', 'Eliud', NULL, 2, NULL),
(20, 'Nageeye', 'Abdi', NULL, 2, NULL),
(21, 'Abdi', 'Bashir', NULL, 1, NULL),
(22, 'Jacobs', 'Marcell', '1994-09-26', 1, 'Italie'),
(23, 'Kerley', 'Fred', '1995-05-07', 2, 'États-Unis'),
(24, 'De Grasse', 'Andre', '1994-11-10', 3, 'Canada'),
(25, 'Baker', 'Ronnie', '1993-10-15', 4, 'États-Unis'),
(26, 'Bednarek', 'Kenneth', '1998-10-14', 5, 'États-Unis'),
(27, 'Lyles', 'Noah', '1997-07-18', 1, 'États-Unis'),
(28, 'Cheptegei', 'Joshua', '1996-09-12', 2, 'Ouganda'),
(29, 'Ahmed', 'Mohammed', '1997-07-18', 3, 'Canada'),
(30, 'Chelimo', 'Paul', '1990-10-27', 4, 'États-Unis'),
(31, 'Kipchoge', 'Eliud', '1984-11-05', 5, 'Kenya'),
(32, 'Nageeye', 'Abdi', '1989-03-02', 1, 'Pays-Bas'),
(33, 'Abdi', 'Bashir', '1989-02-10', 2, 'Belgique'),
(34, 'Lamdassem', 'Ayad', '1981-10-11', 3, 'Espagne'),
(35, 'Navarro', 'Nicolas', '1991-12-03', 4, 'France'),
(36, 'Karsten', 'Warholm', '1996-02-26', 5, 'Norvége'),
(37, 'Rai', 'Benjamin', '1997-07-27', 1, 'États-Unis'),
(38, 'Alison', 'Dos Santos', '2000-03-06', 2, 'Brésil');

-- table module[refmod, intitule, classe, coef, volHoraireCM, volHoraireTD, volHoraireTP, idens]
-- idEns représente le responsable du module
INSERT INTO iut.ressource VALUES 
	('R1.01', 'Initiation au développement', 1, '3.5', 0),
	('R1.02', 'Développement d interfaces web', 1, '2.5', 15),
	('R1.03', 'Introduction à l Architecture des Ordinateurs', 1, '2.5', 7),
	('R1.04', 'Introduction aux Systèmes d exploitation', 1, '3.5', 6),
	('R1.05', 'Introduction aux bases de données SQL', 1, '3.5', 11),
	('R1.06', 'Mathématiques discrètes', 1, '2.5', 2),
	('R1.07', 'Outils Mathématiques Fondamentaux', 1, '2.0', 4),	
	('R1.10', 'Anglais Technique', 1, '1.5', 13),
	('R1.12', 'Projet professionnel et personnel', 1, '1.5', 9);	

INSERT INTO iut.ressource VALUES 
	('R2.01', 'Développement orienté objets', 2, '3.5', 2),
	('R2.02', 'Développement d applications avec IHM', 2, '2.5', 3),
	('R2.03', 'Qualité de développement', 2, '2.5', 3),
	('R2.04', 'Communication et fonctionnement bas niveau', 2, '1.5', 8),
	('R2.05', 'Introduction aux services réseaux', 2, '1.5', 6),
	('R2.06', 'Exploitation d une base de données', 2, '2.5', 11);
	
-- table discipline
INSERT INTO iut.discipline (idDiscipline, nom, recordMonde) VALUES 
	(0, '100 mètres','00:00:09.580'),
	(1, '200 mètres','00:00:19.190'),
	(2, '5000 mètres','00:12:35.360'),
	(3, 'marathon','02:01:09.000'),
	(4, '400m haies', '00:00:46.700')
	;



-- table notes 
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (0, 'R1.01', 12, 1, 1);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (0, 'R1.02', 13, 2, 2);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (1, 'R1.01', 14, 3, 3);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (1, 'R1.04', 9, 4, 4);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (2, 'R1.01', 12, 5, 5);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (2, 'R1.03', 16, 6, 6);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (2, 'R1.06', 10, 1, 7);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (3, 'R1.01', 12, 2, 7);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (4, 'R1.02', 8, 3, 8);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (4, 'R1.01', 12, 4, 9);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (5, 'R2.01', 8, 5, 10);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (6, 'R2.06', 10, 6, 11);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (16, 'R2.06', 10, 1, 12);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (12, 'R2.06', 10, 2, 13);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (12, 'R1.01', 12, 3, 14);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (20, 'R1.03', 15, 4, 15);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (18, 'R1.06', 10, 5, 21);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (19, 'R1.01', 12, 6, 22);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (17, 'R1.02', 7, 1, 23);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (11, 'R1.01', 10, 2, 24);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (21, 'R1.01', 14, 3, 25);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (0, 'R2.01', 12, 4, 30);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (12, 'R2.01', 10, 5, 9);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (1, 'R2.01', 14, 6, 2);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (14, 'R1.04', 9, 1, 3);
INSERT INTO iut.notes(idEtud,idRes,note, idDate, idEns) VALUES (2, 'R2.01', 12, 2, 4);


INSERT INTO iut.competition (idPersonne, idDiscipline, dossard, temps, classement, idDate) VALUES 
	(0, 0, 8, '00:00:09.800', 1, 7),
	(1, 0, 18, '00:00:09.840', 2, 8),
	(2, 0, 21, '00:00:09.890', 3, 9),
	(3, 0, 6, '00:00:09.950', 5, 7),
	(2, 1, 1, '00:00:19.620', 1, 8),
	(4, 1, 33, '00:00:19.680', 2, 9),
	(5, 1, 19, '00:00:19.740', 3, 7),
	(6, 2, 119, '00:12:58.150', 1, 8),
	(7, 2, 269, '00:12:58.610', 2, 9),
	(8, 2, 90, '00:12:59.050', 3, 7),	
	(9, 3, 1, '02:08:38.000', 1, 8),	
	(10, 3, 25, '02:09:58.000', 2, 9),	
	(11, 3, 39, '02:10:00.000', 3, 7),	
	(12, 3, 147, '02:10:16.000', 5, 8),
    (13, 3, 201, '02:12:50.000', 12, 9),
	(14, 4, 37, '00:00:45.940',1, 7),
	(15, 4, 7, '00:00:46.870',2, 8),
	(16, 4, 209, '00:00:47.120',3, 9);	





