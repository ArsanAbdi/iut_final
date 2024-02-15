SELECT /* -----------------------------------------------------------------------
BASE de DONNEES : Football
Version : 1.0
Auteur : Mario CATALDI
Date création : 18/10/2022
------------------------------------------------------------------------- */
/* Essai de BD SQL.*/
DROP SCHEMA IF EXISTS football cascade;
CREATE SCHEMA football;


CREATE TABLE football.president (
	idPresident INT,
	nom VARCHAR(32),
	prenom VARCHAR(32),
	dateNaissance date,
	CONSTRAINT pk_president PRIMARY KEY (idPresident)
);

CREATE TABLE football.equipe (
	idEquipe INT,
	nom VARCHAR(32) ,
	stade VARCHAR(32) ,
	idPresident INT,
	CONSTRAINT pk_equipe PRIMARY KEY (idEquipe),
	CONSTRAINT fk_equipe_president FOREIGN KEY (idPresident) REFERENCES football.president(idPresident)
);

CREATE TABLE football.joueur (
	idJoueur INT,
	nom VARCHAR(32) ,
	prenom VARCHAR(32) ,
	dateNaissance DATE,
	nationalite VARCHAR(32),
	numeroDossard INT,
	idEquipe INT,
    CONSTRAINT pk_joueur PRIMARY KEY (idJoueur),
	CONSTRAINT fk_joueur_equipe FOREIGN KEY (idEquipe) REFERENCES football.equipe(idEquipe)
);

   
 CREATE TABLE football.match(
	idEquipeMaison INT,
	idEquipeExterieur INT,
	scoreMaison INT,
	scoreExterieur INT,
    dateMatch date,
	meilleurJoueur INT,
    CONSTRAINT pk_match PRIMARY KEY (idEquipeMaison, idEquipeExterieur),
	CONSTRAINT fk_match_equipe1 FOREIGN KEY (idEquipeMaison) REFERENCES football.equipe(idEquipe),
	CONSTRAINT fk_match_equipe2 FOREIGN KEY (idEquipeExterieur) REFERENCES football.equipe(idEquipe),
	CONSTRAINT fk_match_joueur FOREIGN KEY (meilleurJoueur) REFERENCES football.joueur(idJoueur)
);




-------------------------------------

INSERT INTO football.president (idPresident, prenom, nom, dateNaissance) VALUES
	(0, 'Nasser', 'al-Khelaïfi', '1973-11-12'),
	(1, 'Aulas', 'Jean-Michel', '1949-03-22'),
	(2, 'Pablo', 'Longoria', '1986-06-09'),
	(3, 'Waldemar', 'Kita', '1953-05-07'), 
	(4, 'Jean-Pierre', 'Rivère', '1957-09-02'), 
	(5, 'Olivier', 'Létang', '1972-11-29'), 
	(6, 'Louis', 'Nicollin', '1943-06-29')
; 
	


INSERT INTO football.equipe(idEquipe, nom, stade, idPresident) VALUES
	(0, 'Paris Saint Germain', 'Parc des Princes', 0),
	(1, 'Olympique lyonnais', 'Groupama Stadium', 1),
	(2, 'Football Club de Nantes', 'Stade de la Beaujoire', 3),
	(3, 'OGC Nice', 'Allianz Riviera', 4),
	(4, 'Montpellier Hérault Sport Club', 'Stade de la Mosson', 6),
	(5, 'Olympique de Marseille', 'Orange Vélodrome', 2),
	(6, 'LOSC Lille', 'Stade Pierre Mauroy', 5)
;


