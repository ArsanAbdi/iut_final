
INSERT INTO vac.Pers VALUES (20, 'John' , 50, 'Narbonne'); 
INSERT INTO vac.Pers VALUES (21, 'Leila' , 30, 'Narbonne'); 
INSERT INTO vac.Pers VALUES (22, 'Fabrice' , 18, 'Lille'); 
INSERT INTO vac.Pers VALUES (23, 'Alice' , 15, 'Narbonne'); 
INSERT INTO vac.Pers VALUES (24, 'Marie' , 17, 'Toulon'); 
INSERT INTO vac.Pers VALUES (25, 'Farid' , 48, 'Toulon'); 
INSERT INTO vac.Pers VALUES (26, 'Pierre' , 60, 'Lille'); 
INSERT INTO vac.Pers VALUES (27, 'Lydie' , 38, 'Montreuil'); 


INSERT INTO vac.Club VALUES(31,'Le soleil du midi', 'Narbonne', 4, 100);
INSERT INTO vac.Club VALUES(32,'Le pavillon bleu', 'Narbonne', 4, 150);
INSERT INTO vac.Club VALUES(33,'Le fun nautique', 'Narbonne', 5, 60);
INSERT INTO vac.Club VALUES(34,'Le nordiste', 'Lille', 4, 150);
INSERT INTO vac.Club VALUES(35,'Le vent marin', 'Toulon', 3, 100);
INSERT INTO vac.Club VALUES(36,'Le sable fin', 'Toulon', 5, 110);

INSERT INTO vac.Groupe VALUES(101,'Randonnée');
INSERT INTO vac.Groupe VALUES(102,'Baignade');
INSERT INTO vac.Groupe VALUES(103,'Pêche');
INSERT INTO vac.Groupe VALUES(104,'Cyclisme');
INSERT INTO vac.Groupe VALUES(105,'Pétanque');

INSERT INTO vac.GroupePers VALUES(101,20);
INSERT INTO vac.GroupePers VALUES(101,26);
INSERT INTO vac.GroupePers VALUES(102,20);
INSERT INTO vac.GroupePers VALUES(102,21);
INSERT INTO vac.GroupePers VALUES(102,23);
INSERT INTO vac.GroupePers VALUES(103,24);
INSERT INTO vac.GroupePers VALUES(103,25);
INSERT INTO vac.GroupePers VALUES(104,22);
INSERT INTO vac.GroupePers VALUES(104,23);
INSERT INTO vac.GroupePers VALUES(104,24);
INSERT INTO vac.GroupePers VALUES(105,20);

INSERT INTO vac.Resa VALUES(102, 33, 3, 'mai');
INSERT INTO vac.Resa VALUES(105, 31, 3, 'juin');
INSERT INTO vac.Resa VALUES(105, 32, 2, 'avril');
INSERT INTO vac.Resa VALUES(103, 36, 2, 'avril');
INSERT INTO vac.Resa VALUES(103, 34, 4, 'mai');
INSERT INTO vac.Resa VALUES(103, 33, 3, 'juin');
INSERT INTO vac.Resa VALUES(104, 32, 3, 'juin');


