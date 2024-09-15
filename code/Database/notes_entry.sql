-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2024 at 12:26 PM
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
-- Database: `notes_entry`
--

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `AccNo` varchar(255) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Author` varchar(255) DEFAULT NULL,
  `Publisher` varchar(255) DEFAULT NULL,
  `Cost` decimal(10,2) DEFAULT NULL,
  `Dept` varchar(255) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`AccNo`, `Title`, `Author`, `Publisher`, `Cost`, `Dept`, `Remark`) VALUES
('LAU13204', 'Differential equations with applications and historical notes', 'Simmons, George F.', 'CRC Press, Taylor et Francis Group', 8559.11, 'Maths', NULL),
('LAU13205', 'Differential equations with applications and historical notes', 'Simmons, George F.', 'CRC Press, Taylor et Francis Group', 8559.11, 'Maths', NULL),
('LAU13206', 'A first look at graph theory', 'Clark, John; Holton, Derek Allan', 'World scientific', 1095.00, 'Maths', NULL),
('LAU13207', 'Linear algebra', 'Hoffman, Kenneth; Kunze, Ray Alden', 'Pearson India Education Services Pvt. Ltd.', 429.00, 'Maths', NULL),
('LAU13208', 'Encyclopedia of pharmaceutical science and technology', 'Swarbrick, James', 'CRC Press, Taylor et Francis Group', 328230.00, 'Pharmacy', NULL),
('LAU13209', 'Encyclopedia of pharmaceutical science and technology', 'Swarbrick, James', 'CRC Press, Taylor et Francis Group', NULL, 'Pharmacy', NULL),
('LAU13210', 'Encyclopedia of pharmaceutical science and technology', 'Swarbrick, James', 'CRC Press, Taylor et Francis Group', NULL, 'Pharmacy', NULL),
('LAU13211', 'Encyclopedia of pharmaceutical science and technology', 'Swarbrick, James', 'CRC Press, Taylor et Francis Group', NULL, 'Pharmacy', NULL),
('LAU13212', 'Encyclopedia of pharmaceutical science and technology', 'Swarbrick, James', 'CRC Press, Taylor et Francis Group', NULL, 'Pharmacy', NULL),
('LAU13213', 'Encyclopedia of pharmaceutical science and technology', 'Swarbrick, James', 'CRC Press, Taylor et Francis Group', NULL, 'Pharmacy', NULL),
('LAU13214', 'Indian pharmacopoeia 2022', 'Government of India Ministry of Health & Family Welfare', 'The Indian Pharmacopoeia Commission', 51000.00, 'Pharmacy', NULL),
('LAU13215', 'Indian pharmacopoeia 2022', 'Government of India Ministry of Health & Family Welfare', 'The Indian Pharmacopoeia Commission', NULL, 'Pharmacy', NULL),
('LAU13216', 'Indian pharmacopoeia 2022', 'Government of India Ministry of Health & Family Welfare', 'The Indian Pharmacopoeia Commission', NULL, 'Pharmacy', NULL),
('LAU13217', 'Indian pharmacopoeia 2022', 'Government of India Ministry of Health & Family Welfare', 'The Indian Pharmacopoeia Commission', NULL, 'Pharmacy', NULL),
('LAU13218', 'Pharmaceutical statistics : practical and clinical applications', 'Bolton, Sanford; Bon, Charles', 'CRC Press, Taylor et Francis Group', 3596.00, 'Pharmacy', NULL),
('LAU13219', 'Pharmaceutical statistics : practical and clinical applications', 'Bolton, Sanford; Bon, Charles', 'CRC Press, Taylor et Francis Group', 3596.00, 'Pharmacy', NULL),
('LAU13220', 'The quality management sourcebook : an international guide to materials and resources', 'Avery, Christine; Zabel, Diane', 'Routledge Taylor & Francis Group', 3596.00, 'Pharmacy', NULL),
('LAU13221', 'The quality management sourcebook : an international guide to materials and resources', 'Avery, Christine; Zabel, Diane', 'Routledge Taylor & Francis Group', 3596.00, 'Pharmacy', NULL),
('LAU13222', '72nd Indian pharmaceutical congress, 2022: January 20-22, 2023 scientific abstracts theme - access to quality and affordable medical products', 'The Indian Hospital Pharmacists Association', 'Department of Pharmaceutical Sciences Rashtrasant Tukadoji Maharaj Nagpur University', NULL, 'Pharmacy', NULL),
('LAU13223', 'Using focus groups: theory, methodology, practice', 'Acocella, Ivana; Cataldi, Silvia', 'Sage Publications Ltd.', 3339.76, 'General', NULL),
('LAU13224', 'Research methods, statistics, and applications', 'Adams, Kathrynn Ann; McGuire, Eva K.', 'Sage Publications Inc.', 9416.00, 'General', NULL),
('LAU13225', 'Reflexive methodology: new vistas for qualitative research', 'Alvesson, Mats, Sköldberg, Kaj', 'Sage Publications Ltd.', 5428.80, 'General', NULL),
('LAU13226', 'Doing data science in R: an introduction for social scientists', 'Andrews, Mark', 'Sage Publications Ltd.', 4279.36, 'General', NULL),
('LAU13227', 'Experimental designs', 'Barak, Ariel; Bland, Matthew;  Sutherland, Alex', 'Sage Publications Ltd.', 2817.76, 'General', NULL),
('LAU13228', 'Using visual data in qualitative research', '\nBanks, Marcus', 'Sage Publications Ltd.', 3130.96, 'General', NULL),
('LAU13229', 'Integrating analyses in mixed methods research', 'Bazeley, Pat', 'Sage Publications Ltd.', 3548.56, 'General', NULL),
('LAU13230', 'Qualitative data analysis: practical strategies', 'Bazeley, Pat', 'Sage Publications Ltd.', 3444.16, 'General', NULL),
('LAU13231', 'An introduction to data analysis : quantitative, qualitative and mixed methods', 'Bergin, Tiffany', 'Sage Publications Ltd.', 3548.56, 'General', NULL),
('LAU13232', 'Grounded theory: a practical guide', 'Birks, Melanie; Mills, Jane', 'Sage Publications Ltd.', 3235.36, 'General', NULL),
('LAU13233', 'Introduction to structural equation modeling using IBM SPSS statistics and EQS', 'Blunch, Niels J.', 'Sage Publications Ltd.', 3652.96, 'General', NULL),
('LAU13234', '\nDoing interviews', 'Brinkmann, Svend; Kvale, Steinar', 'Sage Publications Ltd.', 3130.96, 'General', NULL),
('LAU13235', 'Programming with Python for social scientists', 'Brooker, Phillip D.', 'Sage Publications Ltd.', 3966.16, 'General', NULL),
('LAU13236', 'Using Microsoft Excel for social research', 'Brookfield, Charlotte', 'Sage Publications Ltd.', 3130.96, 'General', NULL),
('LAU13237', 'Conducting research interviews for business and management students', 'Cassell, Catherine', 'Sage Publications Ltd.', 2713.36, 'General', NULL),
('LAU13238', 'Situational analysis : grounded theory after the postmodern turn', 'Clarke, Adele E.; Friese, Carrie; Washburn, Rachel S.', 'Sage Publications Inc.', 5564.00, 'General', NULL),
('LAU13239', 'Doing ethnography', 'Coffey, Amanda', 'Sage Publications Ltd.', 3130.96, 'General', NULL),
('LAU13240', 'Doing action research in your own organization', 'Coghlan, David; Brannick, Teresa', 'Sage Publications Ltd.', 3444.16, 'General', NULL),
('LAU13241', 'Proposal writing: effective grantsmanship', 'Coley, Soraya M.; Scheinberg, Cynthia A.; Levites Strekalova, Yulia A.', 'Sage Publications Inc.', 3852.00, 'General', NULL),
('LAU13242', 'Qualitative longitudinal methods: researching implementation and change', 'Derrington, Mary Lynne', 'Sage Publications Inc.', 2568.00, 'General', NULL),
('LAU13243', 'Doing hHermeneutic phenomenological research: a practical guide', 'Dibley, Lesley …[et al.]', 'Sage Publications Ltd.', 3652.96, 'General', NULL),
('LAU13244', 'Conducting research literature reviews: from the internet to paper', 'Fink, Arlene', 'Sage Publications Inc.', 5564.00, 'General', NULL),
('LAU13245', 'An introduction to systematic reviews', 'Gough, David; Oliver, Sandy; Thomas, James', 'Sage Publications Ltd.', 3548.56, 'General', NULL),
('LAU13246', 'A primer on partial least squares structural equation modeling (PLS-SEM)', 'Hair, Joseph F., Jr…[et al.]', 'Sage Publications Inc.', 3852.00, 'General', NULL),
('LAU13247', 'Doing educational research: overcoming challenges in practice', 'Hoveid, Marit Honerød', 'Sage Publications Ltd.', 3130.96, 'General', NULL),
('LAU13248', 'Qualitative data analysis with Nvivo', 'Jackson, Kristi; Bazeley, Pat', 'Sage Publications Ltd.', 3652.96, 'General', NULL),
('LAU13249', 'Little quick fix: write a questionnaire', 'Kara, Helen', 'Sage Publications Ltd.', 834.16, 'General', NULL),
('LAU13250', 'Using time series to analyze long-range fractal patterns', 'Koopmans, Matthijs', 'Sage Publications Inc.', 2568.00, 'General', NULL),
('LAU13251', 'Ethics in social science research : becoming culturally responsive', 'Lahman, Maria K.E.', 'Sage Publications Inc.', 3852.00, 'General', NULL),
('LAU13252', 'Multilevel modeling', 'Luke, Douglas A.', 'Sage Publications Inc.', 2568.00, 'General', NULL),
('LAU13253', 'Little quick fix: understand probability', 'MacInnes, John', 'Sage Publications Ltd.', 834.16, 'General', NULL),
('LAU13254', 'Statistical approaches to causal analysis', 'McBee, Matthew T.', 'Sage Publications Ltd.', 2817.76, 'General', NULL),
('LAU13255', 'Action research: all you need to know', 'McNiff, Jean', 'Sage Publications Ltd.', 3548.56, 'General', NULL),
('LAU13256', 'Little quick fix: research question', 'O\'Leary, Zina', 'Sage Publications Ltd.', 834.16, 'General', NULL),
('LAU13257', 'Sequence analysis', 'Raab, Marcel; Struffolino, Emanuela', 'Sage Publications Inc.', 2568.00, 'General', NULL),
('LAU13258', 'Little quick fix: choose your methodology', 'Whiffin, Charlotte Jane', 'Sage Publications Ltd.', 834.16, 'General', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `entries2`
--

CREATE TABLE `entries2` (
  `AccNo` varchar(255) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Author` varchar(255) DEFAULT NULL,
  `Publisher` varchar(255) DEFAULT NULL,
  `Cost` decimal(10,2) DEFAULT NULL,
  `Dept` varchar(255) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `entries2`
