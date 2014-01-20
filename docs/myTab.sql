CREATE DATABASE  IF NOT EXISTS `mytab` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mytab`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: mytab
-- ------------------------------------------------------
-- Server version	5.5.34-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `combinedtab`
--

DROP TABLE IF EXISTS `combinedtab`;
/*!50001 DROP VIEW IF EXISTS `combinedtab`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `combinedtab` (
  `idTab` tinyint NOT NULL,
  `idIssue` tinyint NOT NULL,
  `idFakebook` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `artist` tinyint NOT NULL,
  `pageNumber` tinyint NOT NULL,
  `difficulty` tinyint NOT NULL,
  `arranger` tinyint NOT NULL,
  `issue` tinyint NOT NULL,
  `fakebook` tinyint NOT NULL,
  `magazine` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fakebook`
--

DROP TABLE IF EXISTS `fakebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fakebook` (
  `idFakebook` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idFakebook`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fakebook`
--

LOCK TABLES `fakebook` WRITE;
/*!40000 ALTER TABLE `fakebook` DISABLE KEYS */;
INSERT INTO `fakebook` VALUES (1,'Mississippi John Hurt'),(2,'Guitar White Pages');
/*!40000 ALTER TABLE `fakebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue` (
  `idIssue` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `sequence` int(11) NOT NULL,
  `Magazine_idMagazine` int(11) NOT NULL,
  PRIMARY KEY (`idIssue`,`Magazine_idMagazine`),
  KEY `fk_Issue_Magazine_idx` (`Magazine_idMagazine`),
  CONSTRAINT `fk_Issue_Magazine` FOREIGN KEY (`Magazine_idMagazine`) REFERENCES `magazine` (`idMagazine`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
INSERT INTO `issue` VALUES (1,'November 2013',11,1);
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magazine`
--

DROP TABLE IF EXISTS `magazine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magazine` (
  `idMagazine` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idMagazine`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magazine`
--

LOCK TABLES `magazine` WRITE;
/*!40000 ALTER TABLE `magazine` DISABLE KEYS */;
INSERT INTO `magazine` VALUES (1,'Guitar World');
/*!40000 ALTER TABLE `magazine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tab`
--

DROP TABLE IF EXISTS `tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tab` (
  `idTab` int(11) NOT NULL AUTO_INCREMENT,
  `idIssue` int(11) DEFAULT NULL,
  `idFakebook` int(11) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `artist` varchar(45) DEFAULT NULL,
  `pageNumber` int(11) DEFAULT NULL,
  `difficulty` int(11) DEFAULT NULL,
  `arranger` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTab`),
  KEY `fk_Tab_Issue1_idx` (`idIssue`),
  KEY `fk_Tab_Fakebook1_idx` (`idFakebook`),
  KEY `index_title` (`title`),
  KEY `index_artist` (`artist`),
  KEY `index_difficulty` (`difficulty`),
  KEY `index_arranger` (`arranger`),
  CONSTRAINT `fk_Tab_Issue1` FOREIGN KEY (`idIssue`) REFERENCES `issue` (`idIssue`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tab_Fakebook1` FOREIGN KEY (`idFakebook`) REFERENCES `fakebook` (`idFakebook`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab`
--

LOCK TABLES `tab` WRITE;
/*!40000 ALTER TABLE `tab` DISABLE KEYS */;
INSERT INTO `tab` VALUES (1,NULL,1,'Avalon Blues','Mississippi John Hurt',28,3,'Stephen Grossman'),(2,NULL,2,'Crazy Little Thing Called Love','Brian May',128,2,'Brian May'),(3,1,NULL,'Gimme Shelter','Rolling Stones',140,3,'Andy Aledort');
/*!40000 ALTER TABLE `tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `combinedtab`
--

/*!50001 DROP TABLE IF EXISTS `combinedtab`*/;
/*!50001 DROP VIEW IF EXISTS `combinedtab`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `combinedtab` AS select `tab`.`idTab` AS `idTab`,`tab`.`idIssue` AS `idIssue`,`tab`.`idFakebook` AS `idFakebook`,`tab`.`title` AS `title`,`tab`.`artist` AS `artist`,`tab`.`pageNumber` AS `pageNumber`,`tab`.`difficulty` AS `difficulty`,`tab`.`arranger` AS `arranger`,`issue`.`name` AS `issue`,`fakebook`.`name` AS `fakebook`,`magazine`.`name` AS `magazine` from (((`tab` left join `issue` on((`tab`.`idIssue` = `issue`.`idIssue`))) left join `fakebook` on((`tab`.`idFakebook` = `fakebook`.`idFakebook`))) left join `magazine` on((`issue`.`Magazine_idMagazine` = `magazine`.`idMagazine`))) */;
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

-- Dump completed on 2014-01-20 10:52:29
