--part1:création supression de bbd

--exo1 Créer une base de données language.
CREATE DATABASE language;

--exo2 Créer une base de données webDevelopment avec l’encodage UTF-8.
CREATE DATABASE webDevelopment CHARACTER SET utf8;

--exo3 Créer une base de données framework avec l’encodage UTF-8 si elle n’existe pas.
 CREATE DATABASE IF NOT EXISTS framework CHARACTER SET utf8;

 --exo4 Créer une base de données language avec l’encodage UTF-8 si elle n’existe pas.
 CREATE DATABASE IF NOT EXISTS language CHARACTER SET utf8;

 --exo5 Supprimer la base de données language.
 DROP DATABASE language;

 --exo6 Supprimer la base de données framework si elle existe.
DROP DATABASE IF EXISTS framework;

--exo7 Supprimer la base de données language si elle existe.
DROP DATABASE IF EXISTS language;



--part2 : creation de table

--exo 1 Dans la base de données webDevelopment, créer la table languages avec les colonnes :
--id (type INT, auto-incrémenté, clé primaire)
--language (type VARCHAR)

use webDevelopment;
CREATE TABLE languages
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    language VARCHAR(100)
    
);

--exo 2
--Dans la base de données webDevelopment, créer la table tools avec les colonnes suivantes :
--id (type INT, auto-incrémenté, clé primaire)
--tool (type VARCHAR)
use webDevelopment;
CREATE TABLE tools(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
tool VARCHAR (50)

);

--exo 3
--Dans la base de données webDevelopment, créer la table frameworks avec les colonnes suivantes :
--id (type INT, auto-incrémenté, clé primaire)
--name (type VARCHAR)
use webDevelopment;
CREATE TABLE frameworks(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR (60)
);


--exo4
--Dans la base de données webDevelopment, créer la table libraries avec les colonnes suivantes :
--id (type INT, auto-incrémenté, clé primaire)
--library (type VARCHAR)
use webDevelopment;
CREATE TABLE librairies(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
library VARCHAR (500)
);


--exo 5
--Dans la base de données webDevelopment, créer la table ide avec les colonnes suivantes :
--id (type INT, auto-incrémenté, clé primaire)
--ideName (type VARCHAR)
use webDevelopment;
CREATE TABLE ide(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
ideName VARCHAR (80)
);

--exo 6
--Dans la base de données webDevelopment, créer, si elle n'existe pas, la table frameworks avec les colonnes suivantes :
--id (type INT, auto-incrémenté, clé primaire)
--name (type VARCHAR)
use webDevelopment;
CREATE TABLE IF NOT EXISTS  librairies(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR (20)
);

--exo 7
--Supprimer la table tools si elle existe.
DROP TABLE IF EXISTS tools;

--exo 8
--Supprimer la table libraries.

DROP TABLE  librairies;

--exo 9
--Supprimer la table ide.

DROP TABLE ide;

--part2 : creation de table
--Créer la base codex. Y créer une table clients qui aura comme colonnes :

--Colonne	Type	Attributs
--id INT Auto-incrémenté, clé primaire
--lastname	VARCHAR	
--firstname	VARCHAR	
--birthDate	DATE	
--address	VARCHAR	
--firstPhoneNumber	INT	
--secondPhoneNumber	INT	
--mail	VARCHAR	



use codex;
CREATE TABLE clients
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    lastname VARCHAR(20),
    firstname VARCHAR(20),
    birthDate DATE,	
    address VARCHAR(50),
    firstPhoneNumber INT,
    secondPhoneNumber INT,	
    mail VARCHAR(30)
);


--part3 : modification de table

--exo1 :Dans la base de données webDevelopment, ajouter à la table languages une colonne versions (VARCHAR).
use webDevelopment;
ALTER TABLE languages 
ADD versions VARCHAR(80);

--exo 2: Dans la base de données webDevelopment, ajouter à la table frameworks une colonne version (INT).
use webDevelopment;
ALTER TABLE frameworks
ADD version INT;


