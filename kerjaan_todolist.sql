-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2025 at 06:26 AM
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
-- Database: `kerjaan_todolist`
--

-- --------------------------------------------------------

--
-- Table structure for table `kerjaan_baru`
--

CREATE TABLE `kerjaan_baru` (
  `id` int(11) NOT NULL,
  `nama_kerjaan` text NOT NULL,
  `deadline` text NOT NULL,
  `nipp` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pekerjaan`
--

CREATE TABLE `pekerjaan` (
  `no` int(11) NOT NULL,
  `sub_nomor` varchar(50) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `output` text DEFAULT NULL,
  `link_kk` text DEFAULT NULL,
  `nipp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penyelesaian_rutin`
--

CREATE TABLE `penyelesaian_rutin` (
  `id` int(11) NOT NULL,
  `nipp` varchar(20) NOT NULL,
  `bulan` tinyint(4) NOT NULL,
  `tahun` int(11) NOT NULL,
  `status_selesai` tinyint(4) NOT NULL DEFAULT 0,
  `gambar` varchar(255) DEFAULT NULL,
  `link` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rutin`
--

CREATE TABLE `rutin` (
  `id` int(11) NOT NULL,
  `nama_tugas` varchar(255) DEFAULT NULL,
  `hari` varchar(10) DEFAULT NULL,
  `bulan` int(11) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `nipp` varchar(20) NOT NULL,
  `periode` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tombol_data`
--

CREATE TABLE `tombol_data` (
  `id` int(11) NOT NULL,
  `no` int(11) NOT NULL,
  `sub_nomor` varchar(50) NOT NULL,
  `nipp` varchar(50) NOT NULL,
  `link` text DEFAULT NULL,
  `nama_tombol` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `useradmin`
--

CREATE TABLE `useradmin` (
  `id` int(11) NOT NULL,
  `nipp` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `useradmin`
--

INSERT INTO `useradmin` (`id`, `nipp`, `password`) VALUES
(1, '2024', '$2y$10$8kQqMjcOzJhd.QgyyusOYuNYA3nQVUx.DJzY39QOCLNIpjce2NBQW');

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

CREATE TABLE `userdata` (
  `id` int(11) NOT NULL,
  `nipp` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`id`, `nipp`, `nama`, `created_at`) VALUES
(14, '9191923', 'Tri', '2024-11-15 03:18:28'),
(15, '19720971201', 'Nana', '2024-11-15 03:19:04'),
(16, '19275299120', 'Maul', '2024-11-15 03:19:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kerjaan_baru`
--
ALTER TABLE `kerjaan_baru`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pekerjaan`
--
ALTER TABLE `pekerjaan`
  ADD PRIMARY KEY (`no`,`sub_nomor`,`nipp`);

--
-- Indexes for table `penyelesaian_rutin`
--
ALTER TABLE `penyelesaian_rutin`
  ADD PRIMARY KEY (`id`,`nipp`,`bulan`,`tahun`);

--
-- Indexes for table `rutin`
--
ALTER TABLE `rutin`
  ADD PRIMARY KEY (`id`,`nipp`);

--
-- Indexes for table `tombol_data`
--
ALTER TABLE `tombol_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pekerjaan_fk` (`no`,`sub_nomor`,`nipp`);

--
-- Indexes for table `useradmin`
--
ALTER TABLE `useradmin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nipp` (`nipp`);

--
-- Indexes for table `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kerjaan_baru`
--
ALTER TABLE `kerjaan_baru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `rutin`
--
ALTER TABLE `rutin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tombol_data`
--
ALTER TABLE `tombol_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=533;

--
-- AUTO_INCREMENT for table `useradmin`
--
ALTER TABLE `useradmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `userdata`
--
ALTER TABLE `userdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tombol_data`
--
ALTER TABLE `tombol_data`
  ADD CONSTRAINT `pekerjaan_fk` FOREIGN KEY (`no`,`sub_nomor`,`nipp`) REFERENCES `pekerjaan` (`no`, `sub_nomor`, `nipp`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
