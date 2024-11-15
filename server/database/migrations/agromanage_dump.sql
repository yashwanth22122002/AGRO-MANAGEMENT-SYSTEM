-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: agromanage
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `action` varchar(50) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `record_id` int NOT NULL,
  `changes` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
INSERT INTO `activity_logs` VALUES (1,NULL,'UPDATE','products',5,'{\"new_price\": 1500.00, \"new_stock\": 1196, \"old_price\": 1500.00, \"old_stock\": 1200}','2024-11-13 13:31:04'),(2,NULL,'UPDATE','products',7,'{\"new_price\": 1300.00, \"new_stock\": 199, \"old_price\": 1300.00, \"old_stock\": 200}','2024-11-13 13:46:55'),(3,NULL,'UPDATE','products',6,'{\"new_price\": 1350.00, \"new_stock\": 1997, \"old_price\": 1350.00, \"old_stock\": 2000}','2024-11-13 13:46:55'),(4,NULL,'UPDATE','products',5,'{\"new_price\": 1500.00, \"new_stock\": 1193, \"old_price\": 1500.00, \"old_stock\": 1196}','2024-11-13 13:46:55'),(5,NULL,'UPDATE','products',7,'{\"new_price\": 1300.00, \"new_stock\": 198, \"old_price\": 1300.00, \"old_stock\": 199}','2024-11-13 19:48:00'),(6,NULL,'UPDATE','products',6,'{\"new_price\": 1350.00, \"new_stock\": 1993, \"old_price\": 1350.00, \"old_stock\": 1997}','2024-11-13 19:48:00'),(7,NULL,'UPDATE','products',7,'{\"new_price\": 1300.00, \"new_stock\": 197, \"old_price\": 1300.00, \"old_stock\": 198}','2024-11-14 16:38:45'),(8,NULL,'UPDATE','products',6,'{\"new_price\": 1350.00, \"new_stock\": 1992, \"old_price\": 1350.00, \"old_stock\": 1993}','2024-11-14 16:38:45'),(9,NULL,'UPDATE','products',5,'{\"new_price\": 1500.00, \"new_stock\": 1192, \"old_price\": 1500.00, \"old_stock\": 1193}','2024-11-14 16:38:45');
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crop_guides`
--

DROP TABLE IF EXISTS `crop_guides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crop_guides` (
  `id` int NOT NULL AUTO_INCREMENT,
  `crop_name` varchar(255) NOT NULL,
  `soil_type` varchar(255) NOT NULL,
  `water_requirements` text NOT NULL,
  `season` varchar(100) NOT NULL,
  `fertilizer_recommendations` text NOT NULL,
  `pest_control` text NOT NULL,
  `harvesting_tips` text NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `crop_guides_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop_guides`
--

LOCK TABLES `crop_guides` WRITE;
/*!40000 ALTER TABLE `crop_guides` DISABLE KEYS */;
INSERT INTO `crop_guides` VALUES (15,'Ginger','Well-draining, rich loamy soil, pH 6.0-6.5','Regular watering, maintain soil moisture but avoid waterlogging','Spring-Summer','NPK 6:6:6 at planting, organic matter enrichment recommended','Monitor for soft rot, bacterial wilt, and rhizome rot. Use disease-free rhizomes.','Harvest when leaves turn yellow and dry, typically 8-10 months after planting',1,'2024-11-13 15:36:18'),(16,'Rice','Clay or clay loam','Regular flooding with 4-6 inches of water','Kharif (Monsoon)','NPK 120:60:60 kg/ha, split application','Monitor for stem borers and leaf folders. Use neem-based pesticides.','Harvest when 80% of grains turn golden yellow',1,'2024-11-13 15:36:18'),(17,'Wheat','Loam to clay loam','Critical irrigation at crown root initiation, tillering, and grain filling','Rabi (Winter)','NPK 120:60:40 kg/ha, apply before sowing','Watch for rust and aphids. Use recommended fungicides if needed.','Harvest when grains are hard and golden',1,'2024-11-13 15:36:18'),(18,'Tomatoes','Well-draining loamy soil, pH 6.0-6.8','Regular watering, 1-2 inches per week. Avoid overhead watering.','Spring-Summer','NPK 5-10-5, apply organic compost at planting. Side-dress with nitrogen every 4-6 weeks.','Monitor for hornworms and aphids. Use neem oil or insecticidal soap.','Harvest when fruits are firm and fully colored but still glossy',1,'2024-11-13 15:36:18'),(19,'Potatoes','Loose, fertile soil, pH 5.0-6.0','Consistent moisture, especially during tuber formation','Spring','NPK 10-20-20 before planting. Avoid excess nitrogen.','Watch for potato beetles and blight. Use row covers early season.','Harvest when plants yellow and die back, cure in dark place',1,'2024-11-13 15:36:18'),(20,'Rice','Clay or clay loam','Regular flooding with 4-6 inches of water','Kharif (Monsoon)','NPK 120:60:60 kg/ha, split application','Monitor for stem borers and leaf folders. Use neem-based pesticides.','Harvest when 80% of grains turn golden yellow',1,'2024-11-13 16:16:45'),(21,'Wheat','Loam to clay loam','Critical irrigation at crown root initiation, tillering, and grain filling','Rabi (Winter)','NPK 120:60:40 kg/ha, apply before sowing','Watch for rust and aphids. Use recommended fungicides if needed.','Harvest when grains are hard and golden',1,'2024-11-13 16:16:45'),(22,'Cotton','Well-drained black soil','Regular irrigation at flowering and boll formation','Kharif (Monsoon)','NPK 100:50:50 kg/ha, split application','IPM for bollworms. Use pheromone traps.','Pick cotton when bolls are fully open',1,'2024-11-13 16:16:45'),(23,'Rice','Clay or clay loam','Regular flooding with 4-6 inches of water','Kharif (Monsoon)','NPK 120:60:60 kg/ha, split application','Monitor for stem borers and leaf folders. Use neem-based pesticides.','Harvest when 80% of grains turn golden yellow',1,'2024-11-13 16:22:31'),(24,'Wheat','Loam to clay loam','Critical irrigation at crown root initiation, tillering, and grain filling','Rabi (Winter)','NPK 120:60:40 kg/ha, apply before sowing','Watch for rust and aphids. Use recommended fungicides if needed.','Harvest when grains are hard and golden',1,'2024-11-13 16:22:31'),(25,'Cotton','Well-drained black soil','Regular irrigation at flowering and boll formation','Kharif (Monsoon)','NPK 100:50:50 kg/ha, split application','IPM for bollworms. Use pheromone traps.','Pick cotton when bolls are fully open',1,'2024-11-13 16:22:31'),(26,'Tomatoes','Well-draining loamy soil, pH 6.0-6.8','Regular watering, 1-2 inches per week. Avoid overhead watering.','Spring-Summer','NPK 5-10-5, apply organic compost at planting. Side-dress with nitrogen every 4-6 weeks.','Monitor for hornworms and aphids. Use neem oil or insecticidal soap. Practice crop rotation.','Harvest when fruits are firm and fully colored. Pick regularly to encourage production.',1,'2024-11-13 16:22:31'),(27,'Potatoes','Loose, fertile soil with good drainage, pH 5.0-6.0','Consistent moisture, especially during tuber formation. 1-2 inches per week.','Spring','NPK 10-20-20 at planting. Side-dress with nitrogen when plants are 4-6 inches tall.','Watch for potato beetles and blight. Use row covers and proper spacing for air circulation.','Harvest when plants yellow and die back. Cure in dark place for 2 weeks.',1,'2024-11-13 16:22:31'),(28,'Soybeans','Well-draining clay or loam soil, pH 6.0-7.0','Critical irrigation during flowering and pod fill. 20-25 inches during growing season.','Summer','Inoculate seeds with rhizobia bacteria. NPK 0-20-20 at planting.','Scout for bean leaf beetles and stink bugs. Use integrated pest management.','Harvest when 95% of pods have turned brown. Moisture content should be 13-15%.',1,'2024-11-13 16:22:31'),(29,'Sunflowers','Deep, well-draining soil, pH 6.0-7.5','Moderate water needs, drought tolerant once established','Summer','Light fertilizer application, NPK 5-5-5, apply at planting and side-dress every 4-6 weeks.','Protect young plants from birds and deer. Monitor for stem weevils.','Harvest when back of flower head turns yellow-brown and seeds are black.',1,'2024-11-13 16:22:31'),(30,'Rice','Clay or clay loam','Regular flooding with 4-6 inches of water','Kharif (Monsoon)','NPK 120:60:60 kg/ha, split application','Monitor for stem borers and leaf folders. Use neem-based pesticides.','Harvest when 80% of grains turn golden yellow',1,'2024-11-13 16:25:32'),(31,'Wheat','Loam to clay loam','Critical irrigation at crown root initiation, tillering, and grain filling','Rabi (Winter)','NPK 120:60:40 kg/ha, apply before sowing','Watch for rust and aphids. Use recommended fungicides if needed.','Harvest when grains are hard and golden',1,'2024-11-13 16:25:32'),(32,'Cotton','Well-drained black soil','Regular irrigation at flowering and boll formation','Kharif (Monsoon)','NPK 100:50:50 kg/ha, split application','IPM for bollworms. Use pheromone traps.','Pick cotton when bolls are fully open',1,'2024-11-13 16:25:32'),(33,'Tomatoes','Well-draining loamy soil, pH 6.0-6.8','Regular watering, 1-2 inches per week. Avoid overhead watering.','Spring-Summer','NPK 5-10-5, apply organic compost at planting. Side-dress with nitrogen every 4-6 weeks.','Monitor for hornworms and aphids. Use neem oil or insecticidal soap. Practice crop rotation.','Harvest when fruits are firm and fully colored. Pick regularly to encourage production.',1,'2024-11-13 16:25:32'),(34,'Potatoes','Loose, fertile soil with good drainage, pH 5.0-6.0','Consistent moisture, especially during tuber formation. 1-2 inches per week.','Spring','NPK 10-20-20 at planting. Side-dress with nitrogen when plants are 4-6 inches tall.','Watch for potato beetles and blight. Use row covers and proper spacing for air circulation.','Harvest when plants yellow and die back. Cure in dark place for 2 weeks.',1,'2024-11-13 16:25:32'),(35,'Soybeans','Well-draining clay or loam soil, pH 6.0-7.0','Critical irrigation during flowering and pod fill. 20-25 inches during growing season.','Summer','Inoculate seeds with rhizobia bacteria. NPK 0-20-20 at planting.','Scout for bean leaf beetles and stink bugs. Use integrated pest management.','Harvest when 95% of pods have turned brown. Moisture content should be 13-15%.',1,'2024-11-13 16:25:32'),(36,'Sunflowers','Deep, well-draining soil, pH 6.0-7.5','Moderate water needs, drought tolerant once established','Summer','Light fertilizer application, NPK 5-5-5, apply at planting and side-dress every 4-6 weeks.','Protect young plants from birds and deer. Monitor for stem weevils.','Harvest when back of flower head turns yellow-brown and seeds are black.',1,'2024-11-13 16:25:32'),(37,'Rice','Clay or clay loam','Regular flooding with 4-6 inches of water','Kharif (Monsoon)','NPK 120:60:60 kg/ha, split application','Monitor for stem borers and leaf folders. Use neem-based pesticides.','Harvest when 80% of grains turn golden yellow',1,'2024-11-13 16:28:03'),(38,'Wheat','Loam to clay loam','Critical irrigation at crown root initiation, tillering, and grain filling','Rabi (Winter)','NPK 120:60:40 kg/ha, apply before sowing','Watch for rust and aphids. Use recommended fungicides if needed.','Harvest when grains are hard and golden',1,'2024-11-13 16:28:03'),(39,'Cotton','Well-drained black soil','Regular irrigation at flowering and boll formation','Kharif (Monsoon)','NPK 100:50:50 kg/ha, split application','IPM for bollworms. Use pheromone traps.','Pick cotton when bolls are fully open',1,'2024-11-13 16:28:03'),(40,'Tomatoes','Well-draining loamy soil, pH 6.0-6.8','Regular watering, 1-2 inches per week. Avoid overhead watering.','Spring-Summer','NPK 5-10-5, apply organic compost at planting. Side-dress with nitrogen every 4-6 weeks.','Monitor for hornworms and aphids. Use neem oil or insecticidal soap. Practice crop rotation.','Harvest when fruits are firm and fully colored. Pick regularly to encourage production.',1,'2024-11-13 16:28:03'),(41,'Potatoes','Loose, fertile soil with good drainage, pH 5.0-6.0','Consistent moisture, especially during tuber formation. 1-2 inches per week.','Spring','NPK 10-20-20 at planting. Side-dress with nitrogen when plants are 4-6 inches tall.','Watch for potato beetles and blight. Use row covers and proper spacing for air circulation.','Harvest when plants yellow and die back. Cure in dark place for 2 weeks.',1,'2024-11-13 16:28:03'),(42,'Soybeans','Well-draining clay or loam soil, pH 6.0-7.0','Critical irrigation during flowering and pod fill. 20-25 inches during growing season.','Summer','Inoculate seeds with rhizobia bacteria. NPK 0-20-20 at planting.','Scout for bean leaf beetles and stink bugs. Use integrated pest management.','Harvest when 95% of pods have turned brown. Moisture content should be 13-15%.',1,'2024-11-13 16:28:03'),(43,'Sunflowers','Deep, well-draining soil, pH 6.0-7.5','Moderate water needs, drought tolerant once established','Summer','Light fertilizer application, NPK 5-5-5, apply at planting and side-dress every 4-6 weeks.','Protect young plants from birds and deer. Monitor for stem weevils.','Harvest when back of flower head turns yellow-brown and seeds are black.',1,'2024-11-13 16:28:03'),(44,'Rice','Clay or clay loam','Regular flooding with 4-6 inches of water','Kharif (Monsoon)','NPK 120:60:60 kg/ha, split application','Monitor for stem borers and leaf folders. Use neem-based pesticides.','Harvest when 80% of grains turn golden yellow',1,'2024-11-13 16:32:52'),(45,'Wheat','Loam to clay loam','Critical irrigation at crown root initiation, tillering, and grain filling','Rabi (Winter)','NPK 120:60:40 kg/ha, apply before sowing','Watch for rust and aphids. Use recommended fungicides if needed.','Harvest when grains are hard and golden',1,'2024-11-13 16:32:52'),(46,'Cotton','Well-drained black soil','Regular irrigation at flowering and boll formation','Kharif (Monsoon)','NPK 100:50:50 kg/ha, split application','IPM for bollworms. Use pheromone traps.','Pick cotton when bolls are fully open',1,'2024-11-13 16:32:52'),(47,'Tomatoes','Well-draining loamy soil, pH 6.0-6.8','Regular watering, 1-2 inches per week. Avoid overhead watering.','Spring-Summer','NPK 5-10-5, apply organic compost at planting. Side-dress with nitrogen every 4-6 weeks.','Monitor for hornworms and aphids. Use neem oil or insecticidal soap. Practice crop rotation.','Harvest when fruits are firm and fully colored. Pick regularly to encourage production.',1,'2024-11-13 16:32:52'),(48,'Potatoes','Loose, fertile soil with good drainage, pH 5.0-6.0','Consistent moisture, especially during tuber formation. 1-2 inches per week.','Spring','NPK 10-20-20 at planting. Side-dress with nitrogen when plants are 4-6 inches tall.','Watch for potato beetles and blight. Use row covers and proper spacing for air circulation.','Harvest when plants yellow and die back. Cure in dark place for 2 weeks.',1,'2024-11-13 16:32:52'),(49,'Soybeans','Well-draining clay or loam soil, pH 6.0-7.0','Critical irrigation during flowering and pod fill. 20-25 inches during growing season.','Summer','Inoculate seeds with rhizobia bacteria. NPK 0-20-20 at planting.','Scout for bean leaf beetles and stink bugs. Use integrated pest management.','Harvest when 95% of pods have turned brown. Moisture content should be 13-15%.',1,'2024-11-13 16:32:52'),(50,'Sunflowers','Deep, well-draining soil, pH 6.0-7.5','Moderate water needs, drought tolerant once established','Summer','Light fertilizer application, NPK 5-5-5, apply at planting and side-dress every 4-6 weeks.','Protect young plants from birds and deer. Monitor for stem weevils.','Harvest when back of flower head turns yellow-brown and seeds are black.',1,'2024-11-13 16:32:52'),(51,'Rice','Clay or clay loam','Regular flooding with 4-6 inches of water','Kharif (Monsoon)','NPK 120:60:60 kg/ha, split application','Monitor for stem borers and leaf folders. Use neem-based pesticides.','Harvest when 80% of grains turn golden yellow',1,'2024-11-13 16:34:52'),(52,'Wheat','Loam to clay loam','Critical irrigation at crown root initiation, tillering, and grain filling','Rabi (Winter)','NPK 120:60:40 kg/ha, apply before sowing','Watch for rust and aphids. Use recommended fungicides if needed.','Harvest when grains are hard and golden',1,'2024-11-13 16:34:52'),(53,'Cotton','Well-drained black soil','Regular irrigation at flowering and boll formation','Kharif (Monsoon)','NPK 100:50:50 kg/ha, split application','IPM for bollworms. Use pheromone traps.','Pick cotton when bolls are fully open',1,'2024-11-13 16:34:52'),(54,'Tomatoes','Well-draining loamy soil, pH 6.0-6.8','Regular watering, 1-2 inches per week. Avoid overhead watering.','Spring-Summer','NPK 5-10-5, apply organic compost at planting. Side-dress with nitrogen every 4-6 weeks.','Monitor for hornworms and aphids. Use neem oil or insecticidal soap. Practice crop rotation.','Harvest when fruits are firm and fully colored. Pick regularly to encourage production.',1,'2024-11-13 16:34:52'),(55,'Potatoes','Loose, fertile soil with good drainage, pH 5.0-6.0','Consistent moisture, especially during tuber formation. 1-2 inches per week.','Spring','NPK 10-20-20 at planting. Side-dress with nitrogen when plants are 4-6 inches tall.','Watch for potato beetles and blight. Use row covers and proper spacing for air circulation.','Harvest when plants yellow and die back. Cure in dark place for 2 weeks.',1,'2024-11-13 16:34:52'),(56,'Soybeans','Well-draining clay or loam soil, pH 6.0-7.0','Critical irrigation during flowering and pod fill. 20-25 inches during growing season.','Summer','Inoculate seeds with rhizobia bacteria. NPK 0-20-20 at planting.','Scout for bean leaf beetles and stink bugs. Use integrated pest management.','Harvest when 95% of pods have turned brown. Moisture content should be 13-15%.',1,'2024-11-13 16:34:52'),(57,'Sunflowers','Deep, well-draining soil, pH 6.0-7.5','Moderate water needs, drought tolerant once established','Summer','Light fertilizer application, NPK 5-5-5, apply at planting and side-dress every 4-6 weeks.','Protect young plants from birds and deer. Monitor for stem weevils.','Harvest when back of flower head turns yellow-brown and seeds are black.',1,'2024-11-13 16:34:52'),(58,'Rice','Clay or clay loam','Regular flooding with 4-6 inches of water','Kharif (Monsoon)','NPK 120:60:60 kg/ha, split application','Monitor for stem borers and leaf folders. Use neem-based pesticides.','Harvest when 80% of grains turn golden yellow',1,'2024-11-13 16:35:47'),(59,'Wheat','Loam to clay loam','Critical irrigation at crown root initiation, tillering, and grain filling','Rabi (Winter)','NPK 120:60:40 kg/ha, apply before sowing','Watch for rust and aphids. Use recommended fungicides if needed.','Harvest when grains are hard and golden',1,'2024-11-13 16:35:47'),(60,'Cotton','Well-drained black soil','Regular irrigation at flowering and boll formation','Kharif (Monsoon)','NPK 100:50:50 kg/ha, split application','IPM for bollworms. Use pheromone traps.','Pick cotton when bolls are fully open',1,'2024-11-13 16:35:47'),(61,'Tomatoes','Well-draining loamy soil, pH 6.0-6.8','Regular watering, 1-2 inches per week. Avoid overhead watering.','Spring-Summer','NPK 5-10-5, apply organic compost at planting. Side-dress with nitrogen every 4-6 weeks.','Monitor for hornworms and aphids. Use neem oil or insecticidal soap. Practice crop rotation.','Harvest when fruits are firm and fully colored. Pick regularly to encourage production.',1,'2024-11-13 16:35:47'),(62,'Potatoes','Loose, fertile soil with good drainage, pH 5.0-6.0','Consistent moisture, especially during tuber formation. 1-2 inches per week.','Spring','NPK 10-20-20 at planting. Side-dress with nitrogen when plants are 4-6 inches tall.','Watch for potato beetles and blight. Use row covers and proper spacing for air circulation.','Harvest when plants yellow and die back. Cure in dark place for 2 weeks.',1,'2024-11-13 16:35:47'),(63,'Soybeans','Well-draining clay or loam soil, pH 6.0-7.0','Critical irrigation during flowering and pod fill. 20-25 inches during growing season.','Summer','Inoculate seeds with rhizobia bacteria. NPK 0-20-20 at planting.','Scout for bean leaf beetles and stink bugs. Use integrated pest management.','Harvest when 95% of pods have turned brown. Moisture content should be 13-15%.',1,'2024-11-13 16:35:47'),(64,'Sunflowers','Deep, well-draining soil, pH 6.0-7.5','Moderate water needs, drought tolerant once established','Summer','Light fertilizer application, NPK 5-5-5, apply at planting and side-dress every 4-6 weeks.','Protect young plants from birds and deer. Monitor for stem weevils.','Harvest when back of flower head turns yellow-brown and seeds are black.',1,'2024-11-13 16:35:47'),(65,'Rice','Clay or clay loam','Regular flooding with 4-6 inches of water','Kharif (Monsoon)','NPK 120:60:60 kg/ha, split application','Monitor for stem borers and leaf folders. Use neem-based pesticides.','Harvest when 80% of grains turn golden yellow',1,'2024-11-13 16:37:46'),(66,'Wheat','Loam to clay loam','Critical irrigation at crown root initiation, tillering, and grain filling','Rabi (Winter)','NPK 120:60:40 kg/ha, apply before sowing','Watch for rust and aphids. Use recommended fungicides if needed.','Harvest when grains are hard and golden',1,'2024-11-13 16:37:46'),(67,'Cotton','Well-drained black soil','Regular irrigation at flowering and boll formation','Kharif (Monsoon)','NPK 100:50:50 kg/ha, split application','IPM for bollworms. Use pheromone traps.','Pick cotton when bolls are fully open',1,'2024-11-13 16:37:46'),(68,'Tomatoes','Well-draining loamy soil, pH 6.0-6.8','Regular watering, 1-2 inches per week. Avoid overhead watering.','Spring-Summer','NPK 5-10-5, apply organic compost at planting. Side-dress with nitrogen every 4-6 weeks.','Monitor for hornworms and aphids. Use neem oil or insecticidal soap. Practice crop rotation.','Harvest when fruits are firm and fully colored. Pick regularly to encourage production.',1,'2024-11-13 16:37:46'),(69,'Potatoes','Loose, fertile soil with good drainage, pH 5.0-6.0','Consistent moisture, especially during tuber formation. 1-2 inches per week.','Spring','NPK 10-20-20 at planting. Side-dress with nitrogen when plants are 4-6 inches tall.','Watch for potato beetles and blight. Use row covers and proper spacing for air circulation.','Harvest when plants yellow and die back. Cure in dark place for 2 weeks.',1,'2024-11-13 16:37:46'),(70,'Soybeans','Well-draining clay or loam soil, pH 6.0-7.0','Critical irrigation during flowering and pod fill. 20-25 inches during growing season.','Summer','Inoculate seeds with rhizobia bacteria. NPK 0-20-20 at planting.','Scout for bean leaf beetles and stink bugs. Use integrated pest management.','Harvest when 95% of pods have turned brown. Moisture content should be 13-15%.',1,'2024-11-13 16:37:46'),(71,'Sunflowers','Deep, well-draining soil, pH 6.0-7.5','Moderate water needs, drought tolerant once established','Summer','Light fertilizer application, NPK 5-5-5, apply at planting and side-dress every 4-6 weeks.','Protect young plants from birds and deer. Monitor for stem weevils.','Harvest when back of flower head turns yellow-brown and seeds are black.',1,'2024-11-13 16:37:46'),(72,'Rice','Clay or clay loam','Regular flooding with 4-6 inches of water','Kharif (Monsoon)','NPK 120:60:60 kg/ha, split application','Monitor for stem borers and leaf folders. Use neem-based pesticides.','Harvest when 80% of grains turn golden yellow',1,'2024-11-13 16:39:25'),(73,'Wheat','Loam to clay loam','Critical irrigation at crown root initiation, tillering, and grain filling','Rabi (Winter)','NPK 120:60:40 kg/ha, apply before sowing','Watch for rust and aphids. Use recommended fungicides if needed.','Harvest when grains are hard and golden',1,'2024-11-13 16:39:25'),(74,'Cotton','Well-drained black soil','Regular irrigation at flowering and boll formation','Kharif (Monsoon)','NPK 100:50:50 kg/ha, split application','IPM for bollworms. Use pheromone traps.','Pick cotton when bolls are fully open',1,'2024-11-13 16:39:25'),(75,'Tomatoes','Well-draining loamy soil, pH 6.0-6.8','Regular watering, 1-2 inches per week. Avoid overhead watering.','Spring-Summer','NPK 5-10-5, apply organic compost at planting. Side-dress with nitrogen every 4-6 weeks.','Monitor for hornworms and aphids. Use neem oil or insecticidal soap. Practice crop rotation.','Harvest when fruits are firm and fully colored. Pick regularly to encourage production.',1,'2024-11-13 16:39:25'),(76,'Potatoes','Loose, fertile soil with good drainage, pH 5.0-6.0','Consistent moisture, especially during tuber formation. 1-2 inches per week.','Spring','NPK 10-20-20 at planting. Side-dress with nitrogen when plants are 4-6 inches tall.','Watch for potato beetles and blight. Use row covers and proper spacing for air circulation.','Harvest when plants yellow and die back. Cure in dark place for 2 weeks.',1,'2024-11-13 16:39:25'),(77,'Soybeans','Well-draining clay or loam soil, pH 6.0-7.0','Critical irrigation during flowering and pod fill. 20-25 inches during growing season.','Summer','Inoculate seeds with rhizobia bacteria. NPK 0-20-20 at planting.','Scout for bean leaf beetles and stink bugs. Use integrated pest management.','Harvest when 95% of pods have turned brown. Moisture content should be 13-15%.',1,'2024-11-13 16:39:25'),(78,'Sunflowers','Deep, well-draining soil, pH 6.0-7.5','Moderate water needs, drought tolerant once established','Summer','Light fertilizer application, NPK 5-5-5, apply at planting and side-dress every 4-6 weeks.','Protect young plants from birds and deer. Monitor for stem weevils.','Harvest when back of flower head turns yellow-brown and seeds are black.',1,'2024-11-13 16:39:25'),(79,'Rice','Clay or clay loam','Regular flooding with 4-6 inches of water','Kharif (Monsoon)','NPK 120:60:60 kg/ha, split application','Monitor for stem borers and leaf folders. Use neem-based pesticides.','Harvest when 80% of grains turn golden yellow',1,'2024-11-13 17:04:11'),(80,'Wheat','Loam to clay loam','Critical irrigation at crown root initiation, tillering, and grain filling','Rabi (Winter)','NPK 120:60:40 kg/ha, apply before sowing','Watch for rust and aphids. Use recommended fungicides if needed.','Harvest when grains are hard and golden',1,'2024-11-13 17:04:11'),(81,'Cotton','Well-drained black soil','Regular irrigation at flowering and boll formation','Kharif (Monsoon)','NPK 100:50:50 kg/ha, split application','IPM for bollworms. Use pheromone traps.','Pick cotton when bolls are fully open',1,'2024-11-13 17:04:11'),(82,'Tomatoes','Well-draining loamy soil, pH 6.0-6.8','Regular watering, 1-2 inches per week. Avoid overhead watering.','Spring-Summer','NPK 5-10-5, apply organic compost at planting. Side-dress with nitrogen every 4-6 weeks.','Monitor for hornworms and aphids. Use neem oil or insecticidal soap. Practice crop rotation.','Harvest when fruits are firm and fully colored. Pick regularly to encourage production.',1,'2024-11-13 17:04:11'),(83,'Potatoes','Loose, fertile soil with good drainage, pH 5.0-6.0','Consistent moisture, especially during tuber formation. 1-2 inches per week.','Spring','NPK 10-20-20 at planting. Side-dress with nitrogen when plants are 4-6 inches tall.','Watch for potato beetles and blight. Use row covers and proper spacing for air circulation.','Harvest when plants yellow and die back. Cure in dark place for 2 weeks.',1,'2024-11-13 17:04:11'),(84,'Soybeans','Well-draining clay or loam soil, pH 6.0-7.0','Critical irrigation during flowering and pod fill. 20-25 inches during growing season.','Summer','Inoculate seeds with rhizobia bacteria. NPK 0-20-20 at planting.','Scout for bean leaf beetles and stink bugs. Use integrated pest management.','Harvest when 95% of pods have turned brown. Moisture content should be 13-15%.',1,'2024-11-13 17:04:11'),(85,'Sunflowers','Deep, well-draining soil, pH 6.0-7.5','Moderate water needs, drought tolerant once established','Summer','Light fertilizer application, NPK 5-5-5, apply at planting and side-dress every 4-6 weeks.','Protect young plants from birds and deer. Monitor for stem weevils.','Harvest when back of flower head turns yellow-brown and seeds are black.',1,'2024-11-13 17:04:11'),(86,'Rice','Clay or clay loam','Regular flooding with 4-6 inches of water','Kharif (Monsoon)','NPK 120:60:60 kg/ha, split application','Monitor for stem borers and leaf folders. Use neem-based pesticides.','Harvest when 80% of grains turn golden yellow',1,'2024-11-13 17:07:19'),(87,'Wheat','Loam to clay loam','Critical irrigation at crown root initiation, tillering, and grain filling','Rabi (Winter)','NPK 120:60:40 kg/ha, apply before sowing','Watch for rust and aphids. Use recommended fungicides if needed.','Harvest when grains are hard and golden',1,'2024-11-13 17:07:19'),(88,'Cotton','Well-drained black soil','Regular irrigation at flowering and boll formation','Kharif (Monsoon)','NPK 100:50:50 kg/ha, split application','IPM for bollworms. Use pheromone traps.','Pick cotton when bolls are fully open',1,'2024-11-13 17:07:19'),(89,'Tomatoes','Well-draining loamy soil, pH 6.0-6.8','Regular watering, 1-2 inches per week. Avoid overhead watering.','Spring-Summer','NPK 5-10-5, apply organic compost at planting. Side-dress with nitrogen every 4-6 weeks.','Monitor for hornworms and aphids. Use neem oil or insecticidal soap. Practice crop rotation.','Harvest when fruits are firm and fully colored. Pick regularly to encourage production.',1,'2024-11-13 17:07:19'),(90,'Potatoes','Loose, fertile soil with good drainage, pH 5.0-6.0','Consistent moisture, especially during tuber formation. 1-2 inches per week.','Spring','NPK 10-20-20 at planting. Side-dress with nitrogen when plants are 4-6 inches tall.','Watch for potato beetles and blight. Use row covers and proper spacing for air circulation.','Harvest when plants yellow and die back. Cure in dark place for 2 weeks.',1,'2024-11-13 17:07:19'),(91,'Soybeans','Well-draining clay or loam soil, pH 6.0-7.0','Critical irrigation during flowering and pod fill. 20-25 inches during growing season.','Summer','Inoculate seeds with rhizobia bacteria. NPK 0-20-20 at planting.','Scout for bean leaf beetles and stink bugs. Use integrated pest management.','Harvest when 95% of pods have turned brown. Moisture content should be 13-15%.',1,'2024-11-13 17:07:19'),(92,'Sunflowers','Deep, well-draining soil, pH 6.0-7.5','Moderate water needs, drought tolerant once established','Summer','Light fertilizer application, NPK 5-5-5, apply at planting and side-dress every 4-6 weeks.','Protect young plants from birds and deer. Monitor for stem weevils.','Harvest when back of flower head turns yellow-brown and seeds are black.',1,'2024-11-13 17:07:19'),(93,'Rice','Clay or clay loam','Regular flooding with 4-6 inches of water','Kharif (Monsoon)','NPK 120:60:60 kg/ha, split application','Monitor for stem borers and leaf folders. Use neem-based pesticides.','Harvest when 80% of grains turn golden yellow',1,'2024-11-13 17:12:23'),(94,'Wheat','Loam to clay loam','Critical irrigation at crown root initiation, tillering, and grain filling','Rabi (Winter)','NPK 120:60:40 kg/ha, apply before sowing','Watch for rust and aphids. Use recommended fungicides if needed.','Harvest when grains are hard and golden',1,'2024-11-13 17:12:23'),(95,'Cotton','Well-drained black soil','Regular irrigation at flowering and boll formation','Kharif (Monsoon)','NPK 100:50:50 kg/ha, split application','IPM for bollworms. Use pheromone traps.','Pick cotton when bolls are fully open',1,'2024-11-13 17:12:23'),(96,'Tomatoes','Well-draining loamy soil, pH 6.0-6.8','Regular watering, 1-2 inches per week. Avoid overhead watering.','Spring-Summer','NPK 5-10-5, apply organic compost at planting. Side-dress with nitrogen every 4-6 weeks.','Monitor for hornworms and aphids. Use neem oil or insecticidal soap. Practice crop rotation.','Harvest when fruits are firm and fully colored. Pick regularly to encourage production.',1,'2024-11-13 17:12:23'),(97,'Potatoes','Loose, fertile soil with good drainage, pH 5.0-6.0','Consistent moisture, especially during tuber formation. 1-2 inches per week.','Spring','NPK 10-20-20 at planting. Side-dress with nitrogen when plants are 4-6 inches tall.','Watch for potato beetles and blight. Use row covers and proper spacing for air circulation.','Harvest when plants yellow and die back. Cure in dark place for 2 weeks.',1,'2024-11-13 17:12:23'),(98,'Soybeans','Well-draining clay or loam soil, pH 6.0-7.0','Critical irrigation during flowering and pod fill. 20-25 inches during growing season.','Summer','Inoculate seeds with rhizobia bacteria. NPK 0-20-20 at planting.','Scout for bean leaf beetles and stink bugs. Use integrated pest management.','Harvest when 95% of pods have turned brown. Moisture content should be 13-15%.',1,'2024-11-13 17:12:23'),(99,'Sunflowers','Deep, well-draining soil, pH 6.0-7.5','Moderate water needs, drought tolerant once established','Summer','Light fertilizer application, NPK 5-5-5, apply at planting and side-dress every 4-6 weeks.','Protect young plants from birds and deer. Monitor for stem weevils.','Harvest when back of flower head turns yellow-brown and seeds are black.',1,'2024-11-13 17:12:23'),(100,'Rice','Clay or clay loam','Regular flooding with 4-6 inches of water','Kharif (Monsoon)','NPK 120:60:60 kg/ha, split application','Monitor for stem borers and leaf folders. Use neem-based pesticides.','Harvest when 80% of grains turn golden yellow',1,'2024-11-13 17:14:36'),(101,'Wheat','Loam to clay loam','Critical irrigation at crown root initiation, tillering, and grain filling','Rabi (Winter)','NPK 120:60:40 kg/ha, apply before sowing','Watch for rust and aphids. Use recommended fungicides if needed.','Harvest when grains are hard and golden',1,'2024-11-13 17:14:36'),(102,'Cotton','Well-drained black soil','Regular irrigation at flowering and boll formation','Kharif (Monsoon)','NPK 100:50:50 kg/ha, split application','IPM for bollworms. Use pheromone traps.','Pick cotton when bolls are fully open',1,'2024-11-13 17:14:36'),(103,'Tomatoes','Well-draining loamy soil, pH 6.0-6.8','Regular watering, 1-2 inches per week. Avoid overhead watering.','Spring-Summer','NPK 5-10-5, apply organic compost at planting. Side-dress with nitrogen every 4-6 weeks.','Monitor for hornworms and aphids. Use neem oil or insecticidal soap. Practice crop rotation.','Harvest when fruits are firm and fully colored. Pick regularly to encourage production.',1,'2024-11-13 17:14:36'),(104,'Potatoes','Loose, fertile soil with good drainage, pH 5.0-6.0','Consistent moisture, especially during tuber formation. 1-2 inches per week.','Spring','NPK 10-20-20 at planting. Side-dress with nitrogen when plants are 4-6 inches tall.','Watch for potato beetles and blight. Use row covers and proper spacing for air circulation.','Harvest when plants yellow and die back. Cure in dark place for 2 weeks.',1,'2024-11-13 17:14:36'),(105,'Soybeans','Well-draining clay or loam soil, pH 6.0-7.0','Critical irrigation during flowering and pod fill. 20-25 inches during growing season.','Summer','Inoculate seeds with rhizobia bacteria. NPK 0-20-20 at planting.','Scout for bean leaf beetles and stink bugs. Use integrated pest management.','Harvest when 95% of pods have turned brown. Moisture content should be 13-15%.',1,'2024-11-13 17:14:36'),(106,'Sunflowers','Deep, well-draining soil, pH 6.0-7.5','Moderate water needs, drought tolerant once established','Summer','Light fertilizer application, NPK 5-5-5, apply at planting and side-dress every 4-6 weeks.','Protect young plants from birds and deer. Monitor for stem weevils.','Harvest when back of flower head turns yellow-brown and seeds are black.',1,'2024-11-13 17:14:36'),(107,'Rice','Clay or clay loam','Regular flooding with 4-6 inches of water','Kharif (Monsoon)','NPK 120:60:60 kg/ha, split application','Monitor for stem borers and leaf folders. Use neem-based pesticides.','Harvest when 80% of grains turn golden yellow',1,'2024-11-13 17:18:17'),(108,'Wheat','Loam to clay loam','Critical irrigation at crown root initiation, tillering, and grain filling','Rabi (Winter)','NPK 120:60:40 kg/ha, apply before sowing','Watch for rust and aphids. Use recommended fungicides if needed.','Harvest when grains are hard and golden',1,'2024-11-13 17:18:17'),(109,'Cotton','Well-drained black soil','Regular irrigation at flowering and boll formation','Kharif (Monsoon)','NPK 100:50:50 kg/ha, split application','IPM for bollworms. Use pheromone traps.','Pick cotton when bolls are fully open',1,'2024-11-13 17:18:17'),(110,'Tomatoes','Well-draining loamy soil, pH 6.0-6.8','Regular watering, 1-2 inches per week. Avoid overhead watering.','Spring-Summer','NPK 5-10-5, apply organic compost at planting. Side-dress with nitrogen every 4-6 weeks.','Monitor for hornworms and aphids. Use neem oil or insecticidal soap. Practice crop rotation.','Harvest when fruits are firm and fully colored. Pick regularly to encourage production.',1,'2024-11-13 17:18:17'),(111,'Potatoes','Loose, fertile soil with good drainage, pH 5.0-6.0','Consistent moisture, especially during tuber formation. 1-2 inches per week.','Spring','NPK 10-20-20 at planting. Side-dress with nitrogen when plants are 4-6 inches tall.','Watch for potato beetles and blight. Use row covers and proper spacing for air circulation.','Harvest when plants yellow and die back. Cure in dark place for 2 weeks.',1,'2024-11-13 17:18:17'),(112,'Soybeans','Well-draining clay or loam soil, pH 6.0-7.0','Critical irrigation during flowering and pod fill. 20-25 inches during growing season.','Summer','Inoculate seeds with rhizobia bacteria. NPK 0-20-20 at planting.','Scout for bean leaf beetles and stink bugs. Use integrated pest management.','Harvest when 95% of pods have turned brown. Moisture content should be 13-15%.',1,'2024-11-13 17:18:17'),(113,'Sunflowers','Deep, well-draining soil, pH 6.0-7.5','Moderate water needs, drought tolerant once established','Summer','Light fertilizer application, NPK 5-5-5, apply at planting and side-dress every 4-6 weeks.','Protect young plants from birds and deer. Monitor for stem weevils.','Harvest when back of flower head turns yellow-brown and seeds are black.',1,'2024-11-13 17:18:17'),(114,'Rice','Clay or clay loam','Regular flooding with 4-6 inches of water','Kharif (Monsoon)','NPK 120:60:60 kg/ha, split application','Monitor for stem borers and leaf folders. Use neem-based pesticides.','Harvest when 80% of grains turn golden yellow',1,'2024-11-13 17:23:45'),(115,'Wheat','Loam to clay loam','Critical irrigation at crown root initiation, tillering, and grain filling','Rabi (Winter)','NPK 120:60:40 kg/ha, apply before sowing','Watch for rust and aphids. Use recommended fungicides if needed.','Harvest when grains are hard and golden',1,'2024-11-13 17:23:45'),(116,'Cotton','Well-drained black soil','Regular irrigation at flowering and boll formation','Kharif (Monsoon)','NPK 100:50:50 kg/ha, split application','IPM for bollworms. Use pheromone traps.','Pick cotton when bolls are fully open',1,'2024-11-13 17:23:45'),(117,'Tomatoes','Well-draining loamy soil, pH 6.0-6.8','Regular watering, 1-2 inches per week. Avoid overhead watering.','Spring-Summer','NPK 5-10-5, apply organic compost at planting. Side-dress with nitrogen every 4-6 weeks.','Monitor for hornworms and aphids. Use neem oil or insecticidal soap. Practice crop rotation.','Harvest when fruits are firm and fully colored. Pick regularly to encourage production.',1,'2024-11-13 17:23:45'),(118,'Potatoes','Loose, fertile soil with good drainage, pH 5.0-6.0','Consistent moisture, especially during tuber formation. 1-2 inches per week.','Spring','NPK 10-20-20 at planting. Side-dress with nitrogen when plants are 4-6 inches tall.','Watch for potato beetles and blight. Use row covers and proper spacing for air circulation.','Harvest when plants yellow and die back. Cure in dark place for 2 weeks.',1,'2024-11-13 17:23:45'),(119,'Soybeans','Well-draining clay or loam soil, pH 6.0-7.0','Critical irrigation during flowering and pod fill. 20-25 inches during growing season.','Summer','Inoculate seeds with rhizobia bacteria. NPK 0-20-20 at planting.','Scout for bean leaf beetles and stink bugs. Use integrated pest management.','Harvest when 95% of pods have turned brown. Moisture content should be 13-15%.',1,'2024-11-13 17:23:45'),(120,'Sunflowers','Deep, well-draining soil, pH 6.0-7.5','Moderate water needs, drought tolerant once established','Summer','Light fertilizer application, NPK 5-5-5, apply at planting and side-dress every 4-6 weeks.','Protect young plants from birds and deer. Monitor for stem weevils.','Harvest when back of flower head turns yellow-brown and seeds are black.',1,'2024-11-13 17:23:45'),(121,'Rice','Clay or clay loam','Regular flooding with 4-6 inches of water','Kharif (Monsoon)','NPK 120:60:60 kg/ha, split application','Monitor for stem borers and leaf folders. Use neem-based pesticides.','Harvest when 80% of grains turn golden yellow',1,'2024-11-13 17:24:37'),(122,'Wheat','Loam to clay loam','Critical irrigation at crown root initiation, tillering, and grain filling','Rabi (Winter)','NPK 120:60:40 kg/ha, apply before sowing','Watch for rust and aphids. Use recommended fungicides if needed.','Harvest when grains are hard and golden',1,'2024-11-13 17:24:37'),(123,'Cotton','Well-drained black soil','Regular irrigation at flowering and boll formation','Kharif (Monsoon)','NPK 100:50:50 kg/ha, split application','IPM for bollworms. Use pheromone traps.','Pick cotton when bolls are fully open',1,'2024-11-13 17:24:37'),(124,'Tomatoes','Well-draining loamy soil, pH 6.0-6.8','Regular watering, 1-2 inches per week. Avoid overhead watering.','Spring-Summer','NPK 5-10-5, apply organic compost at planting. Side-dress with nitrogen every 4-6 weeks.','Monitor for hornworms and aphids. Use neem oil or insecticidal soap. Practice crop rotation.','Harvest when fruits are firm and fully colored. Pick regularly to encourage production.',1,'2024-11-13 17:24:37'),(125,'Potatoes','Loose, fertile soil with good drainage, pH 5.0-6.0','Consistent moisture, especially during tuber formation. 1-2 inches per week.','Spring','NPK 10-20-20 at planting. Side-dress with nitrogen when plants are 4-6 inches tall.','Watch for potato beetles and blight. Use row covers and proper spacing for air circulation.','Harvest when plants yellow and die back. Cure in dark place for 2 weeks.',1,'2024-11-13 17:24:37'),(126,'Soybeans','Well-draining clay or loam soil, pH 6.0-7.0','Critical irrigation during flowering and pod fill. 20-25 inches during growing season.','Summer','Inoculate seeds with rhizobia bacteria. NPK 0-20-20 at planting.','Scout for bean leaf beetles and stink bugs. Use integrated pest management.','Harvest when 95% of pods have turned brown. Moisture content should be 13-15%.',1,'2024-11-13 17:24:37'),(127,'Sunflowers','Deep, well-draining soil, pH 6.0-7.5','Moderate water needs, drought tolerant once established','Summer','Light fertilizer application, NPK 5-5-5, apply at planting and side-dress every 4-6 weeks.','Protect young plants from birds and deer. Monitor for stem weevils.','Harvest when back of flower head turns yellow-brown and seeds are black.',1,'2024-11-13 17:24:37'),(128,'Rice','Clay or clay loam','Regular flooding with 4-6 inches of water','Kharif (Monsoon)','NPK 120:60:60 kg/ha, split application','Monitor for stem borers and leaf folders. Use neem-based pesticides.','Harvest when 80% of grains turn golden yellow',1,'2024-11-13 17:27:57'),(129,'Wheat','Loam to clay loam','Critical irrigation at crown root initiation, tillering, and grain filling','Rabi (Winter)','NPK 120:60:40 kg/ha, apply before sowing','Watch for rust and aphids. Use recommended fungicides if needed.','Harvest when grains are hard and golden',1,'2024-11-13 17:27:57'),(130,'Cotton','Well-drained black soil','Regular irrigation at flowering and boll formation','Kharif (Monsoon)','NPK 100:50:50 kg/ha, split application','IPM for bollworms. Use pheromone traps.','Pick cotton when bolls are fully open',1,'2024-11-13 17:27:57'),(131,'Tomatoes','Well-draining loamy soil, pH 6.0-6.8','Regular watering, 1-2 inches per week. Avoid overhead watering.','Spring-Summer','NPK 5-10-5, apply organic compost at planting. Side-dress with nitrogen every 4-6 weeks.','Monitor for hornworms and aphids. Use neem oil or insecticidal soap. Practice crop rotation.','Harvest when fruits are firm and fully colored. Pick regularly to encourage production.',1,'2024-11-13 17:27:57'),(132,'Potatoes','Loose, fertile soil with good drainage, pH 5.0-6.0','Consistent moisture, especially during tuber formation. 1-2 inches per week.','Spring','NPK 10-20-20 at planting. Side-dress with nitrogen when plants are 4-6 inches tall.','Watch for potato beetles and blight. Use row covers and proper spacing for air circulation.','Harvest when plants yellow and die back. Cure in dark place for 2 weeks.',1,'2024-11-13 17:27:57'),(133,'Soybeans','Well-draining clay or loam soil, pH 6.0-7.0','Critical irrigation during flowering and pod fill. 20-25 inches during growing season.','Summer','Inoculate seeds with rhizobia bacteria. NPK 0-20-20 at planting.','Scout for bean leaf beetles and stink bugs. Use integrated pest management.','Harvest when 95% of pods have turned brown. Moisture content should be 13-15%.',1,'2024-11-13 17:27:57'),(134,'Sunflowers','Deep, well-draining soil, pH 6.0-7.5','Moderate water needs, drought tolerant once established','Summer','Light fertilizer application, NPK 5-5-5, apply at planting and side-dress every 4-6 weeks.','Protect young plants from birds and deer. Monitor for stem weevils.','Harvest when back of flower head turns yellow-brown and seeds are black.',1,'2024-11-13 17:27:57');
/*!40000 ALTER TABLE `crop_guides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crops`
--

DROP TABLE IF EXISTS `crops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crops` (
  `id` int NOT NULL AUTO_INCREMENT,
  `farmer_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `area` decimal(10,2) NOT NULL,
  `planting_date` date NOT NULL,
  `expected_harvest` date NOT NULL,
  `status` enum('growing','harvested','failed') NOT NULL DEFAULT 'growing',
  `notes` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `farmer_id` (`farmer_id`),
  CONSTRAINT `crops_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crops`
