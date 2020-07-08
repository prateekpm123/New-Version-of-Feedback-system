-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2020 at 03:01 PM
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
(11, 2, 'PRA', 'prateek.manta@sakec.ac.in', 'prateek.manta@sakec.ac.in', 'master', '2020-06-09 15:47:04', '2020-06-09 15:47:04', 0);

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
  `Form_code` varchar(255) NOT NULL,
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

INSERT INTO `form` (`F_id`, `Admin_id`, `Form_code`, `Form_name`, `Form_version`, `Form_Desc`, `created_on`, `updated_on`, `Form_details`, `DELETED`) VALUES
(1, 'PRA', '1', 'TEst form 1', '1', '', '2020-06-07 14:37:55', '2020-06-08 06:16:00', 1, 0),
(10, 'PRA', '10', 'TEacher form', '1', '', '2020-07-06 10:33:28', '2020-07-06 10:33:28', 1, 0),
(2, 'PRA', '2', 'TEst form 2', '1', '', '2020-06-07 14:39:16', '2020-06-07 14:39:16', 1, 0),
(3, 'PRA', '3', 'TEst form 2', '2', '', '2020-06-07 14:41:46', '2020-06-07 14:41:46', 1, 0),
(4, 'PRA', '4', 'TEst form 2', '3', '', '2020-06-07 14:41:46', '2020-06-07 14:41:46', 1, 0),
(5, 'PRA', '5', 'TEst form 2', '4', '', '2020-06-07 14:41:46', '2020-06-07 14:41:46', 1, 0),
(6, 'PRA', '6', 'TEst form 3', '1', '', '2020-06-07 14:41:46', '2020-06-07 14:41:46', 1, 0),
(7, 'PRA', '7', 'TEst form 3', '2', '', '2020-06-07 14:41:46', '2020-06-07 14:41:46', 1, 0),
(8, 'PRA', '8', 'TEst form 3', '3', '', '2020-06-07 14:41:47', '2020-06-07 14:41:47', 1, 0),
(9, 'PRA', '9', 'TEst form 4', '1', '', '2020-06-07 14:41:47', '2020-06-07 14:41:47', 1, 0);

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
(7, 1, 2, '', '2020-07-06 11:03:11', '2020-07-08 10:53:31', '', 'Which is your favourite anime ?', 'Naruto ', 'One piece', 'Bleach', 'NULL', 'NULL', 'NULL', 1),
(8, 2, 2, '', '2020-07-06 11:04:46', '2020-07-08 10:55:46', '', 'Which your favourite character', 'Lucy', 'Elizabeth', 'Alice', 'Erina', 'Asuna', 'NULL', 1),
(9, 3, 2, '', '2020-07-06 11:05:25', '2020-07-08 10:55:48', '', 'Which your favourite character', 'Lucy', 'Elizabeth', 'Alice', 'Erina', 'Asuna', 'NULL', 1),
(10, 4, 2, '', '2020-07-06 11:05:26', '2020-07-08 10:55:50', '', 'Which your favourite character', 'Lucy', 'Elizabeth', 'Alice', 'Erina', 'Asuna', 'NULL', 1),
(11, 5, 2, '', '2020-07-06 11:05:26', '2020-07-08 10:52:58', '', 'Which your favourite character', 'Lucy', 'Elizabeth', 'Alice', 'Erina', 'Asuna', 'NULL', 1),
(12, 6, 2, '', '2020-07-06 11:05:26', '2020-07-08 10:55:52', '', 'Which your favourite character', 'Lucy', 'Elizabeth', 'Alice', 'Erina', 'Asuna', 'NULL', 1),
(13, 7, 2, '', '2020-07-06 11:05:26', '2020-07-08 10:56:37', '', 'Which your favourite character', 'Lucy', 'Elizabeth', 'Alice', 'Erina', 'Asuna', 'NULL', 1),
(21, 0, 1, '', '2020-07-08 10:48:24', '2020-07-08 10:53:06', 'radio', 'asdfasf', 'asdf', 'asdf', 'asdf', 'asdfasdf', 'asfd', 'NULL', 1),
(22, 0, 1, '', '2020-07-08 10:48:47', '2020-07-08 10:48:47', 'text', 'asdfasdfsf', '', '', '', '', '', 'NULL', 0),
(23, 0, 1, '', '2020-07-08 10:56:10', '2020-07-08 12:30:59', 'text', 'Just to test how are how are you doing ?', '', '', '', '', '', 'NULL', 1),
(24, 0, 1, '', '2020-07-08 10:57:20', '2020-07-08 10:57:20', 'radio', 'Who you wanna make you waifu', 'Lucy ', 'Elizabeth', 'Alice', 'Erina', '', 'NULL', 0),
(25, 0, 1, '', '2020-07-08 12:30:53', '2020-07-08 12:30:53', 'text', 'test', '', '', '', '', '', 'NULL', 0),
(26, 0, 1, '', '2020-07-08 12:33:20', '2020-07-08 12:33:20', 'multiplechoice', 'rest', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', 'NULL', 0);

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
  ADD PRIMARY KEY (`Form_code`),
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
  MODIFY `Access_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `F_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `form_details`
--
ALTER TABLE `form_details`
  MODIFY `Form_details` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `Q_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
