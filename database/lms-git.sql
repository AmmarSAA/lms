-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2022 at 07:01 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `admin_email` varchar(120) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(8) NOT NULL DEFAULT 'Active',
  `profile_picture` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `full_name`, `admin_email`, `user_name`, `password`, `reg_date`, `updation_date`, `status`, `profile_picture`) VALUES
(0, 'Not Replied', '', 'Not Replied', '', '2022-03-31 08:53:45', '2022-03-31 08:54:10', 'Active', ''),

-- --------------------------------------------------------

--
-- Table structure for table `tblauthors`
--

CREATE TABLE `tblauthors` (
  `id` int(11) NOT NULL,
  `author_name` varchar(159) DEFAULT NULL,
  `author_name_urdu` varchar(200) DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblbooks`
--

CREATE TABLE `tblbooks` (
  `id` int(11) NOT NULL,
  `book_pic` text DEFAULT NULL,
  `book_online` text DEFAULT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `book_name_urdu` varchar(250) DEFAULT NULL,
  `cat_id` int(11) DEFAULT 2,
  `author_id` int(11) DEFAULT NULL,
  `isbn_number` varchar(100) DEFAULT NULL,
  `book_price` int(11) NOT NULL DEFAULT 100,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(10) NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `category_name` varchar(150) DEFAULT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Active',
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblfeedback`
--

CREATE TABLE `tblfeedback` (
  `id` int(3) NOT NULL,
  `feedback` text COLLATE utf8_unicode_ci NOT NULL,
  `feedback_urdu` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(3) NOT NULL,
  `email_id` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `rating` int(11) DEFAULT NULL,
  `reply_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `feedback_reply` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `reply_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblissuedbooksdetail`
--

CREATE TABLE `tblissuedbooksdetail` (
  `id` int(4) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `user_id` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issue_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `due_date` timestamp NULL DEFAULT NULL,
  `return_date` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `return_status` tinyint(4) DEFAULT 0,
  `day_fine` int(11) NOT NULL,
  `damagepage_fine` int(11) NOT NULL,
  `extra_fine` int(11) NOT NULL,
  `total_fine` int(11) NOT NULL,
  `comments` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblrulesandregulations`
--

CREATE TABLE `tblrulesandregulations` (
  `id` int(11) NOT NULL,
  `rule` varchar(500) NOT NULL,
  `rule_urdu` varchar(500) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblslider`
--

CREATE TABLE `tblslider` (
  `id` int(3) NOT NULL,
  `title` varchar(50) NOT NULL,
  `slider_img` text NOT NULL,
  `content` varchar(200) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `slide_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email_id` varchar(100) NOT NULL,
  `mobile_no` varchar(20) DEFAULT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(120) DEFAULT NULL,
  `status` varchar(11) NOT NULL DEFAULT 'Inactive',
  `profile_picture` text NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_role` varchar(20) NOT NULL DEFAULT 'User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ID` (`id`),
  ADD UNIQUE KEY `admin_email` (`admin_email`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- Indexes for table `tblauthors`
--
ALTER TABLE `tblauthors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ID` (`id`),
  ADD UNIQUE KEY `author_name` (`author_name`),
  ADD UNIQUE KEY `author_name_urdu` (`author_name_urdu`);

--
-- Indexes for table `tblbooks`
--
ALTER TABLE `tblbooks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD UNIQUE KEY `book_name` (`book_name`,`isbn_number`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ID` (`id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `tblfeedback`
--
ALTER TABLE `tblfeedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblissuedbooksdetail`
--
ALTER TABLE `tblissuedbooksdetail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ID` (`id`);

--
-- Indexes for table `tblrulesandregulations`
--
ALTER TABLE `tblrulesandregulations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblslider`
--
ALTER TABLE `tblslider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ID` (`id`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT for table `tblauthors`
--
ALTER TABLE `tblauthors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `tblbooks`
--
ALTER TABLE `tblbooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `tblfeedback`
--
ALTER TABLE `tblfeedback`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `tblissuedbooksdetail`
--
ALTER TABLE `tblissuedbooksdetail`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `tblrulesandregulations`
--
ALTER TABLE `tblrulesandregulations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `tblslider`
--
ALTER TABLE `tblslider`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