-- exo3 : Dans la base de données webDevelopment, dans la table languages renommer la colonne versions en version.
use webDevelopment;
ALTER TABLE languages
change version versionz VARCHAR(50);

-- exo4 :Dans la base de données webDevelopment, dans la table frameworks, renommer la colonne name en framework.

ALTER TABLE frameworks
CHANGE name frameworks VARCHAR(60);

-- exo5 : Dans la base de données webDevelopment, dans la table frameworks changer le type de la colonne version en VARCHAR de taille 10.

ALTER TABLE frameworks
MODIFY version VARCHAR(10);


--tp :Dans la base codex, dans la table clients :

--supprimer la colonne secondPhoneNumber
--renommer la colonne firstPhoneNumber en phoneNumber
--changer le type de la colonne phoneNumber en VARCHAR
--ajouter les colonnes zipCode(VARCHAR) et city(VARCHAR)

use codex;

ALTER TABLE clients
l--a commande ALTER TABLEpermet de modifier une table existante. 
--Idéal pour ajouter une colonne, supprimer une colonne ou modifier une colonne existante, par exemple pour changer le type.
DROP secondPhoneNumber;

ALTER TABLE clients
CHANGE firstPhoneNumber phoneNumber INT;
--modifier nom du champs et le type


ALTER TABLE clients
MODIFY phoneNumber VARCHAR(10);
--modifier juste le type

ALTER TABLE clients
ADD zipCode VARCHAR(5);

ALTER TABLE clients
ADD city VARCHAR(30); 



--Partie 4 : Insertion de données
--Exercice 1
--Insérez les données suivantes dans la table languages de la base webDevelopment :

--JavaScript, version 5
--PHP, version 5.2
--PHP, version 5.4
--HTML, version 5.1
--JavaScript, version 6
--JavaScript, version 7
--JavaScript, version 8
--PHP, version 7

use webDevelopment;

INSERT INTO languages (language, version)
 VALUES
 ('Javascript', 5),
 ('PHP', 5.2),
 ('PHP', 5.4),
 ('HTML', 5.1),
 ('Javascript',6),
 ('Javascript',7),
 ('Javascript',8),
 ('PHP',7);



--Exercice 2 : insérez les données suivantes dans la table frameworks de la base webDevelopment :

--Symfony, version 2.8
--Symfony, version 3
--Jquery, version 1.6
--query, version 2.10

use webDevelopment;

INSERT INTO frameworks (framework, version)
 VALUES
 ('symfony', 2.8),
 ('symfony', 3),
 ('Jquery', 1.6),
 ('jquery', 2.10);

 
 --Partie 5 : Sélection de données
-- Ex1 : Dans la table languages, afficher toutes les données de la table.
SELECT  * FROM languages;
--pour deux champs
SELECT id,name FROM languages


--Ex2 : dans la table languages, afficher toutes les versions de PHP.
SELECT version FROM languages
WHERE language = 'PHP';

--Ex3 : dans la table languages, afficher toutes les versions de PHP et de JavaScript.
SELECT version FROM languages
WHERE language IN ('PHP','Javascript');


--Ex4 : dans la table languages, afficher toutes les lignes ayant pour id 3,5,7.
SELECT * FROM languages
WHERE id IN (3,5,7);


--Ex5 : dans la table languages, afficher les deux première entrées de JavaScript.
SELECT * FROM languages
WHERE language = 'JavaScript'
LIMIT 2;


--Ex6 : dans la table languages, afficher toutes les lignes qui ne sont pas du PHP.
SELECT * FROM languages
WHERE language !='PHP';


--ex7 : dans la table languages, afficher toutes les données par ordre alphabétique.
SELECT * FROM languages
ORDER by language;


--Partie 6 : Sélection de données - Élargir les possibilités de la clause WHERE
ScriptFichier
Avant de commencer les exercices, exécutez le script fourni.


--Ex1 : Dans la table frameworks, afficher toutes les données de la table ayant une version 2.x (x étant un numéro quelconque).
SELECT * FROM frameworks
WHERE version LIKE '2%';


--Ex2 : Dans la table frameworks, afficher toutes les lignes ayant pour id 1 et 3.

