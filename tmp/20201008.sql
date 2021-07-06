-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2020 at 08:36 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
(120, 29, 117),
(130, 1, 125),
(131, 2, 125),
(132, 7, 125),
(133, 8, 125),
(134, 17, 125),
(135, 18, 125),
(136, 24, 125),
(137, 26, 125),
(138, 28, 125),
(139, 29, 125),
(142, 1, 126),
(143, 29, 126);

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
(4, 16, 2, 40, 'fas fa-table', 'CRUD Generator', 'crudbuilder', '1', 1),
(8, 14, 2, 40, 'fas fa-bars', 'Menu', 'cms/menu/side-menu', 'navMenu', 1),
(40, 13, 1, 0, 'empty', 'DEV', '#', '#', 1),
(42, 9, 2, 115, 'fas fa-users-cog', 'User dan Group', '#', '1', 1),
(43, 10, 3, 42, 'fas fa-user-plus', 'Users', 'users', '1', 1),
(44, 11, 3, 42, 'fas fa-users', 'Groups', 'groups', '2', 1),
(89, 15, 2, 40, 'fas fa-th-list', 'Menu Type', 'menu_type', 'menu_type', 1),
(115, 8, 1, 0, 'fas fa-globe', 'SETTING', '#', 'setting', 1),
(116, 12, 2, 115, 'fas fa-user-slash', 'Permission Kirim Surat', 'Permission', 'Permission', 1),
(117, 2, 2, 1, 'fas fa-envelope-open-text', 'Surat Internal', 'Surat', 'surat', 1),
(118, 7, 2, 1, 'fas fa-archive', 'Tembusan', 'Tembusan', 'Tembusan', 1),
(119, 4, 3, 117, 'far fa-paper-plane', 'Surat Terkirim', 'surat/terkirim', '4', 1),
(120, 3, 3, 117, 'fas fa-inbox', 'Surat Masuk', 'surat', '12', 1),
(125, 5, 3, 117, 'fas fa-plus-circle', 'Tambah Surat', 'surat/create', '1', 1),
(126, 6, 2, 117, 'fas fa-envelope-open-text', 'Surat Eksternal', 'surat/index/eksternal', '1', 1);

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
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `jenis` enum('internal','eksternal','','') NOT NULL DEFAULT 'internal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `surat`
--

