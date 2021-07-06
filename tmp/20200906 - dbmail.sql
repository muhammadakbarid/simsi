-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2020 at 07:42 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbmail`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(5, 'Wadir I', 'Wakil Direktur 1'),
(6, 'Wadir II', 'Wakil Direktur 2'),
(7, 'Wadir III', 'Wakil Direktur 3'),
(8, 'Direktur', 'Direktur'),
(9, 'KA. PRODI D3 TI', 'Kepala Program Studi D3 Teknik Informatika'),
(10, 'KA. PRODI D3 SI', 'Kepala Program Studi D3 Sistem Informasi'),
(11, 'KA. PRODI D3 AK', 'Kepala Program Studi D3 Akuntansi'),
(12, 'KA. PRODI D3 MB', 'Kepala Program Studi D3 Manajemen Bisnis'),
(13, 'KA. PRODI D3 LB', 'Kepala Program Studi D3 Logistik Bisnis'),
(14, 'KA. PRODI D3 TI', 'Kepala Program Studi D4 Teknik informatika'),
(15, 'KA. PRODI D4 AK', 'Kepala Program Studi D4 Akuntansi'),
(16, 'KA. PRODI D4 MB', 'Kepala Program Studi D4 Manajemen Bisnis'),
(17, 'KA. PRODI D4 LB', 'Kepala Program Studi D4 Logistik Bisnis'),
(18, 'DIR EKS. LSP', 'DIR EKS. LSP'),
(19, 'KA. BAUK', 'KA. BAUK'),
(20, 'KA. BAAK', 'KA. BAAK'),
(21, 'KA. LPPM', 'KA. LPPM'),
(22, 'KA. TIK/SAP', 'KA. TIK/SAP'),
(23, 'KA. SPMI', 'KA. SPMI'),
(24, 'DEPUTI WADIR I', 'DEPUTI WADIR I'),
(25, 'KA. REKRUTMEN MHS', 'KA. REKRUTMEN MHS'),
(26, 'KABAG MHS & KERJASAM', 'KABAG MHS & KERJASAMA'),
(27, 'KA. LAB & PERPUSTAKA', 'KA. LAB & PERPUSTAKAAN'),
(28, 'KA. PUT - COT', 'KA. PUT - COT'),
(29, 'STAF DIREKTUR', 'STAF DIREKTUR');

-- --------------------------------------------------------

--
-- Table structure for table `groups_menu`
--

CREATE TABLE `groups_menu` (
  `id_groups` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups_menu`
--

INSERT INTO `groups_menu` (`id_groups`, `id_menu`) VALUES
(1, 1),
(2, 1),
(1, 3),
(2, 3),
(1, 40),
(1, 8),
(1, 89),
(1, 4),
(1, 91),
(4, 91),
(1, 93),
(1, 94),
(1, 43),
(1, 44),
(1, 115),
(1, 116),
(1, 42),
(1, 117),
(3, 117),
(4, 117),
(1, 118),
(3, 118),
(4, 118);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 99,
  `level` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `icon` varchar(125) NOT NULL,
  `label` varchar(25) NOT NULL,
  `link` varchar(125) NOT NULL,
  `id` varchar(25) NOT NULL DEFAULT '#',
  `id_menu_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `sort`, `level`, `parent_id`, `icon`, `label`, `link`, `id`, `id_menu_type`) VALUES
(1, 0, 1, 0, 'empty', 'MAIN NAVIGATION', '#', '#', 1),
(3, 1, 2, 1, 'fas fa-tachometer-alt', 'Dashboard', 'dashboard', '#', 1),
(4, 9, 2, 40, 'fas fa-table', 'CRUD Generator', 'crudbuilder', '1', 1),
(8, 7, 2, 40, 'fas fa-bars', 'Menu', 'cms/menu/side-menu', 'navMenu', 1),
(40, 6, 1, 0, 'empty', 'DEV', '#', '#', 1),
(42, 3, 2, 115, 'fas fa-users-cog', 'User dan Group', '#', '1', 1),
(43, 4, 3, 42, 'fas fa-user-plus', 'Users', 'users', '1', 1),
(44, 5, 3, 42, 'fas fa-users', 'Groups', 'groups', '2', 1),
(89, 8, 2, 40, 'fas fa-th-list', 'Menu Type', 'menu_type', 'menu_type', 1),
(115, 2, 1, 0, 'fas fa-globe', 'SETTING', '#', 'setting', 1),
(116, 1, 2, 115, 'fas fa-user-slash', 'Permission Kirim Surat', 'Permission', 'Permission', 1),
(117, 1, 2, 1, 'fas fa-envelope-open-text', 'Surat Internal', 'Surat', 'surat', 1),
(118, 1, 2, 1, 'fas fa-archive', 'Tembusan', 'Tembusan', 'Tembusan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu_type`
--

