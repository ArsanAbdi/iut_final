/*
BD S3
TD Curseurs
*/

CREATE TABLE employe ( 
id_emp serial PRIMARY KEY,
nom_emp varchar(20),
grade_emp smallint,
salaire_emp int
)
;

insert into employe (nom_emp, grade_emp, salaire_emp) values 
('Panos', 1, 1000), 
('Linda', 1, 1100),
('Nolan', 2, 1400),
('Julia', 2, 1500),
('Elena', 3, 2000),
('Jakob', 3, 2100),
('Pablo', 4, 2250),
('Sarah', 1, 1150),
('Alice', 2, 1600),
('Tarek', 4, 2200),
('Marie', 5, 2500),
('Carla', 5, 2600),
('Betty', 4, 2300),
('Amira', 1, 1150)
;