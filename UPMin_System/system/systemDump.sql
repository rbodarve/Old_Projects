-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 25, 2011 at 02:18 AM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `upmin_common`
--
CREATE DATABASE `upmin_common` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `upmin_common`;

-- --------------------------------------------------------

--
-- Table structure for table `computerusers`
--

CREATE TABLE IF NOT EXISTS `computerusers` (
  `computerusersID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `equipmentID` int(10) unsigned NOT NULL,
  `officeID` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `ipAddress` varchar(45) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  PRIMARY KEY (`computerusersID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `computerusers`
--


-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE IF NOT EXISTS `equipment` (
  `equipmentID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dateAcquired` date NOT NULL,
  `remarks` blob NOT NULL,
  `ARE` int(10) unsigned NOT NULL,
  `PN` int(10) unsigned NOT NULL,
  `macAddress` varchar(45) NOT NULL,
  `serial` varchar(45) NOT NULL,
  PRIMARY KEY (`equipmentID`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`equipmentID`, `dateAcquired`, `remarks`, `ARE`, `PN`, `macAddress`, `serial`) VALUES
(1, '2011-01-17', 0x313131, 123, 12, '12131213', '123456'),
(2, '2011-01-11', 0x313131, 111, 111, '111', '111'),
(6, '2011-01-20', 0x333333, 333, 333, '333', '333'),
(7, '2011-01-19', 0x333333, 333, 333, '333', '333'),
(8, '2011-01-18', 0x313131, 123, 12, '12131213', '123456'),
(9, '0000-00-00', 0x32, 12345, 1234, '12', '12');

-- --------------------------------------------------------

--
-- Table structure for table `equipmentspecification`
--

CREATE TABLE IF NOT EXISTS `equipmentspecification` (
  `equipmentspecificationID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `equipmentID` int(10) unsigned NOT NULL,
  `specificationID` int(10) unsigned NOT NULL,
  `description` blob NOT NULL,
  PRIMARY KEY (`equipmentspecificationID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `equipmentspecification`
--

INSERT INTO `equipmentspecification` (`equipmentspecificationID`, `equipmentID`, `specificationID`, `description`) VALUES
(1, 1, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `inet_isp`
--

CREATE TABLE IF NOT EXISTS `inet_isp` (
  `ispID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(45) NOT NULL,
  `subscription` varchar(100) NOT NULL,
  `contactperson` varchar(100) NOT NULL,
  `contactnumber` varchar(45) NOT NULL,
  `emailaddress` varchar(100) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `startService` date NOT NULL,
  `endService` date NOT NULL,
  `amount` double(10,2) NOT NULL,
  `instantmessaging` varchar(100) NOT NULL,
  PRIMARY KEY (`ispID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `inet_isp`
--

INSERT INTO `inet_isp` (`ispID`, `company`, `subscription`, `contactperson`, `contactnumber`, `emailaddress`, `status`, `startService`, `endService`, `amount`, `instantmessaging`) VALUES
(2, 'Dctech Micro Services Inc.', 'Xtreme Service - DSL', 'Ms. Analou Lora', '2277435', 'helpdesk_davao@ym', 1, '2009-01-07', '2010-01-06', 35000.00, '');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `inventoryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `personnelID` int(10) unsigned NOT NULL,
  `equipmentID` int(10) unsigned NOT NULL,
  `officeID` int(10) unsigned NOT NULL,
  `ipAddress` varchar(45) NOT NULL,
  `macAddress` varchar(45) NOT NULL,
  PRIMARY KEY (`inventoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `inventory`
--


-- --------------------------------------------------------

--
-- Table structure for table `reporttemplate`
--

CREATE TABLE IF NOT EXISTS `reporttemplate` (
  `reportTemplateID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `header` text NOT NULL,
  `footer` text NOT NULL,
  `status` int(10) unsigned NOT NULL,
  PRIMARY KEY (`reportTemplateID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `reporttemplate`
--


-- --------------------------------------------------------

--
-- Table structure for table `specification`
--

CREATE TABLE IF NOT EXISTS `specification` (
  `specificationID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `specification` varchar(45) NOT NULL,
  PRIMARY KEY (`specificationID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `specification`
--

INSERT INTO `specification` (`specificationID`, `specification`) VALUES
(2, 'Chipset'),
(3, 'Memory'),
(4, 'Hard Disk Drive'),
(5, 'Optical Drive'),
(6, 'Display'),
(7, 'Audio'),
(8, 'Networking'),
(9, 'I/O Expansion'),
(10, 'Standard I/O Ports'),
(11, 'Monitor'),
(12, 'Keyboard & Mouse');
--
-- Database: `upmin_hrdo`
--
CREATE DATABASE `upmin_hrdo` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `upmin_hrdo`;

-- --------------------------------------------------------

--
-- Table structure for table `assets_realproperties`
--

CREATE TABLE IF NOT EXISTS `assets_realproperties` (
  `realprop_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prop_knd` varchar(45) NOT NULL,
  `prop_loc` varchar(100) NOT NULL,
  `acqn_mode` varchar(45) NOT NULL,
  `acqn_date` date NOT NULL,
  `acqn_cost` float(10,2) NOT NULL,
  `mrkt_value` float(10,2) NOT NULL,
  `assd_value` float(10,2) NOT NULL,
  PRIMARY KEY (`realprop_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `assets_realproperties`
--


-- --------------------------------------------------------

--
-- Table structure for table `assets_vehicles`
--

CREATE TABLE IF NOT EXISTS `assets_vehicles` (
  `vhcl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vhcl_type` varchar(45) NOT NULL,
  `vhcl_plateno` varchar(45) NOT NULL,
  `vhcl_certno` varchar(45) NOT NULL,
  `vhcl_regplace` varchar(100) NOT NULL,
  `acqn_mode` varchar(45) NOT NULL,
  `acqn_date` date NOT NULL,
  `acqn_cost` float(10,2) NOT NULL,
  PRIMARY KEY (`vhcl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `assets_vehicles`
--


-- --------------------------------------------------------

--
-- Table structure for table `business_interests`
--

CREATE TABLE IF NOT EXISTS `business_interests` (
  `enty_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lname` varchar(45) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `mname` varchar(45) NOT NULL,
  `enty_name` varchar(45) NOT NULL,
  `enty_address` varchar(100) NOT NULL,
  `enty_nature` varchar(100) NOT NULL,
  `enty_date` date NOT NULL,
  PRIMARY KEY (`enty_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `business_interests`
--


-- --------------------------------------------------------

--
-- Table structure for table `business_link`
--

CREATE TABLE IF NOT EXISTS `business_link` (
  `saln_id` int(10) NOT NULL,
  `enty_id` int(10) NOT NULL,
  PRIMARY KEY (`saln_id`,`enty_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `business_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `dependent`
--

CREATE TABLE IF NOT EXISTS `dependent` (
  `dependent_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `bdate` date NOT NULL,
  PRIMARY KEY (`dependent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `dependent`
--

INSERT INTO `dependent` (`dependent_id`, `fname`, `bdate`) VALUES
(1, 'dep a', '0000-00-00'),
(2, 'dep b', '0000-00-00'),
(3, 'dep c', '0000-00-00'),
(4, 'dep d', '0000-00-00'),
(5, 'dep e', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `dependent_link`
--

CREATE TABLE IF NOT EXISTS `dependent_link` (
  `saln_id` int(10) NOT NULL,
  `dependent_id` int(10) NOT NULL,
  PRIMARY KEY (`saln_id`,`dependent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dependent_link`
--

INSERT INTO `dependent_link` (`saln_id`, `dependent_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(2, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `govt_relatives`
--

CREATE TABLE IF NOT EXISTS `govt_relatives` (
  `relative_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lname` varchar(45) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `mname` varchar(45) NOT NULL,
  `relationship` varchar(45) NOT NULL,
  `position` varchar(45) NOT NULL,
  `office_address` varchar(100) NOT NULL,
  PRIMARY KEY (`relative_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `govt_relatives`
--


-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE IF NOT EXISTS `office` (
  `officeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `officeCode` varchar(45) NOT NULL,
  `officeName` varchar(100) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `parentID` int(10) unsigned NOT NULL,
  `lastModified` datetime DEFAULT NULL,
  PRIMARY KEY (`officeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `office`
--

INSERT INTO `office` (`officeID`, `officeCode`, `officeName`, `status`, `parentID`, `lastModified`) VALUES
(1, 'OC', 'Office of the Chancellor', 0, 0, NULL),
(2, 'ITO', 'Information Technology Office', 0, 1, NULL),
(3, 'OSA', 'Office of the Student Affairs', 0, 1, NULL),
(4, 'OVCA', 'Office of the Vice Chancellor for Administration', 0, 1, NULL),
(5, 'OVCAA', 'Office of the Vice Chancellor for Academic Affairs', 0, 1, NULL),
(6, 'SPMO', 'Supply and Property Management Office', 0, 4, NULL),
(7, 'OR', 'Office of Research', 0, 5, NULL),
(8, 'OUR', 'Office of the University Registrar', 0, 5, NULL),
(9, 'CASH', 'Cash Office', 0, 4, NULL),
(10, 'PPO', 'Physical Plant Office', 0, 4, NULL),
(11, 'HRDO', 'Human Resource Development Office', 0, 4, NULL),
(12, 'ACCTG', 'Accounting Office', 0, 4, NULL),
(13, 'LEGAL', 'Legal Office', 0, 1, NULL),
(14, 'OECS', 'Office of Extension and Community Service', 0, 1, NULL),
(15, 'BUDGET', 'Budget Office', 0, 1, NULL),
(17, 'CHSS-OD', 'Office of the Dean, CHSS', 0, 0, NULL),
(18, 'CSM-CSO', 'College Secretary Office, CSM', 0, 0, NULL),
(19, 'CSM-BSES', 'Biological Science and Environmental Science, CSM', 0, 0, NULL),
(20, 'CSM-BIOLAB', 'Biology Laboratory,CSM', 0, 0, NULL),
(21, 'CSM-OBA', 'OBA', 0, 0, NULL),
(22, '900', 'fadfasd', 0, 12, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `officepersonnel`
--

CREATE TABLE IF NOT EXISTS `officepersonnel` (
  `officePersonnelID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `personnelID` int(10) unsigned NOT NULL,
  `officeID` int(10) unsigned NOT NULL,
  `fromDate` datetime NOT NULL,
  `toDate` datetime NOT NULL,
  `remarks` varchar(255) NOT NULL,
  PRIMARY KEY (`officePersonnelID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24099 ;

--
-- Dumping data for table `officepersonnel`
--

INSERT INTO `officepersonnel` (`officePersonnelID`, `personnelID`, `officeID`, `fromDate`, `toDate`, `remarks`) VALUES
(1, 4, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(2, 68, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(3, 24096, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(4, 24097, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(24098, 24098, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `other_assets_liabilities`
--

CREATE TABLE IF NOT EXISTS `other_assets_liabilities` (
  `other_id` int(10) NOT NULL AUTO_INCREMENT,
  `indx_type` enum('1','2','3') NOT NULL,
  `item_name` varchar(45) NOT NULL,
  `acqn_cost` float(10,2) NOT NULL,
  PRIMARY KEY (`other_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `other_assets_liabilities`
--


-- --------------------------------------------------------

--
-- Table structure for table `other_link`
--

CREATE TABLE IF NOT EXISTS `other_link` (
  `saln_id` int(10) NOT NULL,
  `other_id` int(10) NOT NULL,
  PRIMARY KEY (`saln_id`,`other_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `other_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `personnel`
--

CREATE TABLE IF NOT EXISTS `personnel` (
  `personnelID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employeeNumber` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `middleName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `ext` varchar(10) NOT NULL,
  PRIMARY KEY (`personnelID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24099 ;

--
-- Dumping data for table `personnel`
--

INSERT INTO `personnel` (`personnelID`, `employeeNumber`, `password`, `firstName`, `middleName`, `lastName`, `status`, `ext`) VALUES
(241, '2006-24095', 'koon', 'Koon', 'Agero', 'Agnis', 0, ''),
(1, '73879', 'abad', 'Reynaldo', 'G.', 'Abad', 0, ''),
(4, '372874', 'dhone', 'Ronald', 'G.', 'Barriga', 0, ''),
(68, '329990', 'calag', 'Vicente', 'B.', 'Calag', 0, ''),
(7, '123', '123', 'Teresita', 'V.', 'Lagsub', 0, ''),
(24096, '673678', 'ayson', 'Evelina', '', 'Ayson', 1, ''),
(24097, '7467', 'spmo', 'Socorro Brenda', '', 'Acuna', 1, ''),
(8, '8', '', 'Sharon Jean', 'A.', 'Año', 0, ''),
(10, '10', '', 'Maria Mae', 'C.', 'Aborde', 0, ''),
(11, '11', '', 'Esteban', 'A.', 'Acasio III', 0, ''),
(12, '12', '', 'Joan', 'T.', 'Acaso', 0, ''),
(13, '13', '', 'Joseph', 'E.', 'Acosta', 0, ''),
(14, '14', '', 'Jo-an', 'S.', 'Aguilar', 0, ''),
(15, '15', '', 'Roxanne', '', 'Aguinaldo', 0, ''),
(16, '16', '', 'Roberto', 'P.', 'Alabado', 0, ''),
(17, '17', '', 'Edna', 'P.', 'Amelo', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `personnelinfo`
--

CREATE TABLE IF NOT EXISTS `personnelinfo` (
  `personnelInfoID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `personnelID` int(10) unsigned NOT NULL,
  `birthDate` datetime NOT NULL,
  `birthCity` int(10) unsigned NOT NULL,
  `birthProvince` int(10) unsigned NOT NULL,
  `gender` int(10) unsigned NOT NULL,
  `civilStatus` int(10) unsigned NOT NULL,
  `citizenship` int(10) unsigned NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `bloodType` int(10) unsigned NOT NULL,
  `resHouseNumber` varchar(100) NOT NULL,
  `resStreet` varchar(100) NOT NULL,
  `resCity` int(10) unsigned NOT NULL,
  `resProvince` int(10) unsigned NOT NULL,
  `resZipCode` int(10) unsigned NOT NULL,
  `resTelNo` varchar(45) NOT NULL,
  `permHouseNumber` varchar(100) NOT NULL,
  `permStreet` varchar(100) NOT NULL,
  `permCity` int(10) unsigned NOT NULL,
  `permProvince` int(10) unsigned NOT NULL,
  `permZipCode` int(10) unsigned NOT NULL,
  `permTelNo` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `GSIS` varchar(45) NOT NULL,
  `HDMF` varchar(45) NOT NULL,
  `PHIC` varchar(45) NOT NULL,
  `BP` varchar(45) NOT NULL,
  `SSS` varchar(45) NOT NULL,
  `TIN` varchar(45) NOT NULL,
  PRIMARY KEY (`personnelInfoID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=244 ;

--
-- Dumping data for table `personnelinfo`
--

INSERT INTO `personnelinfo` (`personnelInfoID`, `personnelID`, `birthDate`, `birthCity`, `birthProvince`, `gender`, `civilStatus`, `citizenship`, `height`, `weight`, `bloodType`, `resHouseNumber`, `resStreet`, `resCity`, `resProvince`, `resZipCode`, `resTelNo`, `permHouseNumber`, `permStreet`, `permCity`, `permProvince`, `permZipCode`, `permTelNo`, `email`, `mobile`, `GSIS`, `HDMF`, `PHIC`, `BP`, `SSS`, `TIN`) VALUES
(1, 1, '1947-02-12 00:00:00', 1, 0, 2, 2, 1, 1.78, 74, 1, '39 Chrysanthemum St., Green Meadows Subd., Sto. NiÃƒÂ±o, Davao City', '', 0, 0, 8000, '293-0937 ', '39 Chrysanthemum St., Green Meadows Subd., Sto. NiÃƒÂ±o, Davao City', '', 0, 0, 8000, '293-0937 ', 'rabadup@yahoo.com', '09198301738', '47011200865', 'RGA882765009', '160251020571', '', '0920147386', '108-617-636'),
(2, 2, '1976-02-29 00:00:00', 1, 0, 2, 2, 1, 2.5, 90, 3, '48 Bougainvilla St., Mintal, Davao City', '', 0, 0, 8022, '2895546', '48 Bougainvilla St., Mintal, Davao City', '', 0, 0, 8022, '2895546', 'onsaniel@netscape.net', '09193430973', 'B76CVONS026', '110156467701', '170500966257', '', '0917423783', '926798255'),
(3, 3, '1986-01-13 00:00:00', 0, 0, 1, 1, 1, 125, 50, 7, '', '', 0, 0, 0, '', 'Ph. 4, Blk. 34, Lot 10, Neem St. Green Meadows Subd. Mintal, Davao City			', '', 0, 0, 8000, '', 'arma_cheska@yahoo.com', '09202790067', '', '', '', '', '', ''),
(4, 4, '1976-11-03 00:00:00', 0, 0, 2, 1, 1, 1.47, 72, 3, 'Km. 24, Bunawan, Davao City', '', 0, 0, 8017, '2360155', 'Km. 24, Bunawan, Davao City', '', 0, 0, 8017, '2360155', 'dhone@mozcom.com', '09174111716', '76110300693', '', '160000523000', '', '0918664761', '907-900-412'),
(5, 5, '1951-11-23 00:00:00', 0, 0, 1, 2, 1, 1.5, 61.7, 7, 'Lot 10 Block 5, Wellspring Subd., Phase 3, Catalunan PequeÃƒÂ±o, Davao City', '', 0, 0, 8000, '2931395', 'Lot 10 Block 5, Wellspring Subd., Phase 3, Catalunan PequeÃƒÂ±o, Davao City', '', 0, 0, 8000, '2931395', 'agellson@yahoo.com', '09177046402', '51112301139', '', '190004727995', '', '', '110847953'),
(6, 6, '1952-06-09 00:00:00', 0, 0, 2, 2, 1, 1.68, 70, 5, 'Blk41 Lot12 Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '2931627', 'Blk41 Lot12 Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '2931627', 'agmoran_upm@yahoo.com', '09154611243', '52060900361', '110130815110', '160000426153', '', '', '115-283-862'),
(7, 7, '1981-04-08 00:00:00', 1, 0, 2, 1, 1, 1.73, 61, 4, '25 Opal St., Ecoland Phase 4, Davao City', '', 0, 0, 8000, '2961786', '25 Opal St., Ecoland Phase 4, Davao City', '', 0, 0, 8000, '2961786', 'innocentalbert@yahoo.com', '09205448585', '81040800557', '', '160251975490', '', '0926078860', '936-860-271'),
(8, 8, '1955-11-13 00:00:00', 0, 0, 2, 2, 1, 1.7, 67, 3, 'Blk 7 Lot 34 Edelwiess St., Green Meadows Subd., Sto. NiÃƒÂ±o, Davao City', '', 0, 0, 8000, '2930866', 'Blk 7 Lot 34 Edelwiess St., Green Meadows Subd., Sto. NiÃƒÂ±o, Davao City', '', 0, 0, 8000, '2930866', 'obsiomar@yahoo.com', '09215506187', '55111302145', '', '160000426188', '', '', '115284707'),
(9, 9, '1959-04-03 00:00:00', 0, 0, 2, 2, 1, 1.6, 61.2, 1, 'Lot 143 Santan St. - Million Flowers St., Townsite Subd., Mintal, Davao City', '', 0, 0, 8000, '2931727', 'Lot 143 Santan St. - Million Flowers St., Townsite Subd., Mintal, Davao City', '', 0, 0, 8000, '2931727', 'ten_g97@yahoo.com', '09198768468', '59040302764', '040205937009', '160000170450', '', '0359413393', '115-289-769'),
(10, 10, '2007-11-15 00:00:00', 0, 0, 1, 1, 1, 1, 1, 7, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(11, 11, '1963-08-01 00:00:00', 0, 0, 2, 1, 1, 1.72, 54, 7, 'Blk4 Lot2 Pag-ibig Country Homes, Catalunan PequeÃƒÂ±o, Davao City', '', 0, 0, 8000, '', '955 M.h. Del Pilar St., Sta. Cruz, Palo, Leyte', '', 0, 0, 6200, '', 'aryevedonin@yahoo.com', '09185350402', '63080102242', '070120733311', '', '', '3314414871', '118-034-579'),
(12, 12, '2007-11-15 00:00:00', 0, 0, 1, 1, 1, 1, 1, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(13, 13, '1959-08-19 00:00:00', 0, 0, 1, 2, 1, 1.55, 55, 1, '348 Camella St., Flores Subd., Bangkal, Davao City', '', 0, 0, 8000, '2993286', '348 Camella St., Flores Subd., Bangkal, Davao City', '', 0, 0, 8000, '2993286', 'anovero@yahoo.com', '', '59081902989', '', '160000170086', '', '', '151074158'),
(14, 14, '2007-11-15 00:00:00', 0, 0, 1, 1, 1, 1, 1, 7, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(15, 15, '2007-11-15 00:00:00', 0, 0, 2, 1, 1, 1, 1, 7, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(16, 16, '1965-04-01 00:00:00', 0, 0, 2, 2, 1, 1.65, 58, 1, 'Bago Oshiro, Tugbok District, Davao City', '', 0, 0, 8000, '', '32 San Pedro St., Lagao, General Santos City', '', 0, 0, 9500, '', 'tingnanola@yahoo.com', '09177145632', '', '', '160000169991', '', '', '155716186'),
(17, 17, '1967-08-23 00:00:00', 0, 0, 1, 2, 1, 1, 47.63, 0, 'Blk 8 Lot 12 Phase I, Elenita Heights Subd., Mintal, Davao City', '', 0, 0, 8000, '2931380', 'Blk 8 Lot 12 Phase I, Elenita Heights Subd., Mintal, Davao City', '', 0, 0, 8000, '2931380', 'chetal_11010@yahoo.com', '09198429367', '67082301663', '', '160000510545', '', '', '144379042'),
(18, 18, '1983-06-11 00:00:00', 0, 0, 2, 1, 1, 1.55, 56, 1, 'Felban Drive, Dawis, Digos City', '', 0, 0, 8002, '5534431', 'Felban Drive, Dawis, Digos City', '', 0, 0, 8002, '5534431', 'email_ni_dennis@yahoo.com', '09195620289', '83061100078', '', '160251901918', '', '', '936-275-130'),
(19, 19, '1948-06-01 00:00:00', 0, 0, 1, 1, 1, 1.55, 50, 2, 'Block 28 Lot 7 Elenita Heights Subd., Mintal, Davao City', '', 0, 0, 8022, '2931351', 'Block 28 Lot 7 Elenita Heights Subd., Mintal, Davao City', '', 0, 0, 8022, '2931351', 'dmflores_2000@yahoo.com', '09194457973', '48060102751', '', '160000169231', '', '', '115295147'),
(20, 20, '1950-09-22 00:00:00', 0, 0, 1, 2, 1, 1.575, 54.43, 3, 'Bandera EspaÃƒÂ±a St., Mintal, Tugbok Dist., Davao City', '', 0, 0, 8000, '', 'Bandera EspaÃƒÂ±a St., Mintal, Tugbok Dist., Davao City', '', 0, 0, 8000, '', 'ayson_eve@yahoo.com', '09192055070', '50092202752', '110121425508', '160000171899', '', '0903322631', '122920818'),
(21, 21, '1960-12-09 00:00:00', 0, 0, 2, 1, 1, 1.75, 65, 3, 'Blk40 L24 Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '', 'Blk40 L24 Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '', 'eeprotacio@yahoo.com', '09174345114', '60120901357', '88137591', '160000426226', '', '', '134-793-213'),
(22, 22, '1958-03-14 00:00:00', 0, 0, 1, 2, 1, 1.52, 44, 7, 'Lot 30 Block 5 Cattleya St., Greenhills Subd., Catalunan PequeÃƒÂ±o, Davao City', '', 0, 0, 8000, '2969708', 'Lot 30 Block 5 Cattleya St., Greenhills Subd., Catalunan PequeÃƒÂ±o, Davao City', '', 0, 0, 8000, '2969708', 'evbph@yahoo.com', '09204421332', '58031402059', '', '160000384043', '', '', '138-788-277'),
(23, 23, '1950-02-03 00:00:00', 0, 0, 2, 2, 1, 1.7, 72, 6, 'Brgy. Masay, Bay, Laguna', '', 0, 0, 4033, '', 'Brgy. Masay, Bay, Laguna', '', 0, 0, 4033, '', 'etrasco@mozcom.com', '09202037204', '50020301829', '', '50020301829', '', '', '138549049'),
(24, 24, '2007-11-15 00:00:00', 0, 0, 1, 1, 1, 1, 1, 7, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(25, 25, '1977-02-05 00:00:00', 0, 0, 1, 1, 1, 1.52, 48, 1, '753 Chavez St., Davao City', '', 0, 0, 8000, '', '0213 P. Garcia, Mahayahay, Iligan City', '', 0, 0, 9200, '2238449', 'tziek_24@yahoo.com', '09102036293', '77020500592', '', '190007531110', '', '', '928-512-174'),
(26, 26, '1950-02-27 00:00:00', 0, 0, 1, 2, 1, 1.524, 47.63, 2, '2018 UP Bliss, Diliman, Quezon City', '', 0, 0, 1101, '9280942', '2018 UP Bliss, Diliman, Quezon City', '', 0, 0, 1101, '9280942', '', '', 'B50DTGCR012', '000711153508', '190005207324', '', '', '134667691'),
(27, 27, '1985-03-13 00:00:00', 0, 0, 1, 1, 1, 1, 1, 7, 'Blk 2 Lot 19 Wellspring Village I, Catalunan PequeÃƒÂ±o, Davao City', '', 0, 0, 8000, '', 'Blk 2 Lot 19 Wellspring Village I, Catalunan PequeÃƒÂ±o, Davao City', '', 0, 0, 8000, '', 'ladydoods_85@yahoo.com', '09185546090', '85031300059', '', '160000623730', '', '', '944386929'),
(28, 28, '2007-11-15 00:00:00', 0, 0, 1, 2, 1, 1, 1, 7, '1117 Lopez Heirs Subd., Magapo, Mati, Davao Oriental', '', 0, 0, 8200, '8113021', '1117 Lopez Heirs Subd., Magapo, Mati, Davao Oriental', '', 0, 0, 8200, '8113021', 'genjorolan@yahoo.com', '09206230407', '70011601004', '', '160000384531', '', '', '141-144-690'),
(29, 29, '2007-11-15 00:00:00', 0, 0, 2, 1, 1, 1, 1, 7, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(30, 30, '2007-11-15 00:00:00', 0, 0, 1, 1, 1, 1, 1, 7, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(31, 31, '1984-07-23 00:00:00', 0, 0, 2, 1, 1, 1.737, 49.896, 4, '101 Daisy St., Landmark 3, Sasa, Davao City', '', 0, 0, 8000, '2351202', '101 Daisy St., Landmark 3, Sasa, Davao City', '', 0, 0, 8000, '2351202', 'john_bengan@yahoo.com', '09202930633', '84072300202', '', '160000603705', '', '0625330663', ''),
(32, 32, '1977-03-25 00:00:00', 0, 0, 1, 1, 1, 1.61, 50, 6, 'Block 4 Lot 11, Pag-ibig Country Homes, Catalunan PequeÃƒÂ±o, Davao City', '', 0, 0, 8000, '', '21-20 Streets, Nazareth, Cagayan De Oro City', '', 0, 0, 9000, '', 'jeanclairedy@yahoo.com', '09207795452', '77032501047', '', '160000587459', '', '3375056443', '217-891-6252'),
(33, 33, '1974-04-04 00:00:00', 0, 0, 2, 2, 1, 1.68, 70, 7, 'Ph1, B46 L1, Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '', '1039 Catadman, Sabang, Danao City, Cebu', '', 0, 0, 6004, '2006156', 'irmalaque@yahoo.com', '09212161886', '74040401109', '110155549504', '120502424497', '', '0614410536', '200-181-926'),
(34, 34, '1960-06-27 00:00:00', 0, 0, 2, 2, 1, 1, 1, 7, '116 Narra Rd., Poly Subd, Mstina, Davao City', '', 0, 0, 8000, '', '116 Narra Rd., Poly Subd, Mstina, Davao City', '', 0, 0, 8000, '', '', '', '60062702381', '', '160000549360', '', '', '902180086'),
(35, 35, '1971-06-06 00:00:00', 0, 0, 2, 1, 1, 1.654, 75, 1, '11-3 Padre Gomez St., Davao City', '', 0, 0, 8000, '2931052', '11-3 Padre Gomez St., Davao City', '', 0, 0, 8000, '2931052', 'signpen_jc2@yahoo.com', '09177044615', '71061501856', '', '160000616106', '', '0919658190', '186-744-743'),
(36, 36, '1965-04-11 00:00:00', 0, 0, 2, 2, 1, 1.63, 65, 3, 'Lower Rapnaga, Bago Aplaya, Talomo Dist., Davao City', '', 0, 0, 8000, '2895139', 'Lower Rapnaga, Bago Aplaya, Talomo Dist., Davao City', '', 0, 0, 8000, '2895139', 'stbastian2003@yahoo.com', '09286033409', '65041100189', '110130815502', '160000172011', '', '', '138907615'),
(37, 37, '1967-04-25 00:00:00', 0, 0, 1, 2, 1, 1.575, 50, 7, 'L16 B8 Roha Subd., Toril, Davao City', '', 0, 0, 8000, '2910065', 'L16 B8 Roha Subd., Toril, Davao City', '', 0, 0, 8000, '2910065', 'jeanmariejuanga@yahoo.com', '09109182298', '67042501643', '', '130000030628', '', '', '154-224-783'),
(38, 38, '2007-11-16 00:00:00', 0, 0, 1, 1, 1, 1, 1, 7, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(39, 39, '1979-05-03 00:00:00', 0, 0, 2, 1, 1, 1.625, 60, 7, 'Parungad Residence, Evergreen St., Brgy. Sto. NiÃƒÂ±o, Davao City', '', 0, 0, 8000, '2934273', 'Libertad, Tungawan, Zamboanga Sibugay', '', 0, 0, 7018, '', 'jobelida@yahoo.com', '09186558440', '79050300477', '', '180000367417', '', '', '915846205'),
(40, 40, '1978-06-18 00:00:00', 0, 0, 1, 2, 1, 1, 1, 7, 'Wainright St., Mlang, Cotabato', '', 0, 0, 9402, '', 'Wainright St., Mlang, Cotabato', '', 0, 0, 9402, '', 'j_pena@eudoramail.com', '09194195582', '78061800165', '011600198', '160000587467', '', '', '917637717'),
(41, 41, '1966-10-21 00:00:00', 0, 0, 2, 2, 1, 1.5, 65, 8, 'Blk28 L29 Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '', 'Blk28 L29 Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '', 'kibz1432@yahoo.com', '09193051328', '66102101830', '110121435602', '160000170302', '', '', '138-428-957'),
(42, 42, '1983-06-21 00:00:00', 0, 0, 2, 1, 1, 1.7, 59, 7, '#79 Mcarthur Highway, Matina, Davao City', '', 0, 0, 8000, '', '#79 Mcarthur Highway, Matina, Davao City', '', 0, 0, 8000, '', 'javaxie@yahoo.com', '09198825149', '83062100144', '', '160000612380', '', '', ''),
(43, 43, '1970-09-16 00:00:00', 0, 0, 1, 2, 1, 1.575, 64, 7, 'L1 B3 Hacienda Grande Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '2980631', 'L1 B3 Hacienda Grande Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '2980631', '', '09177055186', '70091601280', '110121427905', '160000425831', '', '', '163-202-108'),
(44, 44, '1975-04-04 00:00:00', 0, 0, 1, 2, 1, 1.52, 50, 8, 'Mission Apt D, Purok 9, Brgy. Mintal, Tugbok Dist., Davao City', '', 0, 0, 8000, '', 'Brgy. Pinagsanjan, Pagsanjan, Laguna', '', 0, 0, 4008, '5008430', 'veacn@yahoo.com', '09219902460', '75040400133', '110149521911', '190007882142', '', '', '202680285000'),
(45, 45, '1976-04-23 00:00:00', 0, 0, 1, 1, 1, 1.5, 55, 8, 'B35 L86 Phase I, Pears St., Ciudad De Esperanza Subd., Buhangin, Davao City', '', 0, 0, 8000, '', 'Poblacion, Pres. Roxas, Cotabato', '', 0, 0, 9407, '', 'gayrubas@yahoo.com', '09176239562', '76042300337', '110130828511', '160000170418', '', '', '919923336'),
(46, 46, '2007-11-16 00:00:00', 0, 0, 1, 1, 1, 1, 1, 7, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(47, 47, '1964-09-27 00:00:00', 1, 0, 2, 2, 1, 1.67, 72, 3, '134 Daffodil St., Alpha Homes, Matina, Davao City', '', 0, 0, 8000, '2972433', '134 Daffodil St., Alpha Homes, Matina, Davao City', '', 0, 0, 8000, '2972433', 'larryd927@yahoo.com', '', '64092702314', '', '160000572885', '', '', '123993097'),
(48, 48, '1976-08-26 00:00:00', 0, 0, 1, 1, 1, 1.58, 46.82, 8, '2nd Floor, Elaine K Building, Puan Crossing, Talomo Dist., Davao City	', '', 0, 0, 8000, '', '2nd Floor, Elaine K Building, Puan Crossing, Talomo Dist., Davao City', '', 0, 0, 9200, '2219661', 'ligaya_rose@yahoo.com', '09206049015', '76082600996', '', '160501238314', '', '0923880475', '931-715-164'),
(49, 49, '2007-04-18 00:00:00', 0, 0, 1, 1, 1, 1.54, 76, 3, '273 R.v. Fulache St., Hilongos, Leyte	', '', 0, 0, 0, '', '273 R.v. Fulache St., Hilongos, Leyte	', '', 0, 0, 6524, '', 'sexynaughtymetch@yahoo.com', '09193816256', '80041800619', '', '160000612356', '', '', '930-225-668'),
(50, 50, '1985-11-15 00:00:00', 1, 0, 1, 1, 1, 1.71, 58, 4, 'White House, Daliao, Toril, Davao City', '', 0, 0, 8000, '', 'White House, Daliao, Toril, Davao City', '', 0, 0, 8000, '', 'marie_vernaiz@yahoo.com', '09216195266', '85111500059', '', '160502520366', '', '0928967391', '945-598-958'),
(51, 51, '1954-12-06 00:00:00', 0, 0, 1, 2, 1, 1.63, 55, 7, '42-k CariÃƒÂ±osa St., Lanzona Village, Matina, Davao City', '', 0, 0, 8021, '2983882', 'Unit 12 Masaya Townhouses, Masaya St., Up Village, Diliman, Quezon City	', '', 0, 0, 1101, '9225669', 'madderlee@yahoo.com', '09165467837', '54120602279', '000711068701', '160000169738', '', '', '110-828-898'),
(52, 52, '1953-03-16 00:00:00', 0, 0, 2, 2, 1, 1.8, 75, 7, '001 Sierra Madre Central Park Subd., Bangkal, Davao City', '', 0, 0, 8000, '', '001 Sierra Madre Central Park Subd., Bangkal, Davao City', '', 0, 0, 8000, '', 'mdsoledad@gmail.com', '09209031448', '53031603079', '', '160240661042', '', '0332739133', '105307678'),
(53, 53, '2007-11-16 00:00:00', 0, 0, 1, 1, 1, 1, 1, 7, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(54, 54, '1985-10-16 00:00:00', 0, 0, 1, 1, 1, 1.53, 36, 7, 'Eastern, Wao, Lanao Del Sur', '', 0, 0, 9716, '', 'Eastern, Wao, Lanao Del Sur', '', 0, 0, 9716, '', 'gicamarie@yahoo.com', '09214583310', '85101600063', '', '160000612364', '', '', ''),
(55, 55, '1983-01-30 00:00:00', 0, 0, 2, 1, 1, 1.74, 73, 7, 'San Francisco St., Mintal, Davao City', '', 0, 0, 8000, '', 'Lumbo, Valencia, Bukidnon', '', 0, 0, 8709, '', 'mrtoleco_phd@yahoo.com', '09213248299', '83013000142', '', '160000572257', '', '', '936278045'),
(56, 56, '1958-12-07 00:00:00', 0, 0, 2, 2, 1, 1.68, 70, 7, 'Bangoy Compound, Saavedra St., Toril, Davao City', '', 0, 0, 8000, '2910422', 'Bangoy Compound, Saavedra St., Toril, Davao City', '', 0, 0, 8000, '2910422', 'nilooponda@yahoo.com', '', '58120702198', '110102676701', '160000170175', '', '0908401756', '160122838'),
(57, 57, '1977-01-20 00:00:00', 1, 0, 1, 1, 1, 1.4, 50, 3, '122 Mirador Rd., Cnetral Park Subd., Bangkal, Davao City', '', 0, 0, 8000, '2971454', '122 Mirador Rd., Cnetral Park Subd., Bangkal, Davao City', '', 0, 0, 8000, '2971454', 'nors_21@yahoo.com', '09193673724', '77012000866', '', '160000474867', '', '', '923395559'),
(58, 58, '1983-08-09 00:00:00', 1, 0, 2, 1, 1, 1.626, 55, 7, 'Purok 13 Brgy. Bato, Toril, Davao City', '', 0, 0, 8020, '', 'Purok 13 Brgy. Bato, Toril, Davao City', '', 0, 0, 8020, '', 'lenoir_alfie@yahoo.com', '09104578847', '83080900298', '', '160000612410', '', '0926821538', '943056583'),
(59, 59, '2007-11-16 00:00:00', 0, 0, 2, 1, 1, 1, 1, 7, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(60, 60, '1979-04-16 00:00:00', 1, 0, 1, 1, 1, 1.625, 49.09, 7, 'Lot21 Blk1 Daffodil St., Green Meadows Subd., Mintal, Davao City', '', 0, 0, 8000, '2930823', 'Lot21 Blk1 Daffodil St., Green Meadows Subd., Mintal, Davao City', '', 0, 0, 8000, '2930823', 'rein.kath.79@gmail.com', '09185124496', '79011600889', '', '160501606224', '', '0922221103', '924-832-351'),
(61, 61, '1979-10-18 00:00:00', 1, 0, 1, 1, 1, 1.55, 43, 1, '72 Emilio Jacinto St., Davao City', '', 0, 0, 8000, '2258145', '72 Emilio Jacinto St., Davao City', '', 0, 0, 8000, '2258145', 'ariane43981@yahoo.com', '09193385560', '79101800151', '110143615705', '', '', '', '923728658'),
(62, 62, '1970-11-10 00:00:00', 0, 0, 2, 1, 1, 1.7, 61.7, 1, 'Coral St., Marfori Heights Subd., Davao City', '', 0, 0, 8000, '2262374', 'Coral St., Marfori Heights Subd., Davao City', '', 0, 0, 8000, '2262374', 'rpalabado@hotmail.com', '09178170229', '70111000407', '', '160000649071', '', '', ' 178-692-311'),
(63, 63, '1974-06-01 00:00:00', 0, 0, 1, 2, 1, 1.55, 46.27, 3, 'Block 39 Lot 21 Phase I, Eleneta Heights Subd., Mintal, Davao City', '', 0, 0, 8000, '2930295', 'Block 39 Lot 21 Phase I, Eleneta Heights Subd., Mintal, Davao City', '', 0, 0, 8000, '2930295', 'rowee_s@lycos.com', '09189288630', '74060100687', '', '160000170981', '', '', '178-910-279'),
(64, 64, '1958-08-18 00:00:00', 0, 0, 1, 1, 1, 1.25, 64, 0, 'B5 L38 Lilac St., Green Meadows Subd., Mintal, Davao City', '', 0, 0, 8000, '2930886', 'B5 L38 Lilac St., Green Meadows Subd., Mintal, Davao City', '', 0, 0, 8000, '2930886', 'ruthupmin@yahoo.com', '09279336587', '58081802228', '', '160000490226', '', '', '190007367'),
(65, 65, '1957-02-17 00:00:00', 0, 0, 1, 2, 1, 1.4, 62, 2, '43 Almond Drive, Ecoland 7, Davao City', '', 0, 0, 8021, '2977150', '43 Almond Drive, Ecoland 7, Davao City', '', 0, 0, 8021, '2977150', 'sbconcepcion@yahoo.com', '09189196927', '57021700462', '', '', '', '', '110937312'),
(66, 66, '1977-04-03 00:00:00', 0, 0, 1, 1, 1, 1.48, 52, 8, '783jarida Rd., Tulip Drive, Matina, Davao City', '', 0, 0, 8000, '2992115', '783jarida Rd., Tulip Drive, Matina, Davao City', '', 0, 0, 8000, '2992115', 'sbulaong@upmin.edu.ph', '09177028110', '77040300646', '', '190007531129', '', '', '928-102-830'),
(67, 67, '2007-11-16 00:00:00', 0, 0, 1, 1, 1, 1, 1, 7, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(68, 68, '1966-04-05 00:00:00', 0, 0, 2, 2, 1, 1.65, 65, 7, 'Lot 5 Blk 27 Phase 1 Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '2931135', 'Lot 5 Blk 27 Phase 1 Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '2931135', 'viccalag@yahoo.com', '09266833452', '66040501755', '', '160000172658', '', '', '144-507-871'),
(69, 69, '1978-04-06 00:00:00', 1, 0, 1, 2, 1, 1.55, 48, 1, 'P1 Santolan, Mintal, Davao City', '', 0, 0, 8022, '', 'P1 Santolan, Mintal, Davao City', '', 0, 0, 8022, '', 'vcastle_99@yahoo.com', '09169826500', '78040600204', '110149520609', '120501292325', '', '0919764301', '198540918'),
(70, 70, '1960-05-21 00:00:00', 0, 0, 1, 2, 1, 1, 1, 0, 'Blk 7 Lot 34 Edelwiess St., Green Meadows Subd., Sto. NiÃƒÂ±o, Davao City', '', 0, 0, 8000, '2930866', 'Blk 7 Lot 34 Edelwiess St., Green Meadows Subd., Sto. NiÃƒÂ±o, Davao City', '', 0, 0, 8000, '2930866', 'jeantonic@yahoo.com', '', '60052101924', '', '160000426218', '', '', '115284715'),
(71, 71, '1970-05-06 00:00:00', 0, 0, 1, 2, 1, 1.55, 65, 1, 'B3 L24 Uvhsa Village, Ulas, Davao City, Philippines', '', 0, 0, 8000, '', 'B3 L24 Uvhsa Village, Ulas, Davao City', '', 0, 0, 8000, '', 'mariamaec@yahoo.com', '', '70060601958', '', '190007882037', '', '0916993971', '926982846'),
(72, 72, '1964-02-02 00:00:00', 0, 0, 1, 1, 1, 1.62, 65, 7, '307 Jupiter Street, Victoria Heights Subd., Lanang, Davao City', '', 0, 0, 8000, '', '307 Jupiter Street, Victoria Heights Subd., Lanang, Davao City', '', 0, 0, 8000, '', 'bsocorro@upmin.edu.ph', '09275607816', '64021902266', '', '160000171554', '', '', '178133234'),
(73, 73, '1975-01-24 00:00:00', 0, 0, 1, 1, 1, 1.5, 50, 7, 'B16 L5 Pag-ibig Subd., Catalunan PequeÃƒÂ±o, Davao City', '', 0, 0, 8000, '', 'Upper Bulanan, Midsayap, North Cotabato		', '', 0, 0, 9410, '', 'neleh_peace@yahoo.com', '09192499355', '75012401175', '190892959130', '190892959130', '', '0918021715', '913001494'),
(74, 74, '1966-01-26 00:00:00', 0, 0, 1, 2, 1, 1.524, 49, 2, 'Blk 14 Lot 24 Rosalina 3 Village, Dumoy, Davao City', '', 0, 0, 8000, '2918633', 'Blk 14 Lot 24 Rosalina 3 Village, Dumoy, Davao City', '', 0, 0, 8000, '2918633', 'edna_amelo@yahoo.com', '09168452245', '66012602074', '100101511804', '160000171732', '', '0911711803', '105024996'),
(75, 75, '1972-02-02 00:00:00', 0, 0, 1, 2, 1, 1.5, 52, 7, 'Blk 26 Lot 26 Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '', 'Blk 26 Lot 26 Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '', 'mfjorgio@yahoo.com', '09274420742', '72022201159', '110133128702', '160000464624', '', '', '181725393'),
(76, 76, '1972-05-02 00:00:00', 0, 0, 1, 1, 1, 1.55, 42, 1, 'Blk 36 Lot 27 Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8022, '', 'Blk 36 Lot 27 Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8022, '', 'shabem_72@yahoo.com', '09194727399', '72050200931', '110121425007', '160000171775', '', '0915146952', '166092476'),
(77, 77, '2008-04-09 00:00:00', 0, 0, 1, 2, 1, 1.4986, 43, 0, 'Blk 23 Lot 8a Phase 4b, El Rio Vista, Bacaca, Bajada, Davao City', '', 0, 0, 8000, '2414365', 'Blk 23 Lot 8a Phase 4b, El Rio Vista, Bacaca, Bajada, Davao City', '', 0, 0, 8000, '2414365', 'flow_fernandez@yahoo.com', '09174808893', '73062000683', '110109940206', '160000426145', '', '0915651117', '189761636'),
(78, 78, '1965-02-19 00:00:00', 0, 0, 2, 2, 1, 1.6764, 75, 1, 'Blk 28 Lot 3 Elenita Heights Subd., Catalunan Grande, Davao City	', '', 0, 0, 8000, '', 'Blk 28 Lot 3 Elenita Heights Subd., Catalunan Grande, Davao City	', '', 0, 0, 8000, '', '', '09192281486', '65021901789', '110121425410', '160000171821', '', '0910144195', '190007367'),
(79, 79, '1961-09-12 00:00:00', 1, 0, 1, 2, 1, 1.59, 58, 7, '1 Dolphin St., Seaside Subd., Matina Aplaya, Davao City', '', 0, 0, 8000, '2994709', '1 Dolphin St., Seaside Subd., Matina Aplaya, Davao City', '', 0, 0, 8000, '2994709', 'yda_b2000@yahoo.com', '09174036817', '61091200936', '', '160000172445', '', '', '111208572'),
(80, 80, '1973-05-16 00:00:00', 1, 0, 1, 1, 1, 1.73, 49.5, 7, 'B3 L2 Green St., Dacoville Subd., Dumoy, Davao City', '', 0, 0, 8023, '2814275', 'B3 L2 Green St., Dacoville Subd., Dumoy, Davao City', '', 0, 0, 8023, '2814275', 'lai_ph73@yahoo.com', '09163479817', 'B73KGHLB019', '', '160000172461', '', '', '178907633'),
(81, 81, '1972-07-03 00:00:00', 1, 0, 1, 2, 1, 1.58, 63, 6, '207 Rubia St., Mintal, Davao City', '', 0, 0, 8000, '2930409', '207 Rubia St., Mintal, Davao City', '', 0, 0, 8000, '2930409', 'chinggay_b@yahoo.com', '09177051006', 'B72P3CDB014', '110121426701', '160000170002', '', '', '154613954'),
(82, 82, '1971-01-04 00:00:00', 0, 0, 1, 2, 1, 1.58, 54, 3, 'B23 L8 Gulfview Executive Homes, Bago Aplaya, Talomo, Davao City', '', 0, 0, 8023, '2930310', 'B23 L8 Gulfview Executive Homes, Bago Aplaya, Talomo, Davao City', '', 0, 0, 8023, '2930310', 'maruth_b2000@yahoo.com', '09164655331', 'B71B4EBC015', '000803795901', '160000172186', '', '0913054198', '129525113'),
(83, 83, '1959-08-21 00:00:00', 1, 0, 1, 2, 1, 1.5, 52, 3, '33 Angliongto Ave., Diamond Village Subd., Lanang, Davao City', '', 0, 0, 8000, '', '33 Angliongto Ave., Diamond Village Subd., Lanang, Davao City', '', 0, 0, 8000, '09209049565', 'bambicabrera_ph@yahoo.com', '', 'B59RMCDC105', '110121426810', '160000172534', '', '0906771200', '171442084'),
(84, 84, '1962-06-05 00:00:00', 0, 0, 1, 2, 1, 1.58, 61.82, 1, '225 Diamond Village, Pampanga Executive Homes, Bo. Pampanga, Davao City', '', 0, 0, 8000, '2330772', '225 Diamond Village, Pampanga Executive Homes, Bo. Pampanga, Davao City', '', 0, 0, 8000, '2330772', 'zcalatrava@yahoo.com', '09162135092', 'B62M5ZGC028', '110121427110', '160000172682', '', '0908929717', '124015248'),
(85, 85, '2008-12-14 00:00:00', 0, 0, 1, 1, 1, 1.524, 52, 0, 'Sitio Basak, Mintal, Davao City', '', 0, 0, 8000, '', 'Sitio Basak, Mintal, Davao City', '', 0, 0, 8000, '', 'grace_catabas@yahoo.com', '09108274560', '73121401603', '', '160250137130', '', '0918677211', '156074651'),
(86, 86, '1970-09-17 00:00:00', 0, 0, 1, 2, 1, 1.7526, 85, 7, 'Bangkas Heights, Toril, Davao City', '', 0, 0, 8000, '2930016', 'Bangkas Heights, Toril, Davao City', '', 0, 0, 8000, '2930016', '', '09193732802', '70091701349', '11121427807', '160000425793', '', '', '12200841'),
(87, 87, '1969-01-31 00:00:00', 0, 0, 2, 2, 1, 1.55, 50, 7, 'Purok 117, Bago Oshiro, Tugbok District, Davao City', '', 0, 0, 8000, '', 'Purok 117, Bago Oshiro, Tugbok District, Davao City', '', 0, 0, 8000, '', 'po652000@yahoo.com', '09168542834', '74060100687', '110121429202', '160000425963', '', '', '902008171'),
(88, 88, '1971-01-11 00:00:00', 0, 0, 1, 1, 1, 1.486, 47, 1, 'DoÃƒÂ±a Aurora St., Mintal, Davao City', '', 0, 0, 800, '', 'Luinab, Iligan City', '', 0, 0, 9200, '2237557', 'enaj_sd@yahoo.com', '09203359650', '71011101156', '110108313811', '160000425998', '', '0914171122', '147509723'),
(89, 89, '1972-02-09 00:00:00', 1, 0, 1, 2, 1, 1.54, 43, 8, '05 Jade St., Diamond Village Phase Ii, Lanang, Davao City', '', 0, 0, 8000, '2324384', '05 Jade St., Diamond Village Phase Ii, Lanang, Davao City', '', 0, 0, 8000, '2324384', 'de_annie@yahoo.com', '09076761193', '72020900955', '110136172802', '160000426048', '', '', '189789701'),
(90, 90, '1964-03-10 00:00:00', 0, 0, 1, 2, 1, 1.6, 56.7, 7, '112-a Narra St., Poly Subd., Matina, Davao City', '', 0, 0, 8000, '2974906', '112-a Narra St., Poly Subd., Matina, Davao City', '', 0, 0, 800, '2974906', 'trelce19@yahoo.com', '09177170310', '64031002069', '', '160000464667', '', '', '119414410'),
(91, 91, '1967-07-30 00:00:00', 1, 0, 1, 2, 1, 1.55, 55, 7, 'Purok 31 New Washington Village, Ma-a, Davao City', '', 0, 0, 8000, '2441834', 'Purok 31 New Washington Village, Ma-a, Davao City', '', 0, 0, 8000, '2441834', 'anniebaby07@yahoo.com', '09206096228', '80123121809', '', '190896908859', '', '0922708150', '925361629'),
(92, 92, '1975-01-01 00:00:00', 0, 0, 2, 2, 1, 1.73, 63, 4, 'L5 B17 Elenita Heights Subd., Davao City', '', 0, 0, 8000, '', 'L5 B17 Elenita Heights Subd., Davao City', '', 0, 0, 8000, '', 'c_estocado@yahoo.com', '09193707105', '75010149444', '110154493110', '190517020382', '', '3352197448', '809268699'),
(93, 93, '1975-12-05 00:00:00', 0, 0, 1, 2, 1, 1.53, 50, 3, 'Paul St., B17 L5 P1 Elenita Heights Subd., Mintal, Davao City', '', 0, 0, 8022, '', 'Paul St., B17 L5 P1 Elenita Heights Subd., Mintal, Davao City', '', 0, 0, 8022, '', 'tietay@yahoo.com', '09208582286', '75120500643', '', '160000171708', '', '', '199905703'),
(94, 94, '1961-09-01 00:00:00', 1, 0, 2, 2, 1, 1.7, 170, 2, '20 Almond Drive, Ecoland 7, Matina, Davao City', '', 0, 0, 8000, '2977501', '20 Almond Drive, Ecoland 7, Matina, Davao City', '', 0, 0, 8000, '2977501', 'rene_estremera@yahoo.com', '09196162664', '61090103465', '', '070000361028', '', '0912248390', '154764851'),
(95, 95, '1966-08-09 00:00:00', 1, 0, 2, 2, 1, 1.524, 49.9, 6, '600 Carnation St., Buhangin, Davao City', '', 0, 0, 8000, '', '600 Carnation St., Buhangin, Davao City', '', 0, 0, 8000, '', '', '09193661864', '66081901580', '110121430410', '160000169193', '', '', '127771560'),
(96, 96, '2008-07-07 00:00:00', 0, 0, 2, 2, 1, 1.67, 72, 1, 'Dumalag 1, Matina Aplaya, Davao City', '', 0, 0, 8000, '', 'Dumalag 1, Matina Aplaya, Davao City', '', 0, 0, 8000, '', 'flautagil@yahoo.com', '09274737460', '68070701603', '110121430508', '160000507080', '', '', '902008202'),
(97, 97, '1970-10-19 00:00:00', 1, 0, 1, 1, 1, 1.55, 48, 7, '6-6th Avenue Lizada Ext., Davao City', '', 0, 0, 8000, '2277130', '6-6th Avenue Lizada Ext., Davao City', '', 0, 0, 8000, '2277130', 'lee_zah@yahoo.com', '09274276740', '70101901333', '', '160000169290', '', '0913908516', '164845804'),
(98, 98, '1979-12-11 00:00:00', 0, 0, 1, 2, 1, 1.575, 59, 0, 'Door A 6th-b St., Corner 3rd St., Ecoland Phase I, Davao City', '', 0, 0, 8000, '2930402', 'Door A 6th-b St., Corner 3rd St., Ecoland Phase I, Davao City', '', 0, 0, 8000, '2930402', '', '', '79121400575', '', '160501345463', '', '0919524428', '932883805'),
(99, 99, '1968-05-06 00:00:00', 0, 0, 2, 2, 1, 1.994, 84, 7, 'Up Mindanao, Bago Oshiro, Tugbok District, Davao City', '', 0, 0, 8000, '2930016', 'Zone 2 Barrio Hall Patag, Cagayan De Oro City', '', 0, 0, 9000, '', 'dgo@upmin.edu.ph', '09182449734', '68050601718', '110147654211', '160000501570', '', '0809199691', '196364402'),
(100, 100, '1974-07-03 00:00:00', 1, 0, 1, 2, 1, 1.524, 48, 7, 'Upper Ilang, Davao City', '', 0, 0, 8000, '', 'Upper Ilang, Davao City', '', 0, 0, 8000, '', 'enelra_210@yahoo.com', '', '74070300986', '', '160000546329', '', '0916653994', '917375208'),
(101, 101, '1969-05-08 00:00:00', 0, 0, 1, 2, 1, 1.55, 48, 6, 'Blk 31 Lot 30 Peter St., Emily Homes, Cabantian, Buhangin, Davao City', '', 0, 0, 8000, '', 'San Isidro, Kidapawan City', '', 0, 0, 9400, '', 'bhengskie589@yahoo.com', '09195815044', '80123121817', '', '160500697234', '', '0915678514', '171588751'),
(102, 102, '1956-09-06 00:00:00', 1, 0, 1, 3, 1, 1.6278, 45.45, 1, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '56090603243', '110121432208', '160000169681', '', '0904167395', '108707154'),
(103, 103, '1971-12-17 00:00:00', 1, 0, 2, 2, 1, 1.6, 65, 3, 'Purok #4 Maguey St., Sitio Basak, Mintal, Davao City', '', 0, 0, 8000, '', '214 Solar St., Gsis Heights, Matina, Davao City', '', 0, 0, 8000, '', 'mcsaoopu@yahoo.com', '09274346355', '71121701183', '110121432611', '160000169770', '', '', '902008210'),
(104, 104, '1981-04-11 00:00:00', 1, 0, 1, 1, 1, 1.524, 50, 6, 'Blk 26 Lot 20 Nha Buhangin, Davao City', '', 0, 0, 8000, '', 'Blk 26 Lot 20 Nha Buhangin, Davao City', '', 0, 0, 8000, '', 'ives0411@yahoo.com', '09193618939', '', '', '', '', '0924061387', '932919672'),
(105, 105, '1975-01-06 00:00:00', 0, 0, 1, 2, 1, 1.42, 40, 3, '#2645 Estrada 2nd St., Digos City', '', 0, 0, 8002, '', '#2645 Estrada 2nd St., Digos City', '', 0, 0, 8002, '', '', '09282461487', '75010601304', '', '160500766651', '', '0919702156', '193072403'),
(106, 106, '1960-09-20 00:00:00', 0, 0, 1, 2, 1, 1.55, 75, 7, '#52 Kasilak, Bucana, Davao City', '', 0, 0, 8000, '2235167', '#52 Kasilak, Bucana, Davao City', '', 0, 0, 8000, '2235167', 'swannie2002@yahoo.com', '09177042199', 'B60TLSPM018', '', '190898512316', '', '0912894401', '185689742'),
(107, 107, '1967-08-18 00:00:00', 0, 0, 2, 2, 1, 1.7, 62, 7, 'Blk 21 Lot 8 Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '', 'Blk 21 Lot 8 Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '', '', '09205123345', 'CM4607767', '110108065506', '160000169908', '', '0913579615', '179363573'),
(108, 108, '1949-02-22 00:00:00', 0, 0, 2, 2, 1, 1.55, 67, 3, '5 Bougainvilla Street, Panorama Homes Subd., Buhangin, Davao City', '', 0, 0, 8000, '2418710', '5 Bougainvilla Street, Panorama Homes Subd., Buhangin, Davao City', '', 0, 0, 8000, '2418710', 'ben_morelos@yahoo.com', '09197658195', 'B49CLBCM016', '110121433804', '160000169959', '', '0908043279', '141875748'),
(109, 109, '1952-02-22 00:00:00', 0, 0, 1, 2, 1, 1.55, 64, 1, '5 Bougainvilla Street, Panorama Homes Subd., Buhnagin, Davao City', '', 0, 0, 8000, '2418710', '5 Bougainvilla Street, Panorama Homes Subd., Buhnagin, Davao City', '', 0, 0, 8000, '2418710', 'vicky_2911@yahoo.com', '09187747080', 'B52DNLBM011', '110121433902', '160000169975', '', '0903386960', '125868927'),
(110, 110, '1978-11-18 00:00:00', 0, 0, 1, 2, 1, 1.52, 52, 1, 'Block 34 Lot 5 Phase Ii, Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '', 'Block 34 Lot 5 Phase Ii, Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '', 'marnelli78@yahoo.com', '', 'B8OZXMDDO28', '', '170500362394', '', '0920326408', '932888229'),
(111, 111, '1982-08-15 00:00:00', 0, 0, 2, 1, 1, 1.7, 55, 7, 'Lanang Executive Homes, Lanang, Davao City	', '', 0, 0, 8000, '', 'Pri Compound, Tabon, Bislig City', '', 0, 0, 8311, '8533250', 'bob_addbot@yahoo.com', '09195978027', '82081500386', '', '160000312399', '', '0920637388', ''),
(112, 112, '1964-12-08 00:00:00', 1, 0, 2, 2, 1, 1.7, 75, 3, 'Nha Kadayawan Homes Phase Ii, Blk 4 Lot 19, Bangkal, Davao City', '', 0, 0, 8000, '', 'Nha Kadayawan Homes Phase Ii, Blk 4 Lot 19, Bangkal, Davao City', '', 0, 0, 8000, '', 'nuj_a@yahoo.com', '09173459487', '64120802290', '110121434605', '160000170124', '', '0910757906', '136253435'),
(113, 113, '1979-02-26 00:00:00', 0, 0, 1, 2, 1, 1.573, 48, 2, 'Shrine Hills Near Nbc Tower, Matina, Davao City', '', 0, 0, 8000, '', 'Shrine Hills Near Nbc Tower, Matina, Davao City', '', 0, 0, 8000, '', 'che_t23@yahoo.com', '09172514151', '79022600465', '', '160000572893', '', '0922731431', '931731286'),
(114, 114, '1980-02-24 00:00:00', 0, 0, 1, 1, 1, 1.8, 59, 7, '131 Quezon Boulevard, Davao City', '', 0, 0, 8000, '', '573 Holasca St., Barugo, Leyte', '', 0, 0, 6519, '', 'panglimasugala@yahoo.com', '09287638828', '80022400685', '', '160000612402', '', '0621832851', ''),
(115, 115, '1972-04-21 00:00:00', 0, 0, 1, 2, 1, 1.55, 42.27, 7, '#2645 Estrada 2nd St., Digos City, Davao Del Sur', '', 0, 0, 8002, '', '#2645 Estrada 2nd St., Digos City, Davao Del Sur', '', 0, 0, 8002, '', 'annefs@yahoo.com', '09205128013', '72042101177', '11021436904', '160000170248', '', '', '190399635'),
(116, 116, '1977-06-23 00:00:00', 1, 0, 2, 2, 1, 1.68, 60, 1, '7-2 Molave St., Buhangin, Davao City', '', 0, 0, 8000, '', 'Phase 4 Ddf Village, Mandug, Davao City', '', 0, 0, 8000, '', 'clevanperz@yahoo.com', '09106908126', '77062301166', '500000530703NV', '160250900845', '', '', '930181018000'),
(117, 117, '1983-11-11 00:00:00', 0, 0, 1, 1, 1, 1.55, 40, 3, '207 Rubia St., Mintal, Davao City', '', 0, 0, 8000, '2934078', 'P-3 Brgy. Langkilaan, Trento, Agusan Del Sur', '', 0, 0, 8505, '', 'cheronz725@yahoo.com', '09268605832', '83111100147', '', '160000599716', '', '0927485122', '938522577'),
(118, 118, '1970-04-08 00:00:00', 0, 0, 2, 1, 1, 1.7, 57, 7, '469 Palm Drive, Buhangin, Davao City', '', 0, 0, 8000, '2215344', '469 Palm Drive, Buhangin, Davao City', '', 0, 0, 8000, '2215344', 'romel@upmin.edu.ph', '09186526321', '70040801101', '', '160000426234 ', '', '', '905952000'),
(119, 119, '2008-10-13 00:00:00', 0, 0, 2, 2, 1, 1.6, 61, 7, 'Bankas Heights, Toril, Davao City', '', 0, 0, 8000, '', 'Bankas Heights, Toril, Davao City', '', 0, 0, 8000, '', '', '', '63101302514', '110121437411', '160000170728', '', '', '190399635'),
(120, 120, '1981-09-18 00:00:00', 0, 0, 1, 1, 1, 1.55, 54, 1, 'Albite Boarding House, C/o Myrna Albite, Champaca St., Mintal, Davao City', '', 0, 0, 8000, '', 'C/o Adora M. Tesoro, Jupiter St., Orc, Gov. Gutierrez Ave., Cotabato City', '', 0, 0, 9600, '', 'lady_atm22@yahoo.com', '09195709832', '80123121892', '', '160000567792', '', '0923084763', '936275122'),
(121, 121, '1971-04-18 00:00:00', 1, 0, 1, 2, 1, 1.5, 56, 0, 'B33 L9 Neem St., Green Meadows Subd., Brgy. Sto. NiÃƒÂ±o, Tugbok Dist., Davao City', '', 0, 0, 8021, '', 'B33 L9 Neem St., Green Meadows Subd., Brgy. Sto. NiÃƒÂ±o, Tugbok Dist., Davao City	', '', 0, 0, 8021, '', 'korrski_t@yahoo.com', '09173383903', '80123121892', '110139119504', '160000464500', '', '0914677354', '159275302'),
(122, 122, '1971-05-01 00:00:00', 0, 0, 2, 1, 1, 1.6, 50, 3, 'New Loon Tugbok, Davao City', '', 0, 0, 8000, '', 'New Loon Tugbok, Davao City', '', 0, 0, 8000, '', '', '09205024971', '71050101899', '', '160000521601', '', '', '928512213'),
(123, 123, '1976-12-25 00:00:00', 0, 0, 1, 2, 1, 1.55, 55, 1, 'Blk25 Lot16 Rosalina Village, Dumoy, Toril, Davao City', '', 0, 0, 8000, '', 'Blk25 Lot16 Rosalina Village, Dumoy, Toril, Davao City						', '', 0, 0, 8000, '', 'a3_r3_tpu2yahoo.com', '09197977834', '76122501449', '', '160251342609', '', '0922248733', '921137746'),
(124, 124, '1971-03-26 00:00:00', 0, 0, 2, 2, 1, 1.651, 74, 3, 'Christ The King St., Phase Ii, Brgy. Sto. NiÃƒÂ±o, Tugbok Dist., Davao City', '', 0, 0, 8000, '', 'Christ The King St., Phase Ii, Brgy. Sto. NiÃƒÂ±o, Tugbok Dist., Davao City', '', 0, 0, 8000, '', '', '', '71032601001', '', '160000170922', '', '', '190399650'),
(125, 125, '1975-02-25 00:00:00', 0, 0, 2, 1, 1, 1.7, 75, 2, 'B6 L7 Ph 1 Elenita Heights Subd., Catalunan Grande, Davao City	', '', 0, 0, 8000, '', 'B6 L7 Ph 1 Elenita Heights Subd., Catalunan Grande, Davao City	', '', 0, 0, 8000, '', 'allan_v75@yahoo.com', '09208520021', '75022500741', '070141840302', '160000470314', '', '', '197988620'),
(126, 126, '1973-01-21 00:00:00', 1, 0, 1, 1, 1, 1.55, 50, 3, '12 Apollo St., Gsis Matina, Davao City', '', 0, 0, 8000, '', '12 Apollo St., Gsis Matina, Davao City', '', 0, 0, 8000, '', 'ytty_v@yahoo.com', '09179270367', '7312100946', '110110414310', '160000170965', '', '0915352607', '182764669'),
(127, 127, '1983-05-13 00:00:00', 0, 0, 1, 2, 1, 0, 0, 6, 'Ph 2 Lot12 Blk44 Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '', 'Ph 2 Lot12 Blk44 Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '', 'jatacaso@yahoo.com', '09265305632', '', '', '', '', '', '305-385-276'),
(128, 128, '1968-04-26 00:00:00', 0, 0, 1, 2, 1, 1.52, 60, 1, 'Brgy. 8-a, Madapo, Davao City', '', 0, 0, 8000, '', 'Brgy. 8-a, Madapo, Davao City', '', 0, 0, 8000, '', 'pacz68@yahoo.com', '', '68042601539', '110121427611', '160000425823', '', '09133023022', '131355146'),
(129, 129, '2008-10-09 00:00:00', 1, 0, 1, 2, 1, 1.575, 50, 6, 'Blk6 Lot 8 Central Plain Village, Tres De Mayo, Digos City', '', 0, 0, 8002, '', 'Blk6 Lot 8 Central Plain Village, Tres De Mayo, Digos City', '', 0, 0, 8002, '', 'mpppflores@yahoo.com', '09167612882', '70100901968', '110105174605', '160500161040', '', '0915095184', '162082228'),
(130, 130, '1968-02-28 00:00:00', 1, 0, 2, 2, 1, 1.57, 64, 1, 'Lot17 Blk4 Ph3 Quartz St., Kadayawan Homes, Bangkal, Davao City', '', 0, 0, 8000, '2978827', 'Lot17 Blk4 Ph3 Quartz St., Kadayawan Homes, Bangkal, Davao City', '', 0, 0, 8000, '2978827', 'abegarciajr@yahoo.com', '09184455431', '68022801833', '110121431004', '160000169339', '', '0913076642', '131635367'),
(131, 131, '1975-04-22 00:00:00', 0, 0, 2, 1, 1, 1.6, 51, 7, 'Maguey St., Mintal, Davao City', '', 0, 0, 8000, '', '451 Sandylane, Marasbaras, Tacloban City', '', 0, 0, 6500, '', 'michael_gatela@yahoo.com', '09196398805', '75042200646', '110145063611', '160000490234', '', '', '924342816'),
(132, 132, '1977-08-29 00:00:00', 0, 0, 2, 1, 1, 1.67, 65, 7, '', '', 0, 0, 0, '', '2959 Domingo Village Tagum City', '', 0, 0, 8100, '084 4001332', 'luishualda@gmail.com', '09275604787', '77082901135', '', '160251461322', '', '3360244820', '938195129'),
(133, 133, '1975-01-27 00:00:00', 0, 0, 1, 2, 1, 1.6, 68, 4, 'B29 L3 Gulfview Exec. Homes, Bago Aplaya, Talomo Dist., Davao City', '', 0, 0, 8000, '2931839', 'B29 L3 Gulfview Exec. Homes, Bago Aplaya, Talomo Dist., Davao City', '', 0, 0, 8000, '2931839', 'tsiking_75@yahoo.com', '', '75012700601', '', '160000464616', '', '0810336278', '178264484'),
(134, 134, '1986-07-02 00:00:00', 1, 0, 1, 1, 1, 0, 0, 7, 'Lanang, Davao City', '', 0, 0, 8000, '', 'Lanang, Davao City', '', 0, 0, 8000, '', 'psychoanalyst_17@yahoo.com ', '09194070798', '', '', '', '', '', '949153194'),
(135, 135, '1970-08-19 00:00:00', 0, 0, 1, 1, 1, 1.49, 39, 7, 'C/o Mencidor Residence, Morningside Heights, Bajada, Davao City', '', 0, 0, 8000, '', 'Purok Cacao, Minaog, Dipolog City', '', 0, 0, 7100, '', 'merlo8000@yahoo.com', '09187482021', '70081901293', '110121433009', '160000169800', '', '', '902008198'),
(136, 136, '1961-02-22 00:00:00', 0, 0, 2, 2, 1, 1.7, 72, 7, 'Block 4 Lot 27 Phase I-b, San Pablo Village, Malagapas, Cotabato City		', '', 0, 0, 9600, '3901904', 'Purok Bayanihan, Barangay Banilad, Dumaguete City	', '', 0, 0, 0, '4220359', 'brix_merced2001@yahoo.com', '09186965457', '61022202081', 'BM00530CBROP', '160000169827', '', '0710263959', '112922623'),
(137, 137, '1975-06-05 00:00:00', 0, 0, 1, 1, 1, 0, 60, 0, 'Lot 8 Blk 35 Phase I, Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '2225304', 'Lot 8 Blk 35 Phase I, Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '2225304', 'mmontiflor@yahoo.com', '09173426674', '75060500568', '110134633911', '160000464551', '', '0918282282', '907904658'),
(138, 138, '2008-04-16 00:00:00', 0, 0, 2, 1, 1, 1.651, 65, 7, 'Maguey St., Mintal, Davao City				', '', 0, 0, 8000, '', 'Brgy. Trinidad, Calbayog City, Samar', '', 0, 0, 6170, '', 'eljosa75@yahoo.com', '09192515825', '75012000944', '', '160000546272', '', '', '932883821'),
(139, 139, '1968-06-29 00:00:00', 0, 0, 2, 2, 1, 1.68, 70, 3, '190 Oriole St., Ecoland Phase 2, Brgy. 76-a Bucana, Davao City', '', 0, 0, 8000, '2981628', '190 Oriole St., Ecoland Phase 2, Brgy. 76-a Bucana, Davao City', '', 0, 0, 8000, '2981628', 'sendrejas@yahoo.com', '09273261628', '68062901385', '160000490277000817382304', '160000490277', '', '0915340277', '162112131'),
(140, 140, '1982-09-16 00:00:00', 1, 0, 1, 1, 1, 1.5, 82, 7, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '82091600443', '', '160000616114', '', '0924593004', '943810936'),
(141, 141, '1972-12-07 00:00:00', 0, 0, 2, 1, 1, 1.7018, 77.273, 3, '291-a Lower Mayon St., Cantral Park Subd., Bangkal, Davao City', '', 0, 0, 8000, '', 'Purok Aguinaldo, Balongating, Guipos, Zamboanga Del Sur', '', 0, 0, 7042, '', 'vclamonte@yahoo.com', '09272129854', '72120702034', '100103474710', '160501605724', '', '0809916418', '164-665-346'),
(142, 142, '2008-04-16 00:00:00', 0, 0, 1, 2, 1, 1.63, 51, 7, 'Blk 13 Lot 16 Galena St., Wellspring Vill. 1,  Catalunan PequeÃƒÂ±o, Davao City		', '', 0, 0, 8022, '', '3 M. Benitez St., Pasay City', '', 0, 0, 1300, '8440203', 'jhoannalynn_cruz@yahoo.com', '09228692980', '', '0000480514506', '020250209356', '', '3306156464', '130-122-404'),
(143, 143, '1951-09-16 00:00:00', 0, 0, 2, 2, 1, 1.651, 63.5, 2, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '51091600122', '110130835810', '160000425777', '', '', '111210673'),
(144, 144, '1971-11-19 00:00:00', 0, 0, 1, 1, 1, 1.524, 1.524, 7, 'Block17 Lot4, Ph. 2, Ciudad De Esperanza Subd., Buhangin, Davao City', '', 0, 0, 8000, '2349142', 'Block17 Lot4, Ph. 2, Ciudad De Esperanza Subd., Buhangin, Davao City', '', 0, 0, 8000, '2349142', 'jeni_eligio@yahoo.com', '09164039507', 'PCM-4606373', '', '160000490315', '', '', '903-099-651'),
(145, 145, '1973-02-01 00:00:00', 0, 0, 1, 2, 1, 1.5, 40.91, 7, 'Almaciga St., Blk36 Lot20 Phase 4, Green Meadows, Mintal, Davao City', '', 0, 0, 8000, '', 'Purok 1, Brgy. San Jose, Malaybalay City, Bukidnon', '', 0, 0, 8700, '', 'eizel_hilario@yahoo.com', '09192804573', '73020101757', '', '160000641976', '', '0408636940', '171-021-016'),
(146, 146, '1967-09-12 00:00:00', 0, 0, 2, 1, 1, 1, 1, 7, 'Up Mindanao Guesthouse, #27 Juan Luna St., Area 1, Up Diliman Campus, Quezon City', '', 0, 0, 1101, '', 'Chss, Up Mindanao, Bago Oshiro, Tugbok District, Davao City', '', 0, 0, 8000, '2930084', 'tim_montes@yahoo.com', '09268650084', '67091201680', '', '160000464578', '', '', '174255860'),
(147, 147, '1982-01-25 00:00:00', 0, 0, 1, 1, 1, 1.74, 74, 0, 'Yellow Bell St., Mintal, Davao City', '', 0, 0, 8022, '', 'Yellow Bell St., Mintal, Davao City', '', 0, 0, 8022, '', 'redner_07@yahoo.com', '09184248658', '82012500595', '', '160252304808', '', '0923884879', '943-815-212'),
(148, 148, '1972-02-27 00:00:00', 0, 0, 2, 2, 1, 1.65, 55, 7, 'Blk25 Lot16 Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '', 'Blk25 Lot16 Elenita Heights Subd., Catalunan Grande, Davao City', '', 0, 0, 8000, '', 'myfeljoseph@yahoo.com', '09205752077', '72022700970', '', '160000480387', '', '', '156-145-94'),
(149, 149, '1977-07-10 00:00:00', 1, 0, 2, 1, 1, 1.73, 67, 0, '127 Jerusalem St., Saint Anthony Vill., Lanang, Davao City', '', 0, 0, 8000, '3057944', '127 Jerusalem St., Saint Anthony Vill., Lanang, Davao City', '', 0, 0, 8000, '3057944', 'rpavo77@yahoo.com', '09058247431', 'CM-4606382', '', '16000170272', '', '', '192934343'),
(150, 150, '1970-04-15 00:00:00', 0, 0, 2, 2, 1, 1, 71, 7, 'Blk15 Lot20 Phase3 Nha Bangkal, Davao City', '', 0, 0, 8000, '', 'Blk15 Lot20 Phase3 Nha Bangkal, Davao City', '', 0, 0, 8000, '', 'teobope@gmail.com', '09053267067', '3376976', '110100197106', '160252013706', '', '', '123-972-644'),
(151, 151, '1985-08-22 00:00:00', 0, 0, 1, 1, 1, 1.55, 51, 1, 'Lantana St., Mintal, Davao City		', '', 0, 0, 8000, '', 'Townsite, Kingking, Compostela Valley Province', '', 0, 0, 8809, '', 'lyna18_upbsam@yahoo.com', '09104096102', '85082200083', '', '010504484578', '', '', '947-619-140'),
(152, 152, '1980-09-19 00:00:00', 0, 0, 2, 1, 1, 1.55, 50, 3, '#2  Purok Zion B, Don Teodoro Juliano Ave., Mb-rh, Cotabato City', '', 0, 0, 9600, '', '#2  Purok Zion B, Don Teodoro Juliano Ave., Mb-rh, Cotabato City', '', 0, 0, 9600, '', 'bongm19@yahoo.com', '09178838804', '', '', '170251560873', '', '', ''),
(153, 153, '1986-05-31 00:00:00', 1, 0, 1, 1, 1, 1.47, 45, 1, 'Zozobrado Boarding House, San Francisco St., Mintal, Davao City', '', 0, 0, 8000, '', '39 Hubard St., Davaofarms Village, Lanang, Davao City', '', 0, 0, 8000, '3056564', 'mayanne_mata@yahoo.com', '09197494968', '', '', '160000650673', '', '', ''),
(154, 154, '1983-01-22 00:00:00', 0, 0, 1, 1, 1, 1.575, 45, 6, 'Purok 6, Blk 5 San Vicente Village, Panabo City, Davao Del Norte', '', 0, 0, 8105, '', 'Purok 6, Blk 5 San Vicente Village, Panabo City, Davao Del Norte', '', 0, 0, 8105, '', 'navy_phoebe@yahoo.com', '09203724117', '', '', '010501530811', '', '0926235836', '236123770000'),
(155, 155, '1985-12-09 00:00:00', 0, 0, 2, 1, 1, 1.651, 56, 3, 'Lot 28 Blk 1, Wellspring Village Phase I, Catalunan PequeÃƒÂ±o, Davao City', '', 0, 0, 8000, '', 'Lot 28 Blk 1, Wellspring Village Phase I, Catalunan PequeÃƒÂ±o, Davao City', '', 0, 0, 8000, '', 'restyupft@yahoo.com', '09193137575', '', '', '', '', '0928809024', '947445237'),
(156, 156, '1965-11-12 00:00:00', 0, 0, 1, 1, 1, 1.6, 58, 7, 'Corsino Compound, San Francisco St., Mintal, Davao City', '', 0, 0, 8022, '2931152', 'Pooc, Balayan, Batangas', '', 0, 0, 4213, '', 'twin9512@yahoo.com', '09177043506', '65111202341', '16000490250', '160000490250', '', '0390105796', '923720554'),
(157, 157, '1980-12-10 00:00:00', 0, 0, 1, 1, 1, 1, 1, 1, '6844 Arguelles Subd., Panabo City, Davao Del Norte', '', 0, 0, 8105, '', '6844 Arguelles Subd., Panabo City, Davao Del Norte', '', 0, 0, 8105, '', 'glory_dee_romo@yahoo.com', '09193262785', '80121001008', '', '160501538520', '', '0924134722', '929117140'),
(158, 158, '1969-03-15 00:00:00', 0, 0, 2, 1, 1, 1.65, 55, 8, '36 Carnation St., Ladislawa Village, Buhangin, Davao City', '', 0, 0, 8000, '2215531', '36 Carnation St., Ladislawa Village, Buhangin, Davao City', '', 0, 0, 8000, '2215531', 'ericsoneuropa@yahoo.com', '09177040994', 'B69EFEPE018', '', '190503246000', '', '0393087044', '176478984'),
(159, 159, '1969-10-08 00:00:00', 1, 0, 2, 1, 1, 1.7, 58, 1, '05 Jade St., Diamond Village Ii, Lanang, Davao City', '', 0, 0, 8000, '2324284', '05 Jade St., Diamond Village Ii, Lanang, Davao City', '', 0, 0, 8000, '2324284', 'boylimz_d@yahoo.com', '09173414986', '', '', '160500376233', '', '0912784951', '913919264'),
(160, 160, '1977-09-15 00:00:00', 1, 0, 1, 2, 1, 1.46, 40, 7, 'Blk 30 Lot 16 Wellspring Village I, Catalunan PequeÃƒÂ±o, Davao City', '', 0, 0, 8000, '3008919', 'Blk 30 Lot 16 Wellspring Village I, Catalunan PequeÃƒÂ±o, Davao City', '', 0, 0, 8000, '3008919', 'lyra_dagaas@yahoo.com', '09215077413', '', '', '160253083872', '', '1919286106', '944373614'),
(161, 161, '1962-02-08 00:00:00', 0, 0, 1, 1, 1, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', '923720554'),
(162, 162, '1979-08-08 00:00:00', 0, 0, 1, 1, 2, 0, 0, 0, '406 Mashino Oyamada-mura Ayama-gun, Mie 518-1414, Japan', '', 0, 0, 0, '0595480713', '', '', 0, 0, 0, '0595480713', 'lemonet@abeam.ocn.ne.jp', '', '', '', '', '', '', ''),
(163, 163, '1974-01-06 00:00:00', 1, 0, 1, 2, 1, 1.63, 52.62, 3, 'Castillo Cmpd., Matina Teachers Village, Matina Aplaya, Davao City', '', 0, 0, 8000, '2975924', 'Castillo Cmpd., Matina Teachers Village, Matina Aplaya, Davao City', '', 0, 0, 8000, '2975924', 'phany_c@yahoo.com', '09183902378', '', '', '', '', '', '199505882'),
(164, 164, '2008-05-23 00:00:00', 0, 0, 2, 2, 1, 0, 0, 0, 'No. 13 San Nicolas St., Skyline Village, Catalunan Grande, Davao City', '', 0, 0, 8000, '2977943', 'No. 13 San Nicolas St., Skyline Village, Catalunan Grande, Davao City', '', 0, 0, 8000, '2977943', 'habagat88@yahoo.com', '09213681740', '', '', '', '', '', ''),
(165, 165, '2008-05-23 00:00:00', 0, 0, 2, 1, 3, 0, 0, 0, '13 McKinley Terrace, Westfield MA 01085', '', 0, 0, 0, '4135722906', '13 McKinley Terrace, Westfield MA 01085', '', 0, 0, 0, '4135722906', 'sf@geo.umass.edu', '', '', '', '', '', '', ''),
(166, 166, '1965-11-14 00:00:00', 0, 0, 1, 2, 1, 1.45, 38, 1, 'PCA Compound, Bago Oshiro, Davao City', '', 0, 0, 8000, '', 'PCA Compound, Bago Oshiro, Davao City	', '', 0, 0, 8000, '', 'manetteeroy@yahoo.com', '09204067803', '', '', '', '', '', '108618093');
INSERT INTO `personnelinfo` (`personnelInfoID`, `personnelID`, `birthDate`, `birthCity`, `birthProvince`, `gender`, `civilStatus`, `citizenship`, `height`, `weight`, `bloodType`, `resHouseNumber`, `resStreet`, `resCity`, `resProvince`, `resZipCode`, `resTelNo`, `permHouseNumber`, `permStreet`, `permCity`, `permProvince`, `permZipCode`, `permTelNo`, `email`, `mobile`, `GSIS`, `HDMF`, `PHIC`, `BP`, `SSS`, `TIN`) VALUES
(167, 167, '1976-12-18 00:00:00', 0, 0, 1, 2, 1, 1.6, 50, 7, '# 320 6th - A St., Ecoland Phase I, Davao City', '', 0, 0, 8000, '3011335', '# 320 6th - A St., Ecoland Phase I, Davao City', '', 0, 0, 8000, '3011335', 'mllestrellado@yahoo.com', '09177013741', '', '', '16025107837', '', '0915452552', '921953346'),
(168, 168, '2008-05-23 00:00:00', 1, 0, 1, 1, 1, 1.575, 52, 7, '435 Champaca St., Juna Subd., Matina, Davao City', '', 0, 0, 8000, '2972490', '435 Champaca St., Juna Subd., Matina, Davao City', '', 0, 0, 8000, '2972490', 'amanda_echevarria@yahoo.com', '09205682381', '', '', '', '', '0929020763', ''),
(169, 169, '2008-05-23 00:00:00', 0, 0, 2, 2, 1, 1.57, 75, 7, 'No. 1 Orchid St., El Rio Vista Village, Phase 4A, Bacaca, Davao City', '', 0, 0, 8000, '4402314 / 2239307', 'No. 1 Orchid St., El Rio Vista Village, Phase 4A, Bacaca, Davao City', '', 0, 0, 8000, '4402314 / 2239307', 'jlebarle@yahoo.com', '09177029753', '5909803', '110102340310', '160000096285', '', '0608315799', '1217633157'),
(170, 170, '1981-06-03 00:00:00', 1, 0, 1, 1, 1, 1.55, 50, 7, 'Lot 9 Blk 1, Wall St., Lanang Executive Homes, Davao City', '', 0, 0, 8000, '3058816', 'Lot 9 Blk 1, Wall St., Lanang Executive Homes, Davao City', '', 0, 0, 8000, '3058816', 'witdureza@yahoo.com', '09177020681', '', '', '0105022895522', '', '0926539215', '932887740'),
(171, 171, '1980-08-11 00:00:00', 1, 0, 1, 1, 1, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(172, 172, '1985-05-10 00:00:00', 1, 0, 1, 1, 1, 0, 0, 0, 'Blk 12 Lot 14 Sampaguita St., P1 NHA BANgkal, Davao City', '', 0, 0, 8000, '', 'Blk 12 Lot 14 Sampaguita St., P1 NHA BANgkal, Davao City', '', 0, 0, 8000, '', 'jaycee_duo_4_ward@yahoo.com', '09063570735', '', '', '', '', '', ''),
(173, 173, '1948-06-26 00:00:00', 0, 0, 1, 1, 1, 0, 0, 0, '30 Sierra Madre St., Central Park Subd., Bangkal, Davao City', '', 0, 0, 8000, '2221625', '30 Sierra Madre St., Central Park Subd., Bangkal, Davao City', '', 0, 0, 8000, '2221625', 'cmerly53@yahoo.com', '', '', '', '', '', '', ''),
(174, 174, '1955-06-08 00:00:00', 0, 0, 2, 1, 1, 1.73, 104.5, 0, '244 Halcon Road, Central Park Subdivision, Bangkal, Davao City', '', 0, 0, 8000, '2970479', '244 Halcon Road, Central Park Subdivision, Bangkal, Davao City', '', 0, 0, 8000, '2970479', 'marcruz@magisx.addu.edu.ph', '', '', '', '', '', '', '101905649'),
(175, 175, '1969-07-08 00:00:00', 1, 0, 2, 2, 1, 1.55, 58.18, 1, '108 Rimas St., Jereza Subd., Bajada, Davao City', '', 0, 0, 8000, '2221106', '108 Rimas St., Jereza Subd., Bajada, Davao City', '', 0, 0, 8000, '2221106', 'cmgcor@yahoo.com', '09189282169', '', '', '', '', '', '158965660'),
(176, 176, '1954-01-07 00:00:00', 0, 0, 1, 1, 1, 0, 0, 0, 'Mindanao Economic Development Council (MEDCo)', '', 0, 0, 8000, '2211345', 'Mindanao Economic Development Council (MEDCo)				', '', 0, 0, 8000, '2211345', 'femyocalderon@medco.gov.ph', '09177002770', '', '', '', '', '', ''),
(177, 177, '1968-08-12 00:00:00', 1, 0, 2, 1, 1, 1.63, 63.64, 0, '106 4th B St., Ecoland I, Davao City', '', 0, 0, 8000, '2990278', '106 4th B St., Ecoland I, Davao City', '', 0, 0, 8000, '2990278', 'aliza@skyinet.net', '', '', '', '', '', '', ''),
(178, 178, '1949-05-23 00:00:00', 0, 0, 2, 1, 1, 0, 0, 0, 'Pca - Drc Housing Compound, Bago Oshiro, Davao City', '', 0, 0, 8000, '2930116', 'Pca - Drc Housing Compound, Bago Oshiro, Davao City', '', 0, 0, 8000, '2930116', 'pca-cpd@interasia.com.ph', '', '', '', '', '', '', '108617708'),
(179, 179, '1977-04-02 00:00:00', 0, 0, 1, 2, 1, 1.39, 1.575, 1, 'Purok 7-a Bankas Heights Toril Davao City', '', 0, 0, 8000, '', 'Purok 7-a Bankas Heights Toril Davao City', '', 0, 0, 8000, '', '', '09202625311', '', '', '', '', '', ''),
(180, 180, '2008-05-27 00:00:00', 1, 0, 2, 1, 1, 1.68, 80, 0, 'Block 40 Lot 14 Davao Gulf Blvd., Gulf View Subd., Bago Aplaya, Davao City', '', 0, 0, 8000, '2994344', 'Block 40 Lot 14 Davao Gulf Blvd., Gulf View Subd., Bago Aplaya, Davao City', '', 0, 0, 8000, '2994344', 'cyberron@pldtdsl.net', '09174485473', '', '', '', '', '', '107266820'),
(181, 181, '1961-12-14 00:00:00', 0, 0, 2, 2, 1, 0, 0, 0, 'Neda Regional Office XI, Maxima Building, Bajada, Davao City', '', 0, 0, 8000, '2210657', '26a Iriga St., Sta. Mesa Heights, Quezon City', '', 0, 0, 0, '4132604', 'nic_agustin@yahoo.com', '09192073817', '', '', '', '', '', '111787700'),
(182, 182, '2008-05-27 00:00:00', 0, 0, 2, 2, 1, 0, 0, 0, 'Monteverde Ave., co. 88 Guerrero St., Davao City', '', 0, 0, 8000, '2218178', 'Monteverde Ave., co. 88 Guerrero St., Davao City', '', 0, 0, 8000, '2218178', '', '', '', '', '', '', '', ''),
(183, 183, '1986-12-03 00:00:00', 0, 0, 1, 1, 1, 0, 0, 0, 'Room 205, Tuscan Building, corner Pag-asa and Ponce Sts., Davao City', '', 0, 0, 8000, '', 'Room 205, Tuscan Building, corner Pag-asa and Ponce Sts., Davao City', '', 0, 0, 8000, '', 'kween_tan8@yahoo.com', '', '', '', '', '', '', ''),
(184, 184, '1982-02-02 00:00:00', 0, 0, 2, 1, 1, 0, 0, 0, 'Door 2, de Castro Building, Salvador St., Buhangin, Davao City', '', 0, 0, 8000, '', 'Crossing Barangay Onica, Binoligan, Kidapawan City', '', 0, 0, 0, '', 'titanpotterharry@yahoo.com', '09266900401', '', '', '', '', '', ''),
(185, 185, '1963-10-06 00:00:00', 0, 0, 2, 2, 1, 0, 0, 0, '16 G, Road 1, DoÃƒÂ±a Vicenta Village II, Bajada, Davao City', '', 0, 0, 8000, ' ', '16 G, Road 1, DoÃƒÂ±a Vicenta Village II, Bajada, Davao City', '', 0, 0, 8000, '', 'mpsirilan@msn.com', '09177035981', '', '', '', '', '', ''),
(186, 186, '1985-03-01 00:00:00', 0, 0, 2, 1, 1, 0, 0, 0, '72 Independence St., Lower Langcangan, Oroquieta City', '', 0, 0, 7207, '', '72 Independence St., Lower Langcangan, Oroquieta City', '', 0, 0, 7207, '', 'raffy_jones@yahoo.co.uk', '09064430135', '', '', '', '', '', ''),
(187, 187, '1967-02-19 00:00:00', 0, 0, 1, 1, 1, 0, 0, 0, '199 Continental St., Davao Executive Homes, Matina, Davao City', '', 0, 0, 8000, '', '199 Continental St., Davao Executive Homes, Matina, Davao City', '', 0, 0, 8000, '', 'leepar19@yahoo.com', '09177017041', '', '', '', '', '', '105144140'),
(188, 188, '1959-05-09 00:00:00', 0, 0, 2, 2, 1, 0, 0, 0, 'Blk 19 Lot 24 Gensanville Subd., Bula, General Santos City', '', 0, 0, 9500, '', 'Blk 19 Lot 24 Gensanville Subd., Bula, General Santos City', '', 0, 0, 0, '9500', 'reneparaba@g-mail.com', '', 'B59J8RSP015', '110212798804', '170000045007', '', '', '190476504'),
(189, 189, '1977-04-19 00:00:00', 0, 0, 1, 2, 1, 1.5748, 62, 0, '59 Yakal St., Hillside Subd., Davao City', '', 0, 0, 8000, '3004220', '59 Yakal St., Hillside Subd., Davao City', '', 0, 0, 8000, '3004220', 'lizapabularcon@yahoo.com', '09185202184', 'B77HKLNP016', '', '1600004232901', '', '3359086439', '918130005'),
(190, 190, '1958-07-29 00:00:00', 1, 0, 2, 1, 1, 0, 0, 0, 'Door 8, Sama Apts. II, Insular Village Phase I, Davao City', '', 0, 0, 8000, '2344502', 'Door 8, Sama Apts. II, Insular Village Phase I, Davao City', '', 0, 0, 8000, '2344502', '', '09179011821', '', '', '', '', '', ''),
(191, 191, '1984-06-15 00:00:00', 0, 0, 1, 2, 1, 1.62, 91, 7, '84-2 Ponciano-reyes St., Davao City', '', 0, 0, 8000, '3001299', 'Blk 16 Lot 11 Macopa St Ciudad Esperanza Buhangin Davao City', '', 0, 0, 8000, '09089894438', 'lnarshall@yahoo.com', '09196199253', '', '', '160502133141', '', '0927356714', '938499385'),
(192, 192, '1963-09-23 00:00:00', 1, 0, 2, 2, 1, 1.7, 63.64, 0, '218 Talisay St., Blk 8 Phase V, Hillside Subd.,  Lanang, Davao City', '', 0, 0, 8000, '', '218 Talisay St., Blk 8 Phase V, Hillside Subd.,  Lanang, Davao City				', '', 0, 0, 8000, '', '', '', '', '', '', '', '', ''),
(193, 193, '1973-11-23 00:00:00', 0, 0, 2, 1, 1, 1.6, 60, 0, 'Image Video, Feeder Road 2, Sto. Tomas, Davao del Norte', '', 0, 0, 0, '', 'Image Video, Feeder Road 2, Sto. Tomas, Davao del Norte', '', 0, 0, 0, '', 'junaldo2003@yahoo.com', '09177007483', '', '', '', '', '', ''),
(194, 194, '1982-12-25 00:00:00', 1, 0, 1, 1, 1, 0, 0, 0, '139 Fatima corner Jacinto Sts., Davao City', '', 0, 0, 8000, '', '139 Fatima corner Jacinto Sts., Davao City			', '', 0, 0, 8000, '', 'dyan_8000@lycos.com', '09197685354', '', '', '', '', '', ''),
(195, 195, '1987-08-14 00:00:00', 0, 0, 2, 1, 1, 0, 179, 8, '1028 Nadofa, Mirafuentes, Tagum City, Davao Del Norte', '', 0, 0, 8100, '', '1028 Nadofa, Mirafuentes, Tagum City, Davao Del Norte', '', 0, 0, 8100, '', 'jessievarquezjr@yahoo.com', '09175008102', '', '', '', '', '', ''),
(196, 196, '1974-12-18 00:00:00', 0, 0, 2, 2, 1, 1.6, 68, 0, 'B22 L12, Piii, Rosalina Iii, Baliok, Toril, Davao City', '', 0, 0, 8000, '09096776773', 'B22 L12, Piii, Rosalina Iii, Baliok, Toril, Davao City', '', 0, 0, 8000, '09096776773', 'XXXXX', '09096776773', '', '', '19-090391500-9', '', '08-1011926-2', '921807838'),
(197, 197, '2009-08-20 00:00:00', 0, 0, 1, 2, 1, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(198, 198, '1984-06-04 00:00:00', 0, 0, 1, 2, 0, 1.524, 63, 7, 'B6 L21 Phase 1 Elenita Heights Subd\nCatalunan Grande Davao City', '', 0, 0, 8000, '09292096253', '4258 Orchid St Valencia City Bukidnon', '', 0, 0, 8709, '', 'hana_esteban@gmail.com', '09292096253', '', '', '', '', '0814087688', '267-656-137'),
(199, 199, '1983-06-02 00:00:00', 0, 0, 2, 1, 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(200, 200, '1987-04-05 00:00:00', 0, 0, 2, 1, 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(201, 201, '1987-04-28 00:00:00', 0, 0, 2, 1, 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(202, 202, '1986-04-08 00:00:00', 0, 0, 1, 1, 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(203, 203, '1972-09-29 00:00:00', 1, 0, 1, 1, 1, 1.57, 55, 7, 'L16 Blk 1, Silver St, Mineral Village\nBacaca, Davao City', '', 0, 0, 8000, '082 3210730', 'L16 Blk 1ilver St. Mineral Village\nBacaca, Davao Ciy', '', 0, 0, 8000, '082 3210730', 'ent_dorado@yahoo.com', '09175742964', '', '', '', '', '', '189-774-175'),
(204, 204, '1960-12-28 00:00:00', 0, 0, 2, 2, 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(205, 205, '1979-10-09 00:00:00', 0, 0, 1, 1, 1, 1.52, 45, 7, '5286 Mabini Extension Digos City  Davao Del Sur', '', 0, 0, 0, '', '5286 Mabini Extension Digos City Davao Del Sur', '', 0, 0, 0, '', '', '09183521892', '', '', '', '', '', '222432280'),
(206, 206, '1982-01-28 00:00:00', 0, 0, 1, 1, 1, 1.64, 56, 1, 'Albite Residence Champaca St\nDavao City', '', 0, 0, 8022, '', 'Salimbao sultan Kudarat Shariff Kabunsuan', '', 0, 0, 0, '', 'babyyaney@yahoo.com', '09208443681', '', '', '', '', '', '939466006'),
(207, 207, '1983-12-13 00:00:00', 0, 0, 2, 1, 1, 1.6, 60, 1, 'Door 9 Magnaye Apartment San Antonio Matina Davao City', '', 0, 0, 8000, 'none', 'Barangay S. Buenavista Agusan Del Norte', '', 0, 0, 0, '', 'bonette_jek@yahoo.com', '09219719373', 'LS-CSM-04-2002', '', '180000391377', '', '', '938409467'),
(208, 208, '1985-04-08 00:00:00', 0, 0, 1, 1, 1, 5, 47, 3, 'Camp San Gabriel Mintal, Tugbok, Davao City', '', 0, 0, 8000, '', 'Camp San Gabriel Mintal, Tugbok, Davao City', '', 0, 0, 8000, '', 'ping_jr01@yahoo.com', '09215780939', 'on process', 'on process', '160502618501', '', '0928355497', '304-039-736'),
(209, 209, '1984-12-25 00:00:00', 0, 0, 2, 1, 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(210, 210, '1970-05-19 00:00:00', 0, 0, 1, 1, 1, 160.02, 50, 7, '737-C TIONKO AVENUE DAVAO CITY', '', 0, 0, 8000, '', '', '', 0, 0, 0, '', 'arvebaÃƒÂ±ez@yahoo.com.ph', '09174116092', '', '', '160000549379', '', '', '177165063'),
(211, 211, '1983-12-16 00:00:00', 1, 0, 1, 1, 1, 1.6, 58, 8, '', '', 0, 0, 0, '', '#212 Kalantas St.\n212 Kalantas St Hillside Subd\nBuhangin Davao City\n', '', 0, 0, 8000, '3056352', 'krishnahernandez@yahoo.com', '09275195251', '', '', '160253352660', '', '0930566384', '946898969'),
(212, 212, '1982-09-26 00:00:00', 0, 0, 1, 2, 1, 1.5, 53, 2, '', '', 0, 0, 0, '', 'Purok 3 Bago Ohiro, Davao City', '', 0, 0, 8022, '', 'cushygeia@yahoo.com', '09058686253', '', '', '160501469200', '', '0924560024', '931730084'),
(213, 213, '1971-04-21 00:00:00', 0, 0, 1, 2, 1, 1.63, 50, 8, '', '', 0, 0, 0, '', 'B38 Lot 7 Susana Homes Iii Pag Ibig City, Baliok, Talomo District, Davao City', '', 0, 0, 8000, '', 'annmiraflor@yahoo.com', '09095618339', '', '', '160502617734', '', '0918495859', '199910386'),
(214, 214, '1970-11-23 00:00:00', 0, 0, 2, 1, 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(215, 215, '1988-11-26 00:00:00', 0, 0, 1, 1, 1, 1.5, 42, 7, '', '', 0, 0, 0, '', 'Blk 4 Lot 2 Phase 2 Vista Verde Village Panacan, Davao City', '', 0, 0, 0, '', 'luchie_labayan@yahoo.com', '09287890051', '', '', '', '', '', '278235974'),
(216, 216, '1951-10-25 00:00:00', 0, 0, 2, 2, 1, 1.54, 63, 2, '', '', 0, 0, 0, '', '25 CHESNUT DRIVE, ECOLAND SUBD PH 7 BUCANA, DAVAO CITY', '', 0, 0, 8000, '082 2972858', 'fred_tingson@yahoo.com', '09154972283', 'on process', '', '160250264639', '', '0902434318', '149431457'),
(217, 217, '1985-05-06 00:00:00', 1, 0, 1, 1, 1, 4.97, 40, 2, '', '', 0, 0, 0, '', '13 Woodpecker St., DoÃƒÂ±a Pilar Village, Sasa, Davao City', '', 0, 0, 8000, '3055387', 'princess_faline@yahoo.com', '09194374451', '', '', '', '', '0928203633', '930011421'),
(218, 218, '1987-08-03 00:00:00', 1, 0, 2, 1, 1, 1.6, 48, 3, '', '', 0, 0, 0, '', '332 Bandera EspaÃƒÂ±ola St Mintal Davao City', '', 0, 0, 8000, '2931002', 'doyle.abrio@gmail.com', '09082998695', '', '', '160253541595', '', '0930113245', '263438973'),
(219, 219, '1979-08-15 00:00:00', 0, 0, 1, 1, 1, 0, 0, 0, '', '', 0, 0, 0, '', '654-5 AURORA QUEZON ST POBLACION DAVAO CITY', '', 0, 0, 0, '', 'slabastilla@gmail.com', '09151163717', '', '', '', '', '', '212553541'),
(220, 220, '1983-09-15 00:00:00', 0, 0, 1, 1, 1, 1.66, 90, 7, '', '', 0, 0, 0, '', 'Block 35 Lot 4 Waling Waling St Country Homes Subd Cabantian Buhangin Davao City', '', 0, 0, 0, '', 'ronajoy_alderite@yahoo.com.ph', '09219661231  or 09168748615', '', '', '160501904039', '', '', '275884379'),
(221, 221, '1969-04-22 00:00:00', 0, 0, 2, 2, 1, 1.6, 70, 1, '', '', 0, 0, 0, '', '18 Pearl St., Ecoland Subd. Phase 4 Brgy Bucana Davao City', '', 0, 0, 0, '', 'adahili@upmin.edu.ph', '', '', '', '', '', '', '131424993'),
(222, 222, '1985-11-08 00:00:00', 0, 0, 1, 1, 1, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(223, 223, '1950-07-23 00:00:00', 0, 0, 2, 1, 1, 2, 82, 0, 'Lanzona Village, Matina Davao City', '', 0, 0, 8000, 'NA', '14 Cityland Estacion St. Pasong Tamo,\nMakati, Metro Manila', '', 0, 0, 0, 'NA', 'benjy724@gmail.com', '0928-550-1126', '', '', '', '', '', ''),
(224, 224, '1974-12-24 00:00:00', 1, 0, 1, 2, 1, 0, 0, 0, '10-2 Brgy. San Antonio Agdao, Davao City', '', 0, 0, 8000, '(082) 224-8530', '10-2 Brgy. San Antonio Agdao, Davao City', '', 0, 0, 8000, '(082) 224-8530', 'leeanned4@yahoo.com', '0908-2723823', '', '', '160502596958', '', '09-1535286-9', '305-292-247-000'),
(225, 225, '1980-06-19 00:00:00', 0, 0, 1, 2, 1, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(226, 226, '1988-09-09 00:00:00', 0, 0, 2, 1, 1, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(227, 227, '1959-11-22 00:00:00', 0, 0, 2, 2, 1, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(228, 228, '1986-05-10 00:00:00', 0, 0, 1, 1, 1, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(229, 229, '1989-10-11 00:00:00', 0, 0, 2, 1, 1, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(230, 230, '1986-02-24 00:00:00', 0, 0, 1, 1, 1, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(231, 231, '1986-02-11 00:00:00', 0, 0, 1, 1, 1, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(232, 232, '1987-11-01 00:00:00', 0, 0, 2, 1, 1, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(233, 233, '1988-12-29 00:00:00', 0, 0, 1, 1, 1, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(234, 234, '1987-12-07 00:00:00', 0, 0, 1, 1, 1, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(235, 235, '1980-12-06 00:00:00', 0, 0, 1, 2, 1, 0, 0, 0, '248 Arayat St., Central Park, Davao City', '', 0, 0, 8000, '2984203', '248 Arayat St., Central Park, Davao City', '', 0, 0, 8000, '2984203', 'monsanto.hearne@gmail.com', '09156300693', '', '', '', '', '', ''),
(236, 236, '1985-01-19 00:00:00', 0, 0, 2, 1, 1, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(237, 237, '1986-10-15 00:00:00', 0, 0, 2, 1, 1, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(238, 238, '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(239, 239, '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(240, 239, '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', ''),
(241, 241, '1990-01-09 14:07:09', 0, 0, 0, 0, 0, 0, 0, 0, 'Lot 19 Block 53 Apalit Avenue, Davao City', '', 0, 0, 0, '', 'Lot 19 Block 53 Apalit Avenue, Davao City', '', 0, 0, 0, '', 'hiltonsoberano@yahoo.com', '09308093817', '', '', '', '', '', '0123456789');

-- --------------------------------------------------------

--
-- Table structure for table `personneloffice`
--

CREATE TABLE IF NOT EXISTS `personneloffice` (
  `personnelofficeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `personnelID` int(10) unsigned NOT NULL,
  `officeID` int(10) unsigned NOT NULL,
  `fromDate` datetime NOT NULL,
  `toDate` datetime NOT NULL,
  `remarks` varchar(255) NOT NULL,
  PRIMARY KEY (`personnelofficeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `personneloffice`
--

INSERT INTO `personneloffice` (`personnelofficeID`, `personnelID`, `officeID`, `fromDate`, `toDate`, `remarks`) VALUES
(1, 4, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(2, 68, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `realprop_link`
--

CREATE TABLE IF NOT EXISTS `realprop_link` (
  `saln_id` int(10) NOT NULL,
  `realprop_id` int(10) NOT NULL,
  PRIMARY KEY (`saln_id`,`realprop_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `realprop_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `relative_link`
--

CREATE TABLE IF NOT EXISTS `relative_link` (
  `saln_id` int(10) NOT NULL,
  `relative_id` int(10) NOT NULL,
  PRIMARY KEY (`saln_id`,`relative_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relative_link`
--


-- --------------------------------------------------------

--
-- Table structure for table `spouse`
--

CREATE TABLE IF NOT EXISTS `spouse` (
  `personnelID` int(10) unsigned NOT NULL,
  `fname` varchar(45) NOT NULL,
  `mname` varchar(45) NOT NULL,
  PRIMARY KEY (`personnelID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spouse`
--


-- --------------------------------------------------------

--
-- Table structure for table `spouse_info`
--

CREATE TABLE IF NOT EXISTS `spouse_info` (
  `spouse_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `mname` varchar(45) NOT NULL,
  `position` varchar(45) NOT NULL,
  `agency` varchar(45) NOT NULL,
  PRIMARY KEY (`spouse_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `spouse_info`
--

INSERT INTO `spouse_info` (`spouse_id`, `fname`, `mname`, `position`, `agency`) VALUES
(1, 'a', 'b', 'c', 'd');

-- --------------------------------------------------------

--
-- Table structure for table `spouse_link`
--

CREATE TABLE IF NOT EXISTS `spouse_link` (
  `saln_id` int(10) NOT NULL,
  `spouse_id` int(10) NOT NULL,
  PRIMARY KEY (`saln_id`,`spouse_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spouse_link`
--

INSERT INTO `spouse_link` (`saln_id`, `spouse_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `statement_info`
--

CREATE TABLE IF NOT EXISTS `statement_info` (
  `personnelID` int(10) unsigned NOT NULL,
  `saln_id` varchar(10) NOT NULL,
  `declare_date` date NOT NULL,
  `position` varchar(45) NOT NULL,
  `annual_salary` float(10,2) unsigned NOT NULL,
  `annual_income` float(10,2) unsigned NOT NULL,
  `cert_date` date NOT NULL,
  `atty_lname` varchar(45) NOT NULL,
  `atty_fname` varchar(45) NOT NULL,
  `atty_mname` varchar(45) NOT NULL,
  `tax_cert_no` varchar(45) NOT NULL,
  `issued_in` varchar(100) NOT NULL,
  `issued_on` date NOT NULL,
  `attachment` text NOT NULL,
  PRIMARY KEY (`saln_id`),
  KEY `saln_id` (`saln_id`),
  KEY `personnelID` (`personnelID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statement_info`
--

INSERT INTO `statement_info` (`personnelID`, `saln_id`, `declare_date`, `position`, `annual_salary`, `annual_income`, `cert_date`, `atty_lname`, `atty_fname`, `atty_mname`, `tax_cert_no`, `issued_in`, `issued_on`, `attachment`) VALUES
(241, '1', '0000-00-00', '', 0.00, 0.00, '0000-00-00', '', '', '', '', '', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `vhcl_link`
--

CREATE TABLE IF NOT EXISTS `vhcl_link` (
  `saln_id` int(10) NOT NULL,
  `vhcl_id` int(10) NOT NULL,
  PRIMARY KEY (`saln_id`,`vhcl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vhcl_link`
--

--
-- Database: `upmin_msp`
--
CREATE DATABASE `upmin_msp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `upmin_msp`;

-- --------------------------------------------------------

--
-- Table structure for table `accommodation`
--

CREATE TABLE IF NOT EXISTS `accommodation` (
  `accommodationID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `accommodationName` varchar(100) NOT NULL,
  `accommodationCode` varchar(45) NOT NULL,
  `accommodationDesc` varchar(45) NOT NULL,
  `accommodationLoc` varchar(45) NOT NULL,
  `accommodationFee` int(10) NOT NULL,
  `accommodationTypeID` int(10) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `lastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` char(15) NOT NULL,
  PRIMARY KEY (`accommodationID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `accommodation`
--

INSERT INTO `accommodation` (`accommodationID`, `accommodationName`, `accommodationCode`, `accommodationDesc`, `accommodationLoc`, `accommodationFee`, `accommodationTypeID`, `userID`, `dateCreated`, `lastUpdated`, `status`) VALUES
(6, 'wertxsd', 'dfdfd', 'dfdff', 'dfdfdsdsds', 0, 8, 2, '2011-09-19 12:27:30', '2011-09-19 19:08:03', '');

-- --------------------------------------------------------

--
-- Table structure for table `accommodationtype`
--

CREATE TABLE IF NOT EXISTS `accommodationtype` (
  `accommodationTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `accommodationTypeName` varchar(45) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `lastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`accommodationTypeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `accommodationtype`
--

INSERT INTO `accommodationtype` (`accommodationTypeID`, `accommodationTypeName`, `userID`, `dateCreated`, `lastUpdated`) VALUES
(8, 'Dormitory', 2, '2011-09-19 11:48:04', '2011-09-19 12:08:37');

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE IF NOT EXISTS `college` (
  `collegeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `collegeName` varchar(100) NOT NULL,
  `collegeCode` varchar(45) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `lastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`collegeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `college`
--

INSERT INTO `college` (`collegeID`, `collegeName`, `collegeCode`, `userID`, `dateCreated`, `lastUpdated`) VALUES
(1, 'College of Science and Mathematics', 'CSM', 1, '2010-08-26 13:58:36', '2010-08-26 14:03:05'),
(2, 'College of Humanities and Social Sciences', 'CHSS', 1, '2010-08-26 14:03:31', '2010-08-26 14:03:31'),
(4, 'School of Management', 'SOM', 4, '2010-08-26 14:03:54', '2010-10-05 13:56:37');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `deptID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deptName` varchar(100) NOT NULL,
  `deptCode` varchar(45) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `lastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`deptID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`deptID`, `deptName`, `deptCode`, `userID`, `dateCreated`, `lastUpdated`) VALUES
(2, 'Depart of Food Science and Chemistry', ' DFSC', 1, '2010-08-27 09:47:27', '2010-08-27 10:20:38'),
(3, 'Department of Social Science ', 'DSS', 4, '2010-09-08 08:07:58', '2010-09-08 08:07:58'),
(4, 'Department of Humanities', 'DH', 4, '2010-09-08 08:08:25', '2010-09-08 08:08:25'),
(5, 'Department of Human Kinetics', 'DHK', 4, '2010-09-08 08:08:53', '2010-09-08 08:08:53'),
(6, 'Department of Biological Science and Environmental Studies', 'DBSES', 4, '2010-09-08 08:09:56', '2010-09-08 08:09:56'),
(7, 'Department of Math, Physics and Computer Science ', 'DMPCS', 4, '2010-09-08 08:10:39', '2010-09-08 08:10:39'),
(8, 'School of Management ', 'SOM', 4, '2010-09-22 17:06:26', '2010-09-22 17:06:26');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE IF NOT EXISTS `education` (
  `educationID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `facultyID` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `yearGraduated` date NOT NULL,
  `schoolName` varchar(100) NOT NULL,
  `degree` varchar(100) NOT NULL,
  `awards` varchar(100) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `lastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`educationID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`educationID`, `facultyID`, `level`, `yearGraduated`, `schoolName`, `degree`, `awards`, `userID`, `dateCreated`, `lastUpdated`) VALUES
(1, 3, 1, '2010-09-06', 'asdfaf', 'asfdasf', 'asdfasfasdf', 1, '2010-09-06 14:43:03', '2010-09-06 14:43:03');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE IF NOT EXISTS `faculty` (
  `facultyID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lastName` varchar(60) NOT NULL,
  `firstName` varchar(60) NOT NULL,
  `middleName` varchar(60) NOT NULL,
  `address` varchar(200) NOT NULL,
  `telephone` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `email` varchar(250) NOT NULL,
  `userID` varchar(45) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `lastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `researcherCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`facultyID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=173 ;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`facultyID`, `lastName`, `firstName`, `middleName`, `address`, `telephone`, `mobile`, `email`, `userID`, `dateCreated`, `lastUpdated`, `researcherCode`) VALUES
(1, 'Barriga', 'Ronald', 'A', 'College of Science and Mathematics (CSM)\r\nMintal, Tugbok District, Davao City', '293-0864', '0919xx', 'rbarriga25@gmail.com; rbarriga25@yahoo.com', '4', '2010-08-27 17:38:56', '2010-10-07 10:07:22', '11107-00076'),
(2, 'Abad', 'Reynaldo ', 'G', 'Department of Biological Science and Environmental Studies (DBSES)\r\nCollege of Science and Mathematics (CSM)\r\nKanluran Campus, Mintal, Tugbok District, Davao City ', '293-0302', '0919-830-1738', 'rabadup@yahoo.com', '4', '2010-08-27 17:47:45', '2010-10-07 11:24:35', '11107-00071'),
(3, 'Ates-Camino', 'Fritzie', 'B', 'Department of Biological Science and Environmental Studies (DBSES)\r\nUniversity of the Philippines Mindnao \r\nMintal, Tugbok District, Davao City ', '293-0302', '0910-203-6293', 'tziek_24@yahoo.com', '4', '2010-08-27 18:25:27', '2010-10-07 10:07:08', '11107-00033'),
(5, 'Bastian Jr', 'Severo', 'T', 'Department of Biological Science and Environmental Studies (DBSES)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '293-0302', '0918-466-0993', 'stbastian2003@yahoo.com', '4', '2010-09-08 08:53:00', '2010-10-07 10:07:35', '11107-00079'),
(6, 'Bayogan', 'Emma Ruth ', 'V', 'Department of Biological Science and Environmental Studies (DBSES)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0302', '0919xx', 'evbph@yahoo.com', '4', '2010-09-08 08:55:46', '2010-10-07 10:07:45', '11107-00005'),
(7, 'Calag', 'Vicente', 'B', 'Department of Math, Physics and Computer Science (DMPCS)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0258', '0919xx', 'viccalag@yahoo.com', '4', '2010-09-08 08:57:19', '2010-10-07 10:08:20', '11107-00085'),
(8, 'Flores', 'Dulce', 'M', 'Department of Food Science and Chemistry (DFSC)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0919-445-7973', 'dmflores_2000@yahoo.com', '4', '2010-09-08 08:58:43', '2010-10-07 11:49:15', '11107-00077'),
(9, 'Novero', 'Anabelle', 'U', 'Department of Biological Science and Environmental Studies (DBSES)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0302', '0919xx', 'anovero@yahoo.com; anovero@upmin.edu.ph', '4', '2010-09-08 09:01:43', '2010-10-07 13:28:10', '11107-00066'),
(10, 'Vernaiz', 'Marie Angelique', 'C', 'Department of Biological Science and Environmental Studies (DBSES)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0302', '0919xx', 'xxx', '4', '2010-09-08 09:02:55', '2010-10-07 10:16:59', '11107-00059'),
(11, 'Fronteras', 'Jennifer', 'P', 'Department of Food Science and Chemistry (DFSC)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0919xx', 'xxx', '4', '2010-09-08 15:31:34', '2010-10-07 10:10:12', '11107-00043'),
(12, 'Fundador', 'Noreen Grace ', 'V', 'Department of Food Science and Chemistry (DFSC)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0919-367-3724', 'nors_21@hotmail.com', '4', '2010-09-08 15:33:09', '2010-10-07 10:09:26', '11107-00068'),
(13, 'Gamboa', 'Ruth ', 'U', 'Department of Biological Science and Environmental Studies (DBSES)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0917-700-1803', 'ruthupmin@yahoo.com', '4', '2010-09-08 15:37:51', '2010-10-07 11:51:45', '11107-00027'),
(14, 'Rasco Jr.', 'Eufemio', 'T', 'Department of Biological Science and Environmental Studies (DBSES)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0302', '0920-951-8440', 'eufemio_rasco@yahoo.com; etrascojr@gmail.com', '4', '2010-09-08 15:39:33', '2010-10-07 10:15:46', '11107-00010'),
(15, 'Rivero', 'Gilda', 'C', 'Office of the Chancellor \r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0310', '0920-814-1713', 'oc@upmin.edu.ph', '4', '2010-09-08 15:41:20', '2010-10-07 10:16:28', '11107-00035'),
(16, 'Talde', 'Cheryl ', 'M', 'Department of Biological Science and Environmental Studies (DBSES)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0919-842-9367', 'chetal_1101@yahoo.com', '4', '2010-09-08 15:43:10', '2010-10-07 10:17:44', '11107-00001'),
(17, 'Toleco', 'Mitchel Rey', 'M', 'Department of Food Science and Chemistry (DFSC)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0921-324-8299', 'mrtoleco_hd@yahoo.com', '4', '2010-09-08 15:44:55', '2010-10-07 10:17:09', '11107-00064'),
(18, 'Nañola Jr.', 'Cleto ', 'L', 'Department of Biological Science and Environmental Studies (DBSES)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0919-361-2686', 'tingnanola@yahoo.com', '4', '2010-09-08 15:46:44', '2010-10-07 13:26:17', '11107-00063'),
(19, 'Obsioma', 'Antonio ', 'R', 'Department of Biological Science and Environmental Studies (DBSES)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0929-398-9713', 'obsiomar@yahoo.com', '4', '2010-09-08 15:51:47', '2010-10-07 10:13:20', '11107-00130'),
(20, 'Nemenzo ', 'Phoebe', 'S', 'Department of Biological Science and Environmental Studies (DBSES)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0919xx', 'xxx', '4', '2010-09-08 15:52:53', '2010-10-07 10:10:26', '11107-00101'),
(21, 'Del Mundo', 'Dann Marie', 'N', 'Department of Food Science and Chemistry (DFSC)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0919xx', 'xxx', '4', '2010-09-08 15:53:55', '2010-10-07 10:10:02', '11107-00117'),
(22, 'Macala', 'Alexis ', 'U', 'Department of Food Science and Chemistry (DFSC)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '293-0312', '0919xx', 'xxx', '4', '2010-09-08 15:54:41', '2010-10-07 11:59:32', '11107-00127'),
(23, 'Obsioma', 'Virginia ', 'P', 'Department of Food Science and Chemistry (DFSC)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0919xx', 'jeantonic_2000@yahoo.com', '4', '2010-09-08 15:55:43', '2010-10-07 13:28:55', '11107-00086'),
(24, 'Tagubase', 'Jackie Lou', 'J', 'Department of Food Science and Chemistry (DFSC)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0919xx', 'jackitagubase@yahoo.com', '4', '2010-09-08 15:57:12', '2010-10-07 10:17:31', '11107-00090'),
(25, 'Acosta', 'Joseph', 'E', 'Department of Math, Physics and Computer Science (DMPCS)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0919xx', 'jacosta_96140@yahoo.com', '4', '2010-09-08 15:59:03', '2010-10-07 10:06:58', '11107-00046'),
(26, 'Casinillo ', 'Metche Anne', 'C', 'Department of Math, Physics and Computer Science (DMPCS)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0919xx', 'sexynaughtymetch@yahoo.com', '4', '2010-09-08 16:03:21', '2010-10-07 10:08:43', '11107-00115'),
(27, 'Daisog', 'Lyna Mie', 'C', 'Department of Math, Physics and Computer Science (DMPCS)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0929-680-9809', 'lyna18_upbsam@yahoo.com', '4', '2010-09-08 17:00:58', '2010-10-07 10:11:07', '11107-00094'),
(28, 'Gamot', 'Riche Mae', 'T', 'Department of Math, Physics and Computer Science (DMPCS)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0919xx', 'ariane43981@yahoo.com', '4', '2010-09-09 08:20:24', '2010-10-07 10:13:30', '11107-00102'),
(29, 'Guden ', 'Glenn', 'M', 'Department of Math, Physics and Computer Science (DMPCS)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '293-0312', '0919xx', 'xxx', '4', '2010-09-09 08:21:18', '2010-10-07 10:09:38', '11107-00122'),
(30, 'Kobayashi', 'Vlademir', 'B', 'Department of Math, Physics and Computer Science (DMPCS)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '293-0312', '0919xx', 'xxx', '4', '2010-09-09 08:22:13', '2010-10-07 10:11:57', '11107-00124'),
(31, 'Malagamba', 'Mabele', 'P', 'Department of Math, Physics and Computer Science (DMPCS)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '293-0312', '0919xx', 'xxx', '4', '2010-09-09 08:23:01', '2010-10-07 10:12:28', '11107-00097'),
(32, 'Mata', 'May Anne', 'E', 'Department of Math, Physics and Computer Science (DMPCS)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '293-0312', '0929-661-5320', 'mayanne_mata@yahoo.com', '4', '2010-09-09 08:24:07', '2010-10-07 10:12:52', '11107-00100'),
(33, 'Monteron', 'John Paulette', 'A', 'Department of Math, Physics and Computer Science (DMPCS)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '293-0312', '0919xx', 'johlan22@yahoo.com', '4', '2010-09-09 08:25:31', '2010-10-07 10:16:48', '11107-00128'),
(34, 'Nalangan', 'Li-Ann Lee', 'R', 'Department of Math, Physics and Computer Science (DMPCS)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '293-0312', '0917-493-8850', 'vaacn@yahoo.com', '4', '2010-09-09 08:27:10', '2010-10-07 10:14:17', '11107-00048'),
(35, 'Oguis', 'Giovanna Fae', 'R', 'Department of Math, Physics and Computer Science (DMPCS)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '293-0312', '0919xx', 'xxx', '4', '2010-09-09 08:28:05', '2010-10-07 10:15:03', '11107-00131'),
(36, 'Oponda', 'Nilo', 'B', 'Department of Math, Physics and Computer Science (DMPCS)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '293-0312', '0919xx', 'xxx', '4', '2010-09-09 08:28:53', '2010-10-07 10:15:17', '11107-00132'),
(37, 'Ramoran', 'Vanessa', 'C', 'Department of Math, Physics and Computer Science (DMPCS)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '293-0312', '0919xx', 'vcastle_99@yahoo.com', '4', '2010-09-09 08:30:05', '2010-10-07 10:15:58', '11107-00104'),
(38, 'Sanchez', 'Jess Claire', 'R', 'Department of Math, Physics and Computer Science (DMPCS)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '293-0312', '0919xx', 'xxx', '4', '2010-09-09 08:31:06', '2010-10-07 10:18:05', '11107-00137'),
(39, 'Tecson', 'Rianell', 'B', 'Department of Math, Physics and Computer Science (DMPCS)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '293-0312', '0919xx', 'leonoir_alfie@yahoo.com', '4', '2010-09-09 08:32:21', '2010-10-07 10:12:08', '11107-00139'),
(40, 'Namocatcat', 'Ligaya Rose', 'A', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0920-604-9015', 'ligaya_rose@yahoo.com', '4', '2010-09-09 08:35:14', '2010-10-01 15:46:04', '11107-00050'),
(41, 'Moran', 'Antonio', 'G', 'Department of Social Science (DSS)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084; 293-1627', '0915-461-1243', 'agmoran@yahoo.com', '4', '2010-09-09 08:37:24', '2010-10-07 12:02:34', '11107-00012'),
(42, 'Taya', 'Reine Kathryn ', 'D', 'Department of Social Science (DSS)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0918-512-4496', 'rein.kat.79@gmail.com', '4', '2010-09-09 08:39:13', '2010-10-01 15:53:57', '11107-00070'),
(43, 'Ayson', 'Evelina', 'E', 'Department of Social Science (DSS)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919-205-5070; 09195778997', 'ayson_eve@yahoo.com', '4', '2010-09-09 08:41:19', '2010-10-07 11:31:12', '11107-00014'),
(44, 'Clamonte Jr', 'Valeriano', 'A', 'Department of Social Science (DSS)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919xx', 'vclamonte@gmail.com', '4', '2010-09-09 08:42:56', '2010-10-07 10:08:30', '11107-00103'),
(45, 'Pavo', 'Raymundo', 'R', 'Department of Social Science (DSS)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919xx', 'rpavo77@yahoo.com', '4', '2010-09-09 08:44:25', '2010-10-01 15:50:41', '11107-00134'),
(46, 'Paluga', 'Myfel Joseph', 'D', 'Department of Social Science (DSS)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0920-575-2077', 'myfeljoseph@yahoo.com', '4', '2010-09-09 08:45:37', '2010-10-07 13:34:15', '11107-00018'),
(47, 'Bengan', 'John', 'Barrera', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0920-293-0633', 'john_bengan@yahoo.com', '4', '2010-09-09 08:47:24', '2010-09-30 15:09:09', '11107-00106'),
(48, 'Europa', 'Sheila Grace', 'Bulaong', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0917-702-8010', 'sheilaeuropa@gmail.com', '4', '2010-09-09 08:48:35', '2010-11-10 09:27:25', '11107-00114'),
(49, 'Cayamanda', 'Karen Joyce', 'G', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0917-705-5185', 'karenjc_upmin@yahoo.com', '4', '2010-09-09 08:49:55', '2010-10-07 11:35:16', '11107-00026'),
(50, 'Cruz', 'Jhoanna Lynn', 'B', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919xx', 'jhoanalynn_cruz@yahoo.com', '4', '2010-09-09 08:52:34', '2010-09-30 15:16:42', '11107-00116'),
(51, 'De Ungria', 'Ricardo', 'M', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0917-705-5023', 'rdeungria@hotmail.com', '4', '2010-09-09 08:55:32', '2010-09-30 15:19:54', '11107-00011'),
(52, 'De Veyra', 'Antonino Salvador', 'S', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919xx', 'info@ninosoriadeveyra.com', '4', '2010-09-09 08:56:33', '2010-09-30 15:23:30', '11107-00006'),
(53, 'Dy', 'Jean Claire', 'A', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0920-405-4917', 'jeanclairedy@yahoo.com', '4', '2010-09-09 09:03:01', '2010-09-30 15:10:58', '11107-00119'),
(55, 'Eligio', 'Anna Marie Jennifer', 'E', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919xx', 'jeni_eligio@yahoo.com', '4', '2010-09-09 09:05:25', '2010-10-01 15:41:42', '11107-00120'),
(56, 'Escano', 'Maria Teresa', 'R', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '2930084', '0919xx', 'xxx', '4', '2010-09-09 09:06:41', '2010-09-30 15:24:46', '11107-00121'),
(57, 'Juanga', 'Jean Marie', 'V', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0929-773-9557', 'jeanmarieph@yahoo.com; jeanmariejuanga@yahoo.', '4', '2010-09-09 09:12:40', '2010-10-01 15:43:28', '11107-00123'),
(58, 'Lee', 'Maria Araceli', 'Dans', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0916-546-7837', 'madderlee@yahoo.com', '4', '2010-09-09 09:14:15', '2010-10-01 15:44:13', '11107-00126'),
(59, 'Malaque III', 'Isidoro', 'R', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0921-216-1886', 'junmalax@yahoo.com; irmalaque@yahoo.com', '4', '2010-09-09 09:16:25', '2010-10-01 15:44:43', '11107-00002'),
(60, 'Montes', 'Timothy', 'R', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919-825-6851', 'tim_montes@yahoo.com', '4', '2010-09-09 09:18:05', '2010-10-01 15:45:11', '11107-00083'),
(61, 'Muncada', 'Isaac', 'T', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919xx', 'xxx', '4', '2010-09-09 09:18:53', '2010-10-01 15:45:32', '11107-00129'),
(62, 'Europa', 'Ericson', 'P', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0917-704-0994', 'ericsoneuropa@yahoo.com', '4', '2010-09-09 09:20:38', '2010-10-01 15:46:26', '11107-00008'),
(63, 'Quintero', 'Genevieve', 'J', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0920-623-0407', 'genjorolan@yahoo.com', '4', '2010-09-09 09:22:07', '2010-10-07 13:36:41', '11107-00023'),
(64, 'Quiz', 'Julius', 'T', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919-305-1328', 'kibz1432@yahoo.com', '4', '2010-09-09 09:23:27', '2010-10-01 15:52:18', '11107-00136'),
(65, 'Sumaylo', 'Dennis John', 'F', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919-562-0289', 'email_ni_dennis@yahoo.com', '4', '2010-09-09 09:24:35', '2010-10-07 13:44:26', '11107-00007'),
(66, 'Baldo ', 'Rosil', 'R', 'Department of Human Kinetics (DHK)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919xx', 'xxx', '4', '2010-09-09 09:25:29', '2010-09-30 15:18:05', '11107-00113'),
(67, 'Protacio', 'Erwin', 'S', 'Department of Human Kinetics (DHK)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0917-434-5114', 'eeprotacio@yahoo.com', '4', '2010-09-09 09:28:08', '2010-10-01 15:51:02', '11107-00088'),
(68, 'Salazar', 'Armando', 'R', 'Department of Human Kinetics (DHK)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919-876-8468', 'ten_g97@yahoo.com', '4', '2010-09-09 09:29:27', '2010-10-07 13:40:12', '11107-00073'),
(69, 'Salazar', 'Maria Stella', 'R', 'Department of Human Kinetics (DHK)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0918-918-4934', 'msrs2nd@yahoo.com', '4', '2010-09-09 09:30:40', '2010-10-07 13:39:38', '11107-00096'),
(70, 'Concepcion', 'Sylvia ', 'B', 'School of Management,\r\nUniversity of the Philippines Mindanao\r\nTerraza Milesa Bldg., F. Inigo St., Davao City\r\n', '2270750; 2225304', '0917-701-2737', 'sbconcepcion@yahoo.com', '4', '2010-09-09 09:32:08', '2010-10-05 14:18:33', '11107-00080'),
(71, 'Digal', 'Larry', 'N', 'School of Management,\r\nUniversity of the Philippines Mindanao\r\nTerraza Milesa Bldg., F. Inigo St., Davao City\r\n', '227-0750; 293-1839', '0917-705-4613', 'larryd927@yahoo.com', '4', '2010-09-09 09:34:24', '2010-10-07 11:45:19', '11107-00016'),
(72, 'Ellson', 'Adela', 'G', 'School of Management (SOM)\r\nUniversity of the Philippines Mindanao \r\nAnda St., Davao City \r\n', '2270750', '0915-787-1207', 'agellson@yahoo.com', '4', '2010-09-09 09:35:45', '2010-10-07 11:46:24', '11107-00021'),
(73, 'Gomez', 'Aurelia Luzviminda ', 'V', 'School of Management (SOM)\r\nUniversity of the Philippines Mindanao \r\nAnda St., Davao City \r\n', '227-0750', '0917-704-3506', 'twin9512@yahoo.com; alvgomez@upmin.edu.ph', '4', '2010-09-09 09:37:21', '2010-10-07 11:52:20', '11107-00020'),
(74, 'Hualda', 'Luis Antonio', 'T', 'School of Management,\r\nUniversity of the Philippines Mindanao\r\nTerraza Milesa Bldg., F. Inigo St., Davao City\r\n', '227-0750', '0921-741-7979', 'luishualda@upmin.edu.ph', '4', '2010-09-09 09:38:23', '2010-10-05 14:16:05', '11107-00052'),
(75, 'Montiflor', 'Marilou', 'O', 'School of Management,\r\nUniversity of the Philippines Mindanao\r\nTerraza Milesa Bldg., F. Inigo St., Davao City\r\n', '227-0750', '0917-342-6674', 'mmontiflor@yahoo.com; mmontiflor@upmin.edu.ph', '4', '2010-09-09 09:39:24', '2010-10-05 14:15:43', '11107-00060'),
(76, 'Romo', 'Glory Dee', 'A', 'School of Management,\r\nUniversity of the Philippines Mindanao\r\nTerraza Milesa Bldg., F. Inigo St., Davao City\r\n', '227-0750', '0919-326-2785', 'glory_dee_romo@yahoo.com', '4', '2010-09-09 09:40:32', '2010-10-05 14:21:19', '11107-00099'),
(77, 'Rubas', 'Ligaya', 'C', 'School of Management,\r\nUniversity of the Philippines Mindanao\r\nTerraza Milesa Bldg., F. Inigo St., Davao City\r\n', '227-0750', '0919xx', 'gayrubas@yahoo.com', '4', '2010-09-09 09:41:26', '2010-10-07 13:38:49', '11107-00015'),
(78, 'Shuck', 'Vlademir', 'A', 'School of Management,\r\nUniversity of the Philippines Mindanao\r\nTerraza Milesa Bldg., F. Inigo St., Davao City\r\n', '227-0750', '0920-776-1031', 'shuck_vlademir@yahoo.com', '4', '2010-09-09 09:42:46', '2010-10-05 14:25:27', '11107-00138'),
(79, 'Soledad', 'Miguel', 'D', 'School of Management,\r\nUniversity of the Philippines Mindanao\r\nTerraza Milesa Bldg., F. Inigo St., Davao City\r\n', '227-0750', '0920-947-6098', 'msoledad@gmail.com', '4', '2010-09-09 09:43:51', '2010-10-07 13:42:13', '11107-00025'),
(80, 'Cabazares', 'Janus Ruel', 'T', 'Department of Social Science (DSS)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919xx', 'xxx', '4', '2010-09-09 09:45:35', '2010-09-30 15:13:18', '11107-00141'),
(81, 'Fuentes', 'Anne Shangrila', 'Y', 'Department of Social Science (DSS)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919xx', 'xxx', '4', '2010-09-09 09:47:15', '2010-10-07 11:50:47', '11107-00047'),
(82, 'Largo', 'Arlene', 'C', 'Department of Social Science (DSS)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919xx', 'ara.largo@gmail.com', '4', '2010-09-09 09:55:33', '2010-10-07 11:58:13', '11107-00125'),
(83, 'Abrio', 'Doyle Felix', 'T', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919xx', 'xxx', '4', '2010-09-09 09:59:54', '2010-09-30 15:03:33', '11107-00144'),
(84, 'Alderite', 'Rona Joy', 'D', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919xx', 'xxx', '4', '2010-09-09 10:00:43', '2010-09-30 15:07:46', '11107-00145'),
(85, 'Baldonado', 'Andrea Anne', 'S', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '293-0312', '0919xx', 'xxx', '4', '2010-09-09 10:01:38', '2010-09-30 15:18:36', '11107-00146'),
(86, 'Isip', 'Elaine Mars', 'G', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919xx', 'xxx', '4', '2010-09-09 10:03:18', '2010-10-01 15:43:06', '11107-00147'),
(87, 'Nabayra', 'Emmanuel', 'S', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919xx', 'xxx', '4', '2010-09-09 10:04:35', '2010-10-01 15:47:02', '11107-00148'),
(88, 'Perez', 'Teody Boylie', 'R', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919xx', 'xxx', '4', '2010-09-09 10:05:51', '2010-10-07 13:35:40', '11107-00135'),
(89, 'Sandoval', 'Lysette Maurice', 'N', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919xx', 'xxx', '4', '2010-09-09 10:06:55', '2010-10-07 13:40:57', '11107-00149'),
(90, 'Dorado', 'Ellen Noemi', 'T', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919xx', 'xxx', '4', '2010-09-09 10:08:18', '2010-09-30 15:24:18', '11107-00118'),
(91, 'Narvaez', 'Nory Loyd ', 'P', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919xx', 'xxx', '4', '2010-09-09 10:09:42', '2010-10-07 13:27:09', '11107-00150'),
(92, 'Songcayauon ', 'Ryan', 'C', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919xx', 'xxx', '4', '2010-09-09 10:10:34', '2010-10-07 13:42:42', '11107-00151'),
(93, 'Palomaria', 'Redner', 'D', 'Department of Human Kinetics (DHK)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '2930084', '0919xx', 'xxx', '4', '2010-09-09 10:11:50', '2010-10-07 13:33:26', '11107-00152'),
(94, 'Hearne', 'Verna Marie', 'M', 'Department of Biological Science and Environmental Studies (DBSES)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0919xx', 'xxx', '4', '2010-09-09 10:13:37', '2010-10-07 11:53:26', '11107-00143'),
(95, 'Mantiquilla', 'Junaldo ', 'A', 'Department of Biological Science and Environmental Studies (DBSES)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0917-007-7483', 'junaldo2003@yahoo.com', '4', '2010-09-09 10:17:16', '2010-10-07 12:00:29', '11107-00153'),
(96, 'Dacera', 'Dominica', 'del Mundo', 'Department of Food Science and Chemistry (DFSC)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0919xx', 'xxx', '4', '2010-09-09 10:19:48', '2010-10-07 11:37:16', '11107-00154'),
(97, 'Fale', 'Irynn Carole', 'C', 'Department of Food Science and Chemistry (DFSC)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0922-852-7787; 0929-596- 5378', 'irynn_2715@yahoo.com', '4', '2010-09-09 10:23:00', '2010-10-07 11:47:10', '11107-00155'),
(98, 'Imada', 'Masaru', '-', 'Department of Food Science and Chemistry (DFSC)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '293-0312', '0919xx', 'xxx', '4', '2010-09-09 10:24:08', '2010-10-07 11:54:49', '11107-00156'),
(99, 'Speckmaier', 'Dietmar', '-', 'Department of Food Science and Chemistry (DFSC)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '293-0312', '0919xx', 'xxx', '4', '2010-09-09 10:25:42', '2010-10-07 13:43:48', '11107-00157'),
(100, 'Tocmo', 'Restituto', 'T', 'Department of Food Science and Chemistry (DFSC)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '293-0312', '0919xx', 'xxx', '4', '2010-09-09 10:26:42', '2010-10-07 13:45:34', '11107-00140'),
(101, 'Idoy Jr', 'Ruben', 'A', 'Department of Math, Physics and Computer Science (DMPCS)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '293-0312', '0919xx', 'xxx', '4', '2010-09-09 10:28:42', '2010-10-07 11:54:03', '11107-00159'),
(102, 'Blasing', 'Cielo Fe', 'C', 'Department of Math, Physics and Computer Science (DMPCS)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '293-0312', '0919xx', 'xxx', '4', '2010-09-09 10:29:22', '2010-10-07 11:33:33', '11107-00158'),
(103, 'Labayan', 'Luchie Marie', 'A', 'Department of Math, Physics and Computer Science (DMPCS)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0919xx', 'xxx', '4', '2010-09-09 10:30:55', '2010-10-07 11:56:04', '11107-00160'),
(104, 'Mesa', 'Armacheska', 'R', 'Department of Math, Physics and Computer Science (DMPCS)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '293-0312', '0919xx', 'xxx', '4', '2010-09-09 10:32:01', '2010-10-07 12:01:10', '11107-00161'),
(105, 'Real', 'Rommel', 'R', 'Department of Math, Physics and Computer Science (DMPCS)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '293-0312', '0919xx', 'xxx', '4', '2010-09-09 10:33:51', '2010-10-07 13:37:39', '11107-00162'),
(106, 'Amorado', 'Ronald', 'V', 'School of Management,\r\nUniversity of the Philippines Mindanao\r\nTerraza Milesa Bldg., F. Inigo St., Davao City\r\n', '227-0750', '0919xx', 'xxx', '4', '2010-09-09 10:35:08', '2010-10-07 11:30:11', '11107-00164'),
(107, 'Bagadion', 'Benjamin', 'C', 'School of Management,\r\nUniversity of the Philippines Mindanao\r\nTerraza Milesa Bldg., F. Inigo St., Davao City\r\n', '227-0750', '0919xx', 'xxx', '4', '2010-09-09 10:35:48', '2010-10-07 11:28:45', '11107-00165'),
(108, 'Dalacaño', 'Jimmy', 'R', 'School of Management,\r\nUniversity of the Philippines Mindanao\r\nTerraza Milesa Bldg., F. Inigo St., Davao City\r\n', '227-0750', '0919xx', 'xxx', '4', '2010-09-09 10:36:46', '2010-10-07 11:38:10', '11107-00166'),
(109, 'Laorden', 'Nikko', 'L', 'School of Management,\r\nUniversity of the Philippines Mindanao\r\nTerraza Milesa Bldg., F. Inigo St., Davao City\r\n', '227-0750', '0921-227-62-22', 'n.laorden@yahoo.com', '4', '2010-09-09 10:37:40', '2010-10-07 11:56:37', '11107-00167'),
(110, 'Ongkingco', 'Gerado', 'IB', 'School of Management,\r\nUniversity of the Philippines Mindanao\r\nTerraza Milesa Bldg., F. Inigo St., Davao City\r\n', '227-0750', '0919xx', 'xxx', '4', '2010-09-09 10:39:16', '2010-10-07 13:30:10', '11107-00168'),
(111, 'Pabularcon', 'Liza', 'N', 'School of Management,\r\nUniversity of the Philippines Mindanao\r\nTerraza Milesa Bldg., F. Inigo St., Davao City\r\n', '227-0750', '0919xx', 'xxx', '4', '2010-09-09 10:39:58', '2010-10-07 13:33:02', '11107-00169'),
(112, 'Pampanga', 'Dario', 'G', 'School of Management,\r\nUniversity of the Philippines Mindanao\r\nTerraza Milesa Bldg., F. Inigo St., Davao City\r\n', '227-0750', '0919xx', 'dpampanga@yahoo.com', '4', '2010-09-09 10:40:36', '2010-10-07 13:34:41', '11107-00170'),
(113, 'Sarmiento ', 'Jon Marx', 'P', 'School of Management,\r\nUniversity of the Philippines Mindanao\r\nTerraza Milesa Bldg., F. Inigo St., Davao City\r\n', '227-0750', '0919xx', 'marx_jon@yahoo.com', '4', '2010-09-09 10:41:45', '2010-10-07 13:41:23', '11107-00171'),
(114, 'Soriaga', 'Harold', 'L', 'School of Management,\r\nUniversity of the Philippines Mindanao\r\nTerraza Milesa Bldg., F. Inigo St., Davao City\r\n', '227-0750', '0919xx', 'xxx', '4', '2010-09-09 10:42:30', '2010-10-07 13:43:19', '11107-00163'),
(115, 'Acaso', 'Joan', 'T', 'Department of Biological Science and Environmental Studies (DBSES)\r\nCollege of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City\r\n', '293-0312', '0939-542-0928', 'jatacaso@yahoo.com', '4', '2010-09-09 10:46:18', '2010-10-07 11:27:48', '11107-00112'),
(116, 'Aguinaldo', 'Roxanne', 'T', 'School of Management,\r\nUniversity of the Philippines Mindanao\r\nTerraza Milesa Bldg., F. Inigo St., Davao City\r\n', '227-0750', '0939-136-4529', 'roxaguinaldo@gmail.com', '4', '2010-09-09 10:47:36', '2010-10-07 11:28:25', '11107-00172'),
(117, 'De Leon', 'Marian Gabriela', 'O', 'College of Humanities and Social Sciences (CHSS)\r\nMintal, Tugbok Distict, Davao City', '293-0084', '09167057383', 'elladeleon.85@gmail.com', '4', '2010-09-30 15:02:17', '2010-10-07 11:44:04', '11107-00173'),
(118, 'Varquez Jr', 'Jessie', 'G.', 'Department of Social Science (DSS)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '2930084', '0928-552-6277', 'jesievarquezjr@gmail.com', '4', '2010-10-07 10:26:22', '2010-10-07 13:46:29', '11107-00142'),
(119, 'Guillen', 'Teresita ', 'V.', 'Department of Social Science (DSS)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nMintal, Tugbok District, Davao City ', '(082) 293-0084', '(082) 293-0084', 'xxx', '', '2010-10-07 13:49:20', '2010-10-07 13:49:20', '11107-00003'),
(120, 'Trinidad', 'Anna Raissa', 'T', 'Department of Social Science (DSS)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nMintal, Tugbok District, Davao City ', '(082) 293-0084', '(082) 293-0084', 'xxx', '', '2010-10-07 13:51:49', '2010-10-07 13:51:49', '11107-00004'),
(121, 'Campado', 'Andrea', 'V.', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nMintal, Tugbok District, Davao City ', '(082) 293-0084', '(082) 293-0084', 'xxx', '', '2010-10-07 13:54:16', '2010-10-07 13:54:16', '11107-00009'),
(122, 'Delgado', 'Rowena', 'S', 'Department of Humanities (DH)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nMintal, Tugbok District, Davao City', '(082) 293-0084', '(082) 293-0084', 'xxx', '', '2010-10-07 13:56:15', '2010-10-07 13:56:15', '11107-00013'),
(123, 'Villaverde', 'Anabella', 'D', 'School of Management (SOM)\r\nDavao City', '(082) 227-0750', '(082) 227-0750', 'xxx', '4', '2010-10-07 13:59:50', '2010-10-07 15:28:10', '11107-00017'),
(124, 'Nolasco', 'Ma Ricardo', 'N', 'Department of Social Science (DSS)\r\nCollege of Humanities and Social Sciences (CHSS)\r\nMintal, Tugbok District, Davao City', '(082) 293-0084', '(082) 293-0084', 'xxx', '', '2010-10-07 14:02:03', '2010-10-07 14:02:03', '11107-00019'),
(125, 'Alabado III', 'Roberto', 'R', 'School of Management (SOM)\r\nUniversity of the Philippines Mindanao\r\nMintal, Tugbok District, Davao City', '(082) 227-0750', '(082) 227-0750', 'xxx', '', '2010-10-07 14:07:26', '2010-10-07 14:07:26', '11107-00022'),
(126, 'Mangahas', 'xxx', 'x', 'College of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao\r\nMintal, Tugbok District, Davao City ', '(082) 293-0084', '0919xx', 'xxx', '', '2010-10-07 14:18:19', '2010-10-07 14:18:19', '11107-00024'),
(127, 'Gumagda', 'Edeline ', 'P', 'School of Management (SOM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '(082) 227-0750', '0919xx', 'xxx', '', '2010-10-07 14:20:07', '2010-10-07 14:20:07', '11107-00027'),
(128, 'Sorupia', 'Eden', 'T', 'Department of Humanities (DH)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '(082) 293-0084', '0919xx', 'xxx', '', '2010-10-07 14:22:09', '2010-10-07 14:22:09', '11107-00029'),
(129, 'Zamora', 'Elmar', 'U', 'Department of Biological Science and Environmental Studies (DBSES)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City ', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 15:30:50', '2010-10-07 15:30:50', '11107-00030'),
(130, 'Cruz-Soriano', ' Ana Marie', 'S', 'Department of Math, Physics and Computer Science (DMPCS)\r\nUniversity of the Philippines Mindanao\r\nMintal, Tugbok District, Davao City ', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 15:33:05', '2010-10-07 15:33:05', '11107-00031'),
(131, 'Caraballe ', 'Ferdinand ', 'F', 'School of Management (SOM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '(082) 227-0750', '0919xx', 'xxx', '', '2010-10-07 15:35:23', '2010-10-07 15:35:23', '11107-00032'),
(132, 'Siatong', 'Bruno Antonio', 'C', 'College of Science and Mathematicsw (CSM)\r\nMintal, Tugbok District, Davao City', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 15:37:42', '2010-10-07 15:37:42', '11107-00034'),
(133, 'Camarao', 'Gloria', 'C', 'College of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 15:39:12', '2010-10-07 15:39:12', '11107-00036'),
(134, 'Silva', 'Grashiella Pia', 'S', 'Department of Food Science and Chemistry (DFSC)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 15:41:08', '2010-10-07 15:41:08', '11107-00037'),
(135, 'Miranda', 'Hector ', 'C', 'Department of Biological Science and Environmental Studies (DBSES)\r\nUniversity of the Philippines Mindanao\r\nMintal, Tugbok District, Davao City', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 15:42:40', '2010-10-07 15:42:40', '11107-00038'),
(136, 'Guazon', 'x', 'x', 'xx', 'x', '0919xx', 'xxx', '', '2010-10-07 15:43:40', '2010-10-07 15:43:40', '11107-00039'),
(137, 'Gloria', 'Heidi', 'K', 'College of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '(082) 293-0084', '0919xx', 'xxx', '', '2010-10-07 15:45:37', '2010-10-07 15:45:37', '11107-00040'),
(138, 'Ibañez', 'Jayson', 'C', 'College of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao\r\nMintal, Tugbok District, Davao City', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 15:47:03', '2010-10-07 15:47:03', '11107-00041'),
(139, 'Colcol', 'Jeneylene', 'F', 'College of Science and mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '(082) 293-0312', '0919xx', 'xxx', '4', '2010-10-07 15:49:41', '2010-10-07 15:50:28', '11107-00042'),
(140, 'Miro', 'John Vincent ', 'Q', 'College of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City ', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 15:52:12', '2010-10-07 15:52:12', '11107-00044'),
(141, 'Canuday', 'Jose Jowel', 'F', 'College of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City ', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 15:53:49', '2010-10-07 15:53:49', '11107-00045'),
(142, 'Delos Santos ', 'xxx', 'x', 'College of Science and mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, TYugbok District, Davao City', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 15:56:01', '2010-10-07 15:56:01', '11107-00049'),
(143, 'Dela Peña', 'Lilian ', 'C', 'College of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao\r\nMintal, Tugbok District, Davao City\r\n', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 15:57:35', '2010-10-07 15:57:35', '11107-00051'),
(144, 'Rallos', 'Lynn Esther ', 'E', 'College of Science and mathematics (CSM)\r\nUniversity of the Philippines Mindanao\r\nMintal, Tugbok District, Davao City ', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 15:59:39', '2010-10-07 15:59:39', '11107-00053'),
(145, 'Onato', 'Lynn', 'D', 'College of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao\r\nMintal, Tugbok District, Davao City ', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 16:01:16', '2010-10-07 16:01:16', '11107-00054'),
(146, 'Espada', 'Lyre Ann ', 'T', 'College of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City ', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 16:02:33', '2010-10-07 16:02:33', '11107-00055'),
(147, 'Petilla', 'Ma. Josefa ', 'T', 'College of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City ', '(082) 293-0084', '0919xx', 'xxx', '', '2010-10-07 16:03:44', '2010-10-07 16:03:44', '11107-00056'),
(148, 'Javier ', 'Manuel ', 'L', 'School of Management (SOM)\r\nUniversity of the Philippines Mindanao \r\nMintal, TYugbok District, Davao City ', '(082) 227-0750', '0919xx', 'xxx', '', '2010-10-07 16:04:59', '2010-10-07 16:04:59', '11107-00057'),
(149, 'Patiño', 'Maricel Paz', 'H', 'College of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City ', '(082) 293-0084', '0919xx', 'xxx', '', '2010-10-07 16:06:46', '2010-10-07 16:06:46', '11107-00058'),
(150, 'Saclot', 'Maureen Joyce ', 'S', 'College of Humanities and Social Sciences (CHSS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City ', '(082) 293-0084', '0919xx', 'xxx', '', '2010-10-07 16:08:34', '2010-10-07 16:08:34', '11107-00061'),
(151, 'Mendoza', 'Michelle ', 'S', 'College of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 16:10:02', '2010-10-07 16:10:02', '11107-00062'),
(152, 'Lopez', 'Mitchiko', 'A', 'Office of Research (OR)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City ', '(082) 293-1839', '0919209529274', 'tsiking_75@yahoo.com', '', '2010-10-07 16:12:04', '2010-10-07 16:12:04', '11107-00065'),
(153, 'Navarrete', 'Norberto ', 'N', 'Department of Math, Physics and Computer Science (DMPCS)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City ', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 16:13:40', '2010-10-07 16:13:40', '11107-00067'),
(154, 'Margate ', 'Raul', 'E', 'Department of Biological Science and Environmental Studies (DBSES)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City ', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 16:14:58', '2010-10-07 16:14:58', '11107-00069'),
(155, 'Campos ', 'Annalie ', 'L', 'School of Management (SOM)\r\nUniversity of the Philippines Mindnao \r\nDavao City', '(082) 227-0750', '0919xx', 'xxx', '', '2010-10-07 16:16:18', '2010-10-07 16:16:18', '11107-00072'),
(156, 'Cuba', 'Rodolfo', 'N', 'School of Management (SOM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '(082) 227-0750', '0919xx', 'xxx', '', '2010-10-07 16:17:37', '2010-10-07 16:17:37', '11107-00074'),
(157, 'Carcallas ', 'Ronell Joey', 'U', 'Department of Biological Science and Environmental Studies (DBSES)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 16:19:08', '2010-10-07 16:19:08', '11107-00075'),
(158, 'Padilla Jr.', 'Sabino', 'G', 'Department Of Humanities (DH)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City ', '(082) 293-0084', '0919xx', 'xxx', '', '2010-10-07 16:21:16', '2010-10-07 16:21:16', '11107-00078'),
(159, 'Sinco', 'Teofila ', 'A', 'School of Management (SOM)\r\nUniversity of the Philippines Mindanao \r\nDavao City ', '(082) 227-0750', '0919xx', 'xxx', '', '2010-10-07 16:22:46', '2010-10-07 16:22:46', '11107-00081'),
(160, 'Duran', 'Veronica', 'A', 'Department of Biological Science and Environmental Studies (DBSES)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City ', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 16:25:36', '2010-10-07 16:25:36', '11107-00084'),
(161, 'Tabadda', 'Xavier ', 'A', 'College of Science and mathematics (CSM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 16:27:04', '2010-10-07 16:27:04', '11107-00087'),
(162, 'Costales ', 'Cecelio ', 'P', 'School of Management (SOM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City ', '(082) 227-0750', '0919xx', 'xxx', '', '2010-10-07 16:28:23', '2010-10-07 16:28:23', '11107-00089'),
(163, 'Esparcia ', 'Janis Louis', 'H', 'College of Humanities and Social Sciences (CHSS) \r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City ', '(082) 293-0084', '0919xx', 'janislouis@yahoo.com', '', '2010-10-07 16:31:42', '2010-10-07 16:31:42', '11107-00091'),
(164, 'Belida', 'Joseph', 'T', 'xxx', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 16:32:24', '2010-10-07 16:32:24', '11107-00092'),
(165, 'Siarot', 'Lowela', 'X', 'College of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao\r\nMintal, Tugbok District, Davao City ', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 16:33:36', '2010-10-07 16:33:36', '11107-00093'),
(166, 'Elcana', 'Ma. Elena ', 'G', 'xxx', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 16:34:49', '2010-10-07 16:34:49', '11107-00095'),
(167, 'Agdeppa', 'xx', 'x', 'xx', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 16:36:29', '2010-10-07 16:36:29', '11107-00105'),
(168, 'Maquilan', 'Mary Ann', 'D', 'School of Management (SOM)\r\nUniversity of the Philippines Mindanao\r\nMintal, Tugbok District, Davao City', '(082) 227-0750', '0919xx', 'xxx', '', '2010-10-07 16:38:19', '2010-10-07 16:38:19', '11107-00107'),
(169, 'Migalbin', 'Loriene', 'R', 'School of Management (SOM)\r\nUniversity of the Philippines Mindanao \r\nMintal, Tugbok District, Davao City ', '(082) 227-0750', '0919xx', 'xxx', '', '2010-10-07 16:40:02', '2010-10-07 16:40:02', '11107-00108'),
(170, 'Natural ', 'Nelson ', 'G', 'College of Science and Mathematics (CSM)\r\nUniversity of the Philippines Mindanao\r\nMintal, Tugbok District, Davao City ', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 16:41:10', '2010-10-07 16:41:10', '11107-00109'),
(171, 'Freries ', 'Tiffany', 'S', 'xxx', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 16:41:59', '2010-10-07 16:41:59', '11107-00110'),
(172, 'Ramos ', 'Agustin Antonio ', 'T', 'Department of Food Science and Chemistry (DFSC)\r\nUniversity of the Philippines Mindanao\r\nMintal, Tugbok District, Davao City', '(082) 293-0312', '0919xx', 'xxx', '', '2010-10-07 16:43:32', '2010-10-07 16:43:32', '11107-00111');

-- --------------------------------------------------------

--
-- Table structure for table `fund`
--

CREATE TABLE IF NOT EXISTS `fund` (
  `fundID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fundName` varchar(200) NOT NULL,
  `fundAgencyID` int(10) unsigned NOT NULL,
  `amount` float(10,2) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateCreated` date NOT NULL,
  `dateReceived` date NOT NULL,
  `remarks` text NOT NULL,
  PRIMARY KEY (`fundID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `fund`
--

INSERT INTO `fund` (`fundID`, `fundName`, `fundAgencyID`, `amount`, `userID`, `lastUpdate`, `dateCreated`, `dateReceived`, `remarks`) VALUES
(3, 'ASDFASF', 4, 2343.00, 1, '2010-08-05 11:16:43', '2010-08-05', '2010-08-05', 'ASDFASFASDF'),
(4, 'ASFDASF', 4, 3432.00, 1, '2010-08-05 11:16:59', '2010-08-05', '2010-08-03', 'ASDFAS');

-- --------------------------------------------------------

--
-- Table structure for table `fundagency`
--

CREATE TABLE IF NOT EXISTS `fundagency` (
  `fundAgencyID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agencyName` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `telephone` varchar(45) NOT NULL,
  `mobilePhone` varchar(45) NOT NULL,
  `contactPerson` varchar(200) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateCreated` date NOT NULL,
  `position` varchar(45) NOT NULL,
  PRIMARY KEY (`fundAgencyID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `fundagency`
--

INSERT INTO `fundagency` (`fundAgencyID`, `agencyName`, `address`, `email`, `website`, `telephone`, `mobilePhone`, `contactPerson`, `userID`, `lastUpdate`, `dateCreated`, `position`) VALUES
(1, 'dasfasf', 'asdfasfasdf', 'asdf', 'asdfas', 'asdf', 'asdf', 'asdf', 1, '2010-08-05 09:37:27', '2010-08-04', 'asdfa'),
(4, 'dhone', 'Davao City', 'asdf', 'asdfaf', 'asdf', 'asdfa', 'ronald barriga', 1, '2010-08-05 09:38:24', '2010-08-04', 'manager');

-- --------------------------------------------------------

--
-- Table structure for table `fundtype`
--

CREATE TABLE IF NOT EXISTS `fundtype` (
  `fundTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fundTypeName` varchar(60) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateCreated` date NOT NULL,
  PRIMARY KEY (`fundTypeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `fundtype`
--

INSERT INTO `fundtype` (`fundTypeID`, `fundTypeName`, `userID`, `lastUpdate`, `dateCreated`) VALUES
(2, 'Local', 1, '2010-08-04 11:59:35', '2010-08-04'),
(3, 'UP System', 1, '2010-08-04 13:25:56', '2010-08-04'),
(4, 'National ', 4, '2010-09-22 17:03:19', '2010-08-04'),
(5, 'International', 4, '2010-09-22 17:03:34', '2010-08-04'),
(6, 'Government ', 1, '2011-09-19 09:41:41', '2010-09-22'),
(7, 'Private', 4, '2010-09-22 17:04:23', '2010-09-22'),
(8, 'Institutional (UP Mindnao)', 4, '2010-09-22 17:04:47', '2010-09-22');

-- --------------------------------------------------------

--
-- Table structure for table `progattachment`
--

CREATE TABLE IF NOT EXISTS `progattachment` (
  `progAttachID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileName` varchar(100) NOT NULL,
  `fileType` varchar(100) NOT NULL,
  `progReportID` int(10) unsigned NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateCreated` date NOT NULL,
  PRIMARY KEY (`progAttachID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `progattachment`
--


-- --------------------------------------------------------

--
-- Table structure for table `progreport`
--

CREATE TABLE IF NOT EXISTS `progreport` (
  `progReportID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projectID` int(10) unsigned NOT NULL,
  `datePosted` date NOT NULL,
  `reportSummary` text NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateCreated` date NOT NULL,
  PRIMARY KEY (`progReportID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `progreport`
--


-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `projectID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projectName` varchar(100) NOT NULL,
  `fundID` int(10) unsigned NOT NULL,
  `budget` float(10,2) NOT NULL,
  `collegeCode` varchar(15) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `projStatusID` int(10) unsigned NOT NULL DEFAULT '1',
  `remarks` varchar(200) NOT NULL,
  `dateCreated` date NOT NULL,
  `projTypeID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`projectID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`projectID`, `projectName`, `fundID`, `budget`, `collegeCode`, `startDate`, `endDate`, `userID`, `lastUpdate`, `projStatusID`, `remarks`, `dateCreated`, `projTypeID`) VALUES
(2, 'dhone barriga', 3, 3324.00, 'CSM', '2010-08-05', '2010-10-29', 1, '2010-08-05 15:26:52', 3, 'asfasfasfasdf', '2010-08-05', 3),
(4, 'dhone', 3, 34343.00, 'CSM', '2010-08-05', '2010-08-05', 1, '2010-08-05 15:00:09', 6, 'asfasdfasdfa', '2010-08-05', 3),
(5, 'Ronald A. Barriga', 3, 23424.00, 'CSM', '2010-08-05', '2010-08-05', 1, '2010-08-05 15:22:13', 3, 'asdl;fkjas;fk', '2010-08-05', 3),
(7, 'mai', 3, 3324.00, 'CSM', '2010-08-05', '2010-10-29', 1, '2010-08-05 15:22:41', 3, 'asfasfasfasdf', '2010-08-05', 3);

-- --------------------------------------------------------

--
-- Table structure for table `projecttype`
--

CREATE TABLE IF NOT EXISTS `projecttype` (
  `projTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projTypeName` varchar(100) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateCreated` date NOT NULL,
  PRIMARY KEY (`projTypeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `projecttype`
--

INSERT INTO `projecttype` (`projTypeID`, `projTypeName`, `userID`, `lastUpdate`, `dateCreated`) VALUES
(2, 'Rasco project afdasfasf', 1, '2010-08-04 10:39:54', '2010-08-04'),
(3, 'asdfsafdsaf', 1, '2010-08-05 14:40:11', '2010-08-05'),
(4, 'asdfsafd', 1, '2010-08-05 14:40:16', '2010-08-05');

-- --------------------------------------------------------

--
-- Table structure for table `projres`
--

CREATE TABLE IF NOT EXISTS `projres` (
  `projResID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `researcherID` int(10) unsigned NOT NULL,
  `projectID` int(10) unsigned NOT NULL,
  `resPosID` int(10) unsigned NOT NULL,
  `salaryType` int(10) unsigned NOT NULL,
  `salaryAmount` float(10,2) NOT NULL,
  `pstatus` int(10) unsigned NOT NULL DEFAULT '1',
  `userID` int(10) unsigned NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateCreated` date NOT NULL,
  PRIMARY KEY (`projResID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `projres`
--


-- --------------------------------------------------------

--
-- Table structure for table `projstatus`
--

CREATE TABLE IF NOT EXISTS `projstatus` (
  `projStatusID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projStatusName` varchar(45) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateCreated` date NOT NULL,
  PRIMARY KEY (`projStatusID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `projstatus`
--

INSERT INTO `projstatus` (`projStatusID`, `projStatusName`, `userID`, `lastUpdate`, `dateCreated`) VALUES
(1, 'InActve', 1, '2010-08-04 11:32:08', '2010-08-04'),
(3, 'Active', 1, '2010-08-05 11:17:43', '2010-08-05'),
(4, 'Cancelled', 1, '2010-08-05 11:17:51', '2010-08-05'),
(5, 'Insufficient of funds', 1, '2010-08-05 11:18:09', '2010-08-05'),
(6, 'Completed', 1, '2010-08-05 11:18:19', '2010-08-05'),
(7, 'Terminated', 1, '2010-08-05 11:18:27', '2010-08-05');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE IF NOT EXISTS `request` (
  `requestID` int(10) NOT NULL AUTO_INCREMENT,
  `requestName` varchar(45) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `requestOrg` varchar(45) NOT NULL,
  `requestReason` varchar(100) NOT NULL,
  `requestConStart` date NOT NULL,
  `requestConEnd` date NOT NULL,
  PRIMARY KEY (`requestID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`requestID`, `requestName`, `userID`, `requestOrg`, `requestReason`, `requestConStart`, `requestConEnd`) VALUES
(1, 'lksjdf', 101, 'lksdjaf', 'lkdsfj', '2011-09-25', '2011-09-24');

-- --------------------------------------------------------

--
-- Table structure for table `researcher`
--

CREATE TABLE IF NOT EXISTS `researcher` (
  `researcherID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idNumber` varchar(20) NOT NULL,
  `researcherName` varchar(100) NOT NULL,
  `resTypeID` int(10) unsigned NOT NULL,
  `emailAddress` varchar(100) NOT NULL,
  `collegeCode` varchar(45) NOT NULL,
  `mobilePhone` varchar(60) NOT NULL,
  `telephone` varchar(45) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateCreated` date NOT NULL,
  PRIMARY KEY (`researcherID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `researcher`
--

INSERT INTO `researcher` (`researcherID`, `idNumber`, `researcherName`, `resTypeID`, `emailAddress`, `collegeCode`, `mobilePhone`, `telephone`, `userID`, `lastUpdate`, `dateCreated`) VALUES
(1, '23234', 'asdfas', 2, 'asdfasf', 'CSM', 'asdf', 'asdfa', 1, '2010-08-02 14:21:20', '0000-00-00'),
(2, '435', 'asdf', 3, 'asdfas', 'CHSS', 'asdf', 'asdfas', 1, '2010-08-02 14:23:04', '2010-08-02'),
(9, 'sdfgsd', 'asdfasf', 2, 'asdfasf', '0', 'asdfasf', 'asdfasf', 1, '2010-08-02 14:50:10', '2010-08-02'),
(10, 'asdf', 'asfdasf', 2, 'asdfasf', 'CSM', 'asfdas', 'asfsa', 1, '2010-08-02 14:51:20', '2010-08-02'),
(11, '111111', 'asdfas', 3, 'testin testiing', 'SOM', 'asdf', 'asdfa', 1, '2010-08-02 14:55:49', '2010-08-02');

-- --------------------------------------------------------

--
-- Table structure for table `researchertype`
--

CREATE TABLE IF NOT EXISTS `researchertype` (
  `resTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resType` varchar(60) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateCreated` date NOT NULL,
  PRIMARY KEY (`resTypeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `researchertype`
--

INSERT INTO `researchertype` (`resTypeID`, `resType`, `userID`, `lastUpdate`, `dateCreated`) VALUES
(4, 'Undergraduate student', 1, '2010-08-06 10:03:28', '2010-08-06'),
(2, 'Faculty', 1, '2010-08-06 10:03:11', '2010-08-02'),
(3, 'Reps', 1, '2010-08-06 10:03:17', '2010-08-02'),
(5, 'Graduate Student', 1, '2010-08-06 10:03:36', '2010-08-06');

-- --------------------------------------------------------

--
-- Table structure for table `researchunit`
--

CREATE TABLE IF NOT EXISTS `researchunit` (
  `researchUnitID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `institutionCode` varchar(45) NOT NULL,
  `heiName` varchar(100) NOT NULL,
  `researchUnit` varchar(100) NOT NULL,
  `address` varchar(250) NOT NULL,
  `telephone` varchar(45) NOT NULL,
  `fax` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officialUnit` tinyint(1) NOT NULL DEFAULT '1',
  `researchFocus` text,
  `function` text,
  `userID` int(10) unsigned NOT NULL,
  `dateCreated` date NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`researchUnitID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `researchunit`
--


-- --------------------------------------------------------

--
-- Table structure for table `resposition`
--

CREATE TABLE IF NOT EXISTS `resposition` (
  `resPosID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resPosName` varchar(45) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `dateCreated` date NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`resPosID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `resposition`
--

INSERT INTO `resposition` (`resPosID`, `resPosName`, `userID`, `dateCreated`, `lastUpdate`) VALUES
(1, 'Project leader', 1, '2010-08-06', '2010-08-06 10:00:07'),
(3, 'Research Assistant', 1, '2010-08-06', '2010-08-06 10:42:29');

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE IF NOT EXISTS `school` (
  `schoolID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `schoolName` varchar(100) NOT NULL,
  `schoolCode` varchar(45) NOT NULL,
  `schoolTypeID` int(10) unsigned NOT NULL,
  `address` varchar(200) NOT NULL,
  `telephone` varchar(45) NOT NULL,
  `fax` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `lastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `website` varchar(100) NOT NULL,
  `heiCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`schoolID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`schoolID`, `schoolName`, `schoolCode`, `schoolTypeID`, `address`, `telephone`, `fax`, `mobile`, `email`, `userID`, `dateCreated`, `lastUpdated`, `website`, `heiCode`) VALUES
(1, 'University of the Philippines Mindanao', 'UPMIN', 3, 'Administration Building, Mintal, Tugbok District, Davao City', '2931839; 2930863; 2930016', '2930185', 'none', 'info@upmin.edu.ph', 4, '2010-08-26 11:53:20', '2010-10-07 09:09:35', 'http://www.upmin.edu.ph', '11107'),
(3, 'Assumption College of Nabunturan ', 'ACN', 2, 'P-1 Poblacion, Nabunturan, Compostela Valley Province ', '(084) 376-0607', '(084) 376-0607', 'none', 'acn_exelsior@yahoo.com', 4, '2010-09-08 09:37:49', '2010-10-07 09:03:24', 'www.assumptionnabunturan.com', '11006'),
(4, 'Ateneo de Davao University ', 'ADDU', 2, 'Lower Ground Floor, Finster Hall\r\nAteneo de Davao University (ADDU)\r\nRoxas Avenue, 8016 Davao City', '227-1340; 221-2411', '227-1340; 226-4116', 'none', 'sasgrad@addu.edu.ph', 4, '2010-09-08 09:40:37', '2010-10-07 09:03:44', 'www.addu.edu.ph', '11007'),
(5, 'Cor Jesu College', 'CJC', 2, 'Sacred Heart Avenue, Digos City\r\nDavao del Sur 8002', '(082) 553-2433', '(082) 553-2333', 'none', 'cjc_csdr@yahoo.com', 4, '2010-09-08 09:43:17', '2010-10-07 09:04:45', 'None ', '11012'),
(6, 'Davao Medical School Foundation ', 'DMSF', 7, 'Medical School Drive, Bajada, Davao City ', '221-2617', '221-2617', 'none', 'dmsf@edu.ph', 4, '2010-09-08 09:45:24', '2010-10-07 09:05:30', 'www.dmsf.edu.ph', '11018'),
(7, 'Holy Cross of Davao College', 'HCDC', 2, 'Sta. Ana Avenue, Davao City ', '221-9071 to 79 local 158', 'None ', 'none', 'nbangel12@yahoo.com; hcdc_rdc@yahoo.com', 4, '2010-09-08 09:48:00', '2010-10-07 09:06:32', 'www.hcdc.edu.ph', '11035'),
(8, 'Rizal Memorial Colleges', 'RMC', 4, 'Lopez Jaena St., Davao City ', '225-3930', '225-3930', 'none', 'rmcdavao@yahoo.com', 4, '2010-09-08 09:49:56', '2010-10-07 09:06:50', 'None', '11062'),
(9, 'San Pedro College', 'SPC', 2, 'Lopez Jaena St., Davao City ', '(082) 224-1481; 226-4813; 2264187', '(082) 226-4461', 'none', 'spc@spcdavao.edu.ph', 4, '2010-09-08 14:39:55', '2010-10-07 09:08:12', 'www.spcdavao.edu.ph', '11070'),
(10, 'University of Mindanao', 'UM', 4, 'Bolton St., Davao City ', '(082) 227-5456 local 161', '227-5456', 'none', 'um.research@yahoo.com', 4, '2010-09-08 14:58:29', '2010-10-07 09:09:10', 'www.umindanao.edu.ph', '11093'),
(11, 'University of the Immaculate Concepcion ', 'UIC', 2, 'Fr. Selga St., Davao City ', '(082) 227-3794', 'None', 'none', 'none', 4, '2010-09-08 15:02:52', '2010-10-07 09:08:41', 'www.uic.edu.ph', '11095'),
(12, 'St  Marys College of Tagum', 'SMCT', 2, 'National Highway, Tagum City\r\nDavao del Norte ', '(084) 400-3137', '(084) 400-3137', 'none', 'smctagum@gmail.com', 4, '2010-09-08 15:07:04', '2010-10-07 09:07:11', 'www.rvmonline.net/smctagum', '11064'),
(13, 'Brokenshire College', 'BC', 2, 'Madapo Hill, Davao City', '(082) 227-2105 local 117', '227-2105 local 117', 'none', 'president@brokenshire.edu.ph; research.bc@gmail.com', 4, '2010-09-08 15:15:32', '2010-10-07 09:04:09', 'www.brokenshire.edu.ph', '11008'),
(14, 'Davao Doctors College', 'DDC', 4, 'General Malvar St., Davao City ', '(082) 221-1074', '221-1074', 'none', 'none', 4, '2010-09-08 15:17:27', '2010-10-07 09:05:04', 'www.davaodoctors.edu.ph', '11016'),
(15, 'Davao del Norte State College', 'DNSC', 3, 'New Visayas, Panabo City, Davao del Norte ', '(082) xxx', 'xxx', 'none', 'none', 4, '2010-09-08 15:19:10', '2010-10-07 09:05:56', 'www.', '11015'),
(16, 'Davao Oriental State College of Science and Technology ', 'DOSCST', 3, 'Guang-Guang, Dahican, Mati, Davao Oriental ', '(087) 388-3195', '(087) 388-3195', 'none', 'doscst@yahoo.com', 4, '2010-09-08 15:22:12', '2010-10-07 09:06:13', 'www.', '11021'),
(17, 'Southern Philippines Agri-Business and Marine and Aquatic School of Technology ', 'SPAMAST', 3, 'Malita, Davao del Sur ', '(082) 553-8894', 'None', 'none', 'amc_spamast@yahoo.com', 4, '2010-09-08 15:24:23', '2010-10-07 09:07:53', 'www.spamast.edu.ph', '11077/11098'),
(18, 'University of Southeastern Philippines ', 'USeP', 3, 'Bo. Obrero, Davao City ', '(082) 221-7737', '221-7737', 'none', 'usep@edu.ph', 4, '2010-09-08 15:26:24', '2010-10-07 09:09:56', 'www.usep.edu.ph', '11094'),
(19, 'AFSD', 'ZKLDJ', 7, 'LKFJASD', '0931', '321', '123', 'ASFDASDJKF', 1, '2011-09-15 21:53:20', '2011-09-15 21:53:20', 'DFADF', 'ASD');

-- --------------------------------------------------------

--
-- Table structure for table `schooltype`
--

CREATE TABLE IF NOT EXISTS `schooltype` (
  `schoolTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `schoolTypeName` varchar(45) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `lastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`schoolTypeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `schooltype`
--

INSERT INTO `schooltype` (`schoolTypeID`, `schoolTypeName`, `userID`, `dateCreated`, `lastUpdated`) VALUES
(1, 'State University', 1, '2010-08-25 13:54:45', '2010-08-25 13:54:45'),
(2, 'Private Sectarian', 4, '2010-08-25 13:54:58', '2010-09-08 08:13:29'),
(3, 'Public, Funded by National Governrment ', 4, '2010-08-25 13:55:10', '2010-09-08 08:12:16'),
(4, 'Private Non-Sectarian Stock', 4, '2010-08-25 14:00:28', '2010-09-08 08:13:56'),
(5, 'National University', 4, '2010-09-08 08:12:36', '2010-09-08 08:12:36'),
(6, 'Public, Funded by Local Governrment Unit (LGU', 4, '2010-09-08 08:13:08', '2010-09-08 08:13:08'),
(7, 'Private Non-Sectarian Non-Stock', 4, '2010-09-08 08:14:26', '2010-09-08 08:14:26');

-- --------------------------------------------------------

--
-- Table structure for table `scollege`
--

CREATE TABLE IF NOT EXISTS `scollege` (
  `sCollegeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `schoolID` int(10) unsigned NOT NULL,
  `collegeID` int(10) unsigned NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`sCollegeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `scollege`
--

INSERT INTO `scollege` (`sCollegeID`, `schoolID`, `collegeID`, `userID`, `dateCreated`) VALUES
(1, 1, 1, 1, '2010-09-09 15:45:01'),
(3, 1, 2, 1, '2010-09-13 10:11:56'),
(4, 1, 4, 1, '2010-09-13 10:11:56');

-- --------------------------------------------------------

--
-- Table structure for table `space`
--

CREATE TABLE IF NOT EXISTS `space` (
  `spaceID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `spaceName` varchar(100) NOT NULL,
  `spaceCode` varchar(45) NOT NULL,
  `spaceDesc` varchar(45) NOT NULL,
  `spaceFee` int(10) unsigned NOT NULL,
  `spaceLoc` varchar(45) NOT NULL,
  `spaceTypeID` int(10) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `lastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` char(10) NOT NULL,
  PRIMARY KEY (`spaceID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `space`
--

INSERT INTO `space` (`spaceID`, `spaceName`, `spaceCode`, `spaceDesc`, `spaceFee`, `spaceLoc`, `spaceTypeID`, `userID`, `dateCreated`, `lastUpdated`, `status`) VALUES
(8, 'vd', 'cdc', 'dcdcxcx', 32, 'dfcdfc', 10, 2, '2011-09-19 14:47:07', '2011-09-19 14:47:07', '');

-- --------------------------------------------------------

--
-- Table structure for table `spacetype`
--

CREATE TABLE IF NOT EXISTS `spacetype` (
  `spaceTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `spaceTypeName` varchar(45) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `lastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`spaceTypeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `spacetype`
--

INSERT INTO `spacetype` (`spaceTypeID`, `spaceTypeName`, `userID`, `dateCreated`, `lastUpdated`) VALUES
(10, 'Audio Visual', 2, '2011-09-19 02:54:07', '2011-09-19 03:03:59');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE IF NOT EXISTS `vehicle` (
  `vehicleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vehicleName` varchar(100) NOT NULL,
  `vehicleCode` varchar(45) NOT NULL,
  `vehiclePn` varchar(45) NOT NULL,
  `vehicleOr` varchar(45) NOT NULL,
  `vehicleDesc` varchar(100) NOT NULL,
  `vehicleTypeID` int(10) NOT NULL,
  `location` varchar(50) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `lastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` char(10) NOT NULL,
  PRIMARY KEY (`vehicleID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`vehicleID`, `vehicleName`, `vehicleCode`, `vehiclePn`, `vehicleOr`, `vehicleDesc`, `vehicleTypeID`, `location`, `userID`, `dateCreated`, `lastUpdated`, `status`) VALUES
(7, 'UP Bus', 'UPB', '123 - 12', '1234', 'Broooom', 1, 'Mintal', 2, '2011-09-19 02:06:08', '2011-09-19 02:09:29', ''),
(12, 'sfsds', 'ssf', 'sdsds', 'ssfd', 'fsfs', 1, 'rwrwew', 2, '2011-09-19 19:11:13', '2011-09-19 19:11:13', '');

-- --------------------------------------------------------

--
-- Table structure for table `vehicletype`
--

CREATE TABLE IF NOT EXISTS `vehicletype` (
  `vehicleTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vehicleTypeName` varchar(45) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `lastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vehicleTypeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `vehicletype`
--

INSERT INTO `vehicletype` (`vehicleTypeID`, `vehicleTypeName`, `userID`, `dateCreated`, `lastUpdated`) VALUES
(1, 'Land Transportation', 2, '2010-08-25 13:54:45', '2011-09-19 02:34:35'),
(2, 'Space Craft', 2, '2010-08-25 13:54:58', '2011-09-19 02:35:14'),
(3, 'Air Transportation', 2, '2010-08-25 13:55:10', '2011-09-19 02:34:25'),
(8, 'Water Transportation', 2, '2011-09-18 19:28:54', '2011-09-19 02:34:55');
--
-- Database: `upmin_setup`
--
CREATE DATABASE `upmin_setup` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `upmin_setup`;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE IF NOT EXISTS `module` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `moduleName` varchar(45) NOT NULL,
  PRIMARY KEY (`moduleID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`moduleID`, `moduleName`) VALUES
(1, 'accounting'),
(2, 'msp'),
(3, 'hrdo'),
(4, 'spmo'),
(5, 'tracker'),
(6, 'ComMon'),
(7, 'pt'),
(8, 'pt_user');

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE IF NOT EXISTS `office` (
  `officeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `officeCode` varchar(45) NOT NULL,
  `officeName` varchar(100) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `parentID` int(10) unsigned NOT NULL,
  `lastModified` datetime DEFAULT NULL,
  PRIMARY KEY (`officeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `office`
--

INSERT INTO `office` (`officeID`, `officeCode`, `officeName`, `status`, `parentID`, `lastModified`) VALUES
(1, 'OC', 'Office of the Chancellor', 0, 0, NULL),
(2, 'ITO', 'Information Technology Office', 0, 1, NULL),
(3, 'OSA', 'Office of the Student Affairs', 0, 1, NULL),
(4, 'OVCA', 'Office of the Vice Chancellor for Administration', 0, 1, NULL),
(5, 'OVCAA', 'Office of the Vice Chancellor for Academic Affairs', 0, 1, NULL),
(6, 'SPMO', 'Supply and Property Management Office', 0, 4, NULL),
(7, 'OR', 'Office of Research', 0, 5, NULL),
(8, 'OUR', 'Office of the University Registrar', 0, 5, NULL),
(9, 'CASH', 'Cash Office', 0, 4, NULL),
(10, 'PPO', 'Physical Plant Office', 0, 4, NULL),
(11, 'HRDO', 'Human Resource Development Office', 0, 4, NULL),
(12, 'ACCTG', 'Accounting Office', 0, 4, NULL),
(13, 'LEGAL', 'Legal Office', 0, 1, NULL),
(14, 'OECS', 'Office of Extension and Community Service', 0, 1, NULL),
(15, 'BUDGET', 'Budget Office', 0, 1, NULL),
(16, 'CHSS', 'Office of the Dean, CHSS', 0, 0, NULL),
(17, 'CHSS-OD', 'Office of the Dean, CHSS', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `officePersonnelID` int(11) NOT NULL,
  `userName` varchar(45) NOT NULL,
  `passWord` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `completeName` varchar(100) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `userType` int(10) unsigned NOT NULL,
  `lastVisit` datetime DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=103 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `officePersonnelID`, `userName`, `passWord`, `email`, `completeName`, `status`, `userType`, `lastVisit`) VALUES
(2, 4, 'krishna', '2a8c8575f105f9919c36a1986cbab43c', 'krishnahernandez@yahoo.com', 'Krishna B. Hernandez', 1, 1, '2011-09-24 23:01:07'),
(1, 7, 'gon', '37000dd8e5b88c4b0531ee1831d8e75e', 'gon.cuabo@gmail.com', 'Gon Andolana Cuabo', 1, 1, '2011-09-24 12:54:14'),
(9, 1001, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'user@samplesite.com', 'USER', 1, 2, '2011-09-25 02:18:04'),
(101, 8, 'dulce', '27239c4b6b91cfe2788c8f2606b6997e', '', 'Dulce Flores', 1, 2, '2011-09-22 17:53:32'),
(7, 2, 'fievanni', '2a8c8575f105f9919c36a1986cbab43c', 'fievannii@yahoo.com', 'Ross Fievanni A.Inguillo', 1, 1, '2011-05-01 07:12:24'),
(12, 0, 'spmo', 'f4939c4566584ea6ec8a614ed91c117d', 'spmo@yhaoo.com', 'Socorro Brenda Acuna', 1, 1, '2011-09-25 00:19:18'),
(13, 3, 'ayson', '4ef54a7d5b5275f07ea2265ad3b8000a', 'osa@yahoo.com', 'Evelina Ayson', 1, 1, '2011-09-22 15:09:10'),
(14, 2, 'vic', 'd8d3bcfffb223aabf73973451548b12e', 'viccalag@yahoo.com', 'Vicente B. Calag', 1, 1, '2011-05-23 03:20:23'),
(15, 24098, 'glen', 'dc1441e42684138ef0086b7895c8a233', 'kadang0923@yahoo.com', 'Glen', 1, 1, '2011-09-06 14:30:10');

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

CREATE TABLE IF NOT EXISTS `userrole` (
  `userroleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned NOT NULL,
  `moduleID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`userroleID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`userroleID`, `userID`, `moduleID`) VALUES
(5, 4, 2),
(8, 3, 1),
(6, 5, 1),
(7, 6, 3),
(9, 3, 3),
(10, 3, 2),
(11, 3, 4),
(12, 3, 5),
(15, 8, 6),
(50, 2, 5),
(49, 2, 4),
(48, 2, 7),
(47, 2, 2),
(46, 2, 3),
(27, 12, 1),
(28, 12, 6),
(29, 12, 3),
(30, 12, 2),
(31, 12, 4),
(32, 12, 5),
(45, 2, 6),
(44, 2, 1),
(60, 9, 7),
(58, 9, 2),
(62, 1, 5),
(61, 1, 7);
--
-- Database: `upmin_spmo_admin`
--
CREATE DATABASE `upmin_spmo_admin` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `upmin_spmo_admin`;

-- --------------------------------------------------------

--
-- Table structure for table `abstract`
--

CREATE TABLE IF NOT EXISTS `abstract` (
  `abstractID` int(11) NOT NULL AUTO_INCREMENT,
  `PRID` int(11) NOT NULL,
  `bac_chair` varchar(100) DEFAULT NULL,
  `bac_sec` varchar(100) DEFAULT NULL,
  `date` date NOT NULL,
  `status` enum('Pending','Approved') NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`abstractID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `abstract`
--

INSERT INTO `abstract` (`abstractID`, `PRID`, `bac_chair`, `bac_sec`, `date`, `status`) VALUES
(1, 110002, 'Tadpole', 'Bunta', '2011-05-23', 'Approved'),
(3, 110002, 'gfh', 'gh', '2011-05-23', 'Approved'),
(4, 110003, 'gh', 'ghj', '2011-05-23', 'Approved'),
(5, 1159490, 'Mayeth dela Torre', 'Gus Oguis', '2011-05-26', 'Approved'),
(6, 30911, 'antonio obsioma', 'socorro acuna', '2011-06-17', 'Approved'),
(7, 130911, 'antonio obsioma', 'socorro acuna', '2011-06-17', 'Approved'),
(8, 999911, 'dr. sylvia b. concepcion', 'socorro brenda e. acuña', '2011-06-17', 'Approved'),
(9, 30972, 'laurence', 'glen', '2011-06-21', 'Approved'),
(10, 1212, 'kj', 'kk', '2011-08-23', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `abstractitem`
--

CREATE TABLE IF NOT EXISTS `abstractitem` (
  `abstractItemID` int(11) NOT NULL AUTO_INCREMENT,
  `abstractID` int(11) NOT NULL,
  `RQitemID` int(11) NOT NULL,
  PRIMARY KEY (`abstractItemID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `abstractitem`
--

INSERT INTO `abstractitem` (`abstractItemID`, `abstractID`, `RQitemID`) VALUES
(1, 1, 9),
(2, 1, 6),
(7, 3, 8),
(6, 3, 7),
(8, 4, 21),
(9, 5, 37),
(10, 5, 38),
(11, 5, 45),
(12, 6, 48),
(13, 7, 55),
(14, 7, 56),
(15, 7, 66),
(16, 7, 85),
(17, 7, 77),
(18, 7, 69),
(19, 7, 61),
(20, 7, 80),
(21, 7, 81),
(22, 8, 87),
(23, 8, 115),
(24, 8, 116),
(25, 8, 108),
(26, 8, 100),
(27, 8, 101),
(28, 8, 102),
(29, 8, 112),
(30, 8, 104),
(31, 9, 123),
(32, 9, 124),
(33, 9, 125),
(34, 9, 126),
(35, 9, 127),
(36, 9, 128),
(37, 9, 129),
(38, 9, 130),
(39, 9, 131),
(40, 9, 132),
(41, 9, 133),
(42, 9, 134),
(43, 9, 135),
(44, 9, 136),
(45, 9, 137),
(46, 9, 138),
(47, 10, 146),
(48, 10, 147),
(49, 10, 148),
(50, 10, 149);

-- --------------------------------------------------------

--
-- Table structure for table `abstractpritemlist`
--

CREATE TABLE IF NOT EXISTS `abstractpritemlist` (
  `abstractPRitemlistID` int(11) NOT NULL AUTO_INCREMENT,
  `abstractID` int(11) NOT NULL,
  `PRitemID` int(11) NOT NULL,
  PRIMARY KEY (`abstractPRitemlistID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `abstractpritemlist`
--

INSERT INTO `abstractpritemlist` (`abstractPRitemlistID`, `abstractID`, `PRitemID`) VALUES
(1, 1, 1),
(2, 1, 2),
(4, 3, 3),
(5, 3, 4),
(6, 4, 5),
(7, 5, 60),
(8, 5, 61),
(9, 5, 62),
(10, 6, 71),
(11, 7, 79),
(12, 7, 80),
(13, 7, 81),
(14, 7, 82),
(15, 7, 83),
(16, 7, 84),
(17, 7, 85),
(18, 7, 86),
(19, 7, 87),
(20, 8, 88),
(21, 8, 90),
(22, 8, 91),
(23, 8, 92),
(24, 8, 93),
(25, 8, 94),
(26, 8, 95),
(27, 8, 96),
(28, 8, 97),
(29, 9, 99),
(30, 9, 98),
(31, 9, 100),
(32, 9, 101),
(33, 9, 102),
(34, 9, 103),
(35, 9, 104),
(36, 9, 105),
(37, 9, 106),
(38, 9, 107),
(39, 9, 108),
(40, 9, 109),
(41, 9, 110),
(42, 9, 111),
(43, 9, 112),
(44, 9, 113),
(45, 10, 135),
(46, 10, 136),
(47, 10, 137),
(48, 10, 138);

-- --------------------------------------------------------

--
-- Table structure for table `abstractrqlist`
--

CREATE TABLE IF NOT EXISTS `abstractrqlist` (
  `abstractRQlistID` int(11) NOT NULL AUTO_INCREMENT,
  `abstractID` int(11) NOT NULL,
  `RequestID` int(11) NOT NULL,
  PRIMARY KEY (`abstractRQlistID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `abstractrqlist`
--

INSERT INTO `abstractrqlist` (`abstractRQlistID`, `abstractID`, `RequestID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(9, 3, 3),
(8, 3, 2),
(7, 3, 1),
(10, 4, 4),
(11, 4, 5),
(12, 4, 6),
(13, 5, 62),
(14, 5, 63),
(15, 5, 64),
(16, 6, 66),
(17, 6, 67),
(18, 6, 68),
(19, 7, 82),
(20, 7, 83),
(21, 7, 85),
(22, 7, 86),
(23, 8, 88),
(24, 8, 89),
(25, 8, 90),
(26, 8, 91),
(27, 9, 98),
(28, 10, 111);

-- --------------------------------------------------------

--
-- Table structure for table `acquisitionmode`
--

CREATE TABLE IF NOT EXISTS `acquisitionmode` (
  `acquisitionModeID` int(11) NOT NULL,
  `acquisitionMode` varchar(20) NOT NULL,
  PRIMARY KEY (`acquisitionModeID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acquisitionmode`
--

INSERT INTO `acquisitionmode` (`acquisitionModeID`, `acquisitionMode`) VALUES
(1, 'Purchase'),
(2, 'B-1'),
(3, 'B-2'),
(4, 'B-3'),
(5, 'Donation'),
(6, 'Bidding'),
(7, 'DIS'),
(8, 'COD'),
(9, '267238'),
(10, 'Accounted'),
(11, 'Fabricated'),
(12, 'Drop');

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE IF NOT EXISTS `attachments` (
  `attachmentID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `size` int(11) NOT NULL,
  `content` longblob NOT NULL,
  `userID` int(11) NOT NULL,
  `PRID` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `POID` int(11) DEFAULT NULL,
  `obrID` int(11) DEFAULT NULL,
  `iarID` int(11) DEFAULT NULL,
  `supplierID` int(11) NOT NULL,
  PRIMARY KEY (`attachmentID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`attachmentID`, `name`, `type`, `size`, `content`, `userID`, `PRID`, `ID`, `POID`, `obrID`, `iarID`, `supplierID`) VALUES
(3, '1.png', 'image/png', 883, 0x89504e470d0a1a0a0000000d494844520000006400000064080600000070e295540000001974455874536f6674776172650041646f626520496d616765526561647971c9653c000003154944415478daec9beb8de230144693ed205b82b784504228014ad894002584129812a084a1042881296129216b4b8ec446b11de290b1bde793ee1ff290ec93fbf0b5c9dbb6cd5038fac114000401042008200041000108020840104010400082000210041080208000040104010420082000410001c83729cf739b09693b6977696dcf1a7dcdf87cb0630ef928a961e20a6947699b91afa9a57df47f0c75dcb10129a59da489175f7596b605c8bc401484abf69029fa074aa8e38e29a99f3c60643ac4ed421f642c1ea226b299e9b5bfa47de121d35538beec0f3dc9b9b6bde37d617b89fa5242b5a7096c0d669adcd2f2cc9f90c71d838798cadb8bb483e1dacde229c50b2533216b60f24ac3b583e35915ca1e866b0220d354197e7f680fb1c9760f40264a5842d218dd0082fe4b20c5ccf701c453e5c8c9ae3c431e407afab25cfb3d0246191b90d05b2745b7903354512b0bb4ab01887aee27ad93697a64037b194ff9c1d4703c7aac5f689d385a27c2d20651f6d983d258eebd77f7063be60880b826b9d5e149688fb1dd5785fe21c6b44175b584a131da3f872b760cfd81144f9ef0aa541eaafba19aa4ee9fe0d78e527848e73e8c9015e3a913a113f9184fb9688883c50c1e32df62718ca71861d03a794ff8b249adc4b7310e2c5620c7ccde9a5f8f80069099a4f6d1378e70f688f4438b2ea90bbdda9ed2db22a9bf41b6b359f58492180ff1f090522f0c67a9a8f0107f6d1c2bf124141390d2a30c06c8c2aa00b2bc6e8e5258a40024b6ff87dc1dc05624f5e5a44ada8323c73478c8b20bc32c736f54d563aa2e36a8e60332e6af6debcc71f69790356fe87275724f99df762f405ed4c501a53b222400b29c5c5bb3dd2914802c2895bcf78eca6b17d380624ceaa69c61ea750db6e549eaef95adf51ef47f0a5305f2702c1a2b802caf5b0a834809489502ac5492ba82f169b9beea4321a9bf4f3b078c4b4c1e9202908d23d9d7310d2605205b4bc91bdd49941480989a8d6a057fa6cafabe9277df8371887120a954599d1aed316c502142164010400082008200021004108020800004010420082008200041000108f2d55f010600ca85b6ed1e300fa40000000049454e44ae426082, 10, 0, 0, NULL, 7, NULL, 0),
(9, 'document.pdf', 'application/pdf', 1478, 0x255044462d312e340a25c3a4c3bcc3b6c39f0a322030206f626a0a3c3c2f4c656e6774682033203020522f46696c7465722f466c6174654465636f64653e3e0a73747265616d0a789c7550bb6a43310cddef57682ed8b5655bba06a32189efd02d60e850bab5e9566896fe7e649b24b4a51884d1d17948ce7af85ebec08171fa258f5a39f77a7e87e707f81c607fe78f65d716c46c13b07736407b83c7cd834768a797929c50a18d1d27da8b4985bc60e128a150124305dd1889514c2891c4a0b6ae38163a74123b25871bb7cb74904327a1a3dcc13aa4941f5749ddf8b53d2db52dc7df61c9d915289346fe199670da6cc45867bc21cd381d76b42a36fb076de8509d41e2ff666811e29aff98c5aa296993a0fa2c3e16dc8be7b97c5f70bd5f0a59476fcb4e409de3e0e6c1aaf70047b800ada8614b0a656e6473747265616d0a656e646f626a0a0a332030206f626a0a3233390a656e646f626a0a0a352030206f626a0a3c3c2f547970652f466f6e742f537562747970652f54797065312f42617365466f6e742f54696d65732d526f6d616e0a2f456e636f64696e672f57696e416e7369456e636f64696e670a3e3e0a656e646f626a0a0a362030206f626a0a3c3c2f46312035203020520a3e3e0a656e646f626a0a0a372030206f626a0a3c3c2f466f6e742036203020520a2f50726f635365745b2f5044462f546578745d0a3e3e0a656e646f626a0a0a312030206f626a0a3c3c2f547970652f506167652f506172656e742034203020522f5265736f75726365732037203020522f4d65646961426f785b30203020363132203739325d2f47726f75703c3c2f532f5472616e73706172656e63792f43532f4465766963655247422f4920747275653e3e2f436f6e74656e74732032203020523e3e0a656e646f626a0a0a342030206f626a0a3c3c2f547970652f50616765730a2f5265736f75726365732037203020520a2f4d65646961426f785b203020302035393520383432205d0a2f4b6964735b203120302052205d0a2f436f756e7420313e3e0a656e646f626a0a0a382030206f626a0a3c3c2f547970652f436174616c6f672f50616765732034203020520a2f4f70656e416374696f6e5b3120302052202f58595a206e756c6c206e756c6c20305d0a3e3e0a656e646f626a0a0a392030206f626a0a3c3c2f417574686f723c46454646303036353030363930303732303036393030364230303638303036443e0a2f43726561746f723c464546463030353730303732303036393030373430303635303037323e0a2f50726f64756365723c464546463030344630303730303036353030364530303446303036363030363630303639303036333030363530303245303036463030373230303637303032303030333230303245303033333e0a2f4372656174696f6e4461746528443a32303038303332303133303930332b303127303027293e3e0a656e646f626a0a0a787265660a302031300a303030303030303030302036353533352066200a30303030303030353236203030303030206e200a30303030303030303139203030303030206e200a30303030303030333239203030303030206e200a30303030303030363638203030303030206e200a30303030303030333439203030303030206e200a30303030303030343432203030303030206e200a30303030303030343733203030303030206e200a30303030303030373636203030303030206e200a30303030303030383439203030303030206e200a747261696c65720a3c3c2f53697a652031302f526f6f742038203020520a2f496e666f2039203020520a2f4944205b203c46313138443836333439454632423946393637373732464141303537463639443e0a3c46313138443836333439454632423946393637373732464141303537463639443e205d0a2f446f63436865636b73756d202f45393934314139423145303444443638333030303136464439373942393237380a3e3e0a7374617274787265660a313037370a2525454f460a, 12, 0, 0, 1, NULL, NULL, 0),
(12, 'chargeto.sql', 'application/octet-stream', 1190, 0x2d2d207068704d7941646d696e2053514c2044756d700a2d2d2076657273696f6e20332e322e340a2d2d20687474703a2f2f7777772e7068706d7961646d696e2e6e65740a2d2d0a2d2d20486f73743a206c6f63616c686f73740a2d2d2047656e65726174696f6e2054696d653a204d61792031312c20323031312061742030353a313820414d0a2d2d205365727665722076657273696f6e3a20352e312e34310a2d2d205048502056657273696f6e3a20352e332e310a0a5345542053514c5f4d4f44453d224e4f5f4155544f5f56414c55455f4f4e5f5a45524f223b0a0a0a2f2a2134303130312053455420404f4c445f4348415241435445525f5345545f434c49454e543d40404348415241435445525f5345545f434c49454e54202a2f3b0a2f2a2134303130312053455420404f4c445f4348415241435445525f5345545f524553554c54533d40404348415241435445525f5345545f524553554c5453202a2f3b0a2f2a2134303130312053455420404f4c445f434f4c4c4154494f4e5f434f4e4e454354494f4e3d4040434f4c4c4154494f4e5f434f4e4e454354494f4e202a2f3b0a2f2a21343031303120534554204e414d45532075746638202a2f3b0a0a2d2d0a2d2d2044617461626173653a206075706d696e5f73706d6f5f61646d696e600a2d2d0a0a2d2d202d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d0a0a2d2d0a2d2d205461626c652073747275637475726520666f72207461626c652060636861726765746f600a2d2d0a0a435245415445205441424c45204946204e4f54204558495354532060636861726765746f6020280a202060636861726765546f49446020696e7428313129204e4f54204e554c4c204155544f5f494e4352454d454e542c0a202060636861726765546f4e616d65602076617263686172283530292044454641554c54204e554c4c2c0a20205052494d415259204b4559202860636861726765546f494460290a2920454e47494e453d4d794953414d202044454641554c5420434841525345543d6c6174696e31204155544f5f494e4352454d454e543d36203b0a0a2d2d0a2d2d2044756d70696e67206461746120666f72207461626c652060636861726765746f600a2d2d0a0a494e5345525420494e544f2060636861726765746f60202860636861726765546f4944602c2060636861726765546f4e616d6560292056414c5545530a28312c2027534f4d204d4f4f4527292c0a28322c20274f5552204d4f4f4527292c0a28352c202743485353204d4f4f4527292c0a28342c202743534d204d4f4f4527293b0a0a2f2a21343031303120534554204348415241435445525f5345545f434c49454e543d404f4c445f4348415241435445525f5345545f434c49454e54202a2f3b0a2f2a21343031303120534554204348415241435445525f5345545f524553554c54533d404f4c445f4348415241435445525f5345545f524553554c5453202a2f3b0a2f2a2134303130312053455420434f4c4c4154494f4e5f434f4e4e454354494f4e3d404f4c445f434f4c4c4154494f4e5f434f4e4e454354494f4e202a2f3b0a, 12, 0, 0, 2, NULL, NULL, 0);
INSERT INTO `attachments` (`attachmentID`, `name`, `type`, `size`, `content`, `userID`, `PRID`, `ID`, `POID`, `obrID`, `iarID`, `supplierID`) VALUES
(13, 'CMSC 198 Guidelines.pdf', 'application/pdf', 51062, 0x255044462d312e340a25c3a4c3bcc3b6c39f0a322030206f626a0a3c3c2f4c656e6774682033203020522f46696c7465722f466c6174654465636f64653e3e0a73747265616d0a789cbd584b8be43610bef7aff039d0bd52c99225680cedee1e486e030339849cf282c026cc5ef2f753a5d2a364d99e3d2ccb80c72d4baad757559fa42e7af8eff43e28fcb3c15ec6c18f307cf963f8f987e19fd3ebf03e80f517334c6a1c267ff18373e5eb3b8d4c71298ed679bf7d3e7dfaf1f3383cfe1d5ee316db9bf3b81abefc755ade4e1afc250c6e72c3dbefc3a7173d683fbcfd79557a7efbfbf47c3bbdaee78f708166fe88f37fb92a98dd5599f90c5735cee6aaecacafcac5df537cf2373f9f713ca89b5ad47dc6811b0ed9ab7ae08233febfcdbfbefdb42518bc42a37b459f3b8a42808bdd52f49134792105f9f589bb4cf907b0ead39e2206bd2f3c0083d6871e335e6f29aed5defc3051bc7bc5cd3ca2765a6b883e84f47fd953540783c870a36f14a550e15613858983454f1b9f8e0347af3a46c34409130d6b7af8393a28a449371a8366c5c283f7f99cd73ce2d765b623054b93e38bc00781467c0a08a3b327397b365943ce3723ba74655514a995d6681bb906aedac4a1918cd0768e5f1d0ae711565847706a9f7575792daf0a345df162397e436df51207eef48a463ab6573fa3d0306bfcf61227c719ab15493aefe9683228e146487a45c19a5e4117cd512153fd4b31491b4719c9461e51bbe9640865368c175f70c68ec4bdc953734e5c92151313f71eb5d58e5f27ed118f6427c945eb5162f646482e19d36074c97e6a4f80d5d03a4aab554c1780e2588416fd03c3866905d11980d9aa92a793530d169408049a38514805103848494d48f147e7a218daaa860145391695b6a535310a693cc686dd42904ba191612c20d2198c2c8875686045fba0fcf3943fc2449b2a364658c7189d126e326c3495dfc609f7e81656a0cf86a8765cee8bb965d3ea714e265eb8d210ebeb4dc01e16b8e350c080ed44d9ea093b4d1fe6fdcae9edc50dd68eb8acc5053ca26ad5a8a45b363ee9568bd2ecaf87f31778caf9a90cb41e85254fc945ad9d823e78110ed999128c32fa3811801a7a6bb0018c03bab6b548e05956ab040025e021e3cba50e759a2af8b363d2d214755d0ad44256ac2b1f6399415c9db7de782fdfa0a69b9659d966186d9852ac427b652c2ef473c83bdb1cdaf4dbd4ca58f16ecc5e081873daae1117442532e3ac8384525300a218d6d4d819d44e293a94af74d7dfa0a985203a6c2af5b52434595f2cdfc8f96d67e644c9cdd138b460a9cd6f133f5293547f65bfa4b27804fa71b2f85cf31469f1b320081113aeb2177c1008d37584a2a44455c2906b5201f948c81486c94fe427a900bec04df4865d7c175fd7582c15abba1671f5cd009e4ad643b41833117fec498f5132ebe354de031d466619fd41b68c4e5fd61cb3c91715487b81cc8a2d369c2b9080189b93117d287cf4972e599b54c9bc901be2b2468cde930ad5598e7db51d1a997d95ae496627ebff23d25f96742f85ad60f21c33cb07c92845b0b910774454a4be20a2110db546673623b863db1194649b49a64b89ae1218e4fef7b95251642b2b5aac32cd3532e39217a3aac28cdc82ec0163b5001bd1de670f21505d31b66395add532a0a5b0b09f3f88a9574ddfcb4662d74cf903352ce4183c081e450e8adf654d51d241518b7dfac00901bae34b267cd384a876097621cf21ec4d91db0c27e1dfe6d4b574a92fe12434219d0f6d57fee2d6b6dfb0f87ccf7ac0e7bfb67d125b13369a259d72413767c4dcb86c39700b6593677c454c73d6c05a1fd5659f26df8b83ca3a7bfb5e84cc7edd8c3699259fdd91db106fbb0bdab8898b36c176a2374e0e5b481fbe0fb2db04db51e5d82a395ddc61578987d5dcccbf8e1b6737ee84ac2b8e0d1d92c470cd17d236eb8ab90fb21abde646008dd7be9276d9c40f13c7f8759184a7c8990ed30cac94d5155fcdc943d450118eaaae3d6485ac96f31d0f364a26f3286ce44713de72681e4917d51c844b0a1d6a60e9fa74a5c17d9e40969442f33b2a202e9dca39fd088e4714d980ef68165da19aeb77a5c95fc574c5cdc9da01e210c40d6eb56e927469a73b97736252758384dc0b7fc18e6ca28f8e9c0bde775d33de6436f9a98c111731d36c54c3dc3a95f91b9b990c34a941eafcb9a99d1c801c34d7ec0e7b37375c214ac5cadcbdb9c014faa50d4a6e432dd55f4565999c9688991a4fd1aee59dd9fa4eb65e2bd4b9b2a425a0ac78803c297454e9f0c66f3fafac7218f53ef61f5c49c1643b9a214e68e57604e4d56f17b286576c5fe1d802c09e4bc982fb326b516a4b64f74fe3c847d28e222d5e87ff01e944ad010a656e6473747265616d0a656e646f626a0a0a332030206f626a0a313634320a656e646f626a0a0a342030206f626a0a3c3c2f547970652f584f626a6563742f537562747970652f496d6167652f576964746820323431202f48656967687420323032202f42697473506572436f6d706f6e656e742038202f436f6c6f7253706163652f4465766963655247422f46696c7465722f4443544465636f64652f4c656e6774682032313334393e3e0a73747265616d0affd8ffe000104a46494600010100000100010000ffdb0043000302020302020303030304030304050805050404050a070706080c0a0c0c0b0a0b0b0d0e12100d0e110e0b0b1016101113141515150c0f171816141812141514ffdb00430103040405040509050509140d0b0d1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414ffc200110800ca00f103012200021101031101ffc4001d000002030101010101000000000000000000060507080403020109ffc400160101010100000000000000000000000000000102ffda000c03010002100310000001d52000791ea000000a033aae75a965d22969fc92cdfb560c8b633b5411c9b09abf9d97259ad4556ab00000000000000005d62046f9995f267b15fc0e0ca7ae90a5cb25f6df2d393da35f2ccb9f3a3fecc8ebfba970fe7a9a82949af0d6392ad7b9d5e558cb63715e788fbc0a8d84c7d0000001e48d502c66ec4e6e9f9d445faa4eb4974177fdc059eb0dd31a5ad3a8b600adc4e11e777a7d780aca8ad3839af48c0120dab70058736c7d6572f19d1425d9005800787be7e489542d1f3569761adf3a3dce6b486bebceeed667d95d629e8c6cae6ac16cada7c6af39f583e62694b148ce1e4b904e8a736b8c2ac3cfed37b6e7ea9b26e2a2cad654b4d6b2f0ceb1373aa00aaf708e8c86ceab3fcedea5ddd99740e66b9aed8e19fe5d5bea1aca95697c7e192ba6f0451f21f9f9ca4645f1a0876fe1b30e6f6ea0c4bdfd95e67577e92c9fab2cc449adf0734b7adea4984d625506b354d37afe8ace933e3a9797fa2590f5067bb9a92d158f697669f9fbac81f87ed7bed4f11ddb21e6395c79a6d81f8f8fb00f8324a14fabe7565eb3cbfa82e71757dd5df35f4c1d77197501ace75cc5fd21cc79b53afcfb5b5aee995ebaee71ec82a79cd6f49ea7ae1b800a4aeae24b1c24285bb090e3aa6d71d4005c63a4633a4c2bcecddfd6ec2d75719ee29a6273b5db8fe753592206b35264cfe86e7796b44d748d9a70beb245f3657281ad722137b271639c9afc8798d44c6b54e321e1bb580658a839c1cc20ce7c68e0879d7dbd296aea9ecff686449216e485e8548d0f03a653dc0d433868ff0013f9cee777aae7546b958b4eaeab50f2bfae7047d5df40cafda6305cc1baa1683b4ac97e79bf84f9ed4aab1744670acf8a5949efaba0efb4582abb9ceb5f9a5e6eb641bea5514f5bf0f75c8050015a620fe95234b847bb5c7a4bcdd94aa5d9b9aa78db6d31072ee9a8e5ad6b07e875e0fde7905e37a5f934afa6b425b495d5a31f51d93f2d935ed6ae8fd8ff0092e2ad7ed3645801600000000b99ff004fd65190c7947cea49e7a576cd02e58d586b63c3677734b5045fda7a9aa4d322ff0050a21265b36b169925af0fc7e872be95ecad67e80a00000000000012e94d3f1318d25afca8655bed81e05fcee90fd16ff1bbd84a9c8b6b126d440f63ef92c3b6d2aebb2764ec00a000000000000000000869904844bcbf232d4868ca965abba52fecb0b9ecab40a6de1d3f6c89960a0000000000003fffc4003010000202020200050301070500000000000405020301060007101213141511203024162526313236401721222341ffda0008010100010502fc575f58d597b1c2aa98f6389572dddee2f94edc59b2bf68340b2bde2d0ee5bd8c25d91b62ae75556c2f87e6f523e6fb593e80d179d858cdb71a4b93aa12893daa70b35707fdccbaa89db6de562c17db5542705a94a8943d831f5573c813f98b5f1c5916c3d78998c81b46771bf92722c73b16da38c33bd849793f00d63d79589a062dc57d683f2deb41fe85685e8e1c2b70155e08b642124b5dd9e92c5fb2e2e91b97b8106a719fae3eebc1be33f2c01bc9ba8be73bc594e6456c2f3355d7edb6ad2d293509a457ae4461d7fad8c6318b1b0b5cc7643133cc712c5a846faecfa7052e11a734a3236acd4be20d21f252817760a4e4d3aeaf26e2de57563175992f06fc642c97db3b2354116e41ec2cf97d11be2d48b808c28aeaa1c2ca4daea129f8b3e75c6bb1b9c35c2c82789aa9ded75f8517a938854403722c9768d6cee38e3dbc12116b53244d596166087388deab17e6cf822ecac83ce1289aa34ce3c720e97506652c06fb7b5767b316f524f31d9b99cfd31d85b067daeb9b19811829565581d98e9ae6ac05f42c169951a18e44116bf8c450df9c94eb64b333af5ef3e110f6669355ae919c585e6047cbd88c2a29964dfda7563495b501d30a05a468f3b9659faf5a6cf62b6be33babae7cec58ca3b8750a59c3c1ed9fa46a547626bcd1d15980d8513d699360e465347be6f9d42d15556b8da532956c28c09b25d55632470284bde94605af7f69eae11180528082d63410d5d2e50d1a10e0ad66eb93314b6ca61f3b4d2cd92343094ddf3d7afd5e77055fbaf4cec6201237354130dbd8f67151af55b09bb5edf597b40a4e592ba97e48db1e6bf57e9198d2300b6df89595e471185bee4ac57b6547f045d0a446a10d55626cb8d75acac60f336e2ad90e115d8b43183c6c246c3443dbdf2bb576ac5d41a07a431f7829919cc45dd9edc1b1580aedd9b7dec3b8327a8f1329c737c53971ac71e389b4275b4f37cea10c570ec62f18a67b1e08bb441fd62aaae34d7c391e2e29846fcceaa691cacb3b30d01d867786fda0ed45b3fe0762e93eb97a68a65d00227de20548512a889436e78cd0e33f2b551d717fa6373b0d26536c69d8c969e5ddee4bea9532090f08ece6a99ade916ef3386ac4c04076a9a1a91e08c27de2fbe267be3ef07ad2afd378fd384eab8b6d2f4fcad04d65e64aa6d206418d5be75a580df92d2eb16866d34c07abc3b22af2d39193e39d7d3aa33b239956cb6b349c635e916bc5d444d7472bb64c967e9b5f3b650e683903392673b1b7f792d412cdf3fc7f2de2dc0a4deda0659d693fd2fdbb195eb5fb71b1395545c06e232615bafb7b2a5ff00416c0412dd02c8df6f3b352c96ec2ad9c97477071f30e3add0e5c3fe3edc10d575ba304e6da35023d29349d30435e6a49bd0b0f717902668ebd2fd28fd876d750c45d59c5046c2fbc7ac52a1cc60a1c5af701fd58e7eb8f094b118ef847ab6e68464d9d6e2e23467f910c2f1efb75bcdca21d7bf1b847b76b0a21ced7d6fd71c726d12f69b24d98ea809b46411a3139ec703d65c3ebf75d4a3baa59b824be57aef1d8238accbdd57c0dde2cbc979ed8883694890638bb69f17d6670bb616fee367958316afaf40f40034f1d753bc2fcaed9d637f601b76a43a3faaf5bf7a7f2cae3757b1753ddeb95a6b708b6c357a1d1d37767d4d88585d514bedaed3154c0134d7d83aaf1da2cc5386539b9900390aa0438c334b6cf02b1559faec5e3bbbfc063a1bfc861282bb98ebf4c63476e5d986b9af5b46cb0bb4a6d5b74bd4c7916800d0b04e762807dca2ad8da5364bb0093d6ed27619bfeb63a842b75e6b0dbf5edcd740465ecca7b7eb0e6952cd4b0c975786c9fd5e9571c58554cee18ff539500b8ba967f72783861916bd859c5fb3c982b09e82a67758c8a82349b7bca76fd2439e6a2efec1c86615b43632ceaf159130f0d9baab0695fe963df506d018dbb16dc4d5517d456ff0f6ccb2860230108a0d6a242ca74cdb331caf6503b1cd93fad8d927e6bf3e17f2062d41c04a824b567f72718b38858da361b19de27b65d3f25fb01dacaca851fb049c674bd7da6159fb0e844ac6f3eac7b19a3ea3bb04534c07abc3b3a87224e0ccbae626f0c2b39c4ebb5a92dae47aef5b9f869a9ee7a8fbf81245adaf8d58316ebbbbc85e2fd9a160efd7d8e562df94541963cfcd2a6979185475606b6aee482b3d9e148edb69b5ddb39543e1813862369da9602ab6761f0faf6beeecb97caa9576b6dd88f9821b9a54fae2b76d1978d95c6eadbf52045dd4f568545a3e9ab90ed9b6e278d9fa6fcfeccb16b368dc34c91f6b52c8b73c58dcc4f7acec18d390bb006b7156dd19e27b642981dd82355865d838b24c5a16daf1c8b44bae706bba34ed37e3a630d587476a79ff0064e9c67376cfac09b06d267582cb2c5dd3e3c2c082a170df66f295837556c275db026e8545177b9291092d4d32973edaace066a1ecfa756c2b71ab1a9e3ae629cb8dfe94b5c168b51501d242e1ae475d307ea62a73a2ae4868aeab854d136a863686b5a7d4055290ca836ede2446efe215d65246bae2c3c9bb1ffbd6a899802fdcf34c55b0583f5623a26fd22c809b16c11cd6b1a1298bd7b61acf9ae7341f32935574dcf5f0c4e4dd0caf3435f729f94da700248e348c588de38883a193f54ba00e2645515516307548366c1b0d6b6d62c486c5eb7b1471040a849dc6757a22a49fafd326bff03e67252bf7624a510f05cbef64401b9cb35a87f6df01b62088b2da2a261f001639f0b8e7c2c79f000e7955358f02762087b1bbdb69ac9daef2317d168f678693794dc642cac6abbf0ce18b22cd3c4115fead6298631f5e6a78f8e3516bb26b7d0be661d46e2cc7805b8af8707dd2acf21b74f3c9edd3c708dcaac70ddc56cb84eeacada8aaeda8834590fae40cf97d5f88756931a96a5f7c3e31e5c7e32d2cc7b19e9f432b60c4f48c483622205dfbaf5bd728a8d5f01ebac0ca7a20b182cb57645597982ad1e92cc2d3651b1beacd4c18d10d8ae119dca2aab1631caad407597849653bbf33056333ada27be5493a2d4765d7c98f4de5c2156ce78e749ee33525798f67ae283684bc70ba49da5ad26b0f6d78b278306739654e9948d72e4a47a00ae1d6d3fe09ea046789aa60340fd7975bcb34d4d7cff621ee31675cbe9597e81b09d711a1b62f95ea092a980802a7915071710158ab21fe35c3d4447645410b830e269b00308becd754037d75535d31fcbfffc4001b11000203010101000000000000000000000111001030204050ffda0008010301013f01e570b471c71c792c978570343c087507626851c862a2a51600c76f876e3c17cbffc400191101000203000000000000000000000000110020305060ffda0008010201013f01ab47290877a6efffc4004f10000201020304040a05080706070100000102030411001221051331412232516110142352718191a1b1c1203342627224538292a2d1e1f0061530344373b225354454c2d2406364748393f1c3ffda0008010100063f02fec8bcaeb1a0e2cc6c3064893c97fcc54b6e63f7ea7d430478fcb39f328210a3f59fe58bc1b1e6a85f3aa679241ece183b9d93b2ae3ce847cce02cfb1f65ab162ba42388e2343a61e2a8d933d33c7d714d52e997f4786001b41e23e66d0874fd74f98c09264cb17e7e06dec5ed1c3d60603c6c1d0f0653707fb7cb9866ecfa52ee8a1dd7d64f29b4517a4f33dc31f910f1a987fc5d4ae8bfe5c7c07af5c21aca97959d802f21bdb157b2278123883491c6e074a32b7cad7e7c310c924524be2d50e80ab5b2e65041e1da3100bd8675e26d8910baee65ad273e6e8e52fc6fe8c7f486bd639639279045999b4e93e63cbeee28834703cd207a871268dbbe0003fa271bda29e4a637fb2df1edc5aaff00219cff00c4c0be4dbf1c7f3188965ca8d27d5c88d9a397f09f97f6d25447045296fac471d7f5f6e23c93494b98e5115444d96fdc7f71c1f1839d1892aeb1174b761cba8f61c5b2a4adcfc5e50feed0fbb0a0b38626d9376d9bd96c48cd33474cba59349663d8be68fbd850f6869a3faaa68f444fe7b7c3bd583a19321ab9808fa3c3ae78e9a6009769ef3eed140f38f6f0c7d56d597bc0893e2d8faada91779589fe0d82b06d458eff0062b627a7bface98cf5f4426409912a40ce02fa574f6f84a585451bfd65349d56efee3df8471319a8c9cbbc7ebc2de6c9f26fa237b2a477e19dad7c34b2485625e2fbb6b7c317fa6e69e44689fad4f3add7d4797bf0aa60aca167d3f266dec5ece5faa30a37d4558ff9aa88ed21f5ff000c244f154d3bc66e3772060a7bb5c352d7c14f5f19fabb265761dbafcb169e95e8243a5b7b93d99b43edc366da1253153649caf41f5f8f2e38deac50d537115735d88f4476b0f49388bc6f3cd50dd47ace9027eefd9f6634d3194cd76ec405be18c91ca0c9c721d0fb0e2c45c77e0b53e6a290f3a7d01f4af03ecc5ea445452b756ae985909fbf1f2f48c4fe43790c23319d0f9323b8e137743310e0b29c875188ea43d3451bf4658a77d19798230b4114b495bc4e48e72cd120ede8ebf1c33471e503ee589f416b7c3118f1d123df5026b9fd545c48ed156551ca1008334687dadf1c41041410d034a49dfe6573a0e6b6f9e11aa59aa9d0dc6f3803e8fa4ceec1557524f2c55d2526661000dbd3c1fd1e0b35c5b50468463772ee76846c19b7732588503524f0f773c46d0d34949071290eabfb07e582a268ba2430591d53fe91efc2d4a36d0e92674130df8b1e5a06b7ab1216a6a795ad9bad94df8fd5b71c1c827d9f2c89e4e29c840ad6ea81d53f1c4b0c7923a92bbc91157214947dab7e21889e3711545453ab67f34918a4497c59a227751151bbd2dd5e3e9f4e24749565a096fb98941b53f46e08b1d385b4edc2cd513acb1c8a1905b5f59b0f8625a6490c10c4173baf59efc87663774fb3944a74dec9c4f79201fda2311acb5b1551b6f1d7759a3a76e4bd1eb1f4f0c2e67acadb7d88ff002707d7957e38108d8d0098dcacf5526f6c2e06ba137d7d1df8758aa8933b6ab1344973e907372ecc31955267d3209e72f9787ddc6e28e5a29aa87412986673eb37d2d855abda178b42529e3dd9bfe2bdf104d244f26fe4c8cf98b3dadc6e78e23a8a7904b0c82eacbcfe90d8f4ed952c1a7239f62e241c8d3b5fda3c3ba43696bb5fc300ea8fd23ae2188d4f90cc3eb86751eabe188aa13c6c3a718274f458be2733d56ec4ac2de2f30b0ee31dbdf6c2a47347510c87c9b063cbadf6bdd970637615d094165fcdf0b1e7ecb2e248a47cd9732c729ebc7f748f7faf1b340371e2d1ebfa231044bd4a653249e93a28f89f6620a384daa5d84880f060ac2e2fdf7b628379a3ee12fecc6d695fa8acb6fd41fbf1572eefc6e5a9f2c94b9bc97ad89e1f1c3efd21a53a89128557759b4fb59f8e22feb0a3ac90368860626fa1b9fac2715354b1183796c8b67e87af7470c9515d5b4d509a3a64e1fb3867569a4a7a223c94f296ba3685ff00d3a7662d0c4918fb8b6f06ca5fb3e50ffa709b3e46bd2553580f31f91fa0aaceaacdd504f1f057e6e7948f46518aada722d95c6e63efedf978160cd94d436eafd8bc5bf641c56cdd2dec8df932db4c83ecfb2de0a4491e412cbf95c8c188289c117d7a9f562378aa4b47516de3d5dcf0bdba435275e070b5a56cf97a32ac8ca6d7fbcbecd70532c1ba453e5666b316bf9a09079627a7a9aa02695c74e593eb4dadcf9ff0c0a7ab99637a34c8c09d4a8ea9f58b60cd981a99fcb48a4d8eb61cf90d07ab10d4744957c99afc3d7cb503029e7a9f2f0dce461d365cdd12073e5c3151511b2d24d5736bbde281ba2bebe17ecd70659a95369239cb13c9678e31c2fc3862486292b4da3d25a42561436e24b5871c432d4ed94a9944799a39ed2744f782081a63696e9e30f09ce8c887cac5c1997313c0db06a6a9f7929e78a5ad9a271432b6e24661d1656e23f9ecc6e9ce6920630b1edb703eb163ebf0254c4b9a4a46cc40f34f1f9628153ac674b5bf1783779d7796be4beb6f0504e2e1927cb71de3f8622a4da7299a918e513375a3fde3124f5b51b8a2a6a549272bc5b53651de70b4db1e04d9f4918ca9a666b7c31432d64865a8923ceccddfae2b9c1d62a6dd2fe294dbfd2a7db85a38eab72b18e1069dfa9e38a0a7a97cf73959edc578927d586aab58d4b6f00ec4e083f540c4f0c79048ca421917300791b6123abdf4644762378756ee234cbeac6ecd44fe2e0f5691d8df4e1a1e90fe3a6166a280c2e1bc9bc90804806dd5b5fb78918921a9d9d278c46ba984abdaf71a73ede5882192d3188001c8e36e18911a86496158f86ac8e7370235e7ae1e67a011cc411166e88cbdf957dd84da06491e28c678c53af474e3975d7873239e165a7aa952175b3c556e50391e6e6ccbdd8de50414b39318b22792b9ef22e0e125976345b3e6a79466919d4b69cac38dfbfb7115415ba4272c83b626e8b0f9fe8e2ba995236746c8af2a06cbae845fbb194f8ccd5b2152e657ba2dafd418a6909d6a29813f8e33918fb32626589b24a508561c8e0c75c12ba2e0eae32b7b46363ed4d98e4524d5055e9df8c3265b81e8c49b376636474d259f983d8b8da35323b48e2203331bdee7f8782ae28d734b1f95403b47f0bf80b66390a440fa552dfbf14d46a0d9daee7b179e15545940b01845605965af2c40e6b1a85b7bce0f8dd152d6c65b8b45bb7b7a52d8da752a32910ee92df65a460a3e785451655161e092a60dd24f28caef24798dbb8f2c3f8e4ab014bc719cd67619bef581bfb38766055ac7157ca84a08507921caec785ff9e184cd178bc1bcfaba594e63e9245ceb6f462379699e95b7823633753bfa5edc5751f8955d7c11a02d251b684dae00b1d71355454ab4fd1531e6e9222dfb6fa35cff00f9843b5aa042b9726f23e8a32f7ff3db892a1605da16f2862b14e8f3d3aa78e28e6a5a79e823b9791a095555815fba75d6daf7608892d98dd989bb31ed279e2585fab22953ebc6cfad640e65811a40dc1994e56f862c5b67ec6e96a3c94775ff0051fe388a2cd9b715cf15c79ac9fbd7c13305b4153e590fa788f6e29e5cd68d2649187a0fff00b89a53aef1cb5fd270f54eb67ab7cc2fe68d07cfc15149594b04e2190a746e871254ec471455fd696866d0377a9fe7d589aaeade3a4a5864313331bb171c94733874d9312d3b368f5320cd237c87a3147e36e64a93183231edc6c934ca5e60d512280b9b5321e5eac4b512ecba796017433f8b052a7d23127fe656c0bfaa19be8bc91d53adf3108eaaca189bdf876e1e692a99db7e8f953524e61c49f6f2c55d3d46e9214a639d901b467ec7f3dd8a6a988887c6af315d090cdaadef6d02e2aea12a5552339a3a461746cdc49ee363c3046cfa3c827d6aa0a85caa39686c41bf60f4e2761bda1a29101f168a73f59cc8eeb5b0b1c6a11145801e1a13e6d45527ed83f3c669368d53b1d488e981d7d25f1b444058c2b554cc99b8db391f3c300729238f6625d9fb6635af589cae62324887b98627afa19967a7835955ba3247e91fbb116d0fe914c32b6b1d143abc9e9c2c3b3a821a78faa81fa47dd6c7d6d2ff00f5ff001c45b5235f2737425b726e5eef86292b14db75202ddebcfdd86a546bc31d4cd2dc7062cdfbb14d4e16f12b6f253d8a3f9b7af1a70c6cb91d4b265a88d829b1ebb03f1c048609121869da2a788375743999bb799c7e1af8cfb6371f4a3a349377906f643703b428d7b4fc3159b8b49142e86cada5af63f2c51d354bd82a2b1f465119f9feae2068c931ca86062baa5fae963e8f8fd2a5fbd57547f680c08db635249645e9969066d38e8d8da72c710851aa2972c6382f94e1e06aa51f93d674d48f3bed0f9faf1569f62a6068587c3df82caf9e1891628fd435f7df0933ade9a93ca31fbdf647f3d9e0a8d97b48b1fb32234448c337f47b6ac15238f8bcc4ab8c574f572c7494f42fbb9989ccd9bb1473c3c3465e9a9dbac03749ff0011f962810f11027c31b38c8018e3da1246f9b8598abfcf0e1abf67d3d4cb74964a285f54f3474401de7d18da49e66e6a7d48fafb8fd1969169aa8d6aa6654dc120f7e9cb0f3b50d4435c641d3c8cc4f3663a0d397a315511a7aaa82f23647dd11752a17328e639db10110d667125ccbb961a2a9e5cae75bf79c33c1b2a75956a098fc9bdd40ea9e1dbf13db8a7824a4ad4a99baa869cea79e2f6b7a7c249e031b2e2e7b93391df2396c742aaae8ee7fc5843afb41f9618a9ccb2d78507b422337eef04f473133532cad781ce80df97660ed5a29965a456c8f1be9246dd9df84976e6d2a7d9d09fb0a7348710eced9f23d998019626e931edf026d6857a717426b79bc8e126864314a86eaebc462b158646a99e399c0e170841f7db14d4918bb4ce1712c34f2ac869ce470bf64f66368586abbaab5f5741bdc570f353d3b84011a3a89d94447b78e98546788d35479173135d2ce397afe188849f5d1f9293f12e87e86c7a85d2515623bfdd65371892319a09179c82d6f6e23cb502a2377dde839f0d2dcaf8dd3c3babb583ccd954f7df061f279f3582a938da7236ad0c51469dc0dc9fa0d0a1f2952440bfa5c7d82e7d58a8aca7b658a4cb0dc5c00ba0f860565452d01f26d7789f7520935b0c80ebcb96367adb5585ea1fd323597dc871bda995618ae173b70b9c572dba12bef90f686d7134041649268a42bda1493fbb12d5d4be691cfea8ec186da932f91a7d22bf37fe1e064750e8c2c54f0230d36c8911a23aee25362be838a6a79e90c6f50fbb8c961663e9c0a5824deeda993cacebfe021e4bde7b71b522fc0df1c46eff00566f4f2fe093a3f1ca7d589a0a9a98e234afb9cb293dfc2c314f526789b7df56a99b35bced40d3104e4ff7b1bb97eed428ff00a96c7d5f43663b68ab5a84fb1b1be913a0465450f94aa9f5f1c3e72908471209ba5e4c0f96bc31bea40fe5098da32be510eb70476e26cd59b9783208f36975b2feee1df8db3f860ff49fa1533ab7d4834d077ccc3a4dfa2bf1385a66820992a595184e3e079628a92082a68eaaa64cad4d3d8eec76dfb38fb3124c82c923658ffcb5e8afc2febc4283edd40bfb0e23d8bb45f2c9c28eab9c67cc3da312ece8e9f7f511ae73bb616cbdb856da2e94b07354399cfcb115353a08e18c5954780556cfa89e2929f57489c8cc9cfd98ce9b46a8376ef8e161ae1bdaba79527a7a8516e903c1bdf8acaa57ce92b6653dd6d31b5f6ad51cb12e48d7ef1d4d87bb1be923dd89b3c6c80f0c536d3a9837e99b71571ded7914687f4858e1ebeb1969696f669a4d11479aa39e9c8626a56998ecea836dedac508ea49e91831cb6155169201c0f630ee3e1d93ffbe8fe0d8ea281e8c0da12affb2a9dff0027451fde24f3fd0397b7076a45199ac3f2e83275d7948bf786229a3a7a7950f9547080f1e78db5e883fd27c2218580a9941ca5b846a38b9ee185829e409454ea561deb5b3f693dec71b8da9078a542f445540b623f1a73f71c4d5d762f2b78ad33371d7aefea5f8e279d1465a684955f40d0612b211965a79d77d17997047b3103ab64657043766b8dad534699ab2ae6cab2bf55225165b77e33cbb46a0b774857e189368d6d554490119214964241ed6f0b546cb963a7cfab412757d58cbbb82de76f74c7f54c9923755123ca0f472768edc0d954975a1a12507df7fb4c7154a7825413fb230f2310d495082399975b79927a8fb8f761a8b695414f125caaa75badfec7b71b3d11129224a6de48e7b58922fda6d9710d1d44c22a88ba34d50fd523f36ff77b0f2c30b18a78f49216eb2ff0eff06c9ffdf47f06c3ecc8091471ff007c9579ff00e50f9e1283c4cc51268b76cb6f5623f26c8f32dee6c485e4311c91ff00b96b5ae87fe5e43cbf09f8e36d7a20ff0049f00455df54bfd5c239f79ec1df8936650ca2796636aaaabd95adf601e48313d1d750466a91ac24999c0f41b1f7e20d951d053d2ca0d8c8b7628bde493a0c47246b68113754e0f99cdbf48ebecc573c6c195c28ccbf88601957794928dd5445e721c52d3d2113c158d6a763c7d78b0481879c25c2c9b52a23dd0d7750124b7af09146a1234195557801e11594d593ff00579d1e38dadbb3eae58ce9553abf9c2437c5054cedbf9694db787acd19e2a7b7159244fbc89e56656ed04e1363424c734e77d54798bf04f66a711472748c04c0c0f672f71c2c49fde631f92c87fc55fcd1ef1cb1f95b6e23a58d54c4343a0cba0edc56543c31c1045610b28d73dfab7fb5a5ce2282bda4cb1e915647f5b1777de5ee38592a191e03c2b20d623e9e69ebf6e17c4aa163a84613412f15b8c474d0ec58f2af16f1d1763cc9e8f3c354567f476e9d67682ab337a72e97c09e936078cd35ad1cd2cfb9cc3b87661e887f47a0f16704347e382c7f671513ed1a806592d72cf7088a2ca0b73f4e0cb13a434fff003951d4fd11c5f12516ce32470c80b4d5326b2cc14126f6e02c3aa31bb5de3d2ca54b92b91f4e5cff009b62181e1de56dc253189aedbbe41bb7bb0f0bf4a57fef92ff00fc47fd58ada91a148ecbe93a0c54ec2a87bd3558b445bfc39397a89c18dc64653958372c19e8c8b410f8b53c8c2f947361de719e6ac9e46ed690e16415d509b3e13e5333dc37dd17fa0c8ea1d1858ab70386928aa1a8effe195ccbeac5ab76dc43ee2594fbce291aa1ccfb326feef231baef7cd6f96369ef3adbf6f8e369fe6f3a5bd3637f961a2945d4fb4778c66195368fd89382557a7b1fe388a9a78bc5fc59726e42e500f336ed3e0ded1d43c0fcf29d0fa473c5ea6964a573c66d9ed93377943d1381976a533fddab85a16fd61718eb6ce93f057afcc6000db36251e7578d3d830736d4814f9b45034a7f59b4c66a5a569a41c2a2bdb7847784ea8c6fab2a1ea24ed73c30934323452a1baba1b1185a21355ed09e7cbe4a5398235fecff003db8bdc3577096a06ab4ff00753b5fbf961628972a2f0187cbc37c99bd1fcdb0997ad985b10434e777384cfb4245eaa0e5fa4716a3db6887f372956f81c2bd65734e9e644b96febc253d344b0c29a2a2fd1ff6754c914d1ea6146b094766192552b229b306e230d12c8c236e297d311b30ded4b058ee38b9e03e58876653e5936acc37d2dfa917de6ee1efc3cd056bed8d9e1ad3b1fad85b9b5b9ae3ec5453c82e08d41c7e50af3051d0ab8c5e68fb987db1efc6f48151467ab530ea87f7620f19dc78b5fcaf8c7572f3c502ecf91c5a9c189235bc654b1d6f7bdf8e2b3799af140d2258f316c426edbc9a9e59d5875464cdd1fd9f78c4e0bb0969962798f2b3db87a330c46b9482e58ab03995d3ec9bf6f1c578da351fe1877465ca2301b886fe78e2a163112c41ba0216ccb97958e37c6d4945cea66d07abb4e2d0a3d3c6dd7a89349e6ffb17df8b9294d4d10f4003114b5b5926c8a276b53aae92c8de7b7628ecf6e2ab636d0ca956f1e8ebd59472917dda6324d181514cfc1b85f91c481e776123677e9758f69f01a9aea8996371e4a919b80ed3f4f79554fe5bf3b19cadfc7199d6798763c9a7bb11ecca1a48e3ad3e52268ba261b7f8acdd9f1c49b3e86669a363f9556375aa5bfedc2d4d249bb907b18761c17d9ac9475cdacbb365368a63da8791fe4e0c24353d5af5e9a6d1c7ef1de30d2c44d34cdd678f83fe25e07059e8b76df9fd9da7b623f2c04a5ae82ab2e8b0cc77320fd17c546f364d43ef623112ab9ac0fa2f89a0582a50ca32b660d6039d87cf0e63a195a6944425390b06c96b696e7617c648f65d4245bc696d202356e3ab5b0c9535f0c19b47869ef3c9faab80c94576fcfed0e91f54634f6e16590b54d40e12cbf67f08e0beac0810354d637569a1d58fa7b0779c092bd92bb68aeb150c67c8d39ed6ed386a9aa90cb2b73ecee188f67d7ca63855af4d563ad4cdff006e2b60da91255ed498e795e60184a9f64a7ddf86332c3253ff0095269efc2cf1d399665e0f3366b7f626644cec58202dd44bfda6eec7892e722ac679eb8ffc41f347628ecf0eea99734c067006874c253ed784d7c49d49d4e59e2f4362f43549b6611c629088ea53e4deec085dcd2d47e66a4646f7f1f5632cb1a4abd8c2f8f271341fe4c8c9f038d2b2b07ff35fe38d6aeb1bff00988f863a7099bfce7693e271963458d7b145b0614735751f99a61bc6f770f5e2f5f549b1a03c218cef2a5fe4beff004e1e8f61523d2c6fd79074e793bc9c15991e393989058f85e965ccb0d18de415fce9dbcdef1dd859a48f235cae61d592df697b8ff645580653a1070f04901aed8adc611ac94dde9ddddcb02ae99fc77663ea9529adbf1634d708384cd0c9349f75029ca3d7c7d984f1897c56020b963c728e27d1df874d9c5e6297743d47b0e78f17abdded0847186b533fbf8e3ea6bb6637fe8e7cf1fea369eec793dbf19eeaca223deb618ff79ec47f4ccc98ff0079ec44f44ccf8f29fd20897ba8a889f79be358abf6a37feb27c91feaae9eec6e29775b360fcdd1a64f7e245a80e2707a7bceb5f1b3a68beaa66937a479e0e80fabe78aa8aa8e7a8a0caf0ca78e526c57dfe0f1dad93c4b65af199b8bf72e2389a9fc4b6447f5747c1a6fbd27eef6e2c341fda4951b34a2349f5b4b27d54dfb8f7e1ceccbd057aeafb3a7d3d687f9f56266a888f8e188c27c61797cf0d92a054d657b5a7957ec20e098acace13559f158bf0f173f0189e8a7eb55b14a663f624517f7dc0c54bcf1b6f56411a59adaeb7bfb31495925594f182ca14c5c2dc79e23cf95e39573c72a1bab8c554f12de3a650cfedc450cf2b428ec173aa66b7bf1078d2ad4d13b692a9e8baf3f5e1e220295932d87a712d3cd24316d74761010df5cb7eab761ecc546ceada5df5339bbd3cbd12adda0f238345b32924f284165cd9d8fa4e9a61456aff59ed2e2b410f513bddbf9f5e12ab6832cf509f57120f250fe11dbdffdb859e3cd9755706cc87b41e58dd56d30db94638368b531feff00761db62d689597ad4753d0953f9efc414bb469de1582e232c961af1d4687143e2aee1a0198dc5ba77bdfe1ecc53c94da6f878c4ca39487423f66febc6c182daee5e4b7e2738d8f4536954b9e6643c5158e98a2df4d951c17a887213991f4b7b35f5e26a7bdf21ba3f6afd938a9a7aa80cfb32a9b7a607d3adadd7b0eb879e1769298b892fcfbf0f51b32926d5cb865e0a7f170c06db75c64a97d7c4e92f24aff003fe78e373042bb0e879a45633c9e96e5ef38ddd3c4235e27b49ed279ff00e0878c421dd7ab20d197d078e0ad3d62d643f98af5cdfb63e60e0f8f6c09e91b9cdb3ce74f76bfb38b52ededc3fe6ead2c7fe9c0f15db314cbcbcbb8fdf82edb895c9b96335efed18de4de2b9ec05f3dbe0b846da3b5a95720b02ce4e5f862d53b71ab24f32912e7dd9b03c43fa3cf33729f68b651ec373eec5aaebb7317e62857763f5b8fc30569a058afc48e2de93cff00f0f6963490763adf04c3470447b52303042544a83eeb918b493c920fbce4e034b454f2376b4409c5a34541d8a2dfdb7fffc4002910010001030402010403010101000000000111002131415161817191a11020b1c130d1f0e1f140ffda0008010100013f21fe223af30476d05136be97e50734c211a03c5e5f20a0d462cddd2280f15153eb05f3de92bc1269148df13ad58401d9553ed5b001c57e0f344c84c11fe7e9284eecc10e1fe7bbb46fbfaa9fb4731c999b7ec2de298cceb5f5fe165baadafbaaae430071501a83a524cc309992f68a50c43ccb870472519617a6004e569345143906e446557312229842c8b432e6a67b1d74c88ccb13a94a2fe0d434063b1430136f297d4f4b41acb9fee9bcafe6a7f94e89c9c58409a216bd9d6a66e07c5a0fd8854060a7995b330b4a1ce956c03b2fb52851988f059cd166f114d11a6dc7d9dd51c6f58f92b37c1abcbea1e0e42d1b18391762d44defc68f884fba697f30fd4d41f46bf5353edc8370825eea0c725c62086c0c533f42da3d77136766d43be45efb1c5d0eb7bb9fa4d4d66de881d13427a6660f6508861fbb35af151bf05e7acc3828b21d26b1b5f0a10054bb1d8184ff004a29d14dc5a53892030e28f604e94a40e2498453862f5a23213ce6469231bb6a1581128db354bb45d078ac288f0e97c7223e29e52f889b346d6d803468003429310946011998343db084ae6f61a6624c971529f38c79c0f75115c5966c5f9f25e6293ef1328499d5f19a995998044a8e36f6547a16fdf8611a77a0983ad4606c6a9330b46bedee81ba6317cad33508e5ef0eb2098dade6890f441b3826672a78ab290d4c918a4f9d49d98250637c1827965e6b1f69006578019568b00e58b90a3618f7f40f30a5e4ee3415dbb75b1c302c7314823849740b3ed518e4c409a24d31b98a74211ac34e44470a9cacc30960c84d222a0991bf1450e7131878a1a4cfe40c05b938d68eea82301aa6376b22388bcc570945ecd18a7524055d27a9818d6f782d08de441ff25a53da459a77b4419cded149258a453181c216c342ff002cf754c4dec36099a97b64c693cf1687b528658ba0850091ca65a295509ea290820472c51108458eb26568b0ef537f7753785b91a94d39284b896645ed283c4350e8ab4ba64aa0b5a75a9f9f2ac3ee7684dd79dfc1177aa03e1be8c19580cad055997badf98f18288c882366c8c13cc8f3494f193e6cda7c476510cc03d8b2ca37b86df16a720c16ed9a0920bd16ab3b72414404482add5eb503311797aef01d5d2d4a98c0594ab2f95f0ff85a6ea1616e1cc3e8b1da8822103330c2857b6a361da4a3ae432725acbacd8919a479f1a1414d9dfa68ed4be8d480a456c10984b5f34d27b72300244bbcf9c54fc346cceb29b5867c54f3b308a471b325484ba9905a07e1f4ff00d41515d4e57260f387adbecc23cdc639835a9abbbba678140a932ba645fb07bfa42185a9c5857aecc51b0240eeca1e508733bd22289116bd381c2163450e59e0a347f163ce0173992c66d42dc9225cf015df90d2f46e07965c09af13759d694c702622486333b20638543c043c189960c35634a08ad0a94b6165f812d5f438465d36bb96d10a22d628125077288b336cd174bd898a286c40d6e48a6d2ba65e41652d6dac54eef56b30420085ceb1584d059c0c888294c24c86659245cbb6beb50fa60c638a42ad7a0d136182f4be5f1e7f60fd23946b31143ea174d49a45ea4c3e92786af9a36fa2cfa21a12bfa51d44232ee15f64e292d1a2974bfd0b55debccc2c66cf4f9a085438170636129a0c077d7652247ce4216e04ba5bdea6b5084105702ec125d8a274da588e87b0b4b81f163ee2cc34cc5b47482d3e3c13045ab15e91bd8162526231117a3224d99560962dd2f563870e59c8894164bbab04a0346addb96d734749f056534a4991347f348342a371900ef705f68ac80bc7ba28f708604d21c964a22369296d13b55cbd8b61a2018d0a82899cd52c5b0318163782841b816657009d54efbe8584841babe6ad1b6194d804de7ac52cddcb93172af4a4c792b4167dd1b5ca5f90023d8d19552a273c869e280dd87bea7c5abfd538ea6e4a7bafd2d00c112b750e583ba6a5c470ea69fb7de945082d3bbf5f2945d0a06818acf09ff671dd0aee0623cb794f99a413f058d781a4278c8d00b7d211fb694206697ece2af2910845744212eb74b452f645be833959bb2c985054b2239e048a80c99b0b819e1fe4630c803117304f541fbeab29c48a11887259a771024cfe1353c16425c4aa72442fa8a79c0ddbcc1b908094de89cc49c90ad7d4d6a6aef238d149e8bcaa57d9318a912af342b49df021fcd18cb4f061e18cf9a01bea5c9cd89021a5ac2c8c2f6dc26fd27b4d85695f14bd947a4065e75bd3ed4e9a4bad647f74cfad2a1fdc32ecfa2cacd048366652e7150c82f9904b6692354fb084bf9039a38e7063f1a3c07cb56f94e4564bf9a93297c372ca7fa53015171dc490dc534a056333fe3d3ec425352f7330093175e692358664e72aeb610a227379b88bda33b3cea3954995ef561062260c54d361cc622048403b516abac3a05644aca64245e6f0018827746c0cf55a7f8cc1f53233d4c4fca9c86c40445c8937d629d73a989aecde28cbd40395bd449ae21545271a8d06ae9305e94d94f828a62f74ccc2c077dd0b211351600203c5fe9b3c7886161c9f3651440806e41ed3597a9ed009d0f6d4620205952cf9b5114d9b22b1f0985629bc3e142b44bb0714b99488d36a201be741f3f70ccab1c5e5db323c144c8ad9e669021862ee74a97931885b176b91c2f59360d8d0530e2dbe5f70a6380ebf4aa40e81f5bd297e0a2f46a66e182ded1ad6956449a5020a0114a50e6eba07cd63f0f324059e66a53a81c59fec5fe8b214b0aa0e639192b4648e1e1897b0f343535b2045864c91285f3464d43d1a67e1f9a15107474b6a25edad8a078854114e4068641b8190e537b6e06367f9b433f56956e4bb3252996a558530992e43b313100d672b62143de197c459a422990708d172104b3a39347f6b492574803693715028902603058b1bd41c93d323eac9c14af153ecd9ac908f51502c7016e8bf2a6acae6863eda09451f9b978889ddcdcf9a032942510118c8846f382b20527834223b2690f1090b22524abf4599c01199fc2b1e1e289f49984e293ce6b7f78a54ef2c2e84dde897aa1a3c766c65cd286481eecbd7404601a442f4899713a36a91721ab1d1168151c8997cc4ddc4f67d8464127303e2607a294be2d4714e6f2ce26ae32d4324ae5901137cb88a876a48c426c8a45bcf14e814cf0b0c2aa1187f53442ccf74d1bcb1e8fb228115e66c54c7944d0303786ceaa643c17b70c6037db09bd33d00a790ff00a5eb338a30120969f970363387727550bdeec241dcd1594d42db4368292f1d696dfe9f29b7d1a310d94644a12817a51813cc7752d5727b582877441762ff00e18bc6d3538b64efb68d5cd78a5ebde52b53dd25d5896b2f66f468e4b08c6c852b4ebd5177800e0d9f17fd3f63df25b6066a64e52fdf902e33a5f89a922004d3cc488225106542342edf166c02ba1c97a850805231090a32e603219a463655fb1b89a03c05dc4ee54ba2ad3e6d705df23b54be43775c6c55848679a86c20ec27432a5de80bc81ff31486c8557f923a1a3e680e91915892913cd0334c9bc322cf32f8ad92ef8ffafd2648f326ca06ec27dd0629d4bf96a2346e28560d12125436b7c2a1d16ea959592cfbcaf452754bd094cef1158017cb58269e95a04900a882d9c8b0a0719f31d206899ef35695dd7cf4fb8f9323f5124d42a289ac2d4ecedb0a4dc6b13d1d9430b423b01406132f19398a69050896e8bbbbfd827fa7040a3bed835a659af70ca9ee7273436d6138b60c00b5ceca9da360b0f826398512838f1ff8054e6ff3cb7879290ff557688cc4c17a3d46053650d55ddbcd6a7b2d0782014ef757aee05e20efe892526e14021755831e2291b870bfebe29924cd00a361b98f350b626b7f6e56de0a9d18983827fa6ad56188723e6bf250755342b0018bdda5bc55df74840f565861cda0aba631ee72dbbb1569b6cbbfb5a0b3f53098549d1c1774e85b2d444e672b24105c44d9a664730f522ce81fe690cc8110dcb65c682d9fa8945c364c3b934755f2c0811986ecb2b579737ee55fa35f0159c9ed6b8ca8c942ddc2abfc14c1a3f2f74bf25d0e5410d92488937aba428633bb327254c55f566e1e06676ae1d5a8f927e2a434e5c405041e2839e4280600fa94f90c8ef365dbbaf55c5ea5f69a05cd8b79cfa365c35e7200e07e6a3c2af60278ac3c91bd42b5e2122f2e203aa5137d330dd5f32f52765a10859d8050de21338d6c55bfce8a639b293310630cc78f3a3ba6dff2348d6b91fc0e4e2ca726cf8a89e1169c511288bbab254ab4d878f9d6c07a28c6b8b1de1bee1ac4d4a0d1181cd35b6c40c00483302686d3b269f966d16e5af05f0d55429107cd48f219a5d21b22f3ae258a23246dd2c399e329ccda0ac0928990d45f4aeb5b1c75f874fdca52c99a4d51bf600fbde9db46842e611f14b8ce49076336b394c527426657f7403aeb6e3d22faec75f63c681920e44a91ab9626f613e6ad3eba97bfd156b7a0006214deeeeb73442231f8c3e229407fca1d532a5f23085c4d11b8d5e59b421431a0ceb46b11dac5bc3b9d85fa7f9c904b0f3451a33085ac9273468e7f7a7c2952b399f8c3438120228f0f43823f50c1f1a9ea299bbb2bbe0a5689890700c078aba48001b8d41875601293bb19b408e6914c3e2ceada9870f82030d01f2aeab99a7ffaf27f742932e09bcdaa2ddd178b7767c348f7d43ec3f144e55d8bf736f14020e0603ed6177370d277dbfed3e8c0689a8d42e6e2bd0c8c7ee9adc0849ae3cc43aa091923b2d97d8003516d50118414e8c05dcc05b49306307420e88feea5b0121dfa5ef873768866efee6ee1a9d40e547e74ed1798a8f5302d993b86ecd402955183656b97abae628be922328af2460a77bbd8733089bf519be280d10de280ee6418b58a43e9617044dcde30514f87f7685a2ed0e33397e139da0a81be8242d8fc45dc523be9ad3784bd158b80cbf42a0aa73b5af8adda3b29b49385305f90c26f4e0224abbec68d99e2a12cf4936a70ec7bfbec6b18ba3ca7e5350c2b5e7c05355d0d3be00e7878940d956f6ce87018eb2f46dd33b435292807394d77c74d68540c83cd0c79039a0f7f83d87ca4ec9532cef60796c7bb4b500949a562d6aae75a8f9883081718b4a4eeb60276394b2b49a8001143ee04cb156f7cc09170163fed5a5d092491865d41bb43b8f5cf33fe59e28320c405f02c7814685649e568f1053c1bbff40fa7bbd066b5659b0340d036a9ff004bb8b7dd84c5ef6c5dc54f9f2f458832ce94855ba37c25f1570965e9dc313cc7f09e9b369144ba1d5a2909739bc1fe0d33f493265693261de9b49e446e19f63cb46415223f331e8f269c8ffeae59d8d4f01d197dd7e104fa22996d3b4ff6508db36fea2854b3fec1a8607e060f5464aff7dc3b0acdba063e23e03c153e2c46f6da7b5e4acdfc2977567eb2870921ba2e53d33688c4388b7917afac4fce5fe10ba307226d1578659967b93b2fa2d6a2f3b3174218f38f18a46014e035a548bb2cabed5fe2b6d8554b2913f25b69a196f0326417cc6cd3ac441ff87335081e1b3e175404f2ff00ed28c27390f4cd057e77c01142be407d28a91ed41f33ba6da585fecf51505005c7c8b4db26ec607802d439a15faced7610ff00e5629fe75b5e1759c4fa968122f94fe93acf3e946000580d3f8f353c024f9f326bec3c8d1fe1cffea23c49417418991412ced226f5326341c7c859565e0ab8f27eb80288fb633761ed2ed51f1e34318443310db344d57319304a2b5f6a7f7e58a11fd309532c07b0c2df2f55179d2a458b88b50f0e66afb044804da95c8de32216a2d47718d447612d26744acbc580cb5b76455aeb56c78b0013b1ddaadc9c6e767083cfaa68db08fce72df68fe791714ab6c775e1ad81ba1386c75579abd43ba39107d0f345fcd626b8192499bb430a84362b585d2348f59f808fef5554230acd87c159e4b5960bb4e62980562a120b4d228598395571f245462e0ec0107d0d9dd4869d0862087999a7e75c92a673009564ce3b89fc828c921963779d5e42a6db3217dd0bae5ffe271d581e3b674d3c7a4678d8b94154aff26447da902535806ed0cbe2ace297fc1b7e545dcc0097392889690840416d008a6846d316c49656f9627ff253e83e0fcffa0d0cf1cc1b2e5f54cb029a5b74baf2ff00f334c76ac0f9adf8ddff000510a1a7ec284eca7e62b374ff003a2503dab63e3f9bffda000c03010002000300000010f3cd3c9393f79e9e3cf3cf3cf2832c9ffa54e7c74033453cf21b0693c52000472c835d3c21fbcbce4538f24af81f6dfc594e9171051ce00b046bcdcd3dc786f3c71823ce1f6d58f0cec09c4bc620f1cbc86ef88cc44d3c7d4b34f3cf9c78ddfcf67982d47a8b10755bbb15fcf24dadf4bfde3f397d5b9f3cf3c5cbc6d77917678b2fcf3cf3cb13486efd7f00eb73cf3cf3cf3c32fac97d7b3cf3cf3cffc4001f1100020202030101010000000000000000000111311021204151306191ffda0008010301013f10e2824888a1a43f047c934ad10c258418e1d738d4e293f2a4acc6a4b49223705381f24568816943292f09459ec161befe0b63b138b365088fd13d4311629f04ba1d9037d2c7a15453c3d7258ec9f4e858654c5027627235e724bfa313b1c0daeb0b44a626a87a7a16e872da1b2204ccd36371b65b92a09486e73068dba1a9d942e8caec9787d11764766963971421e11e10c86242f063f8aae0c6fe7399279fffc4001e11000202020301010000000000000000000001113110212041513061ffda0008010201013f10e2f2962f99a9238081739deb12be53bccee0fdc3fd17264f7894c9c3d8ac65b8f835b8151d9fbc1896e7e0ec547796bb42459322e4cad8a8b12c33627d11027ef26f0fc3629caf0ada2d104924924c9675a16ec73d0b596bb447a4f45de0f621097a6a0923c12f78b18ab12b1286cbc2af8566308bf9c708e7ffc40028100101000202020202020301000300000001110021314151617181109120a130b1f040d1e1f1ffda0008010100013f10ff000d9918d6797dc030626bb066f4daf4a9d613e14a53ca67af8238c566c43306b43d150c42a810c484c29000aef8d30d1510a0102a0222531d689439d54fc713136a8090f04c3ec7b30ed7ecb82533b40f391b7ecf90051faff38c472a8324e7b7666c0f4ff058607babd2596f69cca95638169e81d25e00e8a1c97788ac3802c51c82c01ae30ce2293007a52d0689249a7936294b1c1b25e70546b1c21542004555313ed086a07905b5e263465807b34643a1d0309e70519da850309ba92e527970d4f4110d86b8de0da017fcb5b63cb78d3b8e0918456ebb22b33b801700ff00963b2c5a568303e0208d25f79a3a4d2c8d02164a194779512990e36ccb0b069c5c1c7ba809d9b7ce254deb65e9099d535bde3b093685b642f5175cc4c6de139391e51682b5f81260c7e334c48fa2d4ac02828294d6150caa59c939a1b7a73ac3317a25ec187d98a1041b2af6dffa3000fa290a4a6d4248d1bc254b8821a68d116751097973f836435e86d3959048a22d8675c40581b7b4ebc20f4c041a6e59912e479c3b558174e8022b7a324b2cc6f16c1da1a76f18a8a85288cf8fe48047870e8d2aee79d4b380f022d9b8154f249840ed0d9e4c1d8ba0f362d6e743773b385a2ecfa90c2240d41431670d173080d2a383a04115ea9c8063d055d37c0e4c5f296c0ae029914c7286dab4aabb08046c2615d604cbd001420e61260e301b940403e311e78d5a83488a08f0e478c4a36c02111a18731e0a878471f7f6ba2fbc7dd9e62738673800c0022aa82455604c039db8801104935f498fb5c32bf1021106f681b4c1fde028f4204a415149a1c5b2f83ab1cd309201131b5f30ba86c04262e981990b580721506d7c7aca87b7055568526a4106cc65cf2c89200a800cb58cc06c4282ae8f89900268760087f12e1d5cd5420002abc66af25215b9df12b2f409722805b8a202d8c53c22888a277b742130bb6b1a7bb4623d70a954f04f04c2e9c416bd3c0a852086ca2546bba48ac0aa2ca4af9df0275a0238aabb400ee26b1415e88e0a612ab41856abc011ce7a291122b8d56587300f228962275c63caf99859000b2a90f712962c0d07e106a0e8bb0c19c1303360c44203ceccd521e9131142053bc54dcec7433dad1eac25d1bc170c39134c03caa53822ec738782a3139006f39770144492e4af1676566ada570c183f5884d0555d4702b405d04411b24ba274e29e3bcc361ec2881be80b997b6e66d40d256da1da8483f605aa6f91391ac47f623447622209fca2460a2725f179a8e06d297c29053fb0e7cfe087195100ed714586060d43a6df1a26832f23065d89082c1170476a0f24424d98cb5a363a228949dda84b44afbc81875fc428a855b5c03856f2503d76157b742ec34c4e5c25cad6141c221e0885e3232a882fc98428b3222c9e7304f1ea60631ebc284609f17830af00220245007c500c5ca73e0d6be15be031170a80664880089a9c800d646968ab688914580371c5708f74445f013685c6f240ec176f3814daa0e67ca9280282d200828a9823ae21cf1043ea192863c52f2df982e7181db383d3a3fa3fdb828e3646907a1817cb5c869f9519a8a34219b0258778078cda8d599b6b7a039f4e4e27b5205fd447c9e3f8d5931eceff00ad3bd7c195d6918910a47a1380779540d28d113913c9ef10a319c2604b8b6390a64626e5b61f32502a2c6244b85d906c8348da0e07f7d92be4864f488d6103ab99087711cea00ee95b5e512c97d0a007672461b078b6115085a31ee37ab3f91121486c186f6c60fe032a71b408a26d0081350d111e240fad16088929687e0649ea04548e55977713d31d7d953c012c6a534814aba0e6d5ea75453426c66a8cd05029f980c10004f407fc63ad526e4082af15e17ac02f5c1566ef6e009ac0d61f544107937d61b1df82f030f583af46099537105073dd90b26cfc1d07a726e5f37bbce346715a07262eb62362847e2cc0990589b074a1c20849a711972af329ed5ca69700545001138eb3917f69694f6826e3f39059c56ea20452140e89308eaae5b9c76c4cb2cc862ce82218e8267f6f144bc5aa84410626324d78cc47baa100488c520380b2459bb7c7d86a990e36083a20a169915703d4ab3503d02128449a5729bf0a76b440a5542c351973cc2667ea0d2d5615157ddea8e880253d6de97d5fc318435540ba208cac1f46b94d20857688a18b74aacc54cf04034ed184540f460cd1d538045869c7b10f984b0f3801ded31274340c7fac6a65dd7260036a3268bce2ad2cdb4fd82bfd9d41d1906db0e89443f592e4e5c8cf70076bd60d831a1f2d952cf1516814cea79f4487828b684db12738960942afcbbfc240298a6572c0072e361f0e70e78faccaf8fd83de1ec78f4b16f06885781d9865049818007800c432637f75053dadcdbbf862a5600797f270160cb4161f003efc600cd6781007c01f8902dae8a081270ac15b54274bc5800593af14d02da5151fd3a1502ce2e773aa58e21082103306332b53a5d000020d28d0e32a292e9b821b5071d2f1069ed6102da282cac3266edcdea3090140e04fe8754f63581fb0e2e01a24b8173450b97863ead58e053c402a74070197e9b9db7fa9658e5b06c5f70abcb2299b71f9104011aa6dc6936ff6c0dade864f9c4d18f3c868b093e554f1e732a36ac1b4479385e588b79ccaa0fce22c90243acf613d89c653c98231dd3781d509ee60ea65173d840adc254a724a3d525a5bb61e741520a01378267004b507c05e6c622adc2e6800451c7580a9baea5a3415113c10ca8ddd0b628d555032c717e1de3b06fecbf94a630104f796da368e3d9081fa753dae09d34d72031ceab6c3ca55d016808ab5410389fc21ebd6888a1684ef06fce501672a8740536267d937d261048ae8a18a28e88786b462086dd03629485c17007e4781fd227f5a8f787a7ffd82b54248867bc32f5d92e094190c67314ce4683e8101ec5b9a22f20296076d1985d673907f151455c4aa8ec10095e4640012029423653c3e39135ae1250011e5fc4ca295982c51c046ddf2aec76f7dd4a7f03f662c8b002ad70ec227fab14d593258d75607b1d5c6cb51e89d4c8d8c9ad6380068ab6144cabc35ea1721d51ee80c4a27d5cb2f941fc78c39a028a90d45d1369754738246803095b6a4e32a994a1b74c5426dd17436a064c9804700d894a151a4ae1c7f1be8609e9a7f6bf5936a17d2eadea5548b7c632cf2404d4101ed2eb7716787ce1ce66aa550e2a87f4f0ca5b8f69920b3fa2631ac6eb53cd71b09392730cd73d196797b516785e4fc431c1c802c6da07804f392729f24d12529bf6bb674efe7809579d346858cfb0c0658c9d9d00f85ab90f398b79fbb8e7bc8a8bc9b1d3372e2e1c0bd398092d280a8604dc90ae1367c64002223c27e54162fa30afe284d9a92c8d259ceb13f7a0a10cd80a5d8e07224135711808a8a681ecd3c39712b2cee22e898a29ca43687d88ac45b05694e2e0c5e46d4022cc569c0597c0c53f4fe41634ee0055fd6745d26a9e3c9fda62853016d7b1e17bc0961740ccdebfda303cc098cafd6d1cb68e80f6d0288faa73239e6dc680d840b63f04a7231f626f183d9eebc9aad373a8000171375f196d80e562f45d61915590762bfddbddd331dedc15173c0446c86d98787b86aa2fe851e85e3208d38c8221a8390e38724b40055ad3d2acf27ac78fdcda00ffda006a41cd0296ee38ede6b8f498dce3af3620eaa7e9bf845874a274bde8dc56eb25d89adc8300c1151bab83ecd14a902009329e4a779af1e286c445414528c4cb52aac240205373b3428b7d20a3e09a539f57f0b9ecbc092ff00f82b1f0848330a868049be1edc8e8102c5197136a0264d76aa6afc897ffb6015c6c680f002a15d1de4ca7784747083d5dbc65f4ca515f02b64eb166fcb1b35381400fdaab8e515820a367c896fec2c987b66f94443488a27b72e808472f2c4575683be5811888685d880aec70e9cb5cba9088db615ac3642116cd3a2dd167e512fd65cd3c0aca81f2cf427581e88af013bcd5207670c516f439c77c4a13b0c1a9bd234408f5a33aace7071f9d15d5d6a486d80f063400b4dd56e200150c0a61c9afa84016e1ec2c712e8f31d3928334682968e158a35c55644308628c208443c2dbf80390156e578151f844c758ed258a1a0084b36835e49948204f18a4e07a11c11914b8f67a079d090e7867f45f59be0f9d85dd34f62700808811c1a9a6bc2ea1e75857c41d3b40d7d8c067c7063955e54555aaaab5fc2c377fc8685a01dcd7acd5f601696ec41d872385aeb67798429807251b7011922d89797983f6b25e08f4ec7dbfa06b018aba1402387b2eeb6d2671c592b78412123d1cae249ecc401540032c960dc95e4fda14dd522a46a02ecdba7445f30115ec7f288a51244d391c69aa201dbac96adbb59ed142e978066dd4a9bc6e0193e1f0ccdfb7c98a6f0a8dbaecc30421f94735dc0816d60c1da0b7e40d8221b2b4163693b101080f45379ae180d2015e383ebe15556b5888aa4b9737d2540ee6ae94d1e72beb8ab6cdcbc00bb3950e339904037a096fac30d22403e74e3a52d505b7f46f2e6af8007ac49e670ce56106af3ea5c361e1e71c795b6dd8c2b774174840582bc8d4f3211ff000c42617db04911c10e0d40b9b25285c25e8111e0020e2c17258086be3962ea3100dbe31d4472e591884180329436d42a2abd303574f0e5625fd17903516ef5a8e69ab40ec84d115fb0420b35629b8a90e1a218a61465645e8820f7859ca783ab8a0711e1ea00486ce07412e12a82bd4a02d8aaa55f6005360d851568749418eaf9fc34f4a06b390d5e3ac1a2980e5b232252831542e95ae131ba54149d9a0226ce4c805fcbc7ad07003d5371396f8ed62b5aa4fd7630d7c799fc1444a7ef0fcac8d700a7db1c07972245c1340c6b08891db4d00376923f508f585712420a33a69b857a4c236824a40340007e48b4f34c0d93a5a31250701f923ec8457ef0dae70c606c10292d156eaacee2d519f0c02791c6d8e651d9be5dd35508627e1e09803ce95ed9a6c5f0d96bd620f1b9c1306462d690536ab6da26113e3a39823636b5408702ed6168a6bad12933b2981d5f8bfb790f771fa622689ac21a2883a0c518c98ec2e5ef5695d50155e38c262dc1db416435455dc1759c53069f11c5c22152c6b4410e22f02a9e206f535263bea27250c2eb7a1e3287bbca5cb8b384bd714c571abf1c02388474e9182d5c390f6a0b251b05cb4f48451e4d7541bdc80b2ecc1aefe2a2af06fb65478fe84523d66d8b4270e5ae0d2f0a09c9a7d610603a50fc47355f873c726248c8c27789cb9451bc8307d18e1f0a71b3626941f02d7e4d49892d10d22288f3843f6b78f2837a58ea718706c10f595c79ed9c9a9cbe0b4e1c0146e61b75b57b19f4a5facdd187f0ff0075c9f58d522a4da276700888262b3a68d0e368a6c60ef80c8f46b9f52691a23984800777bc34d9a1abe84bb1c0710408bfb93bbb40e28cfd307803be63f181007ac7ed4fb307bc8d41a01b90801953f1b97d7ed6bc170d943d8206e94f8cb6422085bc3f4807aca12e44e241b397f68eb3b42f2f250b006b6c1c700b22788c50ca0a2b5b317ce2415daa86d0a96d555ae002a851c712fa9c24e21c85880f364c4b0850c145c120178a083950c6415f147fb62b2b02fa0b6af41f66692911bedf6ad55daaadfe2435ac1d0888ccb4c763210d45002b0094444472ab9cd0e08e344245371de36ab2ed1722ac23bb0bb5ba9e436104a4b882cd0c1bd7fc065105f7705bc7c6f1140abb1bb18811135131a69c353c0c3c2108e30b7646b1c537367d99bb16659c228fa26f85fac718de5198e0783688f450472e84ab10895507a138314eef70c2db29b9cb2dd276888a622020d7451c0cd33180b8005b84d29358264bd22c57525868447014f5ec3eaa5a52d5b1a0038215750395b40daa146642e1d846d39b3e092acad2d0602bff0097ed5ed70f226a58e395c89474c18d25671e1d8da0a255e9a23770ca2eb6494f581e721fbf72610f4696cdc95c0a21750ede09ef01e6d3511dd5b519056949fc52e108bab4a68e241a263ac18d0a7dd16bf1714cbc615b0f1b365505778376dd4a042268c3b0018fb84521ddf1fc3c72225c46d2eee53b80d8dbcb98aa51057b8f84cbedac939f0209211d7aac0a60658a533fe04f872bc6394bb9ab4e81c3454f2b81a9f86c494889954db9a9732b244406283a08390ade1d100f43169d40703a3bd8f68104c8bd354e221393d0451a034505e3203e901bc485ec8865c5faf145910020d25872b92b3821ba653cf7f02b0491d1a4cbacda102f8ae75ffe74debc2dcc1e5b5552ff008f1a685cd29a0453c2cd0686840403b200ed52f1aa4a7d4a7c4626261530e16043b361d38138ff000285295854357b40f06ad06c84712f38846053490d9c81a0d1c43f15b8f384faa00a2a71a6a5ace23066870590e51bbc18759de0ec1a3f2d7cb90e225cefd42f60f0e3a23efeb904c5ea8db0f3ff000a64af87dff45fde28bde64cf90b0499b7517cc5feb0bb3e91bd000cd2442c07c1af941ef1012df02ca0d38569e4de37d2e92f764b79e413832edfd8c5584bb5e5f3dfe12dd5389933e04407445aadd048591efb98840f1a1a03be81fe2125344ac452d225239da7f7068a6f15a7bb43870ab8460b4671253a6b087080554f10e6beb15ece48ec0e45007a8f2e3085d99847c0919d312a6484fc1b10450014a78d9317876cd371282b536f861ba95bb0bc940f4980e8248af8fdb40617c01cadf3a3fbcd4ae7233f65fde0cbc1ccff00f36980f3370fcb703d615c3da283838cbede57dbec4077655eeaf7de9c13f23d00d43ca43c541b717ab97aab354805f1d6162b00f39781cedb00cdad011db06a210f2e4089b28900ca9b7c42c881401a00e8ff001a4263c8c5064ea326ae1f9e24161f4c6efaaec56d37c313003c32a5a4304849b401764f806d280c200110a06733581a07cba26c3b5c92110a0a6a4a1003be570475d508a8003a0153593098b2752475a22573ad616b9a65b4a81a3a411c8530e6f7551a8ed3671a5815c6291c20414a8b37a7188be76789e4829d26e9c9137c11d5016cd76fef187a70a861d4128a039c52a5b1a917129c10cf9c6e824256c9b72761515441087048a8a400d710e667be2e285e01f88d27e83ac380ff002cb868fc3f10a9ef07869ac8b32d7c807ae76df65e6b1feaa79091ebed70718a73501a208341def1d01262b682077a3d8d983b33588851cca43e49c99bf4b4434b4e6a3fd63967594001f2c9b2278cb17007b384e1a1e78e3cd3cdb0963baad6a8f8cd78d252198278a8d936e00f6a20c71002cb757299ea6794b20d15121365c9f3e79676c861b1006a8c031efb026e09cbe01f2f796e3dca8b7b557ce01d7fe0e736689625e5e2fc188830be1c109f27e7376a616dba3f718ac1e8e948945302cd1234021011f5f6cdae70246d42d777ef0990d238c2c4c029c01c18420a931920c134087c66de272dfb2735d5864cfe348f47f466501393e4e403abf5e56defb7037b88e04ffcbc736c50686f8099b1e776f7c83931490e1f40c70a0691fd270769d2fde69705f70841f4030e4fbff2ff00ffd90a656e6473747265616d0a656e646f626a0a0a362030206f626a0a3c3c2f4c656e6774682037203020522f46696c7465722f466c6174654465636f64652f4c656e677468312032353235323e3e0a73747265616d0a789cdd7c797c53c7b9e8cc9c4547fb2e59926d499677d99617c9b2b141072f2c365bd80d080cd8ec60139604420ab96d434a72db6c37d0262f49db344dd3a41186104329f8a6296d939004b2366dda8466bfa1c96d08cd25587edfcc391286d2fbeebdeff7fe7992ce39df99333367e69b6f9f196dbe764b2f32a05d8843f2f2f54bfb7f7de6e5a71142cf23846dcbb76e0ef4dd7d603ac06f23c4492bfa57aeffdd8f63d723c47f8890d8b972ddb6154d24d88b903e8ad0c44757f52eedf9d4f6941da199901fd5af8284bd692221342b07ee0b57addf7cbd25377106ee9be1fedcbabee54b4f367c918bd0ec6ab8dfb17ee9f5fd93b8660eee1f83fbc086a5eb7b931beedf0bf7d01e89f4f76ddafc4fa86b04a1452fd1e7fdd7f6f63f7bf2c36fc2fd670809fb210dc3977e0c008af49e70bc206a24ad4e6f309acc16abcdee70badc391eaf2f372fdf1f0816840a8b8a4b4acbcac315955591ea9adaba68ac3eded038a6a919fdfff011f34587f099708adfc127b9d3c882d0c80723efa4af4ff7a4bbb87b510964b9073d8a0ea313e8856ca1a3e86976dd8a06d0107aeeb20a6f4277a387813ede449f66d3f6a1fbd14f510aa0bd00dd8857e01de87696fa10fa09fa193a808ea05ffe1f9bfa32ce53a15f1207565af0113290537813fe36d4bc17b5c0f7c4a812b700dd36c2f77ff0c123643297200bc8f3e45ba48fc49554b21d7a37c49de67e8ca6c07708bd868e5da5f04df83ff07fa0cde83dc0dbb3f85fc809f418fa31fa26b4e70ee8f58fe0ae0fed46df41f7a207af2c2aee11acfc5f2f4b1a448fa39bd122f47bc0f43350e266340b514cde01e71b910e79915fe856f33e8a7ef03fe9edff8b0fbf983c09d8ba9b9ce45ac85192e22284e78ee23b80de2e703cea866f17b47f0ae06105ea047c3c8c1e01caba9115be0d286b007d1be8837e36c2f77be84bf475f228e4df82b670f77135f0ec281a8b96e11bb004a51bd1217c3f3a8316c0b71f3d81cee05f02f6a1247f14ad026a3bcabfa9c9d17c8296a06be078143fc51f125e455f43ebe17806ad97c7cd9ed434a6b1215e1f8bd6d5d65447aa2a2bc2e565a525c54585a18260c09f9f97ebf37a72dc2ea7c36eb35acc26a341afd34a1a51e0398251054ee5b4cedfefd1847dc160b0ab52bdf75e7e9fe28a2c7f0da690edb24cbe2b0ae55e719f77c57d7ef67e5a0a39521342ad6db4e2fd68c2fb29644f61470ad1b760fb5478935aa8bd674da87d75cad3dad3dd0d25da4296406ac26711b529aceefd7a5d6ba8b557575981f6ebf400ea0182bcfdfbf1847198016442fb98fd0449c6ca8a942d9c2245edf45893926fed0620d40635c113fba527832343b78d7e84a05806b22b104e89ad290d7b6f60754a5e9a42b706f6570cedb96dd0829675870d3da19ea58b00734ba18dfb1157d4be6a36c5633b3dba5705523c54ce4e3e4809b4af0aec095174b4afea8673a80d4a5d351d92b5adf37707877c291b5cdb53d6706a22e498b8fd5d1fb7a73d677580deeed9b33b907af09af9a39f06e9b9abab2b071abca73d04154265ed6b5aa02b3991ca0aa54f2a027abad7d077ae594adbd9be26b0e7d65ed6d6db581b58d6f65530304bff4fb9f6ec69ef09b5f72ced69516a6f4dc9b3d905cd5e309f751050d7d6a526a919e009cf9e74b77505156477ce9cdf4a1b165adae653863d9bd2ada640427be66180b6603254900a2c0fa4d0ccf921c8da404fbd0d68cff206463cc12e0ca5665c2a95128a2ca1c09e2f500a7787ce7e7279ca5235452cb27c8128382134a17bcf9e09a1c0843ddd7b960e8eec5a160a58427bf67776eee96fef86b7ce980fa506478edcea4b4db8ad2b65e95e85c700ee29054c98393fe10b5abb32b73332b708480a084bcfba035880df64f5025846b3e7070380a839f3bb7c80a7f9149e0db072a5840484db0063aca28de2a8b7218b9e56150c062975de3a28a3657093da75cd7ce53e8096f906901c09c37874d327439927ce39f4c9aecc936cf1ee10bce520334e9c29a938fb335b5cf6f6556352d8f59f3cee559ea7ecadf3391fe95220e2e328a40b03a737a7dc61804bc37b60105e0aa52ce194307fc8d7dc15b0584102d0d19b15eabc66c1fc40fb9e2c1528296a4f291d00a98796aedaa3b21225faaba776ceca209c522cb0f4ad80f15dcbd600d1c06fe96d54fc04f7585213ce077dc13dd6902dd018a14d25adb3e78f7e6b46305dde12103f2dfb43f8966bf6cbf896590be61f06932570cbecf9030493d6ee96aefd85f06cfee10042324b25349526d29b00bd419d94e60788c4f2fb0ecb08ed624f7996c0ee970f62c4d2a44c1a46cb07899266c9a41148e3953499a5d14f25980974a034080c4c0e2e8ea744c2237a444ebe75929d6aaa83d6a0b5084e18725dd825a0afe81501406dd49691f7f8c7844f501dfa57b951e23556a93a87f7ba1ce5615761f918575df904eba4c802b2809fa79b67b56cb0efb413bbdd1b350049f55792cacae228d2d9ab80840f68f3e3707d5eb6e9f562535555cc1cc3e6983fb624c60506472ec851a3516c0a38af13b1e83218489318d0ebe1ec321ae16cb25844389bcd7086a7224b87f3e0c8db876875e28aa8e55c58fd24cf8693496b5d241c6e4689b37591243bd554278582e29262128bdae2f5f575b52eb7cbe576868a21ad3854206a44d1e9a06975b5f5f03c5ee714691a79ebce2fbaba962d59d8756e6fe7d71baa7b6b2cde994d8d37cf5ff2a89c98d0218f7b64f1dc3b1be333dce69a79e3c6f7f9962d5d8a0b8efe1cbb56f6ac7659cd95be4f73da82fed26953a6bc7ffb77df9ad2d1591ef08f777fe22e07db1e4607f0fb8eb052f80cb95119fa951cd46905a757eb742ed0ce718af9512729896a753922ed6c8ef37a0e7383231f1fa48801e0ed831437007c7290a284013423007f901d142ddccab039ec0f27c23bc3bc398c0b0747be54f05ce8bcce8ccd0cb766866d33c3b699e1d9ccf06c76d08c66866d7306cfe615e596f397e159bd0518709d380b68c62e9bd3410075a1cbd16d8f8ec2b4c556576be30fce59bc68dec2cfefdcfbd779731725e7cefdfc9e7de71ae5314d3f5eb5eefbe39a12e75f7cf10ba17859fa8f479e4cff61f9aae52b7a97e382a78ee2dc15cb57ae195e76f7bb9d53a7764e9ff2fe1de9dfa77f8be340ade07f71e785534840730e813b1503738c929ece1a87eb315947fb00ecc03bf0e0489aa10f8073b29e761beb6987e1fe37acabb84754fa76969112ed1db04ad05a670d72e72f7eff04f9ae70eac29f9477f263e09d7ab455ce91628280e0bd9c368624245ac480c88944d403026513ad56bfd268366241eb4099160070ee206d000017653dc537d2d0a6c0fdd3ac29a8c7a0a279b89622bcb6369264d8b63546ced654438b9c41f5d8cbfd7038447e3a3c87bc259c4aa557a5865f4f312efe33ff05707135fa8bdc562bd3b1d671a2358ff3baca5d716bb462a295f2f05cdd5ae75ab7b1342697e1b23203da69c70a33872817979589f612072ab79493722043da54d2544e681fe83d234200fec2881080d3b291b6bebcbcd65c2bd792bc2cf5e539b7fc17b9dc720597d75ccee56c64185c07a888309c00ab5be126098849e2b0505098a1c1c22b591e59b3fc6e0dc68256c6ef9c787ffac2e2c53dbd8b1762ddfd9d7b12b537145b8ba64f6abe6fc1ebe9bf4d68919fdc38fbe1c6f42324b778677cf2d6bcee65cb71e1b18338af77d91a97dd1cb37f1a6c2ac82f4d1f4d7f7ecfdbd3a65e9393836ffad9f0566bd4ec7221955a6c402d5ab451b60a3142343826711a09016f738c58b58c589f972d0ab1eacd7abf9e10c1a1c9100c001718c100f0e5418a2d4d8652343d3a855280501872ea28a56408052b5412b20679db7027d937bcea047783104c2f4a0dd74193a0755341dab750698fa7c81322c6324738dc481a8df5b9b1920ed2aeeb30b4e74e2e6c2b5940e6eabacc0b72e6e42e2eec15d7d8d73957e4f4e6ae28edae5855bd353777bb697329290d5b4d3cf2e6439764276d9b3f3f92bf339fcbcf2f887ac946010bf44950ab8f0b327d2c081210192b55e5cecfd71be8d0eb9d5475c83aad235e65a09402b7af302400f021eb7b15a5384a2c00bccf480f8097647356cb4c8f119e2fa26c5e4d9f16391f74a7dcc46da1d5b90d9408dd065aa39b111e4d11590a9c41901ea4f5b8e9b818ac71776414f55142abcb24d05babcdddc8140e3c667418a62919c513ab63a416635250f9c5a28c262941825854b40ffc9c0ea678ea7ff0e71ed3b22f373df4c8fceef66be74edd1ea9aac3dedfdff8a725e6897fdcbee7d19e258943cddffbf64479d293bed69a2f17f57eabbfabdfe700dd3caeb6e69bf39efca2b6eaecf8a537ad5ed2efb5866d9163b7ce7bb469fc043aca49503c0f3089f5c3fd223575648396af15391d578b2502eae3af8cbc388a332b450a67610a2657d52eaf3cc5940b6734504e63fd3f8912c343f0aba9f6c9f5972a93f40fea1c0279f076ee412ec5719c89a92e91229d638283566236cac619462ea956963c5b3b7cb61610590bbf9a6a307b6375d6502ce80c59ebc803c3c78e1d232dc78eede3bfbf6fdf574b548e1aa21c85e3f2343d936d5b35d8a0f1690a35514dbb6686663559aad946366a74663071fcd82a16e3a8d826ce12d7e26e7107ee87f6605e240bf01c9160d16805e16fd01b98e00104e8e11eb8541239cc4b2226c06c170fd21e68e86323c58cc68e02144fc0b79f6544f979d94a3321d665e452257d9a91aa2afb19f0beec638cde0b8c2e03a3f3b4143dc35bed7ca6423ec3fc3c95a26c507842f3f08c5221f50413007c460050920c272f29ebe170d8da08e4d99c68b63536822c80b46b3726511284643084a950c0d63a7ee88fc31b0e630f997758e02f5c144e7dd5cbdf8bc8c879c0f16b80630dd2a1b7159a390cc9e7643fd399ac0d924ed04545518b30c74b48e2782dd2680747fec88845ab35e8d9f8be72d2f20a104b2201ad889c1db20cb1a6f8e40e01e9b822540ec5b43a49d8cd63dec1114eab13776bb0c601642b601d71622f29c665a41d75e076d2c16d41db398318add6c93aa2d3eaa80895382671408a729cc16cf01b12869d86ef1804b301a3886217522c342a2a0227775b8693434343ca451ac2c9ae10aec3212e4805b20e9f3f87cf9fda3dfcebdde45befbf071a3f821f4c7793c9e4d8700b586f407b4225e0c584f2d04372d0cfa8afc156ef9b649be05b49045754e2dc518d6476ae42d7417e6ab431aaa03a5f25898f3324f1718624de50a4175ae937fb653f715f26facf6545bfac67b2df484b6932668ba6275fd591672fd9664c31327d8815cb0c14015586368d6293016731a357a8fcd1ad1b3f7a32fd133cebf4a7b36fbfff856bfba71fbc79efde6f9c98b97215f9e0f9f4e0a289d5c2a9447c49fa57af3ff6795b75f9575f2f6f9cf091c285c25d800903ce95dd7375b8813408f5ba3ed22774eb76929d42bf4ecb040b235200e4460acdd1ced52dd0735bb558d0c16013dec697f131be8d9fcdafe5357c80513cafd16b39cc02e39c40a8e1f489ca5b22e32da222f2c30ceb7d7c5065c60baa3965b892d74c66d30c131174b4167a06f5631f8ddb2cb6555ed3088ccdb92b506dbc3aaf9db5ba339c1609274107503abb16419e6b83212b56b90d0785bb4ea4775c9fde79189bf066bc12db05eee25e6ef58561e1d4c55f7263111e1901be7b9cf1dda3aaa4d68b3846a95cd090d186e33985185040a5a58f32b4a4c86a84b45256569f78eb0430a022ab73d5eaccda8496080b350eb2d08202e876f420e233f6282097e95eb8ff8b6c64c886eafab43bb5242bb3df1d7e971a1ac34c60536b0aec0cfc79dac0ff2c6d1082a954d6527e89ea1d1c79d2c85845e9d400179328d35a68172449d069382c48086b331dd452bea10fb58aec65c008eb22001fb3d100b993c90ec019961d534b8966c7b49c6adebf0f6fa6f63d361a244ec89411b20c25f03423dc3ff39462975c52736f0d65916839a95e506228314453cf527c3aa12b990e68815633883b27bb146dc0d0d76ba43a8f489c035e933e44d30466e32bf63d35df32f403b57651096da5761b58fa20a35f3a313cebc409f2f809f2bbe112e1d4f02099443dc9a691f779c4ef40f9288c932ab5b8c2cd26132a1a2bf2811c9c93e3b12690d6e337663a6dccf08a31237d8c8a8462c06b8abf64345656844d143df934ab89b330e3c0c50c031b3309f255fff30faa61505991c5d35be14b383b79829a47cc21577ae693039532c54b91b9d21b35b79bbb0abecb3fca6b8a720cc6b8a7da608e830afef249b3250efda014e2b5d94993da23b53b2b0dd8e3f17b0d8323ef429f4893818e7094a2d4b0b1325189c3260b7d83c9cbb9e863da6e387b99f1e16586087341b8fe8a8c8f156e66837096d9ceb4bdacb994c7c34c8676090164b520c59d703a838e2b4206f65121050d599ffe22fd3b9cffc1aa079b9be58b179e797cdc75d57513dcfae0b29278d73e12c80fae9cd2b93a5c5e217a712576622b6e6d96e5c337aff8e50bb92e77d87ed258a2375bc8afa66c282eafa80c57ac9d08637d4bba87af81b1b6a03c3c561d6bab5ee41c2d265e2bf8644e2b19aca3ad910f0f66ed135530bc9d513b7f54f801217fbede4d45de934cd64959a122494cbd0f8e3ccb865792fcf9ea90c2e00e8d360141cd505c35d291adf4cb14d38a4a8ce1265b4d5e2beeb4c979f3cc2bccd2956da5e465a4a361f5213642d0b037b3eeb19c33ca94dae88766321352e385467d267be8b84a4c0b482c5d627a41da90affa42e030abae7c78741b6128c35dd882689c8232979386296c5c940d9d9559eb7c4dfa8be767ed6a3d7a74c24f7b875e7f7afbb766fc4b6bc7eab63b7f40a6a43f4a3f595c9aae10fe634b624efaa5f4bf1d7f7962c3f0ee42ef6b941bc78cbcc31de0af4706548fefca584c864b3afe6359514ad8a8b3fbc7624adc7914ef168c11868fbd3851c5ebc6dbeb25bb2e56ef47f56c38688e7a031d947a1a5128a0e3515fdf10d7780c74a03dec9187b9301e1621f36498d2e369885f1a2a157a6988caaf844509252493a0b96c8d56400de82adfa106c69a064534908c8c20195385345500f60fb83c34acf7d901ad2e1e865e3c69b2c6f1583fed4f2e30b1df6faf9a5e8ecbcb69779009ba037dd2b1ee7c294fa6f5d77b635e3ae031c68c3191561ceb6bf0584c96b8c702ee6158a6a7b0c6e76184e161ecea61b93d369adbd31f574c1ee67a8515011a6ea6c1bf84b5ae2e1b12a01c5c534d33020f63c5dd7732e6753398c5abc029035e2e8cc7b2d1aa502c132d745a43e4cbd69389ce65eb5675dd9e704f2dac4dce6edf11a9ac5fb666314677971616ae8a8f4fcdd7479f5eb2e9fec4d8e69f633bae179d76f79239ddcba6f658c7dabcb9d148d5eececd3fac0e07a5c2966b5c6e7349d171736161a4eaced5c33cf5ce6e01f279834f221bba5ff621a3c51830561b7983d68cd04efe3b3ce1db746641ab06b66c345630a4da8bc861d048aa6772e110e362af96728895728896718896a7e8637a54d5ac6985cbb50655af3eaba8d30df6ac4103be43b31a044b340f276bc1d365eca3f8ad9a2cefb8dce40d9d33129c720f30cccaef4ecacbb37177895ccbf88b1ff0c987177682a101fd738e7c4c1e15ee473e342817e5c9b4693800430c62861fa7d30839390e10eb893c9c83f4167d40cfe9a9baa28d635134a693f4fa3c9d1174c3870ad38846d66da3576316fd6280e344ae98097b6ac931799f31e9a80daaf49733a8de6c9af597db979b892dd5269bcf8623618bd2e764336881e1da08f4bcb92e42598346958a63e092d65995d05b368c4415007ef37b8feddc79142f483f2c3aac53c657cdb5eb63eb5d4ffc82acbd0f8f4f1fbf6ff8ec9c45a5a1904ffb13b3551d6fb101647915563d2b39273fa82b74695a4a5c2dc1123ec8e78a60a0493e09f8ec221bd62a64ca8026b337037a7d54d02bc14c28a0c87b185d2667ca55697f5ab5072366e6dcb2782f3378cc396aa4f72596c36c8ef828d268065f3610e06391681ff33c21f57996d5e7ab8e64458b55b95a2f9949ca8fba7c092a6a2c6781276d4c45c4aa9984114242b933e42c2f0e159737fa35bac2124fbec6d552021d1790d92755b2c1adf46615c345da276a95aaaed4c7744e01a0bdba42af4952b4bd995aff414a046656cccca8dfcc148939dfcb7279bd3ec51222b43369b98266f43109e463197c4c91f8f622b3c51c30df6e4e9905b3b93a12a8de59ad98bec9732a83d45a14fd023ef6b98ca6696e4e30a20132a9530c87a0352b559834b9743b8a872e491b6187c1eee8488cf9e644cc1d65e0d89b13478f76dc316ff9774be7fc60c9a4ad159535e4e6a95f2f2a2d9ed86a8d048683eadd94a68bc7f8e48e8e6b16ac5cb2acb2b66edfa6e1a04a6bdc79a035170ea8b466d45ba4163b6f12b164a43245d1fed4967e3b634b5fc858cee732b6f4bb0a17629ce3b61832650cc6acc56094545b52b1188cc61cf7258b21432a2a4d9c6daca5b460e79c2ee756276731b2e608d828e1ac518061ece928a10c3fb341578840cc12819511415f8e45cf064fef35d2280cb30e8c6cf48d2caf91d07cc60deeac75907198596080aa4218adaee05547c7c99d3f6a76ba674e9cf02f138f1e9dfdd0c21f1d213ba67eb3b4bcacb399a1bc73c6ef5ea0fabf71e41dde0f98d62337f66570ed4c709239a1e50dc8268eb6ce3ef93bebecc38c75765a0e280c9b2332bb5b74b0f038b3bb45c6b2343cced02c8a9e9c2bf910588faa78e6fefbe4a887d9641e66933599a296a8a3c9d5696ab3b4393a5dac65d0429dc1872486ed0215d56f67d4fe05b98e61dba218621ebf07db7c221b1a917199c8ec6ad13b2ab4df9fa3ea916c3c22138ec0c98cfda598d34831bd1495ccfbd39f9df928fd05b6bf73065b9ebeffcebb1e78e0ae3b1e2055e9f7d327f1586cc139b83efd5cfa83dfbdfcf2ef4effee554add7980f857c47c94833e50311ecc7182cf997022bd699c5512ac8251d26a9149ba478fccc86cd57b4d2c5047116b2a64de0dd382264aeb14a52686c4b343e004442cef51e4529ab50c0f25ce82166442ac5972343a48f62dd265ef30fbcd1133c75ea5d22432594c01136762483351e6a27833295cc680348b10296f4e9e0d375387296279577d390814aa8d28f6a867a8868e9d4a5c1f5412982f4c11bfa2f32c2ebaae17c7d32f1eddb9f3e927a33d6542b7d6baf6b6e2fb2e26b87fbdafe8d9d37a4d4622888eab4804fc8f25c297ff7d8920fedf4a04f0d725929508e4ffa94468fe2f4904eb7f4122888ee1934c2410b41348748ef07b3a0f8fc32aaeb5429bc811014b3cd56ac52c388604c20212ba51c1089185a878168f40348ca6ca8b4b63734e76b3c1617a1ff34a58561d1c45e7633c2a0674321c3ea1c887130ce94c3c8c6e0dd0a585459b2fc8c51447fc0302a129028b4f0bdd88611479a7e3141ec22f611eb3b92b731c2ba6259b594dd39001400cd798e11a33fb93b665ba9606788606f4e67838996d1825f9732ca0a6368ba2bd2e0e948d271d3d6a7ced353ef9f35f02dd368d7cc07d9bbf0e9560838acbfa8825612116b33b61e00bf202c1ea2009e68125692e28282bf58a36263d59d442ccbd7c09812a3dcb4a2f779052fa4eeab4158c7cdcd0350432eb64d2d608c479324971656af2d4f8a67a645f1799a3130bd82c95c94a9a0a64f05b82f456ab37c62d40927133bdf3805f64b198659a873531182c505a479f166bf3e2d0cc2565d8ebcb4852263d1549aa48d5fe52d5cd6141ece64c6ca22eacce42511a152ef930f599b9a592e24b6235bbaca16dd3507bfb94e92d2dbfdab8e8a7ad7a47a2b2644dcd9dfb7fba6fd1c3b23e777641f514cfc449937e7ff75daf4d9e3c3d5af0b2b5c2edc87febd9136f4d697ed958a43599610c5a47dee3d6828f5b8ff7a963905b63f596f27928182c1a97c7f3bc7e1cd206ac268a686b0d751be920d4b0181c1d881af6a486869a42740c6a6a1ae25ca997a7b9bccc97f5b241f2324af66686caeb1dedcb3e73497c3cc3a6dfe8616551579fbc5d71621b9429ef1c31e2cd71468a3565a17a4d63a883b4fbbb4857ce6cff8cc86ad2ebefad5c1ed946b6fabfe1ff46c8e57178dc658e327793a3c92d3adcee83e12a47385cb5257c6bf8d62a2e5ce576f028eff6201edd552e40d3b980e8b5fa6a183fb8e2358adc24b49be798a8aaa171540b1dd21a161e845e97fabccc633639e35e1bcde3659ead97050dbdccbaf546d4d8b23ada67a1876cca5be97092cd35ee3655854d375a9e411bd5f04666e631bbae253bffa82a8aab4f3ee243fdbf947539e3ebab378dab5ce109f927270b37d7ecdafcee2f924765dda4fd0b92bba6cc2e5fd9b8e3c6c678f35e5f73c1cbf62a8fabc0697147a3ad6d6e6d8ea9e8de0d7b8f55857edbd8326dfa847697de69f2dfbe63d24d55b551aaa93bd2dfc6e7701ec8c2985c548ec324861a493b9a44e6a02ed28336231d21dc5c3e226004a097101249d2709ce59ca2fa300ed9f1b9f48777a670def046f21da4ccc5f0adc22964417ef4845c31c63126afd3d19937c334dbdc6bbe3e57f24491c6a299aee1341a6d4e54c7813464cb0bacce51d3eee732d333af650cb0e795a5348899b40805cd41ecd138b4198752cb1c4ae64a8b6a3c3a1ba156a6e4b43d01559d6426e5b391285b66120a33ac874274628019ff574cccf0aded63a7bef4c02327f0d66f1c99386bf10bb1fac88dc987765f7f774d45296f59faf8d829d3865f154e55d4343e71d3d46b0bfddee1c74b6a2bd7505c8be91eb0f99348837e2397b9c4467191b84ee43d5c31dd70c0898248343ab3556c6ad47469560376bcb48c4015a59726d70b738515022778798ecf416ebe0c15f354d87f2c6b41d2712638f1f4ce0d0072d1241171841788812398e315dc3a296e5f913dea5c84598bcd5abf36a25da2edd30a9ff2988f24d5255b6c0e3da1cc9930754027e6c243ca596213744819fe3a8cb9f3c33ffeed6fd26b9ec335b89a4f5ed0e0d37cc9c55f714d4a3cfc1dee5db06c3ca81897aaf2c9e12d2492dbedc841f92d0e1e4b852d928ecdd53ad868bbbd9819d95854670fb2f68d1a6bc3b8b4246862794ccc1037b1822626a54c99589bc9545af277b1b6f0d0d049b68a8845a56ac17ca8a302aabc9489a631dcd840b4604cf1f4405bc1b65c8d97483ed6caf1995642d3a8f16357dd21665b239d4aac7f910b99e5d3571af49998fa30b10c26afe20c33cbb2bf440d825e1620536264973cd450ecca58181313d63ace3a4a8d70ef1ead90c3a5731b17de5b1f6f9ed23af6f125b377b41f3d3aa16ffc1d0f7dedd68e7bae2daa76d89d532677fcee9fef7a7dc6e4594525f8dd0b17c9370abcbf3bf9ab53ad942e77c1f8fc05e8d2836b33f151a422dc43ed191b85720403d8236ee26811746e65f2860d10510728fd7796e8db194bd4e735e9d91420cdaa2e27c9d89f7abdcfab8e4b767cc2434ca382d5a14c491f463e1a9465a133e946699b76b38b1f1470cee50dfaf2903a2283237f3cf8771669365e2a2b2e539f2f139fd0672d513d0b38e8995da5670107fd066f265ead488e6155db83f99f1c354eea2001295d5ac854c7fde5e8bcfbba27df545d1d3b6a74bba777b4df37fee88e29d3aba3d1fb37925787bfd1b5a5225c3aad916b8131380603f13893c345b28eccc51295b89574fe4cc1621fde89098e24c1e640d418a3b6187efcd34fe9f6178cf211124ec3081af04665040f71393a2b43f387072920d1785490417a0e448d41d00aa24024414206bda8610be234d2a88923a33ea3e3f57a239f99e3d301a084b1b406752ae2af0755e0b43a2761325ee6fad2c3f256f8a4e52dd58a338c9c6be83aa944a114e320ccc65807ce0cb34829c96d65d8c7d0468da8d5ea7dd8293a356ead475f81cb49115f2c144a617d1437096db8539887bb8479fad568055e437af855428fb446dba35babdf4136f1d70b5ba5eddacdba6dfa12c459b8128e3350b1aaf182b895b47a44a8dc150449ab03b4b008ae85ca4864329bfca684a9dbc48bcaea22451c5a99380419083f907ecc6fc621faaba372d02e9c4ebff7b3f4a7e97f7f3c7de6995f61edbdd872844f7ef5432e79f1877cf2e203dc527a28de1e5f0c32518fc7a812d1c41149cf0b3a4183b12001fafff21453663a8ce88c9a1a8eb800d62c13dd021d2dc5eba073a72a7709a23a65faec9553a6d4bba362fde46b54f80da992dd277b4ac91bf8f75a4e8bfd388ff88d957812de86b76a690b860e18cc717d6685049b874ab059017dbb1e2c010e984d8f24ed41a2d7713a8964db4e66e8ba7544a7eb878e9a8d1819258e311be7156810dc4e994d60ae88c09c10618381b1d7308d6e279981a1ac9049282b64765b8686b67f91c30f51cc4b43281906b190dc08bc8715ff0f50cf17ff2dbda4e3e8517ce4e3748cf826a52b45c7c58df88d742534e236609249806d0efdab82ed8304b315a9ff43ff4de047fb6f880a2a9fec62755ecd1b3b04ded874015fee90f9fe914326f042c61bcbbe25a9aceb4da85e18f5c0a03b74fe71e41dbe0640c3a8f9479b98c3b5f87817764a1abb4eb6e8903113e2326626208d74564f9d5efe2c33e17c5a9980341afdf9391a3bb49621c5eecc060f9cccf67266c8cbe9fc8713908afc3e4bb5d968bef7c9d5a36723c7e03a43bda913b718da4d737357e46ed168ffaeed59658b7c46a6518d2e1624a083c76206d46961eb538c1bfdd06c360076af93097027c3af539980a49ad6920d0a8f6aa132ff387aba31ae4c466a32c1051bd7b77df7d4ff254fdcd072fb434fa7cfff66e14d0943eae8c48757ffe24d52fb9b1727c5877785f29effb7f45fd20395c551d131fc8a3c3bcd56728a2cd29b84eb5f33da5500616ca2c258e08808161da111d68b720e232ec2820b4408205914029ccc0784ccda2d90531a40b22712f6bee5cd39e9f558d4cb491ab1c9610295ca539fec072212a9a0fbb100f4e4e508071623578a4ab87df8112c66ad46c2ec44a61633562312086d119385f94c164a66099b25bf149196487d92f029873936045c249cccace34a64d7b231437128c938950947661ea617fe24bdf8395c8b23541c8228fc01b798d986e92eee5d7e07d06f1d4ea8f41b2a1770192f17f3c8ab1b9fa7a9abb3cb116319f2326bcfcb0c0e2fd56721c5058d456b3501f62cc02cc100732602cc1e0c009933d40502b1e8df7baa2f0d65dcb63a7650361e1763a4394e8c4acd8666df14b15d9a6cb811df58a395eb7024c7648e4fcec3576ba1b9164323b38131afb7c24b99bd825a850d6c9696b1790533082bfa62b5b51a5f80c5ce028cae03cc3a0c304b31c03205fa339b29a0915903a4397979a3413628a6081e6d18e2d1ae26335188356b44c6ebac1642093cc6954eb8aee93b0fdd78dbe47b874fd83b22d1f9d179db0a02de29776e387e665a4be2b145f376cafafd5f8eccfc69078e90de82bcd3cf1c797a4c7aa6e433182d556565ebda97b524702ed6ddfa7ae7a46965c5d5170bd2efa6cf7b5dcf00f59d01da1f145e83d1bd412e120e89a296d3738360dc20fc043c061347ab06040338c0ede2e892d7bf64a607d3ca9227cea0eeb23897d95c714e66d10afa809a2aa30c8e70b2ee6cb8b136020a64234a0c3727eae8e296205d531e8cd1988b35c80d0e976353faafdfbd0394b3b48f7bff9679db2e3c0d9aa163e48fbc43f89cad201c83fd879c0603bcc4c0deab58ac0aa0cb00745194bc9c42e5d66aa9da54eda9ad9525d9247b5a6abbf00261b6b4c4bac0b6c43ddb333b6f56d9acba64bc47d7eb5e17ec2e5e5eb1bcbaa77e75e30edbd68a4dd5fe12a721a6b589f9dc5355c43798af43819a9a066769d81c8c1a2c0db82113f707e034339168ca9314050d6246398b145f5616470b861bc239c1070b870a4921656297c91a2f64518e42364f57c898b7901ae84cdc173253ae301bf5ab03a485c36c315963e3596b632370b83253c04c8624cb86a3a38215f5f5ca969292cc343ece3a2db14c7c8386339c34aa81b8f0cdd7adbf75e244ffcee8bc71b99356166c9c386bfe0f6ff8dabef4877d87e4c4f89b6ed8b026fdcbe7bed8b2e19f6e4eff1bbfb5e7e6eb5774ac28b3365b5bff7978e3a2750df68afcf8f757ee4eed4dbfd232aef9478bb63dd72ccafbae7de4ed571fee79262e8efdd9b78ea7d3405eebc1c6e285cf5031da2ed7790b8adc617f38d82cd4bb1b43538409eec9a1d9ee05c18505bdee6edf66f775be1b023b0bec0e87e9888790a22358a2dbfd64bfde122f2e968289dce9b92497f166aeabc895cb45081e2298b0b97f639c8028dce8ae8b4428fea83c1caea53c0ad802e2abbf14ee51d722a92b1994100ffd0579fee2eae5a9d98fee2829082d8ac7d6d7964fcbd18f7b6bf94b9f941516ad1ab3f88376f287538b1f4bfefc9debc72df6e7e7fb1cd66aeb2bfea6b77e31efeec4f85de356fc81ee3c9b05d6805ef814acb2107a5a768281ac6fc71dfaed56618c3316ec70b60779b60c814a31ce0227e7612d091ee674e6a005ed64cb625fc9784a9f5d0ac0a84be7b20b95dece58a317e50ac51af5051f14874422323213d93a2f919199c8884b34a8f36367d8648e48b166b4c6c5cca2fde4d9ba2cf9314a0b2b328d0a2962655b94f0e528ccee10e3f51f7d7efe7d7a8ca0bc9c9cfcfcd5b367adf5e7bbec81bcb57367ad251fa5fbd2dfc25fc3b7e0bbf096f4d72e1eea38f3bdef9ee99c327dfab4291fde79dfe95953674d075a5997ee2127c08e72a2c9724c231b2d714c4f1a8b5617c7f454ca950a93b849c275c6ebac2298b906a91af503c690d96fe1033ce123b413c96666a461c62438544c1baf467a89d361a3cc424ebcf7b35fff2af5de3577259a3b278f6bfeded474cf8bf805dc84a3f8d51775938fefbc21fdc6433f4dbfbbeb865fb743cb768077feb9700a55a2fbe4da72698c54ef68f47448ad8e0ecf0269b66381678db45d32040279874b4bc5c223414ea7b31e1175a1903b9840d477f8ec8a49fa7399f13ca7ac40280a04325237c0d65e32058402ddcab4c001ad31ae05baaea343743692192e550781e465936099c0d9d5a39cccb0a23363992975eef3f671899f6f5efbe214937b6eb469d9d8e66bcb8a4ac265e11ba75ef3500d57337c7be184bc6bef9fdc311dbfb96eb0b56d5aa4f8656bd8ee7487ab2bb6ce98be2258ecf7e8c9c813e9cd3c5f1c6f780406a275e4cfbc1668df81c6a013b2ccd7e81a5c35de86b2a2b164ac14d34f259d52bb7eb67b7ed18286858d6b1bd6356e27fd05f65a9ff9702c56221ef6119079474a74b53614b4047190d23d454930c309c10c270433d237584e656811db64152cd706fb9dbb9c0f3a879cbc936d3270b298b193b181934ecc3169eb64d689337249d886159c0ed7d62acb5bd8924c655d4ff4d2944116a345592d3e7a7b9fb2a9c516cfc42238b9a1a66241fd0d7756d71777c7e5bbe3981be63ac78f3bb068e58fc74e9d33eb9ab9ffbebf744189ceb326feccdbe61977cc99754bfb8c99dcfa7dc7a3d585a91f2fde5ee1775616996beedf74acbda5a37dfcccf4f9e70ea79f5cbf79bbd670dce4c5e4b3fadac2e8d89f531b6e0e481d9f70161501e67f2bb76b738590dbe2c975861a4b6ba3b5632697b644dbc67491799699a199853da19ec2cd515b9e58713810106d2e97f7888d341c1675ce1c8618673188228c32e8bfba20921912515e04d5061f340c198881293a83356e6012c8c0249081a1de9045bd81c922c32545575b9b256716101c660baa32c8cf12f4e86d6b6a945e932164cd5565926f8adcfa704fef8f1253e7cd98750d468fd4ce0d6a7d2bc61c79cf39f19eae795f9f3873c673d5f525cba313be211332b632bc3076fdbfe03f6f7a7a7cfbc4b6d66bb0f9c4d3b871f3c69d3afd71b3e7abbfd5d68762e38eddb2684745c0515eea2af3df7bac2652fc9812bfef210f31b9b5e830b253b1caecf921390c80c8897627e7b417e362aed85eec9c88273aafd75e6f34d8306fb025f89d20b678bd1f30fa4266472646c86da53ba62e1766208999d28ad7db625142553d109c8d3c74e289f7a6de3766dce48eb163bf3705e41a694e3f97ae7851d7fedb6d3761ff8f7f848b77ec38d1ae7b315d0516169d17f8164832272a046bbf480e0806a7a1c4d058d3e1e8a89943e63a5787b67b74a52c1865b35644d98eb519d4a4cfcfd7e44525ae32aa915c2cc2e172da2a905936cf307366175b3ac5e613cd4cc699d92e32339baa35b3ec6693b2924a53a44e31b8e2a3772764b782fc354373ef66d7e46654ddb3ca76698462e6981c7b31c6e55738aebaff2fad88dbec6e9067d42d0ad14b3b4747ed56cb5aaee1a4ad51ddbacb564852772a9c9d8f50b78964ac287cf9a484fd8a398a6fcd9e387b685f7a0ebef5810726cfe8e85bf6cd3bd39f1496566f5d75ec9de4fc4865f184eac991be15ef7cff9fee696c88e2dff63d1a6f890ba79c25e15b17af7e3822151e27c6fae96e9f213dc59e9fb778f8fbb3d7177b4cc36fe694942c077eff1cc8e40c78b4741f7ba16cc4738920ce05d714558a38a3e27124dc3cdc9c595f42dd681ab638f3297c3819e77df5439c07b4e6454893c7f6aae80f71163562f9592662f9997cbfe224dbb8022ece2de4d6723b388dc46bf41ee2e2c3a4902fd635907add2432493b416730623d90331178c9a0f7f2a55c095fa62dd63593281fd74de227ea26ebe7935564a5743dbf87dcccbfc1bf2ebcaefb40f840fa1bfe9b3e1fdc10735cafd313831dda2569e12d0e5110cb50092e158ac50ed489db84765192c08111905664fb22d8e4b2d61a7f10a514db29b3fc93c50e9798383aa7ad583c11658f6c92ad63686e56b7a2504f5962512d7a01131251c3211351c4f4a7c94beff953fa54fa8d37d35f7f0e57e0f2dfe24a703f4f5d88f0af7c55219cfaaa9c7fedab7cfe8cba072a479d777b5b9ed16e6ecf233aec814263d0583c05773816e02e4757de5abcc6b10d5f67b9c16156368c117c000a5934de289129151322e444450e0992d5693662a3410db89c937d2ce2c264ac91d974465681d1681146cdddfd26b3903de851365630b612b21bbc2f6dec60bc2164e6e5866b9599a7c64cd4eb2cc596c20f362510b87d3887220a815d8d2f4dd251b6b88209849cf448baf4cc09bc6bd7e3d3a62d7cf83b2baaaacbfb673df3b339b75487cbc88ce194702ab7aef6fe2d0ffd21861f1edf1bc8750fbf901f29df0c1a6de4e174173e22fc1e249507bd22c77d6cea5a8f7d388c39775b0e671fe710341a7d82333afc9a888668dc22f5e3d5cdaa4cd8b81f7051fb98895550130ece466504adc7a66c8161c09732dbf364f33ee1c44e1ac5650b849da651f643e67f069c6c5d0d451f0d6ab1289c629003f026c3a3b3cf77d9aeec70183c12b65b22928ca8b685bafb4c708cb21a989d463776b2c51d874f1ef44f2dd6bb62399d4b735ce667f1cdf8b5d702c77f238a8f08daa2d2c20dd3b9bbef632b3f74e0dd7f0272409f5957778818f416510914175388087a8917793ad780255ed26989a82108139e9388c344290db2b2b613230b01ffeaad9396cc0f8d9e21f0c933244943a35abc96100c9c8a749c4423f87a1dd210c2c12b7811d330fe415eebe0792d461acd4111e4a7885933d86e489d56230a925e203cd2a9f3a13ab62e9bad4ad01923c625c63e2327dec367ec643e127e57fd0f0bb697ac99b22f80bb85aaf0ee1b9fd95d95c32e92a559baca99c56b193f336ee63ef920fdefe98f5ec5df48effa001bb1e3b5f4d7f0c3e905a49cd4a517e31f0cbf4935700de07505e0558bd6c89ed51a0c324f3a483807f49248e3b0a4e1c60982964ec1b16dfd5a5e0b3de3e876d8f79f64ba464397ff6b1d718d9e50cb9ee13712b6d685d93406f5524130372686339da0a208fc544c778be120b7e2e27364d2f04b9c6df84932f7562e7eefcd174fd0762d054fe463f0a7657454ee77998ab565ceb250bdb6d6362614ad8c8d69d7b6d93a426d956d63e66817b81684e6542caa993566b9b6dbb4dcdce3591ddaa2ed376d346f0be5391df5b1c3dd0db8a121a8d768d0113d292a2a3b12d4d537b1f07213b8090e2b571809267cbb7cc4c7d8c097190f1f651ac6673ec9277517d2ffd2183aa037c60b151f45d9b84c97649c0d4746ad42a113fcea6693cb7cf04b4a35bbe6e20ace50e54a2cbb671c8fd4af8b564fcc358cff536fefdeb12dad3fd818595b5535a63d317e704bff1f3a4d8957d68cbda1acb43c525ebea9754ecbee9f5414142f125abd4e4785fde5506359b8fa9685371cf198b415e1f0eea5bd3f19df36a1bef8e5aad92515156baeb966557ebefbe15ddb1baec9f13a40aa9782d51406a9ae4346f435390fba1e174137891a83a8d11a0f63ccf39c86e324c46b0c0c37ccf40d601490b0a418304499a8633b7232520380f79f62537792518cd4291649b2ae7938dcd81c61f1dc48b365b8d9dac88884bfd1f20cd3e3207163b8ce5a17b4623ebc7f687803f9dee0fef477d23a82d2d0d8d364e4e28b64c2f011fa67791fa68f9237d8ac4bb1ece010c60d2a117338400d4d12611bbbc07b54e990320a7963f8f04f489be8f8f211cd7c4a75cba1ff0ee8bf88a6c8115acbfd4a2d8870470460080ea330d94ce0c353c70105f86a5ee6bbf95dbcc0b3a9243af4363a9f9418a60b4547bd0be89d770cef78953c7a31cdede7fffa9549287802b17fdb01556a5ef47c72fd1d4bcccd5f209fc4fe72ee6743477233ff64477584264fcc07504bc300482d27e174d7a83fbcc357fc01de580992c82ee8d30ba845f8096ae1be427bf91bd15e611e6ae12b00de82a6928b2809f77bf9e747ce0bebd15eb11ce0c74646849570ad474dfc3a740b5f87c69033e816f238728a8370bf158ef9a891dc86f2288c5f413bb9fda889bb13b59275a8835f8df672179108659be0f92e483b06bc9c0f6934ef6db4ceecf3c5e80c1c1d70ac8763166741ebe0ba038e5638e6c07d07ff14da4b5e419f6be2c8cbff0de0f1230f73e741287f1bd5409ea5709472e6910fe10a230816891fbd88b7e2148cd3af3917afe5fb8502e167629df8474dbbe69cf4b1f6e7ba37f493f42f1945e3cf4d5bcc66f33396b5d64a5b876db31dd97738a6384dce4a97e8fa85bbdcfd55ce1ecf36cf8bde415f8def855c5fee1379ebf2cbf377f97bfcdf0a54075e0dae2a701474877ca1eb43f7865e652330168d072aa41f02868e8ce68084bd83fc12096ce48a308dff621e488afe0728830596d3c06091a5e73258c3d24b192c31b881c15a28d78326a93086fc8fa930412634a8c21caa46275498873ce75558403998a8b008d6b0578535e84b5cacc2122a27f92aac45b924f32e3d9a407a54d848f6914719aca36d165a18aca7ed14a631d8c0d21733d8c4e0350cb6d0760a5b196c07d8267c83c10e96e71e063b593d3f60b08ba50f30d8c3ca1e63b08fe5799ec1792ccf1f18ec67f0870c2e64f9cf31b89cc2a2d2f74a3a1aa285c2126bbf0ab377890cff06259de1dfc0fa2246d134d487ae45ebd152b40ea065681b36a25eb4066d401fc171e9d92cb419ae1b609c96425a0ff73d6e3ff70bee381c87b923dc63e82728806a6184aa614c03682a5a0d947b2d94df04c70a281b40adacb67e765e0a29ab01da80aae0c978a87f1d5caf85b49568153cdbc4ee7ae1da0bd7ad70ee819cb3a1dc2a28455b3413d256a22d508eb6e76aef1b9d3b7045fed1cfe6b2776c52db134031785335aabf2ccfe575ad66edeb85eb6648a5a5032cfd5af60efa74334ba5ad0e004cfbdb0377ebd9bbd7425a5fb6ccd59faef86fe190b66803ab8bb626001cba81b54d79bf32729b193603ea1846d416f48deac172b8db024f37b371a0b9abfe1b6d98ca60a5b6eb582eda1b050fabd8937e3406de1b81a7f45b05fdbdb2ee2ad686f5906733dac6deb092bda31f6ad886ba58fb020c4fdbe0ba855187d26b654456b0966c66bda4f7fdecedeb192e32d858c6ca6630d50eb89a02f4a794bd76d4937ed6b21e78cb7256a382e1ebd8bb96c3f9eaef55ee69dee540695bd8b82a34d007e71ef6bc9fd1e0b6ec5828ef5aadd6b05cadab979d29775cd96ffa7c1d834aa15419a3c4f5d0afcc9baed6aa0d7f57f37f1d47976aef6135adccf2a64229cbb33470f5be5fa2cdcbdbd5340a03b4274a5f36b3f765a88bd6aff4b50752ae633def63fc72f59e2a785e7a194e7b554abf92de295629556e6125696bb7b2def466eba139d7418eff7c84464bd04b30bd5b7dd567ef5c966f1dd4335ab632e9fa0fea5c0779b68dbee7f3f91abe939fc88f8573e3656fd800f5fea35aa6c1792bc3e20605233885bf0f2a9e8eed3f2e737518a9b6011a998bfee96aff5abc7f361a6fc337825ab7c05986e376383894c05bd0127650c529e3be03a595f5f220ee1b70fbea07f1c603dc98e0ede3bd782394ac86f30c38fae178008ee370fc090e1199e19c8063091c3be1e04786f0ac81dcbcfac3002c1fb0d919306da02eaa0285c550f9b403cd2ebff9177821fa140e026f5f70c0e3a56f5f70c0e964d7018b8595e83aa0d5d1847eb579fdb479f44172c0a900cb061c4e1550df3b3303ac1c88d4ab80a998012b06b446062ccd00bd0375f52a505aae0279016864ef80d7e357b24ebf462d332ea1021ee5054b0fd8597397821347af4b064a6bd983e903731728c081c6a6faeaf12e3c1d7a391db0381db0dd0fe75d7080c9807b605c7a007a09ce6f5308f70cf4f7b0174f18b03bea15c0e55201c006055a06ac14b5cf00a033b1947103ee1c068c1dd00380ab7144d6d7fa3ff8b0c7ffe1e96a7fe0286e84716c84fa1b07b81cff781d6ec2b534dc86e37035c235866b071cfec87803dc635c8febc0f8f3e3285c1d70adc1750316bf7c0437000135c81162fe73e4cf447eb3a0b0fed4eb09ff6baf7bfdbb5ec5afc2c5ff3aee7f1d3ffbdb72ffb3bf6d6c7816eb7fd3f61b3ad77ce80f5a6bfdf4d3ec5f0af207ca6aeb2d0381017960c640ffc0ae81070752032f0dbc3da01b1af86c80e696db9e840ef9dbb079ae7f2e993e67c91cd270bcdcdf771c3f70fc89e3247ed8e98ffc1c1f3de6f6ffe298cb7fec174eff91c333fd870e97f99f3a5ceb1f84e370acd13f8837c96312b5fe6638c626c6fac72582fed6449ebf2531d33f1e0e198e44acd65f5bd7e3af8b45fdb1e86c7f3496ef7f29fa76f4b3285dd171e060d124fa3709070e5a42f574398ce9a0d65c7fd03bc9ffd206fcf646d61bed3e4aa41ba17b8323ff2a6bfb6d40147d4019eccf4636686df5fddfc5f24a28d6bf62d78a0757a456f04ff41eef65bd2cef81527d77edbc8bf4dd8efbbf8d77def6c06d64d783182d9bb16c6819272fed5f4a2c0b030b6f5fc80de2cdf2538e5aff2ac724ff01382a1d567f85a3c81f7634facb1d76ff9f4a3f2d252f96d20b57eab0f8ef0fb4fafd8e7c7f10ae0147b3ff01ef4cbfd737d1eff336fbbd508f13cad91de3fd3687d76f85a3df8165c7f8d67a246233865f0427305dbafb043e8e5fc49fe211ac33236c06f320010268277a021d472fa24fd108d2e9b471bf999839f22279911b21231c6f30360a7c23471a316a9c21e041289db275a2ced92d293b86ebac96fddada7067aa6766cb37fff99ff352f7d07f35de95d73528419ef9299088dfee4a49f49f771988a887bf6933fc366d4e71ed29b17dd5d294186adb446f4cf4c6146a032065a6b039d486538ef6552947a82dbc293cfa0375a880fa09d3dfa847684bf86a9fcdecedac0561bc398ca0144b6135d1533873cabe68f3d56b529eb20e8541ceb6af82137484e5a62f0099fdbf01309496020a656e6473747265616d0a656e646f626a0a0a372030206f626a0a31353635370a656e646f626a0a0a382030206f626a0a3c3c2f547970652f466f6e7444657363726970746f722f466f6e744e616d652f4341414141412b5461686f6d610a2f466c61677320340a2f466f6e7442426f785b2d353939202d323135203135313520313033355d2f4974616c6963416e676c6520300a2f417363656e7420313030300a2f44657363656e74203230360a2f43617048656967687420313033340a2f5374656d562038300a2f466f6e7446696c65322036203020523e3e0a656e646f626a0a0a392030206f626a0a3c3c2f4c656e677468203438332f46696c7465722f466c6174654465636f64653e3e0a73747265616d0a789c5d93cb8eda301486f7790a2fa78b51629bd833128ac4c020b1e84565fa002131345249221316bc7dfd9fdf6da52e883e5fcef1778c4fb93dec0ee3b094dfe2d41dc3a2cec3d8c7709beeb10bea142ec35868a3faa15bf248beddb59d8b32c51e1fb7255c0fe3795aaf8bf27b5abb2df1a19e36fd740a9f8af26bec431cc68b7afab13da6f1f13ecfbfc2358c8baa8aa6517d38a73c9fdbf94b7b0da5443d1ffab43c2c8fe714f26fc3c7630ecac85853a59bfa709bdb2ec476bc84625d558d5aeff74d11c6febf355731e474ee7eb6316dd5696b5599aa496c8457166cc97bf08abc05d7e41aecc81eecc90efc225c4b9e57cebf8237e477f01b5983b7e4157847de81df9947e6f79c7f49ac2b6107074d7f0f7f4d7f879c9afede80e9ef9147d3df21bfa6bf838fa6bf43bd9afe0eb568fa3b3997fe0eb568fa3bd4a8e9ef85e96f70573afb8b1bfd3d624df6878fc9fea8c5d0dfc0c7647fdcada1bf7b03677fe437d91f351afa7b389bec2fb1f4b7b813437f8b5a0cfdadc4d2dfc2d3647fd9437f2b6ef4b7f0b7f4b738cbe6f723f3f9fd20a7a5bfdd80e95fc3c7d2bf963dd95ff6647f9c6be9ef653efbe36e6df6c7bd59fa1bfc5f36fb7b79f0f965e3e9a337ffb494eaee31a6769206963e42070d63f8dbe3f334234a7ebf01c1dff7a60a656e6473747265616d0a656e646f626a0a0a31302030206f626a0a3c3c2f547970652f466f6e742f537562747970652f54727565547970652f42617365466f6e742f4341414141412b5461686f6d610a2f46697273744368617220300a2f4c617374436861722036300a2f5769647468735b313030302033313220363030203730372034393720353631203636372035323120353537203337332036363720353939203637382037373020353833203637350a3532362035353220353234203336302033333420383339203535372035343220333138203535372032323820343631203434362033303220353531203439380a3535322035353720333032203734322034393820323238203535322034393820353532203534352035343520353435203534352033383220353435203534350a353435203338322035383920333533203930312036323020323831203439352034343420353435203534352033383220353435205d0a2f466f6e7444657363726970746f722038203020520a2f546f556e69636f64652039203020520a3e3e0a656e646f626a0a0a31312030206f626a0a3c3c2f4c656e677468203132203020522f46696c7465722f466c6174654465636f64652f4c656e677468312031343037323e3e0a73747265616d0a789ced7a797854c7956f55dda5f7bd5b2d754bbadd6a6da885bab5b41610e8a20d8104081020196424b42061400d12d860b0e405e208bc7cb6e330384eb093f17ce3c476238d41c4714cec381967b349c64e9c387616e28c13143b09616602ba7aa7ea5e09844926c9f7fe7adfebeeaafad539b59c3a75ead4b9571adabda70799d108e290dcb5a3337e64d7b61184d07710c2ceaebd4381f94feebd07f0cf10e2f5bdf1ad3b5efce807ab1112fe1321f1aeaddbf7f58e3d7dff3a84ccdb114a7ab6afa7b3fb1b15175d088552618cd23e20ec53881eea2d50cfecdb3174db3cc3571e86fa6d503fb07da0ab73cf4d6f2d87fa45a8cb3b3a6f8baf249778685a02f5c0cece1d3d4bd7e76d813af4373d1a1f181c7a0d0d4e2314b940f9f1dd3df149f3af8a118a9a419edf000dc3977ea08e455a271c2f883abdc168325bac36bbc3e9727b92bcc9293e7f6a5a3afa7fff23a68b6ee123e11c7f98efe24e233b42d3bf98fea9729bd2adb4718fa16450d17adc81b7e1bdf8ae993ef866bc95812fe04e7c0bbe75ce804de879f412fa31fa25fafd2c6d1af3d88e5300fd0abbd041d6fb07e85df41eba882e63013bb00f87fe57518fa36735f4169e203a868ce828f91cfa2656807b1cd5a01a90e637e4007788a3fcc3e8202a4125ff885e380b79006f22b7a213f80952435ac94fc9d3d7f2b11e35c1da77e3873ede1727610947f0025c8fd7e02d78147f488af112f401fa239a024db8b084be8cde41e7d1054cb01ebbf172fc49b2825cc60ade268e0a0efe0f7346ebc70db0924d7810f7e13e7409f05aa68d4720df0996ec43d2ecbc61f435d8ab426ce6b69031ae89dbcffd413072637022cf219f682717492f7a0e0da387e1db86daf07cd481ee4677a2ef82fe3fc257d03ca6c7c7a1c52df07d8fefe2f771dfc463a817ad47bd50fe00dd841f445de893b0be1538857c1bb9d138f9157a02bd8d37714bd0c3dc3efc32acd08607409e47a0d73b681c3dc09ffb47f6e0ff7ffe6f7ef81feb527517d033e85e484fe3d3fc29e14df45bf4147a1bed40afca724bc382ca850b2acacb4a6325c54585d148c1fcfc70debcdc9cecaccc50463020a5a7a5fa7d29c9de248fdbe574d86d568bd96434e875a2c07304a37c9c48ae693d99a20bfb83c160db7cadee9b5b4f7059f63f0413c839a791ffba4ea9d7d5d3aeaba7cfd65726903b511faaa9a5039f44f5ef27902b81dd094467c1ae153093d6a9ae7b5ba8ae3f9152d3ddd1013d6a43f640a2fea388260a1bfba4c95813aae931cecf47278d26802640d0367e12d72fc60c90faba052709d25be6e7279ce104c9aaa3695b423ed20120540b2301c7759533317df6e8b52c04dd66904b453821d624746cde407f42ee4ca0238193f967478f4ed8d1968eb0b93bd4ddb90934d709329e445c565d5f0bd5631d4d1d7d81040f83b3cc0f94405d5f603444d551d7d70179a8167add900e64434deb278267fd09279475094738b1145a2cdd7fdecf8dd625f707687574f41381c489d5add77283346f6b6b4b068147eb4230200c56b7ad1a96921c999fafae49534077c7363ae7b64e2a67ddb6c0e8911e26eb5126036b5ad7071bd3f9bfb51a1dadeb0ed575777657aba3d724e41656a0969b5ad9024175b56d1a496b001c9e713a6adb82aab21bd7b4d650c1429db57e75db67291d1a05087533cc009560190c9008740512684d6b089a96d3aca71c8d769533e3098227cd6f6cbeda2b2164d94381d13fa104ee084d5e984be9d4286296fd4f88c2fa507dc7e8687d28503fda31da39313db22514b087464f36368ec6eb3a60d6e656e83531fde523fe44fdd1b684bda30f2f00dd530ba85fd35ae50f3ada66aacd3355042605866562cb012dc06f99568096514b6b30008a5ad7dae6073db552dc02582da92181e196c31e6b6aa33aea299f554f8d0683416a9d472664b4052a8991d5ad6a3d80b6f8c7901c09c37e7450ced9198e671de58ccc7066bb778460967f63e19927a1cf9efdd9ec49aebabe05099cf457d83d2a3fe1aa69e5fca44d45c4cf51640cc349af4c78c38073c3a3b0096f8412f67042683debaf6c0bd81de001e8eead0d35aebea93550373a6b052a455b29b50330f55067dfa87694a8d1df98dab87646e1d462e1481f018d8f6cd9064603bfcea3d4fd0447ed89fa4b417f70d41172062a226daa55dbdf08bd86c171815bb32770255b16663e0d665a96e0bce5c0fc876798bb24f063d52743f8ded527657cefda9b5acf40f417b8b7a5758c6052d351dd76321378ad6702107a332a99a5d25a80d650233d3d6344cf58fe333242238ccb3302ab774d60c468fa191a465d1344a5d9190d3ef3616709dd5e1d82c09c83224db689844790a24846cd408bb47ff7a7df4511c80aa34147d091051986e67f1e11d0655a220030faa1e99f0bdd10f138509d6cd98bb095e70c3164b4b8ad60d47292db5b66b5ba64178e424604f7ebfc7b3ce181356eb097f19170fb647bbba338129e4455935595ed855121801c309d3ba9b8a83406c08ec845e53f9417f1de3df7dcb90fef555e957006f672a7af6c7eecd8434f704f5c59ae4c2a6f8324c721f27a142431a07f95434487f5228779bd88894e86b9740ed463924dd86e0a98a2007802429c060671f0dd46fba5c9707bbbfdd254d8515181aa2aab2a9d1515274552d3d27a06e9b4867418140e1746fd728a0d7441f438198771099671036912eb75b763834857edb2dacbf271445745569106dd73e4844ea7034f73da4c07015e61341c6ec7e1f65d70e0b1832ad611141e558e4dbdac3c8dbf8d7f82d7f3d6cb7f10ce5df922b78eeaf866d8a411589909c9b2dbc0178b9c912bc67abde926a39b13c84d1c9dd46eb094719cc56cb3442db2256ee1db1dce8a48f862917dea6211aa9a2a821f6c65d051ec08c19c2147313772e5ddb7dee232de7a0bf3dc6b9857ae5c294378fa23d0e35e984d448fcb8b9040f2481647388ee873710ea9c14d606f98332281f3210f174699dc4254c235a11a6e135acb6d475ddc0134c8d91f04b9a95866aa34a4b7e937eb0917617b0d3b5e51d18eaaaadaaf51b2307d76cce002fd52f57a78c12dc80227c003a3133420f02e10a1308a3f619f3a0b497f16b5b7611c842f16f62a48d9af207c0faec5b5c2b93f47407136eef7aa45f09f647a6b920bf5b1280cd921c4615001f1314ced548f445924f04526bb89984c9600e88e080637ea368335145179db8b2151f39c047db64f16468be99669dfe3dc875387c8b2a9d3e476e19c725eb90ce95ee53c9c2f668f9761763b3c33dc2ed7703697adc45e6be78df00416c19578916d193cddedc0db5cc3d848b0131ada75be126a34f011924b440e097a87c766912cc462b10b9a3e1da0cf600ae716ba035444aa51d0234846ed5695d159a1e90ab7a376b031bae1c1a2246f12c493a28e2bc9cec9ce0e810514959695960a979572a5f3b072946c3830b1b2f9e6e377f6848b42ebe583b7acdc919d19221953ef0ae7a4c2e2c7f77df1cd2afc60f9ea249b5e197049a92ba96d2e9bfe157f41b8808ad1eb679034bd495e03062e7c81660ea3c71816221e87cfe30b7b2231b1cabed059915c2a2d0814e715874b8beac455f646e7b2e47a6979a026af265c5f749379a37d63524b5e4b74bbab77feed8ea1f05034337562fa677201983709188c6501010784483a3178b137b7d0ca235f7a7a46898fc4052c08fa12644c4fb77a0ad513915a565818e3f95ccf83de849778a9dbb1d8cbbcd4ed144798db298ec0cec2fed2cce1f456ec6a6fd74e6758c8c8cc711427f1aa96624c69f08b95a06011ef7584408519a24e143d6eaa58a65b447abfa84c0d64c4b17538d01fc8296d5dd4f44ce3338fc293a9e110d6f505d77e7847e1ca70a878f550e391558f7d5af9bcbfba106fd9dc6bb539161595d7dbdd99be45df7bec1ce64a0b942f2ddd6275dbab722a6afc8e406af98b8fbdabfc01a9ef54f8f7c1ae74a8504e17718ce3e0781924031136eadc64e3086d62d0cb866103612ea0fdfcd4797adad8f1d7cc164f280dfcfb909ec7a9caf9cb8d30eef424d86b1cc6d5a371b90306e1edd8ce47719497b1cc6fc01db8938fe35dbc05e978f01702c7e96dc6a871c0c899101c57e41732515888a18502f802613d6a1376a02dc241b45bb0d38bc22dd8f9001fe5133c7c8c062658f1545124d24e6503cdb75fe36eaf7a8294a8ae5eb74eb74577ab4ed0893abd1304d3892e38c31ff3067459d41fc4a7146574ea4ff8699c8953c0173c3ef510d9c8ed9dba40607f500ddc57ef0b1f814f08a16d6760d9701359ca046a2f56002619321dcd82132acb4f59f300d828d543b3bddc3e0371c60c243dc619cd1eb435cb96256791648fd89b093709dc23ec3a9b64a6a47eb01d05e166633956cfdf35c6a31dc4f7953b9484f29c328247f06adc8cef52ee282b88ee5b52172f29a8288d44f72fa93e303f5a42fe53f9b4b2057f1e77e3adf809a5533976e885ca45b1c2aa05670f7df2f9458b6315954b9e419aff1b6637e25a394d8845894c3a0847e06e8ce9399d1e713275ecab344f9dc43c0bbd236dec86e4e0bad6d1ab11dca0eab7991f9c758378d60bf2c3530f90aaa9af2947b95ff1cf2bbf56ce4fd1eb4abb93ef661eb852cee26251bdacefd0c7f5bc5e2f18751c16f406d8941e8b8d7a5d3d7569aad7a599760bb3a982571d6e50b85b1955386514efc553782f79646abb706eea3d12d43cae1b6673a12cb4520ec48458a84ea80bed11f66688a931a3d1ec8f5938b37e03da8a88dbc316ed608bceb1e5c839c46f749bbbb367dc7e787266b120403b76d3dd825fe8aa2f15e6fa51ba83eeeac5d91bcbcaee6cfeba324aaaef7ca1a9659332529917eb5c1bf3c56e0ea5d738b3fddce5beaf54e5547bbd3e05cc33525cfec268d5468757a7541351487366356b3b77005622a079a7080797951ea9164a2f539d4d877937ee16a9ad5149a9b1cd28893f70251dd4024a61a79a8e241e8191cce87fce20e3f4b3722575cdb74146682618096730f23e3ec257f132dfc1c7791dcfeb4c060eb337b5105ec006596d56d9da6ce5042d66129cba6e0b8b992073782b66f70ace3118bb7a929f37d258878659e37422ad34d27558a833a72749a019528f083dee8d36621390915b4556098466bb8dcf91e7841346710db789df6ceae006f86dc601539c1be6f71b874d2693d160f21b534cf9a628b788af302e32c9dc2a7e956199d102160abea59d45590e1c52032d1c148f284795df4f2bbf574ee0e7f072bc0c3fc7fd64ea6e72f04a16185290bc3773777f07b4664569a84a0eb739d7fb7b49bf851721c02249707abc319d5e6fc336cfada0e3ad922c354bc40bc7259d9dff8bed93ed331e004c87e8443e44ad86f72639afb31ae13ba78e0c291f1e570af0f71ec7cedb1e7e5a19e9e96ffa97219dee8e67566eea20bf7e4339ddda1816cee5aeb859f9da9b0f9f5b98a7bfb2c950b8e03b884cff19e41c617781111d93cb5f32bc6e202f1970369e471ad052ae4d582fb61af7f37b740683c1a857c3288351d4d1a06a3fde430817a026452fd824006249d4888d0623863b2599ee8c9e85961e60719cd96696cc55e655e661b36033637842d08c2f5c5955a1b904b839a9533e7b96e57a167fb48768a0c605391855c4ff858fe1ff5286db95fc76fcdeb163345ec351e50db218ff56f1802e6ba67f297884dfa1f9e84939c81b8d796ea33f6f517261ea8a6439b5356943fa3e7ec874609e25d407c6e49898be675c35b253b20104e69743964665ce07e0a5d615b1047208cb062cd86271c7f68b58241d3938272710db03331a2db9b483d3602bcbcd8dd82272647384f379b8de02fb45f57c55a2aa761624b0bc7dd6adb70baa4b67de80450437f4eb65c50ee63ab854e5a4b2171fc1abdaee5f527c5b56b67f4d49c9c1dad59f5854be7479e58207962e3f5c50d4949a316f7b45fdfe34fc293c0071c33fbb9db61297f278724d2030bfb8aae2e57b8ebcb8a0bca8305d925394275d850e4f12ace115f0178f096f221baa97c3c229513473566e02eb3f049e80251c4011cc21b33580035c33476c0ec9019edf6167d7707bf16445517b847977784c288ecc7adc982a3f752b8f5dc9c50b946fd4dd3b2f1ae3713d2e8618c0f547a73b7975e5e5089c98dae95ff2a7840f512e3c3fee92ebed9cdd1124012ee0584f0689ce1d5a3861f34a108379c5c8e98ad0b2100911a3d17a661d6c86b12d0d1bdcf382863404313041a8da562d559358906ee4b8cd5996469d318dc49d1510318094ed5054b55f8d7567ce5846368dd866d40ece3a438dd868b598eed2cce9bb6e8f4a4af953aded1dca2f5faf3f969296ba75e3b27b0b8b6bcdcd9fec5d71df821537ad5ad6f0fd3beffa5643cb06e5fe7959be25d9c1aa345f665620b0a628afcdcf71955f55bebe6bf076a70e6759033979f9f77415c5e6852b5f7c74e8d5650d6b9635ae532e1edef7787e20d51f4c8bd734b4a7fa93bc66d33c78caae9a7e977f5bf823dc5725a81e9d907b205c8ee45a23e585814565d58115652dfc666b5bd9e6cadb1d7bd2acd1829222b9a0b6a82da5a56073d9fa251d05dbca860a86cbf62fb42c2cb364141588e2bcd35b53700a59725a34de94d18bfacdfdae5e49c80e48f90197cd2565f0e658e09aaba4c1d6203590c50133d5b4dd5966d6341d9e044f1e998ca86eac9dd6da676fc1ab5a8dcd512e7bb8f02425417c030ad6c2e2d252971a39337dab3bc3bfbdaaa9e927f73dfa8b86a5b5f71dbebbafa1a1f6dc5da3dfadae6db87df891a34abc7bfd9a9e4572ea0a3927535adc9bb6232f67d13ddbd31ad30239f8731dff5c59595bb770e189b691a72b44f9547ccd8315a54b16460b8facdef6c50562e52b24b769e39acaca6592353db978f3d4c1652b0bad79ce9cc1babe032eb77731623ee6e7f084fb3b94893e2d67f0268fa922797972b3a32d696dea56a15fd761dfea880b077571fb3e67dc6f67b121752ebae56a38f825b9923a9716c83262f1100e850c5cc4326019b640c15c8c81a49570464b28245a822e84b2e56c1c858cf82042cca23704d5f16431d86f845d13d4ab38b4588739962c30e659df32d7b1d8d903098b84f66e51be794c7942d98c9fc0db5ef8cdc10c7f4fb4fce1351d9f5dbcb00e8bbf7497ba95f7c89175b94de04b86e059f3a9a58b94cf7b56f80305958b2b27f62b97ff9b100892bd542707a77fceff13df8592d04239cb24a68907759c2b40df5878048380f58e5ac1e8c63e3490dc918c8d3ec34eaf1ae9d2406d1202f80a38866178d68c31fb88b15738dae902eff14fca931b8ff5ffcb0bb8c3e0b0d75466f584f1cd079a56fde03fc84fa67eb0616776283353e252e9cd7b0084f99de8666fa516ca6e51860736b15a1008c8c07f4ed88c7c58355f6b19c6067dd4201b9a0d9cfaae63f222c4ddd47f855507461d173eaf3c896f362af7e3dd7cd709eca07394c25aef863992e019a0469e0fa727adc9d294167709a13c583147330ff22f71f0581facd61bdd5ebaf0ac74bf294ee37bfbd45491ba6a1a7685b555b383411cb3c781bed5c9d60e026881bf5b79326343306f4dc5d99f35d52c7ab6b3755723be5979d2d7927ec770cfae829bf7a4ca76b71b2fc6c6877fd4bc6c5d560e7ef77206c9b138129f7dea914c90ba64fa17fc43fc61940ede62ab1ccab29458969055fc12cbdacc41b2dfa3f751b1b32a4d2694b158e44f24e3642de4a2a59c62309525273b64644849917cc65d10f2e22c938f8bab012f5c75daa330ac6726ea9dbde020f704933e7ea3b954ab24af2a2f2bcfe04a9c8a09e6a7b0505e30ffb6a58bf616869779b3c24b1757ec4be33abb7b07c5741cc529d8851b94df285377acec9724bf3fc995ef50de73a4d96c0ef2b381a1fdfdd41a0f43769e5941ce298221fabd76d7059ebec9691666761df65cdd6f75afa19b3a02ff247f17ec71859c49dc2e7789b1ce18f708768bbed6c55b056cd1cf58b3dde4b35073660f1eec2d4a957aabc098b3d7053d701eb6b31efe49e584c9e6acad08b716d109d77fbeeb4ba7c8fcda4f04b28381d095f37cd781656bdefe1e9562e1f4cfb92990a2023d2efb6c1e542479ec450b3cc545b5453d9e6dbefdbedde54f496689c65f21b3b38c04cc8eb2a00c5be50d5b4b789436101c0e926030b72a8d3f014fddda86d252b6412b9e3755214320e0b5fa4b28cd6d482a2b2959c871617fdcfba0f78437e1e5bd91d9971da0adab5b0c3e87bef008330b16b49b53dde16bde75cc5af3ac0fbae675073501fcce819f36a4a5c81585b7372cdf55d298bb3f72cfa1ba9a9a570fecfd466daa736556fe8e8aa6fe920df3f794ee3bb8bcb6e115a93413e7ba0a52bcc182a29c5ca7d16b9bf7c4dd8d874a8a2b2341e5bc35e270fb4ac2d9f91e93c799f3e983ab1e288c2da0af3ce87b0fc1b6e9cb1339dfde6cabfc13f2ebd95f5a9ffdfecf6e9bf9abebf4e4f4bb3a04db8fe189976844e8a7c74adb357f9cc5d7fdb156d2d320e9037448cc43c7b977d1cd42eff447fc05745c781d92032de3df87a9dba727492b3c4bcd4335fc53e8b89806bc6a749c7f041dd76541dd06f5fdd37f1636a01a2119bd02a91652957009ea123a48b6a103820195f2675109e0c3403bcca7a385307f08f5a137b119efc209088adee1f4dcedf0fd3d5fc4f7f3dfe3ff28dc2ffc426c14dfd7e5e85ed61f34e80c8d8683861f19571a078c63a60d6c35125a0a27857e080450325a07b6df4f5e81a747aa85c5e477c085700d6a568434cca354a8514c5b19519e8679940cb108c522d045d4a4611eb9d11a867540d7a35e0df370c27632ac07ba19dda3611ef9d0830c1b60ce6ef4b486313263ab86611c38832ae6501eced0308c899b342ca064bc45c322d0f76b5887fe1bcf8caf4779e45e0d1b502a19d3b009d593ef69d8428e716e868d540fc297340c7a10beccb009e84ee12d0df32820fc27c3662aa7a8d730c826da19b6526d8bd91ae651ba58ca300d619d628b86611c51d5958bea533cac61d0a7789461fa56ca2a9ed030c8233ecbb007e86ef15b1ae65186f82ec349b4bd0e6918daeb547da6d0f6ba3c0d437bdd6286fd747f751d1a86fdd56d63388dcaa3bb4bc3208f4ed5a1c4da7f46c3b4fd530cd33bc8acfbaa86617f75aa6c79543fbaf31a06fde82e303c9f8ea3271ae6e11c9a29d633fdcf62905fcf6c40cfd6a52fd530a5d7526c56db776898d299bd99d9bee847350cf3ea1f422b510fda8a76433e843a510ba43e3480764019b88e3784f6600b58ee07d7b5ba4aef8596ddd771555a3d1b63e83a9e46e5eee55ee4becebd04f9c9b92de670fe157a14a1287ccb01ad40fda80b641b4083907a619c00aa01b41bc5594ee5ed07b41315006709da0edf00d0fb61457dc01b64b51e287ba0dccba42c98337b3594db817aa399e6ae63a6e58da9ebd90c839a3401148379a2a8744eebf97f618c7e26670f944340a5e304187d37db19ca1d62542a3ddd09baee6ea8d1debbd12d401b98ed73636eefdfa54b2ad14e36169526007e7327934d9d7fad66273d4cea4ee075a38826c1c0352be882da1ee00eb1fda0ad0bfe0e195630ac8e762b6b4557a3eaa18f71e26801cc1b012efd16c07aaf1fbb80c9b003da0ca17d6c86ad6c8e388cb00fb531f9024c4ffba0dcc3ac445db5ba23bd4c9221b64a5a8fb3d977305dcc68630beb3ba3a93ad05513d8a1da77f7359c3893ac1b66e96223aa1abe95cdd505f98de755ebb46d17d8cd1eb6afaa0d0c40decdf871e0a82b50f7429dab5f1ba14b1bab87e5f4945cbf6ecadfce502ef49ac72c7107ac6b66a61b49b5f36323ffed3aba3a7a371b69ebec19552da56bd6066ebcf6abb63957ae85d76880ae445dcb109b6fc6bae8f8ea5abb81722b5bf9003b2f375ea9aae7ce393aedd12cfd7a7ba75aa556b987f5a4d2ee65abe9991d87b6dc0e2dfefa0ecdf8e3febfe2ab555e13947d50ee053ea5ecb9aef5c7f94b991606af6b3743ad07efbe1d3cc625e8f101d0aef7e373b933bd0635af3ff01746bdca5fcfd0dc562aad01f07618b7f7062de6f29ab553bc076c48b5927dd7b5bf518b6bf576bd9c7378bcc42fe617f2357c295fcecbfc22be91af98dbfe2fb4b8f1ad79955e7f8395a9b446ba3e5c08ade672afd21bd9f98883eeaf97fd1a0e3cc2ff820b017d4e8b596a13f33efd40fbdbedeb6fd6dadf31e65fb740a4c5eb683a8e5ebbd17f909e6cd9bcc44bd8bfd0e329c8ed90cb901e84c4a12afc27b499a54be80d48fcf4591c1e335b4acf00c81fcb9aa701775005e3067ba93c8173c77c3e46c81db75828216bbcbe9e9563528031b2c6fca91af02469c0e6d080d1cc40c6584e8e06d2d355306e34d26132c6cd665a06c7bd29b4e4c6bc5ed6801b4ba113bf8c3d63e992068c6e065c63d0f7ccf4d770d2d8da751a58b94a0375751aa8a9d1c0bc792a18cfcca633248da5a4b01992c6929234e07068c0a0ea2365acb05005e3f9f9b453ca9814d43869e91ad004758ec330d0c43996ac8eeb1c5bb95203754b359095ad016d26e78ce6a53193490396198ad6461a73b934a0092a3135e21c8cc78a2498521c733a19838ce5aafb87c773e65161c8384807259e9132732c395903367be98bd88a05e44012e84518b7b09de6c7615e5a8e198cac253fa3287eac729106962f57c1f88636da3632663031e5eac70c3e060c63728d0658270a0aa21ac8c9d34046a6067c33bddc1e06dc6399991ac8ce51c1b8d9556a5b62c5c560c2c560bec560cc129c5d8cedd806cf9d12b68df1cd12150bc99229b974fa0349facd6f7d52f4b7f803b74ffaf0825dfa1d247449be4426a647e4e44b2673e925ec93262f9824fb470f7c44e40bf10b2f5da07fb71affb3dd5d4a5f8b2cf81fa7bbf4d7effba4f7633e49fe31085cf5237cee8755d25b3ff449236fe237a1e8f861fc87e45bafe549df7aada2fc5bd8f4efb5ff4e12efd0b74ea7de81d313ff3e7b0175e8fb465769e6d196a34347ef39fa85a389a35f3faa935fc165671c523fa4af417a09d25721bd08e92b905e58ef90be7cc62f3d0ff8d4199f741ad204a433204b6595435a046931a45a483590aaab3cd2124832e0aa98432a2a764bc531b7142b714b25509e883149823113ecf4ae050b4adfdb85e55d0657e903f1449cbc3780e50158ed1b3b59aba49d54f6de077b13bd9cbcd5602bfd5c0f4e7433d6c26eea144ee0c0a7129f22550fe1cd0f0c3f4002f79dbd8f046e916f21a80fb35f735f471f37dc89a31be58dc31b4736f2e59f7148b4ff1f3f6386feaf62791c9f849d49b83dd2736e87f42ca467207dc96d92bee8b64a4f430ae739a4781ece9f6f95e6bb2dd267033592e44e97825006dc95d2bff932a5cff97a24bfaf481af63de0233e7786f44d5783e4714724973b20459db2b3d9f9a0938f3b479c6f3839a73b597240426edcecee70c7dd5cd48a91886d187e115c8507f0307e0ebf845fc71fe2696cb42130ae08aa02373c8c9e432fa1d7d187681a198d8632c9466c1c799dbcce4d93698ea714833e4fe2853c8970d992d95221f0151ca9c0a8a259c013305ac2d9881a5baa132e0ce5daea9386a27063a27b4df5a1fbee4b4b3c4affff7724ad6d420f6d5a133881ef6f4be8e97f90328866fe1d6470087e834309ae2e21d6f57526c450ed20ad5869c54a2bd6ba848d566ca15a9c70d7f525dc401d0a8787f6d0fe7bc2b3235d4583340dc2b8ec43eb83d0700fcdd035ed3efe191cc4c08708868e106619a6744608cf2498fbaf0df20f7ca8ac6184fe0f536226030a656e6473747265616d0a656e646f626a0a0a31322030206f626a0a383433390a656e646f626a0a0a31332030206f626a0a3c3c2f547970652f466f6e7444657363726970746f722f466f6e744e616d652f4241414141412b5461686f6d612d426f6c640a2f466c61677320340a2f466f6e7442426f785b2d363937202d323135203136323520313036365d2f4974616c6963416e676c6520300a2f417363656e7420313030300a2f44657363656e74203230360a2f43617048656967687420313036350a2f5374656d562038300a2f466f6e7446696c6532203131203020523e3e0a656e646f626a0a0a31342030206f626a0a3c3c2f4c656e677468203335362f46696c7465722f466c6174654465636f64653e3e0a73747265616d0a789c5d92cd6e83300c80ef3c458edda122010aad84903a5aa41ef6a3b13d004d4c8734020af4c0db2fb6d926ed00fae2d8ce074e585e4e17dbcde1ab1b740db3683b6b1c4cc3dd691057b875365091309d9ed715bd75df8c41e86beb659aa1bfd876c8f3207cf37bd3ec16b1399ae10a0f41f8e20cb8cedec4e6a3acfdbabe8fe317f460672183a210065adfe7a9199f9b1e42aada5e8cdfeee665eb4bfe12de971144446bc52a7a30308d8d06d7d81b04b99485c8abaa08c09a7f7bb1e4926bab3f1be753954f9572b72b3c47c4c91939663e20279c9322ef384ef929c723e48c3946de3327c80766ea73248e24f223f7a9904b66ea7f62de239fb996f22b8e979e95643e21b37f8267a9d55f21affee8a3d83fa638fbc7e8a3d83fc6b314fb271932fb67f88d8afd53ca67ff94ce62ff9472d83f2537f64ff11f2af6cf621ac4fac7712478677e462df4dd393f66ba58345f9c6c67e1f7ee8dc38855f47c030937b15f0a656e6473747265616d0a656e646f626a0a0a31352030206f626a0a3c3c2f547970652f466f6e742f537562747970652f54727565547970652f42617365466f6e742f4241414141412b5461686f6d612d426f6c640a2f46697273744368617220300a2f4c617374436861722033300a2f5769647468735b313030302037333820373730203438332036373420363135203732362036333320363132203637302032393220373730203538312037363420363537203537320a3839332037353720363834203636372036333620363336203633362037343520363430203330312036323920353933203330312036343020353134205d0a2f466f6e7444657363726970746f72203133203020520a2f546f556e69636f6465203134203020520a3e3e0a656e646f626a0a0a31362030206f626a0a3c3c2f4631203135203020522f4632203130203020520a3e3e0a656e646f626a0a0a31372030206f626a0a3c3c2f466f6e74203136203020520a2f584f626a6563743c3c2f496d342034203020523e3e0a2f50726f635365745b2f5044462f546578742f496d616765432f496d616765492f496d616765425d0a3e3e0a656e646f626a0a0a312030206f626a0a3c3c2f547970652f506167652f506172656e742035203020522f5265736f7572636573203137203020522f4d65646961426f785b30203020353935203834325d2f47726f75703c3c2f532f5472616e73706172656e63792f43532f4465766963655247422f4920747275653e3e2f436f6e74656e74732032203020523e3e0a656e646f626a0a0a352030206f626a0a3c3c2f547970652f50616765730a2f5265736f7572636573203137203020520a2f4d65646961426f785b203020302035393520383432205d0a2f4b6964735b203120302052205d0a2f436f756e7420313e3e0a656e646f626a0a0a31382030206f626a0a3c3c2f547970652f436174616c6f672f50616765732035203020520a2f4f70656e416374696f6e5b3120302052202f58595a206e756c6c206e756c6c20305d0a2f566965776572507265666572656e6365733c3c2f446973706c6179446f635469746c6520747275650a3e3e0a2f4c616e6728656e2d5553290a3e3e0a656e646f626a0a0a31392030206f626a0a3c3c2f5469746c653c4645464630303534303036463030323030303737303036383030364630303644303032303030363930303734303032303030364430303631303037393030323030303633303036463030364530303633303036353030373230303645303032433e0a2f417574686f723c4645464630303444303036313030373230303639303036353e0a2f43726561746f723c464546463030353730303732303036393030373430303635303037323e0a2f50726f64756365723c464546463030344630303730303036353030364530303446303036363030363630303639303036333030363530303245303036463030373230303637303032303030333330303245303033323e0a2f4372656174696f6e4461746528443a32303131303432363136333231362b303827303027293e3e0a656e646f626a0a0a787265660a302032300a303030303030303030302036353533352066200a30303030303439373438203030303030206e200a30303030303030303139203030303030206e200a30303030303031373332203030303030206e200a30303030303031373533203030303030206e200a30303030303439383931203030303030206e200a30303030303233323632203030303030206e200a30303030303339303034203030303030206e200a30303030303339303236203030303030206e200a30303030303339323133203030303030206e200a30303030303339373635203030303030206e200a30303030303430313538203030303030206e200a30303030303438363834203030303030206e200a30303030303438373036203030303030206e200a30303030303438393030203030303030206e200a30303030303439333236203030303030206e200a30303030303439363036203030303030206e200a30303030303439363439203030303030206e200a30303030303439393930203030303030206e200a30303030303530313332203030303030206e200a747261696c65720a3c3c2f53697a652032302f526f6f74203138203020520a2f496e666f203139203020520a2f4944205b203c30333241424346413841323131343041443341433441453942374345343738383e0a3c30333241424346413841323131343041443341433441453942374345343738383e205d0a2f446f63436865636b73756d202f45383834463542373436464145334535444339443233464242354337333439310a3e3e0a7374617274787265660a35303435380a2525454f460a, 12, 0, 0, 4, NULL, NULL, 0);
INSERT INTO `attachments` (`attachmentID`, `name`, `type`, `size`, `content`, `userID`, `PRID`, `ID`, `POID`, `obrID`, `iarID`, `supplierID`) VALUES
(19, 'ngs mon.xls', 'application/vnd.ms-excel', 85504, 0xd0cf11e0a1b11ae1000000000000000000000000000000003b000300feff090006000000000000000000000002000000a400000000000000001000002300000001000000feffffff000000000000000080000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdffffffffffffff030000000400000005000000060000000700000008000000090000000a0000000b0000000c0000000d0000000e0000000f000000100000001100000012000000130000001400000015000000160000001700000018000000190000001a0000001b0000001c0000001d0000001e0000001f000000200000002100000022000000fefffffffefffffffeffffff260000002700000028000000290000002a0000002b0000002c0000002d0000002e0000002f000000300000003100000032000000330000003400000035000000360000003700000038000000390000003a0000003b0000003c0000003d0000003e0000003f000000400000004100000042000000430000004400000045000000460000004700000048000000490000004a0000004b0000004c0000004d0000004e0000004f000000500000005100000052000000530000005400000055000000560000005700000058000000590000005a0000005b0000005c0000005d0000005e0000005f000000600000006100000062000000630000006400000065000000660000006700000068000000690000006a0000006b0000006c0000006d0000006e0000006f000000700000007100000072000000730000007400000075000000760000007700000078000000790000007a0000007b0000007c0000007d0000007e0000007f0000008100000052006f006f007400200045006e00740072007900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016000500ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000feffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000feffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000feffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000feffffff00000000000000000908100000060500bb0dcc070000000006000000e1000200b004c10002000000e20000005c00700004000043616c6320202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202042000200b0046101020000003d01080001000200030004009c0002000e00190002000000120002000000130002000000af0102000000bc01020000004000020000008d00020000003d0012000000000000400020380003000000010058022200020000000e0002000100b70102000000da000200000031001a00c8000000ff7f9001000000020000050141007200690061006c0031001a00c8000000ff7f9001000000000000050141007200690061006c0031001a00c8000000ff7f9001000000000000050141007200690061006c0031001a00c8000000ff7f9001000000000000050141007200690061006c0031001a00c800000008009001000000020000050141007200690061006c0031001a00dc0000000800bc02000000020000050141007200690061006c0031001a00c80000000800bc02000000020000050141007200690061006c0031003200c80000000800bc02000000010000110142006f006f006b006d0061006e0020004f006c00640020005300740079006c00650031002800c80000000800bc020000000100000c0142006f006f006b00200041006e007400690071007500610031001a00c800000008009001000001020000050141007200690061006c001e040c00a40007000047454e4552414c1e040a00a50005000048483a4d4d1e040d00a60008000048483a4d4d3a53531e040d00a7000800004d4d2f44442f5959e00014000000a400f5ff200000000000000000000000c020e000140001000000f5ff200000f40000000000000000c020e000140001000000f5ff200000f40000000000000000c020e000140002000000f5ff200000f40000000000000000c020e000140002000000f5ff200000f40000000000000000c020e000140000000000f5ff200000f40000000000000000c020e000140000000000f5ff200000f40000000000000000c020e000140000000000f5ff200000f40000000000000000c020e000140000000000f5ff200000f40000000000000000c020e000140000000000f5ff200000f40000000000000000c020e000140000000000f5ff200000f40000000000000000c020e000140000000000f5ff200000f40000000000000000c020e000140000000000f5ff200000f40000000000000000c020e000140000000000f5ff200000f40000000000000000c020e000140000000000f5ff200000f40000000000000000c020e00014000000a4000100200000000000000000000000c020e000140001002b00f5ff200000f00000000000000000c020e000140001002900f5ff200000f00000000000000000c020e000140001002c00f5ff200000f00000000000000000c020e000140001002a00f5ff200000f00000000000000000c020e000140001000900f5ff200000f00000000000000000c020e00014000500a40001002000006c0000000000000000c020e00014000600a40001002000006c0000000000000000c020e00014000700a40001002000006c0000000000000000c020e00014000800a40001002000006c0000000000000000c020e00014000900a40001002000006c0000000000000000c020e00014000a00a40001002000006c0000000000000000c020e00014000500a40001002200007c1101080408000000c020e00014000500a40001002000006c0111080008040000c020e00014000500a40001002000006c1011000408040000c020e00014000500a40001002000006c1111080408040000c020e00014000500a40001002000006c1110080400040000c020e00014000500a40001002200007c1111080408040000c020e00014000500a40001002200007c1110080400040000c020e00014000700a50001002000006c1111080408040000c020e00014000500a60001002000006c1111080408040000c020e00014000500a50001002000006c1111080408040000c020e00014000700a50001002200007c1111080408040000c020e00014000700a60001002000006c1111080408040000c020e00014000500a40001002000007c0000000000000000c020e00014000000a4000100200000100000000000000000c020e00014000900a40001002000007c0000000000000000c020e00014000a00a40001002000007c0000000000000000c020e00014000500a70001002000006c0000000000000000c020e00014000700a50001002100007c1111080408040000c02093020400008000ff93020400108003ff93020400118006ff93020400128004ff93020400138007ff93020400148005ff60010200010085000e00480b00000000060053686565743285000e00d60c00000000060053686565743385001400640e000000000c0053686565742032206f662031850016000c27000000000e0053686565742032206f6620315f328c00040001000100eb0072000f0000f06a000000000006f0300000000b10000005000000180000000400000001000000010000000200000001000000030000000b000000040000000b00000033000bf012000000bf0008000800810109000008c0014000000840001ef1100000000d0000080c00000817000008f7000010fc005003510000002200000025000020202020202020204e475320506572736f6e6e656c204d6f6e69746f72696e6720466f726d2600002020202020202020204e475320506572736f6e6e656c204d6f6e69746f72696e6720466f726d2600002020202020202020202020202020202020202020204441494c592054494d45205245434f524428000020202020202020202020202020202020202020202020204441494c592054494d45205245434f52441c0000476c656e205065746572204c617572656e636520502e2052657965731500004d617279204772616365204d2e20416220756e646f21000020202020202020202020202020202020202020202020202020202020204e414d45260000202020202020202020202020202020202020202020202020202020202020202020204e414d451200004f66666963652f556e6974202053504d4f201300004f66666963652f556e69742020202053504d4f240000466f7220746865206d6f6e7468206f6620204d617263682031372d33312c203230303820110000466f7220746865206d6f6e7468206f66200300004441590b0000202020202020202020414d0b0000202020202020202020504d0f00004775617264277320496e697469616c0c000020202020202020202020504d020000494e0300004f5554070000686f6c69646179080000736174757264617906000073756e64617936000020202020202020204920686572656279206365727469667920746861742074686520656e747269657320696e207468697320666f726d24000020202041726520666f756e6420746f206265207472756520616e6420636f72726563742e0d0000202020205369676e6174757265280000202020202020202020202020202020202020202053757065727669736f722f556e69742048656164100000202020202020205369676e617475726526000020202020202020202020202020202020202053757065727669736f722f556e69742048656164220000466f7220746865206d6f6e7468206f6620204d4152434820322d31332c2032303039120000466f7220746865206d6f6e7468206f6620200e000047756172647320496e697469616c080000536174757264617906000053756e64617914000053757065727669736f722f556e69742048656164ff000a002200ee0700000c0000000a0000000908100000061000bb0dcc0700000000060000000c00020064000f000200010011000200000010000800fda9f1d24d62503f5f0002000100800008000000000000000000250204000000010181000200c1042a00020000002b0002000000820002000100140007000400002643264115000c0009000026435061676520265083000200000084000200000026000800333333333333e93f27000800333333333333e93f280008002ed8822dd882e33f29000800343333333333e93fa10022000100640000000100010002002c012c01000000000000e03f000000000000e03f0100550002000a0000020e0000000000010000000000000000000802100000000000000001010000000080011500ec0050000f0002f048000000100008f00800000001000000000400000f0003f0300000000f0004f028000000010009f0100000000000000000000000000000000000000002000af00800000000040000050000003e021200b600000000004000000000000000000000001d000f000300000000000001000000000000000a0000000908100000061000bb0dcc0700000000060000000c00020064000f000200010011000200000010000800fda9f1d24d62503f5f0002000100800008000000000000000000250204000000010181000200c1042a00020000002b0002000000820002000100140007000400002643264115000c0009000026435061676520265083000200000084000200000026000800333333333333e93f27000800333333333333e93f280008002ed8822dd882e33f29000800343333333333e93fa10022000100640000000100010002002c012c01000000000000e03f000000000000e03f0100550002000a0000020e0000000000010000000000000000000802100000000000000001010000000080011500ec0050000f0002f048000000200008f00800000001000000000800000f0003f0300000000f0004f028000000010009f0100000000000000000000000000000000000000002000af00800000000080000050000003e021200b600000000004000000000000000000000001d000f000300000000000001000000000000000a0000000908100000061000bb0dcc0700000000060000000c00020064000f000200010011000200000010000800fda9f1d24d62503f5f0002000100800008000000000000000000250204000000010181000200c1042a00020000002b0002000000820002000100140007000400002643264115000c0009000026435061676520265083000200000084000200000026000800333333333333e93f27000800333333333333e93f280008002ed8822dd882e33f29000800343333333333e93fa10022000100640001000100010082002c012c01000000000000e03f000000000000e03f0100550002000a007d000c000000000018050f00000000007d000c0001000100e3050f00000000007d000c000200020052060f00000000007d000c0003000400e3050f00000000007d000c00050005009f0b0f00000000007d000c00060006007b040f00000000007d000c00070007002e050f00000000007d000c000800080091060f00000000007d000c0009000b00e3050f00000000007d000c000c000c009f0b0f000000000000020e00000000003200000000000d000000080210000000000008001901000000008001150008021000010000000000010100000000800115000802100002000000080001010000000080011500080210000300000000000101000000008001150008021000040001000c00010100000000800115000802100005000000080001010000000080011500080210000600000000000101000000008001150008021000070000000a000101000000008001150008021000080000000800010100000000800115000802100009000000000001010000000080011500080210000a000000000001010000000080011500080210000b0000000d0001010000000080011500080210000c0000000d0001010000000080011500080210000d0000000d0001010000000080011500080210000e0000000d0001010000000080011500080210000f0000000d000101000000008001150008021000100000000d000101000000008001150008021000110000000d000101000000008001150008021000120000000d000101000000008001150008021000130000000d000101000000008001150008021000140000000d000101000000008001150008021000150000000d000101000000008001150008021000160000000d000101000000008001150008021000170000000d000101000000008001150008021000180000000d000101000000008001150008021000190000000d0001010000000080011500080210001a0000000d0001010000000080011500080210001b0000000d0001010000000080011500080210001c0000000d0001010000000080011500080210001d0000000d0001010000000080011500080210001e0000000d0001010000000080011500080210001f0000000d0001010000000080011500fd000a0000000000160000000000fd000a0000000700160001000000fd000a0002000000170002000000fd000a0002000700170003000000fd000a0004000100180004000000fd000a0004000800190005000000be000c00040009001a001a001a000b00fd000a0005000000150006000000fd000a0005000700150007000000fd000a000700000015000800000001020600070002001700fd000a000700070015000900000001020600070009001700fd000a000800000015000a000000fd000a000800070015000b000000fd000a000b0000001b000c000000fd000a000b0001001c000d000000010206000b0002001d00fd000a000b0003001c000e000000010206000b0004001d00fd000a000b0005001e000f000000fd000a000b0007001b000c000000fd000a000b0008001c000d000000010206000b0009001d00fd000a000b000a001c0010000000010206000b000b001d00fd000a000b000c001e000f000000010206000c0000001f00fd000a000c000100200011000000fd000a000c000200200012000000fd000a000c000300200011000000fd000a000c000400200012000000010206000c0005001e00010206000c0007002100fd000a000c000800200011000000fd000a000c000900200012000000fd000a000c000a00200011000000fd000a000c000b00200012000000010206000c000c001e007e020a000d000000200006000000be0010000d00010022002200220022001e0005007e020a000d000700200006000000be0010000d00080023002300230023001e000c007e020a000e00000020000a000000be0010000e00010022002200220022001e0005007e020a000e00070020000a000000be0010000e00080024002400240024001e000c007e020a000f00000020000e000000be0010000f00010025002500250025001e0005007e020a000f00070020000e000000be0010000f00080024002400240024001e000c007e020a0010000000200012000000be0010001000010025002500250025001e0005007e020a0010000700200012000000be0010001000080024002400240024001e000c007e020a0011000000200016000000be0010001100010025002500250025001e0005007e020a0011000700200016000000be0010001100080024002400240024001e000c007e020a001200000020001a000000be0010001200010025002500250025001e0005007e020a001200070020001a000000be0010001200080024002400240024001e000c007e020a001300000020001e000000be0010001300010025002500250025001e0005007e020a001300070020001e000000be0010001300080024002400240024001e000c007e020a0014000000200022000000be0010001400010025002500250025001e0005007e020a0014000700200022000000be0010001400080024002400240024001e000c007e020a0015000000200026000000be0010001500010022002200220022001e0005007e020a0015000700200026000000be0010001500080024002400240024001e000c007e020a001600000020002a000000be0010001600010022002500250022001e0005007e020a001600070020002a000000be0010001600080024002400240024001e000c007e020a001700000020002e000000be0010001700010022002500250022001e0005007e020a001700070020002e000000be0010001700080024002400240024001e000c007e020a0018000000200032000000be0010001800010022002500250022001e0005007e020a0018000700200032000000be0010001800080024002400240024001e000c007e020a0019000000200036000000be0010001900010025002500250025001e0005007e020a0019000700200036000000be0010001900080024002400240024001e000c007e020a001a00000020003a000000be0010001a00010025002500250025001e0005007e020a001a00070020003a000000be0010001a00080024002400240024001e000c007e020a001b00000020003e000000be0010001b00010025002500250025001e0005007e020a001b00070020003e000000be0010001b00080022002200220022001e000c007e020a001c000000200042000000be0010001c00010022002200220022001e0005007e020a001c000700200042000000be0010001c00080022002200220026001e000c007e020a001d00000020004600000003020e001d0001002200c7711cc7711cd53f7e020a001d0002002200cb00000003020e001d0003002200555555555555a53f03020e001d0004002200aaaaaaaaaaaaca3f010206001d0005001e007e020a001d000700200046000000be0010001d00080022002500250022001e000c007e020a001e00000020004a000000be0010001e00010022002200220022001e0005007e020a001e00070020004a000000be0010001e00080022002500250022001e000c007e020a001f00000020004e000000fd000a001f000100220013000000be000e001f0002002200220022001e0005007e020a001f00070020004e000000be0010001f00080022002500250022001e000c0008021000200000000d000101000000008001150008021000210000000d000101000000008001150008021000220000000d000101000000008001150008021000230000000d000101000000008001150008021000240000000d000101000000008001150008021000250000000d000101000000008001150008021000260000000d000101000000008001150008021000270000000d000101000000008001150008021000280000000d000101000000008001150008021000290000000d0001010000000080011500080210002a0000000d0001010000000080011500080210002b0000000d0001010000000080011500080210002c000000000001010000000080011500080210002d000000080001010000000080011500080210002e000000080001010000000080011500080210002f00000000000101000000008001150008021000300003000b000101000000008001150008021000310000000a00010100000000800115007e020a0020000000200052000000fd000a0020000100220013000000be000e00200002002200220022001e0005007e020a0020000700200052000000be0010002000080022002500250022001e000c007e020a0021000000200056000000fd000a0021000100220013000000be000e00210002002200220022001e0005007e020a0021000700200056000000be0010002100080022002200220022001e000c007e020a002200000020005a000000fd000a0022000100220014000000be000e00220002002200220022001e0005007e020a002200070020005a000000be0010002200080024002400240024001e000c007e020a002300000020005e000000fd000a0023000100220015000000be000e00230002002200220022001e0005007e020a002300070020005e000000be0010002300080024002400240024001e000c007e020a002400000020006200000003020e00240001002200832dd8822dd8d43f7e020a00240002002200cb00000003020e00240003002200555555555555a53f03020e00240004002200444444444444cc3f01020600240005001e007e020a0024000700200062000000be0010002400080024002400240024001e000c007e020a002500000020006600000003020e00250001002200555555555555d53f7e020a00250002002200cb00000003020e00250003002200555555555555a53f03020e002500040022009ff4499ff449cb3f01020600250005001e007e020a0025000700200066000000be0010002500080024002400240024001e000c007e020a002600000020006a00000003020e00260001002200efeeeeeeeeeed43f7e020a00260002002200cb00000003020e00260003002200555555555555a53f03020e00260004002200c7711cc7711ccb3f01020600260005001e007e020a002600070020006a000000be0010002600080024002400240024001e000c007e020a002700000020006e00000003020e00270001002200efeeeeeeeeeed43f7e020a00270002002200cb00000003020e00270003002200555555555555a53f03020e00270004002200aaaaaaaaaaaaca3f01020600270005001e007e020a002700070020006e000000be0010002700080024002400240023001e000c007e020a002800000020007200000003020e00280001002200600bb6600bb6d43f7e020a00280002002200cb00000003020e00280003002200555555555555a53f03020e00280004002200a54ffaa44ffacc3f01020600280005001e007e020a0028000700200072000000be0010002800080024002400240023001e000c007e020a0029000000200076000000fd000a0029000100220014000000be000e00290002002200220022001e0005007e020a0029000700200076000000be0010002900080024002400240023001e000c007e020a002a00000020007a000000fd000a002a000100220015000000be000e002a0002002200220022001e0005007e020a002a00070020007a000000be0010002a00080024002400240023001e000c007e020a002b00000020007e00000003020e002b0001002200f4499ff4499fb43f7e020a002b0002002200cb00000003020e002b0003002200555555555555a53f03020e002b0004002200aaaaaaaaaaaaca3f010206002b0005001e007e020a002b00070020007e000000be0010002b00080024002400240023001e000c00fd000a002d000000150016000000fd000a002d000700150016000000fd000a002e000000150017000000fd000a002e000700150017000000010206003000030017000102060030000a001700fd000a0031000000150018000000fd000a0031000200150019000000fd000a003100070015001a000000fd000a003100090015001b000000ec00c8000f0002f0f8040000300008f0080000000b0000000a0c00000f0003f0e00400000f0004f028000000010009f0100000000000000000000000000000000000000002000af008000000000c0000050000000f0004f07000000042010af008000000010c0000000a000093000bf0360000004401040000007f0101100000bf0100001000c00100000000c201ffffff00cb01b8470000d60101000000ff01080008003f0200000200000010f01200000000000100570307009a0005000f0107009a00000011f0000000005d001a001500120001000100116000000000000000000000000000000000ec0078000f0004f07000000042010af008000000020c0000000a000093000bf0360000004401040000007f0101100000bf0100001000c00100000000c201ffffff00cb01b8470000d60101000000ff01080008003f0200000200000010f0120000000000020032020800c60005007e010800c600000011f0000000005d001a001500120001000200116000000000000000000000000000000000ec0078000f0004f07000000042010af008000000030c0000000a000093000bf0360000004401040000007f0101100000bf0100001000c00100000000c201ffffff00cb01b8470000d60101000000ff01080008003f0200000200000010f01200000000000000830030007c000200c40030007c00000011f0000000005d001a001500120001000300116000000000000000000000000000000000ec0078000f0004f07000000042010af008000000040c0000000a000093000bf0360000004401040000007f0101100000bf0100001000c00100000000c201ffffff00cb01b8470000d60101000000ff01080008003f0200000200000010f012000000000003007b003000760005008e0230007600000011f0000000005d001a001500120001000400116000000000000000000000000000000000ec0078000f0004f07000000042010af008000000050c0000000a000093000bf0360000004401040000007f0101100000bf0100001000c00100000000c201ffffff00cb01b8470000d60101000000ff01080008003f0200000200000010f01200000000000800280207008d000b00400307008d00000011f0000000005d001a001500120001000500116000000000000000000000000000000000ec0078000f0004f07000000042010af008000000060c0000000a000093000bf0360000004401040000007f0101100000bf0100001000c00100000000c201ffffff00cb01b8470000d60101000000ff01080008003f0200000200000010f012000000000009008201080082000c00430008008200000011f0000000005d001a001500120001000600116000000000000000000000000000000000ec0078000f0004f07000000042010af008000000070c0000000a000093000bf0360000004401040000007f0101100000bf0100001000c00100000000c201ffffff00cb01b8470000d60101000000ff01080008003f0200000200000010f012000000000007005d0130007b0008008c0330007b00000011f0000000005d001a001500120001000700116000000000000000000000000000000000ec0078000f0004f07000000042010af008000000080c0000000a000093000bf0360000004401040000007f0101100000bf0100001000c00100000000c201ffffff00cb01b8470000d60101000000ff01080008003f0200000200000010f01200000000000a005000300073000c00980230007300000011f0000000005d001a001500120001000800116000000000000000000000000000000000ec0078000f0004f07000000042010af008000000090c0000000a000093000bf0360000004401040000007f0101100000bf0100001000c00100000000c201ffffff00cb01b8470000d60101000000ff01080008003f0200000200000010f012000000000001001c000400c500050012000400c500000011f0000000005d001a001500120001000900116000000000000000000000000000000000ec0078000f0004f07000000042010af0080000000a0c0000000a000093000bf0360000004401040000007f0101100000bf0100001000c00100000000c201ffffff00cb01b8470000d60101000000ff01080008003f0200000200000010f0120000000000070017030400d1000b009a020400d100000011f0000000005d001a001500120001000a001160000000000000000000000000000000003e021200b6001b0000004000000000000000000000001d000f00030a000400000001000a000a0004040a0000000908100000061000bb0dcc0700000000060000000c00020064000f000200010011000200000010000800fda9f1d24d62503f5f0002000100800008000000000000000000250204000000010181000200c1042a00020000002b00020000008200020001001400000015000000830002000000840002000000260008006cc1166cc116e63f270008000cb6600bb660df3f28000800000000000000e03f29000800000000000000e03fa10022000100640000000100010002002c012c010cb6600bb660e03f0cb6600bb660e03f0100550002000a007d000c000000000018050f00000000007d000c0001000100a2080f00000000007d000c000200020052060f00000000007d000c0003000300d9060f00000000007d000c0004000400e3050f00000000007d000c00050005009f0b0f00000000007d000c00060006007b040f00000000007d000c00070007002e050f00000000007d000c000800080011080f00000000007d000c0009000a00e3050f00000000007d000c000b000b006a070f00000000007d000c000c000c009f0b0f000000000000020e00000000003200000000000d00000008021000000000000800190100000000800115000802100001000000000001010000000080011500080210000200000008000101000000008001150008021000030007000d000101000000008001150008021000040001000d000101000000008001150008021000050000000d0001010000000080011500080210000600000000000101000000008001150008021000070000000a000101000000008001150008021000080000000800010100000000800115000802100009000000000001010000000080011500080210000a000000000001010000000080011500080210000b0000000d0001010000000080011500080210000c0000000d0001010000000080011500080210000d0000000d0001010000000080011500080210000e0000000d0001010000000080011500080210000f0000000d000101000000008001150008021000100000000d000101000000008001150008021000110000000d000101000000008001150008021000120000000d000101000000008001150008021000130000000d000101000000008001150008021000140000000d000101000000008001150008021000150000000d000101000000008001150008021000160000000d000101000000008001150008021000170000000d000101000000008001150008021000180000000d000101000000008001150008021000190000000d0001010000000080011500080210001a0000000d0001010000000080011500080210001b0000000d0001010000000080011500080210001c0000000d0001010000000080011500080210001d0000000d0001010000000080011500080210001e0000000d0001010000000080011500080210001f0000000d0001010000000080011500fd000a0000000000160000000000fd000a0000000700160001000000fd000a0002000000170002000000fd000a0002000700170003000000be001200030007002700270027002700270027000c00fd000a000400010019000400000001020600040007002800fd000a0004000800290004000000be000e00040009002a002a002a0027000c00fd000a0005000000150006000000fd000a0005000700270007000000be00100005000800270027002700270027000c00fd000a000700000015000800000001020600070002001700fd000a000700070015000900000001020600070009001700fd000a000800000015001c00000001020600080003002b00fd000a000800070015001d000000fd000a000b0000001b000c000000fd000a000b0001001c000d000000010206000b0002001d00fd000a000b0003001c000e000000010206000b0004001d00fd000a000b0005001e001e000000fd000a000b0007001b000c000000fd000a000b0008001c000d000000010206000b0009001d00fd000a000b000a001c0010000000010206000b000b001d00fd000a000b000c001e000f000000010206000c0000001f00fd000a000c000100200011000000fd000a000c000200200012000000fd000a000c000300200011000000fd000a000c000400200012000000010206000c0005001e00010206000c0007002100fd000a000c000800200011000000fd000a000c000900200012000000fd000a000c000a00200011000000fd000a000c000b00200012000000010206000c000c001e007e020a000d000000200006000000be0010000d00010022002200220022001e0005007e020a000d000700200006000000be0010000d00080022002200220022001e000c007e020a000e00000020000a00000003020e000e0001002500d8822dd8822dd63f7e020a000e0002002500cb00000003020e000e0003002500555555555555a53f03020e000e0004002500b0055bb0055bcc3f010206000e0005001e007e020a000e00070020000a000000be0010000e00080022002200220022001e000c007e020a000f00000020000e00000003020e000f0001002500832dd8822dd8d43f7e020a000f0002002500cb00000003020e000f0003002500555555555555a53f03020e000f00040025005bb0055bb005cb3f010206000f0005001e007e020a000f00070020000e000000be0010000f00080022002200220022001e000c007e020a001000000020001200000003020e001000010025003ee9933ee993d43f7e020a00100002002500cb00000003020e00100003002500555555555555a53f03020e001000040025000bb6600bb660cb3f01020600100005001e007e020a0010000700200012000000be0010001000080022002200220022001e000c007e020a001100000020001600000003020e00110001002500333333333333d53f7e020a00110002002500cb00000003020e00110003002500555555555555a53f03020e00110004002500efeeeeeeeeeeca3f01020600110005001e007e020a0011000700200016000000be0010001100080022002200220022001e000c007e020a001200000020001a00000003020e00120001002500333333333333d53f7e020a00120002002500cb00000003020e00120003002500555555555555a53f03020e00120004002500c7711cc7711ccb3f01020600120005001e007e020a001200070020001a000000be0010001200080022002200220022001e000c007e020a001300000020001e000000fd000a00130001002c001f000000be000e00130002002500250025001e0005007e020a001300070020001e000000be0010001300080022002200220022001e000c007e020a0014000000200022000000fd000a0014000100250020000000be000e00140002002500250025001e0005007e020a0014000700200022000000be0010001400080022002200220022001e000c007e020a0015000000200026000000be0010001500010025002500250025001e0005007e020a0015000700200026000000be0010001500080022002200220022001e000c007e020a001600000020002a00000003020e00160001002500600bb6600bb6d43f7e020a00160002002500cb00000003020e00160003002500555555555555a53f03020e00160004002500333333333333cb3f01020600160005001e007e020a001600070020002a000000be0010001600080022002200220022001e000c007e020a001700000020002e00000003020e001700010025005bb0055bb005d53f7e020a00170002002500cb00000003020e00170003002500555555555555a53f03020e00170004002500c7711cc7711ccb3f01020600170005001e007e020a001700070020002e000000be0010001700080022002200220022001e000c007e020a001800000020003200000003020e00180001002500efeeeeeeeeeed43f7e020a00180002002500cb00000003020e00180003002500555555555555a53f03020e00180004002500aaaaaaaaaaaaca3f01020600180005001e007e020a0018000700200032000000be0010001800080022002200220022001e000c007e020a001900000020003600000003020e001900010025000bb6600bb660d53f7e020a00190002002500cb00000003020e00190003002500555555555555a53f03020e00190004002500822dd8822dd8ca3f01020600190005001e007e020a0019000700200036000000be0010001900080022002200220022001e000c007e020a001a00000020003a000000be0010001a00010025002500250025001e0005007e020a001a00070020003a000000be0010001a00080022002200220022001e000c007e020a001b00000020003e000000be0010001b00010025002500250025001e0005007e020a001b00070020003e000000be0010001b00080022002200220022001e000c007e020a001c000000200042000000be0010001c00010025002500250025001e0005007e020a001c000700200042000000be0010001c00080022002200220022001e000c007e020a001d000000200046000000be0010001d00010025002500250025001e0005007e020a001d000700200046000000be0010001d00080022002200220022001e000c007e020a001e00000020004a000000be0010001e00010025002500250025001e0005007e020a001e00070020004a000000be0010001e00080022002200220022001e000c007e020a001f00000020004e000000be0010001f00010025002500250025001e0005007e020a001f00070020004e000000be0010001f00080022002200220022001e000c0008021000200000000d000101000000008001150008021000210000000d000101000000008001150008021000220000000d000101000000008001150008021000230000000d000101000000008001150008021000240000000d000101000000008001150008021000250000000d000101000000008001150008021000260000000d000101000000008001150008021000270000000d000101000000008001150008021000280000000d000101000000008001150008021000290000000d0001010000000080011500080210002a0000000d0001010000000080011500080210002b0000000d0001010000000080011500080210002c000000000001010000000080011500080210002d000000080001010000000080011500080210002e000000080001010000000080011500080210002f00000000000101000000008001150008021000300003000b000101000000008001150008021000310000000d00010100000000800115007e020a0020000000200052000000be0010002000010025002500250025001e0005007e020a0020000700200052000000be0010002000080022002200220022001e000c007e020a0021000000200056000000be0010002100010022002200220022001e0005007e020a0021000700200056000000be0010002100080022002200220022001e000c007e020a002200000020005a000000be0010002200010022002200220022001e0005007e020a002200070020005a000000be0010002200080022002200220022001e000c007e020a002300000020005e000000be0010002300010025002500250025001e0005007e020a002300070020005e000000be0010002300080022002200220022001e000c007e020a0024000000200062000000be0010002400010025002500250025001e0005007e020a0024000700200062000000be0010002400080022002200220022001e000c007e020a0025000000200066000000be0010002500010025002500250025001e0005007e020a0025000700200066000000be0010002500080022002200220022001e000c007e020a002600000020006a000000be0010002600010025002500250025001e0005007e020a002600070020006a000000be0010002600080022002200220022001e000c007e020a002700000020006e000000be0010002700010025002500250025001e0005007e020a002700070020006e000000be0010002700080022002200220022001e000c007e020a0028000000200072000000be0010002800010022002200220022001e0005007e020a0028000700200072000000be0010002800080022002200220022001e000c007e020a0029000000200076000000be0010002900010022002200220022001e0005007e020a0029000700200076000000be0010002900080022002200220022001e000c007e020a002a00000020007a000000be0010002a00010022002200220022001e0005007e020a002a00070020007a000000be0010002a00080022002200220022001e000c007e020a002b00000020007e000000be0010002b00010022002200220022001e0005007e020a002b00070020007e000000be0010002b00080024002400240024001e000c00fd000a002d000000150016000000fd000a002d000700150016000000fd000a002e000000150017000000fd000a002e000700150017000000010206003000030017000102060030000a001700fd000a0031000000150018000000fd000a0031000200150019000000fd000a003100070015001a000000fd000a0031000a00150021000000be000a0031000b000f000f000c00ec00c8000f0002f0f8040000400008f0080000000b0000000a1000000f0003f0e00400000f0004f028000000010009f0100000000000000000000000000000000000000002000af00800000000100000050000000f0004f07000000042010af00800000001100000000a000093000bf0360000004401040000007f0101100000bf0100001000c00100000000c201ffffff00cb01b8470000d60101000000ff01080008003f0200000200000010f0120000000000010044020700f00005000c010700f000000011f0000000005d001a001500120001000100116000000000000000000000000000000000ec0078000f0004f07000000042010af00800000002100000000a000093000bf0360000004401040000007f0101100000bf0100001000c00100000000c201ffffff00cb01b8470000d60101000000ff01080008003f0200000200000010f0120000000000020006000800d500050004010800da00000011f0000000005d001a001500120001000200116000000000000000000000000000000000ec0078000f0004f07000000042010af00800000003100000000a000093000bf0360000004401040000007f0101100000bf0100001000c00100000000c201ffffff00cb01b8470000d60101000000ff01080008003f0200000200000010f01200000000000000a1003000f8000200de003000f800000011f0000000005d001a001500120001000300116000000000000000000000000000000000ec0078000f0004f07000000042010af00800000004100000000a000093000bf0360000004401040000007f0101100000bf0100001000c00100000000c201ffffff00cb01b8470000d60101000000ff01080008003f0200000200000010f0120000000000030056023000e3000500b0033000e300000011f0000000005d001a001500120001000400116000000000000000000000000000000000ec0078000f0004f07000000042010af00800000005100000000a000093000bf0360000004401040000007f0101100000bf0100001000c00100000000c201ffffff00cb01b8470000d60101000000ff01080008003f0200000200000010f012000000000008009a010700d5000c0043000700da00000011f0000000005d001a001500120001000500116000000000000000000000000000000000ec0078000f0004f07000000042010af00800000006100000000a000093000bf0360000004401040000007f0101100000bf0100001000c00100000000c201ffffff00cb01b8470000d60101000000ff01080008003f0200000200000010f0120000000000090082010800e9000c0047000800e900000011f0000000005d001a001500120001000600116000000000000000000000000000000000ec0078000f0004f07000000042010af00800000007100000000a000093000bf0360000004401040000007f0101100000bf0100001000c00100000000c201ffffff00cb01b8470000d60101000000ff01080008003f0200000200000010f0120000000000070075023000c70009006c003000c700000011f0000000005d001a001500120001000700116000000000000000000000000000000000ec0078000f0004f07000000042010af00800000008100000000a000093000bf0360000004401040000007f0101100000bf0100001000c00100000000c201ffffff00cb01b8470000d60101000000ff01080008003f0200000200000010f01200000000000900da023000c1000c00da013000c100000011f0000000005d001a001500120001000800116000000000000000000000000000000000ec0078000f0004f07000000042010af00800000009100000000a000093000bf0360000004401040000007f0101100000bf0100001000c00100000000c201ffffff00cb01b8470000d60101000000ff01080008003f0200000200000010f0120000000000010013000400e30005007b000400e300000011f0000000005d001a001500120001000900116000000000000000000000000000000000ec0078000f0004f07000000042010af0080000000a100000000a000093000bf0360000004401040000007f0101100000bf0100001000c00100000000c201ffffff00cb01b8470000d60101000000ff01080008003f0200000200000010f01200000000000700bd030400da000b00da020400da00000011f0000000005d001a001500120001000a001160000000000000000000000000000000003e021200b606000000004000000000000000000000001d000f000325000d0000000100250025000d0d0a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000fefffffffeffffff04000000feffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0100feff030a0000ffffffff1008020000000000c0000000000000461b0000004d6963726f736f667420457863656c2039372d546162656c6c650006000000426966663800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000feff000001000200000000000000000000000000000000000200000002d5cdd59c2e1b10939708002b2cf9ae4400000005d5cdd59c2e1b10939708002b2cf9ae5c0000001800000001000000010000001000000002000000e9fd00001800000001000000010000001000000002000000e9fd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000feff0000010002000000000000000000000000000000000001000000e0859ff2f94f6810ab9108002b27b3d9300000003cfa000007000000010000004000000009000000480000000a000000540000000b000000600000000c0000006c0000000d00000078000000110000008400000002000000e9fd00001e00000002000000310000004000000000c141f62e00000040000000004a24a00ea4c9014000000000d3d6b8c07cc701400000008029843c0900000047000000b0f90000ffffffff080000002800000084000000a0000000010018000000000080f7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffe1e1e1ffffffe1e1e1a7a7a7f0f0f0ffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffe1e1e1e1e1e1a7a7a7f0f0f0ffffffffffffffffff000000000000000000ffffffffffffffffffe1e1e1ffffffb2b2b2a7a7a7f0f0f0ffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffe1e1e1b2b2b2a7a7a7f0f0f0ffffffffffffffffff000000000000000000ffffffffffffe1e1e1c7c7c7fffffff0f0f08c8c8cffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffe1e1e1c7c7c7f0f0f08c8c8cffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffe1e1e1ffffffc7c7c7d9d9d9d9d9d9ffffffffffffffffff000000ffffffffffffffffffffffffb2b2b2a7a7a78c8c8ca7a7a7d9d9d9d0d0d09a9a9aa7a7a7e1e1e18c8c8cffffffffffffffffffffffffffffff000000000000ffffffffffff8c8c8c9a9a9a7c7c7cd0d0d0d0d0d09a9a9aa7a7a78c8c8ca7a7a7e1e1e1ffffffffffff000000ffffffffffffb2b2b2a7a7a7e1e1e18c8c8cffffffd0d0d09a9a9aa7a7a78c8c8ca7a7a7e1e1e1ffffffffffff000000000000b2b2b2a7a7a7e1e1e1b2b2b2b2b2b2d0d0d09a9a9aa7a7a7e1e1e19a9a9a7c7c7cd0d0d0000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffe1e1e1c7c7c7d9d9d9d9d9d9ffffffffffffffffff000000000000000000ffffffffffffffffffe1e1e1ffffffffffffd9d9d9d0d0d0ffffffffffffffffff000000ffffffffffffffffffffffff8c8c8ce1e1e1000000b2b2b2d0d0d0ffffff8c8c8ce1e1e1bdbdbd8c8c8cffffffffffffffffffffffffffffff000000000000ffffffffffff8c8c8cffffff9a9a9affffffffffff8c8c8ce1e1e1000000e1e1e1bdbdbdffffffffffff000000ffffffffffff8c8c8ce1e1e1bdbdbd8c8c8cffffffffffff8c8c8ce1e1e1000000e1e1e1bdbdbdffffffffffff0000000000008c8c8ce1e1e1bdbdbde1e1e1d9d9d9bdbdbd8c8c8ce1e1e1bdbdbdffffff9a9a9affffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffe1e1e1ffffffd9d9d9d0d0d0ffffffffffffffffff000000000000000000ffffffffffffe1e1e1c7c7c7ffffffe9e9e9e9e9e9e1e1e1ffffffffffffffffff000000ffffffffffffffffffffffff8c8c8ce1e1e14d4d4dc7c7c7c7c7c7e1e1e18c8c8ce1e1e1c7c7c7686868ffffffffffffffffffffffffffffff000000000000ffffffd9d9d9686868d0d0d0e1e1e1bdbdbde1e1e18c8c8ce1e1e1000000e1e1e1c7c7c7ffffffffffff000000ffffffffffff8c8c8ce1e1e1c7c7c7686868ffffffe1e1e18c8c8ce1e1e1000000e1e1e1c7c7c7ffffffffffff0000000000008c8c8ce1e1e1c7c7c7bdbdbdc7c7c7e1e1e18c8c8ce1e1e1c7c7c7d0d0d0e1e1e1bdbdbd000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffe1e1e1c7c7c7e9e9e9e9e9e9e1e1e1ffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffe1e1e1ffffff9a9a9ab2b2b2e1e1e1ffffffffffffffffff000000ffffffffffffffffffffffffb2b2b2a7a7a7e1e1e1c7c7c7ffffffd0d0d09a9a9ab2b2b2d9d9d98c8c8cffffffffffffffffffffffffffffff000000000000ffffffffffff8c8c8c9a9a9a7c7c7cd0d0d0d0d0d09a9a9aa7a7a78c8c8ca7a7a7e1e1e1ffffffffffff000000ffffffffffffb2b2b2a7a7a7e1e1e18c8c8cffffffd0d0d09a9a9aa7a7a78c8c8ca7a7a7e1e1e1ffffffffffff000000000000b2b2b2a7a7a7e1e1e1b2b2b2b2b2b2d0d0d09a9a9aa7a7a7e1e1e1b2b2b2a7a7a7e1e1e1000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffe1e1e19a9a9ab2b2b2e1e1e1ffffffffffffffffff000000000000000000ffffffffffffffffffe1e1e1ffffffffffffbdbdbdffffffffffffffffffffffff000000ffffffffffffffffffffffff8c8c8ce1e1e1bdbdbdb2b2b2ffffffffffffe1e1e1d9d9d9bdbdbd8c8c8cffffffffffffffffffffffffffffff000000000000ffffffffffff8c8c8cffffff9a9a9affffffffffff8c8c8ce1e1e1000000e1e1e1bdbdbdffffffffffff000000ffffffffffff8c8c8ce1e1e1bdbdbd8c8c8cffffffffffff8c8c8ce1e1e1000000e1e1e1bdbdbdffffffffffff0000000000008c8c8ce1e1e1bdbdbde1e1e1d9d9d9bdbdbd8c8c8ce1e1e1bdbdbd8c8c8ce1e1e1bdbdbd000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffe1e1e1ffffffbdbdbdffffffffffffffffffffffff000000000000000000ffffffffffffe1e1e1c7c7c7ffffffe1e1e1ffffffbdbdbdffffffffffffffffff000000ffffffffffffffffffffffff8c8c8ce1e1e1c7c7c7bdbdbde9e9e9e1e1e1bdbdbdc7c7c7d9d9d9686868ffffffffffffffffffffffffffffff000000000000ffffffd9d9d9686868d0d0d0e1e1e1bdbdbde1e1e18c8c8ce1e1e1000000e1e1e1c7c7c7ffffffffffff000000ffffffffffff8c8c8ce1e1e1c7c7c7686868ffffffe1e1e18c8c8ce1e1e1000000e1e1e1c7c7c7ffffffffffff0000000000008c8c8ce1e1e1c7c7c7bdbdbdc7c7c7e1e1e18c8c8ce1e1e1c7c7c78c8c8ce1e1e1c7c7c7000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffe1e1e1c7c7c7e1e1e1ffffffbdbdbdffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffe1e1e1ffffffffffffe1e1e1ffffffffffffffffffffffff000000ffffffffffffffffffffffffb2b2b2a7a7a7e1e1e1c7c7c7ffffffd0d0d09a9a9ab2b2b27c7c7ca7a7a7d9d9d9ffffffffffffffffffffffff000000000000ffffffffffff8c8c8c9a9a9a7c7c7cd0d0d0d0d0d09a9a9aa7a7a78c8c8ca7a7a7e1e1e1ffffffffffff000000ffffffffffffb2b2b2a7a7a7e1e1e18c8c8cffffffd0d0d09a9a9aa7a7a78c8c8ca7a7a7e1e1e1ffffffffffff000000000000b2b2b2a7a7a7e1e1e1b2b2b2b2b2b2d0d0d09a9a9aa7a7a7e1e1e1b2b2b2b2b2b2d9d9d9000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffe1e1e1ffffffe1e1e1ffffffffffffffffffffffff000000000000000000ffffffffffffffffffe1e1e1ffffffffffffe1e1e1ffffffffffffffffffffffff000000ffffffffffffffffffffffff8c8c8ce1e1e1bdbdbdb2b2b2ffffffffffffe1e1e1d9d9d9bdbdbdbdbdbdd0d0d0ffffffffffffffffffffffff000000000000ffffffffffff8c8c8cffffff9a9a9affffffffffff8c8c8ce1e1e1000000e1e1e1bdbdbdffffffffffff000000ffffffffffff8c8c8ce1e1e1bdbdbd8c8c8cffffffffffff8c8c8ce1e1e1000000e1e1e1bdbdbdffffffffffff0000000000008c8c8ce1e1e1bdbdbde1e1e1d9d9d9bdbdbd8c8c8ce1e1e1bdbdbde1e1e1d9d9d9bdbdbd000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffe1e1e1ffffffe1e1e1ffffffffffffffffffffffff000000000000000000ffffffffffffe1e1e1c7c7c7ffffffe1e1e1c7c7c7ffffffffffffffffffffffff000000ffffffffffffffffffffffff8c8c8ce1e1e1c7c7c7bdbdbde9e9e9e1e1e1bdbdbdc7c7c7d9d9d9d0d0d0d0d0d0ffffffffffffffffffffffff000000000000ffffffd9d9d9686868d0d0d0e1e1e1bdbdbde1e1e18c8c8ce1e1e1000000e1e1e1c7c7c7ffffffffffff000000ffffffffffff8c8c8ce1e1e1c7c7c7686868ffffffe1e1e18c8c8ce1e1e1000000e1e1e1c7c7c7ffffffffffff0000000000008c8c8ce1e1e1c7c7c7bdbdbdc7c7c7e1e1e18c8c8ce1e1e1c7c7c7bdbdbdc7c7c7ffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffe1e1e1c7c7c7e1e1e1c7c7c7ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffe1e1e1ffffffd0d0d0d9d9d9e1e1e1ffffffffffffffffff000000ffffffffffffffffffffffffb2b2b2a7a7a7e1e1e1c7c7c7ffffffd0d0d0e1e1e1a7a7a7bdbdbda7a7a7d9d9d9ffffffffffffffffffffffff000000000000ffffffffffff8c8c8c9a9a9a7c7c7cd0d0d0d0d0d09a9a9aa7a7a78c8c8ca7a7a7e1e1e1ffffffffffff000000ffffffffffffb2b2b2a7a7a7e1e1e18c8c8cffffffd0d0d09a9a9aa7a7a78c8c8ca7a7a7e1e1e1ffffffffffff000000000000b2b2b2a7a7a7e1e1e1b2b2b2b2b2b2d0d0d09a9a9aa7a7a7e1e1e1bdbdbda7a7a7d9d9d9000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffe1e1e1d0d0d0d9d9d9e1e1e1ffffffffffffffffff000000000000000000ffffffffffffffffffe1e1e1ffffffbdbdbdffffffbdbdbdffffffffffffffffff000000ffffffffffffffffffffffff8c8c8ce1e1e1bdbdbdb2b2b2ffffffffffff9a9a9aa7a7a7000000d9d9d9bdbdbdffffffffffffffffffffffff000000000000ffffffffffff8c8c8cffffff9a9a9affffffffffff8c8c8ce1e1e1000000e1e1e1bdbdbdffffffffffff000000ffffffffffff8c8c8ce1e1e1bdbdbd8c8c8cffffffffffff8c8c8ce1e1e1000000e1e1e1bdbdbdffffffffffff0000000000008c8c8ce1e1e1bdbdbde1e1e1d9d9d9bdbdbd8c8c8ce1e1e1bdbdbd8c8c8cd9d9d9bdbdbd000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffe1e1e1bdbdbdffffffbdbdbdffffffffffffffffff000000000000000000ffffffffffffe1e1e1c7c7c7ffffffbdbdbdffffffc7c7c7ffffffffffffffffff000000ffffffffffffffffffffffff8c8c8ce1e1e1c7c7c7bdbdbde9e9e9e1e1e1f0f0f06868688c8c8cc7c7c7e9e9e9ffffffffffffffffffffffff000000000000ffffffd9d9d9686868d0d0d0e1e1e1bdbdbde1e1e18c8c8ce1e1e1000000e1e1e1c7c7c7ffffffffffff000000ffffffffffff8c8c8ce1e1e1c7c7c7686868ffffffe1e1e18c8c8ce1e1e1000000e1e1e1c7c7c7ffffffffffff0000000000008c8c8ce1e1e1c7c7c7bdbdbdc7c7c7e1e1e18c8c8ce1e1e1c7c7c79a9a9ac7c7c7e9e9e9000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffe1e1e1c7c7c7bdbdbdffffffc7c7c7ffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffd9d9d9d0d0d0e1e1e1ffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffd9d9d9d0d0d0e1e1e1ffffffffffffffffffffffff000000000000000000ffffffffffffffffffd9d9d9d0d0d0bdbdbdffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffd9d9d9d0d0d0bdbdbdffffffffffffffffffffffff000000000000000000ffffffffffffffffffbdbdbdffffffbdbdbdffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffbdbdbdffffffbdbdbdffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc7c7c7bdbdbdffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffc7c7c7d9d9d9d9d9d9ffffffffffffffffffffffffffffff000000ffffffb2b2b2b2b2b28c8c8cb2b2b2bdbdbd8c8c8c8c8c8cffffff8c8c8cb2b2b2bdbdbd8c8c8cb2b2b2bdbdbde9e9e9686868ffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffc7c7c7d9d9d9d9d9d9ffffffffffffffffffffffff000000000000000000ffffffffffffffffffc7c7c7d9d9d9d9d9d9ffffffffffffffffffffffffffffff000000ffffffe1e1e1c7c7c76868688c8c8cffffff8c8c8c8c8c8cffffff8c8c8c8c8c8cffffff000000b2b2b2bdbdbdb2b2b2bdbdbdd9d9d9ffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffc7c7c7d9d9d9d9d9d9ffffffffffffffffffffffff000000000000000000ffffffffffffffffffbdbdbde9e9e9d0d0d0ffffffffffffffffffffffffffffff000000ffffff9a9a9ad9d9d9bdbdbdd0d0d0ffffffd0d0d0d0d0d0b2b2b2d9d9d9e1e1e1a7a7a70000009a9a9ae9e9e9d0d0d0ffffffe1e1e1ffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffbdbdbde9e9e9d0d0d0ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc7c7c7bdbdbd000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffe1e1e1e1e1e1ffffffffffffffffffffffffffffffffffff000000b2b2b28c8c8c9a9a9ab2b2b2bdbdbdbdbdbde1e1e1b2b2b2bdbdbd8c8c8cffffffb2b2b2bdbdbd8c8c8c9a9a9ab2b2b2bdbdbde9e9e9686868000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffe1e1e1e1e1e1ffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffffffffbdbdbdffffffffffffffffffffffffffffffffffff000000c7c7c7686868c7c7c7b2b2b2bdbdbdbdbdbdffffff8c8c8cffffff8c8c8cffffff8c8c8cffffff8c8c8cc7c7c7b2b2b2bdbdbdb2b2b2bdbdbd000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffbdbdbdffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffffffffc7c7c7ffffffffffffffffffffffffffffffffffff000000d9d9d9bdbdbdd9d9d99a9a9ae9e9e98c8c8ce1e1e1d0d0d0ffffffd0d0d0b2b2b2e1e1e1a7a7a78c8c8cd9d9d99a9a9ae9e9e9d0d0d0ffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffc7c7c7ffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffc7c7c7d9d9d9d9d9d9ffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffb2b2b2a7a7a7e1e1e1c7c7c7ffffffd0d0d09a9a9ab2b2b2bdbdbdc7c7c7ffffffffffffffffffffffffffffff000000000000ffffffffffff8c8c8c9a9a9a7c7c7cd0d0d0d0d0d09a9a9aa7a7a78c8c8ca7a7a7e1e1e1ffffffffffff000000ffffffffffffb2b2b2a7a7a7e1e1e18c8c8cffffffd0d0d09a9a9aa7a7a78c8c8ca7a7a7e1e1e1ffffffffffff000000000000b2b2b2a7a7a7e1e1e1b2b2b2b2b2b2d0d0d09a9a9aa7a7a7e1e1e1b2b2b2b2b2b2d9d9d9000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffc7c7c7d9d9d9d9d9d9ffffffffffffffffffffffff000000000000000000ffffffffffffffffffb2b2b2ffffffc7c7c7ffffffffffffffffffffffffffffff000000ffffffffffffffffffffffff8c8c8ce1e1e1bdbdbdb2b2b2ffffffffffffe1e1e1d9d9d9bdbdbdb2b2b2ffffffffffffffffffffffffffffff000000000000ffffffffffff8c8c8cffffff9a9a9affffffffffff8c8c8ce1e1e1000000e1e1e1bdbdbdffffffffffff000000ffffffffffff8c8c8ce1e1e1bdbdbd8c8c8cffffffffffff8c8c8ce1e1e1000000e1e1e1bdbdbdffffffffffff0000000000008c8c8ce1e1e1bdbdbde1e1e1d9d9d9bdbdbd8c8c8ce1e1e1bdbdbde1e1e1d9d9d9bdbdbd000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffb2b2b2ffffffc7c7c7ffffffffffffffffffffffff000000000000000000ffffffffffffffffffc7c7c7e1e1e1f0f0f0ffffffffffffffffffffffffffffff000000ffffffffffffffffffffffff8c8c8ce1e1e1c7c7c7bdbdbde9e9e9e1e1e1bdbdbdc7c7c7ffffffbdbdbde9e9e9ffffffffffffffffffffffff000000000000ffffffd9d9d9686868d0d0d0e1e1e1bdbdbde1e1e18c8c8ce1e1e1000000e1e1e1c7c7c7ffffffffffff000000ffffffffffff8c8c8ce1e1e1c7c7c7686868ffffffe1e1e18c8c8ce1e1e1000000e1e1e1c7c7c7ffffffffffff0000000000008c8c8ce1e1e1c7c7c7bdbdbdc7c7c7e1e1e18c8c8ce1e1e1c7c7c7bdbdbdc7c7c7ffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffc7c7c7e1e1e1f0f0f0ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffc7c7c7d9d9d9d9d9d9ffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffb2b2b2a7a7a7e1e1e1c7c7c7ffffffd0d0d09a9a9ab2b2b2bdbdbdc7c7c7ffffffffffffffffffffffffffffff000000000000ffffffffffff8c8c8c9a9a9a7c7c7cd0d0d0d0d0d09a9a9aa7a7a78c8c8ca7a7a7e1e1e1ffffffffffff000000ffffffffffffb2b2b2a7a7a7e1e1e18c8c8cffffffd0d0d09a9a9aa7a7a78c8c8ca7a7a7e1e1e1ffffffffffff000000000000b2b2b2a7a7a7e1e1e1b2b2b2b2b2b2d0d0d09a9a9aa7a7a7e1e1e1b2b2b2a7a7a7d9d9d9000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffc7c7c7d9d9d9d9d9d9ffffffffffffffffffffffff000000000000000000ffffffffffffffffffe9e9e9ffffffbdbdbdffffffffffffffffffffffffffffff000000ffffffffffffffffffffffff8c8c8ce1e1e1bdbdbdb2b2b2ffffffffffffe1e1e1d9d9d9bdbdbdb2b2b2ffffffffffffffffffffffffffffff000000000000ffffffffffff8c8c8cffffff9a9a9affffffffffff8c8c8ce1e1e1000000e1e1e1bdbdbdffffffffffff000000ffffffffffff8c8c8ce1e1e1bdbdbd8c8c8cffffffffffff8c8c8ce1e1e1000000e1e1e1bdbdbdffffffffffff0000000000008c8c8ce1e1e1bdbdbde1e1e1d9d9d9bdbdbd8c8c8ce1e1e1bdbdbdffffffbdbdbdd0d0d0000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffe9e9e9ffffffbdbdbdffffffffffffffffffffffff000000000000000000ffffffffffffffffffbdbdbde1e1e1ffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffff8c8c8ce1e1e1c7c7c7bdbdbde9e9e9e1e1e1bdbdbdc7c7c7ffffffbdbdbde9e9e9ffffffffffffffffffffffff000000000000ffffffd9d9d9686868d0d0d0e1e1e1bdbdbde1e1e18c8c8ce1e1e1000000e1e1e1c7c7c7ffffffffffff000000ffffffffffff8c8c8ce1e1e1c7c7c7686868ffffffe1e1e18c8c8ce1e1e1000000e1e1e1c7c7c7ffffffffffff0000000000008c8c8ce1e1e1c7c7c7bdbdbdc7c7c7e1e1e18c8c8ce1e1e1c7c7c7d9d9d9d0d0d0d0d0d0000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffbdbdbde1e1e1ffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffe1e1e1a7a7a7f0f0f0ffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffb2b2b2a7a7a7e1e1e1c7c7c7ffffffd0d0d0e1e1e1a7a7a7686868a7a7a7d9d9d9ffffffffffffffffffffffff000000000000ffffffffffff8c8c8c9a9a9a7c7c7cd0d0d0d0d0d09a9a9aa7a7a78c8c8ca7a7a7e1e1e1ffffffffffff000000ffffffffffffb2b2b2a7a7a7e1e1e18c8c8cffffffd0d0d09a9a9aa7a7a78c8c8ca7a7a7e1e1e1ffffffffffff000000000000b2b2b2a7a7a7e1e1e1b2b2b2b2b2b2d0d0d09a9a9aa7a7a7e1e1e1b2b2b2a7a7a7d9d9d9000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffe1e1e1a7a7a7f0f0f0ffffffffffffffffffffffff000000000000000000ffffffffffffffffffb2b2b2a7a7a7f0f0f0ffffffffffffffffffffffffffffff000000ffffffffffffffffffffffff8c8c8ce1e1e1bdbdbdb2b2b2ffffffffffff9a9a9aa7a7a7d0d0d0bdbdbdd0d0d0ffffffffffffffffffffffff000000000000ffffffffffff8c8c8cffffff9a9a9affffffffffff8c8c8ce1e1e1000000e1e1e1bdbdbdffffffffffff000000ffffffffffff8c8c8ce1e1e1bdbdbd8c8c8cffffffffffff8c8c8ce1e1e1000000e1e1e1bdbdbdffffffffffff0000000000008c8c8ce1e1e1bdbdbde1e1e1d9d9d9bdbdbd8c8c8ce1e1e1bdbdbdb2b2b2b2b2b2d0d0d0000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffb2b2b2a7a7a7f0f0f0ffffffffffffffffffffffff000000000000000000fffffffffffffffffff0f0f08c8c8cffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffff8c8c8ce1e1e1c7c7c7bdbdbde9e9e9e1e1e1f0f0f0686868bdbdbdd0d0d0d0d0d0ffffffffffffffffffffffff000000000000ffffffd9d9d9686868d0d0d0e1e1e1bdbdbde1e1e18c8c8ce1e1e1000000e1e1e1c7c7c7ffffffffffff000000ffffffffffff8c8c8ce1e1e1c7c7c7686868ffffffe1e1e18c8c8ce1e1e1000000e1e1e1c7c7c7ffffffffffff0000000000008c8c8ce1e1e1c7c7c7bdbdbdc7c7c7e1e1e18c8c8ce1e1e1c7c7c79a9a9ac7c7c7c7c7c7000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000fffffffffffffffffffffffff0f0f08c8c8cffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffc7c7c7d9d9d9d9d9d9ffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffb2b2b2a7a7a7e1e1e1c7c7c7ffffffd0d0d0e1e1e1a7a7a7bdbdbd9a9a9ae1e1e1ffffffffffffffffffffffff000000000000ffffffffffff8c8c8c9a9a9a7c7c7cd0d0d0d0d0d09a9a9aa7a7a78c8c8ca7a7a7e1e1e1ffffffffffff000000ffffffffffffb2b2b2a7a7a7e1e1e18c8c8cffffffd0d0d09a9a9aa7a7a78c8c8ca7a7a7e1e1e1ffffffffffff000000000000b2b2b2a7a7a7e1e1e1b2b2b2b2b2b2d0d0d09a9a9aa7a7a7e1e1e1e1e1e1a7a7a7d0d0d0000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffc7c7c7d9d9d9d9d9d9ffffffffffffffffffffffff000000000000000000ffffffffffffffffffffffffd9d9d9d0d0d0ffffffffffffffffffffffffffffff000000ffffffffffffffffffffffff8c8c8ce1e1e1bdbdbdb2b2b2ffffffffffff9a9a9aa7a7a7d0d0d0a7a7a7bdbdbdffffffffffffffffffffffff000000000000ffffffffffff8c8c8cffffff9a9a9affffffffffff8c8c8ce1e1e1000000e1e1e1bdbdbdffffffffffff000000ffffffffffff8c8c8ce1e1e1bdbdbd8c8c8cffffffffffff8c8c8ce1e1e1000000e1e1e1bdbdbdffffffffffff0000000000008c8c8ce1e1e1bdbdbde1e1e1d9d9d9bdbdbd8c8c8ce1e1e1bdbdbd9a9a9aa7a7a7d0d0d0000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffd9d9d9d0d0d0ffffffffffffffffffffffff000000000000000000ffffffffffffffffffe9e9e9e9e9e9e1e1e1ffffffffffffffffffffffffffffff000000ffffffffffffffffffffffff8c8c8ce1e1e1c7c7c7bdbdbde9e9e9e1e1e1f0f0f06868688c8c8cd9d9d9c7c7c7ffffffffffffffffffffffff000000000000ffffffd9d9d9686868d0d0d0e1e1e1bdbdbde1e1e18c8c8ce1e1e1000000e1e1e1c7c7c7ffffffffffff000000ffffffffffff8c8c8ce1e1e1c7c7c7686868ffffffe1e1e18c8c8ce1e1e1000000e1e1e1c7c7c7ffffffffffff0000000000008c8c8ce1e1e1c7c7c7bdbdbdc7c7c7e1e1e18c8c8ce1e1e1c7c7c7f0f0f0686868e1e1e1000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffe9e9e9e9e9e9e1e1e1ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffff9a9a9ab2b2b2e1e1e1ffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffb2b2b2a7a7a78c8c8ca7a7a7d9d9d9d0d0d0e9e9e98c8c8cbdbdbd9a9a9ae1e1e1ffffffffffffffffffffffff000000000000ffffffffffff8c8c8c9a9a9a7c7c7cd0d0d0d0d0d09a9a9aa7a7a78c8c8ca7a7a7e1e1e1ffffffffffff000000ffffffffffffb2b2b2a7a7a7e1e1e18c8c8cffffffd0d0d09a9a9aa7a7a78c8c8ca7a7a7e1e1e1ffffffffffff000000000000b2b2b2a7a7a7e1e1e1b2b2b2b2b2b2d0d0d0e9e9e98c8c8cffffffbdbdbd9a9a9ae1e1e1000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffff9a9a9ab2b2b2e1e1e1ffffffffffffffffffffffff000000000000000000ffffffffffffffffffffffffbdbdbdffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffff8c8c8ce1e1e1000000b2b2b2d0d0d0ffffffffffff8c8c8cd0d0d0a7a7a7bdbdbdffffffffffffffffffffffff000000000000ffffffffffff8c8c8cffffff9a9a9affffffffffff8c8c8ce1e1e1000000e1e1e1bdbdbdffffffffffff000000ffffffffffff8c8c8ce1e1e1bdbdbd8c8c8cffffffffffff8c8c8ce1e1e1000000e1e1e1bdbdbdffffffffffff0000000000008c8c8ce1e1e1bdbdbde1e1e1d9d9d9bdbdbdffffff8c8c8cffffffd0d0d0a7a7a7bdbdbd000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffbdbdbdffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffe1e1e1ffffffbdbdbdffffffffffffffffffffffffffffff000000ffffffffffffffffffffffff8c8c8ce1e1e14d4d4dc7c7c7c7c7c7e1e1e1d0d0d0686868b2b2b2d9d9d9c7c7c7ffffffffffffffffffffffff000000000000ffffffd9d9d9686868d0d0d0e1e1e1bdbdbde1e1e18c8c8ce1e1e1000000e1e1e1c7c7c7ffffffffffff000000ffffffffffff8c8c8ce1e1e1c7c7c7686868ffffffe1e1e18c8c8ce1e1e1000000e1e1e1c7c7c7ffffffffffff0000000000008c8c8ce1e1e1c7c7c7bdbdbdc7c7c7e1e1e1d0d0d0686868ffffffb2b2b2d9d9d9c7c7c7000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffe1e1e1ffffffbdbdbdffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffffffffe1e1e1ffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffe1e1e1ffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffffffffe1e1e1ffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffe1e1e1ffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffe1e1e1c7c7c7ffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffe1e1e1c7c7c7ffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffbdbdbdbdbdbdffffffb2b2b2e1e1e1ffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffd9d9d9c7c7c7c7c7c7c7c7c7d0d0d0b2b2b2ffffffbdbdbdffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffbdbdbdbdbdbdffffffb2b2b2e1e1e1ffffffffffffffffffffffffffffff000000000000ffffffd9d9d9c7c7c7c7c7c7e9e9e9d9d9d9d0d0d0b2b2b2ffffffbdbdbdffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffbdbdbdbdbdbde1e1e1bdbdbde1e1e1ffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffbdbdbdffffffffffffbdbdbdffffffe1e1e1e1e1e1bdbdbdffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffbdbdbdbdbdbde1e1e1bdbdbde1e1e1ffffffffffffffffffffffffffffff000000000000ffffffbdbdbdffffffffffffbdbdbdd9d9d9ffffffe1e1e1e1e1e1bdbdbdffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffbdbdbdb2b2b2bdbdbde1e1e1e1e1e1ffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffbdbdbdffffffffffffbdbdbdffffffe1e1e1e1e1e1bdbdbdffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffbdbdbdb2b2b2bdbdbde1e1e1e1e1e1ffffffffffffffffffffffffffffff000000000000ffffffbdbdbdffffffffffffbdbdbde1e1e1ffffffe1e1e1e1e1e1bdbdbdffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000d0d0d0bdbdbdbdbdbdbdbdbdffffffd0d0d0f0f0f0bdbdbdffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbdbdbdffffffd0d0d0bdbdbdd9d9d9d9d9d9bdbdbdffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe1e1e1ffffffffffffbdbdbdd9d9d9d9d9d9bdbdbdffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000c7c7c7c7c7c7d0d0d0bdbdbdd9d9d9bdbdbdd9d9d9bdbdbdbdbdbdc7c7c7d0d0d0bdbdbdc7c7c7e9e9e9ffffffbdbdbdbdbdbdffffffbdbdbdbdbdbdd0d0d0bdbdbdbdbdbdd9d9d9bdbdbdbdbdbdffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000d0d0d0bdbdbdbdbdbdffffffbdbdbdffffffd0d0d0f0f0f0bdbdbdffffffffffff000000000000000000e1e1e1ffffffe1e1e1bdbdbdb2b2b29a9a9affffffa7a7a7ffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc7c7c7b2b2b29a9a9abdbdbdc7c7c7d0d0d0bdbdbdffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd0d0d0bdbdbdc7c7c7bdbdbdc7c7c7d0d0d0bdbdbdffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffe1e1e1d0d0d0bdbdbdffffffbdbdbdd9d9d9bdbdbdbdbdbdbdbdbdffffffbdbdbdbdbdbdffffffffffffbdbdbdbdbdbdffffffbdbdbdbdbdbde1e1e1bdbdbdd0d0d0d9d9d9bdbdbdbdbdbdffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000e1e1e1ffffffe1e1e1e1e1e1c7c7c7b2b2b29a9a9affffffa7a7a7ffffffffffff000000000000000000e1e1e1ffffffd9d9d9e9e9e9bdbdbdd9d9d9e1e1e1d9d9d9bdbdbdffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbdbdbdd9d9d9bdbdbdd0d0d0e9e9e9a7a7a7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe1e1e1ffffffbdbdbdbdbdbdd0d0d0e9e9e9a7a7a7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000ffffffffffffe1e1e1e1e1e1ffffffe1e1e1c7c7c7e9e9e9d0d0d0d9d9d9c7c7c7bdbdbdc7c7c7ffffffffffffbdbdbdd0d0d0c7c7c7e9e9e9e1e1e1c7c7c7e1e1e1e1e1e1c7c7c7e9e9e9bdbdbdffffff000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000e1e1e1ffffffd9d9d9e9e9e9ffffffbdbdbdd9d9d9e1e1e1d9d9d9bdbdbdffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbdbdbdffffffffffffc7c7c7d9d9d9bdbdbdffffffffffffd0d0d0bdbdbdffffffbdbdbdc7c7c7d9d9d9e1e1e1bdbdbde1e1e1e1e1e1e1e1e1c7c7c7d9d9d9d9d9d9bdbdbdffffffbdbdbdf0f0f0bdbdbdffffffbdbdbdc7c7c7d9d9d9d9d9d9bdbdbdffffffffffffffffffbdbdbdd9d9d9d9d9d9bdbdbdffffffd0d0d0e1e1e1ffffffd0d0d0e1e1e1d9d9d9c7c7c7bdbdbdbdbdbdffffffe1e1e1e1e1e19a9a9ab2b2b2e1e1e1ffffffffffffe1e1e1c7c7c7d9d9d9d9d9d9e1e1e1ffffffffffff9a9a9ab2b2b2bdbdbdd9d9d9e1e1e1d0d0d0d9d9d9bdbdbdd0d0d0e1e1e1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbdbdbdffffffffffffc7c7c7d9d9d9bdbdbdffffffffffffd0d0d0f0f0f0bdbdbdffffffbdbdbdffffffbdbdbdbdbdbde1e1e1bdbdbdffffffbdbdbdffffffffffffe1e1e1bdbdbdffffffbdbdbdb2b2b2e1e1e1d0d0d0bdbdbde1e1e1e1e1e1e1e1e1bdbdbdffffffd0d0d0bdbdbdffffffbdbdbdffffffbdbdbdffffffbdbdbdbdbdbdffffffd0d0d0bdbdbdffffffffffffffffffbdbdbdc7c7c7d0d0d0bdbdbdb2b2b29a9a9ad0d0d0bdbdbdb2b2b2ffffffbdbdbdffffffffffffbdbdbde1e1e1c7c7c7e1e1e1ffffffbdbdbdffffffd0d0d0e1e1e1e1e1e1ffffffd9d9d9d0d0d0ffffffffffffffffffffffffbdbdbdbdbdbdffffffbdbdbdbdbdbdffffffbdbdbdd0d0d0bdbdbdffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbdbdbdbdbdbde1e1e1bdbdbdffffffbdbdbdffffffffffffe1e1e1ffffffbdbdbdffffff000000ffffffbdbdbdffffffffffffd9d9d9bdbdbdbdbdbdd9d9d9ffffffc7c7c7a7a7a7c7c7c7e9e9e9e1e1e1bdbdbde9e9e9d0d0d0c7c7c7d0d0d0d0d0d0d9d9d9bdbdbde9e9e9d0d0d0c7c7c7c7c7c7ffffffa7a7a7c7c7c7e9e9e9d9d9d9bdbdbde9e9e9a7a7a7f0f0f0ffffffffffffbdbdbdd0d0d0e9e9e9a7a7a7bdbdbdd9d9d9e1e1e1ffffffd9d9d9e1e1e1bdbdbdfffffff0f0f0bdbdbdffffffe1e1e1e1e1e1e1e1e1ffffffbdbdbdffffffe1e1e1c7c7c7e9e9e9e9e9e9e1e1e1ffffffffffffffffffe1e1e1ffffffbdbdbdffffffc7c7c7bdbdbdffffffbdbdbdffffffbdbdbdffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbdbdbdffffffffffffd9d9d9bdbdbdbdbdbdd9d9d9ffffffc7c7c7ffffffa7a7a7c7c7c7e1e1e1ffffffe1e1e1e1e1e1e9e9e9ffffffffffffffffffffffffffffffffffffe1e1e1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe1e1e1ffffffffffffffffffffffffffffffe1e1e1e1e1e1ffffffffffffd0d0d0f0f0f0ffffffd0d0d0d9d9d9ffffffe9e9e9e1e1e1d0d0d0ffffffffffffc7c7c7d0d0d0e1e1e1fffffff0f0f0f0f0f0e9e9e9d9d9d9f0f0f0ffffffffffffe9e9e9e9e9e9d9d9d9ffffffffffffffffffffffffe9e9e9d9d9d9e1e1e1d9d9d9ffffffe9e9e9d9d9d9e9e9e9d9d9d9ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe1e1e1e1e1e1e9e9e9ffffffffffffffffffffffffffffffffffffffffffe1e1e1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd9d9d9c7c7c7c7c7c7bdbdbdbdbdbdbdbdbdc7c7c7d9d9d9d9d9d9c7c7c7d9d9d9bdbdbdffffffd9d9d9d0d0d0b2b2b2bdbdbdffffffbdbdbdd0d0d0f0f0f0ffffffffffffbdbdbdd0d0d0b2b2b2ffffffe1e1e1ffffffffffffbdbdbdd9d9d9d9d9d9bdbdbdc7c7c7c7c7c7e9e9e9ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd9d9d9c7c7c7c7c7c7e9e9e9bdbdbdbdbdbdbdbdbdc7c7c7d9d9d9c7c7c7d9d9d9e1e1e1d0d0d0ffffffbdbdbdffffffffffffbdbdbdbdbdbdbdbdbdbdbdbdfffffff0f0f0b2b2b2e1e1e1d0d0d0ffffffd9d9d9ffffffe1e1e1bdbdbdffffffbdbdbde1e1e1ffffffffffffffffffe9e9e9d9d9d9b2b2b2ffffffd0d0d0bdbdbdc7c7c7bdbdbdc7c7c7d0d0d0bdbdbdffffffffffffbdbdbdffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbdbdbdffffffffffffbdbdbdbdbdbdbdbdbdbdbdbdbdbdbdffffffa7a7a7e1e1e1d0d0d0d0d0d0ffffffbdbdbdffffffffffff000000a7a7a7e1e1e1e1e1e1bdbdbdf0f0f0e1e1e1bdbdbdc7c7c7ffffffe1e1e1ffffffe1e1e1bdbdbdc7c7c7e1e1e1c7c7c7ffffffffffffffffffc7c7c7e9e9e9e1e1e1ffffffe1e1e1ffffffbdbdbdbdbdbdd0d0d0e9e9e9000000ffffffffffffbdbdbdffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbdbdbdffffffffffffbdbdbda7a7a7a7a7a7e1e1e1e1e1e1bdbdbde1e1e1bdbdbde9e9e9d9d9d9ffffffffffffc7c7c7c7c7c7e1e1e1e1e1e1e1e1e1fffffffdffffff82000000830000008400000085000000860000008700000088000000890000008a0000008b0000008c0000008d0000008e0000008f000000900000009100000092000000930000009400000095000000960000009700000098000000990000009a0000009b0000009c0000009d0000009e0000009f000000a0000000a1000000a2000000a3000000feffffffa5000000feffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe1e1e1f0f0f0fffffff0f0f0f0f0f0ffffffe1e1e1ffffffffffffffffffffffffe9e9e9d0d0d0e1e1e1ffffffe9e9e9e1e1e1d0d0d0d0d0d0f0f0f0ffffffd0d0d0c7c7c7c7c7c7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc7c7c7c7c7c7ffffffe1e1e1e1e1e1e1e1e1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbdbdbdffffffb2b2b2bdbdbdffffffd0d0d0bdbdbdd9d9d9d9d9d9bdbdbdbdbdbdbdbdbdbdbdbdffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbdbdbde1e1e1bdbdbdbdbdbdb2b2b29a9a9abdbdbdc7c7c7d0d0d0bdbdbdbdbdbde1e1e1e9e9e9ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffb2b2b2bdbdbde1e1e1e1e1e1bdbdbdd9d9d9bdbdbdd0d0d0e9e9e9a7a7a7bdbdbdffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd0d0d0fffffff0f0f0f0f0f0d9d9d9ffffffd0d0d0f0f0f0ffffffd0d0d0e1e1e1e1e1e1e1e1e1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0f0f0d9d9d9ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd9d9d9b2b2b2e1e1e19a9a9ab2b2b27c7c7cd9d9d9ffffffb2b2b2f0f0f07c7c7cffffffb2b2b2d0d0d0b2b2b2d9d9d9ffffff9a9a9aa7a7a7d9d9d9ffffffa7a7a7f0f0f0b2b2b2c7c7c7d0d0d0a7a7a79a9a9af0f0f0c7c7c7d0d0d0a7a7a7f0f0f0b2b2b2d9d9d9ffffffb2b2b2f0f0f0686868d9d9d9b2b2b2d9d9d9ffffffffffffb2b2b2d0d0d0ffffffc7c7c7ffffffb2b2b2d0d0d09a9a9a9a9a9ad9d9d9f0f0f09a9a9affffffb2b2b2d9d9d9d9d9d99a9a9affffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8c8c8cfffffff0f0f0c7c7c7bdbdbd8c8c8cc7c7c7e9e9e9bdbdbdf0f0f09a9a9affffffbdbdbdd0d0d08c8c8cc7c7c7e9e9e97c7c7ca7a7a7c7c7c7e9e9e9bdbdbde9e9e9bdbdbde1e1e1ffffffe9e9e99a9a9affffffbdbdbdffffffbdbdbde9e9e9b2b2b2c7c7c7e9e9e9bdbdbdf0f0f0000000e9e9e9b2b2b2c7c7c7e9e9e9ffffffbdbdbdd0d0d0e1e1e1ffffffffffffbdbdbdbdbdbdbdbdbdb2b2b2c7c7c7bdbdbdd9d9d9e1e1e1b2b2b2c7c7c79a9a9ac7c7c7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffb2b2b2e9e9e9fffffff0f0f0bdbdbde1e1e1e1e1e1ffffffe9e9e9e1e1e1f0f0f0ffffffbdbdbde1e1e19a9a9ae1e1e1ffffff8c8c8ce9e9e9e1e1e1ffffffe1e1e1f0f0f0bdbdbde1e1e1fffffff0f0f0e1e1e1ffffffe1e1e1f0f0f0e1e1e1f0f0f0ffffffe1e1e1ffffffe9e9e9e1e1e1f0f0f0e1e1e1ffffffe1e1e1ffffffffffffbdbdbde1e1e19a9a9affffffffffffbdbdbde1e1e19a9a9affffffe1e1e1e1e1e1f0f0f0e9e9e9ffffffe1e1e1f0f0f0e9e9e9ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd0d0d0d9d9d9e1e1e1d9d9d9e9e9e9ffffffffffffffffffffffffffffffffffffd9d9d9d0d0d0d9d9d9ffffffffffffffffffffffffffffffffffffffffffffffffd9d9d9e1e1e1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd9d9d9d0d0d0d9d9d9ffffffffffffd9d9d9d0d0d0d0d0d0ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8c8c8cbdbdbd8c8c8c8c8c8ce1e1e1bdbdbd000000ffffffbdbdbdbdbdbdbdbdbd8c8c8cffffffffffffffffffffffff8c8c8c8c8c8cffffff8c8c8cd0d0d0b2b2b2bdbdbd8c8c8cbdbdbdbdbdbdffffff8c8c8cffffffb2b2b28c8c8cbdbdbdbdbdbdd9d9d99a9a9a8c8c8cd0d0d09a9a9a9a9a9a000000ffffffb2b2b28c8c8cbdbdbd8c8c8cffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8c8c8cffffffbdbdbdbdbdbd9a9a9a6868688c8c8cffffffbdbdbdffffffffffff7c7c7cffffffffffffffffffffffff8c8c8c8c8c8cffffff8c8c8ca7a7a7a7a7a7bdbdbd8c8c8cbdbdbdbdbdbdffffff8c8c8cb2b2b28c8c8c8c8c8cbdbdbdbdbdbd8c8c8cfffffff0f0f08c8c8cffffffffffff8c8c8cb2b2b28c8c8c8c8c8cffffffbdbdbde1e1e1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8c8c8cffffffb2b2b2e9e9e97c7c7ca7a7a78c8c8cffffffbdbdbdffffffd9d9d9a7a7a79a9a9affffffffffffffffff8c8c8c8c8c8cffffff8c8c8cb2b2b2b2b2b2b2b2b28c8c8ce1e1e1e1e1e1ffffff8c8c8cffffffb2b2b28c8c8ce1e1e1e1e1e19a9a9ae9e9e9d9d9d98c8c8ce9e9e9e1e1e18c8c8cffffffb2b2b28c8c8cffffffb2b2b2e9e9e9ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd0d0d0bdbdbdc7c7c7ffffffd0d0d0f0f0f0d0d0d0ffffffe1e1e1ffffffd0d0d0ffffffd9d9d9ffffffffffffbdbdbdbdbdbdbdbdbdffffffd0d0d0e1e1e1e9e9e9d0d0d0d0d0d0bdbdbdbdbdbdffffffd0d0d0bdbdbdbdbdbdd0d0d0bdbdbdbdbdbdffffffb2b2b2bdbdbdffffffb2b2b2b2b2b2d0d0d0bdbdbdbdbdbdd0d0d0bdbdbdc7c7c7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd0d0d0bdbdbdb2b2b2ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8c8c8cffffff7c7c7ce1e1e1d9d9d99a9a9a9a9a9ad0d0d0b2b2b2b2b2b28c8c8cffffffffffff8c8c8cffffffffffffb2b2b2b2b2b2e9e9e98c8c8cffffffbdbdbda7a7a7c7c7c7b2b2b2b2b2b2b2b2b28c8c8cffffff8c8c8c8c8c8cffffff8c8c8cffffffb2b2b2b2b2b2e9e9e98c8c8cffffff8c8c8cd0d0d0b2b2b2bdbdbdffffffb2b2b2b2b2b2b2b2b28c8c8cffffff8c8c8c8c8c8cffffffbdbdbd8c8c8cb2b2b2b2b2b28c8c8cffffffffffff8c8c8c8c8c8cffffff8c8c8cb2b2b2b2b2b28c8c8cffffffffffff8c8c8cffffffffffffb2b2b2b2b2b2b2b2b28c8c8cffffff8c8c8ce1e1e1bdbdbdbdbdbde1e1e1ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8c8c8cc7c7c77c7c7ce1e1e18c8c8cffffff7c7c7cbdbdbde1e1e1c7c7c7686868ffffffffffff8c8c8c8c8c8cbdbdbd8c8c8cb2b2b2bdbdbd8c8c8cffffffbdbdbd9a9a9ae9e9e98c8c8cffffffb2b2b28c8c8cffffff8c8c8c8c8c8cffffff8c8c8cffffff8c8c8cb2b2b2bdbdbd8c8c8cffffff8c8c8ca7a7a7a7a7a7bdbdbdffffff8c8c8cffffffb2b2b28c8c8cffffff8c8c8c8c8c8cffffffbdbdbd8c8c8cffffffb2b2b28c8c8cffffffffffff8c8c8c8c8c8cffffff8c8c8c8c8c8cffffff8c8c8cffffffffffff8c8c8cbdbdbde1e1e18c8c8cffffffb2b2b28c8c8cffffff8c8c8ce1e1e1b2b2b2bdbdbde9e9e9ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8c8c8c9a9a9abdbdbde1e1e1a7a7a7e9e9e9e9e9e9e1e1e19a9a9ad9d9d9bdbdbdffffffffffff8c8c8cffffff8c8c8cd9d9d99a9a9af0f0f0d0d0d0b2b2b2d9d9d9b2b2b2e9e9e9e9e9e9a7a7a7d9d9d9d0d0d0b2b2b2d9d9d9d0d0d0b2b2b2d9d9d9ffffffd9d9d99a9a9af0f0f08c8c8cffffff8c8c8cb2b2b2b2b2b2b2b2b2ffffffe9e9e9a7a7a7d9d9d9d0d0d0b2b2b2d9d9d9d0d0d0ffffff8c8c8ce1e1e1a7a7a7d9d9d9d0d0d0b2b2b2ffffffd0d0d0d0d0d0b2b2b2d9d9d9e1e1e1a7a7a7d0d0d0ffffffffffff8c8c8ce1e1e1f0f0f0e9e9e9a7a7a7d9d9d9d0d0d0b2b2b2d0d0d0a7a7a7bdbdbda7a7a7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd0d0d0f0f0f0e1e1e1f0f0f0ffffffb2b2b2b2b2b2ffffffe9e9e99a9a9ad9d9d9ffffffffffffd0d0d0bdbdbdc7c7c7ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd0d0d0ffffffd0d0d0e1e1e1e9e9e9d0d0d0ffffffffffffffffffffffffffffffffffffffffffd0d0d0ffffffe9e9e9ffffffffffffffffffffffffffffffffffffd0d0d0ffffffffffffffffffffffffffffffffffffffffffffffffd0d0d0bdbdbdd0d0d0ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000052006f006f007400200045006e00740072007900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016000500ffffffffffffffff010000001008020000000000c000000000000046000000000000000000000000000000000000000024000000400100000000000057006f0072006b0062006f006f006b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000120002000200000004000000ffffffff000000000000000000000000000000000000000000000000000000000000000000000000020000004740000000000000010043006f006d0070004f0062006a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001200020003000000ffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000490000000000000001004f006c00650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a000200ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000200000014000000000000000500530075006d006d0061007200790049006e0066006f0072006d006100740069006f006e00000000000000000000000000000000000000000000000000000028000200ffffffff05000000ffffffff000000000000000000000000000000000000000000000000000000000000000000000000250000006cfa000000000000050044006f00630075006d0065006e007400530075006d006d0061007200790049006e0066006f0072006d006100740069006f006e000000000000000000000038000200ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000300000074000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000feffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000feffffff0000000000000000, 12, 0, 0, 41309, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bac`
--

CREATE TABLE IF NOT EXISTS `bac` (
  `bacID` int(11) NOT NULL AUTO_INCREMENT,
  `officePersonnelID` int(11) NOT NULL,
  `completeName` varchar(200) NOT NULL,
  `position` varchar(50) NOT NULL,
  PRIMARY KEY (`bacID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `bac`
--

INSERT INTO `bac` (`bacID`, `officePersonnelID`, `completeName`, `position`) VALUES
(1, 1, 'Ronald Barriga', 'Chairman'),
(2, 2, 'Prof. Vicente B. Calag', 'Secretary');

-- --------------------------------------------------------

--
-- Table structure for table `budget`
--

CREATE TABLE IF NOT EXISTS `budget` (
  `budgetID` int(11) NOT NULL AUTO_INCREMENT,
  `officePersonnelID` int(11) NOT NULL,
  `completeName` varchar(200) NOT NULL,
  `position` varchar(50) NOT NULL,
  PRIMARY KEY (`budgetID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `budget`
--

INSERT INTO `budget` (`budgetID`, `officePersonnelID`, `completeName`, `position`) VALUES
(1, 24098, 'Teresita Lagsub', 'Budget Officer');

-- --------------------------------------------------------

--
-- Table structure for table `chargeto`
--

CREATE TABLE IF NOT EXISTS `chargeto` (
  `chargeToID` int(11) NOT NULL AUTO_INCREMENT,
  `chargeToName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`chargeToID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `chargeto`
--

INSERT INTO `chargeto` (`chargeToID`, `chargeToName`) VALUES
(1, 'SOM MOOE'),
(2, 'OUR MOOE'),
(5, 'CHSS MOOE'),
(4, 'CSM MOOE');

-- --------------------------------------------------------

--
-- Table structure for table `coacode`
--

CREATE TABLE IF NOT EXISTS `coacode` (
  `coacode` double NOT NULL DEFAULT '0',
  `account_description` varchar(300) DEFAULT NULL,
  `account_subtitle` varchar(150) DEFAULT NULL,
  `account_title` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`coacode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coacode`
--

INSERT INTO `coacode` (`coacode`, `account_description`, `account_subtitle`, `account_title`) VALUES
(101, 'Cash in Treasury', 'Current Assets - Cash', 'Assets'),
(102, 'Cash - National Treasury, Modified Disbursement System (MDS)', 'Current Assets - Cash', 'Assets'),
(103, 'Cash - Bangko Sentral ng Pilipinas', 'Current Assets - Cash', 'Assets'),
(105, 'Petty Cash Fund', 'Current Assets - Cash', 'Assets'),
(106, 'Cash - Collecting Officers', 'Current Assets - Cash', 'Assets'),
(107, 'Cash - Disbursing Officers', 'Current Assets - Cash', 'Assets'),
(110, 'Cash in Bank - Local Currency, Current Account', 'Current Assets - Cash', 'Assets'),
(111, 'Cash in Bank - Local Currency, Savings Account', 'Current Assets - Cash', 'Assets'),
(112, 'Cash in Bank - Local Currency, Time Deposits', 'Current Assets - Cash', 'Assets'),
(113, 'Cash in Bank - Foreign Currency, Current Account', 'Current Assets - Cash', 'Assets'),
(114, 'Cash in Bank - Foreign Currency, Savings Account', 'Current Assets - Cash', 'Assets'),
(115, 'Cash in Bank - Foreign Currency, Time Deposits', 'Current Assets - Cash', 'Assets'),
(121, 'Accounts Receivable', 'Current Assets - Receivable', 'Assets'),
(122, 'Notes Receivable', 'Current Assets - Receivable', 'Assets'),
(123, 'Loans Receivable, Current', 'Current Assets - Receivable', 'Assets'),
(124, 'Real Property Tax Receivable', 'Current Assets - Receivable', 'Assets'),
(125, 'Special Education Tax Receivable', 'Current Assets - Receivable', 'Assets'),
(126, 'Interest Receivable', 'Current Assets - Receivable', 'Assets'),
(127, 'Currency Swap Receivable', 'Current Assets - Receivable', 'Assets'),
(128, 'Due from Officers and Employees', 'Current Assets - Receivable', 'Assets'),
(129, 'Due from Other Funds', 'Current Assets - Receivable', 'Assets'),
(130, 'Due from NGAs', 'Current Assets - Receivable', 'Assets'),
(131, 'Due from LGUs', 'Current Assets - Receivable', 'Assets'),
(132, 'Due from GOCCs', 'Current Assets - Receivable', 'Assets'),
(133, 'Due from NGOs/POs', 'Current Assets - Receivable', 'Assets'),
(134, 'Due from National Treasury', 'Current Assets - Receivable', 'Assets'),
(135, 'Due from Central Office', 'Current Assets - Receivable', 'Assets'),
(136, 'Due from Regional Offices/Staff Bureaus', 'Current Assets - Receivable', 'Assets'),
(137, 'Due from Operating Units', 'Current Assets - Receivable', 'Assets'),
(138, 'Receivables - Disallowances/Charges', 'Current Assets - Receivable', 'Assets'),
(139, 'Other Receivables', 'Current Assets - Receivable', 'Assets'),
(301, 'Allowance for Doubtful Accounts', 'Current Assets - Receivable', 'Assets'),
(140, 'Treasury Bills', 'Current Assets - Marketable Securities', 'Assets'),
(141, 'Stocks', 'Current Assets - Marketable Securities', 'Assets'),
(142, 'Bonds', 'Current Assets - Marketable Securities', 'Assets'),
(143, 'Other Marketable Securities', 'Current Assets - Marketable Securities', 'Assets'),
(144, 'Raw Materials Inventory', 'Current Assets - Inventories', 'Assets'),
(145, 'Work-In-Process Inventory', 'Current Assets - Inventories', 'Assets'),
(146, 'Finished Goods Inventory', 'Current Assets - Inventories', 'Assets'),
(147, 'Merchandise Inventory', 'Current Assets - Inventories', 'Assets'),
(148, 'Accountable Forms Inventory', 'Current Assets - Inventories', 'Assets'),
(149, 'Office Supplies Inventory', 'Current Assets - Inventories', 'Assets'),
(150, 'Medical, Dental and Laboratory Supplies Inventory', 'Current Assets - Inventories', 'Assets'),
(151, 'Food/Non-food/Supplies Inventory', 'Current Assets - Inventories', 'Assets'),
(152, 'Gasoline, Oil and Lubricants Inventory', 'Current Assets - Inventories', 'Assets'),
(153, 'Agricultural Supplies Inventory', 'Current Assets - Inventories', 'Assets'),
(154, 'Livestock and Crops Inventory', 'Current Assets - Inventories', 'Assets'),
(155, 'Spare Parts Inventory', 'Current Assets - Inventories', 'Assets'),
(156, 'Construction Materials Inventory', 'Current Assets - Inventories', 'Assets'),
(157, 'Other Agricultural Products Inventory', 'Current Assets - Inventories', 'Assets'),
(158, 'Confiscated Goods Inventory', 'Current Assets - Inventories', 'Assets'),
(160, 'Other Inventory Items', 'Current Assets - Inventories', 'Assets'),
(161, 'Prepaid Rent', 'Current Assets - Prepaid Expenses', 'Assets'),
(162, 'Prepaid Insurance', 'Current Assets - Prepaid Expenses', 'Assets'),
(164, 'Prepaid Interest', 'Current Assets - Prepaid Expenses', 'Assets'),
(165, 'Other Prepaid Expenses', 'Current Assets - Prepaid Expenses', 'Assets'),
(166, 'Guaranty Deposits', 'Current Assets - Other Current Assets', 'Assets'),
(167, 'Deposits on Letters of Credit', 'Current Assets - Other Current Assets', 'Assets'),
(168, 'Advances to Contractors', 'Current Assets - Other Current Assets', 'Assets'),
(170, 'Other Current Assets', 'Current Assets - Other Current Assets', 'Assets'),
(171, 'Loans Receivable - Long-Term, LGUs', 'Current Assets - Long-Term Investments', 'Assets'),
(172, 'Loans Receivable - Long-Term, GOCCs', 'Current Assets - Long-Term Investments', 'Assets'),
(173, 'Loans Receivable - Long-Term, Others', 'Current Assets - Long-Term Investments', 'Assets'),
(174, 'Investments in Stocks', 'Current Assets - Long-Term Investments', 'Assets'),
(175, 'Investments in Bonds', 'Current Assets - Long-Term Investments', 'Assets'),
(176, 'Investments in GOCCs', 'Current Assets - Long-Term Investments', 'Assets'),
(177, 'Sinking Fund - Cash', 'Current Assets - Long-Term Investments', 'Assets'),
(178, 'Sinking Fund - Securities', 'Current Assets - Long-Term Investments', 'Assets'),
(179, 'Other Long-Term Investments', 'Current Assets - Long-Term Investments', 'Assets'),
(201, 'Land', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(202, 'Land Improvements', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(302, 'Accumulated Depreciation - Land Improvements', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(203, 'Leasehold Improvements', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(303, 'Accumulated Depreciation - Leasehold Improvements', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(204, 'Buildings', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(304, 'Accumulated Depreciation - Buildings', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(205, 'School Buildings', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(305, 'Accumulated Depreciation - School Buildings', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(206, 'Markets and Slaughterhouses', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(306, 'Accumulated Depreciation - Markets and Slaughterhouses', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(207, 'Hospitals and Health Centers', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(307, 'Accumulated Depreciation - Hospitals and Health Centers', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(208, 'Other Structures', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(308, 'Accumulated Depreciation - Other Structures', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(209, 'Industrial Machineries', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(309, 'Accumulated Depreciation - Industrial Machineries', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(210, 'Other Machineries', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(310, 'Accumulated Depreciation - Other Machineries', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(211, 'Firefighting Equipment and Accessories', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(311, 'Accumulated Depreciation - Firefighting Equipment and Accessories', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(212, 'Construction and Heavy Equipment', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(312, 'Accumulated Depreciation - Construction and Heavy Equipment', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(214, 'Technical and Scientific Equipment', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(314, 'Accumulated Depreciation - Technical and Scientific Equipment', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(215, 'I T Equipment and Software', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(315, 'Accumulated Depreciation - IT Equipment', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(216, 'Telegraph, Telephone, Cable, TV and Radio Equipment', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(316, 'Accumulated Depreciation - Telegraph, Telephone, Cable, TV and Radio Equipment', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(217, 'Artesian Wells, Reservoirs, Pumping Stations and Conduits.', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(317, 'Accumulated Depreciation - Artesian Wells, Reservoirs, Pumping Stations and Conduits', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(218, 'Motor Vehicles', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(318, 'Accumulated Depreciation - Motor Vehicles', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(219, 'Watercrafts', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(319, 'Accumulated Depreciation - Watercrafts', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(220, 'Trains', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(320, 'Accumulated Depreciation - Trains', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(221, 'Aircrafts/Aircraft Ground Equipment', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(321, 'Accumulated Depreciation - Aircrafts/Aircraft Ground Equipment', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(222, 'Office Equipment', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(322, 'Accumulated Depreciation - Office Equipment', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(223, 'Other Equipment', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(323, 'Accumulated Depreciation - Other Equipment', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(224, 'Furniture and Fixtures', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(324, 'Accumulated Depreciation - Furniture and Fixtures', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(225, 'Ordnance', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(325, 'Accumulated Depreciation - Ordnance', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(226, 'Books', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(326, 'Accumulated Depreciation - Books', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(227, 'Other Property, Plant and Equipment', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(327, 'Accumulated Depreciation - Other Property, Plant and Equipment', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(228, 'Work/Other Animals', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(229, 'Breeding Stocks', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(230, 'Construction in Progress - Agency Assets', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(231, 'Construction in Progress - Plaza, Parks and Monuments', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(232, 'Construction in Progress - Roads, Highways and Bridges', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(233, 'Construction in Progress - Ports, Lighthouses, Harbors, Seawalls,  River Walls and Other', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(234, 'Construction in Progress - Airports and Runways', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(235, 'Construction in Progress - Railways', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(236, 'Construction in Progress - Waterways, Aqueducts, etc.', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(237, 'Construction in Progress - Irrigation, Canals and Laterals', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(238, 'Construction in Progress - Electrification, Power and Energy Structures', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(241, 'Construction in Progress - Other Public Infrastructures ', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(242, 'Construction in Progress - Reforestation Projects', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(243, 'Public Infrastructures', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(244, 'Reforestation Projects', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(245, 'Arts, Archeological Specimen and Other Exhibits', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(249, 'Items in Transit', 'Current Assets - Property, Plant and Equipment', 'Assets'),
(251, 'Other Assets', 'Current Assets - Other Assets', 'Assets'),
(401, 'Accounts Payable', 'Current Liabilities', 'Liabilities'),
(402, 'Notes Payable', 'Current Liabilities', 'Liabilities'),
(403, 'Loans Payable - Current, Domestic', 'Current Liabilities', 'Liabilities'),
(404, 'Loans Payable - Current, Foreign', 'Current Liabilities', 'Liabilities'),
(406, 'Interests Payable', 'Current Liabilities', 'Liabilities'),
(407, 'Tax Refunds Payable', 'Current Liabilities', 'Liabilities'),
(408, 'Guaranty Deposits Payable', 'Current Liabilities', 'Liabilities'),
(409, 'Tax Credit Certificates Payable', 'Current Liabilities', 'Liabilities'),
(410, 'Withholding Taxes Payable', 'Current Liabilities', 'Liabilities'),
(411, 'GSIS Payable', 'Current Liabilities', 'Liabilities'),
(412, 'PAG-IBIG Payable', 'Current Liabilities', 'Liabilities'),
(413, 'PHILHEALTH Payable', 'Current Liabilities', 'Liabilities'),
(414, 'Performance/Bidders/Bail Bonds Payable', 'Current Liabilities', 'Liabilities'),
(427, 'Currency Swap Payable', 'Current Liabilities', 'Liabilities'),
(428, 'Due to Officers and Employees', 'Current Liabilities', 'Liabilities'),
(429, 'Due to Other Funds', 'Current Liabilities', 'Liabilities'),
(430, 'Due to NGAs', 'Current Liabilities', 'Liabilities'),
(431, 'Due to LGUs', 'Current Liabilities', 'Liabilities'),
(432, 'Due to GOCCs', 'Current Liabilities', 'Liabilities'),
(433, 'Due to National Treasury', 'Current Liabilities', 'Liabilities'),
(435, 'Due to Central Office', 'Current Liabilities', 'Liabilities'),
(436, 'Due to Regional Offices/Staff Bureaus', 'Current Liabilities', 'Liabilities'),
(437, 'Due to Operating Units', 'Current Liabilities', 'Liabilities'),
(439, 'Retirement Gratuity Benefits Payable', 'Current Liabilities', 'Liabilities'),
(440, 'Deferred Credits to Income', 'Current Liabilities', 'Liabilities'),
(441, 'Other Deferred Credits', 'Current Liabilities', 'Liabilities'),
(448, 'Deferred Real Property Tax Income', 'Current Liabilities', 'Liabilities'),
(449, 'Deferred Special Education Tax Income', 'Current Liabilities', 'Liabilities'),
(450, 'Other Payables', 'Current Liabilities', 'Liabilities'),
(451, 'Loans Payable - Long-Term, Domestic', 'Long-Term Liabilities', 'Liabilities'),
(452, 'Loans Payable - Long-Term, Foreign', 'Long-Term Liabilities', 'Liabilities'),
(453, 'Mortgage Payable', 'Long-Term Liabilities', 'Liabilities'),
(454, 'Bonds Payable - Long-Term, Domestic', 'Long-Term Liabilities', 'Liabilities'),
(455, 'Bonds Payable - Long-Term, Foreign', 'Long-Term Liabilities', 'Liabilities'),
(460, 'Other Long-Term Liabilities', 'Long-Term Liabilities', 'Liabilities'),
(465, 'Other Liabilities', 'Other Liabilities', 'Liabilities'),
(501, 'Government Equity', 'Equity', 'Equity'),
(502, 'Project Equity', 'Equity', 'Equity'),
(531, 'Cost of Goods Sold', 'Intermediate Accounts', 'Equity'),
(532, 'Income and Expense Summary', 'Intermediate Accounts', 'Equity'),
(533, 'Prior Years? Adjustments', 'Intermediate Accounts', 'Equity'),
(534, 'Retained Operating Surplus', 'Intermediate Accounts', 'Equity'),
(537, 'Invested Equity', 'Intermediate Accounts', 'Equity'),
(538, 'Subsidy to Regional Offices/Staff Bureaus', 'Intermediate Accounts', 'Equity'),
(539, 'Subsidy to Operating Units', 'Intermediate Accounts', 'Equity'),
(540, 'Gain or Loss Due to Dormant Accounts', 'Intermediate Accounts', 'Equity'),
(601, 'Subsidy Income from National Government', 'General Income', 'Revenue/Income'),
(602, 'Subsidy from Central Office', 'General Income', 'Revenue/Income'),
(603, 'Subsidy from Regional Office/Staff Bureaus', 'General Income', 'Revenue/Income'),
(604, 'Subsidy from Other LGUs', 'General Income', 'Revenue/Income'),
(605, 'Subsidy from Other Funds', 'General Income', 'Revenue/Income'),
(606, 'Subsidy from Special Accounts', 'General Income', 'Revenue/Income'),
(611, 'Income from Government Services', 'General Income', 'Revenue/Income'),
(612, 'Income from Government Business Operations', 'General Income', 'Revenue/Income'),
(613, 'Sales Revenue', 'General Income', 'Revenue/Income'),
(621, 'Rent Income', 'General Income', 'Revenue/Income'),
(622, 'Insurance Income', 'General Income', 'Revenue/Income'),
(623, 'Dividend Income', 'General Income', 'Revenue/Income'),
(624, 'Interest Income', 'General Income', 'Revenue/Income'),
(625, 'Gain on Sale of Securities', 'General Income', 'Revenue/Income'),
(626, 'Gain on Sale of Assets', 'General Income', 'Revenue/Income'),
(627, 'Sale of Confiscated Goods and Properties', 'General Income', 'Revenue/Income'),
(628, 'Foreign Exchange (FOREX) Gain', 'General Income', 'Revenue/Income'),
(639, 'Miscellaneous Operating and Service Income', 'General Income', 'Revenue/Income'),
(641, 'Fines and Penalties - Government Services and Business Operations', 'General Income', 'Revenue/Income'),
(651, 'Income from Grants and Donations', 'General Income', 'Revenue/Income'),
(701, 'Income Tax - Individuals', 'Income Taxes', 'Revenue/Income'),
(702, 'Income Tax - Partnerships', 'Income Taxes', 'Revenue/Income'),
(703, 'Income Tax - Corporations', 'Income Taxes', 'Revenue/Income'),
(711, 'Real Property Tax', 'Property Taxes', 'Revenue/Income'),
(712, 'Property Transfer Tax', 'Property Taxes', 'Revenue/Income'),
(713, 'Special Education Tax', 'Property Taxes', 'Revenue/Income'),
(714, 'Special Assessment Tax', 'Property Taxes', 'Revenue/Income'),
(715, 'Real Property Tax on Idle Lands', 'Property Taxes', 'Revenue/Income'),
(716, 'Stock Transfers Tax', 'Property Taxes', 'Revenue/Income'),
(717, 'Capital Gains Tax', 'Property Taxes', 'Revenue/Income'),
(718, 'Donors'' Tax', 'Property Taxes', 'Revenue/Income'),
(719, 'Estate Tax', 'Property Taxes', 'Revenue/Income'),
(721, 'Excise Taxes on Articles', 'Taxes on Goods and Services', 'Revenue/Income'),
(722, 'Value Added Tax', 'Taxes on Goods and Services', 'Revenue/Income'),
(723, 'Business Taxes and Licenses', 'Taxes on Goods and Services', 'Revenue/Income'),
(724, 'Franchise Tax', 'Taxes on Goods and Services', 'Revenue/Income'),
(725, 'Professional Tax', 'Taxes on Goods and Services', 'Revenue/Income'),
(726, 'Occupation Tax', 'Taxes on Goods and Services', 'Revenue/Income'),
(727, 'Printing and Publication Tax', 'Taxes on Goods and Services', 'Revenue/Income'),
(735, 'Miscellaneous Taxes on Goods and Services', 'Taxes on Goods and Services', 'Revenue/Income'),
(736, 'Import Duties', 'Taxes on International Trade and Transactions', 'Revenue/Income'),
(741, 'Documentary Stamp Tax', 'Other Taxes', 'Revenue/Income'),
(742, 'Community Tax', 'Other Taxes', 'Revenue/Income'),
(743, 'Science Stamp Tax', 'Other Taxes', 'Revenue/Income'),
(745, 'Weights and Measures', 'Other Taxes', 'Revenue/Income'),
(746, 'Share from Internal Revenue Collections', 'Other Taxes', 'Revenue/Income'),
(747, 'Share from Tobacco Excise Tax', 'Other Taxes', 'Revenue/Income'),
(748, 'Share from Economic Zones', 'Other Taxes', 'Revenue/Income'),
(749, 'Share from Expanded Value Added Tax (EVAT)', 'Other Taxes', 'Revenue/Income'),
(750, 'Share from National Wealth', 'Other Taxes', 'Revenue/Income'),
(751, 'Amusement Tax', 'Other Taxes', 'Revenue/Income'),
(752, 'Sand and Gravel Tax', 'Other Taxes', 'Revenue/Income'),
(753, 'Tax on Delivery Trucks and Vans', 'Other Taxes', 'Revenue/Income'),
(754, 'Tax on Forest Products', 'Other Taxes', 'Revenue/Income'),
(755, 'Immigration Taxes', 'Other Taxes', 'Revenue/Income'),
(759, 'Miscellaneous - Other Taxes', 'Other Taxes', 'Revenue/Income'),
(760, 'Fines and Penalties - Tax Revenue', 'Other Taxes', 'Revenue/Income'),
(761, 'Registration Fees', 'Other Specific Income', 'Revenue/Income'),
(762, 'Tuition/Affiliation Fees', 'Other Specific Income', 'Revenue/Income'),
(763, 'Hospital Fees', 'Other Specific Income', 'Revenue/Income'),
(764, 'Medical, Dental and Laboratory Fees', 'Other Specific Income', 'Revenue/Income'),
(765, 'Library Fees', 'Other Specific Income', 'Revenue/Income'),
(766, 'Athletic and Cultural Fees', 'Other Specific Income', 'Revenue/Income'),
(767, 'Comprehensive Examination Fees', 'Other Specific Income', 'Revenue/Income'),
(768, 'Transcript of Records Fees', 'Other Specific Income', 'Revenue/Income'),
(769, 'Diploma and Graduation Fees', 'Other Specific Income', 'Revenue/Income'),
(770, 'Inspection Fees', 'Other Specific Income', 'Revenue/Income'),
(771, 'Permit Fees', 'Other Specific Income', 'Revenue/Income'),
(772, 'Garbage Fees', 'Other Specific Income', 'Revenue/Income'),
(773, 'Clearance/Certification Fees', 'Other Specific Income', 'Revenue/Income'),
(774, 'Franchising/Licensing Fees', 'Other Specific Income', 'Revenue/Income'),
(775, 'Fishery Rentals, Fees and Charges', 'Other Specific Income', 'Revenue/Income'),
(776, 'Printing and Publication Income', 'Other Specific Income', 'Revenue/Income'),
(777, 'Income from Canteen Operations', 'Other Specific Income', 'Revenue/Income'),
(778, 'Income from Dormitory Operations', 'Other Specific Income', 'Revenue/Income'),
(779, 'Receipts from Lease of Properties', 'Other Specific Income', 'Revenue/Income'),
(780, 'Receipts from Communication Facilities', 'Other Specific Income', 'Revenue/Income'),
(781, 'Receipts from Waterworks Systems', 'Other Specific Income', 'Revenue/Income'),
(782, 'Receipts from Transportation Systems', 'Other Specific Income', 'Revenue/Income'),
(783, 'Receipts from Markets', 'Other Specific Income', 'Revenue/Income'),
(784, 'Receipts from Slaughterhouses', 'Other Specific Income', 'Revenue/Income'),
(785, 'Receipts from Cemeteries', 'Other Specific Income', 'Revenue/Income'),
(786, 'Toll Fees', 'Other Specific Income', 'Revenue/Income'),
(787, 'Landing and Parking Fees', 'Other Specific Income', 'Revenue/Income'),
(788, 'Other Income from School Services', 'Other Specific Income', 'Revenue/Income'),
(789, 'Other Income from School Business Operations', 'Other Specific Income', 'Revenue/Income'),
(790, 'Other Income from Hospital Services', 'Other Specific Income', 'Revenue/Income'),
(791, 'Other Income from Hospital Business Operations', 'Other Specific Income', 'Revenue/Income'),
(792, 'Other Specific Income of LGUs', 'Other Specific Income', 'Revenue/Income'),
(799, 'Fines and Penalties - Other Specific Income', 'Other Specific Income', 'Revenue/Income'),
(801, 'Salaries and Wages - Regular Pay', 'Personnal Services', 'Expenses'),
(802, 'Salaries and Wages - Part Time Pay', 'Personnal Services', 'Expenses'),
(803, 'Salaries and Wages - Casual/Contractual', 'Personnal Services', 'Expenses'),
(804, 'Personnel Economic Relief Allowance (PERA)', 'Personnal Services', 'Expenses'),
(805, 'Additional Compensation (ADCOM)', 'Personnal Services', 'Expenses'),
(806, 'Representation Allowance (RA)', 'Personnal Services', 'Expenses'),
(807, 'Transportation Allowance (TA)', 'Personnal Services', 'Expenses'),
(808, 'Clothing Allowance', 'Personnal Services', 'Expenses'),
(809, 'Honoraria', 'Personnal Services', 'Expenses'),
(810, 'Hazard Pay', 'Personnal Services', 'Expenses'),
(811, 'Overtime and Night Pay', 'Personnal Services', 'Expenses'),
(812, 'Holiday Pay', 'Personnal Services', 'Expenses'),
(813, 'Christmas Bonus', 'Personnal Services', 'Expenses'),
(814, 'Cash Gift', 'Personnal Services', 'Expenses'),
(815, 'Productivity Incentive Benefits', 'Personnal Services', 'Expenses'),
(816, 'Other Bonuses and Allowances', 'Personnal Services', 'Expenses'),
(817, 'Life and Retirement Insurance Contributions', 'Personnal Services', 'Expenses'),
(818, 'PAG-IBIG Contributions', 'Personnal Services', 'Expenses'),
(819, 'PHILHEALTH Contributions', 'Personnal Services', 'Expenses'),
(820, 'ECC Contributions', 'Personnal Services', 'Expenses'),
(821, 'Pension and Retirement Benefits', 'Personnal Services', 'Expenses'),
(822, 'Terminal Leave Benefits', 'Personnal Services', 'Expenses'),
(823, 'Health Workers? Benefits', 'Personnal Services', 'Expenses'),
(824, 'Subsistence and Quarters? Allowances', 'Personnal Services', 'Expenses'),
(825, 'Longevity Pay', 'Personnal Services', 'Expenses'),
(830, 'Other Personnel Benefits', 'Personnal Services', 'Expenses'),
(831, 'Traveling Expenses - Local', 'Maintenance and Other Operating Expenses', 'Expenses'),
(832, 'Traveling Expenses - Foreign', 'Maintenance and Other Operating Expenses', 'Expenses'),
(833, 'Training and Seminar Expenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(834, 'Water', 'Maintenance and Other Operating Expenses', 'Expenses'),
(835, 'Electricity', 'Maintenance and Other Operating Expenses', 'Expenses'),
(836, 'Cooking Gas', 'Maintenance and Other Operating Expenses', 'Expenses'),
(837, 'Telephone/Telegraph and Internet', 'Maintenance and Other Operating Expenses', 'Expenses'),
(838, 'Postage and Deliveries', 'Maintenance and Other Operating Expenses', 'Expenses'),
(839, 'Subscription Expenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(840, 'Advertising Expenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(841, 'Rent Expenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(842, 'Insurance Expenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(843, 'Fidelity Bond Premiums', 'Maintenance and Other Operating Expenses', 'Expenses'),
(844, 'Survey Expenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(845, 'Storage Expenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(846, 'Zoological/Animal Maintenance Expenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(847, 'Printing and Binding Expenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(848, 'Accountable Forms Expenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(849, 'Office Supplies Expenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(850, 'Medical, Dental and Laboratory Supplies Expenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(851, 'Food/Non-food Expenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(852, 'Gasoline, Oil and Lubricants Expenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(853, 'Agricultural Supplies Expenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(854, 'Legal Services', 'Maintenance and Other Operating Expenses', 'Expenses'),
(855, 'Auditing Services', 'Maintenance and Other Operating Expenses', 'Expenses'),
(856, 'Consultancy Services', 'Maintenance and Other Operating Expenses', 'Expenses'),
(857, 'General Services', 'Maintenance and Other Operating Expenses', 'Expenses'),
(858, 'Security and Janitorial Services', 'Maintenance and Other Operating Expenses', 'Expenses'),
(859, 'Taxes, Duties and Licenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(860, 'Tax Credit Subsidy', 'Maintenance and Other Operating Expenses', 'Expenses'),
(861, 'Tax Exemption Expenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(862, 'Public Infrastructure Repairs and Maintenance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(863, 'Reforestation Project Maintenance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(864, 'Buildings Maintenance ', 'Maintenance and Other Operating Expenses', 'Expenses'),
(865, 'School Buildings Maintenance ', 'Maintenance and Other Operating Expenses', 'Expenses'),
(866, 'Markets and Slaughterhouses Maintenance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(867, 'Hospitals and Health Centers Maintenance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(868, 'Other Structures Maintenance ', 'Maintenance and Other Operating Expenses', 'Expenses'),
(869, 'Industrial Machineries Maintenance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(870, 'Other Machineries Maintenance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(871, 'Firefighting Equipment and Accessories Maintenance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(872, 'Construction and Heavy Equipment Maintenance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(874, 'Technical and Scientific Equipment Maintenance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(875, 'IT Equipment Maintenance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(876, 'Telegraph, Telephone, Cable, TV and Radio Equipment Maintenance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(877, 'Artesian Wells, Reservoirs, Pumping Stations and Conduits Maintenance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(878, 'Motor Vehicles Maintenance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(879, 'Watercrafts Maintenance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(880, 'Trains Maintenance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(881, 'Aircrafts/Aircraft Ground Equipment Maintenance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(882, 'Office Equipment Maintenance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(883, 'Other Equipment Maintenance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(884, 'Furniture and Fixtures Maintenance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(885, 'Ordnance Maintenance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(886, 'Other Repairs and Maintenance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(887, 'Awards and Indemnities', 'Maintenance and Other Operating Expenses', 'Expenses'),
(888, 'Rewards and Other Claims', 'Maintenance and Other Operating Expenses', 'Expenses'),
(889, 'Grants and Donations', 'Maintenance and Other Operating Expenses', 'Expenses'),
(890, 'Representation Expenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(891, 'Extraordinary and Miscellaneous Expenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(892, 'Confidential and Intelligence Expenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(893, 'Anti-Insurgency/Contingency Expenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(894, 'Subsidy to National Government Agencies', 'Maintenance and Other Operating Expenses', 'Expenses'),
(895, 'Subsidy to Local Government Units', 'Maintenance and Other Operating Expenses', 'Expenses'),
(896, 'Subsidy to Government Corporations', 'Maintenance and Other Operating Expenses', 'Expenses'),
(897, 'Subsidy to Other Funds', 'Maintenance and Other Operating Expenses', 'Expenses'),
(898, 'Subsidy to Special Accounts', 'Maintenance and Other Operating Expenses', 'Expenses'),
(901, 'Membership Dues to International Institutions', 'Maintenance and Other Operating Expenses', 'Expenses'),
(902, 'Depreciation - Land Improvements', 'Maintenance and Other Operating Expenses', 'Expenses'),
(903, 'Depreciation - Leasehold Improvements', 'Maintenance and Other Operating Expenses', 'Expenses'),
(904, 'Depreciation - Buildings', 'Maintenance and Other Operating Expenses', 'Expenses'),
(905, 'Depreciation - School Buildings', 'Maintenance and Other Operating Expenses', 'Expenses'),
(906, 'Depreciation - Markets and Slaughterhouses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(907, 'Depreciation - Hospitals and Health Centers', 'Maintenance and Other Operating Expenses', 'Expenses'),
(908, 'Depreciation - Other Structures', 'Maintenance and Other Operating Expenses', 'Expenses'),
(909, 'Depreciation - Industrial Machineries', 'Maintenance and Other Operating Expenses', 'Expenses'),
(910, 'Depreciation - Other Machineries', 'Maintenance and Other Operating Expenses', 'Expenses'),
(911, 'Depreciation - Firefighting Equipment and Accessories', 'Maintenance and Other Operating Expenses', 'Expenses'),
(912, 'Depreciation - Construction and Heavy Equipment', 'Maintenance and Other Operating Expenses', 'Expenses'),
(914, 'Depreciation - Technical and Scientific Equipment', 'Maintenance and Other Operating Expenses', 'Expenses'),
(915, 'Depreciation - IT Equipment', 'Maintenance and Other Operating Expenses', 'Expenses'),
(916, 'Depreciation - Telegraph, Telephone, Cable, TV and Radio Equipment', 'Maintenance and Other Operating Expenses', 'Expenses'),
(917, 'Depreciation - Artesian Wells, Reservoirs, Pumping Stations and Conduits', 'Maintenance and Other Operating Expenses', 'Expenses'),
(918, 'Depreciation - Motor Vehicles', 'Maintenance and Other Operating Expenses', 'Expenses'),
(919, 'Depreciation - Watercrafts', 'Maintenance and Other Operating Expenses', 'Expenses'),
(920, 'Depreciation - Trains', 'Maintenance and Other Operating Expenses', 'Expenses'),
(921, 'Depreciation - Aircrafts/Aircraft Ground Equipment', 'Maintenance and Other Operating Expenses', 'Expenses'),
(922, 'Depreciation - Office Equipment', 'Maintenance and Other Operating Expenses', 'Expenses'),
(923, 'Depreciation - Other Equipment', 'Maintenance and Other Operating Expenses', 'Expenses'),
(924, 'Depreciation - Furniture and Fixtures', 'Maintenance and Other Operating Expenses', 'Expenses'),
(925, 'Depreciation - Ordnance', 'Maintenance and Other Operating Expenses', 'Expenses'),
(926, 'Depreciation - Books', 'Maintenance and Other Operating Expenses', 'Expenses'),
(927, 'Depreciation - Other Property, Plant and Equipment', 'Maintenance and Other Operating Expenses', 'Expenses'),
(928, 'Obsolescence - IT Software', 'Maintenance and Other Operating Expenses', 'Expenses'),
(929, 'Bad Debts Expense', 'Maintenance and Other Operating Expenses', 'Expenses'),
(937, 'Discount on Real Property Tax', 'Maintenance and Other Operating Expenses', 'Expenses'),
(938, 'Discount on Special Education Tax', 'Maintenance and Other Operating Expenses', 'Expenses'),
(947, 'Loss on Sale of Assets', 'Maintenance and Other Operating Expenses', 'Expenses'),
(948, 'Loss of Assets', 'Maintenance and Other Operating Expenses', 'Expenses'),
(950, 'Other Expenses', 'Maintenance and Other Operating Expenses', 'Expenses'),
(951, 'Bank Charges', 'Financial Expenses', 'Expenses'),
(952, 'Interest Expenses', 'Financial Expenses', 'Expenses'),
(953, 'Commitment Charges', 'Financial Expenses', 'Expenses'),
(954, 'Documentary Stamps Expenses', 'Financial Expenses', 'Expenses'),
(955, 'Other Financial Charges', 'Financial Expenses', 'Expenses'),
(956, 'Foreign Exchange (FOREX) Loss', 'Financial Expenses', 'Expenses'),
(957, 'Debt Service Subsidy to GOCCs', 'Financial Expenses', 'Expenses'),
(958, 'Loss on Guaranty', 'Financial Expenses', 'Expenses');

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE IF NOT EXISTS `designation` (
  `designationID` int(11) NOT NULL AUTO_INCREMENT,
  `designationName` varchar(200) NOT NULL,
  PRIMARY KEY (`designationID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`designationID`, `designationName`) VALUES
(2, 'Chancellor'),
(3, 'Vice Chancellor for Administration'),
(4, 'Dean, CSM'),
(5, 'Dean, CHSS'),
(6, 'Dean, SOM'),
(7, 'Head, ITO'),
(8, 'Chief, SPMO'),
(9, 'Director, OSA'),
(10, 'Vice Chancellor for Academic Affairs'),
(11, 'Head of Research'),
(12, 'University Registrar'),
(13, 'Cashier'),
(14, 'Head, PPO'),
(15, 'Head, HRDO'),
(16, 'Accountant'),
(17, 'Budget Officer'),
(18, 'Legal Officer'),
(19, 'Head, OECS');

-- --------------------------------------------------------

--
-- Table structure for table `fund`
--

CREATE TABLE IF NOT EXISTS `fund` (
  `fundID` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`fundID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fund`
--

INSERT INTO `fund` (`fundID`, `description`) VALUES
(101, 'General Fund'),
(164, 'Revolving Fund'),
(184, 'Trust Fund');

-- --------------------------------------------------------

--
-- Table structure for table `fundsource`
--

CREATE TABLE IF NOT EXISTS `fundsource` (
  `fundSourceID` int(11) NOT NULL AUTO_INCREMENT,
  `fundSourceName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fundSourceID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `fundsource`
--

INSERT INTO `fundsource` (`fundSourceID`, `fundSourceName`) VALUES
(1, 'GAS'),
(2, 'AHE'),
(3, 'RES'),
(4, 'EXT'),
(5, 'Lib Fee'),
(6, 'Athletic Fee'),
(7, 'Internet'),
(8, 'Lab Fee'),
(9, 'ACIAR'),
(10, 'BIOTECH');

-- --------------------------------------------------------

--
-- Table structure for table `iar`
--

CREATE TABLE IF NOT EXISTS `iar` (
  `iarID` int(11) NOT NULL AUTO_INCREMENT,
  `poID` int(11) NOT NULL,
  `dateIns` date DEFAULT NULL,
  `dateRec` date DEFAULT NULL,
  `statusIns` varchar(20) DEFAULT NULL,
  `statusRec` varchar(20) DEFAULT NULL,
  `inspectorID` int(11) DEFAULT NULL,
  `storekeeperID` int(11) DEFAULT NULL,
  `insDesignationID` int(11) NOT NULL,
  `stoDesignationID` int(11) NOT NULL,
  `invoiceID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastUpdate` date NOT NULL,
  `status` enum('Approved','Pending','Cancelled') NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`iarID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `iar`
--

INSERT INTO `iar` (`iarID`, `poID`, `dateIns`, `dateRec`, `statusIns`, `statusRec`, `inspectorID`, `storekeeperID`, `insDesignationID`, `stoDesignationID`, `invoiceID`, `userID`, `dateCreated`, `lastUpdate`, `status`) VALUES
(2, 222223, '2011-08-23', '2011-08-23', 'verified', 'complete', 10, 11, 19, 7, 333, 2, '2011-08-23', '0000-00-00', 'Pending'),
(3, 41309, '2011-08-23', '2011-08-23', 'verified', 'complete', 12, 13, 18, 12, 909, 2, '2011-08-23', '0000-00-00', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `itemname`
--

CREATE TABLE IF NOT EXISTS `itemname` (
  `itemNameID` int(11) NOT NULL AUTO_INCREMENT,
  `itemTitle` varchar(60) DEFAULT NULL,
  `unitID` int(11) DEFAULT NULL,
  `itemTypeID` int(11) DEFAULT NULL,
  `coacode` int(11) NOT NULL,
  PRIMARY KEY (`itemNameID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `itemname`
--

INSERT INTO `itemname` (`itemNameID`, `itemTitle`, `unitID`, `itemTypeID`, `coacode`) VALUES
(1, 'Laptop', 2, 1, 125),
(6, 'Keyboard', 1, 1, 125),
(19, 'Ballpen', 1, 9, 122),
(20, 'Cabinet', 1, 10, 114),
(18, 'Printer Ink', 4, 8, 113),
(17, 'Yellow Paper', 5, 7, 105),
(21, 'Plate', 1, 11, 122),
(22, 'Stapler', 1, 12, 125),
(23, 'Junk Food', 9, 13, 112),
(24, 'Juice', 9, 13, 110),
(25, 'White Board Pen', 1, 9, 111),
(26, 'Marker Refill', 4, 8, 113),
(27, 'Bond Paper', 13, 7, 115),
(28, 'Table', 1, 10, 127),
(29, 'Fork', 1, 11, 101),
(30, 'Scissors', 1, 12, 125),
(31, 'Air Freshener', 10, 14, 111),
(32, 'Alcohol', 11, 14, 121),
(33, 'Folder', 1, 12, 122),
(34, 'Battery', 9, 15, 125),
(35, 'BOX', 1, 16, 122),
(36, 'Carbon Paper', 14, 7, 126),
(37, 'CASSETTE BLANK TAPE', 1, 16, 101),
(38, 'CD-RW', 1, 1, 106),
(39, 'CD-Recordable', 1, 1, 110),
(40, 'Glue', 11, 12, 107),
(41, 'Correction Tape', 1, 12, 121),
(42, 'DVD-Rewritable', 1, 1, 113),
(43, 'Computer Ribbon', 15, 1, 112),
(44, 'Continuous Paper', 14, 7, 113),
(45, 'COMPUTER Ribbon', 16, 1, 112),
(46, 'Coffee', 9, 13, 114),
(47, 'Coffee Creamer', 9, 13, 105),
(48, 'Chipboard', 1, 12, 114),
(49, 'Dishwashing Liquid Soap', 12, 14, 113),
(50, 'Data Folder', 1, 12, 110),
(51, 'Double Clip', 14, 12, 111),
(52, 'Envelope', 1, 12, 113),
(53, 'Fax Film', 16, 8, 121),
(54, 'Fax Paper', 1, 7, 112),
(55, 'Art Paper', 13, 7, 113),
(56, 'Puncher', 1, 12, 101),
(57, 'Tape Dispenser', 1, 12, 101),
(58, 'Data Filer', 1, 12, 101),
(59, 'Sharpener', 1, 12, 101),
(60, 'Sharpener', 1, 12, 101),
(61, 'Corkboard', 2, 10, 101),
(63, 'Paper Holder', 1, 12, 101),
(64, 'Tray', 1, 11, 101);

-- --------------------------------------------------------

--
-- Table structure for table `itemtype`
--

CREATE TABLE IF NOT EXISTS `itemtype` (
  `itemTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `itemTypeName` varchar(200) NOT NULL,
  `userID` int(11) NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateCreated` date NOT NULL,
  PRIMARY KEY (`itemTypeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `itemtype`
--

INSERT INTO `itemtype` (`itemTypeID`, `itemTypeName`, `userID`, `lastUpdate`, `dateCreated`) VALUES
(1, 'Computer', 9, '2011-05-09 23:44:09', '2011-04-21'),
(8, 'INK', 0, '2011-05-10 19:22:30', '2011-05-11'),
(7, 'Paper', 9, '2007-10-29 03:49:09', '2011-05-10'),
(9, 'Writing Tools', 0, '2011-05-10 19:23:28', '2011-05-11'),
(10, 'Furniture', 0, '2011-05-10 19:23:57', '2011-05-11'),
(11, 'Utensils', 0, '2011-05-10 19:24:14', '2011-05-11'),
(12, 'Office Supplies', 0, '2011-05-10 19:25:34', '2011-05-11'),
(13, 'Food', 0, '2011-05-10 19:25:27', '2011-05-11'),
(14, 'Chemicals', 0, '2011-05-13 01:30:39', '2011-05-13'),
(15, 'Hardware', 0, '2011-05-22 15:57:47', '2011-05-23'),
(16, 'Others', 0, '2011-05-22 16:08:55', '2011-05-23'),
(17, 'Lot', 0, '2011-05-23 16:59:59', '2011-05-24');

-- --------------------------------------------------------

--
-- Table structure for table `mop`
--

CREATE TABLE IF NOT EXISTS `mop` (
  `MOPID` int(11) NOT NULL AUTO_INCREMENT,
  `MOPName` varchar(60) DEFAULT NULL,
  `amountStart` int(30) DEFAULT NULL,
  `amountEnd` int(30) DEFAULT NULL,
  PRIMARY KEY (`MOPID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mop`
--

INSERT INTO `mop` (`MOPID`, `MOPName`, `amountStart`, `amountEnd`) VALUES
(6, 'Sealed Bids', 100000, 5000000),
(7, 'Phone Canvass', 0, 10000),
(8, 'Open Canvass', 10000, 1000000),
(9, 'canvass', 0, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `mr`
--

CREATE TABLE IF NOT EXISTS `mr` (
  `mrID` int(11) NOT NULL,
  `dateAcquired` date NOT NULL,
  `custodianID` int(11) NOT NULL,
  `fundID` int(11) NOT NULL,
  `coacode` double NOT NULL,
  `supplierID` int(11) NOT NULL,
  PRIMARY KEY (`mrID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mr`
--

INSERT INTO `mr` (`mrID`, `dateAcquired`, `custodianID`, `fundID`, `coacode`, `supplierID`) VALUES
(22, '1995-09-01', 8, 101, 290, 6),
(554, '1997-05-10', 8, 101, 290, 7),
(684, '1997-08-22', 8, 164, 222, 0),
(887, '1997-11-24', 8, 101, 290, 7),
(1037, '1998-05-06', 8, 101, 290, 7),
(1053, '1998-05-21', 8, 101, 222, 8),
(1060, '1998-04-23', 8, 101, 290, 9),
(1233, '1998-07-20', 8, 101, 222, 0),
(1528, '1998-11-13', 8, 101, 221, 9),
(1670, '1999-01-27', 8, 101, 222, 0),
(1777, '1999-02-17', 8, 101, 290, 10),
(1778, '1999-02-17', 8, 101, 290, 11),
(1860, '1999-05-20', 8, 101, 290, 7),
(1888, '1999-06-17', 8, 101, 222, 12),
(1934, '1999-07-16', 8, 101, 290, 7),
(2093, '1999-09-27', 8, 101, 290, 7),
(32342, '2011-08-25', 24096, 32342, 32342, 12),
(1234, '2011-08-25', 1, 101, 502, 10);

-- --------------------------------------------------------

--
-- Table structure for table `obr`
--

CREATE TABLE IF NOT EXISTS `obr` (
  `obrID` int(11) NOT NULL AUTO_INCREMENT,
  `respCenterID` int(11) DEFAULT NULL,
  `fundSourceID` int(11) NOT NULL,
  `poID` int(11) DEFAULT NULL,
  `particulars` varchar(200) NOT NULL,
  `coacode` int(11) NOT NULL,
  `ppaID` int(11) NOT NULL,
  `requestorID` int(11) DEFAULT NULL,
  `approvedByID` int(11) DEFAULT NULL,
  `reqDesignationID` int(11) NOT NULL,
  `appDesignationID` int(11) NOT NULL,
  `status` enum('Approved','Pending','Cancelled') NOT NULL DEFAULT 'Pending',
  `userID` int(11) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `lastUpdate` date NOT NULL,
  `OBR_ID` int(11) NOT NULL,
  PRIMARY KEY (`obrID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `obr`
--

INSERT INTO `obr` (`obrID`, `respCenterID`, `fundSourceID`, `poID`, `particulars`, `coacode`, `ppaID`, `requestorID`, `approvedByID`, `reqDesignationID`, `appDesignationID`, `status`, `userID`, `dateCreated`, `lastUpdate`, `OBR_ID`) VALUES
(1, 14, 8, 222223, '  QWERTY', 958, 4, 17, 15, 14, 14, 'Approved', 2, '2011-08-23', '2011-08-23', 4422),
(2, 13, 6, 41309, ' sfdgs', 958, 2, 13, 15, 3, 19, 'Approved', 2, '2011-08-23', '2011-08-23', 3233),
(3, 3, 2, 111111, ' xcv', 958, 1, 14, 12, 3, 3, 'Pending', 2, '2011-08-23', '2011-08-23', 1111);

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE IF NOT EXISTS `office` (
  `officeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `officeCode` varchar(45) NOT NULL,
  `officeName` varchar(100) NOT NULL,
  `itemTypeID` int(11) NOT NULL,
  `lastUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userID` int(11) NOT NULL,
  `dateCreated` date NOT NULL,
  PRIMARY KEY (`officeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `office`
--

INSERT INTO `office` (`officeID`, `officeCode`, `officeName`, `itemTypeID`, `lastUpdate`, `userID`, `dateCreated`) VALUES
(1, 'OC', 'Office of the Chancellor', 0, NULL, 0, '0000-00-00'),
(2, 'ITO', 'Information Technology Office', 0, NULL, 0, '0000-00-00'),
(3, 'OSA', 'Office of the Student Affairs', 0, NULL, 0, '0000-00-00'),
(4, 'OVCA', 'Office of the Vice Chancellor for Administration', 0, NULL, 0, '0000-00-00'),
(5, 'OVCAA', 'Office of the Vice Chancellor for Academic Affairs', 0, NULL, 0, '0000-00-00'),
(6, 'SPMO', 'Supply and Property Management Office', 0, NULL, 0, '0000-00-00'),
(7, 'OR', 'Office of Research', 0, NULL, 0, '0000-00-00'),
(8, 'OUR', 'Office of the University Registrar', 0, NULL, 0, '0000-00-00'),
(9, 'CASH', 'Cash Office', 0, NULL, 0, '0000-00-00'),
(10, 'PPO', 'Physical Plant Office', 0, NULL, 0, '0000-00-00'),
(11, 'HRDO', 'Human Resource Development Office', 0, NULL, 0, '0000-00-00'),
(12, 'ACCTG', 'Accounting Office', 0, NULL, 0, '0000-00-00'),
(13, 'LEGAL', 'Legal Office', 0, NULL, 0, '0000-00-00'),
(14, 'OECS', 'Office of Extension and Community Service', 0, NULL, 0, '0000-00-00'),
(15, 'BUDGET', 'Budget Office', 0, NULL, 0, '0000-00-00'),
(16, 'CHSS', 'Office of the Dean, CHSS', 0, NULL, 0, '0000-00-00'),
(17, 'CHSS-OD', 'Office of the Dean, CHSS', 0, NULL, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `personnel`
--

CREATE TABLE IF NOT EXISTS `personnel` (
  `personnelID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employeeNumber` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `middleName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `ext` varchar(10) NOT NULL,
  PRIMARY KEY (`personnelID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24099 ;

--
-- Dumping data for table `personnel`
--

INSERT INTO `personnel` (`personnelID`, `employeeNumber`, `password`, `firstName`, `middleName`, `lastName`, `status`, `ext`) VALUES
(241, '2006-24095', 'koon', 'Koon', 'Agero', 'Agnis', 0, ''),
(1, '73879', 'abad', 'Reynaldo', 'G.', 'Abad', 0, ''),
(4, '372874', 'dhone', 'Ronald', 'G.', 'Barriga', 0, ''),
(68, '329990', 'calag', 'Vicente', 'B.', 'Calag', 0, ''),
(7, '123', '123', 'Teresita', 'V.', 'Lagsub', 0, ''),
(24096, '673678', 'ayson', 'Evelina', '', 'Ayson', 1, ''),
(24097, '7467', 'spmo', 'Socorro Brenda', '', 'Acuna', 1, ''),
(8, '8', '', 'Sharon Jean', 'A.', 'Año', 0, ''),
(10, '10', '', 'Maria Mae', 'C.', 'Aborde', 0, ''),
(11, '11', '', 'Esteban', 'A.', 'Acasio III', 0, ''),
(12, '12', '', 'Joan', 'T.', 'Acaso', 0, ''),
(13, '13', '', 'Joseph', 'E.', 'Acosta', 0, ''),
(14, '14', '', 'Jo-an', 'S.', 'Aguilar', 0, ''),
(15, '15', '', 'Roxanne', '', 'Aguinaldo', 0, ''),
(16, '16', '', 'Roberto', 'P.', 'Alabado', 0, ''),
(17, '17', '', 'Edna', 'P.', 'Amelo', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `ppa`
--

CREATE TABLE IF NOT EXISTS `ppa` (
  `ppaID` int(11) NOT NULL AUTO_INCREMENT,
  `ppaName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ppaID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ppa`
--

INSERT INTO `ppa` (`ppaID`, `ppaName`) VALUES
(1, '100'),
(2, '300'),
(4, '200');

-- --------------------------------------------------------

--
-- Table structure for table `pr`
--

CREATE TABLE IF NOT EXISTS `pr` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRID` int(11) NOT NULL,
  `PRDate` date NOT NULL,
  `officeID` int(11) NOT NULL,
  `section` varchar(200) NOT NULL,
  `purpose` varchar(500) NOT NULL,
  `requestorID` varchar(200) NOT NULL,
  `requestorDesigID` varchar(200) NOT NULL,
  `recommendedByID` varchar(200) DEFAULT NULL,
  `recommendDesigID` varchar(200) NOT NULL,
  `recommendDate` date DEFAULT NULL,
  `approvedByID` varchar(200) DEFAULT NULL,
  `approvedDesigID` varchar(200) NOT NULL,
  `approveDate` date DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `userID` int(11) NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateCreated` date NOT NULL,
  `attachmentID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `pr`
--

INSERT INTO `pr` (`ID`, `PRID`, `PRDate`, `officeID`, `section`, `purpose`, `requestorID`, `requestorDesigID`, `recommendedByID`, `recommendDesigID`, `recommendDate`, `approvedByID`, `approvedDesigID`, `approveDate`, `status`, `userID`, `lastUpdate`, `dateCreated`, `attachmentID`) VALUES
(1, 110002, '2011-05-23', 1, 'Chancellor', 'For Leisure and the likes', '1', '3', '24097', '10', '2011-05-23', '241', '12', '2011-05-23', 'PO_complete', 12, '2011-05-22 18:06:58', '2011-05-23', 0),
(2, 110003, '2011-05-23', 2, 'jjjj', 'gegegegeg', '1', '16', '1', '16', '2011-05-23', '1', '16', '2011-05-23', 'OBR_Pending', 12, '2011-08-23 18:20:22', '2011-05-23', 0),
(3, 123456, '2011-05-23', 6, '', 'yo', '24097', '17', '241', '13', '2011-05-23', '24096', '2', '2011-05-23', 'Canvass_Complete', 12, '2011-05-22 20:57:58', '2011-05-23', 0),
(4, 897676, '2011-05-23', 3, '', 'bjsbfj', '241', '13', '1', '17', '2011-05-25', '1', '16', '2011-05-25', 'Canvass: Complete', 12, '2011-05-24 23:44:31', '2011-05-23', 0),
(5, 6789, '2011-05-23', 11, '', 'djs', '24097', '17', '4', '13', '2011-05-23', '241', '2', '2011-05-23', 'Canvass_Complete', 12, '2011-05-23 00:58:00', '2011-05-23', 0),
(6, 78767, '2011-05-25', 5, '', ' mnjuhg', '1', '17', '24097', '13', '0000-00-00', '241', '2', '0000-00-00', 'Canvass: Complete', 15, '2011-05-25 00:45:26', '2011-05-25', 0),
(7, 566787, '2011-05-25', 7, '', 'ghbhb', '24097', '13', '24096', '5', '2011-05-25', '68', '4', '2011-05-25', 'Canvass: Partial', 12, '2011-05-24 23:52:14', '2011-05-25', 0),
(8, 45667, '2011-05-25', 3, '', 'gi', '1', '13', '24097', '17', '2011-05-25', '1', '13', '2011-05-25', 'Canvass: Partial', 12, '2011-05-25 00:07:25', '2011-05-25', 0),
(9, 999999, '2011-05-25', 7, '', 'fcuhv', '1', '13', '24096', '8', '2011-05-25', '68', '4', '2011-05-25', 'Approved', 12, '2011-05-25 00:26:24', '2011-05-25', 0),
(16, 309, '2011-05-26', 4, 'SPMO', '  APP 2nd qtr.', '24098', '14', '24097', '8', '0000-00-00', '68', '3', '0000-00-00', 'Canvass: Complete', 15, '2011-05-25 20:19:29', '2011-05-26', 0),
(18, 1159490, '2011-05-26', 3, '', ' supplies for student activities 1st semester', '24096', '9', '24099', '17', '2011-05-26', '68', '3', '2011-05-26', 'PO: Complete', 13, '2011-05-25 23:57:42', '2011-05-26', 0),
(35, 30972, '2011-06-21', 4, 'SPMO', 'App 3rd qtr. 2011', '24098', '8', '24097', '8', '2011-06-21', '68', '3', '2011-06-21', 'IAR: Complete', 12, '2011-08-24 20:16:54', '2011-06-21', 0),
(36, 1100018, '2011-06-29', 1, '', 'random', 'Paulino Dismas Jr', 'Storekeeper 3', 'Socorro Brenda Acuna', 'Chief, SPMO', '2011-06-29', 'Vicente B. Calag', 'Vice Chancellor for Administration', '2011-06-29', 'Canvass: Complete', 12, '2011-06-28 20:09:48', '2011-06-29', 0),
(37, 0, '2011-06-29', 2, '', 'bcnd', 'Paulino Dismas Jr', 'Storekeeper 3', 'Socorro Brenda Acuna', 'Chief, SPMO', '0000-00-00', 'Vicente B. Calag', 'Vice Chancellor for Administration', '0000-00-00', 'PR_Pending', 12, '2011-06-28 20:17:09', '2011-06-29', 0),
(46, 2026911, '2011-07-12', 15, 'CSM-DMPCS', 'Use for computer laboratory ', 'Prof. Ritchie Mae T. Gamot', 'Dept. Chair, MPCS', '', '', '2011-07-12', 'Dr. Reynaldo Abad', 'Dean, CSM', '2011-07-12', 'PR_Approved', 15, '2011-07-11 18:07:30', '2011-07-12', 0),
(47, 1212, '2011-08-23', 1, 'ASD', 'SAD', '1', '4', '4', '7', '2011-08-23', '24097', '8', '2011-08-23', 'IAR: Complete', 2, '2011-08-24 19:12:31', '2011-08-23', 0),
(48, 1122, '2011-08-25', 4, 'BAC', 'ad', '68', '3', '1', '17', '2011-08-25', '4', '9', '2011-08-25', 'Canvass: Complete', 2, '2011-08-24 20:29:30', '2011-08-25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pritem`
--

CREATE TABLE IF NOT EXISTS `pritem` (
  `PRItemID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` int(11) NOT NULL,
  `PRID` int(11) NOT NULL,
  `quantity` int(5) NOT NULL,
  `itemNameID` int(11) NOT NULL,
  `itemDescription` varchar(500) NOT NULL,
  `estimatedCost` double(20,2) NOT NULL,
  `statusPRItem` varchar(50) NOT NULL,
  `userID` int(11) NOT NULL,
  `dateCreated` date NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `statusIAR` enum('checked','unchecked','waived') NOT NULL DEFAULT 'unchecked',
  `iarID` int(11) DEFAULT NULL,
  `obrID` int(11) DEFAULT '0',
  PRIMARY KEY (`PRItemID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=142 ;

--
-- Dumping data for table `pritem`
--

INSERT INTO `pritem` (`PRItemID`, `ID`, `PRID`, `quantity`, `itemNameID`, `itemDescription`, `estimatedCost`, `statusPRItem`, `userID`, `dateCreated`, `lastUpdate`, `statusIAR`, `iarID`, `obrID`) VALUES
(1, 1, 110002, 19, 26, 'Black Ink of Madness', 300.00, 'PO', 12, '2011-05-23', '2011-05-22 18:01:54', 'unchecked', NULL, 0),
(2, 1, 110002, 23, 18, 'Black Ink of Infertility', 400.00, 'PO', 12, '2011-05-23', '2011-05-22 18:01:54', 'unchecked', NULL, 0),
(3, 1, 110002, 20, 27, 'Thin', 300.00, 'PO', 12, '2011-05-23', '2011-05-22 18:06:58', 'unchecked', NULL, 0),
(4, 1, 110002, 23, 17, 'O__O', 23.00, 'PO', 12, '2011-05-23', '2011-05-22 18:06:58', 'unchecked', NULL, 0),
(5, 2, 110003, 89, 24, 'BAD', 22.00, 'PO', 12, '2011-05-23', '2011-05-22 18:33:15', 'unchecked', NULL, 0),
(25, 8, 45667, 4, 18, 'vcghvh', 55.00, 'Canvassed', 12, '2011-05-25', '2011-05-25 00:07:25', 'unchecked', NULL, 0),
(7, 2, 110003, 54, 20, 'lol', 2.00, 'Canvassed', 12, '2011-05-23', '2011-05-22 18:31:51', 'unchecked', NULL, 0),
(8, 2, 110003, 34, 28, 'dsf', 2.00, 'Canvassed', 12, '2011-05-23', '2011-05-22 18:31:51', 'unchecked', NULL, 0),
(9, 3, 123456, 6, 24, 'Yellow', 90.00, 'Canvassed', 12, '2011-05-23', '2011-05-22 20:36:47', 'unchecked', NULL, 0),
(24, 8, 45667, 45, 26, 'ggvgv', 354.00, 'Canvassed', 12, '2011-05-25', '2011-05-25 00:09:28', 'unchecked', NULL, 0),
(10, 3, 123456, 5, 23, 'Cement', 89.00, 'Canvassed', 12, '2011-05-23', '2011-05-22 20:57:58', 'unchecked', NULL, 0),
(11, 5, 6789, 7, 24, 'Yellow', 65.00, 'Canvassed', 12, '2011-05-23', '2011-05-22 23:30:50', 'unchecked', NULL, 0),
(12, 5, 6789, 8, 23, 'Clay', 45.00, 'Canvassed', 12, '2011-05-23', '2011-05-23 00:58:00', 'unchecked', NULL, 0),
(13, 5, 6789, 9, 20, 'Black', 1500.00, 'Canvassed', 12, '2011-05-23', '2011-05-23 00:58:00', 'unchecked', NULL, 0),
(14, 4, 897676, 6, 24, 'fyvbhg', 78.00, 'Canvassed', 12, '2011-05-25', '2011-05-24 23:44:31', 'unchecked', NULL, 0),
(15, 4, 897676, 5, 23, 'chgvhjg', 78.00, 'Canvassed', 12, '2011-05-25', '2011-05-24 23:30:08', 'unchecked', NULL, 0),
(16, 4, 897676, 4, 28, 'vchgvjh', 54.00, 'Canvassed', 12, '2011-05-25', '2011-05-24 23:37:14', 'unchecked', NULL, 0),
(17, 4, 897676, 3, 26, 'nhbkj', 567.00, 'Canvassed', 12, '2011-05-25', '2011-05-24 23:39:32', 'unchecked', NULL, 0),
(23, 7, 566787, 34, 27, 'chgvjh', 89.00, 'Canvassed', 12, '2011-05-25', '2011-05-24 23:52:14', 'unchecked', NULL, 0),
(21, 7, 566787, 78, 30, 'vhvjh', 456.00, 'Canvassed', 12, '2011-05-25', '2011-05-25 00:03:21', 'unchecked', NULL, 0),
(22, 7, 566787, 45, 22, 'gvhgvj', 897.00, 'Approved', 12, '2011-05-25', '2011-05-24 23:50:50', 'unchecked', NULL, 0),
(26, 8, 45667, 45, 30, 'hfgv', 34.00, 'For Canvass', 12, '2011-05-25', '2011-05-25 00:05:03', 'unchecked', NULL, 0),
(27, 9, 999999, 5, 30, 'ftghj', 67.00, 'For Canvass', 12, '2011-05-25', '2011-05-25 00:26:24', 'unchecked', NULL, 0),
(28, 9, 999999, 4, 22, 'vhkj', 35.00, 'For Canvass', 12, '2011-05-25', '2011-05-25 00:26:24', 'unchecked', NULL, 0),
(29, 9, 999999, 7, 27, 'hvbijbjk', 98.00, 'For Canvass', 12, '2011-05-25', '2011-05-25 00:26:24', 'unchecked', NULL, 0),
(30, 9, 999999, 4, 17, 'hgvjhb', 67.00, 'For Canvass', 12, '2011-05-25', '2011-05-25 00:26:24', 'unchecked', NULL, 0),
(31, 9, 999999, 34, 29, 'bjhbj', 679.00, 'For Canvass', 12, '2011-05-25', '2011-05-25 00:26:24', 'unchecked', NULL, 0),
(32, 9, 999999, 32, 21, 'vjhgvh', 80.00, 'For Canvass', 12, '2011-05-25', '2011-05-25 00:26:24', 'unchecked', NULL, 0),
(37, 13, 309, 2, 30, '8" stainless', 55.55, 'Canvassed', 15, '2011-05-25', '2011-05-25 01:44:06', 'unchecked', NULL, 0),
(35, 11, 0, 2, 30, '8" stainless', 55.00, 'For Canvass', 15, '2011-05-25', '2011-05-25 00:56:37', 'unchecked', NULL, 0),
(36, 11, 0, 3, 22, '#35 Heavy duty', 501.00, 'For Canvass', 15, '2011-05-25', '2011-05-25 00:56:37', 'unchecked', NULL, 0),
(38, 13, 309, 3, 22, '#35 Heavy duty', 105.00, 'Canvassed', 15, '2011-05-25', '2011-05-25 01:44:06', 'unchecked', NULL, 0),
(39, 14, 0, 2, 30, '', 0.00, 'For Canvass', 15, '2011-05-26', '2011-05-25 17:37:16', 'unchecked', NULL, 0),
(40, 14, 0, 0, 22, '', 0.00, 'For Canvass', 15, '2011-05-26', '2011-05-25 17:37:16', 'unchecked', NULL, 0),
(41, 14, 0, 0, 27, '', 0.00, 'For Canvass', 15, '2011-05-26', '2011-05-25 17:37:16', 'unchecked', NULL, 0),
(42, 14, 0, 0, 17, '', 0.00, 'For Canvass', 15, '2011-05-26', '2011-05-25 17:37:16', 'unchecked', NULL, 0),
(43, 14, 0, 0, 19, '', 0.00, 'For Canvass', 15, '2011-05-26', '2011-05-25 17:37:16', 'unchecked', NULL, 0),
(44, 14, 0, 0, 25, '', 0.00, 'For Canvass', 15, '2011-05-26', '2011-05-25 17:37:16', 'unchecked', NULL, 0),
(45, 15, 309, 1, 30, '8" stainless', 56.00, 'Canvassed', 15, '2011-05-26', '2011-05-25 19:24:04', 'unchecked', NULL, 0),
(46, 15, 309, 2, 22, '#35 Max', 150.00, 'Canvassed', 15, '2011-05-26', '2011-05-25 19:24:04', 'unchecked', NULL, 0),
(47, 15, 309, 5, 27, 'A4, PPC s-20', 205.00, 'Canvassed', 15, '2011-05-26', '2011-05-25 19:24:04', 'unchecked', NULL, 0),
(48, 15, 309, 10, 17, 'Merit', 35.00, 'Canvassed', 15, '2011-05-26', '2011-05-25 19:24:04', 'unchecked', NULL, 0),
(49, 15, 309, 50, 19, 'UNI, Ball point', 2.50, 'Canvassed', 15, '2011-05-26', '2011-05-25 19:24:04', 'unchecked', NULL, 0),
(50, 15, 309, 10, 25, 'Marker pen, Pilot', 50.00, 'Canvassed', 0, '2011-05-26', '2011-08-23 08:16:46', 'checked', 0, 3),
(117, 40, 2024311, 3, 0, ' Sodium dihydrogen phosphate\r\ndibasic (500g)', 1050.00, 'For Canvass', 15, '2011-07-05', '2011-07-06 20:05:07', 'unchecked', NULL, 0),
(51, 16, 0, 2, 26, '  ink, refill', 20.00, 'Canvassed', 15, '2011-05-26', '2011-05-25 22:15:16', 'unchecked', NULL, 0),
(52, 16, 309, 3, 18, 'C190, Epson colored', 100.00, 'Canvassed', 15, '2011-05-26', '2011-05-25 19:24:04', 'unchecked', NULL, 0),
(53, 16, 309, 8, 30, '8" stainless', 25.00, 'Canvassed', 15, '2011-05-26', '2011-05-25 19:24:04', 'unchecked', NULL, 0),
(54, 16, 309, 1, 22, '#35, Max, heavy duty', 160.00, 'Canvassed', 15, '2011-05-26', '2011-05-25 19:24:04', 'unchecked', NULL, 0),
(55, 16, 309, 5, 27, 'A4, Cactus S-20', 250.00, 'Canvassed', 15, '2011-05-26', '2011-05-25 19:24:04', 'unchecked', NULL, 0),
(56, 16, 309, 10, 17, 'yellow paper, Merit', 25.00, 'Canvassed', 15, '2011-05-26', '2011-05-25 19:24:04', 'unchecked', NULL, 0),
(57, 16, 0, 1, 27, 'yellow', 150.00, 'For Canvass', 15, '2011-05-26', '2011-05-25 19:34:29', 'unchecked', NULL, 0),
(58, 17, 0, 2, 30, '8" stainless', 150.00, 'For Canvass', 15, '2011-05-26', '2011-05-25 23:18:24', 'unchecked', NULL, 0),
(59, 17, 0, 1, 20, '  4 drawers, plain, steel cabinet', 12000.00, 'For Canvass', 15, '2011-05-26', '2011-05-25 23:21:24', 'unchecked', NULL, 0),
(60, 18, 1159490, 4, 32, ' 400mg/bots', 120.00, 'PO', 13, '2011-05-26', '2011-05-25 23:57:42', 'unchecked', NULL, 0),
(61, 18, 1159490, 5, 19, 'BLACK', 5.00, 'PO', 13, '2011-05-26', '2011-05-25 23:57:42', 'unchecked', NULL, 0),
(62, 18, 1159490, 6, 46, '40s/pack', 100.00, 'PO', 13, '2011-05-26', '2011-05-25 23:57:42', 'unchecked', NULL, 0),
(63, 20, 0, 1, 6, '', 12.00, 'For Canvass', 15, '2011-05-27', '2011-05-26 17:11:02', 'unchecked', NULL, 0),
(64, 23, 0, 12, 43, 'sdl,sdlkfms', 2342.00, 'For Canvass', 2, '2011-05-30', '2011-05-29 20:34:12', 'unchecked', NULL, 0),
(65, 24, 0, 36, 47, '5g 48''s', 55.00, 'For Canvass', 15, '2011-06-13', '2011-06-12 18:24:30', 'unchecked', NULL, 0),
(66, 25, 0, 220, 32, 'Green cross', 20.50, 'For Canvass', 15, '2011-06-13', '2011-06-12 20:04:44', 'unchecked', NULL, 0),
(67, 26, 0, 15, 34, 'AAA battery', 50.00, 'For Canvass', 15, '2011-06-14', '2011-06-13 20:28:34', 'unchecked', NULL, 0),
(68, 26, 0, 3, 27, 'S-24 bond paper', 250.00, 'For Canvass', 15, '2011-06-14', '2011-06-13 20:29:15', 'unchecked', NULL, 0),
(69, 27, 30911, 16, 32, 'green cross 500ml ', 25.00, 'Canvassed', 15, '2011-06-16', '2011-06-16 20:33:19', 'unchecked', NULL, 0),
(70, 27, 30911, 12, 43, 'refill, big', 20.00, 'Canvassed', 15, '2011-06-16', '2011-06-16 20:33:19', 'unchecked', NULL, 0),
(71, 29, 30911, 10, 27, 'Cactus,A4,S-20', 200.00, 'PO', 15, '2011-06-17', '2011-06-16 20:43:54', 'unchecked', NULL, 0),
(72, 30, 30911, 20, 27, 'A4 s-20,cactus', 200.00, 'For Canvass', 15, '2011-06-17', '2011-06-16 20:50:49', 'unchecked', NULL, 0),
(73, 30, 30911, 5, 44, 'long', 300.00, 'For Canvass', 15, '2011-06-17', '2011-06-16 20:50:49', 'unchecked', NULL, 0),
(74, 30, 30911, 56, 51, 'small', 56.00, 'For Canvass', 15, '2011-06-17', '2011-06-16 20:50:49', 'unchecked', NULL, 0),
(75, 31, 0, 2, 31, 'glade 250 ml', 150.00, 'For Canvass', 12, '2011-06-17', '2011-06-16 22:22:10', 'unchecked', NULL, 0),
(76, 31, 0, 6, 32, 'green cross 500ml', 50.00, 'For Canvass', 12, '2011-06-17', '2011-06-16 22:22:36', 'unchecked', NULL, 0),
(77, 31, 0, 5, 27, 'Cactus A4, s-20', 250.00, 'For Canvass', 12, '2011-06-17', '2011-06-16 22:23:12', 'unchecked', NULL, 0),
(78, 31, 0, 1, 19, 'bic, ball point', 20.00, 'For Canvass', 12, '2011-06-17', '2011-06-16 22:23:41', 'unchecked', NULL, 0),
(79, 32, 130911, 1, 31, 'glade 500ml', 180.00, 'Cancelled', 15, '2011-06-17', '2011-06-16 23:43:46', 'unchecked', NULL, 0),
(80, 32, 130911, 2, 32, 'green cross 250 ml', 98.00, 'Cancelled', 15, '2011-06-17', '2011-06-16 23:43:46', 'unchecked', NULL, 0),
(81, 32, 130911, 5, 19, 'k-hong, ball point', 8.00, 'Cancelled', 15, '2011-06-17', '2011-06-16 23:43:46', 'unchecked', NULL, 0),
(82, 32, 130911, 6, 34, 'AA energizer pack of 4', 120.00, 'Cancelled', 15, '2011-06-17', '2011-06-16 23:43:46', 'unchecked', NULL, 0),
(83, 32, 130911, 5, 27, 'cactus A4, S-20', 240.00, 'Cancelled', 15, '2011-06-17', '2011-06-16 23:43:46', 'unchecked', NULL, 0),
(84, 32, 130911, 8, 20, 'steel cabinet plain, 4 drawers', 8.00, 'Cancelled', 15, '2011-06-17', '2011-06-16 23:43:46', 'unchecked', NULL, 0),
(85, 32, 130911, 7, 45, 'big, refill', 5.00, 'Cancelled', 15, '2011-06-17', '2011-06-16 23:43:46', 'unchecked', NULL, 0),
(86, 32, 130911, 9, 6, 'multimedia keyboard', 1500.00, 'Cancelled', 15, '2011-06-17', '2011-06-16 23:43:46', 'unchecked', NULL, 0),
(87, 32, 130911, 3, 17, 'merit', 28.00, 'Cancelled', 15, '2011-06-17', '2011-06-16 23:43:46', 'unchecked', NULL, 0),
(88, 34, 999911, 1, 31, 'Glade 500ml', 150.00, 'PO', 15, '2011-06-17', '2011-06-17 01:40:44', 'unchecked', NULL, 0),
(90, 34, 999911, 2, 32, 'Green cross 250ml', 90.00, 'PO', 15, '2011-06-17', '2011-06-17 01:40:44', 'unchecked', NULL, 0),
(91, 34, 999911, 5, 19, 'Pilot, ballpoint', 26.00, 'PO', 15, '2011-06-17', '2011-06-17 01:40:44', 'unchecked', NULL, 0),
(92, 34, 999911, 7, 34, 'Energizer AA,pack of 4', 158.00, 'PO', 15, '2011-06-17', '2011-06-17 01:40:44', 'unchecked', NULL, 0),
(93, 34, 999911, 45, 27, 'Cactus A4, S-20', 258.00, 'PO', 15, '2011-06-17', '2011-06-17 01:40:44', 'unchecked', NULL, 0),
(94, 34, 999911, 4, 20, 'Steel cabinet, Plain, 4 drawers', 1500.00, 'PO', 15, '2011-06-17', '2011-06-17 01:40:44', 'unchecked', NULL, 0),
(95, 34, 999911, 8, 39, 'CD-R w/ case', 30.00, 'PO', 15, '2011-06-17', '2011-06-17 01:40:44', 'unchecked', NULL, 0),
(96, 34, 999911, 5, 45, 'orig, big', 50.00, 'PO', 15, '2011-06-17', '2011-06-17 01:40:44', 'unchecked', NULL, 0),
(97, 34, 999911, 98, 40, 'Elmers glue,50ml', 59.00, 'PO', 15, '2011-06-17', '2011-06-17 01:40:44', 'unchecked', NULL, 0),
(99, 35, 30972, 5, 32, 'Green cross, 250ml', 58.00, 'PO', 0, '2011-06-21', '2011-08-24 20:15:26', 'checked', 0, 2),
(98, 35, 30972, 5, 31, 'glade, 320ml', 128.00, 'PO', 0, '2011-06-21', '2011-08-24 20:15:26', 'checked', 0, 2),
(100, 35, 30972, 10, 19, 'Pilot, ball point', 10.00, 'PO', 0, '2011-06-21', '2011-08-24 20:15:26', 'checked', 0, 2),
(101, 35, 30972, 1, 34, 'pack of 4', 148.00, 'PO', 0, '2011-06-21', '2011-08-24 20:15:26', 'checked', 0, 2),
(102, 35, 30972, 10, 27, 'Cactus, A4, S-20', 250.00, 'PO', 0, '2011-06-21', '2011-08-24 20:15:26', 'checked', 0, 2),
(103, 35, 30972, 1, 20, 'Steel cabinet, 4 drawers', 5500.00, 'PO', 0, '2011-06-21', '2011-08-24 20:15:26', 'checked', 0, 2),
(104, 35, 30972, 2, 36, 'carbon paper, legal', 25.00, 'PO', 0, '2011-06-21', '2011-08-24 20:15:26', 'checked', 0, 2),
(105, 35, 30972, 6, 45, 'big, refill', 2.00, 'PO', 0, '2011-06-21', '2011-08-24 20:15:26', 'checked', 0, 2),
(106, 35, 30972, 1, 44, '13X9-1/2, 2 ply', 500.00, 'PO', 0, '2011-06-21', '2011-08-24 20:15:26', 'checked', 0, 2),
(107, 35, 30972, 7, 49, 'axion, dish washing liquid', 38.00, 'PO', 0, '2011-06-21', '2011-08-24 20:15:26', 'checked', 0, 2),
(108, 35, 30972, 65, 51, 'small', 62.00, 'PO', 0, '2011-06-21', '2011-08-24 20:15:26', 'checked', 0, 2),
(109, 35, 30972, 1, 54, 'fax paper', 87.00, 'PO', 0, '2011-06-21', '2011-08-24 20:15:26', 'checked', 0, 2),
(110, 35, 30972, 3, 29, 'green w/ tabs', 3.00, 'PO', 0, '2011-06-21', '2011-08-24 20:15:26', 'checked', 0, 2),
(111, 35, 30972, 6, 33, 'green w/o tabs', 65.00, 'PO', 0, '2011-06-21', '2011-08-24 20:15:26', 'checked', 0, 2),
(112, 35, 30972, 9, 26, 'btl', 47.00, 'PO', 0, '2011-06-21', '2011-08-24 20:15:26', 'checked', 0, 2),
(113, 35, 30972, 8, 30, 'stainless, 8 inches', 12.00, 'PO', 0, '2011-06-21', '2011-08-24 20:16:53', 'checked', 0, 2),
(116, 40, 2024311, 3, 0, ' Sodium Dihydrogen phosphate\r\nmonobasic,AR (500g).', 950.00, 'For Canvass', 15, '2011-07-05', '2011-07-06 20:05:07', 'unchecked', NULL, 0),
(115, 39, 0, 0, 0, '', 0.00, 'For Canvass', 15, '2011-07-04', '2011-07-04 01:16:53', 'unchecked', NULL, 0),
(114, 36, 1100018, 3, 24, 'df', 89.00, 'Canvassed', 12, '2011-06-29', '2011-06-28 20:09:47', 'unchecked', NULL, 0),
(118, 40, 2024311, 1, 0, ' Potassium sodium tartarate, AR\r\n(500g)', 892.00, 'For Canvass', 15, '2011-07-05', '2011-07-06 20:05:07', 'unchecked', NULL, 0),
(119, 40, 2024311, 2, 0, ' Glycine,AR (500g)', 1354.00, 'For Canvass', 15, '2011-07-05', '2011-07-06 20:05:07', 'unchecked', NULL, 0),
(120, 40, 2024311, 4, 0, ' Ammonium sulfate, AR (500g)', 1250.00, 'For Canvass', 15, '2011-07-05', '2011-07-06 20:05:07', 'unchecked', NULL, 0),
(121, 40, 2024311, 2, 0, ' Glucose anhydrous, AR (500g)', 672.00, 'For Canvass', 15, '2011-07-05', '2011-07-06 20:05:07', 'unchecked', NULL, 0),
(123, 40, 2024311, 1, 0, '  Starch soluble, AR (500g)', 682.00, 'For Canvass', 15, '2011-07-05', '2011-07-06 20:05:07', 'unchecked', NULL, 0),
(124, 40, 2024311, 1, 0, ' Phenol crystal, AR (500g)', 1300.00, 'For Canvass', 15, '2011-07-05', '2011-07-06 20:05:07', 'unchecked', NULL, 0),
(125, 40, 2024311, 1, 0, ' Sodium acetate, AR (500g)', 1260.00, 'For Canvass', 15, '2011-07-05', '2011-07-06 20:05:07', 'unchecked', NULL, 0),
(126, 40, 2024311, 1, 0, '  Dinitrosalicylic acid/DNS\r\nsigma grade D 0550 (100g)', 9335.00, 'For Canvass', 15, '2011-07-05', '2011-07-06 20:05:07', 'unchecked', NULL, 0),
(127, 41, 0, 26, 0, ' Alcohol,Isoprophyl,70%,500ml.,Cleene', 65.00, 'For Canvass', 15, '2011-07-05', '2011-07-05 17:29:54', 'unchecked', NULL, 0),
(128, 41, 0, 60, 0, 'Ballpen,Finepoint,black & blue', 5.00, 'For Canvass', 15, '2011-07-06', '2011-07-05 17:31:44', 'unchecked', NULL, 0),
(129, 42, 1425, 2, 0, ' INK, CANON, BC-05, colored', 1.00, 'For Canvass', 15, '2011-07-07', '2011-07-06 20:30:10', 'unchecked', NULL, 0),
(130, 42, 0, 2, 0, 'INK,CANON,PIXMA,CL-40,black', 1.00, 'For Canvass', 15, '2011-07-07', '2011-07-06 20:38:24', 'unchecked', NULL, 0),
(131, 45, 12345, 5, 38, ',bk,j', 89.00, 'Canvassed', 12, '2011-07-10', '2011-07-09 10:15:43', 'unchecked', NULL, 0),
(132, 45, 12345, 2, 32, 'mb,mbk', 78.00, 'Canvassed', 12, '2011-07-10', '2011-07-09 10:17:41', 'unchecked', NULL, 0),
(133, 45, 12345, 12, 55, 'bjhgbk', 6.00, 'For Canvass', 12, '2011-07-10', '2011-07-09 10:14:43', 'unchecked', NULL, 0),
(134, 46, 0, 1, 0, ' Makita blower model: UB 1100', 4120.00, 'For Canvass', 12, '2011-07-12', '2011-07-11 18:08:50', 'unchecked', NULL, 0),
(135, 47, 1212, 5, 18, 'enks', 123.00, 'PO', 0, '2011-08-23', '2011-08-23 08:22:09', 'checked', 2, 1),
(136, 47, 1212, 4, 43, 'ribs', 56.00, 'PO', 0, '2011-08-23', '2011-08-23 08:22:09', 'checked', 2, 1),
(137, 47, 1212, 60, 38, 'twety', 12.00, 'PO', 0, '2011-08-23', '2011-08-23 08:22:09', 'checked', 2, 1),
(138, 47, 1212, 8, 20, 'weee', 1233.00, 'PO', 0, '2011-08-23', '2011-08-23 08:22:09', 'checked', 2, 1),
(141, 48, 1122, 2, 47, '3wrevwre', 23.00, 'Canvassed', 2, '2011-08-25', '2011-08-24 20:29:30', 'unchecked', NULL, 0),
(140, 48, 1122, 5, 42, 'aefrdae', 12.00, 'Canvassed', 2, '2011-08-25', '2011-08-24 20:29:30', 'unchecked', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE IF NOT EXISTS `property` (
  `propertyID` int(11) NOT NULL,
  `propertyNameID` int(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `locationID` int(11) NOT NULL,
  `totalCost` int(11) NOT NULL,
  `itemDescription` varchar(100) NOT NULL,
  `mrNumber` int(11) NOT NULL,
  `statusID` int(11) NOT NULL,
  `acquiModeID` int(11) NOT NULL,
  `custodianID` int(11) NOT NULL,
  PRIMARY KEY (`propertyID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`propertyID`, `propertyNameID`, `quantity`, `locationID`, `totalCost`, `itemDescription`, `mrNumber`, `statusID`, `acquiModeID`, `custodianID`) VALUES
(14470, 28, 1, 15, 3450, 'Classroom Table 1.80x1.80x.60', 22, 1, 0, 8),
(7967, 56, 3, 18, 450, 'Puncher', 554, 2, 0, 4),
(7969, 22, 1, 18, 102, '  Stapler KW 577/red color (c/o sir Danny)', 554, 2, 0, 8),
(7970, 22, 2, 18, 406, 'Stapler KW 577', 554, 2, 0, 8),
(7971, 22, 2, 18, 202, 'Stapler #35 Prince', 554, 2, 9, 8),
(8461, 28, 1, 18, 1800, 'Computer Table short', 684, 1, 0, 8),
(7578, 57, 1, 18, 85, '    Tape Dispenser', 887, 1, 0, 8),
(7580, 58, 6, 18, 510, 'Data Filer, Dataman', 887, 3, 9, 8),
(7581, 58, 9, 18, 765, 'Data Filer, Dataman', 887, 2, 0, 8),
(7579, 57, 2, 18, 170, 'Tape Dispenser', 887, 2, 0, 8),
(12952, 59, 1, 18, 420, 'Pencil Sharpener Berol', 1037, 1, 0, 8),
(12949, 20, 1, 18, 3350, 'Steel filing cabinet 4 drawers plain', 1053, 1, 2, 8),
(8205, 35, 1, 19, 95, 'Diskette Box 3.5', 1060, 2, 0, 8),
(12406, 60, 1, 18, 1950, 'Junior Clerical Ergonomic Chair gas lift', 1233, 1, 0, 8),
(8459, 61, 1, 18, 1733, 'Corkboard 52 x 40 w/ aluminum frame', 1528, 1, 0, 8),
(6972, 20, 1, 18, 3350, 'Steel filing cabinet 4 drawers', 1670, 1, 0, 8),
(7584, 56, 1, 18, 129, 'Puncher two hole big (for faculty use)', 1777, 3, 9, 8),
(7586, 56, 1, 18, 129, 'Puncher Two hole big', 1778, 1, 0, 8),
(7583, 63, 1, 18, 63, 'Computer Attached Paper Holder (attached to computer)', 1860, 2, 0, 8),
(6179, 63, 1, 18, 142, 'Extension Wire cord 10 meters', 1934, 1, 0, 8),
(7582, 20, 1, 18, 8200, 'Steel Filing Cabinet 21 drawers for student jack', 1888, 1, 0, 8),
(5467, 64, 1, 18, 230, 'In/Out Tray plastic 3 layers', 2093, 1, 0, 8),
(138, 20, 8, 3, 10760, 'weee', 32342, 0, 0, 24096),
(909, 45, 5, 10, 615, 'qwewerr', 1234, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `respcenter`
--

CREATE TABLE IF NOT EXISTS `respcenter` (
  `respCenterID` int(11) NOT NULL AUTO_INCREMENT,
  `respCenterName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`respCenterID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `respcenter`
--

INSERT INTO `respcenter` (`respCenterID`, `respCenterName`) VALUES
(2, 'CSM'),
(3, 'CHSS'),
(6, 'ILC'),
(5, 'SOM'),
(7, 'Lib'),
(8, 'OR'),
(9, 'OUR'),
(10, 'OC'),
(11, 'OVCA'),
(12, 'Accounting'),
(13, 'Budget'),
(14, 'ITO');

-- --------------------------------------------------------

--
-- Table structure for table `rq`
--

CREATE TABLE IF NOT EXISTS `rq` (
  `requestID` int(11) NOT NULL AUTO_INCREMENT,
  `supplierID` int(10) NOT NULL,
  `canvassedByID` int(11) DEFAULT NULL,
  `RQDate` date NOT NULL,
  `expiryDate` date NOT NULL,
  `paymentTerm` int(5) NOT NULL,
  `paymentMode` enum('Cheque','Others') NOT NULL,
  `PRID` int(11) NOT NULL,
  `requestByID` int(11) NOT NULL,
  `requestByDesigID` int(11) NOT NULL,
  `canvassedByDesigID` int(11) NOT NULL,
  `DateCanvassed` date NOT NULL,
  `status` enum('Pending','Approved','Partial','Completed') DEFAULT NULL,
  PRIMARY KEY (`requestID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=116 ;

--
-- Dumping data for table `rq`
--

INSERT INTO `rq` (`requestID`, `supplierID`, `canvassedByID`, `RQDate`, `expiryDate`, `paymentTerm`, `paymentMode`, `PRID`, `requestByID`, `requestByDesigID`, `canvassedByDesigID`, `DateCanvassed`, `status`) VALUES
(1, 4, 24096, '2011-05-23', '2011-05-23', 67, 'Cheque', 123456, 1, 17, 13, '2011-05-23', 'Completed'),
(2, 5, NULL, '2011-05-23', '0000-00-00', 0, 'Cheque', 123456, 0, 0, 0, '0000-00-00', 'Completed'),
(3, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 110003, 0, 0, 0, '0000-00-00', 'Pending'),
(4, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 6789, 0, 0, 0, '0000-00-00', 'Completed'),
(5, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 6789, 0, 0, 0, '0000-00-00', 'Completed'),
(6, 2, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 6789, 0, 0, 0, '0000-00-00', 'Completed'),
(12, 4, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 897676, 0, 0, 0, '0000-00-00', 'Completed'),
(11, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 6789, 0, 0, 0, '0000-00-00', 'Completed'),
(10, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 6789, 0, 0, 0, '0000-00-00', 'Completed'),
(13, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 897676, 0, 0, 0, '0000-00-00', 'Completed'),
(14, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 897676, 0, 0, 0, '0000-00-00', 'Completed'),
(15, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 897676, 0, 0, 0, '0000-00-00', 'Completed'),
(16, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 897676, 0, 0, 0, '0000-00-00', 'Completed'),
(17, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 897676, 0, 0, 0, '0000-00-00', 'Completed'),
(18, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 897676, 0, 0, 0, '0000-00-00', 'Completed'),
(19, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 897676, 0, 0, 0, '0000-00-00', 'Completed'),
(20, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 897676, 0, 0, 0, '0000-00-00', 'Pending'),
(21, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 897676, 0, 0, 0, '0000-00-00', 'Completed'),
(22, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 78767, 0, 0, 0, '0000-00-00', 'Completed'),
(23, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 78767, 0, 0, 0, '0000-00-00', 'Completed'),
(24, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 78767, 0, 0, 0, '0000-00-00', 'Completed'),
(25, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 78767, 0, 0, 0, '0000-00-00', 'Completed'),
(26, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 566787, 0, 0, 0, '0000-00-00', 'Completed'),
(27, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 566787, 0, 0, 0, '0000-00-00', 'Completed'),
(28, 2, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 566787, 0, 0, 0, '0000-00-00', 'Completed'),
(29, 4, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 566787, 0, 0, 0, '0000-00-00', 'Completed'),
(30, 4, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 45667, 0, 0, 0, '0000-00-00', 'Pending'),
(31, 4, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 566787, 0, 0, 0, '0000-00-00', 'Pending'),
(32, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 566787, 0, 0, 0, '0000-00-00', 'Pending'),
(33, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 45667, 0, 0, 0, '0000-00-00', 'Completed'),
(34, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 45667, 0, 0, 0, '0000-00-00', 'Completed'),
(35, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 45667, 0, 0, 0, '0000-00-00', 'Completed'),
(36, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 45667, 0, 0, 0, '0000-00-00', 'Completed'),
(37, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 45667, 0, 0, 0, '0000-00-00', 'Completed'),
(38, 4, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 309, 0, 0, 0, '0000-00-00', 'Completed'),
(39, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 309, 0, 0, 0, '0000-00-00', 'Completed'),
(40, 2, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 309, 0, 0, 0, '0000-00-00', 'Completed'),
(41, 4, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 309, 0, 0, 0, '0000-00-00', 'Completed'),
(42, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 309, 0, 0, 0, '0000-00-00', 'Completed'),
(43, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 309, 0, 0, 0, '0000-00-00', 'Pending'),
(44, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 309, 0, 0, 0, '0000-00-00', 'Pending'),
(45, 2, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 309, 0, 0, 0, '0000-00-00', 'Pending'),
(46, 4, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 309, 0, 0, 0, '0000-00-00', 'Completed'),
(47, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 309, 0, 0, 0, '0000-00-00', 'Completed'),
(48, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 309, 0, 0, 0, '0000-00-00', 'Pending'),
(49, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 309, 0, 0, 0, '0000-00-00', 'Pending'),
(50, 2, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 309, 0, 0, 0, '0000-00-00', 'Pending'),
(51, 4, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 309, 0, 0, 0, '0000-00-00', 'Completed'),
(52, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 309, 0, 0, 0, '0000-00-00', 'Completed'),
(53, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 309, 0, 0, 0, '0000-00-00', 'Pending'),
(54, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 309, 0, 0, 0, '0000-00-00', 'Pending'),
(55, 2, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 309, 0, 0, 0, '0000-00-00', 'Pending'),
(56, 4, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 1184938, 0, 0, 0, '0000-00-00', 'Pending'),
(57, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 1184938, 0, 0, 0, '0000-00-00', 'Pending'),
(58, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 1184938, 0, 0, 0, '0000-00-00', 'Pending'),
(59, 4, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 1184938, 0, 0, 0, '0000-00-00', 'Pending'),
(60, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 1184938, 0, 0, 0, '0000-00-00', 'Pending'),
(61, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 1184938, 0, 0, 0, '0000-00-00', 'Pending'),
(62, 4, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 1159490, 0, 0, 0, '0000-00-00', 'Completed'),
(63, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 1159490, 0, 0, 0, '0000-00-00', 'Completed'),
(64, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 1159490, 0, 0, 0, '0000-00-00', 'Completed'),
(65, 4, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30911, 0, 0, 0, '0000-00-00', 'Pending'),
(66, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30911, 0, 0, 0, '0000-00-00', 'Completed'),
(67, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30911, 0, 0, 0, '0000-00-00', 'Completed'),
(68, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30911, 0, 0, 0, '0000-00-00', 'Completed'),
(69, 2, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30911, 0, 0, 0, '0000-00-00', 'Pending'),
(70, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30911, 0, 0, 0, '0000-00-00', 'Completed'),
(71, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30911, 0, 0, 0, '0000-00-00', 'Completed'),
(72, 2, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30911, 0, 0, 0, '0000-00-00', 'Pending'),
(73, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30911, 0, 0, 0, '0000-00-00', 'Completed'),
(74, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30911, 0, 0, 0, '0000-00-00', 'Completed'),
(75, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30911, 0, 0, 0, '0000-00-00', 'Completed'),
(76, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30911, 0, 0, 0, '0000-00-00', 'Completed'),
(77, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30911, 0, 0, 0, '0000-00-00', 'Completed'),
(78, 2, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30911, 0, 0, 0, '0000-00-00', 'Pending'),
(79, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30911, 0, 0, 0, '0000-00-00', 'Completed'),
(80, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30911, 0, 0, 0, '0000-00-00', 'Completed'),
(81, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30911, 0, 0, 0, '0000-00-00', 'Completed'),
(82, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 130911, 0, 0, 0, '0000-00-00', 'Completed'),
(83, 4, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 130911, 0, 0, 0, '0000-00-00', 'Completed'),
(84, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 130911, 0, 0, 0, '0000-00-00', 'Completed'),
(85, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 130911, 0, 0, 0, '0000-00-00', 'Completed'),
(86, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 130911, 0, 0, 0, '0000-00-00', 'Completed'),
(87, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 566787, 0, 0, 0, '0000-00-00', 'Pending'),
(88, 4, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 999911, 0, 0, 0, '0000-00-00', 'Completed'),
(89, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 999911, 0, 0, 0, '0000-00-00', 'Completed'),
(90, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 999911, 0, 0, 0, '0000-00-00', 'Completed'),
(91, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 999911, 0, 0, 0, '0000-00-00', 'Completed'),
(92, 4, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30972, 0, 0, 0, '0000-00-00', 'Pending'),
(93, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30972, 0, 0, 0, '0000-00-00', 'Pending'),
(94, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30972, 0, 0, 0, '0000-00-00', 'Pending'),
(95, 3, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30972, 0, 0, 0, '0000-00-00', 'Pending'),
(96, 9, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30972, 0, 0, 0, '0000-00-00', 'Pending'),
(97, 8, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30972, 0, 0, 0, '0000-00-00', 'Pending'),
(98, 12, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30972, 0, 0, 0, '0000-00-00', 'Completed'),
(99, 9, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30972, 0, 0, 0, '0000-00-00', 'Pending'),
(100, 11, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 30972, 0, 0, 0, '0000-00-00', 'Pending'),
(101, 4, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 1100018, 0, 0, 0, '0000-00-00', 'Completed'),
(102, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 1100018, 0, 0, 0, '0000-00-00', 'Completed'),
(103, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 1100018, 0, 0, 0, '0000-00-00', 'Completed'),
(104, 4, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 1100018, 0, 0, 0, '0000-00-00', 'Completed'),
(105, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 1100018, 0, 0, 0, '0000-00-00', 'Completed'),
(106, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 1100018, 0, 0, 0, '0000-00-00', 'Completed'),
(107, 4, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 12345, 0, 0, 0, '0000-00-00', 'Completed'),
(108, 4, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 12345, 0, 0, 0, '0000-00-00', 'Completed'),
(109, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 12345, 0, 0, 0, '0000-00-00', 'Completed'),
(110, 1, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 12345, 0, 0, 0, '0000-00-00', 'Completed'),
(111, 12, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 1212, 0, 0, 0, '0000-00-00', 'Completed'),
(112, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 110003, 0, 0, 0, '0000-00-00', 'Pending'),
(113, 4, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 1122, 0, 0, 0, '0000-00-00', 'Completed'),
(114, 4, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 1122, 0, 0, 0, '0000-00-00', 'Pending'),
(115, 5, NULL, '0000-00-00', '0000-00-00', 0, 'Cheque', 1122, 0, 0, 0, '0000-00-00', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `rq_item`
--

CREATE TABLE IF NOT EXISTS `rq_item` (
  `RQItemID` int(11) NOT NULL AUTO_INCREMENT,
  `PRItemID` int(11) DEFAULT NULL,
  `requestID` int(11) DEFAULT NULL,
  `unitCost` double(15,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `itemDescription` text,
  `remarks` text,
  PRIMARY KEY (`RQItemID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=152 ;

--
-- Dumping data for table `rq_item`
--

INSERT INTO `rq_item` (`RQItemID`, `PRItemID`, `requestID`, `unitCost`, `quantity`, `itemDescription`, `remarks`) VALUES
(1, 14, 14, 98.00, 6, 'fyvbhg', NULL),
(2, 18, 22, 90.00, 0, '', NULL),
(3, 18, 23, 75.00, 0, '', NULL),
(4, 23, 26, 89.00, 34, 'chgvjh', NULL),
(5, 23, 27, 45.00, 34, 'chgvjh', NULL),
(6, 23, 28, 78.00, 34, 'chgvjh', NULL),
(7, 21, 29, 67.00, 78, 'vhvjh', NULL),
(8, 25, 33, 78.00, 4, 'vcghvh', NULL),
(9, 24, 33, 67.00, 45, 'ggvgv', NULL),
(10, 37, 38, 56.00, 2, ' 8" stainless', ''),
(11, 38, 38, 106.00, 3, '#35 Heavy duty', NULL),
(12, 37, 39, 65.00, 2, ' 8" stainless', ''),
(13, 38, 39, 107.00, 3, '#35 Heavy duty', NULL),
(14, 37, 40, 58.00, 2, '8" stainless', NULL),
(15, 38, 40, 108.00, 3, '#35 Heavy duty', NULL),
(16, 45, 38, 12.00, 2, '8" stainless', NULL),
(17, 46, 38, 56.00, 3, '#35 Heavy duty', NULL),
(18, 47, 38, 75.00, 5, 'A4, PPC s-20', NULL),
(19, 48, 38, 81.00, 10, 'Merit', NULL),
(20, 49, 38, 30.00, 50, 'UNI, Ball point', NULL),
(21, 50, 38, 60.00, 10, 'Marker pen, Pilot', NULL),
(22, 51, 38, 89.00, 2, 'ink, refill', NULL),
(23, 52, 38, 58.00, 3, 'C190, Epson colored', NULL),
(24, 53, 38, 96.00, 2, '8" stainless', NULL),
(25, 54, 38, 49.00, 3, '#35 Heavy duty', NULL),
(26, 55, 38, 48.00, 5, 'A4, PPC s-20', NULL),
(27, 56, 38, 49.00, 10, 'Merit', NULL),
(28, 45, 42, 100.00, 2, '8" stainless', NULL),
(29, 46, 42, 65.00, 3, '#35 Heavy duty', NULL),
(30, 47, 42, 89.00, 5, 'A4, PPC s-20', NULL),
(31, 48, 42, 68.00, 10, 'Merit', NULL),
(32, 49, 42, 99.00, 50, 'UNI, Ball point', NULL),
(33, 50, 42, 15.00, 10, 'Marker pen, Pilot', NULL),
(34, 51, 42, 146.00, 2, 'ink, refill', NULL),
(35, 52, 42, 8520.00, 3, 'C190, Epson colored', NULL),
(36, 53, 42, 65.00, 2, '8" stainless', NULL),
(37, 60, 62, 4832.00, 4, ' 400mg/bots', NULL),
(38, 61, 62, 837.00, 5, 'BLACK', NULL),
(39, 62, 62, 6743.00, 6, '40s/pack', NULL),
(40, 60, 63, 7438.00, 4, ' 400mg/bots', NULL),
(41, 61, 63, 8548.00, 5, 'BLACK', NULL),
(42, 62, 63, 74738.00, 6, '40s/pack', NULL),
(43, 60, 64, 7436.00, 4, ' 400mg/bots', NULL),
(44, 61, 64, 6743.00, 5, 'BLACK', NULL),
(45, 62, 64, 674.00, 6, '40s/pack', NULL),
(46, 69, 66, 1.00, 16, 'green cross 500ml ', NULL),
(47, 70, 66, 200.00, 12, 'refill, big', NULL),
(48, 71, 66, 200.00, 10, 'Cactus,A4,S-20', NULL),
(49, 69, 67, 300.00, 16, 'green cross 500ml ', NULL),
(50, 70, 67, 5.00, 12, 'refill, big', NULL),
(51, 71, 67, 205.00, 10, 'Cactus,A4,S-20', NULL),
(52, 69, 68, 5.00, 16, 'green cross 500ml ', NULL),
(53, 70, 68, 4.00, 12, 'refill, big', NULL),
(54, 71, 68, 300.00, 10, 'Cactus,A4,S-20', NULL),
(55, 79, 83, 15.00, 1, 'glade 500ml', NULL),
(56, 80, 83, 12.00, 2, 'green cross 250 ml', NULL),
(57, 81, 83, 6.00, 5, 'k-hong, ball point', NULL),
(58, 82, 83, 52.00, 6, 'AA energizer pack of 4', NULL),
(59, 83, 83, 215.00, 5, 'cactus A4, S-20', NULL),
(60, 84, 83, 3000.00, 8, 'steel cabinet plain, 4 drawers', NULL),
(61, 85, 83, 2.00, 7, 'big, refill', NULL),
(62, 86, 83, 1000.00, 9, 'multimedia keyboard', NULL),
(63, 87, 83, 9.00, 3, 'merit', NULL),
(64, 79, 82, 89.00, 1, 'glade 500ml', NULL),
(65, 80, 82, 56.00, 2, 'green cross 250 ml', NULL),
(66, 81, 82, 6.00, 5, 'k-hong, ball point', NULL),
(67, 82, 82, 253.00, 6, 'AA energizer pack of 4', NULL),
(68, 83, 82, 651.00, 5, 'cactus A4, S-20', NULL),
(69, 84, 82, 15.00, 8, 'steel cabinet plain, 4 drawers', NULL),
(70, 85, 82, 49.00, 7, 'big, refill', NULL),
(71, 86, 82, 261.00, 9, 'multimedia keyboard', NULL),
(72, 87, 82, 20.00, 3, 'merit', NULL),
(73, 79, 85, 15.00, 1, 'glade 500ml', NULL),
(74, 80, 85, 56.00, 2, 'green cross 250 ml', NULL),
(75, 81, 85, 98.00, 5, 'k-hong, ball point', NULL),
(76, 82, 85, 19.00, 6, 'AA energizer pack of 4', NULL),
(77, 83, 85, 16.00, 5, 'cactus A4, S-20', NULL),
(78, 84, 85, 645.00, 8, 'steel cabinet plain, 4 drawers', NULL),
(79, 85, 85, 98.00, 7, 'big, refill', NULL),
(80, 86, 85, 95.00, 9, 'multimedia keyboard', NULL),
(81, 87, 85, 2.00, 3, 'merit', NULL),
(82, 79, 86, 694.00, 1, 'glade 500ml', NULL),
(83, 80, 86, 61.00, 2, 'green cross 250 ml', NULL),
(84, 81, 86, 64.00, 5, 'k-hong, ball point', NULL),
(85, 82, 86, 9.00, 6, 'AA energizer pack of 4', NULL),
(86, 83, 86, 584.00, 5, 'cactus A4, S-20', NULL),
(87, 88, 88, 23.00, 1, 'Glade 500ml', NULL),
(88, 90, 88, 659.00, 2, 'Green cross 250ml', NULL),
(89, 91, 88, 95.00, 5, 'Pilot, ballpoint', NULL),
(90, 92, 88, 98.00, 7, 'Energizer AA,pack of 4', NULL),
(91, 93, 88, 16.00, 45, 'Cactus A4, S-20', NULL),
(92, 94, 88, 98.00, 4, 'Steel cabinet, Plain, 4 drawers', NULL),
(93, 95, 88, 95.00, 8, 'CD-R w/ case', NULL),
(94, 96, 88, 984.00, 5, 'orig, big', NULL),
(95, 97, 88, 694.00, 98, 'Elmers glue,50ml', NULL),
(96, 88, 89, 95.00, 1, 'Glade 500ml', NULL),
(97, 90, 89, 454.00, 2, 'Green cross 250ml', NULL),
(98, 91, 89, 654.00, 5, 'Pilot, ballpoint', NULL),
(99, 92, 89, 9.00, 7, 'Energizer AA,pack of 4', NULL),
(100, 93, 89, 9.00, 45, 'Cactus A4, S-20', NULL),
(101, 94, 89, 65.00, 4, 'Steel cabinet, Plain, 4 drawers', NULL),
(102, 95, 89, 5.00, 8, 'CD-R w/ case', NULL),
(103, 96, 89, 5.00, 5, 'orig, big', NULL),
(104, 97, 89, 5.00, 98, 'Elmers glue,50ml', NULL),
(105, 88, 90, 56.00, 1, 'Glade 500ml', NULL),
(106, 90, 90, 54.00, 2, 'Green cross 250ml', NULL),
(107, 91, 90, 87.00, 5, 'Pilot, ballpoint', NULL),
(108, 92, 90, 8.00, 7, 'Energizer AA,pack of 4', NULL),
(109, 93, 90, 53.00, 45, 'Cactus A4, S-20', NULL),
(110, 94, 90, 5423.00, 4, 'Steel cabinet, Plain, 4 drawers', NULL),
(111, 95, 90, 43.00, 8, 'CD-R w/ case', NULL),
(112, 96, 90, 4.00, 5, 'orig, big', NULL),
(113, 97, 90, 423.00, 98, 'Elmers glue,50ml', NULL),
(114, 88, 91, 42.00, 1, 'Glade 500ml', NULL),
(115, 90, 91, 42.00, 2, 'Green cross 250ml', NULL),
(116, 91, 91, 42.00, 5, 'Pilot, ballpoint', NULL),
(117, 92, 91, 42.00, 7, 'Energizer AA,pack of 4', NULL),
(118, 93, 91, 42765.00, 45, 'Cactus A4, S-20', NULL),
(119, 94, 91, 75.00, 4, 'Steel cabinet, Plain, 4 drawers', NULL),
(120, 95, 91, 5.00, 8, 'CD-R w/ case', NULL),
(121, 96, 91, 75.00, 5, 'orig, big', NULL),
(122, 97, 91, 75.00, 98, 'Elmers glue,50ml', NULL),
(123, 99, 98, 25.00, 5, 'Green cross, 250ml', NULL),
(124, 98, 98, 250.00, 5, 'glade, 320ml', NULL),
(125, 100, 98, 8.00, 10, 'Pilot, ball point', NULL),
(126, 101, 98, 105.00, 1, 'pack of 4', NULL),
(127, 102, 98, 230.00, 10, 'Cactus, A4, S-20', NULL),
(128, 103, 98, 15080.00, 1, 'Steel cabinet, 4 drawers', NULL),
(129, 104, 98, 56.00, 2, 'carbon paper, legal', NULL),
(130, 105, 98, 5.00, 6, 'big, refill', NULL),
(131, 106, 98, 178.00, 1, '13X9-1/2, 2 ply', NULL),
(132, 107, 98, 35.00, 7, 'axion, dish washing liquid', NULL),
(133, 108, 98, 60.00, 65, 'small', NULL),
(134, 109, 98, 23.00, 1, 'fax paper', NULL),
(135, 110, 98, 6.00, 3, 'green w/ tabs', NULL),
(136, 111, 98, 16.00, 6, 'green w/o tabs', NULL),
(137, 112, 98, 58.00, 9, 'btl', NULL),
(138, 113, 98, 25.00, 8, 'stainless, 8 inches', NULL),
(139, 114, 101, 89.00, 3, 'df', NULL),
(140, 114, 102, 78.00, 3, 'df', NULL),
(141, 114, 103, 90.00, 3, 'df', NULL),
(142, 131, 107, 56.00, 5, ',bk,j', NULL),
(143, 132, 107, 78.00, 2, 'mb,mbk', NULL),
(144, 132, 109, 56.00, 2, 'mb,mbk', NULL),
(145, 132, 110, 32.00, 2, 'mb,mbk', NULL),
(146, 135, 111, 111.00, 5, 'enks', NULL),
(147, 136, 111, 54.00, 4, 'ribs', NULL),
(148, 137, 111, 11.00, 60, 'twety', NULL),
(149, 138, 111, 1345.00, 8, 'weee', NULL),
(150, 141, 113, 122.00, 2, '3wrevwre', NULL),
(151, 140, 113, 131.00, 5, 'aefrdae', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `statusID` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`statusID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`statusID`, `status`) VALUES
(1, 'S'),
(2, 'I&I'),
(3, 'WM'),
(4, 'D');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `supplierID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `companyName` varchar(100) NOT NULL,
  `companyAddress` varchar(200) NOT NULL,
  `companyEmail` varchar(100) NOT NULL,
  `itemTypeID` int(11) NOT NULL,
  `companyTelNum` varchar(45) NOT NULL,
  `companyFaxNum` varchar(45) NOT NULL,
  `nameOfRepresentative` varchar(200) NOT NULL,
  `position` varchar(200) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateCreated` date NOT NULL,
  PRIMARY KEY (`supplierID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplierID`, `companyName`, `companyAddress`, `companyEmail`, `itemTypeID`, `companyTelNum`, `companyFaxNum`, `nameOfRepresentative`, `position`, `userID`, `lastUpdate`, `dateCreated`) VALUES
(5, 'CD-R King', '3rd Floor Gaisano Mall Davao City', 'cdrkinggmall@yahoo.com', 0, '09089323111', '293-456', 'May Ann Palencia', 'Supervisor', 2, '2011-04-20 16:42:20', '2011-04-21'),
(4, 'Boyet Store', 'At my side', 'boyet@emo.com', 0, '99013209892', '991328809', 'Boyet', 'Emo', 3, '2011-04-20 16:23:20', '2011-04-21'),
(3, 'Fievanni Smuggling Co', 'Left Side', 'Fievanni@emo.com', 0, '567895678', '1324', 'Fievanni', 'Tambay', 4, '2011-04-20 13:34:12', '2011-04-21'),
(2, 'Lord Gus Trade Industry', 'Here', 'LordGus@awesome.com', 99, '34980248', '234809', 'Lord Gus', 'Over Lord', 5, '2011-12-20 21:34:23', '2011-04-21'),
(1, 'DVD-R Queen', 'THERE', 'jhk', 0, 'jlk', 'jkl', 'jkl', 'jkl', 0, '0000-00-00 00:00:00', '0000-00-00'),
(8, 'RIGEL LASER TONER MARKETING ', 'DOOR No. 2 BASA BLDG.\r\n#9 JOSE PALMA GIL ST., DAVAO CITY', '', 0, '223-9156', '305-9854', '', '', 12, '2011-06-20 19:32:57', '2011-06-21'),
(9, 'NXTGEN TECHNOLOGIES INC.', 'Door # 5 Cruz Bldg., 112 Sta Ana Ave. cor Aklan St.\r\nDavao City', '', 0, '', '227-5597', '', '', 12, '2011-06-20 19:35:06', '2011-06-21'),
(10, 'INK CONNECTION TRADING', 'Cor. Recto Ave., Davao City', '', 0, '222-3702', '', 'Jean de Garcia', '', 12, '2011-06-20 19:37:38', '2011-06-21'),
(11, 'VS TAY INCORPORATED', '125 R. Magsaysay Ave., Davao City', '', 0, '221-4037', '', '', '', 12, '2011-06-20 19:42:53', '2011-06-21'),
(12, 'GH OFFICE DEPOT', '88-88A Monteverde Ave., Davao City', '', 0, '227-7313', '226-2461', '', '', 12, '2011-06-20 19:44:27', '2011-06-21');

-- --------------------------------------------------------

--
-- Table structure for table `unithistory`
--

CREATE TABLE IF NOT EXISTS `unithistory` (
  `historyID` int(11) NOT NULL AUTO_INCREMENT,
  `propertyID` int(11) NOT NULL,
  `dater` date NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`historyID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=112 ;

--
-- Dumping data for table `unithistory`
--

INSERT INTO `unithistory` (`historyID`, `propertyID`, `dater`, `description`) VALUES
(45, 14470, '2011-06-19', 'Item information is updated'),
(44, 14470, '2011-05-08', 'Item information is updated'),
(98, 7967, '2011-06-20', 'Item transferred from Año, Sharon Jean to Calag, Vicente'),
(99, 7967, '2011-06-20', 'Item information is updated'),
(100, 7967, '2011-06-20', 'Item transferred from Calag, Vicente to Año, Sharon Jean'),
(101, 7967, '2011-06-20', 'Item information is updated'),
(102, 7967, '2011-06-20', 'Item information is updated'),
(103, 7967, '2011-06-20', 'Item transferred from Año, Sharon Jean to Abad, Reynaldo'),
(104, 7967, '2011-06-20', 'Item transferred from Abad, Reynaldo to Calag, Vicente'),
(105, 7967, '2011-06-20', 'Item transferred from Vicente Calag to Abad, Reynaldo'),
(106, 7967, '2011-06-20', 'Item transferred from Abad, Reynaldo to Barriga, Ronald'),
(107, 14470, '2011-06-22', 'Item information is updated'),
(108, 14470, '2011-06-22', 'Item transferred from ,  to Año, Sharon Jean'),
(109, 14470, '2011-06-23', 'Item information is updated'),
(110, 7583, '2011-08-24', 'Item information is updated'),
(111, 2121, '2011-08-24', 'Item information is updated');

-- --------------------------------------------------------

--
-- Table structure for table `unittype`
--

CREATE TABLE IF NOT EXISTS `unittype` (
  `unitID` int(11) NOT NULL AUTO_INCREMENT,
  `unitName` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`unitID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `unittype`
--

INSERT INTO `unittype` (`unitID`, `unitName`) VALUES
(1, 'Pc.'),
(2, 'Unit'),
(3, 'Containers'),
(4, 'Cartridge'),
(5, 'Pads'),
(6, 'Kg.'),
(7, 'Grams'),
(8, 'Inches'),
(9, 'Packs'),
(10, 'Can'),
(11, 'Bots'),
(12, 'Btl'),
(13, 'Reams'),
(14, 'Box'),
(15, 'Roll'),
(16, 'Carts'),
(19, 'Carbouy'),
(20, 'vial'),
(21, 'gal.');
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
(23, 3456643, 463),
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
('9', 23),
('67', 20),
('98', 23),
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
(22, 'sadf', '2011-09-22', '2011-09-22', '', 'dfas', 'sdf', 'asdfasdf', NULL, NULL, NULL),
(23, 'sadf', '2011-09-22', '2011-09-22', '', 'dfas', 'sdf', 'asdfasdf', NULL, NULL, NULL),
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
