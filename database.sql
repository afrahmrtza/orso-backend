-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Mar 2026 pada 11.20
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orso_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `id_detail` int(11) NOT NULL,
  `id_pesanan` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `jumlah_pesanan` int(11) NOT NULL,
  `total_harga` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail_pesanan`
--

INSERT INTO `detail_pesanan` (`id_detail`, `id_pesanan`, `id_menu`, `jumlah_pesanan`, `total_harga`) VALUES
(8, 8, 2, 2, 50000.00),
(9, 8, 3, 1, 18000.00),
(10, 9, 2, 2, 50000.00),
(11, 9, 3, 1, 18000.00),
(12, 10, 2, 2, 50000.00),
(13, 10, 3, 1, 18000.00),
(14, 11, 2, 2, 50000.00),
(15, 11, 3, 1, 18000.00),
(16, 12, 7, 2, 50000.00),
(17, 13, 7, 2, 50000.00),
(18, 14, 7, 2, 50000.00),
(19, 15, 7, 2, 50000.00),
(20, 16, 7, 4, 100000.00),
(21, 17, 7, 4, 100000.00),
(22, 18, 7, 4, 100000.00),
(23, 19, 7, 1, 25000.00),
(24, 19, 8, 1, 28000.00),
(25, 20, 2, 1, 25000.00),
(26, 20, 3, 1, 18000.00),
(27, 21, 5, 1, 25000.00),
(28, 22, 6, 1, 28000.00),
(30, 23, 11, 1, 25000.00),
(31, 24, 3, 1, 18000.00),
(32, 24, 4, 1, 25000.00),
(34, 26, 3, 1, 18000.00),
(35, 27, 6, 1, 28000.00),
(37, 29, 3, 1, 18000.00),
(39, 30, 3, 1, 18000.00),
(40, 30, 11, 1, 25000.00),
(42, 31, 5, 1, 25000.00),
(43, 32, 3, 1, 18000.00),
(44, 33, 3, 1, 18000.00),
(45, 34, 3, 1, 18000.00),
(46, 34, 15, 1, 25000.00),
(47, 35, 3, 5, 90000.00),
(48, 35, 4, 3, 75000.00),
(49, 35, 7, 2, 50000.00),
(50, 36, 3, 1, 18000.00),
(51, 36, 11, 1, 25000.00),
(53, 37, 2, 1, 25000.00),
(54, 38, 20, 4, 120000.00),
(55, 39, 20, 4, 120000.00),
(56, 40, 15, 1, 25000.00),
(58, 42, 13, 1, 28000.00),
(59, 42, 20, 1, 30000.00),
(61, 43, 3, 1, 18000.00),
(62, 44, 3, 1, 18000.00),
(64, 45, 2, 1, 25000.00),
(65, 46, 2, 1, 25000.00),
(66, 46, 3, 1, 18000.00),
(68, 47, 2, 1, 25000.00),
(69, 48, 4, 1, 25000.00),
(70, 49, 5, 1, 25000.00),
(71, 50, 9, 1, 25000.00),
(72, 51, 6, 1, 28000.00),
(73, 52, 10, 1, 25000.00),
(75, 53, 2, 1, 25000.00),
(77, 55, 3, 1, 18000.00),
(78, 56, 20, 1, 30000.00),
(79, 57, 4, 1, 25000.00),
(80, 58, 20, 2, 60000.00),
(81, 59, 15, 1, 25000.00),
(82, 60, 16, 1, 23000.00),
(83, 60, 17, 1, 25000.00),
(84, 61, 3, 1, 18000.00),
(85, 62, 4, 1, 25000.00),
(86, 63, 13, 1, 28000.00),
(87, 64, 12, 2, 50000.00),
(88, 65, 20, 2, 60000.00),
(89, 65, 13, 1, 28000.00),
(91, 66, 13, 2, 56000.00),
(92, 67, 2, 2, 50000.00),
(93, 67, 18, 3, 84000.00),
(95, 68, 4, 1, 25000.00),
(97, 69, 2, 1, 25000.00),
(98, 70, 3, 1, 18000.00),
(99, 70, 4, 1, 25000.00),
(100, 71, 4, 1, 25000.00),
(101, 72, 5, 1, 25000.00),
(102, 73, 7, 1, 25000.00),
(103, 74, 8, 1, 28000.00),
(104, 75, 4, 1, 25000.00),
(105, 76, 3, 1, 18000.00),
(106, 77, 6, 1, 28000.00),
(107, 78, 9, 1, 25000.00),
(108, 79, 10, 1, 25000.00),
(110, 81, 2, 1, 25000.00),
(111, 82, 3, 1, 18000.00),
(112, 83, 4, 1, 25000.00),
(113, 84, 5, 1, 25000.00),
(114, 85, 6, 1, 28000.00),
(115, 86, 7, 1, 25000.00),
(116, 87, 8, 1, 28000.00),
(117, 88, 9, 1, 25000.00),
(118, 89, 10, 1, 25000.00),
(119, 90, 11, 1, 25000.00),
(120, 91, 12, 1, 25000.00),
(121, 92, 13, 1, 28000.00),
(122, 93, 14, 1, 25000.00),
(123, 94, 15, 1, 25000.00),
(124, 95, 16, 1, 23000.00),
(125, 96, 17, 1, 25000.00),
(126, 97, 18, 1, 28000.00),
(127, 98, 19, 1, 30000.00),
(128, 99, 20, 1, 30000.00),
(130, 101, 2, 1, 25000.00),
(131, 102, 3, 1, 18000.00),
(132, 103, 4, 1, 25000.00),
(133, 104, 5, 1, 25000.00),
(134, 105, 6, 1, 28000.00),
(135, 106, 7, 1, 25000.00),
(136, 107, 8, 1, 28000.00),
(137, 108, 9, 1, 25000.00),
(138, 109, 10, 1, 25000.00),
(139, 110, 11, 1, 25000.00),
(140, 111, 12, 1, 25000.00),
(141, 112, 13, 1, 28000.00),
(142, 113, 14, 1, 25000.00),
(143, 114, 15, 1, 25000.00),
(144, 115, 16, 1, 23000.00),
(145, 116, 17, 1, 25000.00),
(146, 117, 18, 1, 28000.00),
(147, 118, 19, 1, 30000.00),
(148, 119, 20, 1, 30000.00),
(149, 120, 20, 2, 60000.00),
(151, 122, 2, 3, 75000.00),
(152, 123, 5, 1, 25000.00),
(153, 124, 16, 1, 23000.00),
(154, 124, 17, 1, 25000.00),
(155, 125, 16, 1, 23000.00),
(156, 126, 6, 1, 28000.00),
(157, 126, 7, 1, 25000.00),
(158, 127, 2, 1, 25000.00),
(159, 127, 3, 1, 18000.00),
(160, 128, 3, 1, 18000.00),
(161, 128, 4, 1, 25000.00),
(162, 129, 11, 1, 25000.00),
(163, 130, 5, 1, 25000.00),
(164, 131, 9, 1, 25000.00),
(165, 132, 18, 1, 28000.00),
(166, 132, 19, 1, 30000.00),
(167, 133, 20, 2, 60000.00),
(168, 134, 15, 1, 25000.00),
(169, 135, 4, 1, 25000.00),
(170, 136, 5, 1, 25000.00),
(171, 137, 3, 1, 18000.00),
(172, 138, 2, 1, 25000.00),
(174, 139, 2, 1, 25000.00),
(175, 140, 3, 1, 18000.00),
(176, 140, 4, 1, 25000.00),
(177, 141, 20, 1, 30000.00),
(178, 142, 16, 1, 23000.00),
(179, 142, 17, 1, 25000.00),
(180, 143, 8, 1, 28000.00),
(181, 143, 9, 1, 25000.00),
(182, 144, 3, 1, 18000.00),
(183, 145, 7, 1, 25000.00),
(184, 145, 8, 1, 28000.00),
(185, 146, 20, 5, 150000.00),
(186, 147, 15, 1, 25000.00),
(187, 148, 13, 1, 28000.00),
(188, 149, 2, 2, 50000.00),
(189, 150, 14, 1, 25000.00),
(190, 150, 15, 1, 25000.00),
(191, 151, 2, 1, 25000.00),
(193, 152, 2, 1, 25000.00),
(194, 153, 3, 1, 18000.00),
(195, 154, 5, 1, 25000.00),
(196, 155, 5, 1, 25000.00),
(198, 156, 2, 1, 25000.00),
(199, 157, 2, 1, 25000.00),
(200, 158, 6, 1, 28000.00),
(201, 158, 7, 1, 25000.00),
(202, 159, 12, 1, 25000.00),
(203, 159, 13, 1, 28000.00),
(204, 160, 3, 1, 18000.00),
(205, 161, 3, 1, 18000.00),
(206, 162, 2, 1, 25000.00),
(207, 163, 3, 1, 18000.00),
(208, 163, 5, 1, 25000.00),
(209, 164, 4, 1, 25000.00),
(210, 165, 4, 1, 25000.00),
(211, 166, 20, 2, 60000.00),
(212, 167, 5, 1, 25000.00),
(213, 168, 21, 1, 30000.00),
(214, 169, 22, 2, 60000.00),
(215, 170, 14, 2, 50000.00),
(216, 171, 5, 1, 25000.00),
(218, 173, 2, 1, 25000.00),
(219, 174, 3, 1, 18000.00),
(220, 175, 4, 1, 25000.00),
(221, 176, 5, 1, 25000.00),
(222, 177, 6, 1, 28000.00),
(223, 178, 7, 1, 25000.00),
(224, 179, 8, 1, 28000.00),
(225, 180, 9, 1, 25000.00),
(226, 181, 10, 1, 25000.00),
(227, 182, 11, 1, 25000.00),
(228, 183, 12, 1, 25000.00),
(229, 184, 13, 1, 28000.00),
(230, 185, 14, 1, 25000.00),
(231, 186, 15, 1, 25000.00),
(232, 187, 16, 1, 23000.00),
(233, 188, 17, 1, 25000.00),
(234, 189, 18, 1, 28000.00),
(235, 190, 19, 1, 30000.00),
(236, 191, 20, 1, 30000.00),
(237, 192, 21, 1, 30000.00),
(238, 193, 22, 1, 30000.00),
(240, 195, 2, 1, 25000.00),
(241, 196, 3, 1, 18000.00),
(242, 197, 4, 1, 25000.00),
(243, 198, 5, 1, 25000.00),
(244, 199, 6, 1, 28000.00),
(245, 200, 7, 1, 25000.00),
(246, 201, 8, 1, 28000.00),
(247, 202, 9, 1, 25000.00),
(248, 203, 10, 1, 25000.00),
(249, 204, 11, 1, 25000.00),
(250, 205, 12, 1, 25000.00),
(251, 206, 13, 1, 28000.00),
(252, 207, 14, 1, 25000.00),
(253, 208, 15, 1, 25000.00),
(254, 209, 16, 1, 23000.00),
(255, 210, 17, 1, 25000.00),
(256, 211, 18, 1, 28000.00),
(257, 212, 19, 1, 30000.00),
(258, 213, 20, 1, 30000.00),
(259, 214, 21, 1, 30000.00),
(260, 215, 22, 1, 30000.00),
(261, 216, 2, 1, 25000.00),
(264, 218, 3, 1, 18000.00),
(265, 219, 4, 1, 25000.00),
(266, 219, 5, 1, 25000.00),
(268, 220, 2, 2, 50000.00),
(269, 221, 3, 1, 18000.00),
(270, 221, 8, 1, 28000.00),
(271, 222, 3, 2, 36000.00),
(272, 223, 1, 2, 50000.00),
(273, 224, 1, 2, 50000.00),
(274, 225, 6, 1, 28000.00),
(275, 226, 19, 1, 30000.00),
(276, 227, 22, 1, 30000.00),
(277, 228, 22, 1, 30000.00),
(278, 229, 22, 1, 30000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(100) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id_menu`, `nama_menu`, `harga`, `kategori`, `image_url`, `deskripsi`) VALUES
(1, 'Strawberry Coffee', 25000.00, 'Coffee', 'Strawberry-Coffee.png', 'Espresso dengan sentuhan susu stroberi menghadirkan perpaduan rasa kopi yang unik, segar, dan seimbang. ☕🍓'),
(2, 'Kopi Susu', 25000.00, 'Coffee', 'menu-1769152288.png', 'Perpaduan kopi dan susu yang menghasilkan rasa lembut, creamy, dan seimbang. ☕🥛'),
(3, 'Americano', 18000.00, 'Coffee', 'menu-1769152417.png', 'Espresso yang dipadukan dengan air panas menghasilkan rasa kopi yang ringan dan aromatik. ☕'),
(4, 'Cappucino', 25000.00, 'Coffee', 'menu-1769152606.png', 'Perpaduan espresso, susu, dan foam lembut yang menghasilkan rasa kopi seimbang dan creamy. ☕🥛'),
(5, 'Coffee Caramel', 25000.00, 'Coffee', 'menu-1769152736.png', 'Espresso dengan sentuhan karamel manis menghadirkan rasa kopi yang lembut dan seimbang. ☕🍯'),
(6, 'Mocha', 28000.00, 'Coffee', 'menu-1769153167.jpg', 'Espresso dengan cokelat dan susu menghadirkan rasa kopi yang manis dan creamy. ☕🍫'),
(7, 'Sweet Creamy Latte', 25000.00, 'Coffee', 'menu-1769153526.jpg', 'Perpaduan espresso dan susu creamy dengan rasa manis yang lembut. ☕🥛'),
(8, 'Coffee Strawberry Cheesecake', 28000.00, 'Coffee', 'menu-1769156303.png', 'Espresso dengan sentuhan cheesecake creamy dan stroberi segar yang lembut dan seimbang. ☕🍓🍰'),
(9, 'Blake Rose', 25000.00, 'Coffee', 'menu-1769154313.png', 'Espresso dengan sentuhan aroma mawar menghadirkan rasa kopi yang unik dan elegan. ☕🌹'),
(10, 'Cafe Latte', 25000.00, 'Coffee', 'menu-1769154169.png', 'Espresso dan susu segar menghasilkan rasa kopi yang lembut dan seimbang. ☕🥛'),
(11, 'Lychee Tea', 25000.00, 'Tea', 'menu-1769154517.png', 'Teh dengan rasa leci manis yang segar dan harum. 🍃🍓'),
(12, 'Thai Tea', 25000.00, 'Tea', 'menu-1769154573.png', 'Teh khas Thailand dengan rasa manis dan creamy. 🧡🥛'),
(13, 'Matcha', 28000.00, 'Tea', 'menu-1769151903.jpg', 'Minuman teh hijau dengan rasa lembut dan menenangkan. 🍵💚'),
(14, 'Lychee Lime Tea', 25000.00, 'Tea', 'menu-1769154645.png', 'Perpaduan teh, leci manis, dan jeruk nipis yang menyegarkan. 🍃🍋'),
(15, 'Strawberry Tea', 25000.00, 'Tea', 'menu-1769154696.jpg', 'Teh dengan rasa stroberi manis dan segar. 🍓🍃'),
(16, 'Classic Mojito', 23000.00, 'Mojito', 'menu-1769154755.jpg', 'Minuman segar dari mint dan jeruk nipis yang menyegarkan. 🍃🍋🥤'),
(17, 'Strawberry Mojito', 25000.00, 'Mojito', 'menu-1769155070.jpg', 'Mojito segar dengan sentuhan stroberi manis dan asam. 🍓🍃🍋'),
(18, 'Chocolate', 28000.00, 'Non-Coffee', 'menu-1769154861.jpg', 'Minuman cokelat dengan rasa manis dan creamy. 🍫🥛'),
(19, 'Chocoberry', 30000.00, 'Non-Coffee', 'menu-1772009059.png', 'Perpaduan cokelat lembut dan susu stroberi segar yang manis. 🍫🍓'),
(20, 'Red Velvet', 30000.00, 'Non-Coffee', 'menu-1770623316.png', 'Minuman dengan rasa red velvet yang lembut, manis, dan creamy. ❤️🥛'),
(21, 'Chocopresso', 30000.00, 'Coffee', 'menu-1772008513.png', 'Perpaduan espresso dan cokelat yang menghasilkan rasa kuat, manis, dan kaya. ☕🍫'),
(22, 'Caramel Latte', 30000.00, 'Non-Coffee', 'menu-1772008686.png', 'Minuman susu creamy dengan sentuhan karamel manis yang lembut dan menyegarkan. 🥛🍯');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_kasir` int(11) DEFAULT NULL,
  `tgl_pesanan` datetime DEFAULT current_timestamp(),
  `total_harga` decimal(10,2) NOT NULL,
  `status_pesanan` enum('pending','diproses','selesai','dibatalkan') DEFAULT 'pending',
  `snap_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `id_user`, `id_kasir`, `tgl_pesanan`, `total_harga`, `status_pesanan`, `snap_token`) VALUES
