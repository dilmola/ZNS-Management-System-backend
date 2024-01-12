-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for zns_db
DROP DATABASE IF EXISTS `zns_db`;
CREATE DATABASE IF NOT EXISTS `zns_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `zns_db`;

-- Dumping structure for table zns_db.appointment_client
DROP TABLE IF EXISTS `appointment_client`;
CREATE TABLE IF NOT EXISTS `appointment_client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` int DEFAULT NULL,
  `date_appointment` date DEFAULT NULL,
  `appointment_type` varchar(255) DEFAULT NULL,
  `location_appointment` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `appointment_status_id` int DEFAULT NULL,
  `users_id_contractor` int DEFAULT NULL,
  `add_appointment_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table zns_db.appointment_client: ~11 rows (approximately)
INSERT INTO `appointment_client` (`id`, `users_id`, `date_appointment`, `appointment_type`, `location_appointment`, `address`, `remark`, `appointment_status_id`, `users_id_contractor`, `add_appointment_date`, `created_at`, `updated_at`) VALUES
	(1, 51, '2028-12-06', '1', '1', 'Sub Lot 2, Tingkat 3, Block F, Demak Laut Commercial Centre, Kuching, Malaysia', 'im waiting for it', 1, 2, '2024-01-08', NULL, '2024-01-07 19:29:16'),
	(16, 51, '2024-05-24', '1', '2', 'Jalan Gasing, 46000 Petaling Jaya, Selangor , Petaling Jaya, 46000, 60377857677', 'want to you to inspect my rooftop\n- add piling water\n- add piling water\n- add piling water\n- add piling water', 1, 2, '2024-01-07', '2024-01-07 10:08:48', '2024-01-07 19:31:27'),
	(17, 51, '2024-02-20', '2', '1', 'ewewr', 'ewrwer', 1, 2, '2024-01-07', '2024-01-07 12:05:29', '2024-01-07 19:31:37'),
	(18, 11, '2024-01-30', '1', '2', '44', '3434', 1, 2, '2024-01-09', '2024-01-09 10:59:52', '2024-01-09 11:00:00'),
	(19, 89, '2024-02-28', '1', '2', 'address 1, address2', 'jumpa kat rumah', 1, 16, '2024-01-11', '2024-01-11 07:37:12', '2024-01-11 07:39:37'),
	(20, 89, '2024-01-24', '2', '2', '2222', '2222', 1, 70, '2024-01-12', '2024-01-11 19:28:26', '2024-01-11 19:28:33'),
	(21, 89, '2024-01-29', '1', '1', 's', 's', 1, 70, '2024-01-12', '2024-01-11 19:38:18', '2024-01-11 20:01:04'),
	(22, 89, '2024-01-17', '1', '1', '22', '2', 1, 70, '2024-01-12', '2024-01-11 19:51:36', '2024-01-11 20:34:04'),
	(23, 89, '2024-01-30', '1', '1', 'testtt', 'testtttt', 1, 70, '2024-01-12', '2024-01-11 19:52:26', '2024-01-11 20:39:35'),
	(24, 89, '2024-01-29', '2', '2', 'ee', 'eee', 1, 16, '2024-01-12', '2024-01-11 20:50:00', '2024-01-11 20:53:19'),
	(25, 89, '2024-01-29', '1', '1', '22', '22', 1, 70, '2024-01-12', '2024-01-11 20:54:01', '2024-01-11 21:06:40');

