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

INSERT INTO transactions (transaction_amount)
VALUES (4.53);

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

/* Joining tables */

SELECT * FROM transactions INNER JOIN customers
ON transaction_id.customer_id = customers.customer_id;