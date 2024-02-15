/* -----------------------------------------------------------------------
BASE de DONNEES : IUT
Version : 2.0
Auteur : Matthias TRUPIN - Baptiste BLANCHET - Arsan ABDI
Date création : 20/03/2023
------------------------------------------------------------------------- */

DROP SCHEMA IF EXISTS entreprise CASCADE;
CREATE SCHEMA entreprise;

-- Création des tables SQL : --------------------------------------------------

CREATE TABLE entreprise.produit(
	idProduit SERIAL,
	categorie varchar,
	modele varchar,

	CONSTRAINT pk_produit PRIMARY KEY (idProduit)
);

CREATE TABLE entreprise.client (
	idClient SERIAL,
	nom varchar,
	ville varchar,

	CONSTRAINT pk_client PRIMARY KEY (idClient)
);


CREATE TABLE entreprise.transaction (
	idTransaction SERIAL,
	montant INT,
	dateTransaction date,
	intitulé varchar,

    CONSTRAINT pk_transaction PRIMARY KEY (idTransaction)
);


CREATE TABLE entreprise.posteDepense (
	idPoste SERIAL,
	typeDepense varchar,

	CONSTRAINT pk_posteDepense PRIMARY KEY (idPoste)
);


CREATE TABLE entreprise.depense(
	idPosteDepense INT,

	CONSTRAINT pk_depense PRIMARY KEY (idTransaction),
	CONSTRAINT fk_depense FOREIGN KEY (idPosteDepense) REFERENCES entreprise.posteDepense(idPoste)
)INHERITS(entreprise.transaction);


CREATE TABLE entreprise.recette(
	-- typeRecette varchar, --
	idClient INT,
	idProduit INT,

	CONSTRAINT pk_recette PRIMARY KEY (idTransaction),
	CONSTRAINT fk_produit FOREIGN KEY (idProduit) REFERENCES entreprise.produit(idProduit),
	CONSTRAINT fk_client FOREIGN KEY (idClient) REFERENCES entreprise.client(idClient)
)INHERITS(entreprise.transaction);

-- Fin de la création des tables SQL ---------------------------------------------------





-- Insertion des données SQL -----------------------------------------------------------

-- Les produits : --
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
	(DEFAULT, 'entretien', 'désinfectant');



-- Les postes de dépenses : --
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

-- Les clients : --
INSERT INTO entreprise.client (idClient, nom, ville) VALUES
	(DEFAULT, 'Dupont', 'Tours'),
	(DEFAULT, 'Martin', 'Strasbourg'),
	(DEFAULT, 'Dubois', 'Strasbourg'),
	(DEFAULT, 'Petit', 'Paris'),
	(DEFAULT, 'Leroy', 'Tours'),
	(DEFAULT, 'Moreau', 'Lille'),
	(DEFAULT, 'Durand', 'Lille'),
	(DEFAULT, 'Thomas', 'Paris'),
	(DEFAULT, 'Pelletier', 'Strasbourg'),
	(DEFAULT, 'Mazué', 'Tours'),
	(DEFAULT, 'John', 'Rennes'),
	(DEFAULT, 'Karmin', 'Paris'),
	(DEFAULT, 'Hassan', 'Paris'),
	(DEFAULT, 'Tuche', 'Tourcoing'),
	(DEFAULT, 'Tuche', 'Tourcoing'),
	(DEFAULT, 'Ben', 'Dover'),
	(DEFAULT, 'Lemule', 'Toulouse'),
	(DEFAULT, 'Andre', 'Bussy'),
	(DEFAULT, 'Laric', 'Paris'),
	(DEFAULT, 'Rene', 'Paris'),
	(DEFAULT, 'Duval', 'Strasbourg'),
	(DEFAULT, 'Janni', 'Montreuil');

