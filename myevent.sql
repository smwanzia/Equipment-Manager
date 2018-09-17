CREATE DATABASE  IF NOT EXISTS `eventdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `eventdb`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: eventdb
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `adminuser`
--

DROP TABLE IF EXISTS `adminuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminuser` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `phonenumber` varchar(30) DEFAULT NULL,
  `emailaddress` varchar(30) DEFAULT NULL,
  `userimage` varchar(30) DEFAULT NULL,
  `recordcreator` varchar(20) DEFAULT NULL,
  `rolename` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminuser`
--

LOCK TABLES `adminuser` WRITE;
/*!40000 ALTER TABLE `adminuser` DISABLE KEYS */;
INSERT INTO `adminuser` VALUES (36,'mumo','8cb2237d0679ca88db6464eac60da96345513964','simon','mwanzia','Active','099999999','simon@gmail.com','9888.png','mumo','Administrator'),(38,'kyalie','8cb2237d0679ca88db6464eac60da96345513964','Geoffrey','kyalo','Active',NULL,'kyalie@gmail.com',NULL,'mumo','Administrator'),(39,'paul','8cb2237d0679ca88db6464eac60da96345513964','mussah','musau','Active',NULL,'paul@gmail.com',NULL,'mumo','Staff'),(40,'raymond','8cb2237d0679ca88db6464eac60da96345513964','Kitakha','kitati','Active',NULL,'kitaka@gmail.com',NULL,'mumo','Administrator'),(41,'Kariuki','8cb2237d0679ca88db6464eac60da96345513964','Robert','Maina','Active',NULL,'robert@gmail.com',NULL,'mumo','Administrator'),(42,'Muchagi','8cb2237d0679ca88db6464eac60da96345513964','Kiura','David','Active',NULL,'muchagi@gmail.com',NULL,'mumo','Staff');
/*!40000 ALTER TABLE `adminuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (7,'Tents'),(8,'Catering Equipment'),(10,'Carnival'),(12,'Wedding Accessories'),(14,'Chairs'),(15,'Tables'),(16,'Linens'),(17,'Lighting/Electrical'),(18,'Furniture'),(19,'Staging / Flooring / Groundcover'),(20,'Seatings'),(21,'Tent Accessories'),(22,'Table Settings');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(20) DEFAULT NULL,
  `county_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Nairobi Town','5'),(2,'Machakos Town','2'),(3,'Nyeri Town','14'),(4,'Mombasa Town','1'),(5,'Kiambu Town','6'),(6,'Muranga Town','8'),(7,'Kitui Town','4'),(8,'Madera Town','13'),(9,'Thika Town','6'),(10,'mlolongo','2'),(11,'Kitengela','2'),(12,'Athi River Town','2');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `contact_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `emailAddress` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `otherPhoneNumber` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`contact_id`),
  UNIQUE KEY `contact_id` (`contact_id`),
  UNIQUE KEY `phoneNumber` (`phoneNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'','','Test Number','','','000');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `county`
--

DROP TABLE IF EXISTS `county`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `county` (
  `county_code` int(11) NOT NULL AUTO_INCREMENT,
  `county_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`county_code`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `county`
--

LOCK TABLES `county` WRITE;
/*!40000 ALTER TABLE `county` DISABLE KEYS */;
INSERT INTO `county` VALUES (1,'Mombasa'),(2,'Machakos'),(3,'Makueni'),(4,'Kitui'),(5,'Nairobi'),(6,'Kiambu'),(7,'Nakuru'),(8,'Muranga'),(9,'Embu'),(10,'Taita Taveta'),(11,'Wajir'),(12,'Garissa'),(13,'Madera'),(14,'Nyeri'),(15,'Tharakanithi'),(16,'Kwale'),(17,'Naivasha'),(18,'Kisumu'),(19,'Lamu');
/*!40000 ALTER TABLE `county` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customerid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `emailaddress` varchar(45) DEFAULT NULL,
  `phonenumber` varchar(45) DEFAULT NULL,
  `company` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `preferredmethodofcontact` varchar(45) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `homeaddress` varchar(45) DEFAULT NULL,
  `county` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (3,'mwanzia','7c4a8d09ca3762af61e59520943dc26494f8941b','mutuku','Geoffrey','simonmumo7@gmail.com','0714601594','bluerays ltd','Mombasa','Email','78666-332-321','(43)9988888-33',NULL,NULL),(4,'simo','7c4a8d09ca3762af61e59520943dc26494f8941b','simon','mumo','simonmumo7@gmail.com','0714601594','skyweb','Nairobi','Email','9099-999-33','0714601594',NULL,NULL),(5,'mumo','7c4a8d09ca3762af61e59520943dc26494f8941b','mwanzia','mwanzia','simon@gmail.com','0714601594',NULL,'Nakuru',NULL,NULL,'455gg',NULL,NULL),(6,'john','20eabe5d64b0e216796e834f52d61fd0b70332fc','kelvin','muriuki','kelvin@gmail.com','0714601594','','Nairobi','Email',NULL,'455gg','Nairobi','Female'),(7,'kitaka','f7c3bc1d808e04732adf679965ccc34ca7ae3441','Raymond','kitati','kelvin@gmail.com','0714601594','','Mombasa','Email',NULL,'',NULL,NULL),(8,'rober','20eabe5d64b0e216796e834f52d61fd0b70332fc','kariuki','robert','rober@gmail.com','0714601594','showwave limited','Nairobi','Email',NULL,'432-233-232',NULL,NULL),(9,'kyalie','7c222fb2927d828af22f592134e8932480637c0d','Geoffrey','Munyaka','mye@gmail.com','0714601594',NULL,'Nairobi',NULL,NULL,NULL,NULL,NULL),(10,'Paul','20eabe5d64b0e216796e834f52d61fd0b70332fc','Musau','Mutinda','kelv@gmail.com','0714601594',NULL,'Nairobi',NULL,NULL,NULL,NULL,NULL),(11,'kevo','7c4a8d09ca3762af61e59520943dc26494f8941b','Muriikii','muriuki','Davi@gmail.com','0714568795',NULL,'Nairobi','Email',NULL,'432-233-232','Nairobi','Male');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `date` bigint(20) DEFAULT NULL,
  `recipients` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `sender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK3FF5B7C77FBC69D` (`sender_id`),
  CONSTRAINT `FK3FF5B7C77FBC69D` FOREIGN KEY (`sender_id`) REFERENCES `emailaccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailaccount`
--

DROP TABLE IF EXISTS `emailaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailaccount` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accountName` varchar(255) DEFAULT NULL,
  `accountPassword` varchar(255) DEFAULT NULL,
  `accountServer` varchar(255) DEFAULT NULL,
  `accountServerPort` int(11) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `isForReceiving` bit(1) DEFAULT NULL,
  `lastCheck` bigint(20) DEFAULT NULL,
  `protocol` varchar(255) DEFAULT NULL,
  `useSsl` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `accountName` (`accountName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailaccount`
--

LOCK TABLES `emailaccount` WRITE;
/*!40000 ALTER TABLE `emailaccount` DISABLE KEYS */;
INSERT INTO `emailaccount` VALUES (1,'simonmumo7@gmail.com','mwanzia14601','www.gmail.com',465,'','\0',NULL,'SMTP','');
/*!40000 ALTER TABLE `emailaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_type`
--

DROP TABLE IF EXISTS `event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_type` (
  `typeid` int(11) NOT NULL AUTO_INCREMENT,
  `event_type` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_type`
--

LOCK TABLES `event_type` WRITE;
/*!40000 ALTER TABLE `event_type` DISABLE KEYS */;
INSERT INTO `event_type` VALUES (1,'Wedding Party'),(2,'Graduation Party'),(3,'Sports');
/*!40000 ALTER TABLE `event_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventdetails`
--

DROP TABLE IF EXISTS `eventdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventdetails` (
  `eventid` int(11) NOT NULL AUTO_INCREMENT,
  `eventstartdate` varchar(45) DEFAULT NULL,
  `eventenddate` varchar(45) DEFAULT NULL,
  `eventlocation` varchar(45) DEFAULT NULL,
  `eventtype` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventdetails`
--

LOCK TABLES `eventdetails` WRITE;
/*!40000 ALTER TABLE `eventdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form`
--

DROP TABLE IF EXISTS `form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `finalised` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `permittedGroup_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK2180E4D3148215` (`permittedGroup_path`),
  CONSTRAINT `FK2180E4D3148215` FOREIGN KEY (`permittedGroup_path`) REFERENCES `frontline_group` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form`
--

LOCK TABLES `form` WRITE;
/*!40000 ALTER TABLE `form` DISABLE KEYS */;
/*!40000 ALTER TABLE `form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_formfield`
--

DROP TABLE IF EXISTS `form_formfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_formfield` (
  `Form_id` bigint(20) NOT NULL,
  `fields_id` bigint(20) NOT NULL,
  UNIQUE KEY `fields_id` (`fields_id`),
  KEY `FK891CCCDB1F476EAE` (`Form_id`),
  KEY `FK891CCCDBF2FF003` (`fields_id`),
  CONSTRAINT `FK891CCCDB1F476EAE` FOREIGN KEY (`Form_id`) REFERENCES `form` (`id`),
  CONSTRAINT `FK891CCCDBF2FF003` FOREIGN KEY (`fields_id`) REFERENCES `formfield` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_formfield`
--

LOCK TABLES `form_formfield` WRITE;
/*!40000 ALTER TABLE `form_formfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_formfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formfield`
--

DROP TABLE IF EXISTS `formfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formfield` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `positionIndex` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `form_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKE1EB1E761F476EAE` (`form_id`),
  CONSTRAINT `FKE1EB1E761F476EAE` FOREIGN KEY (`form_id`) REFERENCES `form` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formfield`
--

LOCK TABLES `formfield` WRITE;
/*!40000 ALTER TABLE `formfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `formfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formresponse`
--

DROP TABLE IF EXISTS `formresponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formresponse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `senderMsisdn` varchar(255) DEFAULT NULL,
  `parentForm_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK8325D545D92B32C4` (`parentForm_id`),
  CONSTRAINT `FK8325D545D92B32C4` FOREIGN KEY (`parentForm_id`) REFERENCES `form` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formresponse`
--

LOCK TABLES `formresponse` WRITE;
/*!40000 ALTER TABLE `formresponse` DISABLE KEYS */;
/*!40000 ALTER TABLE `formresponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formresponse_responsevalue`
--

DROP TABLE IF EXISTS `formresponse_responsevalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formresponse_responsevalue` (
  `FormResponse_id` bigint(20) NOT NULL,
  `results_id` bigint(20) NOT NULL,
  UNIQUE KEY `results_id` (`results_id`),
  KEY `FKCA47C8161674AB2E` (`FormResponse_id`),
  KEY `FKCA47C816F8F076C0` (`results_id`),
  CONSTRAINT `FKCA47C8161674AB2E` FOREIGN KEY (`FormResponse_id`) REFERENCES `formresponse` (`id`),
  CONSTRAINT `FKCA47C816F8F076C0` FOREIGN KEY (`results_id`) REFERENCES `responsevalue` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formresponse_responsevalue`
--

LOCK TABLES `formresponse_responsevalue` WRITE;
/*!40000 ALTER TABLE `formresponse_responsevalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `formresponse_responsevalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frontline_group`
--

DROP TABLE IF EXISTS `frontline_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frontline_group` (
  `path` varchar(255) NOT NULL,
  `parentPath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`path`),
  UNIQUE KEY `path` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frontline_group`
--

LOCK TABLES `frontline_group` WRITE;
/*!40000 ALTER TABLE `frontline_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `frontline_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frontlinemultimediamessagepart`
--

DROP TABLE IF EXISTS `frontlinemultimediamessagepart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frontlinemultimediamessagepart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `binaryData` bit(1) DEFAULT NULL,
  `content` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frontlinemultimediamessagepart`
--

LOCK TABLES `frontlinemultimediamessagepart` WRITE;
/*!40000 ALTER TABLE `frontlinemultimediamessagepart` DISABLE KEYS */;
/*!40000 ALTER TABLE `frontlinemultimediamessagepart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupmembership`
--

DROP TABLE IF EXISTS `groupmembership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupmembership` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contact_contact_id` bigint(20) NOT NULL,
  `group_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `contact_contact_id` (`contact_contact_id`,`group_path`),
  KEY `FKBA9C3F955A18C292` (`contact_contact_id`),
  KEY `FKBA9C3F95DAF23DFD` (`group_path`),
  CONSTRAINT `FKBA9C3F955A18C292` FOREIGN KEY (`contact_contact_id`) REFERENCES `contact` (`contact_id`),
  CONSTRAINT `FKBA9C3F95DAF23DFD` FOREIGN KEY (`group_path`) REFERENCES `frontline_group` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupmembership`
--

LOCK TABLES `groupmembership` WRITE;
/*!40000 ALTER TABLE `groupmembership` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupmembership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `invoiceid` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_amount` varchar(45) DEFAULT NULL,
  `invoice_date` varchar(45) DEFAULT NULL,
  `customerid` varchar(45) DEFAULT NULL,
  `invoice_number` varchar(45) DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rental_start_date` varchar(45) DEFAULT NULL,
  `rental_end_date` varchar(45) DEFAULT NULL,
  `eventlocation` varchar(45) DEFAULT NULL,
  `eventtype` varchar(45) DEFAULT NULL,
  `updatedby` varchar(45) DEFAULT NULL,
  `isprocessed` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`invoiceid`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (3,'45000.0','12/21/17 5:30 PM','3','8919',NULL,NULL,NULL,NULL,NULL,NULL,'Approved','New'),(4,'45000.0','12/21/17 5:33 PM','4','8303',NULL,NULL,NULL,NULL,NULL,NULL,'pedding','New'),(5,'45000.0','12/21/17 5:35 PM',NULL,'5506',NULL,NULL,NULL,NULL,NULL,NULL,'pedding','New'),(6,'45000.0','12/21/17 5:36 PM',NULL,'7098',NULL,NULL,NULL,NULL,NULL,NULL,'pedding','New'),(7,'45000.0','12/21/17 5:43 PM',NULL,'7959',NULL,NULL,NULL,NULL,NULL,NULL,'pedding','New'),(8,'3000.0','12/21/17 6:53 PM',NULL,'8802',NULL,NULL,NULL,NULL,NULL,NULL,'pedding','New'),(9,'2165.0','2/24/18 9:53 PM',NULL,'4805',NULL,NULL,NULL,NULL,NULL,NULL,'pedding','New'),(10,'1200.0','3/3/18 10:10 AM',NULL,'6349',NULL,NULL,NULL,NULL,NULL,NULL,'pedding','New'),(11,'1200.0','3/3/18 11:36 AM',NULL,'8406',NULL,NULL,NULL,NULL,NULL,NULL,'pedding','New'),(12,'18500.0','3/3/18 2:05 PM','6','7114',NULL,'2018-03-16','2018-03-23',NULL,NULL,NULL,'pedding','New'),(13,'79666.0','3/3/18 5:57 PM','6','8532',NULL,'2018-03-01','2018-03-23',NULL,NULL,NULL,'pedding','New'),(14,'33500.0','3/3/18 6:08 PM','6','5386',NULL,'','',NULL,NULL,NULL,'Approved','New'),(15,'19700.0','3/3/18 6:33 PM','6','4199',NULL,'2018-03-09','2018-03-16',NULL,NULL,NULL,'Approved','New'),(16,'109426.0','3/3/18 7:45 PM','7','6180',NULL,'2018-03-08','2018-03-30',NULL,NULL,NULL,'pedding','New'),(17,'321.0','3/3/18 7:57 PM','7','6102',NULL,'2018-03-07','2018-03-16',NULL,NULL,NULL,'Approved',NULL),(19,'68532.0','3/13/18 3:50 PM','8','8104',NULL,'2018-03-09','2018-03-23',NULL,NULL,NULL,'pedding','New'),(20,'1284.0','3/13/18 5:31 PM','6','9707',NULL,'2018-03-01','2018-05-17',NULL,NULL,NULL,'pedding','New'),(21,'32000.0','3/13/18 5:40 PM','8','6502',NULL,'2018-03-21','2018-03-23',NULL,NULL,NULL,'Rejected','New'),(22,'47399.0','3/13/18 5:46 PM','8','6684',NULL,'2018-03-01','2018-03-16',NULL,NULL,NULL,'pedding','New'),(23,'100000.0','3/13/18 5:54 PM','6','8593','2018-03-13 14:54:48','2018-03-09','2018-03-23',NULL,NULL,NULL,'Delivered','New'),(24,'92000.0','March 28, 2018','6','7743','2018-03-28 18:37:03','2018-03-28','2018-03-30',NULL,NULL,NULL,'pedding',NULL),(25,'1284.0','March 28, 2018','6','4312','2018-03-28 19:13:05','2018-03-28','2018-03-30',NULL,NULL,NULL,'Approved',NULL),(26,'433.0','March 28, 2018','6','4769','2018-03-28 19:47:30','2018-03-21','2018-03-23',NULL,NULL,NULL,'Approved',NULL),(27,'25500.0','March 28, 2018','6','4914','2018-03-28 20:13:12','2018-03-28','2018-03-30',NULL,NULL,NULL,'pedding',NULL),(28,'32200.0','March 28, 2018','6','5229','2018-03-28 20:15:39','2018-03-14','2018-03-30',NULL,NULL,NULL,'Approved',NULL),(29,'15000.0','March 28, 2018','6','8156','2018-03-28 20:18:23','2018-03-29','2018-03-30',NULL,NULL,NULL,'pedding',NULL),(30,'15000.0','March 28, 2018','6','6793','2018-03-28 20:20:22','2018-03-22','2018-03-22',NULL,NULL,NULL,'pedding',NULL),(31,'20000.0','March 28, 2018','6','8981','2018-03-28 20:23:48','2018-03-28','2018-03-30',NULL,NULL,NULL,'pedding',NULL),(32,'20000.0','March 28, 2018','6','7287','2018-03-28 20:25:09','2018-03-28','2018-03-29',NULL,NULL,NULL,'Approved',NULL),(33,'25500.0','April 19, 2018','11','3017','2018-04-19 19:15:34','Apr 20, 2018','Apr 21, 2018','Nairobi','wedding party',NULL,'pedding',NULL),(34,'321.0','April 19, 2018','11','15667','2018-04-19 19:25:26','Apr 21, 2018','Apr 23, 2018','mombasa','Graduatio party',NULL,'Delivered',NULL),(35,'4266.0','April 28, 2018','5','13743','2018-04-28 15:20:11','Apr 29, 2018','Apr 30, 2018','Nairobi','Graduatio party',NULL,'pedding',NULL),(36,'4266.0','April 28, 2018','5','13743','2018-04-28 15:20:36','Apr 29, 2018','Apr 30, 2018','Nairobi','Graduatio party',NULL,'pedding',NULL),(37,'15000.0','April 29, 2018','11','8977','2018-04-29 18:35:46','Apr 30, 2018','May 2, 2018','Nairobi','Wedding Party',NULL,'pedding',NULL),(38,'42133.0','April 29, 2018','11','11793','2018-04-29 18:44:23','Apr 30, 2018','May 2, 2018','mombasa','Graduatio party',NULL,'pedding',NULL),(39,'12093.0','April 29, 2018','11','5712','2018-04-29 19:12:15','Apr 30, 2018','May 1, 2018','nai','graduation',NULL,'pedding',NULL),(40,'12093.0','April 29, 2018','11','5712','2018-04-29 19:19:25','Apr 30, 2018','May 1, 2018','nai','graduation',NULL,'pedding',NULL),(41,'12093.0','April 29, 2018','11','5712','2018-04-29 19:20:24','Apr 30, 2018','May 1, 2018','nai','graduation',NULL,'pedding',NULL),(42,'12093.0','April 29, 2018','11','5712','2018-04-29 19:21:44','Apr 30, 2018','May 1, 2018','nai','graduation',NULL,'pedding',NULL),(43,'12093.0','April 29, 2018','11','5712','2018-04-29 19:24:26','Apr 30, 2018','May 1, 2018','nai','graduation',NULL,'pedding',NULL),(44,'12093.0','April 29, 2018','11','5712','2018-04-29 19:25:58','Apr 30, 2018','May 1, 2018','nai','graduation',NULL,'pedding',NULL),(45,'12093.0','April 29, 2018','11','5712','2018-04-29 19:28:31','Apr 30, 2018','May 1, 2018','nai','graduation',NULL,'pedding',NULL),(46,'12093.0','April 29, 2018','11','5712','2018-04-29 19:30:36','Apr 30, 2018','May 1, 2018','nai','graduation',NULL,'pedding',NULL),(47,'12093.0','April 29, 2018','11','5712','2018-04-29 19:30:58','Apr 30, 2018','May 1, 2018','nai','graduation',NULL,'pedding',NULL),(48,'15000.0','April 29, 2018','5','18279','2018-04-29 20:02:21','Apr 30, 2018','May 1, 2018','Nairobi','Graduatio party',NULL,'pedding',NULL),(49,'15000.0','April 29, 2018','5','8472','2018-04-29 20:06:41','Apr 30, 2018','May 1, 2018','Nairobi','Graduatio party',NULL,'pedding',NULL),(50,'21200.0','May 3, 2018','11','13681','2018-05-03 14:12:21','Feb 6, 2018','May 2, 2018','6','2',NULL,'pedding',NULL),(51,'1034000.0','May 7, 2018','11','12496','2018-05-07 11:29:10','May 10, 2018','May 17, 2018','1','2',NULL,'pedding',NULL);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyword`
--

DROP TABLE IF EXISTS `keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyword` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `keyword` (`keyword`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyword`
--

LOCK TABLES `keyword` WRITE;
/*!40000 ALTER TABLE `keyword` DISABLE KEYS */;
INSERT INTO `keyword` VALUES (1,'',''),(2,'','<MMS>');
/*!40000 ALTER TABLE `keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keywordaction`
--

DROP TABLE IF EXISTS `keywordaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keywordaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `commandInteger` int(11) NOT NULL,
  `commandString` longtext,
  `counter` int(11) NOT NULL,
  `emailRecipients` varchar(255) DEFAULT NULL,
  `emailSubject` varchar(255) DEFAULT NULL,
  `endDate` bigint(20) NOT NULL,
  `externalCommand` varchar(255) DEFAULT NULL,
  `externalCommandResponseActionType` int(11) DEFAULT NULL,
  `externalCommandResponseType` int(11) DEFAULT NULL,
  `externalCommandType` int(11) DEFAULT NULL,
  `startDate` bigint(20) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `emailAccount_id` bigint(20) DEFAULT NULL,
  `group_path` varchar(255) DEFAULT NULL,
  `keyword_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK822AE55FC5482473` (`keyword_id`),
  KEY `FK822AE55FDAF23DFD` (`group_path`),
  KEY `FK822AE55F3D2C2C41` (`emailAccount_id`),
  CONSTRAINT `FK822AE55F3D2C2C41` FOREIGN KEY (`emailAccount_id`) REFERENCES `emailaccount` (`id`),
  CONSTRAINT `FK822AE55FC5482473` FOREIGN KEY (`keyword_id`) REFERENCES `keyword` (`id`),
  CONSTRAINT `FK822AE55FDAF23DFD` FOREIGN KEY (`group_path`) REFERENCES `frontline_group` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keywordaction`
--

LOCK TABLES `keywordaction` WRITE;
/*!40000 ALTER TABLE `keywordaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `keywordaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `binaryMessageContent` tinyblob,
  `date` bigint(20) NOT NULL,
  `dtype` varchar(255) DEFAULT NULL,
  `recipientMsisdn` varchar(255) DEFAULT NULL,
  `recipientSmsPort` int(11) NOT NULL,
  `retriesRemaining` int(11) NOT NULL,
  `senderMsisdn` varchar(255) DEFAULT NULL,
  `smsPartsCount` int(11) NOT NULL,
  `smscReference` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `textContent` longtext,
  `type` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,NULL,1520952040366,'FrontlineMessage','0714601594',0,0,'',0,NULL,2,'Dear,kariuki  rober@gmail.com ,sunshine-occassion limitedHas received your order of Number: Your orderConfirmation No is, 6502. You Ordered: 1No of items.Your Order total is Kshs 32000.0  only . Your Phone number is  0714601594 , your order will be delivered to 432-233-232 Nairobi. thank you for doing business with us',3,NULL),(2,NULL,1520952414742,'FrontlineMessage','0714601594',0,0,'',0,NULL,2,'Dear,kariuki  rober@gmail.com ,sunshine-occassion limitedHas received your order of Number: Your orderConfirmation No is, 6684. You Ordered: 2No of items.Your Order total is Kshs 47399.0  only . Your Phone number is  0714601594 , your order will be delivered to 432-233-232 Nairobi. thank you for doing business with us',3,NULL),(3,NULL,1520952888970,'FrontlineMessage','0714601594',0,0,'',0,NULL,2,'Dear,kelvin  john@gmail.com ,sunshine-occassion limitedHas received your order of Number: Your orderConfirmation No is, 8593. You Ordered: 1No of items.Your Order total is Kshs 100000.0  only . Your Phone number is  0714601594 , your order will be delivered to 432-233-232 Nairobi. thank you for doing business with us',3,NULL);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_frontlinemultimediamessagepart`
--

DROP TABLE IF EXISTS `message_frontlinemultimediamessagepart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_frontlinemultimediamessagepart` (
  `message_id` bigint(20) NOT NULL,
  `multimediaParts_id` bigint(20) NOT NULL,
  UNIQUE KEY `multimediaParts_id` (`multimediaParts_id`),
  KEY `FKAA958F0AFC9C3E5E` (`multimediaParts_id`),
  KEY `FKAA958F0A2B00A379` (`message_id`),
  CONSTRAINT `FKAA958F0A2B00A379` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`),
  CONSTRAINT `FKAA958F0AFC9C3E5E` FOREIGN KEY (`multimediaParts_id`) REFERENCES `frontlinemultimediamessagepart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_frontlinemultimediamessagepart`
--

LOCK TABLES `message_frontlinemultimediamessagepart` WRITE;
/*!40000 ALTER TABLE `message_frontlinemultimediamessagepart` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_frontlinemultimediamessagepart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderedproducts`
--

DROP TABLE IF EXISTS `orderedproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderedproducts` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `productquantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderedproducts`
--

LOCK TABLES `orderedproducts` WRITE;
/*!40000 ALTER TABLE `orderedproducts` DISABLE KEYS */;
INSERT INTO `orderedproducts` VALUES (8,15,3,1),(9,15,4,1),(10,16,11,1),(11,16,13,1),(12,16,16,1),(13,16,15,1),(14,16,14,1),(15,17,18,1),(16,13,15,2),(17,13,16,1),(18,19,16,3),(19,19,17,1),(20,20,18,4),(21,21,12,1),(22,22,17,3),(23,22,9,2),(24,23,11,5),(25,24,7,4),(26,24,12,1),(27,25,18,4),(28,26,2,1),(29,27,8,1),(30,28,14,1),(31,29,7,1),(32,30,7,1),(33,31,11,1),(34,32,11,1),(35,33,8,1),(36,34,18,1),(37,35,17,2),(38,35,17,2),(39,37,7,1),(40,38,11,1),(41,38,16,1),(42,39,15,1),(43,39,15,1),(44,39,15,1),(45,39,15,1),(46,39,15,1),(47,39,15,1),(48,39,15,1),(49,39,15,1),(50,39,15,1),(51,48,7,1),(52,49,7,1),(53,50,11,1),(54,50,3,1),(55,51,6,44);
/*!40000 ALTER TABLE `orderedproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(45) DEFAULT NULL,
  `productdescription` longtext,
  `productprice` double DEFAULT NULL,
  `productimage` varchar(45) DEFAULT NULL,
  `productstatus` varchar(45) DEFAULT NULL,
  `productcategory` varchar(45) DEFAULT NULL,
  `productcapacity` varchar(45) DEFAULT NULL,
  `producttype` varchar(45) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (2,'chair black','xvcvc',433,'chair.jpg','Enabled','15','','8',2),(3,' Blue and white Canopie','    Each All Purpose Canopy tent arrives complete with white powder-coated steel or aluminum poles and steel stakes. Guy ropes are permanently attached to the tops to prevent misplacing them and to allow for simple, fast installation adjustments. Storage bags and simple, illustrated, step-by-step installation instructions are also included. The All Purpose Canopy tent is great for carnivals or any outdoor event.\r\n    Seats 16 to 24 guests.\r\n    Installation not included.\r\n    Must be installed on grass.\r\n    Canopies need 6\' around perimeter for staking.',1200,'463.jpg','Enabled','7','16 x 16','9',1),(4,'20\'x30\' Blue & White Canopy','    Each All Purpose Canopy tent arrives complete with white powder-coated steel or aluminum poles and steel stakes. Guy ropes are permanently attached to the tops to prevent misplacing them and to allow for simple, fast installation adjustments. Storage bags and simple, illustrated, step-by-step installation instructions are also included. The All Purpose Canopy tent is great for carnivals or any outdoor event.\r\n    Seats 40 to 60 guests.\r\n    Installation not included.\r\n    Must be installed on grass.\r\n    Canopies need 6\' around perimeter for staking.',18500,'27022.jpg','Enabled','7','20x30','9',12),(5,'Yellow & White Canopy','    Each All Purpose Canopy tent arrives complete with white powder-coated steel or aluminum poles and steel stakes. Guy ropes are permanently attached to the tops to prevent misplacing them and to allow for simple, fast installation adjustments. Storage bags and simple, illustrated, step-by-step installation instructions are also included. The All Purpose Canopy tent is great for carnivals or any outdoor event.\r\n    Seats 40 to 60 guests.\r\n    Installation not included.\r\n    Must be installed on grass.\r\n    Canopies need 6\' around perimeter for staking.',18500,'471.jpg','Enabled','7','20\'x30\' ','9',10),(6,' Green & White Canopy','    Each All Purpose Canopy tent arrives complete with white powder-coated steel or aluminum poles and steel stakes. Guy ropes are permanently attached to the tops to prevent misplacing them and to allow for simple, fast installation adjustments. Storage bags and simple, illustrated, step-by-step installation instructions are also included. The All Purpose Canopy tent is great for carnivals or any outdoor event.\r\n    Seats 64 to 80 guests.\r\n    Installation not included.\r\n    Must be installed on grass.\r\n    Canopies need 6\' around perimeter for staking.',23500,'472.jpg','Enabled','7','20 FOOT x40 FOOT','9',12),(7,'White Canopy','    Each All Purpose Canopy tent arrives complete with white powder-coated steel or aluminum poles and steel stakes. Guy ropes are permanently attached to the tops to prevent misplacing them and to allow for simple, fast installation adjustments. Storage bags and simple, illustrated, step-by-step installation instructions are also included. The All Purpose Canopy tent is great for carnivals or any outdoor event.\r\n    Seats 32 to 40 guests.\r\n    Installation not included.\r\n    Must be installed on grass.\r\n    Canopies need 6\' around perimeter for staking.',15000,'467.jpg','Enabled','7','20 FOOT X20 FOOT','9',32),(8,'20\'x40\' White Canopy','    Each All Purpose Canopy tent arrives complete with white powder-coated steel or aluminum poles and steel stakes. Guy ropes are permanently attached to the tops to prevent misplacing them and to allow for simple, fast installation adjustments. Storage bags and simple, illustrated, step-by-step installation instructions are also included. The All Purpose Canopy tent is great for carnivals or any outdoor event.\r\n    Seats 64 to 80 guests.\r\n    Installation not included.\r\n    Must be installed on grass.\r\n    Canopies need 6\' around perimeter for staking.',25500,'473.jpg','Enabled','7','20 FOOTX40 FOOT','9',12),(9,'20\'x30\' White Canopy','    Each All Purpose Canopy tent arrives complete with white powder-coated steel or aluminum poles and steel stakes. Guy ropes are permanently attached to the tops to prevent misplacing them and to allow for simple, fast installation adjustments. Storage bags and simple, illustrated, step-by-step installation instructions are also included. The All Purpose Canopy tent is great for carnivals or any outdoor event.\r\n    Seats 40 to 60 guests.\r\n    Installation not included.\r\n    Must be installed on grass.\r\n    Canopies need 6\' around perimeter for staking.',20500,'470.jpg','Enabled','7','20 FOOT X30 FOOT','9',13),(10,'20\'x20\' Yellow & White Canopy','    Each All Purpose Canopy tent arrives complete with white powder-coated steel or aluminum poles and steel stakes. Guy ropes are permanently attached to the tops to prevent misplacing them and to allow for simple, fast installation adjustments. Storage bags and simple, illustrated, step-by-step installation instructions are also included. The All Purpose Canopy tent is great for carnivals or any outdoor event.\r\n    Seats 32 to 40 guests.\r\n    Installation not included.\r\n    Must be installed on grass.\r\n    Canopies need 6\' around perimeter for staking.',13000,'468.jpg','Enabled','7','20FOOT X20 FOOT','9',23),(11,'12\'x12\' Fiesta Frame Tent','    Stretch out in elegant, versatile, clear, open space unobstructed by interior center poles with the Fiesta Frame expandable tent. That means more room for seating, dancing, entertainment, relaxation and enjoyment. Great as a wedding party tent or cook tent for the larger tented events.\r\n    Seats 10 to 14 guests.\r\n    Walls not included with tent pricing.',20000,'35367.jpg','Enabled','7','12FOOT X 12 FOOT','9',20),(12,'16\'x40\' Fiesta Frame Tent','    Stretch out in elegant, versatile, clear, open space unobstructed by interior center poles with the Fiesta Frame expandable tent. That means more room for seating, dancing, entertainment, relaxation and enjoyment. Great as a wedding party tent or cook tent for the larger tented events.\r\n    Seats 40 to 64 guests.\r\n    Walls not included with tent pricing.',32000,'929.jpg','Enabled','7','16FOOT X40 FOOT','15',10),(13,'20\'x60\' Fiesta Frame Tent','    Stretch out in elegant, versatile, clear, open space unobstructed by interior center poles with the Fiesta Frame expandable tent. That means more room for seating, dancing, entertainment, relaxation and enjoyment. Great as a wedding party tent or cook tent for the larger tented events.\r\n    Seats 100 to 120 guests.\r\n    Walls not included with tent pricing.',23000,'936.jpg','Enabled','7','20FOOT X60 FOOT','15',21),(14,'30\'x90\' Future Trac Frame Tent','    The Future Trac Frame Tent System incorporates modular construction in which fabric panels slide through channeled-beams for faster, simplified installations, smooth, weathertight fit and maximum stability. Use standard 8ft walls or Trac-Walls to keep the elements out.\r\n    Walls not included with tent pricing.',32200,'40007.jpg','Enabled','7','30FOOT X 90 FOOT','14',21),(15,'40\'x55\' Future Trac Frame Tent','    The Future Trac Frame Tent System incorporates modular construction in which fabric panels slide through channeled-beams for faster, simplified installations, smooth, weathertight fit and maximum stability. Use standard 8ft walls or Trac-Walls to keep the elements out.\r\n    Walls not included with tent pricing.',12093,'944.jpg','Enabled','7','40FOOT X55 FOOT','14',32),(16,'F3 20\'x70\' Hip End Tent','    The F3 Frame Tent is the newest addition to our tent family. With its state of the art elegant design the F3 is much stronger and with its simplistic design allows you to get the best bang for your buck. The F3 is great for any smaller affair or backyard bonanza.\r\n    The tent is 8\' high at Eave.\r\n    The tent is 12\'-8\" high at Ridge.\r\n    Seats 90 to 140 guests.\r\n    8\' walls not included with tent pricing.',22133,'46088.jpg','Enabled','7','20FOOT X70FOOT','14',2),(17,'Farm Table 9\' x 40','    40\"x 108\" Seats up to 10 using ends\r\n    4 on a side and 1 on each end\r\n    NOT TO BE USED FOR BUFFET OR BARS\r\n    ONLY DINING TABLES\r\n    NO OPEN CANDLES TO BE USED!!\r\n    DAMAGE WAIVER DOES NOT APPLY TO THIS RENTAL ITEM',2133,'41086.jpg','Enabled','15','9FOOT X40 FOOT','16',2),(18,'Banquet Table 6\'x30\"','Banquet Table ',321,'1578.jpg','Enabled','15','6FOOT X30 FOOT','16',2),(19,'Red Carpet 4\' x 25\' Runner','Prices are subject to change.',75000,'43771.jpg','Enabled','21','4 X 25','21',1),(20,'Red Carpet 4\' x 50\' Runner','',10000,'40128.jpg','Enabled','21','4x50','21',1),(21,'Surloc Flooring','',20000,'43848.jpg','Enabled','21','23x20','21',2),(22,'Tent Heater 80,000 BTUs','    Propane consumption 3.7 lbs. per hour\r\n    Electric: Starting 5.0 amps\r\n    Continuous Operation 1.5 amps\r\n    Dimension: 29 1/2\" L x 13 1/2\" W x 20\" H\r\n    (1) 40 lbs. propane tank included with rental',10000,'965.jpg','Enabled','21','2x3','20',23),(23,'Ocilating Fan 33\"x52\" box','    CAN NOT BE PICKED UP, MUST BE DELIVERED!\r\n    Just an oscillating Big Fan no water TO BE USED IT WILL LEAK!!!!!!\r\n    All models have heavy-duty, maintenance free, 2-speed motors and oscillating outputs.\r\n    1 Hp dimensions: Base 33\" x 33\" x 52\" tall',7500,'42662.jpg','Enabled','21','33 x 53','20',12),(24,'Patio Heater Collapsable w/ Tank','Comments:\r\n\r\n    Must have at least 2\' clearance from top (10\').\r\n    Please read lighting instructions on the uint.\r\n    There are high and low settings for heat.\r\n    The unit produces 40,000 btu\'s on high.\r\n    Propane tank burns approx. 2lbs per hour.\r\n    must pick up with a truck or SUV!\r\n    Does not really fit in a car.',10000,'46529.jpg','Enabled','21','','20',12),(25,'Fire Extinguisher','Must be hung 4\' from floor. ',1000,'32327.jpg','Enabled','21','','20',1),(26,'Double French Door','',3000,'32206.jpg','Enabled','21','','20',11),(27,'Oak Parquet Dance Floor','    This item is priced by the square foot and sold in 3\'x4\' sections.\r\n    Normal sizes are:\r\n    12x12= 144 sq\' (approx 75 people) 16x18= 288 sq\' (approx 150 people)\r\n    12x16= 192 sq\' (approx 100 people) 16x21= 336 sq\' (approx 175 people)\r\n    15x16= 240 sq\' (approx 125 people) 18x20= 360 sq\' (approx 200 people)',2000,'1186.jpg','Enabled','21','','21',1),(28,'Staging 4x4\'','4\'x4\' sections. Available in 8\", 16\" and 24\" heights. Standard installation is included in price.',4000,'46109.jpg','Enabled','21','','21',10),(29,'8\' Cathedral Walls','Sold by linear foot.',1250,'1609.jpg','Enabled','21','','19',2),(30,'7\' Cafe Walls','Sold by linear foot.',1200,'1598.jpg','Enabled','21','','19',1),(31,'8x10 Aurora Weathershield Clear Wall','Sold by 10\' Sections',1300,'45999.jpg','Enabled','21','','19',1),(32,'8\' Solid Walls','Sold by linear foot.',2300,'1596.jpg','Enabled','21','','19',1),(33,'5\' Serpentine Bar w/ Skirt','',4500,'1577.jpg','Enabled','20','','17',1),(34,'4\' Bar w/ Black Skirting','',3500,'1576.jpg','Enabled','20','','17',1),(35,'6\' Bar w/ White Skirting','',4000,'1581.jpg','Enabled','20','','17',1),(36,'Deluxe Cherry Wood Bar','Dimensions 56\"L x 26 1/4\"W x 47 3/4\" H',9000,'35366.jpg','Enabled','20','','17',1),(37,'8\' Bar w/ Black Skirting','',5500,'44673.jpg','Enabled','20','','17',1),(38,'Rustic Cross Back Chair','',1050,'46747.jpg','Enabled','14','','18',2),(39,'Black Folding Chair','',2000,'39856.jpg','Enabled','20','','18',30),(40,'Children\'s Chair - Yellow','only for 2 to 4 year old children!!!!!!!!!!!!!!!!!!!!!!!!!!!',1000,'46426.jpg','Enabled','20','','18',20),(41,'White Resin Chair w/ Pad','',3500,'498.jpg','Enabled','20','','18',1),(42,'Z Bar Stool w/ Black Seat','Goes well with light up ped tables.',2000,'39858.jpg','Enabled','20','','18',20),(43,'Half Round Table 60\"','',72500,'1579.jpg','Enabled','20','','16',12),(44,'Serpentine Table 6\' Radius','',2300,'25188.jpg','Enabled','20','','16',14),(45,'Off White Umbrella w/ Base','Prices are subject to change.',2700,'1591.jpg','Enabled','20','','18',21),(46,'---42\" high poles w/ base','NEEDS 120\" RD LINEN',2121,'38527.jpg','Enabled','20','','18',1),(47,'Square Table 36\"','',2135,'1584.jpg','Enabled','20','','16',2),(48,'Children\'s Table 6\'x30\"','',2100,'30272.jpg','Enabled','20','','16',1),(49,'Farm Table 9\' x 40','',1090,'41086.jpg','Enabled','20','','16',3),(50,'Brandy Snifter 8 Oz','25 per rack',500,'998.jpg','Enabled','22','','22',12),(51,'Champagne Flute Glass 6 Oz','',100,'1001.jpg','Enabled','22','','22',1),(52,'Glass Petal Bowl 1 Qt','',100,'997.jpg','Enabled','22','','22',1),(53,'Sundae 7 Oz Tulip Glass','',300,'1015.jpg','Enabled','22','','22',10),(54,'Demitasse White Cup','',123,'38159.jpg','Enabled','22','','23',11),(55,'Ivory w/ Gold Rim Gravy Boat','',213,'1206.jpg','Enabled','22','','23',1),(56,'Glass Plate 8\"','',50,'42658.jpg','Enabled','22','','23',1),(57,'Melamine White Antique Bowl Medium','',232,'46336.jpg','Enabled','22','','23',12),(58,'Provence Dessert/Salad Plate 8\"','',200,'45471.jpg','Enabled','22','','23',1),(59,'White Ramekin 8oz.','',121,'37633.jpg','Enabled','22','','23',1),(60,'Caviar Dinner Knife','',110,'45460.jpg','Enabled','22','','24',1),(61,'Caviar Teaspoon','',158,'45463.jpg','Enabled','22','','24',12),(62,'Silver Dinner Fork','',122,'879.jpg','Enabled','22','','24',2),(63,'Stainless Gravy Ladel','Good for Family Style Serving.',12,'877.jpg','Enabled','22','','24',1),(64,'Large Handled Steak Knife','',300,'31805.jpg','Enabled','22','','24',1),(66,'3\' Propane Grill (Collapsible)','    Fuel not included.\r\n    20 or 30 lb propane tank recommended.\r\n    All grills MUST be returned as clean as you recieved it!\r\n    There will be a minimum charge of $75.00 for grills returned dirty!',232,'46614.jpg','Enabled','8','','26',1),(67,'Single Burner (Butane)','',2310,'449.jpg','Enabled','8','','26',1),(68,'20 Quart Clam Steamer','',324,'501.jpg','Enabled','8','','26',1),(69,'Tow-Behind Grill','',3432,'35505.jpg','Enabled','8','','26',1),(70,'Griddle','',453,'1026.jpg','Enabled','8','','26',1),(71,'24\"x60\" Charcoal Grill','',121,'1024.jpg','Enabled','8','','26',1),(72,'Propane Deep Fryer','    Fuel not included.\r\n    2 baskets - holds 5 -10 gallons of oil.\r\n    Dimensions - 3 ft in length by 18 inches wide.\r\n    20 pound propane tank recommended.',213,'448.jpg','Enabled','8','','26',1),(73,'Single Burner (Propane)','    Fuel not included.\r\n    20 lb tank recommended.',125,'450.jpg','Enabled','8','','26',1),(74,'Chafer Quart Oval','',174,'25607.jpg','Enabled','8','','25',1),(75,'Coffee Server 42 Ounce','',217,'902.jpg','Enabled','8','','25',1),(76,'100 Cup Coffee Maker','',2131,'886.jpg','Enabled','8','','27',1),(77,'5 Gallon Hot/Cold Container (blk)','',123,'26153.jpg','Enabled','8','','27',2),(78,'5 Gallon Beverage Dispenser','',232,'46369.jpg','Enabled','8','','27',1),(79,'Mason Beverage Dispenser 1.5 gal','',543,'46798.jpg','Enabled','8','','27',1),(80,'Snowcone Machine','',232,'485.jpg','Enabled','10','','select brand',1),(81,'Popcorn Cart','',433,'486.jpg','Enabled','10','','29',1),(82,'Hot Dog Mini Cart','    Body constructed of #304 stainless steel\r\n    Capacity: 50 hot dogs 35 buns\r\n    Electrical: 120V, 1200W, 10amps\r\n    Size: 16\" x 24\" x 16\" High\r\n    Must be plugged into wall directly no extension cords.\r\n    For best results have a dedicated line.',657,'40282.jpg','Enabled','10','','29',1),(83,'Spin Art','',25,'993.jpg','Enabled','10','','29',1),(84,'Cotton Candy Machine','    Cotton Candy breaks down in 3 main pieces: the motor, metal donut, and sneeze guard.\r\n    It will fit in a back seat of a car.\r\n    Instructions are online and we give you cotton candy 101at the store.\r\n    Do not wear anything nice when you are making the cotton candy.\r\n    You will want to stay out of windy areas.\r\n    It is an easy machine to work and you will be the hit of the party.\r\n    You should choose only one color or the cotton candy will be black!',433,'856.jpg','Enabled','10','','29',1),(85,'40\'x140\' Century Mate Pole Tent','    The most asked-for-by-name tent in the industry, the Century Tent system is comprised of ends, mids and unique center sections that adapt to virtually any configuration your events demand. Strong web guys are used for easy tensioning. Used in conjunction with Anchor\'s web tensioning bars, they provide amazing stability. Lace lines are protected by an innovative seal that keeps rain out. The Century Tent is great for any event, party or wedding.\r\n    Prices subject to change pending a site inspection.\r\n    Great on grass but can be installed on asphalt.\r\n    Walls not included with tent pricing.',3245,'37690.jpg','Enabled','7','','13',1),(86,'40\'x60\' Century Mate Pole Tent','    The most asked-for-by-name tent in the industry, the Century Tent system is comprised of ends, mids and unique center sections that adapt to virtually any configuration your events demand. Strong web guys are used for easy tensioning. Used in conjunction with Anchor\'s web tensioning bars, they provide amazing stability. Lace lines are protected by an innovative seal that keeps rain out. The Century Tent is great for any event, party or wedding.\r\n    Prices subject to change pending a site inspection.\r\n    Great on grass but can be installed on asphalt.\r\n    Walls not included with tent pricing.',477,'1231.jpg','Enabled','7','','13',1),(87,' Cross Tent','    The most asked-for-by-name tent in the industry, the Century Cross Tent system is comprised of ends, mids and unique center sections that adapt to virtually any configuration your events demand. Strong web guys are used for easy tensioning. Used in conjunction with Anchor\'s web tensioning bars, they provide amazing stability. Lace lines are protected by an innovative seal that keeps rain out. The Century Cross Tent is great for any event, party or wedding.\r\n    Prices subject to change pending a site inspection.\r\n    Seating for 650-1000 people.\r\n    Great on grass but can be installed on asphalt.\r\n    Walls not included with tent pricing.',3465,'39855.jpg','Enabled','7','60\'x140\'/40\'x100\'','13',1),(88,'Century Mate Pole Tent','    The most asked-for-by-name tent in the industry, the Century Tent system is comprised of ends, mids and unique center sections that adapt to virtually any configuration your events demand. Strong web guys are used for easy tensioning. Used in conjunction with Anchor\'s web tensioning bars, they provide amazing stability. Lace lines are protected by an innovative seal that keeps rain out. The Century Tent is great for any event, party or wedding.\r\n    Prices subject to change pending a site inspection.\r\n    Great on grass but can be installed on asphalt.\r\n    Walls not included with tent pricing.',2754,'1229.jpg','Enabled','7','40\'x40\' ','13',1),(89,'Century Pole Tent','    The most asked-for-by-name tent in the industry, the Century Tent system is comprised of ends, mids and unique center sections that adapt to virtually any configuration your events demand. Strong web guys are used for easy tensioning. Used in conjunction with Anchor\'s web tensioning bars, they provide amazing stability. Lace lines are protected by an innovative seal that keeps rain out. The Century Tent is great for any event, party or wedding.\r\n    Prices subject to change pending a site inspection.\r\n    Seating for 335-420 people.\r\n    Great on grass but can be installed on asphalt.\r\n    Walls not included with tent pricing.',76754,'1238.jpg','Enabled','7','60\'x70\'  Century Pole Tent','13',2),(90,'Future Trac Frame Tent','    The Future Trac Frame Tent System incorporates modular construction in which fabric panels slide through channeled-beams for faster, simplified installations, smooth, weathertight fit and maximum stability. Use standard 8ft walls or Trac-Walls to keep the elements out.\r\n    Walls not included with tent pricing.',677,'947.jpg','Enabled','7','40\'x70\' ','14',3),(91,'Aurora Sheer Top Pole Tent','    Aurora s Translucent fabric becomes more than just a canvas for the wedding planner s art it becomes an active and integral part of it. Bright sunlight is softened and transformed into a warm glow with an entrancing play of light and shadow from gently swaying trees. At night it turns incandescent, a gleaming beacon conveying the joyful revelry inside to the world at large.\r\n    Prices subject to change pending a site inspection.\r\n    Great on grass but can be installed on asphalt.\r\n    Walls not included with tent pricing.',7675,'46010.jpg','Enabled','7','45\'x44\' ','15',3),(92,'Aurora Sheer Top Pole Tent','    Aurora s Translucent fabric becomes more than just a canvas for the wedding planner s art it becomes an active and integral part of it. Bright sunlight is softened and transformed into a warm glow with an entrancing play of light and shadow from gently swaying trees. At night it turns incandescent, a gleaming beacon conveying the joyful revelry inside to the world at large.\r\n    Prices subject to change pending a site inspection.\r\n    Great on grass but can be installed on asphalt.\r\n    Walls not included with tent pricing.',67548,'46741.jpg','Enabled','7','32\'x51\' ','15',2),(93,'Aurora Sheer Top Pole Tent','    Aurora s Translucent fabric becomes more than just a canvas for the wedding planner s art it becomes an active and integral part of it. Bright sunlight is softened and transformed into a warm glow with an entrancing play of light and shadow from gently swaying trees. At night it turns incandescent, a gleaming beacon conveying the joyful revelry inside to the world at large.\r\n    Prices subject to change pending a site inspection.\r\n    Great on grass but can be installed on asphalt.\r\n    Walls not included with tent pricing.',55,'46493.jpg','Enabled','7','45\'x144\' ','15',2);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productbrand`
--

DROP TABLE IF EXISTS `productbrand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productbrand` (
  `brandid` int(11) NOT NULL AUTO_INCREMENT,
  `brandname` varchar(45) DEFAULT NULL,
  `categoryid` int(11) NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`brandid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productbrand`
--

LOCK TABLES `productbrand` WRITE;
/*!40000 ALTER TABLE `productbrand` DISABLE KEYS */;
INSERT INTO `productbrand` VALUES (9,'Canopies Tent',7,'471.jpg'),(13,'Pole Tents',7,'929.jpg'),(14,'Frame Tents',7,'46088.jpg'),(15,'Silcloth Tent',7,'936.jpg'),(16,'Tables',20,'1579.jpg'),(17,'Bars',20,'35366.jpg'),(18,'Chairs',20,'498.jpg'),(19,'Side Walls',21,'1596.jpg'),(20,'Heater And AIr Condition',21,'965.jpg'),(21,'Flooring And Staging',21,'1186.jpg'),(22,'Glassware',22,'998.jpg'),(23,'China',22,'1001.jpg'),(24,'Flatware',22,'879.jpg'),(25,'Catering Accessories',8,NULL),(26,'Barbecue',8,'46614.jpg'),(27,'Beverage',8,NULL),(28,'Silver Service',8,NULL),(29,'Carnival Rentals',10,NULL);
/*!40000 ALTER TABLE `productbrand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminder`
--

DROP TABLE IF EXISTS `reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminder` (
  `occurrence` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `enddate` bigint(20) DEFAULT NULL,
  `recipients` varchar(255) DEFAULT NULL,
  `startdate` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminder`
--

LOCK TABLES `reminder` WRITE;
/*!40000 ALTER TABLE `reminder` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsevalue`
--

DROP TABLE IF EXISTS `responsevalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responsevalue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsevalue`
--

LOCK TABLES `responsevalue` WRITE;
/*!40000 ALTER TABLE `responsevalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `responsevalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (8,'Administrator','Active'),(9,'Staff','Active'),(10,'Super Administrator','Active');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `settingid` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(45) DEFAULT NULL,
  `postal_address` varchar(45) DEFAULT NULL,
  `system_status` varchar(45) DEFAULT NULL,
  `sms_status` varchar(45) DEFAULT NULL,
  `email_status` varchar(45) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  `mobile_no` varchar(45) DEFAULT NULL,
  `tel_no` varchar(45) DEFAULT NULL,
  `email_address` varchar(45) DEFAULT NULL,
  `logo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`settingid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,'Sunshine Occassion Ltd',' P.O.BOX 90420-80100 Nairobi, Kenya','Locked','Enabled','Enabled','544-335-24674','www.sunshineoccassion.com','0713424535','(243)444-3565-44','sunshine@gmail.com',NULL);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smsinternetservicesettings`
--

DROP TABLE IF EXISTS `smsinternetservicesettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smsinternetservicesettings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serviceClassName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smsinternetservicesettings`
--

LOCK TABLES `smsinternetservicesettings` WRITE;
/*!40000 ALTER TABLE `smsinternetservicesettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `smsinternetservicesettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smsinternetservicesettings_smsinternetservicesettingvalue`
--

DROP TABLE IF EXISTS `smsinternetservicesettings_smsinternetservicesettingvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smsinternetservicesettings_smsinternetservicesettingvalue` (
  `SmsInternetServiceSettings_id` bigint(20) NOT NULL,
  `properties_id` bigint(20) NOT NULL,
  `mapkey` varchar(255) NOT NULL,
  PRIMARY KEY (`SmsInternetServiceSettings_id`,`mapkey`),
  UNIQUE KEY `properties_id` (`properties_id`),
  KEY `FKA24BD3BD32373A6A` (`properties_id`),
  KEY `FKA24BD3BD6E7ADCE1` (`SmsInternetServiceSettings_id`),
  CONSTRAINT `FKA24BD3BD32373A6A` FOREIGN KEY (`properties_id`) REFERENCES `smsinternetservicesettingvalue` (`id`),
  CONSTRAINT `FKA24BD3BD6E7ADCE1` FOREIGN KEY (`SmsInternetServiceSettings_id`) REFERENCES `smsinternetservicesettings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smsinternetservicesettings_smsinternetservicesettingvalue`
--

LOCK TABLES `smsinternetservicesettings_smsinternetservicesettingvalue` WRITE;
/*!40000 ALTER TABLE `smsinternetservicesettings_smsinternetservicesettingvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `smsinternetservicesettings_smsinternetservicesettingvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smsinternetservicesettingvalue`
--

DROP TABLE IF EXISTS `smsinternetservicesettingvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smsinternetservicesettingvalue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smsinternetservicesettingvalue`
--

LOCK TABLES `smsinternetservicesettingvalue` WRITE;
/*!40000 ALTER TABLE `smsinternetservicesettingvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `smsinternetservicesettingvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smsmodemsettings`
--

DROP TABLE IF EXISTS `smsmodemsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smsmodemsettings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleteMessagesAfterReceiving` bit(1) NOT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `useDeliveryReports` bit(1) NOT NULL,
  `useForReceiving` bit(1) NOT NULL,
  `useForSending` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smsmodemsettings`
--

LOCK TABLES `smsmodemsettings` WRITE;
/*!40000 ALTER TABLE `smsmodemsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `smsmodemsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'eventdb'
--

--
-- Dumping routines for database 'eventdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-13 12:57:02
