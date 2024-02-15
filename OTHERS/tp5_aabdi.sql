















-- les données
insert into client(cli_nom,cli_prenom) values
 ('Dupond','Kevin'),
 ('Durand','Maria'),
 ('Dupré','Alex'),
 ('Dumont','Sophie');
 
insert into marque(mar_nom) values
 ('Badadis'),('Keni'),('Pakap');
 
insert into commande(cmd_date,cli_id) values
 ('2015-2-14',1),
 ('2015-2-22',2),
 ('2015-3-14',3),
 ('2015-4-17',1),
 ('2015-3-14',2),
 ('2015-1-8',2);
 
 
insert into produit(pdt_libelle,pdt_prix,mar_id) values
 ('raquette tennis',170.50,1),
 ('raquette tennis',258.70,3),
 ('club golf',112.55,3),
 ('ballon foot',78.17,2),
 ('chaussure running',88.85,1),
 ('maillot foot',45.85,3),
 ('maillot rugby',45.85,3),
 ('club golf',212.00,1),
 ('ballon basket',65.50,2),
 ('ballon rugby',67,2);
 

insert into ligne(cmd_id,lig_numero,lig_quantite,pdt_id) values
 (1,1,2,1),
 (1,2,1,3),
 (1,3,3,2),
 (2,1,2,5),
 (3,1,3,6),
 (3,2,4,9),
 (4,1,1,7),
 (4,2,5,6),
 (4,3,1,1),
 (4,4,2,2),
 (4,5,1,8),
 (5,1,3,8),
 (5,2,4,7),
 (5,3,1,9),
 (6,1,1,10);
 
