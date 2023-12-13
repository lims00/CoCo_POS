DROP DATABASE IF EXISTS`pos_db`;
CREATE DATABASE  IF NOT EXISTS `pos_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pos_db`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pos_db
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `CartID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `TotalPrice` int DEFAULT 0,
  PRIMARY KEY (`CartID`),
  KEY `cart_ibfk_1` (`CustomerID`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartitem`
--

DROP TABLE IF EXISTS `cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartitem` (
  `CartID` int NOT NULL,
  `ProductID` int NOT NULL,
  `UnitPrice` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`CartID`,`ProductID`),
  KEY `cartitem_ibfk_2` (`ProductID`),
  CONSTRAINT `cartitem_ibfk_1` FOREIGN KEY (`CartID`) REFERENCES `cart` (`CartID`),
  CONSTRAINT `cartitem_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitem`
--

LOCK TABLES `cartitem` WRITE;
/*!40000 ALTER TABLE `cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CategoryID` int NOT NULL,
  `CategoryName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Groceries'),(2,'Fresh Produce'),(3,'Dairy and Eggs'),(4,'Bakery'),(5,'Frozen Foods'),(6,'Beverages'),(7,'Snacks'),(8,'Cleaning Supplies'),(9,'Personal Care'),(10,'Pet Supplies');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `CouponID` int NOT NULL,
  `DiscountPrice` int NOT NULL,
  PRIMARY KEY (`CouponID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES (0,0),(1,1000),(2,2000),(3,3000),(4,4000),(5,5000);
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Address` text,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (641,'SuHyun','Lim','lsh@cau.co.kr','1012345678','CAU'),(1907,'MyeongHoon','jang','jmh@cau.co.kr','1012345678','CAU'),(1973,'JeongWon','Na','njw@cau.co.kr','1012345678','CAU'),(4372,'SooMin','Bae','bsm@cau.ac.kr','1012345678','CAU'),(6641,'YoHan','shin','syh@cau.ac.r','1012345678','CAU');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerorderhistory`
--

DROP TABLE IF EXISTS `customerorderhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerorderhistory` (
  `CustomerID` int NOT NULL,
  `OrderID` int NOT NULL,
  PRIMARY KEY (`CustomerID`,`OrderID`),
  KEY `OrderID` (`OrderID`),
  CONSTRAINT `customerorderhistory_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `customerorderhistory_ibfk_2` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerorderhistory`
--

LOCK TABLES `customerorderhistory` WRITE;
/*!40000 ALTER TABLE `customerorderhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerorderhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmployeeID` int NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Position` varchar(50) DEFAULT NULL,
  `Department` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiryreply`
--

DROP TABLE IF EXISTS `inquiryreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiryreply` (
  `InquiryID` int NOT NULL,
  `EmployeeID` int NOT NULL,
  `ReplyDate` date DEFAULT NULL,
  PRIMARY KEY (`InquiryID`,`EmployeeID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `inquiryreply_ibfk_1` FOREIGN KEY (`InquiryID`) REFERENCES `productinquiry` (`InquiryID`),
  CONSTRAINT `inquiryreply_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiryreply`
--

LOCK TABLES `inquiryreply` WRITE;
/*!40000 ALTER TABLE `inquiryreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `inquiryreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership` (
  `LevelID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `JoinDate` date DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LevelID`,`CustomerID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `membership_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `membership_ibfk_2` FOREIGN KEY (`LevelID`) REFERENCES `membershiplevel` (`LevelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
INSERT INTO `membership` VALUES (3,641,'2023-12-10','2024-12-10','active'),(3,1907,'2023-12-10','2024-12-10','active'),(3,1973,'2023-12-10','2024-12-10','active'),(3,4372,'2023-12-10','2024-12-10','active'),(3,6641,'2023-12-10','2024-12-10','active');
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `membership_expiry_trigger` BEFORE INSERT ON `membership` FOR EACH ROW BEGIN
    IF NEW.ExpiryDate IS NOT NULL AND NEW.ExpiryDate < CURDATE() THEN
        SET NEW.Status = 'expired';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `membership_update_trigger` BEFORE UPDATE ON `membership` FOR EACH ROW BEGIN
    IF NEW.ExpiryDate IS NOT NULL AND NEW.ExpiryDate < CURDATE() THEN
        SET NEW.Status = 'expired';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `membershiplevel`
--

DROP TABLE IF EXISTS `membershiplevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membershiplevel` (
  `LevelID` int NOT NULL,
  `LevelName` varchar(50) DEFAULT NULL,
  `DiscountRate` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`LevelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membershiplevel`
--

LOCK TABLES `membershiplevel` WRITE;
/*!40000 ALTER TABLE `membershiplevel` DISABLE KEYS */;
INSERT INTO `membershiplevel` VALUES (1,'Bronze',5.00),(2,'Silver',10.00),(3,'Gold',15.00);
/*!40000 ALTER TABLE `membershiplevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `OrderItemID` int NOT NULL,
  `OrderID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`OrderItemID`),
  KEY `OrderID` (`OrderID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (1,1,1,2,15000.00),(2,1,3,1,3990.00);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_stock_after_orderitem_insert` AFTER INSERT ON `orderitem` FOR EACH ROW BEGIN
  DECLARE purchased_quantity INT;

  -- Get the purchased quantity from the inserted order item
  SELECT Quantity INTO purchased_quantity FROM pos_db.orderitem WHERE OrderItemID = NEW.OrderItemID;

  -- Update the stock quantity in the product table
  UPDATE pos_db.product
  SET StockQuantity = StockQuantity - purchased_quantity
  WHERE ProductID = NEW.ProductID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `PaymentMethodID` int NOT NULL,
  `CouponID` int DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `DiscountedTotalAmount` int NOT NULL DEFAULT '0',
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  `IsRefunded` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `order_ibfk_2` (`PaymentMethodID`),
  KEY `order_ibfk_3` (`CouponID`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`PaymentMethodID`) REFERENCES `paymentmethod` (`PaymentMethodID`),
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`CouponID`) REFERENCES `coupon` (`CouponID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,NULL,'2023-12-01',30000,0.00,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmethod`
--

DROP TABLE IF EXISTS `paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentmethod` (
  `PaymentMethodID` int NOT NULL,
  `MethodName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PaymentMethodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethod`
--

LOCK TABLES `paymentmethod` WRITE;
/*!40000 ALTER TABLE `paymentmethod` DISABLE KEYS */;
INSERT INTO `paymentmethod` VALUES (1,'Cash'),(2,'Card');
/*!40000 ALTER TABLE `paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` int NOT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `StockQuantity` int DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `fk_Product_Category` (`CategoryID`),
  CONSTRAINT `fk_Product_Category` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'쌀',1,15000.00,108),(2,'사과',2,2500.00,50),(3,'우유',3,3990.00,79),(4,'바게트',4,4990.00,30),(5,'냉동피자',5,8990.00,40),(6,'콜라',6,1990.00,60),(7,'감자칩',7,1490.00,80),(8,'만능청소제',8,5990.00,20),(9,'샴푸',9,7490.00,25),(10,'강아지 사료',10,12990.00,35);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productinquiry`
--

DROP TABLE IF EXISTS `productinquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productinquiry` (
  `InquiryID` int NOT NULL,
  `ProductID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `InquiryDate` date DEFAULT NULL,
  `InquiryContent` text,
  `ReplyContent` text,
  PRIMARY KEY (`InquiryID`),
  KEY `ProductID` (`ProductID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `productinquiry_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `productinquiry_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productinquiry`
--

LOCK TABLES `productinquiry` WRITE;
/*!40000 ALTER TABLE `productinquiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `productinquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productsalehistory`
--

DROP TABLE IF EXISTS `productsalehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productsalehistory` (
  `ProductID` int NOT NULL,
  `SaleID` int NOT NULL,
  PRIMARY KEY (`ProductID`,`SaleID`),
  KEY `SaleID` (`SaleID`),
  CONSTRAINT `productsalehistory_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `productsalehistory_ibfk_2` FOREIGN KEY (`SaleID`) REFERENCES `sale` (`SaleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productsalehistory`
--

LOCK TABLES `productsalehistory` WRITE;
/*!40000 ALTER TABLE `productsalehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `productsalehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productservice`
--

DROP TABLE IF EXISTS `productservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productservice` (
  `ServiceID` int NOT NULL,
  `ProductID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `ServiceDate` date DEFAULT NULL,
  `ServiceType` varchar(50) DEFAULT NULL,
  `ServiceContent` text,
  PRIMARY KEY (`ServiceID`),
  KEY `ProductID` (`ProductID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `productservice_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `productservice_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productservice`
--

LOCK TABLES `productservice` WRITE;
/*!40000 ALTER TABLE `productservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `productservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `PromotionID` int NOT NULL,
  `PromotionName` varchar(255) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `DiscountRate` decimal(5,2) DEFAULT NULL,
  `PromotionDescription` text,
  PRIMARY KEY (`PromotionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (1,'BlackFriday','2023-11-19','2023-11-22',30.00,'BlackFriday Sale!'),(2,'HappyNewYear','2024-01-01','2024-01-07',20.00,'Happy New Year Sale!');
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt` (
  `ReceiptID` int NOT NULL,
  `SaleID` int DEFAULT NULL,
  `ReceiptDate` date DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  `PaymentMethodID` int DEFAULT NULL,
  PRIMARY KEY (`ReceiptID`),
  KEY `SaleID` (`SaleID`),
  KEY `PaymentMethodID` (`PaymentMethodID`),
  CONSTRAINT `receipt_ibfk_1` FOREIGN KEY (`SaleID`) REFERENCES `sale` (`SaleID`),
  CONSTRAINT `receipt_ibfk_2` FOREIGN KEY (`PaymentMethodID`) REFERENCES `paymentmethod` (`PaymentMethodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receiptitem`
--

DROP TABLE IF EXISTS `receiptitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receiptitem` (
  `ReceiptItemID` int NOT NULL,
  `ReceiptID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  `Subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ReceiptItemID`),
  KEY `ReceiptID` (`ReceiptID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `receiptitem_ibfk_1` FOREIGN KEY (`ReceiptID`) REFERENCES `receipt` (`ReceiptID`),
  CONSTRAINT `receiptitem_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receiptitem`
--

LOCK TABLES `receiptitem` WRITE;
/*!40000 ALTER TABLE `receiptitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `receiptitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund`
--

DROP TABLE IF EXISTS `refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refund` (
  `RefundID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Reason` text,
  `refunddate` date DEFAULT NULL,
  PRIMARY KEY (`RefundID`),
  KEY `OrderID` (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `refund_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `refund_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund`
--

LOCK TABLES `refund` WRITE;
/*!40000 ALTER TABLE `refund` DISABLE KEYS */;
INSERT INTO `refund` VALUES (1,1,6641,'Processing','Product damaged during shipping',NULL),(2,1,NULL,'Processing',NULL,NULL),(3,1,NULL,'Processing',NULL,NULL),(4,1,NULL,'Processing',NULL,NULL),(5,1,NULL,'Processing','Just change my mind','2023-12-12'),(6,1,NULL,'Processing','Just change my mind','2023-12-12');
/*!40000 ALTER TABLE `refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refunditem`
--

DROP TABLE IF EXISTS `refunditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refunditem` (
  `RefundItemID` int NOT NULL,
  `RefundID` int NOT NULL,
  `OrderItemID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`RefundItemID`),
  KEY `OrderItemID` (`OrderItemID`),
  KEY `RefundItemID` (`RefundItemID`),
  KEY `refunditem_ibfk_1` (`RefundID`),
  CONSTRAINT `refunditem_ibfk_1` FOREIGN KEY (`RefundID`) REFERENCES `refund` (`RefundID`),
  CONSTRAINT `refunditem_ibfk_2` FOREIGN KEY (`OrderItemID`) REFERENCES `orderitem` (`OrderItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refunditem`
--

LOCK TABLES `refunditem` WRITE;
/*!40000 ALTER TABLE `refunditem` DISABLE KEYS */;
/*!40000 ALTER TABLE `refunditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `ReportID` int NOT NULL,
  `ReportDate` date DEFAULT NULL,
  `ReportType` varchar(50) DEFAULT NULL,
  `TotalSalesAmount` decimal(10,2) DEFAULT NULL,
  `TotalTaxAmount` decimal(10,2) DEFAULT NULL,
  `TotalDiscountAmount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ReportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportsale`
--

DROP TABLE IF EXISTS `reportsale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportsale` (
  `ReportID` int NOT NULL,
  `SaleID` int NOT NULL,
  PRIMARY KEY (`ReportID`,`SaleID`),
  KEY `SaleID` (`SaleID`),
  CONSTRAINT `reportsale_ibfk_1` FOREIGN KEY (`ReportID`) REFERENCES `report` (`ReportID`),
  CONSTRAINT `reportsale_ibfk_2` FOREIGN KEY (`SaleID`) REFERENCES `sale` (`SaleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportsale`
--

LOCK TABLES `reportsale` WRITE;
/*!40000 ALTER TABLE `reportsale` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportsale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `SaleID` int NOT NULL,
  `OrderID` int DEFAULT NULL,
  `SaleDate` date DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  `PaymentMethodID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SaleID`),
  KEY `OrderID` (`OrderID`),
  CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saleitem`
--

DROP TABLE IF EXISTS `saleitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saleitem` (
  `SaleItemID` int NOT NULL,
  `SaleID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`SaleItemID`),
  KEY `SaleID` (`SaleID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `saleitem_ibfk_1` FOREIGN KEY (`SaleID`) REFERENCES `sale` (`SaleID`),
  CONSTRAINT `saleitem_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saleitem`
--

LOCK TABLES `saleitem` WRITE;
/*!40000 ALTER TABLE `saleitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `saleitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salepaymentmethod`
--

DROP TABLE IF EXISTS `salepaymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salepaymentmethod` (
  `SaleID` int NOT NULL,
  `PaymentMethodID` int NOT NULL,
  PRIMARY KEY (`SaleID`,`PaymentMethodID`),
  KEY `PaymentMethodID` (`PaymentMethodID`),
  CONSTRAINT `salepaymentmethod_ibfk_1` FOREIGN KEY (`SaleID`) REFERENCES `sale` (`SaleID`),
  CONSTRAINT `salepaymentmethod_ibfk_2` FOREIGN KEY (`PaymentMethodID`) REFERENCES `paymentmethod` (`PaymentMethodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salepaymentmethod`
--

LOCK TABLES `salepaymentmethod` WRITE;
/*!40000 ALTER TABLE `salepaymentmethod` DISABLE KEYS */;
/*!40000 ALTER TABLE `salepaymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesstatistics`
--

DROP TABLE IF EXISTS `salesstatistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesstatistics` (
  `StatisticsID` int NOT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `TotalSalesAmount` decimal(10,2) DEFAULT NULL,
  `TotalTaxAmount` decimal(10,2) DEFAULT NULL,
  `TotalDiscountAmount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`StatisticsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesstatistics`
--

LOCK TABLES `salesstatistics` WRITE;
/*!40000 ALTER TABLE `salesstatistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesstatistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchsale`
--

DROP TABLE IF EXISTS `searchsale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchsale` (
  `TransactionID` int NOT NULL,
  `SaleID` int NOT NULL,
  PRIMARY KEY (`TransactionID`,`SaleID`),
  KEY `SaleID` (`SaleID`),
  CONSTRAINT `searchsale_ibfk_1` FOREIGN KEY (`TransactionID`) REFERENCES `transactionsearch` (`TransactionID`),
  CONSTRAINT `searchsale_ibfk_2` FOREIGN KEY (`SaleID`) REFERENCES `sale` (`SaleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchsale`
--

LOCK TABLES `searchsale` WRITE;
/*!40000 ALTER TABLE `searchsale` DISABLE KEYS */;
/*!40000 ALTER TABLE `searchsale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statisticssale`
--

DROP TABLE IF EXISTS `statisticssale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statisticssale` (
  `StatisticsID` int NOT NULL,
  `SaleID` int NOT NULL,
  PRIMARY KEY (`StatisticsID`,`SaleID`),
  KEY `SaleID` (`SaleID`),
  CONSTRAINT `statisticssale_ibfk_1` FOREIGN KEY (`StatisticsID`) REFERENCES `salesstatistics` (`StatisticsID`),
  CONSTRAINT `statisticssale_ibfk_2` FOREIGN KEY (`SaleID`) REFERENCES `sale` (`SaleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statisticssale`
--

LOCK TABLES `statisticssale` WRITE;
/*!40000 ALTER TABLE `statisticssale` DISABLE KEYS */;
/*!40000 ALTER TABLE `statisticssale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactionsearch`
--

DROP TABLE IF EXISTS `transactionsearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactionsearch` (
  `TransactionID` int NOT NULL,
  `SearchDate` date DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `SaleID` int DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `ProductID` (`ProductID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `SaleID` (`SaleID`),
  CONSTRAINT `transactionsearch_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `transactionsearch_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `transactionsearch_ibfk_3` FOREIGN KEY (`SaleID`) REFERENCES `sale` (`SaleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionsearch`
--

LOCK TABLES `transactionsearch` WRITE;
/*!40000 ALTER TABLE `transactionsearch` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactionsearch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pos_db'
--

--
-- Dumping routines for database 'pos_db'
--
/*!50003 DROP FUNCTION IF EXISTS `ApplyDiscount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ApplyDiscount`(customer_id INT, purchase_amount DECIMAL(10,2)) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE discount_rate DECIMAL(5,2);

    -- 레벨별 할인율 가져오기
    SET discount_rate = GetDiscountRate(customer_id);

    -- 구매 가격에 할인 적용
    SET purchase_amount = purchase_amount - (purchase_amount * discount_rate / 100);

    RETURN purchase_amount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calculate_tax` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_tax`(total_price INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE tax_rate DECIMAL(5,2) DEFAULT 0.10;
    DECLARE tax_amount INT;

    SET tax_amount = ROUND(total_price * tax_rate);
    RETURN tax_amount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calculate_total_with_tax` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_total_with_tax`(total_price INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE tax_amount INT;

    SET tax_amount = calculate_tax(total_price);
    RETURN total_price + tax_amount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetDiscountRate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetDiscountRate`(customer_id INT) RETURNS decimal(5,2)
    READS SQL DATA
BEGIN
    DECLARE level_discount DECIMAL(5,2);

    SELECT ml.DiscountRate INTO level_discount
    FROM membership m
    JOIN membershiplevel ml ON m.LevelID = ml.LevelID
    WHERE m.CustomerID = customer_id;

    RETURN COALESCE(level_discount, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `refund` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `refund`(IN p_order_id INT)
BEGIN
    DECLARE total_return_amount DECIMAL(10, 2);

    -- 반품된 주문의 총 금액 계산
    SELECT SUM(oi.Quantity * oi.UnitPrice) INTO total_return_amount
    FROM orderitem oi
    WHERE oi.OrderID = p_order_id;

    -- refund 테이블에 반품 정보 추가
    INSERT INTO refund (OrderID, refundDate,reason, Status)
    VALUES (p_order_id, NOW(), 'Just change my mind','Processing');

    -- 반품된 상품의 재고 증가
    UPDATE product p
    INNER JOIN orderitem oi ON p.ProductID = oi.ProductID
    SET p.StockQuantity = p.StockQuantity + oi.Quantity
    WHERE oi.OrderID = p_order_id;

    -- 주문 테이블에서 총 주문 금액 감소
    UPDATE orders
    SET TotalAmount = TotalAmount - total_return_amount
    WHERE OrderID = p_order_id;

    SELECT 'Return processed successfully' AS Message;
END ;;
DELIMITER ;