-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 28, 2025 at 01:01 PM
-- Server version: 8.0.30
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apitugasakhir`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_produks`
--

CREATE TABLE `kategori_produks` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori_produks`
--

INSERT INTO `kategori_produks` (`id`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(1, 'Lampu', NULL, NULL),
(2, 'Kabel', NULL, NULL),
(3, 'Stop Kontak', NULL, NULL),
(8, 'Power Bank', '2025-07-22 00:55:19', '2025-07-22 00:55:19');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_07_13_223502_create_personal_access_tokens_table', 1),
(5, '2025_07_13_223850_create_kategori_produks_table', 1),
(6, '2025_07_13_223915_create_produks_table', 1),
(7, '2025_07_13_223928_create_pesanans_table', 1),
(8, '2025_07_13_223941_create_pesanan_details_table', 1),
(9, '2025_07_22_041019_create_roles_table', 1),
(10, '2025_07_22_041203_add_role_id_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'mobileapp', '4e0c3c31459dd436847205586eb46e6c276a9f06c2c92cf3fe4034f4877ee4dc', '[\"*\"]', '2025-07-22 00:11:35', NULL, '2025-07-21 21:47:13', '2025-07-22 00:11:35'),
(2, 'App\\Models\\User', 1, 'mobileapp', '751e27e06eb4986b8fcb42a90698be0c7f7129dd9310f2dbfc5627ca541910c2', '[\"*\"]', NULL, NULL, '2025-07-21 21:55:32', '2025-07-21 21:55:32'),
(3, 'App\\Models\\User', 1, 'mobileapp', 'dcb031554ad868cb3302fcd13a8472ca9be5aa23fe02b977a3c92bc1a4041229', '[\"*\"]', '2025-07-21 23:48:52', NULL, '2025-07-21 22:05:57', '2025-07-21 23:48:52'),
(4, 'App\\Models\\User', 10, 'mobileapp', '33fc050f30f969ae9e0fce2cc258d9521b09b7a2dada64f79e702fffcceafd6e', '[\"*\"]', NULL, NULL, '2025-07-22 00:07:36', '2025-07-22 00:07:36'),
(5, 'App\\Models\\User', 10, 'mobileapp', '4c6a9a79acd7338d75650b239af979b564e4085af5363b2065fd4f713d7cb41c', '[\"*\"]', NULL, NULL, '2025-07-22 00:07:54', '2025-07-22 00:07:54'),
(6, 'App\\Models\\User', 1, 'mobileapp', '30f52ebc2797345ec899e9fb1e840572b7fc33d035b38c69a3e4ede5592db5aa', '[\"*\"]', '2025-07-22 00:55:36', NULL, '2025-07-22 00:12:00', '2025-07-22 00:55:36'),
(7, 'App\\Models\\User', 1, 'mobileapp', '9b1d648d2085a6396ecd56a5eae2cb4e15029bd7539971f9ae0298ff8deda87f', '[\"*\"]', NULL, NULL, '2025-07-22 00:56:01', '2025-07-22 00:56:01'),
(8, 'App\\Models\\User', 10, 'mobileapp', 'c23840fca8092de96a163ca8ef4957dcf614863035f8b209d73639e1bf5d13a4', '[\"*\"]', '2025-07-22 02:27:07', NULL, '2025-07-22 00:56:31', '2025-07-22 02:27:07'),
(9, 'App\\Models\\User', 10, 'mobileapp', '16f681874f45814a3def8857c2a09407d8fdcee04519f4ce9d5f2a6681dfa96d', '[\"*\"]', '2025-07-22 04:04:38', NULL, '2025-07-22 03:54:58', '2025-07-22 04:04:38'),
(10, 'App\\Models\\User', 1, 'mobileapp', '7ec3f240c7918dd6d997ec97fa6e792a736fef17f262b4ae14affd6e1b3349d0', '[\"*\"]', NULL, NULL, '2025-07-22 04:05:26', '2025-07-22 04:05:26'),
(11, 'App\\Models\\User', 1, 'mobileapp', '0dad0418b13d9cba10683393d808537a2420824d5a463fda2c97acdfe44c9044', '[\"*\"]', '2025-07-22 04:07:07', NULL, '2025-07-22 04:06:42', '2025-07-22 04:07:07'),
(12, 'App\\Models\\User', 1, 'mobileapp', '7b6a5b36ba386079f693d8e258d21434e9fa47efad44aa16675ad92c57c6de64', '[\"*\"]', '2025-07-23 02:18:44', NULL, '2025-07-23 02:07:06', '2025-07-23 02:18:44'),
(13, 'App\\Models\\User', 11, 'mobileapp', '7400e73fbc3a05f285680811e68fd249799728d4b9f5b2b28348476eb66f8cd0', '[\"*\"]', '2025-07-23 03:39:47', NULL, '2025-07-23 03:31:59', '2025-07-23 03:39:47'),
(14, 'App\\Models\\User', 1, 'mobileapp', '00cb41cdaae8e0121c0378d220fa7544f90c62f92867d3ae51f29cfa89c19a18', '[\"*\"]', '2025-07-23 03:38:02', NULL, '2025-07-23 03:33:59', '2025-07-23 03:38:02'),
(15, 'App\\Models\\User', 11, 'mobileapp', '140fed023ea57452887f1127bcd3bd292fb5e1edb79d32b86ece7b23f7b3d3b0', '[\"*\"]', '2025-07-23 04:03:47', NULL, '2025-07-23 03:58:37', '2025-07-23 04:03:47'),
(16, 'App\\Models\\User', 14, 'mobileapp', 'f929a251b06e31b0aa953a3710ec3bc181359724881633471a252efa6ea717e3', '[\"*\"]', '2025-07-23 04:08:55', NULL, '2025-07-23 04:07:58', '2025-07-23 04:08:55'),
(17, 'App\\Models\\User', 14, 'mobileapp', '6e4735b4c15da6bf86660263a266a1540a8ef1d785c3f18cd5ca2d2c7e5d73d4', '[\"*\"]', '2025-07-23 04:11:03', NULL, '2025-07-23 04:09:19', '2025-07-23 04:11:03'),
(18, 'App\\Models\\User', 11, 'mobileapp', '3d040d4a53c654061b55c0d1b265b26d05f0b02fa15f9c95e097ca1845892cb6', '[\"*\"]', '2025-07-23 04:10:12', NULL, '2025-07-23 04:09:45', '2025-07-23 04:10:12'),
(19, 'App\\Models\\User', 11, 'mobileapp', '25a622c4c1ac965d6fada70a2ebd29745b1ac5fdf650364b1b679fee4f737d55', '[\"*\"]', '2025-07-23 04:16:17', NULL, '2025-07-23 04:11:30', '2025-07-23 04:16:17'),
(20, 'App\\Models\\User', 14, 'mobileapp', 'c733692c12ee2816b122def012e0490e5a67b59369cbfb24639332f13212ab50', '[\"*\"]', '2025-07-23 04:19:10', NULL, '2025-07-23 04:17:09', '2025-07-23 04:19:10'),
(21, 'App\\Models\\User', 11, 'mobileapp', '96dbb6fa439006d6b0cbaab3d3f8dbae036c0c08e8ccb6dc6c5e1fe58df9076b', '[\"*\"]', '2025-07-23 04:23:08', NULL, '2025-07-23 04:19:26', '2025-07-23 04:23:08'),
(22, 'App\\Models\\User', 14, 'mobileapp', '34c0cdd599988864bb6e6955350757bb9310d3ed3ec1df18bd3d15a0c191568f', '[\"*\"]', NULL, NULL, '2025-07-23 04:23:46', '2025-07-23 04:23:46'),
(23, 'App\\Models\\User', 11, 'mobileapp', '3fbf19c20e9a75d9569ef90218752348b81b1a6b14a5cc8d4dfbe9a55aa0a5ad', '[\"*\"]', '2025-07-23 04:24:19', NULL, '2025-07-23 04:24:01', '2025-07-23 04:24:19');

-- --------------------------------------------------------

--
-- Table structure for table `pesanans`
--

CREATE TABLE `pesanans` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `tanggal_pesan` datetime NOT NULL,
  `status` enum('pending','diproses','selesai') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pesanans`
