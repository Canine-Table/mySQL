SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `employees` (
  `employee_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `hourly_pay` decimal(5,2) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `hire_date` date DEFAULT NULL
) ;

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `hourly_pay`, `job_title`, `hire_date`) VALUES
(1, 'Eugene', 'Krabs', 25.50, 'manager', '2023-01-02'),
(2, 'Squidward', 'Tentacles', 15.00, 'employee', '2023-01-03'),
(3, 'Spongebob', 'Squarepants', 12.50, 'cook', '2023-01-04'),
(4, 'Patrick', 'Star', 12.00, 'unknown', '2023-01-05'),
(5, 'Sheldon', 'Plankton', 15.00, 'rival', '2023-01-07'),
(6, 'John', 'Doe', 15.00, 'employee', '2023-05-22'),
(7, 'Sandy', 'Cheecks', 17.25, 'scientist', '2023-01-06');

ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);
COMMIT;
