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


-- Dumping database structure for mydb
CREATE DATABASE IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;

-- Dumping structure for table mydb.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `email` varchar(100) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `verification_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.admin: ~1 rows (approximately)
INSERT INTO `admin` (`email`, `fname`, `lname`, `verification_code`) VALUES
	('tharunidilenya@gmail.com', 'Tharuni', 'Dilenya', '6516d912856a9');

-- Dumping structure for table mydb.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_brand_category1_idx` (`category_id`),
  CONSTRAINT `fk_brand_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.brand: ~3 rows (approximately)
INSERT INTO `brand` (`id`, `name`, `category_id`) VALUES
	(1, 'iPhone', 1),
	(2, 'Samsung', 1),
	(3, 'Sony', 1);

-- Dumping structure for table mydb.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qty` int DEFAULT NULL,
  `product_id` int NOT NULL,
  `users_email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_product1_idx` (`product_id`),
  KEY `fk_cart_users1_idx` (`users_email`),
  CONSTRAINT `fk_cart_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_cart_users1` FOREIGN KEY (`users_email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.cart: ~1 rows (approximately)
INSERT INTO `cart` (`id`, `qty`, `product_id`, `users_email`) VALUES
	(16, 1, 17, 'methmasashi9@gmail.com');

-- Dumping structure for table mydb.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.category: ~3 rows (approximately)
INSERT INTO `category` (`id`, `name`) VALUES
	(1, 'Cellphones and Accessories'),
	(2, 'Computers and Tablets'),
	(3, 'Cameras');

-- Dumping structure for table mydb.category_has_brand
CREATE TABLE IF NOT EXISTS `category_has_brand` (
  `category_id` int NOT NULL,
  `brand_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_category_has_brand_brand1_idx` (`brand_id`),
  KEY `fk_category_has_brand_category1_idx` (`category_id`),
  CONSTRAINT `fk_category_has_brand_brand1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `fk_category_has_brand_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.category_has_brand: ~1 rows (approximately)
INSERT INTO `category_has_brand` (`category_id`, `brand_id`, `id`) VALUES
	(1, 1, 1);

-- Dumping structure for table mydb.chat
CREATE TABLE IF NOT EXISTS `chat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `date_time` datetime NOT NULL,
  `status` int NOT NULL,
  `from` varchar(100) NOT NULL,
  `to` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chat_users1_idx` (`from`),
  KEY `fk_chat_users2_idx` (`to`),
  CONSTRAINT `fk_chat_users1` FOREIGN KEY (`from`) REFERENCES `users` (`email`),
  CONSTRAINT `fk_chat_users2` FOREIGN KEY (`to`) REFERENCES `users` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.chat: ~6 rows (approximately)
INSERT INTO `chat` (`id`, `content`, `date_time`, `status`, `from`, `to`) VALUES
	(4, 'sdff', '2023-03-23 11:55:56', 0, 'methmasashi9@gmail.com', 'methmasashi9@gmail.com'),
	(5, 'jkl', '2023-03-23 11:58:59', 0, 'methmasashi9@gmail.com', 'methmasashi9@gmail.com'),
	(6, 'hi', '2023-03-23 11:59:19', 0, 'methmasashi9@gmail.com', 'methmasashi9@gmail.com'),
	(7, 'd', '2023-03-23 15:25:46', 0, 'methmasashi9@gmail.com', 'methmasashi9@gmail.com'),
	(8, 'hi', '2023-03-23 15:51:16', 0, 'methmasashi9@gmail.com', 'methmasashi9@gmail.com'),
	(9, 'hjh', '2023-03-23 15:54:07', 0, 'methmasashi9@gmail.com', 'methmasashi9@gmail.com');

-- Dumping structure for table mydb.city
CREATE TABLE IF NOT EXISTS `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `district_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_city_district1_idx` (`district_id`),
  CONSTRAINT `fk_city_district1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.city: ~4 rows (approximately)
INSERT INTO `city` (`id`, `name`, `district_id`) VALUES
	(1, 'Attanagalla', 1),
	(2, 'Biyagama', 1),
	(3, 'Diulapitiya', 1),
	(4, 'Dompe', 1);

-- Dumping structure for table mydb.color
CREATE TABLE IF NOT EXISTS `color` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.color: ~3 rows (approximately)
INSERT INTO `color` (`id`, `name`) VALUES
	(1, 'Black'),
	(2, 'Blue'),
	(3, 'Red');

-- Dumping structure for table mydb.condition
CREATE TABLE IF NOT EXISTS `condition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.condition: ~2 rows (approximately)
INSERT INTO `condition` (`id`, `name`) VALUES
	(1, 'Brand New'),
	(2, 'Used');

-- Dumping structure for table mydb.district
CREATE TABLE IF NOT EXISTS `district` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `province_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_district_province_idx` (`province_id`),
  CONSTRAINT `fk_district_province` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.district: ~21 rows (approximately)
INSERT INTO `district` (`id`, `name`, `province_id`) VALUES
	(1, 'Gampaha', 1),
	(2, 'Colombo', 1),
	(3, 'Kaluthara', 1),
	(4, 'Kandy', 2),
	(5, 'Matale', 2),
	(6, 'Nuwara Eliya', 2),
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

-- Dumping structure for table mydb.gender
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gender_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.gender: ~2 rows (approximately)
INSERT INTO `gender` (`id`, `gender_name`) VALUES
	(1, 'Male'),
	(2, 'Female');

-- Dumping structure for table mydb.images
CREATE TABLE IF NOT EXISTS `images` (
  `code` varchar(50) NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`code`),
  KEY `fk_images_product1_idx` (`product_id`),
  CONSTRAINT `fk_images_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.images: ~16 rows (approximately)
INSERT INTO `images` (`code`, `product_id`) VALUES
	('resource/mobile_images/samsung.jpg', 2),
	('resource/mobile_images/Xperia_10.jpg', 3),
	('resource/mobile_images/iphoneX.jpg', 4),
	('resource//mobile_images//samsung.jpeg', 7),
	('resource//mobile_images//s.jpg', 8),
	('resource//mobile_images//htc_u.jpg', 9),
	('resource//mobile_images//sam.svg', 10),
	('resource//mobile_images//vivo_y20.svg', 11),
	('resource//mobile_images//i12.jpg', 12),
	('resource//mobile_images//ip.jpg', 13),
	('resource//mobile_images//i.jpg', 14),
	('resource//mobile_images//ww.jpg', 14),
	('resource//mobile_images//www.jpg', 14),
	('resource//mobile_images//so1.jpg', 15),
	('resource//mobile_images//so2.jpg', 16),
	('resource//mobile_images//so3.jpg', 17);

-- Dumping structure for table mydb.invoice
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `date` datetime NOT NULL,
  `total` double NOT NULL,
  `qty` int NOT NULL,
  `status` int NOT NULL,
  `product_id` int NOT NULL,
  `users_email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_product1_idx` (`product_id`),
  KEY `fk_invoice_users1_idx` (`users_email`),
  CONSTRAINT `fk_invoice_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_invoice_users1` FOREIGN KEY (`users_email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.invoice: ~1 rows (approximately)
INSERT INTO `invoice` (`id`, `order_id`, `date`, `total`, `qty`, `status`, `product_id`, `users_email`) VALUES
	(1, '124578', '2023-03-23 12:09:17', 80000, 1, 0, 2, 'methmasashi9@gmail.com');

-- Dumping structure for table mydb.model
CREATE TABLE IF NOT EXISTS `model` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.model: ~6 rows (approximately)
INSERT INTO `model` (`id`, `name`) VALUES
	(1, 'iPhone 12'),
	(2, 'iPhone X'),
	(3, 'iPhone 13'),
	(4, 'iPhone 11'),
	(5, 'Xperia 5'),
	(6, 'S10');

-- Dumping structure for table mydb.model_has_brand
CREATE TABLE IF NOT EXISTS `model_has_brand` (
  `model_id` int NOT NULL,
  `brand_id` int NOT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_model_has_brand_brand1_idx` (`brand_id`),
  KEY `fk_model_has_brand_model1_idx` (`model_id`),
  CONSTRAINT `fk_model_has_brand_brand1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `fk_model_has_brand_model1` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.model_has_brand: ~6 rows (approximately)
INSERT INTO `model_has_brand` (`model_id`, `brand_id`, `id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4),
	(5, 3, 5),
	(6, 2, 6);

-- Dumping structure for table mydb.product
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
  CONSTRAINT `fk_product_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_product_color1` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`),
  CONSTRAINT `fk_product_condition1` FOREIGN KEY (`condition_id`) REFERENCES `condition` (`id`),
  CONSTRAINT `fk_product_model_has_brand1` FOREIGN KEY (`model_has_brand_id`) REFERENCES `model_has_brand` (`id`),
  CONSTRAINT `fk_product_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_product_users1` FOREIGN KEY (`users_email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.product: ~15 rows (approximately)
INSERT INTO `product` (`id`, `price`, `qty`, `description`, `title`, `datetime_added`, `delivery_fee_colombo`, `delivery_fee_other`, `status_id`, `model_has_brand_id`, `condition_id`, `color_id`, `users_email`, `category_id`) VALUES
	(1, 100000, 15, '64GB/128GB/256GB storage no card slot', 'Apple iPhone ', '2022-12-01 11:48:49', 350, 350, 1, 1, 1, 1, 'methmasashi9@gmail.com', 1),
	(2, 80000, 8, '128GB/512GB storage, microSDXC', 'Samsung S10', '2022-12-01 11:51:03', 200, 200, 1, 6, 1, 1, 'methmasashi9@gmail.com', 1),
	(3, 90000, 5, '64GB/128GB 4GB / 6GBRAM GSM', 'Sony Xperia 5', '2022-12-01 11:54:47', 200, 200, 2, 5, 1, 1, 'methmasashi9@gmail.com', 1),
	(4, 50000, 0, '64GB/256GB storage, no card slot', 'Apple iPhone X', '2022-12-01 11:57:43', 200, 200, 1, 2, 1, 1, 'methmasashi9@gmail.com', 1),
	(7, 60000, 5, '64GB/128GB/ storage', 'Samsung S', '2022-12-02 14:07:42', 200, 200, 1, 6, 1, 2, 'methmasashi9@gmail.com', 1),
	(8, 40000, 5, '64GB/128GB storage', 'Samsung S', '2022-12-02 14:10:43', 200, 200, 1, 6, 1, 2, 'methmasashi9@gmail.com', 1),
	(9, 40000, 5, '64GB/128GB storage', 'HTC', '2022-12-02 14:11:30', 200, 200, 1, 6, 1, 2, 'methmasashi9@gmail.com', 1),
	(10, 40000, 5, '64GB/128GB storage', 'Samsung S', '2022-12-02 14:11:41', 200, 200, 1, 6, 1, 2, 'methmasashi9@gmail.com', 1),
	(11, 56000, 5, '64GB/128GB storage', 'Vivo', '2022-12-02 14:12:15', 200, 200, 1, 1, 1, 2, 'methmasashi9@gmail.com', 1),
	(12, 70000, 5, '64GB/128GB storage', 'Apple iPhone', '2022-12-02 14:12:21', 200, 200, 1, 1, 1, 2, 'methmasashi9@gmail.com', 1),
	(13, 40000, 5, '64GB/128GB storage', 'Apple iPhone', '2022-12-02 14:12:30', 200, 200, 1, 1, 1, 2, 'methmasashi9@gmail.com', 1),
	(14, 95000, 5, '64GB/128GB storage', 'Apple iPhone', '2022-12-02 14:12:52', 200, 200, 1, 2, 1, 2, 'methmasashi9@gmail.com', 1),
	(15, 40000, 5, '64GB/128GB storage', 'Sony', '2022-12-02 14:13:55', 200, 200, 1, 5, 1, 2, 'methmasashi9@gmail.com', 1),
	(16, 60000, 6, '64GB/128GB storage', 'Sony', '2022-12-02 14:15:53', 200, 200, 1, 5, 1, 1, 'methmasashi9@gmail.com', 1),
	(17, 60000, 7, '64GB/128GB storage', 'Sony', '2022-12-02 14:19:01', 200, 200, 1, 5, 1, 1, 'methmasashi9@gmail.com', 1);

-- Dumping structure for table mydb.profile_image
CREATE TABLE IF NOT EXISTS `profile_image` (
  `path` varchar(50) NOT NULL,
  `users_email` varchar(100) NOT NULL,
  PRIMARY KEY (`path`),
  KEY `fk_profile_image_users1_idx` (`users_email`),
  CONSTRAINT `fk_profile_image_users1` FOREIGN KEY (`users_email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.profile_image: ~1 rows (approximately)
INSERT INTO `profile_image` (`path`, `users_email`) VALUES
	('resource/profile_img/Methma_637aa86c49a33.jpeg', 'methmasashi9@gmail.com');

-- Dumping structure for table mydb.province
CREATE TABLE IF NOT EXISTS `province` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.province: ~9 rows (approximately)
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

-- Dumping structure for table mydb.recent
CREATE TABLE IF NOT EXISTS `recent` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `users_email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_recent_product1_idx` (`product_id`),
  KEY `fk_recent_users1_idx` (`users_email`),
  CONSTRAINT `fk_recent_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_recent_users1` FOREIGN KEY (`users_email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.recent: ~4 rows (approximately)
INSERT INTO `recent` (`id`, `product_id`, `users_email`) VALUES
	(00000000001, 14, 'methmasashi9@gmail.com'),
	(00000000002, 15, 'methmasashi9@gmail.com'),
	(00000000003, 14, 'methmasashi9@gmail.com'),
	(00000000004, 16, 'methmasashi9@gmail.com');

-- Dumping structure for table mydb.status
CREATE TABLE IF NOT EXISTS `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.status: ~2 rows (approximately)
INSERT INTO `status` (`id`, `name`) VALUES
	(1, 'In Stock'),
	(2, 'Out of Stock');

-- Dumping structure for table mydb.users
CREATE TABLE IF NOT EXISTS `users` (
  `email` varchar(100) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `joined_date` datetime DEFAULT NULL,
  `verification_code` varchar(20) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `gender_id` int NOT NULL,
  PRIMARY KEY (`email`),
  KEY `fk_users_gender1_idx` (`gender_id`),
  CONSTRAINT `fk_users_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.users: ~2 rows (approximately)
INSERT INTO `users` (`email`, `fname`, `lname`, `password`, `mobile`, `joined_date`, `verification_code`, `status`, `gender_id`) VALUES
	('methmasashi9@gmail.com', 'Methma', 'Sashini', '12345', '0783676224', '2022-11-21 00:39:55', NULL, 1, 2),
	('thrushi@gmail.com', 'udani', 'imak', 'qwert', '0712845693', '2023-01-07 11:28:40', NULL, 1, 2);

-- Dumping structure for table mydb.users_has_address
CREATE TABLE IF NOT EXISTS `users_has_address` (
  `users_email` varchar(100) NOT NULL,
  `city_id` int NOT NULL,
  `line1` varchar(45) DEFAULT NULL,
  `line2` varchar(45) DEFAULT NULL,
  `postal_code` varchar(5) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_users_has_city_city1_idx` (`city_id`),
  KEY `fk_users_has_city_users1_idx` (`users_email`),
  CONSTRAINT `fk_users_has_city_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_users_has_city_users1` FOREIGN KEY (`users_email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.users_has_address: ~1 rows (approximately)
INSERT INTO `users_has_address` (`users_email`, `city_id`, `line1`, `line2`, `postal_code`, `id`) VALUES
	('methmasashi9@gmail.com', 2, 'Udupila', 'Delgoda', '11257', 1);

-- Dumping structure for table mydb.watchlist
CREATE TABLE IF NOT EXISTS `watchlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `users_email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_watchlist_product1_idx` (`product_id`),
  KEY `fk_watchlist_users1_idx` (`users_email`),
  CONSTRAINT `fk_watchlist_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_watchlist_users1` FOREIGN KEY (`users_email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mydb.watchlist: ~1 rows (approximately)
INSERT INTO `watchlist` (`id`, `product_id`, `users_email`) VALUES
	(7, 17, 'methmasashi9@gmail.com');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
