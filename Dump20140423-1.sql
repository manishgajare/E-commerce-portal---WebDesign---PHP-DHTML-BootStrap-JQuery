CREATE DATABASE  IF NOT EXISTS `webdesign` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `webdesign`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: webdesign
-- ------------------------------------------------------
-- Server version	5.6.16-enterprise-commercial-advanced

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
-- Table structure for table `account_information`
--

DROP TABLE IF EXISTS `account_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_information` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `accountType` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `applicationStatus` varchar(45) NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `userId` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_information`
--

LOCK TABLES `account_information` WRITE;
/*!40000 ALTER TABLE `account_information` DISABLE KEYS */;
INSERT INTO `account_information` VALUES (1,'customer','anil','anil','active');
/*!40000 ALTER TABLE `account_information` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `account_information_AINS` AFTER INSERT ON `account_information` FOR EACH ROW
BEGIN
       INSERT into signuplogs set userId=NEW.userId;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `account_security`
--

DROP TABLE IF EXISTS `account_security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_security` (
  `userId` int(11) NOT NULL,
  `question1` varchar(45) NOT NULL,
  `answer1` varchar(45) NOT NULL,
  `question2` varchar(45) NOT NULL,
  `answer2` varchar(45) NOT NULL,
  `emailVerificationNumber` varchar(45) NOT NULL,
  `emailVerificationStatus` varchar(45) NOT NULL DEFAULT 'not verified',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  CONSTRAINT `fk_userId_account_security` FOREIGN KEY (`userId`) REFERENCES `account_information` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_security`
--

