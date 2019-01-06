# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.24-0ubuntu0.18.04.1)
# Database: marusamaj
# Generation Time: 2018-12-30 07:17:51 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


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
	(1,'691758270088','Krunal Arvindkumar Dodiya','Bhailakui','Kapadwanj','1','1','9426726815','7016342489','Male','27-06-1987','Single','B. Com Graduate','Freelance Web Developer',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_226,y_0/v1545829144/qs79r9urzbikug1gqky9.jpg',1,1,NULL,'2018-12-26 16:42:33','2018-12-29 22:02:48'),
	(2,NULL,'Hetal Arvindkumar Dodiya','Bhailakui','Kapadwanj','1','1','9426726815','7046582296','Female','10-08-1991','Single','M. Com Graduate','Government Job',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_958,y_781/v1545833382/d6s2mpnrrxtkrefhn9up.jpg',1,1,NULL,'2018-12-26 16:46:00','2018-12-27 09:13:01'),
	(4,NULL,'Bhavin Kanubhai Dodiya','Bhailakui','Kaniyel','1','1','8980062273',NULL,'Male','04-10-1992','Single','M. C. A','Tata Capital Finance Services Ltd',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_0,y_0/v1546054465/eu3vuls7ftpdlmw0zejp.jpg',1,1,NULL,'2018-12-26 17:41:11','2018-12-29 09:04:26'),
	(5,NULL,'Pratik Kanubhai Dodiya','Bhailakui','Kaniyel','1','1','8980062273',NULL,'Male','25-09-1995','Single','M. Com','Study',NULL,NULL,1,1,NULL,'2018-12-26 17:42:54','2018-12-30 09:22:22'),
	(6,NULL,'Manisha Jigar Amin','Bhailakui','Kapadwanj','1','1','9426726815','8460689469','Female','21-03-1989','Married','M. A','Housewife',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_447,y_31/v1545830106/w670e1l3ht31brx8gxqe.jpg',1,1,NULL,'2018-12-26 18:04:10','2018-12-27 09:18:01'),
	(7,NULL,'Arvindkumar Naranbhai Dodiya','Bhailakui','Ravdavat','1','1','9426726815','9408290464','Male','21-03-1964','Married','10 pass','B. S. N. L',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_0,y_22/v1545907805/u4thn49midyhvyhtao7y.jpg',1,1,NULL,'2018-12-27 08:04:15','2018-12-28 20:39:31'),
	(8,NULL,'Ravikant Parmar','Kadwanj','Kewadiya','1','1','9227487999',NULL,'Male','08-10-1983','Married','B.com','Marking head',NULL,NULL,1,1,NULL,'2018-12-27 14:39:38','2018-12-27 14:41:31'),
	(10,NULL,'Alpeshkumar Govindbhai Dodia','Bhailakui','Navagam','1','1','9913125748',NULL,'Male','19-07-1986','Married','Graduate','Government Job',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_0,y_123/v1545918753/iq5z7syxs23uvdky1mv9.jpg',1,1,NULL,'2018-12-27 19:19:49','2018-12-27 19:22:34'),
	(11,NULL,'Daxaben','Bhailakui','Kapadwanj paru','1','1','9408290464',NULL,'Female','14-12-1972','Married','6 pass','House wife',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_215,w_215,x_313,y_251/v1546010315/xchskye386bxxbiinvp8.jpg',1,1,NULL,'2018-12-28 20:42:59','2018-12-28 20:48:36'),
	(12,NULL,'Hardik Solanki','Badarpur','Sorana','1','1','9408290464','7998636925','Male','14-01-1998','Single','E.C Engineer','Study',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_0,y_0/v1546011459/cssidfupbgocse3faiue.jpg',1,1,NULL,'2018-12-28 20:59:32','2018-12-28 22:06:05'),
	(13,NULL,'Rajesh Patel','Ravdavat','Mudgami','1','1','9426726815','9898326032','Male','10-08-1971','Married','M. A','Private Job',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_125,y_0/v1546096781/p4lkzdpjr6ssbiaciojq.jpg',1,1,NULL,'2018-12-28 21:16:59','2018-12-29 20:49:42'),
	(16,NULL,'SOLANKI HARDIKKUMAR PIYUSHBHAI','Badarpur','Sorna','1','1','7698636925',NULL,'Male','14-01-1998','Single','B.E.','Study',NULL,NULL,1,1,NULL,'2018-12-28 21:57:16','2018-12-28 21:58:26'),
	(19,NULL,'Ratilal Gohil','Kapadwanj','Kalaji','1','1','9426726815','9925177876','Male','02-02-1968','Single','10 pass','Rikshaw driver',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_0,y_25/v1546089523/hntrvjbi8clv8xekpo8j.jpg',1,1,NULL,'2018-12-29 08:03:28','2018-12-29 18:48:43'),
	(21,NULL,'Pratik Kanubhai Dodiya','Bhailakui','Kaniyel','1','1','8735905384','7874270388','Male','25-09-1995','Single','M. Com','Study',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_0,y_158/v1546057823/ktdwcsaa9cegrzyfppyd.jpg',1,1,NULL,'2018-12-29 09:48:46','2018-12-29 10:21:00'),
	(23,NULL,'Parmar Vikas Vinodbhai','Antisar','Kanipoor','1','1','8140920231',NULL,'Male','23-02-1999','Single','12 pass, Engineering','Studying',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_99,y_0/v1546072671/von54nq27wsnvih0spgh.jpg',1,1,NULL,'2018-12-29 13:41:09','2018-12-29 14:07:52'),
	(24,NULL,'Darshan makvana','Hamirpura','Torna','1','1','7048615342',NULL,'Male','30-08-1999','Single','Diploma running 12th running','Business intrasted',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_0,y_0/v1546073211/dyf4et5pmhryxktkiowh.jpg',1,1,NULL,'2018-12-29 13:55:46','2018-12-29 14:18:33'),
	(25,NULL,'Patel anil kumar rameshbhai','Devkarana movada','Kanipur','1','1','9723025712',NULL,'Male','14-01-1989','Single','10  ITI','Job BSNL Electrician',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_341,w_341,x_378,y_2/v1546073007/lbx8ouzuuzybgjtu0mh8.jpg',1,1,NULL,'2018-12-29 14:04:10','2018-12-29 17:01:42'),
	(26,NULL,'Parmar jayeshkumar parsottambhai','Kalaji','Kanipur','1','6','9924241562',NULL,'Male','18-10-1991','Single','12','Job arvid mill naroda rod amdavad',NULL,NULL,1,1,NULL,'2018-12-29 15:21:53','2018-12-29 15:24:42'),
	(27,NULL,'Parmar jayeshkumar parsottambhai','Kalaji','Kanipur','1','1','9924241562',NULL,'Male','18-10-1991','Single','12','Arvid mill naroda rod amdavad',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_0,y_47/v1546078051/qimmsqpz2ijkshrzfeno.jpg',1,1,NULL,'2018-12-29 15:25:13','2018-12-29 15:37:32'),
	(28,NULL,'Harish Rathod','Narnamuvada','Sonipura','1','1','9687002727',NULL,'Male','06-12-1982','Married','Graduate','Sales Manager',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_0,y_0/v1546083318/qugiybgfmsmvmwxmllmw.jpg',1,1,NULL,'2018-12-29 17:00:05','2018-12-29 20:56:21'),
	(29,NULL,'Rathod Hardik','Antisar','Kapadvanj','1','1','7600055594',NULL,'Male','17-09-1998','Single','b.tech','study',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_0,y_4/v1546093223/pxlpd7nupwy2botulznh.jpg',1,1,NULL,'2018-12-29 19:34:16','2018-12-29 19:50:24'),
	(30,NULL,'Rajendra D Vankar','Narnamuwada','Sultanpura','1','1','7567308428',NULL,'Male','05-07-1987','Single','10 Pass','Press',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_0,y_0/v1546097884/qbeckqgatgkgmbyhmjm7.jpg',1,1,NULL,'2018-12-29 20:59:22','2018-12-30 11:06:13'),
	(31,NULL,'રાજેશભાઈ પુંજાલાલ પટેલ','રવદાવત','સરસપુર','1','1','7984760945',NULL,'Male','26-08-1971','Married','બી.એ.','ફોટોશોપ વર્ક',NULL,'https://res.cloudinary.com/marusamaj/image/upload/c_crop,h_480,w_480,x_497,y_811/v1546100403/nwjmdmbl2n93jbibdmqh.jpg',1,1,NULL,'2018-12-29 21:40:32','2018-12-29 21:50:05'),
	(32,NULL,'Sudha Rathod','Narnamuvada','Ratanpura','1','1','9687002727',NULL,'Female','14-10-1983','Married','12','Nurs',NULL,NULL,1,1,NULL,'2018-12-30 10:47:41','2018-12-30 11:00:28'),
	(33,NULL,'Vinodbhai Rathod','Narnamuvada','Sonipura','1','1','9687002727',NULL,'Male','04-08-1980','Married','10','Kheti',NULL,NULL,1,1,NULL,'2018-12-30 10:57:50','2018-12-30 11:07:50'),
	(35,NULL,'MUKESH  PARMAR','Kapadvanj','Kaniyel','1','1','8160523639',NULL,'Male','09-11-1982','Single','12','C. R. P. F central  govt. Ma job',NULL,NULL,1,1,NULL,'2018-12-30 11:35:37','2018-12-30 11:37:14');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
