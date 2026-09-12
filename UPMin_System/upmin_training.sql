-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 25, 2011 at 03:31 AM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `upmin_training`
--
CREATE DATABASE `upmin_training` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `upmin_training`;

-- --------------------------------------------------------

--
-- Table structure for table `budget`
--

CREATE TABLE IF NOT EXISTS `budget` (
  `budget_id` int(10) NOT NULL AUTO_INCREMENT,
  `budget_allocated` double DEFAULT NULL,
  `budget_actual` double DEFAULT NULL,
  PRIMARY KEY (`budget_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `budget`
--

INSERT INTO `budget` (`budget_id`, `budget_allocated`, `budget_actual`) VALUES
(8, 789, 678),
(18, 213132, 213),
(19, 213132, 213),
(20, 5643, 6354),
(21, 3456, 356),
(22, 543, 654),
(27, 32, 32),
(31, 908, 879),
(39, 98, 7832),
(40, 98, 7832),
(41, 98, 7832),
(44, 0, 0),
(45, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `np_participant`
--

CREATE TABLE IF NOT EXISTS `np_participant` (
  `participant_id` varchar(10) NOT NULL,
  `participant_name` varchar(30) DEFAULT NULL,
  `participant_institution` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`participant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `np_participant`
--

INSERT INTO `np_participant` (`participant_id`, `participant_name`, `participant_institution`) VALUES
('A1', 'Participant Name', 'McDo');

-- --------------------------------------------------------

--
-- Table structure for table `participant_training`
--

CREATE TABLE IF NOT EXISTS `participant_training` (
  `participant_id` varchar(5) DEFAULT NULL,
  `training_id` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participant_training`
--

INSERT INTO `participant_training` (`participant_id`, `training_id`) VALUES
('8', 8),
('67', 20),
('9', 22),
('67', 9),
('1', 21),
('14', 27),
('12', 27),
('4', 27),
('1', 20),
('1', 19),
('1', 18),
('9', 8),
('1', 27),
('9', 27),
('2', 31),
('2', 39),
('2', 40),
('2', 41),
('2', 44),
('2', 45);

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE IF NOT EXISTS `training` (
  `training_ID` int(10) NOT NULL AUTO_INCREMENT,
  `training_title` varchar(30) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `Budget_id` varchar(10) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT '"None"',
  `organizer` varchar(30) DEFAULT NULL,
  `type` enum('Workshop','Conferece','Seminar','Competition','Others') DEFAULT NULL,
  `desc` text,
  PRIMARY KEY (`training_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `training`
--

INSERT INTO `training` (`training_ID`, `training_title`, `start_date`, `end_date`, `Budget_id`, `location`, `city`, `remarks`, `organizer`, `type`, `desc`) VALUES
(20, 'training title', '2011-09-25', '2011-09-25', '', 'location', 'city', 'fsdgvcbxcv ', 'UP MINDANAO', 'Seminar', 'gsfdgsd'),
(18, 'Nonesense', '2011-09-07', '2011-09-03', '18', 'location', 'city', 'remarks', 'organizer', 'Conferece', 'asdfasdfxzv'),
(8, 'Sample Training 8', '2011-09-25', '2011-09-25', 'budget_id', 'Sample Location', 'Sample City', 'vbcxvbxcvbxcvb', 'Sample Organizer', '', 'training Description'),
(19, 'Sample Training 3424', '2011-09-22', '2011-09-22', '', 'df', 'kljlkj', '', NULL, NULL, NULL),
(21, 'Training Sample 21', '2011-09-22', '2011-09-22', '', 'Mintal, Bago Oshiro', 'Davao City', '', NULL, NULL, NULL),
(22, 'sadf', '2011-09-25', '2011-09-25', '', 'dfas', 'sdf', 'asdfasdf', 'zdxcv', 'Competition', 'zcxv  df'),
(27, 'Sample Training 27', '2011-09-25', '2011-09-25', '', 'Mintal', 'Davao City', 'Remarks', 'Organizers', 'Competition', 'Training Desciption'),
(31, 'Sample Training 31', '2011-09-24', '2011-09-24', '', 'Not Location', 'Secret', '', NULL, NULL, NULL),
(39, 'Sample Training 3', '2011-09-25', '2011-09-25', '', '28', 'Davao City', '', '', 'Workshop', ''),
(40, 'Sample Training 40', '2011-09-24', '2011-09-24', '', '28', 'Davao Cityq', '', NULL, NULL, NULL),
(41, 'Sample Training 32', '2011-09-24', '2011-09-24', '', '28', 'Davao Cityq', 'fasd', NULL, NULL, NULL),
(44, 'dsafsd', '2011-09-24', '2011-09-24', '', 'dsfa', 'asdf', 'sdaf', NULL, NULL, NULL),
(45, 'dsafsd', '2011-09-24', '2011-09-24', '', 'dsfa', 'asdf', 'sdaf', NULL, NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
