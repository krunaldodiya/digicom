DROP TABLE IF EXISTS `sub_castes`;
CREATE TABLE `sub_castes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `caste_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `sub_castes` (`id`, `caste_id`, `name`, `created_at`, `updated_at`) VALUES ('1', '1', '2284', NULL, NULL),
('2', '1', 'Savaso', NULL, NULL),
('3', '1', 'Nani Daskoi', NULL, NULL),
('4', '1', 'Moti Daskoi', NULL, NULL),
('5', '1', '52', NULL, NULL),
('6', '1', '282', NULL, NULL),
('7', '1', 'Chhedal', NULL, NULL),
('8', '2', 'Kadva', NULL, NULL),
('9', '2', 'Leuva', NULL, NULL);