LOCK TABLES `account_security` WRITE;
/*!40000 ALTER TABLE `account_security` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_security` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `brandId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `companyDesc` varchar(45) NOT NULL,
  `callCenterNumber` int(11) NOT NULL,
  `headquatersAddress` varchar(255) NOT NULL,
  PRIMARY KEY (`brandId`),
  UNIQUE KEY `brandId_UNIQUE` (`brandId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Peter England','-',0,'-'),(2,'Raymond','-',0,'-'),(3,'Nautica','-',0,'-'),(4,'Armani','-',0,'-');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_holder_details`
--

DROP TABLE IF EXISTS `card_holder_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card_holder_details` (
  `creditDebitId` int(11) NOT NULL,
  `address` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `zipcode` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  PRIMARY KEY (`creditDebitId`),
  UNIQUE KEY `creditDebitId_UNIQUE` (`creditDebitId`),
  CONSTRAINT `fk_creditDebitId_card_holder_details` FOREIGN KEY (`creditDebitId`) REFERENCES `credit_debit_account` (`creditDebitId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_holder_details`
--

LOCK TABLES `card_holder_details` WRITE;
/*!40000 ALTER TABLE `card_holder_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `card_holder_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `desc` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`categoryId`),
  UNIQUE KEY `categoryId_UNIQUE` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'clothing','Men, Women and Children clothing','active');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checking_account`
--

DROP TABLE IF EXISTS `checking_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checking_account` (
  `checkingAccountId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accountHolderName` varchar(45) NOT NULL,
  `bankName` varchar(45) NOT NULL,
  `electronicRoutingNumber` int(50) NOT NULL,
  `checkingAccountNumber` int(50) NOT NULL,
  `cardNumber` int(50) NOT NULL,
  `securityCode` int(50) NOT NULL,
  `expirationMonth` int(2) NOT NULL,
  `expirationYear` int(4) NOT NULL,
  `checking_accountcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`checkingAccountId`),
  UNIQUE KEY `checkingAccountId_UNIQUE` (`checkingAccountId`),
  KEY `fk_userId_checking_account_idx` (`userId`),
  CONSTRAINT `fk_userId_checking_account` FOREIGN KEY (`userId`) REFERENCES `account_information` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checking_account`
--

LOCK TABLES `checking_account` WRITE;
/*!40000 ALTER TABLE `checking_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `checking_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checking_account_card_holder`
--

DROP TABLE IF EXISTS `checking_account_card_holder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checking_account_card_holder` (
  `checkingAccountId` int(11) NOT NULL,
  `cardHolderName` varchar(45) NOT NULL,
  `streetAddress` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `zipcode` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  PRIMARY KEY (`checkingAccountId`),
  UNIQUE KEY `checkingAccountId_UNIQUE` (`checkingAccountId`),
  CONSTRAINT `fk_checkingAccountId_checking_account_card_holder` FOREIGN KEY (`checkingAccountId`) REFERENCES `checking_account` (`checkingAccountId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checking_account_card_holder`
--

LOCK TABLES `checking_account_card_holder` WRITE;
/*!40000 ALTER TABLE `checking_account_card_holder` DISABLE KEYS */;
/*!40000 ALTER TABLE `checking_account_card_holder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `cityId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `stateId` int(11) NOT NULL,
  PRIMARY KEY (`cityId`),
  UNIQUE KEY `cityId_UNIQUE` (`cityId`),
  KEY `fk_stateId_city_idx` (`stateId`),
  CONSTRAINT `fk_stateId_city` FOREIGN KEY (`stateId`) REFERENCES `state` (`stateId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Boston',1);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `countryId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `tax` int(11) NOT NULL,
  PRIMARY KEY (`countryId`),
  UNIQUE KEY `countryId_UNIQUE` (`countryId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'USA',10);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_debit_account`
--

DROP TABLE IF EXISTS `credit_debit_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_debit_account` (
  `creditDebitId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  `cardNumber` int(50) NOT NULL,
  `cardIdentificationNumber` int(50) NOT NULL,
  `expirationMonth` int(2) NOT NULL,
  `expirationYear` int(4) NOT NULL,
  PRIMARY KEY (`creditDebitId`),
  UNIQUE KEY `creditDebitId_UNIQUE` (`creditDebitId`),
  KEY `fk_userId_credit_debit_account_idx` (`userId`),
  CONSTRAINT `fk_userId_credit_debit_account` FOREIGN KEY (`userId`) REFERENCES `account_information` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_debit_account`
--

LOCK TABLES `credit_debit_account` WRITE;
/*!40000 ALTER TABLE `credit_debit_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_debit_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `customerinformation`
--

DROP TABLE IF EXISTS `customerinformation`;
/*!50001 DROP VIEW IF EXISTS `customerinformation`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `customerinformation` (
  `userId` tinyint NOT NULL,
  `firstName` tinyint NOT NULL,
  `lastName` tinyint NOT NULL,
  `about` tinyint NOT NULL,
  `gender` tinyint NOT NULL,
  `dateOfBirth` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `applicationStatus` tinyint NOT NULL,
  `emailVerificationStatus` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL AUTO_INCREMENT,
  `orderItemId` int(11) NOT NULL,
  `trackingId` int(11) NOT NULL,
  `estimatedDays` int(11) NOT NULL,
  `dispatchedDate` datetime NOT NULL,
  `expectedDeliveryDate` datetime NOT NULL,
  PRIMARY KEY (`delivery_id`),
  UNIQUE KEY `delivery_id_UNIQUE` (`delivery_id`),
  KEY `fk_orderItemId_delivery_idx` (`orderItemId`),
  KEY `fk_trackingId_delivery_idx` (`trackingId`),
  CONSTRAINT `fk_orderItemId_delivery` FOREIGN KEY (`orderItemId`) REFERENCES `order_item` (`orderItemId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trackingId_delivery` FOREIGN KEY (`trackingId`) REFERENCES `tracking` (`trackingId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance` (
  `insuranceId` int(11) NOT NULL AUTO_INCREMENT,
  `insuranceType` varchar(45) NOT NULL,
  `duration` varchar(45) NOT NULL,
  `cost` varchar(45) NOT NULL,
  PRIMARY KEY (`insuranceId`),
  UNIQUE KEY `insuranceId_UNIQUE` (`insuranceId`),
  KEY `insuranceId` (`insuranceType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `inventoryId` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `warehouseId` int(11) NOT NULL,
  `size` varchar(45) NOT NULL,
  `quantityAvailable` varchar(45) NOT NULL,
  `cost` double NOT NULL,
  `earnedPoints` int(11) DEFAULT NULL,
  `productType` varchar(45) NOT NULL,
  PRIMARY KEY (`inventoryId`),
  UNIQUE KEY `inventoryId_UNIQUE` (`inventoryId`),
  KEY `fk_productId_inventory_idx` (`productId`),
  KEY `fk_warehouseId_inventory_idx` (`warehouseId`),
  CONSTRAINT `fk_productId_inventory` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_warehouseId_inventory` FOREIGN KEY (`warehouseId`) REFERENCES `warehouse` (`warehouseId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,1,'36','0',50,NULL,''),(2,1,1,'38','8',53,NULL,''),(3,1,1,'40','0',56,NULL,''),(4,1,1,'42','9',59,NULL,''),(5,1,1,'44','0',62,NULL,''),(6,2,1,'36','2',59,NULL,''),(7,2,1,'38','3',61,NULL,''),(8,2,1,'40','0',63,NULL,''),(9,2,1,'42','4',65,NULL,''),(10,3,1,'34','6',30,NULL,''),(11,3,1,'36','8',31,NULL,''),(12,3,1,'38','4',32,NULL,''),(13,3,1,'40','0',33,NULL,''),(14,4,1,'38','2',85,NULL,''),(15,4,1,'40','1',90,NULL,''),(16,4,1,'42','6',95,NULL,''),(17,5,1,'36','0',52,NULL,''),(18,5,1,'38','5',56,NULL,''),(19,5,1,'40','6',59,NULL,''),(20,5,1,'42','8',62,NULL,''),(21,6,1,'36','9',45,NULL,''),(22,6,1,'38','4',48,NULL,''),(23,7,1,'40','0',51,NULL,''),(24,7,1,'42','1',54,NULL,''),(25,7,1,'44','2',57,NULL,''),(26,8,1,'38','9',63,NULL,''),(27,8,1,'40','8',65,NULL,''),(28,8,1,'42','5',67,NULL,''),(29,8,1,'44','6',69,NULL,''),(30,9,1,'34','0',71,NULL,''),(31,9,1,'36','4',74,NULL,''),(32,10,1,'40','3',79,NULL,''),(33,11,1,'38','6',85,NULL,''),(34,11,1,'40','8',88,NULL,''),(35,11,1,'42','0',90,NULL,''),(36,12,1,'40','4',93,NULL,''),(37,12,1,'42','2',97,NULL,''),(38,13,1,'38','8',99,NULL,''),(39,13,1,'40','7',105,NULL,''),(40,13,1,'42','0',110,NULL,''),(41,14,1,'34','7',89,NULL,''),(42,14,1,'36','5',93,NULL,''),(43,14,1,'38','6',97,NULL,''),(44,14,1,'40','0',99,NULL,''),(45,15,1,'40','3',111,NULL,''),(46,15,1,'42','2',115,NULL,'');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item` (
  `orderItemId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `inventoryId` int(11) NOT NULL,
  `insuranceId` int(11) NOT NULL,
  `quantity` int(2) NOT NULL,
  PRIMARY KEY (`orderItemId`),
  UNIQUE KEY `orderItemId_UNIQUE` (`orderItemId`),
  KEY `fk_insuranceId_order_Item_idx` (`insuranceId`),
  KEY `fk_inventoryId_order_item_idx` (`inventoryId`),
  KEY `fk_orderId_order_item_idx` (`orderId`),
  CONSTRAINT `fk_insuranceId_order_Item` FOREIGN KEY (`insuranceId`) REFERENCES `insurance` (`insuranceId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventoryId_order_item` FOREIGN KEY (`inventoryId`) REFERENCES `inventory` (`inventoryId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderId_order_item` FOREIGN KEY (`orderId`) REFERENCES `ordercatalog` (`orderId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordercatalog`
--

DROP TABLE IF EXISTS `ordercatalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordercatalog` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `shipAddressId` int(11) NOT NULL,
  `insuranceId` int(11) NOT NULL,
  `paymentAccountType` varchar(45) NOT NULL,
  `paymentAccountId` int(11) NOT NULL,
  `timestampOrder` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cost` double NOT NULL,
  PRIMARY KEY (`orderId`),
  UNIQUE KEY `orderId_UNIQUE` (`orderId`),
  KEY `fk_insuranceId_order_idx` (`insuranceId`),
  KEY `fk_shipAddressId_order_idx` (`shipAddressId`),
  KEY `fk_userId_order_idx` (`userId`),
  CONSTRAINT `fk_insuranceId_order` FOREIGN KEY (`insuranceId`) REFERENCES `insurance` (`insuranceId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_shipAddressId_order` FOREIGN KEY (`shipAddressId`) REFERENCES `ship_address` (`shipAddressId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_userId_order` FOREIGN KEY (`userId`) REFERENCES `account_information` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordercatalog`
--

LOCK TABLES `ordercatalog` WRITE;
/*!40000 ALTER TABLE `ordercatalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordercatalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_account`
--

DROP TABLE IF EXISTS `paypal_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_account` (
  `paypalId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `emailId` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`paypalId`),
  UNIQUE KEY `paypalId_UNIQUE` (`paypalId`),
  KEY `fk_userId_paypal_account_idx` (`userId`),
  CONSTRAINT `fk_userId_paypal_account` FOREIGN KEY (`userId`) REFERENCES `account_information` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_account`
--

LOCK TABLES `paypal_account` WRITE;
/*!40000 ALTER TABLE `paypal_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_information`
--

DROP TABLE IF EXISTS `personal_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_information` (
  `userId` int(11) NOT NULL,
  `streetAddress` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `zipcode` varchar(45) NOT NULL,
  `ssn` varchar(45) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  CONSTRAINT `fk_userId_personal_information` FOREIGN KEY (`userId`) REFERENCES `account_information` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_information`
--

LOCK TABLES `personal_information` WRITE;
/*!40000 ALTER TABLE `personal_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `subCategoryId` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `productCode` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `style` varchar(45) NOT NULL,
  `fullDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`productId`),
  UNIQUE KEY `productId_UNIQUE` (`productId`),
  KEY `fk_subCategoryId_product_idx` (`subCategoryId`),
  CONSTRAINT `fk_subCategoryId_product` FOREIGN KEY (`subCategoryId`) REFERENCES `sub_category` (`subCategoryId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'shirt_men_1','CKSHIRT001','Calvin Klein sports wear short sleve','active','slim fit','This style features buttonholes on the points which fasten to the collar, eliminating the need for starching. This collar can be worn with or without a tie and is best designated as casual or business casual attire.'),(2,1,'shirt_men_2','ARMSHIRT001','Armani short sleve casual button down','active','comfort fir','This collar, like the Long Tab collar, is dressy and suitable for business attire, and its shorter tabs make your necktie more prominent. Perfect for showing off a gorgeous new tie!'),(3,1,'shirt_men_3','PESHIRT001','Peter England casual wear, slim fitting','active','universal fit','This collar features two buttons at the neck and because of its long tips is flattering for the man with a round face. Can be worn with or without a tie.'),(4,1,'shirt_men_4','DNMSHIRT001','Denim tight fit tshirt quality material','active','cowboy fit','This classy, aptly-named collar is intended for formal wear with a bowtie to black or white tie affairs. The most formal collar of all.'),(5,1,'shirt_men_5','RBKSHIRT001','Reebok sports look with 100% cotton','active','comfort fit','This classic collar has especially long points and is best suited for men with round faces. Can be worn formally or informally, but it is recommended for wear with a tie.'),(6,1,'shirt_men_6','WDSHIRT001','Woodland feather look casual wear','active','slim fit','This variation on the button-down collar features hidden buttons, making the shirt appear dressier while eliminating the need for starching.'),(7,1,'shirt_men_7','CLSHIRT001','Celio Full shirt with silk feel','active','comfort fit','French, or double cuffs, have an extra length of sleeve folded back and fastened with your favorite cufflinks! These are round-cut and are ideal for formal occasions.'),(8,1,'shirt_men_8','NSHIRT001','Nike slim fit with inner silk feel','active','slim fit','These French cuffs, made with extra lengths of sleeve which fold back and are fastened by your favorite cufflinks, are square-cut and perfect for formal occasions.'),(9,1,'shirt_men_9','PESHIRT002','Peter England party wear shirt','active','slim fit','This collar features two buttons at the neck and because of its long tips is flattering for the man with a round face. Can be worn with or without a tie.'),(10,1,'shirt_men_10','RMDSHIRT001','Raymond finest full sleve shirt','active','cowboy fit','Made popular by the Duke of Windsor, this dressy collar is usually worn on formal occasions and looks best with the Windsor tie knot.'),(11,1,'shirt_men_11','RGSHIRT001','Robert Graham true G-long sleeve','active','slim fit','This classy, aptly-named collar is intended for formal wear with a bowtie to black or white tie affairs. The most formal collar of all.'),(12,1,'shirt_men_12','DSLSHIRT001','Diesel S-Edition tshirt limited edition','active','universal fit','This casual style of button-down collar features two buttons at the neck and long points, making it suitable for framing a wide or round face.'),(13,1,'shirt_men_13','NAUSHIRT001','Nautica vineyard poplin plaid shirt ','active','cowboy fit','This one button round collar was traditionally worn in China to formal or military occasions but is now considered a casual style, worn without a necktie.'),(14,1,'shirt_men_14','OPSHIRT001','Original Penguin window pane plaid shirt','active','slim fit','This collar, also called the \"Continental Collar\" because of its popularity in Europe, has a small spread and should be worn with a tie.'),(15,1,'shirt_men_15','SASHIRT001','Steve Alan single needle shirt','active','comfort fit','These elegant and formal cuffs are designed so that you may show off your favorite cufflinks in a formal setting. Beveled edges for style.');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_image` (
  `productImageId` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `imagePath` varchar(45) NOT NULL,
  `thumbnailPath` varchar(45) NOT NULL,
  PRIMARY KEY (`productImageId`),
  UNIQUE KEY `productImageId_UNIQUE` (`productImageId`),
  KEY `fk_productId_idx` (`productId`),
  CONSTRAINT `fk_productId_product_image` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (1,1,'shirt_men_1a','shirt_men_1a'),(2,1,'shirt_men_1b','shirt_men_1b'),(3,2,'shirt_men_2a','shirt_men_2a'),(4,2,'shirt_men_2b','shirt_men_2b'),(5,3,'shirt_men_3a','shirt_men_3a'),(6,3,'shirt_men_3b','shirt_men_3b'),(7,4,'shirt_men_4a','shirt_men_4a'),(8,4,'shirt_men_4b','shirt_men_4b'),(31,5,'shirt_men_5a','shirt_men_5a'),(32,5,'shirt_men_5b','shirt_men_5b'),(33,6,'shirt_men_6a','shirt_men_6a'),(34,6,'shirt_men_6b','shirt_men_6b'),(35,7,'shirt_men_7a','shirt_men_7a'),(36,7,'shirt_men_7b','shirt_men_7b'),(37,8,'shirt_men_8a','shirt_men_8a'),(38,8,'shirt_men_8b','shirt_men_8b'),(39,9,'shirt_men_9a','shirt_men_9a'),(40,9,'shirt_men_9b','shirt_men_9b'),(41,10,'shirt_men_10a','shirt_men_10a'),(42,10,'shirt_men_10b','shirt_men_10b'),(43,11,'shirt_men_11a','shirt_men_11a'),(44,11,'shirt_men_11b','shirt_men_11b'),(45,12,'shirt_men_12a','shirt_men_12a'),(46,12,'shirt_men_12b','shirt_men_12b'),(47,13,'shirt_men_13a','shirt_men_13a'),(48,13,'shirt_men_13b','shirt_men_13b'),(49,14,'shirt_men_14a','shirt_men_14a'),(50,14,'shirt_men_14b','shirt_men_14b'),(51,15,'shirt_men_15a','shirt_men_15a'),(52,15,'shirt_men_15b','shirt_men_15b');
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_information`
--

DROP TABLE IF EXISTS `profile_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_information` (
  `userId` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `about` varchar(45) DEFAULT NULL,
  `profilePic` varchar(45) DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `dateOfBirth` date NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  CONSTRAINT `fk_userId_profile` FOREIGN KEY (`userId`) REFERENCES `account_information` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_information`
--

LOCK TABLES `profile_information` WRITE;
/*!40000 ALTER TABLE `profile_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `reviewId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `rating` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `desc` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`reviewId`),
  UNIQUE KEY `reviewId_UNIQUE` (`reviewId`),
  KEY `fk_userId_review_idx` (`userId`),
  KEY `fk_productId_review_idx` (`productId`),
  CONSTRAINT `fk_productId_review` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_userId_review` FOREIGN KEY (`userId`) REFERENCES `account_information` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ship_address`
--

DROP TABLE IF EXISTS `ship_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ship_address` (
  `shipAddressId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `streetAddress` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `addressType` varchar(45) NOT NULL,
  `phoneNumber` int(15) NOT NULL,
  PRIMARY KEY (`shipAddressId`),
  UNIQUE KEY `shipAddressId_UNIQUE` (`shipAddressId`),
  KEY `fk_userId_ship_address_idx` (`userId`),
  KEY `shipAddressId` (`addressType`),
  CONSTRAINT `fk_userId_ship_address` FOREIGN KEY (`userId`) REFERENCES `account_information` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ship_address`
--

LOCK TABLES `ship_address` WRITE;
/*!40000 ALTER TABLE `ship_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `ship_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_type`
--

DROP TABLE IF EXISTS `shipping_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_type` (
  `shippingTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `cost` double NOT NULL,
  `country` varchar(45) NOT NULL,
  `zipcode` varchar(45) NOT NULL,
  PRIMARY KEY (`shippingTypeId`),
  UNIQUE KEY `shippingTypeId_UNIQUE` (`shippingTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_type`
--

LOCK TABLES `shipping_type` WRITE;
/*!40000 ALTER TABLE `shipping_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signuplogs`
--

DROP TABLE IF EXISTS `signuplogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signuplogs` (
  `userId` int(11) NOT NULL,
  `timestampValue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_userId_signuplogs` FOREIGN KEY (`userId`) REFERENCES `account_information` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signuplogs`
--

LOCK TABLES `signuplogs` WRITE;
/*!40000 ALTER TABLE `signuplogs` DISABLE KEYS */;
INSERT INTO `signuplogs` VALUES (1,'2014-04-20 20:21:02');
/*!40000 ALTER TABLE `signuplogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `stateId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `tax` int(11) NOT NULL,
  `countryId` int(11) NOT NULL,
  PRIMARY KEY (`stateId`),
  UNIQUE KEY `stateId_UNIQUE` (`stateId`),
  KEY `fk_countryId_state_idx` (`countryId`),
  CONSTRAINT `fk_countryId_state` FOREIGN KEY (`countryId`) REFERENCES `country` (`countryId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'MA',10,1);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_category`
--

DROP TABLE IF EXISTS `sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_category` (
  `subCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `desc` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`subCategoryId`),
  UNIQUE KEY `subCategoryId_UNIQUE` (`subCategoryId`),
  KEY `fk_categoryId_sub_category_idx` (`categoryId`),
  CONSTRAINT `fk_categoryId_sub_category` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_category`
--

LOCK TABLES `sub_category` WRITE;
/*!40000 ALTER TABLE `sub_category` DISABLE KEYS */;
INSERT INTO `sub_category` VALUES (1,1,'shirt','shirt','active');
/*!40000 ALTER TABLE `sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonial`
--

DROP TABLE IF EXISTS `testimonial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonial` (
  `testimonialId` int(11) NOT NULL AUTO_INCREMENT,
  `brandId` int(11) NOT NULL,
  `message` varchar(999) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`testimonialId`),
  UNIQUE KEY `testimonialId_UNIQUE` (`testimonialId`),
  KEY `fk_brandId_idx` (`brandId`),
  CONSTRAINT `fk_brandId` FOREIGN KEY (`brandId`) REFERENCES `brand` (`brandId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonial`
--

LOCK TABLES `testimonial` WRITE;
/*!40000 ALTER TABLE `testimonial` DISABLE KEYS */;
INSERT INTO `testimonial` VALUES (1,1,'The online store is very easy to navigate and manage. So much so that we are able to delegate setup and support tasks to individuals without any technology background. Our Nexternal Account Executive has played a critical role in our success. His knowledge of not only the technology, but of the industry\'s best practices has been very valuable to Simple Truths.','2014-04-09 10:25:50'),(2,2,'The customer service that we have received from Nexternal from our account rep has been excellent. He is always available and ready to answer my questions or walk me through different options to help me determine the best solution for the needs of my customers. He is kind, sincere, professional and takes the time to make sure I fully understand my options from every angle.','2014-04-09 10:25:50'),(3,3,'The Nexternal store gave us all the features we needed, plus the assurance that a support staff would be ready to deal with technical issues should a problem arise. Our integration was smooth, accurate and we have enjoyed a highly functional system that is both reliable and easy for our staff to operate and maintain.','2014-04-09 10:25:50'),(4,4,'Order processing is extremely simple and I am learning how to use reports, mass emails, special notifications, and refunds (fabulous - I used to have to process a check for refunds!) I also know that I can make changes to my website in the future without worry, which is a huge benefit.','2014-04-09 10:25:51');
/*!40000 ALTER TABLE `testimonial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking`
--

DROP TABLE IF EXISTS `tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracking` (
  `trackingId` int(11) NOT NULL AUTO_INCREMENT,
  `shippingTypeId` int(11) NOT NULL,
  `trackingCode` varchar(45) NOT NULL,
  `service` varchar(45) NOT NULL,
  PRIMARY KEY (`trackingId`),
  UNIQUE KEY `trackingId_UNIQUE` (`trackingId`),
  KEY `fk_shippingTypeId_tracking_idx` (`shippingTypeId`),
  CONSTRAINT `fk_shippingTypeId_tracking` FOREIGN KEY (`shippingTypeId`) REFERENCES `shipping_type` (`shippingTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking`
--

LOCK TABLES `tracking` WRITE;
/*!40000 ALTER TABLE `tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking_progress`
--

DROP TABLE IF EXISTS `tracking_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracking_progress` (
  `trackingId` int(11) NOT NULL,
  `currentPosition` varchar(45) NOT NULL,
  `currentDateTime` datetime NOT NULL,
  `actualDeliveryDateExpected` date NOT NULL,
  `orderStatus` varchar(45) NOT NULL,
  PRIMARY KEY (`trackingId`),
  UNIQUE KEY `trackingId_UNIQUE` (`trackingId`),
  CONSTRAINT `fk_trackingId_tracking_progress` FOREIGN KEY (`trackingId`) REFERENCES `tracking` (`trackingId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking_progress`
--

LOCK TABLES `tracking_progress` WRITE;
/*!40000 ALTER TABLE `tracking_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracking_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `trackingstatus`
--

DROP TABLE IF EXISTS `trackingstatus`;
/*!50001 DROP VIEW IF EXISTS `trackingstatus`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `trackingstatus` (
  `trackingId` tinyint NOT NULL,
  `trackingCode` tinyint NOT NULL,
  `orderStatus` tinyint NOT NULL,
  `actualDeliveryDateExpected` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse` (
  `warehouseId` int(11) NOT NULL AUTO_INCREMENT,
  `streetAddress` varchar(45) NOT NULL,
  `zipcodeId` int(11) NOT NULL,
  PRIMARY KEY (`warehouseId`),
  UNIQUE KEY `warehouseId_UNIQUE` (`warehouseId`),
  KEY `fk_zipcode_warehouse_idx` (`zipcodeId`),
  CONSTRAINT `fk_zipcode_warehouse` FOREIGN KEY (`zipcodeId`) REFERENCES `zipcode` (`zipcodeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'75 Saint Alphonsus Street, Apt. 301/1906/1408',1);
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zipcode`
--

DROP TABLE IF EXISTS `zipcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zipcode` (
  `zipcodeId` int(11) NOT NULL AUTO_INCREMENT,
  `zipcode` varchar(45) NOT NULL,
  `cityId` int(11) NOT NULL,
  PRIMARY KEY (`zipcodeId`),
  UNIQUE KEY `zipcodeId_UNIQUE` (`zipcodeId`),
  KEY `fk_cityId_zipcode_idx` (`cityId`),
  CONSTRAINT `fk_cityId_zipcode` FOREIGN KEY (`cityId`) REFERENCES `city` (`cityId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zipcode`
--

LOCK TABLES `zipcode` WRITE;
/*!40000 ALTER TABLE `zipcode` DISABLE KEYS */;
INSERT INTO `zipcode` VALUES (1,'02120',1);
/*!40000 ALTER TABLE `zipcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `customerinformation`
--

/*!50001 DROP TABLE IF EXISTS `customerinformation`*/;
/*!50001 DROP VIEW IF EXISTS `customerinformation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customerinformation` AS select `profile_information`.`userId` AS `userId`,`profile_information`.`firstName` AS `firstName`,`profile_information`.`lastName` AS `lastName`,`profile_information`.`about` AS `about`,`profile_information`.`gender` AS `gender`,`profile_information`.`dateOfBirth` AS `dateOfBirth`,`account_information`.`username` AS `username`,`account_information`.`applicationStatus` AS `applicationStatus`,`account_security`.`emailVerificationStatus` AS `emailVerificationStatus` from ((`account_information` join `account_security` on((`account_security`.`userId` = `account_information`.`userId`))) join `profile_information` on((`profile_information`.`userId` = `account_information`.`userId`))) where (`account_information`.`accountType` = 'customer') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `trackingstatus`
--

/*!50001 DROP TABLE IF EXISTS `trackingstatus`*/;
/*!50001 DROP VIEW IF EXISTS `trackingstatus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `trackingstatus` AS select `tracking`.`trackingId` AS `trackingId`,`tracking`.`trackingCode` AS `trackingCode`,`tracking_progress`.`orderStatus` AS `orderStatus`,`tracking_progress`.`actualDeliveryDateExpected` AS `actualDeliveryDateExpected` from (`tracking_progress` join `tracking` on((`tracking_progress`.`trackingId` = `tracking`.`trackingId`))) where (`tracking_progress`.`orderStatus` = 'shipped') */;
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

-- Dump completed on 2014-04-23 23:25:27
