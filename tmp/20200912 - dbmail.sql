-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2020 at 10:48 PM
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
(7, 'Wadir', 'Wakil Direktur'),
(8, 'Direktur', 'Direktur'),
(17, 'KA. Prodi', 'Kepala Program Studi'),
(18, 'DIR EKS. LSP', 'DIR EKS. LSP'),
(24, 'DEPUTI WADIR I', 'DEPUTI WADIR I'),
(26, 'KABAG MHS & KERJASAM', 'KABAG MHS & KERJASAMA'),
(28, 'KA. Unit', 'Kepala Unit'),
(29, 'STAF DIREKTUR', 'STAF DIREKTUR');

-- --------------------------------------------------------

--
-- Table structure for table `groups_menu`
--

CREATE TABLE `groups_menu` (
  `id` int(11) NOT NULL,
  `id_groups` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups_menu`
--

INSERT INTO `groups_menu` (`id`, `id_groups`, `id_menu`) VALUES
(1, 1, 40),
(2, 1, 8),
(3, 1, 89),
(4, 1, 4),
(5, 1, 91),
(6, 4, 91),
(7, 1, 93),
(8, 1, 94),
(9, 1, 43),
(10, 1, 44),
(11, 1, 115),
(12, 1, 116),
(13, 1, 42),
(14, 1, 1),
(15, 2, 1),
(16, 5, 1),
(17, 6, 1),
(18, 7, 1),
(19, 8, 1),
(20, 9, 1),
(21, 10, 1),
(22, 11, 1),
(23, 12, 1),
(24, 13, 1),
(25, 14, 1),
(26, 15, 1),
(27, 16, 1),
(28, 17, 1),
(29, 18, 1),
(30, 19, 1),
(31, 20, 1),
(32, 21, 1),
(33, 22, 1),
(34, 23, 1),
(35, 24, 1),
(36, 25, 1),
(37, 26, 1),
(38, 27, 1),
(39, 28, 1),
(40, 29, 1),
(41, 1, 3),
(42, 2, 3),
(43, 5, 3),
(44, 6, 3),
(45, 7, 3),
(46, 8, 3),
(47, 9, 3),
(48, 10, 3),
(49, 11, 3),
(50, 12, 3),
(51, 13, 3),
(52, 14, 3),
(53, 15, 3),
(54, 16, 3),
(55, 17, 3),
(56, 18, 3),
(57, 19, 3),
(58, 20, 3),
(59, 21, 3),
(60, 22, 3),
(61, 23, 3),
(62, 24, 3),
(63, 25, 3),
(64, 26, 3),
(65, 27, 3),
(66, 28, 3),
(67, 29, 3),
(68, 1, 118),
(69, 5, 118),
(70, 6, 118),
(71, 7, 118),
(72, 8, 118),
(73, 9, 118),
(74, 10, 118),
(75, 11, 118),
(76, 12, 118),
(77, 13, 118),
(78, 14, 118),
(79, 15, 118),
(80, 16, 118),
(81, 17, 118),
(82, 18, 118),
(83, 19, 118),
(84, 20, 118),
(85, 21, 118),
(86, 22, 118),
(87, 23, 118),
(88, 24, 118),
(89, 25, 118),
(90, 26, 118),
(91, 27, 118),
(92, 28, 118),
(93, 29, 118),
(94, 1, 117),
(95, 2, 117),
(96, 5, 117),
(97, 6, 117),
(98, 7, 117),
(99, 8, 117),
(100, 9, 117),
(101, 10, 117),
(102, 11, 117),
(103, 12, 117),
(104, 13, 117),
(105, 14, 117),
(106, 15, 117),
(107, 16, 117),
(108, 17, 117),
(109, 18, 117),
(110, 19, 117),
(111, 20, 117),
(112, 21, 117),
(113, 22, 117),
(114, 23, 117),
(115, 24, 117),
(116, 25, 117),
(117, 26, 117),
(118, 27, 117),
(119, 28, 117),
(120, 29, 117);

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

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(22, '::1', 'popy@poltekpos.ac.id', 1599852803);

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
(3, 17, 8),
(4, 10, 8),
(5, 17, 2),
(6, 9, 26);

-- --------------------------------------------------------

--
-- Table structure for table `surat`
--

CREATE TABLE `surat` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nomor_surat` varchar(128) NOT NULL,
  `lampiran` char(2) DEFAULT NULL,
  `perihal` varchar(200) NOT NULL,
  `isi_surat` text NOT NULL,
  `nomor_agenda` varchar(128) DEFAULT NULL,
  `tgl_agenda` date DEFAULT NULL,
  `post_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `surat`
--

INSERT INTO `surat` (`id`, `tanggal`, `nomor_surat`, `lampiran`, `perihal`, `isi_surat`, `nomor_agenda`, `tgl_agenda`, `post_date`, `status`) VALUES
(55, '2020-09-11', '404', '1', 'TES MAIL', '<p>pesan 1</p>', '123', '2020-09-11', '2020-09-11 14:04:26', '0'),
(56, '2020-09-01', '12345', '1', 'tes balas', '<p>gf</p>', NULL, NULL, '2020-09-11 15:41:42', '0'),
(57, '2020-09-01', '404', '1', 'asdasdas', '<p>asd</p>', NULL, NULL, '2020-09-11 15:54:41', '0'),
(58, '2020-09-01', '12345', '1', 'asdasd', '<p>asdasdasd</p>', NULL, NULL, '2020-09-11 18:36:39', '0'),
(59, '2020-09-03', '404', '1', 'tes balas', '<p>asdasd</p>', NULL, NULL, '2020-09-11 19:07:24', '0'),
(60, '2020-09-02', '404', '1', 'tes balas2', '<p>kl</p>', NULL, NULL, '2020-09-11 19:31:25', '0');

--
-- Triggers `surat`
--
DELIMITER $$
CREATE TRIGGER `delete_lampiran` AFTER DELETE ON `surat` FOR EACH ROW BEGIN
DELETE from surat_lampiran where id_surat = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `surat_lampiran`
--

CREATE TABLE `surat_lampiran` (
  `id` int(11) NOT NULL,
  `id_tujuan` int(11) DEFAULT NULL,
  `id_surat` int(11) DEFAULT NULL,
  `file_surat` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `surat_lampiran`
--

INSERT INTO `surat_lampiran` (`id`, `id_tujuan`, `id_surat`, `file_surat`) VALUES
(52, 163, 55, 'asdd.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tembusan`
--

CREATE TABLE `tembusan` (
  `id` int(11) NOT NULL,
  `id_surat` int(11) NOT NULL,
  `kepada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tembusan`
--

INSERT INTO `tembusan` (`id`, `id_surat`, `kepada`) VALUES
(12, 52, 6),
(13, 56, 9),
(14, 57, 9),
(15, 59, 8),
(16, 60, 8);

--
-- Triggers `tembusan`
--
DELIMITER $$
CREATE TRIGGER `delete_tembusan` AFTER DELETE ON `tembusan` FOR EACH ROW BEGIN
DELETE from tembusan where id_surat = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tujuan`
--

CREATE TABLE `tujuan` (
  `id` int(11) NOT NULL,
  `id_surat` int(11) NOT NULL,
  `dari` int(11) NOT NULL,
  `kepada` int(11) NOT NULL,
  `post_date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('0','1','2') NOT NULL DEFAULT '0',
  `isi` text DEFAULT NULL,
  `visibility` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tujuan`
--

INSERT INTO `tujuan` (`id`, `id_surat`, `dari`, `kepada`, `post_date`, `status`, `isi`, `visibility`) VALUES
(150, 52, 9, 10, '2020-09-11 13:31:04', '1', NULL, '1'),
(151, 52, 10, 9, '2020-09-11 13:32:20', '1', '<p>pesan 2</p>', '1'),
(152, 52, 10, 9, '2020-09-11 20:53:14', '0', '<div class=\'alert alert-success\'><i class=\'fa fa-check\'></i> Surat telah diagendakan.</div>', '1'),
(153, 53, 9, 10, '2020-09-11 20:53:57', '1', NULL, '1'),
(154, 53, 10, 7, '2020-09-11 20:54:14', '0', '<div class=\'alert alert-success\'><i class=\'fa fa-check\'></i> Surat telah diagendakan.</div>', '1'),
(155, 54, 9, 10, '2020-09-11 20:58:44', '1', NULL, '1'),
(156, 54, 10, 9, '2020-09-11 20:59:30', '1', '<p>asdasdasd</p>', '1'),
(157, 54, 9, 10, '2020-09-11 20:59:46', '1', '<p>iya</p>', '1'),
(158, 54, 10, 9, '2020-09-11 20:59:58', '1', '<p>asd</p>', '1'),
(159, 54, 9, 10, '2020-09-11 21:00:07', '1', '<p>asd</p>', '1'),
(160, 54, 9, 10, '2020-09-11 21:00:24', '1', '<p>asdasd</p>', '1'),
(161, 54, 9, 10, '2020-09-11 21:00:37', '1', '<p>asdas</p>', '1'),
(162, 54, 10, 5, '2020-09-11 21:00:57', '0', '<div class=\'alert alert-success\'><i class=\'fa fa-check\'></i> Surat telah diagendakan.</div>', '1'),
(163, 55, 9, 10, '2020-09-11 21:04:26', '1', NULL, '0'),
(164, 55, 10, 9, '2020-09-11 21:23:48', '1', '<p>pesan 2</p>', '0'),
(165, 55, 9, 10, '2020-09-11 21:24:01', '1', '<p>pesan 3</p>', '1'),
(166, 55, 10, 6, '2020-09-11 21:24:09', '0', '<div class=\'alert alert-success\'><i class=\'fa fa-check\'></i> Surat telah diagendakan.</div>', '0'),
(167, 56, 10, 8, '2020-09-11 22:41:42', '0', NULL, '0'),
(168, 57, 10, 6, '2020-09-11 22:54:41', '0', NULL, '0'),
(169, 58, 9, 10, '2020-09-12 01:36:39', '1', NULL, '0'),
(170, 59, 9, 8, '2020-09-12 02:07:24', '1', NULL, '0'),
(171, 59, 9, 6, '2020-09-12 02:07:24', '0', NULL, '0'),
(172, 60, 9, 10, '2020-09-12 02:31:25', '1', NULL, '0'),
(173, 60, 9, 6, '2020-09-12 02:31:25', '0', NULL, '0'),
(174, 60, 10, 9, '2020-09-12 03:14:33', '1', '<p>asd</p>', '0'),
(175, 60, 9, 10, '2020-09-12 03:14:49', '1', '<p>apa</p>', '0');

--
-- Triggers `tujuan`
--
DELIMITER $$
CREATE TRIGGER `delete_tujuan` AFTER DELETE ON `tujuan` FOR EACH ROW BEGIN
DELETE from tujuan where id_surat = OLD.id;
END
$$
DELIMITER ;

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
(1, '127.0.0.1', 'admin@admin.com', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', 'm0vyKu2zW7L8PTG20bquF.707e055aeea8a30aca', 1541329145, 'WcHCQ5vcXwT1z99BvJUWnu', 1268889823, 1599794612, 1, 'Admin', 'istrator', '0', 'fiza.jpg', '', 'Admin'),
(2, '::1', 'emay@poltekpos.ac.id', '$2y$08$DCwEdFZ6ZqZ.eSnjaYr8guIl/8mJsTv6yDqYzF0Ae2XTTJYQnwu02', NULL, 'emay@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1575441345, NULL, 1, 'Emay', 'Marshanda', '089610448994', 'default.jpg', '', 'Staff D3 Manajemen Informatika'),
(3, '::1', 'muhammad.akbar5999@gmail.com', '$2y$08$s8cP/qRqPvG6RDDW9qywe.edoTLDeztCBnxoHMjErkitTjzHo4//6', NULL, 'muhammad.akbar5999@gmail.com', NULL, NULL, NULL, NULL, 1598971278, 1599656064, 1, 'Muhammad', 'akbar', '089646817762', 'ak.jpg', '2193013', 'Mahasiswa'),
(4, '::1', 'supono@admin.com2', '$2y$08$eE1/Kn0U9Enl5TNPe7ubUuD7USL4nobYQqblggF48rF7vp3rcHHU.', NULL, 'supono@admin.com2', NULL, NULL, NULL, NULL, 1599030422, NULL, 1, 'Supono', 'Syafiq', '08112272742', 'default.jpg', '12345678', 'Ketua DPRD Kabupaten Karawang'),
(5, '::1', 'agus@poltekpos.ac.id', '$2y$08$JuJojzuAPGjVWx5lP85B6ueGBPMTvXFSD.rRh0g435xL27VXc2up2', NULL, 'agus@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1599361882, 1599378593, 1, 'Agus', 'Purnomo', '08112272742', 'default.jpg', '1234567', 'Direktur'),
(6, '::1', 'dodi@poltekpos.ac.id', '$2y$08$fxBHNyPlKNlKghh4PDqmPeOqgmBdddg64FeW34ot7HUcW1ZWzUL..', NULL, 'dodi@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1599362067, NULL, 1, 'Dodi', 'Permadi', '08112272742', 'default.jpg', '12345678', 'Wakil Direktur 1'),
(7, '::1', 'edi@poltekpos.ac.id', '$2y$08$OZ6daIAM4eCpDfhWNlPsre9ZZiMeuAjxHr1P77t42GNDWS3A38lUS', NULL, 'edi@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1599362147, NULL, 1, 'Edi', 'Supriadi', '08112272742', 'default.jpg', '1234567', 'Wakil Direktur 2'),
(8, '::1', 'hilman@poltekpos.ac.id', '$2y$08$Ej9csZa0q8YEfguGeaCPLOqSV/aMbujkdgQBYTbrGzPym9yVJW0Pq', NULL, 'hilman@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1599362506, 1599851277, 1, 'Hilman', 'Setiadi', '08112272742', 'default.jpg', '123456', 'Wakil Direktur 3'),
(9, '::1', 'virdy@poltekpos.ac.id', '$2y$08$ilInqxqynFQYDjFlAHdkDO0KpSXdtzMNH.yXaN1AVIB0EmZbRv8P6', NULL, 'virdy@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1599367890, 1599848894, 1, 'Virdiandry', 'Putratama', '08112272742', 'default.jpg', '12345', 'Ketua Prodi D3 Manajemen Informatika'),
(10, '::1', 'popy@gmail.com', '$2y$08$7VHqS2FLmiyL559rQP64RupzPIK26b8RZltrPH5BmCxSD9hkGJXYS', NULL, 'popy@gmail.com', NULL, NULL, NULL, NULL, 1599658042, 1599855405, 1, 'Popy', 'Geovani', '08999999999', 'default.jpg', '123213213213', 'Staff');

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
(24, 1, 1),
(25, 2, 2),
(11, 3, 2),
(10, 4, 2),
(13, 5, 8),
(17, 6, 5),
(19, 7, 6),
(21, 8, 7),
(1, 9, 17),
(28, 10, 29);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups_menu`
--
ALTER TABLE `groups_menu`
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
-- AUTO_INCREMENT for table `groups_menu`
--
ALTER TABLE `groups_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `surat`
--
ALTER TABLE `surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `surat_lampiran`
--
ALTER TABLE `surat_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `tembusan`
--
ALTER TABLE `tembusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tujuan`
--
ALTER TABLE `tujuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
