DROP SCHEMA IF EXISTS saedevweb CASCADE;
CREATE SCHEMA saedevweb;

SET search_path to public, saedevweb;

DROP TABLE IF EXISTS Joueur, Partie, Classement, Tour, Poser, Message, EcrireMessage, 
Recherche, RechercherJoueur, RechercherUtilisateur, Utilisateur, PossedeDesAmis, 
VoirClassementUtilisateur, VoirClassementJoueur, Recevoir, PosterDansForum CASCADE;

CREATE TABLE Utilisateur (
    idUtilisateur SERIAL PRIMARY KEY NOT NULL
);

CREATE TABLE Joueur (
    idJoueur SERIAL PRIMARY KEY NOT NULL,
    nom VARCHAR(50) NOT NULL,
    mot_de_passe VARCHAR(200) NOT NULL,
    tempsDeJeu INT NOT NULL,
    email VARCHAR(200) NOT NULL,
    abonnement BOOL NOT NULL,
    ratio FLOAT NOT NULL,
    nbKills INT NOT NULL,
    nbMorts INT NOT NULL,
    nbPartiesJouees INT NOT NULL,
    biographie VARCHAR(200) NOT NULL
);

CREATE TABLE Classement (
    idClassement SERIAL PRIMARY KEY NOT NULL,
    idJoueur INT NOT NULL,
    rang INT NOT NULL,
    nbJoueurs INT NOT NULL,
    FOREIGN KEY (idJoueur) REFERENCES Joueur(idJoueur)
);

CREATE TABLE Partie (
    idPartie SERIAL PRIMARY KEY NOT NULL,
    tempsDeJeu FLOAT NOT NULL,
    numeroVague INT NOT NULL,
    ennemisTues INT NOT NULL,
    solde INT NOT NULL,
    ennemiTueType1 INT NOT NULL,
    ennemiTueType2 INT NOT NULL,
    ennemiTueType3 INT NOT NULL,
    idJoueur INT NOT NULL,
    FOREIGN KEY (idJoueur) REFERENCES Joueur(idJoueur)
);

CREATE TABLE Tour (
    idTour SERIAL PRIMARY KEY NOT NULL,
    type VARCHAR(50) NOT NULL,
    sprite VARCHAR(50) NOT NULL,
    cout FLOAT NOT NULL,
    pv FLOAT NOT NULL,
    portee FLOAT NOT NULL,
    cadenceDeTir FLOAT NOT NULL,
    projectileTir VARCHAR(50) NOT NULL
);

CREATE TABLE Poser (
    idTour INT NOT NULL,
    idPartie INT NOT NULL,
    FOREIGN KEY (idTour) REFERENCES Tour(idTour),
    FOREIGN KEY (idPartie) REFERENCES Partie(idPartie)
);

CREATE TABLE Message (
    idMsg SERIAL PRIMARY KEY NOT NULL,
    contenu VARCHAR(200) NOT NULL,
    icone VARCHAR(200) NOT NULL
);

CREATE TABLE EcrireMessage (
    idJoueur INT NOT NULL,
    idMsg INT NOT NULL,
    date VARCHAR(200) NOT NULL,
    heure TIME NOT NULL,
    FOREIGN KEY (idJoueur) REFERENCES Joueur(idJoueur),
    FOREIGN KEY (idMsg) REFERENCES Message(idMsg)
);

CREATE TABLE Recherche (
    idRecherche SERIAL PRIMARY KEY NOT NULL,
    mot_cle VARCHAR(200) NOT NULL,
    icone VARCHAR(200) NOT NULL
);

CREATE TABLE RechercherJoueur (
    idJoueur INT NOT NULL,
    idRecherche INT NOT NULL,
    FOREIGN KEY (idJoueur) REFERENCES Joueur(idJoueur),
    FOREIGN KEY (idRecherche) REFERENCES Recherche(idRecherche)
);

CREATE TABLE RechercherUtilisateur (
    idUtilisateur INT NOT NULL,
    idRecherche INT NOT NULL,
    FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(idUtilisateur),
    FOREIGN KEY (idRecherche) REFERENCES Recherche(idRecherche)
);

CREATE TABLE VoirClassementJoueur (
    idJoueur INT NOT NULL,
    FOREIGN KEY (idJoueur) REFERENCES Joueur(idJoueur)
);

CREATE TABLE VoirClassementUtilisateur (
    idUtilisateur INT NOT NULL,
    FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(idUtilisateur)
);

CREATE TABLE PosterDansForum (
    idMsg INT NOT NULL,
    date DATE NOT NULL,
    heure TIME NOT NULL,
    FOREIGN KEY (idMsg) REFERENCES Message(idMsg)
);

CREATE TABLE Recevoir (
    idJoueur INT NOT NULL,
    idMsg INT NOT NULL,
    date DATE NOT NULL,
    heure TIME NOT NULL,
    FOREIGN KEY (idJoueur) REFERENCES Joueur(idJoueur),
    FOREIGN KEY (idMsg) REFERENCES Message(idMsg)
);

CREATE TABLE PossedeDesAmis (
    idJoueur1 INT NOT NULL,
    idJoueur2 INT NOT NULL,
    FOREIGN KEY (idJoueur1) REFERENCES Joueur(idJoueur),
    FOREIGN KEY (idJoueur2) REFERENCES Joueur(idJoueur)
);

