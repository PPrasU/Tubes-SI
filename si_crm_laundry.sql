-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2023 at 01:45 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_crm_laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` varchar(3) NOT NULL,
  `id_distributor` varchar(4) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `tipe` enum('1','2','3') NOT NULL,
  `tanggal_pemesanan` date NOT NULL,
  `experied` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_distributor`
--

CREATE TABLE `tb_distributor` (
  `id_distributor` varchar(4) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `jenis_barang` enum('1','2','3') NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jasa`
--

CREATE TABLE `tb_jasa` (
  `id_jasa` varchar(5) NOT NULL,
  `id_barang` varchar(3) NOT NULL,
  `nama_jasa` varchar(30) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenistransaksi`
--

CREATE TABLE `tb_jenistransaksi` (
  `id_jenisTransaksi` varchar(4) NOT NULL,
  `jenis_transaksi` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_karyawan`
--

CREATE TABLE `tb_karyawan` (
  `id_karyawan` varchar(4) NOT NULL,
  `id_pengguna` varchar(10) NOT NULL,
  `id_peringkatK` varchar(4) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `posisi` varchar(10) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_member`
--

CREATE TABLE `tb_member` (
  `id_member` varchar(8) NOT NULL,
  `id_pengguna` varchar(10) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` varchar(7) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` varchar(10) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `level` enum('0','1','7','8','9') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_penukaranpoin`
--

CREATE TABLE `tb_penukaranpoin` (
  `id_penukaran` varchar(6) NOT NULL,
  `id_transaksiM` varchar(10) NOT NULL,
  `poin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_peringkatjasa`
--

CREATE TABLE `tb_peringkatjasa` (
  `id_peringkatJ` varchar(5) NOT NULL,
  `id_transaksiM` varchar(10) NOT NULL,
  `id_transaksiP` varchar(10) NOT NULL,
  `peringkat` enum('0','1','2','3') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_peringkatmember`
--

CREATE TABLE `tb_peringkatmember` (
  `id_peringkatM` varchar(8) NOT NULL,
  `id_transaksiM` varchar(10) NOT NULL,
  `nama_peringkat` varchar(15) NOT NULL,
  `peringkat` enum('0','1','2','3','4') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_poin`
--

CREATE TABLE `tb_poin` (
  `kode_poin` varchar(5) NOT NULL,
  `id_penukaran` varchar(6) NOT NULL,
  `point` int(11) NOT NULL,
  `peringkat` enum('1','2','3','4') NOT NULL,
  `expired_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rtransaksimember`
--

CREATE TABLE `tb_rtransaksimember` (
  `id_transaksiM` varchar(10) NOT NULL,
  `id_member` varchar(8) NOT NULL,
  `id_jenisTransaksi` varchar(4) NOT NULL,
  `id_karyawan` varchar(4) NOT NULL,
  `id_jasa` varchar(5) NOT NULL,
  `kode_poin` varchar(5) NOT NULL,
  `poin` int(11) NOT NULL,
  `berat(kg)` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `pembayaran` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rtransaksipelanggan`
--

CREATE TABLE `tb_rtransaksipelanggan` (
  `id_transaksiP` varchar(10) NOT NULL,
  `id_pelanggan` varchar(7) NOT NULL,
  `id_jenisTransaksi` varchar(4) NOT NULL,
  `id_karyawan` varchar(4) NOT NULL,
  `id_jasa` varchar(5) NOT NULL,
  `berat(kg)` int(3) NOT NULL,
  `harga` int(11) NOT NULL,
  `pembayaran` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_sarankritik`
--

CREATE TABLE `tb_sarankritik` (
  `id_saran` varchar(8) NOT NULL,
  `id_pengguna` varchar(10) NOT NULL,
  `saran` text NOT NULL,
  `kritik` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_distributor` (`id_distributor`);

--
-- Indexes for table `tb_distributor`
--
ALTER TABLE `tb_distributor`
  ADD PRIMARY KEY (`id_distributor`);

--
-- Indexes for table `tb_jasa`
--
ALTER TABLE `tb_jasa`
  ADD PRIMARY KEY (`id_jasa`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `tb_jenistransaksi`
--
ALTER TABLE `tb_jenistransaksi`
  ADD PRIMARY KEY (`id_jenisTransaksi`);

--
-- Indexes for table `tb_karyawan`
--
ALTER TABLE `tb_karyawan`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `id_peringkatK` (`id_peringkatK`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `tb_member`
--
ALTER TABLE `tb_member`
  ADD PRIMARY KEY (`id_member`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `tb_penukaranpoin`
--
ALTER TABLE `tb_penukaranpoin`
  ADD PRIMARY KEY (`id_penukaran`),
  ADD KEY `id_transaksiM` (`id_transaksiM`);

--
-- Indexes for table `tb_peringkatjasa`
--
ALTER TABLE `tb_peringkatjasa`
  ADD PRIMARY KEY (`id_peringkatJ`),
  ADD KEY `id_transaksiM` (`id_transaksiM`,`id_transaksiP`),
  ADD KEY `id_transaksiP` (`id_transaksiP`);

--
-- Indexes for table `tb_peringkatmember`
--
ALTER TABLE `tb_peringkatmember`
  ADD PRIMARY KEY (`id_peringkatM`),
  ADD KEY `id_member` (`id_transaksiM`);

--
-- Indexes for table `tb_poin`
--
ALTER TABLE `tb_poin`
  ADD PRIMARY KEY (`kode_poin`),
  ADD KEY `id_penukaran` (`id_penukaran`);

--
-- Indexes for table `tb_rtransaksimember`
--
ALTER TABLE `tb_rtransaksimember`
  ADD PRIMARY KEY (`id_transaksiM`),
  ADD KEY `id_member` (`id_member`),
  ADD KEY `id_jenisTransaksi` (`id_jenisTransaksi`),
  ADD KEY `id_karyawan` (`id_karyawan`),
  ADD KEY `id_jasa` (`id_jasa`),
  ADD KEY `kode_poin` (`kode_poin`);

--
-- Indexes for table `tb_rtransaksipelanggan`
--
ALTER TABLE `tb_rtransaksipelanggan`
  ADD PRIMARY KEY (`id_transaksiP`),
  ADD KEY `id_jenisTransaksi` (`id_jenisTransaksi`),
  ADD KEY `id_karyawan` (`id_karyawan`),
  ADD KEY `id_jasa` (`id_jasa`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `tb_sarankritik`
--
ALTER TABLE `tb_sarankritik`
  ADD PRIMARY KEY (`id_saran`),
  ADD KEY `id_pengguna` (`id_pengguna`) USING BTREE;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD CONSTRAINT `tb_barang_ibfk_1` FOREIGN KEY (`id_distributor`) REFERENCES `tb_distributor` (`id_distributor`);

--
-- Constraints for table `tb_jasa`
--
ALTER TABLE `tb_jasa`
  ADD CONSTRAINT `tb_jasa_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`);

--
-- Constraints for table `tb_karyawan`
--
ALTER TABLE `tb_karyawan`
  ADD CONSTRAINT `tb_karyawan_ibfk_2` FOREIGN KEY (`id_pengguna`) REFERENCES `tb_pengguna` (`id_pengguna`);

--
-- Constraints for table `tb_member`
--
ALTER TABLE `tb_member`
  ADD CONSTRAINT `tb_member_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `tb_pengguna` (`id_pengguna`);

--
-- Constraints for table `tb_penukaranpoin`
--
ALTER TABLE `tb_penukaranpoin`
  ADD CONSTRAINT `tb_penukaranpoin_ibfk_1` FOREIGN KEY (`id_transaksiM`) REFERENCES `tb_rtransaksimember` (`id_transaksiM`);

--
-- Constraints for table `tb_peringkatjasa`
--
ALTER TABLE `tb_peringkatjasa`
  ADD CONSTRAINT `tb_peringkatjasa_ibfk_1` FOREIGN KEY (`id_transaksiP`) REFERENCES `tb_rtransaksipelanggan` (`id_transaksiP`),
  ADD CONSTRAINT `tb_peringkatjasa_ibfk_2` FOREIGN KEY (`id_transaksiM`) REFERENCES `tb_rtransaksimember` (`id_transaksiM`);

--
-- Constraints for table `tb_peringkatmember`
--
ALTER TABLE `tb_peringkatmember`
  ADD CONSTRAINT `tb_peringkatmember_ibfk_1` FOREIGN KEY (`id_transaksiM`) REFERENCES `tb_rtransaksimember` (`id_transaksiM`);

--
-- Constraints for table `tb_poin`
--
ALTER TABLE `tb_poin`
  ADD CONSTRAINT `tb_poin_ibfk_1` FOREIGN KEY (`id_penukaran`) REFERENCES `tb_penukaranpoin` (`id_penukaran`);

--
-- Constraints for table `tb_rtransaksimember`
--
ALTER TABLE `tb_rtransaksimember`
  ADD CONSTRAINT `tb_rtransaksimember_ibfk_1` FOREIGN KEY (`id_jenisTransaksi`) REFERENCES `tb_jenistransaksi` (`id_jenisTransaksi`),
  ADD CONSTRAINT `tb_rtransaksimember_ibfk_2` FOREIGN KEY (`id_karyawan`) REFERENCES `tb_karyawan` (`id_karyawan`),
  ADD CONSTRAINT `tb_rtransaksimember_ibfk_3` FOREIGN KEY (`id_jasa`) REFERENCES `tb_jasa` (`id_jasa`),
  ADD CONSTRAINT `tb_rtransaksimember_ibfk_5` FOREIGN KEY (`id_member`) REFERENCES `tb_member` (`id_member`),
  ADD CONSTRAINT `tb_rtransaksimember_ibfk_6` FOREIGN KEY (`kode_poin`) REFERENCES `tb_poin` (`kode_poin`);

--
-- Constraints for table `tb_rtransaksipelanggan`
--
ALTER TABLE `tb_rtransaksipelanggan`
  ADD CONSTRAINT `tb_rtransaksipelanggan_ibfk_1` FOREIGN KEY (`id_jasa`) REFERENCES `tb_jasa` (`id_jasa`),
  ADD CONSTRAINT `tb_rtransaksipelanggan_ibfk_2` FOREIGN KEY (`id_jenisTransaksi`) REFERENCES `tb_jenistransaksi` (`id_jenisTransaksi`),
  ADD CONSTRAINT `tb_rtransaksipelanggan_ibfk_3` FOREIGN KEY (`id_karyawan`) REFERENCES `tb_karyawan` (`id_karyawan`),
  ADD CONSTRAINT `tb_rtransaksipelanggan_ibfk_5` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`);

--
-- Constraints for table `tb_sarankritik`
--
ALTER TABLE `tb_sarankritik`
  ADD CONSTRAINT `tb_sarankritik_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `tb_pengguna` (`id_pengguna`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
