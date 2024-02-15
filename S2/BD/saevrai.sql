/* -----------------------------------------------------------------------
BASE de DONNEES : IUT
Version : 2.0
Auteur : Matthias TRUPIN - Baptiste BLANCHET - Arsan ABDI
Date création : 20/03/2023
------------------------------------------------------------------------- */

DROP SCHEMA IF EXISTS entreprise CASCADE;
CREATE SCHEMA entreprise;

SET search_path TO entreprise, public; 

-- Création des tables SQL : --------------------------------------------------

CREATE TABLE produit(
	idProduit SERIAL,
	categorie VARCHAR (50),
	modele VARCHAR (50),

	CONSTRAINT pk_produit PRIMARY KEY (idProduit)
);

CREATE TABLE client (
	idClient SERIAL,
	nom VARCHAR (50),
	ville VARCHAR (50),

	CONSTRAINT pk_client PRIMARY KEY (idClient)
);



CREATE TABLE transaction (
	idTransaction SERIAL,
	montant FLOAT,
	mois INT,
	annee INT,
	intitulé VARCHAR (50),

    CONSTRAINT pk_transaction PRIMARY KEY (idTransaction)
);


CREATE TABLE posteDepense (
	idPoste INT,
	typeDepense VARCHAR (50),

	CONSTRAINT pk_posteDepense PRIMARY KEY (idPoste)
);


CREATE TABLE depense(
	idPosteDepense INT,

	CONSTRAINT pk_depense PRIMARY KEY (idTransaction),
	CONSTRAINT fk_depense FOREIGN KEY (idPosteDepense) REFERENCES entreprise.posteDepense(idPoste)
)INHERITS(entreprise.transaction);


