-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for tracerdata
CREATE DATABASE IF NOT EXISTS `tracerdata` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `tracerdata`;

-- Dumping structure for table tracerdata.forum_comment
CREATE TABLE IF NOT EXISTS `forum_comment` (
  `comment_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `comment_topicID` int(11) unsigned DEFAULT NULL,
  `comment_userID` int(11) unsigned DEFAULT NULL,
  `comment_content` varchar(500) DEFAULT NULL,
  `comment_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`comment_ID`),
  KEY `comment_topicID` (`comment_topicID`),
  KEY `comment_userID` (`comment_userID`),
  CONSTRAINT `forum_comment_ibfk_1` FOREIGN KEY (`comment_topicID`) REFERENCES `forum_topic` (`topic_ID`),
  CONSTRAINT `forum_comment_ibfk_2` FOREIGN KEY (`comment_userID`) REFERENCES `user_account` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.forum_comment: ~4 rows (approximately)
INSERT IGNORE INTO `forum_comment` (`comment_ID`, `comment_topicID`, `comment_userID`, `comment_content`, `comment_date`) VALUES
	(2, 15, 4, 'asdasdasd', '2018-03-03 15:35:39'),
	(3, 17, 3, 'ytyutyu', '2018-03-12 08:04:12'),
	(4, 17, 3, '343eesdf', '2022-10-10 12:40:52'),
	(5, 15, 1, 'sample', '2022-10-10 12:57:48');

