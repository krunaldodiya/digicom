-- -------------------------------------------------------------
-- TablePlus 1.0(166)
--
-- https://tableplus.com/
--
-- Database: marusamaj
-- Generation Time: 2018-12-28 12:17:51.0690
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `wallets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `balance` bigint(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallets_user_id_foreign` (`user_id`),
  CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `wallet_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wallet_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `transaction_id` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallet_transactions_wallet_id_foreign` (`wallet_id`),
  CONSTRAINT `wallet_transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caste_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_caste_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_mobile` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Male',
  `dob` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Single',
  `education` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `occupation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caste_updated` tinyint(1) NOT NULL DEFAULT '0',
  `profile_updated` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_uid_unique` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  KEY `telescope_entries_tags_tag_index` (`tag`),
  CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `telescope_entries` (
  `sequence` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sequence`),
  UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  KEY `telescope_entries_batch_id_index` (`batch_id`),
  KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`),
  KEY `telescope_entries_family_hash_index` (`family_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sub_castes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `caste_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `show_mobile` tinyint(1) NOT NULL DEFAULT '0',
  `show_birthday` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `relatives` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `from_relation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_relation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(11) NOT NULL,
  `caste_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `castes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `wallets` (`id`, `user_id`, `balance`, `created_at`, `updated_at`) VALUES ('1', '1', '0', '2018-12-26 16:42:33', '2018-12-26 16:42:33'),
('2', '2', '0', '2018-12-26 16:46:00', '2018-12-26 16:46:00'),
('3', NULL, '0', '2018-12-26 17:38:27', '2018-12-26 17:38:27'),
('4', '4', '0', '2018-12-26 17:41:11', '2018-12-26 17:41:11'),
('5', '5', '0', '2018-12-26 17:42:54', '2018-12-26 17:42:54'),
('6', '6', '0', '2018-12-26 18:04:10', '2018-12-26 18:04:10'),
('7', '7', '0', '2018-12-27 08:04:16', '2018-12-27 08:04:16');

INSERT INTO `users` (`id`, `uid`, `name`, `father_city`, `mother_city`, `caste_id`, `sub_caste_id`, `mobile`, `secondary_mobile`, `gender`, `dob`, `marital_status`, `education`, `occupation`, `address`, `avatar`, `caste_updated`, `profile_updated`, `remember_token`, `created_at`, `updated_at`) VALUES ('1', NULL, 'Krunal Arvindkumar Dodiya', 'Bhailakui', 'Kapadwanj', '1', '1', '9426726815', NULL, 'Male', '27-06-1987', 'Single', 'B. Com Graduate', 'Freelance Web Developer', NULL, 'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_246,y_0/v1545977518/ni0zndebjwsonz8tlmvg.jpg', '1', '1', NULL, '2018-12-26 16:42:33', '2018-12-28 11:41:58'),
('2', '691758270088', 'Hetal Arvindkumar Dodiya', 'Bhailakui', 'Kapadwanj', '1', '1', '9426726815', '7046582296', 'Female', '10-08-1991', 'Single', 'M. Com Graduate', 'Government Job', NULL, 'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_958,y_781/v1545833382/d6s2mpnrrxtkrefhn9up.jpg', '1', '1', NULL, '2018-12-26 16:46:00', '2018-12-27 09:13:01'),
('4', NULL, 'Bhavin Kanubhai Dodiya', 'Bhailakui', 'Kaniyel', '1', '1', '8980062273', NULL, 'Male', '04-10-1992', 'Single', 'M. C. A', 'Tata Capital Finance Services Ltd', NULL, NULL, '1', '1', NULL, '2018-12-26 17:41:11', '2018-12-26 17:42:39'),
('5', NULL, 'Pratik Kanubhai Dodiya', 'Bhailakui', 'Kaniyel', '1', '1', '8980062273', NULL, 'Male', '25-09-1995', 'Single', 'M. Com', 'Audit', NULL, NULL, '1', '1', NULL, '2018-12-26 17:42:54', '2018-12-26 17:43:53'),
('6', NULL, 'Manisha Jigar Amin', 'Bhailakui', 'Kapadwanj', '1', '1', '9426726815', '8460689469', 'Female', '21-03-1989', 'Married', 'M. A', 'Housewife', NULL, 'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_447,y_31/v1545830106/w670e1l3ht31brx8gxqe.jpg', '1', '1', NULL, '2018-12-26 18:04:10', '2018-12-27 09:18:01'),
('7', NULL, 'Arvindkumar Naranbhai Dodiya', 'Bhailakui', 'Ravdavat', '1', '1', '9426726815', NULL, 'Male', '21-03-1964', 'Married', '10 pass', 'B. S. N. L', NULL, NULL, '1', '1', NULL, '2018-12-27 08:04:15', '2018-12-27 08:05:00');

