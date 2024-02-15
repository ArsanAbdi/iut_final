DROP SCHEMA IF EXISTS iut2023 CASCADE;

CREATE SCHEMA iut2023;

SET search_path TO iut2023, PUBLIC;

CREATE TABLE departement (

	idDept VARCHAR (12),
	titre VARCHAR (64),

	CONSTRAINT pK_departement PRIMARY KEY (idDept)
);

CREATE TABLE personnel (

	idPers INT, 
	nom VARCHAR (32),
	prenom VARCHAR (32),
	fonction VARCHAR (32),
	idDept VARCHAR (12),

	CONSTRAINT pK_personnel PRIMARY KEY (idPers),
	CONSTRAINT fK_personnel_departement FOREIGN KEY (idDept) REFERENCES iut2023.departement (idDept)
);

CREATE TABLE enseignant (

	idEns INT, 
	nom VARCHAR (32),
	prenom VARCHAR (32),
	idDept VARCHAR (12),

	CONSTRAINT pK_enseignant PRIMARY KEY (idEns),
	CONSTRAINT fK_enseignant_departement FOREIGN KEY (idDept) REFERENCES iut2023.departement (idDept)
);

CREATE TABLE etudiant (

	idEtud INT,
	nom VARCHAR (32),
	prenom VARCHAR (32),
	semestre VARCHAR (2),

	CONSTRAINT pK_etudiant PRIMARY KEY (idEtud)
);

CREATE TABLE ressource (

	idRes VARCHAR (4), 
	intitule VARCHAR (64),
	semestre VARCHAR (2),
	coef FLOAT,
	volumeCM INT,
	volumeTD INT,
	volumeTP INT,
	idEns INT,

	CONSTRAINT pK_ressource PRIMARY KEY (idRes),
	CONSTRAINT fK_ressource_enseignant FOREIGN KEY (idEns) REFERENCES iut2023.enseignant (idEns)
);

CREATE TABLE interro (

	idInter INT,
	idRes VARCHAR (4), 
	coefInterro FLOAT DEFAULT 1,

	CONSTRAINT pK_interro PRIMARY KEY (idInter),
	CONSTRAINT fK_interro_responsable FOREIGN KEY (idRes) REFERENCES iut2023.ressource (idRes)
);

CREATE TABLE notes (

	idInter INT,
	idEtud INT,
	note FLOAT (2),

	CONSTRAINT pK_notes PRIMARY KEY (idInter, idEtud),
	CONSTRAINT fK_notes_interro FOREIGN KEY (idInter) REFERENCES iut2023.interro (idInter),
	CONSTRAINT fK_notes_etudiant FOREIGN KEY (idEtud) REFERENCES iut2023.etudiant (idEtud)
);



/* -----------------------------------------------------------------------
BASE de DONNEES : IUT
Version : 3.0
Date de création : 06/04/2023
Auteur : Sihem Belabbes
Versions précédentes : Myriam Lamolle et Mario Cataldi
------------------------------------------------------------------------- */

/* Insertion des données*/

-- table departement
insert into departement VALUES ('INFO', 'Informatique'), 
	('QLIO', 'Qualité, Logistique Industrielle et Organisation'), 
	('INFOCOM', 'Information et Communication'), 
	('GACO', 'Gestion des Administrations et Commerce');

-- table personnel
insert into personnel (idPers, nom, prenom, fonction) VALUES 
	(1, 'Cassel', 'Vincent', 'Directeur'),
	(2, 'Signoret','Simone', 'Responsable d''administration'),
	(3, 'Sy', 'Omar', 'Responsable CCRI'),
	(4, 'Binoche','Juliette', 'Responsable Hygiène et Sécurité'),
	(30, 'Delon','Alain', 'Chargé de mission');

insert into personnel (idPers, nom, prenom, fonction, idDept) VALUES 
	(6, 'James','LeBron', 'Secrétaire Informatique', 'INFO'),
	(7, 'Mbape','Kylian', 'Chef de département', 'INFO'),
	(200, 'Bolt','Usain', 'Chef de département', 'QLIO'),	
	(300, 'Williams','Serena', 'Chef de département', 'GACO'),
	(400, 'Nadal', 'Rafael', 'Chef de département', 'INFOCOM'),
	(15, 'Muffat','Camille', 'Directeur des études','INFO'),
	(10, 'Flessel', 'Laura', 'Responsable Apprentissage BUT', 'INFO'),
	(11, 'Fontenoy','Maud', 'Responsable stage','INFO'),
	(19, 'Messi','Lionel', 'Responsable Parcoursup', 'INFO'),
	(5, 'Pérec','Marie-José', 'Responsable Axe EID','INFO'),
	(14, 'Arron','Christine', 'Responsable Projet ERUA', 'INFO');


-- table enseignant
insert into enseignant (idEns, nom, prenom, iddept) VALUES 
	(5, 'Pérec', 'Marie-José','INFO'),
	(7, 'Mbape','Kylian','INFO'),
	(8, 'Woods','Tiger','INFO'),
	(9, 'Federer','Roger','INFO'),
	(10, 'Flessel', 'Laura','INFO'),
	(11, 'Fontenoy','Maud','INFO'),
	(12, 'Hamilton','Lewis','INFO'),
	(13, 'Sharapova','Maria','INFO'),
	(15, 'Muffat','Camille','INFO'),
	(16, 'Zidane','Zinédine','INFO'),
	(17, 'Rapinoe','Megan','INFO'),
	(18, 'Deschamps','Didier','INFO'),
	(19, 'Messi','Lionel','INFO'),
	(20, 'Ronaldo', 'Cristiano','INFO'),
	(21, 'Harding', 'Tonya', 'QLIO'), 
	(23, 'Groff', 'Geoffrey','INFO') ;


-- table ressource[idRes, intitule, semestre, coef, volumeCM, volumeTD, volumeTP, idens]
-- idEns représente le responsable de la ressource
insert into ressource VALUES 
	('R101', 'Initiation au dév', 'S1', '3.5', 10, 20, 30, 12),
	('R102', 'Dév interfaces web', 'S1', '3.5', 10, 20, 30, 5),
	('R103', 'Intro archi', 'S1', '2.5', 10, 15, 20, 5),
	('R104', 'Intro systèmes', 'S1', '3.5', 10, 25, 25, 7),
	('R105', 'Introduction BD', 'S1', '2.5', 0, 20, 25, 5);
insert into ressource VALUES 
	('R201', 'Dév objets', 'S1', '2.5', 10, 18, 17, 8),
	('R202', 'Dév apps IHM', 'S1', '2.0', 6, 12, 12, 15),	
	('R203', 'Qualité de dév', 'S1', '1.5', 10, 10, 10, 16),
	('R204', 'Réseau et bas niveau', 'S1', '2.5', 10, 20, 15, 15),	
	('R205', 'Services réseau', 'S1', '2.0', 0, 15, 15, 20),	
	('R206', 'Exploitation BD', 'S1', '1.5', 0, 15, 15, 20);


-- table interro (11 tuples)
insert into interro VALUES (11,'R101');
insert into interro VALUES (12,'R102');
insert into interro VALUES (13,'R103');
insert into interro VALUES (14,'R104');
insert into interro VALUES (15,'R105');
insert into interro VALUES (21,'R201');
insert into interro VALUES (22,'R202');
insert into interro VALUES (23,'R203');
insert into interro VALUES (24,'R204');
insert into interro VALUES (25,'R205');
insert into interro VALUES (26,'R206');







\copy etudiant from '/home/etudiants/info/aabdi/prive/S2/BD/etudiant.csv' delimiter ';' csv header;



