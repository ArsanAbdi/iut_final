-- Titre :        lire.sql
-- auteur :       Laurent BRISSON 2019
-- modif : 		  IUT Montreuil 2023
-- Description :  Création des tables dans le schéma 'lire'
--

-- +----------------------------------------------------------------------------------------------------------------+
-- | Destruction 								                                                                    |
-- +----------------------------------------------------------------------------------------------------------------+


-- Attention a l'ordre dans lequel les drop sont effectués. Il faut que les tables
-- contenant des cles etrangeres sur d'autres tables soient dropees avant celles-ci
drop view if exists infos_livre;
drop view if exists infos;

drop table if exists livre;
drop table if exists lecteur;

drop sequence if exists lecteur_num_lecteur_seq;
drop sequence if exists livre_num_livre_seq;

drop FUNCTION if exists inserer_livre(varchar, varchar, varchar, int8);
drop FUNCTION if exists supprimer_livre(int8);
drop FUNCTION if exists inserer_lecteur(varchar);
drop FUNCTION if exists emprunter(int8,int8);
drop FUNCTION if exists rendre(int8);

drop schema if exists lire;

-- +----------------------------------------------------------------------------------------------------------------+
-- | Cr�ation du schéma 'lire', des tables 'lecteur' et 'livre' et des vues 'infos_livre' et 'infos'  	            |
-- +----------------------------------------------------------------------------------------------------------------+

create schema lire;
set search_path to lire;

create table lecteur
(
	num_lecteur		serial primary key,
	nom			      varchar(10)
);

create table livre
(
	num_livre		serial primary key,
	nom			    varchar(60),
	titre			  varchar(120),
	collection	varchar(30),
	coll_id			integer not null,
	lecteur_id	integer references lecteur (num_lecteur)
);


create view infos_livre (num_livre,titre,auteur,collection,lecteur) as
	(select num_livre,titre,livre.nom,collection, lecteur.nom
	from livre,lecteur
	where lecteur_id=num_lecteur);

create view infos(num_livre,lecteur_id) as
	(select num_livre,lecteur_id from livre);

-- +----------------------------------------------------------------------------------------------------------------+
-- | Cr�ation des proc�dures PLSQL d'insertion dans les tables                                            		    |
-- +----------------------------------------------------------------------------------------------------------------+

CREATE OR REPLACE FUNCTION inserer_livre(varchar, varchar, varchar, int8) RETURNS void AS $$
DECLARE
	nom ALIAS FOR $1;
	titre ALIAS FOR $2;
	collection ALIAS FOR $3;
	ref ALIAS FOR $4;
BEGIN
	insert into livre values(DEFAULT,nom,titre,collection,ref,NULL);
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION  supprimer_livre(int8) RETURNS void AS $$
DECLARE
	numlivre ALIAS FOR $1;
BEGIN
	delete from livre where num_livre=numlivre;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION  inserer_lecteur(varchar) RETURNS void AS $$
DECLARE
	nom ALIAS FOR $1;
BEGIN
	insert into lecteur values(DEFAULT,nom);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION  emprunter(int8, int8) RETURNS void AS $$
DECLARE
	numlivre ALIAS FOR $1;
	numlecteur ALIAS FOR $2;
BEGIN
	update livre
	set lecteur_id = numlecteur
	where num_livre=numlivre and lecteur_id is null;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION  rendre(int8) RETURNS void AS $$
DECLARE
	numlivre ALIAS FOR $1;
BEGIN
	update livre
	set lecteur_id = NULL
	where num_livre=numlivre;
END;
$$ LANGUAGE plpgsql;


-- +----------------------------------------------------------------------------------------------------------------+
-- | Insertion de donn�es                                                                                           |
-- +----------------------------------------------------------------------------------------------------------------+

SELECT inserer_lecteur('Alex');
SELECT inserer_lecteur('Brad');
SELECT inserer_lecteur('Creg');

SELECT inserer_livre('Kundera','Risibles amours', 'Folio', '1702');
SELECT inserer_livre('Kessel','La vallée des rubis','Folio','2560');
SELECT inserer_livre('Kundera','L''immortalité','Folio','2447');
SELECT inserer_livre('Léo Malet','Nestor Burma court la poupée','10-18','2110');
SELECT inserer_livre('Dos Passos','Aventures d''un jeune homme','Folio','1808');
SELECT inserer_livre('Kundera','Risibles amours', 'Folio', '1702');
SELECT inserer_livre('Kundera','Risibles amours', 'Folio', '1702');

SELECT emprunter(1, 2);
SELECT emprunter(2, 1);
SELECT emprunter(3, 2);
SELECT emprunter(4, 3);
SELECT emprunter(5, 3);

commit;