SELECT * FROM frameworks
WHERE id IN (1,3);

--Ex3 : Dans la table ide, afficher toutes les lignes ayant une date comprise entre le premier janvier 2010 et le 31 decembre 2011.
SELECT * FROM ide
WHERE date BETWEEN '2010-01-01' AND '2011-12-31';



--Partie 7 : Suppression et modification de données
--Exercice 1 : Dans la table languages, supprimer toutes les lignes parlant de HTML.

DELETE FROM languages
WHERE language = 'HTML';


--Exercice 2 : Dans la table frameworks, modifier toutes les lignes ayant le framework Symfony par Symfony2.

UPDATE frameworks
SET framework = 'symfony2'
WHERE framework = 'symfony';


--Exercice 3 : Dans la table languages, modifier la ligne du langage JavaScript version 5 par la version 5.1.

UPDATE languages
SET version = 9
WHERE language = 'Javascript' AND  version = 6;




--Partie 8 : Les jointures
--ScriptFichier
--Avant de commencer les exercices, exécutez le script fourni.


--Exercice 1 : Afficher tous les frameworks associés à leurs langages. Si un langage n'a pas de framework l'afficher aussi.
SELECT frameworks.name as frameworks, languages.name as language
FROM frameworks
RIGHT JOIN languages
ON frameworks.languagesId = languages.id;


--Ex2 : Afficher tous les frameworks associés à leurs langages. Si un langage n'a pas de framework ne pas l'afficher.
SELECT frameworks.name as frameworks, languages.name as language
FROM frameworks
INNER JOIN languages
ON frameworks.languagesId = languages.id;


--Exercice 3 : Afficher le nombre de framework qu'a un language.
SELECT languages.name as languages,
COUNT(frameworks.name) as totalframework
FROM languages
INNER JOIN frameworks
ON frameworks.languagesId = languages.id
GROUP BY languages.name;



--Ex4 : Afficher les langages ayant plus de 3 frameworks.
SELECT languages.name as language, 
COUNT(frameworks.name) as totalframework
FROM languages
INNER JOIN frameworks
ON frameworks.languagesId = languages.id
GROUP BY languages.name
HAVING COUNT(frameworks.name) > 3;



--entrainement brice
CREATE TABLE trainings (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
intensity INT NOT NULL,
users VARCHAR (50) NOT NULL,
date DATE NOT NULL,
time TIME NOT NULL,
location VARCHAR(50) NOT NULL
);


--MODELISATION DE LA BASE DE DONNES 
--Les besoins
--La bibliothèque La Manu vient d'ouvrir et elle ne dispose pas de logiciel pour suivre ses livres. 
--Vous êtes donc en charge de créer une base de données permettant de faciliter cette gestion. 

--Les contraintes
--La bibliothèque souhaiterait pouvoir enregistrer ses clients, enregistrer tous ses livres et surtout, suivre ses livres empruntés.
--Les clients sont définis par leur nom et prénom, leur date de naissance, leur mail, leur genre de livre qu'ils préfèrent.
--Les livres sont définis par leur titre, leur genre, le nom et prénom de leur auteur.
--Le registre d'emprunts contient le titre du livre, la date d'emprunt et la date de retour, le nom et prénom du client.
--Les choses à savoir
--La bibliothèque La Manu ne possède que 4 genres de livre : 

--Horreur
--Science Fiction
--Roman
--Jeunesse
--Les pré-requis de votre base de données
--La bibliothèque La Manu possède 70 livres et 25 clients. 
--Elle possède un registre de 40 lignes avec 14 livres qui ne sont pas encore rendus. 
--Dans ce registre, il faut également retrouver des livres populaires (Empruntés plusieurs fois).

