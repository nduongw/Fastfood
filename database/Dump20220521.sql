-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: fastfood
-- ------------------------------------------------------
-- Server version	8.0.29

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
INSERT INTO `dishes` VALUES (351,'Cocacola',4,'A refreshing drink to complement your dish',15000),(352,'Sprite',4,NULL,15000),(353,'Fanta',4,NULL,15000),(354,'Dasani',4,NULL,10000),(355,'Iced tea',4,NULL,20000),(356,'Strawberry Smoothie',4,NULL,35000),(357,'Mango Smoothie',4,NULL,35000),(358,'Hot Chocolate',4,NULL,40000),(359,'Strawberry Watermelon Slushie',4,NULL,40000),(360,'Tropical Mango Slushie',4,NULL,40000),(361,'Burger Mozzarella',3,NULL,59000),(362,'Burger Double Double',3,NULL,58000),(363,'Burger Shrimp',3,NULL,49000),(364,'Burger Bulgogi',3,NULL,43000),(365,'Burger Highend Chicken',3,NULL,43000),(366,'Burger Egg Teriyaki Beef',3,NULL,35000),(367,'Burger Fish',3,NULL,33000),(368,'Burger Cheese',3,NULL,33000),(369,'Burger Teriyaki Beef',3,NULL,30000),(370,'Grilled Chicken - 9 pieces',1,NULL,304000),(371,'Buffalo Sauce Chicken - 9 pieces',1,NULL,304000),(372,'H&S Sauce Chicken - 9 pieces',1,NULL,304000),(373,'Cheese Sauce Chicken - 9 pieces',1,NULL,304000),(374,'Bean Sauce Chicken - 9 pieces',1,NULL,304000),(375,'Fried Chicken - 9 pieces',1,NULL,284000),(376,'Grilled Chicken - 6 pieces',1,NULL,203000),(377,'Buffalo Sauce Chicken - 6 pieces',1,NULL,203000),(378,'H&S Sauce Chicken - 6 pieces',1,NULL,203000),(379,'Cheese Sauce Chicken - 6 pieces',1,NULL,203000),(380,'Bean Sauce Chicken - 6 pieces',1,NULL,203000),(381,'Fried Chicken - 6 pieces',1,NULL,191000),(382,'Grilled Chicken Leg Quarter - 1 piece',1,NULL,48000),(383,'Grilled Chiken - 1 piece',1,NULL,37000),(384,'Buffalo Sauce Chicken - 1 piece',1,NULL,37000),(385,'H&S Sauce Chicken - 1 piece',1,NULL,37000),(386,'Cheese Sauce Chicken - 1 piece',1,NULL,37000),(387,'Bean Sauce Chicken - 1 piece',1,NULL,37000),(388,'Fried Chicken - 1 piece',1,NULL,35000),(389,'Chicken Skewers - 2 pieces',6,NULL,49000),(390,'Shaken Chicken',6,NULL,42000),(391,'Shaken Chips',6,NULL,39000),(392,'Fish Nugget - 5 pieces',6,NULL,34000),(393,'Fried Squid - 5 pieces',6,NULL,34000),(394,'Chesse Stick',6,NULL,34000),(395,'French Fries (M)',6,NULL,27000),(396,'Apple Pie',6,NULL,20000),(397,'Grilled Chicken Leg Quarter with Rice',2,NULL,57000),(398,'Chicken Nuggets with Rice',2,NULL,44000),(399,'Beef Rice',2,NULL,44000),(400,'Chicken Soup',2,NULL,12000),(401,'Milo',2,NULL,18000);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipts`
--

LOCK TABLES `receipts` WRITE;
/*!40000 ALTER TABLE `receipts` DISABLE KEYS */;
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
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'dungbui1110','root','dungbui1110@gmail.com',0,'Dung',NULL,NULL,'0973658610',0),(2,'namduong','root','namduong@gmail.com',3,'Duong',NULL,NULL,'12321312312312',1),(3,'hason','root','hason@gmail.com',4,'Son',NULL,NULL,'123123123',1);
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

-- Dump completed on 2022-05-21 18:50:49
