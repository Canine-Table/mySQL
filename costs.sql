SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `costs` (
  `cost_id` int NOT NULL,
  `cost_name` varchar(50) DEFAULT 'None',
  `cost_total` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `costs` (`cost_id`, `cost_name`, `cost_total`) VALUES
(1, 'salaries', 516360.00),
(2, 'supplies', 0.00),
(3, 'taxes', 0.00),
(4, 'deleted', 30430.00);

DELIMITER $$
CREATE TRIGGER `get_total_salaries` BEFORE DELETE ON `costs` FOR EACH ROW UPDATE costs
SET cost_total = (SELECT SUM(current_salary) FROM employees) 
WHERE cost_name = 'salaries'
$$
DELIMITER ;

ALTER TABLE `costs`
  ADD PRIMARY KEY (`cost_id`);

ALTER TABLE `costs`
  MODIFY `cost_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;