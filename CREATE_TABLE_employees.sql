CREATE TABLE employees (
	employee_id INT, 
	first_name VARCHAR(50),
	last_name VARCHAR(50), 
	hourly_pay DECIMAL(5, 2), 
	hire_date DATE,
	hire_time DATETIME
);

SELECT * FROM employees;

ALTER TABLE employees RENAME COLUMN phone_number TO email;

RENAME TABLE employees workers;

ALTER TABLE employees ADD phone_number VARCHAR(15);

SELECT * FROM employees;

ALTER TABLE employees RENAME COLUMN phone_number TO email;

ALTER TABLE employees MODIFY COLUMN email VARCHAR(100);

ALTER TABLE employees MODIFY email VARCHAR(100) AFTER last_name

ALTER TABLE employees DROP COLUMN email;

INSERT INTO employees VALUES(1,'Eugene','Krabs',25.50,'2023-01-02');

INSERT INTO employees VALUES


SELECT * FROM employees;

INSERT INTO employees (employee_id,hourly_pay,hire_date) VALUES (6,15.00,'2023-01-08');

SELECT first_name,last_name FROM `employees` WHERE employee_id <= 3;

SELECT first_name,last_name FROM employees WHERE employee_id != 3;

SELECT * FROM employees WHERE first_name IS NULL;

UPDATE employees SET first_name = 'John' WHERE employee_id = 6;

UPDATE employees SET hourly_pay = 10.25 WHERE first_name = 'John';

SELECT * FROM employees WHERE first_name IS NOT NULL;

DELETE FROM employees

UPDATE employees SET * NULL;

DELETE FROM employees WHERE employee_id = 6;

SET AUTOCOMMIT = OFF;

COMMIT;

SELECT ALL FROM employees;

INSERT INTO employees VALUES (6,'John','Doe',15.00,CURRENT_DATE());

ALTER TABLE employees ADD CONSTRAINT check_hourly_pay CHECK (hourly_pay >= 12.00);

ALTER TABLE employees DROP CHECK check_hourly_pay;

ALTER TABLE employees ADD COLUMN job_title VARCHAE(50) AFTER hourly_pay;

UPDATE employees SET job_title = 'employee';

UPDATE employees SET job_title = 'manager' WHERE first_name = 'Eugene';

ALTER TABLE employees ADD CONSTRAINT PRIMARY KEY(employee_id);

ALTER TABLE employees ADD CONSTRAINT df_hire_date DEFAULT CURRENT_DATE() FOR hire_date;

ALTER TABLE employees ADD CONSTRAINT check_hourly_pay CHECK (hourly_pay >= 12.00);

CREATE TABLE employees (
  employee_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) DEFAULT 'John',
  last_name VARCHAR(50) DEFAULT 'Doe',
  hourly_pay DECIMAL(5,2) DEFAULT 12.50, CONSTRAINT check_hourly_pay CHECK (hourly_pay >= 12.00);
  job_title VARCHAR(50) DEFAULT 'unemployed',
  hire_date DATETIME DEFAULT NOW()
);

INSERT INTO `employees` (`first_name`, `last_name`, `hourly_pay`, `job_title`) VALUES
('Eugene', 'Krabs', 25.50, 'manager');

INSERT INTO `employees` (`first_name`, `last_name`, `hourly_pay`, `job_title`) VALUES
('Squidward', 'Tentacles', 15.00, 'cashier');

INSERT INTO `employees` (`first_name`, `last_name`, `hourly_pay`, `job_title`) VALUES
('Spongebob', 'Squarepants', 12.50, 'cook');

INSERT INTO `employees` (`first_name`, `last_name`, `hourly_pay`, `job_title`) VALUES
('Patrick', 'Star', 12.50, 'unknown');

INSERT INTO `employees` (`first_name`, `last_name`, `hourly_pay`, `job_title`) VALUES
('Sheldon', 'Plankton', 12.00, 'rival');

