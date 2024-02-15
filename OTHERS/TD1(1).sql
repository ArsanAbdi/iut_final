-- TD1

-- Fonctions


-- 1
DROP FUNCTION IF EXISTS pjeune(); 

CREATE FUNCTION pjeune() RETURNS int AS $$
DECLARE age int;
BEGIN
    SELECT MIN(pers.age) INTO age FROM pers;
    RETURN age;
END;
$$ LANGUAGE PLpgSQL;

-- 2 
DROP FUNCTION IF EXISTS nbetoile(int); 
CREATE FUNCTION nbetoile(id vac.club.idClub%type) RETURNS int AS $$
DECLARE etoiles int;
BEGIN
    SELECT club.etoile INTO etoiles FROM club WHERE idClub=id;
    RETURN etoiles;
END;
$$ LANGUAGE PLpgSQL;

-- 3
DROP FUNCTION IF EXISTS captotale(varchar); 
CREATE FUNCTION captotale(nomVille vac.club.ville%type) RETURNS int AS $$
DECLARE total vac.club.capacite%type;
BEGIN
    SELECT SUM(club.capacite) INTO total FROM club WHERE ville = nomVille;
    RETURN total;
END;
$$ LANGUAGE PLpgSQL;


-- 4
DROP FUNCTION IF EXISTS areserve(int); 

CREATE FUNCTION areserve(id vac.groupe.idgrp%type) RETURNS boolean AS $$
DECLARE
idG vac.groupe.idgrp%type;
BEGIN
    SELECT idgrp INTO idG FROM groupe NATURAL JOIN resa WHERE resa.idgrp = id;
    RETURN found;
END;
$$ LANGUAGE PLpgSQL;

-- 5
DROP FUNCTION IF EXISTS actpratiquee(int,varchar); 

CREATE FUNCTION actpratiquee(id vac.club.idclub%type, moisChoisi vac.resa.mois%type) RETURNS vac.groupe.activite%type AS $$
DECLARE
activite vac.groupe.activite%type;
BEGIN
    SELECT groupe.activite INTO activite FROM groupe NATURAL JOIN resa WHERE resa.mois = moisChoisi;
    IF(not found) THEN
        activite = 'Pas d activité';
    END IF;
    RETURN activite;
        
END;
$$ LANGUAGE PLpgSQL;

-- 6
DROP FUNCTION IF EXISTS idplus1(); 

CREATE FUNCTION idplus1() RETURNS vac.pers.idpers%type AS $$
DECLARE idPersonne vac.pers.idpers%type;
BEGIN
    SELECT max(idpers) INTO idPersonne FROM vac.pers;
    RETURN idPersonne+1;
END;
$$ LANGUAGE PLpgSQL;


-- Procédure

-- 1 
DROP PROCEDURE IF EXISTS inserpers(varchar,int,varchar);
CREATE PROCEDURE inserpers(nom vac.pers.nom%type,age vac.pers.age%type,ville vac.pers.ville%type=NULL) AS $$
BEGIN
    if(ville is null) THEN
        INSERT INTO vac.pers VALUES (idplus1(),nom,age,'Paris');
    else  
        INSERT INTO vac.pers VALUES (idplus1(),nom,age,ville);
    end if;
END;
$$ LANGUAGE PLpgSQL;

-- 2
CREATE OR REPLACE PROCEDURE supclub(id vac.club.idclub%type) AS $$ 
BEGIN
    DELETE FROM vac.resa WHERE idClub = id; 
    DELETE FROM vac.club WHERE idClub = id;
END;
$$ LANGUAGE PLpgSQL;

-- 3 
CREATE OR REPLACE PROCEDURE evalclub(id vac.club.idclub%type) AS $$ 
BEGIN
    IF (id not in (SELECT idclub from vac.resa)) THEN
        UPDATE vac.club SET etoile = etoile - 1 WHERE idclub = id;
    ELSE 
        RAISE INFO 'Le club a été réservé';
    END IF;
END;
$$ LANGUAGE PLpgSQL;

-- 4 
CREATE OR REPLACE PROCEDURE verifage(id vac.pers.idpers%type) AS $$
DECLARE age vac.pers.age%type; 
idgroupe vac.groupepers.idgrp%type;
nbPers INT;
BEGIN
    SELECT pers.age INTO age FROM vac.pers WHERE idpers = id;
    
    IF (age < 18) THEN
        SELECT idgrp INTO idgroupe FROM vac.groupepers WHERE id=idpers;

        DELETE FROM vac.GroupePers WHERE idpers = id;
    
        SELECT COUNT(*) INTO nbPers FROM vac.groupepers WHERE idgrp=idgroupe;

        IF (nbPers is null) THEN
            DELETE FROM vac.resa WHERE idgrp = idgroupe;
            RAISE INFO 'Le groupe est vide et a donc été supprimé des réservations'
        ELSE 
            RAISE INFO 'Il n"y a pas de réservation pour ce groupe';
        END IF;
        DELETE FROM vac.pers WHERE idpers=id;
        RAISE INFO 'La personne a été supprimé.'
    ELSE
        RAISE INFO 'La personne est majeure';
    END IF;

END;
$$ LANGUAGE PLpgSQL;


        
    