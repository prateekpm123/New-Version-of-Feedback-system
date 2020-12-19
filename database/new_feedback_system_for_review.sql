-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2020 at 11:13 AM
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
  `F_id` int(20) NOT NULL,
  `Q_id` int(100) NOT NULL,
  `Answer_desc` varchar(10000) NOT NULL,
  `Ans_recorded` timestamp NOT NULL DEFAULT current_timestamp(),
  `DELETED` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`Ans_id`, `User_email`, `F_id`, `Q_id`, `Answer_desc`, `Ans_recorded`, `DELETED`) VALUES
(1, 'aniketkumar.singh@sakec.ac.in', 1, 1, 'Excellent', '2020-10-29 07:15:43', 0),
(2, 'aniketkumar.singh@sakec.ac.in', 1, 2, '40-60', '2020-10-29 07:15:44', 0),
(3, 'aniketkumar.singh@sakec.ac.in', 1, 3, '5', '2020-10-29 07:15:46', 0),
(4, 'aniketkumar.singh@sakec.ac.in', 1, 4, 'Data Structures and Algorithms,DBMS,Internet Programming', '2020-10-29 07:15:48', 0),
(5, 'aniketkumar.singh@sakec.ac.in', 1, 5, 'Good', '2020-10-29 07:15:52', 0),
(6, 'prateek.manta@sakec.ac.in', 5, 12, '3', '2020-12-19 09:41:19', 0),
(7, 'prateek.manta@sakec.ac.in', 5, 13, 'Zimba', '2020-12-19 09:41:25', 0),
(8, 'prateek.manta@sakec.ac.in', 5, 19, 'Watch Anime', '2020-12-19 09:41:33', 0),
(9, 'prateek.manta@sakec.ac.in', 5, 20, 'Nowhere', '2020-12-19 09:41:45', 0),
(10, 'prateek.manta@sakec.ac.in', 5, 21, 'Mango,Apple ,Banana', '2020-12-19 09:44:51', 0),
(11, 'prateek.manta@sakec.ac.in', 5, 22, 'Cats', '2020-12-19 09:44:57', 0),
(12, 'prateek.manta@sakec.ac.in', 5, 23, 'Yes', '2020-12-19 09:45:03', 0),
(13, 'pooja.tripathi@sakec.ac.in', 5, 12, '2', '2020-12-19 09:46:02', 0),
(14, 'pooja.tripathi@sakec.ac.in', 5, 13, 'Pooja', '2020-12-19 09:46:09', 0),
(15, 'pooja.tripathi@sakec.ac.in', 5, 19, 'Some stuffs', '2020-12-19 09:46:14', 0),
(16, 'pooja.tripathi@sakec.ac.in', 5, 20, 'some where nice', '2020-12-19 09:46:27', 0),
(17, 'pooja.tripathi@sakec.ac.in', 5, 21, 'Apple ', '2020-12-19 09:47:54', 0),
(18, 'pooja.tripathi@sakec.ac.in', 5, 22, 'Dogs,Cats', '2020-12-19 09:47:57', 0),
(19, 'pooja.tripathi@sakec.ac.in', 5, 23, 'Yes', '2020-12-19 09:47:59', 0),
(20, 'aniketkumar.singh@sakec.ac.in', 5, 12, '5', '2020-12-19 09:49:21', 0),
(21, 'aniketkumar.singh@sakec.ac.in', 5, 13, 'Aniket', '2020-12-19 09:49:24', 0),
(22, 'aniketkumar.singh@sakec.ac.in', 5, 19, 'Nothing much', '2020-12-19 09:49:29', 0),
(23, 'aniketkumar.singh@sakec.ac.in', 5, 20, 'Gotta check', '2020-12-19 09:49:38', 0),
(24, 'aniketkumar.singh@sakec.ac.in', 5, 21, 'Pineapple ', '2020-12-19 09:49:39', 0),
(25, 'aniketkumar.singh@sakec.ac.in', 5, 22, 'Girrafe,Camel', '2020-12-19 09:49:41', 0),
(26, 'aniketkumar.singh@sakec.ac.in', 5, 23, 'Yes', '2020-12-19 09:49:44', 0),
(27, 'rishab.shetty@sakec.ac.in', 5, 12, '4', '2020-12-19 09:50:19', 0),
(28, 'rishab.shetty@sakec.ac.in', 5, 13, 'Rishab', '2020-12-19 09:50:26', 0),
(29, 'rishab.shetty@sakec.ac.in', 5, 19, 'NOhting much', '2020-12-19 09:50:32', 0),
(30, 'rishab.shetty@sakec.ac.in', 5, 20, 'One piece', '2020-12-19 09:50:44', 0),
(31, 'rishab.shetty@sakec.ac.in', 5, 21, 'kiwi', '2020-12-19 09:50:46', 0),
(32, 'rishab.shetty@sakec.ac.in', 5, 22, 'Tiger', '2020-12-19 09:50:51', 0),
(33, 'rishab.shetty@sakec.ac.in', 5, 23, 'No', '2020-12-19 09:50:53', 0),
(34, 'pramila@sakec.ac.in', 5, 12, '4', '2020-12-19 09:51:18', 0),
(35, 'pramila@sakec.ac.in', 5, 13, 'Pramila', '2020-12-19 09:51:21', 0),
(36, 'pramila@sakec.ac.in', 5, 19, 'dont know', '2020-12-19 09:51:25', 0),
(37, 'pramila@sakec.ac.in', 5, 20, 'in chicago', '2020-12-19 09:51:28', 0),
(38, 'pramila@sakec.ac.in', 5, 21, 'Pineapple ', '2020-12-19 09:51:39', 0),
(39, 'pramila@sakec.ac.in', 5, 22, 'Cats', '2020-12-19 09:51:42', 0),
(40, 'pramila@sakec.ac.in', 5, 23, 'Yes', '2020-12-19 09:51:44', 0),
(41, 'shwetambari@sakec.ac.in', 5, 12, '3', '2020-12-19 09:52:32', 0),
(42, 'shwetambari@sakec.ac.in', 5, 13, 'Shwetambari', '2020-12-19 09:52:38', 0),
(43, 'shwetambari@sakec.ac.in', 5, 19, 'nothing so other stuffs', '2020-12-19 09:52:49', 0),
(44, 'shwetambari@sakec.ac.in', 5, 20, 'lets see', '2020-12-19 09:52:51', 0),
(45, 'shwetambari@sakec.ac.in', 5, 21, 'Apple ', '2020-12-19 09:52:54', 0),
(46, 'shwetambari@sakec.ac.in', 5, 22, 'Dogs', '2020-12-19 09:52:55', 0),
(47, 'shwetambari@sakec.ac.in', 5, 23, 'Yes', '2020-12-19 09:52:58', 0);

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

