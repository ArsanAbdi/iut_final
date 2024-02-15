--
-- PostgreSQL database dump
-- Auteur : Nicolas CANDIA
-- Date création : 10-10-2013
-- Revision faite par M. Cataldi
--
DROP SCHEMA if exists rec cascade ;
CREATE SCHEMA rec;

CREATE TABLE rec.ingredient (
    idingr integer,
    nomingr character varying(32) NOT NULL unique,
	protide real,
	lipide real,	
	glucide real,
	calorie real,
	CONSTRAINT pk_ingredient PRIMARY KEY (idingr)
);

CREATE TABLE rec.recette (
    idrec integer,
    titre character varying(128) NOT NULL,
    nbpers integer NOT NULL,
	categorie varchar(32),
	vegetarien boolean default 'false',
	glutenFree boolean default 'false',
    avisInternaute integer,
    niveau character varying(32) NOT NULL,
    cout money NULL,
    tpsprepa smallint,
    tpscuisson smallint,
    tpsrepos smallint,
    texterec text NOT NULL,
    img text,
	CONSTRAINT pk_recette PRIMARY KEY (idrec)
	);


CREATE TABLE rec.utiliser (
    idrec integer,
    idingr integer,
    quantite real NOT NULL,
    unite character varying(16),
	CONSTRAINT pk_utiliser PRIMARY KEY (idrec, idingr),
	CONSTRAINT fk_utiliser_ingredient FOREIGN KEY (idingr) REFERENCES rec.ingredient(idingr),
	CONSTRAINT fk_utiliser_recette FOREIGN KEY (idrec) REFERENCES rec.recette(idrec)
);



-- Completed on 2013-10-10 15:14:54 CEST

