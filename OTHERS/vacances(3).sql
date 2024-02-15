
DROP SCHEMA if exists vac cascade ;
CREATE SCHEMA vac;
SET search_path to public, vac;

-- DROP TABLE IF EXISTS Club, Pers, Groupe, GroupePers, Resa CASCADE;

CREATE TABLE vac.Club (
   idClub INTEGER PRIMARY KEY, 
   nom VARCHAR(30),
   ville VARCHAR(30),
   etoile INTEGER NOT NULL,
   capacite INTEGER NOT NULL );

CREATE TABLE vac.Pers (
   idPers INTEGER PRIMARY KEY, 
   nom VARCHAR(30),
   age INTEGER NOT NULL,
   ville VARCHAR(30) );

CREATE TABLE vac.Groupe (
   idGrp INTEGER PRIMARY KEY,
   activite VARCHAR(30) );

CREATE TABLE vac.GroupePers (
   idGrp INTEGER REFERENCES vac.Groupe(idGrp),
   idPers INTEGER REFERENCES vac.Pers(idPers),
   PRIMARY KEY (idPers, idGrp) );

CREATE TABLE vac.Resa (
   idGrp INTEGER REFERENCES vac.Groupe(idGrp),
   idClub INTEGER REFERENCES vac.Club(idClub),
   nbJour INTEGER,
   mois VARCHAR(30),
   PRIMARY KEY (idGrp, idClub) );

                                    /* Exo 1 */

CREATE OR REPLACE FUNCTION pJeune() RETURNS INT AS $$
   DECLARE
      
      ageMin INT;
   BEGIN

      SELECT min(age) FROM vac.pers INTO ageMin;
      RETURN ageMin;
   END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION nbrEtoiles(id INT) RETURNS INT AS $$
   DECLARE

      nbStars INT;
   BEGIN

      SELECT etoile FROM vac.Club WHERE idClub = id INTO nbStars; 
      RETURN nbStars;
   END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION idplus1() RETURNS INT AS $$
   DECLARE

      nbId INT := 0;
   BEGIN

      SELECT max(idPers) INTO nbId FROM vac.Pers; 
      RETURN nbId + 1;
   END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION idplus2() RETURNS vac.pers.idpers%type AS $$

   DECLARE 
      
      idPersonne vac.pers.idpers%type;
   BEGIN
      
      SELECT max(idpers) INTO idPersonne FROM pers;
      RETURN idPersonne + 1;
   END;
$$ LANGUAGE PLpgSQL;

CREATE OR REPLACE FUNCTION areserve(id INT) RETURNS BOOLEAN AS $$
   BEGIN

      PERFORM idGrp FROM vac.Resa WHERE idGrp = id;
      RETURN FOUND;
   END;
$$ LANGUAGE plpgsql;

                                    /* Exo 2 */

CREATE OR REPLACE PROCEDURE inserpers(nomChoisi vac.Pers.nom%type,ageChoisi vac.Pers.age%type,villeChoisi vac.Pers.ville%type=NULL) AS $$

   DECLARE

      id INT;
   BEGIN

      SELECT idplus1() INTO id;
      if(villeChoisi IS NULL) THEN

         INSERT INTO vac.Pers VALUES (id,nomChoisi,ageChoisi,'Paris');
      else 

         INSERT INTO vac.Pers VALUES (id,nomChoisi,ageChoisi,villeChoisi);
      end if;
   END;
$$ LANGUAGE PLPgSQL;

CREATE OR REPLACE PROCEDURE supclub(idClubChoisi vac.Club.idClub%type) AS $$

   BEGIN

      DELETE FROM vac.Resa WHERE idClub = idClubChoisi;
      DELETE FROM vac.Club WHERE idClub = idClubChoisi;
   END;
$$ LANGUAGE PLPgSQL;

CREATE OR REPLACE PROCEDURE evalclub(idClubChoisi vac.Club.idClub%type) AS $$

   BEGIN

      PERFORM * FROM vac.Resa WHERE idClub = idClubChoisi;
      if(FOUND IS NOT NULL) THEN

         UPDATE vac.Club
         SET etoile = etoile - 1
         WHERE idClub = idClubChoisi;
      end if;
   END;
$$ LANGUAGE PLPgSQL;

CREATE OR REPLACE PROCEDURE verifage(idPersChoisi vac.Pers.idPers%type) AS $$

   DECLARE

      agePersonneChoisi vac.Pers.age%type;
      idGrpPersonneChoisi vac.Groupe.idGrp%type;
      nbPersDansLeGroupe INT;
   BEGIN

      SELECT age FROM vac.Pers WHERE idPers = idPersChoisi INTO agePersonneChoisi;

      if(agePersonneChoisi < 18) THEN

         DELETE FROM vac.GroupePers WHERE idPers = idPersChoisi;
         DELETE FROM vac.Pers WHERE idPers = idPersChoisi;

         SELECT idGrp FROM vac.GroupePers WHERE idPers = idPersChoisi INTO idGrpPersonneChoisi;
         SELECT DISTINCT COUNT(*) FROM vac.GroupePers WHERE idGrp = idGrpPersonneChoisi INTO nbPersDansLeGroupe;

         if(nbPersDansLeGroupe <= 1) THEN

            DELETE FROM vac.Resa where idGrp=idGrpPersonneChoisi;
         end if;
      end if;
   END;
$$ LANGUAGE PLPgSQL;



















