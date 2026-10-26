-- create an empty database 
CREATE DATABASE DBEnrollment;
-- choose which database to use
USE DBEnrollment;

-- create new table named student
-- PARENT TABLE
CREATE TABLE student(
-- COLUMN NAME | TYPES OF INPUT() | VALUES CANNOT EMPTY
StudentID CHAR(5) NOT NULL,
StudentName VARCHAR(100) NOT NULL,
Program VARCHAR(100)NOT NULL,
Intake SMALLINT UNSIGNED NOT NULL,
-- make StudentID as reference (prevent repeated ID)
PRIMARY KEY (StudentID)
)ENGINE=InnoDB; -- specifies the storage engine MySQL used

CREATE TABLE course(
CourseID CHAR (6) NOT NULL,
Description VARCHAR(100)NOT NULL,
Credit TINYINT UNSIGNED NOT NULL,
PRIMARY KEY (CourseID)
)ENGINE=InnoDB;

-- CHILD TABLE
CREATE TABLE enrollment(
StudentID CHAR(5)NOT NULL,
CourseID CHAR(6) NOT NULL,
CourseStatus ENUM('Active','Blocked'),
Fees ENUM ('Paid','Not Paid'),
PRIMARY KEY (StudentID,CourseID),

-- enrollment record cannot refer to other than studentID that exist in student table
-- referential integrity
FOREIGN KEY (StudentID) -- foreign key: define a relationship to another table
REFERENCES student(StudentID)
-- if a student record is deleted from parent table, the related in child table auto delete
ON DELETE CASCADE
-- if at parent table is update something, then auto change in child table
ON UPDATE CASCADE,

FOREIGN KEY (StudentID)
REFERENCES student(StudentID)
ON DELETE CASCADE
ON UPDATE CASCADE

)ENGINE=InnoDB; -- when to use : usually when create table 






