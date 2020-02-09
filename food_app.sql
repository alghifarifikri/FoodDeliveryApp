-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 09 Feb 2020 pada 04.35
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `admin_app`
--

INSERT INTO `admin_app` (`id_admin`, `id_role`, `username`, `password`, `created_on`, `updated_on`) VALUES
(1, 1, 'admin1', '$2a$10$O2omk1bX9kr/Z.RJYxr4EeXMMTbH5SfLDk73z6OrXTDILeEAuRfZC', '2019-12-29 08:00:07', '2019-12-29 08:00:08'),
(2, 1, 'adminlama', '$2a$10$Ga6yfafpT3zEHYaynVTUNOyRdoPzFiXxpZTs5BMsAOnJ8L8EModUK', '2019-12-29 07:06:50', '2019-12-25 07:04:06'),
(3, 1, 'adminbaru', '$2a$10$nWVRV13tf5dEtu/OYrmAVO5Bk0jgISTFIyl16h6mXcP2m.xURSzPm', '2019-12-30 02:43:44', '2019-12-30 01:24:36'),
(4, 1, 'administrator', '$2a$10$Q/tJ5.rCceX05.gVJ9KLluMeflqr7o4CPPs6oo2H5bIJtY54tHj.O', '2020-02-06 08:09:56', '2020-02-06 08:09:56');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data untuk tabel `admin_resto`
--

