SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `products` (
  `product_id` int DEFAULT NULL,
  `product_name` varchar(25) DEFAULT NULL,
  `price` decimal(4,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `products` (`product_id`, `product_name`, `price`) VALUES
(100, 'Hamburger', 3.99),
(101, 'Fries', 1.89),
(102, 'Soda', 1.00),
(103, 'Ice Cream', 1.49),
(104, 'cookie', 1.59),
(106, 'Straw', 0.00),
(107, 'Napkin', 0.00),
(108, 'Fork', 0.00),
(109, 'Spoon', 0.00),
(110, 'Knife', 0.00);

ALTER TABLE `products`
  ADD UNIQUE KEY `product_name` (`product_name`);
COMMIT;