-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2020 at 03:04 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new_feedback_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

CREATE TABLE `access` (
  `Access_id` int(16) NOT NULL,
  `form_allotment_id` int(16) NOT NULL,
  `F_id` int(16) NOT NULL,
  `Admin_id` varchar(64) NOT NULL,
  `Admin_email` varchar(255) NOT NULL,
  `DELETED` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `admin_credentials`
--

CREATE TABLE `admin_credentials` (
  `A_id` int(16) NOT NULL,
  `Admin_id` varchar(64) NOT NULL,
  `Admin_name` varchar(255) NOT NULL,
  `Admin_email` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Admin_Password` varchar(255) NOT NULL,
  `re_enter_password` varchar(255) NOT NULL,
  `U_id` int(16) NOT NULL,
  `DELETED` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_credentials`
--

INSERT INTO `admin_credentials` (`A_id`, `Admin_id`, `Admin_name`, `Admin_email`, `created_on`, `updated_on`, `Admin_Password`, `re_enter_password`, `U_id`, `DELETED`) VALUES
(3, 'ANI', 'aniket', 'aniketkumar.singh@sakec.ac.in', '2020-06-09 05:33:52', '2020-07-11 07:21:09', '345678901', '345678901', 3, 0),
(2, 'POO', 'Pooja', 'pooja.tripathi@sakec.ac.in', '2020-06-09 05:28:51', '2020-07-11 07:21:25', '234567890', '234567890', 2, 0),
(1, 'PRA', 'Prateek', 'prateek.manta@sakec.ac.in', '2020-05-31 11:04:35', '2020-07-11 07:21:38', '123456789', '123456789', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `Ans_id` int(16) NOT NULL,
  `F_id` int(16) NOT NULL,
  `User_id` varchar(64) NOT NULL,
  `User _email` varchar(255) NOT NULL,
  `Q_no` float NOT NULL,
  `Answer_desc` varchar(10000) NOT NULL,
  `Ans_numeric` int(16) NOT NULL,
  `Ans_recorded` timestamp NOT NULL DEFAULT current_timestamp(),
  `Ans_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `DELETED` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `form`
--

CREATE TABLE `form` (
  `F_id` int(16) NOT NULL,
  `Admin_id` varchar(64) NOT NULL,
  `Admin_email` varchar(255) NOT NULL,
  `Form_code` varchar(20) NOT NULL,
  `Form_name` varchar(255) NOT NULL,
  `Form_version` varchar(255) NOT NULL,
  `Form_Desc` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Form_details` int(16) NOT NULL,
  `DELETED` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `form`
--

INSERT INTO `form` (`F_id`, `Admin_id`, `Admin_email`, `Form_code`, `Form_name`, `Form_version`, `Form_Desc`, `created_on`, `updated_on`, `Form_details`, `DELETED`) VALUES
(100, 'POO', 'pooja.tripathi@sakec.ac.in', '', 'Teacher feedback testign for edting asdfa', '1', 'Just a form for taking teachers feedback', '2020-07-16 13:36:29', '2020-07-17 10:33:21', 1, 0),
(101, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '1', 'Just a test form', '2020-07-16 14:29:19', '2020-07-21 21:45:54', 1, 0),
(102, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Nothing muchasdf a a asdfas sdf a', '1', '', '2020-07-17 04:04:31', '2020-07-17 10:00:39', 1, 1),
(103, 'PRA', 'prateek.manta@sakec.ac.in', '', 'just some testing nothing much juste testing', '1', 'asdfasdfasfa', '2020-07-17 08:16:34', '2020-07-17 10:21:36', 1, 1),
(104, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Teachers Feedback on students sadf', '1', 'Teachers will give a review about the class they teach', '2020-07-17 10:20:49', '2020-07-17 10:49:53', 1, 0),
(105, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '1', 'just a test', '2020-07-17 10:22:16', '2020-07-17 10:22:16', 1, 0),
(106, 'POO', 'pooja.tripathi@sakec.ac.in', '', 'test', '1', 'sadf', '2020-07-17 10:33:35', '2020-07-17 10:33:39', 1, 1),
(107, 'POO', 'pooja.tripathi@sakec.ac.in', '', 'test 123', '1', 'nothihng mcuh', '2020-07-17 10:40:54', '2020-07-17 10:41:11', 1, 1),
(108, 'ANI', 'aniketkumar.singh@sakec.ac.in', '', 'just a check form asdfasf', '1', 'nothing much let hva aadsf', '2020-07-17 10:50:51', '2020-07-17 10:50:55', 1, 0),
(109, 'PRA', 'prateek.manta@sakec.ac.in', '', 'sadfasfasf', '1', '', '2020-07-21 13:35:18', '2020-07-21 13:35:32', 1, 1),
(110, 'PRA', 'prateek.manta@sakec.ac.in', '', 'adsfsadf', '1', '', '2020-07-21 13:39:22', '2020-07-21 13:39:28', 1, 1),
(111, 'PRA', 'prateek.manta@sakec.ac.in', '', 'adsfsadfsdfasdfa', '1', '', '2020-07-21 13:39:36', '2020-07-21 13:39:45', 1, 1),
(112, 'PRA', 'prateek.manta@sakec.ac.in', '', 'sadfsadf', '1', '', '2020-07-21 13:42:04', '2020-07-21 13:42:14', 1, 1),
(114, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback&nbsp;', '2', 'tesyt', '2020-07-21 14:29:24', '2020-07-21 14:32:08', 1, 1),
(123, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback&nbsp;', '3', '', '2020-07-21 20:43:36', '2020-07-21 20:43:36', 1, 0),
(124, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback&nbsp;', '4', '', '2020-07-21 21:07:59', '2020-07-21 21:07:59', 1, 0),
(125, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback&nbsp;', '5', '', '2020-07-21 21:09:35', '2020-07-21 21:09:35', 1, 0),
(126, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback&nbsp;', '6', '', '2020-07-21 21:10:18', '2020-07-21 21:10:18', 1, 0),
(127, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback&nbsp;', '7', '', '2020-07-21 21:16:45', '2020-07-21 21:16:45', 1, 0),
(128, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback&nbsp;', '8', '', '2020-07-21 21:22:31', '2020-07-21 21:22:31', 1, 0),
(129, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback&nbsp;', '9', '', '2020-07-21 21:22:43', '2020-07-21 21:22:43', 1, 0),
(130, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback&nbsp;', '10', '', '2020-07-21 21:41:30', '2020-07-21 21:41:30', 1, 0),
(131, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback&nbsp;', '11', '', '2020-07-21 21:42:57', '2020-07-21 21:42:57', 1, 0),
(132, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback&nbsp;', '12', '', '2020-07-21 21:43:13', '2020-07-21 21:43:13', 1, 0),
(133, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback&nbsp;', '13', '', '2020-07-21 21:43:27', '2020-07-21 21:43:27', 1, 0),
(134, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback&nbsp;', '14', '', '2020-07-21 21:43:35', '2020-07-21 21:43:35', 1, 0),
(135, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback&nbsp;', '15', '', '2020-07-21 21:43:55', '2020-07-21 21:43:55', 1, 0),
(136, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback&nbsp;', '16', '', '2020-07-21 21:44:00', '2020-07-21 21:44:00', 1, 0),
(137, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback&nbsp;', '17', '', '2020-07-21 21:44:14', '2020-07-21 21:44:14', 1, 0),
(138, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdf', '2', '', '2020-07-21 21:44:14', '2020-07-21 21:44:14', 1, 0),
(139, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdf', '3', '', '2020-07-21 21:44:14', '2020-07-21 21:44:14', 1, 0),
(140, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdf', '4', '', '2020-07-21 21:44:25', '2020-07-21 21:44:25', 1, 0),
(141, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback', '2', '', '2020-07-21 21:44:26', '2020-07-21 21:44:26', 1, 0),
(142, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback', '2', '', '2020-07-21 21:44:26', '2020-07-21 21:44:26', 1, 0),
(143, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback', '4', '', '2020-07-21 21:44:30', '2020-07-21 21:44:30', 1, 0),
(144, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback', '5', '', '2020-07-21 21:44:30', '2020-07-21 21:44:30', 1, 0),
(145, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback', '6', '', '2020-07-21 21:44:32', '2020-07-21 21:44:32', 1, 0),
(146, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback', '7', '', '2020-07-21 21:44:34', '2020-07-21 21:44:34', 1, 0),
(147, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback', '8', '', '2020-07-21 21:45:24', '2020-07-21 21:45:24', 1, 0),
(148, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback', '9', '', '2020-07-21 21:45:37', '2020-07-21 21:45:37', 1, 0),
(149, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback', '10', '', '2020-07-21 21:45:40', '2020-07-21 21:45:40', 1, 0),
(150, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback', '11', '', '2020-07-21 21:45:44', '2020-07-21 21:45:44', 1, 0),
(151, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback', '12', '', '2020-07-21 21:45:47', '2020-07-21 21:45:47', 1, 0),
(152, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback', '13', '', '2020-07-21 21:45:50', '2020-07-21 21:45:50', 1, 0),
(153, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback', '14', '', '2020-07-21 21:45:54', '2020-07-21 21:45:54', 1, 0),
(154, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '2', '', '2020-07-21 21:45:54', '2020-07-21 21:45:54', 1, 0),
(155, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '3', '', '2020-07-21 21:45:54', '2020-07-21 21:45:54', 1, 0),
(156, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '4', '', '2020-07-21 21:45:56', '2020-07-21 21:45:56', 1, 0),
(157, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '5', '', '2020-07-21 21:45:56', '2020-07-21 21:45:56', 1, 0),
(158, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '6', '', '2020-07-21 21:45:58', '2020-07-21 21:45:58', 1, 0),
(159, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '7', '', '2020-07-21 21:46:00', '2020-07-21 21:46:00', 1, 0),
(160, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '8', '', '2020-07-21 21:46:02', '2020-07-21 21:46:02', 1, 0),
(161, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '9', '', '2020-07-21 21:46:05', '2020-07-21 21:46:05', 1, 0),
(162, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '10', '', '2020-07-21 21:46:07', '2020-07-21 21:46:07', 1, 0),
(163, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '11', '', '2020-07-21 21:46:09', '2020-07-21 21:46:09', 1, 0),
(164, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '12', '', '2020-07-21 21:46:12', '2020-07-21 21:46:12', 1, 0),
(165, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '13', '', '2020-07-21 21:46:14', '2020-07-21 21:46:14', 1, 0),
(166, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '14', '', '2020-07-21 21:46:17', '2020-07-21 21:46:17', 1, 0),
(167, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '15', '', '2020-07-21 21:46:21', '2020-07-21 21:46:21', 1, 0),
(168, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '16', '', '2020-07-21 21:46:25', '2020-07-21 21:46:25', 1, 0),
(169, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '17', '', '2020-07-21 21:48:23', '2020-07-21 21:48:23', 1, 0),
(170, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '18', '', '2020-07-21 21:48:24', '2020-07-21 21:48:24', 1, 0),
(171, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '19', '', '2020-07-21 21:48:52', '2020-07-21 21:48:52', 1, 0),
(172, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '20', '', '2020-07-21 21:48:54', '2020-07-21 21:48:54', 1, 0),
(173, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '21', '', '2020-07-21 21:48:57', '2020-07-21 21:48:57', 1, 0),
(174, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '22', '', '2020-07-21 21:48:59', '2020-07-21 21:48:59', 1, 0),
(175, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '23', '', '2020-07-21 21:52:14', '2020-07-21 21:52:14', 1, 0),
(176, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '24', '', '2020-07-21 21:52:48', '2020-07-21 21:52:48', 1, 0),
(177, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '25', '', '2020-07-21 21:54:19', '2020-07-21 21:54:19', 1, 0),
(178, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '26', '', '2020-07-21 21:54:42', '2020-07-21 21:54:42', 1, 0),
(179, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '27', '', '2020-07-21 21:56:28', '2020-07-21 21:56:28', 1, 0),
(180, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '28', '', '2020-07-21 21:57:38', '2020-07-21 21:57:38', 1, 0),
(181, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '29', '', '2020-07-21 21:58:25', '2020-07-21 21:58:25', 1, 0),
(182, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '30', '', '2020-07-21 21:58:26', '2020-07-21 21:58:26', 1, 0),
(183, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '31', '', '2020-07-21 21:58:27', '2020-07-21 21:58:27', 1, 0),
(184, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '32', '', '2020-07-21 21:58:30', '2020-07-21 21:58:30', 1, 0),
(185, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '33', '', '2020-07-21 21:58:34', '2020-07-21 21:58:34', 1, 0),
(186, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Students feedback asdfas', '34', '', '2020-07-21 21:59:27', '2020-07-21 21:59:27', 1, 0),
(187, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Teachers Feedback on students sadf', '2', '', '2020-07-21 22:01:40', '2020-07-21 22:01:40', 1, 0),
(188, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Teachers Feedback on students sadf', '3', '', '2020-07-21 22:01:47', '2020-07-21 22:01:47', 1, 0),
(189, 'PRA', 'prateek.manta@sakec.ac.in', '', 'Teachers Feedback on students sadf', '4', '', '2020-07-21 22:01:48', '2020-07-21 22:01:48', 1, 0),
(190, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '2', '', '2020-07-21 22:02:50', '2020-07-21 22:02:50', 1, 0),
(191, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '3', '', '2020-07-21 22:08:18', '2020-07-21 22:08:18', 1, 0),
(192, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '4', '', '2020-07-21 22:08:22', '2020-07-21 22:08:22', 1, 0),
(193, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '5', '', '2020-07-22 06:06:23', '2020-07-22 06:06:23', 1, 0),
(194, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '6', '', '2020-07-22 06:06:29', '2020-07-22 06:06:29', 1, 0),
(195, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '7', '', '2020-07-22 06:07:23', '2020-07-22 06:07:23', 1, 0),
(196, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '8', '', '2020-07-22 06:08:31', '2020-07-22 06:08:31', 1, 0),
(197, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '9', '', '2020-07-22 06:08:59', '2020-07-22 06:08:59', 1, 0),
(198, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '10', '', '2020-07-22 06:14:04', '2020-07-22 06:14:04', 1, 0),
(199, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '11', '', '2020-07-22 06:14:22', '2020-07-22 06:14:22', 1, 0),
(200, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '12', '', '2020-07-22 06:14:24', '2020-07-22 06:14:24', 1, 0),
(201, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '13', '', '2020-07-22 06:14:25', '2020-07-22 06:14:25', 1, 0),
(202, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '14', '', '2020-07-22 06:14:26', '2020-07-22 06:14:26', 1, 0),
(203, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '15', '', '2020-07-22 06:14:43', '2020-07-22 06:14:43', 1, 0),
(204, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '16', '', '2020-07-22 06:16:00', '2020-07-22 06:16:00', 1, 0),
(205, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '17', '', '2020-07-22 06:16:04', '2020-07-22 06:16:04', 1, 0),
(206, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '18', '', '2020-07-22 06:16:23', '2020-07-22 06:16:23', 1, 0),
(207, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '19', '', '2020-07-22 06:16:25', '2020-07-22 06:16:25', 1, 0),
(208, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '20', '', '2020-07-22 06:16:27', '2020-07-22 06:16:27', 1, 0),
(209, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '21', '', '2020-07-22 06:16:29', '2020-07-22 06:16:29', 1, 0),
(210, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '22', '', '2020-07-22 06:16:49', '2020-07-22 06:16:49', 1, 0),
(211, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '23', '', '2020-07-22 06:16:52', '2020-07-22 06:16:52', 1, 0),
(212, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '24', '', '2020-07-22 06:16:57', '2020-07-22 06:16:57', 1, 0),
(213, 'PRA', 'prateek.manta@sakec.ac.in', '', 'this is nothing ', '1', 'lasdjf', '2020-07-22 06:51:04', '2020-07-22 06:51:04', 1, 0),
(214, 'PRA', 'prateek.manta@sakec.ac.in', '', 'this is nothing ', '2', '', '2020-07-22 07:04:39', '2020-07-22 07:04:39', 1, 0),
(215, 'PRA', 'prateek.manta@sakec.ac.in', '', 'this is nothing ', '3', '', '2020-07-22 07:06:06', '2020-07-22 07:06:06', 1, 0),
(216, 'PRA', 'prateek.manta@sakec.ac.in', '', 'this is nothing ', '4', '', '2020-07-22 07:07:21', '2020-07-22 07:07:21', 1, 0),
(217, 'PRA', 'prateek.manta@sakec.ac.in', '', 'this is nothing ', '5', '', '2020-07-22 07:09:35', '2020-07-22 07:09:35', 1, 0),
(218, 'PRA', 'prateek.manta@sakec.ac.in', '', 'this is nothing ', '6', '', '2020-07-22 07:10:18', '2020-07-22 07:10:18', 1, 0),
(219, 'PRA', 'prateek.manta@sakec.ac.in', '', 'this is nothing ', '7', '', '2020-07-22 07:10:46', '2020-07-22 07:10:46', 1, 0),
(220, 'PRA', 'prateek.manta@sakec.ac.in', '', 'this is nothing ', '8', '', '2020-07-22 07:11:41', '2020-07-22 07:11:41', 1, 0),
(221, 'PRA', 'prateek.manta@sakec.ac.in', '', 'asdasdfasdfdsafgdsgfdsfgdsfg', '1', '', '2020-07-22 07:14:29', '2020-07-22 07:14:29', 1, 0),
(222, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '25', '', '2020-07-22 07:39:20', '2020-07-22 07:39:20', 1, 0),
(223, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '26', '', '2020-07-22 07:39:54', '2020-07-22 07:39:54', 1, 0),
(224, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '27', '', '2020-07-22 07:39:55', '2020-07-22 07:39:55', 1, 0),
(225, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '28', '', '2020-07-22 07:41:05', '2020-07-22 07:41:05', 1, 0),
(226, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '29', '', '2020-07-22 07:41:06', '2020-07-22 07:41:06', 1, 0),
(227, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '30', '', '2020-07-22 07:43:33', '2020-07-22 07:43:33', 1, 0),
(228, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '31', '', '2020-07-22 07:43:33', '2020-07-22 07:43:33', 1, 0),
(229, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '32', '', '2020-07-22 07:55:54', '2020-07-22 07:55:54', 1, 0),
(230, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '33', '', '2020-07-22 07:55:56', '2020-07-22 07:55:56', 1, 0),
(231, 'PRA', 'prateek.manta@sakec.ac.in', '', 'asdasdfasdfdsafgdsgfdsfgdsfg', '2', '', '2020-07-22 08:10:43', '2020-07-22 08:10:43', 1, 0),
(232, 'PRA', 'prateek.manta@sakec.ac.in', '', 'asdasdfasdfdsafgdsgfdsfgdsfg', '3', '', '2020-07-22 08:11:02', '2020-07-22 08:11:02', 1, 0),
(233, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '34', '', '2020-07-22 08:16:24', '2020-07-22 08:16:24', 1, 0),
(234, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '35', '', '2020-07-22 08:16:24', '2020-07-22 08:16:24', 1, 0),
(235, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '36', '', '2020-07-22 08:16:55', '2020-07-22 08:16:55', 1, 0),
(236, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '37', '', '2020-07-22 08:16:56', '2020-07-22 08:16:56', 1, 0),
(237, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '38', '', '2020-07-22 08:19:07', '2020-07-22 08:19:07', 1, 0),
(238, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '39', '', '2020-07-22 08:19:08', '2020-07-22 08:19:08', 1, 0),
(239, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '40', '', '2020-07-22 08:20:21', '2020-07-22 08:20:21', 1, 0),
(240, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '41', '', '2020-07-22 08:20:22', '2020-07-22 08:20:22', 1, 0),
(241, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '42', '', '2020-07-22 08:23:10', '2020-07-22 08:23:10', 1, 0),
(242, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '43', '', '2020-07-22 08:23:12', '2020-07-22 08:23:12', 1, 0),
(243, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '44', '', '2020-07-22 08:23:26', '2020-07-22 08:23:26', 1, 0),
(244, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '45', '', '2020-07-22 08:23:29', '2020-07-22 08:23:29', 1, 0),
(245, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '46', '', '2020-07-22 08:23:30', '2020-07-22 08:23:30', 1, 0),
(246, 'PRA', 'prateek.manta@sakec.ac.in', '', 'There are somtihing s', '47', '', '2020-07-22 08:23:32', '2020-07-22 08:23:32', 1, 0),
(247, 'PRA', 'prateek.manta@sakec.ac.in', '', 'asdasdfasdfdsafgdsgfdsfgdsfg', '4', '', '2020-07-22 08:24:15', '2020-07-22 08:24:15', 1, 0),
(248, 'PRA', 'prateek.manta@sakec.ac.in', '', 'asdasdfasdfdsafgdsgfdsfgdsfg', '5', '', '2020-07-22 08:31:24', '2020-07-22 08:31:24', 1, 0),
(249, 'PRA', 'prateek.manta@sakec.ac.in', '', 'asdasdfasdfdsafgdsgfdsfgdsfg', '6', '', '2020-07-22 08:34:59', '2020-07-22 08:34:59', 1, 0),
(250, 'PRA', 'prateek.manta@sakec.ac.in', '', 'asdasdfasdfdsafgdsgfdsfgdsfg', '7', '', '2020-07-22 08:39:36', '2020-07-22 08:39:36', 1, 0),
(251, 'PRA', 'prateek.manta@sakec.ac.in', '', 'asdasdfasdfdsafgdsgfdsfgdsfg', '8', '', '2020-07-22 08:44:46', '2020-07-22 08:44:46', 1, 0),
(252, 'PRA', 'prateek.manta@sakec.ac.in', '', 'asdasdfasdfdsafgdsgfdsfgdsfg', '9', '', '2020-07-22 08:44:47', '2020-07-22 08:44:47', 1, 0),
(253, 'PRA', 'prateek.manta@sakec.ac.in', '', 'asdasdfasdfdsafgdsgfdsfgdsfg', '10', '', '2020-07-22 08:45:26', '2020-07-22 08:45:26', 1, 0),
(254, 'PRA', 'prateek.manta@sakec.ac.in', '', 'asdasdfasdfdsafgdsgfdsfgdsfg', '11', '', '2020-07-22 08:45:27', '2020-07-22 08:45:27', 1, 0),
(255, 'PRA', 'prateek.manta@sakec.ac.in', '', 'asdasdfasdfdsafgdsgfdsfgdsfg', '12', '', '2020-07-22 08:46:50', '2020-07-22 08:46:50', 1, 0),
(256, 'PRA', 'prateek.manta@sakec.ac.in', '', 'to show Shraddha how is it ?', '1', '', '2020-07-22 13:40:33', '2020-07-22 13:40:46', 1, 0),
(257, 'POO', 'pooja.tripathi@sakec.ac.in', '', 'asdfasdfsadfas asdfasdf', '1', 'asdfasf', '2020-07-25 05:37:40', '2020-07-25 05:37:44', 1, 0),
(258, 'POO', 'pooja.tripathi@sakec.ac.in', '', 'asdfasdfsadfas asdfasdf', '2', '', '2020-07-25 05:39:10', '2020-07-25 05:39:10', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `form_allotment`
--

CREATE TABLE `form_allotment` (
  `form_allotment_id` int(16) NOT NULL,
  `F_id` int(16) NOT NULL,
  `Admin_id` varchar(64) NOT NULL,
  `Admin_email` varchar(255) NOT NULL,
  `access_giver` varchar(255) NOT NULL,
  `access_receiver` varchar(255) NOT NULL,
  `priviliges` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `DELETED` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `form_allotment`
--

INSERT INTO `form_allotment` (`form_allotment_id`, `F_id`, `Admin_id`, `Admin_email`, `access_giver`, `access_receiver`, `priviliges`, `created_on`, `updated_on`, `DELETED`) VALUES
(47, 100, 'POO', 'pooja.tripathi@sakec.ac.in', 'pooja.tripathi@sakec.ac.in', 'pooja.tripathi@sakec.ac.in', 'master', '2020-07-16 13:36:29', '2020-07-16 13:36:29', 0),
(48, 101, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-07-16 14:29:20', '2020-07-16 14:29:20', 0),
(49, 102, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-07-17 04:04:31', '2020-07-17 04:04:31', 0),
(50, 103, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-07-17 08:16:34', '2020-07-17 08:16:34', 0),
(51, 104, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-07-17 10:20:50', '2020-07-17 10:20:50', 0),
(52, 105, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-07-17 10:22:17', '2020-07-17 10:22:17', 0),
(53, 106, 'POO', 'pooja.tripathi@sakec.ac.in', 'pooja.tripathi@sakec.ac.in', 'pooja.tripathi@sakec.ac.in', 'master', '2020-07-17 10:33:35', '2020-07-17 10:33:35', 0),
(54, 107, 'POO', 'pooja.tripathi@sakec.ac.in', 'pooja.tripathi@sakec.ac.in', 'pooja.tripathi@sakec.ac.in', 'master', '2020-07-17 10:40:54', '2020-07-17 10:40:54', 0),
(55, 108, 'ANI', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'master', '2020-07-17 10:50:51', '2020-07-17 10:50:51', 0),
(56, 109, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-07-21 13:35:19', '2020-07-21 13:35:19', 0),
(57, 110, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-07-21 13:39:22', '2020-07-21 13:39:22', 0),
(58, 111, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-07-21 13:39:36', '2020-07-21 13:39:36', 0),
(59, 112, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-07-21 13:42:05', '2020-07-21 13:42:05', 0),
(60, 213, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-07-22 06:51:04', '2020-07-22 06:51:04', 0),
(61, 221, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-07-22 07:14:29', '2020-07-22 07:14:29', 0),
(62, 256, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-07-22 13:40:34', '2020-07-22 13:40:34', 0),
(63, 257, 'POO', 'pooja.tripathi@sakec.ac.in', 'pooja.tripathi@sakec.ac.in', 'pooja.tripathi@sakec.ac.in', 'master', '2020-07-25 05:37:41', '2020-07-25 05:37:41', 0);

-- --------------------------------------------------------

--
-- Table structure for table `form_details`
--

CREATE TABLE `form_details` (
  `Form_details` int(16) NOT NULL,
  `Session` varchar(64) NOT NULL,
  `Validity` date NOT NULL,
  `Form_editor` mediumtext NOT NULL,
  `Access_level` mediumtext NOT NULL,
  `DELETED` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `form_details`
--

INSERT INTO `form_details` (`Form_details`, `Session`, `Validity`, `Form_editor`, `Access_level`, `DELETED`) VALUES
(1, 'S12020', '2020-06-23', 'Prateek', 'Master', 0);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `Q_id` int(16) NOT NULL,
  `Q_no` float NOT NULL,
  `F_id` int(16) NOT NULL,
  `Breakpoints` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `rating_scale` varchar(10) NOT NULL,
  `type` varchar(255) NOT NULL,
  `Question_desc` mediumtext NOT NULL,
  `Option1` varchar(1000) NOT NULL DEFAULT 'NULL',
  `Option2` varchar(1000) NOT NULL DEFAULT 'NULL',
  `Option3` varchar(1000) NOT NULL DEFAULT 'NULL',
  `Option4` varchar(1000) NOT NULL DEFAULT 'NULL',
  `Option5` varchar(1000) NOT NULL DEFAULT 'NULL',
  `Default_Option` varchar(1000) NOT NULL DEFAULT 'NULL',
  `DELETED` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`Q_id`, `Q_no`, `F_id`, `Breakpoints`, `created_on`, `updated_on`, `rating_scale`, `type`, `Question_desc`, `Option1`, `Option2`, `Option3`, `Option4`, `Option5`, `Default_Option`, `DELETED`) VALUES
(44, 0, 100, '', '2020-07-16 14:21:39', '2020-07-17 10:36:47', '', 'rating', 'I dont know bro , let me see', 'lucyt', 'elizatbeth', 'asdf', '', '', 'NULL', 1),
(45, 0, 101, '', '2020-07-16 14:29:31', '2020-07-16 14:29:31', '', 'text', 'sdfasfas', '', '', '', '', '', 'NULL', 0),
(46, 0, 101, '', '2020-07-16 14:30:29', '2020-07-16 14:30:29', '', 'rating', 'How are these going', '1', '2', '3', '4', '', 'NULL', 0),
(47, 0, 101, '', '2020-07-16 14:30:31', '2020-07-17 07:06:57', '', 'text', 'How are these going', '', '', '', '', '', 'NULL', 0),
(48, 0, 101, '', '2020-07-16 14:30:35', '2020-07-16 14:30:35', '', 'rating', 'How are these going', '1', '2', '3', '4', '', 'NULL', 0),
(49, 0, 101, '', '2020-07-17 07:07:42', '2020-07-17 07:55:47', '5', 'rating', 'sadfsdfasdfasdf', '', '', '', '', '', 'NULL', 0),
(50, 0, 102, '', '2020-07-17 09:26:19', '2020-07-17 09:35:28', '', 'text', 'wertwest', '', '', '', '', '', 'NULL', 1),
(51, 0, 102, '', '2020-07-17 09:30:18', '2020-07-17 09:34:54', '', 'text', 'sdgsadfas', '', '', '', '', '', 'NULL', 1),
(52, 0, 102, '', '2020-07-17 09:39:23', '2020-07-17 09:39:23', '', 'text', 'sadfasf', '', '', '', '', '', 'NULL', 0),
(53, 0, 102, '', '2020-07-17 09:39:32', '2020-07-17 09:44:03', '', 'multiplechoice', 'asdfsadf', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', 'NULL', 1),
(54, 0, 102, '', '2020-07-17 09:43:58', '2020-07-17 09:43:58', '', 'multiplechoice', 'asdfsadf', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', 'NULL', 0),
(55, 0, 102, '', '2020-07-17 09:45:03', '2020-07-17 09:45:03', '', 'radio', 'dfhgdfg', 'ergt', 'dfgh', 'dfgh', '', '', 'NULL', 0),
(56, 0, 103, '', '2020-07-17 10:00:51', '2020-07-17 10:00:51', '', 'text', 'hello there', '', '', '', '', '', 'NULL', 0),
(57, 0, 104, '', '2020-07-17 10:23:28', '2020-07-17 10:25:50', '', 'text', 'What are you doing', '', '', '', '', '', 'NULL', 1),
(58, 0, 104, '', '2020-07-17 10:23:58', '2020-07-17 10:25:42', '', 'radio', 'Just some radnom ooptions and that is it', 'optioon1', 'optioon`12', 'opiton 3 or whteber', 'optin 4', 'opitn 5', 'NULL', 0),
(59, 0, 104, '', '2020-07-17 10:24:58', '2020-07-17 10:24:58', '', 'rating', 'How much rating would you like to give this', '1', '2', '3', '4', '5', 'NULL', 0),
(60, 0, 104, '', '2020-07-17 10:25:53', '2020-07-17 10:25:53', '', 'radio', 'Just some radnom ooptions and that is it', 'optioon1', 'optioon`12', 'opiton 3 or whteber', 'optin 4', 'opitn 5', 'NULL', 0),
(61, 0, 104, '', '2020-07-17 10:26:01', '2020-07-17 10:26:01', '', 'rating', 'How much rating would you like to give this', '1', '2', '3', '4', '5', 'NULL', 0),
(62, 0, 104, '', '2020-07-17 10:26:46', '2020-07-20 15:28:04', '5', 'linearscale', 'Just to see how it looks', '1', '2', '3', '4', '5', 'NULL', 0),
(63, 0, 100, '', '2020-07-17 10:33:52', '2020-07-17 10:48:53', '', 'text', 'asdfsdafsadf asdfasdf', '', '', '', '', '', 'NULL', 1),
(64, 0, 100, '', '2020-07-17 10:42:40', '2020-07-17 10:44:26', '', 'radio', 'aasdfas', 'asdf', 'sadf', 'asdf', 'sadfasdf', '', 'NULL', 1),
(65, 0, 100, '', '2020-07-17 10:43:46', '2020-07-17 10:47:56', '3', 'rating', 'how do you like it let me edit this', '1', '2', '3', '', '', 'NULL', 0),
(66, 0, 100, '', '2020-07-17 10:48:12', '2020-07-17 10:48:12', '', 'multiplechoice', 'let have loolk', 'asdf', 'asdf', 'asdf', 'sa', 'sdfdsfgdsaf', 'NULL', 0),
(67, 0, 108, '', '2020-07-17 10:51:04', '2020-07-17 10:51:04', '', 'text', 'sadfsaf', '', '', '', '', '', 'NULL', 0),
(68, 0, 174, '', '2020-07-21 21:51:44', '2020-07-21 21:51:44', '', 'text', 'wsdafsadf', '', '', '', '', '', 'NULL', 0),
(69, 0, 174, '', '2020-07-21 21:51:48', '2020-07-21 21:51:48', '', 'text', 'asdfsadfsad', '', '', '', '', '', 'NULL', 0),
(70, 0, 174, '', '2020-07-21 21:51:50', '2020-07-21 21:51:50', '', 'text', 'asdfsadfsad', '', '', '', '', '', 'NULL', 0),
(71, 0, 174, '', '2020-07-21 21:51:52', '2020-07-21 21:51:52', '', 'text', 'asdfsadfsad', '', '', '', '', '', 'NULL', 0),
(72, 0, 174, '', '2020-07-21 21:51:53', '2020-07-21 21:51:53', '', 'text', 'asdfsadfsad', '', '', '', '', '', 'NULL', 0),
(73, 0, 185, '', '2020-07-21 21:59:00', '2020-07-21 21:59:00', '', 'text', 'safasdf', '', '', '', '', '', 'NULL', 0),
(74, 0, 185, '', '2020-07-21 21:59:02', '2020-07-21 21:59:02', '', 'text', 'safasdf', '', '', '', '', '', 'NULL', 0),
(75, 0, 185, '', '2020-07-21 21:59:04', '2020-07-21 21:59:04', '', 'text', 'safasdf', '', '', '', '', '', 'NULL', 0),
(76, 0, 185, '', '2020-07-21 21:59:06', '2020-07-21 21:59:06', '', 'text', 'safasdf', '', '', '', '', '', 'NULL', 0),
(77, 0, 105, '', '2020-07-21 22:02:18', '2020-07-21 22:02:18', '', 'text', 'sdafsadf', '', '', '', '', '', 'NULL', 0),
(78, 0, 105, '', '2020-07-21 22:02:19', '2020-07-21 22:02:19', '', 'text', 'sdafsadf', '', '', '', '', '', 'NULL', 0),
(79, 0, 105, '', '2020-07-21 22:02:21', '2020-07-21 22:02:21', '', 'text', 'sdafsadf', '', '', '', '', '', 'NULL', 0),
(80, 0, 190, '', '2020-07-21 22:04:44', '2020-07-21 22:04:44', '', 'text', 'wsadfsadf', '', '', '', '', '', 'NULL', 0),
(81, 0, 190, '', '2020-07-21 22:04:45', '2020-07-21 22:04:45', '', 'text', 'wsadfsadf', '', '', '', '', '', 'NULL', 0),
(82, 0, 190, '', '2020-07-21 22:04:48', '2020-07-21 22:04:48', '', 'text', 'wsadfsadf', '', '', '', '', '', 'NULL', 0),
(83, 0, 190, '', '2020-07-21 22:04:51', '2020-07-21 22:04:51', '', 'text', 'wsadfsadf', '', '', '', '', '', 'NULL', 0),
(84, 1, 192, '', '2020-07-22 06:02:21', '2020-07-22 06:02:21', '', 'text', 'asdfsadf', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(85, 2, 192, '', '2020-07-22 06:02:56', '2020-07-22 06:02:56', '', 'text', 'asdfsadf', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(86, 1, 192, '', '2020-07-22 06:06:23', '2020-07-22 06:06:23', '', 'text', 'asdfsadf', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(87, 1, 192, '', '2020-07-22 06:06:29', '2020-07-22 06:06:29', '', 'text', 'asdfsadf', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(88, 1, 192, '', '2020-07-22 06:07:23', '2020-07-22 06:07:23', '', 'text', 'asdfsadf', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(89, 1, 196, '', '2020-07-22 06:08:32', '2020-07-22 06:08:32', '', 'text', 'asdfsadf', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(90, 1, 197, '', '2020-07-22 06:08:59', '2020-07-22 06:08:59', '', 'text', 'asdfsadf', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(91, 1, 198, '', '2020-07-22 06:14:05', '2020-07-22 06:14:05', '', '1', 'asdfsadf', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(92, 1, 199, '', '2020-07-22 06:14:22', '2020-07-22 06:14:22', '', '1', 'asdfsadf', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(93, 1, 200, '', '2020-07-22 06:14:24', '2020-07-22 06:14:24', '', '1', 'asdfsadf', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(94, 1, 201, '', '2020-07-22 06:14:25', '2020-07-22 06:14:25', '', '1', 'asdfsadf', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(95, 1, 202, '', '2020-07-22 06:14:26', '2020-07-22 06:14:26', '', '1', 'asdfsadf', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(96, 1, 203, '', '2020-07-22 06:14:43', '2020-07-22 06:14:43', '', '1', 'asdfsadf', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(97, 1, 204, '', '2020-07-22 06:16:01', '2020-07-22 06:16:01', '', 'text', '1', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(98, 1, 205, '', '2020-07-22 06:16:04', '2020-07-22 06:16:04', '', 'text', '1', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(99, 1, 206, '', '2020-07-22 06:16:23', '2020-07-22 06:16:23', '', 'text', '2', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(100, 1, 207, '', '2020-07-22 06:16:25', '2020-07-22 06:16:25', '', 'text', '2', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(101, 1, 208, '', '2020-07-22 06:16:28', '2020-07-22 06:16:28', '', 'text', '2', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(102, 1, 209, '', '2020-07-22 06:16:30', '2020-07-22 06:16:30', '', 'text', '2', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(103, 1, 210, '', '2020-07-22 06:16:49', '2020-07-22 06:16:49', '', 'text', '2', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(104, 1, 211, '', '2020-07-22 06:16:52', '2020-07-22 06:16:52', '', 'text', '2', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(105, 1, 212, '', '2020-07-22 06:16:57', '2020-07-22 06:16:57', '', 'text', '2', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(106, 1, 214, '', '2020-07-22 07:04:40', '2020-07-22 07:04:40', '', 'text', '2', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(107, 0, 214, '', '2020-07-22 07:05:48', '2020-07-22 07:05:53', '', 'radio', 'safsadfsaf 2', '', '', '', '', '', 'NULL', 0),
(108, 0, 214, '', '2020-07-22 07:05:53', '2020-07-22 07:05:53', '', 'radio', 'safsadfsaf 2', '', '', '', '', '', 'NULL', 0),
(109, 0, 214, '', '2020-07-22 07:05:56', '2020-07-22 07:05:56', '', 'radio', 'safsadfsaf 2', '', '', '', '', '', 'NULL', 0),
(110, 1, 215, '', '2020-07-22 07:06:06', '2020-07-22 07:06:06', '', 'text', '2', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(111, 1, 216, '', '2020-07-22 07:07:21', '2020-07-22 07:07:21', '', 'text', '2', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(112, 1, 217, '', '2020-07-22 07:09:35', '2020-07-22 07:09:35', '', 'text', '2', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(113, 0, 216, '', '2020-07-22 07:09:48', '2020-07-22 07:09:48', '', 'text', 'asdfasdf', '', '', '', '', '', 'NULL', 0),
(114, 0, 216, '', '2020-07-22 07:09:51', '2020-07-22 07:09:51', '', 'text', 'asdfasdf', '', '', '', '', '', 'NULL', 0),
(115, 0, 216, '', '2020-07-22 07:09:54', '2020-07-22 07:09:54', '', 'text', 'asdfasdf', '', '', '', '', '', 'NULL', 0),
(116, 0, 217, '', '2020-07-22 07:10:06', '2020-07-22 07:10:06', '', 'text', 'asdfasf', '', '', '', '', '', 'NULL', 0),
(117, 0, 217, '', '2020-07-22 07:10:07', '2020-07-22 07:10:07', '', 'text', 'asdfasf', '', '', '', '', '', 'NULL', 0),
(118, 1, 218, '', '2020-07-22 07:10:18', '2020-07-22 07:10:18', '', 'text', '2', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(119, 1, 219, '', '2020-07-22 07:10:46', '2020-07-22 07:10:46', '', 'text', '2', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(120, 0, 219, '', '2020-07-22 07:11:27', '2020-07-22 07:11:27', '', 'text', 'asdfsaf', '', '', '', '', '', 'NULL', 0),
(121, 0, 219, '', '2020-07-22 07:11:28', '2020-07-22 07:11:28', '', 'text', 'asdfsaf', '', '', '', '', '', 'NULL', 0),
(122, 0, 219, '', '2020-07-22 07:11:32', '2020-07-22 07:11:32', '', 'text', 'asdfsaf', '', '', '', '', '', 'NULL', 0),
(123, 1, 220, '', '2020-07-22 07:11:41', '2020-07-22 07:11:41', '', 'text', '2', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(124, 0, 221, '', '2020-07-22 08:10:21', '2020-07-22 08:10:21', '', 'text', 'this is just a test', '', '', '', '', '', 'NULL', 0),
(125, 0, 221, '', '2020-07-22 08:10:28', '2020-07-22 08:10:28', '', 'text', 'this is just a test', '', '', '', '', '', 'NULL', 0),
(126, 1, 231, '', '2020-07-22 08:10:43', '2020-07-22 08:10:43', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(127, 1, 232, '', '2020-07-22 08:11:02', '2020-07-22 08:11:02', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(128, 1, 232, '', '2020-07-22 08:13:32', '2020-07-22 08:13:32', '', 'text', 'sdf', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(129, 1, 233, '', '2020-07-22 08:16:24', '2020-07-22 08:16:24', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(130, 1, 234, '', '2020-07-22 08:16:24', '2020-07-22 08:16:24', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(131, 1, 235, '', '2020-07-22 08:16:55', '2020-07-22 08:16:55', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(132, 1, 236, '', '2020-07-22 08:16:56', '2020-07-22 08:16:56', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(133, 1, 237, '', '2020-07-22 08:19:07', '2020-07-22 08:19:07', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(134, 1, 238, '', '2020-07-22 08:19:08', '2020-07-22 08:19:08', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(135, 1, 239, '', '2020-07-22 08:20:21', '2020-07-22 08:20:21', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(136, 1, 240, '', '2020-07-22 08:20:22', '2020-07-22 08:20:22', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(137, 1, 241, '', '2020-07-22 08:23:10', '2020-07-22 08:23:10', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(138, 1, 241, '', '2020-07-22 08:23:11', '2020-07-22 08:23:11', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(139, 1, 242, '', '2020-07-22 08:23:12', '2020-07-22 08:23:12', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(140, 1, 242, '', '2020-07-22 08:23:12', '2020-07-22 08:23:12', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(141, 1, 243, '', '2020-07-22 08:23:26', '2020-07-22 08:23:26', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(142, 1, 243, '', '2020-07-22 08:23:27', '2020-07-22 08:23:27', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(143, 1, 244, '', '2020-07-22 08:23:29', '2020-07-22 08:23:29', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(144, 1, 244, '', '2020-07-22 08:23:29', '2020-07-22 08:23:29', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(145, 1, 245, '', '2020-07-22 08:23:30', '2020-07-22 08:23:30', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(146, 1, 245, '', '2020-07-22 08:23:30', '2020-07-22 08:23:30', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(147, 1, 246, '', '2020-07-22 08:23:32', '2020-07-22 08:23:32', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(148, 1, 246, '', '2020-07-22 08:23:32', '2020-07-22 08:23:32', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(149, 0, 232, '', '2020-07-22 08:23:39', '2020-07-22 08:23:39', '', 'text', 'sadfasfasdf', '', '', '', '', '', 'NULL', 0),
(150, 0, 232, '', '2020-07-22 08:23:41', '2020-07-22 08:23:51', '', 'radio', 'sadfasfasdf', 'asdfa', 'asdfa', 'asdf', 'asdf', '', 'NULL', 0),
(151, 1, 247, '', '2020-07-22 08:24:16', '2020-07-22 08:24:16', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(152, 1, 247, '', '2020-07-22 08:24:16', '2020-07-22 08:24:16', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(153, 0, 247, '', '2020-07-22 08:31:11', '2020-07-22 08:31:11', '', 'text', 'sdfgsdfg', '', '', '', '', '', 'NULL', 0),
(154, 0, 247, '', '2020-07-22 08:31:12', '2020-07-22 08:31:12', '', 'text', 'sdfgsdfg', '', '', '', '', '', 'NULL', 0),
(155, 0, 247, '', '2020-07-22 08:31:15', '2020-07-22 08:31:15', '', 'text', 'sdfgsdfg', '', '', '', '', '', 'NULL', 0),
(156, 1, 248, '', '2020-07-22 08:31:24', '2020-07-22 08:31:24', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(157, 1, 248, '', '2020-07-22 08:31:24', '2020-07-22 08:34:39', '', 'text', '3asdfasf', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(158, 0, 248, '', '2020-07-22 08:34:34', '2020-07-22 08:34:36', '', 'text', '3sadfasdf', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(159, 0, 248, '', '2020-07-22 08:34:41', '2020-07-22 08:34:41', '', 'text', '3sadfasdf', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(160, 1, 249, '', '2020-07-22 08:35:00', '2020-07-22 08:35:00', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(161, 1, 249, '', '2020-07-22 08:35:00', '2020-07-22 08:35:00', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(162, 0, 249, '', '2020-07-22 08:36:40', '2020-07-22 08:36:40', '', 'text', 'szadsad', '', '', '', '', '', 'NULL', 0),
(163, 0, 249, '', '2020-07-22 08:36:43', '2020-07-22 08:36:43', '', 'text', 'szadsad', '', '', '', '', '', 'NULL', 0),
(164, 0, 249, '', '2020-07-22 08:36:47', '2020-07-22 08:36:47', '', 'text', 'szadsad', '', '', '', '', '', 'NULL', 0),
(165, 1, 250, '', '2020-07-22 08:39:36', '2020-07-22 08:39:36', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(166, 1, 250, '', '2020-07-22 08:39:37', '2020-07-22 08:39:37', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(167, 0, 250, '', '2020-07-22 08:43:52', '2020-07-22 08:43:55', '', 'text', 'adfasdfas', '', '', '', '', '', 'NULL', 1),
(168, 0, 250, '', '2020-07-22 08:43:57', '2020-07-22 08:43:57', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(169, 0, 250, '', '2020-07-22 08:44:03', '2020-07-22 08:44:03', '', 'text', 'asasdfasdf', '', '', '', '', '', 'NULL', 0),
(170, 0, 250, '', '2020-07-22 08:44:05', '2020-07-22 08:44:05', '', 'text', 'asasdfasdf', '', '', '', '', '', 'NULL', 0),
(171, 0, 250, '', '2020-07-22 08:44:09', '2020-07-22 08:44:09', '', 'text', 'asasdfasdf', '', '', '', '', '', 'NULL', 0),
(172, 1, 251, '', '2020-07-22 08:44:46', '2020-07-22 08:44:46', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(173, 1, 251, '', '2020-07-22 08:44:46', '2020-07-22 08:44:46', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(174, 1, 252, '', '2020-07-22 08:44:47', '2020-07-22 08:44:47', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(175, 1, 252, '', '2020-07-22 08:44:47', '2020-07-22 08:44:47', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(176, 1, 253, '', '2020-07-22 08:45:26', '2020-07-22 08:45:26', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(177, 1, 253, '', '2020-07-22 08:45:27', '2020-07-22 08:45:27', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(178, 1, 254, '', '2020-07-22 08:45:28', '2020-07-22 08:45:28', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(179, 1, 254, '', '2020-07-22 08:45:28', '2020-07-22 08:45:28', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(180, 0, 254, '', '2020-07-22 08:46:22', '2020-07-22 08:46:22', '', 'text', 'asdfasdfadssadfasdfsadfadsfasdfas', '', '', '', '', '', 'NULL', 0),
(181, 0, 254, '', '2020-07-22 08:46:24', '2020-07-22 08:46:24', '', 'text', 'asdfasdfadssadfasdfsadfadsfasdfas', '', '', '', '', '', 'NULL', 0),
(182, 0, 254, '', '2020-07-22 08:46:27', '2020-07-22 08:46:27', '', 'text', 'asdfasdfadssadfasdfsadfadsfasdfas', '', '', '', '', '', 'NULL', 0),
(183, 0, 254, '', '2020-07-22 08:46:28', '2020-07-22 08:46:28', '', 'text', 'asdfasdfadssadfasdfsadfadsfasdfas', '', '', '', '', '', 'NULL', 0),
(184, 1, 255, '', '2020-07-22 08:46:50', '2020-07-22 08:46:50', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(185, 1, 255, '', '2020-07-22 08:46:50', '2020-07-22 08:46:50', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(186, 0, 157, '', '2020-07-22 13:38:47', '2020-07-22 13:40:03', '', 'multiplechoice', 'Just a test', 'asdfas', 'dasdfa', 'asdfasdf', 'asdf', 'df', 'NULL', 0),
(187, 0, 157, '', '2020-07-22 13:39:18', '2020-07-22 13:39:54', '', 'radio', 'which anime do you like', 'naruto ', 'one piece', ' death note', 'asdfsafd', 'sadfasdfas', 'NULL', 0),
(188, 0, 157, '', '2020-07-22 13:39:31', '2020-07-22 13:39:31', '', 'rating', 'how much do you like me ?', '', '', '', '', '', 'NULL', 0),
(189, 0, 157, '', '2020-07-22 13:39:35', '2020-07-22 13:39:35', '', 'rating', 'how much do you like me ?', '', '', '', '', '', 'NULL', 0),
(190, 0, 256, '', '2020-07-22 13:41:02', '2020-07-22 13:41:02', '', 'text', 'asdfasf', '', '', '', '', '', 'NULL', 0),
(191, 0, 158, '', '2020-07-25 05:35:24', '2020-07-25 05:35:24', '', 'text', 'dsfgdsgf', '', '', '', '', '', 'NULL', 0),
(192, 0, 158, '', '2020-07-25 05:35:25', '2020-07-25 05:35:45', '', 'text', 'dsfgdsgf asdfasdfas f', '', '', '', '', '', 'NULL', 0),
(193, 0, 158, '', '2020-07-25 05:35:33', '2020-07-25 05:35:40', '', 'text', 'dsfgdsgf', '', '', '', '', '', 'NULL', 1),
(194, 0, 158, '', '2020-07-25 05:35:53', '2020-07-25 05:36:08', '', 'rating', 'asdfasdf', '', '', '', '', '', 'NULL', 0),
(195, 0, 158, '', '2020-07-25 05:36:46', '2020-07-25 05:36:46', '', 'multiplechoice', 'asdfasdf', 'sadfsad', 'fasdf', 'sadfa', 'asdfa', '', 'NULL', 0),
(196, 1, 258, '', '2020-07-25 05:39:10', '2020-07-25 05:39:10', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0),
(197, 1, 258, '', '2020-07-25 05:39:10', '2020-07-25 05:39:10', '', 'text', '3', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `U_id` int(16) NOT NULL,
  `User_id` varchar(64) NOT NULL,
  `User_name` varchar(255) NOT NULL,
  `User _email` varchar(255) NOT NULL,
  `Role` text NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Details_id` int(16) NOT NULL,
  `Password_id` int(16) NOT NULL,
  `DELETED` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`U_id`, `User_id`, `User_name`, `User _email`, `Role`, `created_on`, `updated_on`, `Details_id`, `Password_id`, `DELETED`) VALUES
(3, 'ANI', 'aniket', 'aniketkumar.singh@sakec.ac.in', 'admin', '2020-06-09 05:32:43', '2020-06-09 05:32:43', 3, 3, 0),
(4, 'JAYA', 'Jaya', 'jayatripathi@gmail.com', 'student', '2020-07-11 08:12:02', '2020-07-11 08:12:02', 4, 4, 0),
(2, 'POO', 'Pooja', 'pooja.tripathi@sakec.ac.in', 'admin', '2020-06-09 05:21:22', '2020-06-09 10:32:47', 2, 2, 0),
(1, 'PRA', 'prateek', 'prateek.manta@sakec.ac.in', 'Admin', '2020-05-31 11:03:21', '2020-06-09 05:25:40', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `Details_id` int(16) NOT NULL,
  `First_name` varchar(255) NOT NULL,
  `Middle_name` varchar(255) NOT NULL,
  `Last_name` varchar(255) NOT NULL,
  `Phone` bigint(20) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `DELETED` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`Details_id`, `First_name`, `Middle_name`, `Last_name`, `Phone`, `created_on`, `updated_on`, `DELETED`) VALUES
(1, 'Prateek', 'Prakash', 'Manta', 9923433423, '2020-05-31 10:57:25', '2020-05-31 10:57:25', 0),
(2, 'Pooja', 'Jitendra', 'Tripathi', 9829342232, '2020-05-31 10:58:43', '2020-05-31 10:58:43', 0),
(3, 'Aniket', 'Kumar', 'Singh', 8934982332, '2020-06-09 05:31:21', '2020-06-09 05:31:21', 0),
(4, 'Jaya', 'Jitendra', 'Tripathi', 9653118977, '2020-07-11 08:08:06', '2020-07-11 08:08:23', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_password`
--

CREATE TABLE `user_password` (
  `Password_id` int(16) NOT NULL,
  `password` varchar(255) NOT NULL,
  `re_enter_password` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `DELETED` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_password`
--

INSERT INTO `user_password` (`Password_id`, `password`, `re_enter_password`, `created_on`, `updated_on`, `DELETED`) VALUES
(1, '123456789', '123456789', '2020-05-31 11:01:18', '2020-06-09 05:24:16', 0),
(2, '234567890', '234567890', '2020-06-09 05:22:32', '2020-06-09 05:24:23', 0),
(3, '345678901', '345678901', '2020-06-09 05:23:30', '2020-06-09 05:24:43', 0),
(4, 'engineer', 'engineer', '2020-07-11 08:09:15', '2020-07-11 08:09:15', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access`
--
ALTER TABLE `access`
  ADD PRIMARY KEY (`Access_id`),
  ADD KEY `Access_id` (`form_allotment_id`),
  ADD KEY `Admin_id` (`Admin_id`),
  ADD KEY `Form_id` (`F_id`),
  ADD KEY `Admin_email` (`Admin_email`);

--
-- Indexes for table `admin_credentials`
--
ALTER TABLE `admin_credentials`
  ADD PRIMARY KEY (`Admin_id`),
  ADD KEY `a_id` (`A_id`),
  ADD KEY `u_id` (`U_id`),
  ADD KEY `Admin_email` (`Admin_email`),
  ADD KEY `Admin_id` (`Admin_id`),
  ADD KEY `Admin_id_2` (`Admin_id`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`Ans_id`),
  ADD KEY `F_id` (`F_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Q_no` (`Q_no`),
  ADD KEY `User _email` (`User _email`);

--
-- Indexes for table `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`F_id`),
  ADD KEY `f_id` (`F_id`),
  ADD KEY `Admin_id` (`Admin_id`),
  ADD KEY `Form_details` (`Form_details`),
  ADD KEY `form_ibfk_2` (`Admin_email`),
  ADD KEY `F_id_2` (`F_id`);

--
-- Indexes for table `form_allotment`
--
ALTER TABLE `form_allotment`
  ADD PRIMARY KEY (`form_allotment_id`),
  ADD KEY `F_id` (`F_id`),
  ADD KEY `Admin_id` (`Admin_id`),
  ADD KEY `Admin_email` (`Admin_email`);

--
-- Indexes for table `form_details`
--
ALTER TABLE `form_details`
  ADD PRIMARY KEY (`Form_details`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`Q_id`),
  ADD KEY `FOREIGN KEY` (`F_id`),
  ADD KEY `Q_no` (`Q_no`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `details_id` (`Details_id`),
  ADD KEY `password_id` (`Password_id`),
  ADD KEY `u_id` (`U_id`),
  ADD KEY `User _email` (`User _email`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`Details_id`);

--
-- Indexes for table `user_password`
--
ALTER TABLE `user_password`
  ADD PRIMARY KEY (`Password_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access`
--
ALTER TABLE `access`
  MODIFY `Access_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `admin_credentials`
--
ALTER TABLE `admin_credentials`
  MODIFY `A_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `Ans_id` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form`
--
ALTER TABLE `form`
  MODIFY `F_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT for table `form_allotment`
--
ALTER TABLE `form_allotment`
  MODIFY `form_allotment_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `form_details`
--
ALTER TABLE `form_details`
  MODIFY `Form_details` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `Q_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `U_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `Details_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_password`
--
ALTER TABLE `user_password`
  MODIFY `Password_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1262239;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `access`
--
ALTER TABLE `access`
  ADD CONSTRAINT `access_ibfk_1` FOREIGN KEY (`Admin_id`) REFERENCES `admin_credentials` (`Admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `access_ibfk_2` FOREIGN KEY (`Admin_email`) REFERENCES `admin_credentials` (`Admin_email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `access_ibfk_3` FOREIGN KEY (`form_allotment_id`) REFERENCES `form_allotment` (`form_allotment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `access_ibfk_4` FOREIGN KEY (`F_id`) REFERENCES `form` (`F_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `admin_credentials`
--
ALTER TABLE `admin_credentials`
  ADD CONSTRAINT `admin_credentials_ibfk_1` FOREIGN KEY (`U_id`) REFERENCES `user` (`U_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`Q_no`) REFERENCES `questions` (`Q_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_3` FOREIGN KEY (`User _email`) REFERENCES `user` (`User _email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_4` FOREIGN KEY (`F_id`) REFERENCES `form` (`F_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `form`
--
ALTER TABLE `form`
  ADD CONSTRAINT `form_ibfk_1` FOREIGN KEY (`Admin_id`) REFERENCES `admin_credentials` (`Admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `form_ibfk_2` FOREIGN KEY (`Admin_email`) REFERENCES `admin_credentials` (`Admin_email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `form_ibfk_3` FOREIGN KEY (`Form_details`) REFERENCES `form_details` (`Form_details`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `form_allotment`
--
ALTER TABLE `form_allotment`
  ADD CONSTRAINT `form_allotment_ibfk_1` FOREIGN KEY (`F_id`) REFERENCES `form` (`F_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `form_allotment_ibfk_2` FOREIGN KEY (`Admin_id`) REFERENCES `form` (`Admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `form_allotment_ibfk_3` FOREIGN KEY (`Admin_email`) REFERENCES `form` (`Admin_email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`F_id`) REFERENCES `form` (`F_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`Details_id`) REFERENCES `user_details` (`Details_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`Password_id`) REFERENCES `user_password` (`Password_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
