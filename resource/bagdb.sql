-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.31 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.2.0.6576
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for bagdb
CREATE DATABASE IF NOT EXISTS `bagdb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bagdb`;

-- Dumping structure for table bagdb.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `email` varchar(100) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `verification_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.admin: ~0 rows (approximately)
INSERT INTO `admin` (`email`, `fname`, `lname`, `verification_code`) VALUES
	('tharunidilenya@gmail.com', 'Tharu', 'Dilini', '668188f5c24ce');

-- Dumping structure for table bagdb.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_brand_category1_idx` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.brand: ~4 rows (approximately)
INSERT INTO `brand` (`id`, `name`, `category_id`) VALUES
	(1, 'Lovevook', 3),
	(2, 'Lovevook', 2),
	(3, 'Adidas', 1),
	(4, 'Lovevook', 1);

-- Dumping structure for table bagdb.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qty` int DEFAULT NULL,
  `product_id` int NOT NULL,
  `users_email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_product1_idx` (`product_id`),
  KEY `fk_cart_users1_idx` (`users_email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.cart: ~4 rows (approximately)
INSERT INTO `cart` (`id`, `qty`, `product_id`, `users_email`) VALUES
	(2, 1, 4, 'methmasashini@gmail.com'),
	(7, 1, 6, 'vishmakaWijerathne@gmail.com'),
	(9, 1, 12, 'methmasashini@gmail.com');

-- Dumping structure for table bagdb.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.category: ~2 rows (approximately)
INSERT INTO `category` (`id`, `name`) VALUES
	(1, 'Laptop Bags'),
	(2, 'Shoulder Bags'),
	(3, 'Traveling');

