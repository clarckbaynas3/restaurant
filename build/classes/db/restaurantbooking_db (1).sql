-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2025 at 05:33 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurantbooking_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `u_fname` varchar(255) NOT NULL,
  `u_lname` varchar(255) NOT NULL,
  `table_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `booking_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `user_id`, `u_fname`, `u_lname`, `table_id`, `status`, `booking_time`) VALUES
(1, 1, '', '', 1, 'approved', '2025-05-21 21:31:31'),
(2, 1, '', '', 2, 'pending', '2025-06-10 10:47:17'),
(3, 1, 'delima', 'rhex', 2, 'approved', '2025-06-10 11:19:07'),
(4, 1, 'delima', 'rhex', 3, 'approved', '2025-06-10 11:26:29'),
(5, 1, 'delima', 'rhex', 4, 'approved', '2025-06-10 11:30:26');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `table_id` int(11) NOT NULL,
  `table_number` varchar(10) NOT NULL,
  `capacity` int(11) NOT NULL,
  `status` varchar(20) DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`table_id`, `table_number`, `capacity`, `status`) VALUES
(1, 'T01', 2, 'booked'),
(2, 'T05', 6, 'booked'),
(3, 'T07', 5, 'booked'),
(4, 'T08', 2, 'booked');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_log`
--

CREATE TABLE `tbl_log` (
  `log_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `u_username` varchar(50) NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `u_type` varchar(50) NOT NULL,
  `log_status` enum('Pending','Active','Inactive','') NOT NULL,
  `logout_time` timestamp NULL DEFAULT NULL,
  `log_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_log`
--

