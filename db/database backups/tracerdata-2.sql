-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2022 at 03:29 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tracerdata`
--

-- --------------------------------------------------------

--
-- Table structure for table `forum_comment`
--

CREATE TABLE `forum_comment` (
  `comment_ID` int(11) UNSIGNED NOT NULL,
  `comment_topicID` int(11) UNSIGNED DEFAULT NULL,
  `comment_userID` int(11) UNSIGNED DEFAULT NULL,
  `comment_content` varchar(500) DEFAULT NULL,
  `comment_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_comment`
--

INSERT INTO `forum_comment` (`comment_ID`, `comment_topicID`, `comment_userID`, `comment_content`, `comment_date`) VALUES
(2, 15, 4, 'asdasdasd', '2018-03-03 15:35:39'),
(3, 17, 3, 'ytyutyu', '2018-03-12 08:04:12'),
(4, 17, 3, '343eesdf', '2022-10-10 12:40:52'),
(5, 15, 1, 'sample', '2022-10-10 12:57:48'),
(6, 17, 1, 'sample', '2022-12-26 17:01:57'),
(7, 19, 1, 'Hello', '2022-12-27 08:21:56');

-- --------------------------------------------------------

--
-- Table structure for table `forum_comment_reply`
--

CREATE TABLE `forum_comment_reply` (
  `comment_reply_ID` int(11) UNSIGNED NOT NULL,
  `comment_reply_topicID` int(10) UNSIGNED DEFAULT NULL,
  `comment_reply_parentID` int(11) UNSIGNED DEFAULT NULL,
  `comment_reply_userID` int(11) UNSIGNED DEFAULT NULL,
  `comment_reply_content` varchar(500) DEFAULT NULL,
  `comment_reply_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forum_topic`
--

CREATE TABLE `forum_topic` (
  `topic_ID` int(11) UNSIGNED NOT NULL,
  `post_title` varchar(150) DEFAULT NULL,
  `post_owner_id` int(11) UNSIGNED DEFAULT NULL,
  `post_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `post_content` varchar(50000) DEFAULT NULL,
  `post_status` varchar(25) DEFAULT 'UNPIN'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_topic`
--

INSERT INTO `forum_topic` (`topic_ID`, `post_title`, `post_owner_id`, `post_date`, `post_content`, `post_status`) VALUES
(15, 'Purchase Printed Yearbooks', 1, '2018-02-24 14:48:22', '<p>asda</p>\r\n', 'UNPIN'),
(16, 'Job Hirings', 4, '2018-02-24 15:09:46', '<p>asdasd</p>\r\n', 'UNPIN'),
(17, 'Fundings', 3, '2022-12-26 16:59:04', '<p>d213123123</p>\r\n', 'PIN'),
(18, 'Q&A', 1, '2022-10-09 09:38:22', '<p>asdadsasd<a href=\"https://is2-ssl.mzstatic.com/image/thumb/Purple122/v4/80/cc/0c/80cc0cf1-7129-bec0-cf2e-731a646663ba/logo_maps_ios_color-0-1x_U007emarketing-0-0-0-6-0-0-85-220.png/1200x630wa.png\"><img alt=\"\" src=\"https://is2-ssl.mzstatic.com/image/thumb/Purple122/v4/80/cc/0c/80cc0cf1-7129-bec0-cf2e-731a646663ba/logo_maps_ios_color-0-1x_U007emarketing-0-0-0-6-0-0-85-220.png/1200x630wa.png\" style=\"height:158px; width:300px\" /></a></p>\r\n', 'UNPIN'),
(19, 'Teacher FOrum', 17, '2022-12-26 17:07:04', '<p>sample body</p>\r\n', 'PIN');

-- --------------------------------------------------------

--
-- Table structure for table `marital_status`
--

CREATE TABLE `marital_status` (
  `ID` int(11) UNSIGNED NOT NULL,
  `marital_Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marital_status`
--

INSERT INTO `marital_status` (`ID`, `marital_Name`) VALUES
(1, 'Single'),
(2, 'Married'),
(3, 'Widowed');

-- --------------------------------------------------------

--
-- Table structure for table `message_send`
--

CREATE TABLE `message_send` (
  `message_ID` int(11) UNSIGNED NOT NULL,
  `message_threadID` int(11) UNSIGNED DEFAULT NULL,
  `message_sendDate` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `message_content` varchar(1500) DEFAULT NULL,
  `message_receiver` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message_send`
--

INSERT INTO `message_send` (`message_ID`, `message_threadID`, `message_sendDate`, `message_content`, `message_receiver`) VALUES
(1, 1, '2018-02-22 15:22:11', 'waaaaaaaa', 3),
(2, 1, '2018-02-22 15:22:13', 'meeeeeeeeeeeee', 3);

-- --------------------------------------------------------

--
-- Table structure for table `message_send_state`
--

