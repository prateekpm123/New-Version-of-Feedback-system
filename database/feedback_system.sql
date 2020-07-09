-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2020 at 03:35 PM
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
-- Database: `feedback_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

CREATE TABLE `access` (
  `Access_id` int(16) NOT NULL,
  `F_id` int(16) NOT NULL,
  `Admin_id` varchar(64) NOT NULL,
  `access_giver` varchar(255) NOT NULL,
  `access_receiver` varchar(255) NOT NULL,
  `priviliges` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `DELETED` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `access`
--

INSERT INTO `access` (`Access_id`, `F_id`, `Admin_id`, `access_giver`, `access_receiver`, `priviliges`, `created_on`, `updated_on`, `DELETED`) VALUES
(1, 2, 'PRA', 'prateek.manta@sakec.ac.in', 'pooja.tripathi@sakec.ac.in', 'edit', '2020-06-09 05:19:34', '2020-06-09 05:34:57', 0),
(2, 3, 'PRA', 'prateek.manta@sakec.ac.in', 'pooja.tripathi@sakec.ac.in', 'edit', '2020-06-09 05:36:18', '2020-06-09 05:36:18', 0),
(3, 1, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-06-09 15:41:05', '2020-06-09 15:41:05', 0),
(4, 3, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-06-09 15:44:01', '2020-06-09 15:44:01', 0),
(5, 4, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-06-09 15:44:01', '2020-06-09 15:44:01', 0),
(6, 5, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-06-09 15:44:46', '2020-06-09 15:44:46', 0),
(7, 6, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-06-09 15:44:46', '2020-06-09 15:44:46', 0),
(8, 7, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-06-09 15:45:29', '2020-06-09 15:45:29', 0),
(9, 8, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-06-09 15:45:29', '2020-06-09 15:45:29', 0),
(10, 9, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-06-09 15:45:53', '2020-06-09 15:45:53', 0),
(11, 2, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-06-09 15:47:04', '2020-06-09 15:47:04', 0),
(12, 24, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-07-09 12:18:12', '2020-07-09 12:18:12', 0),
(16, 33, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-07-09 12:34:55', '2020-07-09 12:34:55', 0),
(17, 34, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-07-09 12:35:27', '2020-07-09 12:35:27', 0),
(18, 35, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-07-09 12:35:44', '2020-07-09 12:35:44', 0),
(19, 56, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-07-09 12:46:16', '2020-07-09 12:46:16', 0),
(20, 57, 'PRA', 'pooja.tripathi@sakec.ac.in', 'pooja.tripathi@sakec.ac.in', 'master', '2020-07-09 12:46:34', '2020-07-09 12:46:34', 0),
(21, 58, 'PRA', 'pooja.tripathi@sakec.ac.in', 'pooja.tripathi@sakec.ac.in', 'master', '2020-07-09 13:11:16', '2020-07-09 13:11:16', 0),
(22, 59, 'PRA', 'pooja.tripathi@sakec.ac.in', 'pooja.tripathi@sakec.ac.in', 'master', '2020-07-09 13:32:43', '2020-07-09 13:32:43', 0),
(23, 60, 'PRA', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'master', '2020-07-09 13:33:29', '2020-07-09 13:33:29', 0),
(24, 61, 'PRA', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'master', '2020-07-09 13:33:39', '2020-07-09 13:33:39', 0);

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
(3, 'ANI', 'aniket', 'aniketkumar.singh@sakec.ac.in', '2020-06-09 05:33:52', '2020-06-09 05:33:52', '345678901', '345678901', 3, 0),
(2, 'POO', 'Pooja', 'pooja.tripathi@sakec.ac.in', '2020-06-09 05:28:51', '2020-06-09 05:28:51', '234567890', '234567890', 2, 0),
(1, 'PRA', 'Prateek', 'prateek.manta@sakec.ac.in', '2020-05-31 11:04:35', '2020-06-09 05:29:16', '123456789', '123456789', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `admin_form_access`
--

CREATE TABLE `admin_form_access` (
  `Admin_form_id` int(16) NOT NULL,
  `Access_id` int(16) NOT NULL,
  `F_id` int(16) NOT NULL,
  `Admin_id` varchar(64) NOT NULL,
  `DELETED` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_form_access`
--