--
insert into rec.ingredient values (1,'Abricot (Boîte, sucre)',  0.6, 0.1, 22, 91.3);
insert into rec.ingredient values (2,'Abricot (frais)',0.9,0.2,12.8,56.6);
insert into rec.ingredient values (3,'Abricot (sec)',5,0.5,66.5,290.5);
insert into rec.ingredient values (4,'Agrumes',0.7,0.2,10,44.6);
insert into rec.ingredient values (5,'Akènes',16.5,57,16,643);
insert into rec.ingredient values (6,'Ananas (Boîte, sucre)',0.3,0.1,19.4,79.7);
insert into rec.ingredient values (7,'Ananas (frais)',0.4,0.2,12.2,52.2);
insert into rec.ingredient values (8,'Artichaut',2.7,0.2,10.6,55);
insert into rec.ingredient values (9,'Aubergine',1.2,0.2,5.6,29);
insert into rec.ingredient values (10,'Avocat',2.2,17,6,185.8);
insert into rec.ingredient values (11,'Avoine (flocons)',14,7,66,383);
insert into rec.ingredient values (12,'Banane',1.4,0.2,23,99.4);
insert into rec.ingredient values (13,'Betterave rouge',1.6,0.1,9.9,46.9);
insert into rec.ingredient values (14,'Beurre',0.8,84,0.5,761.2);
insert into rec.ingredient values (15,'Biscotte',11,7,75,407);
insert into rec.ingredient values (16,'Boeuf bourguignon',34.5,23,9,381);
insert into rec.ingredient values (17,'Boeuf cervelle',10.4,8,0.8,116.8);
insert into rec.ingredient values (18,'Boeuf coeur',17,6,0.6,124.4);
insert into rec.ingredient values (19,'Boeuf langue',19,16,0.4,221.6);
insert into rec.ingredient values (20,'Boeuf maigre',20,9, null,161);
insert into rec.ingredient values (21,'Boeuf rognon',15.4,6.7,0.9,125.5);
insert into rec.ingredient values (22,'Boeuf tripes',19,2, null,94);
insert into rec.ingredient values (23,'Cacahuète grillée',26.2,48.7,20.6,625.5);
insert into rec.ingredient values (24,'Cacao',19,24,38,444);
insert into rec.ingredient values (25,'Cake',4.94,14.72,29.37,269.72);
insert into rec.ingredient values (26,'Canard',16,28.6, null,321.4);
insert into rec.ingredient values (27,'Carotte (Boîte)',0.8,0.3,6.7,32.7);
insert into rec.ingredient values (28,'Carotte (fraîche)',1.2,0.2,8.5,40.6);
insert into rec.ingredient values (29,'Céleri (cote)',1.3,0.2,3.7,21.8);
insert into rec.ingredient values (30,'Céleri (rave)',1.8,0.3,8.5,43.9);
insert into rec.ingredient values (31,'Cerise',1.2,0.4,14.6,66.8);
insert into rec.ingredient values (32,'Champignon Paris',2.8,0.24,0.9,16.96);
insert into rec.ingredient values (33,'Charcuterie (pâté)',160,560,64,5936);
insert into rec.ingredient values (34,'Châtaigne, Marron',4,2.6,40,199.4);
insert into rec.ingredient values (35,'Cheval',22,2.7,0.5,114.3);
insert into rec.ingredient values (36,'Chips',5.3,39.8,50,579.4);
insert into rec.ingredient values (37,'Chocolat au lait',7.7,32.3,56.9,549.1);
insert into rec.ingredient values (38,'Chocolat noir',4,28,64,524);
insert into rec.ingredient values (39,'Chou blanc',1.4,0.2,5.7,30.2);
insert into rec.ingredient values (40,'Chou brocoli',3.6,0.3,5.9,40.7);
insert into rec.ingredient values (41,'Chou Bruxelle',4.7,0.4,8.7,57.2);
insert into rec.ingredient values (42,'Chou fleur',2.7,0.2,5.2,33.4);
insert into rec.ingredient values (43,'Chou rouge',1.5,0.2,5.9,31.4);
insert into rec.ingredient values (44,'Choucroute',1,0.2,4,21.8);
insert into rec.ingredient values (45,'Clafouti',7.09,3.81,48,254.65);
insert into rec.ingredient values (46,'Coca', null, null,10,40);
insert into rec.ingredient values (47,'Compote de pommes',0.5,4,74,334);
insert into rec.ingredient values (48,'Concombre',0.8,0.1,3,16.5);
insert into rec.ingredient values (49,'Confiture',0.5,0.1,70,282.9);
insert into rec.ingredient values (50,'Coq au vin',53.5,24,8,462);
insert into rec.ingredient values (51,'Corn flakes',7.9,0.04,85.3,373.16);
insert into rec.ingredient values (52,'Cornichon',0.8,0.1,3,16.1);
insert into rec.ingredient values (53,'Courge',0.8,0.1,3.5,18.1);
insert into rec.ingredient values (54,'Courgette',1.2,0.1,3.6,20.1);
insert into rec.ingredient values (55,'Crabe',17.4,2.5,1.1,96.5);
insert into rec.ingredient values (56,'Crème fraîche (30% MG)',3,30,3.5,296);
insert into rec.ingredient values (57,'Crêpe au jambon',7.4,5.8,21.5,167.8);
insert into rec.ingredient values (58,'Cresson',1.7,0.3,3.3,22.7);
insert into rec.ingredient values (59,'Crevette grise',18.7,2.2, null,94.6);
insert into rec.ingredient values (60,'Croque Monsieur',9.7,15.62,17.15,247.98);
insert into rec.ingredient values (61,'Datte',2.2,0.6,73,306.2);
insert into rec.ingredient values (62,'Dinde',20.1,14.7,0.4,214.3);
insert into rec.ingredient values (63,'Eclair',1.6,8,25,178.4);
insert into rec.ingredient values (64,'Epinard',2.3,0.3,3.5,25.9);
insert into rec.ingredient values (65,'Escargot',15,0.8,2,75.2);
insert into rec.ingredient values (67,'Farine',10.5,1,76.1,355.4);
insert into rec.ingredient values (68,'Figue sèche',3.6,1.2,62,273.2);
insert into rec.ingredient values (69,'Figue fraîche',1,0.4,17,75.6);
insert into rec.ingredient values (70,'Fraise',0.7,0.5,8.4,40.9);
insert into rec.ingredient values (71,'Framboise',0.9,0.7,11,53.9);
insert into rec.ingredient values (72,'Fromage 1: Brie, Camembert',18,22,4,286);
insert into rec.ingredient values (73, 'Fromage 2: Pont-L''Evêque',26,23,7,339); 
insert into rec.ingredient values (74,'Fromage 2: Livarot, Munster',26,23,7,339);
insert into rec.ingredient values (75,'Fromage 3: Cantal, Hollande',27,28,3,372);
insert into rec.ingredient values (76,'Fromage 3: St Paulin',27,28,3,372);
insert into rec.ingredient values (77, 'Fromage 4: Comté',29,30,3,398);
insert into rec.ingredient values (78,'Fromage 4: Gruyère',29,30,3,398);
insert into rec.ingredient values (80,'Fromage blanc',9,10,4,142);
insert into rec.ingredient values (81,'Fruit à noyau',0.8,0.2,13,57);
insert into rec.ingredient values (82,'Fruit au sirop', null, null,31,124);
insert into rec.ingredient values (83,'Gelatine sèche',85.6,0.1, null,343.3);