--

LOCK TABLES `crops` WRITE;
/*!40000 ALTER TABLE `crops` DISABLE KEYS */;
INSERT INTO `crops` VALUES (1,5,'ginger',2.00,'2024-01-11','2024-12-01','growing','1','2024-11-13 14:42:18'),(2,5,'tomato',8.00,'2024-05-22','2024-12-22','growing','a','2024-11-13 16:43:10'),(3,7,'potato',15.00,'2024-02-02','2024-09-12','growing','a','2024-11-13 16:44:36'),(4,5,'pepper',8.00,'2023-12-12','2024-12-12','growing','a','2024-11-13 19:47:43');
/*!40000 ALTER TABLE `crops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `farmer_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `area` decimal(10,2) NOT NULL,
  `location` varchar(255) NOT NULL,
  `soil_type` varchar(255) NOT NULL,
  `soil_ph` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `farmer_id` (`farmer_id`),
  CONSTRAINT `fields_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,5,'ha',5.00,'hassan','black','5','2024-11-13 17:42:43'),(2,7,'aa',6.00,'belur','red','3','2024-11-13 17:44:13'),(3,5,'bb',6.00,'chikmagalur','red','4','2024-11-13 19:47:01');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `interest_rate` decimal(5,2) NOT NULL,
  `term_months` int NOT NULL,
  `type` varchar(100) NOT NULL,
  `status` enum('pending','approved','rejected','paid') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
INSERT INTO `loans` VALUES (1,5,12000.00,9.00,24,'Land Development','approved','2024-11-13 13:31:26','2024-11-13 13:32:01'),(2,7,16850.00,8.50,36,'Equipment Financing','rejected','2024-11-13 13:46:32','2024-11-13 13:59:07'),(3,7,15000.00,9.00,24,'Land Development','approved','2024-11-13 16:43:47','2024-11-13 17:01:40'),(4,5,1500000.00,8.50,36,'Equipment Financing','rejected','2024-11-14 04:21:29','2024-11-14 16:39:55'),(5,7,150000.00,8.50,36,'Equipment Financing','approved','2024-11-14 16:39:20','2024-11-14 16:39:53');
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price_per_unit` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,5,4,1500.00,6000.00),(2,2,7,1,1300.00,1300.00),(3,2,6,3,1350.00,4050.00),(4,2,5,3,1500.00,4500.00),(5,3,7,1,1300.00,1300.00),(6,3,6,4,1350.00,5400.00),(7,4,7,1,1300.00,1300.00),(8,4,6,1,1350.00,1350.00),(9,4,5,1,1500.00,1500.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','processing','completed','cancelled') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,5,6000.00,'pending','2024-11-13 13:31:04','2024-11-13 13:31:04'),(2,7,9850.00,'pending','2024-11-13 13:46:55','2024-11-13 13:46:55'),(3,5,6700.00,'pending','2024-11-13 19:48:00','2024-11-13 19:48:00'),(4,7,4150.00,'pending','2024-11-14 16:38:45','2024-11-14 16:38:45');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_order_status_update` AFTER UPDATE ON `orders` FOR EACH ROW BEGIN
    IF NEW.status != OLD.status THEN
        INSERT INTO activity_logs (action, table_name, record_id, changes)
        VALUES (
            'STATUS_UPDATE',
            'orders',
            NEW.id,
            JSON_OBJECT('old_status', OLD.status, 'new_status', NEW.status)
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category` enum('Seeds','Fertilizers','Pesticides') NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `image_url` text,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (5,'15-15-15','Fertilizers',1500.00,1192,'https://5.imimg.com/data5/SELLER/Default/2022/2/ZE/PJ/NE/16301773/gromor-15-15-15-09-fertiliser-1000x1000.png','55','2024-11-13 13:29:57','2024-11-14 16:38:45'),(6,'HYTECH','Seeds',1350.00,1992,'https://agrisathi.com/wp-content/uploads/2024/06/Hytech-5106-1.jpg','1','2024-11-13 13:43:26','2024-11-14 16:38:45'),(7,'ISOBIAN','Pesticides',1300.00,197,'https://www.agriplexindia.com/cdn/shop/products/isabion_4b38f885-0724-4633-93c4-058d96cee6e4.png?v=1678448291','1','2024-11-13 13:45:05','2024-11-14 16:38:45');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_product_update` AFTER UPDATE ON `products` FOR EACH ROW BEGIN
    INSERT INTO activity_logs (action, table_name, record_id, changes)
    VALUES (
        'UPDATE',
        'products',
        NEW.id,
        JSON_OBJECT(
            'old_stock', OLD.stock,
            'new_stock', NEW.stock,
            'old_price', OLD.price,
            'new_price', NEW.price
        )
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','farmer') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@agromanage.com','$2a$10$eICpGup.cd8RA/2fQqjTR.87RQ6P0LHSYE3qYmb4./3la4.TtNu.O','admin','2024-11-13 13:20:27'),(5,'prasad','prasaad@gmail.com','$2a$10$gXJcgNlJCYoqwIcIsNQSius2sNwnehd20nWSS9lTP6rIegadhwHJC','farmer','2024-11-13 13:30:52'),(7,'pratik','pratik@gmail.com','$2a$10$wvwxasbiL5R1LDyvBIt1gegxlE.0jabiSDNbXxit4P1P9Ebp5VwMC','farmer','2024-11-13 13:46:15'),(28,'yashwanth','yashwa@gamil.com','$2a$10$OU0o2D8rOTQGP4/eJprvQ.vBbaAuw7UBqtkSpAlHVdabL5acRxGeO','farmer','2024-11-13 16:51:35');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_alerts`
--

DROP TABLE IF EXISTS `weather_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weather_alerts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `severity` enum('low','medium','high') NOT NULL,
  `description` text NOT NULL,
  `start_date` timestamp NOT NULL,
  `end_date` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_alerts`
--

LOCK TABLES `weather_alerts` WRITE;
/*!40000 ALTER TABLE `weather_alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `weather_alerts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-14 22:34:33

DELIMITER ;;
CREATE TRIGGER after_order_status_update 
AFTER UPDATE ON orders 
FOR EACH ROW 
BEGIN
    IF NEW.status != OLD.status THEN
        INSERT INTO activity_logs (action, table_name, record_id, changes)
        VALUES (
            'STATUS_UPDATE',
            'orders',
            NEW.id,
            JSON_OBJECT('old_status', OLD.status, 'new_status', NEW.status)
        );
    END IF;
END;;
DELIMITER ;

DELIMITER ;;
CREATE TRIGGER after_product_update 
AFTER UPDATE ON products 
FOR EACH ROW 
BEGIN
    INSERT INTO activity_logs (action, table_name, record_id, changes)
    VALUES (
        'UPDATE',
        'products',
        NEW.id,
        JSON_OBJECT(
            'old_stock', OLD.stock,
            'new_stock', NEW.stock,
            'old_price', OLD.price,
            'new_price', NEW.price
        )
    );
END;;
DELIMITER ;

DELIMITER //
CREATE PROCEDURE CalculateFieldStats(IN farmer_id INT)
BEGIN
    SELECT 
        COUNT(*) as total_fields,
        SUM(area) as total_area,
        AVG(area) as avg_field_size
    FROM fields 
    WHERE farmer_id = farmer_id;
END //

DELIMITER //
CREATE PROCEDURE ProcessLoanApplication(
    IN p_user_id INT,
    IN p_amount DECIMAL(10,2),
    IN p_type VARCHAR(50)
)
BEGIN
    DECLARE v_interest_rate DECIMAL(5,2);
    -- Additional implementation needed
END //

