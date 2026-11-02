CREATE DATABASE IF NOT EXISTS ABCBanking;
USE ABCBanking;

-- 2. CREATE BRANCH TABLE
CREATE TABLE Branch (
    branch_id VARCHAR(10) NOT NULL,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    manager VARCHAR(100),
    PRIMARY KEY (branch_id)
) ENGINE=InnoDB;


-- 3. CREATE CUSTOMER TABLE
CREATE TABLE Customer (
    ic_number VARCHAR(20) NOT NULL,
    cust_name VARCHAR(100) NOT NULL,
    address VARCHAR(150),
    town VARCHAR(50),
    state VARCHAR(50),
    postcode VARCHAR(10),
    hp_number VARCHAR(20),
    email_id VARCHAR(100),
    status VARCHAR(20) NOT NULL DEFAULT 'New',
    PRIMARY KEY (ic_number)
) ENGINE=InnoDB;


-- 4. CREATE BANK ACCOUNT TABLE
-- Each customer can have only ONE account.
CREATE TABLE BankAccount (
    account_number VARCHAR(20) NOT NULL,
    ic_number VARCHAR(20) NOT NULL,
    branch_id VARCHAR(10) NOT NULL,
    balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    register_date DATE,
    PRIMARY KEY (account_number),
    UNIQUE (ic_number),
    CONSTRAINT fk_account_customer
        FOREIGN KEY (ic_number)
        REFERENCES Customer(ic_number),
    CONSTRAINT fk_account_branch
        FOREIGN KEY (branch_id)
        REFERENCES Branch(branch_id)
) ENGINE=InnoDB;


-- 5. CREATE LOAN APPLICATION TABLE
CREATE TABLE LoanApplication (
    loan_number VARCHAR(20) NOT NULL,
    ic_number VARCHAR(20) NOT NULL,
    loan_type VARCHAR(30) NOT NULL,
    branch_id VARCHAR(10) NOT NULL,
    loan_amount DECIMAL(15,2) NOT NULL,
    loan_status VARCHAR(20) NOT NULL DEFAULT 'Apply',
    PRIMARY KEY (loan_number),
    CONSTRAINT fk_loan_customer
        FOREIGN KEY (ic_number)
        REFERENCES Customer(ic_number),
    CONSTRAINT fk_loan_branch
        FOREIGN KEY (branch_id)
        REFERENCES Branch(branch_id)
) ENGINE=InnoDB;


-- 6. CREATE TRANSACTION TABLE
CREATE TABLE TransactionRecord (
    transaction_id INT NOT NULL AUTO_INCREMENT,
    account_number VARCHAR(20) NOT NULL,
    ic_number VARCHAR(20) NOT NULL,
    transaction_date DATE NOT NULL,
    transaction_time TIME NOT NULL,
    transaction_type VARCHAR(20) NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    PRIMARY KEY (transaction_id),
    CONSTRAINT chk_transaction_type
        CHECK (transaction_type IN ('Deposit', 'Withdrawal')),
    CONSTRAINT chk_transaction_amount
        CHECK (amount > 0),
    CONSTRAINT fk_transaction_account
        FOREIGN KEY (account_number)
        REFERENCES BankAccount(account_number),
    CONSTRAINT fk_transaction_customer
        FOREIGN KEY (ic_number)
        REFERENCES Customer(ic_number)
) ENGINE=InnoDB;


-- 7. UPDATE ACCOUNT BALANCE AUTOMATICALLY
DELIMITER //

CREATE TRIGGER update_account_balance
AFTER INSERT ON TransactionRecord
FOR EACH ROW
BEGIN
    IF NEW.transaction_type = 'Deposit' THEN
        UPDATE BankAccount
        SET balance = balance + NEW.amount
        WHERE account_number = NEW.account_number;

    ELSEIF NEW.transaction_type = 'Withdrawal' THEN
        UPDATE BankAccount
        SET balance = balance - NEW.amount
        WHERE account_number = NEW.account_number;
    END IF;
END //

-- 8. ONLY ACTIVE CUSTOMERS CAN APPLY FOR LOANS
CREATE TRIGGER check_active_customer
BEFORE INSERT ON LoanApplication
FOR EACH ROW
BEGIN
    DECLARE customer_status VARCHAR(20);

    SELECT status INTO customer_status
    FROM Customer
    WHERE ic_number = NEW.ic_number;

    IF customer_status IS NULL
       OR customer_status <> 'Active' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
            'Only active customers can apply for loans';
    END IF;
END //

DELIMITER ;


-- 9. DISPLAY ALL TABLES
SHOW TABLES;


-- 10. CHECK TABLE STRUCTURES
DESCRIBE Branch;
DESCRIBE Customer;
DESCRIBE BankAccount;
DESCRIBE LoanApplication;
DESCRIBE TransactionRecord;