(1, 8, NULL, '2026-02-25 13:43:06', 50000.00, 'selesai', NULL),
(2, 6, NULL, '2026-02-25 13:43:35', 25000.00, 'selesai', NULL),
(3, 9, NULL, '2026-02-25 13:44:12', 43000.00, 'selesai', NULL),
(4, 11, NULL, '2026-02-25 13:44:12', 50000.00, 'selesai', NULL),
(5, 9, NULL, '2026-02-25 13:44:48', 68000.00, 'selesai', NULL),
(6, 7, NULL, '2026-02-25 13:44:48', 25000.00, 'selesai', NULL),
(7, 6, NULL, '2026-02-25 13:45:19', 18000.00, 'selesai', NULL),
(8, 6, NULL, '2026-01-23 20:08:03', 68000.00, 'selesai', NULL),
(9, 6, NULL, '2026-01-23 20:12:55', 68000.00, 'selesai', NULL),
(10, 6, NULL, '2026-01-23 20:18:42', 68000.00, 'selesai', NULL),
(11, 6, NULL, '2026-01-23 20:35:07', 68000.00, 'selesai', NULL),
(12, 6, NULL, '2026-01-26 17:30:00', 50000.00, 'selesai', NULL),
(13, 6, NULL, '2026-01-26 17:31:30', 50000.00, 'selesai', NULL),
(14, 6, NULL, '2026-01-26 17:33:14', 50000.00, 'selesai', NULL),
(15, 6, NULL, '2026-01-26 17:43:34', 50000.00, 'selesai', NULL),
(16, 6, NULL, '2026-01-26 17:43:43', 100000.00, 'selesai', NULL),
(17, 6, NULL, '2026-01-26 17:43:52', 100000.00, 'selesai', NULL),
(18, 6, NULL, '2026-01-26 17:43:55', 100000.00, 'selesai', NULL),
(19, 6, NULL, '2026-01-26 17:50:13', 53000.00, 'selesai', NULL),
(20, 6, NULL, '2026-01-26 17:58:59', 43000.00, 'selesai', NULL),
(21, 6, NULL, '2026-01-26 18:11:10', 25000.00, 'selesai', NULL),
(22, 6, NULL, '2026-01-26 18:18:03', 28000.00, 'selesai', NULL),
(23, 6, NULL, '2026-01-26 18:46:28', 50000.00, 'selesai', NULL),
(24, 6, NULL, '2026-01-26 18:54:12', 43000.00, 'selesai', NULL),
(25, 6, NULL, '2026-01-26 18:57:13', 500.00, 'selesai', NULL),
(26, 6, NULL, '2026-01-26 19:05:41', 18000.00, 'selesai', NULL),
(27, 6, NULL, '2026-01-26 19:07:51', 28000.00, 'selesai', NULL),
(28, 6, NULL, '2026-01-26 19:17:20', 1000.00, 'selesai', NULL),
(29, 6, NULL, '2026-01-26 19:20:44', 18500.00, 'selesai', NULL),
(30, 6, NULL, '2026-01-26 19:49:36', 43500.00, 'selesai', NULL),
(31, 6, NULL, '2026-01-26 20:11:52', 25000.00, 'selesai', NULL),
(32, 6, NULL, '2026-01-26 20:12:54', 18000.00, 'selesai', NULL),
(33, 6, NULL, '2026-01-26 20:21:58', 18000.00, 'selesai', NULL),
(34, 6, NULL, '2026-01-27 18:55:18', 43000.00, 'selesai', NULL),
(35, 6, NULL, '2026-01-27 19:46:12', 215000.00, 'selesai', NULL),
(36, 6, NULL, '2026-01-27 20:06:06', 43000.00, 'selesai', NULL),
(37, 6, NULL, '2026-01-27 20:09:24', 50000.00, 'selesai', NULL),
(38, 8, NULL, '2026-02-17 16:14:37', 120000.00, 'selesai', NULL),
(39, 7, NULL, '2026-02-17 16:15:00', 120000.00, 'selesai', NULL),
(40, 7, NULL, '2026-02-17 16:31:51', 25000.00, 'selesai', NULL),
(41, 7, NULL, '2026-02-17 16:32:00', 75000.00, 'selesai', NULL),
(42, 7, NULL, '2026-02-17 16:34:55', 83000.00, 'selesai', NULL),
(43, 9, NULL, '2026-02-17 16:34:56', 18000.00, 'selesai', NULL),
(44, 9, NULL, '2026-02-17 17:00:38', 18000.00, 'selesai', NULL),
(45, 9, NULL, '2026-02-17 17:57:44', 50000.00, 'selesai', NULL),
(46, 9, NULL, '2026-02-17 18:11:39', 43000.00, 'selesai', NULL),
(47, 9, NULL, '2026-02-17 18:24:09', 50000.00, 'selesai', NULL),
(48, 9, NULL, '2026-02-17 18:27:44', 25000.00, 'selesai', NULL),
(49, 9, NULL, '2026-02-17 19:17:01', 25000.00, 'selesai', '69edb742-cfb4-4878-8a17-abbe1e5dee38'),
(50, 9, NULL, '2026-02-17 19:18:23', 25000.00, 'dibatalkan', '16d65c1c-8930-4c7d-8115-c89724304f00'),
(51, 9, NULL, '2026-02-17 19:26:08', 28000.00, 'selesai', 'e5512a88-e334-4c3f-8146-52f116bc6407'),
(52, 9, NULL, '2026-02-17 19:27:51', 25000.00, 'dibatalkan', '3ec7c8e3-5a4e-4111-b317-df2431006001'),
(53, 9, NULL, '2026-02-17 20:00:20', 50000.00, 'dibatalkan', 'e22522de-5cfa-4536-893e-44e593e68c54'),
(54, 7, NULL, '2026-02-17 20:03:57', 25000.00, 'selesai', '50bd32e1-6e85-4bb1-8fe4-35f7a8b1bb82'),
(55, 9, NULL, '2026-02-17 20:08:46', 18000.00, 'dibatalkan', '4996630f-5bca-4dac-a12f-f36abdb9e37a'),
(56, 7, NULL, '2026-02-17 21:14:27', 30000.00, 'dibatalkan', '18e0bd22-5f3e-46ed-a4d1-aa12307bb070'),
(57, 9, NULL, '2026-02-17 21:18:22', 25000.00, 'dibatalkan', '095edbbd-0d94-4530-861b-b753ee6775e3'),
(58, 11, NULL, '2026-02-18 15:26:44', 60000.00, 'dibatalkan', '1a96f53c-388e-41a4-a774-675782ed902b'),
(59, 9, NULL, '2026-02-18 16:45:00', 25000.00, 'dibatalkan', 'f15f8a3e-850d-41d1-84c8-683ce0fb399a'),
(60, 9, NULL, '2026-02-18 18:25:19', 48000.00, 'dibatalkan', '39d00993-8dcd-4b32-be18-5dd9ecc4e3c9'),
(61, 11, NULL, '2026-02-18 18:46:37', 18000.00, 'selesai', '1ad21b8b-c8a7-41c6-91b0-56dc0d21357c'),
(62, 11, NULL, '2026-02-18 18:47:04', 25000.00, 'selesai', 'eb4c560c-42b6-4659-bcba-facff8d8733c'),
(63, 11, NULL, '2026-02-24 15:51:46', 28000.00, 'selesai', '31638e8e-36f2-42db-be17-a986bae6ef10'),
(64, 11, NULL, '2026-02-25 13:10:37', 50000.00, 'selesai', '1d4bb205-cddd-401e-977f-e24b0eb01c3c'),
(65, 11, NULL, '2026-02-25 13:11:16', 88000.00, 'selesai', '5c2c5b11-36ba-4ce3-8a31-777f21675c57'),
(66, 11, NULL, '2026-02-25 13:23:08', 81000.00, 'selesai', '0680c5dc-7c51-49e7-bb64-5724fdc5611b'),
(67, 11, NULL, '2026-02-25 13:26:39', 134000.00, 'selesai', 'e2ce5b93-cb09-41bc-bff5-4415e50de0d0'),
(68, 11, NULL, '2026-02-25 13:29:18', 50000.00, 'selesai', '745f80fe-0193-41c2-a0cb-bd34345ac8ae'),
(69, 11, NULL, '2026-02-25 13:54:05', 50000.00, 'selesai', '028c8967-bdae-4eb4-97f7-3ebddc2c8adc'),
(70, 11, NULL, '2026-02-25 13:54:14', 43000.00, 'selesai', '8f6a42c2-1c08-4d84-ab2a-cd140fc5dcfa'),
(71, 11, NULL, '2026-02-25 13:54:28', 25000.00, 'selesai', 'f293ba8b-44f0-484d-8c50-0e38d46a8483'),
(72, 11, NULL, '2026-02-25 13:54:32', 25000.00, 'selesai', 'fd624195-c8d5-46f4-828b-e94762f9be52'),
(73, 11, NULL, '2026-02-25 13:54:41', 25000.00, 'selesai', '2035126b-dac8-4428-8dec-2d78247a4fb3'),
(74, 11, NULL, '2026-02-25 13:54:45', 28000.00, 'selesai', 'eee8fccd-7d50-41ce-95de-4b24659b7e26'),
(75, 11, NULL, '2026-02-25 13:54:52', 25000.00, 'selesai', '07ed5ae3-9438-4273-b7f5-f0318b08f9bb'),
(76, 11, NULL, '2026-02-25 13:54:58', 18000.00, 'selesai', '633bda8f-ab4c-431e-b3d1-f41ecd7064d7'),
(77, 11, NULL, '2026-02-25 13:55:02', 28000.00, 'selesai', '2eb5b1cc-2f1a-49ff-8be1-b1bcfe7c0066'),
(78, 11, NULL, '2026-02-25 13:55:07', 25000.00, 'selesai', 'f1c9d531-a244-41e3-933f-ae48b50ed7b8'),
(79, 11, NULL, '2026-02-25 13:55:11', 25000.00, 'selesai', 'a5315c33-8be4-45be-b4eb-2cdfffdbfd70'),
(80, 11, NULL, '2026-02-25 13:55:15', 25000.00, 'selesai', '5fa63a4f-d08b-42af-a4c5-a10e3888a246'),
(81, 11, NULL, '2026-02-25 13:55:18', 25000.00, 'selesai', '3be46427-b5df-4f95-b005-c42fb70b63c8'),
(82, 11, NULL, '2026-02-25 13:55:21', 18000.00, 'selesai', 'c8c1352f-6d6a-4e78-a469-f4d29ac62dd2'),
(83, 11, NULL, '2026-02-25 13:55:24', 25000.00, 'selesai', 'dc00bc85-0b30-4608-be1a-f364c1f48a98'),
(84, 11, NULL, '2026-02-25 13:55:29', 25000.00, 'selesai', '96c8f743-b1f7-4e50-b31b-6983aa0b3faa'),
(85, 11, NULL, '2026-02-25 13:55:32', 28000.00, 'selesai', 'daa95bae-297a-4cfd-a3ae-b874c7042ec0'),
(86, 11, NULL, '2026-02-25 13:55:36', 25000.00, 'selesai', 'c67c18b1-6639-407c-92d5-d48ffc6013b5'),
(87, 11, NULL, '2026-02-25 13:55:39', 28000.00, 'selesai', '04412f0e-04f4-4a4c-8970-6b9f2b75287f'),
(88, 11, NULL, '2026-02-25 13:55:42', 25000.00, 'selesai', 'edc95312-26cf-488c-9f91-deeaa7a630d3'),
(89, 11, NULL, '2026-02-25 13:55:46', 25000.00, 'selesai', '8dfa19f6-87c9-4e35-8fd3-a647e03217fe'),
(90, 11, NULL, '2026-02-25 13:55:49', 25000.00, 'selesai', '6ef912a9-cfae-41b8-a584-71b8b6fa66cb'),
(91, 11, NULL, '2026-02-25 13:55:54', 25000.00, 'selesai', '396563e9-f30c-42ab-820a-7c42f4eb412d'),
(92, 11, NULL, '2026-02-25 13:55:58', 28000.00, 'selesai', 'f5432dad-7e70-47e2-95c4-95a55531838f'),
(93, 11, NULL, '2026-02-25 13:56:01', 25000.00, 'selesai', 'd4d6d6c8-a5f1-4acf-91d3-fcc1c82b9aff'),
(94, 11, NULL, '2026-02-25 13:56:05', 25000.00, 'selesai', '274724d4-af28-4db8-bd63-b8193ccd5d4c'),
(95, 11, NULL, '2026-02-25 13:56:09', 23000.00, 'selesai', '8f39aa6b-351d-4930-9f20-8fca0151fe63'),
(96, 11, NULL, '2026-02-25 13:56:12', 25000.00, 'selesai', '58f0a760-43e8-461f-ae77-0e85c295585c'),
(97, 11, NULL, '2026-02-25 13:56:16', 28000.00, 'selesai', 'fdd4ddfc-abbd-4bcd-a039-0d6d6c85cd3f'),
(98, 11, NULL, '2026-02-25 13:56:19', 30000.00, 'selesai', '1d429403-e676-42dd-a451-ae1779deb630'),
(99, 11, NULL, '2026-02-25 13:56:24', 30000.00, 'selesai', 'd44d202c-6a0b-4ff7-aca0-5a1dec14320a'),
(100, 11, NULL, '2026-02-25 14:00:20', 25000.00, 'selesai', 'e34302de-71f1-45e4-8491-0299f8f5dea1'),
(101, 11, NULL, '2026-02-25 14:00:25', 25000.00, 'selesai', '212c6311-5b25-4651-b479-f7e0a26d611a'),
(102, 11, NULL, '2026-02-25 14:00:28', 18000.00, 'selesai', '9f287f86-d057-4132-b8b4-14dd6f7e6e2d'),
(103, 11, NULL, '2026-02-25 14:00:31', 25000.00, 'selesai', '83b577c1-b135-49e1-9836-df0bb196a28e'),
(104, 11, NULL, '2026-02-25 14:00:35', 25000.00, 'selesai', '26811a05-072b-468f-bb22-ce17f4868b48'),
(105, 11, NULL, '2026-02-25 14:00:39', 28000.00, 'selesai', 'f290c493-16ce-4aba-aba3-15adf519599d'),
(106, 11, NULL, '2026-02-25 14:00:42', 25000.00, 'selesai', 'e0f72138-0915-4b60-9254-3d340b37b87c'),
(107, 11, NULL, '2026-02-25 14:00:49', 28000.00, 'selesai', '37c5bbdb-d7e2-4b8d-a7b8-b5232ca61406'),
(108, 11, NULL, '2026-02-25 14:00:52', 25000.00, 'selesai', 'bbc3a2e9-d11f-43df-b628-26cdab3c6506'),
(109, 11, NULL, '2026-02-25 14:00:58', 25000.00, 'selesai', '72553933-7b73-478c-81d4-75e9f1f7a505'),
(110, 11, NULL, '2026-02-25 14:01:02', 25000.00, 'selesai', '1ed94a3f-f595-49ea-866b-605707f31bae'),
(111, 11, NULL, '2026-02-25 14:01:05', 25000.00, 'selesai', '4cc985b0-a734-408f-bc50-f89fbdf8eb7d'),
(112, 11, NULL, '2026-02-25 14:01:09', 28000.00, 'selesai', '5d1f2a33-e9f9-442a-8300-d7456fcd32de'),
(113, 11, NULL, '2026-02-25 14:01:12', 25000.00, 'selesai', '2be757d7-02a5-4211-ab99-5d7288a66ed2'),
(114, 11, NULL, '2026-02-25 14:01:15', 25000.00, 'selesai', '65fcd09b-2529-41dc-9d75-740f095df368'),
(115, 11, NULL, '2026-02-25 14:01:21', 23000.00, 'selesai', '868302f2-32fc-4909-b680-cbcea7987503'),
(116, 11, NULL, '2026-02-25 14:01:27', 25000.00, 'selesai', '1d656dd5-c013-45d4-a3f3-b96f96b68581'),
(117, 11, NULL, '2026-02-25 14:01:30', 28000.00, 'selesai', 'f7d62f78-1740-48a2-8959-314dad999668'),
(118, 11, NULL, '2026-02-25 14:01:34', 30000.00, 'selesai', '6b8588d9-3b12-452a-945a-50d453b80bdc'),
(119, 11, NULL, '2026-02-25 14:01:38', 30000.00, 'selesai', '6448b9b0-6290-4132-963d-1ee0625b0b60'),
(120, 11, NULL, '2026-02-25 14:03:30', 60000.00, 'selesai', 'f21ccc0c-b96d-406e-ba8b-d54d9feaae79'),
(121, 11, NULL, '2026-02-25 14:05:38', 50000.00, 'selesai', '8148c4e2-41dd-4cf3-a775-593b6606c7ef'),
(122, 11, NULL, '2026-02-25 14:20:00', 75000.00, 'selesai', 'b1ccb753-abf4-41d2-877d-fa58456370f1'),
(123, 11, NULL, '2026-02-25 14:28:25', 25000.00, 'selesai', '1b0dd068-917f-4b6e-8e17-089d3afdfdbf'),
(124, 9, NULL, '2026-02-25 14:29:16', 48000.00, 'selesai', '30659df6-2424-4108-8737-630e1077aa59'),
(125, 11, NULL, '2026-02-25 14:33:43', 23000.00, 'selesai', '01273bbc-16e4-4839-9b59-e890d431be81'),
(126, 9, NULL, '2026-02-25 14:47:08', 53000.00, 'selesai', '1560dba8-1eb7-4fbd-962b-1b1e5c7f32e6'),
(127, 9, NULL, '2026-02-25 14:47:38', 43000.00, 'selesai', '1980838c-a0c2-4fa3-be8b-77050fe4f676'),
(128, 9, NULL, '2026-02-25 14:50:31', 43000.00, 'selesai', '7f05e9b7-6893-43de-9d52-15076968960e'),
(129, 9, NULL, '2026-02-25 15:05:15', 25000.00, 'selesai', '51a2ca40-41b9-4283-847d-6d0a30384109'),
(130, 9, NULL, '2026-02-25 15:16:04', 25000.00, 'selesai', '0f93d83c-3337-439f-a7fa-04631cf46c00'),
(131, 9, NULL, '2026-02-25 15:26:39', 25000.00, 'selesai', 'b5aeda02-33ee-4d47-bdc6-72b7124857a3'),
(132, 9, NULL, '2026-02-25 15:27:22', 58000.00, 'selesai', '8a6dcd5a-3404-4db9-bcf6-66b3df10a414'),
(133, 11, NULL, '2026-02-25 15:29:35', 60000.00, 'selesai', '83bc0c38-65e3-445f-a133-4cce6045f1c0'),
(134, 11, NULL, '2026-02-25 15:30:46', 25000.00, 'selesai', 'dff12e51-10b2-4d47-8ff5-7e7516576f16'),
(135, 9, NULL, '2026-02-25 15:38:13', 25000.00, 'selesai', '04774b6a-7445-4cba-ac07-bac6cdf5550a'),
(136, 9, NULL, '2026-02-25 15:55:45', 25000.00, 'selesai', '55469e83-7d32-4a5c-b1f8-be2e1aade075'),
(137, 9, NULL, '2026-02-25 15:55:58', 18000.00, 'selesai', '62168b43-d3eb-4b72-aa06-badfec8b6f45'),
(138, 9, NULL, '2026-02-25 16:02:08', 25000.00, 'selesai', '97f698f9-29ae-4ad5-a35c-483b237107d2'),
(139, 9, NULL, '2026-02-25 16:02:27', 50000.00, 'selesai', '7be45099-d0df-48ef-816f-04dff9589ea1'),
(140, 9, NULL, '2026-02-25 16:04:53', 43000.00, 'selesai', '34f53d5c-ce62-42d8-9060-8e4a6b1e4e27'),
(141, 11, NULL, '2026-02-25 16:06:33', 30000.00, 'selesai', '5e8d00af-49af-4c72-9078-d1905bbd14b1'),
(142, 9, NULL, '2026-02-25 16:08:24', 48000.00, 'selesai', '3050ae8f-87ee-4b8d-b509-d1d8c4938ce9'),
(143, 9, NULL, '2026-02-25 16:20:59', 53000.00, 'selesai', '8d48fef1-4698-4bfe-a7eb-b235a29daffa'),
(144, 9, NULL, '2026-02-25 16:26:22', 18000.00, 'selesai', '80460936-ced0-44d3-91d1-fc90b752c9fa'),
(145, 9, NULL, '2026-02-25 16:29:00', 53000.00, 'selesai', '87d206ba-b8ed-4cc3-a3b8-37bf196bc6a3'),
(146, 8, NULL, '2026-02-25 16:29:19', 150000.00, 'selesai', '6a8cb25a-8c96-400b-b101-3f75b75a2d1c'),
(147, 8, NULL, '2026-02-25 16:30:17', 25000.00, 'selesai', '8a9be2dd-760a-45f7-a478-bb5ed0da5e9d'),
(148, 8, NULL, '2026-02-25 16:30:21', 28000.00, 'selesai', '1cd7e52b-3822-4b94-95cf-5393a84c53ed'),
(149, 8, NULL, '2026-02-25 16:30:27', 50000.00, 'selesai', '2ae8db60-432c-4ab8-a6e9-6c96a82c5fc0'),
(150, 9, NULL, '2026-02-25 16:30:31', 50000.00, 'selesai', '29e5f0dd-1bd0-4fc5-b653-5abe540aeb8a'),
(151, 9, NULL, '2026-02-25 16:34:13', 25000.00, 'selesai', '2a4a0a1b-f923-4f5d-8f11-ccc60813343e'),
(152, 9, NULL, '2026-02-25 16:34:32', 50000.00, 'selesai', '83966764-5685-4c44-8969-6e63af7f123a'),
(153, 9, NULL, '2026-02-25 16:35:08', 18000.00, 'dibatalkan', 'e12d3b77-7fd6-40a8-b46e-10c8f224d26e'),
(154, 9, NULL, '2026-02-25 16:35:37', 25000.00, 'dibatalkan', '30deee53-10d8-45aa-8d17-4add941632e7'),
(155, 9, NULL, '2026-02-25 16:36:08', 25000.00, 'dibatalkan', 'fa6bc82f-b562-48ae-8861-687f96761e08'),
(156, 9, NULL, '2026-02-25 16:36:37', 50000.00, 'dibatalkan', '19f12dfd-6e17-4a70-b828-b15746f9b375'),
(157, 9, NULL, '2026-02-25 16:37:04', 25000.00, 'dibatalkan', '64a31c79-29eb-4d81-900c-a07e477e3da6'),
(158, 9, NULL, '2026-02-25 16:40:01', 53000.00, 'dibatalkan', 'fab3e280-42f9-42b4-8a7d-7d459f619854'),
(159, 9, NULL, '2026-02-25 16:41:52', 53000.00, 'dibatalkan', 'fdde69e5-37cd-40d0-8415-f4ef06b51550'),
(160, 9, NULL, '2026-02-25 16:42:12', 18000.00, 'dibatalkan', '19a8d0af-025f-4ad6-b236-a657dd6b3386'),
(161, 9, NULL, '2026-02-25 16:48:08', 18000.00, 'dibatalkan', 'f46423d0-3bad-4e77-9b8f-154257c7bed3'),
(162, 9, NULL, '2026-02-25 16:48:34', 25000.00, 'dibatalkan', '64d2965b-cb24-4ac7-8868-c7a7262ba130'),
(163, 9, NULL, '2026-02-25 16:51:46', 43000.00, 'dibatalkan', 'c4f7fb89-a6bb-4cd4-89bf-8a7a8fe62bc7'),
(164, 9, NULL, '2026-02-25 17:05:08', 25000.00, 'dibatalkan', '8af79a97-50a1-4607-96bc-4702a8e4997d'),
(165, 8, NULL, '2026-02-25 17:09:59', 25000.00, 'selesai', '4df4f538-02fb-4c40-a639-41314788b4eb'),
(166, 8, NULL, '2026-02-25 17:10:05', 60000.00, 'selesai', '1c3aa6a5-321e-4e35-8d99-0cf7fa9d7543'),
(167, 8, NULL, '2026-02-25 17:10:22', 25000.00, 'selesai', 'f83d5406-d561-4318-a22c-411531fe80ce'),
(168, 8, NULL, '2026-02-25 17:10:55', 30000.00, 'selesai', 'dd8c5862-a774-4a4a-89c8-6e900a0db54d'),
(169, 8, NULL, '2026-02-25 17:11:04', 60000.00, 'selesai', 'a4be10eb-b9f8-437b-85d5-15f1b9d9bcdf'),
(170, 8, NULL, '2026-02-25 17:11:24', 50000.00, 'selesai', 'd335352a-8806-4a23-bdbc-f47c8fe63c53'),
(171, 8, NULL, '2026-02-25 17:11:37', 25000.00, 'selesai', 'c294b034-f51c-4163-a767-83f4d4d00a73'),
(172, 11, NULL, '2026-02-25 17:12:46', 25000.00, 'selesai', '6c06448e-b0a4-4558-97f6-9feab4bf987b'),
(173, 11, NULL, '2026-02-25 17:12:49', 25000.00, 'selesai', '673991dd-b3e3-4e22-8d50-2145ae958893'),
(174, 11, NULL, '2026-02-25 17:12:52', 18000.00, 'selesai', '17947b0c-44af-4b4d-a30c-a563c7caea92'),
(175, 11, NULL, '2026-02-25 17:12:55', 25000.00, 'selesai', '631ac800-022e-40b6-8e9a-3b289ab16727'),
(176, 11, NULL, '2026-02-25 17:12:58', 25000.00, 'selesai', 'f7455df6-8f31-4b9d-86a0-a8ce1f50cf69'),
(177, 11, NULL, '2026-02-25 17:13:01', 28000.00, 'selesai', '1b0f2849-0b3d-4162-9170-194c00562b4a'),
(178, 11, NULL, '2026-02-25 17:13:04', 25000.00, 'selesai', 'bdf65197-ea87-4569-9ea6-0b10a9298dfa'),
(179, 11, NULL, '2026-02-25 17:13:07', 28000.00, 'selesai', 'c76baf72-6b5e-4d49-9393-975d67f4db77'),
(180, 11, NULL, '2026-02-25 17:13:10', 25000.00, 'selesai', '4afc2e02-8a71-49ac-953c-3e87e9ebde0d'),
(181, 11, NULL, '2026-02-25 17:13:14', 25000.00, 'selesai', '022c22e4-8c1c-4730-b2cb-f48272a8ac9a'),
(182, 11, NULL, '2026-02-25 17:13:17', 25000.00, 'selesai', '267d7989-4284-4adf-afe2-d25ba5347e40'),
(183, 11, NULL, '2026-02-25 17:13:19', 25000.00, 'selesai', 'f56411c8-d9e7-4d45-80a7-cc8e85bb5f78'),
(184, 11, NULL, '2026-02-25 17:13:22', 28000.00, 'selesai', 'bec78d31-44c5-4f0d-89c7-15f189c32e23'),
(185, 11, NULL, '2026-02-25 17:13:25', 25000.00, 'selesai', '58cfb7d1-aef7-4e5b-addb-6adee3b91b28'),
(186, 11, NULL, '2026-02-25 17:13:28', 25000.00, 'selesai', '9f26b5cc-bb2e-406a-8819-1371e40d21c4'),
(187, 11, NULL, '2026-02-25 17:13:31', 23000.00, 'selesai', 'f4f9c881-71af-436e-9d54-b292b924a7d2'),
(188, 11, NULL, '2026-02-25 17:13:37', 25000.00, 'selesai', 'f5d1a934-1d96-4dba-8474-64a643459349'),
(189, 11, NULL, '2026-02-25 17:13:40', 28000.00, 'selesai', '58b78fc5-66ba-46cb-afbf-d8ff5e06b61b'),
(190, 11, NULL, '2026-02-25 17:13:42', 30000.00, 'selesai', 'ac7a762c-af44-49fb-92ff-3ce7cc275eea'),
(191, 11, NULL, '2026-02-25 17:13:47', 30000.00, 'selesai', '0fd37c63-f204-4dc7-bd75-32bf5e3d254d'),
(192, 11, NULL, '2026-02-25 17:13:51', 30000.00, 'selesai', '833f3b06-a1fb-4ee9-a7aa-0f95b95673bf'),
(193, 11, NULL, '2026-02-25 17:13:54', 30000.00, 'selesai', '7350849e-dbaf-4be2-aa43-596f01e6bd03'),
(194, 8, NULL, '2026-02-25 17:14:38', 25000.00, 'selesai', '49741591-ff47-49a4-83de-1362f34a6237'),
(195, 8, NULL, '2026-02-25 17:14:42', 25000.00, 'selesai', '692d1eaf-0802-4a7d-bd83-8fa19d7f6602'),
(196, 8, NULL, '2026-02-25 17:14:44', 18000.00, 'selesai', '62e3ce97-f67e-4dec-a9c7-188a3874c160'),
(197, 8, NULL, '2026-02-25 17:14:47', 25000.00, 'selesai', 'd01cc430-24a5-4fe3-8328-5b3c78475388'),
(198, 8, NULL, '2026-02-25 17:14:50', 25000.00, 'selesai', '003af06f-aeed-4785-978a-28e53e077b9d'),
(199, 8, NULL, '2026-02-25 17:14:53', 28000.00, 'selesai', '37c89a79-e287-4b62-9117-5f5b89ba9f56'),
(200, 8, NULL, '2026-02-25 17:14:56', 25000.00, 'selesai', '504c5e1b-68de-4c23-85a6-5573cf327cb0'),
(201, 8, NULL, '2026-02-25 17:15:00', 28000.00, 'selesai', '6fbb9931-f8ec-44f2-b6ee-dda4bef422a4'),
(202, 8, NULL, '2026-02-25 17:15:03', 25000.00, 'selesai', '85bf61af-9a0d-4a9c-8aa9-c3992b777515'),
(203, 8, NULL, '2026-02-25 17:15:06', 25000.00, 'selesai', 'f7c8b0da-d5f0-4574-96dd-ae5101562533'),
(204, 8, NULL, '2026-02-25 17:15:10', 25000.00, 'selesai', 'c8dd3b41-8f16-4c10-9aab-24e02d534298'),
(205, 8, NULL, '2026-02-25 17:15:13', 25000.00, 'selesai', '941bf42a-d68d-46bd-aeb9-3820c3b9cede'),
(206, 8, NULL, '2026-02-25 17:15:16', 28000.00, 'selesai', '403acefb-6a7d-411c-8fc8-eb301b61851e'),
(207, 8, NULL, '2026-02-25 17:15:19', 25000.00, 'selesai', '7adaf574-7545-45d3-b4d0-e50d86cd8159'),
(208, 8, NULL, '2026-02-25 17:15:22', 25000.00, 'selesai', '377e6c7c-4adc-4445-877e-2d5c6490623d'),
(209, 8, NULL, '2026-02-25 17:15:25', 23000.00, 'selesai', '6a8c4292-91d5-42e5-80b8-265e78b69ce5'),
(210, 8, NULL, '2026-02-25 17:15:28', 25000.00, 'selesai', 'c20bbf8f-d645-48c0-8740-acd2b9c8599b'),
(211, 8, NULL, '2026-02-25 17:15:32', 28000.00, 'selesai', '2ad7d8e8-1505-44dd-b6b3-f307f52ab71c'),
(212, 8, NULL, '2026-02-25 17:15:37', 30000.00, 'selesai', 'f2fced78-2e90-4395-87fa-523be107d9ec'),
(213, 8, NULL, '2026-02-25 17:15:41', 30000.00, 'selesai', '2329a60d-975c-428f-b006-2e780e604923'),
(214, 8, NULL, '2026-02-25 17:15:44', 30000.00, 'selesai', 'e77fab49-d502-4098-86dc-df10815abc41'),
(215, 8, NULL, '2026-02-25 17:15:46', 30000.00, 'selesai', 'd4d73c70-baae-415d-8ebb-53d2cc1204ff'),
(216, 9, NULL, '2026-02-26 14:15:39', 25000.00, 'dibatalkan', 'db9bbf4c-d61a-41b2-88fa-30e21e53da3c'),
(217, 9, NULL, '2026-02-26 14:27:12', 25000.00, 'dibatalkan', 'ee9bc0f2-a62a-4813-ab04-460e87e9828c'),
(218, 9, NULL, '2026-02-26 14:56:12', 43000.00, 'dibatalkan', '7c83fa95-bd9e-427d-84c3-a33ce8d5e976'),
(219, 9, NULL, '2026-02-26 15:12:14', 50000.00, 'dibatalkan', 'c273065b-ab56-472c-8cb3-752370512fde'),
(220, 9, NULL, '2026-02-26 15:36:49', 100000.00, 'selesai', '6063c029-3df7-4a50-ad60-0783a34af1a3'),
(221, 9, NULL, '2026-02-26 15:40:21', 46000.00, 'selesai', 'c930e31f-5991-4242-9189-5254b7cbb92c'),
(222, 9, NULL, '2026-02-26 16:57:39', 36000.00, 'selesai', '0145bf4a-83b4-48da-b847-52ba0c307701'),
(223, 8, NULL, '2026-03-09 14:17:54', 50000.00, 'selesai', 'f43738bd-90e3-4388-87e5-c42e6a6d4e02'),
(224, 25, NULL, '2026-03-09 14:43:54', 50000.00, 'dibatalkan', '02e2e66a-137d-4997-93ac-dd4ff38e73f8'),
(225, 25, NULL, '2026-03-09 14:48:11', 28000.00, 'selesai', '533d8b37-694e-40ec-b330-04b8767f8b6a'),
(226, 25, NULL, '2026-03-09 14:50:28', 30000.00, 'selesai', 'df421157-161f-4dcb-98d4-4eeb1f27af7b'),
(227, 8, NULL, '2026-03-09 15:52:19', 30000.00, 'selesai', '9889544f-e644-43b8-b7f2-724d0f29207d'),
(228, 8, NULL, '2026-03-09 15:52:26', 30000.00, 'selesai', '607f0c3e-4544-4bea-9e05-fa6eaab53b92'),
(229, 8, NULL, '2026-03-18 22:23:22', 30000.00, 'selesai', '25fb9c5f-6e95-4db2-ac65-bba2d43f4356');

