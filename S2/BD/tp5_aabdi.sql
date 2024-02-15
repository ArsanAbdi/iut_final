DROP SCHEMA IF EXISTS commandes CASCADE;

CREATE SCHEMA commandes;

SET search_path TO commandes, public;

CREATE TABLE commandes.client (

	cli_id SERIAL PRIMARY KEY,
	cli_nom VARCHAR (50),
	cli_prenom VARCHAR (50)
);

CREATE TABLE commandes.commande (
	cmd_id SERIAL PRIMARY KEY,
	cmd_date DATE,
	cli_id INT,
	CONSTRAINT fK_commande_client FOREIGN KEY (cli_id) REFERENCES commandes.client (cli_id)
);

CREATE TABLE commandes.marque (

	mar_id SERIAL PRIMARY KEY,
	mar_nom VARCHAR (50)
);

CREATE TABLE commandes.produit (

	pdt_id SERIAL PRIMARY KEY,
	pdt_libelle VARCHAR (50),
	pdt_prix DECIMAL,
	mar_id INT,
	CONSTRAINT fK_produit_marque FOREIGN KEY (mar_id) REFERENCES commandes.marque (mar_id)
);

CREATE TABLE commandes.ligne (

	lig_numero INT,
	cmd_id INT,
	lig_quantite INT,
	pdt_id INT,
	CONSTRAINT pK_ligne PRIMARY KEY (cmd_id, lig_numero),
	CONSTRAINT fK_ligne_commande FOREIGN KEY (cmd_id) REFERENCES commandes.commande (cmd_id),
	CONSTRAINT fK_ligne_produit FOREIGN KEY (pdt_id) REFERENCES commandes.produit (pdt_id)
);



-- les données
insert into client(cli_nom,cli_prenom) values
 ('Dupond','Kevin'),
 ('Durand','Maria'),
 ('Dupré','Alex'),
 ('Dumont','Sophie');
 
insert into marque(mar_nom) values
 ('Badadis'),('Keni'),('Pakap');
 
insert into commande(cmd_date,cli_id) values
 ('2015-2-14',1),
 ('2015-2-22',2),
 ('2015-3-14',3),
 ('2015-4-17',1),
 ('2015-3-14',2),
 ('2015-1-8',2);
 
 
insert into produit(pdt_libelle,pdt_prix,mar_id) values
 ('raquette tennis',170.50,1),
 ('raquette tennis',258.70,3),
 ('club golf',112.55,3),
 ('ballon foot',78.17,2),
 ('chaussure running',88.85,1),
 ('maillot foot',45.85,3),
 ('maillot rugby',45.85,3),
 ('club golf',212.00,1),
 ('ballon basket',65.50,2),
 ('ballon rugby',67,2);
 

insert into ligne(cmd_id,lig_numero,lig_quantite,pdt_id) values
 (1,1,2,1),
 (1,2,1,3),
 (1,3,3,2),
 (2,1,2,5),
 (3,1,3,6),
 (3,2,4,9),
 (4,1,1,7),
 (4,2,5,6),
 (4,3,1,1),
 (4,4,2,2),
 (4,5,1,8),
 (5,1,3,8),
 (5,2,4,7),
 (5,3,1,9),
 (6,1,1,10);




CREATE VIEW v1 AS SELECT mar_nom, count(mar_id), avg(pdt_prix) FROM marque NATURAL JOIN produit GROUP BY mar_nom;
 
CREATE VIEW v2 AS SELECT cmd_id, cmd_date, cli_nom, sum(pdt_prix) FROM client NATURAL JOIN commande NATURAL JOIN ligne NATURAL JOIN produit GROUP BY cmd_id, cmd_date, cli_id;


CREATE VIEW v5 AS SELECT DISTINCT cmd_date, cli_nom, SUM(pdt_prix*lig_quantite) OVER (PARTITION BY cli_id) AS total FROM commande NATURAL JOIN ligne NATURAL JOIN client NATURAL JOIN produit GROUP BY cli_nom, cmd_id, cli_id, pdt_prix, lig_quantite;

