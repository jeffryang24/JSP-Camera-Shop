-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 06, 2017 at 10:38 PM
-- Server version: 10.0.28-MariaDB-0ubuntu0.16.04.1
-- PHP Version: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CameraShopDB`
--
CREATE DATABASE IF NOT EXISTS `CameraShopDB` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `CameraShopDB`;

-- --------------------------------------------------------

--
-- Table structure for table `Cart`
--

CREATE TABLE `Cart` (
  `UserID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `ProductWeight` int(11) NOT NULL,
  `ProductStock` int(11) NOT NULL,
  `ProductSpecification` varchar(150) NOT NULL,
  `ProductPrice` int(11) NOT NULL,
  `ProductImage` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Product`
--

INSERT INTO `Product` (`ProductID`, `ProductName`, `ProductWeight`, `ProductStock`, `ProductSpecification`, `ProductPrice`, `ProductImage`) VALUES
(1, 'Canon EOS D5', 2350, 1, 'Camera EOS D5 is an elegant camera.', 2500000, 'assets/images/C1.jpeg'),
(2, 'Canon EOS D300', 3200, 1, 'Ultimate Camera', 4500000, 'assets/images/C2.jpg'),
(3, 'Nikon D3400', 2870, 2, 'Nikon Best Camera', 4250000, 'assets/images/C3.jpg'),
(4, 'Kodak D332', 3000, 2, 'Professional Camera from Kodak', 6769000, 'assets/images/C4.jpg'),
(5, 'Nikon D5500', 3450, 6, 'Professional Camera from Nikon', 6000000, 'assets/images/C5.jpg'),
(6, 'Nikon D7000', 3200, 4, 'Ultimate performance, 50 MP, Auto Focus', 10250000, 'assets/images/C6.jpg'),
(7, 'Kodak D55', 1980, 15, 'Best Budget Kodak Camera', 2567000, 'assets/images/1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `Review`
--

CREATE TABLE `Review` (
  `ReviewID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `TextReview` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Review`
--

INSERT INTO `Review` (`ReviewID`, `UserID`, `ProductID`, `TextReview`) VALUES
(1, 3, 2, 'Kamera yang sangat cocok untuk pemula yang baru mau belajar....'),
(2, 3, 2, 'Rekomen bener!!! Ini baru beli lagi untuk adik...'),
(3, 3, 1, 'Wow!!! Tertarik saya....'),
(4, 1, 1, 'Best camera ever!!!'),
(5, 1, 2, 'Best budgeted camera for beginner!!!');

-- --------------------------------------------------------

--
-- Table structure for table `TransactionDetail`
--

CREATE TABLE `TransactionDetail` (
  `TransactionID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `TransactionDetail`
--

INSERT INTO `TransactionDetail` (`TransactionID`, `ProductID`, `Qty`) VALUES
(1, 1, 2),
(1, 2, 1),
(1, 6, 2),
(2, 2, 2),
(2, 5, 4),
(3, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `TransactionHeader`
--

CREATE TABLE `TransactionHeader` (
  `TransactionID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `TransactionStatus` varchar(100) NOT NULL,
  `TransactionDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `TransactionHeader`
--

INSERT INTO `TransactionHeader` (`TransactionID`, `UserID`, `TransactionStatus`, `TransactionDate`) VALUES
(1, 1, 'completed', '2017-01-06 22:28:25'),
(2, 3, 'waiting', '2017-01-06 22:29:12'),
(3, 1, 'waiting', '2017-01-06 22:35:45');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `UserID` int(11) NOT NULL,
  `UserFullName` varchar(50) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `UserEmail` varchar(150) NOT NULL,
  `UserPassword` varchar(150) NOT NULL,
  `UserPhone` varchar(30) NOT NULL,
  `UserBirthDate` varchar(20) NOT NULL,
  `UserRole` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`UserID`, `UserFullName`, `UserName`, `UserEmail`, `UserPassword`, `UserPhone`, `UserBirthDate`, `UserRole`) VALUES
(1, 'Endah Lakonawa', 'endah', 'lakonawaendah@gmail.com', 'Endah123', '08777333221', '29-06-1996', 'member'),
(2, 'Administrator', 'admin', 'admin@camera.com', 'Admin123', '08987766552', '10-03-1989', 'admin'),
(3, 'Clara Valencia', 'clara', 'clara.v@gmail.com', 'Clara123', '089766552125', '10-08-1996', 'member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Cart`
--
ALTER TABLE `Cart`
  ADD PRIMARY KEY (`UserID`,`ProductID`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `Review`
--
ALTER TABLE `Review`
  ADD PRIMARY KEY (`ReviewID`,`UserID`,`ProductID`);

--
-- Indexes for table `TransactionDetail`
--
ALTER TABLE `TransactionDetail`
  ADD PRIMARY KEY (`TransactionID`,`ProductID`);

--
-- Indexes for table `TransactionHeader`
--
ALTER TABLE `TransactionHeader`
  ADD PRIMARY KEY (`TransactionID`,`UserID`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`UserID`);