INSERT INTO `admin_form_access` (`Admin_form_id`, `Access_id`, `F_id`, `Admin_id`, `DELETED`) VALUES
(3, 1, 2, 'PRA', 0),
(4, 2, 3, 'PRA', 0),
(5, 3, 1, 'PRA', 0),
(6, 4, 3, 'PRA', 0),
(7, 5, 4, 'PRA', 0),
(8, 6, 5, 'PRA', 0),
(9, 7, 6, 'PRA', 0),
(10, 8, 7, 'PRA', 0),
(11, 9, 8, 'PRA', 0),
(12, 10, 9, 'PRA', 0),
(13, 11, 2, 'PRA', 0);

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `Ans_id` int(16) NOT NULL,
  `F_id` int(16) NOT NULL,
  `User_id` varchar(64) NOT NULL,
  `Q_no` int(16) NOT NULL,
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

INSERT INTO `form` (`F_id`, `Admin_id`, `Form_name`, `Form_version`, `Form_Desc`, `created_on`, `updated_on`, `Form_details`, `DELETED`) VALUES
(1, 'PRA', 'TEst form 1', '1', '', '2020-06-07 14:37:55', '2020-06-08 06:16:00', 1, 0),
(2, 'PRA', 'TEst form 2', '1', '', '2020-06-07 14:39:16', '2020-06-07 14:39:16', 1, 0),
(3, 'PRA', 'TEst form 2', '2', '', '2020-06-07 14:41:46', '2020-06-07 14:41:46', 1, 0),
(4, 'PRA', 'TEst form 2', '3', '', '2020-06-07 14:41:46', '2020-06-07 14:41:46', 1, 0),
(5, 'PRA', 'TEst form 2', '4', '', '2020-06-07 14:41:46', '2020-06-07 14:41:46', 1, 0),
(6, 'PRA', 'TEst form 3', '1', '', '2020-06-07 14:41:46', '2020-06-07 14:41:46', 1, 0),
(7, 'PRA', 'TEst form 3', '2', '', '2020-06-07 14:41:46', '2020-06-07 14:41:46', 1, 0),
(8, 'PRA', 'TEst form 3', '3', '', '2020-06-07 14:41:47', '2020-06-07 14:41:47', 1, 0),
(9, 'PRA', 'TEst form 4', '1', '', '2020-06-07 14:41:47', '2020-06-07 14:41:47', 1, 0),
(10, 'PRA', 'TEacher form', '1', '', '2020-07-06 10:33:28', '2020-07-06 10:33:28', 1, 0),
(11, 'PRA', 'just testing', '1', 'nothing much', '2020-07-09 07:44:47', '2020-07-09 07:44:47', 1, 0),
(21, 'PRA', 'asfdas', '1', 'fdasfd', '2020-07-09 12:01:50', '2020-07-09 12:01:50', 1, 0),
(22, 'PRA', 'prateek\'s testing', '1', '', '2020-07-09 12:02:33', '2020-07-09 12:02:33', 1, 0),
(23, 'PRA', 'asdfasf', '1', 'asdfas', '2020-07-09 12:04:46', '2020-07-09 12:04:46', 1, 0),
(24, 'PRA', 'Pratee\'s testing form', '1', 'Delete after using it ', '2020-07-09 12:05:32', '2020-07-09 12:05:32', 1, 0),
(25, 'PRA', 'asfasf', '1', 'asdfa', '2020-07-09 12:24:56', '2020-07-09 12:24:56', 1, 0),
(26, 'PRA', 'asdfasf', '1', 'asdf', '2020-07-09 12:25:50', '2020-07-09 12:25:50', 1, 0),
(27, 'PRA', 'asdfasf', '1', 'asdf', '2020-07-09 12:25:51', '2020-07-09 12:25:51', 1, 0),
(28, 'PRA', 'aasdf', '1', 'asdf', '2020-07-09 12:26:42', '2020-07-09 12:26:42', 1, 0),
(29, 'PRA', 'asdfas', '1', 'asdf', '2020-07-09 12:27:43', '2020-07-09 12:27:43', 1, 0),
(30, 'PRA', 'asdfas', '1', 'asf', '2020-07-09 12:28:35', '2020-07-09 12:28:35', 1, 0),
(31, 'PRA', 'testing', '1', 'nothing', '2020-07-09 12:33:27', '2020-07-09 12:33:27', 1, 0),
(32, 'PRA', 'testing', '1', 'nothing', '2020-07-09 12:34:06', '2020-07-09 12:34:06', 1, 0),
(33, 'PRA', 'testing', '1', 'nothing', '2020-07-09 12:34:55', '2020-07-09 12:34:55', 1, 0),
(34, 'PRA', 'asdfa', '1', 'notty', '2020-07-09 12:35:27', '2020-07-09 12:35:27', 1, 0),
(35, 'PRA', 'lets have a test bro', '1', '', '2020-07-09 12:35:44', '2020-07-09 12:35:44', 1, 0),
(36, 'PRA', '1', '1', 'nothing', '2020-07-09 12:38:50', '2020-07-09 12:38:50', 1, 0),
(37, 'PRA', '1', '1', 'nothing', '2020-07-09 12:39:43', '2020-07-09 12:39:43', 1, 0),
(38, 'PRA', '1', '1', 'nothing', '2020-07-09 12:39:44', '2020-07-09 12:39:44', 1, 0),
(39, 'PRA', '1', '1', 'nothing', '2020-07-09 12:42:20', '2020-07-09 12:42:20', 1, 0),
(40, 'PRA', '1', '1', 'nothing', '2020-07-09 12:42:33', '2020-07-09 12:42:33', 1, 0),
(41, 'PRA', '1', '1', 'nothing', '2020-07-09 12:42:38', '2020-07-09 12:42:38', 1, 0),
(42, 'PRA', 'asdfasf', '1', 'asdfasf', '2020-07-09 12:42:38', '2020-07-09 12:42:38', 1, 0),
(43, 'PRA', '1', '1', 'nothing', '2020-07-09 12:42:38', '2020-07-09 12:42:38', 1, 0),
(44, 'PRA', '1', '1', 'nothing', '2020-07-09 12:43:19', '2020-07-09 12:43:19', 1, 0),
(45, 'PRA', '1', '1', 'nothing', '2020-07-09 12:43:35', '2020-07-09 12:43:35', 1, 0),
(46, 'PRA', '1', '1', 'nothing', '2020-07-09 12:43:39', '2020-07-09 12:43:39', 1, 0),
(47, 'PRA', '1', '1', 'nothing', '2020-07-09 12:43:39', '2020-07-09 12:43:39', 1, 0),
(48, 'PRA', '1', '1', 'nothing', '2020-07-09 12:43:47', '2020-07-09 12:43:47', 1, 0),
(49, 'PRA', '1', '1', 'nothing', '2020-07-09 12:43:48', '2020-07-09 12:43:48', 1, 0),
(50, 'PRA', '1', '1', 'nothing', '2020-07-09 12:43:48', '2020-07-09 12:43:48', 1, 0),
(51, 'PRA', '1', '1', 'nothing', '2020-07-09 12:43:49', '2020-07-09 12:43:49', 1, 0),
(52, 'PRA', '1', '1', 'nothing', '2020-07-09 12:43:49', '2020-07-09 12:43:49', 1, 0),
(53, 'PRA', '1', '1', 'nothing', '2020-07-09 12:43:49', '2020-07-09 12:43:49', 1, 0),
(54, 'PRA', 'A new form for me', '1', 'testing', '2020-07-09 12:44:20', '2020-07-09 12:44:20', 1, 0),
(55, 'PRA', 'meow mewo ', '1', 'meow mewo', '2020-07-09 12:45:20', '2020-07-09 12:45:20', 1, 0),
(56, 'PRA', 'tesing bro', '1', 'kjasd;lfk', '2020-07-09 12:46:16', '2020-07-09 12:46:16', 1, 0),
(57, 'PRA', 'meow moew meow', '1', 'meow', '2020-07-09 12:46:33', '2020-07-09 12:46:33', 1, 0),
(58, 'PRA', 'Lets have a look', '1', '', '2020-07-09 13:11:15', '2020-07-09 13:11:15', 1, 0),
(59, 'PRA', 'Pooja\'s form', '1', '', '2020-07-09 13:32:43', '2020-07-09 13:32:43', 1, 0),
(60, 'PRA', 'Aniket\'s form', '1', 'nothign', '2020-07-09 13:33:29', '2020-07-09 13:33:29', 1, 0),
(61, 'PRA', 'Aniket\'s form 2', '1', 'nothig 3', '2020-07-09 13:33:39', '2020-07-09 13:33:39', 1, 0);

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
(1, '20', '2020-06-23', 'Prateek', 'Master', 0);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `Q_id` int(16) NOT NULL,
  `Q_no` int(16) NOT NULL,
  `F_id` int(16) NOT NULL,
  `Breakpoints` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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

