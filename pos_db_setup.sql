-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pos_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pos_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pos_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `pos_db` ;

-- -----------------------------------------------------
-- Table `pos_db`.`benefit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`benefit` (
  `BenefitID` INT NOT NULL,
  `BenefitName` VARCHAR(50) NULL DEFAULT NULL,
  `Description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`BenefitID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`category` (
  `CategoryID` INT NOT NULL,
  `CategoryName` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`CategoryID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`customer` (
  `CustomerID` INT NOT NULL,
  `FirstName` VARCHAR(255) NULL DEFAULT NULL,
  `LastName` VARCHAR(255) NULL DEFAULT NULL,
  `Email` VARCHAR(255) NULL DEFAULT NULL,
  `PhoneNumber` VARCHAR(15) NULL DEFAULT NULL,
  `Address` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`membershiplevel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`membershiplevel` (
  `LevelID` INT NOT NULL,
  `LevelName` VARCHAR(50) NULL DEFAULT NULL,
  `MinPoints` INT NULL DEFAULT NULL,
  `DiscountRate` DECIMAL(5,2) NULL DEFAULT NULL,
  PRIMARY KEY (`LevelID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`customermembershiplevel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`customermembershiplevel` (
  `CustomerMembershipLevelID` INT NOT NULL,
  `CustomerID` INT NULL DEFAULT NULL,
  `LevelID` INT NULL DEFAULT NULL,
  `AchievedDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerMembershipLevelID`),
  INDEX `CustomerID` (`CustomerID` ASC) VISIBLE,
  INDEX `LevelID` (`LevelID` ASC) VISIBLE,
  CONSTRAINT `customermembershiplevel_ibfk_1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `pos_db`.`customer` (`CustomerID`),
  CONSTRAINT `customermembershiplevel_ibfk_2`
    FOREIGN KEY (`LevelID`)
    REFERENCES `pos_db`.`membershiplevel` (`LevelID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`orders` (
  `OrderID` INT NOT NULL,
  `CustomerID` INT NULL DEFAULT NULL,
  `OrderDate` DATE NULL DEFAULT NULL,
  `TotalAmount` DECIMAL(10,2) NULL DEFAULT NULL,
  `PaymentMethod` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `CustomerID` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `orders_ibfk_1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `pos_db`.`customer` (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`customerpurchasehistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`customerpurchasehistory` (
  `CustomerID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`CustomerID`, `OrderID`),
  INDEX `OrderID` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `customerpurchasehistory_ibfk_1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `pos_db`.`customer` (`CustomerID`),
  CONSTRAINT `customerpurchasehistory_ibfk_2`
    FOREIGN KEY (`OrderID`)
    REFERENCES `pos_db`.`orders` (`OrderID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`discount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`discount` (
  `DiscountID` INT NOT NULL,
  `DiscountType` VARCHAR(50) NULL DEFAULT NULL,
  `DiscountAmount` DECIMAL(10,2) NULL DEFAULT NULL,
  `DiscountStartDate` DATE NULL DEFAULT NULL,
  `DiscountEndDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`DiscountID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`discountcoupon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`discountcoupon` (
  `CouponID` INT NOT NULL,
  `CouponCode` VARCHAR(50) NULL DEFAULT NULL,
  `StartDate` DATETIME NULL DEFAULT NULL,
  `EndDate` DATETIME NULL DEFAULT NULL,
  `DiscountRate` DECIMAL(5,2) NULL DEFAULT NULL,
  `CouponDescription` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`CouponID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`employee` (
  `EmployeeID` INT NOT NULL,
  `FirstName` VARCHAR(255) NULL DEFAULT NULL,
  `LastName` VARCHAR(255) NULL DEFAULT NULL,
  `Position` VARCHAR(50) NULL DEFAULT NULL,
  `Department` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`product` (
  `ProductID` INT NOT NULL,
  `ProductName` VARCHAR(255) NULL DEFAULT NULL,
  `CategoryID` INT NULL DEFAULT NULL,
  `Price` DECIMAL(10,2) NULL DEFAULT NULL,
  `StockQuantity` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  INDEX `fk_Product_Category` (`CategoryID` ASC) VISIBLE,
  CONSTRAINT `fk_Product_Category`
    FOREIGN KEY (`CategoryID`)
    REFERENCES `pos_db`.`category` (`CategoryID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`productinquiry`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`productinquiry` (
  `InquiryID` INT NOT NULL,
  `ProductID` INT NULL DEFAULT NULL,
  `CustomerID` INT NULL DEFAULT NULL,
  `InquiryDate` DATE NULL DEFAULT NULL,
  `InquiryContent` TEXT NULL DEFAULT NULL,
  `ReplyContent` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`InquiryID`),
  INDEX `ProductID` (`ProductID` ASC) VISIBLE,
  INDEX `CustomerID` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `productinquiry_ibfk_1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `pos_db`.`product` (`ProductID`),
  CONSTRAINT `productinquiry_ibfk_2`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `pos_db`.`customer` (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`inquiryreply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`inquiryreply` (
  `InquiryID` INT NOT NULL,
  `EmployeeID` INT NOT NULL,
  `ReplyDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`InquiryID`, `EmployeeID`),
  INDEX `EmployeeID` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `inquiryreply_ibfk_1`
    FOREIGN KEY (`InquiryID`)
    REFERENCES `pos_db`.`productinquiry` (`InquiryID`),
  CONSTRAINT `inquiryreply_ibfk_2`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `pos_db`.`employee` (`EmployeeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`membership`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`membership` (
  `MembershipID` INT NOT NULL,
  `CustomerID` INT NULL DEFAULT NULL,
  `JoinDate` DATE NULL DEFAULT NULL,
  `ExpiryDate` DATE NULL DEFAULT NULL,
  `Status` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`MembershipID`),
  INDEX `CustomerID` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `membership_ibfk_1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `pos_db`.`customer` (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`membershipbenefits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`membershipbenefits` (
  `MembershipBenefitsID` INT NOT NULL,
  `MembershipID` INT NULL DEFAULT NULL,
  `BenefitID` INT NULL DEFAULT NULL,
  `MembershipLevelID` INT NULL DEFAULT NULL,
  `ProductID` INT NULL DEFAULT NULL,
  `DiscountAmount` DECIMAL(10,2) NULL DEFAULT NULL,
  `EventType` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`MembershipBenefitsID`),
  INDEX `MembershipID` (`MembershipID` ASC) VISIBLE,
  INDEX `BenefitID` (`BenefitID` ASC) VISIBLE,
  INDEX `MembershipLevelID` (`MembershipLevelID` ASC) VISIBLE,
  INDEX `ProductID` (`ProductID` ASC) VISIBLE,
  CONSTRAINT `membershipbenefits_ibfk_1`
    FOREIGN KEY (`MembershipID`)
    REFERENCES `pos_db`.`membership` (`MembershipID`),
  CONSTRAINT `membershipbenefits_ibfk_2`
    FOREIGN KEY (`BenefitID`)
    REFERENCES `pos_db`.`benefit` (`BenefitID`),
  CONSTRAINT `membershipbenefits_ibfk_3`
    FOREIGN KEY (`MembershipLevelID`)
    REFERENCES `pos_db`.`membershiplevel` (`LevelID`),
  CONSTRAINT `membershipbenefits_ibfk_4`
    FOREIGN KEY (`ProductID`)
    REFERENCES `pos_db`.`product` (`ProductID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`orderitem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`orderitem` (
  `OrderItemID` INT NOT NULL,
  `OrderID` INT NULL DEFAULT NULL,
  `ProductID` INT NULL DEFAULT NULL,
  `Quantity` INT NULL DEFAULT NULL,
  `UnitPrice` DECIMAL(10,2) NULL DEFAULT NULL,
  `Subtotal` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`OrderItemID`),
  INDEX `OrderID` (`OrderID` ASC) VISIBLE,
  INDEX `ProductID` (`ProductID` ASC) VISIBLE,
  CONSTRAINT `orderitem_ibfk_1`
    FOREIGN KEY (`OrderID`)
    REFERENCES `pos_db`.`orders` (`OrderID`),
  CONSTRAINT `orderitem_ibfk_2`
    FOREIGN KEY (`ProductID`)
    REFERENCES `pos_db`.`product` (`ProductID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`paymentmethod`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`paymentmethod` (
  `PaymentMethodID` INT NOT NULL,
  `MethodName` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`PaymentMethodID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`pointdashboard`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`pointdashboard` (
  `DashboardID` INT NOT NULL,
  `MembershipID` INT NULL DEFAULT NULL,
  `TotalPoints` INT NULL DEFAULT NULL,
  `PointExpiryDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`DashboardID`),
  INDEX `MembershipID` (`MembershipID` ASC) VISIBLE,
  CONSTRAINT `pointdashboard_ibfk_1`
    FOREIGN KEY (`MembershipID`)
    REFERENCES `pos_db`.`membership` (`MembershipID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`pointexpiration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`pointexpiration` (
  `PointExpirationID` INT NOT NULL,
  `MembershipID` INT NULL DEFAULT NULL,
  `ExpirationDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`PointExpirationID`),
  INDEX `MembershipID` (`MembershipID` ASC) VISIBLE,
  CONSTRAINT `pointexpiration_ibfk_1`
    FOREIGN KEY (`MembershipID`)
    REFERENCES `pos_db`.`membership` (`MembershipID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`pointtransaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`pointtransaction` (
  `TransactionID` INT NOT NULL,
  `MembershipID` INT NULL DEFAULT NULL,
  `TransactionDate` DATE NULL DEFAULT NULL,
  `Amount` DECIMAL(10,2) NULL DEFAULT NULL,
  `Type` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  INDEX `MembershipID` (`MembershipID` ASC) VISIBLE,
  CONSTRAINT `pointtransaction_ibfk_1`
    FOREIGN KEY (`MembershipID`)
    REFERENCES `pos_db`.`membership` (`MembershipID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`productdiscount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`productdiscount` (
  `ProductID` INT NOT NULL,
  `DiscountID` INT NOT NULL,
  PRIMARY KEY (`ProductID`, `DiscountID`),
  INDEX `DiscountID` (`DiscountID` ASC) VISIBLE,
  CONSTRAINT `productdiscount_ibfk_1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `pos_db`.`product` (`ProductID`),
  CONSTRAINT `productdiscount_ibfk_2`
    FOREIGN KEY (`DiscountID`)
    REFERENCES `pos_db`.`discount` (`DiscountID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`promotion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`promotion` (
  `PromotionID` INT NOT NULL,
  `PromotionName` VARCHAR(255) NULL DEFAULT NULL,
  `StartDate` DATETIME NULL DEFAULT NULL,
  `EndDate` DATETIME NULL DEFAULT NULL,
  `DiscountRate` DECIMAL(5,2) NULL DEFAULT NULL,
  `PromotionDescription` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`PromotionID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`productpromotionmapping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`productpromotionmapping` (
  `MappingID` INT NOT NULL,
  `ProductID` INT NULL DEFAULT NULL,
  `PromotionID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`MappingID`),
  INDEX `ProductID` (`ProductID` ASC) VISIBLE,
  INDEX `PromotionID` (`PromotionID` ASC) VISIBLE,
  CONSTRAINT `productpromotionmapping_ibfk_1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `pos_db`.`product` (`ProductID`),
  CONSTRAINT `productpromotionmapping_ibfk_2`
    FOREIGN KEY (`PromotionID`)
    REFERENCES `pos_db`.`promotion` (`PromotionID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`sale` (
  `SaleID` INT NOT NULL,
  `OrderID` INT NULL DEFAULT NULL,
  `SaleDate` DATE NULL DEFAULT NULL,
  `TotalAmount` DECIMAL(10,2) NULL DEFAULT NULL,
  `PaymentMethod` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`SaleID`),
  INDEX `OrderID` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `sale_ibfk_1`
    FOREIGN KEY (`OrderID`)
    REFERENCES `pos_db`.`orders` (`OrderID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`productsalehistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`productsalehistory` (
  `ProductID` INT NOT NULL,
  `SaleID` INT NOT NULL,
  PRIMARY KEY (`ProductID`, `SaleID`),
  INDEX `SaleID` (`SaleID` ASC) VISIBLE,
  CONSTRAINT `productsalehistory_ibfk_1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `pos_db`.`product` (`ProductID`),
  CONSTRAINT `productsalehistory_ibfk_2`
    FOREIGN KEY (`SaleID`)
    REFERENCES `pos_db`.`sale` (`SaleID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`productservice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`productservice` (
  `ServiceID` INT NOT NULL,
  `ProductID` INT NULL DEFAULT NULL,
  `CustomerID` INT NULL DEFAULT NULL,
  `ServiceDate` DATE NULL DEFAULT NULL,
  `ServiceType` VARCHAR(50) NULL DEFAULT NULL,
  `ServiceContent` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`ServiceID`),
  INDEX `ProductID` (`ProductID` ASC) VISIBLE,
  INDEX `CustomerID` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `productservice_ibfk_1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `pos_db`.`product` (`ProductID`),
  CONSTRAINT `productservice_ibfk_2`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `pos_db`.`customer` (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`receipt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`receipt` (
  `ReceiptID` INT NOT NULL,
  `SaleID` INT NULL DEFAULT NULL,
  `ReceiptDate` DATE NULL DEFAULT NULL,
  `TotalAmount` DECIMAL(10,2) NULL DEFAULT NULL,
  `PaymentMethodID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ReceiptID`),
  INDEX `SaleID` (`SaleID` ASC) VISIBLE,
  INDEX `PaymentMethodID` (`PaymentMethodID` ASC) VISIBLE,
  CONSTRAINT `receipt_ibfk_1`
    FOREIGN KEY (`SaleID`)
    REFERENCES `pos_db`.`sale` (`SaleID`),
  CONSTRAINT `receipt_ibfk_2`
    FOREIGN KEY (`PaymentMethodID`)
    REFERENCES `pos_db`.`paymentmethod` (`PaymentMethodID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`receiptitem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`receiptitem` (
  `ReceiptItemID` INT NOT NULL,
  `ReceiptID` INT NULL DEFAULT NULL,
  `ProductID` INT NULL DEFAULT NULL,
  `Quantity` INT NULL DEFAULT NULL,
  `UnitPrice` DECIMAL(10,2) NULL DEFAULT NULL,
  `Subtotal` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`ReceiptItemID`),
  INDEX `ReceiptID` (`ReceiptID` ASC) VISIBLE,
  INDEX `ProductID` (`ProductID` ASC) VISIBLE,
  CONSTRAINT `receiptitem_ibfk_1`
    FOREIGN KEY (`ReceiptID`)
    REFERENCES `pos_db`.`receipt` (`ReceiptID`),
  CONSTRAINT `receiptitem_ibfk_2`
    FOREIGN KEY (`ProductID`)
    REFERENCES `pos_db`.`product` (`ProductID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`relationshipentity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`relationshipentity` (
  `MappingID` INT NOT NULL,
  `CustomerID` INT NULL DEFAULT NULL,
  `CouponID` INT NULL DEFAULT NULL,
  `IsUsed` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MappingID`),
  INDEX `CustomerID` (`CustomerID` ASC) VISIBLE,
  INDEX `CouponID` (`CouponID` ASC) VISIBLE,
  CONSTRAINT `relationshipentity_ibfk_1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `pos_db`.`customer` (`CustomerID`),
  CONSTRAINT `relationshipentity_ibfk_2`
    FOREIGN KEY (`CouponID`)
    REFERENCES `pos_db`.`discountcoupon` (`CouponID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`report` (
  `ReportID` INT NOT NULL,
  `ReportDate` DATE NULL DEFAULT NULL,
  `ReportType` VARCHAR(50) NULL DEFAULT NULL,
  `TotalSalesAmount` DECIMAL(10,2) NULL DEFAULT NULL,
  `TotalTaxAmount` DECIMAL(10,2) NULL DEFAULT NULL,
  `TotalDiscountAmount` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`ReportID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`reportsale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`reportsale` (
  `ReportID` INT NOT NULL,
  `SaleID` INT NOT NULL,
  PRIMARY KEY (`ReportID`, `SaleID`),
  INDEX `SaleID` (`SaleID` ASC) VISIBLE,
  CONSTRAINT `reportsale_ibfk_1`
    FOREIGN KEY (`ReportID`)
    REFERENCES `pos_db`.`report` (`ReportID`),
  CONSTRAINT `reportsale_ibfk_2`
    FOREIGN KEY (`SaleID`)
    REFERENCES `pos_db`.`sale` (`SaleID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`returnexchange`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`returnexchange` (
  `ReturnExchangeID` INT NOT NULL,
  `OrderID` INT NULL DEFAULT NULL,
  `CustomerID` INT NULL DEFAULT NULL,
  `TransactionType` VARCHAR(10) NULL DEFAULT NULL,
  `TransactionDate` DATE NULL DEFAULT NULL,
  `Status` VARCHAR(50) NULL DEFAULT NULL,
  `Reason` TEXT NULL DEFAULT NULL,
  `ReturnDate` DATE NULL DEFAULT NULL,
  `ExchangeDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`ReturnExchangeID`),
  INDEX `OrderID` (`OrderID` ASC) VISIBLE,
  INDEX `CustomerID` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `returnexchange_ibfk_1`
    FOREIGN KEY (`OrderID`)
    REFERENCES `pos_db`.`orders` (`OrderID`),
  CONSTRAINT `returnexchange_ibfk_2`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `pos_db`.`customer` (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`saleitem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`saleitem` (
  `SaleItemID` INT NOT NULL,
  `SaleID` INT NULL DEFAULT NULL,
  `ProductID` INT NULL DEFAULT NULL,
  `Quantity` INT NULL DEFAULT NULL,
  `UnitPrice` DECIMAL(10,2) NULL DEFAULT NULL,
  `Subtotal` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`SaleItemID`),
  INDEX `SaleID` (`SaleID` ASC) VISIBLE,
  INDEX `ProductID` (`ProductID` ASC) VISIBLE,
  CONSTRAINT `saleitem_ibfk_1`
    FOREIGN KEY (`SaleID`)
    REFERENCES `pos_db`.`sale` (`SaleID`),
  CONSTRAINT `saleitem_ibfk_2`
    FOREIGN KEY (`ProductID`)
    REFERENCES `pos_db`.`product` (`ProductID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`returnexchangeitem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`returnexchangeitem` (
  `ReturnExchangeItemID` INT NOT NULL,
  `ReturnExchangeID` INT NULL DEFAULT NULL,
  `SaleItemID` INT NULL DEFAULT NULL,
  `Quantity` INT NULL DEFAULT NULL,
  `UnitPrice` DECIMAL(10,2) NULL DEFAULT NULL,
  `Subtotal` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`ReturnExchangeItemID`),
  INDEX `ReturnExchangeID` (`ReturnExchangeID` ASC) VISIBLE,
  INDEX `SaleItemID` (`SaleItemID` ASC) VISIBLE,
  CONSTRAINT `returnexchangeitem_ibfk_1`
    FOREIGN KEY (`ReturnExchangeID`)
    REFERENCES `pos_db`.`returnexchange` (`ReturnExchangeID`),
  CONSTRAINT `returnexchangeitem_ibfk_2`
    FOREIGN KEY (`SaleItemID`)
    REFERENCES `pos_db`.`saleitem` (`SaleItemID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`salepaymentmethod`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`salepaymentmethod` (
  `SaleID` INT NOT NULL,
  `PaymentMethodID` INT NOT NULL,
  PRIMARY KEY (`SaleID`, `PaymentMethodID`),
  INDEX `PaymentMethodID` (`PaymentMethodID` ASC) VISIBLE,
  CONSTRAINT `salepaymentmethod_ibfk_1`
    FOREIGN KEY (`SaleID`)
    REFERENCES `pos_db`.`sale` (`SaleID`),
  CONSTRAINT `salepaymentmethod_ibfk_2`
    FOREIGN KEY (`PaymentMethodID`)
    REFERENCES `pos_db`.`paymentmethod` (`PaymentMethodID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`salesstatistics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`salesstatistics` (
  `StatisticsID` INT NOT NULL,
  `StartDate` DATE NULL DEFAULT NULL,
  `EndDate` DATE NULL DEFAULT NULL,
  `TotalSalesAmount` DECIMAL(10,2) NULL DEFAULT NULL,
  `TotalTaxAmount` DECIMAL(10,2) NULL DEFAULT NULL,
  `TotalDiscountAmount` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`StatisticsID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`transactionsearch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`transactionsearch` (
  `TransactionID` INT NOT NULL,
  `SearchDate` DATE NULL DEFAULT NULL,
  `ProductID` INT NULL DEFAULT NULL,
  `CustomerID` INT NULL DEFAULT NULL,
  `SaleID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  INDEX `ProductID` (`ProductID` ASC) VISIBLE,
  INDEX `CustomerID` (`CustomerID` ASC) VISIBLE,
  INDEX `SaleID` (`SaleID` ASC) VISIBLE,
  CONSTRAINT `transactionsearch_ibfk_1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `pos_db`.`product` (`ProductID`),
  CONSTRAINT `transactionsearch_ibfk_2`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `pos_db`.`customer` (`CustomerID`),
  CONSTRAINT `transactionsearch_ibfk_3`
    FOREIGN KEY (`SaleID`)
    REFERENCES `pos_db`.`sale` (`SaleID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`searchsale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`searchsale` (
  `TransactionID` INT NOT NULL,
  `SaleID` INT NOT NULL,
  PRIMARY KEY (`TransactionID`, `SaleID`),
  INDEX `SaleID` (`SaleID` ASC) VISIBLE,
  CONSTRAINT `searchsale_ibfk_1`
    FOREIGN KEY (`TransactionID`)
    REFERENCES `pos_db`.`transactionsearch` (`TransactionID`),
  CONSTRAINT `searchsale_ibfk_2`
    FOREIGN KEY (`SaleID`)
    REFERENCES `pos_db`.`sale` (`SaleID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`statisticssale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`statisticssale` (
  `StatisticsID` INT NOT NULL,
  `SaleID` INT NOT NULL,
  PRIMARY KEY (`StatisticsID`, `SaleID`),
  INDEX `SaleID` (`SaleID` ASC) VISIBLE,
  CONSTRAINT `statisticssale_ibfk_1`
    FOREIGN KEY (`StatisticsID`)
    REFERENCES `pos_db`.`salesstatistics` (`StatisticsID`),
  CONSTRAINT `statisticssale_ibfk_2`
    FOREIGN KEY (`SaleID`)
    REFERENCES `pos_db`.`sale` (`SaleID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;