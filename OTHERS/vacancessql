
DROP SCHEMA if exists vac cascade ;
CREATE SCHEMA vac;

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



