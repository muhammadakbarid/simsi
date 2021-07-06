-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Sep 2020 pada 06.31
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.3

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
-- Struktur dari tabel `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `groups`
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
-- Struktur dari tabel `groups_menu`
--

CREATE TABLE `groups_menu` (
  `id_groups` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `groups_menu`
--

INSERT INTO `groups_menu` (`id_groups`, `id_menu`) VALUES
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
(1, 1),
(2, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(1, 3),
(2, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(1, 118),
(5, 118),
(6, 118),
(7, 118),
(8, 118),
(9, 118),
(10, 118),
(11, 118),
(12, 118),
(13, 118),
(14, 118),
(15, 118),
(16, 118),
(17, 118),
(18, 118),
(19, 118),
(20, 118),
(21, 118),
(22, 118),
(23, 118),
(24, 118),
(25, 118),
(26, 118),
(27, 118),
(28, 118),
(29, 118),
(1, 117),
(2, 117),
(5, 117),
(6, 117),
(7, 117),
(8, 117),
(9, 117),
(10, 117),
(11, 117),
(12, 117),
(13, 117),
(14, 117),
(15, 117),
(16, 117),
(17, 117),
(18, 117),
(19, 117),
(20, 117),
(21, 117),
(22, 117),
(23, 117),
(24, 117),
(25, 117),
(26, 117),
(27, 117),
(28, 117),
(29, 117);

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(20, '::1', 'popy@gmail.com', 1599793733);

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '99',
  `level` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `icon` varchar(125) NOT NULL,
  `label` varchar(25) NOT NULL,
  `link` varchar(125) NOT NULL,
  `id` varchar(25) NOT NULL DEFAULT '#',
  `id_menu_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menu`
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
-- Struktur dari tabel `menu_type`
--

CREATE TABLE `menu_type` (
  `id_menu_type` int(11) NOT NULL,
  `type` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menu_type`
--