--Fonctionnalités
--1 Il faudra pouvoir afficher les lignes du registre (titre, nom et prénom du client, date d'emprunt et de retour du livre)
SELECT *
FROM register
INNER JOIN clients
ON register.Id_clients = clients.id;

--2 Il faudra pouvoir lister tous les livres (titre, genre, nom et prénom de l'auteur, disponibilité)



--3 Il faudra pouvoir afficher le nombre total de livres par genre (nom du genre, total de livres correspondants)

SELECT *
FROM books
INNER JOIN category
ON category.Id_clients = books.id;




INSERT INTO clients (name, firstname, birthdate, mail, id_genre)
VALUES
('Mike', 'Myers', '1978-11-22','mike@gmail.com', 2),
('John', 'Doe', '1990-10-10','john@hotmail.com', 2 ),
('Paul', 'Pearson', '1992-12-12','paul@gmail.com', '3'),
('Louis', 'Olsen', '2001-01-01','Louis@gmail.com','4'),
('Asher', 'Millstone', '1996-10-16','asher@gmail.com','2'),
('Connor',' Walsdh', '1995-08-09','connor@gmail.com','4'),
('Mikaela', 'Pratt', '1994-02-14/','mikaela@gmail.com','3'),
('Laurel', 'Castillo', '1996-06-11','laurel@gmail.com','3'),
('Wes', 'Gibbin', '1995-11-21','wes@gmail.com','4'),
('Annelise', 'Keating', '1968-09-18','annelise@gmail.com','3'),
('Frank' 'Delfino', '1985-03-07','frank@gmail.com','1'),
('Nate', 'Lahey', '1974-06-15','nate@gmail.com','2'),
('Bonnie', 'Winterbottom','1975-03-11','bonnie@gmail.com','2'),
('Oliver', 'Hatton', '1995-04-02','oliver@gmail.com','4'),
('Isaac', 'Roa', '1964-05-04','isaac@gmail.com','4'),
('Tegan', 'Price', '1988-10-23','tegan@gmail.com','2'),
('Robin', 'Sherbotsky', '1983-02-16','robin@gmail.com','3'),
('Barney', 'Stinson', '1987-09-25','barney@gmail.com','4'),
('Ted', 'Mosby', '1989-11-06','ted@gmail.com','3'),
('Marshall', 'Melvin','1988-12-23','marshall@gmail.com','3'),
('Jen', 'Linley', '1978-05-16','jen@gmail.com','3'),
('Aria', 'Stark', '2000-01-25','aria@gmail.com','2'),
('Cersei', 'Lannister', '1978-08-13','cersei@gmail.com','1'),
('Robb', 'Stark', '1987-04-23','rob@gmail.com', '1'),
('Jamie', 'Lannister', '1980-06-19','jamie@gmail.com', '1');

INSERT INTO books (title, authorFirstname, authorLastname, id_register)
VALUES
('Alexandra','Lapierre','Belle Green'),
('Jean-Baptiste','Andréa','Des Diables et des Saints'),
('Ocean','Vuong','Un bref instant de splendeur'),
('Sandrine','Colette','Ces orages là'),
('Jean Michel','Erre','Le bonheur est au fond du couloir à gauche'),
('Pierre','Bourdieu','La misère du monde'),
('William','Golding','Sa majesté des mouches'),
('Albert','Camus','La peste'),
('Frantz','Kafka','La métamorphose'),
('Oscar','Wilde','Le portrait de Dorian Gray'),
('Francoise','Sagan','Bonjour tristesse'),
('Charles','Baudelaire','Les fleurs du mal'),
('Stephen','King','Shining');


INSERT INTO register (borrowDate, returnDate, id_books, id_clients)
VALUES
('2020-11-4','2020-11-08','1','4'),
('2020-11-8','2020-11-12','3','5'),
('2020-11-12','2021-11-15','2','6'),
('2020-11-14','2020-12-18','5','4'),
('2020-11-16','2020-12-20','6','8'),
('2020-12-18','2021-12-22','7','9'),
('2020-12-22','2020-12-26','8','11'),
('2021-01-14','2020-01-18','9','7'),
('2021-01-28','2021-02-08','10','13'),
('2021-01-23','2020-02-28','11','14'),
('2021-02-11','2021-02-15','12','17'),
('2021-02-21','2021-02-25','13','6'),



('2021-02-01','0000-00-00','4','16'),
('2021-02-02','0000-00-00','8','12');