INSERT INTO `admin_resto` (`id_resto`, `id_role`, `username`, `password`, `created_on`, `updated_on`) VALUES
(1, 2, 'ayampenyetsurabaya', '$2a$10$IFYFG80wvp.mvxTHzf2CX.nZiHJHUHY00mhRfcHd8fGfW8GHgi0Xq', '2019-12-25 01:42:22', '2019-12-24 07:46:04'),
(2, 2, 'hausenak', '$2a$10$Yc3lq4viUoWGPu4woraT2u52ZmsWgGBFMp8CszmlD8ozu8eAnsAFW', '2019-12-29 09:24:33', '2019-12-29 09:24:33'),
(3, 2, 'geprekbensu', '$2a$10$QAazPHOA4d/0OXYz79V4CuMSfg/EXLtwHvX5DkNHaWFqITUXdGK3O', '2019-12-29 07:29:27', '2019-12-29 07:29:27'),
(4, 2, 'tongtji', '$2a$10$GHRr9OVpMzaVa6smgVwe0u9jyzEXZ2pcl.ffAoUn1H4KXgcgQLnua', '2019-12-29 07:29:47', '2019-12-29 07:29:47'),
(5, 2, 'spesialsambal', '$2a$10$ZRWZFtSQvlfZcAOcN3zMkOQPVeD.ugNittboR4q6zy3q8cArWJ0rq', '2019-12-29 07:29:58', '2019-12-29 07:29:58'),
(6, 2, 'spesialsambal2', '$2a$10$mqd9etP2pCHjdxss/Fe9yeA52oUw/Tv2Xfwu.KIXA6TPEmUSlPukG', '2020-02-06 08:10:18', '2020-02-06 08:10:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
`id_cart` int(10) NOT NULL,
  `id_user` int(20) NOT NULL,
  `id_item` int(10) NOT NULL,
  `quantity` int(20) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id_cart`, `id_user`, `id_item`, `quantity`, `created_on`, `updated_on`) VALUES
(3, 1, 13, 5, '2020-01-07 13:51:57', '2020-01-07 12:53:48'),
(33, 5, 1, 4, '2020-01-13 03:04:23', '2020-01-13 03:04:10');

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
  `image` varchar(150) NOT NULL,
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
(3, '1', 1, 'Ayam Bakar', 15000, 'Ayam bakar, nasi, lalap', 'ayambakar.jpg', 5, '2020-02-05 07:01:54', '2019-12-30 07:51:51'),
(4, '1', 1, 'Sop Ayam', 12000, 'Sop ayam, nasi', 'sopayam.jpeg', 4, '2020-02-05 11:17:41', '2019-12-28 03:58:58'),
(5, '2', 1, 'Es Jeruk', 5000, 'Air + Perassan Jeruk + Gula + Es', 'esjeruk.jpg', 5, '2020-01-04 03:05:18', '2020-01-04 03:05:18'),
(6, '3', 2, 'Thai Tea Original', 5000, 'Thai Tea original tanpa topping', 'thaitea.png', 0, '2020-01-08 09:51:00', '2020-01-04 03:18:06'),
(7, '3', 2, 'Oreo Cheese', 15000, 'Thai Tea, Cheese, Oreo', 'blackoreocheese.png', 5, '2020-02-05 11:08:57', '2020-01-04 03:19:23'),
(8, '3', 2, 'Ovaltine Cheese', 15000, 'Thai Tea, Cheese, Ovaltine', 'ovaltinecheese.png', 0, '2020-01-08 12:42:54', '2020-01-04 03:21:23'),
(9, '3', 2, 'Mango Yakult', 16000, 'Mango + Yakult', 'mangoyakult.png', 0, '2019-12-29 08:49:49', '2019-12-29 08:49:49'),
(10, '3', 2, 'Lychee Yakult', 16000, 'Lychee + Yakult', 'lycheeyakult.jpg', 0, '2020-01-04 03:22:22', '2020-01-04 03:22:22'),
(11, '1', 3, 'Ayam Geprek', 19000, 'Ayam Geprek, nasi, sambal', 'ayamgeprel.jpg', 4, '2019-12-30 04:08:05', '2019-12-29 08:54:44'),
(12, '1', 3, 'Ayam Geprek Keju', 25000, 'Ayam Geprek, nasi, sambal, Keju', 'ayamgeprekkeju.jpg', 4, '2020-02-05 11:15:51', '2020-01-04 03:31:31'),
(13, '2', 3, 'Air Mineral Prima', 6000, 'Air mineral', 'prima.jpg', 5, '2020-01-13 02:01:01', '2019-12-29 08:56:52'),
(14, '4', 3, 'Kulit Goreng Crispy', 13000, 'Kulit digoreng kering', 'kulitgoreng.jpg', 5, '2020-02-05 11:20:15', '2019-12-29 08:58:38'),
(15, '2', 3, 'Teh Botol Sosro', 10000, 'Teh botol sosro 350 ML', 'tehbotol.jpg', 0, '2019-12-29 08:59:57', '2019-12-29 08:59:57'),
(16, '2', 4, 'Jusmine Tea Jumbo', 10000, 'Teh Melati Oiginal', 'jusminetea.jpg', 5, '2020-02-05 11:20:21', '2019-12-29 09:01:52'),
(17, '2', 4, 'Frussion Peach', 12000, 'Teh Rasa Peach', 'frussion peach.jpg', 0, '2020-01-04 03:37:03', '2020-01-04 03:37:04'),
(18, '2', 4, 'Frussion Strawberry', 12000, 'Teh Rasa Strawberry', 'frussion strawberry.jpg', 0, '2020-01-04 03:36:21', '2020-01-04 03:36:21'),
(19, '4', 4, 'Tahu Kemul', 16000, 'Tahu Goreng dan sambal kecap', 'tahukemul.jpg', 0, '2019-12-29 09:09:14', '2019-12-29 09:09:14'),
(20, '4', 4, 'Kentang Goreng', 15000, 'Kentang Goreng Bumbu Asin', 'kentang goreng.jpg', 0, '2020-01-11 07:32:47', '2020-01-04 03:38:16'),
(21, '1', 5, 'Ayam Bakar', 17000, 'ayam bakar, nasi, lalap, sambal', 'ayambakarss.jpg', 4, '2020-01-13 02:23:38', '2019-12-29 09:11:34'),
(22, '5', 5, 'Terong Balado', 13000, 'Sayur Terong Sambal Balado', 'terongbalado.jpg', 0, '2020-01-04 03:39:00', '2020-01-04 03:39:01'),
(23, '2', 5, 'Es Teh Manis', 5000, 'Es, teh, air, gula', 'esteh.jpg', 5, '2020-02-06 10:06:35', '2019-12-29 09:14:44'),
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
(1, 'Ayam Penyet Surabaya', 'ayampenyetsurabayalogo.jpg', '-6.60115', '106.8048853', 'Ayam Penyet Surabaya adalah pelopor restoran ayam penyet di Indonesia.', '2019-12-30 02:36:18', '2019-12-30 02:36:18'),
(2, 'HAUS!', 'haus.jpg', '-6.379478', '106.8113443', 'HAUS! adalah merk dagang minuman spesialis Thai Tea', '2019-12-30 02:41:38', '2019-12-30 02:41:39'),
(3, 'Geprek Bensu', 'geprekbensu.jpg', '-6.39627', '106.8192523', 'Geprek Bensu adalah merk dagang ayam geprek milik Ruben Onsu', '2019-12-30 02:39:25', '2019-12-30 02:39:26'),
(4, 'Tong Tji', 'tongtji.jpg', '-6.484255', '106.8402953', 'Tong Tji merupakan nama Brand sedangkan nama perusahaannya adalah Perusahaan Teh Dua Burung Wangi.', '2019-12-30 02:42:34', '2019-12-29 07:39:56'),
(5, 'Waroeng Spesial Sambal', 'ss.jpg', '6.560671', '106.7638733', 'Waroeng Spesial Sambal “SS” adalah sebuah merk yang menyajikan aneka sambal segar dan masakan khas I', '2019-12-30 02:43:21', '2019-12-29 07:41:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `review`
--

CREATE TABLE IF NOT EXISTS `review` (
`id_review` int(10) NOT NULL,
  `rating` int(10) NOT NULL,
  `review` varchar(100) NOT NULL,
  `id_item` int(10) NOT NULL,
  `id_user` int(10) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data untuk tabel `review`
--

INSERT INTO `review` (`id_review`, `rating`, `review`, `id_item`, `id_user`, `created_on`, `updated_on`) VALUES
(1, 5, 'ayamnya pedas mantap', 1, 1, '2020-01-10 10:35:52', '0000-00-00 00:00:00'),
(2, 4, 'ayamnya kepedesan', 1, 2, '2020-01-10 10:35:56', '0000-00-00 00:00:00'),
(14, 3, 'kurang enak', 1, 3, '2020-01-10 10:36:04', '2019-12-27 13:24:28'),
(16, 5, 'segar', 2, 1, '2020-01-10 10:36:12', '2019-12-28 01:10:23'),
(17, 5, 'jeruknya kerasa', 5, 1, '2020-01-10 10:36:18', '2019-12-29 09:30:53'),
(18, 4, 'Ayam Gepreknya Pedas', 11, 3, '2020-01-10 10:36:24', '2019-12-30 04:08:05'),
(36, 4, 'mantap', 11, 3, '2020-01-12 13:13:57', '2020-01-12 13:13:57'),
(37, 5, 'segar', 13, 4, '2020-01-13 02:01:01', '2020-01-13 02:01:01'),
(38, 4, 'mantap', 21, 4, '2020-01-13 02:23:38', '2020-01-13 02:23:38'),
(39, 4, 'enak', 1, 5, '2020-01-13 03:05:16', '2020-01-13 03:05:16'),
(40, 5, 'gurih mantap', 11, 3, '2020-02-05 06:15:18', '2020-02-05 06:15:18'),
(41, 5, 'ada manis manisnya gitu', 13, 3, '2020-02-05 06:15:34', '2020-02-05 06:15:34'),
(44, 5, 'murah', 3, 3, '2020-02-05 07:01:54', '2020-02-05 07:01:54'),
(45, 5, 'porsinya lumayan', 7, 3, '2020-02-05 11:08:57', '2020-02-05 11:08:57'),
(46, 4, 'oke', 12, 3, '2020-02-05 11:15:51', '2020-02-05 11:15:51'),
(47, 4, 'mantap', 4, 3, '2020-02-05 11:17:41', '2020-02-05 11:17:41'),
(48, 5, 'gurih', 14, 3, '2020-02-05 11:20:15', '2020-02-05 11:20:15'),
(49, 5, 'segar', 16, 3, '2020-02-05 11:20:22', '2020-02-05 11:20:22'),
(50, 5, 'segar', 23, 3, '2020-02-06 10:06:35', '2020-02-06 10:06:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `revoked_token`
--

CREATE TABLE IF NOT EXISTS `revoked_token` (
`id_token` int(10) NOT NULL,
  `token` varchar(500) NOT NULL,
  `is_revoked` int(20) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=134 ;

--
-- Dumping data untuk tabel `revoked_token`
--

INSERT INTO `revoked_token` (`id_token`, `token`, `is_revoked`, `created_on`, `updated_on`) VALUES
(57, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc4MjUxMDU5fQ.S_orlQylPHlXYE5zPHLxy04Z1uibMovEr2', 0, '2020-01-05 19:04:19', '2020-01-05 19:04:19'),
(58, 'eyJhbGciOiJIUzI1NiJ9.YWxnaGlmYXJp.2WtqbGqM1sexXQjuCkXnXbYeslybpWjPr3Leooccn7Y', 1, '2020-01-05 19:22:45', '2020-01-05 19:22:04'),
(59, 'eyJhbGciOiJIUzI1NiJ9.YWxnaGlmYXJp.2WtqbGqM1sexXQjuCkXnXbYeslybpWjPr3Leooccn7Y', 1, '2020-01-05 19:22:45', '2020-01-05 19:22:26'),
(60, 'eyJhbGciOiJIUzI1NiJ9.YWxnaGlmYXJp.2WtqbGqM1sexXQjuCkXnXbYeslybpWjPr3Leooccn7Y', 0, '2020-01-05 19:23:20', '2020-01-05 19:23:20'),
(61, 'eyJhbGciOiJIUzI1NiJ9.YWxnaGlmYXJp.2WtqbGqM1sexXQjuCkXnXbYeslybpWjPr3Leooccn7Y', 0, '2020-01-05 19:23:51', '2020-01-05 19:23:51'),
(62, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlhdCI6MTU3ODI1MjM2MX0.siET42RjtGozsWfWDW2WW_n6g-A6pGQNj0rJfC2mCdw', 1, '2020-01-05 19:26:18', '2020-01-05 19:26:01'),
(63, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc4MjUyNDQ5fQ.n4_JZk3yqxfAJ4rG4PRHVuTMzIzevnRWZbqTWb78eJ8', 1, '2020-01-05 19:27:50', '2020-01-05 19:27:30'),
(64, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc4MjUyNTE3fQ.MkVMyEQBCoxRgXwwY4XEuo9nQJndBppWrQrK5pfcrtg', 1, '2020-01-05 19:38:45', '2020-01-05 19:28:38'),
(65, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc4MjUyOTE1fQ.0bI3gyGc68AE2coZeWAB7nBppe27_HICN6YMTuscP5Q', 0, '2020-01-05 19:35:16', '2020-01-05 19:35:16'),
(66, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc4MjUzMDQ2fQ.94DwChx55lW5OfoYXtKxhc_zVdgKvuHlMhzwlkln1p0', 1, '2020-01-05 19:37:54', '2020-01-05 19:37:27'),
(67, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc4MjYxNzk4fQ.HidaPFcLWmP1IVVFAI8E9bcDZCpGmdlkENvxpGaC3QY', 1, '2020-01-05 22:03:47', '2020-01-05 22:03:19'),
(68, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc4MjY2ODUyfQ.Jpp21NkoAJlxVh7nySdXSqlMEuiTx-fbVm7p88oVwXE', 1, '2020-01-06 02:18:46', '2020-01-05 23:27:33'),
(69, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc4MjgwNDA5fQ.LvC-945eSmATI8tgtm3LFSqczcaa8sX6zGg_ts9ky4g', 1, '2020-01-06 03:15:17', '2020-01-06 03:13:30'),
(70, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc4Mzk5OTM5fQ.vgFVf4ncmbf4FxyrECqwJ6V5iEnuNyPmn1n0m4u2VLE', 1, '2020-01-07 13:41:44', '2020-01-07 12:25:39'),
(71, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc4NDA0NTE2fQ.fncI-xT4-bp3wzFo2U9SNNWPjZCsbd4Skd2OrSQBRmM', 1, '2020-01-07 13:57:18', '2020-01-07 13:41:56'),
(72, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc4NDA1NTAxfQ.Z56y2ogmWhUCBgKdTxrfuZuZP6pu9outFn7t-pghKos', 1, '2020-01-07 15:49:57', '2020-01-07 13:58:21'),
(73, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc4NDcwMzE4fQ.XGW7qPCFU3lM5oLqUdrYdk5CWYSyg8JxTVcz985Yqeo', 1, '2020-01-08 13:28:10', '2020-01-08 07:58:39'),
(74, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc4NTM5ODIzfQ.IMTZS9bT8M0VwlNXpGrT0Z60kqQJjAIJeypPYele2u8', 1, '2020-01-09 09:36:36', '2020-01-09 03:17:03'),
(75, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc4NTU4MDEzfQ.wTQ-uYOxZOp98Q8eXwhyWJd-IIq7sNhYEe3mW8q9vDc', 0, '2020-01-09 08:20:14', '2020-01-09 08:20:14'),
(76, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc4NTYyNjMxfQ.wf3eJboy_mQ-DG9LqdGF3ST9X6R6F9tAHBDYpKqBIqQ', 1, '2020-01-09 15:13:06', '2020-01-09 09:37:12'),
(77, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc4NTg3MTIzfQ._NvwMQ8mwuDjD6-T1wx1NcmLr2MGZQx6CQibUVoiPXQ', 0, '2020-01-09 16:25:23', '2020-01-09 16:25:23'),
(78, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc4NjM3MjA4fQ.TT339gPRTL1guwQb-RNoQfAnA5nGNGcZXwxB3jmETmM', 0, '2020-01-10 06:20:09', '2020-01-10 06:20:09'),
(79, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc4NzEyOTIxfQ.Zf3GgguOtZOgz4QX1ctskywTm4b7KY-bX2nuxS8mWs4', 1, '2020-01-12 06:51:20', '2020-01-11 03:22:02'),
(80, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc4ODExOTA2fQ.PcjPfEcWhVcOLp5PpbNWkYbB_nrPNnB_vrOx3CnTt-w', 1, '2020-01-12 09:55:45', '2020-01-12 06:51:47'),
(81, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc4ODIyOTgyfQ.z_CL2Fh6mYql78e8wrVMuUf7WUkZGs99u-eWpSyuFXc', 1, '2020-01-12 13:54:41', '2020-01-12 09:56:22'),
(82, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc4ODM3MzkyfQ.LHj-2y4L-pKoUo54pv3bHaz7IMRwkPGRcwcjjq0in5A', 0, '2020-01-12 13:56:33', '2020-01-12 13:56:33'),
(83, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImNvYmEiLCJpZCI6NCwicm9sZXMiOjMsImlhdCI6MTU3ODg4MDg0M30.qeMuE588u8dAnNFWubImll7llB1zGqCNB0BE9Zo5HcM', 1, '2020-01-13 02:25:14', '2020-01-13 02:00:44'),
(84, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZmFyaXMiLCJpZCI6NSwicm9sZXMiOjMsImlhdCI6MTU3ODg4NDYwMn0.PshPXaSlK3EPzfbLCRv47uz1p-To_pUpDBDHu5fYf7s', 1, '2020-01-13 03:15:11', '2020-01-13 03:03:23'),
(85, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDYwNzI4fQ.3_9B4vRuioqMaJEW4Dyya8GSvhRjPZ4_IabI5tjJ1HQ', 0, '2020-01-19 19:05:29', '2020-01-19 19:05:29'),
(86, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDYxNzQ5fQ.4zXqYdfe0hQnZboXfLbOpYsdU6j78Cu4ZckH7zWtWx4', 0, '2020-01-19 19:22:29', '2020-01-19 19:22:29'),
(87, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDYyMDE4fQ.yaPMNaGAIfouVOayvbjjh3vHlOHsoBJwi2q_feri4dM', 0, '2020-01-19 19:26:58', '2020-01-19 19:26:58'),
(88, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDYzMDExfQ.S7TxaPMaoutThNDOS_SQkTJ6kDNbMUZ4qyiFw_wdzuE', 0, '2020-01-19 19:43:31', '2020-01-19 19:43:31'),
(89, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDYzMjg5fQ.JAfx4uQbmNUF7ILJn1Nel4FenFgnInsXNDZl1ok3VI8', 0, '2020-01-19 19:48:09', '2020-01-19 19:48:09'),
(90, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDYzNDIwfQ.T6mvsEXrFACLzrYdeiR2jP7YT4Gz7HM9lMRYtaHzRik', 0, '2020-01-19 19:50:20', '2020-01-19 19:50:20'),
(91, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDYzODc5fQ.cGd51HXIsJJVJ9b4ry4Pyq9-95CA1PF5ZF0Dm7VQLx0', 0, '2020-01-19 19:57:59', '2020-01-19 19:57:59'),
(92, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDY2Mzg1fQ.WGQ8psFFrJ_0gEc-Dw6-Ze9pDSYWieAnt7rIHPs0pjM', 0, '2020-01-19 20:39:45', '2020-01-19 20:39:45'),
(93, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDY2OTI3fQ.2QKHnfz5wReEaik7_d2m4kudLYo4rLafE4pr7jD3oZI', 0, '2020-01-19 20:48:48', '2020-01-19 20:48:48'),
(94, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDY2OTkxfQ.Fgm05Y1JpN4GyxTWDnKE14YdKpEV2OZ_KbECCL31o2A', 0, '2020-01-19 20:49:52', '2020-01-19 20:49:52'),
(95, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDY3MzkwfQ.lkE5l24LbyiNhaLRUZBueDf1V-OllKh2Yo-iYbXPcic', 0, '2020-01-19 20:56:30', '2020-01-19 20:56:30'),
(96, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDY4MjI5fQ.yk3u4PcP8NMJ0tCaURl5BR5nHEq6oL9YUMlvBEVoM8A', 0, '2020-01-19 21:10:30', '2020-01-19 21:10:30'),
(97, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDY4NzI1fQ.cz8fhvLuatbVNeLzNBNT712IwFGbUVurKQ6Z9qvALWQ', 0, '2020-01-19 21:18:45', '2020-01-19 21:18:45'),
(98, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDY4OTU5fQ.Yh_qjbp-BbdQZlkpa2PjXVxvtSZ7AS7Vg7guNyz6x30', 0, '2020-01-19 21:22:39', '2020-01-19 21:22:39'),
(99, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDY5MDA5fQ.omVi0_JqIR7mQ8ccTS-WaUhTBXs-qCvc3v4OQImu6Wk', 0, '2020-01-19 21:23:29', '2020-01-19 21:23:29'),
(100, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDY5NjEwfQ.zsrEg-gHSDsAyZct5LdCEx2lavi20OWgLrBThsVIagA', 0, '2020-01-19 21:33:30', '2020-01-19 21:33:30'),
(101, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDY5Njg5fQ.lIKEncVjYvNS0_vot4addMKtc-xtxnG3QY0tQq0OSIk', 0, '2020-01-19 21:34:50', '2020-01-19 21:34:50'),
(102, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDY5NzU4fQ.f24Hm6ExeA4A4FhCHjaqjAST8-sT9gKXQjN8GTGAW-E', 0, '2020-01-19 21:35:59', '2020-01-19 21:35:59'),
(103, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDY5Nzg2fQ.RO4YC-5x32-uzju5Fxilk1iIOtVd42Ak4lpNyzTasL8', 0, '2020-01-19 21:36:27', '2020-01-19 21:36:27'),
(104, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDcwNDMzfQ.F1vqYVDPt-WmDGEpGWlTKVsHg0Q_0EXpg63QCZCprEE', 0, '2020-01-19 21:47:13', '2020-01-19 21:47:13'),
(105, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDcwNjM0fQ.a81bl3Etw95NKbhtUY_4HH47a16hUnYeoBtEz-_KWo4', 0, '2020-01-19 21:50:34', '2020-01-19 21:50:34'),
(106, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDcxNDM5fQ.gcYZ9b0GJTQZn8nX1bGt2Hdce7bAwqjz-NFNFue_32Y', 0, '2020-01-19 22:03:59', '2020-01-19 22:03:59'),
(107, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDcxNTM1fQ.-OaBpafrGI3RSKxjC9W_zUpW6fFwYZqy1aBxysTYsNc', 0, '2020-01-19 22:05:35', '2020-01-19 22:05:35'),
(108, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDg3OTIwfQ.Gts6qn8PPWfGJeJ2X3-KvxLT32zDpxK9HHbGFlseWrY', 0, '2020-01-20 02:38:40', '2020-01-20 02:38:40'),
(109, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDg4NjA1fQ.xsr5Y6hAHi5lCOCP2UWAtSJ5Wzkb9vLHtl__fSQoKQ8', 0, '2020-01-20 02:50:06', '2020-01-20 02:50:06'),
(110, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDg4NzAwfQ.on8ChhHDLxQD29-C0jXGqNP3sY61doFqEJeeYmCJYV0', 0, '2020-01-20 02:51:40', '2020-01-20 02:51:40'),
(111, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDg4NzQ1fQ.gAyiHHfe0mZb3D8YvhAc4MTYYKhLyWB7cprLpWEWPJI', 0, '2020-01-20 02:52:25', '2020-01-20 02:52:25'),
(112, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDg5ODc3fQ.vCKPXF-5vRUk6d2VZPGix3CQx6l1xPGbx6CA3ieipYg', 0, '2020-01-20 03:11:17', '2020-01-20 03:11:17'),
(113, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTc5NDkwMjIzfQ.PHEFXV6A_ASfVKlmgILnH7hGy15Deb636bYM_o3fk8w', 0, '2020-01-20 03:17:03', '2020-01-20 03:17:03'),
(114, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTgwODc4NDY2fQ.GuP-CPshxK321QifnJt6tIjDe9n9MHO_HAB2A7ddEFI', 1, '2020-02-05 05:15:54', '2020-02-05 04:54:26'),
(115, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTgwODc4ODI5fQ.KsEXO6mxyvURwlxbI_VQvpe8gZ1dXIHbzrjL5-PTrCA', 0, '2020-02-05 05:00:29', '2020-02-05 05:00:29'),
(116, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTgwODc5NzgxfQ.Su19yHCQo4PpMa1p7vMxE_OGfuOPdGGVckUnfaHSRLY', 1, '2020-02-05 06:03:28', '2020-02-05 05:16:21'),
(117, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTgwODgzMjg5fQ.P1SkoKFRA2ZQlt8Ne_DJNK5lL6NbkQp3iN0yAWG4rWI', 1, '2020-02-05 16:05:51', '2020-02-05 06:14:50'),
(118, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTgwOTcyOTUwfQ.olRj5OBPDzc1b2_U1Etd6P1VvN7NFBwK9FY5CE-LcB4', 1, '2020-02-06 07:19:43', '2020-02-06 07:09:11'),
(119, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTgwOTc2Mzk2fQ.tBpePCjQrW3Fb1HD7r_Hq6eKNkeesD9lzy3rvsaq3zY', 1, '2020-02-06 08:08:50', '2020-02-06 08:06:37'),
(120, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImF5YW1wZW55ZXRzdXJhYmF5YSIsImlhdCI6MTU4MDk3NjQyOX0.44iNrijOsymbE7QaEabcOlz7gTX1ekMISLMNj3zYJlU', 0, '2020-02-06 08:07:09', '2020-02-06 08:07:09'),
(121, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluMSIsImlhdCI6MTU4MDk3NjQ0Nn0.IlUH6uXklzwva808-ToxzqxPbkhUKoYeDh49i0tmBIs', 0, '2020-02-06 08:07:26', '2020-02-06 08:07:26'),
(122, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InNwZXNpYWxzYW1iYWwiLCJpYXQiOjE1ODA5NzY2ODR9.FT6n_I5eiHmriXnpcqbBEieOQAD3vnxPGhswiANczCw', 0, '2020-02-06 08:11:24', '2020-02-06 08:11:24'),
(123, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluMSIsImlhdCI6MTU4MDk3NzE4Mn0.vHbnjBx401mk6-9FNu3grNyLtpqMFFxbX5y7KLlMfdA', 0, '2020-02-06 08:19:42', '2020-02-06 08:19:42'),
(124, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTgwOTgyOTA4fQ.RWYYhkIgqAyV_SXin_zpEgWcmIgjamtHgrs1s4a4qRs', 1, '2020-02-06 10:02:00', '2020-02-06 09:55:08'),
(125, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTgwOTgzMzgzfQ.XwGj-sz78nT7FqUyUbtmv4vFCDyAxbtDWrteRvR3Q3A', 1, '2020-02-06 10:03:32', '2020-02-06 10:03:04'),
(126, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTgwOTgzNTYyfQ.B_tdV50lXh3HBrjo_2U3yQbng_Z3TR9nM5B2lU13b4Y', 1, '2020-02-06 14:57:08', '2020-02-06 10:06:03'),
(127, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTgwOTgzNjQyfQ.sRr2IHf574Ma0aHLQWwcqPcWLPg-fVwg7Q2O_-fJNLQ', 1, '2020-02-06 10:07:35', '2020-02-06 10:07:22'),
(128, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTgwOTgzODg2fQ.DgbtbdLANwkOfE5ibCx8mvaT83sBiC_AOgHhY1UZMtM', 1, '2020-02-06 10:11:37', '2020-02-06 10:11:27'),
(129, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTgxMTQ4NDUwfQ.H3xcYqp3oC7JvOZLSkDX74dg71WsnSEf6NsSniuOL_c', 1, '2020-02-08 11:18:29', '2020-02-08 07:54:11'),
(130, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTgxMTUwMTA2fQ.AZdaXjcQ1-Me1F86RCjUFMGadA-gYBszu9l3tAHKdVk', 0, '2020-02-08 08:21:46', '2020-02-08 08:21:46'),
(131, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImZpa3JpIiwiaWQiOjIsInJvbGVzIjozLCJpYXQiOjE1ODExNjA3MjR9.prdZ9wwnMoZg5l0CtWPxXhcNycy8caFWbr-sbbMWu6g', 1, '2020-02-08 11:20:23', '2020-02-08 11:18:44'),
(132, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImZpa3JpIiwiaWQiOjIsInJvbGVzIjozLCJpYXQiOjE1ODExNjA4OTZ9.DHO5j0kEYEMhOgHhwKf98jT5R1dF25UBO02G5ziUO4c', 1, '2020-02-08 11:21:50', '2020-02-08 11:21:37'),
(133, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFsZ2hpZmFyaSIsImlkIjozLCJyb2xlcyI6MywiaWF0IjoxNTgxMTgzMjIwfQ.ZHPLwKTz2OQ-1fDkAse5_tbothf33Nn6DL1JKx6CeC4', 1, '2020-02-09 02:48:53', '2020-02-08 17:33:40');

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
  `image` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `id_role`, `image`, `username`, `password`, `created_on`, `updated_on`) VALUES
(1, 3, '', 'alghifarifikri', '$2a$10$wWdirUzwkhRiKjKB.msQZuF8MVbQ665X584.rTDCwK2xRI83bvV4y', '2019-12-30 08:16:08', '2019-12-30 08:16:09'),
(2, 3, '1579624696353.jpg', 'fikri', '$2a$10$wPNHzCxFO6Be2m/YJ9p4/ergFPbdiBi9qExybW588TmDIHsva4jgq', '2020-02-08 11:20:14', '2019-12-30 01:25:31'),
(3, 3, 'smile-icon-256.png', 'alghifari', '$2a$10$doYqhOfmJl7s.rI3M5fRze5bBMjMp5OYH8hVypu6ChIyPVZvIPhrG', '2020-02-08 11:09:15', '2019-12-30 03:59:49');

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
MODIFY `id_admin` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `admin_resto`
--
ALTER TABLE `admin_resto`
MODIFY `id_resto` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
MODIFY `id_cart` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
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
MODIFY `id_review` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `revoked_token`
--
ALTER TABLE `revoked_token`
MODIFY `id_token` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=134;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
MODIFY `id_role` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
