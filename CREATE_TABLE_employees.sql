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
(2,'Squidward','Tentacles',15.00,'2023-01-03'),
(3,'Spongebob','Squarepants',12.50,'2023-01-04'),
(4,'Patrick','Star',12.00,'2023-01-05'),
(5,'Sandy','Cheecks',17.25,'2023-01-06');

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
