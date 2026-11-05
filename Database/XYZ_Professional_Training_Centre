CREATE DATABASE XYZ_Professional_Training_Centre;
USE XYZ_Professional_Training_Centre;

-- TASK 2
CREATE TABLE Customer(
icno VARCHAR(15) PRIMARY KEY,
name VARCHAR(50) NOT NULL,
address VARCHAR(75),
city VARCHAR(30),
postcode INT(5),
state VARCHAR(30));

CREATE TABLE Invoice(
invoiceno INT(7) PRIMARY KEY AUTO_INCREMENT,
invoicedate DATE NOT NULL,
icno VARCHAR(15) NOT NULL,
pymttype INT(1) NOT NULL DEFAULT 1,
CHECK (pymttype IN(1,2,3)),
paidamount DECIMAL(9,2),
FOREIGN KEY (icno) REFERENCES Customer(icno)
ON UPDATE CASCADE
ON DELETE CASCADE);

CREATE TABLE Examination(
examid INT(5) PRIMARY KEY AUTO_INCREMENT,
examdesc VARCHAR(40),
duration INT
)AUTO_INCREMENT=1000;

ALTER TABLE Examination ADD COLUMN certifiedby VARCHAR(40);

CREATE TABLE Training(
trainingid INT(5) PRIMARY KEY AUTO_INCREMENT,
trainingtype INT(1) NOT NULL DEFAULT 1,
CHECK(trainingtype IN(1,2,3)),
trainingdesc VARCHAR(65) NOT NULL,
duration INT(4),
trainingfees DECIMAL(9,2),
provider VARCHAR(50),
examid INT(5),
FOREIGN KEY (examid) REFERENCES Examination(examid)
ON UPDATE CASCADE
ON DELETE CASCADE
);

CREATE TABLE AttendExam(
icno VARCHAR(15),
examid INT(5) NOT NULL,
examdate DATE NOT NULL,
examtime TIME NOT NULL,
result INT,
certified CHAR(1) 
CHECK (certified IN('Y','N')),
FOREIGN KEY (icno) REFERENCES Customer(icno) 
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (examid) REFERENCES Examination(examid)
ON UPDATE CASCADE
ON DELETE CASCADE);

CREATE TABLE InvoiceLine(
invoiceno INT(7) NOT NULL,
trainingid INT(5) NOT NULL,
quantity INT,
totalamount DECIMAL(9,2),
PRIMARY KEY (invoiceno,trainingid),
FOREIGN KEY (invoiceno) REFERENCES Invoice(invoiceno)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (trainingid) REFERENCES Training(trainingid)
ON UPDATE CASCADE
ON DELETE CASCADE);

-- TASK 3
INSERT INTO Customer(icno,name,address,city,postcode,state)
VALUES('770418-05-4256','Ahmad Zulfikri','9 Jalan Kenanga', 'Besut','84012','Terengganu'),
('960617-03-1245', 'Ali Abu', '12 Jalan Mawar', 'Marang', '50000', 'Kelantan'),
('890315-10-3278', 'Siti Aminah', '25 Jalan Melati', 'Muar','40000', 'Johor'),
('740228-09-1765', 'John Tan', '18 Jalan Besar', 'Johor Bahru','80000', 'Johor'),
('870121-07-3610', 'Nur Aisyah', '9 Jalan Merdeka', 'Cyberjaya','25000', 'Kuala Lumpur');

UPDATE Customer 
SET name='Ruhaimie Osman'
WHERE icno='890315-10-3278';

INSERT INTO Invoice (invoiceno,invoicedate,icno,pymttype,paidamount)
VALUES ('001', '2026-10-01', '770418-05-4256', 1, '3700.00'),
('002', '2026-10-02','960617-03-1245', 3, '4500.00'),
('003', '2026-10-03','890315-10-3278', 2, '5100.00'),
('004', '2026-10-04','740228-09-1765', 1, '4145.00'),
('005', '2026-10-05', '870121-07-3610', 2, '3825.00');

