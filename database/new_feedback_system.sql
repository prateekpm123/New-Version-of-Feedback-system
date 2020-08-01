-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2020 at 02:39 PM
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
  `U_id` int(16) NOT NULL,
  `DELETED` tinyint(1) NOT NULL DEFAULT 0
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
  `DELETED` tinyint(1) NOT NULL DEFAULT 0
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
(109, 'PRA', 'prateek.manta@sakec.ac.in', 'ABC2020', 'STUDENT FORM', '1', 'related to infrastructure', 0, 0, '2020-08-01 07:21:46', '2020-08-01 07:21:46', 0),
(110, 'POO', 'pooja.tripathi@sakec.ac.in', '123', 'ABCD', '1', 'NONE', 0, 0, '2020-08-01 10:51:29', '2020-08-01 10:51:29', 0),
(111, 'PRA', 'prateek.manta@sakec.ac.in', '', 'STUDENT FORM', '2', '', 0, 0, '2020-08-01 12:33:09', '2020-08-01 12:33:09', 0),
(112, 'PRA', 'prateek.manta@sakec.ac.in', '', 'test', '1', 'test', 0, 0, '2020-08-01 12:34:23', '2020-08-01 12:34:23', 0);

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
(56, 109, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', '', '2020-08-01 12:24:56', '2020-08-01 12:24:56', 0),
(57, 110, 'POO', 'pooja.tripathi@sakec.ac.in', 'pooja.tripathi@sakec.ac.in', 'pooja.tripathi@sakec.ac.in', '', '2020-08-01 12:26:11', '2020-08-01 12:26:11', 0),
(58, 112, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-08-01 12:34:23', '2020-08-01 12:34:23', 0);

-- --------------------------------------------------------

--
-- Table structure for table `form_details`
--

CREATE TABLE `form_details` (
  `Form_details` int(16) NOT NULL,
  `F_id` int(16) NOT NULL,
  `Start_date` datetime NOT NULL DEFAULT current_timestamp(),
  `End_date` datetime NOT NULL,
  `Validity` varchar(255) NOT NULL,
  `Role` varchar(255) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Year` varchar(16) NOT NULL,
  `Division` varchar(16) NOT NULL,
  `DELETED` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `form_details`
--

INSERT INTO `form_details` (`Form_details`, `F_id`, `Start_date`, `End_date`, `Validity`, `Role`, `Department`, `Year`, `Division`, `DELETED`) VALUES
(2, 109, '2020-08-01 17:53:04', '0000-00-00 00:00:00', '', '', '', '', '', 0),
(3, 110, '2020-08-01 17:53:24', '0000-00-00 00:00:00', '', '', '', '', '', 0);

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
(71, 2, 111, '', '2020-08-01 12:33:09', '2020-08-01 12:33:09', '', 'text', 'hey', '', '', '', '', '', 'NULL', 0);

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
  `Mentor` varchar(255) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Year` varchar(255) NOT NULL,
  `Division` int(16) NOT NULL,
  `Roll-no` int(16) NOT NULL,
  `Details_id` int(16) NOT NULL,
  `Password_id` int(16) NOT NULL,
  `DELETED` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`U_id`, `User_id`, `User_name`, `User _email`, `Role`, `Mentor`, `Department`, `Year`, `Division`, `Roll-no`, `Details_id`, `Password_id`, `DELETED`) VALUES
(3, 'ANI', 'aniket', 'aniketkumar.singh@sakec.ac.in', 'student', 'Mr. Lukesh kadu', 'IT', 'FE', 5, 1, 3, 3, 0),
(11, 'ASH', 'Ash', 'ash@gmail.com', 'HOD', '--', 'IT', '-', 0, 0, 11, 11, 0),
(4, 'JAYA', 'Jaya', 'jayatripathi@gmail.com', 'student', 'Ms. Ashwini Deshmukh', 'CN', 'SE', 3, 2, 4, 4, 0),
(7, 'NID', 'Nidhi', 'nidhi@gmailcom', 'Student', 'Ms. Nilakshi', 'CN', 'TE', 4, 68, 7, 7, 0),
(2, 'POO', 'Pooja', 'pooja.tripathi@sakec.ac.in', 'student', 'Ms. Nilakshi Jain', 'EXTC', 'TE', 1, 34, 2, 2, 0),
(1, 'PRA', 'prateek', 'prateek.manta@sakec.ac.in', 'student', 'Ms. Pramila Shinde', 'ETRX', 'BE', 7, 50, 1, 1, 0),
(9, 'PRAM', 'Pramila', 'pramila@gmail.com', 'Teacher', '-', '-', '-', 0, 0, 9, 9, 0),
(5, 'ROH', 'Rohit', 'rohit_tripathi@gmail.com', 'student', 'Ms. Shwetambari Pawar', 'IT', 'FE', 6, 25, 5, 5, 0),
(6, 'SAN', 'Sanchi', 'sanchi@gmail.com', 'student', 'Ms. Swati', 'EXTC', 'BE', 2, 41, 6, 6, 0),
(8, 'SHR', 'Shreya', 'shreya@gmail.com', 'student', 'Mr. Lukesh KAdu', 'ETRX', 'SE', 2, 56, 8, 8, 0),
(10, 'SHWE', 'Shwetambari', 'shwetambari@gmail.com', 'Teacher', '-', '-', '-', 0, 0, 10, 10, 0);

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
(10, 'Shwetambari', '--', 'Pawar', 165465123, '2020-07-17 12:39:54', '2020-07-17 12:57:21', 0),
(11, 'Ash', 'Abhishek', 'bachhan', 123, '2020-07-18 08:51:25', '2020-07-18 08:51:25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_form_access`
--

CREATE TABLE `user_form_access` (
  `auto_increment` int(16) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `form_availability` int(16) NOT NULL,
  `DELETED` tinyint(1) NOT NULL DEFAULT 0
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
  ADD KEY `u_id` (`U_id`),
  ADD KEY `User _email` (`User _email`);

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
  ADD KEY `form_availability` (`form_availability`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_email` (`user_email`);

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
  MODIFY `Ans_id` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form`
--
ALTER TABLE `form`
  MODIFY `F_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `form_allotment`
--
ALTER TABLE `form_allotment`
  MODIFY `form_allotment_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `form_details`
--
ALTER TABLE `form_details`
  MODIFY `Form_details` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `Q_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `U_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  ADD CONSTRAINT `form_ibfk_2` FOREIGN KEY (`Admin_email`) REFERENCES `admin_credentials` (`Admin_email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `form_allotment`
--
ALTER TABLE `form_allotment`
  ADD CONSTRAINT `form_allotment_ibfk_1` FOREIGN KEY (`F_id`) REFERENCES `form` (`F_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `form_allotment_ibfk_2` FOREIGN KEY (`Admin_id`) REFERENCES `form` (`Admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `form_allotment_ibfk_3` FOREIGN KEY (`Admin_email`) REFERENCES `form` (`Admin_email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `form_details`
--
ALTER TABLE `form_details`
  ADD CONSTRAINT `form_details_ibfk_1` FOREIGN KEY (`F_id`) REFERENCES `form` (`F_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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

--
-- Constraints for table `user_form_access`
--
ALTER TABLE `user_form_access`
  ADD CONSTRAINT `user_form_access_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_form_access_ibfk_2` FOREIGN KEY (`user_email`) REFERENCES `user` (`User _email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_form_access_ibfk_3` FOREIGN KEY (`form_availability`) REFERENCES `form` (`F_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_password`
--
ALTER TABLE `user_password`
  ADD CONSTRAINT `user_password_ibfk_1` FOREIGN KEY (`Details_id`) REFERENCES `user_details` (`Details_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
