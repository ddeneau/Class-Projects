CREATE DATABASE  IF NOT EXISTS `park_trails` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `park_trails`;
-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: localhost    Database: park_trails
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Temporary view structure for view `above_average_locations`
--

DROP TABLE IF EXISTS `above_average_locations`;
/*!50001 DROP VIEW IF EXISTS `above_average_locations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `above_average_locations` AS SELECT 
 1 AS `location_name`,
 1 AS `trail_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `alaskan_trails`
--

DROP TABLE IF EXISTS `alaskan_trails`;
/*!50001 DROP VIEW IF EXISTS `alaskan_trails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alaskan_trails` AS SELECT 
 1 AS `trail_name`,
 1 AS `trail_distance`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities` (
  `amenity_id` int unsigned NOT NULL,
  `amenity_type` varchar(45) DEFAULT NULL,
  `amenity_description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`amenity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
INSERT INTO `amenities` VALUES (0,'Camping','RV or tent camping spots available.'),(1,'Hiking','The terrain here is appropriate for hiking.'),(2,'Kid Friendly','Children are welcome, and the difficulty should not generally be to difficult for children.'),(3,'Pet Friendly ','You can bring the pets '),(4,'Smoke free','No smoking in the area'),(5,'water fountain ','Water is available for free'),(6,'First aid kit','First aid kits are available '),(7,'Biking friendly','You can bring the bikes '),(8,'Skate friendly ','You can skate around the park'),(9,'Barbque','You can Barbq in the area'),(10,'Fishing ','You can fish nearby the water area'),(11,'Parking','Parking is available first come first serve basis '),(12,'Power outlets','Power outlets are available in the guest sections'),(13,'Prayer section','Prayers can be offered in the designated area'),(14,'Scooters ','Scooter are available to rent in the area');
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `count_of_visitors`
--

DROP TABLE IF EXISTS `count_of_visitors`;
/*!50001 DROP VIEW IF EXISTS `count_of_visitors`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `count_of_visitors` AS SELECT 
 1 AS `visits_to_trail`,
 1 AS `trail_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `entrances`
--

DROP TABLE IF EXISTS `entrances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrances` (
  `entrance_id` int unsigned NOT NULL,
  `entrance_description` varchar(200) DEFAULT NULL,
  `exit_description` varchar(200) DEFAULT NULL,
  `parking_address` varchar(100) DEFAULT NULL,
  `trail_id` int unsigned NOT NULL,
  PRIMARY KEY (`entrance_id`,`trail_id`),
  KEY `fk_entrances_trails1_idx` (`trail_id`),
  CONSTRAINT `fk_entrances_trails1` FOREIGN KEY (`trail_id`) REFERENCES `trails` (`trail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrances`
--

LOCK TABLES `entrances` WRITE;
/*!40000 ALTER TABLE `entrances` DISABLE KEYS */;
INSERT INTO `entrances` VALUES (0,'Walk a few yards left to the northwest from the parking lot','The trail loops. Keep moving forward or turn around to exit.','13101 Glen Alps Rd',0),(1,'Follow signs from parking lot to trail. This trail has parking fees.','The trail ends at a waterfall, an you must turn back around to exit.','1203 Mountain View Rd',1),(2,'Look for a yellow sign with trail name.','Turn back around at the end of trail marker. ','3001 Eagle Ln',1),(3,'Between the sign and the parking lot','The trail loops back around, look for the parking lot and sign','12 Summit Avenue',0),(4,'The trail starts at the yellow sign','The trail leads to a pond and then turn around','7 Edison Lane',1),(5,'The trail is a few dozen yards from the outdoor portapotties','The trail loops, keep moving until you see the parking lot','1211 Great Elms Avenue',1),(6,'Look for a sign that says \"Start Here\"\"\"','The trail ends at a scenic hill where you can see the horizon, trail loops around to parking','55 Plainfield Road',0),(7,'Behind the parking lot','The trail ends at the red-sign and you can exit from there or loop around','1911 Potomac Hills Dr',1),(8,'Through the woods, there will be another sign for trail','The trail ends at the Waterfall. Exits available and turn around to get to the entrance','1213 Laura Avenue',1),(9,'On the opposite side as the parking lot','The trail loops around and look for the parking lot','19101 Mountain Hills Rd',0),(10,'Walk through the lot and look for the water fountain','The trail loops back around to the water fountain','12901 Forrest Oak Hills Dr',1),(11,'Behind the green sign ','The trail ends at the six mile mark and then you turn around.','109 Mountain Avenue',0),(12,'Across from the highway exit and parking location','The trail leads to a pond and then turn around','1322 Bridgewater Alley',0),(13,'Look for a red sign','The trail loops, keep moving until you see the parking lot','909 Summit Vine Dr',1),(14,'Behind the informational plaque','The trail ends at a waterfall, an you must turn back around to exit.','123117 Coconut Creek Rd',1);
/*!40000 ALTER TABLE `entrances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `location_id` int unsigned NOT NULL,
  `location_name` varchar(100) DEFAULT NULL,
  `location_address` varchar(45) DEFAULT NULL,
  `location_city` varchar(45) DEFAULT NULL,
  `location_phone` varchar(12) DEFAULT NULL,
  `state_id` int unsigned NOT NULL,
  PRIMARY KEY (`location_id`,`state_id`),
  KEY `fk_locations_states1_idx` (`state_id`),
  CONSTRAINT `fk_locations_states1` FOREIGN KEY (`state_id`) REFERENCES `states` (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (0,'Chugach State Park','18620 Seward Hwy','Anchorage','9073455014',0),(1,'Rock Creek Park','5200 Glover Rd','Washington, DC','2028956000',14),(2,'Rocky Mountain National Park','1000 US Hwy 36','Estes Park','9705861206',3),(3,'Winklr botanic ','4567 lee hwy','Virgina','9786798777',4),(4,'Huntley Meadows park','2345 us hw 34','Maryland ','756789766',3),(5,'Catoctin Mountain Park','4700 berwyn house rd','Tennessee','8657890987',2),(6,'Shenandoah National Park','155 dupond circle','Virgina','86789767',3),(7,'Great Falls Loop','2665 windswept lane','Ohio','3456789262',3),(8,'Patapsco Valley State Park','9200 Old Dominion Dr','Newyork','2456786789',3),(9,'Devils Bridge Trail','8020 Baltimore National Pike','Florida','6786796789',3),(10,'Mount Vernon trail','3456 Mount vernon drive','kentucky','5678976798',3),(11,'Mason District Park','700 George Washington Memorial Parkway','Mount Vernon','2409876789',4),(12,'Rachel Carson Conservation Park','2345 Jones Point Dr','Queens','3425678906',5),(13,'Jones point park','6621 Columbia Pike','Virginia','3457890987',4),(14,'Alphabet Park','1232 Adams Ln','Francis','2311134131',12);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking_records`
--

DROP TABLE IF EXISTS `parking_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parking_records` (
  `parking_record_id` int unsigned NOT NULL,
  `vehicle_description` varchar(45) DEFAULT NULL,
  `entrance_time` datetime DEFAULT NULL,
  `exit_time` datetime DEFAULT NULL,
  `visitor_id` int unsigned NOT NULL,
  `entrance_id` int unsigned NOT NULL,
  PRIMARY KEY (`parking_record_id`,`visitor_id`,`entrance_id`),
  KEY `fk_parking_records_visitors1_idx` (`visitor_id`),
  KEY `fk_parking_records_entrances1_idx` (`entrance_id`),
  CONSTRAINT `fk_parking_records_entrances1` FOREIGN KEY (`entrance_id`) REFERENCES `entrances` (`entrance_id`),
  CONSTRAINT `fk_parking_records_visitors` FOREIGN KEY (`visitor_id`) REFERENCES `visitors` (`vistor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking_records`
--

LOCK TABLES `parking_records` WRITE;
/*!40000 ALTER TABLE `parking_records` DISABLE KEYS */;
INSERT INTO `parking_records` VALUES (0,'black Infinity m35','0006-08-21 09:00:00','0007-08-21 11:00:00',2,0),(1,'white toyota camry','0007-08-21 09:00:00','0007-08-21 12:03:00',1,0),(2,'black honda accord','0007-03-21 09:30:00','0007-03-21 13:30:00',0,2),(3,'gray honda odyssey','0007-02-21 09:00:00','0008-02-21 12:20:00',1,2),(4,'blue toyota camry ','0007-02-21 08:30:00','0007-02-21 13:20:00',2,0),(5,'white ford expedition','0006-04-21 07:30:00','0007-02-21 12:30:00',3,2),(6,'green honda pilot ','0002-04-21 06:20:00','0008-03-21 12:20:00',2,2),(7,' silver BMW 335','0002-03-21 07:20:00','0007-02-21 13:15:00',2,3),(8,'black toyota camry ','0005-01-21 06:30:00','0004-02-21 12:15:00',1,2),(9,'white mercedes benz c300','0004-03-21 05:20:00','0003-02-21 12:14:00',2,1),(10,'blue kia soul ','0002-02-21 04:15:00','0002-02-21 13:15:00',1,2),(11,'gray toyota camry ','0002-02-21 03:15:00','0002-03-21 12:15:00',2,1),(12,'red kia rio','0001-03-21 04:10:00','0003-02-21 13:12:00',1,2),(14,'blue honda civic ','0003-10-21 06:20:00','0003-10-21 11:20:00',2,1),(15,'blue honda civic ','0003-10-21 08:20:00','0003-10-21 11:20:00',4,1);
/*!40000 ALTER TABLE `parking_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `state_id` int unsigned NOT NULL,
  `state_name` varchar(45) DEFAULT NULL,
  `state_code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (0,'Alaska','AL'),(1,'Arizona','AZ'),(2,'California','CA'),(3,'Colorado','CO'),(4,'Hawaii','HA'),(5,'Maine','ME'),(6,'Massachusetts','MA'),(7,'Maryland','MD'),(8,'North Dakatoa','ND'),(9,'Ohio','OH'),(10,'Oklahoma','OK'),(11,'Utah','UT'),(12,'Vermont','VT'),(13,'Virginia','VA'),(14,'Washington D.C.','DC');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `trail_states`
--

DROP TABLE IF EXISTS `trail_states`;
/*!50001 DROP VIEW IF EXISTS `trail_states`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `trail_states` AS SELECT 
 1 AS `trail_name`,
 1 AS `state_code`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `trails`
--

DROP TABLE IF EXISTS `trails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trails` (
  `trail_id` int unsigned NOT NULL,
  `trail_name` varchar(100) DEFAULT NULL,
  `trail_distance` varchar(50) DEFAULT NULL,
  `trail_rating` varchar(45) DEFAULT NULL,
  `trail_type` varchar(45) DEFAULT NULL,
  `trail_difficulty` varchar(45) DEFAULT NULL,
  `location_id` int unsigned NOT NULL,
  PRIMARY KEY (`trail_id`,`location_id`),
  KEY `fk_trails_locations1_idx` (`location_id`),
  CONSTRAINT `fk_trails_locations1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trails`
--

LOCK TABLES `trails` WRITE;
/*!40000 ALTER TABLE `trails` DISABLE KEYS */;
INSERT INTO `trails` VALUES (0,'Flattop Mountain Trail','3.3','4.5','loop','Hard',0),(1,'Byron Glacier Trail','3.2','4.5','out and back','Moderate',0),(2,'McHugh Lake Trail','12.5','4','out and back','Easy',0),(3,'High Mountain Trail','9','4','loop','Easy',3),(4,'Freedom Trail','11','4','out and back','Easy',3),(5,'Bikers Paradise Trail','9.2','3','loop','Moderate',2),(6,'Valley Hills Trail','4','4.5','out and back','Hard',2),(7,'Squirrel Trail','9.2','3.5','loop','Hard',0),(8,'Spruce Run Trail','7.9','4','loop','Moderate',4),(9,'Village Hills Trail','1.3','4.5','out and back','Moderate',2),(10,'Pacific Springs Trail','4.3','4','loop','Hard',2),(11,'Warren Mountains Trail','8.6','3.5','loop','Hard',2),(12,'Nature Resort Trail','9.4','3','out and back','Easy',3),(13,'Caymans Vacation Trail','7.5','4','out and back','Hard',4),(14,'Natures Resting Trailer','6.3','4.5','loop','Easy',4);
/*!40000 ALTER TABLE `trails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trails_amenities`
--

DROP TABLE IF EXISTS `trails_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trails_amenities` (
  `trail_id` int NOT NULL,
  `amenity_id` int NOT NULL,
  PRIMARY KEY (`trail_id`,`amenity_id`),
  KEY `fk_trails_amenities_ameities1_idx` (`amenity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trails_amenities`
--

LOCK TABLES `trails_amenities` WRITE;
/*!40000 ALTER TABLE `trails_amenities` DISABLE KEYS */;
INSERT INTO `trails_amenities` VALUES (0,0),(2,0),(3,0),(4,0),(0,1),(9,1),(10,1),(11,1),(13,1),(14,1),(0,2),(10,2),(11,2),(13,2),(14,2),(2,3),(3,3),(10,3),(11,3),(2,4),(3,4),(9,4),(13,4),(2,6),(4,6),(10,6),(1,7),(4,7),(9,7),(3,9),(8,9),(11,9),(11,12),(10,14);
/*!40000 ALTER TABLE `trails_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `trails_for_adults_only`
--

DROP TABLE IF EXISTS `trails_for_adults_only`;
/*!50001 DROP VIEW IF EXISTS `trails_for_adults_only`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `trails_for_adults_only` AS SELECT 
 1 AS `trail_name`,
 1 AS `amenity_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitors` (
  `vistor_id` int unsigned NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `phone_number` varchar(12) DEFAULT NULL,
  `email_address` varchar(45) DEFAULT NULL,
  `location_id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`vistor_id`,`location_id`),
  KEY `fk_visitors_locations1_idx` (`location_id`),
  CONSTRAINT `fk_visitors_locations1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors`
--

LOCK TABLES `visitors` WRITE;
/*!40000 ALTER TABLE `visitors` DISABLE KEYS */;
INSERT INTO `visitors` VALUES (0,'Bob','Ralph','2167658988','bobralph@gmail.com',0000000000),(1,'Daniel','Deneau ','4168151555','dand@gmail.com',0000000000),(2,'Maria','Gonzalez','6718990012','mgonzalez@yahoo.com',0000000002),(3,'Yicheng','Wang','1238784989','hskhddj@gmail.com',0000000003),(4,'Naila ','Naeem','8126062981','jsdkdls@gmail.com',0000000004),(5,'Daniel','Deneau ','3234477896','jdjjdjfk@yahoo.com',0000000002),(6,'Alyx','Hu','2027010755','jdjd@icloud.com',0000000002),(7,'Eric','Choi','3012324476','1234@163.com',0000000002),(8,'Jill','Huang','2328011611','yiwhd@qq.com',0000000000),(9,'Siqin','Xie','5783028308','djkdh@qq.com',0000000002),(10,'Alice','Kim','9289839232','kajdbkcnlsnl@gmail.com',0000000002),(11,'Frank','Huang','7652435790','shhdksn@gmail.com',0000000003),(12,'Elliot','Kenny','9087010923','skshdkknldd@gmail.com',0000000003),(13,'Seth','Kenny','1689050095','hdkskdkdj@gmail.com',0000000004),(14,'Anya','Gill','9067778888','agill@msn.com',0000000000);
/*!40000 ALTER TABLE `visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `above_average_locations`
--

/*!50001 DROP VIEW IF EXISTS `above_average_locations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `above_average_locations` AS select `locations`.`location_name` AS `location_name`,`trails`.`trail_name` AS `trail_name` from (`locations` join `trails` on((`locations`.`location_id` = `trails`.`location_id`))) where (`trails`.`trail_rating` > (select avg(`trails`.`trail_rating`) from `trails`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `alaskan_trails`
--

/*!50001 DROP VIEW IF EXISTS `alaskan_trails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alaskan_trails` AS select `trails`.`trail_name` AS `trail_name`,`trails`.`trail_distance` AS `trail_distance` from ((`trails` join `locations` on((`trails`.`location_id` = `locations`.`location_id`))) join `states` on((`locations`.`state_id` = `states`.`state_id`))) where (`states`.`state_code` = 'AL') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `count_of_visitors`
--

/*!50001 DROP VIEW IF EXISTS `count_of_visitors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `count_of_visitors` AS select count(`visitors`.`first_name`) AS `visits_to_trail`,`trails`.`trail_name` AS `trail_name` from ((`visitors` join `locations` on((`visitors`.`location_id` = `locations`.`location_id`))) join `trails` on((`visitors`.`location_id` = `trails`.`location_id`))) group by `trails`.`trail_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `trail_states`
--

/*!50001 DROP VIEW IF EXISTS `trail_states`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `trail_states` AS select `trails`.`trail_name` AS `trail_name`,`states`.`state_code` AS `state_code` from ((`trails` join `locations` on((`trails`.`location_id` = `locations`.`location_id`))) join `states` on((`locations`.`state_id` = `states`.`state_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `trails_for_adults_only`
--

/*!50001 DROP VIEW IF EXISTS `trails_for_adults_only`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `trails_for_adults_only` AS select `trails`.`trail_name` AS `trail_name`,`amenities`.`amenity_type` AS `amenity_type` from ((`trails` join `trails_amenities` on((`trails`.`trail_id` = `trails_amenities`.`trail_id`))) join `amenities` on((`trails_amenities`.`amenity_id` = `amenities`.`amenity_id`))) where (`amenities`.`amenity_type` <> 'Kid Friendly') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-21  3:52:45