INSERT INTO football.joueur(idJoueur, prenom, nom, dateNaissance, nationalite, numeroDossard, idEquipe) VALUES
	(0, 'Gianluigi', 'Donnarumma', '1999-02-25', 'Italie', 99, 0),
	(1, 'Sergio', 'Ramos', '1986-03-30', 'Espagne', 4, 0),
	(2, 'Marco', 'Verratti', '1992-11-05', 'Italie', 6, 0),
	(3, 'Lionel', 'Messi', '1987-06-24', 'Argentine', 30, 0),
	(4, 'Kylian', 'Mbappé', '1998-12-20', 'France', 7, 0),
	(5, 'Presnel', 'Kimpembé', '1995-08-13', 'France', 3, 0),
	(6, 'Antony', 'Lopes', '1990-10-01', 'Portugal', 1, 1),
	(7, 'Jérome', 'Boateng', '1988-09-03', 'Allemagne', 17, 1),
	(8, 'Nicolas', 'Tagliafico', '1992-08-31', 'Argentine', 3, 1),
	(9, 'Corentin', 'Tolisso', '1994-08-03', 'France', 88, 1),
	(10, 'Moussa', 'Dembélé', '1996-07-12', 'France', 9, 1),
	(11, 'Alexandre', 'Lacazette', '1991-05-28', 'France', 10, 1),
	(12, 'Alban', 'Lafont', '1999-01-23', 'France', 1, 2),
	(13, 'Ludovic', 'Blas', '1997-12-31', 'France', 10, 2),
	(14, 'Moses', 'Simon', '1995-07-12', 'Nigeria', 27, 2),
	(15, 'Pedro', 'Chirivella', '1997-05-23', 'Espagne', 5, 2),
	(16, 'Kasper', 'Schmeichel', '1986-11-05', 'Danemark', 1, 3),
	(17, 'Nicolas', 'Pépé', '1995-05-29', 'Côte d Ivoire', 29, 3),
	(18, 'Khephren', 'Thuram', '2001-03-26', 'France', 19, 3),
	(19, 'Sofiane', 'Diop', '2000-06-09', 'Sénégal', 10, 3),
	(20, 'Jonas', 'Omlin', '1994-01-10', 'Suisse', 1, 4),
	(21, 'Elye', 'Wahi', '2003-01-10', 'France', 21, 4),
	(22, 'Joris', 'Chotard', '2001-09-24', 'France', 13, 4),
	(23, 'Jordan', 'Ferri', '1992-03-12', 'France', 12, 4),
	(24, 'Mattéo', 'Guendouzi', '1999-04-14', 'France', 6, 5),
	(25, 'Cengiz', 'Under', '1997-07-14', 'Turquie', 17, 5),
	(26, 'Nuno', 'Tavares', '2000-01-26', 'Portugal', 30, 5),
	(27, 'Jordan', 'Veretout', '1993-03-01', 'France', 27, 5),
	(28, 'Chancel', 'Mbemba', '1994-08-08', 'RD Congo', 99, 5),
	(29, 'Pau', 'Lopez', '1994-12-13', 'Espagne', 16, 5),
	(30, 'Jonathan', 'David', '2000-01-14', 'Canada', 9, 6),
	(31, 'Jonathan', 'Mbamba', '1996-03-26', 'France', 7, 6),
	(32, 'André', 'Gomes', '1993-07-30', 'Portugal', 28, 6),
	(33, 'Timothy', 'Weah', '2000-02-22', 'France', 22, 6),
	(34, 'Samir', 'Nasri', '1987-06-26', 'France', null, null),
	(35, 'Sophiane', 'Feghouli', '1989-12-26', 'Algérie', null, null),
	(36, 'Adel', 'Taarabt', '1989-05-24', 'Maroc', null, null)
;


	

INSERT INTO football.match(idEquipeMaison,idEquipeExterieur, scoreMaison, scoreExterieur, dateMatch, meilleurJoueur ) VALUES
	(0, 5, 0, 8, '2022-10-16', 24),
	(5, 6, 2, 1, '2022-10-09', 33),
	(5, 4, 2, 1, '2022-09-16', 27),
	(6, 0, 1, 7, '2022-08-21', 4),
	(1, 0, 0, 1, '2022-09-18', 3),
	(0, 3, 2, 1, '2022-10-01', 3),
	(5, 2, 2, 1, '2022-08-20', 28),
	(4, 6, 1, 3, '2022-09-04', 30),
	(0, 4, 5, 2, '2022-08-13', 4),
	(6, 3, 1, 2, '2022-08-31', 17),
	(3, 2, 0, 1, '2022-08-31', 12)
;
	
	