INSERT INTO Examination(examid,examdesc,certifiedby,duration)
VALUES ('10004', 'Oracle Database SQL','Oracle Corporation',3),
('10005', 'Oracle Database Administration I', 'Oracle Corporation',2),
('10006', 'Oracle Database Administration II','Oracle Corporation',4),
('10007', 'Microsoft Azure Fundamentals','Microsoft',3),
('10008', 'AWS Cloud Practitioner','Amazon',2);

INSERT INTO Training(trainingid,trainingtype,trainingdesc,duration,trainingfees,provider,examid)
VALUES (1, 3,'Leadership and Management Skills',3, 1500.00, 'HR Academy', 10004),
(2, 5,'Oracle Database Administration', 2,2500.00,'Oracle Corporation', 10005),
(3, 2,'Technical Support Fundamentals', 4,800.00,'Microsoft', 10006),
(4, 4,'Java Programming Training', 3,1800.00,'Oracle Corporation', 10007),
(5, 3,'Project Management Training', 2,1200.00,'Skill Academy', 10008);

INSERT INTO AttendExam(icno,examid,examdate,examtime,result,certified)
VALUES ('770418-05-4256', 10004, '2026-11-7', '09:00:00', 85, 'Y'),
('960617-03-1245', 10005, '2026-11-3', '10:30:00', 72, 'Y'),
('890315-10-3278', 10006, '2026-11-1', '14:00:00', 45, 'N'),
('740228-09-1765', 10007, '2026-11-10', '09:30:00', 90, 'Y'),
('870121-07-3610', 10008, '2026-11-14', '11:00:00', 55, 'N');

INSERT INTO InvoiceLine(invoiceno,trainingid,quantity,totalamount)
VALUES('001', 1, 2, 3000.00),
('002', 2, 1, 2500.00),
('003', 3, 3, 2400.00),
('004', 4, 2, 3600.00),
('005', 5, 1, 1200.00);

-- TASK 4
-- 1.retrieve a list of training code,training description,training duration and fees
SELECT trainingid,trainingdesc,duration,trainingfees FROM Training;

-- 2.retrieve customer ic number,name and city they live for customer from:
-- Terengganu or Kelantan
SELECT icno,name,city FROM Customer
WHERE state='Kelantan' OR 'Terengganu';

-- 3.display candidate ic number and certification status who taking exam
SELECT icno,certified FROM AttendExam
WHERE certified='Y';

-- 4.retrieve exam code,description and duration for examination which:
-- certification comes from 'Oracle Corporation'
SELECT examid,examdesc,duration FROM Examination
WHERE certifiedby='Oracle Corporation';

-- 5.display invoice information where customer pay the invoice amount>4000.00
SELECT*FROM Invoice
WHERE paidamount>4000.00;

-- 6.modify the duration for examination code 10004 from 3 to 4 hours
UPDATE Examination
SET duration=4
WHERE examid=10004;

-- 7.display a record for ic number,examination code,date of examination and time of exam
-- output sorted out based on the latest date of exam
SELECT icno,examid,examdate,examtime FROM AttendExam
ORDER BY examdate DESC;

-- 8.ic number for Ruhaimie Osman is wrongly key insert
-- perform query to retrieve ic number and name for customer
SELECT icno,name FROM Customer
WHERE name='Ruhaimie Osman';
-- retrieve ic number from invoice table 
SELECT icno FROM Invoice;
-- verify ic number for both tables
SELECT icno FROM Invoice
WHERE icno='890315-10-3278';
-- write a sql statement to change the ic number to 890315-10-3288.
UPDATE Customer
SET icno='890315-10-3288'
WHERE icno='890315-10-3278';

-- 9.Perform the query to verify the payment type for inoive 4 is 1 (Cash). 
-- make changes for type of payment for this invoice from Cash to Misc
-- display the original invoice record
SELECT* FROM Invoice
WHERE invoiceno='004';
-- change payment type to Misc
UPDATE Invoice
SET pymttype=3
WHERE invoiceno='004';
-- display the updated invoice record
SELECT *FROM Invoice
WHERE invoiceno='004';

-- 10. retrieve details about exam info where records sorted by certification
-- order by ascending, followed by duration as descending
SELECT * FROM Examination
ORDER BY certifiedby ASC,duration DESC;
