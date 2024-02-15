/*liste de tous les schemas de notre BD*/
\dn *
/*visualisation du schéma lire*/
\dn lire
  Liste des schémas
 Nom  | Propriétaire 
------+--------------
 lire | aabdi
(1 ligne)
/*visualtisation de toutes les tables de lire*/
\dt lire.*
           Liste des relations
 Schéma |   Nom   | Type  | Propriétaire 
--------+---------+-------+--------------
 lire   | lecteur | table | aabdi
 lire   | livre   | table | aabdi
(2 lignes)
/*visualtisation de toutes les vues de lire*/
\dv lire.*
            Liste des relations
 Schéma |     Nom     | Type | Propriétaire 
--------+-------------+------+--------------
 lire   | infos       | vue  | aabdi
 lire   | infos_livre | vue  | aabdi
(2 lignes)
/*pareil pour les fonctions*/
\df lire.*

(a)

term1: SELECT inserer_lecteur('Drew');
term2: SELECT * FROM lecteur;
 num_lecteur |  nom  
-------------+-------
           1 | Alex
           2 | Brad
           3 | Creg
           4 | Drew


(b)

term1 : BEGIN;
term1 : SELECT inserer_lecteur('Eric');
term2 : non parce que on a pas commit
term1 : COMMIT;
term2 : oui

(c)

term1 : BEGIN;
term1 : SELECT emprunter(6, 4);
term1 : SELECT * FROM infos; /*livre 6 a bien été emprunté*/
term2 : SELECT * FROM infos; 
term2 : /*là non parce que on a pas commit*/
term2 : SELECT emprunter(7, 5);
term2 : /*livre 7 a bien été emprunté*/
term1 : /*là non parce que autocommit est off donc il faut commit*/
term1 : COMMIT;
term2 : /*livre 6 a bien été emprunté*/
term1 : /*rien, on a pas commit sur term2*/

(d)

term1 : CREATE TABLE impair(entier INT); et INSERT INTO impair (entier) VALUES (generate_series(1, 10));
term2 : SELECT * FROM impair; /*oui visible*/
term1 : BEGIN;
term1 : UPDATE impair SET entier = entier * 2
term2 : UPDATE impair SET entier = entier * 3; et /*prise en compte de l'UPDATE*/
term1 : COMMIT;
term2 : Que s’est-il passé ?
term1 : Vérifier le contenu de la table. Que s’est-il passé ?

(e)


term2 : CREATE TABLE imp (entier INT);INSERT INTO imp (entier) SELECT generate_series(1, 10);
term2 : BEGIN;
term1 : BEGIN;
term1 : UPDATE imp SET entier = entier + 1;
term2 : UPDATE imp SET entier = entier + 1;
term1 : UPDATE imp SET entier = entier + 1;
term1 : COMMIT;
term2 : Dans term2, les valeurs changent de une unité, mais ces modifications ne sont pas visibles par les autres sessions car 
transaction pas validée avec un COMMIT. Les changements sont en attente et ne sont visibles que dans term2.
term2 : SELECT * FROM imp;
term1 : les valeurs ont été incrémentées de deux unités. car deux UPDATE, chacune augmentant les valeurs de 1 et la transaction a été validée avec un COMMIT.
term1 : SELECT * FROM imp;