-- Dumping structure for table zns_db.appointment_contractor
DROP TABLE IF EXISTS `appointment_contractor`;
CREATE TABLE IF NOT EXISTS `appointment_contractor` (
  `id` int NOT NULL,
  `users_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table zns_db.appointment_contractor: ~0 rows (approximately)

-- Dumping structure for table zns_db.appointment_payment
DROP TABLE IF EXISTS `appointment_payment`;
CREATE TABLE IF NOT EXISTS `appointment_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `details_appointment_items` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `quantity_appointment_items` int DEFAULT NULL,
  `price_appointment_items` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table zns_db.appointment_payment: ~3 rows (approximately)
INSERT INTO `appointment_payment` (`id`, `user_id`, `details_appointment_items`, `quantity_appointment_items`, `price_appointment_items`, `transaction_id`, `status`, `updated_at`, `created_at`) VALUES
	(5, 1, NULL, NULL, NULL, 'waitingForPayment', 'pending', '2024-01-11 19:05:49', '2024-01-11 19:05:49'),
	(6, 1, 'item1', 2, '12.00', 'waitingForPayment', 'pending', '2024-01-11 19:13:48', '2024-01-11 19:13:48'),
	(7, 1, 'item2', 3, '15.50', 'waitingForPayment', 'pending', '2024-01-11 19:13:48', '2024-01-11 19:13:48');

-- Dumping structure for table zns_db.appointment_status
DROP TABLE IF EXISTS `appointment_status`;
CREATE TABLE IF NOT EXISTS `appointment_status` (
  `id` int DEFAULT NULL,
  `appointment_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table zns_db.appointment_status: ~2 rows (approximately)
INSERT INTO `appointment_status` (`id`, `appointment_status`) VALUES
	(1, 'Accepted'),
	(3, 'Pending');

-- Dumping structure for table zns_db.appointment_type
DROP TABLE IF EXISTS `appointment_type`;
CREATE TABLE IF NOT EXISTS `appointment_type` (
  `id` int DEFAULT NULL,
  `appointment_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table zns_db.appointment_type: ~2 rows (approximately)
INSERT INTO `appointment_type` (`id`, `appointment_type`) VALUES
	(1, 'pick a product'),
	(2, 'inpection');

-- Dumping structure for table zns_db.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table zns_db.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table zns_db.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table zns_db.migrations: ~8 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(2, '2019_08_19_000000_create_failed_jobs_table', 1),
	(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(4, '2023_12_04_170052_create_users22_table', 1),
	(5, '2023_12_05_135951_create_tasks_table', 2),
	(6, '2023_12_05_034609_create_users_table', 3),
	(7, '2023_12_05_144541_create_blogs_table', 4),
	(8, '2023_12_05_173944_create_students_table', 5);

-- Dumping structure for table zns_db.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table zns_db.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table zns_db.payment_number
DROP TABLE IF EXISTS `payment_number`;
CREATE TABLE IF NOT EXISTS `payment_number` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `shop_item_list_id` int DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table zns_db.payment_number: ~17 rows (approximately)
INSERT INTO `payment_number` (`id`, `user_id`, `shop_item_list_id`, `status`, `transaction_id`, `updated_at`, `created_at`) VALUES
	(9, 18, 87, 'success', '659fa9b5b8a72', '2024-01-11 00:41:25', '2024-01-10 23:51:19'),
	(10, 18, 85, 'success', '659fa9b5b8a72', '2024-01-11 00:41:25', '2024-01-10 23:51:32'),
	(11, 18, 82, 'success', '659fa9b5b8a71', '2024-01-11 00:45:42', '2024-01-11 00:45:42'),
	(12, 18, 83, 'success', '659fa9b5b8a71', '2024-01-11 00:45:45', '2024-01-11 00:45:45'),
	(13, 18, 84, 'success', '65a05247e11c9', '2024-01-11 12:40:39', '2024-01-11 00:45:47'),
	(14, 18, 87, 'success', '65a05247e11c9', '2024-01-11 12:40:39', '2024-01-11 00:46:22'),
	(15, 18, 86, 'pending', 'waitingForPayment', '2024-01-11 00:46:23', '2024-01-11 00:46:23'),
	(16, 11, 85, 'pending', 'waitingForPayment', '2024-01-11 00:46:34', '2024-01-11 00:46:34'),
	(17, 11, 86, 'pending', 'waitingForPayment', '2024-01-11 00:46:35', '2024-01-11 00:46:35'),
	(18, 11, 87, 'pending', 'waitingForPayment', '2024-01-11 00:46:37', '2024-01-11 00:46:37'),
	(19, 11, 82, 'pending', 'waitingForPayment', '2024-01-11 04:31:50', '2024-01-11 04:31:50'),
	(20, 11, 83, 'pending', 'waitingForPayment', '2024-01-11 04:31:51', '2024-01-11 04:31:51'),
	(21, 89, 84, 'success', '65a0593d1e26b', '2024-01-11 13:10:21', '2024-01-11 07:45:43'),
	(22, 89, 83, 'success', '65a0593d1e26b', '2024-01-11 13:10:21', '2024-01-11 07:45:46'),
	(23, 66, 82, 'success', '65a0549ba84bd', '2024-01-11 12:50:35', '2024-01-11 12:16:46'),
	(24, 66, 86, 'success', '65a0549ba84bd', '2024-01-11 12:50:35', '2024-01-11 12:16:48'),
	(25, 89, 83, 'success', '65a059698a861', '2024-01-11 13:11:05', '2024-01-11 13:11:02');

-- Dumping structure for table zns_db.permission_tab
DROP TABLE IF EXISTS `permission_tab`;
CREATE TABLE IF NOT EXISTS `permission_tab` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tab_name` varchar(50) DEFAULT NULL,
  `tab_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table zns_db.permission_tab: ~7 rows (approximately)
INSERT INTO `permission_tab` (`id`, `tab_name`, `tab_id`) VALUES
	(1, 'dashboard', 4),
	(2, 'profile', 4),
	(3, 'shop', 2),
	(4, 'appointment', 4),
	(5, 'payment', 4),
	(6, 'manageclient', 1),
	(7, 'managecontractor', 1);

-- Dumping structure for table zns_db.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table zns_db.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table zns_db.profile
DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table zns_db.profile: ~53 rows (approximately)
INSERT INTO `profile` (`id`, `user_id`, `phone`, `address`, `created_at`, `updated_at`) VALUES
	(1, 1, '0135209178', 'NO 27 TINGKAT PERPADUAN 22', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(2, 2, NULL, NULL, '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(3, 3, '601154190809', 'Bandar Seri Manggis, 55331 Jerantut, Pahang', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(4, 4, '601383360916', 'Desa Puchong, 20252 Bukit Besi, Terengganu Darul Iman', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(5, 5, '601298374623', 'USJ 44F, 77355 Masjid Tanah, Melaka', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(6, 6, NULL, NULL, '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(7, 7, '601298073828', 'Ara Setapak, 34657 Pantai Remis, Perak Darul Ridzuan', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(8, 8, '601429359723', 'Lembah Belakong, 75101 Telok Mas, Malacca', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(9, 9, '601757224612', 'Bandar Rahmat, 87002 Rancha-Rancha, Labuan', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(10, 10, '601416506839', 'Ara Kerinchi, 76671 Lubuk China, Malacca', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(11, 11, NULL, NULL, '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(12, 12, '601771695026', 'Pangsapuri Wangi, 08978 Pendang, Kedah', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(13, 13, '601346367498', 'Bandar Angkasa, 84347 Skudai, Johor', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(14, 14, '601932585554', 'Ara Tengah, 87011 Layang-Layang, Labuan', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(15, 15, '601871092725', 'Kampung Baru Pelangi, 93050 Ba\'kelalan, Sarawak', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(16, 16, '601600728185', 'Bandar Baru Puteri, 53846 Tanah Rata, Pahang Darul Makmur', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(17, 17, '601896775626', 'Pangsapuri Country Heights, 27465 Kuala Rompin, Pahang Darul Makmur', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(18, 18, '601819425408', 'Bandar Baru Indah, 18284 Jeli, Kelantan', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(19, 19, '601340369455', 'PJU68P, 45147 Banting, Selangor Darul Ehsan', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(20, 20, '601985650511', 'Seksyen 66U, 06789 Jitra, Kedah', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(21, 21, '601570807317', 'PJS10N, 35104 Gopeng, Perak Darul Ridzuan', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(22, 22, '601531772032', 'PJS5, 07444 Alor Setar, Kedah Darul Aman', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(23, 23, '601345306169', 'Bandar Manggis, 72820 Rantau, Negeri Sembilan', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(24, 24, '601484634342', 'Taman Changkat, 06203 Pendang, Kedah', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(25, 25, '601199428167', 'Bandar Seri Angkasa, 64186 Kuala Selangor, Selangor Darul Ehsan', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(26, 26, '601509546629', 'Pangsapuri Seputeh, 71862 Juasseh, Negeri Sembilan Darul Khusus', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(27, 27, '601381587688', 'Kampung Baru Puteri, 58911 Kepong, KL', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(28, 28, '601923148587', 'Seksyen 71V, 88196 Tenom, Sabah', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(29, 29, '601205950105', 'Desa Petaling, 14000 Air Itam, Penang', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(30, 30, '601613822257', 'Puncak Tasik Puteri, 90182 Donggongon, Sabah', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(32, 66, '0135209178', 'NO 27 TINGKAT PERPADUAN 22', '2024-01-08 06:01:20', '2024-01-08 06:01:20'),
	(33, 67, NULL, NULL, '2024-01-09 19:43:10', '2024-01-09 19:43:10'),
	(34, 68, NULL, NULL, '2024-01-09 19:43:47', '2024-01-09 19:43:47'),
	(35, 69, NULL, NULL, '2024-01-09 19:43:53', '2024-01-09 19:43:53'),
	(36, 70, NULL, NULL, '2024-01-09 19:44:51', '2024-01-09 19:44:51'),
	(37, 71, NULL, NULL, '2024-01-09 19:45:01', '2024-01-09 19:45:01'),
	(38, 72, NULL, NULL, '2024-01-09 19:45:45', '2024-01-09 19:45:45'),
	(39, 73, NULL, NULL, '2024-01-09 19:46:08', '2024-01-09 19:46:08'),
	(40, 74, NULL, NULL, '2024-01-09 19:47:11', '2024-01-09 19:47:11'),
	(41, 75, NULL, NULL, '2024-01-09 19:47:17', '2024-01-09 19:47:17'),
	(42, 76, NULL, NULL, '2024-01-09 19:47:41', '2024-01-09 19:47:41'),
	(43, 77, NULL, NULL, '2024-01-09 19:48:30', '2024-01-09 19:48:30'),
	(44, 78, NULL, NULL, '2024-01-09 19:49:33', '2024-01-09 19:49:33'),
	(45, 79, NULL, NULL, '2024-01-09 19:57:32', '2024-01-09 19:57:32'),
	(46, 80, NULL, NULL, '2024-01-09 20:12:56', '2024-01-09 20:12:56'),
	(47, 81, NULL, NULL, '2024-01-09 20:12:57', '2024-01-09 20:12:57'),
	(48, 82, NULL, NULL, '2024-01-09 20:12:59', '2024-01-09 20:12:59'),
	(49, 83, NULL, NULL, '2024-01-09 20:13:01', '2024-01-09 20:13:01'),
	(50, 84, NULL, NULL, '2024-01-09 20:13:22', '2024-01-09 20:13:22'),
	(51, 85, NULL, NULL, '2024-01-09 20:20:56', '2024-01-09 20:20:56'),
	(52, 86, NULL, NULL, '2024-01-09 20:20:57', '2024-01-09 20:20:57'),
	(53, 87, NULL, NULL, '2024-01-09 20:21:06', '2024-01-09 20:21:06'),
	(54, 88, NULL, NULL, '2024-01-11 06:54:02', '2024-01-11 06:54:02'),
	(55, 89, NULL, NULL, '2024-01-11 07:35:03', '2024-01-11 07:35:03'),
	(56, 90, NULL, NULL, '2024-01-11 07:35:04', '2024-01-11 07:35:04'),
	(57, 91, NULL, NULL, '2024-01-11 07:35:05', '2024-01-11 07:35:05'),
	(58, 92, NULL, NULL, '2024-01-11 08:46:11', '2024-01-11 08:46:11');

-- Dumping structure for table zns_db.shop_item_lists
DROP TABLE IF EXISTS `shop_item_lists`;
CREATE TABLE IF NOT EXISTS `shop_item_lists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_of_item` varchar(50) DEFAULT NULL,
  `description_item` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `quantity_item` int DEFAULT NULL,
  `price_item` varchar(50) DEFAULT NULL,
  `image_item` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table zns_db.shop_item_lists: ~12 rows (approximately)
INSERT INTO `shop_item_lists` (`id`, `name_of_item`, `description_item`, `quantity_item`, `price_item`, `image_item`, `updated_at`, `created_at`) VALUES
	(82, 'pisaucsscsc', 'pisau panjangffff', 6, '12.00', 'shop/items/1704789224.png', '2024-01-09 00:49:27', '2024-01-09 00:33:44'),
	(83, 'efe', 'wwe', 8, '12.00', 'shop/items/1704790536.png', '2024-01-11 13:11:05', '2024-01-09 00:55:36'),
	(84, 'besi', 'besi murah', 9, '24.00', 'shop/items/1704819484.jpg', '2024-01-11 13:10:21', '2024-01-09 08:58:05'),
	(85, 's', 's', 4, '11.00', 'shop/items/1704863337.png', '2024-01-09 21:08:57', '2024-01-09 21:08:57'),
	(86, 'test', 'test', 5, '5.00', 'shop/items/1704876118.png', '2024-01-10 00:41:58', '2024-01-10 00:41:58'),
	(87, 'besti', 'efe', 2, '12.00', 'shop/items/1704946219.jpg', '2024-01-10 20:10:19', '2024-01-10 20:10:19'),
	(88, 'xx', 'xx', 44, '12.00', 'shop/items/1704986565.png', '2024-01-11 07:22:45', '2024-01-11 07:22:45'),
	(89, 'paku', 'paku murah', 11, '22.00', 'shop/items/1704987858.png', '2024-01-11 07:44:18', '2024-01-11 07:44:18'),
	(90, 'tt', 'tt', 22, '22.00', 'shop/items/1705000096.jpg', '2024-01-11 11:08:16', '2024-01-11 11:08:16'),
	(91, 'ter', 'et', 33, '12.00', 'shop/items/1705000240.jpg', '2024-01-11 11:10:40', '2024-01-11 11:10:40'),
	(92, '5', 'yy', 5, '4.00', 'shop/items/1705000297.jpg', '2024-01-11 11:11:37', '2024-01-11 11:11:37'),
	(93, 'r', '44', 4, '111.00', 'shop/items/1705001820.jpg', '2024-01-11 11:37:00', '2024-01-11 11:37:00');

-- Dumping structure for table zns_db.students
DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table zns_db.students: ~1 rows (approximately)
INSERT INTO `students` (`id`, `name`, `email`, `phone`, `created_at`, `updated_at`) VALUES
	(1, 'aidil2', 'aa@yahoo.com2', '1111111112', '2023-12-05 14:21:11', '2023-12-05 22:12:11');

-- Dumping structure for table zns_db.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `users_type_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table zns_db.users: ~53 rows (approximately)
INSERT INTO `users` (`id`, `username`, `email`, `fullname`, `password`, `users_type_id`, `created_at`, `updated_at`, `status`) VALUES
	(1, 'amarmahdzir', 'raina12@pouros.com', 'eee', NULL, 1, '2023-12-05 22:34:16', '2024-01-11 12:09:12', 'active'),
	(2, NULL, NULL, NULL, NULL, 2, '2023-12-05 22:34:16', '2024-01-11 07:01:46', 'inactive'),
	(3, 'deshaun.reichel', 'alakin@yahoo.com', 'Richie Jast', 'b;BKFeiwE\\S=', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16', 'inactive'),
	(4, 'effie.hilpert', 'stroman.katelyn@stanton.com', 'Cristobal McGlynn III', 'xrHu^xP{4*obxoS*za7', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16', 'inactive'),
	(5, 'betsy.hintz', 'hosea83@johnston.com', 'Maverick Swift', '1Sj0`}S)NjTF\'S.tK,/y', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16', 'inactive'),
	(6, NULL, NULL, NULL, NULL, 1, '2023-12-05 22:34:16', '2024-01-11 07:03:00', 'active'),
	(7, 'ileannon', 'ktillman@gmail.com', 'Matilde Haley', 'a6V[]eWU;ohE\\', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16', 'active'),
	(8, 'feil.maribel', 'xlowe@hotmail.com', 'Jaqueline Senger', 'O\'w-\'Z5-%', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16', 'inactive'),
	(9, 'alvera58', 'gloria.schinner@gmail.com', 'Camren Kuhic', '4-}j22Xt@', 3, '2023-12-05 22:34:16', '2023-12-05 22:34:16', 'active'),
	(10, 'cordia18', 'spurdy@cummings.com', 'Tamia Oberbrunner', 'BbN-aW4F"@W!@r0N.z}\\', 2, '2023-12-05 22:34:16', '2024-01-09 12:53:50', 'inactive'),
	(11, NULL, NULL, NULL, NULL, 3, '2023-12-05 22:34:16', '2024-01-11 07:01:04', 'inactive'),
	(12, 'catalina05', 'angie.prohaska@stracke.net', 'Alejandrin Harber', 'IJ+_D}y1/),Y', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16', 'inactive'),
	(13, 'ruby00', 'pacocha.jeanie@corwin.org', 'Viola Harvey', '{)#xgeXv5!:RyMBK[', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16', 'active'),
	(14, 'lindgren.felicia', 'pollich.gilberto@hotmail.com', 'Drake O\'Hara I', 'm|*eLQFlRg<DC+', 3, '2023-12-05 22:34:16', '2023-12-05 22:34:16', 'inactive'),
	(15, 'nhickle', 'hyman15@yahoo.com', 'Stephany Rodriguez', 'oH?R[,lo', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16', 'active'),
	(16, 'summer09', 'lue65@champlin.com', 'Bella Gorczany', '-ey.3[6ZJZ_o0ayk)Wk', 2, '2023-12-05 22:34:16', '2024-01-11 06:53:41', 'active'),
	(17, 'weber.georgette', 'gschmitt@yahoo.com', 'Angeline Jacobs', 'IFuP0Lu;l|*U4^o', 3, '2023-12-05 22:34:16', '2023-12-05 22:34:16', 'active'),
	(18, 'abe86', 'raina12@pouros.com', 'Prof. Jannie Mosciski DDS', 'um!2%)9=NRy-]YR}J=', 3, '2023-12-05 22:34:16', '2023-12-05 22:34:16', 'inactive'),
	(19, 'emelia90', 'america91@yahoo.com', 'Anastasia Blick Sr.', 'm&pr"#A_!H"hT{zylB%K', 2, '2023-12-05 22:34:16', '2024-01-09 12:53:57', 'inactive'),
	(20, 'wolff.raymond', 'haven.fadel@hotmail.com', 'Lexi Jacobi', '%xGQA?O\\VuYJ', 2, '2023-12-05 22:34:16', '2023-12-05 22:34:16', 'inactive'),
	(21, 'napoleon70', 'icassin@hotmail.com', 'Johan Pouros I', 'W6fh"-09n]:aGTc3-TJ', 2, '2023-12-05 22:34:16', '2024-01-09 12:54:00', 'inactive'),
	(22, 'xwelch', 'klein.ayana@king.biz', 'Eloise Spencer', '|ETj\\P^yy9', 2, '2023-12-05 22:34:16', '2024-01-09 12:53:59', 'inactive'),
	(23, 'lynch.esther', 'hans.boyer@zulauf.com', 'Orlando Hettinger', 'PK>8">zco70.', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16', 'active'),
	(24, 'maybell06', 'winona65@gmail.com', 'Felicity Lindgren DVM', 'CgA2IZ*}BY<Fp/b6E', 3, '2023-12-05 22:34:16', '2023-12-05 22:34:16', 'inactive'),
	(25, 'mrenner', 'rolfson.maybelle@hamill.com', 'Gracie Kohler PhD', 'vGz_-351PYcwc\\^;j', 3, '2023-12-05 22:34:16', '2023-12-05 22:34:16', 'inactive'),
	(26, 'fkautzer', 'bkohler@feeney.biz', 'Hope Beatty', '!2NU~BtNqJEA9M', 3, '2023-12-05 22:34:16', '2023-12-05 22:34:16', 'active'),
	(27, 'norbert.kuhlman', 'dkeeling@mckenzie.net', 'Isai Breitenberg', 'bdRqlNgdEDb', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16', 'active'),
	(28, 'westley.swaniawski', 'kiehn.anastasia@kohler.biz', 'Adan Flatley', '8`,OP:6zbN9GC', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16', 'active'),
	(29, 'vziemann', 'srosenbaum@koss.info', 'Prof. Cesar Koss', '[Tu}N,@', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16', 'active'),
	(30, 'powlowski.kiarra', 'myah.predovic@yahoo.com', 'Meagan Bednar PhD', '~K{*r([G+QfVnA!DE0', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16', 'inactive'),
	(66, 'aidil maula', 'm.aidilmaula@gmail.com', 'mohamad aidil maula', 'password', 3, '2024-01-08 06:01:20', '2024-01-08 06:01:36', 'inactive'),
	(67, NULL, 'aidil@yahoo.com', 'test', '1234', 2, '2024-01-09 19:43:10', '2024-01-09 19:43:10', NULL),
	(68, NULL, 'm.aidilmaula@gmail.com', 'test', '1234', 2, '2024-01-09 19:43:47', '2024-01-09 19:43:47', NULL),
	(69, NULL, 'm.aidilmaula@gmail.com', 'test', '1234', 2, '2024-01-09 19:43:53', '2024-01-09 19:43:53', NULL),
	(70, NULL, 'm.aidilmaula@gmail.com', 'test', '1234', 2, '2024-01-09 19:44:51', '2024-01-09 19:44:51', NULL),
	(71, NULL, 'm.aidilmaula@gmail.com', 'tests', '1234', 2, '2024-01-09 19:45:01', '2024-01-09 19:45:01', NULL),
	(72, NULL, 'aidil@yahoooooo.com', 'testttttttttttttt', '1234', 2, '2024-01-09 19:45:45', '2024-01-09 19:45:45', NULL),
	(73, NULL, 'm.aidilmaula@gmail.com', 'tests', '1234', 2, '2024-01-09 19:46:08', '2024-01-09 19:46:08', NULL),
	(74, NULL, 'm.aidilmaula@gmail.com', 'tests', '1234', 2, '2024-01-09 19:47:11', '2024-01-09 19:47:11', NULL),
	(75, NULL, 'm.aidilmaula@gmail.com', 'tests', '1234', 2, '2024-01-09 19:47:17', '2024-01-09 19:47:17', NULL),
	(76, NULL, 'dd@yahoo.com', 'scs', '12334', 2, '2024-01-09 19:47:41', '2024-01-09 19:47:41', NULL),
	(77, NULL, 'dd@yahoo.com', 'scs', '12334', 2, '2024-01-09 19:48:30', '2024-01-09 19:48:30', NULL),
	(78, NULL, 'dd@yahoo.com', 'ss', '1234', 2, '2024-01-09 19:49:33', '2024-01-09 19:49:33', NULL),
	(79, NULL, 'eidielmaula97@gmail.com', 'ss', 'dd', 2, '2024-01-09 19:57:32', '2024-01-09 19:57:32', NULL),
	(80, NULL, 'eidielmaula97@gmail.com', 'ss', 'dd', 2, '2024-01-09 20:12:55', '2024-01-09 20:12:55', NULL),
	(81, NULL, 'eidielmaula97@gmail.com', 'ss', 'dd', 2, '2024-01-09 20:12:57', '2024-01-09 20:12:57', NULL),
	(82, NULL, 'eidielmaula97@gmail.com', 'ss', 'dd', 2, '2024-01-09 20:12:59', '2024-01-09 20:12:59', NULL),
	(83, NULL, 'eidielmaula97@gmail.com', 'ss', 'dd', 2, '2024-01-09 20:13:01', '2024-01-09 20:13:01', NULL),
	(84, NULL, 'f@yahoo.com', 'scs', 'dd', 2, '2024-01-09 20:13:22', '2024-01-09 20:13:22', NULL),
	(85, NULL, 'eidielmaula97@gmail.com', 'test', '1234', 2, '2024-01-09 20:20:56', '2024-01-09 20:20:56', 'active'),
	(86, NULL, 'eidielmaula97@gmail.com', 'test', '1234', 2, '2024-01-09 20:20:57', '2024-01-09 20:20:57', 'active'),
	(87, NULL, 'eidielmaula97@gmail.com', 'pp', '1234', 2, '2024-01-09 20:21:06', '2024-01-09 20:21:15', 'inactive'),
	(88, NULL, 'eidielmaula97@gmail.com', 'u', 'u', 2, '2024-01-11 06:54:02', '2024-01-11 06:54:02', 'active'),
	(89, 'client', 'client@yahoo.com', 'client1', '1234', 3, '2024-01-11 07:35:03', '2024-01-11 07:44:30', NULL),
	(90, 'client', 'client@yahoo.com', 'client1', '1234', 3, '2024-01-11 07:35:04', '2024-01-11 07:35:04', NULL),
	(91, 'client', 'client@yahoo.com', 'client1', '1234', 3, '2024-01-11 07:35:05', '2024-01-11 07:35:05', NULL),
	(92, 'khai', 'khai@gmail.com', 'khairul', '1234', 3, '2024-01-11 08:46:11', '2024-01-11 08:46:11', NULL);

-- Dumping structure for table zns_db.users_type
DROP TABLE IF EXISTS `users_type`;
CREATE TABLE IF NOT EXISTS `users_type` (
  `id` int NOT NULL,
  `users_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table zns_db.users_type: ~3 rows (approximately)
INSERT INTO `users_type` (`id`, `users_type`) VALUES
	(1, 'admin'),
	(2, 'contractor'),
	(3, 'client');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
