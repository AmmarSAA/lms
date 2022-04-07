-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2022 at 12:54 PM
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
(1, 'Syed Ammar Ahmed', 'syedammarahmed14@outlook.com', 'Ammar S.A.A', '123@Ammar', '2020-07-13 08:28:12', '2020-11-23 17:44:09', 'Active', 'syed-ammar-ahmed small.png'),
(2, 'Muhammad Tariq Hafiz', 'itsmth@gmail.com', 'mth', 'test', '2020-07-13 08:28:12', '2020-09-13 16:29:11', 'Active', 'form-man.jpg'),
(3, 'Sheema Sadia', 'onlysheema@gmail.com', 'ss', 'test', '2020-07-13 08:28:12', '2020-09-13 16:29:15', 'Active', 'form-woman.jpg'),
(4, 'test test test', 's.ammarahmed14@gmail.com', 'admin', 'admin', '2020-11-23 14:48:36', '2022-04-07 10:02:45', 'Active', '');

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

--
-- Dumping data for table `tblauthors`
--

INSERT INTO `tblauthors` (`id`, `author_name`, `author_name_urdu`, `creation_date`, `updation_date`) VALUES
(1, ' C.S Lewis', NULL, '2020-04-23 11:50:45', '2020-06-24 12:29:02'),
(2, 'Doctor Imran Mushtaq', 'ڈاکٹر عمران مشتاق', '2020-04-07 14:00:00', '2020-09-16 14:55:23'),
(3, 'Enid Blyton', NULL, '2020-04-14 08:53:52', '2020-06-24 12:29:26'),
(4, 'Ishtiaq Ahmed', 'اشتیاق احمد', '2020-04-16 11:11:28', '2020-09-16 15:41:20'),
(5, 'Ibn E Safi', 'ابنِ صفی', '2020-04-16 11:11:51', '2020-09-16 15:43:13'),
(6, 'Jenny Nimmo', NULL, '2020-04-22 10:38:21', '2020-06-24 12:29:47'),
(7, 'Lemony Snicket', NULL, '2020-04-22 10:53:41', '2020-06-24 12:29:51'),
(8, 'Elspeth Graham', NULL, '2020-04-22 14:23:23', '2020-06-24 12:29:53'),
(9, 'J.K Rowling', NULL, '2020-04-22 14:23:41', '2020-06-24 12:29:56'),
(10, 'Roderick Hunt and Alex Brychta', NULL, '2020-04-23 11:42:10', '2020-06-24 12:29:58'),
(11, 'Author', 'مصنف', '2020-09-13 19:16:40', '2020-12-03 14:57:09');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooks`
--

CREATE TABLE `tblbooks` (
  `id` int(11) NOT NULL,
  `book_pic` text DEFAULT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `book_name_urdu` varchar(250) DEFAULT NULL,
  `cat_id` int(11) DEFAULT 2,
  `author_id` int(11) DEFAULT NULL,
  `isbn_number` varchar(100) DEFAULT NULL,
  `book_price` int(11) NOT NULL DEFAULT 100,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblbooks`
--

