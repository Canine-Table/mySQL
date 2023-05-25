SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `expenses` (
  `current_expenses` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `expenses` (`current_expenses`) VALUES
(1000000.00),
(50000.00),
(125000.00),
(-250000.00),
(-50000.00),
(-15000.00);
COMMIT;