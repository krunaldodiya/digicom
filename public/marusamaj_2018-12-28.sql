# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.24-0ubuntu0.18.04.1)
# Database: marusamaj
# Generation Time: 2018-12-28 10:08:02 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table castes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `castes`;

CREATE TABLE `castes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `castes` WRITE;
/*!40000 ALTER TABLE `castes` DISABLE KEYS */;

INSERT INTO `castes` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'Vankar Samaj',NULL,NULL),
	(2,'Patel Samaj',NULL,NULL);

/*!40000 ALTER TABLE `castes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `events`;

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



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000002_create_users_table',1),
	(2,'2016_06_01_000001_create_oauth_auth_codes_table',1),
	(3,'2016_06_01_000002_create_oauth_access_tokens_table',1),
	(4,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),
	(5,'2016_06_01_000004_create_oauth_clients_table',1),
	(6,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),
	(7,'2018_02_20_113000_create_wallets_table',1),
	(8,'2018_02_20_113500_create_wallet_transactions_table',1),
	(9,'2018_08_08_100000_create_telescope_entries_table',1),
	(10,'2018_12_17_172704_create_relatives_table',1),
	(11,'2018_12_25_101551_create_settings_table',1),
	(12,'2019_11_16_000009_create_castes_table',1),
	(13,'2020_11_16_000009_create_events_table',1),
	(14,'2020_11_16_000009_create_sub_castes_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_access_tokens`;

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



# Dump of table oauth_auth_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table oauth_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_clients`;

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

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'Laravel Personal Access Client','a5iC94KGmKUACtAKEeFSJ5ChyRFSJ9vn22Rnfk8G','http://localhost',1,0,0,'2018-12-28 15:36:20','2018-12-28 15:36:20');

/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_personal_access_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`)
VALUES
	(1,1,'2018-12-28 15:36:20','2018-12-28 15:36:20');

/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table relatives
# ------------------------------------------------------------

DROP TABLE IF EXISTS `relatives`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `relatives` WRITE;
/*!40000 ALTER TABLE `relatives` DISABLE KEYS */;

INSERT INTO `relatives` (`id`, `user_id`, `from`, `to`, `from_relation`, `to_relation`, `status`, `created_at`, `updated_at`)
VALUES
	(3,5,5,4,'Brother','Brother',1,NULL,'2018-12-26 17:44:38'),
	(4,5,4,5,'Brother','Brother',1,NULL,'2018-12-26 17:44:38'),
	(15,1,1,2,'Sister','Brother',1,NULL,'2018-12-27 09:01:58'),
	(16,1,2,1,'Brother','Sister',1,NULL,'2018-12-27 09:10:25'),
	(19,6,6,7,'Father','Daughter',1,NULL,'2018-12-27 08:45:02'),
	(20,6,7,6,'Daughter','Father',1,NULL,'2018-12-27 09:10:25'),
	(21,7,7,2,'Daughter','Father',1,NULL,'2018-12-27 09:10:25'),
	(22,7,2,7,'Father','Daughter',1,NULL,'2018-12-27 08:43:08'),
	(23,2,2,6,'Sister','Sister',1,NULL,'2018-12-27 09:01:58'),
	(24,2,6,2,'Sister','Sister',1,NULL,'2018-12-27 08:45:02'),
	(25,6,6,1,'Brother','Sister',1,NULL,'2018-12-27 09:10:25'),
	(26,6,1,6,'Sister','Brother',1,NULL,'2018-12-27 09:01:58'),
	(27,1,1,7,'Father','Son',1,NULL,'2018-12-27 09:10:25'),
	(28,1,7,1,'Son','Father',1,NULL,'2018-12-27 09:10:25');

/*!40000 ALTER TABLE `relatives` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `show_mobile` tinyint(1) NOT NULL DEFAULT '0',
  `show_birthday` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;

INSERT INTO `settings` (`id`, `user_id`, `show_mobile`, `show_birthday`, `created_at`, `updated_at`)
VALUES
	(1,1,1,1,'2018-12-26 16:42:33','2018-12-27 09:42:48'),
	(2,2,0,0,'2018-12-26 16:46:00','2018-12-27 16:21:31'),
	(4,4,0,0,'2018-12-26 17:41:11','2018-12-26 17:41:11'),
	(5,5,0,0,'2018-12-26 17:42:54','2018-12-26 17:42:54'),
	(6,6,0,0,'2018-12-26 18:04:10','2018-12-27 16:21:17'),
	(7,7,0,0,'2018-12-27 08:04:16','2018-12-27 08:04:16'),
	(8,8,0,0,'2018-12-27 14:39:38','2018-12-27 14:39:38'),
	(10,10,0,0,'2018-12-27 19:19:49','2018-12-27 19:19:49');

/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sub_castes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sub_castes`;

