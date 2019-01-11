DROP TABLE IF EXISTS `relatives`;
CREATE TABLE `relatives` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `from_relation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_relation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `relatives_user_id_foreign` (`user_id`),
  CONSTRAINT `relatives_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `relatives` (`id`, `user_id`, `from`, `to`, `from_relation`, `to_relation`, `status`, `created_at`, `updated_at`) VALUES ('16', '1', '2', '1', 'Brother', 'Sister', '1', NULL, '2018-12-28 20:57:46'),
('19', '6', '6', '7', 'Father', 'Daughter', '1', NULL, '2018-12-28 20:56:49'),
('20', '6', '7', '6', 'Daughter', 'Father', '1', NULL, '2018-12-28 20:50:46'),
('21', '7', '7', '2', 'Daughter', 'Father', '1', NULL, '2018-12-28 20:50:46'),
('22', '7', '2', '7', 'Father', 'Daughter', '1', NULL, '2018-12-28 20:57:46'),
('23', '2', '2', '6', 'Sister', 'Sister', '1', NULL, '2018-12-28 20:57:46'),
('24', '2', '6', '2', 'Sister', 'Sister', '1', NULL, '2018-12-28 20:56:49'),
('25', '6', '6', '1', 'Brother', 'Sister', '1', NULL, '2018-12-28 20:56:49'),
('28', '1', '7', '1', 'Son', 'Father', '1', NULL, '2018-12-28 20:50:46'),
('29', '11', '11', '7', 'Husband', 'Wife', '1', NULL, '2018-12-28 21:11:22'),
('30', '11', '7', '11', 'Wife', 'Husband', '1', NULL, '2018-12-28 20:57:46'),
('31', '11', '11', '1', 'Son', 'Mother', '1', NULL, '2018-12-28 21:11:22'),
('33', '11', '11', '6', 'Daughter', 'Mother', '1', NULL, '2018-12-28 21:11:22'),
('34', '11', '6', '11', 'Mother', 'Daughter', '1', NULL, '2018-12-28 20:57:46'),
('35', '11', '11', '2', 'Daughter', 'Mother', '1', NULL, '2018-12-28 21:11:22'),
('36', '11', '2', '11', 'Mother', 'Daughter', '1', NULL, '2018-12-28 20:57:46'),
('37', '12', '12', '11', 'Mother', 'Son', '1', NULL, '2018-12-28 21:11:22'),
('38', '12', '11', '12', 'Son', 'Mother', '1', NULL, '2018-12-28 21:11:22'),
('45', '4', '5', '21', 'Brother', 'Brother', '0', NULL, NULL),
('46', '4', '21', '5', 'Brother', 'Brother', '0', NULL, NULL),
('58', '33', '28', '33', 'Brother', 'Brother', '0', NULL, NULL);
