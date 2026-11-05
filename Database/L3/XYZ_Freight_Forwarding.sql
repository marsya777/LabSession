CREATE DATABASE XYZ_Freight_Forwarding;
USE XYZ_Freight_Forwarding;

-- TASK 2
CREATE TABLE Customer(
cust_number VARCHAR(15) PRIMARY KEY NOT NULL,
cust_name VARCHAR(15),
addr VARCHAR(15),
city VARCHAR(15),
state VARCHAR(15),
postcode INT(5),
contact_no INT (15));

CREATE TABLE Product(
prod_code VARCHAR(15) PRIMARY KEY NOT NULL,
prod_desc VARCHAR(15),
unit INT(5),
sales_price DECIMAL(8,2));

CREATE TABLE Invoice(
inv_number VARCHAR(15) PRIMARY KEY NOT NULL,
inv_date DATE,
cust_number VARCHAR(15),
inv_amount DECIMAL(8,2),
shipped_by VARCHAR(15),
ship_trackingno VARCHAR(15),

FOREIGN KEY (cust_number) REFERENCES Customer(cust_number));

CREATE TABLE Invoice_line(
inv_number VARCHAR(15),
prod_code VARCHAR(15),
quantity INT(4),
sales_price DECIMAL(8,2),
total_price DECIMAL (8,2),

PRIMARY KEY (inv_number,prod_code),
FOREIGN KEY (inv_number) REFERENCES Invoice(inv_number)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (prod_code) REFERENCES Product(prod_code)
ON UPDATE CASCADE
ON DELETE CASCADE);

ALTER TABLE Customer
MODIFY COLUMN addr VARCHAR(50);
ALTER TABLE Product
MODIFY COLUMN unit VARCHAR (15);
ALTER TABLE Customer
MODIFY COLUMN cust_name VARCHAR(50);
ALTER TABLE Product
MODIFY COLUMN prod_desc VARCHAR(50);

-- TASK 3
INSERT INTO customer VALUES
('C10001', 'Ali Ahmad', '12 Jalan Mawar', 'Kuala Lumpur', 'Selangor', '50000', '0123456789'),
('C10002', 'Siti Aminah', '25 Jalan Melati', 'Shah Alam', 'Selangor', '40000', '0134567890'),
('C10003', 'John Tan', '18 Jalan Besar', 'Johor Bahru', 'Johor', '80000', '0145678901'),
('C10004', 'Nur Aisyah', '9 Jalan Kenanga', 'Kuantan', 'Pahang', '25000', '0167890123'),
('C10005', 'David Lim', '30 Jalan Merdeka', 'Ipoh', 'Perak', '30000', '0178901234');

INSERT INTO product VALUES
('P1001', 'Laptop', 'Unit', 2500.00),
('P1002', 'Printer', 'Unit', 800.00),
('P1003', 'Keyboard', 'Unit', 100.00),
('P1004', 'Mouse', 'Unit', 50.00),
('P1005', 'Monitor', 'Unit', 600.00);

INSERT INTO invoice VALUES
('INV001', '2026-10-01', 'C10001', 2600.00, 'Pos Laju', 'TRK001'),
('INV002', '2026-10-02', 'C10002', 850.00, 'J&T Express', 'TRK002'),
('INV003', '2026-10-03', 'C10003', 650.00, 'DHL', 'TRK003'),
('INV004', '2026-10-04', 'C10004', 2500.00, 'Ninja Van', 'TRK004'),
('INV005', '2026-10-05', 'C10005', 900.00, 'Pos Laju', 'TRK005');

INSERT INTO invoice_line VALUES
('INV001', 'P1001', 1, 2500.00, 2500.00),
('INV001', 'P1003', 1, 100.00, 100.00),
('INV002', 'P1002', 1, 800.00, 800.00),
('INV002', 'P1004', 1, 50.00, 50.00),
('INV003', 'P1005', 1, 600.00, 600.00),
('INV003', 'P1004', 1, 50.00, 50.00),
('INV004', 'P1001', 1, 2500.00, 2500.00),
('INV005', 'P1005', 1, 600.00, 600.00),
('INV005', 'P1002', 1, 300.00, 300.00);

-- TASK 4
INSERT INTO Customer (cust_number,cust_name,state)
VALUES ('C10006','Abdul Rauf Osman','Selangor');

SELECT*FROM Customer;
SELECT*FROM Product;
SELECT*FROM Invoice;
SELECT*FROM Invoice_line;

-- ACTIVITY 2 TASK 1 
-- Retrieve customer code, name, state and contact number
SELECT cust_number,cust_name,state,contact_no FROM Customer;

-- Retrieve customer information who originated from 'Selangor'
SELECT * FROM Customer 
WHERE state='Selangor';

-- Retrieve invoice number, customer code, date of invoice and amount 
-- where invoices were shipped using 'GDex'
SELECT inv_number,cust_number,inv_date,inv_amount FROM Invoice
WHERE shipped_by='GDex';

-- Modify the product description
SELECT prod_code, prod_desc FROM Product
WHERE prod_code= 'P1002';

UPDATE Product
SET prod_desc='TV LCD Plasma 4 inch'
WHERE prod_code='P1002';

SELECT prod_code,prod_desc FROM Product
WHERE prod_code='P1002';

-- Retrieve invoice_number, date,customer number and amount 
-- for invoice dates from 22/8/2016 to25/8/2016
SELECT inv_number,inv_date,cust_number,inv_amount FROM Invoice
WHERE inv_date BETWEEN '2016-08-22' AND '2016-08-25';

-- Insert following records into these tables
INSERT INTO Product (prod_code,prod_desc,unit,sales_price)
VALUES ('AC-5510','Panasonic air-cond 1.5 Hose Power ECO','Box','2300.00');

INSERT INTO Invoice(inv_number,inv_date,cust_number,inv_amount, shipped_by,ship_trackingno)
VALUES ('10006','2016-08-28','C10001',2300.00,'DHL','DHL/2145-004');

INSERT INTO invoice_line(inv_number,prod_code,quantity,sales_price,total_price)
VALUES('10006','AC-5510','1','2300.00','2300.00');

-- update product code
UPDATE Product
SET prod_code='AC-5587'
WHERE prod_code='AC-5510';

-- display the changes in Product
SELECT*FROM Product
WHERE prod_code='AC-5587';

-- display Invoice_line records
SELECT inv_number,prod_code,sales_price,total_price
FROM Invoice_line;

-- display the description of product and price for product
-- that having sales price is less than 2000.00
SELECT prod_desc,sales_price FROM Product
WHERE sales_price<2000.00;

-- change the contact number for customer :
UPDATE Customer
SET contact_no='0165585050'
WHERE cust_number='C10003';

-- retrieve customer information and sort the record by state in ascending order
SELECT * FROM Customer
ORDER BY state ASC;

-- retrieve invoice number,customer code, date of invoice,amount and shipped by:
--  for invoice date after 22/08/2016 
-- sort the records by invoice date in descending order
SELECT inv_number,cust_number,inv_date,inv_amount,shipped_by FROM Invoice
WHERE inv_date > 2016-08-22
ORDER BY inv_date DESC;
