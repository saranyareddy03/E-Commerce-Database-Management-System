-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: commerce
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `created_date` date DEFAULT (curdate()),
  PRIMARY KEY (`cart_id`),
  UNIQUE KEY `customer_id` (`customer_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,'2026-07-22'),(2,2,'2026-07-22'),(3,3,'2026-07-22'),(4,4,'2026-07-22'),(5,5,'2026-07-22'),(6,6,'2026-07-22'),(7,7,'2026-07-22'),(8,8,'2026-07-22'),(9,9,'2026-07-22'),(10,10,'2026-07-22');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `cart_item_id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`cart_item_id`),
  UNIQUE KEY `cart_id` (`cart_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `cart_items_chk_1` CHECK ((`quantity` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (1,1,1,1),(2,1,4,2),(3,2,5,3),(4,2,8,1),(5,3,2,1),(6,3,15,2),(7,4,3,1),(8,5,6,2),(9,6,9,3),(10,7,10,1),(11,8,11,1),(12,9,13,2),(13,10,14,1);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Electronics','Electronic gadgets and devices'),(2,'Fashion','Clothing and fashion accessories'),(3,'Books','Educational and story books'),(4,'Home Appliances','Appliances for home use'),(5,'Sports','Sports equipment and accessories');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT (curdate()),
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Rahul Sharma','rahul@gmail.com','9876543210','rahul123','Madhapur','Hyderabad','2026-07-22'),(2,'Priya Reddy','priya@gmail.com','9876543211','priya123','Beach Road','Visakhapatnam','2026-07-22'),(3,'Amit Kumar','amit@gmail.com','9876543212','amit123','Whitefield','Bangalore','2026-07-22'),(4,'Sneha Patel','sneha@gmail.com','9876543213','sneha123','T Nagar','Chennai','2026-07-22'),(5,'Kiran Rao','kiran@gmail.com','9876543214','kiran123','Andheri','Mumbai','2026-07-22'),(6,'Anjali Singh','anjali@gmail.com','9876543215','anjali123','Rohini','Delhi','2026-07-22'),(7,'Ravi Teja','ravi@gmail.com','9876543216','ravi123','Benz Circle','Vijayawada','2026-07-22'),(8,'Pooja Das','pooja@gmail.com','9876543217','pooja123','Salt Lake','Kolkata','2026-07-22'),(9,'Vikas Gupta','vikas@gmail.com','9876543218','vikas123','Hinjewadi','Pune','2026-07-22'),(10,'Meena Joshi','meena@gmail.com','9876543219','meena123','Malviya Nagar','Jaipur','2026-07-22');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `delivery_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `delivery_address` varchar(255) NOT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `delivery_partner` varchar(100) DEFAULT NULL,
  `expected_delivery_date` date DEFAULT NULL,
  `actual_delivery_date` date DEFAULT NULL,
  `delivery_status` varchar(30) DEFAULT 'Processing',
  PRIMARY KEY (`delivery_id`),
  UNIQUE KEY `order_id` (`order_id`),
  UNIQUE KEY `tracking_number` (`tracking_number`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,1,'Madhapur, Hyderabad','TRK10001','BlueDart','2026-07-05','2026-07-04','Delivered'),(2,2,'Beach Road, Visakhapatnam','TRK10002','Delhivery','2026-07-08',NULL,'Processing'),(3,3,'Whitefield, Bangalore','TRK10003','BlueDart','2026-07-07','2026-07-06','Delivered'),(4,4,'T Nagar, Chennai','TRK10004','DTDC','2026-07-10',NULL,'Shipped'),(5,5,'Andheri, Mumbai','TRK10005','Delhivery','2026-07-11',NULL,'Processing'),(6,6,'Rohini, Delhi','TRK10006','Ecom Express','2026-07-12',NULL,'Processing'),(7,7,'Benz Circle, Vijayawada','TRK10007','BlueDart','2026-07-11','2026-07-10','Delivered'),(8,8,'Salt Lake, Kolkata','TRK10008','DTDC','2026-07-12','2026-07-11','Delivered'),(9,9,'Hinjewadi, Pune','TRK10009','Delhivery','2026-07-15',NULL,'Processing'),(10,10,'Malviya Nagar, Jaipur','TRK10010','BlueDart','2026-07-14','2026-07-13','Delivered');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `order_items_chk_1` CHECK ((`quantity` > 0)),
  CONSTRAINT `order_items_chk_2` CHECK ((`price` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,75000.00),(2,1,4,2,2500.00),(3,2,5,3,1200.00),(4,2,8,1,850.00),(5,3,2,1,95000.00),(6,3,15,2,900.00),(7,4,3,1,65000.00),(8,5,6,2,1800.00),(9,6,9,3,650.00),(10,7,10,1,700.00),(11,8,11,1,35000.00),(12,9,13,2,3500.00),(13,10,14,1,4500.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_date` date DEFAULT (curdate()),
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'Confirmed',
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `orders_chk_1` CHECK ((`total_amount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2026-07-01',80000.00,'Delivered'),(2,2,'2026-07-02',4450.00,'Pending'),(3,3,'2026-07-03',96800.00,'Delivered'),(4,4,'2026-07-04',65000.00,'Shipped'),(5,5,'2026-07-05',3600.00,'Confirmed'),(6,6,'2026-07-06',1950.00,'Pending'),(7,7,'2026-07-07',700.00,'Delivered'),(8,8,'2026-07-08',35000.00,'Delivered'),(9,9,'2026-07-09',7000.00,'Confirmed'),(10,10,'2026-07-10',4500.00,'Delivered');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `payment_date` date DEFAULT (curdate()),
  `payment_mode` varchar(30) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `order_id` (`order_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'2026-07-01','UPI',80000.00,'Paid'),(2,2,'2026-07-02','Cash on Delivery',4450.00,'Pending'),(3,3,'2026-07-03','Credit Card',96800.00,'Paid'),(4,4,'2026-07-04','Debit Card',65000.00,'Paid'),(5,5,'2026-07-05','UPI',3600.00,'Paid'),(6,6,'2026-07-06','Net Banking',1950.00,'Pending'),(7,7,'2026-07-07','UPI',700.00,'Paid'),(8,8,'2026-07-08','Credit Card',35000.00,'Paid'),(9,9,'2026-07-09','Cash on Delivery',7000.00,'Pending'),(10,10,'2026-07-10','Debit Card',4500.00,'Paid');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `products_chk_1` CHECK ((`price` > 0)),
  CONSTRAINT `products_chk_2` CHECK ((`stock` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Samsung Galaxy S24','Samsung',75000.00,20),(2,1,'iPhone 16','Apple',95000.00,15),(3,1,'Dell Laptop','Dell',65000.00,10),(4,1,'Boat Earbuds','Boat',2500.00,50),(5,2,'Men T-Shirt','Puma',1200.00,100),(6,2,'Women Kurti','Biba',1800.00,60),(7,2,'Sports Shoes','Nike',5500.00,40),(8,3,'Java Programming','Oracle Press',850.00,75),(9,3,'MySQL Guide','Pearson',650.00,55),(10,3,'Python Basics','McGraw Hill',700.00,50),(11,4,'LG Refrigerator','LG',35000.00,8),(12,4,'Samsung Washing Machine','Samsung',28000.00,12),(13,4,'Prestige Cooker','Prestige',3500.00,30),(14,5,'Cricket Bat','SG',4500.00,20),(15,5,'Football','Nivia',900.00,35);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-04 22:09:11