CREATE TABLE recette(
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
INSERT INTO produit (idProduit, categorie, modele) VALUES
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
INSERT INTO posteDepense (idPoste, typeDepense) VALUES
	(0, 'Salaire'),
	(1, 'Electricité'),
	(2, 'Impôts'),
	(3, 'Remboursement Emprunt'),
	(4, 'Matière Première'),
	(5, 'Loyer'),
	(6, 'Maintenance'),
	(7, 'Note de Frais'),
	(8, 'Maintenance / fournitures');

-- Les clients : --
INSERT INTO client (idClient, nom, ville) VALUES
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
INSERT INTO depense(idTransaction, montant, mois, annee, intitulé, idPosteDepense) VALUES
    (DEFAULT, -8.302, 1, 2019, 'Facture électricité', 1),
    (DEFAULT, -19.887, 2, 2019, 'Impôts', 2),
    (DEFAULT, -1.197, 3, 2019, 'Paiement Loyer - Locaux', 5),
    (DEFAULT, -19.073, 4,2019, 'Note de Frais', 7),
    (DEFAULT, -5.099, 5,2019, 'Rémunération - RH', 0),
    (DEFAULT, -34.944, 6,2019, 'Rémunération - RH', 0),
    (DEFAULT, -16.015, 7,2019, 'Rémunération - RH', 0),
    (DEFAULT, -2.878, 8,2019, 'Rémunération - RH', 0),
    (DEFAULT, -17.147, 9,2019, 'Remboursement Emprunt', 3),
    (DEFAULT, -1.678, 10,2019, 'Achat matières premières', 4),
    (DEFAULT, -10.269, 11,2019, 'Achat matières premières', 4),
    (DEFAULT, -12.494, 12,2019, 'Achat matières premières', 4),
    (DEFAULT, -8.468, 1,2020, 'Achat matières premières', 4),
    (DEFAULT, -9.125, 2,2020, 'Rémunération - RH', 0),
    (DEFAULT, -10.956, 3,2020, 'Rémunération - RH', 0),
    (DEFAULT, -11.452, 4,2020, 'Rémunération - RH', 0),
    (DEFAULT, -14.346, 5,2020, 'Rémunération - RH', 0),
    (DEFAULT, -6.96, 6,2020, 'Rémunération - RH', 0),
    (DEFAULT, -9.294, 7,2020, 'Facture électricité', 1),
    (DEFAULT, -1.941, 8,2020, 'Impôts', 2),
    (DEFAULT, -3.074, 9,2020, 'Impôts', 2),
    (DEFAULT, -13.773, 10,2020, 'Paiement Loyer - Locaux', 5),
    (DEFAULT, -2.52, 11,2020, 'Facture électricité', 1),
    (DEFAULT, -4.44, 12,2020, 'intitulé', 6),
    (DEFAULT, -0.594, 1,2021, 'Facture électricité', 1),
    (DEFAULT, -6.426, 2,2021, 'Achat matières premières', 4),
    (DEFAULT, -14.147, 3,2021, 'Achat matières premières', 4),
    (DEFAULT, -13.52, 4,2021, 'Achat matières premières', 4),
    (DEFAULT, -13.825, 5,2021, 'Impôts', 2),
    (DEFAULT, -5.812, 6,2021, 'Impôts', 2),
    (DEFAULT, -17.433, 7,2021, 'Rémunération - RH', 0),
    (DEFAULT, -8.075, 8,2021, 'Rémunération - RH', 0),
    (DEFAULT, -19.18, 9,2021, 'Achat matières premières', 4),
    (DEFAULT, -10.595, 10,2021, 'Achat matières premières', 4),
    (DEFAULT, -10.274, 11,2021, 'Achat matières premières', 4),
    (DEFAULT, -11.589, 12,2021, 'Achat matières premières', 4),
    (DEFAULT, -10.337, 1,2022, 'Achat matières premières', 4),
    (DEFAULT, -1.464, 2, 2022, 'Achat matières premières', 4),
    (DEFAULT, -3.047, 3,2022, 'Impôts', 2),
    (DEFAULT, -3.516, 4,2022, 'Rémunération - RH', 0),
    (DEFAULT, -3.132, 5,2022, 'Facture électricité', 1),
    (DEFAULT, -15.119, 6,2022, 'Facture électricité', 1),
    (DEFAULT, -5.046, 7,2022, 'Rémunération - RH', 0),
    (DEFAULT, -19.682, 8,2022, 'Rémunération - RH', 0),
    (DEFAULT, -20.983, 9,2022, 'Rémunération - RH', 0),
    (DEFAULT, -3.867, 10,2022, 'Rémunération - RH', 0),
    (DEFAULT, -10.768, 11,2022, 'Remboursement Emprunt', 3);
  
-- Les recettes : --
INSERT INTO recette(montant, mois, annee, intitulé, idClient, idProduit) VALUES
   
    (  61.382,  1, 2019, '', 16, 18),
    (  16.718, 2, 2019, '', 13, 35),
    (  0.35,  3, 2019, '', 12, 19),
    (  9.512, 4, 2019, '', 7, 26),
    (  5.048, 5, 2019, '', 3, 34),
    (  39.45, 6, 2019, '', 17, 16),
    (  9.08,  7, 2019, '', 16, 4),
    (  6.193,  8, 2019, '', 9, 32),
    (  19.413, 9, 2019, '', 14, 60),
    (  8.276, 10, 2019, '', 8, 45),
    (  0.536,  11, 2019, '', 9, 8),
    (  6.015, 12, 2019, '', 2, 14),
    (  8.998, 1, 2020, '', 7, 42),
    (  4.871, 2, 2020, '', 21, 42),
    (  11.435, 3, 2020, '', 19, 32),
    (  2.718,  4, 2020, '', 6, 7),
    (  4.645, 5, 2020, '', 8, 55),
    (  2.408, 6, 2020, '', 13, 56),
    (  22.575,  7, 2020, '', 16, 21),
    (  9.256,   8, 2020, '', 10, 9),
    (  11.493,  9, 2020, '', 5, 13),
    (  19.84,  10, 2020, '', 17, 62),
    (  4.637,  11, 2020, '', 6, 52),
    (  7.916, 12, 2020, '', 12, 48),
    (  8.662, 2, 2021, '', 17, 50),
    (  13.086, 3, 2021, '', 4, 61),
    (  5.566, 4, 2021, '', 20, 9),
    (  6.228,  5, 2021, '', 7, 7),
    (  2.987,  6, 2021, '', 14, 34),
    (  11.35, 7, 2021, '', 5, 49),
    (  11.628,  8, 2021, '', 18, 59),
    (  8.701,  9, 2021, '', 20, 31 ),
    (  12.009, 10, 2021, '', 6, 48),
    (   3.74, 11, 2021, '', 2, 16),
    (  3.586, 12, 2021, '', 10, 56),
    (  0.76, 1, 2022, '', 5, 21),
    (  9.093,  2, 2022, '', 16, 48),
    (  15.691, 3, 2022, '', 1, 13),
    (  12.565, 4, 2022, '', 7, 22),
    (  2.788, 5, 2022, '', 19, 61),
    (  1.478, 6, 2022, '', 21, 36),
    (  2.161, 7, 2022, '', 2, 37),
    (  0.871, 8, 2022, '', 9, 15),
    (  5.166, 9, 2022, '', 10, 60),
    (  4.49, 10, 2022, '', 12, 45),
    (  3.083,  11, 2022, '', 13, 39),
    (  5.252, 12, 2022, '', 18, 27),
    (  0.425,  1, 2021, '', 3, 18),
    ( 3.825,  1, 2023, '', 12, 62),
    ( 3.979,  2, 2023, '', 15, 54),
    ( 17.053,   3, 2023, '', 22, 46),
    ( 0.98,  4, 2023, '', 1, 18);
   
-- Fin Insertion des données SQL --------------------------------------------------------

/*Requete 1 
select distinct d1.idTransaction, d1.montant, d1.dateTransaction, d1.intitulé, d1.idPosteDepense , sum(d2.montant) Over( partition by d1.idTransaction)
from depense d1 left join depense d2 on (d1.idTransaction >= d2.idTransaction);
*/



/*Requete 2*/

/*
SELECT r.idTransaction , moyenne, abs(r.montant-moyenne) as difference
FROM recette r INNER JOIN (SELECT r2.idTransaction, avg(montant) OVER() as moyenne
FROM recette r2) as moyenne_print ON (moyenne_print.idTransaction = r.idTransaction);
*/

/*
Requete 3
*/




SELECT DISTINCT(annee, FLOOR((mois+2)/3)) as trimestre, SUM(montant) OVER (partition by (annee, FLOOR((mois+2)/3))) as bilan
from transaction
WHERE (annee>=2021) AND (annee<=2022);


/****** Propres requêtes SQL :  ****************/

-- 1) Ordonnez les meilleurs clients habitant Paris dans l'ordre décroissant