-- Dumping structure for table bagdb.category_has_brand
CREATE TABLE IF NOT EXISTS `category_has_brand` (
  `category_id` int NOT NULL,
  `brand_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_category_has_brand_brand1_idx` (`brand_id`),
  KEY `fk_category_has_brand_category1_idx` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.category_has_brand: ~2 rows (approximately)
INSERT INTO `category_has_brand` (`category_id`, `brand_id`, `id`) VALUES
	(1, 3, 1),
	(2, 1, 2),
	(3, 2, 3);

-- Dumping structure for table bagdb.chat
CREATE TABLE IF NOT EXISTS `chat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text,
  `date_time` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `from` varchar(100) DEFAULT NULL,
  `to` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from` (`from`),
  KEY `to` (`to`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.chat: ~1 rows (approximately)
INSERT INTO `chat` (`id`, `content`, `date_time`, `status`, `from`, `to`) VALUES
	(1, 'hi', '2023-04-02 13:24:47', 0, 'methmasashini@gmail.com', 'methmasashini@gmail.com'),
	(2, 's', '2023-04-02 13:25:48', 0, 'methmasashini@gmail.com', 'methmasashini@gmail.com'),
	(3, 'hi', '2023-04-03 02:09:18', 0, 'methmasashini@gmail.com', 'methmasashini@gmail.com');

-- Dumping structure for table bagdb.city
CREATE TABLE IF NOT EXISTS `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `district_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_city_district1_idx` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.city: ~6 rows (approximately)
INSERT INTO `city` (`id`, `name`, `district_id`) VALUES
	(1, ' Attanagalla', 1),
	(2, ' Biyagama', 1),
	(3, 'Divulapitiy', 1),
	(4, 'Dompe', 1),
	(5, 'Battaramulla', 2),
	(6, 'Maharagama', 2);

-- Dumping structure for table bagdb.color
CREATE TABLE IF NOT EXISTS `color` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.color: ~5 rows (approximately)
INSERT INTO `color` (`id`, `name`) VALUES
	(1, 'Black'),
	(2, 'Blue'),
	(3, 'White'),
	(4, 'Brown'),
	(5, 'Ash');

-- Dumping structure for table bagdb.condition
CREATE TABLE IF NOT EXISTS `condition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.condition: ~2 rows (approximately)
INSERT INTO `condition` (`id`, `name`) VALUES
	(1, 'Waterproof'),
	(2, 'nonwaterproof');

-- Dumping structure for table bagdb.district
CREATE TABLE IF NOT EXISTS `district` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `province_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_district_province1_idx` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.district: ~21 rows (approximately)
INSERT INTO `district` (`id`, `name`, `province_id`) VALUES
	(1, 'Gampaha', 1),
	(2, 'Colombo', 1),
	(3, 'Kaluthara', 1),
	(4, 'Kandy', 2),
	(5, 'Matale', 2),
	(6, 'Nuwara eliya', 2),
	(7, 'Anuradhapura', 7),
	(8, 'Polonnaruwa', 7),
	(9, 'Jaffna', 8),
	(10, 'Kilinochchi', 8),
	(11, 'Mannar', 8),
	(12, 'Vavuniya', 8),
	(13, 'Mulathivu', 8),
	(14, 'Ampara', 9),
	(15, 'Batticaloa', 9),
	(16, 'Trincomale', 9),
	(17, 'Kurunagala', 6),
	(18, 'Puttalam', 6),
	(19, 'Hambanthota', 3),
	(20, 'Mathara', 3),
	(21, 'Galle', 3);

-- Dumping structure for table bagdb.gender
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gender_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.gender: ~2 rows (approximately)
INSERT INTO `gender` (`id`, `gender_name`) VALUES
	(1, 'Male'),
	(2, 'Female');

-- Dumping structure for table bagdb.images
CREATE TABLE IF NOT EXISTS `images` (
  `code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`code`),
  KEY `fk_images_product1_idx` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.images: ~9 rows (approximately)
INSERT INTO `images` (`code`, `product_id`) VALUES
	('resource//bag_images//Clasic BagPack_0_641cf770156e8.jpeg', 1),
	('resource//bag_images//to1.jpg', 2),
	('resource//bag_images//t1.jpg', 3),
	('resource//bag_images//b2.jpeg', 4),
	('resource//bag_images//b3.jpeg', 5),
	('resource//bag_images//Lap BagPack_0_6429da994a827.jpeg', 6),
	('resource//bag_images//DD Bag_0_6429dddaee25b.jpeg', 7),
	('resource//bag_images//Tote_0_6429e6799b108.jpeg', 8),
	('resource//bag_images//Hand Bag_0_6429e688f0158.jpeg', 9),
	('resource//bag_images//Women Tote Bag_0_6429e6a4e3324.jpeg', 10),
	('resource//bag_images//asd_0_669371342c624.jpeg', 11),
	('resource//bag_images//Laptop Bag_0_6693753fc834f.jpeg', 12);

-- Dumping structure for table bagdb.invoice
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int DEFAULT NULL,
  `order_id` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `total` double NOT NULL,
  `qty` int NOT NULL,
  `status` int NOT NULL,
  `product_id` int NOT NULL,
  `users_email` varchar(100) DEFAULT NULL,
  KEY `product_id` (`product_id`),
  KEY `users_email` (`users_email`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `users_email` FOREIGN KEY (`users_email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.invoice: ~1 rows (approximately)
INSERT INTO `invoice` (`id`, `order_id`, `date`, `total`, `qty`, `status`, `product_id`, `users_email`) VALUES
	(1, '124578', '2023-04-02 15:33:32', 7550, 1, 0, 5, 'methmasashini@gmail.com');

-- Dumping structure for table bagdb.model
CREATE TABLE IF NOT EXISTS `model` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.model: ~4 rows (approximately)
INSERT INTO `model` (`id`, `name`) VALUES
	(1, 'Bag Pack'),
	(2, 'Duffle Bags'),
	(3, 'Messenger Bags'),
	(4, 'Sack Bags'),
	(5, 'Tote Bags');

-- Dumping structure for table bagdb.model_has_brand
CREATE TABLE IF NOT EXISTS `model_has_brand` (
  `model_id` int NOT NULL,
  `brand_id` int NOT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_model_has_brand_brand1_idx` (`brand_id`),
  KEY `fk_model_has_brand_model1_idx` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.model_has_brand: ~4 rows (approximately)
INSERT INTO `model_has_brand` (`model_id`, `brand_id`, `id`) VALUES
	(5, 1, 1),
	(3, 3, 2),
	(1, 3, 3),
	(1, 4, 4);

-- Dumping structure for table bagdb.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `description` text,
  `title` varchar(50) DEFAULT NULL,
  `datetime_added` datetime DEFAULT NULL,
  `delivery_fee_colombo` double DEFAULT NULL,
  `delivery_fee_other` double DEFAULT NULL,
  `status_id` int NOT NULL,
  `model_has_brand_id` int NOT NULL,
  `condition_id` int NOT NULL,
  `color_id` int NOT NULL,
  `users_email` varchar(100) NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_status1_idx` (`status_id`),
  KEY `fk_product_model_has_brand1_idx` (`model_has_brand_id`),
  KEY `fk_product_condition1_idx` (`condition_id`),
  KEY `fk_product_color1_idx` (`color_id`),
  KEY `fk_product_users1_idx` (`users_email`),
  KEY `fk_product_category1_idx` (`category_id`),
  CONSTRAINT `fk_product_model_has_brand1` FOREIGN KEY (`model_has_brand_id`) REFERENCES `model_has_brand` (`id`),
  CONSTRAINT `fk_product_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.product: ~12 rows (approximately)
INSERT INTO `product` (`id`, `price`, `qty`, `description`, `title`, `datetime_added`, `delivery_fee_colombo`, `delivery_fee_other`, `status_id`, `model_has_brand_id`, `condition_id`, `color_id`, `users_email`, `category_id`) VALUES
	(1, 5000, 9, 'Dimensions 15cm x 32cm x 46cm', 'Clasic BagPack', '2023-01-17 05:38:22', 350, 350, 1, 3, 1, 1, 'methmasashini@gmail.com', 1),
	(2, 3500, 15, 'Leather top handle satchel shoulder Tote Bags', 'Tote Bag', '2023-01-17 05:38:24', 350, 350, 1, 1, 1, 3, 'methmasashini@gmail.com', 2),
	(3, 6500, 8, 'A ROOMY DUFFEL FOR ATHLETES ON THE GO, MADE IN PART WITH RECYCLED MATERIALS.', 'Training Duffel Bag', '2023-01-17 05:56:06', 350, 350, 1, 2, 1, 1, 'methmasashini@gmail.com', 3),
	(4, 8000, 5, 'COLOURS, FIT 14/15.6/17 INCH ', 'Bag Pack', '2023-01-29 06:52:42', 350, 350, 1, 3, 1, 5, 'methmasashini@gmail.com', 1),
	(5, 7200, 3, 'Lovevook Mini Fashion Bagpack For women ', 'Mini Fashion BagPack', '2023-01-29 07:04:03', 350, 350, 1, 4, 1, 3, 'methmasashini@gmail.com', 1),
	(6, 4500, 9, 'Dimensions 15cm x 32cm x 46cm', 'Lap BagPack', '2023-04-03 01:12:17', 350, 350, 1, 4, 1, 5, 'methmasashini@gmail.com', 1),
	(7, 6000, 14, 'Leather top handle Bags', 'DD Bag', '2023-04-03 01:19:43', 350, 350, 1, 3, 1, 1, 'methmasashini@gmail.com', 1),
	(8, 6500, 10, 'ytuytuyu', 'Tote', NULL, 350, 350, 1, 1, 1, 1, 'methmasashini@gmail.com', 2),
	(9, 1200, 10, 'Dimensions 15cm x 32cm x 46cm', 'Hand Bag', '2023-04-03 02:00:23', 350, 350, 1, 1, 1, 1, 'methmasashini@gmail.com', 2),
	(10, 4500, 9, 'Dimensions 15cm x 32cm x 46cm', 'Women Tote Bag', '2023-04-03 02:01:57', 350, 350, 1, 1, 1, 1, 'methmasashini@gmail.com', 2),
	(11, 100, 3, 'hhgnhgnhnhb', 'asd', '2024-07-14 12:03:24', 100, 100, 2, 3, 1, 1, 'methmasashini@gmail.com', 1),
	(12, 5000, 3, 'gfgtfgfd', 'Laptop Bag', '2024-07-14 12:20:39', 100, 100, 1, 3, 1, 1, 'methmasashini@gmail.com', 1);

-- Dumping structure for table bagdb.profile_image
CREATE TABLE IF NOT EXISTS `profile_image` (
  `path` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `users_email` varchar(100) NOT NULL,
  PRIMARY KEY (`path`),
  KEY `fk_profile_image_users1_idx` (`users_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.profile_image: ~1 rows (approximately)
INSERT INTO `profile_image` (`path`, `users_email`) VALUES
	('resource/profile_img/Methma_642a913531d24.jpeg', 'methmasashini@gmail.com');

-- Dumping structure for table bagdb.province
CREATE TABLE IF NOT EXISTS `province` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.province: ~8 rows (approximately)
INSERT INTO `province` (`id`, `name`) VALUES
	(1, 'Western Province'),
	(2, 'Central Province'),
	(3, 'Southern Province'),
	(4, 'Uva Province'),
	(5, 'Sabaragamuwa Province'),
	(6, 'North Western Province'),
	(7, 'North Central Province'),
	(8, 'Northern Province'),
	(9, 'Eastern Province');

-- Dumping structure for table bagdb.recent
CREATE TABLE IF NOT EXISTS `recent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `users_email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_recent_product1_idx` (`product_id`),
  KEY `fk_recent_users1_idx` (`users_email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.recent: ~7 rows (approximately)
INSERT INTO `recent` (`id`, `product_id`, `users_email`) VALUES
	(1, 1, 'methmasashini@gmail.com'),
	(2, 4, 'methmasashini@gmail.com'),
	(3, 5, 'methmasashini@gmail.com'),
	(4, 5, 'methmasashini@gmail.com'),
	(5, 7, 'methmasashini@gmail.com'),
	(6, 7, 'methmasashini@gmail.com'),
	(7, 7, 'methmasashini@gmail.com'),
	(8, 5, 'vishmakaWijerathne@gmail.com'),
	(9, 5, 'methmasashini@gmail.com');

-- Dumping structure for table bagdb.status
CREATE TABLE IF NOT EXISTS `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.status: ~2 rows (approximately)
INSERT INTO `status` (`id`, `name`) VALUES
	(1, 'In Stock'),
	(2, 'Out of Stock');

-- Dumping structure for table bagdb.users
CREATE TABLE IF NOT EXISTS `users` (
  `email` varchar(100) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `join_date` datetime DEFAULT NULL,
  `verification_code` varchar(20) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `gender_id` int NOT NULL,
  PRIMARY KEY (`email`),
  KEY `fk_users_gender_idx` (`gender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.users: ~0 rows (approximately)
INSERT INTO `users` (`email`, `fname`, `lname`, `password`, `mobile`, `join_date`, `verification_code`, `status`, `gender_id`) VALUES
	('methmasashi9@gmail.com', 'Methma', 'Dodanmulla', '1234567', '0714569789', '2023-04-03 01:52:03', '6429ebd4d4209', 1, 2),
	('methmasashini@gmail.com', 'Methma', 'Dodanmulla', '12345', '0783676224', '2023-01-21 22:45:34', '6681b4ebeb2b9', 1, 2),
	('vishmakaWijerathne@gmail.com', 'Anupa', 'Vishmaka', '12367', '0716944341', '2024-04-01 01:47:53', '64465646', 1, 1);

-- Dumping structure for table bagdb.users_has_address
CREATE TABLE IF NOT EXISTS `users_has_address` (
  `users_email` varchar(100) NOT NULL,
  `city_id` int NOT NULL,
  `line1` varchar(45) DEFAULT NULL,
  `line2` varchar(45) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_users_has_city_city1_idx` (`city_id`),
  KEY `fk_users_has_city_users1_idx` (`users_email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.users_has_address: ~0 rows (approximately)
INSERT INTO `users_has_address` (`users_email`, `city_id`, `line1`, `line2`, `postal_code`, `id`) VALUES
	('methmasashini@gmail.com', 2, 'Delgoda', 'Udupila Road', '11226', 3);

-- Dumping structure for table bagdb.watchlist
CREATE TABLE IF NOT EXISTS `watchlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `users_email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_watchlist_product1_idx` (`product_id`),
  KEY `fk_watchlist_users1_idx` (`users_email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table bagdb.watchlist: ~2 rows (approximately)
INSERT INTO `watchlist` (`id`, `product_id`, `users_email`) VALUES
	(4, 5, 'methmasashini@gmail.com'),
	(5, 4, 'methmasashini@gmail.com');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