INSERT INTO `questions` (`Q_id`, `Q_no`, `F_id`, `Breakpoints`, `created_on`, `updated_on`, `type`, `Question_desc`, `Option1`, `Option2`, `Option3`, `Option4`, `Option5`, `Default_Option`, `DELETED`) VALUES
(1, 1, 1, '', '2020-07-06 10:53:49', '2020-07-08 10:55:07', '', 'Lets see what do we have here', 'nothing much', 'lset have look', 'lets not see muhc', '3', 'asdfNULL', 'asfas', 1),
(2, 2, 1, '', '2020-07-06 10:54:39', '2020-07-08 10:55:08', '', 'Lets see what do we have here', 'nothing much', 'lset have look', 'lets not see muhc', '3', 'asdfNULL', 'asfas', 1),
(3, 3, 1, '', '2020-07-06 10:54:39', '2020-07-08 10:55:10', '', 'Lets see what do we have here', 'nothing much', 'lset have look', 'lets not see muhc', '3', 'asdfNULL', 'asfas', 1),
(4, 4, 1, '', '2020-07-06 10:54:39', '2020-07-08 10:55:13', '', 'Lets see what do we have here', 'nothing much', 'lset have look', 'lets not see muhc', '3', 'asdfNULL', 'asfas', 1),
(5, 5, 1, '', '2020-07-06 10:54:39', '2020-07-08 10:55:44', '', 'Lets see what do we have here', 'nothing much', 'lset have look', 'lets not see muhc', '3', 'asdfNULL', 'asfas', 1),
(7, 1, 2, '', '2020-07-06 11:03:11', '2020-07-08 13:50:15', '', 'Which is your favourite anime ?', 'Naruto ', 'One piece', 'Bleach', 'NULL', 'NULL', 'NULL', 0),
(8, 2, 2, '', '2020-07-06 11:04:46', '2020-07-08 13:50:19', '', 'Which your favourite character', 'Lucy', 'Elizabeth', 'Alice', 'Erina', 'Asuna', 'NULL', 0),
(9, 3, 2, '', '2020-07-06 11:05:25', '2020-07-08 10:55:48', '', 'Which your favourite character', 'Lucy', 'Elizabeth', 'Alice', 'Erina', 'Asuna', 'NULL', 1),
(10, 4, 2, '', '2020-07-06 11:05:26', '2020-07-08 10:55:50', '', 'Which your favourite character', 'Lucy', 'Elizabeth', 'Alice', 'Erina', 'Asuna', 'NULL', 1),
(11, 5, 2, '', '2020-07-06 11:05:26', '2020-07-08 10:52:58', '', 'Which your favourite character', 'Lucy', 'Elizabeth', 'Alice', 'Erina', 'Asuna', 'NULL', 1),
(12, 6, 2, '', '2020-07-06 11:05:26', '2020-07-08 10:55:52', '', 'Which your favourite character', 'Lucy', 'Elizabeth', 'Alice', 'Erina', 'Asuna', 'NULL', 1),
(13, 7, 2, '', '2020-07-06 11:05:26', '2020-07-08 10:56:37', '', 'Which your favourite character', 'Lucy', 'Elizabeth', 'Alice', 'Erina', 'Asuna', 'NULL', 1),
(21, 0, 1, '', '2020-07-08 10:48:24', '2020-07-08 10:53:06', 'radio', 'asdfasf', 'asdf', 'asdf', 'asdf', 'asdfasdf', 'asfd', 'NULL', 1),
(22, 0, 1, '', '2020-07-08 10:48:47', '2020-07-08 10:48:47', 'text', 'asdfasdfsf', '', '', '', '', '', 'NULL', 0),
(23, 0, 1, '', '2020-07-08 10:56:10', '2020-07-08 12:30:59', 'text', 'Just to test how are how are you doing ?', '', '', '', '', '', 'NULL', 1),
(24, 0, 1, '', '2020-07-08 10:57:20', '2020-07-08 10:57:20', 'radio', 'Who you wanna make you waifu', 'Lucy ', 'Elizabeth', 'Alice', 'Erina', '', 'NULL', 0),
(25, 0, 1, '', '2020-07-08 12:30:53', '2020-07-09 08:11:33', 'text', 'test', '', '', '', '', '', 'NULL', 1),
(26, 0, 1, '', '2020-07-08 12:33:20', '2020-07-09 10:47:00', 'multiplechoice', 'rest', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', 'NULL', 1),
(27, 0, 1, '', '2020-07-08 13:55:41', '2020-07-09 10:48:15', 'radio', 'Tell me what music you like to listen', 'romantic', 'emotional', 'anime', 'etc ', 'erc', 'NULL', 0),
(28, 0, 3, '', '2020-07-08 13:56:52', '2020-07-08 13:58:04', 'radio', 'asdfasfasf', 'asdf', 'asdfas', 'asdf', 'asdf', 'asdf', 'NULL', 1),
(29, 0, 10, '', '2020-07-08 14:01:55', '2020-07-08 14:01:55', 'radio', 'What is your favorite character ?', 'Lucy', 'Elizabeth', 'Erza', 'lajs', 'laksjdfas', 'NULL', 0),
(30, 0, 5, '', '2020-07-08 18:08:19', '2020-07-08 18:08:26', 'radio', 'asdfasfas', 'asfasf', 'asdfaf', 'asdf', 'assfda', 'asdfasasdfasf', 'NULL', 0),
(31, 0, 5, '', '2020-07-08 18:08:30', '2020-07-08 18:08:34', 'radio', 'asdfasfd', 'asdfa', '', 'sdfasdf', 'asdfasfasfdafda', 'aasd', 'NULL', 0),
(32, 0, 5, '', '2020-07-08 18:08:47', '2020-07-08 18:08:47', 'radio', 'asdfasfd', 'asfas', 'asdf', 'asdfasdf', 'asdfasdf', 'asdfas', 'NULL', 0),
(33, 0, 11, '', '2020-07-09 07:45:14', '2020-07-09 07:45:14', 'radio', 'just a trial run nothing special', 'testin ', 'lksdj;a', ';laksjdf', 'asfljk', 'q;lskdjf', 'NULL', 0),
(34, 0, 11, '', '2020-07-09 07:45:25', '2020-07-09 07:45:25', 'text', 'let have a look', '', '', '', '', '', 'NULL', 0),
(35, 0, 1, '', '2020-07-09 08:10:26', '2020-07-09 10:47:04', 'text', 'I want to see how many of you are listening', '', '', '', '', '', 'NULL', 1),
(36, 0, 1, '', '2020-07-09 08:11:23', '2020-07-09 08:11:40', 'multiplechoice', 'Which are your choices', 'masters', 'mtech', 'Job', 'tour aroung and explore', 'take a break', 'NULL', 1),
(37, 0, 4, '', '2020-07-09 08:12:20', '2020-07-09 08:12:20', 'text', 'What is your name', '', '', '', '', '', 'NULL', 0),
(38, 0, 4, '', '2020-07-09 08:12:56', '2020-07-09 08:12:56', 'radio', 'What are your optiona', 'I dont know ', 'lets figure it our', 'not interseted', 'many more ', 'etc', 'NULL', 0),
(39, 0, 1, '', '2020-07-09 10:46:50', '2020-07-09 10:47:12', 'radio', 'Tell me how much you love me ?', 'Very much', 'Very very muvh', 'very x 100 much', 'very x 100000 much ', 'very x infinity', 'NULL', 1),
(40, 0, 4, '', '2020-07-09 10:51:52', '2020-07-09 10:53:13', 'multiplechoice', 'tt', 'lala', 'lulu', 'momo', 'dd', 'coco', 'NULL', 1),
(41, 0, 4, '', '2020-07-09 10:52:16', '2020-07-09 10:52:16', 'radio', 'cats', 'sona', 'kitty', '', '', '', 'NULL', 0),
(42, 0, 4, '', '2020-07-09 10:52:40', '2020-07-09 10:53:06', 'text', 'ANSWER', '', '', '', '', '', 'NULL', 1),
(43, 0, 6, '', '2020-07-09 10:56:11', '2020-07-09 10:56:11', 'text', 'testyb', '', '', '', '', '', 'NULL', 0),
(44, 0, 6, '', '2020-07-09 10:56:21', '2020-07-09 10:56:42', 'text', 'What are your thoughts', '', '', '', '', '', 'NULL', 0),
(45, 0, 6, '', '2020-07-09 10:56:30', '2020-07-09 10:56:30', 'text', 'nothing much', '', '', '', '', '', 'NULL', 0),
(46, 0, 6, '', '2020-07-09 10:56:36', '2020-07-09 10:56:36', 'text', 'nothing much', '', '', '', '', '', 'NULL', 0),
(47, 0, 58, '', '2020-07-09 13:11:40', '2020-07-09 13:11:40', 'text', 'There is nothing much that you can do now can you', '', '', '', '', '', 'NULL', 0);

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
(3, 'Aniket', 'Kumar', 'Singh', 8934982332, '2020-06-09 05:31:21', '2020-06-09 05:31:21', 0);

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
(3, '345678901', '345678901', '2020-06-09 05:23:30', '2020-06-09 05:24:43', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access`
--
ALTER TABLE `access`
  ADD PRIMARY KEY (`Access_id`),
  ADD KEY `F_id` (`F_id`),
  ADD KEY `Admin_id` (`Admin_id`);

--
-- Indexes for table `admin_credentials`
--
ALTER TABLE `admin_credentials`
  ADD PRIMARY KEY (`Admin_id`),
  ADD KEY `a_id` (`A_id`),
  ADD KEY `u_id` (`U_id`);

--
-- Indexes for table `admin_form_access`
--
ALTER TABLE `admin_form_access`
  ADD PRIMARY KEY (`Admin_form_id`),
  ADD KEY `Access_id` (`Access_id`),
  ADD KEY `Admin_id` (`Admin_id`),
  ADD KEY `Form_id` (`F_id`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`Ans_id`),
  ADD KEY `F_id` (`F_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Q_no` (`Q_no`);

--
-- Indexes for table `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`F_id`),
  ADD KEY `f_id` (`F_id`),
  ADD KEY `Admin_id` (`Admin_id`),
  ADD KEY `Form_details` (`Form_details`);

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
  ADD KEY `Q_id` (`Q_id`),
  ADD KEY `FOREIGN KEY` (`F_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `details_id` (`Details_id`),
  ADD KEY `password_id` (`Password_id`),
  ADD KEY `u_id` (`U_id`);

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
  MODIFY `Access_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `admin_credentials`
--
ALTER TABLE `admin_credentials`
  MODIFY `A_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_form_access`
--
ALTER TABLE `admin_form_access`
  MODIFY `Admin_form_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `Ans_id` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form`
--
ALTER TABLE `form`
  MODIFY `F_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `form_details`
--
ALTER TABLE `form_details`
  MODIFY `Form_details` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `Q_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `U_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `Details_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  ADD CONSTRAINT `access_ibfk_1` FOREIGN KEY (`F_id`) REFERENCES `form` (`F_id`),
  ADD CONSTRAINT `access_ibfk_2` FOREIGN KEY (`Admin_id`) REFERENCES `form` (`Admin_id`);

--
-- Constraints for table `admin_credentials`
--
ALTER TABLE `admin_credentials`
  ADD CONSTRAINT `admin_credentials_ibfk_1` FOREIGN KEY (`U_id`) REFERENCES `user` (`U_id`);

--
-- Constraints for table `admin_form_access`
--
ALTER TABLE `admin_form_access`
  ADD CONSTRAINT `admin_form_access_ibfk_1` FOREIGN KEY (`Access_id`) REFERENCES `access` (`Access_id`),
  ADD CONSTRAINT `admin_form_access_ibfk_2` FOREIGN KEY (`F_id`) REFERENCES `access` (`F_id`),
  ADD CONSTRAINT `admin_form_access_ibfk_3` FOREIGN KEY (`Admin_id`) REFERENCES `access` (`Admin_id`);

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`F_id`) REFERENCES `form` (`F_id`),
  ADD CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`),
  ADD CONSTRAINT `answers_ibfk_3` FOREIGN KEY (`Q_no`) REFERENCES `questions` (`Q_no`);

--
-- Constraints for table `form`
--
ALTER TABLE `form`
  ADD CONSTRAINT `form_ibfk_1` FOREIGN KEY (`Admin_id`) REFERENCES `admin_credentials` (`Admin_id`),
  ADD CONSTRAINT `form_ibfk_2` FOREIGN KEY (`Form_details`) REFERENCES `form_details` (`Form_details`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`F_id`) REFERENCES `form` (`F_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`Details_id`) REFERENCES `user_details` (`Details_id`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`Password_id`) REFERENCES `user_password` (`Password_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
