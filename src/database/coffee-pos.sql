-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2024 at 09:16 PM
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
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `total_amt` double NOT NULL,
  `order_type` enum('dine-in','dine-out','','') NOT NULL,
  `payment_type` enum('Gcash','Counter','','') NOT NULL,
  `order_status` enum('Served','Preparing','Ready for Pickup','') NOT NULL DEFAULT 'Preparing',
  `payment_status` enum('Paid','Pending','Unpaid','') NOT NULL DEFAULT 'Pending',
  `receipt_url` varchar(200) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_modified` timestamp NOT NULL DEFAULT current_timestamp(),
  `isVoid` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `total_amt`, `order_type`, `payment_type`, `order_status`, `payment_status`, `receipt_url`, `created_time`, `last_modified`, `isVoid`) VALUES
(101, 15, 'dine-in', 'Gcash', 'Served', 'Paid', 'https://receipt.example.com/101', '2024-08-29 18:34:04', '2024-08-01 02:35:00', 0),
(102, 12.5, 'dine-in', 'Counter', 'Served', 'Paid', 'https://receipt.example.com/102', '2024-08-29 18:04:01', '2024-08-02 03:05:00', 0),
(103, 22, 'dine-in', 'Gcash', 'Served', 'Paid', 'https://receipt.example.com/103', '2024-08-29 18:04:09', '2024-08-03 04:50:00', 0),
(104, 18.2, 'dine-in', '', 'Preparing', 'Pending', 'https://receipt.example.com/104', '2024-08-29 18:04:19', '2024-08-04 06:25:00', 0),
(105, 9.99, 'dine-out', 'Gcash', 'Served', 'Paid', 'https://receipt.example.com/105', '2024-08-29 18:04:13', '2024-08-05 07:35:00', 0),
(106, 13.75, 'dine-in', '', 'Served', 'Pending', 'https://receipt.example.com/106', '2024-08-29 18:04:42', '2024-08-06 08:15:00', 0),
(107, 20, 'dine-in', '', 'Served', 'Unpaid', 'https://receipt.example.com/107', '2024-08-29 18:04:45', '2024-08-07 09:10:00', 0),
(108, 7.5, 'dine-in', '', 'Ready for Pickup', 'Pending', 'https://receipt.example.com/108', '2024-08-29 18:04:40', '2024-08-08 10:35:00', 0),
(109, 11.25, 'dine-out', '', 'Ready for Pickup', 'Unpaid', 'https://receipt.example.com/109', '2024-08-29 18:04:56', '2024-08-09 11:50:00', 0),
(110, 14.8, 'dine-in', '', 'Ready for Pickup', 'Pending', 'https://receipt.example.com/110', '2024-08-29 18:04:37', '2024-08-10 12:25:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_name` varchar(200) NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `item_price` double NOT NULL,
  `item_total` double NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `item_name`, `item_quantity`, `item_price`, `item_total`, `item_id`) VALUES
(1, 101, 'Apple', 3, 0.5, 1.5, 0),
(2, 101, 'Banana', 5, 0.3, 1.5, 0),
(3, 101, 'Orange', 2, 0.7, 1.4, 0),
(4, 104, 'Mango', 1, 1.2, 1.2, 0),
(5, 105, 'Grapes', 2, 2, 4, 0),
(6, 106, 'Peach', 4, 0.8, 3.2, 0),
(7, 107, 'Watermelon', 1, 3.5, 3.5, 0),
(8, 108, 'Strawberry', 10, 0.2, 2, 0),
(9, 109, 'Pineapple', 1, 2.5, 2.5, 0),
(10, 110, 'Blueberry', 8, 0.25, 2, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order-relation` (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order-relation` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
