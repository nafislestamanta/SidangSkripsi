-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2022 at 06:40 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skripsi`
--

-- --------------------------------------------------------

--
-- Table structure for table `basis_pengetahuan`
--

CREATE TABLE `basis_pengetahuan` (
  `kode_pengetahuan` varchar(4) NOT NULL,
  `kode_hp` varchar(4) NOT NULL,
  `kode_gejala` varchar(4) NOT NULL,
  `mb` double NOT NULL,
  `md` double NOT NULL,
  `cf` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `basis_pengetahuan`
--

INSERT INTO `basis_pengetahuan` (`kode_pengetahuan`, `kode_hp`, `kode_gejala`, `mb`, `md`, `cf`) VALUES
('BP03', 'HP02', 'GJ01', 0.6, 0.2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `gejala`
--

CREATE TABLE `gejala` (
  `kode_gejala` varchar(4) NOT NULL,
  `nama_gejala` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`kode_gejala`, `nama_gejala`) VALUES
('GJ01', 'biintik okee');

-- --------------------------------------------------------

--
-- Table structure for table `hamapenyakit`
--

CREATE TABLE `hamapenyakit` (
  `kode_hp` varchar(4) NOT NULL,
  `nama_hp` varchar(100) NOT NULL,
  `kategori` enum('Hama','Penyakit') NOT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hamapenyakit`
--

INSERT INTO `hamapenyakit` (`kode_hp`, `nama_hp`, `kategori`, `gambar`) VALUES
('HP02', 'sdfsa', 'Penyakit', 'hatomugi_hatomugi-skin-conditioner-conditioning-gel-toner-lotion--500-ml-_full01.jpg'),
('HP03', 'Polres ni', 'Hama', 'a23b92c4fed0f1415a01a19852ccb94f.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `solusi`
--

CREATE TABLE `solusi` (
  `kode_solusi` varchar(4) NOT NULL,
  `kode_hp` varchar(4) NOT NULL,
  `solusi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `solusi`
--

INSERT INTO `solusi` (`kode_solusi`, `kode_hp`, `solusi`) VALUES
('SL02', 'HP03', 'asdfdasdfaqweqwe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `basis_pengetahuan`
--
ALTER TABLE `basis_pengetahuan`
  ADD PRIMARY KEY (`kode_pengetahuan`),
  ADD KEY `kd_hp` (`kode_hp`),
  ADD KEY `kd_gejala` (`kode_gejala`);

--
-- Indexes for table `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`kode_gejala`);

--
-- Indexes for table `hamapenyakit`
--
ALTER TABLE `hamapenyakit`
  ADD PRIMARY KEY (`kode_hp`);

--
-- Indexes for table `solusi`
--
ALTER TABLE `solusi`
  ADD PRIMARY KEY (`kode_solusi`),
  ADD KEY `kd_hp` (`kode_hp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
