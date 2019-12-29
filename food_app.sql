-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 29 Des 2019 pada 17.01
-- Versi Server: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `food_app`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_app`
--

CREATE TABLE IF NOT EXISTS `admin_app` (
`id_admin` int(10) NOT NULL,
  `id_role` int(10) DEFAULT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `admin_app`
--

INSERT INTO `admin_app` (`id_admin`, `id_role`, `username`, `password`, `created_on`, `updated_on`) VALUES
(1, 1, 'admin1', '$2a$10$O2omk1bX9kr/Z.RJYxr4EeXMMTbH5SfLDk73z6OrXTDILeEAuRfZC', '2019-12-29 08:00:07', '2019-12-29 08:00:08'),
(2, 1, 'adminlama', '$2a$10$Ga6yfafpT3zEHYaynVTUNOyRdoPzFiXxpZTs5BMsAOnJ8L8EModUK', '2019-12-29 07:06:50', '2019-12-25 07:04:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_resto`
--

CREATE TABLE IF NOT EXISTS `admin_resto` (
`id_resto` int(10) NOT NULL,
  `id_role` int(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data untuk tabel `admin_resto`
--

INSERT INTO `admin_resto` (`id_resto`, `id_role`, `username`, `password`, `created_on`, `updated_on`) VALUES
(1, 2, 'ayampenyetsurabaya', '$2a$10$IFYFG80wvp.mvxTHzf2CX.nZiHJHUHY00mhRfcHd8fGfW8GHgi0Xq', '2019-12-25 01:42:22', '2019-12-24 07:46:04'),
(2, 2, 'hausenak', '$2a$10$Yc3lq4viUoWGPu4woraT2u52ZmsWgGBFMp8CszmlD8ozu8eAnsAFW', '2019-12-29 09:24:33', '2019-12-29 09:24:33'),
(3, 2, 'geprekbensu', '$2a$10$QAazPHOA4d/0OXYz79V4CuMSfg/EXLtwHvX5DkNHaWFqITUXdGK3O', '2019-12-29 07:29:27', '2019-12-29 07:29:27'),
(4, 2, 'tongtji', '$2a$10$GHRr9OVpMzaVa6smgVwe0u9jyzEXZ2pcl.ffAoUn1H4KXgcgQLnua', '2019-12-29 07:29:47', '2019-12-29 07:29:47'),
(5, 2, 'spesialsambal', '$2a$10$ZRWZFtSQvlfZcAOcN3zMkOQPVeD.ugNittboR4q6zy3q8cArWJ0rq', '2019-12-29 07:29:58', '2019-12-29 07:29:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
`id_cart` int(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `id_item` int(10) NOT NULL,
  `name` text NOT NULL,
  `name_resto` varchar(50) NOT NULL,
  `price` int(20) NOT NULL,
  `quantity` int(20) NOT NULL,
  `total` int(20) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id_cart`, `username`, `id_item`, `name`, `name_resto`, `price`, `quantity`, `total`, `created_on`, `updated_on`) VALUES
(8, 'alghi', 5, 'Es Jeruk', 'Ayam Penyet Surabaya', 5000, 2, 10000, '2019-12-29 14:49:57', '2019-12-29 14:49:57'),
(9, 'alghi', 1, 'Ayam Penyet', 'Ayam Penyet Surabaya', 10000, 2, 20000, '2019-12-29 14:55:48', '2019-12-29 14:55:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`id_categories` int(10) NOT NULL,
  `category` varchar(50) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id_categories`, `category`, `created_on`, `updated_on`) VALUES
(1, 'Chicken Food', '2019-12-29 06:40:33', '2019-12-24 08:12:55'),
(2, 'Local Drinks', '2019-12-29 06:40:33', '2019-12-24 08:55:22'),
(3, 'Thai Tea', '2019-12-28 04:21:40', '0000-00-00 00:00:00'),
(4, 'Snack', '2019-12-29 06:41:05', '0000-00-00 00:00:00'),
(5, 'Vegetarian', '2019-12-29 06:41:05', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_data`
--

CREATE TABLE IF NOT EXISTS `item_data` (
`id_item` int(10) NOT NULL,
  `id_categories` varchar(10) NOT NULL,
  `id_resto` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(20) NOT NULL,
  `descriptions` varchar(100) NOT NULL,
  `image` varchar(15) NOT NULL,
  `rating` int(10) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data untuk tabel `item_data`
--

INSERT INTO `item_data` (`id_item`, `id_categories`, `id_resto`, `name`, `price`, `descriptions`, `image`, `rating`, `created_on`, `updated_on`) VALUES
(1, '1', 1, 'Ayam Penyet', 10000, 'Ayam Penyet, Sambal, Nasi, Lalap', 'ayampenyet.jpg', 4, '2019-12-29 06:47:57', '2019-12-27 03:24:30'),
(2, '2', 1, 'Es Teh Manis', 5000, 'Teh, Air, Gula, Es', 'estehmanis.jpg', 5, '2019-12-29 06:48:43', '2019-12-28 03:54:22'),
(3, '1', 1, 'Ayam Bakar', 15000, 'Ayam bakar, nasi, lalap', 'ayambakar.jpg', 0, '2019-12-29 08:41:32', '2019-12-29 08:41:32'),
(4, '1', 1, 'Sop Ayam', 12000, 'Sop ayam, nasi', 'sopayam.jpeg', 0, '2019-12-29 06:49:48', '2019-12-28 03:58:58'),
(5, '2', 1, 'Es Jeruk', 5000, 'Perasan jeruk, air, gula, dan es', 'es jeruk', 5, '2019-12-29 09:30:52', '2019-12-28 04:20:31'),
(6, '3', 2, 'Thai Tea Original', 5000, 'Thai Tea original tanpa topping', 'thaitea', 0, '2019-12-29 08:38:22', '2019-12-28 04:28:36'),
(7, '3', 2, 'Black Oreo Cheese', 15000, 'Thai Tea, Cheese, Oreo', 'blackoreocheese', 0, '2019-12-29 08:46:09', '2019-12-29 08:46:09'),
(8, '3', 2, 'Ovaltine Cheese', 15000, 'Thai Tea, Cheese, Ovaltine', 'ovaltinecheese.', 0, '2019-12-29 08:48:00', '2019-12-29 08:48:00'),
(9, '3', 2, 'Mango Yakult', 16000, 'Mango + Yakult', 'mangoyakult.png', 0, '2019-12-29 08:49:49', '2019-12-29 08:49:49'),
(10, '3', 2, 'Lychee Yakult', 16000, 'Lychee + Yakult', 'lycheeyakult.jp', 0, '2019-12-29 08:50:55', '2019-12-29 08:50:55'),
(11, '1', 3, 'Ayam Geprek', 19000, 'Ayam Geprek, nasi, sambal', 'ayamgeprel.jpg', 0, '2019-12-29 08:54:44', '2019-12-29 08:54:44'),
(12, '1', 3, 'Ayam Geprek Keju', 25000, 'Ayam Geprek, nasi, sambal, Keju', 'ayamgeprekkeju.', 0, '2019-12-29 08:55:03', '2019-12-29 08:55:03'),
(13, '2', 3, 'Air Mineral Prima', 6000, 'Air mineral', 'prima.jpg', 0, '2019-12-29 08:56:52', '2019-12-29 08:56:52'),
(14, '4', 3, 'Kulit Goreng Crispy', 13000, 'Kulit digoreng kering', 'kulitgoreng.jpg', 0, '2019-12-29 08:58:38', '2019-12-29 08:58:38'),
(15, '2', 3, 'Teh Botol Sosro', 10000, 'Teh botol sosro 350 ML', 'tehbotol.jpg', 0, '2019-12-29 08:59:57', '2019-12-29 08:59:57'),
(16, '2', 4, 'Jusmine Tea Jumbo', 10000, 'Teh Melati Oiginal', 'jusminetea.jpg', 0, '2019-12-29 09:01:52', '2019-12-29 09:01:52'),
(17, '2', 4, 'Frussion Peach', 12000, 'Teh rasa peach', 'frussion peach.', 0, '2019-12-29 09:05:50', '2019-12-29 09:05:50'),
(18, '2', 4, 'Frussion Strawberry', 12000, 'Teh rasa Strawbery', 'frussion strawb', 0, '2019-12-29 09:07:17', '2019-12-29 09:07:17'),
(19, '4', 4, 'Tahu Kemul', 16000, 'Tahu Goreng dan sambal kecap', 'tahukemul.jpg', 0, '2019-12-29 09:09:14', '2019-12-29 09:09:14'),
(20, '4', 4, 'Kentang Goreng', 15000, 'kentang goreng bumbu asin', 'kentang goreng.', 0, '2019-12-29 09:10:13', '2019-12-29 09:10:13'),
(21, '1', 5, 'Ayam Bakar', 17000, 'ayam bakar, nasi, lalap, sambal', 'ayambakarss.jpg', 0, '2019-12-29 09:11:34', '2019-12-29 09:11:34'),
(22, '5', 5, 'Terong Balado', 13000, 'Sayur Terong sambal balado', 'terongbalado.jp', 0, '2019-12-29 09:13:20', '2019-12-29 09:13:20'),
(23, '2', 5, 'Es Teh Manis', 5000, 'Es, teh, air, gula', 'esteh.jpg', 0, '2019-12-29 09:14:44', '2019-12-29 09:14:44'),
(24, '5', 5, 'Salad Buah', 20000, 'Salad buah-buahan, susu, mayonaise, keju', 'saladbuah.jpg', 0, '2019-12-29 09:15:43', '2019-12-29 09:15:43'),
(25, '5', 5, 'Salad Sayur', 17000, 'Salad Sayuran + mayonaise', 'saladsayur.jpg', 0, '2019-12-29 09:16:40', '2019-12-29 09:16:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `restaurant_data`
--

CREATE TABLE IF NOT EXISTS `restaurant_data` (
`id_resto` int(10) NOT NULL,
  `name_resto` varchar(50) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `descriptions` varchar(100) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data untuk tabel `restaurant_data`
--

INSERT INTO `restaurant_data` (`id_resto`, `name_resto`, `logo`, `longitude`, `latitude`, `descriptions`, `created_on`, `updated_on`) VALUES
(1, 'Ayam Penyet Surabaya', 'ayampenyetsurabayalogo.jpg', 'nsdnfn33', 'ksnfowen2333irj3i', 'Ayam Penyet Surabaya adalah pelopor restoran ayam penyet di Indonesia.', '2019-12-29 08:07:37', '2019-12-29 08:07:37'),
(2, 'HAUS!', 'haus.jpg', 'inilongitude', 'fjsjnf4f5sfdqwd', 'HAUS! adalah merk dagang spesialis Thai Tea', '2019-12-29 09:22:32', '2019-12-29 09:22:32'),
(3, 'Geprek Bensu', 'geprekbensu.jpg', '2147483647', '213124', 'Geprek Bensu adalah merk dagang ayam geprek milik Ruben Onsu', '2019-12-29 07:35:05', '2019-12-29 07:35:05'),
(4, 'Tong Tji', 'tongtji.jpg', '2222', '213124', 'Tong Tji merupakan nama Brand sedangkan nama perusahaannya adalah Perusahaan Teh Dua Burung Wangi.', '2019-12-29 07:39:56', '2019-12-29 07:39:56'),
(5, 'Waroeng Spesial Sambal', 'ss.jpg', '2222', '2134', 'Waroeng Spesial Sambal “SS” adalah sebuah merk yang menyajikan aneka sambal segar dan masakan khas I', '2019-12-29 07:41:43', '2019-12-29 07:41:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `review`
--

CREATE TABLE IF NOT EXISTS `review` (
`id_review` int(10) NOT NULL,
  `rating` int(10) NOT NULL,
  `review` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `id_item` int(10) NOT NULL,
  `id_user` int(10) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data untuk tabel `review`
--

INSERT INTO `review` (`id_review`, `rating`, `review`, `name`, `id_item`, `id_user`, `created_on`, `updated_on`) VALUES
(1, 5, 'ayamnya pedas mantap', 'Ayam Penyet', 1, 1, '2019-12-27 09:44:57', '0000-00-00 00:00:00'),
(2, 4, 'ayamnya kepedesan', 'Ayam Penyet', 1, 7, '2019-12-27 09:44:57', '0000-00-00 00:00:00'),
(14, 3, 'kurang enak', 'Ayam Penyet', 1, 1, '2019-12-27 13:24:28', '2019-12-27 13:24:28'),
(16, 5, 'segar', ' Es Teh Manis', 2, 1, '2019-12-28 01:10:23', '2019-12-28 01:10:23'),
(17, 5, 'jeruknya kerasa', 'Es Jeruk', 5, 1, '2019-12-29 09:30:53', '2019-12-29 09:30:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `revoked_token`
--

CREATE TABLE IF NOT EXISTS `revoked_token` (
`id_token` int(10) NOT NULL,
  `token` varchar(150) NOT NULL,
  `is_revoked` int(20) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data untuk tabel `revoked_token`
--

INSERT INTO `revoked_token` (`id_token`, `token`, `is_revoked`, `created_on`, `updated_on`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpIiwiaWF0IjoxNTc3MjU4MjAwfQ.6FDYHCggu9LL533aJZKXp2niVBsH2KM3tF9TNmF7GCQ', 0, '2019-12-25 07:16:41', '2019-12-25 07:16:41'),
(32, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpIiwiaWF0IjoxNTc3NTEzNDc2fQ.VecnYYeB6v3d0Lwqp-TdDb9wgVGvqHL4RUzqv26TZJQ', 1, '2019-12-28 06:16:24', '2019-12-28 06:11:17'),
(33, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpIiwiaWF0IjoxNTc3NTE1ODQ5fQ.C4vqYnPurd5NF6KuvtlTPD-tsF33nI_EWyDCXOxpSQE', 1, '2019-12-28 06:51:40', '2019-12-28 06:50:50'),
(34, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpIiwiaWF0IjoxNTc3NTU3NzQzfQ.AxKSB8d41SME7CF-ENAQje1x1COo2izRzGrkOwWSbQQ', 0, '2019-12-28 18:29:04', '2019-12-28 18:29:04'),
(35, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpIiwiaWF0IjoxNTc3NTg1Njk2fQ.zrFpM_NbLUxuMAY-xt8zBicfeEbTRUpW2OzhrV_k1u8', 1, '2019-12-29 02:15:13', '2019-12-29 02:14:56'),
(36, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWF0IjoxNTc3NjAzMDQ0fQ.VzD9OCCd5D0Vh6nPdBas3rM8Hes8UMapFVzrOAJklyc', 1, '2019-12-29 08:27:24', '2019-12-29 07:04:04'),
(37, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImF5YW1wZW55ZXRzdXJhYmF5YSIsImlhdCI6MTU3NzYwODM2NH0.TUKofrDr9fwWdbgMUXkXhLnFFlJuTQ1blpbxuSN0T74', 1, '2019-12-29 09:38:30', '2019-12-29 08:32:44'),
(38, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpIiwiaWF0IjoxNTc3NjExOTkwfQ.oy-bg6BJxu0HfcgG5_TQmwyghkY4hnT2AWk3Nwr47_g', 0, '2019-12-29 09:33:11', '2019-12-29 09:33:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
`id_role` int(10) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id_role`, `name`) VALUES
(1, 'admin_app'),
(2, 'admin_resto'),
(3, 'user');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id_user` int(10) NOT NULL,
  `id_role` int(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `id_role`, `username`, `password`, `created_on`, `updated_on`) VALUES
(1, 3, 'alghi', '$2a$10$9pvs2VrGG427ylJDGVnkN.jsPa7ZjL07MWSZzfsxkjA4dZsLqoHWS', '2019-12-29 14:52:51', '2019-12-29 09:40:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_app`
--
ALTER TABLE `admin_app`
 ADD PRIMARY KEY (`id_admin`), ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `admin_resto`
--
ALTER TABLE `admin_resto`
 ADD PRIMARY KEY (`id_resto`), ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
 ADD PRIMARY KEY (`id_cart`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id_categories`);

--
-- Indexes for table `item_data`
--
ALTER TABLE `item_data`
 ADD PRIMARY KEY (`id_item`);

--
-- Indexes for table `restaurant_data`
--
ALTER TABLE `restaurant_data`
 ADD PRIMARY KEY (`id_resto`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
 ADD PRIMARY KEY (`id_review`);

--
-- Indexes for table `revoked_token`
--
ALTER TABLE `revoked_token`
 ADD PRIMARY KEY (`id_token`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
 ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id_user`), ADD KEY `password` (`password`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_app`
--
ALTER TABLE `admin_app`
MODIFY `id_admin` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `admin_resto`
--
ALTER TABLE `admin_resto`
MODIFY `id_resto` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
MODIFY `id_cart` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id_categories` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `item_data`
--
ALTER TABLE `item_data`
MODIFY `id_item` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `restaurant_data`
--
ALTER TABLE `restaurant_data`
MODIFY `id_resto` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
MODIFY `id_review` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `revoked_token`
--
ALTER TABLE `revoked_token`
MODIFY `id_token` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
MODIFY `id_role` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