INSERT INTO `tblbooks` (`id`, `book_pic`, `book_name`, `book_name_urdu`, `cat_id`, `author_id`, `isbn_number`, `book_price`, `reg_date`, `updation_date`, `status`) VALUES
(1, NULL, 'Cheeunti Hukoomat(Mini Khaas Number)', 'چیونٹی حکومت(منی خاص نمبر)', 2, 4, NULL, 160, '2020-09-23 18:17:29', '2020-09-24 07:51:37', NULL),
(2, NULL, 'Ejaad Ka Khoon', 'ایجاد کا خون', 2, 4, NULL, 130, '2020-09-23 18:17:29', '2020-09-24 07:51:46', NULL),
(3, NULL, 'Jinn Boss(Midium Khaas Number)', 'جن باس(میڈیم خاص نمبر)', 2, 4, NULL, 350, '2020-09-23 18:17:29', '2020-09-24 07:51:57', NULL),
(4, NULL, 'Farooq Key Rooh', 'فاروق کی روح', 2, 4, NULL, 140, '2020-09-23 18:17:29', '2020-09-24 08:01:38', NULL),
(5, NULL, 'Jikan Key Wapsi(Khaas Number)', 'جیکان کی واپسی(خاص نمبر)', 2, 4, NULL, 600, '2020-09-23 18:17:29', '2020-09-24 07:51:50', NULL),
(6, NULL, 'Daire Ka Samander(Khaas Number)', 'دائیرے کا سمندر(خاص نمبر)', 2, 4, NULL, 0, '2020-09-23 18:17:29', '2020-09-24 08:02:16', NULL),
(7, NULL, 'Doosri Duniya Ka Insaan (Khaas Number)', 'دوسری دنیا کا انسان(خاص نمبر)', 2, 4, NULL, 700, '2020-09-23 18:17:29', '2020-09-24 08:06:25', NULL),
(8, NULL, 'Surlaas(Khaas Number)', 'سرلاس(خاص نمبر)', 2, 4, NULL, 850, '2020-09-23 18:17:29', '2020-09-24 08:10:26', NULL),
(9, NULL, 'SurTabu Ka Shahkaar(Khaas Number)', 'سرٹابو کا شاہکار(خاص نمبر)', 2, 4, NULL, 240, '2020-09-23 18:17:29', '2020-09-24 08:10:56', NULL),
(10, NULL, 'Duniya K Qedi(Khaas Number)', 'دنیا کہ قیدی(خاص نمبر)', 2, 4, NULL, 700, '2020-09-23 18:17:29', '2020-09-24 08:17:09', NULL),
(11, NULL, 'Samandar Ka Tuhfa(Khaas Number)', 'سمندر کا تحفہ(خاص نمبر)', 2, 4, NULL, 200, '2020-09-23 18:17:29', '2020-09-24 08:17:21', NULL),
(12, NULL, 'Wadi-E-Khof(Khaas Number)', 'وادیِ خوف (خاص نمبر)', 2, 4, NULL, 0, '2020-09-23 18:17:29', '2020-09-24 08:17:34', NULL),
(13, NULL, 'Wadi-E-Dehshat(Khaas Number)', 'وادیِ دہشت(خاص نمبر)', 2, 4, NULL, 600, '2020-09-23 18:17:29', '2020-09-24 08:20:03', NULL),
(14, NULL, 'Duniya K Us Paar(Khaas Number)', 'دنیا کے اُس پار(خاص نمبر)', 2, 4, NULL, 900, '2020-09-23 18:17:29', '2020-09-24 08:20:25', NULL),
(15, NULL, 'Black Hole(Khaas Number)', 'بلیک ہول(خاص نمبر)', 2, 4, NULL, 850, '2020-09-23 18:17:29', '2020-09-24 08:20:33', NULL),
(16, NULL, 'Jeeral+Abzaal+[Jeeral+Abzaal](Khaas Number)', 'جیرال+ ابظال+ [جیرال+ ابظال] (خاص نمبر)', 2, 4, NULL, 0, '2020-09-23 18:17:29', '2020-09-24 08:20:42', NULL),
(17, NULL, 'Jheel Key Mot(Khaas Number)', 'جھیل کی موت(خاص نمبر)', 2, 4, NULL, 650, '2020-09-23 18:17:29', '2020-09-24 08:20:46', NULL),
(18, NULL, 'Sahil Key Mot(Khaas Number)', 'ساحل کی موت(خاص نمبر)', 2, 4, NULL, 400, '2020-09-23 18:17:29', '2020-09-24 08:20:50', NULL),
(19, NULL, 'Jeeral Ka Mansooba', 'جیرال کا منصوبہ', 2, 4, NULL, 375, '2020-09-23 18:17:29', '2020-09-24 08:20:55', NULL),
(20, NULL, 'Inspector Jamshed Ka Aghwa', 'انسپیکٹر جمشید کا اغواء', 2, 4, NULL, 300, '2020-09-23 18:17:29', '2020-09-24 08:21:00', NULL),
(21, NULL, '13Wa Musafir', '13واں مسافر', 2, 2, NULL, 100, '2020-09-23 18:17:29', '2020-09-24 08:25:20', NULL),
(22, NULL, 'Soone Ka Jahaz(Khaas Number)', 'سونے کا جہاز(خاص نمبر)', 2, 4, NULL, 500, '2020-09-23 18:17:29', '2020-09-24 08:25:29', NULL),
(23, NULL, 'Baraf K Us Paar(Khaas Number)', 'برف کے اُس پار(خاص نمبر)', 2, 4, NULL, 800, '2020-09-23 18:17:29', '2020-09-24 08:25:34', NULL),
(24, NULL, 'Daldal Ka Samandar(Khaas Number)', 'دلدل کا سمندر(خاص نمبر)', 2, 4, NULL, 700, '2020-09-23 18:17:29', '2020-09-24 08:25:43', NULL),
(25, NULL, 'Jaaf Ka Jaal(Khaas Number)', 'جاف کا جال(خاص نمبر)', 2, 4, NULL, 400, '2020-09-23 18:17:29', '2020-09-24 08:25:49', NULL),
(26, NULL, 'Dafan Shuda Shehar Ma\'a Zolaan Key Wapsi', 'دفن شدہ شہرمع زولان کی واپسی', 2, 4, NULL, 750, '2020-09-23 18:17:29', '2020-09-24 08:25:53', NULL),
(27, NULL, 'Aakhri Samandar(Khaas Number)', 'آخری سمندر(خاص نمبر)', 2, 4, NULL, 500, '2020-09-23 18:17:29', '2020-09-24 08:26:21', NULL),
(28, NULL, 'Sea Moon Key Wapsi(Khaas Number)', 'سی مون کی واپسی(خاص نمبر)', 2, 4, NULL, 700, '2020-09-23 18:17:29', '2020-09-24 08:26:32', NULL),
(29, NULL, 'Hatim Ka Bacha', 'حاتم کا بچہ', 2, 4, NULL, 140, '2020-09-23 18:17:29', '2020-09-24 08:26:43', NULL),
(30, NULL, 'Uran Tashtari Ka Tajurba (Khaas Number)', 'اُڑن طشتری کا تجربہ(خاص نمبر)', 2, 4, NULL, 0, '2020-09-23 18:17:29', '2020-09-24 08:27:15', NULL),
(31, NULL, 'Shehzade Ka Aghwa', 'شہزادے کا اغواء', 2, 4, NULL, 140, '2020-09-23 18:17:29', '2020-09-24 08:27:24', NULL),
(32, NULL, 'Chaand Ka Nishaan', 'چاند کا نشان', 2, 4, NULL, 80, '2020-09-23 18:17:29', '2020-09-24 08:27:39', NULL),
(33, NULL, 'Jazeere Ka Samander(Khaas Number)', 'جزیرے کا سمندر(خاص نمبر)', 2, 4, NULL, 700, '2020-09-23 18:17:29', '2020-09-24 08:27:21', NULL),
(34, NULL, 'Zahoor Ka Aghwa', 'ظہور کا اغواء', 2, 4, NULL, 140, '2020-09-23 18:17:29', '2020-09-24 08:28:04', NULL),
(35, NULL, 'Andha Jurm', 'اندھا جرم', 2, 4, NULL, 100, '2020-09-23 18:17:29', '2020-09-24 08:28:22', NULL),
(36, NULL, 'Insaani Quwa', 'انسانی کنواں', 2, 4, NULL, 130, '2020-09-23 18:17:29', '2020-09-24 08:28:30', NULL),
(37, NULL, 'Gaind Ka Tufaan', 'گیند کا طوفان', 2, 4, NULL, 130, '2020-09-23 18:17:29', '2020-09-24 08:28:36', NULL),
(38, NULL, 'Kaise Kaise Sanp', 'کیسے کیسے سانپ', 2, 4, NULL, 140, '2020-09-23 18:17:29', '2020-09-24 08:28:43', NULL),
(39, NULL, 'Naati Shaati(Mini Khaas Number)', 'ناٹی شاٹی(منی خاص نمبر)', 2, 4, NULL, 300, '2020-09-23 18:17:29', '2020-09-24 08:28:48', NULL),
(40, NULL, 'Khoon Khuaar Sahil(Mini Khaas Number)', 'خون خوار ساحل(منی خاص نمبر)', 2, 4, NULL, 240, '2020-09-23 18:17:29', '2020-09-24 08:28:57', NULL),
(41, NULL, 'Bhayanak Roop', 'بھیانک روپ', 2, 4, NULL, 130, '2020-09-23 18:17:29', '2020-09-24 08:29:05', NULL),
(42, NULL, 'Qiyaamat k Baghi(Khaas Number)', 'قیامت کے باغی(خاص نمبر)', 2, 4, NULL, 900, '2020-09-23 18:17:29', '2020-09-24 08:29:12', NULL),
(43, NULL, 'Anokha Roop', 'انوکھا روپ', 2, 4, NULL, 120, '2020-09-23 18:17:29', '2020-09-24 08:29:17', NULL),
(44, NULL, 'Akhri Jhatka', 'آخری جھٹکا', 2, 4, NULL, 130, '2020-09-23 18:17:29', '2020-09-24 08:29:24', NULL),
(45, NULL, 'Siah Amwaat', 'سیاہ اموات', 2, 4, NULL, 140, '2020-09-23 18:17:29', '2020-09-24 08:29:29', NULL),
(46, NULL, 'Ashrafi Ka Raaz', 'اشرفی کا راز', 2, 4, NULL, 96, '2020-09-23 18:17:29', '2020-09-24 08:29:35', NULL),
(47, NULL, 'Moot Ka Rasta', 'موت کا راستہ', 2, 4, NULL, 100, '2020-09-23 18:17:29', '2020-09-24 08:29:41', NULL),
(48, NULL, 'Anokhi Chaal', 'انوکھی چال', 2, 4, NULL, 140, '2020-09-23 18:17:29', '2020-09-24 08:29:47', NULL),
(49, NULL, 'Aasmaani Awaaze', 'آسمانی آوازیں', 2, 4, NULL, 240, '2020-09-23 18:17:29', '2020-09-24 08:29:53', NULL),
(50, NULL, 'Bad Naseeb Hotel', 'بدنصیب ہوٹل', 2, 4, NULL, 140, '2020-09-23 18:17:29', '2020-09-24 08:30:01', NULL),
(51, NULL, 'Chai Ka Cup', 'چائے کا کپ', 2, 4, NULL, 130, '2020-09-23 18:17:29', '2020-09-24 08:30:06', NULL),
(52, NULL, 'Chaal Ka Jawab', 'چال کا جواب', 2, 4, NULL, 140, '2020-09-23 18:17:29', '2020-09-24 08:30:32', NULL),
(53, NULL, 'Reshme Parchai', 'ریشمی پرچھاایئں', 2, 4, NULL, 240, '2020-09-23 18:17:29', '2020-09-24 08:30:38', NULL),
(54, NULL, 'Ghulaam Khana', 'غلام خانہ', 2, 4, NULL, 110, '2020-09-23 18:17:29', '2020-09-24 08:30:43', NULL),
(55, '', 'Chand Key Laash', 'چاند کی لاش', 2, 4, '978-969-601-026-5', 300, '2020-09-23 18:17:29', '2020-10-10 18:22:06', NULL),
(56, '', 'Aghwa Ka Jaal', 'اغوا کاجال', 2, 4, 'Not Available', 80, '2020-09-23 18:17:29', '2020-10-10 18:21:06', NULL),
(57, '', 'Purasraar Mehmaan', 'پراسرار مہمان', 2, 4, 'Not Available', 50, '2020-09-23 18:17:29', '2020-10-10 18:20:26', NULL),
(58, '', 'Ghar Ka Samandar(Khaas Number)', 'غار کا سمندر(خاص نمبر)', 2, 4, '978-969-601-200-9', 750, '2020-09-23 18:17:29', '2020-10-10 18:12:26', NULL);

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

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `category_name`, `status`, `creation_date`, `updation_date`) VALUES
(1, 'Urdu Magazine', 'Active ', '2020-04-23 11:48:32', '2020-06-24 12:16:43'),
(2, 'Urdu Novel', 'Active', '2020-04-14 10:43:39', '2020-06-24 12:42:23'),
(3, 'English Story Book', 'Active', '2020-04-14 12:37:53', '2020-06-24 12:42:52'),
(4, 'Computer Science', 'Active ', '2020-04-15 10:13:21', '2020-06-24 12:16:50'),
(5, 'English Encyclopedia', 'Active ', '2020-04-22 10:54:34', '2020-06-24 12:16:53'),
(6, 'Urdu Encyclopedia', 'Active ', '2020-04-23 09:14:35', '2020-06-24 12:16:56'),
(7, 'English Novel', 'Active', '2020-06-24 12:43:25', '2020-07-16 15:24:31'),
(8, 'Biology Science', 'Active', '2020-09-13 19:18:03', '2020-12-03 14:37:30'),
(9, 'Chemistry Science', 'Active', '2020-12-03 14:42:03', '2020-12-03 14:42:03'),
(10, 'Physics Science', 'Active', '2020-12-03 14:43:25', '2020-12-03 14:43:25'),
(11, 'English Dictionary', 'Active', '2020-12-03 14:45:29', '2020-12-03 14:51:43'),
(12, 'Urdu Dictionary', 'Active', '2020-12-03 14:49:21', '2020-12-03 14:52:23');

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

