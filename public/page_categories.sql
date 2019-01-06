DROP TABLE IF EXISTS `page_categories`;
CREATE TABLE `page_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `page_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES ('1', 'Personal', NULL, NULL),
('2', 'Local Business or Place', NULL, NULL),
('3', 'Brand or Product', NULL, NULL),
('4', 'Company Organization or Institution', NULL, NULL),
('5', 'Community', NULL, NULL),
('6', 'Entertainment', NULL, NULL),
('7', 'Education', NULL, NULL),
('8', 'Business & Finance', NULL, NULL),
('9', 'Stock Market', NULL, NULL),
('10', 'Technology', NULL, NULL),
('11', 'Politics', NULL, NULL),
('12', 'Sports', NULL, NULL),
('13', 'Media', NULL, NULL);
