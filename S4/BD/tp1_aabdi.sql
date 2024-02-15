DROP SCHEMA IF EXISTS entreprise_bis CASCADE;
CREATE SCHEMA entreprise_bis;

SET search_path TO entreprise_bis, public; 

CREATE TABLE parfum (

	idParfum SERIAL,
	nom VARCHAR(50),
	marque VARCHAR(50),
	couleur VARCHAR(50),
	taille VARCHAR(50),
	prix INT,

	CONSTRAINT pk_parfum PRIMARY KEY (idParfum)
);

CREATE TABLE client (

	idClient SERIAL,
	nom VARCHAR(50),
	prenom VARCHAR(50),
	adresse VARCHAR(100),
	carte VARCHAR(50),

	CONSTRAINT pk_client PRIMARY KEY (idClient)
);

CREATE TABLE magasin (

	idMagasin SERIAL,
	nom VARCHAR(50),
	adresse VARCHAR(50),
	ville VARCHAR(50),
	region VARCHAR(50),

	CONSTRAINT pk_magasin PRIMARY KEY (idMagasin)
);

CREATE TABLE date_achat (

	idDate SERIAL,
	jour INT,
	mois INT,
	annee INT,
	
	CONSTRAINT pk_date PRIMARY KEY (idDate)
);

CREATE TABLE transaction (

	idTransaction SERIAL,
	montant INT,
	idClient INT,
	idParfum INT,
	idDate INT NOT NULL,
	idMagasin INT,
	
	CONSTRAINT pk_transaction_un PRIMARY KEY (idTransaction),
	CONSTRAINT pk_transaction_deux FOREIGN KEY (idClient) REFERENCES entreprise_bis.client(idClient),
	CONSTRAINT pk_transaction_trois FOREIGN KEY (idMagasin) REFERENCES entreprise_bis.magasin(idMagasin),
	CONSTRAINT pk_transaction_quatre FOREIGN KEY (idParfum) REFERENCES entreprise_bis.parfum(idParfum),
	CONSTRAINT pk_transaction_cinq FOREIGN KEY (idDate) REFERENCES entreprise_bis.date_achat(idDate)

);

CREATE TABLE detailsTransaction (

	quantite INT,
	idParfum INT,
	idTransaction INT,
	
	CONSTRAINT pk_details_transaction_un FOREIGN KEY (idTransaction) REFERENCES entreprise_bis.transaction(idTransaction),
	CONSTRAINT pk_details_transaction_deux FOREIGN KEY (idParfum) REFERENCES entreprise_bis.parfum(idParfum),
	CONSTRAINT pk_details_transaction_trois PRIMARY KEY (idTransaction, idParfum)
);


INSERT INTO parfum (nom, marque, couleur, taille, prix) VALUES
('Eau de parfum', 'Dior', 'Rose', '100ml', 100.00),
('Eau de toilette', 'Chanel', 'Bleu', '50ml', 50.00),
('Eau de parfum', 'Yves Saint Laurent', 'Noir', '75ml', 75.00),
('Eau de toilette', 'Guerlain', 'Vert', '100ml', 100.00),
('Eau de parfum', 'Hermes', 'Jaune', '50ml', 50.00),
('Eau de toilette', 'Lancome', 'Rouge', '75ml', 75.00),
('Eau de parfum', 'Givenchy', 'Blanc', '100ml', 100.00),
('Eau de toilette', 'Estee Lauder', 'Noir', '50ml', 50.00),
('Eau de parfum', 'Burberry', 'Bleu', '75ml', 75.00),
('Eau de toilette', 'Calvin Klein', 'Vert', '100ml', 100.00);

INSERT INTO client (nom,prenom,adresse,carte) VALUES
('Silva','Horeb','24 avenue du boss',123456789), 
('Vijayatharan','Vithushan','19 avenue de l aout',9876543210),
('Abdi','Arsan','3 avenue de l avril',6543219874),
('Amadalasse','Imman','24 avenue de février',7531596482),
('Lamchichi','Ayoub','18 rue de janvier',2587946130);

INSERT INTO magasin (nom,adresse,ville,region) VALUES
('Sephora','24 avenue du caca','Paris','Ile de France'),
('Nocibe','19 avenue de popo','Lyon','Auvergne-Rhône-Alpes'),
('Marionnaud','3 rue de la fefe','Marseille','Provence-Alpes-Côte d Azur'),
('Douglas','24 boulevard haussmaan','Lille','Hauts-de-France'),
('Beauty Success','18 rue de la vérité','Toulouse','Occitanie');

INSERT INTO date_achat (idDate, jour, mois, annee) VALUES
(1, 12, 10, 2004),
(2, 9, 7, 2024),
(3, 9, 5, 2016),
(4, 3, 12, 1999),
(5, 1, 7, 2024);

INSERT INTO transaction (idClient,idMagasin,idParfum,idDate,montant) VALUES
(1,1,1,1,100.00),
(2,2,2,2,50.00),
(3,3,3,3,75.00),
(4,4,4,4,100.00),
(5,5,5,5,50.00),
(1,1,6,1,75.00),
(2,2,7,2,100.00),
(3,3,8,3,50.00),
(4,4,9,4,75.00),
(5,5,10,5,100.00);

INSERT INTO detailsTransaction (idTransaction,idParfum,quantite) VALUES
(1,1,1),
(2,2,1),
(3,3,1),
(4,4,1),
(5,5,1),
(6,6,1),
(7,7,1),
(8,8,1),
(9,9,1),
(10,10,1);