-- --------------------------------------------------------

--
-- Struktur dari tabel `testimoni`
--

CREATE TABLE `testimoni` (
  `id_testimoni` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `isi_testimoni` varchar(100) DEFAULT NULL,
  `status_persetujuan` enum('pending','disetujui','ditolak') DEFAULT 'pending',
  `foto_testimoni` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `testimoni`
--

INSERT INTO `testimoni` (`id_testimoni`, `id_user`, `isi_testimoni`, `status_persetujuan`, `foto_testimoni`) VALUES
(7, 6, 'uuusedapnyoo', 'disetujui', 'cc5bff3d2717663e.jpg'),
(11, 7, 'enakk', 'disetujui', '55cd36e6921eb611.png'),
(25, 8, 'enakk', 'disetujui', '63f1236b0621f3f1.png'),
(30, 8, 'Pelayanan ramah sekali.', 'disetujui', 'beruang-imut.jpeg'),
(31, 8, 'Foto kustom tes', 'pending', '90a225925322feda.jpg'),
(32, 25, 'beli mocha sama chocoberry manisnya pas! next mau beli varian lainnya, mau pesen banyak pokoknyaaaaa', 'disetujui', '66d1707d94349d89.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('pelanggan','kasir','pemilik') DEFAULT 'pelanggan'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `nama`, `email`, `password`, `role`) VALUES
(1, 'Afrah', 'afrah@gmail.com', '$2y$10$xjq4eEtVge8JCTp8xnJfpuPBU4IZeb/92SLjT8N4NZ7hs9hMhuQla', 'pemilik'),
(6, 'roje123', 'roje12@gmail.com', '$2y$10$rSMkaZuCH4M7qs9vE1nAfueIn/IbpMXjTanz9Sg98kC8FppC0mqb.', 'pelanggan'),
(7, 'maritza', 'maritza@gmail.com', '$2y$10$bh4e1wSaRkNt6yEah7U2JebDKXf0GqLW557LapnNt/TDxc14TEJXi', 'kasir'),
(8, 'inaa', 'ina@gmail.com', '$2y$10$q/4NTmieJ81bFPGVguusl.7/7iCmEEoatMXkZgZhR83UXe5C/uI76', 'pelanggan'),
(9, 'hihi18', 'hihi18@gmail.com', '$2y$10$wvTpuS1OSglkujsJ0XSyo..wD5Rtde.KfqmU8C8pdctYgruK5ffRa', 'pelanggan'),
(10, 'user123', 'user@gmail.com', '$2y$10$j7W8OIYViE48p.BFcDcvpeCGDOMP0fd9mCCq3z37ZF4UGcgedM73G', 'pelanggan'),
(11, 'lana', 'lanaza@gmail.com', '$2y$10$e2IK2LSVv1eFAWW1JQal2ejQhGLBwHUShBrTsf8gzbTAS5rnOgtc2', 'pelanggan'),
(25, 'user1234', 'user123@gmail.com', '$2y$10$z4Fu2RT4JUvO95KK4xRPyOdRjgG7CZnuWxBnIHDhUxLKhg7qtddMC', 'pelanggan'),
(26, 'maritza', 'maritza123@gmail.com', '$2y$10$A3/DV4oYUmrJQozjccjAd.ya88SeHNECW7X6r7iMztmVWL3jh.d46', 'pelanggan'),
(27, 'yy', 'yy@gmail.com', '$2y$10$CihXW83nI3m9CTvHTnxvr.15Mp0M0LAgy2wPbfJZbf5h9N0Zp2JZK', 'pelanggan');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `fk_detail_pesanan` (`id_pesanan`),
  ADD KEY `fk_detail_menu` (`id_menu`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `fk_pesanan_user` (`id_user`);

--
-- Indeks untuk tabel `testimoni`
--
ALTER TABLE `testimoni`
  ADD PRIMARY KEY (`id_testimoni`),
  ADD KEY `fk_testimoni_user` (`id_user`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=279;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT untuk tabel `testimoni`
--
ALTER TABLE `testimoni`
  MODIFY `id_testimoni` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD CONSTRAINT `fk_detail_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_detail_pesanan` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `fk_pesanan_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `testimoni`
--
ALTER TABLE `testimoni`
  ADD CONSTRAINT `fk_testimoni_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
