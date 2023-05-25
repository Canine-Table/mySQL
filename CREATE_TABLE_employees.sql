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
