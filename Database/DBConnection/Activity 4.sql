CREATE DATABASE StudentDB;
USE StudentDB;

CREATE TABLE student (
    StudentID VARCHAR(6) PRIMARY KEY,
    StuName VARCHAR(50),
    Gender CHAR(1),
    Program VARCHAR(50),
    Intake INT,
    CONSTRAINT chk_gender CHECK (Gender IN ('M', 'F'))
);

INSERT INTO student
    (StudentID, StuName, Gender, Program, Intake)
VALUES
    ('S10023', 'Amran Hamzah', 'M',
     'BSc. Comp. Science (SE)', 2014),
    ('S20106', 'Goh Seng Huat', 'M',
     'BSc. Comp. Science with IM', 2015),
    ('S30078', 'Nur Hafizah Rahman', 'F',
     'BSc. Comp. Science (Networking)', 2016
);
     
SELECT * FROM student;
DESCRIBE student;

ALTER TABLE student
MODIFY StuName VARCHAR(10);