CREATE TABLE `sub_castes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `caste_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `sub_castes` WRITE;
/*!40000 ALTER TABLE `sub_castes` DISABLE KEYS */;

INSERT INTO `sub_castes` (`id`, `caste_id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,1,'2284',NULL,NULL),
	(2,1,'Savaso',NULL,NULL),
	(3,1,'Nani Daskoi',NULL,NULL),
	(4,1,'Moti Daskoi',NULL,NULL),
	(5,1,'52',NULL,NULL),
	(6,1,'282',NULL,NULL),
	(7,1,'Chhedal',NULL,NULL),
	(8,2,'Kadva',NULL,NULL),
	(9,2,'Leuva',NULL,NULL);

/*!40000 ALTER TABLE `sub_castes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table telescope_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `telescope_entries`;

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

LOCK TABLES `telescope_entries` WRITE;
/*!40000 ALTER TABLE `telescope_entries` DISABLE KEYS */;

INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`)
VALUES
	(1,'8c9b6978-ee4a-4113-882c-c337ee5e175e','8c9b6978-f29e-4bb0-889c-b707dd64ba9e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[\"marusamaj\",\"migrations\"],\"sql\":\"select * from information_schema.tables where table_schema = ? and table_name = ?\",\"time\":\"0.75\",\"slow\":false,\"file\":\"\\/home\\/forge\\/default\\/artisan\",\"line\":37,\"hostname\":\"marusamaj\"}','2018-12-28 15:29:33'),
	(2,'8c9b6978-f25c-4108-93b3-e8646491e854','8c9b6978-f29e-4bb0-889c-b707dd64ba9e',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `migration` from `migrations` order by `batch` asc, `migration` asc\",\"time\":\"0.41\",\"slow\":false,\"file\":\"\\/home\\/forge\\/default\\/artisan\",\"line\":37,\"hostname\":\"marusamaj\"}','2018-12-28 15:29:33'),
	(3,'8c9b6978-f28e-4cc2-a7ac-42740049a78c','8c9b6978-f29e-4bb0-889c-b707dd64ba9e',NULL,1,'command','{\"command\":\"migrate\",\"exit_code\":0,\"arguments\":{\"command\":\"migrate\"},\"options\":{\"database\":null,\"force\":true,\"path\":null,\"realpath\":false,\"pretend\":false,\"seed\":false,\"step\":false,\"help\":false,\"quiet\":false,\"verbose\":false,\"version\":false,\"ansi\":false,\"no-ansi\":false,\"no-interaction\":false,\"env\":null},\"hostname\":\"marusamaj\"}','2018-12-28 15:29:33'),
	(4,'8c9b697e-2145-409a-8d01-6e0f52d91e3b','8c9b697e-221c-438d-99f6-df2471547bce',NULL,1,'request','{\"uri\":\"\\/\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\HomeController@index\",\"middleware\":[\"web\"],\"headers\":{\"accept-language\":\"en-US,en;q=0.9\",\"accept-encoding\":\"gzip, deflate\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8\",\"user-agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/71.0.3578.98 Safari\\/537.36\",\"upgrade-insecure-requests\":\"1\",\"connection\":\"keep-alive\",\"host\":\"52.73.254.22\",\"content-length\":\"\",\"content-type\":\"\"},\"payload\":[],\"session\":{\"_token\":\"********\",\"_previous\":{\"url\":\"http:\\/\\/52.73.254.22\"}},\"response_status\":200,\"response\":{\"view\":\"\\/home\\/forge\\/default\\/resources\\/views\\/home.blade.php\",\"data\":[]},\"duration\":172,\"hostname\":\"marusamaj\"}','2018-12-28 15:29:36'),
	(5,'8c9b6a73-3b9d-4db7-84a3-7fb87d39e939','8c9b6a73-3cbc-409e-9e11-5ce5bfa2d474',NULL,1,'command','{\"command\":\"key:generate\",\"exit_code\":0,\"arguments\":{\"command\":\"key:generate\"},\"options\":{\"show\":false,\"force\":false,\"help\":false,\"quiet\":false,\"verbose\":false,\"version\":false,\"ansi\":false,\"no-ansi\":false,\"no-interaction\":false,\"env\":null},\"hostname\":\"marusamaj\"}','2018-12-28 15:32:17'),
	(6,'8c9b6a84-ddbb-421c-96e7-b2568e01844f','8c9b6a84-df1c-43be-94fe-f7447d2bebec',NULL,1,'request','{\"uri\":\"\\/\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\HomeController@index\",\"middleware\":[\"web\"],\"headers\":{\"accept-language\":\"en-US,en;q=0.9\",\"accept-encoding\":\"gzip, deflate\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8\",\"user-agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/71.0.3578.98 Safari\\/537.36\",\"upgrade-insecure-requests\":\"1\",\"connection\":\"keep-alive\",\"host\":\"marusamaj.tk\",\"content-length\":\"\",\"content-type\":\"\"},\"payload\":[],\"session\":{\"_token\":\"********\",\"_previous\":{\"url\":\"http:\\/\\/marusamaj.tk\"}},\"response_status\":200,\"response\":{\"view\":\"\\/home\\/forge\\/marusamaj.tk\\/resources\\/views\\/home.blade.php\",\"data\":[]},\"duration\":176,\"hostname\":\"marusamaj\"}','2018-12-28 15:32:29'),
	(7,'8c9b6b71-112c-46d4-9b9f-90c71e6b0a8e','8c9b6b71-13b0-4ccc-be02-4e328e285cbb',NULL,1,'request','{\"uri\":\"\\/\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\HomeController@index\",\"middleware\":[\"web\"],\"headers\":{\"cookie\":\"********\",\"accept-language\":\"en-US,en;q=0.9\",\"accept-encoding\":\"gzip, deflate, br\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8\",\"user-agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/71.0.3578.98 Safari\\/537.36\",\"upgrade-insecure-requests\":\"1\",\"cache-control\":\"max-age=0\",\"host\":\"marusamaj.tk\",\"content-length\":\"\",\"content-type\":\"\"},\"payload\":[],\"session\":{\"_token\":\"********\",\"_previous\":{\"url\":\"https:\\/\\/marusamaj.tk\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":200,\"response\":{\"view\":\"\\/home\\/forge\\/marusamaj.tk\\/resources\\/views\\/home.blade.php\",\"data\":[]},\"duration\":459,\"hostname\":\"marusamaj\"}','2018-12-28 15:35:03'),
	(8,'8c9b6ba6-0f1a-4eed-bde2-4f24372785c1','8c9b6ba6-0f68-445b-8d5c-454af59e6260',NULL,1,'request','{\"uri\":\"\\/\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\HomeController@index\",\"middleware\":[\"web\"],\"headers\":{\"cookie\":\"********\",\"accept-language\":\"en-US,en;q=0.9\",\"accept-encoding\":\"gzip, deflate, br\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8\",\"user-agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/71.0.3578.98 Safari\\/537.36\",\"upgrade-insecure-requests\":\"1\",\"host\":\"marusamaj.tk\",\"content-length\":\"\",\"content-type\":\"\"},\"payload\":[],\"session\":{\"_token\":\"********\",\"_previous\":{\"url\":\"https:\\/\\/marusamaj.tk\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":200,\"response\":{\"view\":\"\\/home\\/forge\\/marusamaj.tk\\/resources\\/views\\/home.blade.php\",\"data\":[]},\"duration\":16,\"hostname\":\"marusamaj\"}','2018-12-28 15:35:38'),
	(9,'8c9b6be6-3390-47e2-b04d-96d26a3626ae','8c9b6be6-36fd-41c1-8b20-e036c6fc89df',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[null,\"Laravel Personal Access Client\",\"a5iC94KGmKUACtAKEeFSJ5ChyRFSJ9vn22Rnfk8G\",\"http:\\/\\/localhost\",1,0,0,\"2018-12-28 15:36:20\",\"2018-12-28 15:36:20\"],\"sql\":\"insert into `oauth_clients` (`user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `updated_at`, `created_at`) values (?, ?, ?, ?, ?, ?, ?, ?, ?)\",\"time\":\"2.53\",\"slow\":false,\"file\":\"\\/home\\/forge\\/marusamaj.tk\\/artisan\",\"line\":37,\"hostname\":\"marusamaj\"}','2018-12-28 15:36:20'),
	(10,'8c9b6be6-354a-4ebc-b593-83545aa9f823','8c9b6be6-36fd-41c1-8b20-e036c6fc89df',NULL,1,'model','{\"action\":\"created\",\"model\":\"Laravel\\\\Passport\\\\Client:1\",\"hostname\":\"marusamaj\"}','2018-12-28 15:36:20'),
	(11,'8c9b6be6-366e-40dd-a896-ad30adaff8ba','8c9b6be6-36fd-41c1-8b20-e036c6fc89df',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[1,\"2018-12-28 15:36:20\",\"2018-12-28 15:36:20\"],\"sql\":\"insert into `oauth_personal_access_clients` (`client_id`, `updated_at`, `created_at`) values (?, ?, ?)\",\"time\":\"1.92\",\"slow\":false,\"file\":\"\\/home\\/forge\\/marusamaj.tk\\/artisan\",\"line\":37,\"hostname\":\"marusamaj\"}','2018-12-28 15:36:20'),
	(12,'8c9b6be6-3681-4d78-a06c-f92dd1e728b5','8c9b6be6-36fd-41c1-8b20-e036c6fc89df',NULL,1,'model','{\"action\":\"created\",\"model\":\"Laravel\\\\Passport\\\\PersonalAccessClient:1\",\"hostname\":\"marusamaj\"}','2018-12-28 15:36:20'),
	(13,'8c9b6be6-36ec-4aab-b9f4-6bc501aea9d1','8c9b6be6-36fd-41c1-8b20-e036c6fc89df',NULL,1,'command','{\"command\":\"passport:client\",\"exit_code\":0,\"arguments\":{\"command\":\"passport:client\"},\"options\":{\"personal\":true,\"password\":false,\"client\":false,\"name\":null,\"help\":false,\"quiet\":false,\"verbose\":false,\"version\":false,\"ansi\":false,\"no-ansi\":false,\"no-interaction\":false,\"env\":null},\"hostname\":\"marusamaj\"}','2018-12-28 15:36:20');

/*!40000 ALTER TABLE `telescope_entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table telescope_entries_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `telescope_entries_tags`;

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  KEY `telescope_entries_tags_tag_index` (`tag`),
  CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `telescope_entries_tags` WRITE;
/*!40000 ALTER TABLE `telescope_entries_tags` DISABLE KEYS */;

INSERT INTO `telescope_entries_tags` (`entry_uuid`, `tag`)
VALUES
	('8c9b6be6-354a-4ebc-b593-83545aa9f823','Laravel\\Passport\\Client:1'),
	('8c9b6be6-3681-4d78-a06c-f92dd1e728b5','Laravel\\Passport\\PersonalAccessClient:1');

/*!40000 ALTER TABLE `telescope_entries_tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table telescope_monitoring
# ------------------------------------------------------------

DROP TABLE IF EXISTS `telescope_monitoring`;

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `uid`, `name`, `father_city`, `mother_city`, `caste_id`, `sub_caste_id`, `mobile`, `secondary_mobile`, `gender`, `dob`, `marital_status`, `education`, `occupation`, `address`, `avatar`, `caste_updated`, `profile_updated`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'691758270088','Krunal Arvindkumar Dodiya','Bhailakui','Kapadwanj','1','1','9426726815',NULL,'Male','27-06-1987','Single','B. Com Graduate','Freelance Web Developer',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_226,y_0/v1545829144/qs79r9urzbikug1gqky9.jpg',1,1,NULL,'2018-12-26 16:42:33','2018-12-26 18:29:05'),
	(2,NULL,'Hetal Arvindkumar Dodiya','Bhailakui','Kapadwanj','1','1','9426726815','7046582296','Female','10-08-1991','Single','M. Com Graduate','Government Job',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_958,y_781/v1545833382/d6s2mpnrrxtkrefhn9up.jpg',1,1,NULL,'2018-12-26 16:46:00','2018-12-27 09:13:01'),
	(4,NULL,'Bhavin Kanubhai Dodiya','Bhailakui','Kaniyel','1','1','8980062273',NULL,'Male','04-10-1992','Single','M. C. A','Tata Capital Finance Services Ltd',NULL,NULL,1,1,NULL,'2018-12-26 17:41:11','2018-12-26 17:42:39'),
	(5,NULL,'Pratik Kanubhai Dodiya','Bhailakui','Kaniyel','1','1','8980062273',NULL,'Male','25-09-1995','Single','M. Com','Audit',NULL,NULL,1,1,NULL,'2018-12-26 17:42:54','2018-12-26 17:43:53'),
	(6,NULL,'Manisha Jigar Amin','Bhailakui','Kapadwanj','1','1','9426726815','8460689469','Female','21-03-1989','Married','M. A','Housewife',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_447,y_31/v1545830106/w670e1l3ht31brx8gxqe.jpg',1,1,NULL,'2018-12-26 18:04:10','2018-12-27 09:18:01'),
	(7,NULL,'Arvindkumar Naranbhai Dodiya','Bhailakui','Ravdavat','1','1','9426726815',NULL,'Male','21-03-1964','Married','10 pass','B. S. N. L',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_0,y_22/v1545907805/u4thn49midyhvyhtao7y.jpg',1,1,NULL,'2018-12-27 08:04:15','2018-12-27 16:20:05'),
	(8,NULL,'Ravikant Parmar','Kadwanj','Kewadiya','1','1','9227487999',NULL,'Male','08-10-1983','Married','B.com','Marking head',NULL,NULL,1,1,NULL,'2018-12-27 14:39:38','2018-12-27 14:41:31'),
	(10,NULL,'Alpeshkumar Govindbhai Dodia','Bhailakui','Navagam','1','1','9913125748',NULL,'Male','19-07-1986','Married','Graduate','Government Job',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_0,y_123/v1545918753/iq5z7syxs23uvdky1mv9.jpg',1,1,NULL,'2018-12-27 19:19:49','2018-12-27 19:22:34');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wallet_transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wallet_transactions`;

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



# Dump of table wallets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wallets`;

CREATE TABLE `wallets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `balance` bigint(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallets_user_id_foreign` (`user_id`),
  CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;

INSERT INTO `wallets` (`id`, `user_id`, `balance`, `created_at`, `updated_at`)
VALUES
	(1,1,0,'2018-12-26 16:42:33','2018-12-26 16:42:33'),
	(2,2,0,'2018-12-26 16:46:00','2018-12-26 16:46:00'),
	(4,4,0,'2018-12-26 17:41:11','2018-12-26 17:41:11'),
	(5,5,0,'2018-12-26 17:42:54','2018-12-26 17:42:54'),
	(6,6,0,'2018-12-26 18:04:10','2018-12-26 18:04:10'),
	(7,7,0,'2018-12-27 08:04:16','2018-12-27 08:04:16'),
	(8,8,0,'2018-12-27 14:39:38','2018-12-27 14:39:38'),
	(10,10,0,'2018-12-27 19:19:49','2018-12-27 19:19:49');

/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
