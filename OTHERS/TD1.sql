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
    SELECT max(idpers) INTO idPersonne FROM pers;
    RETURN idPersonne+1;
END;
$$ LANGUAGE PLpgSQL;


-- Procédure

-- 1 
DROP PROCEDURE IF EXISTS inserpers(varchar,int,varchar);
CREATE PROCEDURE inserpers(nom vac.pers.nom%type,age vac.pers.age%type,ville vac.pers.ville%type) AS $$
BEGIN
    if(ville not found) THEN
        INSERT INTO pers VALUES (idplus1,nom,age,ville);
END;
$$ LANGUAGE PLpgSQL;