--
-- Dumping data for table `form`
--

INSERT INTO `form` (`F_id`, `Admin_id`, `Admin_email`, `Form_code`, `Form_name`, `Form_version`, `Form_Desc`, `Published`, `Expired`, `created_on`, `updated_on`, `DELETED`) VALUES
(1, 'ANI', 'aniketkumar.singh@sakec.ac.in', 1, 'Student Teacher Feedback Form', '1', 'This form is to get feedbacks on teachers by students.', 0, 0, '2020-10-28 06:50:14', '2020-11-09 14:32:43', 0),
(2, 'ANI', 'aniketkumar.singh@sakec.ac.in', 1, 'Student Teacher Feedback Form', '2', 'This form is to get feedbacks on teachers by students.', 0, 0, '2020-10-28 07:00:26', '2020-11-08 05:34:37', 0),
(3, 'ANI', 'aniketkumar.singh@sakec.ac.in', 1, 'Student Teacher Feedback Form', '3', 'This form is to get feedbacks on teachers by students.', 0, 0, '2020-10-28 07:09:27', '2020-10-28 07:09:28', 0),
(4, 'ANI', 'aniketkumar.singh@sakec.ac.in', 1, 'Student Teacher Feedback Form', '4', 'This form is to get feedbacks on teachers by students.', 0, 0, '2020-11-05 14:43:48', '2020-11-09 14:01:29', 0),
(5, 'PRA', 'prateek.manta@sakec.ac.in', 5, 'Infrastructure Feedback', '1', 'This is to test the sharing of forms.', 1, 0, '2020-11-06 06:09:03', '2020-12-19 09:44:21', 0),
(6, 'PRA', 'prateek.manta@sakec.ac.in', 5, 'Infrastructure Feedback', '2', 'This is to test the sharing of forms.', 0, 0, '2020-12-19 05:51:07', '2020-12-19 08:01:29', 0),
(7, 'ANI', 'aniketkumar.singh@sakec.ac.in', 7, 'LockDown Review from Students', '1', 'Students, experience while studying from home ! ', 0, 0, '2020-12-19 06:07:35', '2020-12-19 06:07:36', 0),
(8, 'PRA', 'prateek.manta@sakec.ac.in', 8, 'Teachers experience in Lockdown', '1', 'Teacher view in this lockdown', 1, 0, '2020-12-19 06:43:04', '2020-12-19 10:05:02', 0),
(9, 'PRA', 'prateek.manta@sakec.ac.in', 9, 'Parents View of College in COVID', '1', 'Parents ', 0, 0, '2020-12-19 06:46:08', '2020-12-19 10:11:47', 0),
(10, 'PRA', 'prateek.manta@sakec.ac.in', 10, 'Student test', '1', 'Form to show delete functionality', 0, 0, '2020-12-19 06:47:22', '2020-12-19 10:12:16', 0);

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
(1, 1, 'ANI', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'master', '2020-10-28 06:50:14', '2020-10-28 06:50:14', 0),
(2, 5, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-11-06 06:09:03', '2020-11-06 06:09:03', 0),
(3, 7, 'ANI', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'master', '2020-12-19 06:07:35', '2020-12-19 06:07:35', 0),
(4, 8, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-12-19 06:43:04', '2020-12-19 06:43:04', 0),
(5, 9, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-12-19 06:46:08', '2020-12-19 06:46:08', 0),
(6, 10, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-12-19 06:47:22', '2020-12-19 06:47:22', 0);

-- --------------------------------------------------------

--
-- Table structure for table `publish_details`
--

CREATE TABLE `publish_details` (
  `Form_details` int(16) NOT NULL,
  `F_id` int(16) NOT NULL,
  `Role` varchar(255) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Year` varchar(16) NOT NULL,
  `Division` varchar(16) NOT NULL,
  `DELETED` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `publish_details`
--

INSERT INTO `publish_details` (`Form_details`, `F_id`, `Role`, `Department`, `Year`, `Division`, `DELETED`) VALUES
(1, 1, 'Student', 'EXTC', 'TE', '7', 0),
(2, 2, 'Student', 'IT', 'BE', '6', 0),
(3, 3, '', '', '', '', 0),
(4, 4, 'Everyone', '', '', '', 0),
(5, 5, 'Everyone', '', '', '', 0),
(6, 6, '', '', '', '', 0),
(7, 7, '', '', '', '', 0),
(8, 8, 'Everyone', '', '', '', 0),
(9, 9, '', '', '', '', 0),
(10, 10, '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `Q_id` int(16) NOT NULL,
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

INSERT INTO `questions` (`Q_id`, `F_id`, `Breakpoints`, `created_on`, `updated_on`, `rating_scale`, `type`, `Question_desc`, `Option1`, `Option2`, `Option3`, `Option4`, `Option5`, `Default_Option`, `DELETED`) VALUES
(1, 1, '', '2020-10-28 06:53:33', '2020-11-04 11:51:40', '5', 'linearscale', 'What is your review of faculties of IT branch?', 'Excellent', 'Very Good', 'Good', 'Poor', '', 'NULL', 0),
(2, 1, '', '2020-10-28 06:54:45', '2020-10-28 14:08:00', '', 'radio', 'What is your average attendance in a complete semester in percentage?', '75 Above', '60-75', '40-60', '20-40', '', 'NULL', 0),
(3, 1, '', '2020-10-28 06:55:53', '2020-10-28 06:55:53', '', 'rating', 'How much do you want to rate the pace of teaching concepts?', '', '', '', '', '', 'NULL', 0),
(4, 1, '', '2020-10-28 06:57:03', '2020-10-28 06:57:03', '', 'multiplechoice', 'Which subjects are you interested in? (choose multiple)', 'Data Structures and Algorithms', 'DBMS', 'Internet Programming', 'Software Testing', 'Cyber Security', 'NULL', 0),
(5, 1, '', '2020-10-28 06:59:10', '2020-10-28 06:59:10', '', 'text', 'Provide a feedback.', '', '', '', '', '', 'NULL', 0),
(6, 3, '', '2020-10-28 07:09:27', '2020-10-28 07:09:27', '5', 'linearscale', 'What is your review of faculties of IT branch?', 'Excellent', 'Very Good', 'Good', 'Poor', 'Very Poor', 'NULL', 0),
(7, 3, '', '2020-10-28 07:09:28', '2020-10-28 07:09:28', '', 'radio', 'What is your average attendance in a complete semester in percentage?', '75 Above', '60-75', '40-60', '20-40', 'Below 20', 'NULL', 0),
(8, 3, '', '2020-10-28 07:09:28', '2020-10-28 07:09:28', '', 'rating', 'How much do you want to rate the pace of teaching concepts?', '', '', '', '', '', 'NULL', 0),
(9, 3, '', '2020-10-28 07:09:28', '2020-10-28 07:09:28', '', 'multiplechoice', 'Which subjects are you interested in? (choose multiple)', 'Data Structures and Algorithms', 'DBMS', 'Internet Programming', 'Software Testing', 'Cyber Security', 'NULL', 0),
(10, 3, '', '2020-10-28 07:09:28', '2020-10-28 07:09:28', '', 'text', 'Provide a feedback.', '', '', '', '', '', 'NULL', 0),
(11, 3, '', '2020-10-28 07:11:45', '2020-10-28 07:11:45', '', 'text', 'Write in your own words how practical sessions are carried out? If needed provide some suggestions too. ', '', '', '', '', '', 'NULL', 0),
(12, 5, '', '2020-11-06 06:23:15', '2020-12-19 04:41:10', '', 'radio', 'This is the test of sharing forms', '2', '2', '3', '4', '5', 'NULL', 0),
(13, 5, '', '2020-11-26 10:33:53', '2020-11-26 10:33:53', '', 'text', 'What is your name', '', '', '', '', '', 'NULL', 0),
(14, 6, '', '2020-12-19 05:51:08', '2020-12-19 05:51:08', '', 'radio', 'This is the test of sharing forms', '2', '2', '3', '4', '5', 'NULL', 0),
(15, 6, '', '2020-12-19 05:51:08', '2020-12-19 05:51:08', '', 'text', 'What is your name', '', '', '', '', '', 'NULL', 0),
(16, 7, '', '2020-12-19 06:11:30', '2020-12-19 06:11:30', '', 'radio', 'How is your experience so far in the Lockdown', 'Very good', 'Good', 'Not the interesting', 'Some what okay', 'Bad', 'NULL', 0),
(17, 7, '', '2020-12-19 06:12:34', '2020-12-19 06:12:34', '', 'radio', 'Would you like to continue to take this kinda of education for the next semester ?', 'Yes ', 'No', '', '', '', 'NULL', 0),
(18, 7, '', '2020-12-19 06:16:24', '2020-12-19 06:16:24', '', 'multiplechoice', 'What all benefits have you seen by using this online system', 'Travelling time is saved', 'Lectures can be recorded', 'They can be viewed according to our pace', 'Lectures can be viewed as many times as possible', '', 'NULL', 0),
(19, 5, '', '2020-12-19 09:39:14', '2020-12-19 09:39:14', '', 'text', 'What extra curricular activities have you done in the lockdown ?', '', '', '', '', '', 'NULL', 0),
(20, 5, '', '2020-12-19 09:40:16', '2020-12-19 09:40:16', '', 'text', 'Where do you see yourself in 5 years ?', '', '', '', '', '', 'NULL', 0),
(21, 5, '', '2020-12-19 09:42:27', '2020-12-19 09:47:23', '', 'radio', 'Which fruits do you like ?', 'Mango ', 'Apple ', 'Banana', 'Pineapple ', 'kiwi', 'NULL', 0),
(22, 5, '', '2020-12-19 09:43:17', '2020-12-19 09:43:17', '', 'multiplechoice', 'What animals do you like ?', 'Dogs', 'Cats', 'Tiger', 'Girrafe', 'Camel', 'NULL', 0),
(23, 5, '', '2020-12-19 09:43:59', '2020-12-19 09:43:59', '', 'radio', 'Do you want to serve others by volunteering ?', 'Yes', 'No', '', '', '', 'NULL', 0),
(24, 8, '', '2020-12-19 10:03:19', '2020-12-19 10:03:19', '', 'radio', 'How is you experience so far ?', 'Very Good', 'Good', 'Just okay', 'Bad', 'Very bad', 'NULL', 0),
(25, 8, '', '2020-12-19 10:03:54', '2020-12-19 10:03:54', '', 'text', 'What are the advantages you feel in the Lockdown teaching situation ?', '', '', '', '', '', 'NULL', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shared_forms`
--

CREATE TABLE `shared_forms` (
  `id` int(20) NOT NULL,
  `F_id` int(20) NOT NULL,
  `Admin_email` varchar(255) NOT NULL,
  `shared_with` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shared_forms`
--

INSERT INTO `shared_forms` (`id`, `F_id`, `Admin_email`, `shared_with`) VALUES
(1, 5, 'prateek.manta@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in'),
(7, 1, 'aniketkumar.singh@sakec.ac.in', 'prateek.manta@sakec.ac.in'),
(8, 1, 'aniketkumar.singh@sakec.ac.in', 'pooja.tripathi@sakec.ac.in'),
(10, 7, 'aniketkumar.singh@sakec.ac.in', 'prateek.manta@sakec.ac.in'),
(11, 7, 'aniketkumar.singh@sakec.ac.in', 'pooja.tripathi@sakec.ac.in');

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
  `DELETED` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_id`, `User_email`, `User_password`, `Role`, `Mentor`, `Department`, `Year`, `Division`, `DELETED`) VALUES
(1, 'aniketkumar.singh@sakec.ac.in', '345678901', 'Student', 'Mr. Lukesh kadu', 'IT', 'BE', '6', 0),
(4, 'pooja.tripathi@sakec.ac.in', '234567890', 'Student', 'Ms. Nilakshi Jain', 'EXTC', 'TE', '7', 0),
(5, 'prateek.manta@sakec.ac.in', '123456789', 'Student', 'Ms. Pramila Shinde', 'CM', 'SE', '3', 0),
(11, 'rishab.shetty@sakec.ac.in', '123456789', 'Student', '', 'ETRX', 'FE', '1', 0),
(12, 'pramila@sakec.ac.in', '123456789', 'Teacher', '', 'IT', '', '', 0),
(13, 'shwetambari@sakec.ac.in', '123456789', 'Teacher', '', 'CM', '', '', 0),
(14, 'rohit@sakec.ac.in', '123456789', 'Student', 'Ms. Pramila Shinde', 'IT', '3', '6', 0);

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
(3, 'Aniket', 'Kumar', 'Singh', 8934982332, '2020-06-09 05:31:21', '2020-07-17 12:56:24', 0);

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

--
-- Dumping data for table `user_form_access`
--

INSERT INTO `user_form_access` (`auto_increment`, `user_email`, `F_id`, `Form_code`) VALUES
(88, 'aniketkumar.singh@sakec.ac.in', 8, 8),
(89, 'pooja.tripathi@sakec.ac.in', 8, 8),
(90, 'prateek.manta@sakec.ac.in', 8, 8),
(91, 'rishab.shetty@sakec.ac.in', 8, 8),
(92, 'pramila@sakec.ac.in', 8, 8),
(93, 'shwetambari@sakec.ac.in', 8, 8),
(94, 'rohit@sakec.ac.in', 8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `user_response`
--

CREATE TABLE `user_response` (
  `id` int(20) NOT NULL,
  `User_email` varchar(255) NOT NULL,
  `F_id` int(20) NOT NULL,
  `Timestamp` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_response`
--

INSERT INTO `user_response` (`id`, `User_email`, `F_id`, `Timestamp`) VALUES
(1, 'aniketkumar.singh@sakec.ac.in', 1, '0000-00-00'),
(2, 'prateek.manta@sakec.ac.in', 5, '2020-12-19'),
(3, 'pooja.tripathi@sakec.ac.in', 5, '2020-12-19'),
(4, 'aniketkumar.singh@sakec.ac.in', 5, '2020-12-19'),
(5, 'rishab.shetty@sakec.ac.in', 5, '2020-12-19'),
(6, 'pramila@sakec.ac.in', 5, '2020-12-19'),
(7, 'shwetambari@sakec.ac.in', 5, '2020-12-19');

--
-- Indexes for dumped tables
--

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
  ADD KEY `Q_id` (`Q_id`),
  ADD KEY `F_id` (`F_id`);

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
  ADD KEY `FOREIGN KEY` (`F_id`);

--
-- Indexes for table `shared_forms`
--
ALTER TABLE `shared_forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_id`),
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
-- Indexes for table `user_response`
--
ALTER TABLE `user_response`
  ADD PRIMARY KEY (`id`),
  ADD KEY `User_email` (`User_email`),
  ADD KEY `F_id` (`F_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_credentials`
--
ALTER TABLE `admin_credentials`
  MODIFY `A_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `Ans_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `form`
--
ALTER TABLE `form`
  MODIFY `F_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `form_allotment`
--
ALTER TABLE `form_allotment`
  MODIFY `form_allotment_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `publish_details`
--
ALTER TABLE `publish_details`
  MODIFY `Form_details` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `Q_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `shared_forms`
--
ALTER TABLE `shared_forms`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `User_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `Details_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_form_access`
--
ALTER TABLE `user_form_access`
  MODIFY `auto_increment` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `user_response`
--
ALTER TABLE `user_response`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

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
  ADD CONSTRAINT `user_form_access_ibfk_1` FOREIGN KEY (`Form_code`) REFERENCES `form` (`Form_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_form_access_ibfk_2` FOREIGN KEY (`F_id`) REFERENCES `form` (`F_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
