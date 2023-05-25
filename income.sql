SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `income` (
  `income_name` varchar(50) DEFAULT 'NONE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `income` (`income_name`) VALUES
('orders'),
('merchandise'),
('services'),
('wages'),
('taxes'),
('repairs');
COMMIT;