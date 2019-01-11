DROP TABLE IF EXISTS `event_categories`;
CREATE TABLE `event_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `community_id` int(11) NOT NULL DEFAULT '0',
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;;

INSERT INTO `event_categories` (`id`, `community_id`, `name`, `created_at`, `updated_at`) VALUES ('1', '0', 'Meetings', NULL, NULL),
('2', '0', 'Rally', NULL, NULL),
('3', '0', 'Born', NULL, NULL),
('4', '0', 'Death', NULL, NULL),
('5', '0', 'Engagement', NULL, NULL),
('6', '0', 'Marriage', NULL, NULL),
('7', '0', 'Samuhik vivah', NULL, NULL),
('8', '0', 'Puja - Havan - Vastu', NULL, NULL),
('9', '0', 'Bhandaro', NULL, NULL),
('10', '0', 'Congratulations', NULL, NULL),
('11', '0', 'Party & Celebration', NULL, NULL),
('12', '0', 'Pustak Vitran', NULL, NULL),
('13', '0', 'Donatation', NULL, NULL);
