-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2024 at 12:27 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `notes_reports`
--

-- --------------------------------------------------------

--
-- Table structure for table `foet_2023_circulation_usage`
--

CREATE TABLE `foet_2023_circulation_usage` (
  `Month` text DEFAULT NULL,
  `Staff` bigint(20) DEFAULT NULL,
  `Students` bigint(20) DEFAULT NULL,
  `Total` bigint(20) DEFAULT NULL,
  `Year` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foet_2023_circulation_usage`
--

INSERT INTO `foet_2023_circulation_usage` (`Month`, `Staff`, `Students`, `Total`, `Year`) VALUES
('January', 67, 399, 466, 2023),
('February', 46, 429, 475, 2023),
('March', 24, 358, 382, 2023),
('April', 20, 396, 416, 2023),
('May', 48, 213, 261, 2023),
('June', 26, 228, 254, 2023),
('July', 53, 489, 542, 2023),
('August', 45, 668, 713, 2023),
('September', 34, 414, 448, 2023),
('October', 35, 456, 491, 2023),
('November', 13, 317, 330, 2023),
('December', 32, 365, 397, 2023);

-- --------------------------------------------------------

--
-- Table structure for table `foet_2023_e_library_usage`
--

CREATE TABLE `foet_2023_e_library_usage` (
  `Month` text DEFAULT NULL,
  `Staff` bigint(20) DEFAULT NULL,
  `Students` bigint(20) DEFAULT NULL,
  `Total` bigint(20) DEFAULT NULL,
  `Year` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foet_2023_e_library_usage`
--

INSERT INTO `foet_2023_e_library_usage` (`Month`, `Staff`, `Students`, `Total`, `Year`) VALUES
('January', 0, 612, 612, 2023),
('February', 0, 532, 532, 2023),
('March', 0, 495, 495, 2023),
('April', 1, 326, 327, 2023),
('May', 0, 260, 260, 2023),
('June', 0, 216, 216, 2023),
('July', 0, 376, 376, 2023),
('August', 0, 585, 585, 2023),
('September', 0, 327, 327, 2023),
('October', 0, 576, 576, 2023),
('November', 0, 383, 383, 2023),
('December', 0, 496, 496, 2023);

-- --------------------------------------------------------

--
-- Table structure for table `foet_2023_library_footfalls`
--

CREATE TABLE `foet_2023_library_footfalls` (
  `Month` text DEFAULT NULL,
  `Staff` bigint(20) DEFAULT NULL,
  `Students` bigint(20) DEFAULT NULL,
  `Total` bigint(20) DEFAULT NULL,
  `Year` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foet_2023_library_footfalls`
--

INSERT INTO `foet_2023_library_footfalls` (`Month`, `Staff`, `Students`, `Total`, `Year`) VALUES
('January', 34, 1900, 1934, 2023),
('February', 45, 1657, 1702, 2023),
('March', 23, 1656, 1679, 2023),
('April', 34, 1767, 1801, 2023),
('May', 21, 2271, 2292, 2023),
('June', 5, 1671, 1676, 2023),
('July', 15, 2160, 2175, 2023),
('August', 15, 3162, 3177, 2023),
('September', 3, 2424, 2427, 2023),
('October', 7, 2875, 2882, 2023),
('November', 7, 1085, 1092, 2023),
('December', 9, 1402, 1411, 2023);

-- --------------------------------------------------------

--
-- Table structure for table `foet_2023_overall_usage_analysis`
--

CREATE TABLE `foet_2023_overall_usage_analysis` (
  `Usage.type` text DEFAULT NULL,
  `Staff` bigint(20) DEFAULT NULL,
  `Students` bigint(20) DEFAULT NULL,
  `Total` bigint(20) DEFAULT NULL,
  `Year` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foet_2023_overall_usage_analysis`
--

INSERT INTO `foet_2023_overall_usage_analysis` (`Usage.type`, `Staff`, `Students`, `Total`, `Year`) VALUES
('Footfall', 218, 24030, 24248, 2023),
('Circulation', 443, 4732, 5175, 2023),
('Reading room', 3, 25267, 25270, 2023),
('E-Library', 1, 5184, 5185, 2023),
('Newspaper/ Periodicals', 7, 435, 442, 2023),
('Reference', 0, 325, 325, 2023);

-- --------------------------------------------------------

--
-- Table structure for table `foet_2023_periodical_and_newspaper_usage`
--

CREATE TABLE `foet_2023_periodical_and_newspaper_usage` (
  `Month` text DEFAULT NULL,
  `Staff` bigint(20) DEFAULT NULL,
  `Students` bigint(20) DEFAULT NULL,
  `Total` bigint(20) DEFAULT NULL,
  `Year` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foet_2023_periodical_and_newspaper_usage`
--

INSERT INTO `foet_2023_periodical_and_newspaper_usage` (`Month`, `Staff`, `Students`, `Total`, `Year`) VALUES
('January', 2, 78, 80, 2023),
('February', 0, 37, 37, 2023),
('March', NULL, 39, 39, 2023),
('April', NULL, 34, 34, 2023),
('May', 1, 32, 33, 2023),
('June', NULL, 21, 21, 2023),
('July', NULL, 44, 44, 2023),
('August', 1, 56, 57, 2023),
('September', NULL, 29, 29, 2023),
('October', NULL, 33, 33, 2023),
('November', 1, 15, 16, 2023),
('December', 2, 17, 19, 2023);

-- --------------------------------------------------------

--
-- Table structure for table `foet_2023_reference_usage`
--

CREATE TABLE `foet_2023_reference_usage` (
  `Month` text DEFAULT NULL,
  `Staff` bigint(20) DEFAULT NULL,
  `Students` bigint(20) DEFAULT NULL,
  `Total` bigint(20) DEFAULT NULL,
  `Year` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foet_2023_reference_usage`
--

INSERT INTO `foet_2023_reference_usage` (`Month`, `Staff`, `Students`, `Total`, `Year`) VALUES
('January', 0, 80, 80, 2023),
('February', 0, 28, 28, 2023),
('March', 0, 17, 17, 2023),
('April', 0, 57, 57, 2023),
('May', 0, 2, 2, 2023),
('June', 0, 47, 47, 2023),
('July', 0, 55, 55, 2023),
('August', 0, 19, 19, 2023),
('September', 0, 0, 0, 2023),
('October', 0, 8, 8, 2023),
('November', 0, 0, 0, 2023),
('December', 0, 12, 12, 2023);

-- --------------------------------------------------------

--
-- Table structure for table `foet_2023_separate_reading_room_usage`
--

CREATE TABLE `foet_2023_separate_reading_room_usage` (
  `Month` text DEFAULT NULL,
  `Staff` bigint(20) DEFAULT NULL,
  `Students` bigint(20) DEFAULT NULL,
  `Total` bigint(20) DEFAULT NULL,
  `Year` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foet_2023_separate_reading_room_usage`
--

INSERT INTO `foet_2023_separate_reading_room_usage` (`Month`, `Staff`, `Students`, `Total`, `Year`) VALUES
('January', 0, 3290, 3290, 2023),
('February', 0, 2812, 2812, 2023),
('March', 0, 2477, 2477, 2023),
('April', 1, 2791, 2792, 2023),
('May', 0, 2163, 2163, 2023),
('June', 0, 1762, 1762, 2023),
('July', 0, 2102, 2102, 2023),
('August', 2, 1926, 1928, 2023),
('September', 0, 1189, 1189, 2023),
('October', 0, 1963, 1963, 2023),
('November', 0, 1364, 1364, 2023),
('December', 0, 1428, 1428, 2023);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
