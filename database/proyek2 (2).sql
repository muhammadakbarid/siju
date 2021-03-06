-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Agu 2021 pada 05.13
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyek2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akbr_contoh`
--

CREATE TABLE `akbr_contoh` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `alamat` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `akbr_contoh`
--

INSERT INTO `akbr_contoh` (`id`, `nama`, `alamat`, `email`) VALUES
(1, 'Muhammad Akbar', 'Sarijadi, Bandung', 'muhammad.akbar5999@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `harga_barang` int(11) NOT NULL,
  `stok_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga_barang`, `stok_barang`) VALUES
(2, 'Roundup 1L', 85000, 16),
(3, 'Pupuk Urea', 200000, 46),
(4, 'Curacron 100ml', 30000, 66),
(5, 'Bablas 1L', 65000, 21),
(6, 'Pupuk Amaphos', 450000, 0),
(7, 'Marshal', 30000, 74),
(8, 'Sidafos', 75000, 24),
(9, 'Dafat', 23000, 125),
(10, 'Astertin', 17000, 45),
(11, 'Decis', 16000, 39),
(12, 'Supremo', 65000, 100),
(13, 'Supretox', 65000, 119),
(14, 'Mr. quat', 60000, 78),
(15, 'Bionasa', 70000, 34),
(16, 'Dangke', 25000, 126);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_barang` int(11) NOT NULL,
  `id_transaksi` char(200) NOT NULL,
  `id_dtl_transaksi` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_barang`, `id_transaksi`, `id_dtl_transaksi`, `quantity`, `total`) VALUES
(6, '7', 1, 3, 1350000),
(3, '7', 2, 2, 400000),
(5, '7', 3, 2, 130000),
(2, '8', 4, 2, 170000),
(5, '9', 5, 1, 65000),
(4, '9', 6, 4, 120000),
(6, '9', 7, 2, 900000),
(2, '9', 8, 1, 85000),
(3, '10', 9, 1, 200000),
(5, '11', 10, 1, 65000),
(3, '11', 11, 4, 800000),
(6, '11', 12, 1, 450000),
(5, '11', 13, 2, 130000),
(9, '12', 14, 2, 46000),
(15, '13', 15, 1, 70000),
(7, '13', 16, 2, 60000),
(6, '14', 17, 1, 450000),
(6, '15', 18, 1, 450000),
(9, '16', 19, 1, 23000),
(16, '17', 20, 4, 100000),
(4, '17', 21, 3, 90000),
(9, '17', 22, 1, 23000),
(6, '18', 23, 1, 450000),
(9, '19', 24, 1, 23000),
(16, '21', 26, 3, 75000),
(11, '22', 27, 1, 16000),
(8, '22', 28, 2, 150000),
(15, '23', 29, 1, 70000),
(14, '24', 30, 2, 120000),
(10, '25', 31, 2, 34000),
(9, '25', 32, 3, 69000),
(7, '25', 33, 1, 30000),
(6, '25', 34, 1, 450000),
(5, '25', 35, 4, 260000),
(4, '25', 36, 1, 30000),
(3, '25', 37, 2, 400000),
(2, '25', 38, 1, 85000),
(15, '26', 39, 1, 70000),
(2, '27', 40, 2, 170000),
(4, '27', 41, 1, 30000),
(6, '27', 42, 3, 1350000),
(2, '28', 43, 1, 85000),
(9, '28', 44, 2, 46000),
(4, '28', 45, 2, 60000),
(16, '29', 46, 1, 25000),
(13, '29', 47, 1, 65000),
(10, '29', 48, 2, 34000),
(10, '30', 49, 1, 17000),
(3, '30', 50, 2, 400000),
(15, '31', 51, 3, 210000),
(8, '31', 52, 1, 75000),
(15, '32', 53, 1, 70000);

--
-- Trigger `detail_transaksi`
--
DELIMITER $$
CREATE TRIGGER `Stok` AFTER INSERT ON `detail_transaksi` FOR EACH ROW BEGIN
UPDATE barang
SET stok_barang= stok_barang-new.quantity
WHERE id_barang= new.id_barang
;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `frontend_menu`
--

CREATE TABLE `frontend_menu` (
  `id_menu` int(11) NOT NULL,
  `label` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `frontend_menu`
--

INSERT INTO `frontend_menu` (`id_menu`, `label`, `link`, `id`, `sort`) VALUES
(1, 'Home', 'frontend/index', 'Home', 0),
(2, 'Features', 'frontend/features', 'Features', 1),
(3, 'About', 'frontend/about', 'about', 2),
(4, 'Sign in', 'login', 'signin', 3);

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
(32, 'Owner', 'Pemilik Toko');

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
(1, 8),
(1, 89),
(1, 91),
(4, 91),
(1, 93),
(1, 94),
(1, 43),
(1, 44),
(1, 42),
(1, 125),
(2, 125),
(7, 125),
(8, 125),
(17, 125),
(18, 125),
(24, 125),
(26, 125),
(28, 125),
(29, 125),
(1, 127),
(2, 127),
(1, 8),
(1, 89),
(1, 91),
(4, 91),
(1, 93),
(1, 94),
(1, 43),
(1, 44),
(1, 42),
(1, 125),
(2, 125),
(7, 125),
(8, 125),
(17, 125),
(18, 125),
(24, 125),
(26, 125),
(28, 125),
(29, 125),
(1, 127),
(2, 127),
(1, 3),
(32, 3),
(1, 1),
(32, 1),
(1, 40),
(1, 8),
(1, 89),
(1, 91),
(4, 91),
(1, 93),
(1, 94),
(1, 43),
(1, 44),
(1, 115),
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
(1, 125),
(2, 125),
(7, 125),
(8, 125),
(17, 125),
(18, 125),
(24, 125),
(26, 125),
(28, 125),
(29, 125),
(1, 127),
(2, 127),
(2, 113),
(1, 116),
(32, 116),
(1, 120),
(1, 117),
(2, 117),
(1, 119),
(32, 119);

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_session_token`
--

