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
CREATE DATABASE IF NOT EXISTS `zns_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `zns_db`;

-- Dumping structure for table zns_db.appointment_client
CREATE TABLE IF NOT EXISTS `appointment_client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` int DEFAULT NULL,
  `date_apointment` date DEFAULT NULL,
  `appointment_type` varchar(255) DEFAULT NULL,
  `location_appointment` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `appointment_status_id` int DEFAULT NULL,
  `users_id_contractor` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table zns_db.appointment_client: ~2 rows (approximately)
INSERT INTO `appointment_client` (`id`, `users_id`, `date_apointment`, `appointment_type`, `location_appointment`, `address`, `remark`, `appointment_status_id`, `users_id_contractor`, `created_at`, `updated_at`) VALUES
	(1, 1, '2028-12-06', '1', '1', 'Sub Lot 2, Tingkat 3, Block F, Demak Laut Commercial Centre, Kuching, Malaysia', 'im waiting for it', 3, 2, '2023-12-06 08:14:52', '2023-12-06 08:14:56'),
	(2, 2, '2023-11-28', '1', '2', 'Tepi pintu', 'need urgent', 1, 3, '2023-12-07 02:51:44', '2023-12-07 02:51:48'),
	(3, NULL, '2023-11-28', 'nak bincang pasal rumah', '1', 'tepi pantai', 'tepi pantai', NULL, NULL, '2023-12-06 20:18:05', '2023-12-06 20:18:05'),
	(4, NULL, NULL, NULL, NULL, 'dwdw', 'wdwd', NULL, NULL, '2023-12-06 20:41:13', '2023-12-06 20:41:13'),
	(5, NULL, NULL, 'fef', NULL, 'ee', 'ee', NULL, NULL, '2023-12-06 20:43:30', '2023-12-06 20:43:30'),
	(6, NULL, NULL, 'fef', NULL, 'ee', 'ee', NULL, NULL, '2023-12-06 20:45:55', '2023-12-06 20:45:55'),
	(7, NULL, NULL, 'vdvd', NULL, 'ss', 'dssd', NULL, NULL, '2023-12-06 20:46:15', '2023-12-06 20:46:15'),
	(8, NULL, NULL, 'vdvd', NULL, 'ss', 'dssd', NULL, NULL, '2023-12-06 20:46:17', '2023-12-06 20:46:17'),
	(9, NULL, NULL, 'vdvd', NULL, 'ss', 'dssd', NULL, NULL, '2023-12-06 20:47:26', '2023-12-06 20:47:26'),
	(10, NULL, NULL, 'ewew', NULL, 'ewew', 'ewew', NULL, NULL, '2023-12-06 21:01:18', '2023-12-06 21:01:18'),
	(11, NULL, NULL, 'ewew', NULL, 'ewew', 'ewew', NULL, NULL, '2023-12-06 22:05:01', '2023-12-06 22:05:01'),
	(12, NULL, NULL, 'xaxa', NULL, 'xa', 'xaaa', NULL, NULL, '2023-12-06 22:10:27', '2023-12-06 22:10:27'),
	(13, NULL, NULL, 'xaxa', NULL, 'xa', 'xaaa', NULL, NULL, '2023-12-06 22:12:29', '2023-12-06 22:12:29'),
	(14, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '2023-12-06 22:14:29', '2023-12-06 22:14:29'),
	(15, NULL, NULL, 'cssc', NULL, 'sc', 'scsc', NULL, NULL, '2023-12-06 22:18:09', '2023-12-06 22:18:09'),
	(16, NULL, NULL, 'cssc', NULL, 'sc', 'scsc', NULL, NULL, '2023-12-06 22:25:14', '2023-12-06 22:25:14'),
	(17, NULL, NULL, 'cssc', NULL, 'sc', 'scsc', NULL, NULL, '2023-12-06 22:30:01', '2023-12-06 22:30:01'),
	(18, NULL, NULL, 'sss', NULL, 'ss', 'sss', NULL, NULL, '2023-12-06 22:30:20', '2023-12-06 22:30:20'),
	(19, NULL, NULL, 'css', NULL, 'ccc', 'ccc', NULL, NULL, '2023-12-06 22:42:06', '2023-12-06 22:42:06'),
	(20, NULL, NULL, 'cdc', NULL, 'dddddddddd', 'dddddddddd', NULL, NULL, '2023-12-06 22:57:28', '2023-12-06 22:57:28'),
	(21, NULL, NULL, 'cssssss', NULL, 'ss', 'ssssssssssssssssssssss', NULL, NULL, '2023-12-06 23:12:24', '2023-12-06 23:12:24'),
	(22, NULL, NULL, 'cssssss', NULL, 'ss', 'ssssssssssssssssssssss', NULL, NULL, '2023-12-06 23:12:29', '2023-12-06 23:12:29'),
	(23, NULL, NULL, 'cssssss', NULL, 'ss', 'ssssssssssssssssssssss', NULL, NULL, '2023-12-06 23:12:35', '2023-12-06 23:12:35'),
	(24, NULL, NULL, 'ddddddd', NULL, 'sssssss', 'ssssssss', NULL, NULL, '2023-12-06 23:52:42', '2023-12-06 23:52:42'),
	(26, NULL, NULL, 'fffff', NULL, 'fffff', 'fffff', 3, NULL, '2023-12-07 00:58:38', '2023-12-07 00:58:38'),
	(27, 22, NULL, 'sssssssss', NULL, 'ssss', 'sssssss', 3, NULL, '2023-12-07 01:19:40', '2023-12-07 01:19:40'),
	(28, 22, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2023-12-07 01:24:01', '2023-12-07 01:24:01'),
	(29, 22, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2023-12-07 01:24:07', '2023-12-07 01:24:07'),
	(30, 1, NULL, 'css', NULL, 'cscs', 'cssccs', 3, NULL, '2023-12-07 01:28:59', '2023-12-07 01:28:59'),
	(31, 1, NULL, 'css', NULL, 'cscs', 'cssccs', 3, NULL, '2023-12-07 01:29:01', '2023-12-07 01:29:01'),
	(32, 1, NULL, 'wwwwwwww', NULL, 'wwwwwww', 'wwwwwwwwww', 3, NULL, '2023-12-07 01:41:33', '2023-12-07 01:41:33'),
	(33, 1, NULL, 'sc', NULL, 'sc', 'sc', 3, NULL, '2023-12-07 04:09:15', '2023-12-07 04:09:15');

-- Dumping structure for table zns_db.appointment_contractor
CREATE TABLE IF NOT EXISTS `appointment_contractor` (
  `id` int NOT NULL,
  `users_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table zns_db.appointment_contractor: ~0 rows (approximately)

