-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2024 at 11:48 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coffee-pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `username` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `username`, `password`, `created_time`, `modified_time`) VALUES
(1, 'admin 1', 'admin1', 'admin1', '2024-08-29 12:28:32', '2024-08-29 12:28:32');

-- --------------------------------------------------------

--
-- Table structure for table `beverages`
--

CREATE TABLE `beverages` (
  `beverage_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `sugar_level` longtext NOT NULL,
  `price` longtext NOT NULL,
  `calories` longtext NOT NULL,
  `bevarage_img` varchar(200) NOT NULL,
  `isPopular` tinyint(1) NOT NULL,
  `isFeatured` tinyint(1) NOT NULL,
  `category` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `beverages`
--

INSERT INTO `beverages` (`beverage_id`, `name`, `description`, `sugar_level`, `price`, `calories`, `bevarage_img`, `isPopular`, `isFeatured`, `category`) VALUES
(1, 'Mango Smoothie', 'A refreshing mango drink.', '[20, 30, 40]', '[3.99, 4.99, 5.99]', '[150, 180, 210]', 'https://example.com/img/mango_smoothie.jpg', 1, 0, 'Smoothies'),
(2, 'Iced Coffee', 'Cold brewed coffee with ice.', '[10, 20, 30]', '[2.50, 3.00, 3.50]', '[100, 120, 140]', 'https://example.com/img/iced_coffee.jpg', 1, 1, 'Coffee'),
(3, 'Green Tea', 'Organic green tea.', '[0, 10, 20]', '[1.99, 2.49, 2.99]', '[0, 10, 20]', 'https://example.com/img/green_tea.jpg', 0, 0, 'Tea'),
(4, 'Chocolate Milkshake', 'Rich and creamy chocolate shake.', '[30, 40, 50]', '[4.50, 5.00, 5.50]', '[300, 350, 400]', 'https://example.com/img/chocolate_milkshake.jpg', 1, 1, 'Shakes'),
(5, 'Lemonade', 'Freshly squeezed lemons.', '[15, 25, 35]', '[2.25, 2.75, 3.25]', '[120, 150, 180]', 'https://example.com/img/lemonade.jpg', 0, 0, 'Juices'),
(6, 'Strawberry Smoothie', 'A delicious strawberry drink.', '[20, 30, 40]', '[3.99, 4.99, 5.99]', '[140, 170, 200]', 'https://example.com/img/strawberry_smoothie.jpg', 1, 1, 'Smoothies'),
(7, 'Espresso', 'Strong and bold espresso.', '[0, 5, 10]', '[2.00, 2.50, 3.00]', '[5, 10, 15]', 'https://example.com/img/espresso.jpg', 1, 0, 'Coffee'),
(8, 'Herbal Tea', 'Relaxing herbal blend.', '[0, 5, 10]', '[2.25, 2.75, 3.25]', '[0, 10, 20]', 'https://example.com/img/herbal_tea.jpg', 0, 0, 'Tea'),
(9, 'Vanilla Milkshake', 'Classic vanilla shake.', '[25, 35, 45]', '[4.25, 4.75, 5.25]', '[290, 340, 390]', 'https://example.com/img/vanilla_milkshake.jpg', 1, 1, 'Shakes'),
(10, 'Orange Juice', 'Freshly squeezed oranges.', '[10, 20, 30]', '[2.75, 3.25, 3.75]', '[110, 140, 170]', 'https://example.com/img/orange_juice.jpg', 0, 0, 'Juices');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `customer_name` varchar(200) NOT NULL,
  `customer_msg` varchar(200) NOT NULL,
  `total_amt` double NOT NULL,
  `order_type` enum('Dine-In','Dine-Out','','') NOT NULL,
  `order_status` enum('Served','Preparing','Ready for Pickup','') NOT NULL DEFAULT 'Preparing',
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_modified` timestamp NOT NULL DEFAULT current_timestamp(),
  `isVoid` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `payment_id`, `customer_name`, `customer_msg`, `total_amt`, `order_type`, `order_status`, `created_time`, `last_modified`, `isVoid`) VALUES
