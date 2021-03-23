-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2021 at 09:55 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_restoran`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_daftar`
--

CREATE TABLE `tbl_daftar` (
  `KodePendaftaran` int(8) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `Alamat` varchar(255) NOT NULL,
  `Tanggal` date NOT NULL,
  `Telepone` int(20) NOT NULL,
  `Jenis_kelamin` char(255) NOT NULL,
  `Password` int(255) NOT NULL,
  `Prioritas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_daftar`
--

INSERT INTO `tbl_daftar` (`KodePendaftaran`, `Nama`, `Alamat`, `Tanggal`, `Telepone`, `Jenis_kelamin`, `Password`, `Prioritas`) VALUES
(20101034, 'Akbar Usamah', 'BTN Lepadi, Nusa Tenggara Barat', '2017-09-14', 8528371, 'Laki - laki', 0, 'admin'),
(20101039, 'agung yudatama', 'bekasi', '2017-08-23', 8283524, 'Laki-Laki', 101039, 'Pelayan'),
(20101040, 'egia m sahbana', 'banyumas', '2004-01-12', 8725734, 'Laki-Laki', 101040, 'Kasir'),
(20101042, 'naruto', 'konoha', '2021-06-02', 1111111111, 'Perempuan', 101042, 'Pelayan'),
(20101043, 'sasuke', 'purwokerto', '2019-11-20', 22222222, 'Laki-Laki', 101043, 'Kasir'),
(20101044, 'Akbar usamah', 'Dompu', '2019-10-07', 342323924, 'Laki-Laki', 101044, 'Manager'),
(20101045, 'ucup', 'sjkadnjksad', '2019-11-20', 2147483647, 'Laki-Laki', 101045, 'Kasir'),
(20101046, 'ujang', 'bekasi', '2019-10-30', 27323624, 'Laki-Laki', 101046, 'Manager'),
(20101047, 'akbar usamah', 'nusa tenggara barat', '2019-11-13', 2323232, 'Laki-Laki', 101047, 'Pelayan'),
(20101048, 'pinka yulia', 'jakar', '2019-11-15', 2323231, 'Perempuan', 101048, 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_detailorder`
--

CREATE TABLE `tbl_detailorder` (
  `KodePesanan` int(10) DEFAULT NULL,
  `KodeMakanan` varchar(6) NOT NULL,
  `NamaMakanan` varchar(255) NOT NULL,
  `HargaMakanan` int(11) NOT NULL,
  `JumlahMakanan` int(11) NOT NULL,
  `TotalMakanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_detailpembayaran`
--

CREATE TABLE `tbl_detailpembayaran` (
  `KodePembayaran` int(8) NOT NULL,
  `KodePesanan` int(10) NOT NULL,
  `NamaPelanggan` varchar(255) NOT NULL,
  `NoMeja` int(2) NOT NULL,
  `tanggal` date NOT NULL,
  `NamaKasir` varchar(255) NOT NULL,
  `KodeMakanan` varchar(6) NOT NULL,
  `NamaMakanan` varchar(255) NOT NULL,
  `HargaMakanan` int(255) NOT NULL,
  `JumlahMakanan` int(255) NOT NULL,
  `TotalMakanan` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_detailpembayaran`
--

INSERT INTO `tbl_detailpembayaran` (`KodePembayaran`, `KodePesanan`, `NamaPelanggan`, `NoMeja`, `tanggal`, `NamaKasir`, `KodeMakanan`, `NamaMakanan`, `HargaMakanan`, `JumlahMakanan`, `TotalMakanan`) VALUES
(3100023, 20200009, 'lola', 2, '2021-01-18', 'ToolStripStatusLabel2', 'MKN002', 'Bakso', 25000, 2, 50000),
(3100023, 20200009, 'lola', 2, '2021-01-18', 'ToolStripStatusLabel2', 'MKN001', 'Nasi Goreng', 20000, 1, 20000),
(3100023, 20200009, 'lola', 2, '2021-01-18', 'ToolStripStatusLabel2', '', '', 0, 0, 0),
(3100024, 20200009, 'udin', 10, '2021-01-18', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 2, 40000),
(3100024, 20200009, 'udin', 10, '2021-01-18', 'egia m sahbana', 'MKN002', 'Bakso', 25000, 1, 25000),
(3100024, 20200009, 'udin', 10, '2021-01-18', 'egia m sahbana', '', '', 0, 0, 0),
(3100025, 20200008, 'josua iskandar', 4, '2021-01-18', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 2, 20000),
(3100025, 20200008, 'josua iskandar', 4, '2021-01-18', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 2, 40000),
(3100025, 20200008, 'josua iskandar', 4, '2021-01-18', 'egia m sahbana', '', '', 0, 0, 0),
(3100026, 20200007, 'rosa', 9, '2021-01-18', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 2, 20000),
(3100026, 20200007, 'rosa', 9, '2021-01-18', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 2, 40000),
(3100026, 20200007, 'rosa', 9, '2021-01-18', 'egia m sahbana', '', '', 0, 0, 0),
(3100027, 20200006, 'roky', 8, '2021-01-18', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 3, 60000),
(3100027, 20200006, 'roky', 8, '2021-01-18', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 3, 30000),
(3100027, 20200006, 'roky', 8, '2021-01-18', 'egia m sahbana', '', '', 0, 0, 0),
(3100028, 20200005, 'rosi', 9, '2021-01-18', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 56, 1120000),
(3100028, 20200005, 'rosi', 9, '2021-01-18', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 21, 210000),
(3100028, 20200005, 'rosi', 9, '2021-01-18', 'egia m sahbana', '', '', 0, 0, 0),
(3100029, 20200003, 'Budi', 5, '2021-01-18', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 23, 230000),
(3100029, 20200003, 'Budi', 5, '2021-01-18', 'egia m sahbana', 'MKN002', 'Bakso', 25000, 3, 75000),
(3100029, 20200003, 'Budi', 5, '2021-01-18', 'egia m sahbana', '', '', 0, 0, 0),
(3100030, 20200002, 'Akbar usamah', 5, '2021-01-18', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 32, 640000),
(3100030, 20200002, 'Akbar usamah', 5, '2021-01-18', 'egia m sahbana', 'MKn002', 'Bakso', 25000, 12, 300000),
(3100030, 20200002, 'Akbar usamah', 5, '2021-01-18', 'egia m sahbana', 'MKN002', 'Bakso', 25000, 34, 850000),
(3100030, 20200002, 'Akbar usamah', 5, '2021-01-18', 'egia m sahbana', '', '', 0, 0, 0),
(3100031, 20200002, 'lolas', 6, '2021-01-18', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 23, 460000),
(3100031, 20200002, 'lolas', 6, '2021-01-18', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 1, 10000),
(3100031, 20200002, 'lolas', 6, '2021-01-18', 'egia m sahbana', '', '', 0, 0, 0),
(3100032, 20200002, 'surga', 8, '2021-01-18', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 2, 40000),
(3100032, 20200002, 'surga', 8, '2021-01-18', 'egia m sahbana', 'MKN002', 'Bakso', 25000, 2, 50000),
(3100032, 20200002, 'surga', 8, '2021-01-18', 'egia m sahbana', '', '', 0, 0, 0),
(3100033, 20200002, 'suara', 9, '2021-01-18', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 21, 210000),
(3100033, 20200002, 'suara', 9, '2021-01-18', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 12, 240000),
(3100033, 20200002, 'suara', 9, '2021-01-18', 'egia m sahbana', '', '', 0, 0, 0),
(3100034, 20200002, 'alif', 7, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 23, 230000),
(3100034, 20200002, 'alif', 7, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 1, 20000),
(3100034, 20200002, 'alif', 7, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100035, 20200002, 'sonia', 4, '2021-01-19', 'egia m sahbana', 'MKN002', 'Bakso', 25000, 1, 25000),
(3100035, 20200002, 'sonia', 4, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 2, 40000),
(3100035, 20200002, 'sonia', 4, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100036, 20200002, 'sosia', 5, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 12, 120000),
(3100036, 20200002, 'sosia', 5, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 3, 30000),
(3100036, 20200002, 'sosia', 5, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100037, 20200002, 'rosa', 4, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 2, 40000),
(3100037, 20200002, 'rosa', 4, '2021-01-19', 'egia m sahbana', 'MKN002', 'Bakso', 25000, 21, 525000),
(3100037, 20200002, 'rosa', 4, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100038, 20200002, 'usamah', 7, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 12, 120000),
(3100038, 20200002, 'usamah', 7, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 12, 240000),
(3100038, 20200002, 'usamah', 7, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100039, 20200002, 'sanusi', 8, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 12, 240000),
(3100039, 20200002, 'sanusi', 8, '2021-01-19', 'egia m sahbana', 'MKN002', 'Bakso', 25000, 1, 25000),
(3100039, 20200002, 'sanusi', 8, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100040, 20200002, 'lali', 5, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 12, 120000),
(3100040, 20200002, 'lali', 5, '2021-01-19', 'egia m sahbana', 'mkn002', 'Bakso', 25000, 41, 1025000),
(3100040, 20200002, 'lali', 5, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100041, 20200002, 'usamah', 5, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 21, 420000),
(3100041, 20200002, 'usamah', 5, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 5, 50000),
(3100041, 20200002, 'usamah', 5, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100042, 20200002, 'alif', 5, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 12, 120000),
(3100042, 20200002, 'alif', 5, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 1, 20000),
(3100042, 20200002, 'alif', 5, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100043, 20200002, 'usamah', 5, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 2, 20000),
(3100043, 20200002, 'usamah', 5, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 2, 40000),
(3100043, 20200002, 'usamah', 5, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100044, 20200002, 'saputra', 4, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 21, 420000),
(3100044, 20200002, 'saputra', 4, '2021-01-19', 'egia m sahbana', 'MKN002', 'Bakso', 25000, 12, 300000),
(3100044, 20200002, 'saputra', 4, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100045, 20200002, 'dsadsad', 3, '2021-01-19', 'egia m sahbana', 'mkn002', 'Bakso', 25000, 21, 525000),
(3100045, 20200002, 'dsadsad', 3, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 21, 420000),
(3100045, 20200002, 'dsadsad', 3, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100046, 20200002, 'dnsakjdsa', 8, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 2, 40000),
(3100046, 20200002, 'dnsakjdsa', 8, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 21, 420000),
(3100046, 20200002, 'dnsakjdsa', 8, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100047, 20200002, 'dsada', 3, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 21, 420000),
(3100047, 20200002, 'dsada', 3, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 21, 210000),
(3100047, 20200002, 'dsada', 3, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100048, 20200003, 'sdasdasdcac', 4, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 21, 210000),
(3100048, 20200003, 'sdasdasdcac', 4, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 2, 40000),
(3100048, 20200003, 'sdasdasdcac', 4, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100049, 20200002, 'nkdsnksadsa', 4, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 21, 210000),
(3100049, 20200002, 'nkdsnksadsa', 4, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 1, 20000),
(3100049, 20200002, 'nkdsnksadsa', 4, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100050, 20200003, 'sdassaxsaxsax', 7, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 21, 420000),
(3100050, 20200003, 'sdassaxsaxsax', 7, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100051, 20200002, 'dsadsa', 4, '2021-01-19', 'egia m sahbana', 'MKN002', 'Bakso', 25000, 21, 525000),
(3100051, 20200002, 'dsadsa', 4, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100052, 20200003, 'bhbhbjcdcdc', 1, '2021-01-19', 'egia m sahbana', 'MKN002', 'Bakso', 25000, 32, 800000),
(3100052, 20200003, 'bhbhbjcdcdc', 1, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 32, 320000),
(3100052, 20200003, 'bhbhbjcdcdc', 1, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100053, 20200003, 'usamah', 7, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 2, 20000),
(3100053, 20200003, 'usamah', 7, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 2, 40000),
(3100053, 20200003, 'usamah', 7, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100054, 20200002, 'muhamad', 4, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 21, 420000),
(3100054, 20200002, 'muhamad', 4, '2021-01-19', 'egia m sahbana', 'MKN002', 'Bakso', 25000, 23, 575000),
(3100054, 20200002, 'muhamad', 4, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100055, 20200002, 'sdasdsacdcd', 2, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 12, 120000),
(3100055, 20200002, 'sdasdsacdcd', 2, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100056, 20200002, 'lif', 5, '2021-01-19', 'egia m sahbana', 'mkn003', 'Tahu Tek', 10000, 54, 540000),
(3100056, 20200002, 'lif', 5, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100057, 20200002, 'cbcawwewq', 7, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 23, 460000),
(3100057, 20200002, 'cbcawwewq', 7, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 3, 60000),
(3100057, 20200002, 'cbcawwewq', 7, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100058, 20200002, 'boruto', 7, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 23, 460000),
(3100058, 20200002, 'boruto', 7, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 21, 210000),
(3100058, 20200002, 'boruto', 7, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100059, 20200003, 'Sakura', 8, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 23, 460000),
(3100059, 20200003, 'Sakura', 8, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 21, 210000),
(3100059, 20200003, 'Sakura', 8, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100060, 20200004, 'naruto', 8, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 23, 230000),
(3100060, 20200004, 'naruto', 8, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100061, 20200002, 'sascsacas', 5, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 23, 460000),
(3100061, 20200002, 'sascsacas', 5, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 23, 230000),
(3100061, 20200002, 'sascsacas', 5, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100062, 20200005, 'MKN001\r\nsasuke', 5, '2021-01-19', 'egia m sahbana', 'MKN002', 'Bakso', 25000, 23, 575000),
(3100062, 20200005, 'MKN001\r\nsasuke', 5, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 34, 340000),
(3100062, 20200005, 'MKN001\r\nsasuke', 5, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100063, 20200002, 'uasudhusadh', 6, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 23, 460000),
(3100063, 20200002, 'uasudhusadh', 6, '2021-01-19', 'egia m sahbana', 'MKN002', 'Bakso', 25000, 3, 75000),
(3100063, 20200002, 'uasudhusadh', 6, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100064, 20200002, 'lisamau', 4, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 2, 40000),
(3100064, 20200002, 'lisamau', 4, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 24, 240000),
(3100064, 20200002, 'lisamau', 4, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100065, 20200002, 'bakso', 5, '2021-01-19', 'egia m sahbana', 'MKN002', 'Bakso', 25000, 32, 800000),
(3100065, 20200002, 'bakso', 5, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 3, 60000),
(3100065, 20200002, 'bakso', 5, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100066, 20200003, 'coba2', 3, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 24, 480000),
(3100066, 20200003, 'coba2', 3, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 31, 310000),
(3100066, 20200003, 'coba2', 3, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100067, 20200002, 'solawatan', 5, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 23, 460000),
(3100067, 20200002, 'solawatan', 5, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 21, 210000),
(3100067, 20200002, 'solawatan', 5, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100068, 20200002, 'sakura', 2, '2021-01-19', 'sasuke', 'MKN001', 'Nasi Goreng', 20000, 2, 40000),
(3100068, 20200002, 'sakura', 2, '2021-01-19', 'sasuke', 'MKN002', 'Bakso', 25000, 3, 75000),
(3100068, 20200002, 'sakura', 2, '2021-01-19', 'sasuke', '', '', 0, 0, 0),
(3100069, 20200002, 'sunade', 4, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 12, 120000),
(3100069, 20200002, 'sunade', 4, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100070, 20200002, 'gilang', 5, '2021-01-19', 'egia m sahbana', 'MKN002', 'Bakso', 25000, 12, 300000),
(3100070, 20200002, 'gilang', 5, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 12, 240000),
(3100070, 20200002, 'gilang', 5, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100071, 20200002, 'suherman', 6, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 12, 120000),
(3100071, 20200002, 'suherman', 6, '2021-01-19', 'egia m sahbana', 'MKN002', 'Bakso', 25000, 32, 800000),
(3100071, 20200002, 'suherman', 6, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100072, 20200002, 'valentino', 7, '2021-01-19', 'sasuke', 'MKN005', 'Jus Jeruk', 20000, 23, 460000),
(3100072, 20200002, 'valentino', 7, '2021-01-19', 'sasuke', 'MKN001', 'Nasi Goreng', 20000, 12, 240000),
(3100072, 20200002, 'valentino', 7, '2021-01-19', 'sasuke', '', '', 0, 0, 0),
(3100073, 20200002, 'galang', 7, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 2, 40000),
(3100073, 20200002, 'galang', 7, '2021-01-19', 'egia m sahbana', 'MKN004', 'Jus Melon', 10000, 23, 230000),
(3100073, 20200002, 'galang', 7, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100074, 20200002, 'raimas', 6, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 12, 120000),
(3100074, 20200002, 'raimas', 6, '2021-01-19', 'egia m sahbana', 'MKN002', 'Bakso', 25000, 2, 50000),
(3100074, 20200002, 'raimas', 6, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100075, 20200002, '10', 3, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 12, 120000),
(3100075, 20200002, '10', 3, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 2, 40000),
(3100075, 20200002, '10', 3, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100076, 20200002, 'salju', 6, '2021-01-19', 'egia m sahbana', 'MKN002', 'Bakso', 25000, 23, 575000),
(3100076, 20200002, 'salju', 6, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100077, 20200002, 'suherman', 4, '2021-01-19', 'egia m sahbana', 'MKN002', 'Bakso', 25000, 121, 3025000),
(3100077, 20200002, 'suherman', 4, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100078, 20200002, 'akbar usamah', 5, '2021-01-19', 'egia m sahbana', 'MKN004', 'Jus Melon', 10000, 2, 20000),
(3100078, 20200002, 'akbar usamah', 5, '2021-01-19', 'egia m sahbana', 'MKN002', 'Bakso', 25000, 2, 50000),
(3100078, 20200002, 'akbar usamah', 5, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100079, 20200002, 'abubakar sidik', 3, '2021-01-19', 'egia m sahbana', 'MKN003', 'Tahu Tek', 10000, 12, 120000),
(3100079, 20200002, 'abubakar sidik', 3, '2021-01-19', 'egia m sahbana', 'MKN001', 'Tahu Tek', 10000, 2, 20000),
(3100079, 20200002, 'abubakar sidik', 3, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100080, 20200002, 'rama', 6, '2021-01-19', 'egia m sahbana', 'MKN002', 'Bakso', 25000, 1, 25000),
(3100080, 20200002, 'rama', 6, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 1, 20000),
(3100080, 20200002, 'rama', 6, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100081, 20200002, 'akbar usamah', 4, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 2, 40000),
(3100081, 20200002, 'akbar usamah', 4, '2021-01-19', 'egia m sahbana', 'MKN004', 'Jus Melon', 10000, 2, 20000),
(3100081, 20200002, 'akbar usamah', 4, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0),
(3100082, 20200002, 'egia', 1, '2021-01-19', 'egia m sahbana', 'MKN001', 'Nasi Goreng', 20000, 2, 40000),
(3100082, 20200002, 'egia', 1, '2021-01-19', 'egia m sahbana', 'MKN004', 'Jus Melon', 10000, 2, 20000),
(3100082, 20200002, 'egia', 1, '2021-01-19', 'egia m sahbana', '', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `KodeMakanan` varchar(6) NOT NULL,
  `NamaMakanan` varchar(255) NOT NULL,
  `Harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`KodeMakanan`, `NamaMakanan`, `Harga`) VALUES
('MKN001', 'Nasi Goreng', 20000),
('MKN002', 'Bakso', 25000),
('MKN003', 'Tahu Tek', 10000),
('MKN004', 'Jus Melon', 10000),
('MKN005', 'Jus Jeruk', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `KodePesanan` int(10) NOT NULL,
  `NamaPelanggan` varchar(255) NOT NULL,
  `NoMeja` int(2) NOT NULL,
  `tanggal` date NOT NULL,
  `NamaPelayan` varchar(255) NOT NULL,
  `TotalPembelian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`KodePesanan`, `NamaPelanggan`, `NoMeja`, `tanggal`, `NamaPelayan`, `TotalPembelian`) VALUES
(20200001, 'Usamah', 7, '2021-01-19', 'agung yudatama', 40000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pembayaran`
--

CREATE TABLE `tbl_pembayaran` (
  `KodePembayaran` int(8) NOT NULL,
  `KodePesanan` int(10) NOT NULL,
  `NamaPelanggan` varchar(255) NOT NULL,
  `NoMeja` int(2) NOT NULL,
  `tanggal` date NOT NULL,
  `NamaKasir` varchar(255) NOT NULL,
  `TotalPembelian` int(255) NOT NULL,
  `Kembali` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pembayaran`
--

INSERT INTO `tbl_pembayaran` (`KodePembayaran`, `KodePesanan`, `NamaPelanggan`, `NoMeja`, `tanggal`, `NamaKasir`, `TotalPembelian`, `Kembali`) VALUES
(3100024, 20200009, 'udin', 10, '2021-01-18', 'egia m sahbana', 65000, 35000),
(3100025, 20200008, 'josua iskandar', 4, '2021-01-18', 'egia m sahbana', 60000, 140000),
(3100026, 20200007, 'rosa', 9, '2021-01-18', 'egia m sahbana', 60000, 340000),
(3100027, 20200006, 'roky', 8, '2021-01-18', 'egia m sahbana', 90000, 210000),
(3100028, 20200005, 'rosi', 9, '2021-01-18', 'egia m sahbana', 1330000, 28670000),
(3100029, 20200003, 'Budi', 5, '2021-01-18', 'egia m sahbana', 305000, 2695000),
(3100030, 20200002, 'Akbar usamah', 5, '2021-01-18', 'egia m sahbana', 1790000, 18210000),
(3100031, 20200002, 'lolas', 6, '2021-01-18', 'egia m sahbana', 470000, 3530000),
(3100032, 20200002, 'surga', 8, '2021-01-18', 'egia m sahbana', 90000, 810000),
(3100033, 20200002, 'suara', 9, '2021-01-18', 'egia m sahbana', 450000, 4950000),
(3100034, 20200002, 'alif', 7, '2021-01-19', 'egia m sahbana', 250000, 1250000),
(3100035, 20200002, 'sonia', 4, '2021-01-19', 'egia m sahbana', 65000, 135000),
(3100036, 20200002, 'sosia', 5, '2021-01-19', 'egia m sahbana', 150000, 2250000),
(3100037, 20200002, 'rosa', 4, '2021-01-19', 'egia m sahbana', 565000, 1435000),
(3100038, 20200002, 'usamah', 7, '2021-01-19', 'egia m sahbana', 360000, 3640000),
(3100039, 20200002, 'sanusi', 8, '2021-01-19', 'egia m sahbana', 265000, 2235000),
(3100040, 20200002, 'lali', 5, '2021-01-19', 'egia m sahbana', 1145000, 21955000),
(3100041, 20200002, 'usamah', 5, '2021-01-19', 'egia m sahbana', 470000, 4530000),
(3100042, 20200002, 'alif', 5, '2021-01-19', 'egia m sahbana', 140000, 100000),
(3100043, 20200002, 'usamah', 5, '2021-01-19', 'egia m sahbana', 60000, 240000),
(3100044, 20200002, 'saputra', 4, '2021-01-19', 'egia m sahbana', 720000, 280000),
(3100045, 20200002, 'dsadsad', 3, '2021-01-19', 'egia m sahbana', 945000, 55000),
(3100046, 20200002, 'dnsakjdsa', 8, '2021-01-19', 'egia m sahbana', 460000, 40000),
(3100047, 20200002, 'dsada', 3, '2021-01-19', 'egia m sahbana', 630000, 70000),
(3100048, 20200003, 'sdasdasdcac', 4, '2021-01-19', 'egia m sahbana', 250000, 640000),
(3100049, 20200002, 'nkdsnksadsa', 4, '2021-01-19', 'egia m sahbana', 230000, 70000),
(3100050, 20200003, 'sdassaxsaxsax', 7, '2021-01-19', 'egia m sahbana', 420000, 80000),
(3100051, 20200002, 'dsadsa', 4, '2021-01-19', 'egia m sahbana', 525000, 75000),
(3100052, 20200003, 'bhbhbjcdcdc', 1, '2021-01-19', 'egia m sahbana', 1120000, 80000),
(3100053, 20200003, 'usamah', 7, '2021-01-19', 'egia m sahbana', 60000, 40000),
(3100054, 20200002, 'muhamad', 4, '2021-01-19', 'egia m sahbana', 995000, 5005000),
(3100055, 20200002, 'sdasdsacdcd', 2, '2021-01-19', 'egia m sahbana', 120000, 10000),
(3100056, 20200002, 'lif', 5, '2021-01-19', 'egia m sahbana', 540000, 60000),
(3100057, 20200002, 'cbcawwewq', 7, '2021-01-19', 'egia m sahbana', 520000, 3980000),
(3100058, 20200002, 'boruto', 7, '2021-01-19', 'egia m sahbana', 670000, 2330000),
(3100059, 20200003, 'Sakura', 8, '2021-01-19', 'egia m sahbana', 670000, 30000),
(3100060, 20200004, 'naruto', 8, '2021-01-19', 'egia m sahbana', 230000, 170000),
(3100061, 20200002, 'sascsacas', 5, '2021-01-19', 'egia m sahbana', 690000, 10000),
(3100062, 20200005, 'MKN001\r\nsasuke', 5, '2021-01-19', 'egia m sahbana', 915000, 85000),
(3100063, 20200002, 'uasudhusadh', 6, '2021-01-19', 'egia m sahbana', 535000, -235000),
(3100064, 20200002, 'lisamau', 4, '2021-01-19', 'egia m sahbana', 280000, 20000),
(3100065, 20200002, 'bakso', 5, '2021-01-19', 'egia m sahbana', 860000, 40000),
(3100066, 20200003, 'coba2', 3, '2021-01-19', 'egia m sahbana', 790000, -390000),
(3100067, 20200002, 'solawatan', 5, '2021-01-19', 'egia m sahbana', 670000, 30000),
(3100068, 20200002, 'sakura', 2, '2021-01-19', 'sasuke', 115000, 85000),
(3100069, 20200002, 'sunade', 4, '2021-01-19', 'egia m sahbana', 120000, 30000),
(3100070, 20200002, 'gilang', 5, '2021-01-19', 'egia m sahbana', 540000, 60000),
(3100071, 20200002, 'suherman', 6, '2021-01-19', 'egia m sahbana', 920000, 80000),
(3100072, 20200002, 'valentino', 7, '2021-01-19', 'sasuke', 700000, 7300000),
(3100073, 20200002, 'galang', 7, '2021-01-19', 'egia m sahbana', 270000, 30000),
(3100074, 20200002, 'raimas', 6, '2021-01-19', 'egia m sahbana', 170000, 30000),
(3100075, 20200002, '10', 3, '2021-01-19', 'egia m sahbana', 160000, 40000),
(3100076, 20200002, 'salju', 6, '2021-01-19', 'egia m sahbana', 575000, 25000),
(3100077, 20200002, 'suherman', 4, '2021-01-19', 'egia m sahbana', 3025000, 975000),
(3100078, 20200002, 'akbar usamah', 5, '2021-01-19', 'egia m sahbana', 70000, 10000),
(3100079, 20200002, 'abubakar sidik', 3, '2021-01-19', 'egia m sahbana', 140000, 10000),
(3100080, 20200002, 'rama', 6, '2021-01-19', 'egia m sahbana', 45000, 5000),
(3100081, 20200002, 'akbar usamah', 4, '2021-01-19', 'egia m sahbana', 60000, 10000),
(3100082, 20200002, 'egia', 1, '2021-01-19', 'egia m sahbana', 60000, 10000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_daftar`
--
ALTER TABLE `tbl_daftar`
  ADD PRIMARY KEY (`KodePendaftaran`);

--
-- Indexes for table `tbl_detailorder`
--
ALTER TABLE `tbl_detailorder`
  ADD KEY `KodePesanan` (`KodePesanan`),
  ADD KEY `KodePesanan_2` (`KodePesanan`),
  ADD KEY `KodePesanan_3` (`KodePesanan`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`KodeMakanan`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`KodePesanan`);

--
-- Indexes for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD PRIMARY KEY (`KodePembayaran`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_daftar`
--
ALTER TABLE `tbl_daftar`
  MODIFY `KodePendaftaran` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20101049;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