--

INSERT INTO `pesanans` (`id`, `user_id`, `tanggal_pesan`, `status`, `created_at`, `updated_at`) VALUES
(1, 10, '2025-07-22 09:16:56', 'selesai', '2025-07-22 02:16:56', '2025-07-22 02:16:56'),
(2, 10, '2025-07-22 09:20:51', 'pending', '2025-07-22 02:20:51', '2025-07-22 02:20:51'),
(3, 10, '2025-07-22 11:04:36', 'pending', '2025-07-22 04:04:36', '2025-07-22 04:04:36'),
(4, 11, '2025-07-23 10:32:36', 'selesai', '2025-07-23 03:32:36', '2025-07-23 03:32:36'),
(5, 11, '2025-07-23 10:35:13', 'selesai', '2025-07-23 03:35:13', '2025-07-23 03:35:13'),
(6, 11, '2025-07-23 11:10:10', 'pending', '2025-07-23 04:10:10', '2025-07-23 04:10:10'),
(7, 11, '2025-07-23 11:16:13', 'pending', '2025-07-23 04:16:13', '2025-07-23 04:16:13'),
(9, 11, '2025-07-23 11:24:18', 'pending', '2025-07-23 04:24:18', '2025-07-23 04:24:18');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan_details`
--

CREATE TABLE `pesanan_details` (
  `id` bigint UNSIGNED NOT NULL,
  `pesanan_id` bigint UNSIGNED NOT NULL,
  `produk_id` bigint UNSIGNED NOT NULL,
  `jumlah` int NOT NULL,
  `subtotal` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pesanan_details`