--insert into rec.ingredient values (84,'Gnocchi',1,0.1245,0.092,0.2216,2.2124);
--insert into rec.ingredient values (85,'Gratin dauphinois',1,0.1901,0.2344,0.6314,5.3956);
insert into rec.ingredient values (86,'Haricot sec',21,1.8,59.6,338.6);
insert into rec.ingredient values (87,'Huile', null,99, null,891);
insert into rec.ingredient values (88,'Huitre,12',1.08,0.144,0.576,7.92);
insert into rec.ingredient values (89,'Jambon cru',15.2,31, null,339.8);
insert into rec.ingredient values (90,'Jambon cuit',28,4.9, null,156.1);
insert into rec.ingredient values (91,'Jambon fumé',16.9,35,0.3,383.8);
insert into rec.ingredient values (92,'Jambon salé',19.5,20.6, null,263.4);
insert into rec.ingredient values (93,'Jardinière de légumes',7.5,7,48,285);
insert into rec.ingredient values (94,'Lait 1/2 écrémé',3.5,1.7,5,49.3);
insert into rec.ingredient values (95,'Lait écrémé',3.7,0.2,5,36.6);
insert into rec.ingredient values (96,'Lait entier',3.3,3.5,5,64.7);
insert into rec.ingredient values (97,'Lapin',22,5,0.5,135);
insert into rec.ingredient values (98,'Lard 1/2 gras',91,65, null,949);
insert into rec.ingredient values (99,'Légume vert',2.7,0.3,6,37.5);
insert into rec.ingredient values (100,'Lentille',1.8,58,344.2);
insert into rec.ingredient values (101,'Maïs',2.6,0.8,19.8,96.8);
insert into rec.ingredient values (102,'Margarine', null,83,0.4,748.6);
insert into rec.ingredient values (103,'Mayonnaise',1.1,78.9,3,726.5);
insert into rec.ingredient values (104,'Melon',0.5,0.2,6.4,29.4);
insert into rec.ingredient values (105,'Miel',5,0.2,75,321.8);
insert into rec.ingredient values (106,'Mortadelle',12.4,32.8, null,344.8);
insert into rec.ingredient values (107,'Mouton cotelette',14.9,32, null,347.6);
insert into rec.ingredient values (108,'Mouton foie',21,3.9,2.9,130.7);
insert into rec.ingredient values (109,'Mouton gigot',18,18, null,234);
insert into rec.ingredient values (110,'Mouton rognon',16.8,3.3,0.9,100.5);
insert into rec.ingredient values (111,'Oeuf blanc',7.6,0.116, null,31.44);
insert into rec.ingredient values (112,'Oeuf entier',15,12, null,168);
insert into rec.ingredient values (113,'Oeuf jaune',6.4,13.24, null,144.76);
insert into rec.ingredient values (114,'Lamproie',19,15, null,211);
insert into rec.ingredient values (115,'Pain blanc',7,0.8,55,255.2);
insert into rec.ingredient values (116,'Pâte',12,0.9,74.1,352.5);
insert into rec.ingredient values (117,'Petit pois (boîte)',0.034,0.004,0.127,0.68);
insert into rec.ingredient values (118,'Poire',0.3,0.4,14,60.8);
insert  into rec.ingredient values (119, 'Saumon',19,15, null,211);
insert  into rec.ingredient values (120, 'Maquereau',19,15, null,211);
insert  into rec.ingredient values (121, 'Thon',19,15, null,211);
insert into rec.ingredient values (123,'Truite',16,9, null,145);
insert into rec.ingredient values (124,'Pomme',0.3,0.4,14,60.8);
insert into rec.ingredient values (125,'Pomme de terre',2,0.1,20,88.9);
insert into rec.ingredient values (126,'Porc cervelle',10.6,9, null,123.4);
insert into rec.ingredient values (127,'Porc coeur',16.9,4.8,0.4,112.4);
insert into rec.ingredient values (128,'Porc cotelette',15.2,30.6, null,336.2);
insert into rec.ingredient values (129,'Porc filet',18.6,9.9, null,163.5);
insert into rec.ingredient values (130,'Porc foie',20.6,4.8,2.6,136);
insert into rec.ingredient values (131,'Porc langue',16.8,15.6,0.5,209.6);
insert into rec.ingredient values (132,'Porc rognon',16.4,5.2,0.8,115.6);
insert into rec.ingredient values (133,'Poulet',21,4.5, null,124.5);
insert into rec.ingredient values (134,'Pruneau',2.4,0.5,70,294.1);
insert into rec.ingredient values (135,'Purée',6,17,60,417);
insert into rec.ingredient values (136,'Quiche lorraine',14,16,18,272);
insert into rec.ingredient values (137,'Raisin',1,0.4,17,75.6);
insert into rec.ingredient values (138,'Riz au lait',6,4,54,276);
insert into rec.ingredient values (139,'Riz blanc',7.6,0.5,79,350.9);
insert into rec.ingredient values (140,'Salade',1.5,0.5,5,30.5);
insert into rec.ingredient values (141,'Saucisse de Francfort',12.5,27.6,1.8,305.6);
insert into rec.ingredient values (142,'Saucisse en sachet',13,19.6, null,228.4);
insert into rec.ingredient values (143,'Semoule',10.3,0.8,76,352.4);
insert into rec.ingredient values (144,'Semoule Maïs',7.5,0.8,78);
insert into rec.ingredient values (145,'Soja',34.1,17.7,33.5,429.7);
insert into rec.ingredient values (146,'sardine',19,15, null,211);
insert into rec.ingredient values (147,'Sucre', null, null,50,200);
insert into rec.ingredient values (148,'Tomate',0.9,0.3,4,22.3);
insert into rec.ingredient values (149,'Veau cervelle',10.2,8.3,0.8,118.7);
insert into rec.ingredient values (150,'Veau coeur',12.2,7.6,0.8,120.4);
insert into rec.ingredient values (151,'Veau escalope panée',21.6,15,5,241.4);
insert into rec.ingredient values (152,'Veau foie',19,4.5,4,132.5);
insert into rec.ingredient values (153,'Veau langue',18.5,5.3,0.9,125.3);
insert into rec.ingredient values (154,'Veau maigre',19,5, null,121);
insert into rec.ingredient values (155,'Veau ris',19.6,3, null,105.4);
insert into rec.ingredient values (156,'Veau rognon',16.7,6.4,0.8,127.6);
insert into rec.ingredient values (157,'Yaourth',4.2,1,5,45.8);
insert into rec.ingredient values (158,'Carrelet',16,9, null,145);
insert into rec.ingredient values (159,'Colin',16,9, null,145);
insert into rec.ingredient values (160,'Merlan',16,9, null,145);
insert into rec.ingredient values (161,'Merlu',16,9, null,145);
insert into rec.ingredient values (162,'Sole',16,9, null,145);
insert into rec.ingredient values (163,'Limande',16,9, null,145);
insert into rec.ingredient values (164,'Lieu',16,9, null,145);
insert into rec.ingredient values (165,'Raie',16,9, null,145);
insert into rec.ingredient values (166,'Dorade',16,9, null,145);
insert into rec.ingredient values (167,'Roussette',16,9, null,145);
insert into rec.ingredient values (168,'Levure chimique');
insert into rec.ingredient values (169, 'Maïzena');
insert into rec.ingredient values (170, 'Oignon');

