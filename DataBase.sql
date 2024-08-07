
--Création de la base de données
CREATE DATABASE bibliotheque;

--Création des tables

CREATE TABLE Editeur (
IDEditeur INT PRIMARY KEY,
Nom NVARCHAR(100),
Adresse NVARCHAR(255),
Telephone NVARCHAR(100) );

CREATE TABLE Genre(
IDGenre INT PRIMARY KEY,
NomGenre NVARCHAR(100) );

CREATE TABLE Livre (
ISBN VARCHAR(50) PRIMARY KEY,
Titre NVARCHAR(255) NOT NULL,
AnneePublication INT,
NombreExemplaires INT,
IDEditeur INT,
IDGenre INT,
FOREIGN KEY (IDEditeur) REFERENCES
Editeur(IDEditeur),
FOREIGN KEY (IDGenre) REFERENCES Genre(IDGenre));

CREATE TABLE Auteur (
IDAuteur INT PRIMARY KEY, Nom NVARCHAR(50),
Prenom NVARCHAR(50),
Nationalite NVARCHAR(50) );

CREATE TABLE Ecrire (
ISBN VARCHAR(50),
IDAuteur INT,
PRIMARY KEY (ISBN, IDAuteur),
FOREIGN KEY (ISBN) REFERENCES Livre(ISBN),
FOREIGN KEY (IDAuteur) REFERENCES
Auteur(IDAuteur) );

CREATE TABLE Membre (
IDMembre INT PRIMARY KEY,
Nom NVARCHAR(100),
Prenom NVARCHAR(100),
AdresseEmail NVARCHAR(255),
NumeroTelephone NVARCHAR(20),
DateInscription DATE );

CREATE TABLE Exemplaire (
CodeExemplaire INT PRIMARY KEY,
ISBN VARCHAR(50),Statut NVARCHAR(50),
DateAcquisition DATE, FOREIGN KEY (ISBN)
REFERENCES Livre(ISBN) );

CREATE TABLE Reservation (
IDReservation INT PRIMARY KEY,
IDMembre INT,
CodeExemplaire INT,
TypeReservation NVARCHAR(20),
DateReservation DATE,
DateRetourPrevue DATE,
status_reservation NVARCHAR(20),
FOREIGN KEY (IDMembre) REFERENCES
Membre(IDMembre),
FOREIGN KEY (CodeExemplaire) REFERENCES
Exemplaire(CodeExemplaire) );

--Les contraintes

ALTER TABLE Exemplaire
ADD CONSTRAINT CK_Exemplaire_Statut CHECK (Statut
IN ('disponible', 'emprunté', 'perdu') );

ALTER TABLE Membre
ADD CONSTRAINT UQ_Membre_AdresseEmail UNIQUE
(AdresseEmail);

ALTER TABLE Membre
ALTER COLUMN Nom NVARCHAR(100) NOT NULL;ALTER TABLE reservation
ADD CONSTRAINT chk_TypeReservation
CHECK (TypeReservation IN ('consultation',
'emprunt'));

ALTER TABLE reservation
ADD CONSTRAINT chk_status_reservation
CHECK (status_reservation IN ('disponible',
'emprunté', 'réservé'));

--Insertion des données
INSERT INTO Membre
VALUES
(1, 'Dupont', 'Jean', 'jean.dupont@email.com',
'1234567890', '2024-07-15'),

(2, 'Martin', 'Sophie',
'sophie.martin@email.com', '9876543210', '2024-
07-16');

INSERT INTO Livre
VALUES
('978-0-306-40615-7', ' A Handbook of Agile
Software Craftsmanship','2014', '5', '1', '1'),

('978-0-13-235088-4', 'proving the Design of
Existing Code', '2004','2', '2', '2');

INSERT INTO Exemplaire
VALUES
(1, '978-0-306-40615-7', 'disponible', '2023-
01-15'),

(2, '978-0-306-40615-7', 'emprunté', '2023-02-
20'),

(3, '978-0-13-235088-4', 'disponible', '2023-
03-10'); 

INSERT INTO Editeur
VALUES
(1, 'jon karl', '123 Main Street,us',
'1234567890'),

(2, 'thomas ben', '456 Elm Street,californie',
'0630998765');

INSERT INTO Genre
VALUES
(1, 'Roman'),
(2, 'Science-fiction'),
(3, 'Policier');

INSERT INTO Reservation
VALUES
(1, 1, 1, 'emprunt', '2024-07-15', '2024-07-
29', 'emprunté'),

(2, 2, 2, 'consultation', '2024-07-16', NULL,
'disponible');

INSERT INTO Auteur
VALUES
(1,'Martin', 'George R.R.', 'Américaine'),
(2,'Tolkien', 'J.R.R.', 'Britannique'),
(3,'Rowling', 'J.K.', 'Britannique');

INSERT INTO Ecrire
VALUES ('978-0-306-40615-7',1),
('978-0-306-40615-7',2),
('978-0-13-235088-4',3);
