DROP SCHEMA IF EXISTS cosmetique CASCADE;
CREATE SCHEMA cosmetique;

SET SEARCH_PATH to cosmetique;

CREATE TABLE parfum (
    id_parfum SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    marque VARCHAR(100) NOT NULL,
    couleur VARCHAR(100) NOT NULL,
    taille VARCHAR(100) NOT NULL,
    prix DECIMAL(10,2) NOT NULL
);

CREATE TABLE client (
    id_client SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    adresse VARCHAR(100) NOT NULL,
    credit_carte BIGINT NOT NULL
);

CREATE TABLE magasin (
    id_magasin SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    adresse VARCHAR(100) NOT NULL,
    ville VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL

);

CREATE TABLE transaction (
    id_transaction SERIAL PRIMARY KEY,
    id_client INT NOT NULL,
    id_magasin INT NOT NULL,
    id_parfum INT NOT NULL,
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    montant DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_magasin) REFERENCES magasin(id_magasin),
    FOREIGN KEY (id_parfum) REFERENCES parfum(id_parfum)
);

CREATE TABLE details_transaction (
    id_transaction INT NOT NULL,
    id_parfum INT NOT NULL,
    quantite INT NOT NULL,
    FOREIGN KEY (id_transaction) REFERENCES transaction(id_transaction),
    FOREIGN KEY (id_parfum) REFERENCES parfum(id_parfum)
);

INSERT INTO parfum (nom, marque, couleur, taille, prix) VALUES
('Eau de parfum', 'Dior', 'Rose', '100ml', 100.00),
('Eau de toilette', 'Chanel', 'Bleu', '50ml', 50.00),
('Eau de parfum', 'Yves Saint Laurent', 'Noir', '75ml', 75.00),
('Eau de toilette', 'Guerlain', 'Vert', '100ml', 100.00),
('Eau de parfum', 'Hermes', 'Jaune', '50ml', 50.00),
('Eau de toilette', 'Lancome', 'Rouge', '75ml', 75.00),
('Eau de parfum', 'Givenchy', 'Blanc', '100ml', 100.00),
('Eau de toilette', 'Estee Lauder', 'Noir', '50ml', 50.00),
('Eau de parfum', 'Burberry', 'Bleu', '75ml', 75.00),
('Eau de toilette', 'Calvin Klein', 'Vert', '100ml', 100.00);

INSERT INTO clients (nom,prenom,adresse,credit_carte) VALUES
('Silva','Horeb','24 avenue du boss',123456789), 
('Vijayatharan','Vithushan','19 avenue de l aout',9876543210),
('Abdi','Arsan','3 avenue de l avril',6543219874),
('Amadalasse','Imman','24 avenue de février',7531596482),
('Lamchichi','Ayoub','18 rue de janvier',2587946130);

INSERT INTO magasin (nom,adresse,ville,region) VALUES
('Sephora','24 avenue du caca','Paris','Ile de France'),
('Nocibe','19 avenue de popo','Lyon','Auvergne-Rhône-Alpes'),
('Marionnaud','3 rue de la fefe','Marseille','Provence-Alpes-Côte d Azur'),
('Douglas','24 boulevard haussmaan','Lille','Hauts-de-France'),
('Beauty Success','18 rue de la vérité','Toulouse','Occitanie');

INSERT INTO transaction (id_client,id_magasin,id_parfum,montant) VALUES
(1,1,1,100.00),
(2,2,2,50.00),
(3,3,3,75.00),
(4,4,4,100.00),
(5,5,5,50.00),
(1,1,6,75.00),
(2,2,7,100.00),
(3,3,8,50.00),
(4,4,9,75.00),
(5,5,10,100.00);

INSERT INTO details_transaction (id_transaction,id_parfum,quantite) VALUES
(1,1,1),
(2,2,1),
(3,3,1),
(4,4,1),
(5,5,1),
(6,6,1),
(7,7,1),
(8,8,1),
(9,9,1),
(10,10,1);