INSERT INTO `surat` (`id`, `tanggal`, `nomor_surat`, `lampiran`, `perihal`, `isi_surat`, `nomor_agenda`, `tgl_agenda`, `post_date`, `status`, `jenis`) VALUES
(56, '2020-09-01', '12345', '1', 'tes balas', '<p>gf</p>', NULL, NULL, '2020-09-11 15:41:42', '0', 'internal'),
(57, '2020-09-01', '404', '1', 'asdasdas', '<p>asd</p>', NULL, NULL, '2020-09-11 15:54:41', '0', 'internal'),
(58, '2020-09-01', '12345', '1', 'asdasd', '<p>asdasdasd</p>', NULL, NULL, '2020-09-11 18:36:39', '0', 'internal'),
(59, '2020-09-03', '404', '1', 'tes balas', '<p>asdasd</p>', NULL, NULL, '2020-09-11 19:07:24', '0', 'internal'),
(60, '2020-09-02', '404', '1', 'tes balas2', '<p>kl</p>', NULL, NULL, '2020-09-11 19:31:25', '1', 'internal'),
(61, '2020-09-01', '12345', '1', 'tes balas', '<p>as</p>', NULL, NULL, '2020-09-13 04:35:41', '0', 'internal'),
(62, '2020-09-01', '12345', '1', 'tes balas', '<p>sda</p>', NULL, NULL, '2020-09-14 11:55:33', '1', 'internal'),
(63, '2020-09-02', '404', '1', 'sda', '<p>asd</p>', NULL, NULL, '2020-09-14 11:56:15', '1', 'internal'),
(64, '2020-09-02', '12345', '1', 'tes balas2', '<p>das</p>', NULL, NULL, '2020-09-15 06:32:05', '0', 'internal'),
(65, '2020-09-01', '12345', '1', 'asd', '<p>asd</p>', NULL, NULL, '2020-09-15 06:32:13', '0', 'internal'),
(66, '2020-09-15', '12345', '1', 'asdas', '<p>asddasdas</p>', NULL, NULL, '2020-09-15 06:32:25', '0', 'internal'),
(67, '2020-09-01', '12345', '1', 'asd', '<p>asd</p>', NULL, NULL, '2020-09-15 06:58:20', '0', 'internal'),
(68, '2020-09-02', '12345', '1', 'asd', '<p>das</p>', NULL, NULL, '2020-09-15 06:58:28', '0', 'internal'),
(69, '2020-09-03', '12345', '1', 'das', '<p>da</p>', NULL, NULL, '2020-09-15 06:58:35', '0', 'internal'),
(70, '2020-09-02', '12345', '1', 'das', '<p>das</p>', NULL, NULL, '2020-09-15 06:58:42', '0', 'internal'),
(71, '2020-09-01', '12345', '1', 'asd', '<p>das</p>', NULL, NULL, '2020-09-15 06:58:49', '0', 'internal'),
(72, '2020-09-02', '404', '1', 'tes balas2', '<p>das</p>', NULL, NULL, '2020-09-15 06:59:00', '0', 'internal'),
(73, '2020-09-02', '1', '1', 'das', '<p>das</p>', NULL, NULL, '2020-09-15 06:59:10', '0', 'internal'),
(74, '2020-09-02', '12345', '1', 'das', '<p>asdasd</p>', NULL, NULL, '2020-09-15 06:59:56', '0', 'internal'),
(75, '2020-09-02', '01.004/HMMI/IX/2020', '1', 'Wisuda', '<p>\r\n\r\nDengan hormat, </p><p>Berdasarkan SE Pengurus YPBPI Nomor 262/YPBPI/Kug/0520 tanggal 4 Mei 2020 tentang Keringanan\r\nSPP Mahasiswa dalam bentuk bantuan subsidi kuota Internet, dan memperhatikan hasil Obras perwakilan\r\nmahasiswa dengan pihak manajemen Politeknik Pos Indonesia tanggal 11 Mei 2020 dan Surat Direktur\r\nPoliteknik Pos Indonesia Nomor 348/DIR/PPI/V/20 tanggal 16 mei 2020 mengenai Laporan hasil Obras\r\ndengan mahasiswa kepada YPBPI, dengan ini kami sampaikan sebagai berikut: </p><p>1. Wabah Covid-19 telah berdampak negatif terhadap perekonomian nasional dan global, termasuk sektor\r\nPendidikan. Untuk itu kami Mengajak seluruh Civitas Akademika untuk secara bersama-sama dengan\r\nseluruh stakeholder untuk meningkatkan “sense of crisis” dalam mengahadapi Pandemi ini sehingga\r\nkita semua dapat melaluinya dengan selamat. </p><p>2. Pelaksanaan perkuliahan daring tidak berpengaruh signifikan terhadap penurunan biaya operasional\r\nPendidikan di Politeknik Pos Indonesia, kecuali terhadap biaya listrik dan ATK, dimana persentase\r\nbiaya ini sangat kecil dari total biaya operasional Poltekpos. Tabel di bawah ini menjelaskan biaya\r\nPendidikan di Politeknik Pos Indonesia berdasarkan persentase terbesar\r\n\r\n<br></p>', NULL, NULL, '2020-09-20 15:04:18', '0', 'internal'),
(76, '2020-09-24', '02.004/HMMI/IX/2020', '1', 'Yudisium', '<p>\r\n\r\n</p><p>Dengan hormat, </p><p>Berdasarkan SE Pengurus YPBPI Nomor 262/YPBPI/Kug/0520 tanggal 4 Mei 2020 tentang Keringanan SPP Mahasiswa dalam bentuk bantuan subsidi kuota Internet, dan memperhatikan hasil Obras perwakilan mahasiswa dengan pihak manajemen Politeknik Pos Indonesia tanggal 11 Mei 2020 dan Surat Direktur Politeknik Pos Indonesia Nomor 348/DIR/PPI/V/20 tanggal 16 mei 2020 mengenai Laporan hasil Obras dengan mahasiswa kepada YPBPI, dengan ini kami sampaikan sebagai berikut: </p><p>1. Wabah Covid-19 telah berdampak negatif terhadap perekonomian nasional dan global, termasuk sektor Pendidikan. Untuk itu kami Mengajak seluruh Civitas Akademika untuk secara bersama-sama dengan seluruh stakeholder untuk meningkatkan “sense of crisis” dalam mengahadapi Pandemi ini sehingga kita semua dapat melaluinya dengan selamat. </p><p>2. Pelaksanaan perkuliahan daring tidak berpengaruh signifikan terhadap penurunan biaya operasional Pendidikan di Politeknik Pos Indonesia, kecuali terhadap biaya listrik dan ATK, dimana persentase biaya ini sangat kecil dari total biaya operasional Poltekpos. Tabel di bawah ini menjelaskan biaya Pendidikan di Politeknik Pos Indonesia berdasarkan persentase terbesar<br></p><br>\r\n\r\n<br><p></p>', '12345678910', '2020-09-24', '2020-09-24 03:23:47', '1', 'internal'),
(77, '2020-09-24', '21321321321321', '1', 'tes balas2', '<p>sdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>', '123', '2020-09-24', '2020-09-24 03:33:32', '0', 'internal'),
(78, '2020-09-16', '12345', '1', 'YUDISIUM', '<p>jashndkjnasdkjnaskjdnkjasndkjasndkj</p>', '12345678', '2020-09-24', '2020-09-24 16:50:18', '0', 'internal'),
(79, '2020-09-01', '12345', '1', 'as', '<p>das</p>', NULL, NULL, '2020-09-24 16:55:17', '0', 'internal'),
(80, '2020-09-25', '03.004/HMMI/IX/2020', '1', 'Yudisium Online', '<p>\r\n\r\n</p><p>Dengan hormat,</p><p>Berdasarkan SE Pengurus YPBPI Nomor 262/YPBPI/Kug/0520 tanggal 4 Mei 2020 tentang Keringanan SPP Mahasiswa dalam bentuk bantuan subsidi kuota Internet, dan memperhatikan hasil Obras perwakilan mahasiswa dengan pihak manajemen Politeknik Pos Indonesia tanggal 11 Mei 2020 dan Surat Direktur Politeknik Pos Indonesia Nomor 348/DIR/PPI/V/20 tanggal 16 mei 2020 mengenai Laporan hasil Obras dengan mahasiswa kepada YPBPI, dengan ini kami sampaikan sebagai berikut:</p><p>1. Wabah Covid-19 telah berdampak negatif terhadap perekonomian nasional dan global, termasuk sektor Pendidikan. Untuk itu kami Mengajak seluruh Civitas Akademika untuk secara bersama-sama dengan seluruh stakeholder untuk meningkatkan “sense of crisis” dalam mengahadapi Pandemi ini sehingga kita semua dapat melaluinya dengan selamat.</p><p>2. Pelaksanaan perkuliahan daring tidak berpengaruh signifikan terhadap penurunan biaya operasional Pendidikan di Politeknik Pos Indonesia, kecuali terhadap biaya listrik dan ATK, dimana persentase biaya ini sangat kecil dari total biaya operasional Poltekpos. Tabel di bawah ini menjelaskan biaya Pendidikan di Politeknik Pos Indonesia berdasarkan persentase terbesar</p>\r\n\r\n<br><p></p>', '12345678', '2020-09-24', '2020-09-24 17:02:39', '0', 'internal'),
(81, '2020-09-03', '404', '1', 'asdasdasd', '<p>asdasdasdasdasdas</p>', NULL, NULL, '2020-09-24 17:11:22', '1', 'internal'),
(82, '2020-09-23', '04.004/HMMI/IX/2020', '1', 'Yudisium Online', '<p>\r\n\r\n</p><p>Dengan hormat,</p><p>Berdasarkan SE Pengurus YPBPI Nomor 262/YPBPI/Kug/0520 tanggal 4 Mei 2020 tentang Keringanan SPP Mahasiswa dalam bentuk bantuan subsidi kuota Internet, dan memperhatikan hasil Obras perwakilan mahasiswa dengan pihak manajemen Politeknik Pos Indonesia tanggal 11 Mei 2020 dan Surat Direktur Politeknik Pos Indonesia Nomor 348/DIR/PPI/V/20 tanggal 16 mei 2020 mengenai Laporan hasil Obras dengan mahasiswa kepada YPBPI, dengan ini kami sampaikan sebagai berikut:</p><p>1. Wabah Covid-19 telah berdampak negatif terhadap perekonomian nasional dan global, termasuk sektor Pendidikan. Untuk itu kami Mengajak seluruh Civitas Akademika untuk secara bersama-sama dengan seluruh stakeholder untuk meningkatkan “sense of crisis” dalam mengahadapi Pandemi ini sehingga kita semua dapat melaluinya dengan selamat.</p><p>2. Pelaksanaan perkuliahan daring tidak berpengaruh signifikan terhadap penurunan biaya operasional Pendidikan di Politeknik Pos Indonesia, kecuali terhadap biaya listrik dan ATK, dimana persentase biaya ini sangat kecil dari total biaya operasional Poltekpos. Tabel di bawah ini menjelaskan biaya Pendidikan di Politeknik Pos Indonesia berdasarkan persentase terbesar</p>\r\n\r\n<br><p></p>', '12345678', '2020-09-24', '2020-09-24 17:27:38', '1', 'internal'),
(83, '2020-09-24', '12345', '1', 'WISUDA', '<p>sadasdsadsadasds</p>', '123', '2020-09-25', '2020-09-25 06:35:30', '1', 'internal'),
(84, '2020-09-30', '12345', '1', 'YUDISIUM', '<p>asjdnkjasdkjasd</p>', '123', '2020-09-25', '2020-09-25 06:40:03', '1', 'internal'),
(85, '2020-09-02', '12345', '1', 'sadsadsa', '<p>jadnkskjnaskjdnasjkjasdkjas</p>\r\n<p> </p>\r\n<table class=\"MsoTableGrid\" xss=removed border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td xss=removed valign=\"top\">\r\n<p xss=removed>Sdasd</p>\r\n</td>\r\n<td xss=removed valign=\"top\">\r\n<p xss=removed>Adsdasd</p>\r\n</td>\r\n<td xss=removed valign=\"top\">\r\n<p xss=removed>Dsadasd</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td xss=removed valign=\"top\">\r\n<p xss=removed>Asddsad</p>\r\n</td>\r\n<td xss=removed valign=\"top\">\r\n<p xss=removed>Dsadas</p>\r\n</td>\r\n<td xss=removed valign=\"top\">\r\n<p xss=removed>dasdsa</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td xss=removed valign=\"top\">\r\n<p xss=removed> </p>\r\n</td>\r\n<td xss=removed valign=\"top\">\r\n<p xss=removed> </p>\r\n</td>\r\n<td xss=removed valign=\"top\">\r\n<p xss=removed> </p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td xss=removed valign=\"top\">\r\n<p xss=removed> </p>\r\n</td>\r\n<td xss=removed valign=\"top\">\r\n<p xss=removed> </p>\r\n</td>\r\n<td xss=removed valign=\"top\">\r\n<p xss=removed> </p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', NULL, NULL, '2020-09-25 07:25:47', '0', 'internal'),
(86, '2020-09-01', '12345', '1', 'tes balas2', '<p>asdasdasdasdsaadasdads</p>', NULL, NULL, '2020-09-25 11:58:48', '0', 'internal'),
(87, '2020-09-30', '12345', '1', 'asdasdasdas', '<p>asdasdasdasdas</p>', NULL, NULL, '2020-09-25 12:07:28', '0', 'internal'),
(88, '2020-09-29', '05.004/HMMI/IX/2020', '1', 'Wisuda', '<p>Dengan hormat,</p>\r\n<p>Berdasarkan SE Pengurus YPBPI Nomor 262/YPBPI/Kug/0520 tanggal 4 Mei 2020 tentang Keringanan SPP Mahasiswa dalam bentuk bantuan subsidi kuota Internet, dan memperhatikan hasil Obras perwakilan mahasiswa dengan pihak manajemen Politeknik Pos Indonesia tanggal 11 Mei 2020 dan Surat Direktur Politeknik Pos Indonesia Nomor 348/DIR/PPI/V/20 tanggal 16 mei 2020 mengenai Laporan hasil Obras dengan mahasiswa kepada YPBPI, dengan ini kami sampaikan sebagai berikut:</p>\r\n<p>1. Wabah Covid-19 telah berdampak negatif terhadap perekonomian nasional dan global, termasuk sektor Pendidikan. Untuk itu kami Mengajak seluruh Civitas Akademika untuk secara bersama-sama dengan seluruh stakeholder untuk meningkatkan “sense of crisis” dalam mengahadapi Pandemi ini sehingga kita semua dapat melaluinya dengan selamat.</p>\r\n<p>2. Pelaksanaan perkuliahan daring tidak berpengaruh signifikan terhadap penurunan biaya operasional Pendidikan di Politeknik Pos Indonesia, kecuali terhadap biaya listrik dan ATK, dimana persentase biaya ini sangat kecil dari total biaya operasional Poltekpos. Tabel di bawah ini menjelaskan biaya Pendidikan di Politeknik Pos Indonesia berdasarkan persentase terbesar</p>', '20200909', '2020-09-26', '2020-09-26 04:39:34', '1', 'internal'),
(89, '2020-09-23', '12345', '1', 'tes balas13', '<p>asdasdasdas</p>', '123', '2020-09-26', '2020-09-26 04:57:18', '0', 'internal'),
(90, '2020-09-09', '12345', '1', 'tes balas2', '<p>asdasdasd</p>', NULL, NULL, '2020-09-26 05:28:30', '0', 'internal'),
(91, '2020-09-09', '12345', '1', 'tes balas', '<p>asdasdasda</p>', NULL, NULL, '2020-09-26 11:45:51', '1', 'internal'),
(92, '2020-09-28', '06.004/HMMI/IX/2020', '1', 'Yudisium Manajemen Informatika', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio pariatur nam eum reprehenderit sit, voluptatibus aspernatur eos dolores, mollitia sunt reiciendis accusamus aut molestiae voluptatem non vitae quas praesentium expedita! Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio pariatur nam eum reprehenderit sit, voluptatibus aspernatur eos dolores, mollitia sunt reiciendis accusamus aut molestiae voluptatem non vitae quas praesentium expedita!</p>\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio pariatur nam eum reprehenderit sit, voluptatibus aspernatur eos dolores, mollitia sunt reiciendis accusamus aut molestiae voluptatem non vitae quas praesentium expedita! Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio pariatur nam eum reprehenderit sit, voluptatibus aspernatur eos dolores, mollitia sunt reiciendis accusamus aut molestiae voluptatem non vitae quas praesentium expedita!</p>', NULL, NULL, '2020-09-28 08:28:51', '0', 'internal'),
(93, '2020-09-28', '06.004/HMMI/IX/2020', '1', 'Yudisium Manajemen Informatika', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio pariatur nam eum reprehenderit sit, voluptatibus aspernatur eos dolores, mollitia sunt reiciendis accusamus aut molestiae voluptatem non vitae quas praesentium expedita! Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio pariatur nam eum reprehenderit sit, voluptatibus aspernatur eos dolores, mollitia sunt reiciendis accusamus aut molestiae voluptatem non vitae quas praesentium expedita!</p>\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio pariatur nam eum reprehenderit sit, voluptatibus aspernatur eos dolores, mollitia sunt reiciendis accusamus aut molestiae voluptatem non vitae quas praesentium expedita! Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio pariatur nam eum reprehenderit sit, voluptatibus aspernatur eos dolores, mollitia sunt reiciendis accusamus aut molestiae voluptatem non vitae quas praesentium expedita!</p>', NULL, NULL, '2020-09-28 08:31:23', '0', 'internal'),
(94, '2020-09-28', '06.004/HMMI/IX/2020', '1', 'Yudisium Manajemen Informatika', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio pariatur nam eum reprehenderit sit, voluptatibus aspernatur eos dolores, mollitia sunt reiciendis accusamus aut molestiae voluptatem non vitae quas praesentium expedita! Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio pariatur nam eum reprehenderit sit, voluptatibus aspernatur eos dolores, mollitia sunt reiciendis accusamus aut molestiae voluptatem non vitae quas praesentium expedita!</p>\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio pariatur nam eum reprehenderit sit, voluptatibus aspernatur eos dolores, mollitia sunt reiciendis accusamus aut molestiae voluptatem non vitae quas praesentium expedita! Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio pariatur nam eum reprehenderit sit, voluptatibus aspernatur eos dolores, mollitia sunt reiciendis accusamus aut molestiae voluptatem non vitae quas praesentium expedita!</p>', NULL, NULL, '2020-09-28 08:31:33', '0', 'internal'),
(95, '2020-09-30', '06.004/HMMI/IX/2020', '1', 'Yudisium Manajemen Informatika', '<p>Dengan hormat,</p>\r\n<p>Berdasarkan SE Pengurus YPBPI Nomor 262/YPBPI/Kug/0520 tanggal 4 Mei 2020 tentang Keringanan SPP Mahasiswa dalam bentuk bantuan subsidi kuota Internet, dan memperhatikan hasil Obras perwakilan mahasiswa dengan pihak manajemen Politeknik Pos Indonesia tanggal 11 Mei 2020 dan Surat Direktur Politeknik Pos Indonesia Nomor 348/DIR/PPI/V/20 tanggal 16 mei 2020 mengenai Laporan hasil Obras dengan mahasiswa kepada YPBPI, dengan ini kami sampaikan sebagai berikut:</p>\r\n<p>1. Wabah Covid-19 telah berdampak negatif terhadap perekonomian nasional dan global, termasuk sektor Pendidikan. Untuk itu kami Mengajak seluruh Civitas Akademika untuk secara bersama-sama dengan seluruh stakeholder untuk meningkatkan “sense of crisis” dalam mengahadapi Pandemi ini sehingga kita semua dapat melaluinya dengan selamat.</p>\r\n<p>2. Pelaksanaan perkuliahan daring tidak berpengaruh signifikan terhadap penurunan biaya operasional Pendidikan di Politeknik Pos Indonesia, kecuali terhadap biaya listrik dan ATK, dimana persentase biaya ini sangat kecil dari total biaya operasional Poltekpos. Tabel di bawah ini menjelaskan biaya Pendidikan di Politeknik Pos Indonesia berdasarkan persentase terbesar</p>\r\n<p> </p>', NULL, NULL, '2020-09-28 09:05:07', '0', 'internal'),
(96, '2020-09-30', '06.004/HMMI/IX/2020', '1', 'Wisuda Manajemen Informatika', '<p>Dengan hormat,</p>\r\n<p> </p>\r\n<p>Berdasarkan SE Pengurus YPBPI Nomor 262/YPBPI/Kug/0520 tanggal 4 Mei 2020 tentang Keringanan SPP Mahasiswa dalam bentuk bantuan subsidi kuota Internet, dan memperhatikan hasil Obras perwakilan mahasiswa dengan pihak manajemen Politeknik Pos Indonesia tanggal 11 Mei 2020 dan Surat Direktur Politeknik Pos Indonesia Nomor 348/DIR/PPI/V/20 tanggal 16 mei 2020 mengenai Laporan hasil Obras dengan mahasiswa kepada YPBPI, dengan ini kami sampaikan sebagai berikut:</p>\r\n<p> </p>\r\n<p>1. Wabah Covid-19 telah berdampak negatif terhadap perekonomian nasional dan global, termasuk sektor Pendidikan. Untuk itu kami Mengajak seluruh Civitas Akademika untuk secara bersama-sama dengan seluruh stakeholder untuk meningkatkan “sense of crisis” dalam mengahadapi Pandemi ini sehingga kita semua dapat melaluinya dengan selamat.</p>\r\n<p> </p>\r\n<p>2. Pelaksanaan perkuliahan daring tidak berpengaruh signifikan terhadap penurunan biaya operasional Pendidikan di Politeknik Pos Indonesia, kecuali terhadap biaya listrik dan ATK, dimana persentase biaya ini sangat kecil dari total biaya operasional Poltekpos. Tabel di bawah ini menjelaskan biaya Pendidikan di Politeknik Pos Indonesia berdasarkan persentase terbesar</p>', NULL, NULL, '2020-09-28 10:10:10', '0', 'internal'),
(97, '2020-10-06', '06.004/HMMI/IX/2020', '1', 'Wisuda', '<p>berikut </p>', '123', '2020-10-06', '2020-10-06 07:05:19', '1', 'internal'),
(98, '2020-09-10', '06.004/HMMI/IX/2020', '1', 'Yudisium Online', '<p>isi surat</p>', NULL, NULL, '2020-10-06 07:13:53', '1', 'internal'),
(99, '2020-09-30', '00001', '3', 'Tes Hak Akses 1', '<p>bebas</p>', NULL, NULL, '2020-10-07 13:30:03', '0', 'internal'),
(100, '2020-09-03', 'ns', '1', 'tes balas', '<p>asd</p>', NULL, NULL, '2020-10-08 01:40:08', '0', 'internal');

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
(53, 195, 76, 'Sponsorship_Proposal_XL.pdf'),
(54, 271, 88, 'hmmi_yudisium_terbaik-03.png'),
(55, 295, 97, '01_Surat_Edaran_Mhs_MI.pdf'),
(56, 303, 98, '02__Surat_Undangan_Kaprodi_MI_(1).pdf'),
(57, 304, 99, '01_Surat_Edaran_Mhs_MI1.pdf'),
(58, 304, 99, '02__Surat_Undangan_Kaprodi_MI_(1)1.pdf'),
(59, 304, 99, '02__Surat_Undangan_Kaprodi_MI_(2).pdf'),
(60, 305, 99, 'hmmi_yudisium_f-01.png'),
(61, 306, 99, 'Surat_23_(Surat_Edaran_TK_3).pdf');

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
(16, 60, 8),
(17, 75, 8),
(18, 76, 5),
(19, 83, 7),
(20, 84, 7),
(21, 85, 7),
(22, 88, 6),
(23, 89, 7),
(24, 90, 6),
(25, 92, 8),
(26, 94, 8),
(27, 95, 4),
(28, 95, 3),
(29, 95, 2),
(30, 96, 7),
(31, 96, 4),
(32, 97, 8),
(33, 98, 8),
(34, 99, 6);

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
  `visibility` enum('0','1') NOT NULL DEFAULT '0',
  `note` varchar(225) DEFAULT NULL,
  `status_progress` enum('0','1','','') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tujuan`
--

INSERT INTO `tujuan` (`id`, `id_surat`, `dari`, `kepada`, `post_date`, `status`, `isi`, `visibility`, `note`, `status_progress`) VALUES
(150, 52, 9, 10, '2020-09-11 13:31:04', '1', NULL, '1', NULL, '0'),
(151, 52, 10, 9, '2020-09-11 13:32:20', '1', '<p>pesan 2</p>', '1', NULL, '0'),
(152, 52, 10, 9, '2020-09-11 20:53:14', '0', '<div class=\'alert alert-success\'><i class=\'fa fa-check\'></i> Surat telah diagendakan.</div>', '1', NULL, '0'),
(153, 53, 9, 10, '2020-09-11 20:53:57', '1', NULL, '1', NULL, '0'),
(154, 53, 10, 7, '2020-09-11 20:54:14', '0', '<div class=\'alert alert-success\'><i class=\'fa fa-check\'></i> Surat telah diagendakan.</div>', '1', NULL, '0'),
(155, 54, 9, 10, '2020-09-11 20:58:44', '1', NULL, '1', NULL, '0'),
(156, 54, 10, 9, '2020-09-11 20:59:30', '1', '<p>asdasdasd</p>', '1', NULL, '0'),
(157, 54, 9, 10, '2020-09-11 20:59:46', '1', '<p>iya</p>', '1', NULL, '0'),
(158, 54, 10, 9, '2020-09-11 20:59:58', '1', '<p>asd</p>', '1', NULL, '0'),
(159, 54, 9, 10, '2020-09-11 21:00:07', '1', '<p>asd</p>', '1', NULL, '0'),
(160, 54, 9, 10, '2020-09-11 21:00:24', '1', '<p>asdasd</p>', '1', NULL, '0'),
(161, 54, 9, 10, '2020-09-11 21:00:37', '1', '<p>asdas</p>', '1', NULL, '0'),
(162, 54, 10, 5, '2020-09-11 21:00:57', '0', '<div class=\'alert alert-success\'><i class=\'fa fa-check\'></i> Surat telah diagendakan.</div>', '1', NULL, '0'),
(163, 55, 9, 10, '2020-09-11 21:04:26', '1', NULL, '1', NULL, '0'),
(164, 55, 10, 9, '2020-09-11 21:23:48', '1', '<p>pesan 2</p>', '1', NULL, '0'),
(165, 55, 9, 10, '2020-09-11 21:24:01', '1', '<p>pesan 3</p>', '1', NULL, '0'),
(166, 55, 10, 6, '2020-09-11 21:24:09', '0', '<div class=\'alert alert-success\'><i class=\'fa fa-check\'></i> Surat telah diagendakan.</div>', '1', NULL, '0'),
(167, 56, 10, 8, '2020-09-11 22:41:42', '0', NULL, '1', NULL, '0'),
(168, 57, 10, 6, '2020-09-11 22:54:41', '0', NULL, '1', NULL, '0'),
(169, 58, 9, 10, '2020-09-12 01:36:39', '1', NULL, '1', NULL, '0'),
(170, 59, 9, 8, '2020-09-12 02:07:24', '1', NULL, '1', NULL, '0'),
(171, 59, 9, 6, '2020-09-12 02:07:24', '0', NULL, '1', NULL, '0'),
(172, 60, 9, 10, '2020-09-12 02:31:25', '0', NULL, '1', NULL, '0'),
(173, 60, 9, 6, '2020-09-12 02:31:25', '0', NULL, '1', NULL, '0'),
(174, 60, 10, 9, '2020-09-12 03:14:33', '1', '<p>asd</p>', '1', NULL, '0'),
(175, 60, 9, 10, '2020-09-12 03:14:49', '0', '<p>apa</p>', '1', NULL, '0'),
(176, 61, 9, 8, '2020-09-13 11:35:41', '1', NULL, '1', NULL, '0'),
(177, 62, 8, 9, '2020-09-14 18:55:33', '1', NULL, '1', NULL, '0'),
(178, 63, 8, 9, '2020-09-14 18:56:15', '1', NULL, '1', NULL, '0'),
(179, 63, 9, 8, '2020-09-14 19:33:15', '1', '<p>selesai</p>', '1', NULL, '0'),
(180, 62, 9, 8, '2020-09-14 19:33:30', '0', '<p>selesai</p>', '1', NULL, '0'),
(181, 60, 9, 10, '2020-09-14 19:33:40', '0', '<p>selesai</p>', '1', NULL, '0'),
(182, 60, 9, 10, '2020-09-14 19:33:53', '0', '<p>selesai</p>', '1', NULL, '0'),
(183, 64, 9, 7, '2020-09-15 13:32:05', '0', NULL, '1', NULL, '0'),
(184, 65, 9, 6, '2020-09-15 13:32:14', '0', NULL, '1', NULL, '0'),
(185, 66, 9, 3, '2020-09-15 13:32:25', '0', NULL, '1', NULL, '0'),
(186, 67, 8, 9, '2020-09-15 13:58:20', '0', NULL, '1', NULL, '0'),
(187, 68, 8, 9, '2020-09-15 13:58:28', '0', NULL, '1', NULL, '0'),
(188, 69, 8, 9, '2020-09-15 13:58:35', '0', NULL, '1', NULL, '0'),
(189, 70, 8, 9, '2020-09-15 13:58:42', '0', NULL, '1', NULL, '0'),
(190, 71, 8, 9, '2020-09-15 13:58:49', '0', NULL, '1', NULL, '0'),
(191, 72, 8, 9, '2020-09-15 13:59:00', '0', NULL, '1', NULL, '0'),
(192, 73, 8, 9, '2020-09-15 13:59:10', '1', NULL, '1', NULL, '0'),
(193, 74, 8, 9, '2020-09-15 13:59:56', '1', NULL, '1', NULL, '0'),
(194, 75, 9, 10, '2020-09-20 22:04:18', '0', NULL, '1', NULL, '0'),
(195, 76, 8, 9, '2020-09-24 10:23:47', '1', NULL, '1', NULL, '0'),
(196, 76, 9, 8, '2020-09-24 10:28:12', '1', '<p>\r\n\r\nBerdasarkan SE Pengurus YPBPI Nomor 262/YPBPI/Kug/0520 tanggal 4 Mei 2020 tentang Keringanan SPP Mahasiswa dalam bentuk bantuan subsidi kuota Internet, dan memperhatikan hasil Obras perwakilan mahasiswa dengan pihak manajemen Politeknik Pos Indonesia tanggal 11 Mei 2020 dan Surat Direktur Politeknik Pos Indonesia Nomor 348/DIR/PPI/V/20 tanggal 16 mei 2020 mengenai Laporan hasil Obras dengan mahasiswa kepada YPBPI, dengan ini kami sampaikan sebagai berikut:\r\n\r\n<br></p>', '1', NULL, '0'),
(197, 76, 8, 10, '2020-09-24 10:28:39', '1', '<p>\r\n\r\nBerdasarkan SE Pengurus YPBPI Nomor 262/YPBPI/Kug/0520 tanggal 4 Mei 2020 tentang Keringanan SPP Mahasiswa dalam bentuk bantuan subsidi kuota Internet, dan memperhatikan hasil Obras perwakilan mahasiswa dengan pihak manajemen Politeknik Pos Indonesia tanggal 11 Mei 2020 dan Surat Direktur Politeknik Pos Indonesia Nomor 348/DIR/PPI/V/20 tanggal 16 mei 2020 mengenai Laporan hasil Obras dengan mahasiswa kepada YPBPI, dengan ini kami sampaikan sebagai berikut:\r\n\r\n<br></p>', '1', NULL, '0'),
(198, 76, 8, 9, '2020-09-24 10:28:39', '1', '<p>\r\n\r\nBerdasarkan SE Pengurus YPBPI Nomor 262/YPBPI/Kug/0520 tanggal 4 Mei 2020 tentang Keringanan SPP Mahasiswa dalam bentuk bantuan subsidi kuota Internet, dan memperhatikan hasil Obras perwakilan mahasiswa dengan pihak manajemen Politeknik Pos Indonesia tanggal 11 Mei 2020 dan Surat Direktur Politeknik Pos Indonesia Nomor 348/DIR/PPI/V/20 tanggal 16 mei 2020 mengenai Laporan hasil Obras dengan mahasiswa kepada YPBPI, dengan ini kami sampaikan sebagai berikut:\r\n\r\n<br></p>', '1', NULL, '0'),
(199, 76, 10, 5, '2020-09-24 10:29:51', '1', '<div class=\'alert alert-success\'><i class=\'fa fa-check\'></i> Surat telah diagendakan.</div>', '1', NULL, '0'),
(200, 76, 5, 10, '2020-09-24 10:32:05', '1', '<p>ok</p>', '1', NULL, '0'),
(201, 77, 9, 10, '2020-09-24 10:33:32', '1', NULL, '1', NULL, '0'),
(202, 77, 10, 5, '2020-09-24 10:34:07', '1', '<div class=\'alert alert-success\'><i class=\'fa fa-check\'></i> Surat telah diagendakan.</div>', '1', NULL, '0'),
(203, 77, 5, 10, '2020-09-24 10:34:16', '1', '<p>asdsda</p>', '1', NULL, '0'),
(204, 77, 5, 10, '2020-09-24 23:49:26', '1', '<p>s</p>', '1', NULL, '0'),
(205, 78, 9, 10, '2020-09-24 23:50:18', '0', NULL, '1', NULL, '0'),
(206, 78, 10, 9, '2020-09-24 23:51:19', '0', '<p>belum lengkap</p>', '1', NULL, '0'),
(207, 78, 9, 10, '2020-09-24 23:51:35', '0', '<p>lengkap</p><p><br></p>', '1', NULL, '0'),
(208, 78, 10, 9, '2020-09-24 23:51:46', '0', '<p>belum lengkap</p>', '1', NULL, '0'),
(209, 78, 10, 9, '2020-09-24 23:52:25', '0', '<p>belum lengkap2</p>', '1', NULL, '0'),
(210, 78, 9, 10, '2020-09-24 23:52:34', '0', '<p>oke lengkap</p>', '1', NULL, '0'),
(211, 78, 10, 5, '2020-09-24 23:52:49', '1', '<div class=\'alert alert-success\'><i class=\'fa fa-check\'></i> Surat telah diagendakan.</div>', '1', NULL, '0'),
(212, 78, 10, 5, '2020-09-24 23:53:55', '1', '<div class=\'alert alert-success\'><i class=\'fa fa-check\'></i> Surat telah diagendakan.</div>', '1', NULL, '0'),
(213, 79, 9, 10, '2020-09-24 23:55:17', '1', NULL, '1', NULL, '1'),
(214, 79, 10, 9, '2020-09-24 23:56:14', '1', '<p>ads</p>', '1', NULL, '0'),
(215, 79, 10, 9, '2020-09-24 23:56:30', '1', '<p>2</p>', '1', NULL, '0'),
(216, 79, 10, 9, '2020-09-24 23:57:11', '1', '<p>asdasdasda</p>', '1', NULL, '0'),
(217, 79, 10, 9, '2020-09-24 23:58:43', '1', '<p>asdasdas</p>', '1', NULL, '0'),
(218, 79, 10, 9, '2020-09-24 23:58:48', '1', '<p>asdsds</p>', '1', NULL, '0'),
(219, 80, 9, 10, '2020-09-25 00:02:39', '0', NULL, '1', NULL, '0'),
(220, 80, 10, 9, '2020-09-25 00:02:55', '1', '<p>mohon lengkapi data</p>', '1', NULL, '0'),
(221, 80, 9, 10, '2020-09-25 00:03:08', '0', '<p>oke</p>', '1', NULL, '0'),
(222, 80, 10, 5, '2020-09-25 00:03:28', '0', '<div class=\'alert alert-success\'><i class=\'fa fa-check\'></i> Surat telah diagendakan.</div>', '1', NULL, '0'),
(223, 80, 5, 10, '2020-09-25 00:03:58', '0', '<p>siap proses</p>', '1', NULL, '0'),
(224, 80, 5, 10, '2020-09-25 00:06:11', '0', '<p>asd</p>', '1', NULL, '0'),
(225, 80, 5, 10, '2020-09-25 00:10:27', '0', '<p>das</p>', '1', NULL, '0'),
(226, 81, 9, 10, '2020-09-25 00:11:22', '0', NULL, '1', NULL, '0'),
(227, 81, 10, 9, '2020-09-25 00:11:34', '1', '<p>ini 2</p>', '1', NULL, '0'),
(228, 81, 9, 10, '2020-09-25 00:18:17', '0', '<p>asdasdasdas</p>', '1', NULL, '0'),
(229, 78, 5, 10, '2020-09-25 00:18:38', '0', '<p>asdasdasdasdasdas</p>', '1', NULL, '0'),
(230, 81, 9, 10, '2020-09-25 00:20:27', '0', '<p>asdasdasd</p>', '1', NULL, '0'),
(231, 78, 5, 10, '2020-09-25 00:20:44', '0', '<p>asdasdasd</p>', '1', NULL, '0'),
(232, 81, 9, 10, '2020-09-25 00:22:05', '0', '<p>asdasdas</p>', '1', NULL, '0'),
(233, 78, 5, 10, '2020-09-25 00:22:29', '0', '<p>asdasds</p>', '1', NULL, '0'),
(234, 78, 5, 10, '2020-09-25 00:23:11', '0', '<p>asdasdas</p>', '1', NULL, '0'),
(235, 81, 9, 10, '2020-09-25 00:23:23', '0', '<p>asdasdas</p>', '1', NULL, '0'),
(236, 81, 9, 10, '2020-09-25 00:24:05', '0', '<p>ada</p>', '1', NULL, '0'),
(237, 78, 5, 10, '2020-09-25 00:24:15', '0', '<p>ada</p>', '1', NULL, '0'),
(238, 82, 9, 10, '2020-09-25 00:27:38', '1', NULL, '1', NULL, '0'),
(239, 82, 10, 9, '2020-09-25 00:27:54', '1', '<p>kurang lengkap</p>', '1', NULL, '0'),
(240, 82, 9, 10, '2020-09-25 00:28:03', '1', '<p>okey</p>', '1', NULL, '0'),
(241, 82, 10, 5, '2020-09-25 00:28:22', '1', '<div class=\'alert alert-success\'><i class=\'fa fa-check\'></i> Surat telah diagendakan.</div>', '1', NULL, '0'),
(242, 82, 5, 10, '2020-09-25 00:28:47', '1', '<p>oke proses</p>', '1', NULL, '0'),
(243, 82, 5, 10, '2020-09-25 00:29:04', '1', '<p>selesai</p>', '1', NULL, '0'),
(244, 83, 9, 10, '2020-09-25 13:35:30', '0', NULL, '1', NULL, '0'),
(245, 83, 10, 9, '2020-09-25 13:36:07', '1', '<p>belum lengkap</p>', '1', NULL, '0'),
(246, 83, 9, 10, '2020-09-25 13:36:21', '0', '<p>lengkap</p>', '1', NULL, '0'),
(247, 83, 10, 5, '2020-09-25 13:36:41', '0', '<div class=\'alert alert-success\'><i class=\'fa fa-check\'></i> Surat telah diagendakan.</div>', '1', NULL, '0'),
(248, 83, 10, 5, '2020-09-25 13:39:18', '0', '<div class=\'alert alert-success\'><i class=\'fa fa-check\'></i> Surat telah diagendakan.</div>', '1', NULL, '0'),
(249, 84, 9, 10, '2020-09-25 13:40:03', '0', NULL, '1', NULL, '0'),
(250, 84, 10, 9, '2020-09-25 13:40:27', '1', '<p>pesan 1</p>', '1', NULL, '0'),
(251, 84, 9, 10, '2020-09-25 13:40:40', '0', '<p>ksadmksad</p>', '1', NULL, '0'),
(252, 84, 10, 5, '2020-09-25 13:40:59', '0', '<div class=\'alert alert-success\'><i class=\'fa fa-check\'></i> Surat telah diagendakan.</div>', '1', NULL, '0'),
(253, 84, 5, 10, '2020-09-25 13:41:29', '0', '<p>oke</p>', '1', NULL, '0'),
(254, 85, 9, 10, '2020-09-25 14:25:47', '0', NULL, '1', NULL, '0'),
(255, 84, 9, 10, '2020-09-25 18:16:57', '0', '<table xss=removed border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td xss=removed> </td>\r\n<td xss=removed> </td>\r\n<td xss=removed> </td>\r\n<td xss=removed> </td>\r\n</tr>\r\n<tr>\r\n<td xss=removed> </td>\r\n<td xss=removed> </td>\r\n<td xss=removed> </td>\r\n<td xss=removed> </td>\r\n</tr>\r\n<tr>\r\n<td xss=removed> </td>\r\n<td xss=removed> </td>\r\n<td xss=removed> </td>\r\n<td xss=removed> </td>\r\n</tr>\r\n</tbody>\r\n</table>', '1', NULL, '0'),
(256, 84, 9, 10, '2020-09-25 18:37:09', '0', '<p>asdasdasdasd</p>', '1', '', '0'),
(257, 84, 9, 10, '2020-09-25 18:37:20', '0', '<p>asdasdasd</p>', '1', '123', '0'),
(258, 84, 9, 10, '2020-09-25 18:44:40', '0', '<p>pesan 12</p>', '1', '', '0'),
(259, 84, 9, 10, '2020-09-25 18:44:59', '0', '<p>pesan 13</p>', '1', '1237777777777777789', '0'),
(260, 83, 9, 10, '2020-09-25 18:45:36', '0', '<p>asdasdasdasdasdasdasdasd</p>', '1', '12345', '0'),
(261, 74, 9, 8, '2020-09-25 18:51:35', '0', '<p>asdasdas</p>', '1', '', '0'),
(262, 81, 9, 10, '2020-09-25 18:52:10', '0', '<p>ds</p>', '1', '', '0'),
(263, 81, 9, 10, '2020-09-25 18:56:42', '0', '<p>asdasdasd</p>', '1', '', '0'),
(264, 81, 9, 10, '2020-09-25 18:57:07', '0', '<p>asdasdas</p>', '1', '', '0'),
(265, 86, 9, 10, '2020-09-25 18:58:48', '1', NULL, '1', NULL, '0'),
(266, 80, 9, 10, '2020-09-25 19:01:25', '0', '<p>dasdasdasdas</p>', '1', '', '0'),
(267, 80, 9, 10, '2020-09-25 19:05:57', '0', '<p>asdasdas</p>', '1', '', '0'),
(268, 80, 9, 10, '2020-09-25 19:07:08', '0', '<p>asdasdas</p>', '1', '', '0'),
(269, 87, 9, 8, '2020-09-25 19:07:28', '0', NULL, '1', NULL, '0'),
(270, 81, 9, 10, '2020-09-26 10:02:33', '0', '<p>asdasdasdasdasd OKE</p>', '1', '12345', '0'),
(271, 88, 9, 10, '2020-09-26 11:39:34', '0', NULL, '1', NULL, '0'),
(272, 88, 10, 9, '2020-09-26 11:40:26', '1', '<p>ini belum lengkap pak. mohon dilengkapi</p>', '1', '', '0'),
(273, 88, 9, 10, '2020-09-26 11:40:50', '0', '<p>saya lengkapi</p>', '1', '', '0'),
(274, 88, 10, 5, '2020-09-26 11:41:52', '1', '<div class=\'alert alert-success\'><i class=\'fa fa-check\'></i> Surat telah diagendakan.</div>', '1', NULL, '0'),
(275, 88, 5, 10, '2020-09-26 11:46:03', '0', '<p>Dengan hormat,</p>\r\n<p>Berdasarkan SE Pengurus YPBPI Nomor 262/YPBPI/Kug/0520 tanggal 4 Mei 2020 tentang Keringanan SPP Mahasiswa dalam bentuk bantuan subsidi kuota Internet,kami menyetujui</p>', '1', '01.004/DIR/IX/2020', '0'),
(276, 89, 9, 10, '2020-09-26 11:57:18', '1', NULL, '1', NULL, '0'),
(277, 89, 10, 5, '2020-09-26 11:57:38', '0', '<div class=\'alert alert-success\'><i class=\'fa fa-check\'></i> Surat telah diagendakan.</div>', '1', NULL, '0'),
(278, 90, 9, 10, '2020-09-26 12:28:30', '0', NULL, '0', NULL, '0'),
(279, 90, 9, 8, '2020-09-26 12:28:30', '1', NULL, '0', NULL, '0'),
(280, 91, 9, 8, '2020-09-26 18:45:51', '1', NULL, '0', NULL, '0'),
(281, 91, 8, 9, '2020-09-26 18:46:02', '1', '<p>asdasdasdasd</p>', '0', '', '0'),
(282, 91, 9, 8, '2020-09-26 18:46:16', '1', '<p>asdasdasdas</p>', '0', '', '0'),
(283, 91, 8, 9, '2020-09-26 18:46:53', '1', '<p>asdasdasd</p>', '0', '01.004/DIR/IX/2020', '0'),
(284, 92, 9, 10, '2020-09-28 15:28:51', '0', NULL, '0', NULL, '0'),
(285, 92, 9, 7, '2020-09-28 15:28:51', '0', NULL, '0', NULL, '0'),
(286, 92, 9, 4, '2020-09-28 15:28:51', '0', NULL, '0', NULL, '0'),
(287, 94, 9, 10, '2020-09-28 15:31:33', '1', NULL, '0', NULL, '0'),
(288, 94, 9, 7, '2020-09-28 15:31:33', '0', NULL, '0', NULL, '0'),
(289, 94, 9, 4, '2020-09-28 15:31:33', '0', NULL, '0', NULL, '0'),
(290, 95, 9, 10, '2020-09-28 16:05:07', '1', NULL, '0', NULL, '0'),
(291, 95, 9, 8, '2020-09-28 16:05:07', '0', NULL, '0', NULL, '0'),
(292, 95, 9, 7, '2020-09-28 16:05:07', '0', NULL, '0', NULL, '0'),
(293, 96, 9, 8, '2020-09-28 17:10:10', '0', NULL, '0', NULL, '0'),
(294, 96, 9, 6, '2020-09-28 17:10:10', '0', NULL, '0', NULL, '0'),
(295, 97, 9, 10, '2020-10-06 14:05:19', '1', NULL, '1', NULL, '0'),
(296, 97, 10, 5, '2020-10-06 14:06:48', '1', '<div class=\'alert alert-success\'><i class=\'fa fa-check\'></i> Surat telah diagendakan.</div>', '1', NULL, '0'),
(297, 97, 5, 10, '2020-10-06 14:07:41', '1', '<p>tes</p>', '1', '', '0'),
(298, 97, 5, 10, '2020-10-06 14:08:20', '1', '<p>coba</p>', '1', '', '0'),
(299, 97, 10, 9, '2020-10-06 14:10:10', '1', '<p>sadasdasd</p>', '1', '', '0'),
(300, 97, 9, 10, '2020-10-06 14:10:24', '1', '<p>ok</p>', '1', '', '0'),
(301, 98, 9, 10, '2020-10-06 14:13:53', '1', NULL, '0', NULL, '0'),
(302, 98, 10, 9, '2020-10-06 14:14:59', '1', '<p>kurang</p>\r\n<p> </p>', '0', '', '0'),
(303, 98, 9, 10, '2020-10-06 14:18:18', '1', '<p>surat</p>', '0', '', '0'),
(304, 99, 9, 10, '2020-10-07 20:30:03', '1', NULL, '0', NULL, '1'),
(305, 99, 10, 9, '2020-10-07 20:34:00', '1', '<p>belum lengkap</p>', '0', '', '0'),
(306, 99, 9, 10, '2020-10-07 20:40:09', '1', '<p>kkjasbdnkjnaskjdnkjasndkjasndkjsa</p>', '0', '', '1'),
(307, 99, 9, 8, '2020-10-07 20:44:14', '0', '<p>masuk</p>', '0', '', '1'),
(308, 99, 9, 10, '2020-10-07 20:44:14', '1', '<p>masuk</p>', '0', '', '1'),
(309, 99, 10, 9, '2020-10-08 08:27:36', '1', 'asdasdas', '0', '', '0'),
(310, 100, 9, 8, '2020-10-08 08:40:08', '0', NULL, '0', NULL, '0');

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
(1, '127.0.0.1', 'admin@admin.com', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', 'm0vyKu2zW7L8PTG20bquF.707e055aeea8a30aca', 1541329145, 'WcHCQ5vcXwT1z99BvJUWnu', 1268889823, 1602137768, 1, 'Admin', 'istrator', '0', 'gold.png', '', 'Admin'),
(2, '::1', 'emay@poltekpos.ac.id', '$2y$08$DCwEdFZ6ZqZ.eSnjaYr8guIl/8mJsTv6yDqYzF0Ae2XTTJYQnwu02', NULL, 'emay@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1575441345, NULL, 1, 'Emay', 'Marshanda', '089610448994', 'default.jpg', '', 'Staff D3 Manajemen Informatika'),
(3, '::1', 'muhammad.akbar5999@gmail.com', '$2y$08$s8cP/qRqPvG6RDDW9qywe.edoTLDeztCBnxoHMjErkitTjzHo4//6', NULL, 'muhammad.akbar5999@gmail.com', NULL, NULL, NULL, NULL, 1598971278, 1599656064, 1, 'Muhammad', 'akbar', '089646817762', 'ak.jpg', '2193013', 'Mahasiswa'),
(4, '::1', 'supono@admin.com2', '$2y$08$eE1/Kn0U9Enl5TNPe7ubUuD7USL4nobYQqblggF48rF7vp3rcHHU.', NULL, 'supono@admin.com2', NULL, NULL, NULL, NULL, 1599030422, NULL, 1, 'Supono', 'Syafiq', '08112272742', 'default.jpg', '12345678', 'Ketua DPRD Kabupaten Karawang'),
(5, '::1', 'agus@poltekpos.ac.id', '$2y$08$JuJojzuAPGjVWx5lP85B6ueGBPMTvXFSD.rRh0g435xL27VXc2up2', NULL, 'agus@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1599361882, 1601967432, 1, 'Agus', 'Purnomo', '08112272742', 'default.jpg', '1234567', 'Direktur'),
(6, '::1', 'dodi@poltekpos.ac.id', '$2y$08$fxBHNyPlKNlKghh4PDqmPeOqgmBdddg64FeW34ot7HUcW1ZWzUL..', NULL, 'dodi@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1599362067, NULL, 1, 'Dodi', 'Permadi', '08112272742', 'default.jpg', '12345678', 'Wakil Direktur 1'),
(7, '::1', 'edi@poltekpos.ac.id', '$2y$08$OZ6daIAM4eCpDfhWNlPsre9ZZiMeuAjxHr1P77t42GNDWS3A38lUS', NULL, 'edi@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1599362147, NULL, 1, 'Edi', 'Supriadi', '08112272742', 'default.jpg', '1234567', 'Wakil Direktur 2'),
(8, '::1', 'hilman@poltekpos.ac.id', '$2y$08$Ej9csZa0q8YEfguGeaCPLOqSV/aMbujkdgQBYTbrGzPym9yVJW0Pq', NULL, 'hilman@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1599362506, 1601120428, 1, 'Hilman', 'Setiadi', '08112272742', 'default.jpg', '1909090', 'Wakil Direktur 3'),
(9, '::1', 'virdy@poltekpos.ac.id', '$2y$08$ilInqxqynFQYDjFlAHdkDO0KpSXdtzMNH.yXaN1AVIB0EmZbRv8P6', NULL, 'virdy@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1599367890, 1602136881, 1, 'Virdiandry', 'Putratama', '08112272742', 'default.jpg', '12345', 'Ketua Prodi D3 Manajemen Informatika'),
(10, '::1', 'popy@gmail.com', '$2y$08$7VHqS2FLmiyL559rQP64RupzPIK26b8RZltrPH5BmCxSD9hkGJXYS', NULL, 'popy@gmail.com', NULL, NULL, NULL, NULL, 1599658042, 1602137266, 1, 'Popy', 'Geovani', '08999999999', 'default.jpg', '123213213213', 'Staff');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `surat_lampiran`
--
ALTER TABLE `surat_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `tembusan`
--
ALTER TABLE `tembusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tujuan`
--
ALTER TABLE `tujuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

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