--
-- Dumping data for table `tblfeedback`
--

INSERT INTO `tblfeedback` (`id`, `feedback`, `feedback_urdu`, `user_id`, `email_id`, `creation_date`, `rating`, `reply_date`, `feedback_reply`, `reply_id`) VALUES
(1, 'Wow Nice!', '', 1, 's.ammarahmed14@gmail.com', '2020-08-09 08:26:15', 4, '2022-04-07 09:59:29', '', 0);

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

--
-- Dumping data for table `tblissuedbooksdetail`
--

INSERT INTO `tblissuedbooksdetail` (`id`, `book_id`, `user_id`, `issue_date`, `due_date`, `return_date`, `return_status`, `day_fine`, `damagepage_fine`, `extra_fine`, `total_fine`, `comments`) VALUES
(1, 57, '3', '2022-03-30 19:00:00', '2022-04-10 19:00:00', '2022-04-07 10:51:59', 1, 0, 0, 0, 0, 'Just For Test She Requested.');

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

--
-- Dumping data for table `tblrulesandregulations`
--

INSERT INTO `tblrulesandregulations` (`id`, `rule`, `rule_urdu`, `creation_date`, `updation_date`) VALUES
(1, 'Before Donating anything write your name on it with full Date. \r\nExample: \r\nDonated To Masooma Library \r\nName Sadia Date:1-January-2019 Day: Tuesday.', 'کوئ بھی چیز لائبریری میں وقف کرنے سے پہلے اس پر اپنا نام بمع مکمل تاریخ درج کریں۔\r\nجیسے:۔\r\nوقف برائے معصومہ لائبریری \r\nنام: سعدیہ ، بتاریخ: ۱جنوری۲۰۱۹ء بروز اتوار۔', '2020-07-06 17:47:55', '2020-09-23 15:07:09'),
(2, 'After Donating, the book or the the thing which have been donated will be  not be yours (it will be of library) and you can\'t take Donated thing back.', 'کوئ سی بھی چیز وقف کرنے کے بعد آپ کی نہیں رہے گی(لائبریری کی ہو جائے گی) اور واپس نہیں لی/کی جاسکتی۔', '2020-07-21 15:51:51', '2020-09-23 16:06:15'),
(3, 'You can only borrow one book at a time.', 'ایک وقت میں ایک ہی کتاب ادھار کی جاسکتی ہے۔', '2020-07-21 16:10:53', '2020-09-23 16:07:06'),
(4, 'Maximum days of borrowing a book are 10 days.', 'ایک کتاب زیادہ سے زیادہ دس دن تک ادھار کی جاسکتی ہے۔', '2020-07-21 16:11:10', '2020-09-23 16:08:55'),
(5, 'After 10 days (of borrowing), \"fine of 2 Rs.\" (per day) will be charged.', 'دس دن کے بعد(ادھار کرنے کے)، ۲ روپے(فی دن) کے حساب سے جرمانہ عائد ہوگا۔', '2020-07-21 16:11:25', '2020-09-23 16:11:29'),
(6, 'Turning the corner of the page and writing in book isn\'t allowed; if you turn or write so, \"10 Rs. fine\" (per page) will be charged.', 'کسی بھی کتاب کے صفحے کو موڑنا اور کتاب پر لکھنا سختی سے منع ہے اور اگر کسی نے یا لکھا تو دس روپے(فی صفحہ) کے حساب سے جرمانہ عائد ہوگا۔', '2020-07-21 16:11:37', '2020-09-23 16:13:58'),
(7, 'If you miss any book you will have to replace it but if you can’t replace it, you have to give the cost of that book to library committee.', 'اگر آپ سے کوئ سی کتاب کھو جاتی ہے تو آپ کو اس کی جگہ وہی کتاب نئی لے کر لائبریر کو دینی ہوگی یا پھر اس کی قیمت لائبریری کمیٹی میں جمع کرانی ہوگی۔', '2020-10-18 09:42:48', '2020-10-18 09:42:48'),
(8, 'If you are donating a book which is not in good condition (from inside or outside), you\'ll have to tell library committee.', 'اگر آپ کوئی ایسی کتاب وقف کر رہے ہیں جو اچھی حالت میں نہیں (اندر سے یا باہر سے) ، تو آپ کو لائبریری کمیٹی کو بتانا ہوگا۔', '2020-10-18 09:46:14', '2020-10-18 09:46:14'),
(9, 'If you have seen a book in library which isn’t in good condition (from inside or outside) so must tell library committee.', 'اگر آپ نے لائبریری میں کوئی ایسی کتاب دیکھی ہے جو اچھی حالت میں نہیں (اندر سے یا باہر سے)، تو لائبریری کمیٹی کو ضرور بتائیں۔', '2020-10-18 09:48:17', '2020-10-18 09:48:17');

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
  `updation_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblslider`
