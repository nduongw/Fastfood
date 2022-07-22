-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: fastfood2
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'chicken'),(2,'rice + spaghetti'),(3,'burger'),(4,'drink'),(5,'dessert'),(6,'side dish');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combos`
--

DROP TABLE IF EXISTS `combos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combos` (
  `combo_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(500) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`combo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combos`
--

LOCK TABLES `combos` WRITE;
/*!40000 ALTER TABLE `combos` DISABLE KEYS */;
/*!40000 ALTER TABLE `combos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dishes`
--

DROP TABLE IF EXISTS `dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dishes` (
  `dish_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `category_id` int NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` int NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`dish_id`),
  KEY `fk_dish_category_idx` (`category_id`),
  CONSTRAINT `fk_dish_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishes`
--

LOCK TABLES `dishes` WRITE;
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
INSERT INTO `dishes` VALUES (351,'Cocacola',4,'A refreshing drink to complement your dish',15000,'https://file.hstatic.net/200000443651/collection/artboard_4_copysunsoo-shippingstory1_a391d792a74741e2826100c5d25be626_large.jpg'),(352,'Sprite',4,NULL,15000,'https://images.unsplash.com/photo-1606168094336-48f205276929?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHNvZnQlMjBkcmlua3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),(353,'Fanta',4,NULL,15000,'https://images.unsplash.com/photo-1628200523809-1390b4f36c1e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTZ8fHNvZnQlMjBkcmlua3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),(354,'Dasani',4,NULL,10000,'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTA3fHxzb2Z0JTIwZHJpbmt8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),(355,'Iced tea',4,NULL,20000,'https://images.unsplash.com/photo-1506408656147-dab2bc936117?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjJ8fHNvZnQlMjBkcmlua3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),(356,'Strawberry Smoothie',4,NULL,35000,'https://file.hstatic.net/200000443651/collection/artboard_4_copysunsoo-shippingstory1_a391d792a74741e2826100c5d25be626_large.jpg'),(357,'Mango Smoothie',4,NULL,35000,'https://file.hstatic.net/200000443651/collection/artboard_4_copysunsoo-shippingstory1_a391d792a74741e2826100c5d25be626_large.jpg'),(358,'Hot Chocolate',4,NULL,40000,'https://images.unsplash.com/photo-1502741224143-90386d7f8c82?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzN8fHNvZnQlMjBkcmlua3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),(359,'Strawberry Watermelon Slushie',4,NULL,40000,'https://file.hstatic.net/200000443651/collection/artboard_4_copysunsoo-shippingstory1_a391d792a74741e2826100c5d25be626_large.jpg'),(360,'Tropical Mango Slushie',4,NULL,40000,'https://file.hstatic.net/200000443651/collection/artboard_4_copysunsoo-shippingstory1_a391d792a74741e2826100c5d25be626_large.jpg'),(361,'Burger Mozzarella',3,NULL,59000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/b/u/burger-534x374px_mozzarella-burger_3.png'),(362,'Burger Double Double',3,NULL,58000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/b/u/burger-534x374px_ddouble-burger_1.png'),(363,'Burger Shrimp',3,NULL,49000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/b/u/burger-534x374px_shrimp-burger_1.png'),(364,'Burger Bulgogi',3,NULL,43000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/b/u/burger-534x374px_bulgogi-burger_1.png'),(365,'Burger Highend Chicken',3,NULL,43000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/b/u/burger-534x374px_chicken-burger_1.png'),(366,'Burger Egg Teriyaki Beef',3,NULL,35000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/b/u/burger-534x374px_teriyaki-egg-burger_1.png'),(367,'Burger Fish',3,NULL,33000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/b/u/burger-534x374px_fish-burger_1.png'),(368,'Burger Cheese',3,NULL,33000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/b/u/burger-534x374px_cheese-burger_1.png'),(369,'Burger Teriyaki Beef',3,NULL,30000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/b/u/burger-534x374px_beef-teriyaki-burger_1.png'),(370,'Grilled Chicken - 9 pieces',1,NULL,304000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/c/h/chicken-534x374px_grilled-1_1.png'),(371,'Buffalo Sauce Chicken - 9 pieces',1,NULL,304000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/c/h/chicken-534x374px_buffalo-chicken-1.png'),(372,'H&S Sauce Chicken - 9 pieces',1,NULL,304000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/5/3/534x374px_hs-1.png'),(373,'Cheese Sauce Chicken - 9 pieces',1,NULL,304000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/5/3/534x374px_cheese-1.png'),(374,'Bean Sauce Chicken - 9 pieces',1,NULL,304000,'https://file.hstatic.net/200000443651/collection/artboard_4_copysunsoo-shippingstory1_a391d792a74741e2826100c5d25be626_large.jpg'),(375,'Fried Chicken - 9 pieces',1,NULL,284000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/c/h/chicken-534x374px_fried-1.png'),(376,'Grilled Chicken - 6 pieces',1,NULL,203000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/c/h/chicken-534x374px_grilled-1_1.png'),(377,'Buffalo Sauce Chicken - 6 pieces',1,NULL,203000,'https://file.hstatic.net/200000443651/collection/artboard_4_copysunsoo-shippingstory1_a391d792a74741e2826100c5d25be626_large.jpg'),(378,'H&S Sauce Chicken - 6 pieces',1,NULL,203000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/5/3/534x374px_hs-1.png'),(379,'Cheese Sauce Chicken - 6 pieces',1,NULL,203000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/5/3/534x374px_cheese-1.png'),(380,'Bean Sauce Chicken - 6 pieces',1,NULL,203000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/5/3/534x374px_soybean-1.png'),(381,'Fried Chicken - 6 pieces',1,NULL,191000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/c/h/chicken-534x374px_fried-1.png'),(382,'Grilled Chicken Leg Quarter - 1 piece',1,NULL,48000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/c/h/chicken-534x374px_ganuonggoc4.png'),(383,'Grilled Chiken - 1 piece',1,NULL,37000,'https://file.hstatic.net/200000443651/collection/artboard_4_copysunsoo-shippingstory1_a391d792a74https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/c/h/chicken-534x374px_grilled-1_1.png741e2826100c5d25be626_large.jpg'),(384,'Buffalo Sauce Chicken - 1 piece',1,NULL,37000,'https://file.hstatic.net/200000443651/collection/artboard_4_copysunsoo-shippingstory1_a391d792a74741e2826100c5d25be626_large.jpg'),(385,'H&S Sauce Chicken - 1 piece',1,NULL,37000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/5/3/534x374px_hs-1.png'),(386,'Cheese Sauce Chicken - 1 piece',1,NULL,37000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/5/3/534x374px_cheese-1.png'),(387,'Bean Sauce Chicken - 1 piece',1,NULL,37000,'https://file.hstatic.net/200000443651/collection/artboard_4_copysunsoo-shippingstory1_a391d792a74741e2826100c5d25be626_large.jpg'),(388,'Fried Chicken - 1 piece',1,NULL,35000,'https://file.hstatic.net/200000443651/collection/artboard_4_copysunsoo-shippingstory1_a391d792a74741e2826100c5d25be626_large.jpg'),(389,'Chicken Skewers - 2 pieces',6,NULL,49000,'https://www.thespruceeats.com/thmb/fFY-wqOwGKO16rTH8YwdnSUWoNQ=/2667x2667/smart/filters:no_upscale()/best-twice-cooked-chip-recipe-434891-hero-01-5d90eb5142b042e1b71e2c3bcce9c5c9.jpg'),(390,'Shaken Chicken',6,NULL,42000,'https://www.thespruceeats.com/thmb/fFY-wqOwGKO16rTH8YwdnSUWoNQ=/2667x2667/smart/filters:no_upscale()/best-twice-cooked-chip-recipe-434891-hero-01-5d90eb5142b042e1b71e2c3bcce9c5c9.jpg'),(391,'Shaken Chips',6,NULL,39000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/d/e/dessert-534x374px_shake-potato.png'),(392,'Fish Nugget - 5 pieces',6,NULL,34000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/d/e/dessert-534x374px_fish-nugget_1.png'),(393,'Fried Squid - 5 pieces',6,NULL,34000,'https://www.thespruceeats.com/thmb/fFY-wqOwGKO16rTH8YwdnSUWoNQ=/2667x2667/smart/filters:no_upscale()/best-twice-cooked-chip-recipe-434891-hero-01-5d90ebhttps://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/d/e/dessert-534x374px_squid-ring_2.png5142b042e1b71e2c3bcce9c5c9.jpg'),(394,'Chesse Stick',6,NULL,34000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/d/e/dessert-534x374px_cheese-stick.png'),(395,'French Fries (M)',6,NULL,27000,'https://www.thespruceeats.com/thmb/fFY-wqOwGKO16rTH8YwdnSUWoNQ=/2667x2667/smart/filters:no_upscale()/best-twice-cooked-chip-recipe-434891-hero-01-5d90ebhttps://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/d/e/dessert-534x374px_frenchfries.png5142b042e1b71e2c3bcce9c5c9.jpg'),(396,'Apple Pie',6,NULL,20000,'https://www.thespruceeats.com/thmb/fFY-wqOwGKO16rTH8YwdnSUWoNQ=/2667x2667/smart/filters:no_upscale()/best-twice-cooked-chip-recipe-434891-hero-01-5d90eb5142b042e1b71e2c3bcce9c5c9.jpg'),(397,'Grilled Chicken Leg Quarter with Rice',2,NULL,57000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/c/h/chicken-534x374px_ganuonggoc4.png'),(398,'Chicken Nuggets with Rice',2,NULL,44000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/r/i/rice-spaghetti-534x374px._com-gavien_1.png'),(399,'Beef Rice',2,NULL,44000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/r/i/rice-spaghetti-534x374px._com-thitbo_1.png'),(400,'Chicken Soup',2,NULL,12000,'https://images.unsplash.com/photo-1543573852-1a71a6ce19bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fGRlc3NlcnR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),(401,'Milo',2,NULL,18000,'https://images.unsplash.com/photo-1606168094336-48f205276929?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHNvZnQlMjBkcmlua3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60');
/*!40000 ALTER TABLE `dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dishes_combos`
--

DROP TABLE IF EXISTS `dishes_combos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dishes_combos` (
  `combo_id` int NOT NULL,
  `dish_id` int NOT NULL,
  KEY `fk_dishcombodish_idx` (`dish_id`),
  KEY `fk_dishcombocombo_idx` (`combo_id`),
  CONSTRAINT `fk_dishcombocombo` FOREIGN KEY (`combo_id`) REFERENCES `combos` (`combo_id`),
  CONSTRAINT `fk_dishcombodish` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`dish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishes_combos`
--

LOCK TABLES `dishes_combos` WRITE;
/*!40000 ALTER TABLE `dishes_combos` DISABLE KEYS */;
/*!40000 ALTER TABLE `dishes_combos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `user_id` int NOT NULL,
  `dish_id` int NOT NULL,
  KEY `fk_favoriteuser_idx` (`user_id`),
  KEY `fk_favoritedish_idx` (`dish_id`),
  CONSTRAINT `fk_favoritedish` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`dish_id`),
  CONSTRAINT `fk_favoriteuser` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (3,351),(3,352),(6,351),(6,370),(6,370),(6,371),(6,372),(6,370),(6,371),(6,371),(6,380);
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `detail` varchar(500) DEFAULT NULL,
  `rating` int NOT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `fk_feedbackuser_idx` (`user_id`),
  CONSTRAINT `fk_feedbackuser` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipts`
--

DROP TABLE IF EXISTS `receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipts` (
  `receipt_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `status` varchar(45) NOT NULL,
  `time` timestamp NOT NULL,
  `payment` varchar(10) NOT NULL,
  `total_payment` int NOT NULL,
  PRIMARY KEY (`receipt_id`),
  KEY `fk_receiptuser_idx` (`user_id`),
  CONSTRAINT `fk_receiptuser` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9823098 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipts`
--

LOCK TABLES `receipts` WRITE;
/*!40000 ALTER TABLE `receipts` DISABLE KEYS */;
INSERT INTO `receipts` VALUES (909504,6,'0','2022-07-21 09:03:41','1',1520000),(926988,6,'0','2022-07-22 08:11:36','1',2088000),(1744715,6,'0','2022-07-21 09:11:30','1',1520000),(2319551,6,'0','2022-07-22 04:23:02','1',304000),(2918570,6,'0','2022-07-21 09:12:44','1',1520000),(3530569,6,'0','2022-07-22 04:09:56','1',304000),(4012686,6,'0','2022-07-22 03:57:13','1',0),(4199155,6,'0','2022-07-22 04:26:54','1',304000),(4254427,6,'0','2022-07-22 04:24:59','1',304000),(4675851,6,'0','2022-07-21 09:32:53','1',304000),(5600866,6,'0','2022-07-21 09:15:28','1',304000),(6134812,6,'0','2022-07-22 03:54:20','1',0),(6248896,6,'0','2022-07-22 04:19:47','1',304000),(6616224,6,'0','2022-07-21 17:11:36','1',1520000),(6984940,6,'0','2022-07-22 04:16:17','1',304000),(7800782,6,'0','2022-07-22 04:06:39','1',304000),(8032139,6,'0','2022-07-21 17:10:45','1',304000),(8762829,6,'0','2022-07-22 04:35:44','1',304000),(8857107,6,'0','2022-07-22 04:26:02','1',304000),(9823097,6,'0','2022-07-21 19:44:33','1',304000);
/*!40000 ALTER TABLE `receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipts_dishes`
--

DROP TABLE IF EXISTS `receipts_dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipts_dishes` (
  `receipt_id` int NOT NULL,
  `dish_id` int NOT NULL,
  KEY `fk_receiptdish_receipt_idx` (`receipt_id`),
  KEY `fk_receiptdish_dish_idx` (`dish_id`),
  CONSTRAINT `fk_receiptdish_dish` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`dish_id`),
  CONSTRAINT `fk_receiptdish_receipt` FOREIGN KEY (`receipt_id`) REFERENCES `receipts` (`receipt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipts_dishes`
--

LOCK TABLES `receipts_dishes` WRITE;
/*!40000 ALTER TABLE `receipts_dishes` DISABLE KEYS */;
INSERT INTO `receipts_dishes` VALUES (2918570,370),(2918570,371),(2918570,372),(5600866,370),(6616224,370),(6616224,371),(6616224,372),(4199155,374),(8762829,370),(926988,372),(926988,371),(926988,375),(926988,370);
/*!40000 ALTER TABLE `receipts_dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toppings`
--

DROP TABLE IF EXISTS `toppings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `toppings` (
  `topping_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`topping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toppings`
--

LOCK TABLES `toppings` WRITE;
/*!40000 ALTER TABLE `toppings` DISABLE KEYS */;
/*!40000 ALTER TABLE `toppings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toppings_dishes`
--

DROP TABLE IF EXISTS `toppings_dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `toppings_dishes` (
  `topping_id` int NOT NULL,
  `dish_id` int NOT NULL,
  KEY `fk_toppingdish_topping_idx` (`topping_id`),
  KEY `fk_toppingdish_dish_idx` (`dish_id`),
  CONSTRAINT `fk_toppingdish_dish` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`dish_id`),
  CONSTRAINT `fk_toppingdish_topping` FOREIGN KEY (`topping_id`) REFERENCES `toppings` (`topping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toppings_dishes`
--

LOCK TABLES `toppings_dishes` WRITE;
/*!40000 ALTER TABLE `toppings_dishes` DISABLE KEYS */;
/*!40000 ALTER TABLE `toppings_dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `account` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `point` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `membership` int NOT NULL,
  `is_admin` int DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'dungbui1110','root','dungbui1110@gmail.com',0,'Dung',NULL,NULL,'0973658610',0,1),(2,'namduong','root','namduong@gmail.com',3,'Duong',NULL,NULL,'12321312312312',1,1),(3,'hason','root','hason@gmail.com',4,'Son',NULL,NULL,'123123123',1,2),(4,'kinhdivcl','123456*','',0,'',NULL,NULL,'',0,0),(5,'kinhdivcl','123456789*','duong.tn194535@sis.hust.edu.vn',0,'Nam DUong',NULL,NULL,'01283463248',0,0),(6,'hs1221','123456','duong.tn194535@sis.hust.edu.vn',0,'Nam Duong',NULL,NULL,'01234567',0,0),(7,'dungbui1111','123456789','duong@gmail.com',0,'Dung Bui',NULL,NULL,'09875124',0,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-23  6:11:20
