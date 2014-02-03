CREATE DATABASE  IF NOT EXISTS `mikesfineart` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mikesfineart`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: mikesfineart
-- ------------------------------------------------------
-- Server version	5.5.34-MariaDB

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
-- Table structure for table `Style`
--

DROP TABLE IF EXISTS `Style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Style` (
  `idStyle` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idStyle`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Style`
--

LOCK TABLES `Style` WRITE;
/*!40000 ALTER TABLE `Style` DISABLE KEYS */;
INSERT INTO `Style` VALUES (1,'Abstract'),(2,'Cubism'),(3,'Expressionism'),(4,'Fauvism'),(5,'Impressionism'),(6,'Pointillism'),(7,'Pop Art'),(8,' Postimpressionism '),(9,' Primitivism'),(10,'Realism '),(11,'Surrealism ');
/*!40000 ALTER TABLE `Style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Artists`
--

DROP TABLE IF EXISTS `Artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Artists` (
  `idArtists` int(11) NOT NULL AUTO_INCREMENT,
  `idGenre` int(11) DEFAULT NULL,
  `idPeriod` int(11) DEFAULT NULL,
  `idStyle` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `folder` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idArtists`),
  KEY `fk_Artists_Genre_idx` (`idGenre`),
  KEY `fk_Artists_Period1_idx` (`idPeriod`),
  KEY `fk_Artists_Style1_idx` (`idStyle`),
  CONSTRAINT `fk_Artists_Genre` FOREIGN KEY (`idGenre`) REFERENCES `Genre` (`idGenre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Artists_Period1` FOREIGN KEY (`idPeriod`) REFERENCES `Period` (`idPeriod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Artists_Style1` FOREIGN KEY (`idStyle`) REFERENCES `Style` (`idStyle`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artists`
--

LOCK TABLES `Artists` WRITE;
/*!40000 ALTER TABLE `Artists` DISABLE KEYS */;
INSERT INTO `Artists` VALUES (1,1,4,11,'Alexandre Cabanel','Alexandre_Cabanel'),(2,2,4,10,'George Richmond','GeorgeRichmond_Watercolours'),(3,2,2,10,'Hans Holbein the Younger','Hans_Holbein_the_Younger'),(4,2,6,10,'Mark Tennant','MARK_TENNANT'),(5,3,4,5,'Pierre Auguste Renoir','Pierre_Auguste_Renoir'),(6,3,4,NULL,'Winslow Homer','Winslow_Homer');
/*!40000 ALTER TABLE `Artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genre`
--

DROP TABLE IF EXISTS `Genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Genre` (
  `idGenre` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idGenre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genre`
--

LOCK TABLES `Genre` WRITE;
/*!40000 ALTER TABLE `Genre` DISABLE KEYS */;
INSERT INTO `Genre` VALUES (1,'History Painting'),(2,'Portraiture'),(3,'Genre Painting'),(4,'Landscape Painting'),(5,'Animal Painting'),(6,'Still Lifes');
/*!40000 ALTER TABLE `Genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Works`
--

DROP TABLE IF EXISTS `Works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Works` (
  `idWorks` int(11) NOT NULL AUTO_INCREMENT,
  `idArtists` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `imageName` varchar(255) NOT NULL,
  `attribution` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idWorks`,`idArtists`),
  KEY `fk_Works_Artists1_idx` (`idArtists`),
  CONSTRAINT `fk_Works_Artists1` FOREIGN KEY (`idArtists`) REFERENCES `Artists` (`idArtists`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Works`
--

LOCK TABLES `Works` WRITE;
/*!40000 ALTER TABLE `Works` DISABLE KEYS */;
INSERT INTO `Works` VALUES (1,1,'The Birth of Venus','1863_Alexandre_Cabanel_The_Birth_of_Venus.jpg',NULL),(2,2,'Charles Darwin','Charles_Darwin_by_G._Richmond.jpg',NULL),(3,3,'Ambrosius and Hans Holbein','Ambrosius_and_Hans_Holbein_by_Hans_Holbein_the_Elder.jpg',NULL),(4,3,'Sir Thomas More','Hans_Holbein,_the_Younger_Sir_Thomas_More_Google_Art_Project.jpg',NULL),(5,3,'Jane','Hans_Holbein_Jane_Small.jpg',NULL),(6,3,'','Hans_Holbein_d._J._032b.jpg',NULL),(7,3,'The Ambassadors','Hans_Holbein_the_Younger_The_Ambassadors_Google_Art_Project.jpg',NULL),(8,3,'Self Portrait','Hans_Holbein_the_Younger_self-portrait.jpg',NULL),(9,3,'Holbien the Elder','Holbein_the_elder.jpg',NULL),(10,3,'Lady with a Squirrel','Lady_with_a_Squirrel.jpg',NULL),(11,3,'Lais of Corinth','Lais_of_Corinth_by_Hans_Holbein_the_Younger.jpg',NULL),(12,3,'Study for portrait of the More Family','Study_for_portrait_of_the_More_family_by_Hans_Holbein_the_Younger.jpg',NULL),(13,4,'','tumblr_ky0dqhV6zj1qzx1e6.jpg',NULL),(14,4,'','tumblr_mawrexKF8N1rtcwx2o1_500.jpg',NULL),(15,4,'','tumblr_mawrexKF8N1rtcwx2o4_500.jpg',NULL),(16,4,'','tumblr_mcyy1sgYzp1qetj8po1_500.jpg',NULL),(17,4,'','tumblr_mcyy1sgYzp1qetj8po2_500.jpg',NULL),(18,4,'','tumblr_mcyy1sgYzp1qetj8po3_500.jpg',NULL),(19,4,'','tumblr_mjdypk0Fci1qzv99eo1_500-1.jpg',NULL),(20,4,'','tumblr_mjdyroASWs1qzv99eo1_500-1.jpg',NULL),(21,5,'The Theater Box','Pierre-Auguste_Renoir_La_loge_The_Theater_Box.jpg',NULL),(22,6,'The New Novel','1877_winslow_homer_the_new_novel.jpg',NULL),(23,6,'Camp Fire','Camp_Fire_Winslow_Homer.jpg',NULL),(24,6,'','Gloucester_Harbor_Winslow_Homer_1873.jpg',NULL);
/*!40000 ALTER TABLE `Works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Period`
--

DROP TABLE IF EXISTS `Period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Period` (
  `idPeriod` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idPeriod`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Period`
--

LOCK TABLES `Period` WRITE;
/*!40000 ALTER TABLE `Period` DISABLE KEYS */;
INSERT INTO `Period` VALUES (1,'Renaissance'),(2,'Renaissance to Neoclassicism'),(3,'Romanticism'),(4,'Romanticism to Modern Art'),(5,'Modern art'),(6,'Contemporary art');
/*!40000 ALTER TABLE `Period` ENABLE KEYS */;
UNLOCK TABLES;

CREATE VIEW `completeartists` AS SELECT Artists.*, Genre.name as genre, Style.name as style, 
	Period.name as period 
FROM Artists, Genre, Style, Period 
WHERE Artists.idGenre = Genre.idGenre AND Artists.idPeriod = Period.idPeriod 
	AND Artists.idStyle = Style.idStyle;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-02 23:13:58
