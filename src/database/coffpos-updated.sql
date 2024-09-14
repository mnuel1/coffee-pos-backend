-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: coffee-pos
-- ------------------------------------------------------
-- Server version	8.4.2

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(120) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(120) COLLATE utf8mb4_general_ci NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin 1','admin1','password123','2024-09-13 14:38:28','2024-08-29 12:28:32');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beverages`
--

DROP TABLE IF EXISTS `beverages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beverages` (
  `beverage_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `sugar_level` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `price` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `calories` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `beverage_img` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `is_popular` tinyint(1) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `is_available` tinyint NOT NULL,
  `category` longtext COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`beverage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beverages`
--

LOCK TABLES `beverages` WRITE;
/*!40000 ALTER TABLE `beverages` DISABLE KEYS */;
INSERT INTO `beverages` VALUES (1,'Tropical Citrus Iced Coffee','A refreshing iced coffee with a tropical citrus twist.','[0,25,50,75,100]','[2.8,3.3,3.8]','[90,120,150]','https://globalassets.starbucks.com/digitalassets/products/bev/TropicalCitrusEnergyDrink.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Electric Elixirs coffee coffee coffee\"]'),(2,'Melon Burst Iced Coffee','Iced coffee infused with a burst of melon flavor.','[0,25,50,75,100]','[2.9,3.4,3.9]','[100,130,160]','https://globalassets.starbucks.com/digitalassets/products/bev/MelonBurstEnergyDrink.jpg?impolicy=1by1_wide_topcrop_630',0,0,1,'[\"Electric Elixirs\"]'),(3,'Frozen Tropical Citrus Iced Energy with Strawberry Puree','A frozen iced energy drink with a tropical citrus flavor and strawberry puree.','[0,25,50,75,100]','[3,3.5,4]','[110,140,180]','https://globalassets.starbucks.com/digitalassets/products/bev/FrozenTropicalCitrusStrawberryEnergyDrink.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Electric Elixirs\"]'),(4,'Caffè Americano','A bold, rich espresso combined with hot water.','[0,25,50,75,100]','[2.5,3,3.5]','[10,15,20]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20190617_CaffeAmericano.jpg?impolicy=1by1_wide_topcrop_630',1,0,1,'[\"Brewed Brilliance coffee\"]'),(5,'Vendara Blend','A smooth blend with a hint of sweetness and spice.','[0,25,50,75,100]','[2.6,3.1,3.6]','[15,20,25]','https://globalassets.starbucks.com/digitalassets/products/bev/Veranda_Blend_Hot.jpg?impolicy=1by1_wide_topcrop_630',0,1,1,'[\"Brewed Brilliance coffee\"]'),(6,'Featured Medium Roast - Pike Place® Roast','Smooth and well-balanced, with rich flavor and subtle notes of cocoa.','[0,25,50,75,100]','[2.7,3.2,3.7]','[20,25,30]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20190617_PikePlaceRoast.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Brewed Brilliance coffee\"]'),(7,'Featured Dark Roast','A bold dark roast with a robust, smoky flavor.','[0,25,50,75,100]','[2.8,3.3,3.8]','[25,30,35]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20190617_FeaturedDarkRoast.jpg?impolicy=1by1_wide_topcrop_630',0,1,1,'[\"Brewed Brilliance coffee\"]'),(8,'Decaf Pike Place® Roast','The same rich and well-balanced flavor as our Pike Place® Roast, but without the caffeine.','[0,25,50,75,100]','[2.7,3.2,3.7]','[20,25,30]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20190617_DecafPikePlaceRoast.jpg?impolicy=1by1_wide_topcrop_630',0,0,1,'[\"Brewed Brilliance coffee\"]'),(9,'Veranda Blend® Clover Vertica™','A mellow and soft coffee with notes of toasted nuts and chocolate.','[0,25,50,75,100]','[3,3.5,4]','[20,25,30]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20190617_BlondeRoast.jpg?impolicy=1by1_wide_topcrop_630',1,0,1,'[\"Brewed Brilliance coffee\"]'),(10,'Caffè Misto','A smooth blend of brewed coffee and steamed milk.','[0,25,50,75,100]','[2.9,3.4,3.9]','[40,50,60]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20190617_CaffeMisto.jpg?impolicy=1by1_wide_topcrop_630',0,1,1,'[\"Brewed Brilliance coffee\"]'),(11,'Guatemala Casi Cielo® Clover Vertica™','A distinctive coffee with a bright acidity and floral notes.','[0,25,50,75,100]','[3.1,3.6,4.1]','[20,25,30]','https://globalassets.starbucks.com/digitalassets/products/bev/PikePlaceRoast.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Brewed Brilliance coffee\"]'),(12,'Cappuccino','Rich espresso with steamed milk, topped with a deep layer of foam.','[0,25,50,75,100]','[3,3.5,4]','[80,100,120]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20190617_Cappuccino.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Brewed Brilliance coffee\"]'),(13,'Espresso','A shot of rich espresso, full of depth and flavor.','[0,25,50,75,100]','[null,null,null]','[null,null,null]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20190617_Espresso_Single.jpg?impolicy=1by1_wide_topcrop_630',1,0,1,'[\"Brewed Brilliance coffee\"]'),(14,'Espresso Con Panna','A shot of rich espresso topped with a dollop of whipped cream.','[0,25,50,75,100]','[null,null,null]','[null,null,null]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20190617_EspressoConPanna.jpg?impolicy=1by1_wide_topcrop_630',0,1,1,'[\"Brewed Brilliance coffee\"]'),(15,'Honey Almondmilk Flat White','A velvety flat white made with almond milk and a hint of honey.','[0,25,50,75,100]','[3.7,4.2,4.7]','[100,130,160]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20230406_HoneyAlmondmilkFlatWhite.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Brewed Brilliance coffee\"]'),(16,'Pumpkin Spice Latte','Espresso and steamed milk with pumpkin, cinnamon, nutmeg, and clove flavors.','[0,25,50,75,100]','[4,4.5,5]','[300,380,450]','https://globalassets.starbucks.com/digitalassets/products/bev/PumpkinSpiceLatte.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Brewed Brilliance coffee\"]'),(17,'Oleato™ Caffé Latte with Oatmilk','A smooth latte made with oat milk and a hint of olive oil.','[0,25,50,75,100]','[4.2,4.7,5.2]','[220,270,320]','https://globalassets.starbucks.com/digitalassets/products/bev/Oleato_CaffeLatte.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Brewed Brilliance coffee\"]'),(18,'Caffè Latte','Rich espresso and steamed milk topped with a light layer of foam.','[0,25,50,75,100]','[3.5,4,4.5]','[180,230,290]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20190617_CaffeLatte.jpg?impolicy=1by1_wide_topcrop_630',1,0,1,'[\"Brewed Brilliance coffee\"]'),(19,'Cinnamon Dolce Latte','Espresso, steamed milk, and cinnamon dolce syrup topped with sweetened whipped cream.','[0,25,50,75,100]','[4,4.5,5]','[330,410,490]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20190617_CinnamonDolceLatte.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Brewed Brilliance coffee\"]'),(20,'Apple Crisp Oatmilk Macchiato','Espresso layered with steamed oatmilk, apple, and brown sugar flavors.','[0,25,50,75,100]','[4.5,5,5.5]','[230,300,380]','https://globalassets.starbucks.com/digitalassets/products/bev/AppleCrispOatmilkMacchiato.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Brewed Brilliance coffee\"]'),(21,'Caramel Macchiato','Freshly steamed milk with vanilla-flavored syrup, marked with espresso and topped with caramel drizzle.','[0,25,50,75,100]','[4.2,4.7,5.2]','[250,320,420]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20211029_CaramelMacchiato.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Brewed Brilliance coffee\"]'),(22,'Espresso Macchiato','A rich shot of espresso topped with a dollop of steamed milk foam.','[0,25,50,75,100]','[160,240,300]','[15,30,60]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20190617_EspressoMacchiato.jpg?impolicy=1by1_wide_topcrop_630',0,0,1,'[\"Brewed Brilliance coffee\"]'),(23,'Caffè Mocha','Espresso, steamed milk, and rich mocha sauce topped with whipped cream.','[0,25,50,75,100]','[4,4.5,5]','[290,360,440]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20220607_CaffeMocha.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Brewed Brilliance\"]'),(24,'White Chocolate Mocha','Espresso, steamed milk, and white chocolate-flavored sauce topped with whipped cream.','[0,25,50,75,100]','[4.2,4.7,5.2]','[350,430,510]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20190617_WhiteChocolateMocha.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Brewed Brilliance\"]'),(25,'Pumpkin Cream Cold Brew','Cold brew topped with pumpkin cream cold foam and a dusting of pumpkin spice.','[0,25,50,75,100]','[4.3,4.8,5.3]','[250,320,390]','https://globalassets.starbucks.com/digitalassets/products/bev/PumpkinCreamColdBrew.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Chill-Out Classics\"]'),(26,'Salted Caramel Cream Cold Brew','Cold brew topped with salted caramel cold foam.','[0,25,50,75,100]','[4.2,4.7,5.2]','[230,290,350]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20211029_SaltedCaramelCreamColdBrew.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Chill-Out Classics\"]'),(27,'Chocolate Cream Cold Brew','Cold brew topped with chocolate cream cold foam.','[0,25,50,75,100]','[4.5,5,5.5]','[260,330,400]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20211217_ChocolateCreamColdBrew.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Chill-Out Classics\"]'),(28,'Starbucks Cold Brew Coffee','Smooth, rich cold brew coffee.','[0,25,50,75,100]','[3.8,4.3,4.8]','[5,10,15]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20210611_ColdBrew.jpg?impolicy=1by1_wide_topcrop_630',1,0,1,'[\"Chill-Out Classics\"]'),(29,'Vanilla Sweet Cream Cold Brew','Cold brew topped with vanilla sweet cream.','[0,25,50,75,100]','[4,4.5,5]','[110,150,190]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20190607_VanillaSweetCreamColdBrew.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Chill-Out Classics\"]'),(30,'Nondairy Salted Caramel Cream Cold Brew','Cold brew topped with nondairy salted caramel cold foam.','[0,25,50,75,100]','[4.5,5,5.5]','[240,300,360]','https://globalassets.starbucks.com/digitalassets/products/bev/NonDairySaltedCaramelColdBrewColdFoam.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Chill-Out Classics\"]'),(31,'Nondairy Vanilla Sweet Cream Cold Brew','Cold brew topped with nondairy vanilla sweet cream.','[0,25,50,75,100]','[4.5,5,5.5]','[120,160,200]','https://globalassets.starbucks.com/digitalassets/products/bev/NonDairyVanillaSweetCreamColdBrew.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Chill-Out Classics\"]'),(32,'Cold Brew with Nondairy Vanilla Sweet Cream Cold Foam Sdkpaoskdpo aopskd poask podkas dkaspk poask dpos','Cold brew topped with nondairy vanilla sweet cream cold foam.','[0,25,50,75,100]','[4.6,5.1,5.6]','[130,170,210]','https://globalassets.starbucks.com/digitalassets/products/bev/NonDairyVanillaSweetCreamColdFoam.jpg?impolicy=1by1_wide_topcrop_630',0,1,1,'[\"Chill-Out Classics\"]'),(33,'Nondairy Chocolate Cream Cold Brew','Cold brew topped with nondairy chocolate cream cold foam.','[0,25,50,75,100]','[4.6,5.1,5.6]','[270,340,410]','https://globalassets.starbucks.com/digitalassets/products/bev/NonDairyChocolateCreamColdBrew.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Chill-Out Classics\"]'),(34,'Vanilla Sweet Cream Nitro Cold Brew','Nitro cold brew topped with vanilla sweet cream.','[0,25,50,75,100]','[4.8,5.3,5.8]','[130,180,230]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20190410_VanillaSweetCreamNitroColdBrew.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Chill-Out Classics\"]'),(35,'Nitro Cold Brew','Smooth, creamy nitro cold brew.','[0,25,50,75,100]','[4,4.5,5]','[5,10,15]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20190410_NitroColdBrew.jpg?impolicy=1by1_wide_topcrop_630',1,1,1,'[\"Chill-Out Classics\"]'),(36,'Iced Caffè Americano','Espresso shots topped with cold water, poured over ice.','[0,25,50,75,100]','[2.8,3.3,3.8]','[10,15,20]','https://globalassets.starbucks.com/digitalassets/products/bev/SBX20190607_IcedCaffeAmericano.jpg?impolicy=1by1_wide_topcrop_630',1,0,1,'[\"Chill-Out Classics\"]');
/*!40000 ALTER TABLE `beverages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_beverages`
--

DROP TABLE IF EXISTS `order_beverages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_beverages` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `beverage_id` int NOT NULL,
  `sugar_level` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `size` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `item_price` double NOT NULL,
  `item_quantity` int NOT NULL,
  `item_total` double NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order-relation` (`order_id`),
  KEY `beverages-relation` (`beverage_id`),
  CONSTRAINT `beverages-relation` FOREIGN KEY (`beverage_id`) REFERENCES `beverages` (`beverage_id`),
  CONSTRAINT `order-relation` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_beverages`
--

LOCK TABLES `order_beverages` WRITE;
/*!40000 ALTER TABLE `order_beverages` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_beverages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `payment_id` int DEFAULT NULL,
  `customer_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `customer_msg` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `total_amt` double NOT NULL,
  `order_type` enum('dine-in','take-out') COLLATE utf8mb4_general_ci NOT NULL,
  `order_status` enum('Served','Preparing','Ready for Pickup') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Preparing',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isVoid` tinyint(1) DEFAULT '0',
  `reference_code` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `reference_code_UNIQUE` (`reference_code`),
  KEY `payment-relation` (`payment_id`),
  CONSTRAINT `payment-relation` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NULL DEFAULT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `payment_status` enum('Paid','Unpaid','Pending') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Pending',
  `receipt_url` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `admin-relation` (`admin_id`),
  CONSTRAINT `admin-relation` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (3,1,'2024-09-13 13:38:32','2024-09-13 10:46:54','Gcash','Paid',NULL),(5,1,'2024-09-13 13:56:55',NULL,'','Pending',NULL),(6,1,'2024-09-13 13:57:40',NULL,'Gcash','Pending',NULL),(7,1,'2024-09-13 13:58:11',NULL,'Gcash','Pending',NULL),(8,1,'2024-09-13 14:03:45',NULL,'Gcash','Pending',NULL),(9,1,'2024-09-13 14:04:22',NULL,'Gcash','Pending',NULL),(10,1,'2024-09-13 17:21:06','2024-09-13 10:55:16','Gcash','Paid',NULL),(11,1,'2024-09-13 17:53:40','2024-09-13 11:25:23','','Paid',NULL),(12,1,'2024-09-13 18:05:59',NULL,'','Pending',NULL);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-14  5:04:08