CREATE TABLE `menu_type` (
  `id_menu_type` int(11) NOT NULL,
  `type` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_type`
--

INSERT INTO `menu_type` (`id_menu_type`, `type`) VALUES
(1, 'Side menu');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `id_groups` int(11) NOT NULL,
  `id_groups_to` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `id_groups`, `id_groups_to`) VALUES
(3, 9, 8);

-- --------------------------------------------------------

--
-- Table structure for table `surat`
--

CREATE TABLE `surat` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nomor_surat` varchar(128) NOT NULL,
  `lampiran` varchar(128) NOT NULL,
  `perihal` varchar(128) NOT NULL,
  `nomor_agenda` varchar(128) NOT NULL,
  `tgl_agenda` date NOT NULL,
  `post_date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `surat`
--

INSERT INTO `surat` (`id`, `tanggal`, `nomor_surat`, `lampiran`, `perihal`, `nomor_agenda`, `tgl_agenda`, `post_date`, `status`) VALUES
(10, '2020-10-07', 'ns', 'tes', 'p', 'na', '2020-10-06', '2020-09-02 00:13:28', '1'),
(11, '2020-09-03', 'ns', 'tes', 'p', 'na', '2020-09-29', '2020-09-02 00:13:28', '1'),
(12, '2020-09-02', 'ns', 'tes', 'p', 'na', '2020-09-29', '2020-09-02 00:13:28', '1'),
(13, '2020-09-02', 'ns', 'tes', 'p', 'na', '2020-10-06', '2020-09-02 00:13:28', '1'),
(14, '2020-09-01', 'ns', 'tes', 'p', 'na', '2020-09-22', '2020-09-02 00:13:28', '1'),
(15, '2020-09-01', 'ns', 'tes', 'p', 'na', '2020-10-27', '2020-09-02 00:13:28', '1'),
(16, '2020-09-01', 'ns', 'tes', 'p', 'na', '2020-10-06', '2020-09-02 00:13:28', ''),
(17, '2020-09-01', 'ns', 'tes', 'p', 'na', '2020-10-05', '2020-09-02 00:13:28', '1');

-- --------------------------------------------------------

--
-- Table structure for table `surat_lampiran`
--

CREATE TABLE `surat_lampiran` (
  `id` int(11) NOT NULL,
  `id_tujuan` int(11) NOT NULL,
  `file_surat` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `surat_lampiran`
--

INSERT INTO `surat_lampiran` (`id`, `id_tujuan`, `file_surat`) VALUES
(1, 123, 'ia10.jpg'),
(2, 123, 'ia9.jpg'),
(3, 123, 'GettyImages-924096878-cba70a6.jpg'),
(4, 123, 'black-panther-poster.jpg'),
(5, 123, 'fiza.jpg'),
(6, 123, 'fiza.png');

-- --------------------------------------------------------

--
-- Table structure for table `tembusan`
--

CREATE TABLE `tembusan` (
  `id` int(11) NOT NULL,
  `id_surat` int(11) NOT NULL,
  `kepada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tujuan`
--

CREATE TABLE `tujuan` (
  `id` int(11) NOT NULL,
  `id_surat` int(11) NOT NULL,
  `dari` int(11) NOT NULL,
  `kepada` int(11) NOT NULL,
  `post_date` varchar(128) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `isi` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `image` varchar(128) NOT NULL DEFAULT 'default.jpg',
  `nik` varchar(20) DEFAULT NULL,
  `jabatan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `phone`, `image`, `nik`, `jabatan`) VALUES
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', 'm0vyKu2zW7L8PTG20bquF.707e055aeea8a30aca', 1541329145, 'WcHCQ5vcXwT1z99BvJUWnu', 1268889823, 1599325208, 1, 'Admin', 'istrator', '0', 'fiza.jpg', NULL, NULL),
(2, '::1', 'emay@poltekpos.ac.id', '$2y$08$DCwEdFZ6ZqZ.eSnjaYr8guIl/8mJsTv6yDqYzF0Ae2XTTJYQnwu02', NULL, 'emay@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1575441345, NULL, 1, 'Emay', 'Marshanda', '089610448994', 'default.jpg', NULL, NULL),
(3, '::1', 'muhammad.akbar5999@gmail.com', '$2y$08$s8cP/qRqPvG6RDDW9qywe.edoTLDeztCBnxoHMjErkitTjzHo4//6', NULL, 'muhammad.akbar5999@gmail.com', NULL, NULL, NULL, NULL, 1598971278, 1598980223, 1, 'Muhammad', 'akbar', '089646817762', 'ak.jpg', '2193013', 'Mahasiswa'),
(4, '::1', 'supono@admin.com2', '$2y$08$eE1/Kn0U9Enl5TNPe7ubUuD7USL4nobYQqblggF48rF7vp3rcHHU.', NULL, 'supono@admin.com2', NULL, NULL, NULL, NULL, 1599030422, NULL, 1, 'Supono', 'Syafiq', '08112272742', 'default.jpg', '12345678', 'Ketua DPRD Kabupaten Karawang');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(7, 1, 1),
(4, 2, 2),
(11, 3, 2),
(10, 4, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `menu_type`
--
ALTER TABLE `menu_type`
  ADD PRIMARY KEY (`id_menu_type`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat`
--
ALTER TABLE `surat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_lampiran`
--
ALTER TABLE `surat_lampiran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tembusan`
--
ALTER TABLE `tembusan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tujuan`
--
ALTER TABLE `tujuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `menu_type`
--
ALTER TABLE `menu_type`
  MODIFY `id_menu_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `surat`
--
ALTER TABLE `surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `surat_lampiran`
--
ALTER TABLE `surat_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tembusan`
--
ALTER TABLE `tembusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tujuan`
--
ALTER TABLE `tujuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