CREATE TABLE `message_send_state` (
  `state_ID` int(11) UNSIGNED NOT NULL,
  `state_msgID` int(11) UNSIGNED DEFAULT NULL,
  `state_readerID` int(11) UNSIGNED DEFAULT NULL,
  `state_dateRead` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message_send_state`
--

INSERT INTO `message_send_state` (`state_ID`, `state_msgID`, `state_readerID`, `state_dateRead`) VALUES
(1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `message_thread`
--

CREATE TABLE `message_thread` (
  `thread_ID` int(11) UNSIGNED NOT NULL,
  `thread_name` varchar(150) DEFAULT NULL,
  `thread_created` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message_thread`
--

INSERT INTO `message_thread` (`thread_ID`, `thread_name`, `thread_created`) VALUES
(1, '64564', '2018-02-22 15:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `message_thread_participant`
--

CREATE TABLE `message_thread_participant` (
  `participant_ID` int(11) UNSIGNED NOT NULL,
  `participant_threadID` int(11) UNSIGNED DEFAULT NULL,
  `participant_userID` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message_thread_participant`
--

INSERT INTO `message_thread_participant` (`participant_ID`, `participant_threadID`, `participant_userID`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `position_id` int(10) NOT NULL,
  `position_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`position_id`, `position_name`) VALUES
(1, 'College Dean'),
(2, 'Department Chair'),
(3, 'Faculty');

-- --------------------------------------------------------

--
-- Table structure for table `psu_college`
--

CREATE TABLE `psu_college` (
  `colleges_ID` int(11) UNSIGNED NOT NULL,
  `college_name` varchar(150) DEFAULT NULL,
  `college_acronym` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `psu_college`
--

INSERT INTO `psu_college` (`colleges_ID`, `college_name`, `college_acronym`) VALUES
(1, 'College of Computing', 'COC'),
(2, 'College of Arts and Education', 'COAE')
(3, 'College of Engineering and Architecture', 'COEA')
;

-- --------------------------------------------------------

--
-- Table structure for table `psu_course`
--

CREATE TABLE `psu_course` (
  `course_ID` int(11) UNSIGNED NOT NULL,
  `course_departmentID` int(11) UNSIGNED DEFAULT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `course_acronym` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `psu_course`
--

INSERT INTO `psu_course` (`course_ID`, `course_departmentID`, `course_name`, `course_acronym`) VALUES
(1, 2, 'Bachelor of Science in Information Technology', 'BSIT'),
(2, 1, 'Bachelor of Science in Computer Engineering', 'BSCOE'),
(3, 2, 'Bachelor of Science in Mathematics', 'BSMATH')
(4, 1, 'Bachelor of Science in Civil Engineering', 'BSCE')
(5, 1, 'Bachelor of Science in Mechanical Engineering', 'BSME')
(6, 1, 'Bachelor of Science in Electric Engineering', 'BSEE')
(7, 1, 'Bachelor of Science in Architecture', 'BSArchi')
(8, 3, 'Bachelor of Arts in the English Language', 'ABEL')
(9, 3, 'Bachelor of Secondary Education major in Filipino', 'BSED')
(10, 3, 'Bachelor of Secondary Education major in Science', 'BSED')
(11, 3, 'Bachelor of Early Childhood Education', 'BECED');

-- --------------------------------------------------------

--
-- Table structure for table `psu_department`
--

CREATE TABLE `psu_department` (
  `department_ID` int(11) UNSIGNED NOT NULL,
  `department_collegeID` int(11) UNSIGNED DEFAULT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `department_acronym` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `psu_department`
--

INSERT INTO `psu_department` (`department_ID`, `department_collegeID`, `department_name`, `department_acronym`) VALUES
(1, 1, 'IT department', 'COMSCI'),
(2, 1, 'Math department', 'IT'),
(3, 1, 'Education department', 'IT'),
(4, 1, 'Office Administration', 'OA');

-- --------------------------------------------------------

--
-- Table structure for table `suggested_job`
--

CREATE TABLE `suggested_job` (
  `job_ID` int(11) UNSIGNED NOT NULL,
  `job_Title` varchar(250) DEFAULT NULL,
  `job_Course` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suggested_job`
--

INSERT INTO `suggested_job` (`job_ID`, `job_Title`, `job_Course`) VALUES
(1, 'Web Developer', 1),
(2, 'Data Analyst', 1),
(3, 'Database Administrator', 3),
(5, 'Computer Support Specialist', 1),
(6, 'Computer Network Architect', 1),
(7, 'Information Security Analyst', 1),
(8, 'Software Developer', 1),
(9, 'Application Developer', 1),
(10, 'Applications Engineer', 1),;

-- --------------------------------------------------------

--
-- Table structure for table `survey`
--

CREATE TABLE `survey` (
  `survey_ID` int(11) UNSIGNED NOT NULL,
  `survey_name` varchar(255) DEFAULT NULL,
  `survey_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `visibility` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey`
--

INSERT INTO `survey` (`survey_ID`, `survey_name`, `survey_date`, `visibility`) VALUES
(1, 'WAMMI Usability Questionnaire', '2018-05-04 17:25:50', 1),
(2, 'Feedback', '2018-05-04 17:25:50', 1),
(3, 'Survey Title 3', '2018-05-01 09:11:37', 1);

-- --------------------------------------------------------

--
-- Table structure for table `survey_answer`
--

CREATE TABLE `survey_answer` (
  `a_ID` int(11) UNSIGNED NOT NULL,
  `survey_aID` int(11) UNSIGNED DEFAULT NULL,
  `user_ID` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey_answer`
--

INSERT INTO `survey_answer` (`a_ID`, `survey_aID`, `user_ID`, `form_id`) VALUES
(24, 4, 3, 18),
(25, 5, 3, 18),
(26, 6, 3, 18),
(27, 7, 3, 18),
(28, 17, 3, 18),
(29, 1, 3, 19),
(30, 3, 3, 19),
(31, 4, 3, 19),
(32, 5, 3, 19),
(33, 6, 3, 19),
(34, 7, 3, 19),
(35, 17, 3, 19),
(36, 1, 1, NULL),
(37, 3, 1, NULL),
(38, 4, 1, NULL),
(39, 5, 1, NULL),
(40, 6, 1, NULL),
(41, 7, 1, NULL),
(42, 17, 1, NULL),
(43, 1, 18, NULL),
(44, 3, 18, NULL),
(45, 4, 18, NULL),
(46, 5, 18, NULL),
(47, 6, 18, NULL),
(48, 7, 18, NULL),
(49, 17, 18, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `survey_answer_other`
--

CREATE TABLE `survey_answer_other` (
  `ao_ID` int(11) NOT NULL,
  `user_ID` int(11) DEFAULT NULL,
  `survey_aID` int(11) NOT NULL,
  `survey_aString` varchar(250) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey_answer_other`
--

INSERT INTO `survey_answer_other` (`ao_ID`, `user_ID`, `survey_aID`, `survey_aString`, `form_id`) VALUES
(10, 3, 2, '11111111111111', 18),
(11, 3, 8, '1111111111111111111', 18);

-- --------------------------------------------------------

--
-- Table structure for table `survey_anweroptions`
--

CREATE TABLE `survey_anweroptions` (
  `survey_aID` int(11) UNSIGNED NOT NULL,
  `survey_qID` int(11) UNSIGNED DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey_anweroptions`
--

INSERT INTO `survey_anweroptions` (`survey_aID`, `survey_qID`, `answer`) VALUES
(1, 1, 'aaaaa'),
(2, 1, 'other(s)'),
(3, 2, 'aa'),
(4, 3, 'bb'),
(5, 4, 'a'),
(6, 5, 'b'),
(7, 6, 'aa'),
(8, 2, 'other(s)'),
(10, 8, 'asdasd'),
(11, 8, 'asdasdasd'),
(12, 8, '31'),
(13, 8, '2'),
(15, 9, 'a'),
(16, 9, 'b'),
(17, 7, 'c'),
(18, 9, '123'),
(19, 10, 'asdasdasd'),
(20, 10, 'asdd'),
(21, 10, 'dsd');

-- --------------------------------------------------------

--
-- Table structure for table `survey_forms`
--

CREATE TABLE `survey_forms` (
  `form_id` int(11) UNSIGNED NOT NULL,
  `form_ownerID` int(11) UNSIGNED DEFAULT NULL,
  `form_taken` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `survey_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey_forms`
--

INSERT INTO `survey_forms` (`form_id`, `form_ownerID`, `form_taken`, `survey_ID`) VALUES
(0, 0, '2018-02-04 12:23:39', NULL),
(1, 1, '2018-02-04 13:24:38', NULL),
(2, 1, '2018-02-07 16:41:32', NULL),
(3, 18, '2018-03-17 04:47:43', NULL),
(4, 18, '2018-03-17 04:57:57', NULL),
(5, 21, '2018-03-17 09:57:10', NULL),
(6, 22, '2018-03-17 10:00:10', NULL),
(7, 1, '2018-03-30 03:14:57', NULL),
(10, 3, '2018-05-04 15:30:07', NULL),
(11, 3, '2018-05-04 15:30:58', NULL),
(12, 3, '2018-05-04 16:12:47', 1),
(13, 3, '2018-05-04 17:09:01', 1),
(14, 3, '2018-05-04 17:18:32', 1),
(15, 3, '2018-05-04 17:21:25', 2),
(16, 3, '2018-05-04 17:26:24', 1),
(17, 3, '2018-05-04 17:26:43', 1),
(18, 3, '2018-05-04 17:42:26', 1),
(19, 3, '2018-05-04 17:42:35', 1);

-- --------------------------------------------------------

--
-- Table structure for table `survey_maxcount`
--

CREATE TABLE `survey_maxcount` (
  `survey_id` int(11) UNSIGNED NOT NULL,
  `survey_ownerID` int(11) UNSIGNED DEFAULT NULL,
  `survey_maxattemp` int(11) DEFAULT NULL,
  `survey_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey_maxcount`
--

INSERT INTO `survey_maxcount` (`survey_id`, `survey_ownerID`, `survey_maxattemp`, `survey_date`) VALUES
(1, 1, 2, '2018-05-01 07:08:27'),
(2, 3, 0, '2018-05-04 17:42:35'),
(3, 6, 2, '2018-02-18 16:00:00'),
(4, 18, 2, '2022-10-10 14:06:08'),
(5, 19, 2, '2018-03-07 17:46:58'),
(6, 21, 1, '2018-03-17 09:57:10'),
(7, 22, 1, '2018-03-17 10:00:10');

-- --------------------------------------------------------

--
-- Table structure for table `survey_question1`
--

CREATE TABLE `survey_question1` (
  `survey_qID` int(11) UNSIGNED NOT NULL,
  `row` int(11) DEFAULT NULL,
  `col1` varchar(50) DEFAULT NULL,
  `col2` varchar(50) DEFAULT NULL,
  `survey_formID` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey_question1`
--

INSERT INTO `survey_question1` (`survey_qID`, `row`, `col1`, `col2`, `survey_formID`) VALUES
(1, 1, '', 'G_MS_MA_PHD1', 1),
(2, 2, '', 'G_MS_MA_PHD2', 1),
(3, 3, '', '', 1),
(4, 4, 'U_AB_BS4', '', 1),
(5, 5, 'U_AB_BS5', '', 1),
(6, 6, '', '', 1),
(7, 7, '', 'G_MS_MA_PHD7', 1),
(8, 8, '', 'G_MS_MA_PHD8', 1),
(9, 9, 'U_AB_BS9', '', 1),
(10, 10, 'U_AB_BS10', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `survey_question2`
--

CREATE TABLE `survey_question2` (
  `survey_qID` int(11) UNSIGNED NOT NULL,
  `survey_row1` int(11) DEFAULT NULL,
  `survey_col1` varchar(50) DEFAULT 'no',
  `survey_formID` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey_question2`
--

INSERT INTO `survey_question2` (`survey_qID`, `survey_row1`, `survey_col1`, `survey_formID`) VALUES
(1, 1, 'yes', 1),
(2, 2, 'no', 1),
(3, 3, 'yes', 1),
(4, 4, 'yes', 1),
(5, 5, 'cccccccccccccc', 1),
(6, 1, 'no', 2),
(7, 2, 'no', 2),
(8, 3, 'no', 2),
(9, 4, 'no', 2),
(10, 5, '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `survey_question3`
--

CREATE TABLE `survey_question3` (
  `survey_qID` int(11) NOT NULL,
  `row` int(11) DEFAULT NULL,
  `col1` varchar(1) DEFAULT '0',
  `col2` varchar(1) DEFAULT '0',
  `survey_formID` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey_question3`
--

INSERT INTO `survey_question3` (`survey_qID`, `row`, `col1`, `col2`, `survey_formID`) VALUES
(1, 1, '1', '', 1),
(2, 2, '', '1', 1),
(3, 3, '1', '', 1),
(4, 4, '1', '1', 1),
(5, 1, '', '', 2),
(6, 2, '', '', 2),
(7, 3, '', '', 2),
(8, 4, '', '', 2),
(9, 1, '1', '', 3),
(10, 2, '', '1', 3),
(11, 3, '1', '', 3),
(12, 4, '', '1', 3),
(13, 1, '', '1', 4),
(14, 2, '1', '', 4),
(15, 3, '', '1', 4),
(16, 4, '1', '', 4),
(17, 1, '', '1', 5),
(18, 2, '', '1', 5),
(19, 3, '', '1', 5),
(20, 4, '', '1', 5),
(21, 1, '', '1', 6),
(22, 2, '', '1', 6),
(23, 3, '', '1', 6),
(24, 4, '', '1', 6),
(25, 1, '', '', 7),
(26, 2, '', '', 7),
(27, 3, '', '', 7),
(28, 4, '', '', 7);

-- --------------------------------------------------------

--
-- Table structure for table `survey_question4`
--

CREATE TABLE `survey_question4` (
  `survey_qID` int(11) UNSIGNED NOT NULL,
  `row1` int(11) DEFAULT NULL,
  `col1` varchar(1) DEFAULT '0',
  `survey_formID` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey_question4`
--

INSERT INTO `survey_question4` (`survey_qID`, `row1`, `col1`, `survey_formID`) VALUES
(1, 1, '1', 1),
(2, 2, '1', 1),
(3, 3, '1', 1),
(4, 4, '1', 1),
(5, 5, '1', 1),
(6, 6, '1', 1),
(7, 1, '', 2),
(8, 2, '', 2),
(9, 3, '', 2),
(10, 4, '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `survey_question5`
--

CREATE TABLE `survey_question5` (
  `survey_qID` int(11) UNSIGNED NOT NULL,
  `ans` varchar(5) DEFAULT NULL,
  `survey_formID` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey_question5`
--

INSERT INTO `survey_question5` (`survey_qID`, `ans`, `survey_formID`) VALUES
(1, 'yes', 1),
(2, 'yes', 2),
(3, 'yes', 3),
(4, 'yes', 4),
(5, 'yes', 5),
(6, 'yes', 6),
(7, '', 7);

-- --------------------------------------------------------

--
-- Table structure for table `survey_question6`
--

CREATE TABLE `survey_question6` (
  `survey_qID` int(11) UNSIGNED NOT NULL,
  `ans` varchar(10) DEFAULT NULL,
  `survey_formID` int(11) UNSIGNED DEFAULT NULL,
  `job` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey_question6`
--

INSERT INTO `survey_question6` (`survey_qID`, `ans`, `survey_formID`, `job`) VALUES
(1, 'temp', 1, NULL),
(2, 'rop', 2, 'Web Developer'),
(3, 'temp', 3, 'Web Developer'),
(4, 'con', 4, 'Data Scientist'),
(5, 'rop', 5, 'Executive Assistant'),
(6, 'rop', 6, 'Web Developer'),
(7, '', 7, 'asdasdasd');

-- --------------------------------------------------------

--
-- Table structure for table `survey_question7`
--

CREATE TABLE `survey_question7` (
  `survey_qID` int(11) UNSIGNED NOT NULL,
  `survey_ans` varchar(1) DEFAULT '0',
  `survey_formID` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey_question7`
--

INSERT INTO `survey_question7` (`survey_qID`, `survey_ans`, `survey_formID`) VALUES
(1, '1', 1),
(2, '0', 2),
(3, '1', 3),
(4, '0', 4),
(5, '1', 5),
(6, '1', 6),
(7, '1', 7);

-- --------------------------------------------------------

--
-- Table structure for table `survey_question8`
--

CREATE TABLE `survey_question8` (
  `survey_qID` int(11) UNSIGNED NOT NULL,
  `row1` int(11) DEFAULT NULL,
  `col1` varchar(50) DEFAULT NULL,
  `survey_formID` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey_question8`
--

INSERT INTO `survey_question8` (`survey_qID`, `row1`, `col1`, `survey_formID`) VALUES
(1, 1, '1', 1),
(2, 2, '', 1),
(3, 3, '1', 1),
(4, 4, '1', 1),
(5, 5, '1', 1),
(6, 6, 'fff', 1),
(7, 1, '1', 3),
(8, 2, '', 3),
(9, 3, '1', 3),
(10, 4, '', 3),
(11, 5, '1', 3),
(12, 6, 'ghg', 3),
(13, 1, '', 5),
(14, 2, '', 5),
(15, 3, '', 5),
(16, 4, '', 5),
(17, 5, '1', 5),
(18, 6, '', 5),
(19, 1, '1', 6),
(20, 2, '', 6),
(21, 3, '', 6),
(22, 4, '', 6),
(23, 5, '', 6),
(24, 6, '', 6),
(25, 1, '', 7),
(26, 2, '', 7),
(27, 3, '', 7),
(28, 4, '', 7),
(29, 5, '1', 7),
(30, 6, '11', 7);

-- --------------------------------------------------------

--
-- Table structure for table `survey_questionnaire`
--

CREATE TABLE `survey_questionnaire` (
  `survey_qID` int(11) UNSIGNED NOT NULL,
  `survey_ID` int(11) UNSIGNED DEFAULT NULL,
  `question` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey_questionnaire`
--

INSERT INTO `survey_questionnaire` (`survey_qID`, `survey_ID`, `question`) VALUES
(1, 1, 'This website has much that interest to me'),
(2, 2, 'It is difficult to move around this website'),
(3, 3, 'I can quickly find what I want on this website'),
(4, 4, 'This website seems logical to me'),
(5, 5, 'This website needs more introductory explanations'),
(6, 6, 'The pages on this website are very attractive'),
(7, 7, 'I feel in control when I\m using this website'),
(8, 8, 'This website is too slow'),
(9, 9, 'This website helps me find what I am looking for'),
(10, 10, 'Learning to find my way around this website is a problem')
(11, 11, 'I don\t like using this website')
(12, 12, 'I can easily contact the people I want to on this website')
(13, 13, 'I feel efficient when I\m using this website')
(14, 14, 'It is difficult to tell if this website has what I want')
(15, 15, 'Using this website for the first time is easy')
(16, 16, 'This website has some annoying features')
(17, 17, 'Remembering where I am on this website is difficult')
(18, 18, 'Using this website is a waste of time')
(19, 19, 'I get what I expect when I click on things on this website')
(20, 20, 'Everything on this website is easy to understand')
;

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `survey_questionnaire2` (
  `survey_qID` int(11) UNSIGNED NOT NULL,
  `survey_ID` int(11) UNSIGNED DEFAULT NULL,
  `question2` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey_questionnaire2`
--

INSERT INTO `survey_questionnaire` (`survey_qID`, `survey_ID`, `question2`) VALUES
(1, 1, 'What are your thoughts about our website?'),
(2, 2, 'What do you think the website should improve?'),
(3, 3, 'What features would you like to add to the website?'),
(4, 4, 'This website seems logical to me'),
(5, 5, 'This website needs more introductory explanations')
;




CREATE TABLE `user_account` (
  `user_ID` int(11) UNSIGNED NOT NULL,
  `user_level` int(11) UNSIGNED DEFAULT NULL,
  `user_name` varchar(25) DEFAULT NULL,
  `user_password` mediumtext DEFAULT NULL,
  `user_created` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`user_ID`, `user_level`, `user_name`, `user_password`, `user_created`) VALUES
(0, 3, 'unregister', 'unregister', '2018-02-04 12:20:56'),
(1, 1, '18-UR-0434', '123', '2022-12-26 14:49:25'),
(3, 3, 'admin', 'admin', '2022-10-07 12:22:05'),
(4, 2, 'teacher', '12345', '2022-10-07 12:25:47'),
(6, 2, '19-UR-0178', 'myportal_12', '2022-10-07 12:25:47'),

-- --------------------------------------------------------

--
-- Table structure for table `user_admin_detail`
--

CREATE TABLE `user_admin_detail` (
  `admin_ID` int(11) UNSIGNED NOT NULL,
  `admin_userID` int(11) UNSIGNED DEFAULT NULL,
  `admin_img` varchar(250) DEFAULT 'temp.gif',
  `admin_fName` varchar(100) DEFAULT NULL,
  `admin_mName` varchar(25) DEFAULT NULL,
  `admin_lName` varchar(50) DEFAULT NULL,
  `admin_address` varchar(250) DEFAULT NULL,
  `admin_status` varchar(10) DEFAULT 'unregister',
  `admin_gender` varchar(1) DEFAULT NULL,
  `admin_dob` date DEFAULT NULL,
  `admin_contact` varchar(11) DEFAULT NULL,
  `admin_civilStat` int(11) UNSIGNED DEFAULT NULL,
  `admin_secretquestion` varchar(250) DEFAULT NULL,
  `admin_secretanswer` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_admin_detail`
--

INSERT INTO `user_admin_detail` (`admin_ID`, `admin_userID`, `admin_img`, `admin_fName`, `admin_mName`, `admin_lName`, `admin_address`, `admin_status`, `admin_gender`, `admin_dob`, `admin_contact`, `admin_civilStat`, `admin_secretquestion`, `admin_secretanswer`) VALUES
(1, 3, 'NELSIE.png', 'Charlie', 'Alano', 'Nagal', 'Calasiao Pangasinan', 'register', 'M', '0000-00-00', '09169158798', 1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_level`
--

CREATE TABLE `user_level` (
  `level_ID` int(11) UNSIGNED NOT NULL,
  `level_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_level`
--

INSERT INTO `user_level` (`level_ID`, `level_name`) VALUES
(0, 'unregister'),
(1, 'student'),
(2, 'teacher'),
(3, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `user_notification`
--

CREATE TABLE `user_notification` (
  `notif_ID` int(11) UNSIGNED NOT NULL,
  `notif_typeID` int(11) UNSIGNED DEFAULT NULL,
  `notif_topicID` int(11) UNSIGNED DEFAULT NULL,
  `notif_userID` int(11) UNSIGNED DEFAULT NULL,
  `notif_receiverID` int(11) UNSIGNED DEFAULT NULL,
  `notif_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `notif_state` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_notification`
--

INSERT INTO `user_notification` (`notif_ID`, `notif_typeID`, `notif_topicID`, `notif_userID`, `notif_receiverID`, `notif_date`, `notif_state`) VALUES
(3, 2, 1, 3, 8, '2022-10-07 12:40:11', 1),
(4, 3, 15, 4, 1, '2022-10-07 12:40:11', 1),
(5, 3, 17, 1, 3, '2022-12-26 17:01:57', 0),
(6, 3, 19, 1, 17, '2022-12-27 08:21:56', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_notif_state`
--

CREATE TABLE `user_notif_state` (
  `status_ID` int(11) UNSIGNED NOT NULL,
  `status_Desc` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_notif_state`
--

INSERT INTO `user_notif_state` (`status_ID`, `status_Desc`) VALUES
(1, 'first'),
(2, 'second'),
(3, 'third');

-- --------------------------------------------------------

--
-- Table structure for table `user_notif_type`
--

CREATE TABLE `user_notif_type` (
  `type_ID` int(11) UNSIGNED NOT NULL,
  `type_Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_notif_type`
--

INSERT INTO `user_notif_type` (`type_ID`, `type_Name`) VALUES
(1, 'admin'),
(2, 'teacher'),
(3, 'student');

-- --------------------------------------------------------

--
-- Table structure for table `user_student_detail`
--

CREATE TABLE `user_student_detail` (
  `student_ID` int(11) NOT NULL,
  `student_userID` int(11) UNSIGNED DEFAULT NULL,
  `student_img` varchar(250) DEFAULT 'temp.gif',
  `student_IDNumber` int(11) UNSIGNED DEFAULT NULL,
  `student_fName` varchar(100) DEFAULT NULL,
  `student_mName` varchar(25) DEFAULT NULL,
  `student_lName` varchar(50) DEFAULT NULL,
  `student_address` varchar(250) DEFAULT NULL,
  `student_civilStat` int(11) UNSIGNED DEFAULT NULL,
  `student_dob` date DEFAULT NULL,
  `student_gender` varchar(1) DEFAULT NULL,
  `student_contact` varchar(11) DEFAULT NULL,
  `student_admission` date DEFAULT NULL,
  `student_year_grad` date DEFAULT NULL,
  `student_department` int(11) UNSIGNED DEFAULT NULL,
  `student_status` varchar(10) DEFAULT 'unregister',
  `student_secretquestion` varchar(250) DEFAULT NULL,
  `student_secretanswer` varchar(100) DEFAULT NULL,
  `student_motto` longtext DEFAULT NULL,
  `student_background` varchar(50) DEFAULT NULL,
  `student_parents` varchar(50) DEFAULT NULL,
  `student_achievements` varchar(50) DEFAULT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_student_detail`
--

INSERT INTO `user_student_detail` (`student_ID`, `student_userID`, `student_img`, `student_IDNumber`, `student_fName`, `student_mName`, `student_lName`, `student_address`, `student_civilStat`, `student_dob`, `student_gender`, `student_contact`, `student_admission`, `student_year_grad`, `student_department`, `student_status`, `student_secretquestion`, `student_secretanswer`, `student_motto`, `student_background`,`student_parents`, `student_achievements`) VALUES
(1, 1, 'pic.jpg', 201310656, 'Charlie', 'A.', 'Nagal', 'Bued, Calasiao, Pangasinan', 1, NULL, 'M', '21', '2018-03-06', '2018-03-30', 1, 'unregister', NULL, NULL, 'Dont let your dreams be dreams.',,'background-yearfac.jpg','Mr. and Mrs. Elmer Nagal','Graduate'),
(2, NULL, 'temp.gif', 17-UR-0012, 'John Michael', 'T.', 'Acain', 'Tabuyoc, Binalonan, Pangasinan', 1, '1999-05-26', 'M', '0930-378-1042', '2017-06-01', '2021-12-20', 2, 'unregister', NULL, NULL, NULL,'background-yearfac.jpg','Mr. and Mrs. Acain','Graduate'),
(3, NULL, 'temp.gif', 17-UR-1001, 'Justly Brettany', 'Madanglog', 'Tabigne', 'Limansangan, Binalonan, Pangasinan', 1, '0000-00-00', 'F', '123123', '2013-06-01', '2013-06-01', 1, 'unregister', NULL, NULL, NULL,'background-yearfac.jpg','Mr. and Mrs. Tabigne','Graduate'),
(4, NULL, 'temp.gif', 17-UR-2014, 'Dawn-Nyda', 'Posadas', 'Manuel', 'Padilla, San Carlos, Pangasinan', 1, '0000-00-00', 'M', '123123', '2013-06-01', '2013-06-01', 2, 'unregister', NULL, NULL, NULL,'background-yearfac.jpg','Mr. and Mrs. Manuel','Graduate'),
(5, NULL, 'temp.gif', 17-UR-2053, 'Carvi Jay', 'Gonzales', 'Sabado', 'Puelay, Villasis, Pangasinan', 1, '0000-00-00', 'F', '123123', '2013-06-01', '2013-06-01', 1, 'unregister', NULL, NULL, NULL,'background-yearfac.jpg','Mr. and Mrs. Sabado','Graduate'),
(6, NULL, 'temp.gif', 17-UR-2014, 'Katrina Claire', 'Moreno', 'Fabro', 'Calepaan, Asingan, Pangasinan', 1, '0000-00-00', 'M', '123123', '2013-06-01', '2013-06-01', 2, 'unregister', NULL, NULL, NULL,'background-yearfac.jpg','Mr. and Mrs. Fabro','Graduate'),
(7, NULL, 'temp.gif', 17-UR-1752, 'Hanna Mikaela', 'Bonite', 'Garces', 'Tomana East, Rosales, Pangasinan', 1, '0000-00-00', 'F', '123123', '2013-06-01', '2013-06-01', 1, 'unregister', NULL, NULL, NULL,'background-yearfac.jpg','Mr. and Mrs. Garces','Graduate'),
(8, NULL, 'temp.gif', 17-UR-6502, 'Rafael', 'Canin', 'Espanto', 'csz', 1, '0000-00-00', 'M', '123123', '2013-06-01', '2013-06-01', 2, 'unregister', NULL, NULL, NULL,'background-yearfac.jpg','Mr. and Mrs. Espanto','Graduate'),
(9, NULL, 'temp.gif', 17-UR-0012, 'Mark Christian', 'Dallisay', 'Mabisin', 'Bantugan, Pozorrubio, Pangasinan', 1, '0000-00-00', 'F', '123123', '2013-06-01', '2013-06-01', 1, 'unregister', NULL, NULL, NULL,'background-yearfac.jpg','Mr. and Mrs. Mabisin','Graduate'),
(10, NULL, 'temp.gif', 17-UR-7888, 'Jenny', 'Nocasa', 'Fernandez', 'Rosario, Pozorrubio, Pangasinan', 1, '0000-00-00', 'M', '123123', '2013-06-01', '2013-06-01', 2, 'unregister', NULL, NULL, NULL,'background-yearfac.jpg','Mr. and Mrs. Fernandez','Graduate'),
(11, NULL, 'temp.gif', 17-UR-1203, 'Jhonnabe', 'Costales', 'Sibucao', 'Labit West, Urdaneta, Pangasinan', 1, '0000-00-00', 'F', '123123', '2013-06-01', '2013-06-01', 1, 'unregister', NULL, NULL, NULL,'background-yearfac.jpg','Mr. and Mrs. Sibucao','Graduate'),
(12, NULL, 'temp.gif', 17-UR-1003, 'Eian Benedick', 'Floresca', 'Taborda', 'Nancayasan, Urdaneta, Panagasinan', 1, '0000-00-00', 'M', '123123', '2013-06-01', '2013-06-01', 2, 'unregister', NULL, NULL, NULL),
(13, NULL, 'temp.gif', 17-UR-1450, 'Eunel', 'Espiritu', 'Parayno', 'Poblacion West, Natividad, Pangasinan', 1, '0000-00-00', 'F', '123123', '2013-06-01', '2013-06-01', 1, 'unregister', NULL, NULL, NULL),
(14, NULL, 'temp.gif', 17-UR-2031, 'Estevan', 'Pascual', 'Javier', 'Zone 4, Rosales, Pangasinan', 1, '0000-00-00', 'M', '123123', '2013-06-01', '2013-06-01', 2, 'unregister', NULL, NULL, NULL),
(15, NULL, 'temp.gif', 17-UR-2018, 'C-jay', 'Iglesias', 'Malicdem', 'M.H. Del Pilar, Bayambang, Pangasinan', 1, '0000-00-00', 'F', '123123', '2013-06-01', '2013-06-01', 1, 'unregister', NULL, NULL, NULL),
(16, NULL, 'temp.gif', 17-UR-0014, 'Mark Gian', 'Soriano', 'Garces', 'San Juan, Alcala, Pangasinan', 1, '0000-00-00', 'M', '123123', '2013-06-01', '2013-06-01', 2, 'unregister', NULL, NULL, NULL),
(17, NULL, 'temp.gif', 17-UR-1084, 'Leann Joy', 'Tarnate', 'Espejo', 'Dilan, Pozorrubio, Pangasinan', 1, '0000-00-00', 'F', '123123', '2013-06-01', '2013-06-01', 1, 'unregister', NULL, NULL, NULL),
(18, 0, 'temp.gif', 17-UR-2025, 'Jonathan', 'Lomboy', 'Laureano', 'Bolintaguen, San Quintin, Pangasinan', 1, '1999-09-28', 'M', '9078150733', '2018-03-06', '2018-03-30', 1, 'unregister', NULL, NULL, 'Saaaample')
(19, NULL, 'temp.gif', 17-UR-2001, 'Leslie', 'Abad', 'Garcia', 'Cabuloan, Urdaneta City, Pangasinan', 1, '0000-00-00', 'F', '123123', '2013-06-01', '2013-06-01', 1, 'unregister', NULL, NULL, NULL),
(20, NULL, 'temp.gif', 17-UR-2004, 'Joedel', 'Carriedo', 'Esteves', 'San Vicente, Urdaneta City, Pangasinan', 1, '0000-00-00', 'F', '123123', '2013-06-01', '2013-06-01', 1, 'unregister', NULL, NULL, NULL),
-- --------------------------------------------------------

--
-- Table structure for table `user_teacher_detail`
--

CREATE TABLE `user_teacher_detail` (
  `teacher_ID` int(11) UNSIGNED NOT NULL,
  `teacher_userID` int(11) UNSIGNED DEFAULT NULL,
  `teacher_img` varchar(250) DEFAULT 'temp.gif',
  `teacher_facultyID` int(11) UNSIGNED DEFAULT NULL,
  `teacher_fName` varchar(100) DEFAULT NULL,
  `teacher_mName` varchar(25) DEFAULT NULL,
  `teacher_lName` varchar(50) DEFAULT NULL,
  `teacher_gender` varchar(1) DEFAULT NULL,
  `teacher_dob` date DEFAULT NULL,
  `teacher_contact` varchar(11) DEFAULT NULL,
  `teacher_address` varchar(250) DEFAULT NULL,
  `teacher_civilStat` int(11) UNSIGNED DEFAULT NULL,
  `teacher_department` int(11) UNSIGNED DEFAULT NULL,
  `teacher_position` varchar(255) DEFAULT NULL,
  `teacher_motto` varchar(255) NOT NULL,
  `teacher_status` varchar(10) DEFAULT 'unregister',
  `teacher_secretquestion` varchar(250) DEFAULT NULL,
  `teacher_secretanswer` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_teacher_detail`
--

INSERT INTO `user_teacher_detail` (`teacher_ID`, `teacher_userID`, `teacher_img`, `teacher_facultyID`, `teacher_fName`, `teacher_mName`, `teacher_lName`, `teacher_gender`, `teacher_dob`, `teacher_contact`, `teacher_address`, `teacher_civilStat`, `teacher_department`, `teacher_position`, `teacher_motto`, `teacher_status`, `teacher_secretquestion`, `teacher_secretanswer`) VALUES
(130, 8, 'sad.jpg', 68, 'Kristen Bhing', 'V.', 'Salvio', 'F', '1995-00-00', '123123', '123123', 1, 1, '1', 'sample mottoa', 'register', '', ''),
(140, 17, 'temp.gif', 54, 'Paul Andrew', 'V.', 'Roa', 'M', '1995-08-05', '85', 'z', 1, 1, '', '', 'register', '', ''),
(142, 20, 'temp.gif', 654, 'Ezralyn', 'L.', 'Coz', 'F', '1995-09-01', '654', 'asd', 1, 1, '', '', 'register', '', ''),
(143, 23, 'temp.gif', 78, 'Caren', 'A.', 'Pacol', 'F', '1995-00-00', '0989686765', 'Pangasinan', 1, 1, '1', 'sad', 'register', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `view_counter`
--

CREATE TABLE `view_counter` (
  `view_ID` int(11) UNSIGNED NOT NULL,
  `view_topicID` int(11) UNSIGNED DEFAULT NULL,
  `view_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `view_counter`
--

INSERT INTO `view_counter` (`view_ID`, `view_topicID`, `view_count`) VALUES
(3, 15, 35),
(4, 16, 6),
(5, 17, 19),
(6, 18, 8),
(7, 19, 24);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `forum_comment`
--
ALTER TABLE `forum_comment`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_topicID` (`comment_topicID`),
  ADD KEY `comment_userID` (`comment_userID`);

--
-- Indexes for table `forum_comment_reply`
--
ALTER TABLE `forum_comment_reply`
  ADD PRIMARY KEY (`comment_reply_ID`),
  ADD KEY `comment_reply_parentID` (`comment_reply_parentID`),
  ADD KEY `comment_reply_userID` (`comment_reply_userID`),
  ADD KEY `comment_reply_topicID` (`comment_reply_topicID`);

--
-- Indexes for table `forum_topic`
--
ALTER TABLE `forum_topic`
  ADD PRIMARY KEY (`topic_ID`),
  ADD KEY `post_owner_id` (`post_owner_id`);

--
-- Indexes for table `marital_status`
--
ALTER TABLE `marital_status`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `message_send`
--
ALTER TABLE `message_send`
  ADD PRIMARY KEY (`message_ID`),
  ADD KEY `message_threadID` (`message_threadID`),
  ADD KEY `message_receiver` (`message_receiver`);

--
-- Indexes for table `message_send_state`
--
ALTER TABLE `message_send_state`
  ADD PRIMARY KEY (`state_ID`),
  ADD KEY `state_msgID` (`state_msgID`),
  ADD KEY `state_readerID` (`state_readerID`);

--
-- Indexes for table `message_thread`
--
ALTER TABLE `message_thread`
  ADD PRIMARY KEY (`thread_ID`);

--
-- Indexes for table `message_thread_participant`
--
ALTER TABLE `message_thread_participant`
  ADD PRIMARY KEY (`participant_ID`),
  ADD KEY `participant_threadID` (`participant_threadID`),
  ADD KEY `participant_userID` (`participant_userID`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `psu_college`
--
ALTER TABLE `psu_college`
  ADD PRIMARY KEY (`colleges_ID`);

--
-- Indexes for table `psu_course`
--
ALTER TABLE `psu_course`
  ADD PRIMARY KEY (`course_ID`),
  ADD KEY `course_departmentID` (`course_departmentID`);

--
-- Indexes for table `psu_department`
--
ALTER TABLE `psu_department`
  ADD PRIMARY KEY (`department_ID`),
  ADD KEY `department_collegeID` (`department_collegeID`);

--
-- Indexes for table `suggested_job`
--
ALTER TABLE `suggested_job`
  ADD PRIMARY KEY (`job_ID`),
  ADD KEY `job_Course` (`job_Course`);

--
-- Indexes for table `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`survey_ID`);

--
-- Indexes for table `survey_answer`
--
ALTER TABLE `survey_answer`
  ADD PRIMARY KEY (`a_ID`);

--
-- Indexes for table `survey_answer_other`
--
ALTER TABLE `survey_answer_other`
  ADD PRIMARY KEY (`ao_ID`);

--
-- Indexes for table `survey_anweroptions`
--
ALTER TABLE `survey_anweroptions`
  ADD PRIMARY KEY (`survey_aID`);

--
-- Indexes for table `survey_forms`
--
ALTER TABLE `survey_forms`
  ADD PRIMARY KEY (`form_id`),
  ADD KEY `form_ownerID` (`form_ownerID`);

--
-- Indexes for table `survey_maxcount`
--
ALTER TABLE `survey_maxcount`
  ADD PRIMARY KEY (`survey_id`),
  ADD UNIQUE KEY `survey_ownerID_2` (`survey_ownerID`),
  ADD KEY `survey_ownerID` (`survey_ownerID`);

--
-- Indexes for table `survey_question1`
--
ALTER TABLE `survey_question1`
  ADD PRIMARY KEY (`survey_qID`),
  ADD KEY `survey_formID` (`survey_formID`);

--
-- Indexes for table `survey_question2`
--
ALTER TABLE `survey_question2`
  ADD PRIMARY KEY (`survey_qID`),
  ADD KEY `survey_formID` (`survey_formID`);

--
-- Indexes for table `survey_question3`
--
ALTER TABLE `survey_question3`
  ADD PRIMARY KEY (`survey_qID`),
  ADD KEY `survey_formID` (`survey_formID`);

--
-- Indexes for table `survey_question4`
--
ALTER TABLE `survey_question4`
  ADD PRIMARY KEY (`survey_qID`),
  ADD KEY `survey_formID` (`survey_formID`);

--
-- Indexes for table `survey_question5`
--
ALTER TABLE `survey_question5`
  ADD PRIMARY KEY (`survey_qID`),
  ADD KEY `survey_formID` (`survey_formID`);

--
-- Indexes for table `survey_question6`
--
ALTER TABLE `survey_question6`
  ADD PRIMARY KEY (`survey_qID`),
  ADD KEY `survey_formID` (`survey_formID`);

--
-- Indexes for table `survey_question7`
--
ALTER TABLE `survey_question7`
  ADD PRIMARY KEY (`survey_qID`),
  ADD KEY `survey_formID` (`survey_formID`);

--
-- Indexes for table `survey_question8`
--
ALTER TABLE `survey_question8`
  ADD PRIMARY KEY (`survey_qID`),
  ADD KEY `survey_formID` (`survey_formID`);

--
-- Indexes for table `survey_questionnaire`
--
ALTER TABLE `survey_questionnaire`
  ADD PRIMARY KEY (`survey_qID`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`user_ID`),
  ADD KEY `user_level` (`user_level`);

--
-- Indexes for table `user_admin_detail`
--
ALTER TABLE `user_admin_detail`
  ADD PRIMARY KEY (`admin_ID`),
  ADD KEY `admin_userID` (`admin_userID`),
  ADD KEY `admin_civilStat` (`admin_civilStat`);

--
-- Indexes for table `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`level_ID`);

--
-- Indexes for table `user_notification`
--
ALTER TABLE `user_notification`
  ADD PRIMARY KEY (`notif_ID`),
  ADD KEY `notif_topicID` (`notif_topicID`),
  ADD KEY `notif_userID` (`notif_userID`),
  ADD KEY `notif_receiverID` (`notif_receiverID`);

--
-- Indexes for table `user_notif_state`
--
ALTER TABLE `user_notif_state`
  ADD PRIMARY KEY (`status_ID`);

--
-- Indexes for table `user_notif_type`
--
ALTER TABLE `user_notif_type`
  ADD PRIMARY KEY (`type_ID`);

--
-- Indexes for table `user_student_detail`
--
ALTER TABLE `user_student_detail`
  ADD PRIMARY KEY (`student_ID`),
  ADD KEY `student_department` (`student_department`),
  ADD KEY `student_userID` (`student_userID`),
  ADD KEY `student_civilStat` (`student_civilStat`);

--
-- Indexes for table `user_teacher_detail`
--
ALTER TABLE `user_teacher_detail`
  ADD PRIMARY KEY (`teacher_ID`),
  ADD UNIQUE KEY `teacher_facultyID` (`teacher_facultyID`),
  ADD KEY `teacher_userID` (`teacher_userID`),
  ADD KEY `teacher_department` (`teacher_department`),
  ADD KEY `teacher_civilStat` (`teacher_civilStat`);

--
-- Indexes for table `view_counter`
--
ALTER TABLE `view_counter`
  ADD PRIMARY KEY (`view_ID`),
  ADD KEY `view_topicID` (`view_topicID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `forum_comment`
--
ALTER TABLE `forum_comment`
  MODIFY `comment_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `forum_comment_reply`
--
ALTER TABLE `forum_comment_reply`
  MODIFY `comment_reply_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forum_topic`
--
ALTER TABLE `forum_topic`
  MODIFY `topic_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `marital_status`
--
ALTER TABLE `marital_status`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `message_send`
--
ALTER TABLE `message_send`
  MODIFY `message_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `message_send_state`
--
ALTER TABLE `message_send_state`
  MODIFY `state_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `message_thread`
--
ALTER TABLE `message_thread`
  MODIFY `thread_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `message_thread_participant`
--
ALTER TABLE `message_thread_participant`
  MODIFY `participant_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `position_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `psu_college`
--
ALTER TABLE `psu_college`
  MODIFY `colleges_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `psu_course`
--
ALTER TABLE `psu_course`
  MODIFY `course_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `psu_department`
--
ALTER TABLE `psu_department`
  MODIFY `department_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `suggested_job`
--
ALTER TABLE `suggested_job`
  MODIFY `job_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `survey`
--
ALTER TABLE `survey`
  MODIFY `survey_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `survey_answer`
--
ALTER TABLE `survey_answer`
  MODIFY `a_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `survey_answer_other`
--
ALTER TABLE `survey_answer_other`
  MODIFY `ao_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `survey_anweroptions`
--
ALTER TABLE `survey_anweroptions`
  MODIFY `survey_aID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `survey_forms`
--
ALTER TABLE `survey_forms`
  MODIFY `form_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `survey_maxcount`
--
ALTER TABLE `survey_maxcount`
  MODIFY `survey_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `survey_question1`
--
ALTER TABLE `survey_question1`
  MODIFY `survey_qID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `survey_question2`
--
ALTER TABLE `survey_question2`
  MODIFY `survey_qID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `survey_question3`
--
ALTER TABLE `survey_question3`
  MODIFY `survey_qID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `survey_question4`
--
ALTER TABLE `survey_question4`
  MODIFY `survey_qID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `survey_question5`
--
ALTER TABLE `survey_question5`
  MODIFY `survey_qID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `survey_question6`
--
ALTER TABLE `survey_question6`
  MODIFY `survey_qID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `survey_question7`
--
ALTER TABLE `survey_question7`
  MODIFY `survey_qID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `survey_question8`
--
ALTER TABLE `survey_question8`
  MODIFY `survey_qID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `survey_questionnaire`
--
ALTER TABLE `survey_questionnaire`
  MODIFY `survey_qID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_account`
--
ALTER TABLE `user_account`
  MODIFY `user_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user_admin_detail`
--
ALTER TABLE `user_admin_detail`
  MODIFY `admin_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_level`
--
ALTER TABLE `user_level`
  MODIFY `level_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_notification`
--
ALTER TABLE `user_notification`
  MODIFY `notif_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_notif_state`
--
ALTER TABLE `user_notif_state`
  MODIFY `status_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_notif_type`
--
ALTER TABLE `user_notif_type`
  MODIFY `type_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_student_detail`
--
ALTER TABLE `user_student_detail`
  MODIFY `student_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_teacher_detail`
--
ALTER TABLE `user_teacher_detail`
  MODIFY `teacher_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `view_counter`
--
ALTER TABLE `view_counter`
  MODIFY `view_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `forum_comment`
--
ALTER TABLE `forum_comment`
  ADD CONSTRAINT `forum_comment_ibfk_1` FOREIGN KEY (`comment_topicID`) REFERENCES `forum_topic` (`topic_ID`),
  ADD CONSTRAINT `forum_comment_ibfk_2` FOREIGN KEY (`comment_userID`) REFERENCES `user_account` (`user_ID`);

--
-- Constraints for table `forum_comment_reply`
--
ALTER TABLE `forum_comment_reply`
  ADD CONSTRAINT `forum_comment_reply_ibfk_1` FOREIGN KEY (`comment_reply_parentID`) REFERENCES `forum_comment` (`comment_ID`),
  ADD CONSTRAINT `forum_comment_reply_ibfk_2` FOREIGN KEY (`comment_reply_userID`) REFERENCES `user_account` (`user_ID`),
  ADD CONSTRAINT `forum_comment_reply_ibfk_3` FOREIGN KEY (`comment_reply_topicID`) REFERENCES `forum_topic` (`topic_ID`);

--
-- Constraints for table `forum_topic`
--
ALTER TABLE `forum_topic`
  ADD CONSTRAINT `forum_topic_ibfk_1` FOREIGN KEY (`post_owner_id`) REFERENCES `user_account` (`user_ID`);

--
-- Constraints for table `message_send`
--
ALTER TABLE `message_send`
  ADD CONSTRAINT `message_send_ibfk_1` FOREIGN KEY (`message_threadID`) REFERENCES `message_thread` (`thread_ID`),
  ADD CONSTRAINT `message_send_ibfk_2` FOREIGN KEY (`message_receiver`) REFERENCES `user_account` (`user_ID`);

--
-- Constraints for table `message_send_state`
--
ALTER TABLE `message_send_state`
  ADD CONSTRAINT `message_send_state_ibfk_1` FOREIGN KEY (`state_msgID`) REFERENCES `message_send` (`message_ID`),
  ADD CONSTRAINT `message_send_state_ibfk_2` FOREIGN KEY (`state_readerID`) REFERENCES `user_account` (`user_ID`);

--
-- Constraints for table `message_thread_participant`
--
ALTER TABLE `message_thread_participant`
  ADD CONSTRAINT `message_thread_participant_ibfk_1` FOREIGN KEY (`participant_threadID`) REFERENCES `message_thread` (`thread_ID`),
  ADD CONSTRAINT `message_thread_participant_ibfk_2` FOREIGN KEY (`participant_userID`) REFERENCES `user_account` (`user_ID`);

--
-- Constraints for table `psu_course`
--
ALTER TABLE `psu_course`
  ADD CONSTRAINT `psu_course_ibfk_1` FOREIGN KEY (`course_departmentID`) REFERENCES `psu_department` (`department_ID`);

--
-- Constraints for table `psu_department`
--
ALTER TABLE `psu_department`
  ADD CONSTRAINT `psu_department_ibfk_1` FOREIGN KEY (`department_collegeID`) REFERENCES `psu_college` (`colleges_ID`);

--
-- Constraints for table `suggested_job`
--
ALTER TABLE `suggested_job`
  ADD CONSTRAINT `suggested_job_ibfk_1` FOREIGN KEY (`job_Course`) REFERENCES `psu_course` (`course_ID`);

--
-- Constraints for table `survey_forms`
--
ALTER TABLE `survey_forms`
  ADD CONSTRAINT `survey_forms_ibfk_1` FOREIGN KEY (`form_ownerID`) REFERENCES `user_account` (`user_ID`);

--
-- Constraints for table `survey_maxcount`
--
ALTER TABLE `survey_maxcount`
  ADD CONSTRAINT `survey_maxcount_ibfk_1` FOREIGN KEY (`survey_ownerID`) REFERENCES `user_account` (`user_ID`);

--
-- Constraints for table `survey_question1`
--
ALTER TABLE `survey_question1`
  ADD CONSTRAINT `survey_question1_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`);

--
-- Constraints for table `survey_question2`
--
ALTER TABLE `survey_question2`
  ADD CONSTRAINT `survey_question2_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`);

--
-- Constraints for table `survey_question3`
--
ALTER TABLE `survey_question3`
  ADD CONSTRAINT `survey_question3_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`);

--
-- Constraints for table `survey_question4`
--
ALTER TABLE `survey_question4`
  ADD CONSTRAINT `survey_question4_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`);

--
-- Constraints for table `survey_question5`
--
ALTER TABLE `survey_question5`
  ADD CONSTRAINT `survey_question5_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`);

--
-- Constraints for table `survey_question6`
--
ALTER TABLE `survey_question6`
  ADD CONSTRAINT `survey_question6_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`);

--
-- Constraints for table `survey_question7`
--
ALTER TABLE `survey_question7`
  ADD CONSTRAINT `survey_question7_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`);

--
-- Constraints for table `survey_question8`
--
ALTER TABLE `survey_question8`
  ADD CONSTRAINT `survey_question8_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`);

--
-- Constraints for table `user_account`
--
ALTER TABLE `user_account`
  ADD CONSTRAINT `user_account_ibfk_1` FOREIGN KEY (`user_level`) REFERENCES `user_level` (`level_ID`);

--
-- Constraints for table `user_admin_detail`
--
ALTER TABLE `user_admin_detail`
  ADD CONSTRAINT `user_admin_detail_ibfk_1` FOREIGN KEY (`admin_userID`) REFERENCES `user_account` (`user_ID`),
  ADD CONSTRAINT `user_admin_detail_ibfk_2` FOREIGN KEY (`admin_civilStat`) REFERENCES `marital_status` (`ID`);

--
-- Constraints for table `user_notification`
--
ALTER TABLE `user_notification`
  ADD CONSTRAINT `user_notification_ibfk_2` FOREIGN KEY (`notif_userID`) REFERENCES `user_account` (`user_ID`),
  ADD CONSTRAINT `user_notification_ibfk_3` FOREIGN KEY (`notif_receiverID`) REFERENCES `user_account` (`user_ID`);

--
-- Constraints for table `user_student_detail`
--
ALTER TABLE `user_student_detail`
  ADD CONSTRAINT `user_student_detail_ibfk_1` FOREIGN KEY (`student_department`) REFERENCES `psu_course` (`course_ID`),
  ADD CONSTRAINT `user_student_detail_ibfk_2` FOREIGN KEY (`student_userID`) REFERENCES `user_account` (`user_ID`),
  ADD CONSTRAINT `user_student_detail_ibfk_3` FOREIGN KEY (`student_civilStat`) REFERENCES `marital_status` (`ID`);

--
-- Constraints for table `user_teacher_detail`
--
ALTER TABLE `user_teacher_detail`
  ADD CONSTRAINT `user_teacher_detail_ibfk_1` FOREIGN KEY (`teacher_userID`) REFERENCES `user_account` (`user_ID`),
  ADD CONSTRAINT `user_teacher_detail_ibfk_2` FOREIGN KEY (`teacher_department`) REFERENCES `psu_department` (`department_ID`),
  ADD CONSTRAINT `user_teacher_detail_ibfk_3` FOREIGN KEY (`teacher_civilStat`) REFERENCES `marital_status` (`ID`);

--
-- Constraints for table `view_counter`
--
ALTER TABLE `view_counter`
  ADD CONSTRAINT `view_counter_ibfk_1` FOREIGN KEY (`view_topicID`) REFERENCES `forum_topic` (`topic_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