(101, 1, '1', '', 15, 'Dine-In', 'Served', '2024-09-06 08:39:19', '2024-08-01 02:35:00', 0),
(102, 2, '2', '', 12.5, 'Dine-In', 'Served', '2024-09-06 06:53:07', '2024-08-02 03:05:00', 0),
(103, 3, '3', '', 22, 'Dine-In', 'Served', '2024-09-06 06:53:09', '2024-08-03 04:50:00', 0),
(104, 4, '4', '', 18.2, 'Dine-In', 'Preparing', '2024-09-06 06:53:12', '2024-08-04 06:25:00', 0),
(105, 5, '5', '', 9.99, 'Dine-Out', 'Served', '2024-09-06 06:53:14', '2024-08-05 07:35:00', 0),
(106, 6, '6', '', 13.75, 'Dine-In', 'Served', '2024-09-06 06:53:16', '2024-08-06 08:15:00', 0),
(107, 7, '7', '', 20, 'Dine-In', 'Served', '2024-09-06 06:53:21', '2024-08-07 09:10:00', 0),
(108, 8, '8', '', 7.5, 'Dine-In', 'Ready for Pickup', '2024-09-06 06:53:23', '2024-08-08 10:35:00', 0),
(109, 9, '9', '', 11.25, 'Dine-Out', 'Ready for Pickup', '2024-09-06 06:53:27', '2024-08-09 11:50:00', 0),
(110, 10, '0', '', 14.8, 'Dine-In', 'Ready for Pickup', '2024-09-06 06:53:29', '2024-08-10 12:25:00', 0),
(113, 11, '11', '', 100, 'Dine-In', 'Preparing', '2024-09-06 06:53:32', '2024-08-29 19:34:39', 0),
(114, 12, '[value-2]', '', 100, 'Dine-In', 'Preparing', '2024-09-06 06:53:34', '2024-09-01 17:20:41', 0),
(115, 13, '[value-3]', '', 100, 'Dine-In', 'Preparing', '2024-09-06 06:53:39', '2024-09-01 17:21:35', 0),
(119, 14, 'Coffin Lover', 'kapeng mainit isa', 100, 'Dine-In', 'Preparing', '2024-09-06 06:53:43', '2024-09-03 16:56:59', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_beverages`
--

CREATE TABLE `order_beverages` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `beverage_id` int(11) NOT NULL,
  `sugar_level` varchar(200) NOT NULL,
  `size` varchar(50) NOT NULL,
  `item_price` double NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `item_total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_beverages`
--

INSERT INTO `order_beverages` (`order_item_id`, `order_id`, `beverage_id`, `sugar_level`, `size`, `item_price`, `item_quantity`, `item_total`) VALUES
(1, 101, 1, '', '', 0, 0, 1.5),
(2, 101, 1, '', '', 0, 0, 1.5),
(3, 101, 1, '', '', 0, 0, 1.4),
(4, 104, 1, '', '', 0, 0, 1.2),
(5, 105, 1, '', '', 0, 0, 4),
(6, 106, 1, '', '', 0, 0, 3.2),
(7, 107, 1, '', '', 0, 0, 3.5),
(8, 108, 1, '', '', 0, 0, 2),
(9, 109, 1, '', '', 0, 0, 2.5),
(10, 110, 1, '', '', 0, 0, 2),
(11, 113, 1, '', '', 0, 0, 0),
(12, 113, 1, '', '', 0, 0, 0),
(13, 113, 1, '', '', 0, 0, 0),
(14, 119, 1, '100', '', 20, 2, 40);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NULL DEFAULT NULL,
  `payment_type` set('Gcash','Counter') NOT NULL,
  `payment_status` enum('Paid','Unpaid','Pending') NOT NULL DEFAULT 'Pending',
  `receipt_url` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `admin_id`, `created_time`, `modified_time`, `payment_type`, `payment_status`, `receipt_url`) VALUES
(1, 1, '2024-08-01 02:30:00', NULL, 'Gcash', 'Paid', 'https://example.com/receipts/1'),
(2, 1, '2024-08-02 03:00:00', NULL, 'Counter', 'Paid', 'https://example.com/receipts/2'),
(3, 1, '2024-08-03 04:45:00', NULL, 'Gcash', 'Paid', 'https://example.com/receipts/3'),
(4, 1, '2024-08-04 05:20:00', NULL, 'Counter', 'Pending', 'https://example.com/receipts/4'),
(5, 1, '2024-08-05 07:30:00', NULL, 'Counter', 'Paid', 'https://example.com/receipts/5'),
(6, 1, '2024-08-06 08:10:00', NULL, 'Gcash', 'Paid', 'https://example.com/receipts/6'),
(7, 1, '2024-08-07 09:05:00', NULL, 'Counter', 'Paid', 'https://example.com/receipts/7'),
(8, 1, '2024-08-08 10:20:00', NULL, 'Gcash', 'Pending', 'https://example.com/receipts/8'),
(9, 1, '2024-08-09 11:30:00', NULL, 'Counter', 'Pending', 'https://example.com/receipts/9'),
(10, 1, '2024-08-10 12:15:00', NULL, 'Gcash', 'Pending', 'https://example.com/receipts/10'),
(11, 1, '2024-08-11 13:10:00', NULL, 'Counter', 'Pending', 'https://example.com/receipts/11'),
(12, 1, '2024-08-12 14:25:00', NULL, 'Gcash', 'Pending', 'https://example.com/receipts/12'),
(13, 1, '2024-08-13 15:35:00', NULL, 'Counter', 'Pending', 'https://example.com/receipts/13'),
(14, 1, '2024-08-14 01:45:00', NULL, 'Gcash', 'Pending', 'https://example.com/receipts/14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `beverages`
--
ALTER TABLE `beverages`
  ADD PRIMARY KEY (`beverage_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `payment-relation` (`payment_id`);

--
-- Indexes for table `order_beverages`
--
ALTER TABLE `order_beverages`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order-relation` (`order_id`),
  ADD KEY `beverages-relation` (`beverage_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `admin-relation` (`admin_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `beverages`
--
ALTER TABLE `beverages`
  MODIFY `beverage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `order_beverages`
--
ALTER TABLE `order_beverages`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `payment-relation` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`);

--
-- Constraints for table `order_beverages`
--
ALTER TABLE `order_beverages`
  ADD CONSTRAINT `beverages-relation` FOREIGN KEY (`beverage_id`) REFERENCES `beverages` (`beverage_id`),
  ADD CONSTRAINT `order-relation` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `admin-relation` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
