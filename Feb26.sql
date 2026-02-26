-- ============================================
-- Company Database - SQL Queries
-- ============================================

CREATE DATABASE IF NOT EXISTS company;
USE company;

-- ============================================
-- TABLE DEFINITIONS
-- ============================================

CREATE TABLE DEPARTMENT(
    DNAME VARCHAR(20),
    DNUMBER INT PRIMARY KEY,
    MGRSSN VARCHAR(15),
    MGRSTARTDATE DATE
);

CREATE TABLE EMPLOYEE(
    FNAME VARCHAR(20),
    MINIT CHAR(1),
    LNAME VARCHAR(20),
    SSN VARCHAR(15) PRIMARY KEY,
    BDATE DATE,
    ADDRESS VARCHAR(100),
    SEX CHAR(1),
    SALARY INT,
    SUPERSSN VARCHAR(15),
    DNO INT,
    FOREIGN KEY (DNO) REFERENCES DEPARTMENT(DNUMBER)
);

-- ============================================
-- SAMPLE DATA
-- ============================================

INSERT INTO DEPARTMENT VALUES
('Research',5,'333445555','1988-05-22'),
('Administration',4,'987654321','1995-01-01'),
('Headquarters',1,'888665555','1981-06-19');

INSERT INTO EMPLOYEE VALUES
('John','B','Smith','123456789','1965-01-09','Houston, TX','M',30000,'333445555',5),
('Franklin','T','Wong','333445555','1955-12-08','Houston, TX','M',40000,'888665555',5),
('Alicia','J','Zelaya','999887777','1968-01-19','Spring, TX','F',25000,'987654321',4),
('Jennifer','S','Wallace','987654321','1941-06-20','Bellaire, TX','F',43000,'888665555',4),
('Ramesh','K','Narayan','666884444','1962-09-15','Houston, TX','M',38000,'333445555',5),
('Joyce','A','English','453453453','1972-07-31','Houston, TX','F',25000,'333445555',5),
('Ahmad','V','Jabbar','987987987','1969-03-29','Houston, TX','M',25000,'987654321',4),
('James','E','Borg','888665555','1937-11-10','Houston, TX','M',55000,NULL,1);

-- ============================================
-- Q1: 10% Salary Raise for Research Department
-- ============================================

SELECT
    E.FNAME,
    E.LNAME,
    E.SALARY AS current_salary,
    E.SALARY * 1.1 AS increased_salary
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DNO = D.DNUMBER
WHERE D.DNAME = 'Research';

-- ============================================
-- Q2: Salary Statistics for Administration Department
-- (Sum, Max, Min, Average)
-- ============================================

SELECT
    SUM(E.SALARY)  AS Total,
    MAX(E.SALARY)  AS Maximum,
    MIN(E.SALARY)  AS Minimum,
    AVG(E.SALARY)  AS Average
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DNO = D.DNUMBER
WHERE D.DNAME = 'Administration';

-- ============================================
-- Q3: Employees Working in Department 5
-- ============================================

-- Method 1: Direct filter
SELECT FNAME, LNAME
FROM EMPLOYEE
WHERE DNO = 5;



-- ============================================
-- Q4: Departments Having At Least 2 Employees
-- ============================================

-- Method 1: Using GROUP BY + HAVING
SELECT
    D.DNAME,
    D.DNUMBER,
    COUNT(E.SSN) AS employee_count
FROM DEPARTMENT D
JOIN EMPLOYEE E ON D.DNUMBER = E.DNO
GROUP BY D.DNUMBER, D.DNAME
HAVING COUNT(E.SSN) >= 2;