INSERT INTO `tbl_log` (`log_id`, `u_id`, `u_username`, `login_time`, `u_type`, `log_status`, `logout_time`, `log_description`) VALUES
(1, 28, 'hanseo123', '2025-03-29 12:45:06', 'Success - User Login', 'Active', NULL, ''),
(2, 24, 'paran1234', '2025-03-29 12:45:19', 'Success - Admin Login', 'Inactive', '2025-03-30 10:54:31', ''),
(3, 28, 'hanseo123', '2025-03-29 12:50:24', 'Success - User Login', 'Active', NULL, ''),
(4, 24, 'paran1234', '2025-03-29 12:50:35', 'Success - Admin Login', 'Inactive', '2025-03-30 10:54:31', ''),
(5, 24, 'paran1234', '2025-03-29 12:59:13', 'Success - Admin Login', 'Inactive', '2025-03-30 10:54:31', ''),
(6, 24, 'paran1234', '2025-03-29 12:59:58', 'Success - Admin Login', 'Inactive', '2025-03-30 10:54:31', ''),
(7, 24, 'paran1234', '2025-03-29 13:00:25', 'Success - Admin Login', 'Inactive', '2025-03-30 10:54:31', ''),
(8, 24, 'paran1234', '2025-03-29 13:05:20', 'Success - Admin Login', 'Inactive', '2025-03-30 10:54:31', ''),
(9, 24, 'paran1234', '2025-03-30 10:49:16', 'Success - Admin Login', 'Inactive', '2025-03-30 10:54:31', ''),
(10, 24, 'paran1234', '2025-03-30 10:54:26', 'Success - Admin Login', 'Inactive', '2025-03-30 10:54:31', ''),
(12, 29, 'beboy123', '2025-03-30 11:57:38', 'Success - User Login', 'Active', NULL, ''),
(13, 29, 'beboy123', '2025-03-30 12:48:21', 'Success - User Login', 'Active', NULL, ''),
(14, 29, 'beboy123', '2025-03-30 12:50:04', 'Success - User Login', 'Active', NULL, ''),
(15, 29, 'beboy123', '2025-03-30 12:53:56', 'Success - User Login', 'Active', NULL, ''),
(16, 29, 'beboy123', '2025-03-30 13:02:29', 'Success - User Login', 'Active', NULL, ''),
(17, 29, 'beboy123', '2025-03-30 13:02:39', 'Success - User Login', 'Active', NULL, ''),
(18, 29, 'beboy123', '2025-03-30 13:05:06', 'Success - User Login', 'Active', NULL, ''),
(19, 24, 'paran1234', '2025-04-12 12:24:45', 'Success - Admin Login', 'Inactive', '2025-04-12 12:26:23', NULL),
(20, 24, 'paran1234', '2025-04-12 12:25:34', 'Admin', 'Inactive', '2025-04-12 12:26:23', 'Admin Added a New Account: frans123'),
(21, 24, 'paran1234', '2025-04-12 12:28:05', 'Success - Admin Login', 'Inactive', '2025-04-12 13:35:50', NULL),
(22, 31, 'jay123', '2025-04-12 13:02:46', 'Failed - Inactive Account', 'Inactive', '2025-04-12 13:03:29', NULL),
(23, 31, 'jay123', '2025-04-12 13:03:28', 'Success - User Login', 'Inactive', '2025-04-12 13:03:29', NULL),
(24, 31, 'jay123', '2025-04-12 13:03:44', 'User Reset Their Password', 'Inactive', '2025-04-12 13:07:26', NULL),
(25, 31, 'jay123', '2025-04-12 13:06:55', 'Success - User Action', 'Inactive', '2025-04-12 13:07:26', 'User Reset Their Password'),
(26, 31, 'jay123', '2025-04-12 13:07:24', 'Success - User Login', 'Inactive', '2025-04-12 13:07:26', NULL),
(27, 33, 'rhex123', '2025-04-12 13:32:58', 'Success - User Action', 'Inactive', '2025-04-26 04:16:48', 'New user registered: rhex123'),
(28, 31, 'jay123', '2025-04-12 13:33:58', 'Success - User Login', 'Inactive', '2025-04-12 13:34:00', NULL),
(30, 31, 'jay123', '2025-04-12 13:34:23', 'Success - User Login', 'Inactive', '2025-04-12 13:34:39', NULL),
(31, 31, 'jay123', '2025-04-12 13:34:37', 'Success - User Action', 'Inactive', '2025-04-12 13:34:39', 'User Changed Their Password'),
(32, 31, 'jay123', '2025-04-12 13:35:00', 'Success - User Login', 'Active', NULL, NULL),
(33, 24, 'paran1234', '2025-04-12 13:35:22', 'Success - Admin Login', 'Inactive', '2025-04-12 13:35:50', NULL),
(34, 24, 'paran1234', '2025-04-12 13:35:30', 'Admin', 'Inactive', '2025-04-12 13:35:50', 'Deleted user account with ID: 12'),
(35, 33, 'rhex123', '2025-04-15 12:27:30', 'Success - User Login', 'Inactive', '2025-04-26 04:16:48', NULL),
(36, 33, 'rhex123', '2025-04-15 12:28:58', 'Success - User Login', 'Inactive', '2025-04-26 04:16:48', NULL),
(37, 33, 'rhex123', '2025-04-15 12:31:38', 'Success - User Login', 'Inactive', '2025-04-26 04:16:48', NULL),
(38, 24, 'paran1234', '2025-04-15 12:33:20', 'Success - Admin Login', 'Inactive', '2025-04-15 12:33:33', NULL),
(39, 24, 'paran1234', '2025-04-15 12:34:02', 'Success - Admin Login', 'Inactive', '2025-04-26 04:42:39', NULL),
(40, 24, 'paran1234', '2025-04-15 12:34:44', 'Success - Admin Login', 'Inactive', '2025-04-26 04:42:39', NULL),
(41, 24, 'paran1234', '2025-04-15 12:36:35', 'Success - Admin Login', 'Inactive', '2025-04-26 04:42:39', NULL),
(42, 24, 'paran1234', '2025-04-15 12:43:08', 'Success - Admin Login', 'Inactive', '2025-04-26 04:42:39', NULL),
(43, 24, 'paran1234', '2025-04-15 12:46:08', 'Success - Admin Login', 'Inactive', '2025-04-26 04:42:39', NULL),
(44, 24, 'paran1234', '2025-04-15 12:49:35', 'Success - Admin Login', 'Inactive', '2025-04-26 04:42:39', NULL),
(45, 33, 'rhex123', '2025-04-15 12:52:17', 'Success - User Login', 'Inactive', '2025-04-26 04:16:48', NULL),
(46, 33, '', '2025-04-15 12:52:26', 'Success - User Action', 'Active', NULL, 'User Reset Their Password'),
(47, 33, 'rhex123', '2025-04-15 12:55:09', 'Success - User Login', 'Inactive', '2025-04-26 04:16:48', NULL),
(48, 33, '', '2025-04-15 12:55:18', 'Success - User Action', 'Active', NULL, 'User Loan a Money'),
(49, 33, 'rhex123', '2025-04-15 12:58:04', 'Success - User Login', 'Inactive', '2025-04-26 04:16:48', NULL),
(50, 33, 'rhex123', '2025-04-15 12:58:12', 'Success - User Action', 'Inactive', '2025-04-26 04:16:48', 'User Loan a Money'),
(51, 24, 'paran1234', '2025-04-15 13:04:11', 'Success - Admin Login', 'Inactive', '2025-04-26 04:42:39', NULL),
(52, 24, 'paran1234', '2025-04-15 13:06:27', 'Success - Admin Login', 'Inactive', '2025-04-26 04:42:39', NULL),
(53, 24, 'paran1234', '2025-04-15 13:09:27', 'Success - Admin Login', 'Inactive', '2025-04-26 04:42:39', NULL),
(54, 24, 'paran1234', '2025-04-15 13:09:30', 'Success - User Action', 'Inactive', '2025-04-26 04:42:39', 'Admin approved Loan ID: 3'),
(55, 24, 'paran1234', '2025-04-15 13:11:40', 'Success - Admin Login', 'Inactive', '2025-04-26 04:42:39', NULL),
(56, 24, 'paran1234', '2025-04-15 13:11:44', 'Success - User Action', 'Inactive', '2025-04-26 04:42:39', 'Admin rejected Loan ID: 2'),
(57, 33, 'rhex123', '2025-04-15 13:56:19', 'Success - User Login', 'Inactive', '2025-04-26 04:16:48', NULL),
(58, 33, 'rhex123', '2025-04-26 04:16:42', 'Success - User Login', 'Inactive', '2025-04-26 04:16:48', NULL),
(59, 33, 'rhex123', '2025-04-26 04:17:22', 'Success - User Login', 'Inactive', '2025-04-26 04:32:07', NULL),
(60, 33, 'rhex123', '2025-04-26 04:22:06', 'Success - User Login', 'Inactive', '2025-04-26 04:32:07', NULL),
(61, 33, 'rhex123', '2025-04-26 04:25:25', 'Success - User Login', 'Inactive', '2025-04-26 04:32:07', NULL),
(62, 33, 'rhex123', '2025-04-26 04:26:17', 'Success - User Login', 'Inactive', '2025-04-26 04:32:07', NULL),
(63, 33, 'rhex123', '2025-04-26 04:28:24', 'Success - User Login', 'Inactive', '2025-04-26 04:32:07', NULL),
(64, 33, 'rhex123', '2025-04-26 04:29:12', 'Success - User Login', 'Inactive', '2025-04-26 04:32:07', NULL),
(65, 33, 'rhex123', '2025-04-26 04:30:22', 'Success - User Login', 'Inactive', '2025-04-26 04:32:07', NULL),
(66, 33, 'rhex123', '2025-04-26 04:31:44', 'Success - User Login', 'Inactive', '2025-04-26 04:32:07', NULL),
(67, 33, 'rhex123', '2025-04-26 04:32:04', 'Success - User Action', 'Inactive', '2025-04-26 04:32:07', 'User Loan a Money'),
(68, 24, 'paran1234', '2025-04-26 04:32:14', 'Success - Admin Login', 'Inactive', '2025-04-26 04:42:39', NULL),
(69, 24, 'paran1234', '2025-04-26 04:36:50', 'Success - Admin Login', 'Inactive', '2025-04-26 04:42:39', NULL),
(70, 24, 'paran1234', '2025-04-26 04:39:02', 'Success - Admin Login', 'Inactive', '2025-04-26 04:42:39', NULL),
(71, 24, 'paran1234', '2025-04-26 04:42:27', 'Success - Admin Login', 'Inactive', '2025-04-26 04:42:39', NULL),
(72, 24, 'paran1234', '2025-04-26 04:42:31', 'Success - User Action', 'Inactive', '2025-04-26 04:42:39', 'Admin approved Loan ID: 5'),
(73, 33, 'rhex123', '2025-04-26 04:42:46', 'Success - User Login', 'Inactive', '2025-04-26 04:46:09', NULL),
(74, 24, 'paran1234', '2025-04-26 04:44:28', 'Success - Admin Login', 'Inactive', '2025-04-26 04:44:39', NULL),
(75, 24, 'paran1234', '2025-04-26 04:44:33', 'Success - User Action', 'Inactive', '2025-04-26 04:44:39', 'Admin approved Loan ID: 4'),
(80, 33, 'rhex123', '2025-04-26 04:45:49', 'Success - User Login', 'Inactive', '2025-04-26 04:46:09', NULL),
(81, 33, 'rhex123', '2025-04-26 04:46:07', 'Success - User Action', 'Inactive', '2025-04-26 04:46:09', 'User Loan a Money'),
(82, 33, 'rhex123', '2025-04-26 04:49:59', 'Success - User Login', 'Inactive', '2025-04-26 04:50:00', NULL),
(83, 24, 'paran1234', '2025-04-26 04:50:08', 'Success - Admin Login', 'Inactive', '2025-04-26 04:51:31', NULL),
(84, 24, 'paran1234', '2025-04-26 04:50:13', 'Success - User Action', 'Inactive', '2025-04-26 04:51:31', 'Admin approved Loan ID: 6'),
(85, 33, 'rhex123', '2025-04-26 04:51:02', 'Success - User Login', 'Inactive', '2025-04-26 04:53:53', NULL),
(86, 33, 'rhex123', '2025-04-26 04:51:12', 'Success - User Action', 'Inactive', '2025-04-26 04:53:53', 'User Loan a Money'),
(87, 24, 'paran1234', '2025-04-26 04:51:22', 'Success - Admin Login', 'Inactive', '2025-04-26 04:51:31', NULL),
(88, 24, 'paran1234', '2025-04-26 04:51:28', 'Success - User Action', 'Inactive', '2025-04-26 04:51:31', 'Admin approved Loan ID: 7'),
(89, 33, 'rhex123', '2025-04-26 04:51:42', 'Success - User Login', 'Inactive', '2025-04-26 04:53:53', NULL),
(90, 33, 'rhex123', '2025-04-26 04:53:34', 'Success - User Login', 'Inactive', '2025-04-26 04:53:53', NULL),
(91, 33, 'rhex123', '2025-04-26 04:53:51', 'Success - User Action', 'Inactive', '2025-04-26 04:53:53', 'User Loan a Money'),
(92, 24, 'paran1234', '2025-04-26 04:54:23', 'Success - Admin Login', 'Inactive', '2025-04-26 04:54:32', NULL),
(93, 24, 'paran1234', '2025-04-26 04:54:27', 'Success - User Action', 'Inactive', '2025-04-26 04:54:32', 'Admin approved Loan ID: 8'),
(94, 33, 'rhex123', '2025-04-26 04:54:48', 'Success - User Login', 'Inactive', '2025-04-26 04:54:51', NULL),
(95, 33, 'rhex123', '2025-04-26 04:58:13', 'Success - User Login', 'Inactive', '2025-04-26 04:58:30', NULL),
(96, 33, 'rhex123', '2025-04-26 04:58:27', 'Success - User Action', 'Inactive', '2025-04-26 04:58:30', 'User Loan a Money'),
(97, 24, 'paran1234', '2025-04-26 04:58:37', 'Success - Admin Login', 'Inactive', '2025-04-26 04:58:46', NULL),
(98, 24, 'paran1234', '2025-04-26 04:58:41', 'Success - User Action', 'Inactive', '2025-04-26 04:58:46', 'Admin approved Loan ID: 9'),
(99, 33, 'rhex123', '2025-04-26 04:59:04', 'Success - User Login', 'Inactive', '2025-04-26 05:01:26', NULL),
(100, 33, 'rhex123', '2025-04-26 05:01:24', 'Success - User Login', 'Inactive', '2025-04-26 05:01:26', NULL),
(102, 33, 'rhex123', '2025-04-26 05:04:46', 'Success - User Login', 'Inactive', '2025-04-26 05:04:54', NULL),
(103, 34, 'greg123', '2025-04-26 05:10:01', 'Success - User Action', 'Inactive', '2025-04-26 05:10:39', 'New user registered: greg123'),
(104, 34, 'greg123', '2025-04-26 05:10:28', 'Success - User Login', 'Inactive', '2025-04-26 05:10:39', NULL),
(105, 34, 'greg123', '2025-04-26 05:10:38', 'Success - User Action', 'Inactive', '2025-04-26 05:10:39', 'User Loan a Money'),
(106, 24, 'paran1234', '2025-04-26 05:10:46', 'Success - Admin Login', 'Inactive', '2025-04-26 05:10:54', NULL),
(107, 24, 'paran1234', '2025-04-26 05:10:50', 'Success - User Action', 'Inactive', '2025-04-26 05:10:54', 'Admin approved Loan ID: 10'),
(108, 34, 'greg123', '2025-04-26 05:11:02', 'Success - User Login', 'Inactive', '2025-04-26 05:11:10', NULL),
(109, 34, 'greg123', '2025-04-26 05:20:56', 'Success - User Login', 'Inactive', '2025-04-26 05:22:06', NULL),
(110, 34, 'greg123', '2025-04-26 05:21:09', 'Success - User Action', 'Inactive', '2025-04-26 05:22:06', 'User Loan a Money'),
(111, 24, 'paran1234', '2025-04-26 05:21:22', 'Success - Admin Login', 'Inactive', '2025-04-26 05:21:30', NULL),
(112, 24, 'paran1234', '2025-04-26 05:21:26', 'Success - User Action', 'Inactive', '2025-04-26 05:21:30', 'Admin approved Loan ID: 11'),
(113, 34, 'greg123', '2025-04-26 05:21:41', 'Success - User Login', 'Inactive', '2025-04-26 05:22:06', NULL),
(114, 34, 'greg123', '2025-04-26 05:22:03', 'User', 'Inactive', '2025-04-26 05:22:06', 'User Changed Their Details'),
(115, 34, 'greg123', '2025-04-26 05:26:46', 'Success - User Login', 'Inactive', '2025-04-26 05:27:00', NULL),
(116, 34, 'greg123', '2025-04-26 05:26:57', 'Success - User Action', 'Inactive', '2025-04-26 05:27:00', 'User Loan a Money'),
(117, 24, 'paran1234', '2025-04-26 05:27:20', 'Success - Admin Login', 'Inactive', '2025-04-26 05:27:29', NULL),
(118, 24, 'paran1234', '2025-04-26 05:27:24', 'Success - User Action', 'Inactive', '2025-04-26 05:27:29', 'Admin approved Loan ID: 12'),
(119, 34, 'greg123', '2025-04-26 05:27:35', 'Success - User Login', 'Inactive', '2025-04-26 05:27:37', NULL),
(120, 34, 'greg123', '2025-04-26 05:32:21', 'Success - User Login', 'Inactive', '2025-04-26 05:32:37', NULL),
(121, 34, 'greg123', '2025-04-26 05:32:35', 'Success - User Action', 'Inactive', '2025-04-26 05:32:37', 'User Loan a Money'),
(122, 24, 'paran1234', '2025-04-26 05:32:47', 'Success - Admin Login', 'Inactive', '2025-04-26 05:32:56', NULL),
(123, 24, 'paran1234', '2025-04-26 05:32:53', 'Success - User Action', 'Inactive', '2025-04-26 05:32:56', 'Admin approved Loan ID: 13'),
(124, 34, 'greg123', '2025-04-26 05:33:26', 'Success - User Login', 'Inactive', '2025-04-26 05:35:47', NULL),
(125, 34, 'greg123', '2025-04-26 05:39:54', 'Success - User Login', 'Inactive', '2025-04-26 05:40:06', NULL),
(126, 34, 'greg123', '2025-04-26 05:40:04', 'Success - User Action', 'Inactive', '2025-04-26 05:40:06', 'User Loan a Money'),
(127, 24, 'paran1234', '2025-04-26 05:40:24', 'Success - Admin Login', 'Inactive', '2025-04-26 05:40:38', NULL),
(128, 24, 'paran1234', '2025-04-26 05:40:29', 'Success - User Action', 'Inactive', '2025-04-26 05:40:38', 'Admin approved Loan ID: 14 for user greg123'),
(129, 34, 'greg123', '2025-04-26 05:40:45', 'Success - User Login', 'Inactive', '2025-04-26 05:40:51', NULL),
(130, 34, 'greg123', '2025-04-26 05:46:36', 'Success - User Login', 'Inactive', '2025-04-26 05:46:57', NULL),
(131, 34, 'greg123', '2025-04-26 05:46:52', 'Success - User Action', 'Inactive', '2025-04-26 05:46:57', 'User Sent Money to rhex123'),
(132, 33, 'rhex123', '2025-04-26 05:47:06', 'Success - User Login', 'Inactive', '2025-04-26 05:47:14', NULL),
(133, 34, 'greg123', '2025-04-26 05:49:55', 'Success - User Login', 'Inactive', '2025-04-26 05:56:24', NULL),
(134, 34, 'greg123', '2025-04-26 05:51:35', 'Success - User Login', 'Inactive', '2025-04-26 05:56:24', NULL),
(135, 34, 'greg123', '2025-04-26 05:56:21', 'Success - User Login', 'Inactive', '2025-04-26 05:56:24', NULL),
(136, 33, 'rhex123', '2025-04-26 05:56:32', 'Success - User Login', 'Inactive', '2025-04-26 05:56:52', NULL),
(137, 34, 'greg123', '2025-04-26 05:56:59', 'Success - User Login', 'Inactive', '2025-04-26 05:57:30', NULL),
(138, 34, 'greg123', '2025-04-26 05:57:27', 'Success - User Action', 'Inactive', '2025-04-26 05:57:30', 'User Sent Money to rhex123'),
(139, 33, 'rhex123', '2025-04-26 05:57:37', 'Success - User Login', 'Inactive', '2025-04-26 05:57:39', NULL),
(140, 34, 'greg123', '2025-04-26 06:02:30', 'Success - User Login', 'Inactive', '2025-04-26 06:02:45', NULL),
(141, 34, 'greg123', '2025-04-26 06:02:42', 'Success - User Action', 'Inactive', '2025-04-26 06:02:45', 'User Sent Money to rhex123'),
(142, 33, 'rhex123', '2025-04-26 06:02:53', 'Success - User Login', 'Inactive', '2025-04-26 06:02:56', NULL),
(143, 24, 'paran1234', '2025-04-26 06:16:48', 'Success - Admin Login', 'Inactive', '2025-04-26 06:17:11', NULL),
(144, 24, 'paran1234', '2025-04-26 06:17:08', 'Admin', 'Inactive', '2025-04-26 06:17:11', 'User Changed Their Details'),
(145, 34, 'greg123', '2025-05-21 02:49:30', 'Success - User Login', 'Inactive', '2025-05-21 03:09:13', NULL),
(146, 34, 'greg123', '2025-05-21 02:49:47', 'Success - User Action', 'Inactive', '2025-05-21 03:09:13', 'User submitted deposit request'),
(147, 34, 'greg123', '2025-05-21 03:08:15', 'Success - User Login', 'Inactive', '2025-05-21 03:09:13', NULL),
(149, 34, 'greg123', '2025-05-21 03:09:44', 'Success - User Login', 'Inactive', '2025-05-21 03:10:20', NULL),
(150, 34, 'greg123', '2025-05-21 03:14:22', 'Success - User Login', 'Inactive', '2025-05-21 03:37:04', NULL),
(151, 34, 'greg123', '2025-05-21 03:36:51', 'Success - User Login', 'Inactive', '2025-05-21 03:37:04', NULL),
(152, 34, 'greg123', '2025-05-21 03:37:02', 'Success - User Action', 'Inactive', '2025-05-21 03:37:04', 'User submitted deposit request'),
(153, 34, 'greg123', '2025-05-21 04:42:23', 'Success - User Login', 'Inactive', '2025-05-21 04:43:50', NULL),
(154, 34, 'greg123', '2025-05-21 04:43:35', 'Success - User Action', 'Inactive', '2025-05-21 04:43:50', 'User Sent Money to rhex123'),
(155, 34, 'greg123', '2025-05-21 04:59:01', 'Success - Admin Login', 'Inactive', '2025-05-21 05:09:09', NULL),
(156, 34, 'greg123', '2025-05-21 05:09:01', 'Success - Admin Login', 'Inactive', '2025-05-21 05:09:09', NULL),
(157, 34, 'greg123', '2025-05-21 05:10:23', 'Success - Admin Login', 'Inactive', '2025-05-21 05:12:11', NULL),
(158, 34, 'greg123', '2025-05-21 05:12:29', 'Success - Admin Login', 'Inactive', '2025-05-21 05:12:33', NULL),
(159, 34, 'greg123', '2025-05-21 05:13:46', 'Success - Teller Login', 'Inactive', '2025-05-21 05:14:28', NULL),
(160, 34, 'greg123', '2025-05-21 05:14:23', 'Success - Teller Login', 'Inactive', '2025-05-21 05:14:28', NULL),
(161, 34, 'greg123', '2025-05-21 05:14:57', 'Success - Teller Login', 'Inactive', '2025-05-21 05:15:46', NULL),
(162, 34, 'greg123', '2025-05-21 05:15:37', 'Success - Teller Login', 'Inactive', '2025-05-21 05:15:46', NULL),
(163, 34, 'greg123', '2025-05-21 05:17:37', 'Success - Teller Login', 'Inactive', '2025-05-21 05:17:58', NULL),
(164, 34, 'greg123', '2025-05-21 05:17:40', 'Success - User Action', 'Inactive', '2025-05-21 05:17:58', 'Teller approved Deposit ID: 2 for user greg123'),
(165, 34, 'greg123', '2025-05-21 05:18:58', 'Success - Teller Login', 'Inactive', '2025-05-21 05:19:39', NULL),
(166, 34, 'greg123', '2025-05-21 05:19:51', 'Success - Teller Login', 'Inactive', '2025-05-21 05:20:58', NULL),
(167, 34, 'greg123', '2025-05-21 05:20:54', 'Success - Teller Login', 'Inactive', '2025-05-21 05:20:58', NULL),
(168, 34, 'greg123', '2025-05-21 05:24:15', 'Success - Teller Login', 'Inactive', '2025-05-21 05:24:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `u_id` int(11) NOT NULL,
  `u_fname` varchar(50) NOT NULL,
  `u_lname` varchar(50) NOT NULL,
  `u_email` varchar(50) NOT NULL,
  `u_username` varchar(255) NOT NULL,
  `u_password` varchar(50) NOT NULL,
  `u_type` varchar(50) NOT NULL,
  `u_status` varchar(50) NOT NULL,
  `security_question` varchar(255) NOT NULL,
  `security_answer` varchar(255) NOT NULL,
  `u_image` varchar(500) NOT NULL,
  `balance` decimal(15,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`u_id`, `u_fname`, `u_lname`, `u_email`, `u_username`, `u_password`, `u_type`, `u_status`, `security_question`, `security_answer`, `u_image`, `balance`) VALUES
(14, 'kayeshea', 'basilan', 'kaye123@gmail.com', 'kaye1233', 'NBYWrmoA/JoDM/ch9Tgq8p41ekFyon8BzFcia+U+AQc=', 'Admin', 'Active', '', '', '', 0.00),
(21, 'ross', 'sabio', 'rosssabio@gmail.com', 'ross1234', 'NBYWrmoA/JoDM/ch9Tgq8p41ekFyon8BzFcia+U+AQc=', 'Admin', 'Active', '', '', '', 0.00),
(22, 'daniel', 'failadona', 'danielfailadona@gmail.com', 'daniel1234', 'NBYWrmoA/JoDM/ch9Tgq8p41ekFyon8BzFcia+U+AQc=', 'Admin', 'Active', '', '', '', 0.00),
(24, 'benjohns', 'parans', 'benjohn@gmail.com', 'paran1234', 'ky88G1YlfOhTmsJp16q0JVDaz4gY0HXwvfGZBWKq4+8=', 'Admin', 'Active', '', '', 'src/images/471615836_1140707197730657_5811624390488339862_n.jpg', 0.00),
(25, 'sarno', 'mamen', 'sarnomamen@gmail.com', 'mamen123', 'ky88G1YlfOhTmsJp16q0JVDaz4gY0HXwvfGZBWKq4+8=', 'User', 'Active', '', '', '', 0.00),
(28, 'han', 'seo', 'hanseo@gmail.com', 'hanseo123', 'ky88G1YlfOhTmsJp16q0JVDaz4gY0HXwvfGZBWKq4+8=', 'User', 'Active', '', '', '', 0.00),
(29, 'beboy', 'padriga', 'beboypadriga@gmail.com', 'beboy123', 'DR6kwlbNUKKnzL/SKz2ZWfb9ML2EC5/zx8Ze5OId8G0=', 'User', 'Active', 'What\'s the name of your first pet?', 'browny', 'C:\\Users\\milan\\OneDrive\\Desktop\\Odin\\src\\images\\462574929_1530386207674650_925214417452153602_n.jpg', 0.00),
(30, 'frans', 'ababa', 'fransababa@gmail.com', 'frans123', 'ky88G1YlfOhTmsJp16q0JVDaz4gY0HXwvfGZBWKq4+8=', 'Pending', 'User', 'What\'s the name of your first pet?', 'OstyYRKvTUuxwHH/PXNPTcb9/gMXt56CfKg7QYENPfA=', 'frans123_462581453_1264063778238587_8963988102995952736_n.jpg', 0.00),
(31, 'jay', 'boss', 'jayboss@gmail.com', 'jay123', 'ky88G1YlfOhTmsJp16q0JVDaz4gY0HXwvfGZBWKq4+8=', 'User', 'Active', 'What\'s the name of your first pet?', 'OstyYRKvTUuxwHH/PXNPTcb9/gMXt56CfKg7QYENPfA=', 'Null', 0.00),
(32, 'mark', 'pacaldo', 'markpacaldo@gmail.com', 'mark123', 'ky88G1YlfOhTmsJp16q0JVDaz4gY0HXwvfGZBWKq4+8=', 'User', 'Active', 'What\'s the name of your first pet?', 'Fkd2iMDgBpnGz6RJejYS1+g8UyBitkslD+2JCBKO1Ug=', 'Null', 0.00),
(33, 'delima', 'rhex', 'delimarhex@gmail.com', 'rhex123', 'ky88G1YlfOhTmsJp16q0JVDaz4gY0HXwvfGZBWKq4+8=', 'User', 'Active', 'What\'s the name of your first pet?', 'Fkd2iMDgBpnGz6RJejYS1+g8UyBitkslD+2JCBKO1Ug=', 'Null', 600.00),
(34, 'greg', 'boss', 'gregboss@gmail.com', 'greg123', 'ky88G1YlfOhTmsJp16q0JVDaz4gY0HXwvfGZBWKq4+8=', 'Admin', 'Active', 'What\'s your favorite food?', '3kM+1VChYkp0J5qjDDa1LyhEJmEMAUtwAi5MiJ68qHU=', 'src/images/467719808_849346147222609_1601374335414698002_n.jpg', 7400.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`table_id`),
  ADD UNIQUE KEY `table_number` (`table_number`);

--
-- Indexes for table `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `fk_log_user_id` (`u_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD CONSTRAINT `fk_log_user_id` FOREIGN KEY (`u_id`) REFERENCES `tbl_users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
