/*EXO 1*/


/*(a)*/


BEGIN;  
/*(démarrer transaction)*/

INSERT INTO GARDIEN VALUES (80, 'Durand', 'aa', '1990-01-16'); 
/*insert dans la table gardien d'un gardien qui s'appelle Durand, dont son numgardien est 80, son adresse est aa 
et pour finir sa date d'arrivée est le 16/01/1990*/

SELECT * FROM GARDIEN ; 
/*visualisation de tous les gardiens de la table gardien après insertion du gardien dans la table gardien*/

ROLLBACK ; 
/*ça annule la dernière requête, c'est-à-dire l'insertion du nouveau gardien (Durand)*/

SELECT * FROM GARDIEN ; 
/*visualisation de tous les gardiens de la table gardien après rollback, c'est-à-dire sans la 
ligne du gardien ,(Durand) qui a été ajouté*/



/*(b)*/


BEGIN;
/*(démarrer transaction)*/

INSERT INTO GARDIEN VALUES (800, 'Dupont', 'aa', '1990-01-16');
/*insertion dans table gardien d'un gardien qui s'appelle Dupont, son numgardien est 800, 
son adresse est aa et sa date d'arrivée est le 16/01/1990*/

SELECT * FROM GARDIEN;
/*visualisation de tous les gardiens de la table gardien après insertion du gardien (Dupont) dans cette table*/

SAVEPOINT pointControl;
/*création d'un point de sauvegarde dans la transaction où l'on pourra revenir par la suite je pense*/

INSERT INTO GARDIEN VALUES (900, 'Durand', 'aa', '1990-01-16');
/*insertion d'une nouvelle ligne dans table gardien d'un gardien qui s'appelle Durand, son numgardien est 900, 
son adresse est aa et sa date d'arrivée est le 16/01/1990*/

SELECT * FROM GARDIEN;
/*visualisation de tous les gardiens de la table gardien après insertion du 
gardien (Durand) dans cette table (3lignes au total)*/

ROLLBACK TO pointControl;
/*annule toutes les modifications effectuées après le SAVEPOINT qui s'appelle pointControl, 
c'est-à-dire la deuxième insertion de la transaction (celle de Durand)*/

SELECT * FROM GARDIEN ;
/*visualisation de lous les gardiens de la table gardien après le rollback, c'est-à-dire que 
l'insertion de la ligne de Durand est annulée*/

ROLLBACK;
/*annule toutes les modifications depuis le début de la transaction (y compris la première insertion)*/

SELECT * FROM GARDIEN ;
/*affiche les lignes sans aucune des insertions précédentes*/



/*(c)*/


BEGIN;
/*(démarrer transaction)*/

INSERT INTO GARDIEN VALUES (80, 'Durand', 'aa', '1990-01-16');
/*insert dans la table gardien d'un gardien qui s'appelle Durand, dont son numgardien est 80, 
son adresse est aa et pour finir sa date d'arrivée est le 16/01/1990*/

SELECT * FROM GARDIEN;
/*visualisation de tous les gardiens de la table gardien après insertion du gardien dans la table gardien*/

COMMIT;
/*valide toutes les modifications effectuées dans la transaction. La nouvelle ligne est 
maintenant définitivement dans la table et un rollback ne pourrait pas l'annuler*/

SELECT * FROM GARDIEN;
/*visualisation de tous les gardiens de la table gardien après commit du coup 
affichage de toutes les lignes, y compris la nouvelle ligne insérée*/



/*(d)*/


BEGIN;
/* démarrage première transaction*/

INSERT INTO GARDIEN VALUES (7, 'Pedri', 'aa', '1990-01-16'); 
/*insère nouvelle ligne dans table gardien avec les infos 7, 'Pedri', 'aa', '1990-01-16'*/

INSERT INTO GARDIEN VALUES (8, 'Joao', 'aa', '1990-01-16'); 
/*insère nouvelle ligne dans table gardien avec les infos 8, 'Joao', 'aa', '1990-01-16'*/

