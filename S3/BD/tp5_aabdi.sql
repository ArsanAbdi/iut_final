

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