INSERT INTO `menu_type` (`id_menu_type`, `type`) VALUES
(1, 'Side menu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `id_groups` int(11) NOT NULL,
  `id_groups_to` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `permission`
--

INSERT INTO `permission` (`id`, `id_groups`, `id_groups_to`) VALUES
(3, 17, 8),
(4, 10, 8),
(5, 17, 2),
(6, 9, 26);

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat`
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
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `surat`
--

INSERT INTO `surat` (`id`, `tanggal`, `nomor_surat`, `lampiran`, `perihal`, `isi_surat`, `nomor_agenda`, `tgl_agenda`, `post_date`, `status`) VALUES
(43, '2020-09-02', '1', '1', 'Percobaan', '<p>Pesan 1</p>', NULL, NULL, '2020-09-07 15:08:39', '1'),
(44, '2020-09-02', '2', '2', 'YUDISIUM', '<p>pesan 1</p>', NULL, NULL, '2020-09-07 15:28:04', '1'),
(45, '2020-09-08', '3', '1', 'TES STATUS SURAT', '<p>pesan 1</p>', NULL, NULL, '2020-09-08 13:58:13', '0'),
(46, '2020-09-02', '12345', '2', 'TES STATUS WARNA', '<p>pesan 1</p>', NULL, NULL, '2020-09-08 19:22:52', '1'),
(47, '2020-09-02', '12345', '1', 'COBA 2', '<p>pesan 1</p>', NULL, NULL, '2020-09-08 19:41:36', '1'),
(48, '2020-09-09', '404', '1', 'TES WARNA', '<p>pesan 1</p>', NULL, NULL, '2020-09-08 20:06:28', '0'),
(49, '2020-09-09', '12345', '1', 'Tes', '<p>pesan 1</p>', NULL, NULL, '2020-09-09 05:41:28', '1'),
(50, '2020-09-09', '12345', '1', 'tes balas13', '<p>saddasdas</p>', NULL, NULL, '2020-09-09 12:54:55', '0'),
(51, '2020-09-01', '12345', '1', 'tes balas', '<p>asdasdasd</p>', '123', '2020-09-10', '2020-09-09 13:29:17', '0');

--
-- Trigger `surat`
--
DELIMITER $$
CREATE TRIGGER `delete_lampiran` AFTER DELETE ON `surat` FOR EACH ROW BEGIN
DELETE from surat_lampiran where id_surat = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_lampiran`
--

CREATE TABLE `surat_lampiran` (
  `id` int(11) NOT NULL,
  `id_tujuan` int(11) DEFAULT NULL,
  `id_surat` int(11) DEFAULT NULL,
  `file_surat` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `surat_lampiran`
--

INSERT INTO `surat_lampiran` (`id`, `id_tujuan`, `id_surat`, `file_surat`) VALUES
(36, 70, 44, 'fiza4.jpg'),
(37, 71, 44, 'fiza5.jpg'),
(38, 69, 44, 'fiza6.jpg'),
(39, 69, 44, 'fiza7.jpg'),
(41, 75, 44, 'fiza8.jpg'),
(42, 101, 44, 'fiza9.jpg'),
(43, 102, 43, 'default.png'),
(44, 105, 45, 'fiza10.jpg'),
(45, 110, 46, 'fiza11.jpg'),
(46, 110, 46, 'hmmi_yudisium4-011.png'),
(47, 129, 49, 'fiza12.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tembusan`
--

CREATE TABLE `tembusan` (
  `id` int(11) NOT NULL,
  `id_surat` int(11) NOT NULL,
  `kepada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tembusan`
--

INSERT INTO `tembusan` (`id`, `id_surat`, `kepada`) VALUES
(10, 49, 6),
(11, 49, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tujuan`
--

CREATE TABLE `tujuan` (
  `id` int(11) NOT NULL,
  `id_surat` int(11) NOT NULL,
  `dari` int(11) NOT NULL,
  `kepada` int(11) NOT NULL,
  `post_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('0','1','2') NOT NULL DEFAULT '0',
  `isi` text,
  `visibility` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tujuan`
--

INSERT INTO `tujuan` (`id`, `id_surat`, `dari`, `kepada`, `post_date`, `status`, `isi`, `visibility`) VALUES
(60, 43, 9, 8, '2020-09-07 22:08:39', '1', NULL, '0'),
(61, 43, 8, 9, '2020-09-07 22:08:55', '1', '<p>pesan 2</p>', '0'),
(62, 43, 9, 8, '2020-09-07 22:09:14', '1', '<p>pesan 3</p>', '0'),
(63, 43, 8, 9, '2020-09-07 22:15:51', '1', '<p>pesan 4</p>', '0'),
(64, 43, 9, 8, '2020-09-07 22:15:59', '1', '<p>pesan 5</p>', '0'),
(65, 43, 8, 9, '2020-09-07 22:16:49', '1', '<p>pesan 6</p>', '0'),
(66, 43, 9, 8, '2020-09-07 22:17:51', '1', '<p>pesan 7</p>', '0'),
(67, 43, 8, 9, '2020-09-07 22:25:28', '1', '<p>pesan 8</p>', '0'),
(68, 44, 9, 8, '2020-09-07 22:28:04', '1', NULL, '0'),
(69, 44, 9, 3, '2020-09-07 22:28:04', '0', NULL, '0'),
(70, 44, 8, 9, '2020-09-07 22:52:07', '1', '<p>pesan 2</p>', '0'),
(71, 44, 8, 3, '2020-09-07 22:52:07', '0', '<p>pesan 2</p>', '0'),
(72, 44, 3, 8, '2020-09-07 22:54:27', '1', '<p>Pesan 3</p>', '0'),
(73, 44, 3, 9, '2020-09-07 22:54:27', '1', '<p>Pesan 3</p>', '0'),
(74, 44, 8, 3, '2020-09-08 00:22:25', '0', '<p>pesan 4</p>', '0'),
(75, 44, 8, 9, '2020-09-08 00:22:25', '1', '<p>pesan 4</p>', '0'),
(76, 44, 9, 8, '2020-09-08 00:36:59', '1', '<p>pesan 5</p>', '0'),
(77, 44, 9, 3, '2020-09-08 00:36:59', '0', '<p>pesan 5</p>', '0'),
(78, 44, 8, 3, '2020-09-08 12:23:45', '0', '<p>pesna 6</p>', '0'),
(79, 44, 8, 9, '2020-09-08 12:23:45', '1', '<p>pesna 6</p>', '0'),
(80, 44, 3, 8, '2020-09-08 12:27:19', '1', '<p>pesan 7</p>', '0'),
(81, 44, 3, 9, '2020-09-08 12:27:19', '1', '<p>pesan 7</p>', '0'),
(85, 0, 9, 3, '2020-09-08 17:11:31', '0', '<p>pesan 8</p>', '0'),
(86, 0, 3, 8, '2020-09-08 17:13:31', '0', '<p>pesan 8</p>', '0'),
(87, 0, 3, 9, '2020-09-08 17:13:31', '0', '<p>pesan 8</p>', '0'),
(88, 0, 3, 8, '2020-09-08 17:14:50', '0', '<p>asdasdasd</p>', '0'),
(89, 0, 3, 9, '2020-09-08 17:14:50', '0', '<p>asdasdasd</p>', '0'),
(90, 0, 9, 8, '2020-09-08 17:21:38', '0', '<p>pesan 8</p>', '0'),
(91, 0, 9, 3, '2020-09-08 17:21:38', '0', '<p>pesan 8</p>', '0'),
(92, 0, 9, 8, '2020-09-08 17:25:41', '0', '<p>pesan 8</p>', '0'),
(93, 0, 9, 3, '2020-09-08 17:25:41', '0', '<p>pesan 8</p>', '0'),
(94, 44, 9, 8, '2020-09-08 17:28:46', '1', '<p>pesan 8</p>', '0'),
(95, 44, 9, 3, '2020-09-08 17:28:46', '0', '<p>pesan 8</p>', '0'),
(96, 44, 9, 8, '2020-09-08 17:29:41', '1', '<p>pesan 9</p>', '0'),
(97, 44, 9, 3, '2020-09-08 17:29:41', '0', '<p>pesan 9</p>', '0'),
(98, 44, 9, 8, '2020-09-08 17:30:16', '1', '<p>pesan 10</p>', '0'),
(99, 44, 9, 3, '2020-09-08 17:30:16', '0', '<p>pesan 10</p>', '0'),
(100, 44, 9, 8, '2020-09-08 17:32:47', '1', '<p>pesan 11</p>', '0'),
(101, 44, 9, 3, '2020-09-08 17:32:47', '0', '<p>pesan 11</p>', '0'),
(102, 43, 9, 8, '2020-09-08 17:41:02', '1', '<p>pesan 9</p>', '0'),
(103, 45, 9, 8, '2020-09-08 20:58:13', '1', NULL, '0'),
(104, 45, 9, 6, '2020-09-08 20:58:13', '0', NULL, '0'),
(105, 45, 9, 3, '2020-09-08 20:58:13', '0', NULL, '0'),
(106, 43, 9, 8, '2020-09-09 02:14:25', '1', '<p>pesan akhir</p>', '0'),
(107, 44, 9, 8, '2020-09-09 02:15:34', '1', '<p>pesan akhir</p>', '0'),
(108, 44, 9, 3, '2020-09-09 02:15:34', '0', '<p>pesan akhir</p>', '0'),
(109, 46, 8, 9, '2020-09-09 02:22:52', '1', NULL, '0'),
(110, 46, 8, 5, '2020-09-09 02:22:52', '0', NULL, '0'),
(111, 46, 9, 5, '2020-09-09 02:39:51', '0', '<p>ok</p>', '0'),
(112, 47, 9, 8, '2020-09-09 02:41:36', '1', NULL, '0'),
(113, 47, 8, 9, '2020-09-09 02:55:52', '1', '<p>pesan 2</p>', '0'),
(114, 47, 9, 8, '2020-09-09 02:57:07', '0', '<p>pesan 3</p>', '0'),
(115, 47, 9, 8, '2020-09-09 02:57:44', '0', '<p>pesan 4</p>', '0'),
(116, 47, 8, 9, '2020-09-09 02:59:35', '0', '<p>pesan akhir</p>', '0'),
(117, 48, 9, 8, '2020-09-09 03:06:28', '0', NULL, '0'),
(118, 48, 8, 9, '2020-09-09 03:06:43', '1', '<p>pesan 2</p>', '0'),
(119, 48, 9, 8, '2020-09-09 03:06:55', '0', '<p>pesan 3</p>', '0'),
(120, 48, 8, 9, '2020-09-09 03:09:00', '1', '<p>pesan 4</p>', '0'),
(121, 48, 8, 9, '2020-09-09 03:09:52', '1', '<p>pesan 5</p>', '0'),
(122, 48, 8, 9, '2020-09-09 03:12:39', '1', '<p>pesan 6</p>', '0'),
(123, 48, 9, 8, '2020-09-09 03:14:57', '0', '<p>pesan 7</p>', '0'),
(124, 48, 8, 9, '2020-09-09 03:15:26', '1', '<p>pesan 8</p>', '0'),
(125, 48, 9, 8, '2020-09-09 03:15:41', '0', '<p>pesan 9</p>', '0'),
(126, 48, 9, 8, '2020-09-09 03:18:19', '0', '<p>pesan 10</p>', '0'),
(127, 48, 8, 9, '2020-09-09 03:19:01', '1', '<p>pesan 11</p>', '0'),
(128, 48, 9, 8, '2020-09-09 03:19:42', '0', '<p>pesan 12</p>', '0'),
(129, 49, 9, 8, '2020-09-09 12:41:28', '0', NULL, '0'),
(130, 49, 8, 9, '2020-09-09 12:42:04', '1', '<p>pesan 2</p>', '0'),
(131, 49, 9, 8, '2020-09-09 12:42:37', '0', '<p>pesan 3</p>', '0'),
(132, 50, 3, 9, '2020-09-09 19:54:55', '1', NULL, '0'),
(133, 51, 9, 10, '2020-09-09 20:29:17', '1', NULL, '1'),
(134, 51, 10, 9, '2020-09-10 00:29:37', '1', '<p>asdasdas</p>', '0'),
(135, 51, 9, 10, '2020-09-10 00:32:06', '1', '<p>gh</p>', '0'),
(136, 51, 10, 9, '2020-09-10 00:54:35', '1', '<p>kjasdnsa</p>', '0'),
(137, 51, 10, 8, '2020-09-10 01:10:39', '1', '<p>sdasdas</p>', '1'),
(138, 51, 10, 9, '2020-09-10 01:10:39', '1', '<p>sdasdas</p>', '0'),
(149, 51, 10, 6, '2020-09-10 12:29:29', '0', '<div class=\'alert alert-success\'><i class=\'fa fa-check\'></i> Surat telah diagendakan.</div>', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
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
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `phone`, `image`, `nik`, `jabatan`) VALUES
(1, '127.0.0.1', 'admin@admin.com', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', 'm0vyKu2zW7L8PTG20bquF.707e055aeea8a30aca', 1541329145, 'WcHCQ5vcXwT1z99BvJUWnu', 1268889823, 1599794612, 1, 'Admin', 'istrator', '0', 'fiza.jpg', '', 'Admin'),
(2, '::1', 'emay@poltekpos.ac.id', '$2y$08$DCwEdFZ6ZqZ.eSnjaYr8guIl/8mJsTv6yDqYzF0Ae2XTTJYQnwu02', NULL, 'emay@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1575441345, NULL, 1, 'Emay', 'Marshanda', '089610448994', 'default.jpg', '', 'Staff D3 Manajemen Informatika'),
(3, '::1', 'muhammad.akbar5999@gmail.com', '$2y$08$s8cP/qRqPvG6RDDW9qywe.edoTLDeztCBnxoHMjErkitTjzHo4//6', NULL, 'muhammad.akbar5999@gmail.com', NULL, NULL, NULL, NULL, 1598971278, 1599656064, 1, 'Muhammad', 'akbar', '089646817762', 'ak.jpg', '2193013', 'Mahasiswa'),
(4, '::1', 'supono@admin.com2', '$2y$08$eE1/Kn0U9Enl5TNPe7ubUuD7USL4nobYQqblggF48rF7vp3rcHHU.', NULL, 'supono@admin.com2', NULL, NULL, NULL, NULL, 1599030422, NULL, 1, 'Supono', 'Syafiq', '08112272742', 'default.jpg', '12345678', 'Ketua DPRD Kabupaten Karawang'),
(5, '::1', 'agus@poltekpos.ac.id', '$2y$08$JuJojzuAPGjVWx5lP85B6ueGBPMTvXFSD.rRh0g435xL27VXc2up2', NULL, 'agus@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1599361882, 1599378593, 1, 'Agus', 'Purnomo', '08112272742', 'default.jpg', '1234567', 'Direktur'),
(6, '::1', 'dodi@poltekpos.ac.id', '$2y$08$fxBHNyPlKNlKghh4PDqmPeOqgmBdddg64FeW34ot7HUcW1ZWzUL..', NULL, 'dodi@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1599362067, NULL, 1, 'Dodi', 'Permadi', '08112272742', 'default.jpg', '12345678', 'Wakil Direktur 1'),
(7, '::1', 'edi@poltekpos.ac.id', '$2y$08$OZ6daIAM4eCpDfhWNlPsre9ZZiMeuAjxHr1P77t42GNDWS3A38lUS', NULL, 'edi@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1599362147, NULL, 1, 'Edi', 'Supriadi', '08112272742', 'default.jpg', '1234567', 'Wakil Direktur 2'),
(8, '::1', 'hilman@poltekpos.ac.id', '$2y$08$Ej9csZa0q8YEfguGeaCPLOqSV/aMbujkdgQBYTbrGzPym9yVJW0Pq', NULL, 'hilman@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1599362506, 1599675094, 1, 'Hilman', 'Setiadi', '08112272742', 'default.jpg', '123456', 'Wakil Direktur 3'),
(9, '::1', 'virdy@poltekpos.ac.id', '$2y$08$ilInqxqynFQYDjFlAHdkDO0KpSXdtzMNH.yXaN1AVIB0EmZbRv8P6', NULL, 'virdy@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1599367890, 1599794774, 1, 'Virdiandry', 'Putratama', '08112272742', 'default.jpg', '12345', 'Ketua Prodi D3 Manajemen Informatika'),
(10, '::1', 'popy@gmail.com', '$2y$08$7VHqS2FLmiyL559rQP64RupzPIK26b8RZltrPH5BmCxSD9hkGJXYS', NULL, 'popy@gmail.com', NULL, NULL, NULL, NULL, 1599658042, 1599724421, 1, 'Popy', 'Geovani', '08999999999', 'default.jpg', '123213213213', 'Staff');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users_groups`
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
-- Indeks untuk tabel `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `menu_type`
--
ALTER TABLE `menu_type`
  ADD PRIMARY KEY (`id_menu_type`);

--
-- Indeks untuk tabel `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `surat`
--
ALTER TABLE `surat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `surat_lampiran`
--
ALTER TABLE `surat_lampiran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tembusan`
--
ALTER TABLE `tembusan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tujuan`
--
ALTER TABLE `tujuan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT untuk tabel `menu_type`
--
ALTER TABLE `menu_type`
  MODIFY `id_menu_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