INSERT INTO `employees` (`first_name`, `last_name`, `hourly_pay`, `job_title`) VALUES
('Sandy', 'Cheecks', 17.25, 'scientist');

/* Conditionals */

SELECT * FROM employees WHERE employee_id <= 4 AND hourly_pay >= 15.00;
SELECT * FROM employees WHERE employee_id <= 4 OR hourly_pay >= 15.00;
SELECT * FROM employees WHERE employee_id <= 4 AND NOT hourly_pay >= 15.00;
SELECT * FROM employees WHERE hourly_pay BETWEEN 12.00 AND 15.00;
SELECT * FROM employees WHERE job_title IN ('cook','cashier','manager');

-- 	wild car characters % _
/* 	
	used to substitute one or more characters in a string
	the % is equivalent to the astrisk in bash
	the _ is equivalent to the question mark in bash
*/

SELECT CONCAT_WS(' ',first_name,last_name) AS full_name FROM employees WHERE first_name LIKE "%S%" OR last_name LIKE "%S%";


SELECT * FROM (
  SELECT CONCAT(first_name,' ',last_name) AS full_name FROM employees
) AS sub
WHERE full_name LIKE "%S%";

SELECT * FROM (
	SELECT CONCAT_WS(' ',first_name,last_name) AS full_name FROM employees
) AS sub WHERE full_name LIKE "%a_";

SELECT * FROM employees WHERE job_title LIKE "_a%";

-- the ORDER BY operator

SELECT * FROM employees ORDER BY last_name ASC;
SELECT * FROM employees ORDER BY last_name DESC;

-- if 2 customer_ids have the same value the sort will then go to transaction_amount
-- for those items in  question for example if customer_id is NULL.

SELECT * FROM transactions ORDER BY customer_id, transaction_amount DESC;

-- LIMIT clause
-- this is used to limit the number of recods
-- useful if you're working with a lot of data
-- can be used to display large data on pages (pagination).
-- like cat my_file.txt | head -n 3

SELECT * FROM employees LIMIT 3;
SELECT * FROM employees LIMIT 3, 3; -- first value is an offset and the second value is how many to show

-- UNION
-- combines the results of two or more SELECT statements

CREATE TABLE expenses (current_expenses DECIMAL(10,2) DEFAULT 0.00);
CREATE TABLE income (income_name VARCHAR(50) DEFAULT 'NONE');

INSERT INTO income VALUES ('orders'),('merchandise'),('services'),('wages'),('taxes'),('repairs');
INSERT INTO expenses VALUES (1000000.00),(50000.00),(125000.00),(-250000.00),(-50000.00),(-15000.00);

SELECT * FROM income UNION SELECT * FROM expenses;
SELECT first_name,last_name FROM employees UNION SELECT first_name,last_name FROM customers;
SELECT first_name,last_name FROM employees UNION ALL SELECT first_name,last_name FROM customers; 

-- UNION ALL will also display duplicate values

-- SELF JOIN
-- join another copy of a table to itself
-- used to compare rows of the same table
-- helps to display a hierarchy of data

SELECT a.referral_id AS RID, CONCAT_WS(' ',a.first_name,a.last_name) AS recived_referral
		,b.customer_id AS CID,CONCAT_WS(' ',b.first_name,b.last_name) AS referred_by
FROM customers AS a INNER JOIN customers AS b ON a.referral_id = b.customer_id;

ALTER TABLE supervisor_id INT DEFAULT 1;

ALTER TABLE employees ADD supervisor_id INT DEFAULT 1;

SELECT * FROM employees;

UPDATE employees SET supervisor_id = 6 WHERE employee_id BETWEEN 2 AND 4;

SELECT * FROM employees;

UPDATE employees SET supervisor_id = 4 WHERE employee_id = 5;

SELECT * FROM employees;

