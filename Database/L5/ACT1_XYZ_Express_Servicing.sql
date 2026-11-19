CREATE DATABASE XYZ_Express_Servicing;
USE XYZ_Express_Servicing;

CREATE TABLE Branch (
  BranchNo INT PRIMARY KEY,
  BranchName VARCHAR(30) NOT NULL,
  OfficeNo VARCHAR(15),
  ContactPerson VARCHAR(40)
);

--  driver number auto-generated, starts at 1001
CREATE TABLE Driver (
  DriverNo INT AUTO_INCREMENT PRIMARY KEY,
  DriverName VARCHAR(50) NOT NULL,
  JoinedDate DATE,
  BranchNo INT,
  CONSTRAINT fk_driver_branch
    FOREIGN KEY (BranchNo) REFERENCES Branch(BranchNo)
) AUTO_INCREMENT = 1001;

-- bus number auto-generated, starts at 200001
CREATE TABLE Vehicle (
  VehicleNo INT AUTO_INCREMENT PRIMARY KEY,
  PlatNumber VARCHAR(10) NOT NULL,
  Model VARCHAR(30),
  ModelYear INT,
  LastFleetMaint DATE
) AUTO_INCREMENT = 200001;

CREATE TABLE Job (
  JobId VARCHAR(10) PRIMARY KEY,
  Description VARCHAR(50),
  ServiceCharge DECIMAL(8,2),
  PartCharge DECIMAL(8,2),
  Unit VARCHAR(10)
);

-- fleet no auto-generated from 9000001;
-- fleet type only '01' (Service, default) or '02' (Warranty)
CREATE TABLE Fleet (
  FleetNo INT AUTO_INCREMENT PRIMARY KEY,
  DriverNo INT NOT NULL,
  VehicleNo INT NOT NULL,
  FleetDate DATE,
  FleetType CHAR(2) NOT NULL DEFAULT '01',
  FleetStatus VARCHAR(10),
  CONSTRAINT chk_fleettype CHECK (FleetType IN ('01','02')),
  CONSTRAINT chk_fleetstatus CHECK (FleetStatus IN ('Open','WIP','Closed')),
  CONSTRAINT fk_fleet_driver  FOREIGN KEY (DriverNo)  REFERENCES Driver(DriverNo),
  CONSTRAINT fk_fleet_vehicle FOREIGN KEY (VehicleNo) REFERENCES Vehicle(VehicleNo)
) AUTO_INCREMENT = 9000001;

