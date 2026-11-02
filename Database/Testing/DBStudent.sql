CREATE DATABASE IF NOT EXISTS DBStudent;
USE DBStudent;

CREATE TABLE student(
    studentID VARCHAR (15) PRIMARY KEY,
    stuName VARCHAR(100),
    gender CHAR(1),
    program VARCHAR(100),
    intake INT,

    CONSTRAINT chk_gender
    CHECK (gender IN('M','F'));
);

INSERT INTO student 
(studentID,stuName,gender,program,intake)
VALUES 
('S10023','Amran Hamzah','BSc.Comp.Science(SE)','2014');

SELECT (*) FROM student;
DESCRIBE student;