INSERT INTO `sub_castes` (`id`, `caste_id`, `name`, `created_at`, `updated_at`) VALUES ('1', '1', '2284', NULL, NULL),
('2', '1', 'Savaso', NULL, NULL),
('3', '1', 'Nani Daskoi', NULL, NULL),
('4', '1', 'Moti Daskoi', NULL, NULL),
('5', '1', '52', NULL, NULL),
('6', '1', '282', NULL, NULL),
('7', '1', 'Chhedal', NULL, NULL),
('8', '2', 'Kadva', NULL, NULL),
('9', '2', 'Leuva', NULL, NULL);

INSERT INTO `settings` (`id`, `user_id`, `show_mobile`, `show_birthday`, `created_at`, `updated_at`) VALUES ('1', '1', '1', '1', '2018-12-26 16:42:33', '2018-12-27 09:42:48'),
('2', '2', '0', '0', '2018-12-26 16:46:00', '2018-12-27 13:35:35'),
('3', '3', '0', '0', '2018-12-26 17:38:27', '2018-12-26 17:38:27'),
('4', '4', '0', '0', '2018-12-26 17:41:11', '2018-12-26 17:41:11'),
('5', '5', '0', '0', '2018-12-26 17:42:54', '2018-12-26 17:42:54'),
('6', '6', '1', '1', '2018-12-26 18:04:10', '2018-12-27 09:35:29'),
('7', '7', '0', '0', '2018-12-27 08:04:16', '2018-12-27 08:04:16');

INSERT INTO `relatives` (`id`, `user_id`, `from`, `to`, `from_relation`, `to_relation`, `status`, `created_at`, `updated_at`) VALUES ('3', '5', '5', '4', 'Brother', 'Brother', '1', NULL, '2018-12-26 17:44:38'),
('4', '5', '4', '5', 'Brother', 'Brother', '1', NULL, '2018-12-26 17:44:38'),
('15', '1', '1', '2', 'Sister', 'Brother', '1', NULL, '2018-12-27 09:01:58'),
('16', '1', '2', '1', 'Brother', 'Sister', '1', NULL, '2018-12-27 09:10:25'),
('19', '6', '6', '7', 'Father', 'Daughter', '1', NULL, '2018-12-27 08:45:02'),
('20', '6', '7', '6', 'Daughter', 'Father', '1', NULL, '2018-12-27 09:10:25'),
('21', '7', '7', '2', 'Daughter', 'Father', '1', NULL, '2018-12-27 09:10:25'),
('22', '7', '2', '7', 'Father', 'Daughter', '1', NULL, '2018-12-27 08:43:08'),
('23', '2', '2', '6', 'Sister', 'Sister', '1', NULL, '2018-12-27 09:01:58'),
('24', '2', '6', '2', 'Sister', 'Sister', '1', NULL, '2018-12-27 08:45:02'),
('25', '6', '6', '1', 'Brother', 'Sister', '1', NULL, '2018-12-27 09:10:25'),
('26', '6', '1', '6', 'Sister', 'Brother', '1', NULL, '2018-12-27 09:01:58'),
('27', '1', '1', '7', 'Father', 'Son', '1', NULL, '2018-12-27 09:10:25'),
('28', '1', '7', '1', 'Son', 'Father', '1', NULL, '2018-12-27 09:10:25');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES ('34', '2016_06_01_000001_create_oauth_auth_codes_table', '1'),
('35', '2016_06_01_000002_create_oauth_access_tokens_table', '1'),
('36', '2016_06_01_000003_create_oauth_refresh_tokens_table', '1'),
('37', '2016_06_01_000004_create_oauth_clients_table', '1'),
('38', '2016_06_01_000005_create_oauth_personal_access_clients_table', '1'),
('39', '2018_02_20_113000_create_wallets_table', '1'),
('40', '2018_02_20_113500_create_wallet_transactions_table', '1'),
('41', '2018_08_08_100000_create_telescope_entries_table', '1'),
('42', '2018_12_17_172704_create_relatives_table', '1'),
('43', '2018_12_25_101551_create_settings_table', '1'),
('44', '2019_11_16_000009_create_castes_table', '1'),
('45', '2019_12_25_101551_create_accounts_table', '1'),
('47', '2020_11_16_000009_create_sub_castes_table', '1'),
('49', '2014_10_12_000002_create_users_table', '2'),
('50', '2020_11_16_000009_create_events_table', '3');

INSERT INTO `castes` (`id`, `name`, `created_at`, `updated_at`) VALUES ('1', 'Vankar Samaj', NULL, NULL),
('2', 'Patel Samaj', NULL, NULL);



/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;