--

INSERT INTO `pesanan_details` (`id`, `pesanan_id`, `produk_id`, `jumlah`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 1, 17, 1, 50000, '2025-07-22 02:16:56', '2025-07-22 02:16:56'),
(2, 2, 17, 1, 50000, '2025-07-22 02:20:51', '2025-07-22 02:20:51'),
(3, 3, 17, 1, 50000, '2025-07-22 04:04:36', '2025-07-22 04:04:36'),
(4, 4, 17, 1, 50000, '2025-07-23 03:32:36', '2025-07-23 03:32:36'),
(5, 5, 19, 1, 20000000, '2025-07-23 03:35:13', '2025-07-23 03:35:13'),
(6, 6, 17, 1, 50000, '2025-07-23 04:10:10', '2025-07-23 04:10:10'),
(7, 7, 17, 1, 50000, '2025-07-23 04:16:13', '2025-07-23 04:16:13'),
(9, 9, 17, 1, 50000, '2025-07-23 04:24:18', '2025-07-23 04:24:18');

-- --------------------------------------------------------

--
-- Table structure for table `produks`
--

CREATE TABLE `produks` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_produk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int NOT NULL,
  `stok` int NOT NULL,
  `gambar_produk` text COLLATE utf8mb4_unicode_ci,
  `kategori_produk_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produks`
--

INSERT INTO `produks` (`id`, `nama_produk`, `harga`, `stok`, `gambar_produk`, `kategori_produk_id`, `created_at`, `updated_at`) VALUES
(17, 'Power Bank Robot 5000Mh', 50000, 100, 'gambar_produk/dquDPIjCnnqd2jmUuV8Ojck6odMuEvl3FPdnVaG9.jpg', 8, '2025-07-22 00:54:56', '2025-07-22 00:55:35'),
(19, 'jam', 20000000, 100, 'gambar_produk/KSZGi8CD197Ea7AIO6qZ8JFO3QruTlu7BPMwhe1A.jpg', 3, '2025-07-23 02:18:44', '2025-07-23 02:18:44');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'pelanggan', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'User Dummy', 'user@example.com', NULL, '$2y$12$Y2hoNYueDkWdo1f8VWyp3.dDhtvEhhiOaK295Zc1r5Hp987CVmIbO', NULL, '2025-07-21 21:40:23', '2025-07-21 21:40:23'),
(10, 2, 'latif', 'latif@gmail.com', NULL, '$2y$12$FQiQw4FAaRe.R.TPEJf99.gfe0w9BH3ftb.GqsJJ722uJ/XWlgAJi', NULL, '2025-07-22 00:07:24', '2025-07-22 00:07:24'),
(11, 2, 'sitti', 'sitti@gmail.com', NULL, '$2y$12$tzo4MGpbMrZkNLYLEcu/uu1MM1mnVN19z/TpsZnNX4JfxznD2nRTi', NULL, '2025-07-23 03:31:36', '2025-07-23 03:31:36'),
(14, 1, 'gibran', 'gibran@gmail.com', NULL, '$2y$12$I451IIK03gUs6PXL/LV26Ov4.eJH23QpgV8QceY/YGYXzOQOuiL1G', NULL, '2025-07-23 04:04:37', '2025-07-23 04:07:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_produks`
--
ALTER TABLE `kategori_produks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pesanans`
--
ALTER TABLE `pesanans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pesanans_user_id_foreign` (`user_id`);

--
-- Indexes for table `pesanan_details`
--
ALTER TABLE `pesanan_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pesanan_details_pesanan_id_foreign` (`pesanan_id`),
  ADD KEY `pesanan_details_produk_id_foreign` (`produk_id`);

--
-- Indexes for table `produks`
--
ALTER TABLE `produks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produks_kategori_produk_id_foreign` (`kategori_produk_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori_produks`
--
ALTER TABLE `kategori_produks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `pesanans`
--
ALTER TABLE `pesanans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pesanan_details`
--
ALTER TABLE `pesanan_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `produks`
--
ALTER TABLE `produks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pesanans`
--
ALTER TABLE `pesanans`
  ADD CONSTRAINT `pesanans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `pesanan_details`
--
ALTER TABLE `pesanan_details`
  ADD CONSTRAINT `pesanan_details_pesanan_id_foreign` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pesanan_details_produk_id_foreign` FOREIGN KEY (`produk_id`) REFERENCES `produks` (`id`);

--
-- Constraints for table `produks`
--
ALTER TABLE `produks`
  ADD CONSTRAINT `produks_kategori_produk_id_foreign` FOREIGN KEY (`kategori_produk_id`) REFERENCES `kategori_produks` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