-- Dumping structure for table tracerdata.forum_comment_reply
CREATE TABLE IF NOT EXISTS `forum_comment_reply` (
  `comment_reply_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `comment_reply_topicID` int(10) unsigned DEFAULT NULL,
  `comment_reply_parentID` int(11) unsigned DEFAULT NULL,
  `comment_reply_userID` int(11) unsigned DEFAULT NULL,
  `comment_reply_content` varchar(500) DEFAULT NULL,
  `comment_reply_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`comment_reply_ID`),
  KEY `comment_reply_parentID` (`comment_reply_parentID`),
  KEY `comment_reply_userID` (`comment_reply_userID`),
  KEY `comment_reply_topicID` (`comment_reply_topicID`),
  CONSTRAINT `forum_comment_reply_ibfk_1` FOREIGN KEY (`comment_reply_parentID`) REFERENCES `forum_comment` (`comment_ID`),
  CONSTRAINT `forum_comment_reply_ibfk_2` FOREIGN KEY (`comment_reply_userID`) REFERENCES `user_account` (`user_ID`),
  CONSTRAINT `forum_comment_reply_ibfk_3` FOREIGN KEY (`comment_reply_topicID`) REFERENCES `forum_topic` (`topic_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.forum_comment_reply: ~0 rows (approximately)

-- Dumping structure for table tracerdata.forum_topic
CREATE TABLE IF NOT EXISTS `forum_topic` (
  `topic_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `post_title` varchar(150) DEFAULT NULL,
  `post_owner_id` int(11) unsigned DEFAULT NULL,
  `post_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `post_content` varchar(50000) DEFAULT NULL,
  `post_status` varchar(25) DEFAULT 'UNPIN',
  PRIMARY KEY (`topic_ID`),
  KEY `post_owner_id` (`post_owner_id`),
  CONSTRAINT `forum_topic_ibfk_1` FOREIGN KEY (`post_owner_id`) REFERENCES `user_account` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.forum_topic: ~3 rows (approximately)
INSERT IGNORE INTO `forum_topic` (`topic_ID`, `post_title`, `post_owner_id`, `post_date`, `post_content`, `post_status`) VALUES
	(15, '1231231', 1, '2018-02-24 14:48:22', '<p>asda</p>\r\n', 'UNPIN'),
	(16, 'asda', 4, '2018-02-24 15:09:46', '<p>asdasd</p>\r\n', 'UNPIN'),
	(17, 'asdasdas', 3, '2018-03-12 08:03:57', '<p>d213123123</p>\r\n', 'UNPIN'),
	(18, 'maps', 1, '2022-10-09 09:38:22', '<p>asdadsasd<a href="https://is2-ssl.mzstatic.com/image/thumb/Purple122/v4/80/cc/0c/80cc0cf1-7129-bec0-cf2e-731a646663ba/logo_maps_ios_color-0-1x_U007emarketing-0-0-0-6-0-0-85-220.png/1200x630wa.png"><img alt="" src="https://is2-ssl.mzstatic.com/image/thumb/Purple122/v4/80/cc/0c/80cc0cf1-7129-bec0-cf2e-731a646663ba/logo_maps_ios_color-0-1x_U007emarketing-0-0-0-6-0-0-85-220.png/1200x630wa.png" style="height:158px; width:300px" /></a></p>\r\n', 'UNPIN');

-- Dumping structure for table tracerdata.marital_status
CREATE TABLE IF NOT EXISTS `marital_status` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `marital_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.marital_status: ~3 rows (approximately)
INSERT IGNORE INTO `marital_status` (`ID`, `marital_Name`) VALUES
	(1, 'Single'),
	(2, 'Married'),
	(3, 'Widowed');

-- Dumping structure for table tracerdata.message_send
CREATE TABLE IF NOT EXISTS `message_send` (
  `message_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `message_threadID` int(11) unsigned DEFAULT NULL,
  `message_sendDate` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `message_content` varchar(1500) DEFAULT NULL,
  `message_receiver` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`message_ID`),
  KEY `message_threadID` (`message_threadID`),
  KEY `message_receiver` (`message_receiver`),
  CONSTRAINT `message_send_ibfk_1` FOREIGN KEY (`message_threadID`) REFERENCES `message_thread` (`thread_ID`),
  CONSTRAINT `message_send_ibfk_2` FOREIGN KEY (`message_receiver`) REFERENCES `user_account` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.message_send: ~2 rows (approximately)
INSERT IGNORE INTO `message_send` (`message_ID`, `message_threadID`, `message_sendDate`, `message_content`, `message_receiver`) VALUES
	(1, 1, '2018-02-22 15:22:11', 'waaaaaaaa', 3),
	(2, 1, '2018-02-22 15:22:13', 'meeeeeeeeeeeee', 3);

-- Dumping structure for table tracerdata.message_send_state
CREATE TABLE IF NOT EXISTS `message_send_state` (
  `state_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `state_msgID` int(11) unsigned DEFAULT NULL,
  `state_readerID` int(11) unsigned DEFAULT NULL,
  `state_dateRead` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`state_ID`),
  KEY `state_msgID` (`state_msgID`),
  KEY `state_readerID` (`state_readerID`),
  CONSTRAINT `message_send_state_ibfk_1` FOREIGN KEY (`state_msgID`) REFERENCES `message_send` (`message_ID`),
  CONSTRAINT `message_send_state_ibfk_2` FOREIGN KEY (`state_readerID`) REFERENCES `user_account` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.message_send_state: ~1 rows (approximately)
INSERT IGNORE INTO `message_send_state` (`state_ID`, `state_msgID`, `state_readerID`, `state_dateRead`) VALUES
	(1, NULL, NULL, NULL);

-- Dumping structure for table tracerdata.message_thread
CREATE TABLE IF NOT EXISTS `message_thread` (
  `thread_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `thread_name` varchar(150) DEFAULT NULL,
  `thread_created` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`thread_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.message_thread: ~1 rows (approximately)
INSERT IGNORE INTO `message_thread` (`thread_ID`, `thread_name`, `thread_created`) VALUES
	(1, '64564', '2018-02-22 15:19:21');

-- Dumping structure for table tracerdata.message_thread_participant
CREATE TABLE IF NOT EXISTS `message_thread_participant` (
  `participant_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `participant_threadID` int(11) unsigned DEFAULT NULL,
  `participant_userID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`participant_ID`),
  KEY `participant_threadID` (`participant_threadID`),
  KEY `participant_userID` (`participant_userID`),
  CONSTRAINT `message_thread_participant_ibfk_1` FOREIGN KEY (`participant_threadID`) REFERENCES `message_thread` (`thread_ID`),
  CONSTRAINT `message_thread_participant_ibfk_2` FOREIGN KEY (`participant_userID`) REFERENCES `user_account` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.message_thread_participant: ~1 rows (approximately)
INSERT IGNORE INTO `message_thread_participant` (`participant_ID`, `participant_threadID`, `participant_userID`) VALUES
	(1, 1, 1);

-- Dumping structure for table tracerdata.psu_college
CREATE TABLE IF NOT EXISTS `psu_college` (
  `colleges_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `college_name` varchar(150) DEFAULT NULL,
  `college_acronym` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`colleges_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.psu_college: ~2 rows (approximately)
INSERT IGNORE INTO `psu_college` (`colleges_ID`, `college_name`, `college_acronym`) VALUES
	(1, 'College of Engineering and Information Technology', 'CEIT'),
	(2, 'College of Art and Sciences', 'CAS');

-- Dumping structure for table tracerdata.psu_course
CREATE TABLE IF NOT EXISTS `psu_course` (
  `course_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `course_departmentID` int(11) unsigned DEFAULT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `course_acronym` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`course_ID`),
  KEY `course_departmentID` (`course_departmentID`),
  CONSTRAINT `psu_course_ibfk_1` FOREIGN KEY (`course_departmentID`) REFERENCES `psu_department` (`department_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.psu_course: ~3 rows (approximately)
INSERT IGNORE INTO `psu_course` (`course_ID`, `course_departmentID`, `course_name`, `course_acronym`) VALUES
	(1, 2, 'Bachelor of Science in Information Technology', 'BSIT'),
	(2, 2, 'Bachelor of Science in Computer Science', 'BSCS'),
	(3, 2, 'Bachelor of Science in Office Administration', 'BSOA');

-- Dumping structure for table tracerdata.psu_department
CREATE TABLE IF NOT EXISTS `psu_department` (
  `department_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `department_collegeID` int(11) unsigned DEFAULT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `department_acronym` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`department_ID`),
  KEY `department_collegeID` (`department_collegeID`),
  CONSTRAINT `psu_department_ibfk_1` FOREIGN KEY (`department_collegeID`) REFERENCES `psu_college` (`colleges_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.psu_department: ~3 rows (approximately)
INSERT IGNORE INTO `psu_department` (`department_ID`, `department_collegeID`, `department_name`, `department_acronym`) VALUES
	(1, 1, 'Computer Science', 'COMSCI'),
	(2, 1, 'Information Technology', 'IT'),
	(3, 1, 'Office Administration', 'OA');

-- Dumping structure for table tracerdata.suggested_job
CREATE TABLE IF NOT EXISTS `suggested_job` (
  `job_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `job_Title` varchar(250) DEFAULT NULL,
  `job_Course` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`job_ID`),
  KEY `job_Course` (`job_Course`),
  CONSTRAINT `suggested_job_ibfk_1` FOREIGN KEY (`job_Course`) REFERENCES `psu_course` (`course_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.suggested_job: ~31 rows (approximately)
INSERT IGNORE INTO `suggested_job` (`job_ID`, `job_Title`, `job_Course`) VALUES
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

-- Dumping structure for table tracerdata.survey
CREATE TABLE IF NOT EXISTS `survey` (
  `survey_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `survey_name` varchar(255) DEFAULT NULL,
  `survey_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `visibility` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`survey_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.survey: ~3 rows (approximately)
INSERT IGNORE INTO `survey` (`survey_ID`, `survey_name`, `survey_date`, `visibility`) VALUES
	(1, 'survey 1', '2018-05-04 17:25:50', 1),
	(2, 'survey 2', '2018-05-04 17:25:50', 0),
	(10, 'asdasdasd', '2018-05-01 09:11:37', 0);

-- Dumping structure for table tracerdata.survey_answer
CREATE TABLE IF NOT EXISTS `survey_answer` (
  `a_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `survey_aID` int(11) unsigned DEFAULT NULL,
  `user_ID` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`a_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.survey_answer: ~26 rows (approximately)
INSERT IGNORE INTO `survey_answer` (`a_ID`, `survey_aID`, `user_ID`, `form_id`) VALUES
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

-- Dumping structure for table tracerdata.survey_answer_other
CREATE TABLE IF NOT EXISTS `survey_answer_other` (
  `ao_ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_ID` int(11) DEFAULT NULL,
  `survey_aID` int(11) NOT NULL,
  `survey_aString` varchar(250) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ao_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.survey_answer_other: ~2 rows (approximately)
INSERT IGNORE INTO `survey_answer_other` (`ao_ID`, `user_ID`, `survey_aID`, `survey_aString`, `form_id`) VALUES
	(10, 3, 2, '11111111111111', 18),
	(11, 3, 8, '1111111111111111111', 18);

-- Dumping structure for table tracerdata.survey_anweroptions
CREATE TABLE IF NOT EXISTS `survey_anweroptions` (
  `survey_aID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `survey_qID` int(11) unsigned DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`survey_aID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.survey_anweroptions: ~19 rows (approximately)
INSERT IGNORE INTO `survey_anweroptions` (`survey_aID`, `survey_qID`, `answer`) VALUES
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

-- Dumping structure for table tracerdata.survey_forms
CREATE TABLE IF NOT EXISTS `survey_forms` (
  `form_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_ownerID` int(11) unsigned DEFAULT NULL,
  `form_taken` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `survey_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`form_id`),
  KEY `form_ownerID` (`form_ownerID`),
  CONSTRAINT `survey_forms_ibfk_1` FOREIGN KEY (`form_ownerID`) REFERENCES `user_account` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.survey_forms: ~18 rows (approximately)
INSERT IGNORE INTO `survey_forms` (`form_id`, `form_ownerID`, `form_taken`, `survey_ID`) VALUES
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

-- Dumping structure for table tracerdata.survey_maxcount
CREATE TABLE IF NOT EXISTS `survey_maxcount` (
  `survey_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `survey_ownerID` int(11) unsigned DEFAULT NULL,
  `survey_maxattemp` int(11) DEFAULT NULL,
  `survey_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`survey_id`),
  UNIQUE KEY `survey_ownerID_2` (`survey_ownerID`),
  KEY `survey_ownerID` (`survey_ownerID`),
  CONSTRAINT `survey_maxcount_ibfk_1` FOREIGN KEY (`survey_ownerID`) REFERENCES `user_account` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.survey_maxcount: ~7 rows (approximately)
INSERT IGNORE INTO `survey_maxcount` (`survey_id`, `survey_ownerID`, `survey_maxattemp`, `survey_date`) VALUES
	(1, 1, 2, '2018-05-01 07:08:27'),
	(2, 3, 0, '2018-05-04 17:42:35'),
	(3, 6, 2, '2018-02-18 16:00:00'),
	(4, 18, 2, '2022-10-10 14:06:08'),
	(5, 19, 2, '2018-03-07 17:46:58'),
	(6, 21, 1, '2018-03-17 09:57:10'),
	(7, 22, 1, '2018-03-17 10:00:10');

-- Dumping structure for table tracerdata.survey_question1
CREATE TABLE IF NOT EXISTS `survey_question1` (
  `survey_qID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `row` int(11) DEFAULT NULL,
  `col1` varchar(50) DEFAULT NULL,
  `col2` varchar(50) DEFAULT NULL,
  `survey_formID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`survey_qID`),
  KEY `survey_formID` (`survey_formID`),
  CONSTRAINT `survey_question1_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.survey_question1: ~105 rows (approximately)
INSERT IGNORE INTO `survey_question1` (`survey_qID`, `row`, `col1`, `col2`, `survey_formID`) VALUES
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
	(31, 1, 'U_AB_BS1', '', 3),
	(32, 2, '', 'G_MS_MA_PHD2', 3),
	(33, 3, 'U_AB_BS3', '', 3),
	(34, 4, '', '', 3),
	(35, 5, '', 'G_MS_MA_PHD5', 3),
	(36, 6, '', '', 3),
	(37, 7, '', '', 3),
	(38, 8, '', '', 3),
	(39, 9, '', '', 3),
	(40, 10, '', 'G_MS_MA_PHD10', 3),
	(41, 11, '', '', 3),
	(42, 12, '', '', 3),
	(43, 13, '', '', 3),
	(44, 14, '', '', 3),
	(45, 15, 'other', 'sdsdfsdfsdf', 3),
	(46, 1, '', 'G_MS_MA_PHD1', 4),
	(47, 2, '', 'G_MS_MA_PHD2', 4),
	(48, 3, '', '', 4),
	(49, 4, '', '', 4),
	(50, 5, '', '', 4),
	(51, 6, '', '', 4),
	(52, 7, '', '', 4),
	(53, 8, '', '', 4),
	(54, 9, '', '', 4),
	(55, 10, '', '', 4),
	(56, 11, '', '', 4),
	(57, 12, '', '', 4),
	(58, 13, '', '', 4),
	(59, 14, '', 'G_MS_MA_PHD14', 4),
	(60, 15, 'other', 'zzzzzzzzzzzzzzzzzzzzz', 4),
	(61, 1, 'U_AB_BS1', '', 5),
	(62, 2, 'U_AB_BS2', '', 5),
	(63, 3, 'U_AB_BS3', '', 5),
	(64, 4, 'U_AB_BS4', '', 5),
	(65, 5, 'U_AB_BS5', '', 5),
	(66, 6, 'U_AB_BS6', '', 5),
	(67, 7, 'U_AB_BS7', '', 5),
	(68, 8, 'U_AB_BS8', '', 5),
	(69, 9, 'U_AB_BS9', '', 5),
	(70, 10, 'U_AB_BS10', '', 5),
	(71, 11, 'U_AB_BS11', '', 5),
	(72, 12, 'U_AB_BS12', '', 5),
	(73, 13, 'U_AB_BS13', '', 5),
	(74, 14, 'U_AB_BS14', '', 5),
	(75, 15, 'other', '', 5),
	(76, 1, '', 'G_MS_MA_PHD1', 6),
	(77, 2, '', 'G_MS_MA_PHD2', 6),
	(78, 3, '', 'G_MS_MA_PHD3', 6),
	(79, 4, '', 'G_MS_MA_PHD4', 6),
	(80, 5, 'U_AB_BS5', '', 6),
	(81, 6, '', 'G_MS_MA_PHD6', 6),
	(82, 7, '', 'G_MS_MA_PHD7', 6),
	(83, 8, '', 'G_MS_MA_PHD8', 6),
	(84, 9, '', 'G_MS_MA_PHD9', 6),
	(85, 10, 'U_AB_BS10', '', 6),
	(86, 11, '', 'G_MS_MA_PHD11', 6),
	(87, 12, '', 'G_MS_MA_PHD12', 6),
	(88, 13, '', 'G_MS_MA_PHD13', 6),
	(89, 14, '', 'G_MS_MA_PHD14', 6),
	(90, 15, 'other', '', 6),
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

-- Dumping structure for table tracerdata.survey_question2
CREATE TABLE IF NOT EXISTS `survey_question2` (
  `survey_qID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `survey_row1` int(11) DEFAULT NULL,
  `survey_col1` varchar(50) DEFAULT 'no',
  `survey_formID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`survey_qID`),
  KEY `survey_formID` (`survey_formID`),
  CONSTRAINT `survey_question2_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.survey_question2: ~35 rows (approximately)
INSERT IGNORE INTO `survey_question2` (`survey_qID`, `survey_row1`, `survey_col1`, `survey_formID`) VALUES
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
	(11, 1, 'yes', 3),
	(12, 2, 'yes', 3),
	(13, 3, 'no', 3),
	(14, 4, 'yes', 3),
	(15, 5, 'ghjghjghjghj', 3),
	(16, 1, 'yes', 4),
	(17, 2, 'yes', 4),
	(18, 3, 'yes', 4),
	(19, 4, 'yes', 4),
	(20, 5, 'zzzzzzzzzzzzzzzzzzzzzzz', 4),
	(21, 1, 'no', 5),
	(22, 2, 'yes', 5),
	(23, 3, 'no', 5),
	(24, 4, 'no', 5),
	(25, 5, '', 5),
	(26, 1, 'no', 6),
	(27, 2, 'yes', 6),
	(28, 3, 'no', 6),
	(29, 4, 'no', 6),
	(30, 5, '', 6),
	(31, 1, 'no', 7),
	(32, 2, 'no', 7),
	(33, 3, 'no', 7),
	(34, 4, 'no', 7),
	(35, 5, '', 7);

-- Dumping structure for table tracerdata.survey_question3
CREATE TABLE IF NOT EXISTS `survey_question3` (
  `survey_qID` int(11) NOT NULL AUTO_INCREMENT,
  `row` int(11) DEFAULT NULL,
  `col1` varchar(1) DEFAULT '0',
  `col2` varchar(1) DEFAULT '0',
  `survey_formID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`survey_qID`),
  KEY `survey_formID` (`survey_formID`),
  CONSTRAINT `survey_question3_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.survey_question3: ~28 rows (approximately)
INSERT IGNORE INTO `survey_question3` (`survey_qID`, `row`, `col1`, `col2`, `survey_formID`) VALUES
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

-- Dumping structure for table tracerdata.survey_question4
CREATE TABLE IF NOT EXISTS `survey_question4` (
  `survey_qID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `row1` int(11) DEFAULT NULL,
  `col1` varchar(1) DEFAULT '0',
  `survey_formID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`survey_qID`),
  KEY `survey_formID` (`survey_formID`),
  CONSTRAINT `survey_question4_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.survey_question4: ~42 rows (approximately)
INSERT IGNORE INTO `survey_question4` (`survey_qID`, `row1`, `col1`, `survey_formID`) VALUES
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
	(13, 1, '1', 3),
	(14, 2, '', 3),
	(15, 3, '', 3),
	(16, 4, '', 3),
	(17, 5, '', 3),
	(18, 6, '', 3),
	(19, 1, '', 4),
	(20, 2, '1', 4),
	(21, 3, '', 4),
	(22, 4, '1', 4),
	(23, 5, '', 4),
	(24, 6, '1', 4),
	(25, 1, '', 5),
	(26, 2, '', 5),
	(27, 3, '', 5),
	(28, 4, '', 5),
	(29, 5, '1', 5),
	(30, 6, '', 5),
	(31, 1, '', 6),
	(32, 2, '', 6),
	(33, 3, '', 6),
	(34, 4, '', 6),
	(35, 5, '', 6),
	(36, 6, '1', 6),
	(37, 1, '', 7),
	(38, 2, '', 7),
	(39, 3, '1', 7),
	(40, 4, '1', 7),
	(41, 5, '1', 7),
	(42, 6, '1', 7);

-- Dumping structure for table tracerdata.survey_question5
CREATE TABLE IF NOT EXISTS `survey_question5` (
  `survey_qID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ans` varchar(5) DEFAULT NULL,
  `survey_formID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`survey_qID`),
  KEY `survey_formID` (`survey_formID`),
  CONSTRAINT `survey_question5_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.survey_question5: ~7 rows (approximately)
INSERT IGNORE INTO `survey_question5` (`survey_qID`, `ans`, `survey_formID`) VALUES
	(1, 'yes', 1),
	(2, 'yes', 2),
	(3, 'yes', 3),
	(4, 'yes', 4),
	(5, 'yes', 5),
	(6, 'yes', 6),
	(7, '', 7);

-- Dumping structure for table tracerdata.survey_question6
CREATE TABLE IF NOT EXISTS `survey_question6` (
  `survey_qID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ans` varchar(10) DEFAULT NULL,
  `survey_formID` int(11) unsigned DEFAULT NULL,
  `job` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`survey_qID`),
  KEY `survey_formID` (`survey_formID`),
  CONSTRAINT `survey_question6_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.survey_question6: ~7 rows (approximately)
INSERT IGNORE INTO `survey_question6` (`survey_qID`, `ans`, `survey_formID`, `job`) VALUES
	(1, 'temp', 1, NULL),
	(2, 'rop', 2, 'Web Developer'),
	(3, 'temp', 3, 'Web Developer'),
	(4, 'con', 4, 'Data Scientist'),
	(5, 'rop', 5, 'Executive Assistant'),
	(6, 'rop', 6, 'Web Developer'),
	(7, '', 7, 'asdasdasd');

-- Dumping structure for table tracerdata.survey_question7
CREATE TABLE IF NOT EXISTS `survey_question7` (
  `survey_qID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `survey_ans` varchar(1) DEFAULT '0',
  `survey_formID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`survey_qID`),
  KEY `survey_formID` (`survey_formID`),
  CONSTRAINT `survey_question7_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.survey_question7: ~7 rows (approximately)
INSERT IGNORE INTO `survey_question7` (`survey_qID`, `survey_ans`, `survey_formID`) VALUES
	(1, '1', 1),
	(2, '0', 2),
	(3, '1', 3),
	(4, '0', 4),
	(5, '1', 5),
	(6, '1', 6),
	(7, '1', 7);

-- Dumping structure for table tracerdata.survey_question8
CREATE TABLE IF NOT EXISTS `survey_question8` (
  `survey_qID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `row1` int(11) DEFAULT NULL,
  `col1` varchar(50) DEFAULT NULL,
  `survey_formID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`survey_qID`),
  KEY `survey_formID` (`survey_formID`),
  CONSTRAINT `survey_question8_ibfk_1` FOREIGN KEY (`survey_formID`) REFERENCES `survey_forms` (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.survey_question8: ~30 rows (approximately)
INSERT IGNORE INTO `survey_question8` (`survey_qID`, `row1`, `col1`, `survey_formID`) VALUES
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

-- Dumping structure for table tracerdata.survey_questionnaire
CREATE TABLE IF NOT EXISTS `survey_questionnaire` (
  `survey_qID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `survey_ID` int(11) unsigned DEFAULT NULL,
  `question` varchar(255) NOT NULL,
  PRIMARY KEY (`survey_qID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.survey_questionnaire: ~10 rows (approximately)
INSERT IGNORE INTO `survey_questionnaire` (`survey_qID`, `survey_ID`, `question`) VALUES
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

-- Dumping structure for table tracerdata.user_account
CREATE TABLE IF NOT EXISTS `user_account` (
  `user_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_level` int(11) unsigned DEFAULT NULL,
  `user_name` varchar(25) DEFAULT NULL,
  `user_password` mediumtext DEFAULT NULL,
  `user_created` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`user_ID`),
  KEY `user_level` (`user_level`),
  CONSTRAINT `user_account_ibfk_1` FOREIGN KEY (`user_level`) REFERENCES `user_level` (`level_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.user_account: ~12 rows (approximately)
INSERT IGNORE INTO `user_account` (`user_ID`, `user_level`, `user_name`, `user_password`, `user_created`) VALUES
	(0, 3, 'unregister', 'unregister', '2018-02-04 12:20:56'),
	(1, 1, '201310656', '123', '2022-10-07 12:25:47'),
	(3, 3, 'admin', 'admin', '2022-10-07 12:22:05'),
	(4, 2, 'teacher', '12345', '2022-10-07 12:25:47'),
	(6, 2, 'daaa1', '12345', '2022-10-07 12:25:47'),
	(8, 2, 'wazhing', '12345', '2022-10-07 12:25:47'),
	(17, 2, 'z1', '12345', '2022-10-07 12:25:47'),
	(18, 1, '123', '123', '2022-10-07 12:25:47'),
	(19, 1, '123456', '123', '2022-10-07 12:25:47'),
	(20, 2, 'zxc123', '12345', '2022-10-07 12:25:47'),
	(21, 1, '201478545', '123', '2022-10-07 12:25:47'),
	(22, 1, '201310184', '123', '2022-10-07 12:25:47');

-- Dumping structure for table tracerdata.user_admin_detail
CREATE TABLE IF NOT EXISTS `user_admin_detail` (
  `admin_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admin_userID` int(11) unsigned DEFAULT NULL,
  `admin_img` varchar(250) DEFAULT 'temp.gif',
  `admin_fName` varchar(100) DEFAULT NULL,
  `admin_mName` varchar(25) DEFAULT NULL,
  `admin_lName` varchar(50) DEFAULT NULL,
  `admin_address` varchar(250) DEFAULT NULL,
  `admin_status` varchar(10) DEFAULT 'unregister',
  `admin_gender` varchar(1) DEFAULT NULL,
  `admin_dob` date DEFAULT NULL,
  `admin_contact` varchar(11) DEFAULT NULL,
  `admin_civilStat` int(11) unsigned DEFAULT NULL,
  `admin_secretquestion` varchar(250) DEFAULT NULL,
  `admin_secretanswer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`admin_ID`),
  KEY `admin_userID` (`admin_userID`),
  KEY `admin_civilStat` (`admin_civilStat`),
  CONSTRAINT `user_admin_detail_ibfk_1` FOREIGN KEY (`admin_userID`) REFERENCES `user_account` (`user_ID`),
  CONSTRAINT `user_admin_detail_ibfk_2` FOREIGN KEY (`admin_civilStat`) REFERENCES `marital_status` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.user_admin_detail: ~1 rows (approximately)
INSERT IGNORE INTO `user_admin_detail` (`admin_ID`, `admin_userID`, `admin_img`, `admin_fName`, `admin_mName`, `admin_lName`, `admin_address`, `admin_status`, `admin_gender`, `admin_dob`, `admin_contact`, `admin_civilStat`, `admin_secretquestion`, `admin_secretanswer`) VALUES
	(1, 3, 'CHOLLY.png', 'Charlie', 'Alano', 'Nagal', 'Calasiao Pangasinan', 'register', 'M', '0000-00-00', '09169158798', 1, '', '');

-- Dumping structure for table tracerdata.user_level
CREATE TABLE IF NOT EXISTS `user_level` (
  `level_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`level_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.user_level: ~4 rows (approximately)
INSERT IGNORE INTO `user_level` (`level_ID`, `level_name`) VALUES
	(0, 'unregister'),
	(1, 'student'),
	(2, 'teacher'),
	(3, 'admin');

-- Dumping structure for table tracerdata.user_notification
CREATE TABLE IF NOT EXISTS `user_notification` (
  `notif_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `notif_typeID` int(11) unsigned DEFAULT NULL,
  `notif_topicID` int(11) unsigned DEFAULT NULL,
  `notif_userID` int(11) unsigned DEFAULT NULL,
  `notif_receiverID` int(11) unsigned DEFAULT NULL,
  `notif_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `notif_state` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`notif_ID`),
  KEY `notif_topicID` (`notif_topicID`),
  KEY `notif_userID` (`notif_userID`),
  KEY `notif_receiverID` (`notif_receiverID`),
  CONSTRAINT `user_notification_ibfk_2` FOREIGN KEY (`notif_userID`) REFERENCES `user_account` (`user_ID`),
  CONSTRAINT `user_notification_ibfk_3` FOREIGN KEY (`notif_receiverID`) REFERENCES `user_account` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.user_notification: ~2 rows (approximately)
INSERT IGNORE INTO `user_notification` (`notif_ID`, `notif_typeID`, `notif_topicID`, `notif_userID`, `notif_receiverID`, `notif_date`, `notif_state`) VALUES
	(3, 2, 1, 3, 8, '2022-10-07 12:40:11', 1),
	(4, 3, 15, 4, 1, '2022-10-07 12:40:11', 1);

-- Dumping structure for table tracerdata.user_notif_state
CREATE TABLE IF NOT EXISTS `user_notif_state` (
  `status_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status_Desc` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`status_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.user_notif_state: ~0 rows (approximately)

-- Dumping structure for table tracerdata.user_notif_type
CREATE TABLE IF NOT EXISTS `user_notif_type` (
  `type_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.user_notif_type: ~0 rows (approximately)

-- Dumping structure for table tracerdata.user_student_detail
CREATE TABLE IF NOT EXISTS `user_student_detail` (
  `student_ID` int(11) NOT NULL AUTO_INCREMENT,
  `student_userID` int(11) unsigned DEFAULT NULL,
  `student_img` varchar(250) DEFAULT 'temp.gif',
  `student_IDNumber` int(11) unsigned DEFAULT NULL,
  `student_fName` varchar(100) DEFAULT NULL,
  `student_mName` varchar(25) DEFAULT NULL,
  `student_lName` varchar(50) DEFAULT NULL,
  `student_address` varchar(250) DEFAULT NULL,
  `student_civilStat` int(11) unsigned DEFAULT NULL,
  `student_dob` date DEFAULT NULL,
  `student_gender` varchar(1) DEFAULT NULL,
  `student_contact` varchar(11) DEFAULT NULL,
  `student_admission` date DEFAULT NULL,
  `student_year_grad` date DEFAULT NULL,
  `student_department` int(11) unsigned DEFAULT NULL,
  `student_status` varchar(10) DEFAULT 'unregister',
  `student_secretquestion` varchar(250) DEFAULT NULL,
  `student_secretanswer` varchar(100) DEFAULT NULL,
  `student_motto` longtext DEFAULT NULL,
  PRIMARY KEY (`student_ID`),
  KEY `student_department` (`student_department`),
  KEY `student_userID` (`student_userID`),
  KEY `student_civilStat` (`student_civilStat`),
  CONSTRAINT `user_student_detail_ibfk_1` FOREIGN KEY (`student_department`) REFERENCES `psu_course` (`course_ID`),
  CONSTRAINT `user_student_detail_ibfk_2` FOREIGN KEY (`student_userID`) REFERENCES `user_account` (`user_ID`),
  CONSTRAINT `user_student_detail_ibfk_3` FOREIGN KEY (`student_civilStat`) REFERENCES `marital_status` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.user_student_detail: ~18 rows (approximately)
INSERT IGNORE INTO `user_student_detail` (`student_ID`, `student_userID`, `student_img`, `student_IDNumber`, `student_fName`, `student_mName`, `student_lName`, `student_address`, `student_civilStat`, `student_dob`, `student_gender`, `student_contact`, `student_admission`, `student_year_grad`, `student_department`, `student_status`, `student_secretquestion`, `student_secretanswer`, `student_motto`) VALUES
	(1, 1, 'psu-442.jpg', 201310656, 'asd', 'asd', 'asdasd', 'asd321', 1, NULL, 'M', '21', '2018-03-06', '2018-03-30', 1, 'unregister', NULL, NULL, 'Don\'t let your dreams be dreams.'),
	(2, NULL, 'temp.gif', 1111321, 'csz', 'csz', 'csz', 'csz', 1, '0000-00-00', 'M', '123123', '2013-06-01', '2013-06-01', 2, 'unregister', NULL, NULL, NULL),
	(3, NULL, 'temp.gif', 2212121, 'itz', 'itz', 'itz', 'itz', 1, '0000-00-00', 'F', '123123', '2013-06-01', '2013-06-01', 1, 'unregister', NULL, NULL, NULL),
	(4, NULL, 'temp.gif', 1111321, 'csz', 'csz', 'csz', 'csz', 1, '0000-00-00', 'M', '123123', '2013-06-01', '2013-06-01', 2, 'unregister', NULL, NULL, NULL),
	(5, NULL, 'temp.gif', 2212121, 'itz', 'itz', 'itz', 'itz', 1, '0000-00-00', 'F', '123123', '2013-06-01', '2013-06-01', 1, 'unregister', NULL, NULL, NULL),
	(6, NULL, 'temp.gif', 1111321, 'csz', 'csz', 'csz', 'csz', 1, '0000-00-00', 'M', '123123', '2013-06-01', '2013-06-01', 2, 'unregister', NULL, NULL, NULL),
	(7, NULL, 'temp.gif', 2212121, 'itz', 'itz', 'itz', 'itz', 1, '0000-00-00', 'F', '123123', '2013-06-01', '2013-06-01', 1, 'unregister', NULL, NULL, NULL),
	(8, NULL, 'temp.gif', 1111321, 'csz', 'csz', 'csz', 'csz', 1, '0000-00-00', 'M', '123123', '2013-06-01', '2013-06-01', 2, 'unregister', NULL, NULL, NULL),
	(9, NULL, 'temp.gif', 2212121, 'itz', 'itz', 'itz', 'itz', 1, '0000-00-00', 'F', '123123', '2013-06-01', '2013-06-01', 1, 'unregister', NULL, NULL, NULL),
	(10, NULL, 'temp.gif', 1111321, 'csz', 'csz', 'csz', 'csz', 1, '0000-00-00', 'M', '123123', '2013-06-01', '2013-06-01', 2, 'unregister', NULL, NULL, NULL),
	(11, NULL, 'temp.gif', 2212121, 'itz', 'itz', 'itz', 'itz', 1, '0000-00-00', 'F', '123123', '2013-06-01', '2013-06-01', 1, 'unregister', NULL, NULL, NULL),
	(12, NULL, 'temp.gif', 1111321, 'csz', 'csz', 'csz', 'csz', 1, '0000-00-00', 'M', '123123', '2013-06-01', '2013-06-01', 2, 'unregister', NULL, NULL, NULL),
	(13, NULL, 'temp.gif', 2212121, 'itz', 'itz', 'itz', 'itz', 1, '0000-00-00', 'F', '123123', '2013-06-01', '2013-06-01', 1, 'unregister', NULL, NULL, NULL),
	(14, NULL, 'temp.gif', 1111321, 'csz', 'csz', 'csz', 'csz', 1, '0000-00-00', 'M', '123123', '2013-06-01', '2013-06-01', 2, 'unregister', NULL, NULL, NULL),
	(15, NULL, 'temp.gif', 2212121, 'itz', 'itz', 'itz', 'itz', 1, '0000-00-00', 'F', '123123', '2013-06-01', '2013-06-01', 1, 'unregister', NULL, NULL, NULL),
	(16, NULL, 'temp.gif', 1111321, 'csz', 'csz', 'csz', 'csz', 1, '0000-00-00', 'M', '123123', '2013-06-01', '2013-06-01', 2, 'unregister', NULL, NULL, NULL),
	(17, NULL, 'temp.gif', 2212121, 'itz', 'itz', 'itz', 'itz', 1, '0000-00-00', 'F', '123123', '2013-06-01', '2013-06-01', 1, 'unregister', NULL, NULL, NULL),
	(19, 0, 'temp.gif', 180434, 'Charlie Ken', 'A', 'Nagal', 'Bued Calasiao Pangasinan', 1, '1999-09-28', 'M', '9078150733', '2018-03-06', '2018-03-30', 1, 'unregister', NULL, NULL, 'Saaaample');

-- Dumping structure for table tracerdata.user_teacher_detail
CREATE TABLE IF NOT EXISTS `user_teacher_detail` (
  `teacher_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_userID` int(11) unsigned DEFAULT NULL,
  `teacher_img` varchar(250) DEFAULT 'temp.gif',
  `teacher_facultyID` int(11) unsigned DEFAULT NULL,
  `teacher_fName` varchar(100) DEFAULT NULL,
  `teacher_mName` varchar(25) DEFAULT NULL,
  `teacher_lName` varchar(50) DEFAULT NULL,
  `teacher_gender` varchar(1) DEFAULT NULL,
  `teacher_dob` date DEFAULT NULL,
  `teacher_contact` varchar(11) DEFAULT NULL,
  `teacher_address` varchar(250) DEFAULT NULL,
  `teacher_civilStat` int(11) unsigned DEFAULT NULL,
  `teacher_department` int(11) unsigned DEFAULT NULL,
  `teacher_status` varchar(10) DEFAULT 'unregister',
  `teacher_secretquestion` varchar(250) DEFAULT NULL,
  `teacher_secretanswer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`teacher_ID`),
  UNIQUE KEY `teacher_facultyID` (`teacher_facultyID`),
  KEY `teacher_userID` (`teacher_userID`),
  KEY `teacher_department` (`teacher_department`),
  KEY `teacher_civilStat` (`teacher_civilStat`),
  CONSTRAINT `user_teacher_detail_ibfk_1` FOREIGN KEY (`teacher_userID`) REFERENCES `user_account` (`user_ID`),
  CONSTRAINT `user_teacher_detail_ibfk_2` FOREIGN KEY (`teacher_department`) REFERENCES `psu_department` (`department_ID`),
  CONSTRAINT `user_teacher_detail_ibfk_3` FOREIGN KEY (`teacher_civilStat`) REFERENCES `marital_status` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.user_teacher_detail: ~3 rows (approximately)
INSERT IGNORE INTO `user_teacher_detail` (`teacher_ID`, `teacher_userID`, `teacher_img`, `teacher_facultyID`, `teacher_fName`, `teacher_mName`, `teacher_lName`, `teacher_gender`, `teacher_dob`, `teacher_contact`, `teacher_address`, `teacher_civilStat`, `teacher_department`, `teacher_status`, `teacher_secretquestion`, `teacher_secretanswer`) VALUES
	(130, 8, 'sad.jpg', 68, 'sarada', '', 'uchiha', 'F', '2018-01-28', '123123', '123123', 1, 2, 'register', '', ''),
	(140, 17, 'temp.gif', 54, 'z', 'z', 'z', 'M', '0004-08-05', '85', 'z', 1, 1, 'register', '', ''),
	(142, 20, 'temp.gif', 654, 'asd', 'asd', 'asd', 'M', '1689-09-01', '654', 'asd', 1, 1, 'register', '', '');

-- Dumping structure for table tracerdata.view_counter
CREATE TABLE IF NOT EXISTS `view_counter` (
  `view_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `view_topicID` int(11) unsigned DEFAULT NULL,
  `view_count` int(11) DEFAULT 0,
  PRIMARY KEY (`view_ID`),
  KEY `view_topicID` (`view_topicID`),
  CONSTRAINT `view_counter_ibfk_1` FOREIGN KEY (`view_topicID`) REFERENCES `forum_topic` (`topic_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table tracerdata.view_counter: ~4 rows (approximately)
INSERT IGNORE INTO `view_counter` (`view_ID`, `view_topicID`, `view_count`) VALUES
	(3, 15, 22),
	(4, 16, 6),
	(5, 17, 9),
	(6, 18, 5);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