CREATE TABLE `list_session_token` (
  `session_id` int(11) NOT NULL,
  `session_token` varchar(100) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `active_time` datetime NOT NULL,
  `expire_time` datetime NOT NULL,
  `is_login` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `list_session_token`
--

INSERT INTO `list_session_token` (`session_id`, `session_token`, `admin_id`, `active_time`, `expire_time`, `is_login`) VALUES
(12, 'mFu6GqJ9laWV3G9pwgch9pETdg', 1, '2021-01-07 12:35:04', '2021-01-07 12:50:04', 0),
(13, 'S7oAgkk63Xm8n2MGzXIdnJsXho', 1, '2021-01-07 12:41:35', '2021-01-07 12:56:35', 1);

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

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `npm` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `npm`, `nama`, `tgl_lahir`) VALUES
(1, 2193001, 'Alvi Yatul Wardah', '2000-12-09'),
(2, 2193002, 'Aryaputra Wicaksono', '2001-05-30'),
(3, 2193003, 'Charles Marpaung', '2000-10-19'),
(4, 2193004, 'Ester Cibro', '2001-04-07'),
(5, 2193005, 'Fajar Somantri', '2000-08-10'),
(6, 2193006, 'Genta Tabah Pengabdian', '2001-04-20'),
(7, 2193007, 'Gerald Rajagukguk', '2001-06-03'),
(8, 2193008, 'Grenius Natanael Sidabutar', '2001-12-31'),
(9, 2193009, 'Ilfah Rifany', '2001-06-02'),
(10, 2193010, 'Khaliza Diva Qintanada', '2001-09-07'),
(11, 2193011, 'Koestiyandi Prayoga', '2001-05-17'),
(12, 2193012, 'Mita Hasanah', '2000-07-19'),
(13, 2193013, 'Muhammad Akbar', '1999-09-05'),
(14, 2193014, 'Nazzilla Auliya Putri', '2000-08-11'),
(15, 2193015, 'Popy Geovani', '2001-04-30'),
(16, 2193016, 'Prita Fitria Waluyo', '2001-01-09'),
(17, 2193017, 'Savia Almira Salsabilla', '2001-02-14'),
(18, 2193018, 'Tegar Nova Silviana', '2001-11-08'),
(19, 2193019, 'Thifal Irbah Anan', '2000-07-04'),
(20, 2193020, 'Vinda Ayu Lestari', '2001-01-20'),
(21, 2193021, 'Zsa Zsa Sabilla', '2001-05-06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
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
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id_menu`, `sort`, `level`, `parent_id`, `icon`, `label`, `link`, `id`, `id_menu_type`) VALUES
(1, 0, 1, 0, 'empty', 'MAIN NAVIGATION', '#', '#', 1),
(3, 1, 2, 1, 'fas fa-tachometer-alt', 'Dashboard', 'dashboard', '#', 1),
(43, 11, 3, 42, 'fas fa-angle-double-right', 'Users', 'users', '1', 1),
(44, 12, 3, 42, 'fas fa-angle-double-right', 'Groups', 'groups', '2', 1),
(92, 2, 1, 0, 'empty', 'MASTER DATA', '#', 'masterdata', 1),
(116, 3, 2, 92, 'fas fa-plus-square', 'Kelola Data Barang', 'barang', 'jksj', 1),
(117, 5, 2, 92, 'far fa-calendar-alt', 'Riwayat Pesanan', 'transaksi', 'jwehfu', 1),
(119, 6, 2, 92, 'fas fa-chart-bar', 'Laporan Penjualan', 'view_penjualan', 'popy', 1),
(120, 4, 2, 92, 'fas fa-list', 'Kelola Daftar Pesanan', 'transaksi/create', '#', 1);

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
-- Struktur dari tabel `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nilai` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `setting`
--

INSERT INTO `setting` (`id`, `kode`, `nama`, `nilai`) VALUES
(1, 'WhatsApp_Image_2021-06-16_at_16_13_26.jpg', 'FADJAR COY', 'www.fadjarcoy.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `total_bayar`, `tanggal_transaksi`, `status`) VALUES
(1, 900000, '2021-07-13', 'sudah dibayar'),
(2, 85000, '2021-07-12', 'sudah dibayar'),
(5, 260000, '2021-07-09', 'sudah dibayar'),
(6, 530000, '2021-07-16', 'sudah dibayar'),
(7, 1880000, '2021-07-16', 'sudah dibayar'),
(8, 170000, '2021-07-16', 'sudah dibayar'),
(9, 1170000, '2021-07-16', 'sudah dibayar'),
(10, 200000, '2021-07-16', 'sudah dibayar'),
(11, 1445000, '2021-07-18', 'sudah dibayar'),
(12, 46000, '2021-07-18', 'sudah dibayar'),
(13, 130000, '2021-07-18', 'sudah dibayar'),
(14, 450000, '2021-07-18', 'sudah dibayar'),
(15, 450000, '2021-07-18', 'sudah dibayar'),
(16, 23000, '2021-07-18', 'sudah dibayar'),
(17, 213000, '2021-07-18', 'sudah dibayar'),
(18, 450000, '2021-07-18', 'sudah dibayar'),
(19, 23000, '2021-07-18', 'sudah dibayar'),
(20, 75000, '2021-07-18', 'sudah dibayar'),
(21, 75000, '2021-07-18', 'sudah dibayar'),
(22, 166000, '2021-07-18', 'sudah dibayar'),
(23, 70000, '2021-07-18', 'sudah dibayar'),
(24, 120000, '2021-07-18', 'sudah dibayar'),
(25, 1358000, '2021-07-18', 'sudah dibayar'),
(26, 70000, '2021-07-18', 'sudah dibayar'),
(27, 1550000, '2021-07-19', 'sudah dibayar'),
(28, 191000, '2021-07-26', 'sudah dibayar'),
(29, 124000, '2021-07-31', 'sudah dibayar'),
(30, 417000, '2021-08-03', 'sudah dibayar'),
(31, 285000, '2021-08-10', 'sudah dibayar'),
(32, 70000, '2021-08-10', 'sudah dibayar');

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
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `image` varchar(128) NOT NULL DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `image`) VALUES
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@kasir.com', '', 'm0vyKu2zW7L8PTG20bquF.707e055aeea8a30aca', 1541329145, 'WcHCQ5vcXwT1z99BvJUWnu', 1268889823, 1628645972, 1, 'Admin', 'Kasir', 'ADMIN', '0', 'WhatsApp_Image_2021-06-16_at_16_13_26.jpg'),
(12, '::1', 'ilfahrifany02@gmail.com', '$2y$08$MjxDCY4TV8dI0j/PTn.bJu30jlcpjNyuLZKHHrGOJX.grARWbsGlC', NULL, 'ilfahrifany02@gmail.com', NULL, NULL, NULL, NULL, 1623827706, 1628563726, 1, 'Owner', 'Pemilik', 'Toko Fadjar Coy', '082210845917', 'owner.jpg');

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
(91, 12, 32),
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
(88, 39, 31),
(89, 40, 2);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_penjualan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_penjualan` (
`tanggal_transaksi` date
,`total_pendapatan` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `view_penjualan`
--
DROP TABLE IF EXISTS `view_penjualan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_penjualan`  AS  (select `transaksi`.`tanggal_transaksi` AS `tanggal_transaksi`,sum(`transaksi`.`total_bayar`) AS `total_pendapatan` from `transaksi` where `transaksi`.`status` = 'sudah dibayar' group by `transaksi`.`tanggal_transaksi` order by `transaksi`.`tanggal_transaksi` desc) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `akbr_contoh`
--
ALTER TABLE `akbr_contoh`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_dtl_transaksi`);

--
-- Indeks untuk tabel `frontend_menu`
--
ALTER TABLE `frontend_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`);

--
-- Indeks untuk tabel `list_session_token`
--
ALTER TABLE `list_session_token`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `FK__list_admin` (`admin_id`);

--
-- Indeks untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `npm` (`npm`) USING BTREE;

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
-- Indeks untuk tabel `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

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
-- AUTO_INCREMENT untuk tabel `akbr_contoh`
--
ALTER TABLE `akbr_contoh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_dtl_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT untuk tabel `frontend_menu`
--
ALTER TABLE `frontend_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT untuk tabel `list_session_token`
--
ALTER TABLE `list_session_token`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT untuk tabel `menu_type`
--
ALTER TABLE `menu_type`
  MODIFY `id_menu_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
