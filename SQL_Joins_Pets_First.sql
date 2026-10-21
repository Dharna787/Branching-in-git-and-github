CREATE DATABASE KidsPetsDB;
USE KidsPetsDB;

DROP TABLE IF EXISTS Pets;
DROP TABLE IF EXISTS Kids;

CREATE TABLE Kids (
    K_Id INT PRIMARY KEY,
    Name VARCHAR(30) NOT NULL
);

CREATE TABLE Pets (
    Pet_Id INT AUTO_INCREMENT PRIMARY KEY,
    K_Id INT,
    Pet VARCHAR(30) NOT NULL
);

INSERT INTO Kids (K_Id, Name) VALUES
(1, 'Abhi'),
(2, 'Dev'),
(3, 'Jeet');

INSERT INTO Pets (K_Id, Pet) VALUES
(1, 'Dog'),
(2, 'Cat'),
(1, 'Fish'),
(4, 'Parrot');

-- 1. INNER JOIN: write Pets first, then Kids
SELECT P.Pet, K.Name
FROM Pets AS P
INNER JOIN Kids AS K ON P.K_Id = K.K_Id;

-- 2. LEFT JOIN: all pets, and matching kid names if available
SELECT P.Pet, K.Name
FROM Pets AS P
LEFT JOIN Kids AS K ON P.K_Id = K.K_Id;

-- 3. RIGHT JOIN: all kids, and matching pets if available
SELECT P.Pet, K.Name
FROM Pets AS P
RIGHT JOIN Kids AS K ON P.K_Id = K.K_Id;

-- 4. FULL OUTER JOIN equivalent in MySQL
SELECT P.Pet, K.Name
FROM Pets AS P
LEFT JOIN Kids AS K ON P.K_Id = K.K_Id
UNION
SELECT P.Pet, K.Name
FROM Pets AS P
RIGHT JOIN Kids AS K ON P.K_Id = K.K_Id;
