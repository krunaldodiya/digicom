DROP TABLE IF EXISTS `group_topics`;
CREATE TABLE `group_topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;;

INSERT INTO `group_topics` (`id`, `name`, `created_at`, `updated_at`) VALUES 
('1', 'General', NULL, NULL),
('2', 'Entertainment', NULL, NULL),
('3', 'Education', NULL, NULL),
('4', 'Jobs', NULL, NULL),
('5', 'News', NULL, NULL),
('6', 'Finance', NULL, NULL),
('7', 'Market', NULL, NULL),
('8', 'Politics', NULL, NULL),
('9', 'Sports', NULL, NULL),
('10', 'Media', NULL, NULL),
('11', 'Science', NULL, NULL),
('12', 'Technology', NULL, NULL);
