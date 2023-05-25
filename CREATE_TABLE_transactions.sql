CREATE TABLE transactions(
    transaction_id INT UNIQUE,
    transaction_amount DECIMAL(5,2),
    transaction_datetime DATETIME DEFAULT NOW()
);

ALTER TABLE transactions ADD CONSTRAINT UNIQUE(transaction_id);

ALTER TABLE transactions RENAME COLUMN Amount TO transaction_amount;

ALTER TABLE transactions ALTER transaction_amount SET DEFAULT 0.00;

INSERT INTO transactions (transaction_id,transaction_amount)
VALUES (0,4.53),
(1,3.93),
(2,5.97),
(3,4.94),
(4,2.99),
(5,6.99),
(6,8.49),
(7,9.93);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    transaction_amount DECIMAL(5,2)    
);


/* Tables can only have 1 primary key and each primary key value must be unique and cannot be NULL*/
ALTER TABLE transactions ADD CONSTRAINT PRIMARY KEY(transaction_id);

CREATE TABLE transactions(
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    transaction_amount DECIMAL(5,2),
    transaction_datetime DATETIME DEFAULT NOW()
);

ALTER TABLE transactions AUTO_INCREMENT=1000;

INSERT INTO transactions (transaction_amount) VALUES (4.53);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

INSERT INTO customers (first_name,last_name) VALUES
('Squidward','Tentacles'),
('Spongebob','Squarepants'),
('Patrick','Star'),
('Sandy','Cheecks');

CREATE TABLE transactions(
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    transaction_amount DECIMAL(5,2),
    transaction_datetime DATETIME DEFAULT NOW()
    customer_id INT, 
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);
/* To add a name to the foreign key9. */
ALTER TABLE transactions ADD CONSTRAINT fk_customers FOREIGN KEY(customer_id) REFERENCES customers(customer_id);

ALTER TABLE transactions AUTO_INCREMENT=1000;

DELETE FROM transactions;

INSERT INTO transactions(transaction_amount,customer_id) VALUES
(3.99,1);


INSERT INTO customers(first_name,last_name) VALUES 
('Larry','Lobster'), 
('Bubble','Bass'), 
('Poppy','Puff'), 
('Fred','Fish');


/* Joining tables */


/* Inner Join */
SELECT * FROM transactions INNER JOIN customers
ON transactions.customer_id = customers.customer_id;

SELECT transaction_id,transaction_amount,first_name,last_name 
FROM transactions INNER JOIN customers ON transactions.customer_id = customers.customer_id;

/* Left Join */
SELECT * FROM transactions LEFT JOIN customers ON transactions.customer_id = customers.customer_id;

/* Right Join */
SELECT * FROM transactions RIGHT JOIN customers ON transactions.customer_id = customers.customer_id;

/* Functions */

SELECT COUNT(customer_id) AS IDs FROM transactions;
SELECT MAX(transaction_amount) AS Maximum FROM transactions;
SELECT MIN(transaction_amount) AS Minimum FROM transactions;
SELECT AVG(transaction_amount) AS Average FROM transactions;
SELECT SUM(transaction_amount) AS Total FROM transactions;
SELECT CONCAT(first_name,last_name) AS full_name FROM customers;
SELECT CONCAT(first_name,' ',last_name) AS full_name FROM customers;

-- Stored Precedure
-- is prepared SQL code that you can save
-- great if there's a query that you write often

DELIMITER $$
CREATE PROCEDURE get_customer_id()
BEGIN
SELECT transaction_id,transaction_amount,first_name,last_name 
FROM transactions INNER JOIN customers ON transactions.customer_id = customers.customer_id;
END $$
DELIMITER ;

CALL get_customer_id();
DROP get_customer_id();