SELECT * FROM employees AS a LEFT JOIN employees b ON a.supervisor_id = b.employee_id;

SELECT * FROM employees;

SELECT * FROM employees AS a LEFT JOIN employees b ON b.supervisor_id = a.employee_id;

SELECT CONCAT_WS(' ',a.first_name,a.last_name) AS reports_to,
		CONCAT_WS(' ',b.first_name,b.last_name) AS employee_name
FROM employees AS a INNER JOIN employees b ON b.supervisor_id = a.employee_id;

-- VIEWS
-- a virtual table based on the result-set of an SQL statement
-- The fields in a view are fields from one or more real tables in the database
-- They're not real tables, but can be insteracted with as if they were

CREATE VIEW employee_attendance AS SELECT first_name, last_name FROM employees;

ALTER TABLE customers ADD COLUMN email VARCHAR(50) DEFAULT 'johndoe@null.local';

CREATE VIEW customer_emails AS SELECT CONCAT_WS(' ',first_name,last_name) AS customer_name, email FROM customers;

-- INDEX (BTree data Structure)
-- indexes are used to find values within a specific column more quickly 
-- mySQL normally searches sequentially through a column
-- The longer the column, the more expensive the operation is
-- UPDATE takes more time, SELECT takes less time

CREATE INDEX first_name_idx ON customers(first_name);
CREATE INDEX last_name_idx ON customers(last_name);
CREATE INDEX email_idx ON customers(email);
SHOW INDEXES FROM customers;
ALTER TABLE DROP INDEX last_name_idx

-- Multi Column Index
-- SQL has what is known as a (Left Most Prefix)

CREATE INDEX last_name_first_name_idx ON customers(last_name,first_name);

-- Subquery
-- a query within another query
-- query(subquery)

SELECT first_name, last_name, (SELECT AVG(hourly_pay) FROM employees) AS average FROM employees;
SELECT first_name, last_name, hourly_pay FROM employees WHERE hourly_pay >= (SELECT AVG(hourly_pay) FROM employees);
SELECT first_name, last_name FROM customers WHERE customer_id IN (SELECT DISTINCT customer_id FROM transactions WHERE customer_id IS NOT NULL);

-- GROUP BY
-- aggregate all rows by a specific column
-- often usesd with aggregate functions such as
-- ex. SUM(), MAX(), MIN(), AVG(), COUNT()

SELECT SUM(transaction_amount) FROM transactions GROUP BY transaction_datetime;
SELECT transaction_datetime AS date, SUM(transaction_amount) AS total_revenu FROM transactions GROUP BY transaction_datetime;
SELECT AVG(transaction_amount) AS total_revenu, transaction_datetime AS the_date FROM transactions GROUP BY transaction_datetime;
SELECT MAX(transaction_amount) AS total_revenu, transaction_datetime AS the_date FROM transactions GROUP BY transaction_datetime;
SELECT SUM(transaction_amount) AS total_revenu FROM transactions GROUP by customer_id HAVING COUNT(transaction_amount) > 1 AND customer_id IS NOT NULL;

-- ROLLUP
-- extention of the GROUP BY clause
-- produces another row and shows the GRAND TOTAL (super-aggregate value)

SELECT SUM(transaction_amount) AS total_cost, transaction_datetime AS purchase_date FROM transactions GROUP BY transaction_datetime WITH ROLLUP;
SELECT SUM(hourly_pay) AS hourly_pay, employee_id FROM employees GROUP BY employee_id WITH ROLLUP;

-- FK = Foreign Key

-- ON DELETE SET NULL
-- When a FK is deleted, replace FK with NULL

-- ON DELETE CASCADE
-- When FK is deleted, delete the row

SET foreign_key_checks = 0;
DELETE FROM customers WHERE customer_id = 4;

CREATE TABLE employees (
	employee_id INT, 
	first_name VARCHAR(50),
	last_name VARCHAR(50), 
	hourly_pay DECIMAL(5, 2), 
	hire_date DATE,
	hire_time DATETIME
);

