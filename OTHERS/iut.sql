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
DROP TABLE IF EXISTS iut.etudiant CASCADE ;




CREATE TABLE iut.enseignant (
	idEns INT,
	nom VARCHAR(32) ,
	prenom VARCHAR(32) ,
	dept VARCHAR(32),
    CONSTRAINT pk_enseignant PRIMARY KEY (idEns)
);

CREATE TABLE iut.etudiant (
	idetud INT,
	nom VARCHAR(32),
	prenom VARCHAR(32),
	groupe VARCHAR(12),
    CONSTRAINT pk_etudiant PRIMARY KEY (idetud)
);

CREATE TABLE iut.ressource (
	idres VARCHAR(8),
	nom VARCHAR(128),
 	semestre INT,
	coef FLOAT,
	responsable INT,
    CONSTRAINT pk_ressource PRIMARY KEY (idRes),
	CONSTRAINT fk_ressource_enseignant FOREIGN KEY (responsable) REFERENCES iut.enseignant (idEns)
    );

CREATE TABLE iut.notes (
	idetud INT,
	idres VARCHAR(8), 
	datenote DATE,
	note FLOAT(2),
	CONSTRAINT pk_notes PRIMARY KEY (idEtud, idRes),
	CONSTRAINT fk_notes_etudiant FOREIGN KEY (idEtud) REFERENCES iut.etudiant (idetud),
	CONSTRAINT fk_notes_ressource FOREIGN KEY (idRes) REFERENCES iut.ressource (idres)
);


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

-- table etudiant
INSERT INTO iut.etudiant (idetud, nom, prenom, groupe) VALUES 
(0, 'Turing','Michel', 'A1'), 
(1, 'Roning', 'Ada', 'A2'), 
(2, 'Barty', 'Charles', 'B1'),
(3, 'Berry', 'Gérard', 'B2'), 
(4, 'Finland', 'Michel', 'A2'), 
(5, 'Meyer', 'Bertrand', 'C2'), 
(6, 'Wirth', 'Niklaus', 'A1'), 
(7, 'Talon', 'Achille', 'A1'), 
(8, 'Rubens', 'Marc', 'A2'), 
(9, 'Menner', 'Philippe', 'A1'),
(10, 'Jacobs', 'Marcell', 'B1'),
(11, 'Kerley', 'Fred', 'C1'),
(12, 'De Grasse', 'Andre', 'A2'),
(13, 'Baker', 'Ronnie', 'A1'),
(14, 'Bednarek', 'Kenneth', 'B1'),
(15, 'Lyles', 'Noah', 'B2'),
(16, 'Cheptegei', 'Joshua',  'B1'),
(17, 'Ahmed', 'Mohammed', 'C1'),
(18, 'Chelimo', 'Paul', 'B1'),
(19, 'Kipchoge', 'Eliud', 'A2'),
(20, 'Nageeye', 'Abdi', 'A2'),
(21, 'Abdi', 'Bashir', 'A1');

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



-- table notes 
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (0, 'R1.01', 12, '2021-12-04');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (0, 'R1.02', 13, '2021-10-05');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (1, 'R1.01', 14, '2021-12-04');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (1, 'R1.04', 9, '2021-11-12');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (2, 'R1.01', 12, '2021-12-14');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (2, 'R1.03', 16, '2021-11-24');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (2, 'R1.06', 10, '2021-09-14');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (3, 'R1.01', 12, '2021-11-08');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (4, 'R1.02', 8, '2021-11-05');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (4, 'R1.01', 12, '2021-11-17');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (5, 'R2.01', 8, '2022-02-01');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (6, 'R2.06', 10, '2022-01-04');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (16, 'R2.06', 10, '2022-03-01');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (12, 'R2.06', 10, '2022-02-10');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (12, 'R1.01', 12, '2021-11-09');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (20, 'R1.03', 15, '2021-12-04');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (18, 'R1.06', 10, '2021-11-12');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (19, 'R1.01', 12, '2021-12-01');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (17, 'R1.02', 7, '2021-12-04');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (11, 'R1.01', 10, '2021-10-10');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (21, 'R1.01', 14, '2021-11-22');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (0, 'R2.01', 12, '2022-03-04');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (12, 'R2.01', 10, '2022-02-12');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (1, 'R2.01', 14, '2022-01-05');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (14, 'R1.04', 9, '2021-12-14');
INSERT INTO iut.notes(idEtud,idRes,note,datenote) VALUES (2, 'R2.01', 12, '2022-11-04');


