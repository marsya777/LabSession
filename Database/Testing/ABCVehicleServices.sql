CREATE DATABASE ABCVehicleServices;
USE ABCVehicleServices;

--parent table
CREATE TABLE srvcustomer(
    custCode VARCHAR(15) PRIMARY KEY,
    custName VARCHAR(60),
    custICNo VARCHAR(15),
    custType VARCHAR(15),
    custAddr VARCHAR(60),
    custTown VARCHAR(30),
    custPostCoe INT(5),
    custRegister DATE
);

CREATE TABLE srvtechnician(
    tchNo INT (12) NOT NULL,
    tchName VARCHAR(60),
    tchHireDate DATE
);

CREATE TABLE srvparts(
    partNo VARCHAR (45) PRIMARY KEY NOT NULL,
    partDescription VARCHAR(60),
    partCategory VARCHAR(45),
    partUnit VARCHAR(35),
    partCostPrice DECIMAL(9,2),
    partSalesPrice DECIMAL (9,2),
    partQtyOnHand INT (11)
);

CREATE TABLE srvvehicle(
    vecNo VARCHAR(10) PRIMARY KEY,
    vecOwner VARCHAR (15) NOT NULL,
    vehChassisNo VARCHAR(30),
    vecModel VARCHAR(60),
    vehManufactured VARCHAR(60),
    vehYearProduced INT(4),
    vehLastOdometer BIGINT(20),

    FOREIGN KEY (vecOwner) REFERENCES srvcustomer(custCode)
);

CREATE TABLE srvservice(
    srvNo INT(12)PRIMARY KEY NOT NULL,
    custCode VARCHAR(15),
    vecNo VARCHAR(10),
    srvType VARCHAR(25),
    srvDate DATE,
    tchNo INT (5)NOT NULL,

    CONSTRAINT chk_srvType
    CHECK (srvType IN('Normal','Major','Warranty')),

    FOREIGN KEY (custCode) REFERENCES srvcustomer(custCode),
    FOREIGN KEY (vecNo) REFERENCES srvvehicle (vecNo),
    FOREIGN KEY (tchNo) REFERENCES srvtechnician (tchNo)
);

CREATE TABLE srvservicedetails(
    srvNo INT(12) PRIMARY KEY NOT NULL,
    partNo VARCHAR(45) PRIMARY KEY,
    orderQty INT (11),
    slsPrice DECIMAL (9,2),

    FOREIGN KEY (srvNo) REFERENCES srvservice(srvNo),
    FOREIGN KEY (partNo) REFERENCES srvparts(partNo)
);

DESCRIBE srvvehicle;
DESCRIBE srvservice;
DESCRIBE srvtechnician;
DESCRIBE srvcustomer;
DESCRIBE srvservicedetails;
DESRIBE srvparts;

SHOW TABLES;
