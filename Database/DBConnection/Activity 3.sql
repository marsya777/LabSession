CREATE DATABASE IF NOT EXISTS ABCVehicleServices;
USE ABCVehicleServices;

CREATE TABLE srvcustomer(
custCode VARCHAR(15)PRIMARY KEY,
custName VARCHAR(60),
custICNo VARCHAR(15),
custType VARCHAR(15),
custAddr VARCHAR(60),
custTown VARCHAR (30),
custPostCode INT (5),
custRegister DATE
);

CREATE TABLE srvvehicle(
vecNo VARCHAR(10)PRIMARY KEY,
vecOwner VARCHAR(15)NOT NULL,
vehChassisNo VARCHAR(30),
vecModel VARCHAR (60),
vehManufactured VARCHAR (60),
vehYearProduced INT (4),
vehLastOdometer BIGINT(20),
FOREIGN KEY (vecOwner)
REFERENCES srvcustomer(custCode)
);

CREATE TABLE srvtechnician(
tchNo INT (12) PRIMARY KEY NOT NULL,
tchName VARCHAR(60),
tchHiredDate date
);

CREATE TABLE srvservice(
srvNo INT(12) PRIMARY KEY,
custCode VARCHAR(15),
vecNo VARCHAR(10),
srvType VARCHAR(25),
srvDate DATE,
tchNo INT (5) NOT NULL,

CONSTRAINT chk_srvType
CHECK (srvType IN ('Normal','Major','Warranty')),

FOREIGN KEY (custCode)
REFERENCES srvCustomer(custCode),

FOREIGN KEY (vecNo)
REFERENCES srvvehicle(vecNo),

FOREIGN KEY (tchNo)
REFERENCES srvtechnician(tchNo)
);

CREATE TABLE srvparts(
partNo VARCHAR(45) PRIMARY KEY NOT NULL,
partDescription VARCHAR (60),
partCategory VARCHAR (45),
partUnit VARCHAR (35),
partCostPrice DECIMAL(9,2),
partSalesPrice DECIMAL(9,2),
partQtyOnHand INT (11)
);

CREATE TABLE srvservicedetails(
srvNo INT(12),
partNo VARCHAR(45),
orderQty INT(11),
slsPrice DECIMAL (9,2),

PRIMARY KEY(srvNo,partNo),

FOREIGN KEY (srvNo)
REFERENCES srvservice(srvNo),

FOREIGN KEY (partNo)
REFERENCES srvparts(partNo)
);

DESCRIBE srvvehicle;
DESCRIBE srvcustomer;
DESCRIBE srvservice;
DESCRIBE srvtechnician;
DESCRIBE srvservicedetails;
DESCRIBE srvparts;

SHOW TABLES;

ALTER TABLE srvservice
MODIFY custCode VARCHAR(15)NOT NULL;

ALTER TABLE srvservice
MODIFY vecNo VARCHAR(10)NOT NULL;

DESCRIBE srvservice;