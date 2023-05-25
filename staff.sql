CREATE TABLE staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL DEFAULT 'John/Jane',
    last_name VARCHAR(50) NOT NULL DEFAULT 'Doe',
    hourly_pay DECIMAL(5,2) NOT NULL DEFAULT 12.50, 
    current_salary DECIMAL(10,2) NOT NULL DEFAULT 26000.00, 
    job_title VARCHAR(50) NOT NULL DEFAULT 'unemployed',
    hire_datetime DATETIME NOT NULL DEFAULT NOW(),
    supervisor_id INT DEFAULT 1000
);

DROP TABLE staff;
ALTER TABLE staff DROP CHECK CONSTRAINT check_hourly_pay;
ALTER TABLE staff DROP CHECK CONSTRAINT check_current_salary;

ALTER TABLE staff AUTO_INCREMENT=1000;
ALTER TABLE staff ADD CONSTRAINT check_hourly_pay CHECK (hourly_pay >= 12.50);
ALTER TABLE staff ADD CONSTRAINT check_current_salary CHECK (current_salary >= 26000.00);

INSERT INTO `staff` (`first_name`, `last_name`, `hourly_pay`, `job_title`,`supervisor_id`) VALUES
('Eugene', 'Krabs', 25.50, 'manager',NULL);

INSERT INTO `staff` (`first_name`, `last_name`, `hourly_pay`, `job_title`,`supervisor_id`) VALUES
('Squidward', 'Tentacles', 15.00, 'cashier',1005);

INSERT INTO `staff` (`first_name`, `last_name`, `hourly_pay`, `job_title`,`supervisor_id`) VALUES
('Spongebob', 'Squarepants', 12.50, 'cook',1005);

INSERT INTO `staff` (`first_name`, `last_name`, `hourly_pay`, `job_title`,`supervisor_id`) VALUES
('Patrick', 'Star', 12.50, 'unknown',1005);

INSERT INTO `staff` (`first_name`, `last_name`, `hourly_pay`, `job_title`,`supervisor_id`) VALUES
('Sheldon', 'Plankton', 12.50, 'rival',1002);

INSERT INTO `staff` (`first_name`, `last_name`, `hourly_pay`, `job_title`) VALUES
('Sandy', 'Cheecks', 17.25, 'scientist');

CREATE VIEW employee_full_names AS 
SELECT staff_id,
CONCAT_WS(' ',first_name,last_name) AS full_name,
supervisor_id
FROM staff;

SELECT * FROM employee_full_names;

CREATE INDEX staff_last_name_first_name ON staff(last_name,first_name);
CREATE INDEX staff_current_salary_hourly_pay ON staff(current_salary,hourly_pay);

SELECT SUM(hourly_pay) AS hourly_cost,SUM(current_salary) AS yearly_cost 
FROM staff GROUP BY staff_id WITH ROLLUP

ALTER TABLE staff ADD CONSTRAINT fk_supervisor_idx 
FOREIGN KEY(supervisor_id) REFERENCES staff(staff_id) ON DELETE SET NULL;

DELIMITER $$
CREATE PROCEDURE get_total_staff_cost()
BEGIN
SELECT CONCAT_WS(' ',first_name,last_name) AS full_name, a.staff_id, b.hourly_cost, b.yearly_cost
FROM staff AS a RIGHT JOIN (SELECT SUM(hourly_pay) AS hourly_cost,SUM(current_salary) AS yearly_cost,
staff_id FROM staff GROUP BY staff_id WITH ROLLUP) AS b ON a.staff_id = b.staff_id;
END $$
DELIMITER ;

CALL get_total_staff_cost();
DROP get_total_staff_cost();

UPDATE staff SET current_salary = hourly_pay * 2080;
UPDATE staff SET hourly_pay = 69 WHERE staff_id = 1000;
UPDATE staff SET hourly_pay = hourly_pay + 1 WHERE staff_id != 1000;

CREATE TRIGGER before_hourly_pay_update
BEFORE UPDATE ON staff
FOR EACH ROW
SET NEW.current_salary = (NEW.hourly_pay * 2080);

CREATE TRIGGER before_hourly_pay_insert
BEFORE INSERT ON staff
FOR EACH ROW
SET NEW.current_salary = (NEW.hourly_pay * 2080);

CREATE TRIGGER after_current_salary_delete
AFTER DELETE ON staff
FOR EACH ROW
UPDATE payments 
SET total_payment_cost = total_payment_cost - OLD.current_salary
WHERE payment_name = 'salaries';

CREATE TRIGGER after_current_salary_insert
AFTER INSERT ON staff
FOR EACH ROW
UPDATE payments 
total_payment_cost = total_payment_cost + NEW.current_salary
WHERE payment_name = 'salaries';

CREATE TRIGGER after_current_salary_update
AFTER UPDATE ON staff
FOR EACH ROW
UPDATE payments
SET total_payment_cost = total_payment_cost + (NEW.current_salary - OLD.current_salary)
WHERE payment_name = 'salaries';

SHOW TRIGGERS;

CREATE TABLE payments(
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    payment_name VARCHAR(50) NOT NULL DEFAULT 'item',
    total_payment_cost DECIMAL(10, 2) NOT NULL DEFAULT 0.00
);

INSERT INTO payments(payment_name) VALUES
('salaries'),
('supplies'),
('taxes');

UPDATE payments 
SET total_payment_cost = (SELECT SUM(current_salary) FROM staff)
WHERE payment_name = 'salaries';

DELETE FROM staff WHERE staff_id = 1006
INSERT INTO staff(staff_id) VALUES (1006);

UPDATE staff SET hourly_pay = 150 WHERE staff_id = 1000;
