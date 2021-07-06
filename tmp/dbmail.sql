-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2021 at 03:57 AM
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
(29, 'STAFF DIREKTUR', 'STAFF DIREKTUR'),
(30, 'KA. HUMAS', 'Kepala Hubungan Masyarakat'),
(31, 'STAFF UNIT', 'Staff Unit');

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
(144, 1, 126),
(145, 29, 126);

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
(51, '::1', 'admin@muhakbar.com', 1616210382),
(52, '::1', 'admin@amizan.id', 1616210386);

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
(126, 6, 3, 117, 'fas fa-envelope-open-text', 'Surat Eksternal', 'surat/eksternal', '1', 1);

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
-- Table structure for table `template_notif`
--

CREATE TABLE `template_notif` (
  `id` int(11) NOT NULL,
  `say_first` varchar(255) NOT NULL,
  `say_end` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `template_notif`
--

INSERT INTO `template_notif` (`id`, `say_first`, `say_end`) VALUES
(1, 'ikan hiu makan tomat, ternyata ada surat', 'jangan lupa di baca yah'),
(2, 'Punten, ada surat masuk nih..', 'dibaca yuk'),
(3, 'hallo.. Ada surat masuk ni..', 'baca dulu yuk'),
(4, 'Kak.. Suratnya kakk?', 'hayu atuh dibaca.. Hehehe'),
(5, 'ada surat nich?', 'hayu di cek dulu..'),
(6, 'say_first', 'say_end'),
(7, 'plis banget ini mah ada surat datang  ini', 'don\'t anggurin aku dibaca yak'),
(8, 'kapan lagi nih ada notif surat masuk', 'read aku dong akang...'),
(9, 'jangan bimbang ini ada surat datang', 'jadi kapan kamu mau baca surat dari aku!!'),
(10, 'aku berharap kamu bisa baca surat dari aku', 'tolong aku nunggu kamu loh, buat baca surat dari aku'),
(11, 'hmmm,surat datang nih', 'plis baca surat ini'),
(12, 'bantu aku,ini ada surat masuk', 'setelah ini kamu baca suratnya yah janji!'),
(13, 'surat masuk nihhhh', 'akutuh pengen diwaro,dibaca maksudnya'),
(14, 'mas ono surat masuk(mas ada surat masuk)', 'ojo lali di woco (jangan lupa dibaca)'),
(15, 'susah aku nih buat surat ', 'mohon dibaca,terakhir ya aku ngingetin kamu'),
(16, 'monitorr,ada surat masuk', 'dibaca yah suratnya'),
(17, 'mba e ada surat masuk ', 'sing ayu di woco nggih'),
(18, 'akang gendang ada surat masuk', 'kalau saya bilang baca , baca yah baca baca'),
(19, 'diingatkan kembali bahwa ada surat masuk', 'udah diingetin berapa kali kan aku udah bilang di baca surat aku'),
(20, 'aku boleh masuk kan ? Surat penting nich', 'dibaca yah biar aku ga sia-sia buatnya'),
(21, 'ini ada surat masuk minggir dong...', 'don\'t forget to read this message'),
(22, 'heh kamu, iya kamu ada surat masuk loh', 'ohh ada surat masuk,jangan lupa di bacaa'),
(23, 'nuwun sewu, enek surat mlebu iki lo (permisi,ada surat masuk nih lo)', 'wes tak bedek ga diwoco toh,wocoen ta lah(udah aku tebak pasti gak dibaca, baca lah pliss)'),
(24, 'tulunggggg,ada surat massuk', 'gatau lagi ya aku udah gabisa berkata-kata jadi dibaca segera!'),
(25, 'perkenalkan saya adalah surat penting yang masuk', 'jadi,jangan lupa dibaca yah!'),
(26, 'sayang,ada surat masuk nih ', 'baca ya sayang jangan lupa'),
(27, 'hey anda ada surat masuk', 'jangan lupa di baca yah'),
(28, 'anda-anda semua ada surat masuk', 'jadi cepat dibaca!'),
(29, 'minggir ada surat masuk', 'dibaca! Gamau tau! Harus dibaca!'),
(30, 'ikan hiu minum susu, eh ada surat masuk', 'ikan hiu makan cinta jangan lupa dibaca yah!'),
(31, 'jangan ketawa, ada surat masuk nih', 'jadi baca sekarang!'),
(32, 'gaes ada surat masuk gaes', 'jangan lupa baca yah gaes'),
(33, 'welcome! Ada surat masuk', 'hi! Please read me'),
(34, 'misi ada surat masuk', 'dibaca yah gaes!'),
(35, 'ibu bapak sekalian ada surat masuk', 'jadi dibaca ya tolong!'),
(36, 'perhatian! Ada surat masuk', 'perhatian!jangan lupa dibaca suratnya'),
(37, 'mau ngasih tau nih, ada surat masuk', 'iyaaaa,kamu minta aku baca surat dari kamu kan'),
(38, 'sudah aku bilang!ada surat masuk loh', 'jadi harus dibaca suratnya yah!'),
(39, 'pengen bilang!ada surat masuk', 'aku harap kamu baca surat dari aku yah'),
(40, 'bund,ada surat datang', 'bund,dibaca yah suratnya'),
(41, 'assalamualikum, ada surat masuk nih..', 'waalaikumsallam, jangan lupa baca suratnya yah'),
(42, 'kenalin aku surat, nama lengkapnya ada surat masuk', 'hai surat, aku tidak sabar untuk cepat membacamu'),
(43, 'selamat datang , ada surat datang', 'jangan kemana-mana , suratnya jangan lupa dibaca'),
(44, 'yesss,ada surat masuk nih', 'aku suka dapat surat, aku gasabar baca nih'),
(45, 'woi,ada surat masuk ni loh', 'aku gabakal lupa baca surat kok'),
(46, 'aku gamau tau ini ada surat masuk', 'dan kamu harus baca surat ini sekarang!!!'),
(47, 'jangan bosen ya,ada surat nih masuk', 'iyaa ga bakal bosen kok, dan jangan lupa dibaca yah '),
(48, 'ikan hiu makan nasi,nih ada surat masuk ku kasih', 'ikan hiu makan baso,jangan lupa dibaca suratnya ya broo'),
(49, 'bebs ada surat masuk nih', 'baca yah bebs jangan sampe lupa nanti aku cedih'),
(50, 'teman-teman semuanya ada surat masuk nih', 'teman-teman jangan lupa baca si suratnya yah'),
(51, 'bosqueee ada surat masuk ', 'aassshiappp jangan lupa dibaca yah gaes'),
(52, 'haluuuu ada surat masuk', 'ehhh, ada surat jangan lupa dibaca loh'),
(53, 'attention please, ini ada surat masuk', 'tong poho di baca suratnya yah!!'),
(54, 'kamuuuu,ada berita baru ni mau tau ga ??? Ni aku kasih surat masuk', 'baca yukkk suratnya'),
(55, 'sayang,ada surat masuk nih ', 'jangan lupa dibaca yah sayang suratnya'),
(56, 'ikan hiu makan seblak, hey kamu nih ada surat masuk ', 'ayo gaes dibaca suratnya gaes jangan lupa'),
(57, 'jadi gini, ini ada surat masuk!', 'jadi jangan di anggurin yah dibaca ya tulung'),
(58, 'cuman mau ngingetin ada surat masuk', 'iya,iyaa nanti baca ya suratnya'),
(59, 'udah lah ada surat masuk nichhh', 'yaudah atuhhh baca yah!'),
(60, 'hey you, ada surat masuk nih', 'oke, jangan lupa dibaca yah suratnya!!!');

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
(1, '127.0.0.1', 'admin@admin.com', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', 'm0vyKu2zW7L8PTG20bquF.707e055aeea8a30aca', 1541329145, 'WcHCQ5vcXwT1z99BvJUWnu', 1268889823, 1616295116, 1, 'Admin', 'istrator', '0', 'gold.png', '', 'Admin'),
(11, '::1', 'mrahmatuloh@poltekpos.ac.id', '$2y$08$25WqqP3CTX9wSvWgIXl4c.nGRVyrF6tjQskQIncpVbjCr1uOSpj6S', NULL, 'mrahmatuloh@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602580370, NULL, 1, 'Marwanto', 'Rahmatuloh, S.T., MT.', '6281221306116', 'default.jpg', '103.79.068', 'DEPUTI WADIR 1'),
(12, '::1', 'aguspurnomo@poltekpos.ac.id', '$2y$08$q6GAdA8OSUbMT1JmHDVEl.anCfjqoyCZDe6mcBSs7roHOldoY9uQq', NULL, 'aguspurnomo@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602580694, 1603589079, 1, 'Dr. Ir. Agus', 'Purnomo, MT.', '6287783261964', 'default.jpg', '118.64.237', 'Direktur'),
(13, '::1', 'dewiselviani@poltekpos.ac.id', '$2y$08$YFBLD8QKNfU3qqU0NPM4aegJPbIB/QbZJ5NKJ1tlTx85hq5jcsKAy', NULL, 'dewiselviani@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602580834, NULL, 1, 'Dewi', 'Selviani Y, SS., M.Pd.', '628122261207', 'default.jpg', '103.80.060', 'Direktur Lembaga Sertifikasi Profesi'),
(14, '::1', 'indrafirmansyah@poltekpos.ac.id', '$2y$08$IAFNUdaLWxyKFNNQzqS.s.zPjph.x3tw6pbNvBvZYw7WGGWV1vDb.', NULL, 'indrafirmansyah@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602580917, NULL, 1, 'Dr. Indra', 'Firmansyah, SE., MM.Ak.CA', '6281321047990', 'default.jpg', '107.72.119', 'Kepala Hubungan Masyarakat'),
(15, '::1', 'pretydiawati@poltekpos.ac.id', '$2y$08$ZT4FCtn/fADkehrFH9eaku.AwH1Xm7HSycZBRviZ3zt6JoQV/deoa', NULL, 'pretydiawati@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602581114, NULL, 1, 'Dr. Prety', 'Diawati, S.Sos., MM.', '628122345256', 'default.jpg', '113.75.108', 'Ketua Prodi D4 Manajemen Bisnis'),
(16, '::1', 'ernamulyati@poltekpos.ac.id', '$2y$08$MUQojHKxnUaTOXseNTbe/elciHkkFEr.J64PvvfyiL2v2gbbHoqL2', NULL, 'ernamulyati@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602581180, NULL, 1, 'Erna', 'Mulyati, S.T., M.T.', '6282115502313', 'default.jpg', '109.75.128', 'Ketua Prodi D4 Logistik Bisnis'),
(17, '::1', 'mubassiran@poltekpos.ac.id', '$2y$08$usIFc3AAcDMMXnoojtKKnu6h4BHwrgxlHAziJfcFCNgN.WIIlnXJa', NULL, 'mubassiran@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602581281, NULL, 1, 'Mubassiran,', 'S.Si., M.T.', '6281802171076', 'default.jpg', '105.76.095', 'Ketua Rekognisi Pembelajaran Lampau'),
(18, '::1', 'm.ruslan.m@gmail.com', '$2y$08$zDK4PHpEDB60iiXOC9jG2.yVyJEOEiOYKWVSpWCVlFIArnsY.YuGi', NULL, 'm.ruslan.m@gmail.com', NULL, NULL, NULL, NULL, 1602581627, NULL, 1, 'Muhammad Ruslan', 'Maulani, S.Kom., MT.', '6281289065967', 'default.jpg', '103.82.070', 'Ketua Prodi D3 Teknik Informatika'),
(19, '::1', 'yusrilhelmi@poltekpos.ac.id', '$2y$08$i.Rli9hHRl0Nfy9BW3WIE.I6xBM1Nyk/wb/Jeab64iz9L9kyZjJa6', NULL, 'yusrilhelmi@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602582101, NULL, 1, 'Muhammad Yusril', 'Helmi Setyawan, S.Kom., M.Kom.', '6285221441761', 'default.jpg', '113.74.163', 'Ketua Prodi D4 Teknik Informatika'),
(20, '::1', 'rima@poltekpos.ac.id', '$2y$08$2ePlWan.fKu0ykHLs/nUY.EvKnSQgpcMSF.P48fSium6uMq5Yq5u.', NULL, 'rima@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602582372, NULL, 1, 'Rima', 'Sundari, SE., M.Ak.', '628122253300', 'default.jpg', '113.78.164', 'Ketua Prodi Akuntansi Keuangan'),
(21, '::1', 'suparnosaputra@poltekpos.ac.id', '$2y$08$uimfoBR2GbgXLflB08xRrO8yro7BD8VU/Ta7.U9Jh2vxgSYsqWaTS', NULL, 'suparnosaputra@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602582455, NULL, 1, 'Suparno', 'Saputra, SE., MM.', '628982936188', 'default.jpg', '101.58.004', 'Ketua Prodi D3 Manajemen Pemasaran'),
(22, '::1', 'virdiandry@poltekpos.ac.id', '$2y$08$VBkAezIK8mvI67u8Ag4i/eUeM4UimkajzEahTcq0iG9MJbiF1ReJW', NULL, 'virdiandry@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602582502, 1606416075, 1, 'Virdiandry', 'Putratama, ST., M.Kom.', '6281364228269', 'default.jpg', '116.86.227', 'Ketua Prodi D3 Manajemen Informatika'),
(23, '::1', 'casmadi@poltekpos.ac.id', '$2y$08$NowJrBJHjUkB838FtxV0b.WpPIkr7yfDNM65ntulo4N4hqtIXCxYS', NULL, 'casmadi@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602582741, NULL, 1, 'Y.', 'Casmadi.SE., MM', '6287722104755', 'default.jpg', '101.66.022', 'Ketua Prodi D3 Akuntansi'),
(24, '::1', 'amriyanuar@poltekpos.ac.id', '$2y$08$1azgeiO1q44b3BwPuARjqOwntrnlLA2DUsiGkGSpDbjSYL4n8pP36', NULL, 'amriyanuar@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602582792, NULL, 1, 'Amri', 'Yanuar, ST., M.MOT', '6281910027205', 'default.jpg', '116.86.207', 'Kepala Unit Center Of Technology'),
(25, '::1', 'maniah@poltekpos.ac.id', '$2y$08$fDstrvj8XZERkNtyanoRDu93bI8qMnNt.g3jbzgY6feuXP725jlzG', NULL, 'maniah@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602582995, NULL, 1, 'Maniah,', 'S.Kom., MT.', '6282120008472', 'default.jpg', '113.67.162', 'Kepala Unit SPMI'),
(26, '::1', 'sariarmiati@poltekpos.ac.id', '$2y$08$tecKoPGLujjTuKVavPKaHOYlMe2I10NBxObKCjP4suR4tsRxh3P42', NULL, 'sariarmiati@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602585103, NULL, 1, 'Sari', 'Armiati, S.T., M.T.', '628112249882', 'default.jpg', '103.77.054', 'Kepala Unit LPPM'),
(27, '::1', 'syafrial.fachri@poltekpos.ac.id', '$2y$08$cUX9I8lvYN6w0wuQzBVZYO4din1juOTBL2nl85.ls3Ctn1Mv9/gGO', NULL, 'syafrial.fachri@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602585155, NULL, 1, 'Syafrial Fachri', 'Pane, ST., M.T.I.,EBDP', '6285362383988', 'default.jpg', '117.88.233', 'Kepala Unit TIK'),
(28, '::1', 'widiaresdiana@poltekpos.ac.id', '$2y$08$.ik.LJAfQxzV.8MDQe26hutzhlP9ebWDnLJPkRT1dJi8nb4PAaE96', NULL, 'widiaresdiana@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602585281, NULL, 1, 'Widia', 'Resdiana, S.S., M.Pd.', '6281802279837', 'default.jpg', '104.79.072', 'Kepala Unit Bahasa dan Perpustakaan'),
(29, '::1', 'irma@poltekpos.ac.id', '$2y$08$y2hzQ0VY6qtWPYMEMbaodusgO0oeNtjLo.BJR8bLF37sxjwTd26eK', NULL, 'irma@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602585337, NULL, 1, 'Irma', 'Rahmawati', '628562244089', 'default.jpg', '111.11.111', 'Kepala Unit BAAK'),
(30, '::1', 'pupung@poltekpos.ac.id', '$2y$08$4LdMO.M.KtFrUfSIJnJcA.GlYiQfcLD3PyOJZTut5f.5RTU5.DXnS', NULL, 'pupung@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602585378, NULL, 1, 'Pupung', 'Pujiastuti', '628112190065', 'default.jpg', '111.11.111', 'Kepala Unit Keuangan'),
(31, '::1', 'achmadandriyanto@poltekpos.ac.id', '$2y$08$YrY2RPjybN2mNJQaiClYiOSznPsX.ow910XkpyXvPvCDLsv5/QzHK', NULL, 'achmadandriyanto@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602585425, NULL, 1, 'Achmad', 'Andriyanto, ST., MT.', '6285221862323', 'default.jpg', '116.86.204', 'Ketua Prodi D3 Administrasi Logistik'),
(32, '::1', 'roniandarsyah@poltekpos.ac.id', '$2y$08$CaNsKoJSJlweB6T9OmO.AeBx5tgVCzDMkigACc1vjlQ4fvsYAIV8q', NULL, 'roniandarsyah@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602585690, NULL, 1, 'Roni', 'Andarsyah, ST., M.Kom.', '6285220267364', 'default.jpg', '115.88.193', 'Kemahasiswaan'),
(33, '::1', 'dodi@poltekpos.ac.id', '$2y$08$prKhhNXba0tdth0sn7j1WeZRbvL461ESxp69mx8DDzA8dPxElu/9a', NULL, 'dodi@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602585726, 1603588972, 1, 'Dodi', 'Permadi, S.T.,M.T.', '6281324087996', 'default.jpg', '107.77.117', 'Wakil Direktur 1'),
(34, '::1', 'edisupardi@poltekpos.ac.id', '$2y$08$FU39DRTe7LMxaMmYRNRDueJQRZ/mBhGpR9qGWKV1T8GY8Xl8.dlEa', NULL, 'edisupardi@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602585778, NULL, 1, 'Edi', 'Supardi, SE., MM., AAAIK.', '6281313778112', 'default.jpg', '114.74.180', 'Wakil Direktur 2'),
(35, '::1', 'hilmansetiadi@poltekpos.ac.id', '$2y$08$fEcc157o09RnO.vLVdey5u0Wi1RHLtNXZ1dk7oFudE3xY4BmpCFUe', NULL, 'hilmansetiadi@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602585839, 1606418267, 1, 'Hilman', 'Setiadi, SE., S.Pd., MT.', '62812322092066', 'default.jpg', '101.66.010', 'Wakil Direktur 3'),
(36, '::1', 'asep@poltekpos.ac.id', '$2y$08$uz6R4azscDrTX8oZs2.WNOlab/Clp/O3Ml.Omi2NvJ.N5xNgajMBu', NULL, 'asep@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602585878, 1612527841, 1, 'Asep', 'Gumilar', '62895398416366', 'default.jpg', '111.11.111', 'Staff Direktur'),
(37, '::1', 'muhammad.akbar5999@gmail.com', '$2y$08$rXzeANODBmDonZrLt6vwb.SmD/DEUHaj3EFz4RAVTSZIZC5dyZ6Oi', NULL, 'muhammad.akbar5999@gmail.com', NULL, NULL, NULL, NULL, 1602586215, 1612237306, 1, 'Akbar', 'MI', '6289646817762', 'default.jpg', '2193013', 'Mahasiswa'),
(38, '::1', 'supono@poltekpos.ac.id', '$2y$08$zE0dNKnaU7dkLN7iYGQezuCD4KFEq7wzZE.acpZ/vs.R9AQTtH3We', NULL, 'supono@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1602586274, 1604537782, 1, 'Supono', 'Syafiq', '628112272742', 'default.jpg', '111.11.111', 'Dosen'),
(39, '::1', 'tetyrohayati@poltekpos.ac.id', '$2y$08$PLHF3b8ZsS6CU0leU0agAe1nd0c.kHNWdXB1pcSpm8PvhR7g//aXy', NULL, 'tetyrohayati@poltekpos.ac.id', NULL, NULL, NULL, NULL, 1603410953, NULL, 1, 'Tety', 'Rohayati', '6287822297652', 'default.jpg', '111.11.111', 'Staff Wadir 1');

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
(28, 10, 29),
(74, 11, 24),
(67, 12, 8),
(64, 13, 18),
(66, 14, 30),
(68, 15, 17),
(70, 16, 17),
(75, 17, 17),
(76, 18, 17),
(77, 19, 17),
(84, 20, 17),
(78, 21, 17),
(81, 22, 28),
(85, 23, 17),
(60, 24, 28),
(73, 25, 28),
(79, 26, 28),
(80, 27, 28),
(82, 28, 28),
(72, 29, 28),
(83, 30, 28),
(59, 31, 17),
(86, 32, 26),
(65, 33, 7),
(69, 34, 7),
(71, 35, 7),
(61, 36, 29),
(62, 37, 2),
(63, 38, 2),
(88, 39, 31);

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
-- Indexes for table `template_notif`
--
ALTER TABLE `template_notif`
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
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `groups_menu`
--
ALTER TABLE `groups_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surat_lampiran`
--
ALTER TABLE `surat_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tembusan`
--
ALTER TABLE `tembusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `template_notif`
--
ALTER TABLE `template_notif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `tujuan`
--
ALTER TABLE `tujuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