INSERT INTO GARDIEN VALUES (9, 'Raphi', 'aa', '1990-01-16'); 
/*insère nouvelle ligne dans table gardien avec les infos 9, 'Raphi', 'aa', '1990-01-16'*/

COMMIT; 
/*valide toutes les modifications effectuées dans la transaction. Les nouvelles lignes sont 
maintenant définitivement dans la table et un rollback ne pourrait pas l'annuler*/

INSERT INTO GARDIEN VALUES (10, 'Frenkie', 'aa', '1990-01-16'); 
/*insère nouvelle ligne dans table gardien avec les infos 10, 'Frenkie', 'aa', '1990-01-16'*/

UPDATE GARDIEN SET adresse = 'bb' WHERE nom = 'Frenkie'; 
/*modif adresse = 'bb' sur toutes les lignes dont le nom est Frenkie*/

DELETE FROM GARDIEN WHERE nom = 'Raphi'; 
/*supprime les lignes dont le nom = 'Raphi'*/

BEGIN; 
/*démarre nouvelle transaction*/

SELECT * FROM GARDIEN; 
/*selection de tous les gardiens de la table gardien, c'est-à-dire aussi avec les gardiens 
qu'on a inséré dans la première transactionmais sans le gardien qui s'appelle 'Raphi' car on l'avait supprimé*/

UPDATE GARDIEN SET nom = 'bonjour' WHERE nom = 'Pedri'; 
/*modif nom = 'bonjour' sur toutes les lignes dont le nom est Pedri*/

UPDATE GARDIEN SET nom = 'bonsoir' WHERE nom = 'Joao'; 
/*modif nom = 'bonsoir' sur toutes les lignes dont le nom est Joao*/

SELECT * FROM GARDIEN; 
/*selection de tous les gardiens de la table gardien après avoir modifié les lignes dont leur nom = 'Pedri' et 'Joao'*/

ROLLBACK; 
/*annule les modifications apportées dans cete transaction uniquement du coup sans les update*/

SELECT * FROM GARDIEN; 
/*visualisation de tous les gardiens de la table gardien après rollback, c'est-à-dire que les noms 'Pedri' et 'Joao' sont rétablies*/


/*EXO 2*/



/*(a)*/


BEGIN;
/*démarre transaction*/

INSERT INTO GARDIEN VALUES (null, 'Dupont', 'Montreuil', '1970-10-25');
/*tentative d'insertion d'un nouveau gardien mais ça ne marche pas car il est obligatoire de 
mentionner une valeur pour la colonne numGardien sinon ça viole sa contrainte de clé primaire*/
/*je cite le terminal: une valeur NULL viole la contrainte NOT NULL de la colonne « numgardien »*/

SELECT * FROM GARDIEN;
/*affiche toutes les lignes de la table gardien mais sans l'insertion 
du gardien du dessus car la tentative n'a pas marché */

COMMIT;
/*valide toutes les modifications effectuées dans la transaction, donc aucune vu que l'on a rien modifié dans cette transaction 
on peut alors dire que ça commit rien d'autre que ce qu'il y a déjà dans la table à l'origine*/


SELECT * FROM GARDIEN;
/*affiche toutes les lignes de la table gardien*/



/*(b)*/


BEGIN; 
/*démarre transaction*/

INSERT INTO GARDIEN VALUES (85, 'Dupont', 'Montreuil', '1970-10-25');
/*tentative d'insertion d'un nouveau gardien mais ça ne marche pas car il existe déjà un gardien dont le numGardien est 85*/

SELECT * FROM GARDIEN where nom = 'Dupont';
/*erreur dans la transaction du coup tout ce que l'on fait après sera annulé
je cite le terminal: la transaction est annulée, les commandes sont ignorées jusqu'à la fin du bloc de la transaction
*/

COMMIT ;
/*enregistre les modifications apportées dans cette transaction, c'est-à-dire rien*/

SELECT * FROM GARDIEN where nom = 'Dupont';
/*affiche la table gardien avec aucune ligne car l'insertion n'a pas marché et il n'y a donc pas de 'Dupont' dans la table*/