--  one fleet can consume one or more jobs/parts (composite key)
-- charge defaults to 0.00 (used for warranty)
CREATE TABLE FleetDetails (
  FleetNo INT,
  JobId VARCHAR(10),
  Quantity INT NOT NULL DEFAULT 1,
  ChargeAmount DECIMAL(8,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (FleetNo, JobId),
  CONSTRAINT fk_fd_fleet FOREIGN KEY (FleetNo) REFERENCES Fleet(FleetNo),
  CONSTRAINT fk_fd_job   FOREIGN KEY (JobId)   REFERENCES Job(JobId)
);

CREATE TABLE Billing (
  BillingNo INT AUTO_INCREMENT PRIMARY KEY,
  FleetNo INT NOT NULL,
  PaymentType VARCHAR(15),
  PaymentDate DATE,
  PaymentAmount DECIMAL(8,2) NOT NULL DEFAULT 0.00,
  CONSTRAINT fk_billing_fleet FOREIGN KEY (FleetNo) REFERENCES Fleet(FleetNo)
) AUTO_INCREMENT = 88000001;

-- Show the structure 
SHOW TABLES;
DESCRIBE Branch;
DESCRIBE Driver;
DESCRIBE Vehicle;
DESCRIBE Job;
DESCRIBE Fleet;
DESCRIBE FleetDetails;
DESCRIBE Billing;


INSERT INTO Branch (BranchNo, BranchName, OfficeNo, ContactPerson) VALUES
(10, 'Kuala Terengganu', '09-6671020', 'Amri Aziz'),
(11, 'Kemaman',          '09-6951234', 'Sharifah Syed Ali'),
(12, 'Besut',            '09-6973490', 'Rohaiza Rahmad');

INSERT INTO Driver (DriverNo, DriverName, JoinedDate, BranchNo) VALUES
(1001, 'Mohd Hashim Ali',      '2015-09-12', 10),
(1002, 'Hamzah Razali',        '2015-10-14', 11),
(1003, 'Arif Fadillah',        '2015-10-15', 12),
(1004, 'Wan Haizan Wan Omar',  '2015-11-02', 10),
(1005, 'Badrulhisham Mokhtar', '2016-01-15', 11);

INSERT INTO Vehicle (VehicleNo, PlatNumber, Model, ModelYear, LastFleetMaint) VALUES
(200001, 'TBS1234', 'MAN SE',       2015, '2016-01-17'),
(200002, 'TBS2021', 'MAN SE',       2015, '2016-01-04'),
(200003, 'TBU5912', 'Hino Motors',  2015, '2016-01-15'),
(200004, 'TBU9890', 'Isuzu Motors', 2016, '2016-01-15'),
(200005, 'TBV2000', 'Hino Motors',  2016, '2016-02-26'),
(200006, 'TBW7878', 'Hino Motors',  2016, '2015-12-02');

INSERT INTO Job (JobId, Description, ServiceCharge, PartCharge, Unit) VALUES
('Lub-01',  'Lubricant Minor Svs',                   100.00,  500.00, '1 unit'),
('Lub-02',  'Lubricant Major Svs',                   200.00,  800.00, '1 unit'),
('Lub-03',  'Lubricant Major Svs + Break Lubricant', 500.00, 1200.00, '1 unit'),
('Part-01', 'Spare Part Service Minor',              300.00,  600.00, '1 unit'),
('Part-02', 'Spare Part Service Major',              300.00, 1400.00, '1 unit'),
('Part-03', 'Spare Part Service Overhaul',          1200.00, 8000.00, '1 unit'),
('AirC-01', 'Air-Cond Minor Maintenance',            400.00,  600.00, '1 unit'),
('AirC-02', 'Air-Cond Major Maintenance',            700.00, 1500.00, '1 unit'),
('AirC-03', 'Air-Cond Replacement',                  600.00, 6000.00, '1 unit'),
('BA-01',   'Balancing & Alignment',                 300.00,  100.00, '1 unit'),
('Tyre-01', 'Rotation',                              150.00,    0.00, 'N.A'),
('Tyre-02', 'Tyres Replacement',                      60.00, 1000.00, '1 unit'),
('WTY-01',  'Warranty Minor',                          0.00,    0.00, '1 unit'),
('WTY-02',  'Warranty Major',                          0.00,    0.00, '1 unit');

INSERT INTO Fleet (FleetNo, DriverNo, VehicleNo, FleetDate, FleetType, FleetStatus) VALUES
(9000001, 1001, 200001, '2015-10-10', '01', 'Closed'),
(9000002, 1002, 200002, '2015-11-05', '01', 'Closed'),
(9000003, 1004, 200003, '2015-11-17', '01', 'Closed'),
(9000004, 1001, 200001, '2015-11-21', '02', 'WIP'),
(9000005, 1003, 200004, '2015-11-25', '01', 'Closed'),
(9000006, 1005, 200005, '2015-12-14', '01', 'Closed'),
(9000007, 1001, 200006, '2015-12-16', '01', 'Closed'),
(9000008, 1004, 200002, '2016-01-04', '01', 'Closed'),
(9000009, 1005, 200003, '2016-01-15', '01', 'WIP'),
(9000010, 1003, 200004, '2016-01-15', '02', 'WIP'),
(9000011, 1001, 200001, '2016-01-17', '01', 'Open'),
(9000012, 1002, 200005, '2016-02-26', '01', 'Open');

INSERT INTO FleetDetails (FleetNo, JobId, Quantity, ChargeAmount) VALUES
(9000001, 'Lub-01',  1,  600.00),
(9000001, 'Part-01', 1,  900.00),
(9000002, 'Lub-01',  1,  600.00),
(9000002, 'Part-01', 1,  900.00),
(9000002, 'AirC-01', 1, 1000.00),
(9000003, 'Lub-02',  1, 1000.00),
(9000003, 'Part-02', 2, 3400.00),
(9000003, 'BA-01',   1,  400.00),
(9000004, 'AirC-03', 1,    0.00),
(9000005, 'Lub-03',  1, 1700.00),
(9000006, 'Lub-01',  1,  600.00),
(9000006, 'Part-01', 1,  900.00),
(9000007, 'Lub-02',  1, 1000.00),
(9000007, 'Part-02', 1, 3400.00),
(9000007, 'Tyre-02', 2, 2120.00),
(9000008, 'Lub-01',  1,  600.00),
(9000008, 'Part-01', 1,  900.00),
(9000009, 'Lub-03',  1, 1700.00),
(9000009, 'Part-02', 1, 3400.00),
(9000009, 'AirC-01', 1, 1000.00),
(9000009, 'Tyre-01', 1,  150.00),
(9000010, 'AirC-03', 1,    0.00),
(9000010, 'Part-02', 1,    0.00),
(9000011, 'Lub-01',  1,  600.00),
(9000011, 'Part-01', 1,  900.00),
(9000011, 'AirC-01', 1, 1000.00),
(9000012, 'Lub-03',  1, 1700.00),
(9000012, 'Part-02', 1, 3400.00),
(9000012, 'BA-01',   1,  400.00);

INSERT INTO Billing (BillingNo, FleetNo, PaymentType, PaymentDate, PaymentAmount) VALUES
(88000001, 9000001, 'Credit',     '2015-10-10', 1500.00),
(88000002, 9000002, 'Credit',     '2015-11-05', 2500.00),
(88000003, 9000003, 'Credit',     '2015-11-17', 4800.00),
(88000004, 9000004, 'Wty Credit', '2015-11-21',    0.00),
(88000005, 9000005, 'Credit',     '2015-11-25', 1700.00),
(88000006, 9000006, 'Credit',     '2015-12-14', 1500.00),
(88000007, 9000007, 'Cash',       '2015-12-02', 6520.00),
(88000008, 9000008, 'Credit',     '2016-01-04', 1500.00),
(88000009, 9000009, 'Credit',     '2016-01-15', 6250.00),
(88000010, 9000010, 'Wty Credit', '2016-01-15',    0.00),
(88000011, 9000011, 'Credit',     '2016-01-17', 2500.00),
(88000012, 9000012, 'Credit',     '2016-02-26', 5500.00);

-- display
SELECT * FROM Branch;
SELECT * FROM Driver;
SELECT * FROM Vehicle;
SELECT * FROM Job;
SELECT * FROM Fleet;
SELECT * FROM FleetDetails;
SELECT * FROM Billing;
