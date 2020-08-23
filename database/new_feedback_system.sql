-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2020 at 05:08 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

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
  `DELETED` tinyint(1) NOT NULL DEFAULT 0
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
  `DELETED` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_credentials`
--

INSERT INTO `admin_credentials` (`A_id`, `Admin_id`, `Admin_name`, `Admin_email`, `created_on`, `updated_on`, `Admin_Password`, `re_enter_password`, `DELETED`) VALUES
(3, 'ANI', 'aniket', 'aniketkumar.singh@sakec.ac.in', '2020-06-09 05:33:52', '2020-07-11 07:21:09', '345678901', '345678901', 0),
(2, 'POO', 'Pooja', 'pooja.tripathi@sakec.ac.in', '2020-06-09 05:28:51', '2020-07-11 07:21:25', '234567890', '234567890', 0),
(1, 'PRA', 'Prateek', 'prateek.manta@sakec.ac.in', '2020-05-31 11:04:35', '2020-07-11 07:21:38', '123456789', '123456789', 0);

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `Ans_id` int(16) NOT NULL,
  `User_email` varchar(255) NOT NULL,
  `Q_id` int(100) NOT NULL,
  `Answer_desc` varchar(10000) NOT NULL,
  `Ans_recorded` timestamp NOT NULL DEFAULT current_timestamp(),
  `DELETED` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`Ans_id`, `User_email`, `Q_id`, `Answer_desc`, `Ans_recorded`, `DELETED`) VALUES
(1, 'aniketkumar.singh@sakec.ac.in', 100, 'bfg', '2020-08-22 14:04:28', 0),
(2, 'aniketkumar.singh@sakec.ac.in', 101, 'jack 1', '2020-08-22 14:04:39', 0),
(3, 'aniketkumar.singh@sakec.ac.in', 102, 'ththt', '2020-08-22 14:04:40', 0),
(4, 'aniketkumar.singh@sakec.ac.in', 103, 'gddg', '2020-08-22 14:04:47', 0),
(5, 'aniketkumar.singh@sakec.ac.in', 104, '4', '2020-08-22 14:04:49', 0);

-- --------------------------------------------------------

--
-- Table structure for table `form`
--

CREATE TABLE `form` (
  `F_id` int(16) NOT NULL,
  `Admin_id` varchar(64) NOT NULL,
  `Admin_email` varchar(255) NOT NULL,
  `Form_code` int(20) NOT NULL,
  `Form_name` varchar(255) NOT NULL,
  `Form_version` varchar(255) NOT NULL,
  `Form_Desc` varchar(255) NOT NULL,
  `Published` tinyint(1) NOT NULL DEFAULT 0,
  `Expired` tinyint(1) NOT NULL DEFAULT 0,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `DELETED` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `DELETED` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `form_allotment`
--

INSERT INTO `form_allotment` (`form_allotment_id`, `F_id`, `Admin_id`, `Admin_email`, `access_giver`, `access_receiver`, `priviliges`, `created_on`, `updated_on`, `DELETED`) VALUES
(57, 110, 'POO', 'pooja.tripathi@sakec.ac.in', 'pooja.tripathi@sakec.ac.in', 'pooja.tripathi@sakec.ac.in', '', '2020-08-01 12:26:11', '2020-08-01 12:26:11', 0),
(64, 127, 'ANI', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'master', '2020-08-05 14:14:00', '2020-08-05 14:14:00', 0),
(69, 135, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-08-05 14:38:23', '2020-08-05 14:38:23', 0),
(70, 139, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-08-05 14:42:06', '2020-08-05 14:42:06', 0),
(71, 144, 'ANI', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'master', '2020-08-19 15:58:57', '2020-08-19 15:58:57', 0),
(72, 147, 'ANI', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'master', '2020-08-23 10:35:13', '2020-08-23 10:35:13', 0),
(73, 151, 'ANI', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'master', '2020-08-23 11:14:16', '2020-08-23 11:14:16', 0),
(74, 155, 'ANI', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'master', '2020-08-23 11:16:43', '2020-08-23 11:16:43', 0),
(75, 158, 'ANI', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'master', '2020-08-23 11:18:18', '2020-08-23 11:18:18', 0),
(76, 159, 'ANI', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'master', '2020-08-23 11:19:55', '2020-08-23 11:19:55', 0),
(77, 1, 'ANI', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'master', '2020-08-23 12:31:19', '2020-08-23 12:31:19', 0),
(78, 4, 'ANI', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'master', '2020-08-23 15:04:50', '2020-08-23 15:04:50', 0);

-- --------------------------------------------------------

--
-- Table structure for table `publish_details`
--

CREATE TABLE `publish_details` (
  `Form_details` int(16) NOT NULL,
  `F_id` int(16) NOT NULL,
  `Start_date` date NOT NULL,
  `End_date` date NOT NULL,
  `Validity` varchar(255) NOT NULL,
  `Role` varchar(255) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Year` varchar(16) NOT NULL,
  `Division` varchar(16) NOT NULL,
  `DELETED` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(68, 0, 109, '', '2020-08-01 12:29:53', '2020-08-01 12:29:53', '', 'radio', 'yo', '2', '6', '3', '3', '7', 'NULL', 0),
