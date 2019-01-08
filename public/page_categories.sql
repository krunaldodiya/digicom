DROP TABLE IF EXISTS `page_categories`;
CREATE TABLE `page_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `selectable` tinyint(1) DEFAULT NULL,
  `searchable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `page_categories` (`id`, `name`, `created_at`, `updated_at`, `selectable`, `searchable`) VALUES ('1', 'Personal', NULL, NULL, '0', '0'),
('2', 'Business - Local Business or Place', NULL, NULL, '1', '0'),
('3', 'Business - Product or Brand', NULL, NULL, '1', '0'),
('4', 'Business - Company Organization or Institution', NULL, NULL, '1', '0'),
('5', 'Community', NULL, NULL, '0', '0'),
('6', 'Employment', NULL, NULL, '0', '1'),
('7', 'Education', NULL, NULL, '1', '1'),
('8', 'Entertainment', NULL, NULL, '1', '1'),
('9', 'Finance', NULL, NULL, '1', '1'),
('10', 'Market', NULL, NULL, '1', '1'),
('11', 'Politics', NULL, NULL, '1', '1'),
('12', 'Sports', NULL, NULL, '1', '1'),
('13', 'Media', NULL, NULL, '1', '1'),
('14', 'Science', NULL, NULL, '1', '1'),
('15', 'Technology', NULL, NULL, '1', '1');
