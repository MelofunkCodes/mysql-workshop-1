--BARN WITH CHICKENS MODEL

/* 
Columns Needed:
-id INT auto-increment primary key
-Type ENUM('Rooster', 'Hen', 'Chick-Male', 'Chick-Female', 'Egg')
-Birthdate  DATETIME 
-Deathdate DATETIME


According to Wikipedia, chicks become roosters and hens after 1 year of age
Eggs hatch after 21 days and become chicks

*/

CREATE DATABASE ChickenBarn;

USE ChickenBarn;

CREATE TABLE Barn (id INT auto_increment primary key, Type ENUM('Rooster', 'Hen', 'Chick-Male', 'Chick-Female'), Birthdate DATETIME, Deathdate DATETIME);

--adding values to table

INSERT INTO Barn VALUES(null, 'Rooster', "2017-01-20", null), (null, 'Rooster', "2016-02-11", null), (null, 'Hen', "2016-05-23", null), (null, 'Hen', "2014-12-29", "2015-03-01"), (null, 'Chick-Female', '2016-12-25', null), (null, 'Chick-Male', '2016-12-25', '2017-01-15'), (null, 'Chick-Female', '2016-12-25', null), (null, 'Chick-Male', '2016-12-25', null);

--adding additional ENUM value 'Egg' to Type COLUMN
ALTER TABLE Barn MODIFY Type ENUM('Rooster', 'Hen', 'Chick-Female', 'Chick-Male', 'Egg');

--changing datatype of Birthdate and Deathdate from DATETIME to DATE
ALTER TABLE Barn MODIFY Birthdate DATE;
ALTER TABLE Barn MODIFY Deathdate DATE;

--changing table values
UPDATE Barn SET Type = 'Egg' WHERE id = 1;
UPDATE Barn SET Birthdate = "2015-02-11" WHERE id = 2;
UPDATE Barn SET Birthdate = "2015-05-23" WHERE id = 3; 

--making queries
--1) filtering by hens
SELECT * FROM Barn WHERE Type = 'Hen';
--2) filtering by dead chickens...(proper way is actually line 41. Do not need to enclose NULL in quotation marks. Use "is" for the state of things versus string, int, date, etc)
SELECT * FROM Barn WHERE Deathdate != 'NULL';
SELECT * FROM Barn WHERE Deathdate is not NULL;
--3) filtering by chicks
SELECT * FROM Barn WHERE Type LIKE "Chick%";
--4) filtering by alive chickens
SELECT * FROM Barn WHERE Deathdate is NULL;

--counting number of Roosters and Hens in Farm
SELECT SUM(CASE WHEN Type = 'Rooster' THEN 1 ELSE 0 END) AS Rooster, SUM(CASE WHEN Type = 'Hen' THEN 1 ELSE 0 END) AS Hen FROM Barn;   