DROP TABLE IF EXISTS `castes`;
CREATE TABLE `castes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `castes` (`id`, `name`, `created_at`, `updated_at`) VALUES ('1', 'Vankar Samaj', NULL, NULL),
('2', 'Patel Samaj', NULL, NULL);
