DROP TABLE IF EXISTS `page_categories`;
CREATE TABLE `page_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `public` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `page_categories` (`id`, `name`, `created_at`, `updated_at`, `public`) VALUES ('2', 'General', NULL, NULL, '0'),
('3', 'Jobs', NULL, NULL, '1'),
('4', 'Education', NULL, NULL, '1'),
('5', 'Entertainment', NULL, NULL, '1'),
('6', 'News', NULL, NULL, '1'),
('7', 'Finance', NULL, NULL, '1'),
('8', 'Market', NULL, NULL, '1'),
('9', 'Politics', NULL, NULL, '1'),
('10', 'Sports', NULL, NULL, '1'),
('11', 'Media', NULL, NULL, '1'),
('12', 'Science', NULL, NULL, '1'),
('13', 'Technology', NULL, NULL, '1');
