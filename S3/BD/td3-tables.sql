/*
TD BD S3
2023-2024
*/

/* Mise en place du schéma et création des tables */

DROP SCHEMA if exists declencheur cascade ;
CREATE SCHEMA declencheur;
SET search_path to declencheur;

create table Article (
    id int primary key,
    nom varchar,
    prix numeric
);

create table Facture (
    id int references Article,
    quantite int,
    prix_total numeric
);

create table Fabriquant (
    idFab int,
    nomFab varchar,
    adresse varchar
);

insert into Fabriquant (idFab, nomFab, adresse) values 
(201, 'HappyBuro', 'Montreuil'),
(202, 'OfficeBox', 'Paris'),
(203, 'BurroValley', 'Lille'),
(204, 'IciOffice', 'Nantes'),
(205, 'PapierCo', 'Dijon');

create table Produit (
    idProd int,
    nomProd varchar,
    prixProd numeric, 
    idFab int
);



create or replace function simulCleEtrangere() returns trigger as $$
DECLARE

    f Fabriquant;

    p Produit;
BEGIN

    if TG_OP = 'INSERT' then

        for f in SELECT * FROM Fabriquant loop

            if (NEW.idFab = f.idFab) then 
                return NEW;
            end if;    
        end loop;
        return NULL;
    end if;
    /*if TG_OP = 'DELETE' then

        for p in SELECT * FROM Produit loop

            if (OLD.idFab = p.idFab) then
                return NULL;
            end if;
        end loop;
        return OLD;
    end if; */
    if TG_OP = 'DELETE' then
    FOR p IN SELECT * FROM Produit LOOP
        IF OLD.idFab = p.idFab THEN
            RAISE EXCEPTION 'idFab % is still referenced in Produit', OLD.idFab;
            RETURN NULL;
        END IF;
    END LOOP;
    RETURN OLD;
end if;       

END;
$$ language plpgsql;


create trigger trig_inser_cle before 
insert or delete on Produit
for each row 
execute function simulCleEtrangere();



create or replace function inserprod() returns trigger as $$

BEGIN

IF NEW.prixProd <= 2 THEN 
    SELECT idFab INTO NEW.idFab FROM Fabriquant WHERE nomFab = 'HappyBuro';

ELSIF NEW.prixProd >= 5 THEN 
    SELECT idFab INTO NEW.idFab FROM Fabriquant WHERE nomFab = 'OfficeBox';

ELSIF NEW.nomProd = 'chemise' OR NEW.nomProd = 'classeur' THEN
    SELECT idFab INTO NEW.idFab FROM Fabriquant WHERE nomFab = 'BurroValley';

ELSE 
    SELECT idFab INTO NEW.idFab FROM Fabriquant WHERE nomFab = 'IciOffice';
END IF;

RETURN NEW;

END;
$$ language plpgsql;

create or replace procedure copieArticleDansProduit() as $$

DECLARE
    a article;
BEGIN
    FOR a IN SELECT * FROM Article LOOP
        insert into Produit (idProd, nomProd, prixProd) values (a.id, a.nom, a.prix);
    END LOOP;
END;
$$ language plpgsql;

create trigger trig_inser_produit before
insert on Produit
for each row
execute procedure inserprod();

insert into Article values 
(101, 'Classeur', 3.79),
(102, 'Agenda', 7.99),
(103, 'Ramette de papier', 5.49),
(104, 'Chemise à rabats', 2.89),
(105, 'Surligneur', 1.69),
(106, 'Crayon à papier', 0.59),
(107, 'Marqueur permanent', 1.19),
(108, 'Tube de colle', 0.45),
(109, 'Trousse', 4.99);



select * from Fabriquant;

select * from Produit;

insert into Produit (idProd, nomProd, prixProd, idFab) values (110, 'feutre', 1.99, 205);