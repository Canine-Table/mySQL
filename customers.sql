SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `referral_id` int DEFAULT '0',
  `email` varchar(50) DEFAULT 'johndoe@null.local'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `referral_id`, `email`) VALUES
(1, 'Squidward', 'Tentacles', 6, 'tentacles@gmail.com'),
(2, 'Spongebob', 'Squarepants', 4, 'squarepants@yahoo.com'),
(3, 'Patrick', 'Star', 1, 'star@proton.com'),
(4, 'Sandy', 'Cheecks', 5, 'cheeks@outlook.com'),
(5, 'Larry', 'Lobster', 0, 'lobster@duck.com'),
(6, 'Bubble', 'Bass', 0, 'bass@gmail.com'),
(7, 'Poppy', 'Puff', 0, 'puff@yandex.com'),
(8, 'Fred', 'Fish', 0, 'fish@hotmail.com');

ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `first_name_idx` (`first_name`),
  ADD KEY `email_idx` (`email`),
  ADD KEY `last_name_first_name_idx` (`last_name`,`first_name`);

ALTER TABLE `customers`
  MODIFY `customer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;