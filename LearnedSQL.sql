CREATE DATABASE testDB;
USE testDB;
CREATE TABLE test (
	PersonID int PRIMARY KEY,
	PersonName varchar(255),
    Age int,
    id  int
);
use testDB;
INSERT INTO test(PersonID, PersonName, Age, id)
VALUES (001, 'APPLE', 21, 111), (002, 'BALL', 20, 020),
(003, 'CAT', 22, 131);

SELECT * FROM test;

UPDATE test
SET Age = 23
WHERE PersonID = 003;

DELETE FROM test
WHERE PersonID = 002;