CREATE TABLE employees (
	employee_id INT PRIMARY KEY, 
	first_name VARCHAR(50),
	last_name VARCHAR(50), 
	hourly_pay DECIMAL(5, 2), 
	hire_date DATE,
	hire_time DATETIME
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE SET CASCADE
);

ALTER TABLE transactions ADD CONSTRAINT fk_customer_idx 
FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE SET NULL;

-- Stored Precedure
-- is prepared SQL code that you can save
-- great if there's a query that you write often

DELIMITER $$
CREATE PROCEDURE get_employee_id(IN id INT)
BEGIN
SELECT employee_id AS staff_id, 
CONCAT_WS(' ',first_name,last_name) AS full_name, 
hourly_pay AS pay_scale FROM employees WHERE employee_id = id;
END $$
DELIMITER ;

CALL get_employee_id(1);
DROP get_employee_id();

DELIMITER $$
CREATE PROCEDURE get_employee_id_range(IN id_one INT,IN id_two INT)
BEGIN
SELECT employee_id AS staff_id, 
CONCAT_WS(' ',first_name,last_name) AS full_name, 
hourly_pay AS pay_scale FROM employees WHERE employee_id BETWEEN id_one AND id_two;
END $$
DELIMITER ;

CALL get_employee_id_range(1,6)
DROP get_employee_id_range()

-- Trigger
-- When an event happens, do something
-- ex. (INSERT, UPDATE, DELETE)
-- check data, handles errors, auditing tables

ALTER TABLE employees ADD COLUMN current_salary DECIMAL(10,2) AFTER hourly_pay;
UPDATE employees SET current_salary = hourly_pay * 2080;

CREATE TRIGGER before_hourly_pay_update
BEFORE UPDATE ON employees FOR EACH ROW
SET NEW.current_salary = NEW.hourly_pay * 2080;

SHOW TRIGGERS;

UPDATE employees SET hourly_pay = 150 WHERE employee_id = 1;
UPDATE employees SET hourly_pay = hourly_pay + 1.50;

CREATE TRIGGER before_hourly_pay_insert 
BEFORE INSERT ON employees FOR EACH ROW SET NEW.current_salary = NEW.hourly_pay * 2080;

CREATE TABLE costs(
	cost_id INT PRIMARY KEY AUTO_INCREMENT,
	cost_name VARCHAR(50) DEFAULT 'None',
	cost_total DECIMAL(10,2) DEFAULT 0.00
);

INSERT INTO costs(cost_name) VALUES ('salaries'),('supplies'),('taxes');

UPDATE costs
SET cost_total = (SELECT SUM(current_salary) FROM employees) 
WHERE cost_name = 'salaries'

CREATE TRIGGER get_total_salaries
BEFORE DELETE ON costs FOR EACH ROW 
UPDATE costs
SET cost_total = (SELECT SUM(current_salary) FROM employees) 
WHERE cost_name = salaries


DELIMITER $$
CREATE PROCEDURE add_e()
BEGIN
INSERT INTO employees(employee_id) VALUES (7);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE del_e()
BEGIN
DELETE FROM employees WHERE employee_id = 7;
END $$
DELIMITER ;

CREATE TRIGGER before_hourly_pay_is_updated
BEFORE UPDATE ON employees FOR EACH ROW
SET NEW.current_salary = (NEW.hourly_pay * 2080);

CREATE TRIGGER get_total_cost_after_update
AFTER UPDATE ON employees FOR EACH ROW
UPDATE costs SET cost_total = (SELECT SUM(current_salary / 0.14) FROM employees)
WHERE cost_name = taxes;

CREATE TRIGGER before_hourly_pay_is_inserted
BEFORE INSERT ON employees
FOR EACH ROW
SET NEW.current_salary = (NEW.hourly_pay * 2080);