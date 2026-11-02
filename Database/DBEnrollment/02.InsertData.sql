USE DBEnrollment; -- choose which database to work on
SELECT DATABASE();-- check if database used is correct

/*INSERT DATA TO THREE DIFFERENT TABLES*/
INSERT INTO student
(StudentID,StudentName,Program,Intake)
VALUES
('S1001','Ali bin Abdullah','BSc.Computer Science','2014'),
('S1002','Chew Meng Yeng','BSc.Biology','2014'),
('S1003','Naimah binti Ramlan','BSc.Chemical Engineering','2014'),
('S2002','Fareez Ahmad','BSc.Computer Science','2015'),
('S2004','Krishnan a/l Ramesh','BSc.Physics','2015'),
('S3002','Amran bin Rosli','BSc.Computer Science','2016');

INSERT INTO course
(CourseID,Description,Credit)
VALUES
('CS1001','Basic Programming','3'),
('CS2010','Networking','3'),
('CS2020','Data Structure','4'),
('CH2001','Basic Chemical','3'),
('CH3000','Chemical Thermodynamics','4'),
('PY1001','Fundamental of Physics','3'),
('PY2004','Quantum Physics','4'),
('BG1001','Introduction to Biology','3'),
('BG3110','Human Biology','4');

INSERT INTO enrollment
(StudentID,CourseID,CourseStatus,Fees)
VALUES
('S1001','CS1001','Active','Paid'),
('S1003','CH2001','Active','Paid'),
('S2002','CS2010','Blocked','Not Paid'),
('S3002','CS1001','Active','Paid'),
('S2004','PY1001','Active','Paid'),
('S1001','CS2010','Active','Paid'),
('S2002','CS1001','Active','Paid'),
('S3002','CS2010','Active','Paid'),
('S1003','CH3000','Active','Paid'),
('S2004','PY2004','Blocled','Not Paid'),
('S3002','CS2020','Blocked','NotPaid');

/*DISPLAY AND VERIFY THE TABLES*/
SELECT*FROM student; -- select: retrieves data
SELECT*FROM course; -- * : means all columns
SELECT*FROM enrollment; -- from : tells MYQSQL which table to retrive data from

/*VERIFY TOTALS*/
SELECT COUNT(*)AS TotalStudents FROM student; -- count(*): counts the rows in the table
SELECT COUNT(*)AS TotalCourses FROM course; -- as : gives the result column TotalCourse
SELECT COUNT(*)AS TotalEnrollments FROM enrollment; -- from : counts rows from the enrollment table

/*RUN THE VERIFICATION'S COMMANDS*/
SHOW TABLES; -- lists all tables in current selected database
DESCRIBE enrollment; -- show the structure of enrollment table (not the record)
SHOW CREATE TABLE enrollment; -- display the sql statement used to create the table 