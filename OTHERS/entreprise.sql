/* -----------------------------------------------------------------------
BASE de DONNEES : IUT
Version : 2.0
Auteur : Matthias TRUPIN - Baptiste BLANCHET - Arsan ABDI
Date création : 20/03/2023
------------------------------------------------------------------------- */


DROP SCHEMA IF EXISTS  entreprise;
CREATE SCHEMA entreprise;


CREATE TABLE entreprise.transaction (
	idTransaction SERIAL,
	montant INT,
	dateTransaction date,
	intitulé varchar,

    CONSTRAINT pk_transaction PRIMARY KEY (idTransaction)
);


CREATE TABLE entreprise.depense(
	idPosteDepense INT,

	CONSTRAINT pk_depense PRIMARY KEY (idTransaction),
	CONSTRAINT fk_depense FOREIGN KEY (idPosteDepense) REFERENCES entreprise.posteDepense(idPoste)
)INHERITS(entreprise.transaction);


CREATE TABLE entreprise.recette(
	typeRecette varchar,
	idClient INT,
	idProduit INT,

	CONSTRAINT pk_recette PRIMARY KEY (idTransaction),
	CONSTRAINT fk_produit FOREIGN KEY (idProduit) REFERENCES entreprise.produit(idProduit),
	CONSTRAINT fk_client FOREIGN KEY (idClient) REFERENCES entreprise.client(idClient)
)INHERITS(entreprise.transaction);


CREATE TABLE entreprise.client (
	idClient SERIAL,
	nom varchar,
	ville varchar,

	CONSTRAINT pk_client PRIMARY KEY (idClient)
);


CREATE TABLE entreprise.posteDepense (
	idPoste SERIAL,
	typeDepense varchar,

	CONSTRAINT pk_posteDepense PRIMARY KEY (idPoste)
);



CREATE TABLE entreprise.produit(
	idProduit SERIAL,
	categorie varchar,
	modele varchar,

	CONSTRAINT pk_produit PRIMARY KEY (idProduit)
);




INSERT INTO entreprise.produit (idProduit, categorie, modele) VALUES
 	(DEFAULT, 'électroménager', 'four'),
	(DEFAULT, 'électroménager', 'aspirateur'),
	(DEFAULT, 'électroménager', 'cafetière'),
	(DEFAULT, 'électroménager', 'grille-pain'),
	(DEFAULT, 'électroménager', 'frigo'),
	(DEFAULT, 'électroménager', 'machine à laver'),
	(DEFAULT, 'électroménager', 'bouilloire'),
	(DEFAULT, 'électroménager', 'micro-ondes'),
	(DEFAULT, 'électroménager', 'mixeur'),
	(DEFAULT, 'électroménager', 'cuiseur'),
	(DEFAULT, 'vêtement', 'pantalon'),
	(DEFAULT, 'vêtement', 't-shirt'),
	(DEFAULT, 'vêtement', 'pull'),
	(DEFAULT, 'vêtement', 'sweat'),
	(DEFAULT, 'vêtement', 'polo'),
	(DEFAULT, 'vêtement', 'robe'),
	(DEFAULT, 'vêtement', 'gilet'),
	(DEFAULT, 'fruits', 'banane'),
	(DEFAULT, 'fruits', 'pomme'),
	(DEFAULT, 'fruits', 'citron'),
	(DEFAULT, 'fruits', 'clémentine'),
	(DEFAULT, 'fruits', 'ananas'),
	(DEFAULT, 'fruits', 'poire'),
	(DEFAULT, 'fruits', 'pêche'),
	(DEFAULT, 'légumes', 'tomate'),
	(DEFAULT, 'légumes', 'poireau'),
	(DEFAULT, 'légumes', 'concombre'),
	(DEFAULT, 'légumes', 'patate'),
	(DEFAULT, 'légumes', 'avocat'),
	(DEFAULT, 'légumes', 'champignon'),
	(DEFAULT, 'légumes', 'endive'),
	(DEFAULT, 'légumes', 'salade'),
	(DEFAULT, 'viandes', 'steack'),
	(DEFAULT, 'viandes', 'entrecôte'),
	(DEFAULT, 'viandes', 'porc'),
	(DEFAULT, 'viandes', 'poulet'),
	(DEFAULT, 'viandes', 'boeuf'),
	(DEFAULT, 'viandes', 'merguez'),
	(DEFAULT, 'viandes', 'filet mignon'),
	(DEFAULT, 'viandes', 'saucisse'),
	(DEFAULT, 'viandes', 'tournedos'),
	(DEFAULT, 'viandes', 'faux-filets'),
	(DEFAULT, 'poissons', 'saumon'),
	(DEFAULT, 'poissons', 'cabillaud'),
	(DEFAULT, 'poissons', 'truite'),
	(DEFAULT, 'poissons', 'bar'),
	(DEFAULT, 'poissons', 'daurade'),
	(DEFAULT, 'poissons', 'lieu noir'),
	(DEFAULT, 'frais', 'oeuf'),
	(DEFAULT, 'frais', 'parmesan'),
	(DEFAULT, 'frais', 'mozzarella'),
	(DEFAULT, 'frais', 'lait'),
	(DEFAULT, 'frais', 'yaourt'),
	(DEFAULT, 'frais', 'mascarpone'),
	(DEFAULT, 'frais', 'fromage'),
	(DEFAULT, 'frais', 'crème'),
	(DEFAULT, 'frais', 'guacamole'),
	(DEFAULT, 'frais', 'chorizo'),
	(DEFAULT, 'entretien', 'lessive'),
	(DEFAULT, 'entretien', 'mouchoirs'),
	(DEFAULT, 'entretien', 'eponges'),
	(DEFAULT, 'entretien', 'liquide vaisselle'),
	(DEFAULT, 'entretien', 'désinfectant'),




INSERT INTO entreprise.posteDepense (idPoste, typeDepense) VALUES
	(DEFAULT, 'Salaire'),
	(DEFAULT, 'Electricité'),
	(DEFAULT, 'Impôts'),
	(DEFAULT, 'Remboursement Emprunt'),
	(DEFAULT, 'Matière Première'),
	(DEFAULT, 'Loyer'),
	(DEFAULT, 'Maintenance'),
	(DEFAULT, 'Note de Frais'),
	(DEFAULT, 'Maintenance / fournitures');