--- Les dépenses : ---
INSERT INTO entreprise.depense(idTransaction, montant, dateTransaction, intitulé, idPosteDepense) VALUES
	(DEFAULT, -8.302, '2023-01-01', 'Facture électricité', 1),
	(DEFAULT, -19.887, '2023-01-02', 'Impôts', 2),
	(DEFAULT, -1.197, '2023-01-02', 'Paiement Loyer - Locaux', 5),
	(DEFAULT, -19.073, '2023-01-02', 'Note de Frais', 7),
	(DEFAULT, -5.099, '2023-01-03', 'Rémunération - RH', 0),
	(DEFAULT, -34.944, '2023-01-04', 'Rémunération - RH', 0),
	(DEFAULT, -16.015, '2023-01-04', 'Rémunération - RH', 0),
	(DEFAULT, -2.878, '2023-01-06', 'Rémunération - RH', 0),
	(DEFAULT, -17.147, '2023-01-06', 'Remboursement Emprunt', 3),
	(DEFAULT, -1.678, '2023-01-06', 'Achat matières premières', 4),
	(DEFAULT, -10.269, '2023-01-08', 'Achat matières premières', 4),
	(DEFAULT, -12.494, '2023-01-08', 'Achat matières premières', 4),
	(DEFAULT, -8.468, '2023-01-08', 'Achat matières premières', 4),
	(DEFAULT, -9.125, '2023-01-10', 'Rémunération - RH', 0),
	(DEFAULT, -10.956, '2023-01-10', 'Rémunération - RH', 0),
	(DEFAULT, -11.452, '2023-01-10', 'Rémunération - RH', 0),
	(DEFAULT, -14.346, '2023-01-10', 'Rémunération - RH', 0),
	(DEFAULT, -6.96, '2023-01-10', 'Rémunération - RH', 0),
	(DEFAULT, -9.294, '2023-01-10', 'Facture électricité', 1),
	(DEFAULT, -1.941, '2023-01-13', 'Impôts', 2),
	(DEFAULT, -3.074, '2023-01-14', 'Impôts', 2),
	(DEFAULT, -13.773, '2023-01-15', 'Paiement Loyer - Locaux', 5),
	(DEFAULT, -2.52, '2023-01-15', 'Facture électricité', 1),
	(DEFAULT, -4.44, '2023-01-15', 'intitulé', 6),
	(DEFAULT, -0.594, '2023-02-01', 'Facture électricité', 1),
	(DEFAULT, -6.426, '2023-02-01', 'Achat matières premières', 4),
	(DEFAULT, -14.147, '2023-02-11', 'Achat matières premières', 4),
	(DEFAULT, -13.52, '2023-02-17', 'Achat matières premières', 4),
	(DEFAULT, -13.825, '2023-02-18', 'Impôts', 2),
	(DEFAULT, -5.812, '2023-02-18', 'Impôts', 2),
	(DEFAULT, -17.433, '2023-02-19', 'Rémunération - RH', 0),
	(DEFAULT, -8.075, '2023-02-20', 'Rémunération - RH', 0),
	(DEFAULT, -19.18, '2023-02-20', 'Achat matières premières', 4),
	(DEFAULT, -10.595, '2023-02-21', 'Achat matières premières', 4),
	(DEFAULT, -10.274, '2023-02-21', 'Achat matières premières', 4),
	(DEFAULT, -11.589, '2023-02-22', 'Achat matières premières', 4),
	(DEFAULT, -10.337, '2023-02-23', 'Achat matières premières', 4),
	(DEFAULT, -1.464, '2023-02-23', 'Achat matières premières', 4),
	(DEFAULT, -3.047, '2023-02-25', 'Impôts', 2),
	(DEFAULT, -3.516, '2023-03-01', 'Rémunération - RH', 0),
	(DEFAULT, -3.132, '2023-03-03', 'Facture électricité', 1),
	(DEFAULT, -15.119, '2023-03-05', 'Facture électricité', 1),
	(DEFAULT, -5.046, '2023-03-08', 'Rémunération - RH', 0),
	(DEFAULT, -19.682, '2023-03-08', 'Rémunération - RH', 0),
	(DEFAULT, -20.983, '2023-03-08', 'Rémunération - RH', 0),
	(DEFAULT, -3.867, '2023-03-09', 'Rémunération - RH', 0),
	(DEFAULT, -10.768, '2023-03-10', 'Remboursement Emprunt', 3)
;


-- Les recettes : -- 
INSERT INTO entreprise.recette(idTransaction, montant, dateTransaction, intitulé, idClient, idProduit) VALUES 
	 (3.825,  18/07/23, '', 12, 62),
	( 3.979,  05/10/23, '', 15, 54),
	( 17.053,  20/08/23, '', 22, 46),
	( 0.98,  03/07/23, '', 1, 18),
	( 5.048,  22/10/23, '', 3, 34),
	( 39.45,  29/03/23, '', 17, 16),
	( 9.08,  16/06/23, '', 25, 4),
	( 6.193,  08/04/23, '', 24, 32),
	( 19.413,  10/11/23, '', 14, 60),
	( 8.276,  15/12/23, '', 8, 45),
	( 0.536,  01/08/22, '', 9, 8),
	( 6.015,  20/06/22, '', 2, 14),
	( 0.76,  17/02/22, '', 5, 21),
	( 9.093,  19/09/23, '', 16, 48),
	( 15.691,  12/12/23, '', 1, 13),
	( 12.565,  24/11/23, '', 7, 22),
	( 2.788,  20/09/22, '', 19, 61),
	( 1.478,  03/06/23, '', 23, 36),
	( 2.161,  14/04/23, '', 2, 37),
	( 0.871,  17/11/23, '', 9, 15),
	( 5.166,  11/09/23, '', 10, 60),
	( 4.49,  18/11/21, '', 12, 45),
	( 3.083,  07/04/23, '', 13, 39),
	( 5.252,  16/05/23, '', 18, 27),
	( 0.425,  20/12/23, '', 3, 18),
	( 8.662,  05/03/21, '', 17, 50),
	( 13.086,  26/01/23, '', 4, 61),
	( 5.566,  21/04/23, '', 20, 9),
	( 6.228,  24/06/23, '', 25, 7),
	( 2.987,  07/11/23, '', 14, 34),
	( 11.35,  11/10/22, '', 5, 49),
	( 11.628,  01/07/23, '', 18, 59),
	( 8.701,  16/02/23, '', 24, 31 ),
	( 12.009,  26/11/23, '', 6, 48),
	( 3.74,  04/03/23, '', 23, 16),
	( 3.586,  13/01/23, '', 10, 56),
	( 8.998,  16/01/23, '', 7, 42),
	( 4.871,  29/08/22, '', 21, 42),
	( 11.435,  06/02/23, '', 19, 32),
	( 2.718,  14/11/23, '', 6, 7),
	( 4.645,  20/01/23, '', 8, 55),
	( 2.408,  17/05/23, '', 13, 56),
	( 22.575,  28/06/23, '', 16, 21),
	( 9.256,  01/02/22, '', 10, 9),
	( 11.493,  22/11/23, '', 24, 13),
	( 19.84,  15/03/23, '', 17, 62),
	( 4.637,  25/07/23, '', 6, 52),
	( 7.916,  31/05/21, '', 12, 48),
	( 16.718,  04/09/22, '', 16, 18),
	( 61.382,  26/06/23, '', 13, 35),
	( 0.35,  19/12/23, '', 12, 19),
	( 9.512,  08/10/23, '', 7, 26);

-- Fin Insertion des données SQL --------------------------------------------------------