-- recette [idrec, titre, nbpers, categorie, vegetarien , gluten, avisInternaute, niveau, cout, 
--												tpsprepa, tpscuisson, tpsrepos, texterec, img]
insert into rec.recette values (1, 'Gâteau au chocolat au micro-onde', 8, 'Dessert', true, false, 4, 'très facile', null, '10', '5', null, 'Faire fondre le chocolat dans un grand bol 1 min sur puissance maxi.
Ajouter le beurre en morceaux, et recuire 1 min; bien mélanger à la sortie du four.
Mélanger les oeufs et le sucre dans un saladier, ajouter le chocolat et le beurre, la farine, la
levure puis la crème.
Chemiser de papier sulfurisé le fond d''un moule rond (diamètre 22 cm) transparent aux
ondes (type pyrex), et verser la préparation.
Cuire 5 à 6 min à puissance maxi et vérifier la cuisson : la pointe du couteau doit ressortir
sèche, même si la surface du gâteau vous paraît humide.
Démouler et laisser refroidir sur une grille.', null);

insert into rec.recette values (2, 'Gâteau au chocolat', 6, 'Dessert', true, true, 3, 'très facile', null, '20', '25', null, 'Faire fondre le chocolat avec le beurre à feu doux. 
Séparer le blanc des jaunes d''oeuf. 
Mélanger le sucre avec les jaunes d''oeuf. 
Ajouter la maïzena puis le chocolat fondu. 
Monter les blancs en neige et incorporer les délicatement au mélange. 
Verser le mélange dans un moule beurré. 
Faire cuire au four thermostat 6 pendant 20 à 25mn.', null);

insert into rec.recette values (3, 'Gratin de courgettes', 4, 'Légume', true, true, null, 'très facile', null, '15', '15', null, 'Emincer les oignons et les faire fondre dans le beurre.
Râper 4 courgettes avec leur peau et les ajouter aux oignons.
Mélanger le gruyère râpé, les oeufs, la crème fraîche, puis saler et poivrer.
Mettre les courgettes dans un plat et verser par dessus la sauce et faire à four chaud pendant 15 min.', null);

-- utiliser[idrec integer NOT NULL, idingr integer NOT NULL, quantite real NOT NULL, unite]
insert into rec.utiliser values (1, 38, 125, 'g');
insert into rec.utiliser values (1, 147, 100,'g');
insert into rec.utiliser values (1, 67, 50, 'g');
insert into rec.utiliser values (1, 112, 3, null);
insert into rec.utiliser values (1, 168, 0.25, 'sachet');
insert into rec.utiliser values (1, 56, 2, 'cuillère à soupe');
insert into rec.utiliser values (1, 14, 100, 'g');
--
insert into rec.utiliser values (2, 38, 125, 'g');
insert into rec.utiliser values (2, 147, 125, 'g');
insert into rec.utiliser values (2, 169, 60, 'g');
insert into rec.utiliser values (2, 14, 60, 'g');
insert into rec.utiliser values (2, 112, 3, null);
--
insert into rec.utiliser values (3, 54, 4, null);
insert into rec.utiliser values (3, 170, 3, null);
insert into rec.utiliser values (3, 78, 100,'g');
insert into rec.utiliser values (3, 112, 2, null);
insert into rec.utiliser values (3, 56, 2, 'cuillère à soupe');
insert into rec.utiliser values (3, 14, 1, 'noix');



--
