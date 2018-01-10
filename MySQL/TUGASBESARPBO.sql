-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 10, 2018 at 12:16 PM
-- Server version: 5.7.20-0ubuntu0.17.10.1
-- PHP Version: 7.1.11-0ubuntu0.17.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `TUGASBESARPBO`
--

-- --------------------------------------------------------

--
-- Table structure for table `CUSTOMER`
--

CREATE TABLE `CUSTOMER` (
  `NIK` varchar(16) NOT NULL,
  `NAMA_CUSTOMER` varchar(35) DEFAULT NULL,
  `ALAMAT_CUSTOMER` varchar(45) DEFAULT NULL,
  `NO_HP_CUSTOMER` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CUSTOMER`
--

INSERT INTO `CUSTOMER` (`NIK`, `NAMA_CUSTOMER`, `ALAMAT_CUSTOMER`, `NO_HP_CUSTOMER`) VALUES
('3273141203980007', 'IBNU', 'JL. LEMAHNEUNDEUT II', '08999915190');

-- --------------------------------------------------------

--
-- Table structure for table `PAKET_HARGA`
--

CREATE TABLE `PAKET_HARGA` (
  `ID_PAKETHARGA` varchar(3) NOT NULL,
  `NAMA_PAKETHARGA` varchar(10) DEFAULT NULL,
  `JENIS` varchar(25) DEFAULT NULL,
  `BERAT` int(2) DEFAULT NULL,
  `LAMA_PENCUCIAN` int(1) DEFAULT NULL,
  `HARGA` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PETUGAS`
--

CREATE TABLE `PETUGAS` (
  `ID_PETUGAS` varchar(5) NOT NULL,
  `NAMA_PETUGAS` varchar(35) DEFAULT NULL,
  `ALAMAT_PETUGAS` varchar(45) DEFAULT NULL,
  `NO_HP_PETUGAS` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PETUGAS`
--

INSERT INTO `PETUGAS` (`ID_PETUGAS`, `NAMA_PETUGAS`, `ALAMAT_PETUGAS`, `NO_HP_PETUGAS`) VALUES
('00001', 'NUR', 'JL. BAPA SUPI', '085722596720'),
('00002', 'SRI UTAMI', 'JL. LENGKONG BESAR NO 72', '081288758047');

-- --------------------------------------------------------

--
-- Table structure for table `TRANSAKSI`
--

CREATE TABLE `TRANSAKSI` (
  `NO_NOTA` varchar(6) NOT NULL,
  `NIK` varchar(16) NOT NULL,
  `ID_PETUGAS` varchar(5) NOT NULL,
  `ID_PAKETHARGA` varchar(3) NOT NULL,
  `NAMA_CUSTOMER` varchar(35) NOT NULL,
  `TANGGAL_MASUK` date NOT NULL,
  `TANGGAL_KELUAR` date NOT NULL,
  `TOTAL` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CUSTOMER`
--
ALTER TABLE `CUSTOMER`
  ADD PRIMARY KEY (`NIK`);

--
-- Indexes for table `PAKET_HARGA`
--
ALTER TABLE `PAKET_HARGA`
  ADD PRIMARY KEY (`ID_PAKETHARGA`);

--
-- Indexes for table `PETUGAS`
--
ALTER TABLE `PETUGAS`
  ADD PRIMARY KEY (`ID_PETUGAS`);

--
-- Indexes for table `TRANSAKSI`
--
ALTER TABLE `TRANSAKSI`
  ADD PRIMARY KEY (`NO_NOTA`),
  ADD KEY `NIK` (`NIK`),
  ADD KEY `ID_PETUGAS` (`ID_PETUGAS`),
  ADD KEY `ID_PAKETHARGA` (`ID_PAKETHARGA`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `TRANSAKSI`
--
ALTER TABLE `TRANSAKSI`
  ADD CONSTRAINT `TRANSAKSI_ibfk_1` FOREIGN KEY (`NIK`) REFERENCES `CUSTOMER` (`NIK`),
  ADD CONSTRAINT `TRANSAKSI_ibfk_2` FOREIGN KEY (`ID_PETUGAS`) REFERENCES `PETUGAS` (`ID_PETUGAS`),
  ADD CONSTRAINT `TRANSAKSI_ibfk_3` FOREIGN KEY (`ID_PAKETHARGA`) REFERENCES `PAKET_HARGA` (`ID_PAKETHARGA`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
