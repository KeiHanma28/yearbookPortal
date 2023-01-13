-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2023 at 05:06 PM
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
-- Table structure for table `feed`
--

CREATE TABLE `feed` (
  `feed_ID` int(11) NOT NULL,
  `feed_name` varchar(100) NOT NULL,
  `feed_content` varchar(1000) NOT NULL,
  `feed_link` varchar(500) NOT NULL,
  `feed_date` date NOT NULL,
  `feed_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(15, '1231231', 1, '2018-02-24 14:48:22', '<p>asda</p>\r\n', 'UNPIN'),
(16, 'asda', 4, '2018-02-24 15:09:46', '<p>asdasd</p>\r\n', 'UNPIN'),
(17, 'Rockstar Junior VA Graphic designer/illustrator is required ASAP!', 3, '2023-01-05 17:11:43', '<h1><span class=\"marker\"><strong>We are a British publishing company based in England.</strong></span></h1>\r\n\r\n<h1><img alt=\"The UK\'s top 50 graphic design studios revealed | Creative Bloq\" src=\"https://cdn.mos.cms.futurecdn.net/6c4559ac3bac9bc75c92ca2ff6ee7b35-1200-80.jpg\" /></h1>\r\n\r\n<p><strong>Ultra-organized and Technical Experienced GRAPHIC DESIGNER/ILLUSTRATOR Needed for Creative Entrepreneur &ndash; Looking for Long-Term VA We are looking for a highly motivated and talented Graphic Designer/Illustrator to join our team who is experienced in using Artificial Intelligence (AI) art generators to create coloring pages. The ideal candidate should demonstrate excellent creativity and design skills, as well as a great eye for detail and color. Reporting to the Creative Director, the successful candidate will be responsible for generating AI-generated illustrations, designing layouts and choosing colors for various projects such as coloring books, children&#39;s books, magazines, posters and other materials related to coloring pages. They will work closely with a team of artists specializing in creating artwork from AI-created illustrations. Additionally, they should be able to provide creative input and direction on how best to utilize the technology.</strong></p>\r\n', 'PIN'),
(18, 'maps', 1, '2022-10-09 09:38:22', '<p>asdadsasd<a href=\"https://is2-ssl.mzstatic.com/image/thumb/Purple122/v4/80/cc/0c/80cc0cf1-7129-bec0-cf2e-731a646663ba/logo_maps_ios_color-0-1x_U007emarketing-0-0-0-6-0-0-85-220.png/1200x630wa.png\"><img alt=\"\" src=\"https://is2-ssl.mzstatic.com/image/thumb/Purple122/v4/80/cc/0c/80cc0cf1-7129-bec0-cf2e-731a646663ba/logo_maps_ios_color-0-1x_U007emarketing-0-0-0-6-0-0-85-220.png/1200x630wa.png\" style=\"height:158px; width:300px\" /></a></p>\r\n', 'UNPIN'),
(19, 'Crowdfunding', 17, '2023-01-05 17:23:33', '<p>Crowdfunding campaigns are a great way to engage a large population of small dollar donors. They work well when paired with annual fundraising events. Best of all, they&#39;re inexpensive to create and rely on social sharing. Crowdfunding campaigns have the potential to go viral and raise a lot of money.</p>\r\n\r\n<p><img src=\"https://cdn.discordapp.com/attachments/956767314915786764/1060609374164369448/crowdfunding-1.png\" /></p>\r\n', 'PIN'),
(20, 'New topic', 1, '2023-01-05 13:26:06', '<p>sample new topic</p>\r\n', 'UNPIN'),
(21, 'Ez\'s Post', 21, '2023-01-05 14:24:46', '<p>123</p>\r\n', 'UNPIN'),
(22, 'Looking for Links', 101, '2023-01-05 16:54:55', '<p>Links : http:/</p>\r\n', 'UNPIN'),
(23, 'Virtual Assistant', 3, '2023-01-05 17:14:43', '<p>Hi,<br />\r\n<img alt=\"How to Identify Tasks Your Virtual Assistant Can Manage - Castellum Pro\" src=\"https://castellumpro.com/wp-content/uploads/2021/07/shutterstock_1272095104.png\" /></p>\r\n\r\n<p>im looking for a longterm full time virtual assistant for my print on demand business (40 Hours a week). You will be working with a graphic designer and be responsible for niche research, creating design ideas, write listings and upload the designs. requirements: - Experienced in POD - Responsibility and reliability - Good English communication - You will be working with the designer in finding new niches and creating ideas for new designs. - Create listings in MBA, title, description etc. - Responsible for all trademark and copyright checks - Quality control of the designs if you can meet my requirements please send me you CV and the following questions: - When could you Start working with me? - how long are you already working with MBA/POD? Thanks Franck</p>\r\n', 'PIN'),
(24, 'DATA ENTRY', 19, '2023-01-05 17:18:47', '<p><img alt=\"Data Entry using Form in Microsoft Excel | Data Entry in Excel - YouTube\" src=\"https://i.ytimg.com/vi/7gikY2_xgJU/mqdefault.jpg\" /></p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Hi I&#39;m looking for a motivated Virtual Assistant that specializes in DATA ENTRY. I&#39;m looking for people available overnight or at the time of this posting. Looking for availability between the times of 12:AM - 4AM (GMT +8). Will be conducting interviews ASAP! Look forward to meeting you all! (edited)</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Transaction Coordinator</strong> This will be a full-time Transaction Coordinator position for an investment company. Transaction coordinator will handle all closing responsibilities including: &bull; communication with clients and title company &bull; making sure documents are accurate &bull; making sure deadlines are hit &bull; helping clear up title issues as needed &bull; scheduling and/or rescheduling closings &bull; coordinating utilities, repairs, and insurance as needed &bull; keep purchase and sale clients for the separate as some may happen on the same day Mandatory experience: &bull; must have completed a similar position with a US-based real estate company &bull; must have great speaking and writing English skills &bull; must have exceptional attention to detail and organizational skills We are a US-based investment company that operates in Missouri and Texas. This position will cover Missouri for the time being but could expand to both Missouri and Texas. We plan to purchase and sell 200 houses between both states. We are a direct-to-consumer company which means rarely is a real estate agent involved. We are working directly with sellers and buyers. Once this position is learned if it proves to not be a full-time effort, additional administrative tasks might be assigned such as property management maintenance requests or data entry.</p>\r\n	</li>\r\n</ol>\r\n', 'PIN'),
(25, 'Online Donation ', 18, '2023-01-05 17:21:32', '<p>Accept donations online before, during, or after your next fundraising event to drastically increase the amount raised. Many donors don&rsquo;t carry cash with them so giving your supporters the opportunity to give online increases the number of potential fundraising donations.</p>\r\n\r\n<p><img src=\"https://cdn.discordapp.com/attachments/956767314915786764/1060609190336417822/fundraisingsoftware.png\" /></p>\r\n', 'PIN'),
(26, 'ð„ð—ð‚ðˆð“ðˆðð† ðð„ð–ð’ ðð’ð”ððˆð€ðð’Â ðŸ¤©', 17, '2023-01-05 17:26:04', '<p>The PSU Lingayen Admission and Guidance Office is currently conducting A Feasibility Study on Proposed ð˜½ð™Ž ð™‹ð™Žð™”ð˜¾ð™ƒð™Šð™‡ð™Šð™‚ð™” Program at Pangasinan State University Lingayen Campus.</p>\r\n\r\n<p>Interested Grade 12 students may participate by answering the survey in the provided link below. Your responses will be of great help in creating a program that is feasible, sustainable, relevant and enriching for the entire PSU community.</p>\r\n\r\n<p><a href=\"https://l.facebook.com/l.php?u=https%3A%2F%2Ftinyurl.com%2FPsych4PSU&amp;h=AT33TNsMKLSoqLN7Pv1fGU5wjx88oEvzO9SyZld1boC_-DzNRmyFc9DBqMOdkLSP-X7IIg4BKZ6Jqbz1XBqkQA4k0SgzyfKECNRXrXt2ACKDIOqoRII8tx-POIY_3ecucHrXAgwNvWA2dBAAl8Nv3GPsKUcCoX_H6OI_i9f5C8Ees3wleBBdqhebf9spgD-Inlm29P79zd1N1ypkUtBG6tWlV3xf69uWE6WpJ89glonwKXroKmU8eUBiE4jrb1UODZ449ziFEwd7mQYZBhT477YRyHQ0jiwwgIM3qRxrjOvxvvgp7OicdvUne3CAFrLfak7B8Holnc_8tuQd69NkCNHAQ7BU-_bNbBOaTGR8Vwi4ueFKDWg8o9hEzQvDlx_1ZMKvTQG3Smq7EACvX_GHFyzzIbW6kn7tbVx7rKws91tNSJwuPXEm2QZWUz1Llofg8C1iX7xbaSkLgF6HdSs13UZxLZ663NnznXLi0EZppyRTUWjVVAC_-SgX3Pgbgz0zHOd0-EBoSl8d6XJ4PhKjITxxxtSE9nHL-5f2hMWuz8yRMAK8TNzIEqMZNmahxVR9k6Ewq8Bu2AvpIkrTqUgq_rB6fa1J2wLp\" rel=\"noopener nofollow\" target=\"_blank\">https://tinyurl.com/Psych4PSU</a></p>\r\n\r\n<p><img alt=\"May be an image of text\" src=\"https://scontent.fcrk4-1.fna.fbcdn.net/v/t39.30808-6/318617182_706605737753012_1046681511761695496_n.jpg?stp=cp1_dst-jpg&amp;_nc_cat=108&amp;ccb=1-7&amp;_nc_sid=973b4a&amp;_nc_ohc=GY-Ll-JgJ-kAX-9cexo&amp;_nc_ht=scontent.fcrk4-1.fna&amp;oh=00_AfAA2DWqksEfY5g1ma1XopoAWQF9h-5mHeUlCx8WZNOcNw&amp;oe=63BC70DD\" /></p>\r\n', 'PIN');

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
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `msg_id` int(11) NOT NULL,
  `incoming_msg_id` int(255) NOT NULL,
  `outgoing_msg_id` int(255) NOT NULL,
  `msg` varchar(1000) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`msg_id`, `incoming_msg_id`, `outgoing_msg_id`, `msg`) VALUES
(1, 5, 1, 'hello'),
(2, 1, 5, 'hi');

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
(2, 'College of Arts and Education', 'COAE'),
(3, 'College of Engineering and Architecture', 'COEA');

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
(1, 1, 'Bachelor of Science in Information Technology', 'BSIT'),
(2, 2, 'Bachelor of Science in Computer Engineering', 'BSCOE'),
(3, 4, 'Bachelor of Science in Office Administration', 'BSOA'),
(4, 2, 'Bachelor of Science in Civil Engineering', 'BSCE');

-- --------------------------------------------------------

--
-- Table structure for table `psu_department`
--

CREATE TABLE `psu_department` (
  `department_ID` int(11) UNSIGNED NOT NULL,
  `department_collegeID` int(11) UNSIGNED NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `department_acronym` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `psu_department`
--

INSERT INTO `psu_department` (`department_ID`, `department_collegeID`, `department_name`, `department_acronym`) VALUES
(1, 1, 'IT department', 'IT'),
(2, 3, 'Engineering department', 'COE'),
(3, 2, 'Education department', 'EDUC'),
(4, 2, 'Office Administration', 'OA');

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
(2, 'Data Analysis', 1),
(3, 'Database Administrator', 3),
(5, 'Computer Support Specialist', 1),
(6, 'Computer Network Architect', 1),
(7, 'Information Security Analyst', 1),
(8, 'Software Developer', 1),
(9, 'Application Developer', 1),
(10, 'Applications Engineer', 1),
(11, 'Associate Developer', 1),
(12, 'Computer Programmer', 1),
(13, 'Data Quality Manager', 1),
(14, 'Desktop Support Specialist', 1),
(15, 'Desktop Support Manager', 1),
(16, 'Computer Support Specialist', 2),
(17, 'Computer Network Architect', 2),
(18, 'Information Security Analyst', 2),
(19, 'Software Developer', 2),
(20, 'Application Developer', 2),
(21, 'Applications Engineer', 2),
(22, 'Associate Developer', 2),
(23, 'Computer Programmer', 2),
(24, 'Data Quality Manager', 2),
(25, 'Desktop Support Specialist', 2),
(26, 'Desktop Support Manager', 2),
(30, 'Receptionist', 3),
(31, 'Administration Assistant', 3),
(33, 'Office Manager', 3),
(34, 'Personal Assistant', 3),
(35, 'Executive Assistant', 3),
(36, 'Virtual Assistant', 3);

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
(1, 'WAMMI Usability Questionnaire', '2023-01-02 05:37:57', 1),
(2, 'Feedback', '2023-01-02 05:37:57', 0),
(10, 'Survey Title 3', '2023-01-02 05:37:57', 0),
(11, 'sample', '2023-01-02 16:54:04', 0);

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
(1, 1, '2018-02-04 13:24:38', NULL),
(2, 1, '2018-02-07 16:41:32', NULL),
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
(3, 6, 2, '2018-02-18 16:00:00');

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
(10, 10, 'U_AB_BS10', '', 1),
(11, 11, '', 'G_MS_MA_PHD11', 1),
(12, 12, '', 'G_MS_MA_PHD12', 1),
(13, 13, 'U_AB_BS13', '', 1),
(14, 14, 'U_AB_BS14', '', 1),
(15, 15, 'other', 'zzzzzzzzzz', 1),
(16, 1, 'U_AB_BS1', '', 2),
(17, 2, 'U_AB_BS2', '', 2),
(18, 3, 'U_AB_BS3', '', 2),
(19, 4, '', 'G_MS_MA_PHD4', 2),
(20, 5, '', '', 2),
(21, 6, '', '', 2),
(22, 7, '', '', 2),
(23, 8, '', '', 2),
(24, 9, '', '', 2),
(25, 10, '', '', 2),
(26, 11, '', '', 2),
(27, 12, '', '', 2),
(28, 13, '', '', 2),
(29, 14, '', '', 2),
(30, 15, 'other', '', 2),
(91, 1, '', '', 7),
(92, 2, '', '', 7),
(93, 3, '', '', 7),
(94, 4, '', '', 7),
(95, 5, '', '', 7),
(96, 6, '', '', 7),
(97, 7, '', '', 7),
(98, 8, '', '', 7),
(99, 9, '', '', 7),
(100, 10, '', '', 7),
(101, 11, '', '', 7),
(102, 12, '', '', 7),
(103, 13, '', '', 7),
(104, 14, '', '', 7),
(105, 15, 'other', '', 7);

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
(10, 5, '', 2),
(31, 1, 'no', 7),
(32, 2, 'no', 7),
(33, 3, 'no', 7),
(34, 4, 'no', 7),
(35, 5, '', 7);

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
(10, 4, '', 2),
(11, 5, '', 2),
(12, 6, '', 2),
(37, 1, '', 7),
(38, 2, '', 7),
(39, 3, '1', 7),
(40, 4, '1', 7),
(41, 5, '1', 7),
(42, 6, '1', 7);

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
(1, 1, 'sagutan mo to'),
(2, 1, 'asdasdasdasd'),
(3, 1, 'xxxxxxxxxxxxxxxxxxxx'),
(4, 1, '44444'),
(5, 1, 'xxxxxx'),
(6, 1, 'zzzzzzzz'),
(7, 1, '545646'),
(8, 2, '1'),
(9, 2, 'hey'),
(10, 2, '123123123123');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `unique_id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `unique_id`, `fname`, `lname`, `email`, `password`, `img`, `status`) VALUES
(2, 1, 'Charlie', 'Nagal', '18-UR-0434', '123', 'pic.jpg', 'Active now'),
(38, 2, 'Mary Grace', 'Pronton', '18-UR-3234', '12345', 'ryan.png', 'Active now'),
(41, 5, 'Liza', 'Allas', '18-UR-2003', '123', 'NELSIE.png', 'Active now'),
(42, 144, 'Kathleen ', 'De Guzman', 'teacher2', '12345', '', ''),
(69, 109, 'Domingo', 'Dominadore', '18-UR-1001', '123', '', ''),
(153, 18, 'Arni', 'Tamayo', 'teachernew', '12345', '', ''),
(154, 19, 'Mike', 'Acosta', 'teachers', '12345', '', ''),
(155, 20, 'Domingo', 'Dominador', '123', '12345', '', ''),
(156, 21, 'Ezralyn', 'Cozme', '1234', '12345', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `user_ID` int(11) UNSIGNED NOT NULL,
  `user_level` int(11) UNSIGNED DEFAULT NULL,
  `user_name` varchar(25) DEFAULT NULL,
  `user_password` mediumtext DEFAULT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_created` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`user_ID`, `user_level`, `user_name`, `user_password`, `fname`, `lname`, `img`, `status`, `user_created`) VALUES
(1, 1, '18-UR-0434', '1234', '', NULL, '', '', '2023-01-11 13:06:27'),
(2, 1, '18-UR-3234', '12345', 'Mary Grace', 'Pronton', '', '', '2023-01-05 04:07:59'),
(3, 3, 'admin', 'admin', '', NULL, '', '', '2022-10-07 12:22:05'),
(4, 2, 'teacher', '12345', '', NULL, '', '', '2022-10-07 12:25:47'),
(5, 1, '18-UR-2003', '123', 'Liza', 'Allas', '', '', '2023-01-05 05:22:20'),
(6, 2, 'daaa1', '12345', '', NULL, '', '', '2022-10-07 12:25:47'),
(17, 2, 'z1', '12345', '', NULL, '', '', '2022-10-07 12:25:47'),
(18, 2, 'teachernew', '12345', 'Arni', 'Tamayo', '', '', '2023-01-05 07:11:17'),
(19, 2, 'teachers', '12345', 'Mike', 'Acosta', '', '', '2023-01-05 07:12:19'),
(20, 2, '123', '12345', 'Domingo', 'Dominador', '', '', '2023-01-05 07:13:32'),
(21, 2, '1234', '12345', 'Ezralyn', 'Cozme', '', '', '2023-01-05 07:14:46'),
(100, 1, '18-UR-3234', '123', '', NULL, '', '', '2022-12-31 08:05:14'),
(101, 1, '17-UR-1008', '123', 'Carvi Jay', 'Sabado', '', '', '2023-01-05 16:29:09'),
(102, 1, '17-UR-2190', '123', 'John Michael', 'Acain', '', '', '2023-01-05 16:29:10'),
(103, 1, '17-UR-1326', '123', 'Dawn Nyda', 'Manuel', '', '', '2023-01-05 16:29:10'),
(104, 1, '17-UR-1562', '123', 'Justly Bretanny', 'Tabigne', '', '', '2023-01-05 16:29:10'),
(105, 1, '17-UR-1055', '123', 'Eian Benedick', 'Taborda', '', '', '2023-01-05 16:29:10'),
(106, 1, '17-UR-1438', '123', 'Rhona Mae', 'Alcan', '', '', '2023-01-05 16:29:10'),
(107, 1, '17-UR-0867', '123', 'Rodessa Marie', 'Alivarvar', '', '', '2023-01-05 16:29:10'),
(108, 1, '17-UR-2145', '123', 'Jacel Joy', 'Borja', '', '', '2023-01-05 16:29:10'),
(109, 1, '18-UR-1001', '123', 'Domingo', 'Dominadore', NULL, NULL, '2023-01-11 15:13:04'),
(144, 2, 'teacher2', '12345', 'Kathleen ', 'De Guzman', '', '', '2023-01-05 06:11:29'),
(546, 1, '18-UR-2002', '123', 'Ryan', 'Lagnayo', '', '', '2023-01-03 09:29:04'),
(700, 2, 'FacultyCOE1', '1234', 'Khayzelle', 'Cayabyab', NULL, NULL, '2023-01-05 17:40:56'),
(1000, 1, '18-UR-CSV', '123', 'csz', 'csz', '', '', '2023-01-05 09:31:13');

-- --------------------------------------------------------

--
-- Table structure for table `user_admin_detail`
--

CREATE TABLE `user_admin_detail` (
  `admin_ID` int(11) UNSIGNED NOT NULL,
  `admin_userID` int(11) UNSIGNED NOT NULL,
  `admin_img` varchar(250) NOT NULL DEFAULT 'temp.gif',
  `admin_fName` varchar(100) NOT NULL,
  `admin_mName` varchar(25) NOT NULL,
  `admin_lName` varchar(50) NOT NULL,
  `admin_address` varchar(250) NOT NULL,
  `admin_status` varchar(10) NOT NULL DEFAULT 'unregister',
  `admin_gender` varchar(1) NOT NULL,
  `admin_dob` date NOT NULL,
  `admin_contact` varchar(11) NOT NULL,
  `admin_civilStat` int(11) UNSIGNED NOT NULL,
  `admin_background` varchar(255) NOT NULL,
  `admin_secretquestion` varchar(250) NOT NULL,
  `admin_secretanswer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_admin_detail`
--

INSERT INTO `user_admin_detail` (`admin_ID`, `admin_userID`, `admin_img`, `admin_fName`, `admin_mName`, `admin_lName`, `admin_address`, `admin_status`, `admin_gender`, `admin_dob`, `admin_contact`, `admin_civilStat`, `admin_background`, `admin_secretquestion`, `admin_secretanswer`) VALUES
(1, 3, 'pic.jpg', 'Charlie', 'Alano', 'Nagal', 'Calasiao Pangasinan', 'register', 'M', '0000-00-00', '09169158798', 1, 'image.jpeg', '', '');

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
(0, 'read'),
(1, 'first');

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
  `student_userID` int(11) UNSIGNED NOT NULL,
  `student_img` varchar(250) NOT NULL DEFAULT 'temp.gif',
  `student_IDNumber` int(11) UNSIGNED NOT NULL,
  `student_fName` varchar(100) NOT NULL,
  `student_mName` varchar(25) NOT NULL,
  `student_lName` varchar(50) NOT NULL,
  `student_address` varchar(250) NOT NULL,
  `student_civilStat` int(11) UNSIGNED NOT NULL,
  `student_dob` date NOT NULL,
  `student_gender` varchar(1) NOT NULL,
  `student_contact` varchar(11) NOT NULL,
  `student_semester` varchar(250) NOT NULL,
  `student_year_grad` year(4) NOT NULL,
  `student_department` int(11) UNSIGNED NOT NULL,
  `student_status` varchar(10) NOT NULL DEFAULT 'unregister',
  `student_secretquestion` varchar(250) DEFAULT NULL,
  `student_secretanswer` varchar(100) DEFAULT NULL,
  `student_motto` longtext NOT NULL,
  `student_background` varchar(250) NOT NULL,
  `student_parents` varchar(250) NOT NULL,
  `student_achievements` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_student_detail`
--

INSERT INTO `user_student_detail` (`student_ID`, `student_userID`, `student_img`, `student_IDNumber`, `student_fName`, `student_mName`, `student_lName`, `student_address`, `student_civilStat`, `student_dob`, `student_gender`, `student_contact`, `student_semester`, `student_year_grad`, `student_department`, `student_status`, `student_secretquestion`, `student_secretanswer`, `student_motto`, `student_background`, `student_parents`, `student_achievements`) VALUES
(1, 1, 'pic.jpg', 180434, 'Charlie', 'A.', 'Nagal', 'asd321', 1, '2015-01-01', 'M', '21', '', 2018, 1, 'register', '', '', 'Don\'ts let your dreams be dreams.', 'background-yearfac.jpg', 'Mr. And Mrs. Nagal', 'Graduate'),
(33, 100, 'temp.gif', 183234, 'Jericho', 'M', 'Allas', 'Urdaneta', 1, '1999-03-23', 'M', '9856765756', '', 1970, 1, 'unregister', '', '', '4th sample motto', '', '4th sample motto', 'Dean Listers'),
(35, 546, 'temp.gif', 182002, 'Ryan', 'R', 'Lagnayo', 'QC Manila', 1, '2002-02-23', 'M', '7657658768', '', 2016, 3, 'unregister', '', '', '2002 ako pinanganak', '', 'Mr. and Mrs. Lagnayo', 'graduate'),
(38, 2, 'CHOLLY.png', 183234, 'Mary Grace', 'M', 'Pronton', 'QC Manila', 1, '1999-02-23', 'M', '09856765756', '', 2015, 3, 'register', '', '', '4th sample motto', 'image.jpeg', 'Mr. and Mrs. Pronton', 'Dean Listers'),
(41, 5, 'photo_2022-08-18_01-22-54.jpg', 182003, 'Liza', 'J', 'Allas', 'anila', 2, '2000-02-23', 'F', '2312134124', '', 2000, 1, 'unregister', '', '', '4th sample motto', '', 'Mr. and Mrs. Pronton', 'Dean Listers'),
(45, 101, 'Sabado, Carvi Jay G.jpg', 171008, 'Carvi Jay', 'G', 'Sabado', '1364 Zone 7, Puelay, Villasis, Pangasinan.', 1, '0000-00-00', 'F', '9156520409', '', 2021, 1, 'unregister', NULL, NULL, '', '', 'Mr. and Mrs. Sabado', 'Graduate'),
(46, 102, 'Acain, John Michael T.jpg', 172190, 'John Michael', 'T', 'Acain', 'Zone 7, Tabuyoc Binalonan, Pangasinan\n', 1, '0000-00-00', 'M', '9147822336', '', 2021, 1, 'unregister', NULL, NULL, '', 'image.jpeg', 'Mr. and Mrs. Acain', 'Graduate'),
(47, 103, 'Manuel, Dawn-nyda.jpg', 171326, 'Dawn Nyda', 'P', 'Manuel', '132 Padilla St. San Carlos City Pangasinan', 1, '0000-00-00', 'F', '9455289585', '', 2021, 1, 'unregister', NULL, NULL, '', '', 'Mr. and Mrs. Manuel', 'Graduate'),
(48, 104, 'Tabigne, Justly M.jpg', 171562, 'Justly Bretanny', 'M', 'Tabigne', '#66 Zone 2 Linmansangan, Binalonan, Pangasinan', 1, '0000-00-00', 'F', '9575784215', '', 2021, 1, 'unregister', NULL, NULL, '', '', 'Mr. and Mrs. Tabigne', 'Graduate'),
(49, 105, 'BTS_0024.jpg', 171055, 'Eian Benedick', 'F', 'Taborda', 'Nancayasan Urdaneta City Pangasinan\n', 1, '0000-00-00', 'M', '9685971254', '', 2021, 1, 'unregister', NULL, NULL, '', 'background-yearfac.JPG', 'Mr. and Mrs. Taborda', 'Graduate'),
(50, 106, 'BTS_0043.jpg', 171438, 'Rhona Mae', 'C', 'Alcan', '117 Brgy. Dumayat, Binalonan, Pangasinan', 1, '0000-00-00', 'F', '9457530973', '', 2021, 2, 'unregister', NULL, NULL, '', '', 'Mr. and Mrs. Alcan', 'Graduate'),
(51, 107, 'Batch2019_IT_Garces.jpg', 170867, 'Rodessa Marie', 'T', 'Alivarvar', 'Pinmaludpod, Urdaneta City, Pangasinan', 1, '0000-00-00', 'F', '9325479201', '', 2021, 1, 'unregister', NULL, NULL, ' ', 'image.jpeg', 'Mr. and Mrs. Alcan', 'Graduate'),
(52, 108, 'Batch2019_IT_Espejo.jpg', 172145, 'Jacel Joy', 'M', 'Borja', 'Tibagan, Tarlac City, Tarlac', 1, '0000-00-00', 'F', '9187086541', '', 2021, 2, 'unregister', NULL, NULL, '', '', 'Mr. and Mrs. Borja', 'Graduate'),
(69, 109, 'male.jpg', 181001, 'Domingo', 'D', 'Dominadore', 'San Jacinto', 1, '1999-01-02', 'M', '52345345', 'Mid-Year', 2016, 1, 'register', NULL, NULL, 'Enter Your Motto Here', '', 'Mr. and Mrs. Dominadore', 'Graduate');

-- --------------------------------------------------------

--
-- Table structure for table `user_teacher_detail`
--

CREATE TABLE `user_teacher_detail` (
  `teacher_ID` int(11) UNSIGNED NOT NULL,
  `teacher_userID` int(11) UNSIGNED NOT NULL,
  `teacher_img` varchar(250) NOT NULL DEFAULT 'temp.gif',
  `teacher_facultyID` int(11) UNSIGNED NOT NULL,
  `teacher_fName` varchar(100) NOT NULL,
  `teacher_mName` varchar(25) NOT NULL,
  `teacher_lName` varchar(50) NOT NULL,
  `teacher_gender` varchar(1) NOT NULL,
  `teacher_dob` date NOT NULL,
  `teacher_contact` varchar(11) NOT NULL,
  `teacher_address` varchar(250) NOT NULL,
  `teacher_civilStat` int(11) UNSIGNED NOT NULL,
  `teacher_department` int(11) UNSIGNED NOT NULL,
  `teacher_position` varchar(255) NOT NULL,
  `teacher_motto` varchar(255) NOT NULL,
  `teacher_status` varchar(10) NOT NULL DEFAULT 'unregister',
  `teacher_secretquestion` varchar(250) NOT NULL,
  `teacher_secretanswer` varchar(100) NOT NULL,
  `teacher_background` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_teacher_detail`
--

INSERT INTO `user_teacher_detail` (`teacher_ID`, `teacher_userID`, `teacher_img`, `teacher_facultyID`, `teacher_fName`, `teacher_mName`, `teacher_lName`, `teacher_gender`, `teacher_dob`, `teacher_contact`, `teacher_address`, `teacher_civilStat`, `teacher_department`, `teacher_position`, `teacher_motto`, `teacher_status`, `teacher_secretquestion`, `teacher_secretanswer`, `teacher_background`) VALUES
(140, 17, 'temp.gif', 54, 'Paul Andrew', 'V.', 'Roa', 'M', '0004-08-05', '0936445671', 'Urdaneta Pangasinan', 1, 1, '3', 'Sir Roa\'s Motto', 'register', '', '', 'background-yearfac.jpg'),
(143, 6, 'temp.gif', 78, 'Caren', 'A.', 'Pacol', 'M', '0000-00-00', '0989686765', 'Pangasinan', 1, 1, '1', 'sad', 'register', '', '', 'background-yearfac.jpg'),
(151, 4, '6c4726e26575aa5ae6086bbebbac1892.png', 144, 'Kathleen ', 'A', 'De Guzman', 'F', '2000-02-23', '0989686765', 'Pangasinan asdsad', 2, 2, '3', 'Kathleens Motto', 'register', '', '', 'image.jpeg'),
(153, 18, 'temp.gif', 18, 'Arni', 'M', 'Tamayo', 'F', '1999-02-23', '0989686765', 'Pangasinan asdsad', 1, 1, '1', 'sad', 'register', '', '', 'background-yearfac.JPG'),
(154, 19, 'temp.gif', 19, 'Mike', 'A', 'Acosta', 'M', '1980-02-23', '0989686765', 'Pangasinan', 1, 1, '2', 'NEW\'s Motto', 'register', '', '', ''),
(155, 20, 'temp.gif', 20, 'Domingo', 'A', 'Dominador', 'F', '1970-09-23', '0989686765', 'Pangasinan asdsadsdafsdf', 1, 2, '1', 'NEW\'s Motto', 'register', '', '', ''),
(156, 21, 'temp.gif', 21, 'Ezralyn', 'c', 'Cozme', 'F', '1960-02-23', '0989686765', 'Pangasinan asd', 2, 2, '2', 'NEW\'s Motto', 'register', '', '', '');

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
(3, 15, 57),
(4, 16, 16),
(5, 17, 69),
(6, 18, 11),
(7, 19, 42),
(8, 20, 7),
(9, 21, 3),
(10, 22, 1),
(11, 23, 10),
(12, 24, 2),
(13, 25, 2),
(14, 26, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feed`
--
ALTER TABLE `feed`
  ADD PRIMARY KEY (`feed_ID`);

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
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`msg_id`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

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
  MODIFY `topic_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `marital_status`
--
ALTER TABLE `marital_status`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `position_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `psu_college`
--
ALTER TABLE `psu_college`
  MODIFY `colleges_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `psu_course`
--
ALTER TABLE `psu_course`
  MODIFY `course_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `psu_department`
--
ALTER TABLE `psu_department`
  MODIFY `department_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `suggested_job`
--
ALTER TABLE `suggested_job`
  MODIFY `job_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `survey`
--
ALTER TABLE `survey`
  MODIFY `survey_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

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
  MODIFY `student_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `user_teacher_detail`
--
ALTER TABLE `user_teacher_detail`
  MODIFY `teacher_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `view_counter`
--
ALTER TABLE `view_counter`
  MODIFY `view_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `forum_comment`
--
ALTER TABLE `forum_comment`
  ADD CONSTRAINT `forum_comment_ibfk_1` FOREIGN KEY (`comment_topicID`) REFERENCES `forum_topic` (`topic_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `forum_comment_ibfk_2` FOREIGN KEY (`comment_userID`) REFERENCES `user_account` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `forum_topic_ibfk_1` FOREIGN KEY (`post_owner_id`) REFERENCES `user_account` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `psu_course`
--
ALTER TABLE `psu_course`
  ADD CONSTRAINT `psu_course_ibfk_1` FOREIGN KEY (`course_departmentID`) REFERENCES `psu_department` (`department_ID`);

--
-- Constraints for table `psu_department`
--
ALTER TABLE `psu_department`
  ADD CONSTRAINT `psu_department_ibfk_1` FOREIGN KEY (`department_collegeID`) REFERENCES `psu_college` (`colleges_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `suggested_job`
--
ALTER TABLE `suggested_job`
  ADD CONSTRAINT `suggested_job_ibfk_1` FOREIGN KEY (`job_Course`) REFERENCES `psu_course` (`course_ID`);

--
-- Constraints for table `survey_forms`
--
ALTER TABLE `survey_forms`
  ADD CONSTRAINT `survey_forms_ibfk_1` FOREIGN KEY (`form_ownerID`) REFERENCES `user_account` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `survey_maxcount`
--
ALTER TABLE `survey_maxcount`
  ADD CONSTRAINT `survey_maxcount_ibfk_1` FOREIGN KEY (`survey_ownerID`) REFERENCES `user_account` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `survey_question1`
--
ALTER TABLE `survey_question1`
  ADD CONSTRAINT `survey_question1_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `survey_question2`
--
ALTER TABLE `survey_question2`
  ADD CONSTRAINT `survey_question2_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `survey_question3`
--
ALTER TABLE `survey_question3`
  ADD CONSTRAINT `survey_question3_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `survey_question4`
--
ALTER TABLE `survey_question4`
  ADD CONSTRAINT `survey_question4_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `survey_question5`
--
ALTER TABLE `survey_question5`
  ADD CONSTRAINT `survey_question5_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `survey_question6`
--
ALTER TABLE `survey_question6`
  ADD CONSTRAINT `survey_question6_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `survey_question7`
--
ALTER TABLE `survey_question7`
  ADD CONSTRAINT `survey_question7_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `survey_question8`
--
ALTER TABLE `survey_question8`
  ADD CONSTRAINT `survey_question8_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `user_notification_ibfk_3` FOREIGN KEY (`notif_receiverID`) REFERENCES `user_account` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_student_detail`
--
ALTER TABLE `user_student_detail`
  ADD CONSTRAINT `user_student_detail_ibfk_1` FOREIGN KEY (`student_department`) REFERENCES `psu_course` (`course_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_student_detail_ibfk_2` FOREIGN KEY (`student_userID`) REFERENCES `user_account` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_student_detail_ibfk_3` FOREIGN KEY (`student_civilStat`) REFERENCES `marital_status` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_teacher_detail`
--
ALTER TABLE `user_teacher_detail`
  ADD CONSTRAINT `user_teacher_detail_ibfk_1` FOREIGN KEY (`teacher_userID`) REFERENCES `user_account` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_teacher_detail_ibfk_2` FOREIGN KEY (`teacher_department`) REFERENCES `psu_department` (`department_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
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