--

INSERT INTO `entries2` (`AccNo`, `Title`, `Author`, `Publisher`, `Cost`, `Dept`, `Remark`) VALUES
('LAU13204', 'Differential equations with applications and historical notes', 'Simmons, George F.', 'CRC Press, Taylor et Francis Group', 8559.11, 'Maths', NULL),
('LAU13205', 'Differential equations with applications and historical notes', 'Simmons, George F.', 'CRC Press, Taylor et Francis Group', 8559.11, 'Maths', NULL),
('LAU13206', 'A first look at graph theory', 'Clark, John; Holton, Derek Allan', 'World scientific', 1095.00, 'Maths', NULL),
('LAU13207', 'Linear algebra', 'Hoffman, Kenneth; Kunze, Ray Alden', 'Pearson India Education Services Pvt. Ltd.', 429.00, 'Maths', NULL),
('LAU13208', 'Encyclopedia of pharmaceutical science and technology', 'Swarbrick, James', 'CRC Press, Taylor et Francis Group', 328230.00, 'Pharmacy', NULL),
('LAU13209', 'Encyclopedia of pharmaceutical science and technology', 'Swarbrick, James', 'CRC Press, Taylor et Francis Group', NULL, 'Pharmacy', NULL),
('LAU13210', 'Encyclopedia of pharmaceutical science and technology', 'Swarbrick, James', 'CRC Press, Taylor et Francis Group', NULL, 'Pharmacy', NULL),
('LAU13211', 'Encyclopedia of pharmaceutical science and technology', 'Swarbrick, James', 'CRC Press, Taylor et Francis Group', NULL, 'Pharmacy', NULL),
('LAU13212', 'Encyclopedia of pharmaceutical science and technology', 'Swarbrick, James', 'CRC Press, Taylor et Francis Group', NULL, 'Pharmacy', NULL),
('LAU13213', 'Encyclopedia of pharmaceutical science and technology', 'Swarbrick, James', 'CRC Press, Taylor et Francis Group', NULL, 'Pharmacy', NULL),
('LAU13214', 'Indian pharmacopoeia 2022', 'Government of India Ministry of Health & Family Welfare', 'The Indian Pharmacopoeia Commission', 51000.00, 'Pharmacy', NULL),
('LAU13215', 'Indian pharmacopoeia 2022', 'Government of India Ministry of Health & Family Welfare', 'The Indian Pharmacopoeia Commission', NULL, 'Pharmacy', NULL),
('LAU13216', 'Indian pharmacopoeia 2022', 'Government of India Ministry of Health & Family Welfare', 'The Indian Pharmacopoeia Commission', NULL, 'Pharmacy', NULL),
('LAU13217', 'Indian pharmacopoeia 2022', 'Government of India Ministry of Health & Family Welfare', 'The Indian Pharmacopoeia Commission', NULL, 'Pharmacy', NULL),
('LAU13218', 'Pharmaceutical statistics : practical and clinical applications', 'Bolton, Sanford; Bon, Charles', 'CRC Press, Taylor et Francis Group', 3596.00, 'Pharmacy', NULL),
('LAU13219', 'Pharmaceutical statistics : practical and clinical applications', 'Bolton, Sanford; Bon, Charles', 'CRC Press, Taylor et Francis Group', 3596.00, 'Pharmacy', NULL),
('LAU13220', 'The quality management sourcebook : an international guide to materials and resources', 'Avery, Christine; Zabel, Diane', 'Routledge Taylor & Francis Group', 3596.00, 'Pharmacy', NULL),
('LAU13221', 'The quality management sourcebook : an international guide to materials and resources', 'Avery, Christine; Zabel, Diane', 'Routledge Taylor & Francis Group', 3596.00, 'Pharmacy', NULL),
('LAU13222', '72nd Indian pharmaceutical congress, 2022: January 20-22, 2023 scientific abstracts theme - access to quality and affordable medical products', 'The Indian Hospital Pharmacists Association', 'Department of Pharmaceutical Sciences Rashtrasant Tukadoji Maharaj Nagpur University', NULL, 'Pharmacy', NULL),
('LAU13223', 'Using focus groups: theory, methodology, practice', 'Acocella, Ivana; Cataldi, Silvia', 'Sage Publications Ltd.', 3339.76, 'General', NULL),
('LAU13224', 'Research methods, statistics, and applications', 'Adams, Kathrynn Ann; McGuire, Eva K.', 'Sage Publications Inc.', 9416.00, 'General', NULL),
('LAU13225', 'Reflexive methodology: new vistas for qualitative research', 'Alvesson, Mats, Sköldberg, Kaj', 'Sage Publications Ltd.', 5428.80, 'General', NULL),
('LAU13226', 'Doing data science in R: an introduction for social scientists', 'Andrews, Mark', 'Sage Publications Ltd.', 4279.36, 'General', NULL),
('LAU13227', 'Experimental designs', 'Barak, Ariel; Bland, Matthew;  Sutherland, Alex', 'Sage Publications Ltd.', 2817.76, 'General', NULL),
('LAU13228', 'Using visual data in qualitative research', '\nBanks, Marcus', 'Sage Publications Ltd.', 3130.96, 'General', NULL),
('LAU13229', 'Integrating analyses in mixed methods research', 'Bazeley, Pat', 'Sage Publications Ltd.', 3548.56, 'General', NULL),
('LAU13230', 'Qualitative data analysis: practical strategies', 'Bazeley, Pat', 'Sage Publications Ltd.', 3444.16, 'General', NULL),
('LAU13231', 'An introduction to data analysis : quantitative, qualitative and mixed methods', 'Bergin, Tiffany', 'Sage Publications Ltd.', 3548.56, 'General', NULL),
('LAU13232', 'Grounded theory: a practical guide', 'Birks, Melanie; Mills, Jane', 'Sage Publications Ltd.', 3235.36, 'General', NULL),
('LAU13233', 'Introduction to structural equation modeling using IBM SPSS statistics and EQS', 'Blunch, Niels J.', 'Sage Publications Ltd.', 3652.96, 'General', NULL),
('LAU13234', '\nDoing interviews', 'Brinkmann, Svend; Kvale, Steinar', 'Sage Publications Ltd.', 3130.96, 'General', NULL),
('LAU13235', 'Programming with Python for social scientists', 'Brooker, Phillip D.', 'Sage Publications Ltd.', 3966.16, 'General', NULL),
('LAU13236', 'Using Microsoft Excel for social research', 'Brookfield, Charlotte', 'Sage Publications Ltd.', 3130.96, 'General', NULL),
('LAU13237', 'Conducting research interviews for business and management students', 'Cassell, Catherine', 'Sage Publications Ltd.', 2713.36, 'General', NULL),
('LAU13238', 'Situational analysis : grounded theory after the postmodern turn', 'Clarke, Adele E.; Friese, Carrie; Washburn, Rachel S.', 'Sage Publications Inc.', 5564.00, 'General', NULL),
('LAU13239', 'Doing ethnography', 'Coffey, Amanda', 'Sage Publications Ltd.', 3130.96, 'General', NULL),
('LAU13240', 'Doing action research in your own organization', 'Coghlan, David; Brannick, Teresa', 'Sage Publications Ltd.', 3444.16, 'General', NULL),
('LAU13241', 'Proposal writing: effective grantsmanship', 'Coley, Soraya M.; Scheinberg, Cynthia A.; Levites Strekalova, Yulia A.', 'Sage Publications Inc.', 3852.00, 'General', NULL),
('LAU13242', 'Qualitative longitudinal methods: researching implementation and change', 'Derrington, Mary Lynne', 'Sage Publications Inc.', 2568.00, 'General', NULL),
('LAU13243', 'Doing hHermeneutic phenomenological research: a practical guide', 'Dibley, Lesley …[et al.]', 'Sage Publications Ltd.', 3652.96, 'General', NULL),
('LAU13244', 'Conducting research literature reviews: from the internet to paper', 'Fink, Arlene', 'Sage Publications Inc.', 5564.00, 'General', NULL),
('LAU13245', 'An introduction to systematic reviews', 'Gough, David; Oliver, Sandy; Thomas, James', 'Sage Publications Ltd.', 3548.56, 'General', NULL),
('LAU13246', 'A primer on partial least squares structural equation modeling (PLS-SEM)', 'Hair, Joseph F., Jr…[et al.]', 'Sage Publications Inc.', 3852.00, 'General', NULL),
('LAU13247', 'Doing educational research: overcoming challenges in practice', 'Hoveid, Marit Honerød', 'Sage Publications Ltd.', 3130.96, 'General', NULL),
('LAU13248', 'Qualitative data analysis with Nvivo', 'Jackson, Kristi; Bazeley, Pat', 'Sage Publications Ltd.', 3652.96, 'General', NULL),
('LAU13249', 'Little quick fix: write a questionnaire', 'Kara, Helen', 'Sage Publications Ltd.', 834.16, 'General', NULL),
('LAU13250', 'Using time series to analyze long-range fractal patterns', 'Koopmans, Matthijs', 'Sage Publications Inc.', 2568.00, 'General', NULL),
('LAU13251', 'Ethics in social science research : becoming culturally responsive', 'Lahman, Maria K.E.', 'Sage Publications Inc.', 3852.00, 'General', NULL),
('LAU13252', 'Multilevel modeling', 'Luke, Douglas A.', 'Sage Publications Inc.', 2568.00, 'General', NULL),
('LAU13253', 'Little quick fix: understand probability', 'MacInnes, John', 'Sage Publications Ltd.', 834.16, 'General', NULL),
('LAU13254', 'Statistical approaches to causal analysis', 'McBee, Matthew T.', 'Sage Publications Ltd.', 2817.76, 'General', NULL),
('LAU13255', 'Action research: all you need to know', 'McNiff, Jean', 'Sage Publications Ltd.', 3548.56, 'General', NULL),
('LAU13256', 'Little quick fix: research question', 'O\'Leary, Zina', 'Sage Publications Ltd.', 834.16, 'General', NULL),
('LAU13257', 'Sequence analysis', 'Raab, Marcel; Struffolino, Emanuela', 'Sage Publications Inc.', 2568.00, 'General', NULL),
('LAU13258', 'Little quick fix: choose your methodology', 'Whiffin, Charlotte Jane', 'Sage Publications Ltd.', 834.16, 'General', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `general`
-- (See below for the actual view)
--
CREATE TABLE `general` (
`Title` varchar(255)
,`AccNo` varchar(255)
,`Dept` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `maths`
-- (See below for the actual view)
--
CREATE TABLE `maths` (
`Title` varchar(255)
,`AccNo` varchar(255)
,`Dept` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pharmacy`
-- (See below for the actual view)
--
CREATE TABLE `pharmacy` (
`Title` varchar(255)
,`AccNo` varchar(255)
,`Dept` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `general`
--
DROP TABLE IF EXISTS `general`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `general`  AS SELECT `entries`.`Title` AS `Title`, `entries`.`AccNo` AS `AccNo`, `entries`.`Dept` AS `Dept` FROM `entries` WHERE `entries`.`Dept` = 'General' ;

-- --------------------------------------------------------

--
-- Structure for view `maths`
--
DROP TABLE IF EXISTS `maths`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `maths`  AS SELECT `entries`.`Title` AS `Title`, `entries`.`AccNo` AS `AccNo`, `entries`.`Dept` AS `Dept` FROM `entries` WHERE `entries`.`Dept` = 'Maths' ;

-- --------------------------------------------------------

--
-- Structure for view `pharmacy`
--
DROP TABLE IF EXISTS `pharmacy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pharmacy`  AS SELECT `entries`.`Title` AS `Title`, `entries`.`AccNo` AS `AccNo`, `entries`.`Dept` AS `Dept` FROM `entries` WHERE `entries`.`Dept` = 'Pharmacy' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`AccNo`);

--
-- Indexes for table `entries2`
--
ALTER TABLE `entries2`
  ADD PRIMARY KEY (`AccNo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