--

INSERT INTO `tblslider` (`id`, `title`, `slider_img`, `content`, `creation_date`, `updation_date`) VALUES
(1, 'test title', 'author.png', 'test', '2020-07-13 18:04:15', '2020-07-13 18:42:16'),
(2, 'test title2', 'author1.png', '123456789 test', '2020-07-13 18:43:39', '2020-07-13 18:43:39');

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
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`, `full_name`, `email_id`, `mobile_no`, `user_name`, `password`, `status`, `profile_picture`, `reg_date`, `updation_date`, `user_role`) VALUES
(1, 'Syed Ammar Ahmed', 's.ammarahmed14@gmail.com', '03342756490', 'S.A.A', '123@Masoomalibrary', 'Active', 'image-removebg-preview.png', '2020-04-18 22:08:17', '2020-07-24 16:50:31', 'User'),
(2, 'Sheema Sadia Safdar', 'onlysheema@gmail.com', '123', 'SS', '123@Sheema', 'Active', 'users1.png', '2020-04-14 01:58:54', '2020-08-06 18:31:35', 'User'),
(3, 'Syeda Hania Sameer', 'syedammarahmed14@outlook.com', '03342786490', 'SHS', '123@Hania', 'Active', 'logo.png', '2020-04-15 18:59:06', '2020-10-13 16:38:33', 'User'),
(4, 'Muhemmad Humza Bin Najam Us Saquib', 'emailhumza@gmail.com', '03452672902', 'MH', '123@Hamza', 'Active', 'Picture111.png', '2020-08-19 19:10:11', '2020-10-04 11:47:22', 'User'),
(5, 'Muhammad Haris Bin Najam Us Saquib', 'harismuhammad102@gmail.com', '03009217648', 'Haris', '123@Haris', 'Active', 'IMG-20191018-WA0016.jpg', '2020-10-07 08:14:45', '2020-10-10 17:34:45', 'User'),
(6, 'Areesha Binte Faisal', 'onlyareesha@gmail.com', '03333584269', 'ABF', '123@Areessha', 'Active', 'Fire.png', '2020-10-10 18:37:36', '2020-10-10 18:42:56', 'User'),
(8, 'Muhammad Talha Bin Faisal', 'patanaino.2@gmail.com', '+92 340 8684880', 'MTBF', '123@Talha', 'Active', 'WhatsApp Image 2020-10-01 at 1.43.55 PM-removebg-preview (1).jpg', '2020-10-10 18:50:49', '2020-10-10 19:13:13', 'User'),
(11, 'Syed Salman Ahmed', 'syedammarahmed14@outlook.com', '03342786490', 'SSA', '123@Salman', 'Active', 'Circle_hi_Circle.png', '2020-10-10 19:16:09', '2020-10-10 19:17:16', 'User'),
(12, 'test test test', 'syedammarahmed14@outlook.com', '03342786490', 'test', 'user', 'Inactive', '', '2020-11-24 14:51:12', '2020-11-24 14:51:12', 'User');

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
  ADD UNIQUE KEY `id_2` (`id`),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblauthors`
--
ALTER TABLE `tblauthors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblbooks`
--
ALTER TABLE `tblbooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblfeedback`
--
ALTER TABLE `tblfeedback`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblissuedbooksdetail`
--
ALTER TABLE `tblissuedbooksdetail`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblrulesandregulations`
--
ALTER TABLE `tblrulesandregulations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblslider`
--
ALTER TABLE `tblslider`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
