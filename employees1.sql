SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `employees` (
  `employee_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT 'John',
  `last_name` varchar(50) DEFAULT 'Doe',
  `hourly_pay` decimal(5,2) DEFAULT '12.50',
  `current_salary` decimal(10,2) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT 'unemployed',
  `hire_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `supervisor_id` int DEFAULT '1'
) ;

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `hourly_pay`, `current_salary`, `job_title`, `hire_date`, `supervisor_id`) VALUES
(1, 'Eugene', 'Krabs', 151.50, 315120.00, 'manager', '2023-05-25 01:38:50', 1),
(2, 'Squidward', 'Tentacles', 16.50, 34320.00, 'cashier', '2023-05-25 01:39:39', 6),
(3, 'Spongebob', 'Squarepants', 14.00, 29120.00, 'cook', '2023-05-25 01:40:38', 6),
(4, 'Patrick', 'Star', 14.00, 29120.00, 'unknown', '2023-05-25 01:41:06', 6),
(5, 'Sheldon', 'Plankton', 13.50, 28080.00, 'rival', '2023-05-25 01:41:18', 4),
(6, 'Sandy', 'Cheecks', 38.75, 80600.00, 'scientist', '2023-05-25 01:41:40', 1);

DELIMITER $$
CREATE TRIGGER `before_hourly_pay_insert` BEFORE INSERT ON `employees` FOR EACH ROW SET NEW.current_salary = NEW.hourly_pay * 2080
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_hourly_pay_is_inserted` BEFORE INSERT ON `employees` FOR EACH ROW SET NEW.current_salary = (NEW.hourly_pay * 2080)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_hourly_pay_is_updated` BEFORE UPDATE ON `employees` FOR EACH ROW SET NEW.current_salary = (NEW.hourly_pay * 2080)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_hourly_pay_update` BEFORE UPDATE ON `employees` FOR EACH ROW SET NEW.current_salary = NEW.hourly_pay * 2080
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `get_total_cost_after_delete` AFTER DELETE ON `employees` FOR EACH ROW UPDATE costs SET cost_total = (SELECT SUM(current_salary / 0.14) FROM employees)
WHERE cost_name = taxes
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `get_total_cost_after_insert` AFTER INSERT ON `employees` FOR EACH ROW UPDATE costs SET cost_total = (SELECT SUM(current_salary / 0.14) FROM employees)
WHERE cost_name = taxes
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `get_total_cost_after_update` AFTER UPDATE ON `employees` FOR EACH ROW UPDATE costs SET cost_total = (SELECT SUM(current_salary / 0.14) FROM employees)
WHERE cost_name = taxes
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `get_total_tax` BEFORE INSERT ON `employees` FOR EACH ROW UPDATE costs
SET cost_total = ((SELECT SUM(current_salary) FROM employees) / 0.14)
WHERE cost_name = taxes
$$
DELIMITER ;

ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

ALTER TABLE `employees`
  MODIFY `employee_id` int NOT NULL AUTO_INCREMENT;
COMMIT;