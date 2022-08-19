-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: fastfood
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'chicken'),(2,'rice'),(3,'burger'),(4,'spaghetti'),(5,'pizza'),(6,'side dish'),(7,'drink'),(8,'dessert'),(9,'extra'),(10,'others');
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
  `combo_name` varchar(50) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`combo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combos`
--

LOCK TABLES `combos` WRITE;
/*!40000 ALTER TABLE `combos` DISABLE KEYS */;
INSERT INTO `combos` VALUES (1,'Chicken + Teddy',0),(2,'Chicken + Bottle',0);
/*!40000 ALTER TABLE `combos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combos_products`
--

DROP TABLE IF EXISTS `combos_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combos_products` (
  `combo_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`combo_id`,`product_id`),
  KEY `fk_combos_products_2_idx` (`product_id`),
  CONSTRAINT `fk_combos_products_1` FOREIGN KEY (`combo_id`) REFERENCES `combos` (`combo_id`),
  CONSTRAINT `fk_combos_products_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combos_products`
--

LOCK TABLES `combos_products` WRITE;
/*!40000 ALTER TABLE `combos_products` DISABLE KEYS */;
INSERT INTO `combos_products` VALUES (1,371),(2,379),(2,406),(1,408);
/*!40000 ALTER TABLE `combos_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  KEY `fk_favoriteuser_idx` (`user_id`),
  KEY `fk_favoritedish_idx` (`product_id`),
  CONSTRAINT `fk_favoriteproduct` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (1,1,'Quán này ăn rất oke nhé mọi người',5),(2,1,'Mọi người nên ăn',5);
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `category_id` int NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` int NOT NULL,
  `image` varchar(5000) DEFAULT NULL,
  `side_dish_for` int DEFAULT NULL,
  `extra_price` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `fk_products_1_idx` (`category_id`),
  KEY `fk_products_2_idx` (`side_dish_for`),
  CONSTRAINT `fk_products_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `fk_products_2` FOREIGN KEY (`side_dish_for`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=437 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (351,'Cocacola',7,'A refreshing drink to complement your dish',15000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/d/r/drink-534x374px_pepsi_1.png',NULL,NULL),(352,'Sprite',7,NULL,15000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/d/r/drink-534x374px_7up_1_1.png',NULL,NULL),(353,'Fanta',7,NULL,15000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/d/r/drink-534x374px_mirinda.png',NULL,NULL),(354,'Dasani',7,NULL,10000,'https://cdn.tgdd.vn/Products/Images/2563/79249/bhx/nuoc-tinh-khiet-dasani-500ml-202002222052095128.JPG',NULL,NULL),(355,'Iced tea',7,NULL,20000,'https://vuagym.com/wp-content/uploads/2020/06/lemon-iced-tea.jpg',NULL,NULL),(356,'Strawberry Smoothie',7,NULL,35000,'https://cdn.mos.cms.futurecdn.net/AWZkNxYWYWLC2v6cmLSf2G-1024-80.png.webp',NULL,NULL),(357,'Mango Smoothie',7,NULL,35000,'https://images.eatthismuch.com/img/927279_tabitharwheeler_0429baa1-435d-4689-b5f9-382a6040fe09.jpg',NULL,NULL),(358,'Hot Chocolate',7,NULL,40000,'https://images.immediate.co.uk/production/volatile/sites/30/2020/10/Classic-Homemade-Hot-Chocolate-7d8353b.jpg?resize=960,872?quality=90&webp=true&resize=300,272',NULL,NULL),(359,'Strawberry Watermelon Slushie',7,NULL,40000,'https://www.flavourandsavour.com/wp-content/uploads/2017/06/Strawberry-Watermelon-Sangria-Slushie-1.jpg',NULL,NULL),(360,'Tropical Mango Slushie',7,NULL,40000,'https://staticfanpage.akamaized.net/wp-content/uploads/sites/22/2021/09/mango-slush-1200x675.jpg',NULL,NULL),(361,'Burger Mozzarella',3,NULL,59000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/b/u/burger-534x374px_mozzarella-burger_3.png',NULL,NULL),(362,'Burger Double Double',3,NULL,58000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/b/u/burger-534x374px_ddouble-burger_1.png',NULL,NULL),(363,'Burger Shrimp',3,NULL,49000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/b/u/burger-534x374px_shrimp-burger_1.png',NULL,NULL),(364,'Burger Bulgogi',3,NULL,43000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/b/u/burger-534x374px_bulgogi-burger_1.png',NULL,NULL),(365,'Burger Highend Chicken',3,NULL,43000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/b/u/burger-534x374px_chicken-burger_1.png',NULL,NULL),(366,'Burger Egg Teriyaki Beef',3,NULL,35000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/b/u/burger-534x374px_teriyaki-egg-burger_1.png',NULL,NULL),(367,'Burger Fish',3,NULL,33000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/b/u/burger-534x374px_fish-burger_1.png',NULL,NULL),(368,'Burger Cheese',3,NULL,33000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/b/u/burger-534x374px_cheese-burger_1.png',NULL,NULL),(369,'Burger Teriyaki Beef',3,NULL,30000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/b/u/burger-534x374px_beef-teriyaki-burger_1.png',NULL,NULL),(370,'Grilled Chicken - 9 pieces',1,NULL,304000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/c/h/chicken-534x374px_grilled-chicken_5.png',NULL,NULL),(371,'Buffalo Sauce Chicken - 9 pieces',1,NULL,304000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/c/h/chicken-534x374px_buffalo-chicken-6-9_3.png',NULL,NULL),(372,'H&S Sauce Chicken - 9 pieces',1,NULL,304000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/c/h/chicken-534x374px_hs-chicken_2.png',NULL,NULL),(373,'Cheese Sauce Chicken - 9 pieces',1,NULL,304000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/5/3/534x374px_cheese-chicken.png',NULL,NULL),(374,'Bean Sauce Chicken - 9 pieces',1,NULL,304000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/5/3/534x374px_soybean-chicken_1.png',NULL,NULL),(375,'Fried Chicken - 9 pieces',1,NULL,284000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/5/3/534x374px_fried-chicken_1.png',NULL,NULL),(376,'Grilled Chicken - 6 pieces',1,NULL,203000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/c/h/chicken-534x374px_grilled-chicken_5.png',NULL,NULL),(377,'Buffalo Sauce Chicken - 6 pieces',1,NULL,203000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/c/h/chicken-534x374px_buffalo-chicken-6-9_3.png',NULL,NULL),(378,'H&S Sauce Chicken - 6 pieces',1,NULL,203000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/c/h/chicken-534x374px_hs-chicken_2.png',NULL,NULL),(379,'Cheese Sauce Chicken - 6 pieces',1,NULL,203000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/5/3/534x374px_cheese-chicken.png',NULL,NULL),(380,'Bean Sauce Chicken - 6 pieces',1,NULL,203000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/5/3/534x374px_soybean-chicken_1.png',NULL,NULL),(381,'Fried Chicken - 6 pieces',1,NULL,191000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/5/3/534x374px_fried-chicken_1.png',NULL,NULL),(382,'Grilled Chicken Leg Quarter - 1 piece',1,NULL,48000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/c/h/chicken-534x374px_ganuonggoc4.png',NULL,NULL),(383,'Grilled Chicken - 1 piece',1,NULL,37000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/c/h/chicken-534x374px_grilled-1_1.png',NULL,NULL),(384,'Buffalo Sauce Chicken - 1 piece',1,NULL,37000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/c/h/chicken-534x374px_buffalo-chicken-1.png',NULL,NULL),(385,'H&S Sauce Chicken - 1 piece',1,NULL,37000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/5/3/534x374px_hs-1.png',NULL,NULL),(386,'Cheese Sauce Chicken - 1 piece',1,NULL,37000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/5/3/534x374px_cheese-1.png',NULL,NULL),(387,'Bean Sauce Chicken - 1 piece',1,NULL,37000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/5/3/534x374px_soybean-1.png',NULL,NULL),(388,'Fried Chicken - 1 piece',1,NULL,35000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/c/h/chicken-534x374px_fried-1.png',NULL,NULL),(389,'Chicken Skewers - 2 pieces',1,NULL,49000,'https://www.thespruceeats.com/thmb/fFY-wqOwGKO16rTH8YwdnSUWoNQ=/2667x2667/smart/filters:no_upscale()/best-twice-cooked-chip-recipe-434891-hero-01-5d90eb5142b042e1b71e2c3bcce9c5c9.jpg',NULL,NULL),(390,'Shaken Chicken',1,NULL,42000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/d/e/dessert-534x374px_shake-chicken.png',NULL,NULL),(391,'Shaken Chips',6,NULL,39000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/d/e/dessert-534x374px_shake-potato.png',NULL,NULL),(392,'Fish Nugget - 5 pieces',6,NULL,34000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/d/e/dessert-534x374px_fish-nugget_1.png',NULL,NULL),(393,'Fried Squid - 5 pieces',6,NULL,34000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/d/e/dessert-534x374px_squid-ring.png',NULL,NULL),(394,'Chesse Stick',6,NULL,34000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/d/e/dessert-534x374px_cheese-stick.png',NULL,NULL),(395,'French Fries (M)',6,NULL,27000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/d/e/dessert-534x374px_frenchfries.png',NULL,NULL),(396,'Apple Pie',8,NULL,20000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/d/e/dessert-534x374px_apple-pie.png',NULL,NULL),(397,'Grilled Chicken Leg Quarter with Rice',2,NULL,57000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/r/i/rice-spaghetti-534x374px._com-ganuong-goctu.png',NULL,NULL),(398,'Chicken Nuggets with Rice',2,NULL,44000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/r/i/rice-spaghetti-534x374px._com-gavien_1.png',NULL,NULL),(399,'Beef Rice',2,NULL,44000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/r/i/rice-spaghetti-534x374px._com-thitbo_1.png',NULL,NULL),(400,'Chicken Soup',6,NULL,12000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/e/x/extra--534x374px_chicken-soup.png',NULL,NULL),(401,'Milo',7,NULL,18000,'https://dscnnwjxnwl3f.cloudfront.net/media/catalog/product/d/r/drink-534x374px._milo_2_2.png',NULL,NULL),(406,'Red Water Bottle',10,'',25000,'data:image/jpeg;base64,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\n',NULL,NULL),(407,'Yellow Water Bottle',10,NULL,25000,'https://m.media-amazon.com/images/I/51oWO6CenUL._AC_SL1003_.jpg',NULL,NULL),(408,'Brown Teddy',10,NULL,45000,'https://cdn-amz.woka.io/images/I/81J4TvhJx1L.jpg\n',NULL,NULL),(409,'Black Teddy',10,NULL,45000,'https://www.saigonflowers.com/wp-content/uploads/2020/05/brown-teddy-bear-1m4.jpg\n',NULL,NULL),(410,'Seafood Pizza',5,NULL,79000,'https://cdn.pizzahut.vn/images/Web_V3/Products/Pizza_Gap_Doi_Nhan_Phu_Hai_San_Xot_Pesto_400x275.jpg',NULL,NULL),(411,'Pepperoni Pizza',5,NULL,79000,'https://cdn.pizzahut.vn/images/Web_V3/Products/Pizza_Xuc_Xich_Nuong_400x275.jpg',NULL,NULL),(412,'Meat and Sausage Pizza',5,NULL,79000,'https://cdn.pizzahut.vn/images/Web_V3/Products/Pizza_Thit_Va_Xuc_Xich_400x275.jpg',NULL,NULL),(413,'Cheese Pizza',5,NULL,79000,'https://cdn.pizzahut.vn/images/Web_V3/Products/Pizza_Pho_Mai_Cao_Cap_400x275.jpg',NULL,NULL),(414,'Teriyaki sauce',9,NULL,5000,'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F43%2F2022%2F03%2F20%2F259887-Simple-Teriyaki-Sauce-mfs_002-2.jpg',1,0),(415,'BBQ Sauce',9,NULL,5000,'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F43%2F2022%2F03%2F20%2F51226-A-Very-Popular-BBQ-Sauce-mfs-1.jpg',1,0),(416,'Rice',9,NULL,5000,'https://static01.nyt.com/images/2018/02/21/dining/00RICEGUIDE8/00RICEGUIDE8-articleLarge.jpg',2,2000),(417,'Fish Sauce',9,NULL,5000,'https://nuocmamantoan.net/wp-content/uploads/2020/11/cong-suc-khoe-1-1948.jpg',2,0),(418,'Bun',9,NULL,3000,'https://www.rockrecipes.com/wp-content/uploads/2021/06/The-Best-Hamburger-Buns-Recipe-close-up-photo-of-one-bun-split-in-half-horisontally.jpg.webp',3,0),(419,'Cheese',9,NULL,5000,'https://www.maangchi.com/wp-content/uploads/2018/07/hamburger-cheese-on-patties-650x433.jpg',3,2000),(420,'Lettuce',9,NULL,5000,'https://as1.ftcdn.net/v2/jpg/00/98/21/26/1000_F_98212683_GK8O34g0l47QyIYfrqFglFyLNOD7l5bs.jpg',3,0),(421,'Tomato',9,NULL,3000,'https://image.shutterstock.com/image-photo/slice-tomato-isolated-on-white-260nw-170943899.jpg',3,0),(422,'Spaghetti Sauce',9,NULL,3000,'https://keviniscooking.com/wp-content/uploads/2020/04/Spaghetti-Sauce-Marinara-Sauce-square.jpg',4,0),(423,'Pepperoni',9,NULL,5000,'https://datxuyenviet.vn/wp-content/uploads/2022/05/Pepperoni-la-gi-phan-biet-pepperoni-va-salami-mua-pepperoni-o-dau-5-800x520-1.jpg',5,5000),(424,'Pizza cheese',9,NULL,10000,'https://santorino.org/wp-content/uploads/2020/11/pho-mai-bao-mozzarella-uruguay.jpg',5,5000),(425,'Pineapple',9,NULL,5000,'https://www.lima-europe.eu/wp-content/uploads/2017/04/Pineapple2.jpg',5,3000),(426,'Spaghetti Classic',4,NULL,38000,'https://bizweb.dktcdn.net/thumb/compact/100/405/121/products/2f686504-c34e-43bc-8b62-e61b286bcbec.jpg?v=1644065724000',NULL,NULL),(427,'Spaghetti Twisted Bolognese',4,NULL,42000,'https://bizweb.dktcdn.net/thumb/compact/100/405/121/products/07cbdd7e-ec0f-4d13-9d18-8ed7d97bad7c.jpg?v=1634143584000',NULL,NULL),(428,'Spicy Duck Breast Spaghetti',4,NULL,57000,'https://bizweb.dktcdn.net/thumb/grande/100/405/121/products/12af6392-1010-40d6-a447-23fe04397716.jpg?v=1644046541000',NULL,NULL),(429,'Spaghetti Vegetarian',4,NULL,40000,'https://bizweb.dktcdn.net/thumb/grande/100/405/121/products/0b23c1f0c9963cc86587-jpeg.jpg?v=1620152643000',NULL,NULL),(430,'Spaghetti Boscaiola',4,NULL,40000,'https://bizweb.dktcdn.net/thumb/grande/100/405/121/products/779b33ed-c952-442c-8942-db3043981e8b.jpg?v=1644066469000',NULL,NULL),(431,'Spaghetti Spicy Seafood',4,NULL,50000,'https://bizweb.dktcdn.net/thumb/grande/100/405/121/products/da4e1a7b-c31a-452e-8c1d-b4d25726eb6d.jpg?v=1634143734000',NULL,NULL),(432,'Spaghetti Tuna Sauce',4,NULL,40000,'https://bizweb.dktcdn.net/thumb/grande/100/405/121/products/fbf1b44d-5318-41fc-8eeb-611888bc2ed1.jpg?v=1644046434000',NULL,NULL),(433,'Ice Cream',8,NULL,16000,'https://mcdonalds.vn/uploads/2018/food/desserts/mcdonalds_cone.png',NULL,NULL),(434,'Sundae Chocolate Ice Cream',8,NULL,29000,'https://mcdonalds.vn/uploads/2018/food/desserts/hotfudge_mcsundae.png',NULL,NULL),(435,'Sundae Strawberry Ice Cream',8,NULL,29000,'https://mcdonalds.vn/uploads/2018/food/desserts/strawberry-mcsundae.png',NULL,NULL),(436,'Oreo Ice Cream',8,NULL,36000,'https://mcdonalds.vn/uploads/2018/food/desserts/oreo_mcflurrt.png',NULL,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
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
  `total` int NOT NULL,
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
-- Table structure for table `receipts_products`
--

DROP TABLE IF EXISTS `receipts_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipts_products` (
  `receipt_id` int NOT NULL,
  `product_id` int NOT NULL,
  KEY `fk_receiptdish_receipt_idx` (`receipt_id`),
  KEY `fk_receiptdish_dish_idx` (`product_id`),
  CONSTRAINT `fk_receiptsproducts_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `fk_receiptsproducts_receipts` FOREIGN KEY (`receipt_id`) REFERENCES `receipts` (`receipt_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipts_products`
--

LOCK TABLES `receipts_products` WRITE;
/*!40000 ALTER TABLE `receipts_products` DISABLE KEYS */;
INSERT INTO `receipts_products` VALUES (2918570,370),(2918570,371),(2918570,372),(5600866,370),(6616224,370),(6616224,371),(6616224,372),(4199155,374),(8762829,370),(926988,372),(926988,371),(926988,375),(926988,370);
/*!40000 ALTER TABLE `receipts_products` ENABLE KEYS */;
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
INSERT INTO `users` VALUES (1,'dungbui1110','root','dungbui1110@gmail.com',0,'Dũng',NULL,NULL,'0973658610',0,1),(2,'namduong','root','namduong@gmail.com',3,'Duong',NULL,NULL,'12321312312312',1,1),(3,'hason','root','hason@gmail.com',4,'Son',NULL,NULL,'123123123',1,1),(4,'kinhdivcl','123456*','',0,'',NULL,NULL,'',0,0),(5,'kinhdivcl','123456789*','duong.tn194535@sis.hust.edu.vn',0,'Nam DUong',NULL,NULL,'01283463248',0,0),(6,'hs1221','123456','duong.tn194535@sis.hust.edu.vn',0,'Nam Duong',NULL,NULL,'01234567',0,0),(7,'dungbui1111','123456789','duong@gmail.com',0,'Dung Bui',NULL,NULL,'09875124',0,NULL);
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

-- Dump completed on 2022-07-28  0:21:33