(69, 0, 109, '', '2020-08-01 12:30:35', '2020-08-01 12:30:35', '', 'text', 'hey', '', '', '', '', '', 'NULL', 0),
(70, 1, 111, '', '2020-08-01 12:33:09', '2020-08-01 12:33:09', '', 'radio', 'yo', '2', '6', '3', '3', '7', 'NULL', 0),
(71, 2, 111, '', '2020-08-01 12:33:09', '2020-08-01 12:33:09', '', 'text', 'hey', '', '', '', '', '', 'NULL', 0),
(72, 0, 113, '', '2020-08-01 13:54:57', '2020-08-01 13:54:57', '', 'radio', 'dsvdfv', 'gghchgc', 'ytyf', 'cctrtrdc', 'cgfc', 'yfyf', 'NULL', 0),
(73, 0, 113, '', '2020-08-01 14:29:03', '2020-08-01 14:29:03', '', 'rating', 'hiiii', '', '', '', '', '', 'NULL', 0),
(80, 1, 128, '', '2020-08-05 14:18:29', '2020-08-05 14:18:29', '', 'radio', 'yo', '2', '6', '3', '3', '7', 'NULL', 0),
(81, 2, 128, '', '2020-08-05 14:18:29', '2020-08-05 14:18:29', '', 'text', 'hey', '', '', '', '', '', 'NULL', 0),
(84, 0, 135, '', '2020-08-05 14:40:55', '2020-08-10 14:11:16', '5', 'linearscale', 'yoyoyo', 'asdfasdf', 'asdfasfd', 'asdfas', 'asdf', 'asdf', 'NULL', 0),
(85, 1, 136, '', '2020-08-05 14:41:07', '2020-08-05 14:41:07', '', 'text', 'yoyoyo', '', '', '', '', '', 'NULL', 0),
(86, 0, 136, '', '2020-08-05 14:41:24', '2020-08-05 14:41:24', '', 'rating', 'hiiiiii', '', '', '', '', '', 'NULL', 0),
(87, 1, 137, '', '2020-08-05 14:41:36', '2020-08-05 14:41:36', '', 'text', 'yoyoyo', '', '', '', '', '', 'NULL', 0),
(88, 2, 137, '', '2020-08-05 14:41:37', '2020-08-05 14:41:37', '', 'rating', 'hiiiiii', '', '', '', '', '', 'NULL', 0),
(89, 1, 138, '', '2020-08-05 14:41:47', '2020-08-05 14:41:47', '', 'text', 'yoyoyo', '', '', '', '', '', 'NULL', 0),
(90, 1, 143, '', '2020-08-10 13:04:44', '2020-08-10 13:04:44', '', 'text', 'yoyoyo', '', '', '', '', '', 'NULL', 0),
(91, 0, 135, '', '2020-08-10 14:10:53', '2020-08-10 14:10:53', '', 'text', 'The following', '', '', '', '', '', 'NULL', 0),
(92, 0, 135, '', '2020-08-10 14:12:55', '2020-08-10 14:12:55', '', 'multiplechoice', 'asdfasf', 'asdfasdf', 'asdf', 'asdf', 'asdfa', 'sdf', 'NULL', 0),
(93, 0, 135, '', '2020-08-10 14:13:22', '2020-08-10 14:13:22', '', 'radio', 'asdfasdf', 'asdfaas', 'dfasdf', 'asd', 'fasdfasdf', 'asdf', 'NULL', 0),
(94, 0, 144, '', '2020-08-20 14:04:00', '2020-08-22 06:49:27', '', 'radio', 'radio few', 'def', 'fe', 'bfg', '', '', 'NULL', 0),
(95, 0, 144, '', '2020-08-20 14:04:09', '2020-08-20 14:04:09', '', 'text', 'tesxt', '', '', '', '', '', 'NULL', 0),
(96, 0, 144, '', '2020-08-20 14:04:21', '2020-08-20 14:04:21', '', 'multiplechoice', 'multiiii', 'rdhd', 'htdhtd', 'ththt', 'hrhtf', 'htfyhrh', 'NULL', 0),
(97, 0, 144, '', '2020-08-20 14:04:34', '2020-08-20 14:04:34', '3', 'linearscale', 'thrdhdr', 'gddg', 'hdd', 'hdh', '', '', 'NULL', 0),
(98, 0, 144, '', '2020-08-20 14:04:39', '2020-08-20 14:04:39', '', 'rating', 'rate', '', '', '', '', '', 'NULL', 0),
(99, 0, 145, '', '2020-08-22 12:14:33', '2020-08-22 12:14:33', '', 'radio', 'jbjb', 'vy', 'hhu', 'gyuugy', 'vdrtyf', 'vhggyuj', 'NULL', 0),
(100, 1, 146, '', '2020-08-22 13:30:41', '2020-08-22 13:30:41', '', 'radio', 'radio few', 'def', 'fe', 'bfg', '', '', 'NULL', 0),
(101, 2, 146, '', '2020-08-22 13:30:41', '2020-08-22 13:30:41', '', 'text', 'tesxt', '', '', '', '', '', 'NULL', 0),
(102, 3, 146, '', '2020-08-22 13:30:41', '2020-08-22 13:30:41', '', 'multiplechoice', 'multiiii', 'rdhd', 'htdhtd', 'ththt', 'hrhtf', 'htfyhrh', 'NULL', 0),
(103, 4, 146, '', '2020-08-22 13:30:41', '2020-08-22 13:30:41', '3', 'linearscale', 'thrdhdr', 'gddg', 'hdd', 'hdh', '', '', 'NULL', 0),
(104, 5, 146, '', '2020-08-22 13:30:41', '2020-08-22 13:30:41', '', 'rating', 'rate', '', '', '', '', '', 'NULL', 0),
(105, 0, 1, '', '2020-08-23 12:32:05', '2020-08-23 12:32:05', '', 'radio', 'THis is the first question', 'this is option 1', 'option 2', 'option3', 'option4', '', 'NULL', 0),
(106, 0, 1, '', '2020-08-23 12:32:20', '2020-08-23 12:32:20', '', 'text', 'second question', '', '', '', '', '', 'NULL', 0),
(107, 0, 1, '', '2020-08-23 12:32:47', '2020-08-23 12:32:47', '', 'multiplechoice', 'third question', 'choose this', 'this too', 'dont', 'yes', 'obvious', 'NULL', 0),
(108, 0, 1, '', '2020-08-23 12:32:57', '2020-08-23 12:32:57', '', 'rating', 'rate my system', '', '', '', '', '', 'NULL', 0),
(109, 0, 1, '', '2020-08-23 12:34:01', '2020-08-23 12:34:01', '5', 'linearscale', 'same as radio', 'heeyyyy', 'good', 'bad', 'excel', 'kkk', 'NULL', 0),
(110, 1, 2, '', '2020-08-23 12:34:57', '2020-08-23 12:34:57', '', 'radio', 'THis is the first question', 'this is option 1', 'option 2', 'option3', 'option4', '', 'NULL', 0),
(111, 2, 2, '', '2020-08-23 12:34:57', '2020-08-23 12:35:11', '', 'text', 'second question', '', '', '', '', '', 'NULL', 1),
(112, 3, 2, '', '2020-08-23 12:34:57', '2020-08-23 12:34:57', '', 'multiplechoice', 'third question', 'choose this', 'this too', 'dont', 'yes', 'obvious', 'NULL', 0),
(113, 4, 2, '', '2020-08-23 12:34:57', '2020-08-23 12:34:57', '', 'rating', 'rate my system', '', '', '', '', '', 'NULL', 0),
(114, 5, 2, '', '2020-08-23 12:34:57', '2020-08-23 12:34:57', '5', 'linearscale', 'same as radio', 'heeyyyy', 'good', 'bad', 'excel', 'kkk', 'NULL', 0),
(115, 1, 3, '', '2020-08-23 12:35:22', '2020-08-23 12:35:22', '', 'radio', 'THis is the first question', 'this is option 1', 'option 2', 'option3', 'option4', '', 'NULL', 0),
(116, 2, 3, '', '2020-08-23 12:35:22', '2020-08-23 12:35:22', '', 'text', 'second question', '', '', '', '', '', 'NULL', 1),
(117, 3, 3, '', '2020-08-23 12:35:22', '2020-08-23 12:35:22', '', 'multiplechoice', 'third question', 'choose this', 'this too', 'dont', 'yes', 'obvious', 'NULL', 0),
(118, 4, 3, '', '2020-08-23 12:35:22', '2020-08-23 12:35:22', '', 'rating', 'rate my system', '', '', '', '', '', 'NULL', 0),
(119, 5, 3, '', '2020-08-23 12:35:22', '2020-08-23 12:35:22', '5', 'linearscale', 'same as radio', 'heeyyyy', 'good', 'bad', 'excel', 'kkk', 'NULL', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_id` int(100) NOT NULL,
  `User_email` varchar(255) NOT NULL,
  `User_password` varchar(255) NOT NULL,
  `Role` varchar(100) NOT NULL,
  `Mentor` varchar(255) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Year` varchar(255) NOT NULL,
  `Division` varchar(16) NOT NULL,
  `Details_id` int(16) NOT NULL,
  `Password_id` int(16) NOT NULL,
  `DELETED` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_id`, `User_email`, `User_password`, `Role`, `Mentor`, `Department`, `Year`, `Division`, `Details_id`, `Password_id`, `DELETED`) VALUES
(1, 'aniketkumar.singh@sakec.ac.in', '345678901', 'Student', 'Mr. Lukesh kadu', 'CM', 'TE', '4', 3, 3, 0),
(2, 'jayatripathi@gmail.com', '123456789', 'Student', 'Ms. Ashwini Deshmukh', 'IT', 'BE', '6', 4, 4, 0),
(3, 'nidhi@gmailcom', '123456789', 'Student', 'Ms. Nilakshi', 'CM', 'TE', '4', 7, 7, 0),
(4, 'pooja.tripathi@sakec.ac.in', '234567890', 'Student', 'Ms. Nilakshi Jain', 'IT', 'BE', '6', 2, 2, 0),
(5, 'prateek.manta@sakec.ac.in', '123456789', 'Student', 'Ms. Pramila Shinde', 'IT', 'BE', '6', 1, 1, 0),
(6, 'pramila@gmail.com', '123456789', 'Teacher', '', 'ETRX', '', '', 9, 9, 0),
(7, 'rohit_tripathi@gmail.com', '123456789', 'Student', 'Ms. Shwetambari Pawar', 'IT', 'BE', '6', 5, 5, 0),
(8, 'sanchi@gmail.com', '123456789', 'Teacher', '', 'EXTC', '', '', 6, 6, 0),
(9, 'shreya@gmail.com', '123456789', 'Student', 'Mr. Lukesh KAdu', 'ETRX', 'SE', '2', 8, 8, 0),
(10, 'shwetambari@gmail.com', '123456789', 'Teacher', '', 'EXTC', '', '', 10, 10, 0);

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
  `DELETED` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`Details_id`, `First_name`, `Middle_name`, `Last_name`, `Phone`, `created_on`, `updated_on`, `DELETED`) VALUES
(1, 'Prateek', 'Prakash', 'Manta', 9923433423, '2020-05-31 10:57:25', '2020-07-17 12:56:10', 0),
(2, 'Pooja', 'Jitendra', 'Tripathi', 9829342232, '2020-05-31 10:58:43', '2020-07-17 12:56:16', 0),
(3, 'Aniket', 'Kumar', 'Singh', 8934982332, '2020-06-09 05:31:21', '2020-07-17 12:56:24', 0),
(4, 'Jaya', 'Jitendra', 'Tripathi', 9653118977, '2020-07-11 08:08:06', '2020-07-17 12:56:29', 0),
(5, 'Rohit', 'Jitendra', 'Tripathi', 123456, '2020-07-17 12:30:33', '2020-07-17 12:56:41', 0),
(6, 'Sanchi', 'sunil', 'Tiwari', 7891011, '2020-07-17 12:32:51', '2020-07-17 12:56:47', 0),
(7, 'Nidhi', 'Neeraj', 'Tiwari', 932308, '2020-07-17 12:37:48', '2020-07-17 12:56:53', 0),
(8, 'Shreya', 'Anil', 'Mishra', 1234654, '2020-07-17 12:38:20', '2020-07-17 12:57:00', 0),
(9, 'Pramila', '--', 'Shinde', 54654, '2020-07-17 12:38:51', '2020-07-17 12:57:12', 0),
(10, 'Shwetambari', '--', 'Pawar', 165465123, '2020-07-17 12:39:54', '2020-07-17 12:57:21', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_form_access`
--

CREATE TABLE `user_form_access` (
  `auto_increment` int(16) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `F_id` int(16) NOT NULL,
  `Form_code` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_password`
--

CREATE TABLE `user_password` (
  `Password_id` int(16) NOT NULL,
  `password` varchar(255) NOT NULL,
  `re_enter_password` varchar(255) NOT NULL,
  `Details_id` int(16) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `DELETED` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_password`
--

INSERT INTO `user_password` (`Password_id`, `password`, `re_enter_password`, `Details_id`, `created_on`, `updated_on`, `DELETED`) VALUES
(1, '123456789', '123456789', 1, '2020-05-31 11:01:18', '2020-07-17 12:44:23', 0),
(2, '234567890', '234567890', 2, '2020-06-09 05:22:32', '2020-07-17 12:44:39', 0),
(3, '345678901', '345678901', 3, '2020-06-09 05:23:30', '2020-07-17 12:44:46', 0),
(4, 'engineer', 'engineer', 4, '2020-07-11 08:09:15', '2020-07-17 12:44:52', 0),
(5, 'square', 'square', 5, '2020-07-17 12:47:43', '2020-07-18 08:56:01', 0),
(6, 'circle', 'circle', 6, '2020-07-17 12:48:47', '2020-07-18 08:56:16', 0),
(7, 'nidhi', 'nidhi', 7, '2020-07-17 12:49:54', '2020-07-17 12:49:54', 0),
(8, 'shreya', 'shreya', 8, '2020-07-17 12:49:54', '2020-07-17 12:49:54', 0),
(9, 'pramila', 'pramila', 9, '2020-07-17 12:52:04', '2020-07-17 12:52:04', 0),
(10, 'shwetambari', 'shwetambari', 10, '2020-07-17 12:52:04', '2020-07-17 12:52:04', 0),
(11, 'hexagon', 'hexagon', 11, '2020-07-18 08:53:03', '2020-07-18 08:53:03', 0);

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
  ADD KEY `Admin_email` (`Admin_email`),
  ADD KEY `Admin_id` (`Admin_id`),
  ADD KEY `Admin_id_2` (`Admin_id`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`Ans_id`),
  ADD KEY `User _email` (`User_email`),
  ADD KEY `Q_id` (`Q_id`);

--
-- Indexes for table `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`F_id`),
  ADD KEY `f_id` (`F_id`),
  ADD KEY `Admin_id` (`Admin_id`),
  ADD KEY `form_ibfk_2` (`Admin_email`),
  ADD KEY `F_id_2` (`F_id`),
  ADD KEY `Form_code` (`Form_code`);

--
-- Indexes for table `form_allotment`
--
ALTER TABLE `form_allotment`
  ADD PRIMARY KEY (`form_allotment_id`),
  ADD KEY `F_id` (`F_id`),
  ADD KEY `Admin_id` (`Admin_id`),
  ADD KEY `Admin_email` (`Admin_email`);

--
-- Indexes for table `publish_details`
--
ALTER TABLE `publish_details`
  ADD PRIMARY KEY (`Form_details`),
  ADD KEY `F_id1` (`F_id`);

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
  ADD KEY `User _email` (`User_email`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`Details_id`);

--
-- Indexes for table `user_form_access`
--
ALTER TABLE `user_form_access`
  ADD PRIMARY KEY (`auto_increment`),
  ADD KEY `form_availability` (`F_id`),
  ADD KEY `user_email` (`user_email`),
  ADD KEY `Form_code` (`Form_code`);

--
-- Indexes for table `user_password`
--
ALTER TABLE `user_password`
  ADD PRIMARY KEY (`Password_id`),
  ADD KEY `Details_id` (`Details_id`);

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
  MODIFY `Ans_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `form`
--
ALTER TABLE `form`
  MODIFY `F_id` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_allotment`
--
ALTER TABLE `form_allotment`
  MODIFY `form_allotment_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `publish_details`
--
ALTER TABLE `publish_details`
  MODIFY `Form_details` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `Q_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `User_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `Details_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_form_access`
--
ALTER TABLE `user_form_access`
  MODIFY `auto_increment` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_password`
--
ALTER TABLE `user_password`
  MODIFY `Password_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1262240;

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
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_3` FOREIGN KEY (`User_email`) REFERENCES `user` (`User_email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_5` FOREIGN KEY (`Q_id`) REFERENCES `questions` (`Q_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `form`
--
ALTER TABLE `form`
  ADD CONSTRAINT `form_ibfk_1` FOREIGN KEY (`Admin_id`) REFERENCES `admin_credentials` (`Admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `form_ibfk_2` FOREIGN KEY (`Admin_email`) REFERENCES `admin_credentials` (`Admin_email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `publish_details`
--
ALTER TABLE `publish_details`
  ADD CONSTRAINT `publish_details_ibfk_1` FOREIGN KEY (`F_id`) REFERENCES `form` (`F_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_form_access`
--
ALTER TABLE `user_form_access`
  ADD CONSTRAINT `user_form_access_ibfk_1` FOREIGN KEY (`Form_code`) REFERENCES `form` (`Form_code`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
