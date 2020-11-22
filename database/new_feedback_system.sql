-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2020 at 08:32 AM
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
(1, 'aniketkumar.singh@sakec.ac.in', 2, 1, '3', '2020-10-22 09:07:31', 0),
(2, 'prateek.manta@sakec.ac.in', 2, 7, 'i dont know bro', '2020-11-17 16:09:53', 0),
(3, 'prateek.manta@sakec.ac.in', 2, 1, '3', '2020-11-17 16:09:54', 0);

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
(1, 'ANI', 'aniketkumar.singh@sakec.ac.in', 1, 'This form is for prateek', '1', 'hello prateek', 0, 0, '2020-09-13 14:46:28', '2020-09-13 14:46:28', 0),
(2, 'PRA', 'prateek.manta@sakec.ac.in', 2, 'This Form is for Aniket', '1', 'ani', 1, 0, '2020-09-13 14:47:54', '2020-11-17 16:09:30', 0),
(3, 'ANI', 'aniketkumar.singh@sakec.ac.in', 3, 'this is the second form for prateek', '1', 'yo', 0, 0, '2020-09-13 15:03:31', '2020-09-13 15:03:32', 0),
(4, 'ANI', 'aniketkumar.singh@sakec.ac.in', 1, 'This form is for prateek', '2', 'hello prateek', 0, 0, '2020-09-13 15:05:50', '2020-09-13 15:05:50', 0),
(5, 'PRA', 'prateek.manta@sakec.ac.in', 2, 'This Form is for Aniket', '2', 'ani', 0, 0, '2020-09-13 15:06:44', '2020-09-13 15:06:44', 0),
(6, 'ANI', 'aniketkumar.singh@sakec.ac.in', 6, 'Form to share with aniket ', '1', '', 0, 0, '2020-09-15 08:25:18', '2020-09-15 08:25:18', 0),
(7, 'PRA', 'prateek.manta@sakec.ac.in', 7, 'This form is to share with all / everyone', '1', '', 1, 0, '2020-09-15 08:33:15', '2020-11-22 07:08:35', 0),
(8, 'PRA', 'prateek.manta@sakec.ac.in', 8, 'wderthgdfghd', '1', '', 0, 0, '2020-09-15 12:52:21', '2020-09-15 12:52:21', 0);

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
(1, 1, 'ANI', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'master', '2020-09-13 14:46:28', '2020-09-13 14:46:28', 0),
(2, 2, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-09-13 14:47:54', '2020-09-13 14:47:54', 0),
(3, 3, 'ANI', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'master', '2020-09-13 15:03:31', '2020-09-13 15:03:31', 0),
(4, 6, 'ANI', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in', 'master', '2020-09-15 08:25:18', '2020-09-15 08:25:18', 0),
(5, 7, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-09-15 08:33:16', '2020-09-15 08:33:16', 0),
(6, 8, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-09-15 12:52:21', '2020-09-15 12:52:21', 0);

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

--
-- Dumping data for table `publish_details`
--

INSERT INTO `publish_details` (`Form_details`, `F_id`, `Start_date`, `End_date`, `Validity`, `Role`, `Department`, `Year`, `Division`, `DELETED`) VALUES
(1, 1, '0000-00-00', '0000-00-00', '', '', '', '', '', 0),
(2, 2, '0000-00-00', '0000-00-00', '', 'Student', 'IT', 'BE', '6', 0),
(3, 3, '0000-00-00', '0000-00-00', '', '', '', '', '', 0),
(4, 4, '0000-00-00', '0000-00-00', '', '', '', '', '', 0),
(5, 5, '0000-00-00', '0000-00-00', '', '', '', '', '', 0),
(6, 6, '0000-00-00', '0000-00-00', '', '', '', '', '', 0),
(7, 7, '0000-00-00', '0000-00-00', '', 'Everyone', '', '', '', 0),
(8, 8, '0000-00-00', '0000-00-00', '', '', '', '', '', 0);

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
(1, 2, '', '2020-09-13 14:56:36', '2020-09-13 14:56:36', '', 'radio', 'hello', '1', '2', '3', '4', '5', 'NULL', 0),
(2, 1, '', '2020-09-13 15:02:07', '2020-09-13 15:02:07', '', 'radio', 'hiii', 'fbf', 'fbb', 'fxbx', 'bfx', '', 'NULL', 0),
(3, 5, '', '2020-09-15 08:27:08', '2020-09-15 08:27:39', '', 'radio', 'sadfasfd', '', 'sadf', 'asdf', '', '', 'NULL', 0),
(4, 5, '', '2020-09-15 08:28:33', '2020-09-15 08:29:38', '', 'radio', 'y are quesatas no getting saved over here ', 'waersdf', 'asdf', 'asdfsadf', '', '', 'NULL', 0),
(5, 5, '', '2020-09-15 08:30:01', '2020-09-15 08:30:18', '', 'text', 'This is the 3rd time i have made a question', '', '', '', '', '', 'NULL', 0),
(6, 7, '', '2020-09-15 08:33:34', '2020-09-15 08:35:35', '', 'radio', 'Questionf rom prateek', 'elizabeth', 'Erza', 'Mira', 'Lucy', '', 'NULL', 0),
(7, 2, '', '2020-11-17 16:00:18', '2020-11-17 16:00:18', '', 'multiplechoice', 'Lets see what are you doing ', 'i dont know bro', 'lets not mess that up', '', '', '', 'NULL', 0);

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
(1, 1, 'aniketkumar.singh@sakec.ac.in', 'prateek.manta@sakec.ac.in'),
(2, 2, 'prateek.manta@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in'),
(3, 3, 'aniketkumar.singh@sakec.ac.in', 'prateek.manta@sakec.ac.in'),
(4, 4, 'aniketkumar.singh@sakec.ac.in', 'prateek.manta@sakec.ac.in'),
(5, 5, 'prateek.manta@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in'),
(6, 6, 'aniketkumar.singh@sakec.ac.in', 'aniketkumar.singh@sakec.ac.in'),
(17, 7, 'prateek.manta@sakec.ac.in', 'pooja.tripathi@sakec.ac.in');

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

--
-- Dumping data for table `user_form_access`
--

INSERT INTO `user_form_access` (`auto_increment`, `user_email`, `F_id`, `Form_code`) VALUES
(3, 'jayatripathi@gmail.com', 2, 2),
(4, 'pooja.tripathi@sakec.ac.in', 2, 2),
(6, 'rohit_tripathi@gmail.com', 2, 2),
(7, 'aniketkumar.singh@sakec.ac.in', 7, 7),
(8, 'jayatripathi@gmail.com', 7, 7),
(9, 'nidhi@gmailcom', 7, 7),
(10, 'pooja.tripathi@sakec.ac.in', 7, 7),
(11, 'prateek.manta@sakec.ac.in', 7, 7),
(12, 'pramila@gmail.com', 7, 7),
(13, 'rohit_tripathi@gmail.com', 7, 7),
(14, 'sanchi@gmail.com', 7, 7),
(15, 'shreya@gmail.com', 7, 7),
(16, 'shwetambari@gmail.com', 7, 7);

-- --------------------------------------------------------

--
-- Table structure for table `user_response`
--

CREATE TABLE `user_response` (
  `id` int(20) NOT NULL,
  `User_email` varchar(255) NOT NULL,
  `F_id` int(20) NOT NULL,
  `Timestamp` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_response`
--

INSERT INTO `user_response` (`id`, `User_email`, `F_id`, `Timestamp`) VALUES
(1, 'prateek.manta@sakec.ac.in', 2, '0000-00-00 00:00:00.000000');

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
  MODIFY `Ans_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `form`
--
ALTER TABLE `form`
  MODIFY `F_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `form_allotment`
--
ALTER TABLE `form_allotment`
  MODIFY `form_allotment_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `publish_details`
--
ALTER TABLE `publish_details`
  MODIFY `Form_details` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `Q_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `shared_forms`
--
ALTER TABLE `shared_forms`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  MODIFY `auto_increment` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_response`
--
ALTER TABLE `user_response`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  ADD CONSTRAINT `user_form_access_ibfk_1` FOREIGN KEY (`Form_code`) REFERENCES `form` (`Form_code`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
