-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2023 at 12:51 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbhotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `id` int(11) NOT NULL,
  `nomor_kamar` varchar(45) DEFAULT NULL,
  `tipe_kamar` varchar(45) DEFAULT NULL,
  `harga` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`id`, `nomor_kamar`, `tipe_kamar`, `harga`) VALUES
(101, 'S120', 'Standar', '800000'),
(202, 'E202', 'Executive', '1500000'),
(303, 'P330', 'Presiden Suite', '2500000');

-- --------------------------------------------------------

--
-- Table structure for table `list_pesanan`
--

CREATE TABLE `list_pesanan` (
  `id` int(11) NOT NULL,
  `nama_Pemesan` varchar(45) NOT NULL,
  `tamu_id` int(11) DEFAULT NULL,
  `makanan_id` int(11) DEFAULT NULL,
  `minuman_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `list_pesanan`
--

INSERT INTO `list_pesanan` (`id`, `nama_Pemesan`, `tamu_id`, `makanan_id`, `minuman_id`) VALUES
(1, 'Benzema', 5, 10, 5),
(2, 'Rehan Putra', 1, 9, 4),
(3, 'Alodia Bidara', 2, 8, 2),
(4, 'Dea Amanda', 4, 5, 9),
(5, 'Putra Rmadhan', 3, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `makanan`
--

CREATE TABLE `makanan` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `harga` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `makanan`
--

INSERT INTO `makanan` (`id`, `nama`, `harga`) VALUES
(1, 'Nasi Goreng Kampung', '155000'),
(2, 'Nasi Goreng Kambing', '156000'),
(3, 'Ayam Panggan Sambal Hijau', '145000'),
(4, 'Konrro Panggang Makasar', '290000'),
(5, 'Sate Ayam', '115000'),
(6, 'Nasi Bali Wardani', '150000'),
(7, 'Bakmi Jawa', '130000'),
(8, 'Chicken Madras Curry', '140000'),
(9, 'Chicken Biriani', '160000'),
(10, 'Pizza Pepperoni', '144000');

-- --------------------------------------------------------

--
-- Table structure for table `minuman`
--

CREATE TABLE `minuman` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `harga` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `minuman`
--

INSERT INTO `minuman` (`id`, `nama`, `harga`) VALUES
(1, 'Mellon Mojitos Squash', '30000'),
(2, 'Ocean Blue Mojitos Squash', '35000'),
(3, 'Orange Blue Mojitos Squash', '28000'),
(4, 'cappucinno', '25000'),
(5, 'Milo', '40000'),
(6, 'Black Coffee', '20000'),
(7, 'Mineral Water equil', '31000'),
(8, 'Sweet Tea/Ice Tea', '22000'),
(9, 'Apple Tea', '26000'),
(10, 'Lemon Tea', '27000');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL,
  `reservasi_id` int(11) DEFAULT NULL,
  `list_pesanan_id` int(11) DEFAULT NULL,
  `total` varchar(45) DEFAULT NULL,
  `tgl_pembayaran` date DEFAULT NULL,
  `metode_pembayaran` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `reservasi_id`, `list_pesanan_id`, `total`, `tgl_pembayaran`, `metode_pembayaran`) VALUES
(1, 3, 1, '184000', '2022-10-10', 'Cash'),
(2, 1, 2, '185000', '2022-07-07', 'Q-ris BCA'),
(3, 5, 3, '175000', '2023-11-03', 'Credit Card BCA'),
(4, 4, 4, '141000', '2023-06-01', 'Cash'),
(5, 2, 5, '178000', '2022-10-12', 'Credit Card BNI');

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `id` int(11) NOT NULL,
  `tanggal_chekin` date DEFAULT NULL,
  `tanggal_chekout` date DEFAULT NULL,
  `tamu_id` int(11) DEFAULT NULL,
  `kamar_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservasi`
--

INSERT INTO `reservasi` (`id`, `tanggal_chekin`, `tanggal_chekout`, `tamu_id`, `kamar_id`) VALUES
(1, '2022-06-07', '2022-07-07', 1, 202),
(2, '2022-09-12', '2022-10-12', 3, 101),
(3, '2022-09-10', '2022-10-10', 5, 303),
(4, '2023-05-01', '2023-06-01', 4, 202),
(5, '2023-10-02', '2023-11-03', 2, 303);

-- --------------------------------------------------------

--
-- Table structure for table `tamu`
--

CREATE TABLE `tamu` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `jenis_kelamin` varchar(45) NOT NULL,
  `no_telepon` varchar(45) DEFAULT NULL,
  `alamat` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tamu`
--

INSERT INTO `tamu` (`id`, `nama`, `jenis_kelamin`, `no_telepon`, `alamat`) VALUES
(1, 'Rehan Putra', 'Pria', '087014556171', 'jln.banda No.14'),
(2, 'Alodia Bidara', 'Wanita', '081966785612', 'jln.lombok No.15'),
(3, 'Putra Ramadhan', 'Pria', '082834567231', 'jln.batureok No.50'),
(4, 'Dea Amanda', 'Wanita', '081975674132', 'jln.cikole No.153'),
(5, 'Benzema', 'Pria', '082978654231', 'jln.caheum No.100');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor_kamar` (`nomor_kamar`),
  ADD UNIQUE KEY `harga` (`harga`);

--
-- Indexes for table `list_pesanan`
--
ALTER TABLE `list_pesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tamu_id` (`tamu_id`),
  ADD KEY `minuman_id` (`makanan_id`),
  ADD KEY `makanan_id` (`minuman_id`);

--
-- Indexes for table `makanan`
--
ALTER TABLE `makanan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `harga` (`harga`);

--
-- Indexes for table `minuman`
--
ALTER TABLE `minuman`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `harga` (`harga`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `total` (`total`),
  ADD KEY `reservasi_id` (`reservasi_id`),
  ADD KEY `list_pesanan_id` (`list_pesanan_id`);

--
-- Indexes for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tamu_id` (`tamu_id`),
  ADD KEY `kamar_id` (`kamar_id`);

--
-- Indexes for table `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_telepon` (`no_telepon`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=304;

--
-- AUTO_INCREMENT for table `list_pesanan`
--
ALTER TABLE `list_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `makanan`
--
ALTER TABLE `makanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `minuman`
--
ALTER TABLE `minuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reservasi`
--
ALTER TABLE `reservasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tamu`
--
ALTER TABLE `tamu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `list_pesanan`
--
ALTER TABLE `list_pesanan`
  ADD CONSTRAINT `list_pesanan_ibfk_1` FOREIGN KEY (`tamu_id`) REFERENCES `tamu` (`id`),
  ADD CONSTRAINT `list_pesanan_ibfk_2` FOREIGN KEY (`makanan_id`) REFERENCES `minuman` (`id`),
  ADD CONSTRAINT `list_pesanan_ibfk_3` FOREIGN KEY (`minuman_id`) REFERENCES `makanan` (`id`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`reservasi_id`) REFERENCES `reservasi` (`id`),
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`list_pesanan_id`) REFERENCES `list_pesanan` (`id`);

--
-- Constraints for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD CONSTRAINT `reservasi_ibfk_1` FOREIGN KEY (`tamu_id`) REFERENCES `tamu` (`id`),
  ADD CONSTRAINT `reservasi_ibfk_2` FOREIGN KEY (`kamar_id`) REFERENCES `kamar` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
