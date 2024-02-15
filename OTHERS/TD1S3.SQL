--/1

--1
CREATE FUNCTION pjeune() RETURNS INT AS $$ 
DECLARE ageMin int;
BEGIN
SELECT MIN(age) FROM vac.pers into ageMin;RETURN ageMin;END; $$ language plpgsql;
--2
CREATE FUNCTION nbetoile(id int) RETURNS int AS $$
DECLARE
etoiles int;
 BEGIN
select etoile from vac.club where idClub=id into etoiles; RETURN etoiles; END; $$ language plpgsql;
--3
CREATE OR REPLACE FUNCTION captotale(nomVille varchar) RETURNS int AS $$
DECLARE cap int;
BEGIN
select SUM(capacite) from vac.club where ville=nomVille into cap;RETURN cap;END; $$ language plpgsql;


--4
CREATE OR REPLACE FUNCTION areserve(idG int) RETURNS boolean AS $$ 
DECLARE ares boolean;
BEGIN 
select count(*) from RESA where idGrp=idG into ares; return ares;END;$$ language plpgsql;
--5

CREATE OR REPLACE FUNCTION actpratiquee(Clb int, valeurM varchar) RETURNS varchar AS $$
DECLARE act varchar;
BEGIN
select activite from groupe natural join resa where idClub=Clb and mois=valeurM into act;
IF (not found) THEN
act='Pas d activite';END IF;RETURN act;
END;$$ language plpgsql;

--6

CREATE OR REPLACE FUNCTION idplus1() RETURNS int AS $$
DECLARE idpls int;
BEGIN
select (max(idPers)) from vac.pers into idpls;
RETURN idpls+1;
END;$$ language plpgsql;

--/2

--1

CREATE OR REPLACE PROCEDURE inserpers(n varchar, a int, v varchar=NULL) AS $$
DECLARE ID int;
Begin 
select idplus1() into ID;
IF v is NULL then
INSERT INTO vac.Pers VALUES (ID, n , a, 'Paris');
else
INSERT INTO vac.Pers VALUES (ID, n , a, v);END IF;END;$$ language plpgsql;

--2

CREATE OR REPLACE PROCEDURE superclub(id int) AS $$ 
BEGIN 
DELETE FROM vac.Resa WHERE idClub = id;
DELETE FROM vac.club WHERE idClub = id;
END;
$$ language plpgsql;

--3

CREATE OR REPLACE PROCEDURE evalclub(id int) AS $$ 
DECLARE resa int;
BEGIN
resa=0;
select count(*) from vac.resa where idClub = id into resa;
IF resa = 0 THEN
update vac.club set etoile = etoile-1 where idClub=id;
END IF;
END;
$$ language plpgsql;

--4
CREATE OR REPLACE PROCEDURE verifage(id int) AS $$
DECLARE idgp int;
DECLARE verif int;
BEGIN
verif =0;
select age from vac.pers where idPers=id into verif;
IF verif < 18 THEN
	select idGrp from vac.groupe NATURAL JOIN vac.groupePers where idPers = id into idgp;
	DELETE FROM vac.groupePers where idPers = id;
	select count(*) from vac.groupe NATURAL JOIN vac.groupePers where idGrp=idgp into verif;
	IF verif = 0 THEN 
		DELETE FROM vac.Resa where idGrp=idgp;
	END IF;
END IF;
END;
$$ language plpgsql;