-- Dumping structure for table zns_db.appointment_status
CREATE TABLE IF NOT EXISTS `appointment_status` (
  `id` int DEFAULT NULL,
  `appointment_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table zns_db.appointment_status: ~2 rows (approximately)
INSERT INTO `appointment_status` (`id`, `appointment_status`) VALUES
	(1, 'accepted'),
	(2, 'rejected'),
	(3, 'pending');

-- Dumping structure for table zns_db.appointment_type
CREATE TABLE IF NOT EXISTS `appointment_type` (
  `id` int DEFAULT NULL,
  `appointment_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table zns_db.appointment_type: ~2 rows (approximately)
INSERT INTO `appointment_type` (`id`, `appointment_type`) VALUES
	(1, 'pick a product'),
	(2, 'inpection');

-- Dumping structure for table zns_db.failed_jobs
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
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table zns_db.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table zns_db.personal_access_tokens
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
CREATE TABLE IF NOT EXISTS `profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table zns_db.profile: ~30 rows (approximately)
INSERT INTO `profile` (`id`, `user_id`, `phone`, `address`, `created_at`, `updated_at`) VALUES
	(1, 1, '601165331050', 'Seksyen 4, 02487 Kaki Bukit, Perlis Indera Kayangan', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(2, 2, '601710183646', 'Seri Sungai Besi, 86189 Segamat, Johor', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(3, 3, '601154190809', 'Bandar Seri Manggis, 55331 Jerantut, Pahang', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(4, 4, '601383360916', 'Desa Puchong, 20252 Bukit Besi, Terengganu Darul Iman', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(5, 5, '601298374623', 'USJ 44F, 77355 Masjid Tanah, Melaka', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(6, 6, '601810916961', 'USJ 7, 58505 Sungai Lembing, Pahang Darul Makmur', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(7, 7, '601298073828', 'Ara Setapak, 34657 Pantai Remis, Perak Darul Ridzuan', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(8, 8, '601429359723', 'Lembah Belakong, 75101 Telok Mas, Malacca', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(9, 9, '601757224612', 'Bandar Rahmat, 87002 Rancha-Rancha, Labuan', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(10, 10, '601416506839', 'Ara Kerinchi, 76671 Lubuk China, Malacca', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
	(11, 11, '601992420070', 'USJ 33, 77056 Umbai, Malacca', '2023-12-05 23:26:08', '2023-12-05 23:26:08'),
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
	(30, 30, '601613822257', 'Puncak Tasik Puteri, 90182 Donggongon, Sabah', '2023-12-05 23:26:08', '2023-12-05 23:26:08');

-- Dumping structure for table zns_db.students
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
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `users_type_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table zns_db.users: ~31 rows (approximately)
INSERT INTO `users` (`id`, `username`, `email`, `fullname`, `password`, `users_type_id`, `created_at`, `updated_at`) VALUES
	(1, 'zboncak.nikita', 'muriel61@gmail.com', 'Nikita Somio', 'w/>7Kk', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(2, 'progahn', 'vwaters@gmail.com', 'Mrs. Abigail Hills', 'k,(A7bZ[FQ@;^Hk8a', 2, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(3, 'deshaun.reichel', 'alakin@yahoo.com', 'Richie Jast', 'b;BKFeiwE\\S=', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(4, 'effie.hilpert', 'stroman.katelyn@stanton.com', 'Cristobal McGlynn III', 'xrHu^xP{4*obxoS*za7', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(5, 'betsy.hintz', 'hosea83@johnston.com', 'Maverick Swift', '1Sj0`}S)NjTF\'S.tK,/y', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(6, 'kaley05', 'serdman@hotmail.com', 'Deanna Barrows', '_I(qP68{/~J_dhKL+\'~', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(7, 'ileannon', 'ktillman@gmail.com', 'Matilde Haley', 'a6V[]eWU;ohE\\', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(8, 'feil.maribel', 'xlowe@hotmail.com', 'Jaqueline Senger', 'O\'w-\'Z5-%', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(9, 'alvera58', 'gloria.schinner@gmail.com', 'Camren Kuhic', '4-}j22Xt@', 3, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(10, 'cordia18', 'spurdy@cummings.com', 'Tamia Oberbrunner', 'BbN-aW4F"@W!@r0N.z}\\', 2, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(11, 'christophe05', 'zboncak.alanna@kuhn.com', 'Tiana Douglas', '@h={,0N@,WQ|"L', 3, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(12, 'catalina05', 'angie.prohaska@stracke.net', 'Alejandrin Harber', 'IJ+_D}y1/),Y', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(13, 'ruby00', 'pacocha.jeanie@corwin.org', 'Viola Harvey', '{)#xgeXv5!:RyMBK[', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(14, 'lindgren.felicia', 'pollich.gilberto@hotmail.com', 'Drake O\'Hara I', 'm|*eLQFlRg<DC+', 3, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(15, 'nhickle', 'hyman15@yahoo.com', 'Stephany Rodriguez', 'oH?R[,lo', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(16, 'summer09', 'lue65@champlin.com', 'Bella Gorczany', '-ey.3[6ZJZ_o0ayk)Wk', 2, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(17, 'weber.georgette', 'gschmitt@yahoo.com', 'Angeline Jacobs', 'IFuP0Lu;l|*U4^o', 3, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(18, 'abe86', 'raina12@pouros.com', 'Prof. Jannie Mosciski DDS', 'um!2%)9=NRy-]YR}J=', 2, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(19, 'emelia90', 'america91@yahoo.com', 'Anastasia Blick Sr.', 'm&pr"#A_!H"hT{zylB%K', 2, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(20, 'wolff.raymond', 'haven.fadel@hotmail.com', 'Lexi Jacobi', '%xGQA?O\\VuYJ', 3, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(21, 'napoleon70', 'icassin@hotmail.com', 'Johan Pouros I', 'W6fh"-09n]:aGTc3-TJ', 2, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(22, 'xwelch', 'klein.ayana@king.biz', 'Eloise Spencer', '|ETj\\P^yy9', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(23, 'lynch.esther', 'hans.boyer@zulauf.com', 'Orlando Hettinger', 'PK>8">zco70.', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(24, 'maybell06', 'winona65@gmail.com', 'Felicity Lindgren DVM', 'CgA2IZ*}BY<Fp/b6E', 3, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(25, 'mrenner', 'rolfson.maybelle@hamill.com', 'Gracie Kohler PhD', 'vGz_-351PYcwc\\^;j', 3, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(26, 'fkautzer', 'bkohler@feeney.biz', 'Hope Beatty', '!2NU~BtNqJEA9M', 3, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(27, 'norbert.kuhlman', 'dkeeling@mckenzie.net', 'Isai Breitenberg', 'bdRqlNgdEDb', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(28, 'westley.swaniawski', 'kiehn.anastasia@kohler.biz', 'Adan Flatley', '8`,OP:6zbN9GC', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(29, 'vziemann', 'srosenbaum@koss.info', 'Prof. Cesar Koss', '[Tu}N,@', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(30, 'powlowski.kiarra', 'myah.predovic@yahoo.com', 'Meagan Bednar PhD', '~K{*r([G+QfVnA!DE0', 1, '2023-12-05 22:34:16', '2023-12-05 22:34:16'),
	(41, 'aidil', 'm.aidilmaula@gmail.com', NULL, 'password', 2, '2023-12-06 03:29:06', '2023-12-06 03:29:06');

-- Dumping structure for table zns_db.users_type
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
