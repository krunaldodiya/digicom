DROP TABLE IF EXISTS `business_categories`;
CREATE TABLE `business_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;;

INSERT INTO `business_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES ('1', 'Local Business or Place', NULL, NULL),
('2', 'Brand or Product', NULL, NULL),
('3', 'Company Organization or Institution', NULL, NULL);
