-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2020 at 08:55 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.32

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
(1, 'PRA', 'Prateek', 'prateek.manta@sakec.ac.in', '2020-05-31 11:04:35', '2020-05-31 11:04:35', '1234567', '1234567', 1, 0);

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
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Form_details` int(16) NOT NULL,
  `DELETED` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `form`
--

INSERT INTO `form` (`F_id`, `Admin_id`, `Form_code`, `Form_name`, `Form_version`, `created_on`, `updated_on`, `Form_details`, `DELETED`) VALUES
(1, 'PRA', '1', 'TEst form 1', '1', '2020-06-07 14:37:55', '2020-06-08 06:16:00', 1, 0),
(2, 'PRA', '2', 'TEst form 2', '1', '2020-06-07 14:39:16', '2020-06-07 14:39:16', 1, 0),
(3, 'PRA', '3', 'TEst form 2', '2', '2020-06-07 14:41:46', '2020-06-07 14:41:46', 1, 0),
(4, 'PRA', '4', 'TEst form 2', '3', '2020-06-07 14:41:46', '2020-06-07 14:41:46', 1, 0),
(5, 'PRA', '5', 'TEst form 2', '4', '2020-06-07 14:41:46', '2020-06-07 14:41:46', 1, 0),
(6, 'PRA', '6', 'TEst form 3', '1', '2020-06-07 14:41:46', '2020-06-07 14:41:46', 1, 0),
(7, 'PRA', '7', 'TEst form 3', '2', '2020-06-07 14:41:46', '2020-06-07 14:41:46', 1, 0),
(8, 'PRA', '8', 'TEst form 3', '3', '2020-06-07 14:41:47', '2020-06-07 14:41:47', 1, 0),
(9, 'PRA', '9', 'TEst form 4', '1', '2020-06-07 14:41:47', '2020-06-07 14:41:47', 1, 0);

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
  `Question_desc` mediumtext NOT NULL,
  `Option1` varchar(1000) NOT NULL DEFAULT 'NULL',
  `Option2` varchar(1000) NOT NULL DEFAULT 'NULL',
  `Option3` varchar(1000) NOT NULL DEFAULT 'NULL',
  `Option4` varchar(1000) NOT NULL DEFAULT 'NULL',
  `Option5` varchar(1000) NOT NULL DEFAULT 'NULL',
  `Option6` varchar(1000) NOT NULL DEFAULT 'NULL',
  `Default_Option` varchar(1000) NOT NULL DEFAULT 'NULL',
  `DELETED` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'PRA', 'prateek', 'prateek.manta@sakec.ac.in', 'Admin', '2020-05-31 11:03:21', '2020-05-31 11:03:21', 1, 1, 0);

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
(2, 'Pooja', 'Jitendra', 'Tripathi', 9829342232, '2020-05-31 10:58:43', '2020-05-31 10:58:43', 0);

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
(1, '1234567', '1234567', '2020-05-31 11:01:18', '2020-05-31 11:02:21', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_credentials`
--
ALTER TABLE `admin_credentials`
  ADD PRIMARY KEY (`Admin_id`),
  ADD KEY `a_id` (`A_id`),
  ADD KEY `u_id` (`U_id`);

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
  ADD PRIMARY KEY (`Q_no`),
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
-- AUTO_INCREMENT for table `admin_credentials`
--
ALTER TABLE `admin_credentials`
  MODIFY `A_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `Ans_id` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form`
--
ALTER TABLE `form`
  MODIFY `F_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `form_details`
--
ALTER TABLE `form_details`
  MODIFY `Form_details` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `Q_id` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `U_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `Details_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_password`
--
ALTER TABLE `user_password`
  MODIFY `Password_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1262236;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_credentials`
--
ALTER TABLE `admin_credentials`
  ADD CONSTRAINT `admin_credentials_ibfk_1` FOREIGN KEY (`U_id`) REFERENCES `user` (`U_id`);

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
