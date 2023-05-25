SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `transactions` (
  `transaction_id` int NOT NULL,
  `transaction_amount` decimal(5,2) DEFAULT NULL,
  `transaction_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `transactions` (`transaction_id`, `transaction_amount`, `transaction_datetime`, `customer_id`) VALUES
(1000, 3.99, '2023-05-24 22:03:25', 1),
(1001, 6.59, '2023-05-24 22:03:44', 4),
(1002, 8.39, '2023-05-24 22:03:56', 3),
(1003, 1.29, '2023-05-24 22:04:19', 2),
(1004, 34.39, '2023-05-24 22:04:30', 3),
(1005, 1.00, '2023-05-24 22:22:19', NULL),
(1006, 23.30, '2023-05-24 22:22:24', NULL);

ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `fk_customers` (`customer_id`);

ALTER TABLE `transactions`
  MODIFY `transaction_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1007;

ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);
COMMIT;