-- 2) Quelles sont les transactions qui ont le même numéro de mois parmi celles qui ont le même poste de dépense?
--    Ne lister qu'une seule fois chaque paire de transactions.
-- 2Bis) Durant l'année 2020, listez les poste de dépenses qui ont coûté le plus cher à l'entreprise dans l'ordre croissant, en indiquant leur coût.

SELECT distinct t1.*, t2.*
from depense t1 inner join depense t2 on (t1.mois=t2.mois) and (t1.posteDepense=t2.posteDepense)
where t1.idTransaction<t2.idTransaction;

-- 2Bis) Durant l'année 2020, listez les poste de dépenses qui ont coûté le plus cher à l'entreprise dans l'ordre croissant, en indiquant leur coût.

SELECT distinct posteDepense.*, SUM(montant) OVER (partition by idPosteDepense) as coutPosteDeDepense
from posteDepense natural join depense INNER JOIN (SELECT idTransaction from depense where annee=2020) as annee2020 on (annee2020.idTransaction=depense.idTransaction)
ORDER BY SUM(montant) OVER (partition by idPosteDepense);



-- 3) Pour chaque produit, quelle est la somme générée en recettes, 
--    donnez sa catégorie et la somme des recettes de chaque catégorie.


SELECT distinct produit.*, SUM(montant) OVER (partition by idProduit) as recettesProduit, c.recettesCategorie as recettesCategorie
from produit natural join recette INNER JOIN (SELECT distinct categorie, SUM(montant) OVER (partition by categorie) as recettesCategorie
from produit natural join recette) as c on (c.categorie = produit.categorie);


