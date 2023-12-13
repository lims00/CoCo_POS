DROP DATABASE IF EXISTS `pos_db`;
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
DROP DATABASE IF EXISTS`pos_db`;
CREATE SCHEMA `pos_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `pos_db` ;

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

CREATE TABLE IF NOT EXISTS `pos_db`.`coupon` (
    `CouponID` INT NOT NULL,
    `DiscountPrice` INT NOT NULL,
    PRIMARY KEY (`CouponID`));

-- -----------------------------------------------------
-- Table `pos_db`.`membershiplevel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`membershiplevel` (
  `LevelID` INT NOT NULL,
  `LevelName` VARCHAR(50) NULL DEFAULT NULL,
  `DiscountRate` DECIMAL(5,2) NULL DEFAULT NULL,
  PRIMARY KEY (`LevelID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`orders` (
  `OrderID` INT  auto_increment NOT NULL,
  `CustomerID` INT NOT NULL,
  `PaymentMethodID` INT NOT NULL,
  `CouponID` INT DEFAULT NULL,
  `OrderDate` DATE NULL DEFAULT NULL,
  `DiscountedTotalAmount` INT NOT NULL DEFAULT 0,
  `TotalAmount` DECIMAL(10,2) NULL DEFAULT NULL,
  `IsRefunded` BOOLEAN,
  PRIMARY KEY (`OrderID`),
  CONSTRAINT `order_ibfk_2`
    FOREIGN KEY (`PaymentMethodID`)
    REFERENCES `pos_db`.`paymentmethod` (`PaymentMethodID`),
  CONSTRAINT `order_ibfk_3`
    FOREIGN KEY (`CouponID`)
    REFERENCES `pos_db`.`coupon` (`CouponID`),
  CONSTRAINT `order_ibfk_4`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `pos_db`.`customer` (`CustomerID`)
    )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`customerorderhistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`customerorderhistory` (
  `CustomerID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`CustomerID`, `OrderID`),
  INDEX `OrderID` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `customerorderhistory_ibfk_1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `pos_db`.`customer` (`CustomerID`),
  CONSTRAINT `customerorderhistory_ibfk_2`
    FOREIGN KEY (`OrderID`)
    REFERENCES `pos_db`.`orders` (`OrderID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pos_db`.`discount`
-- -----------------------------------------------------



-- -----------------------------------------------------
-- Table `pos_db`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`employee` (
  `EmployeeID` INT NOT NULL,
  `PositionID` INT NOT NULL,
  `DepartmentID` INT NOT NULL,
  `FirstName` VARCHAR(255) NULL DEFAULT NULL,
  `LastName` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  CONSTRAINT `employee_ibfk1`
    FOREIGN KEY (`PositionID`)
    REFERENCES `pos_db`.`position` (`PositionID`),
  CONSTRAINT `employee_ibfk2`
    FOREIGN KEY (`DepartmentID`)
    REFERENCES `pos_db`.`department` (`DepartmentID`)
                                               );

CREATE TABLE IF NOT EXISTS `pos_db`.`department` (
  `DepartmentID` INT NOT NULL,
  `DepartmentName` VARCHAR(50) NOT NULL,
  `DepartmentDescription` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`DepartmentID`));


-- -----------------------------------------------------
-- Table `pos_db`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`product` (
  `ProductID` INT auto_increment NOT NULL,
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
CREATE TABLE IF NOT EXISTS `pos_db`.`inquiry` (
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
    REFERENCES `pos_db`.`inquiry` (`InquiryID`),
  CONSTRAINT `inquiryreply_ibfk_2`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `pos_db`.`employee` (`EmployeeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `pos_db`.`position` (
    `PositionID` INT NOT NULL,
    `PositionName` VARCHAR(50) NOT NULL,
    `PositionDescription` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`PositionID`)
);


-- -----------------------------------------------------
-- Table `pos_db`.`membership`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`membership` (
  `LevelID` INT auto_increment NOT NULL,
  `CustomerID` INT NOT NULL,
  `JoinDate` DATE NULL DEFAULT NULL,
  `ExpiryDate` DATE NULL DEFAULT NULL,
  `Status` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`LevelID`, `CustomerID`),
  INDEX `CustomerID` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `membership_ibfk_1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `pos_db`.`customer` (`CustomerID`),
  CONSTRAINT `membership_ibfk_2`
    FOREIGN KEY (`LevelID`)
    REFERENCES `pos_db`.`membershiplevel` (`LevelID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



-- -----------------------------------------------------
-- Table `pos_db`.`orderitem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`orderitem` (
  `OrderItemID` INT auto_increment  NOT NULL,
  `OrderID` INT NULL DEFAULT NULL,
  `ProductID` INT NULL DEFAULT NULL,
  `Quantity` INT NULL DEFAULT NULL,
  `UnitPrice` DECIMAL(10,2) NULL DEFAULT NULL,
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
-- Table `pos_db`.`promotion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`promotion` (
  `PromotionID` INT NOT NULL,
  `PromotionName` VARCHAR(255) NULL DEFAULT NULL,
  `StartDate` DATE NULL DEFAULT NULL,
  `EndDate` DATE NULL DEFAULT NULL,
  `PromotionDescription` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`PromotionID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



-- -----------------------------------------------------
-- Table `pos_db`.`sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`sale` (
  `SaleID` INT auto_increment NOT NULL,
  `OrderID` INT NULL DEFAULT NULL,
  `SaleDate` DATE NULL DEFAULT NULL,
  `TotalAmount` DECIMAL(10,2) NULL DEFAULT NULL,
  `PaymentMethodID` VARCHAR(50) NULL DEFAULT NULL,
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

CREATE TABLE IF NOT EXISTS `pos_db`.`cart` (
    `CartID` INT NOT NULL AUTO_INCREMENT,
    `CustomerID` INT NOT NULL,
    `TotalPrice` INT DEFAULT 0,
    PRIMARY KEY (`CartID`),
    CONSTRAINT `cart_ibfk_1`
      FOREIGN KEY (`CustomerID`)
      REFERENCES `pos_db`.`customer` (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `pos_db`.`cartitem` (
    `CartID` INT auto_increment NOT NULL,
    `ProductID` INT NOT NULL,
    `UnitPrice` INT DEFAULT 0,
    `Quantity` INT,
    PRIMARY KEY (`CartID`, `ProductID`),
    CONSTRAINT `cartitem_ibfk_1`
      FOREIGN KEY (`CartID`)
      REFERENCES `pos_db`.`cart` (`CartID`),
    CONSTRAINT `cartitem_ibfk_2`
      FOREIGN KEY (`ProductID`)
      REFERENCES `pos_db`.`product` (`ProductID`))

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `pos_db`.`supplyorder`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `supplyorder`;
CREATE TABLE IF NOT EXISTS `pos_db`.`supplyorder` (
  `SupplyOrderID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `SupplyOrderDate` DATE DEFAULT NULL,
  `ProductID` INT DEFAULT NULL,
  `Quantity` INT DEFAULT NULL,
  `SupplierID` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`SupplyorderID`),
  UNIQUE KEY `SupplyOrderID` (`SupplyOrderID`),
  CONSTRAINT `supplyorder_ibfk_1`
      FOREIGN KEY (`ProductID`)
      REFERENCES `pos_db`.`product` (`ProductID`),
  CONSTRAINT `supplyorder_ibfk_2`
      FOREIGN KEY (`SupplierID`)
      REFERENCES `pos_db`.`supplier` (`SupplierID`))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



-- -----------------------------------------------------
-- Table `pos_db`.`supplier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `pos_db`.`supplier` (
  `SupplierID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `SupplierName` VARCHAR(255) DEFAULT NULL,
  `ContactEmail` VARCHAR(255) DEFAULT NULL,
  `ContactPhone` VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`),
  UNIQUE KEY `SupplierID` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



-- -----------------------------------------------------
-- Table `pos_db`.`refund`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`refund` (
  `RefundID` INT auto_increment NOT NULL,
  `OrderID` INT NULL DEFAULT NULL,
  `CustomerID` INT NULL DEFAULT NULL,
  `Status` VARCHAR(50) NULL DEFAULT NULL,
  `Reason` TEXT NULL DEFAULT NULL,
  `RefundDate` DATE NULL DEFAULT NULL, -- Renamed from ReturnDate
  PRIMARY KEY (`RefundID`),
  INDEX `OrderID` (`OrderID` ASC) VISIBLE,
  INDEX `CustomerID` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `refund_ibfk_1`
    FOREIGN KEY (`OrderID`)
    REFERENCES `pos_db`.`orders` (`OrderID`),
  CONSTRAINT `refund_ibfk_2`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `pos_db`.`customer` (`CustomerID`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



-- -----------------------------------------------------
-- Table `pos_db`.`saleitem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`saleitem` (
  `SaleItemID` INT auto_increment NOT NULL,
  `SaleID` INT NULL DEFAULT NULL,
  `ProductID` INT NULL DEFAULT NULL,
  `Quantity` INT NULL DEFAULT NULL,
  `UnitPrice` DECIMAL(10,2) NULL DEFAULT NULL,
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

-- -------------------
-- Table `pos_db`.`refunditem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_db`.`refunditem` (
  `RefundItemID` INT auto_increment NOT NULL,
  `RefundID` INT NULL DEFAULT NULL,
  `OrderItemID` INT NULL DEFAULT NULL,
  `Quantity` INT NULL DEFAULT NULL,
  `UnitPrice` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`RefundItemID`),
  INDEX `RefundID` (`RefundID` ASC) VISIBLE,
  INDEX `OrderItemID` (`OrderItemID` ASC) VISIBLE,
  CONSTRAINT `refunditem_ibfk_1`
    FOREIGN KEY (`RefundID`)
    REFERENCES `pos_db`.`refund` (`RefundID`),
  CONSTRAINT `refunditem_ibfk_2`
    FOREIGN KEY (`OrderItemID`)
    REFERENCES `pos_db`.`orderitem` (`OrderItemID`)
)
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

CREATE TABLE IF NOT EXISTS `pos_db`.`authority` (
    `AuthorityID` INT NOT NULL,
    `AuthorityName` VARCHAR(50) NOT NULL,
    `AuthorityDescription` VARCHAR(200) NOT NULL,
    PRIMARY KEY (`AuthorityID`)
);

CREATE TABLE IF NOT EXISTS `pos_db`.`employeeauthority`
(
    `AuthorityID` INT NOT NULL,
    `EmployeeID`  INT NOT NULL,
    PRIMARY KEY (`AuthorityID`, `EmployeeID`),
    CONSTRAINT `employeeauthority_ibfk_1`
        FOREIGN KEY (`AuthorityID`)
            REFERENCES `pos_db`.`authority` (`AuthorityID`),
    CONSTRAINT `employeeauthority_ibfk_2`
        FOREIGN KEY (`EmployeeID`)
            REFERENCES `pos_db`.`employee` (`EmployeeID`)
);








SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO customer(CustomerID, FirstName, LastName, Email, PhoneNumber, Address)
VALUES (1907, 'MyeongHoon', 'jang', 'jmh@cau.co.kr', 01012345678, 'CAU');
INSERT INTO customer(CustomerID, FirstName, LastName, Email, PhoneNumber, Address)
VALUES (1973, 'JeongWon', 'Na', 'njw@cau.co.kr', 01012345678, 'CAU');
INSERT INTO customer(CustomerID, FirstName, LastName, Email, PhoneNumber, Address)
VALUES (641, 'SuHyun', 'Lim', 'lsh@cau.co.kr', 01012345678, 'CAU');
INSERT INTO customer(CustomerID, FirstName, LastName, Email, PhoneNumber, Address)
VALUES (4372, 'SooMin', 'Bae', 'bsm@cau.ac.kr', 01012345678, 'CAU');
INSERT INTO customer(CustomerID, FirstName, LastName, Email, PhoneNumber, Address)
VALUES (6641, 'YoHan', 'shin', 'syh@cau.ac.r', 01012345678, 'CAU');


INSERT INTO coupon(CouponID, DiscountPrice) VALUES(0, 0);
INSERT INTO coupon(CouponID, DiscountPrice) VALUES(1, 1000);
INSERT INTO coupon(CouponID, DiscountPrice) VALUES(2, 2000);
INSERT INTO coupon(CouponID, DiscountPrice) VALUES(3, 3000);
INSERT INTO coupon(CouponID, DiscountPrice) VALUES(4, 4000);
INSERT INTO coupon(CouponID, DiscountPrice) VALUES(5, 5000);

-- 멤버십 레벨 삽입 쿼리
INSERT INTO `pos_db`.`membershiplevel` (`LevelID`, `LevelName`, `DiscountRate`) VALUES
(1, 'Bronze', 5.00),
(2, 'Silver', 10.00),
(3, 'Gold', 15.00);

-- 멤버십 삽입 쿼리
INSERT INTO membership(LevelID, CustomerID, JoinDate, ExpiryDate, Status) VALUES
(3, 641, 231210,241210, 'active'),
(3, 1973, 231210,241210, 'active'),
(3, 4372, 231210,241210, 'active'),
(3, 6641, 231210,241210, 'active'),
(3, 1907, 231210,241210, 'active');

INSERT INTO `pos_db`.`promotion` (`PromotionID`, `PromotionName`, `StartDate`, `EndDate`, `PromotionDescription`) VALUES
(1, 'BlackFriday', 20231119, 20231122, 'BlackFriday Sale!'),
(2, 'HappyNewYear', 20240101, 20240107, 'Happy New Year Sale!');

INSERT INTO category(CategoryID, CategoryName) VALUES
(1, 'Diary'),
(2, 'Vegetable'),
(3, 'Clothes'),
(4, 'Sneakers'),
(5, 'Meat');

-- Inserting records into the "product" table with Korean Won (KRW)
INSERT INTO product(ProductID, ProductName, CategoryID, Price, StockQuantity) VALUES
(1, 'Milk', 1, 10000, 99),
(2, 'Sesame', 2, 5000, 100),
(3, 'Yogurt', 1, 8000, 50),
(4, 'Carrot', 2, 2000, 200),
(5, 'T-shirt', 3, 20000, 30),
(6, 'Running Shoes', 4, 50000, 25),
(7, 'Chicken Breast', 5, 15000, 80),
(8, 'Cheese', 1, 12000, 75),
(9, 'Spinach', 2, 3000, 150),
(10, 'Jeans', 3, 35000, 40),
(11, 'Basketball Shoes', 4, 60000, 15),
(12, 'Beef Steak', 5, 25000, 60);

-- Inserting  payment method
INSERT INTO paymentmethod(PaymentMethodID, MethodName) VALUES
(1, 'cash'), (2, 'card');


-- Inserting 10 records into the "orders" table
INSERT INTO orders(OrderID, CustomerID, PaymentMethodID, CouponID, OrderDate, DiscountedTotalAmount, TotalAmount, IsRefunded) VALUES
(1, 1907, 2, 1, '2023-12-1', 50000, 7000.00, false),
(2, 1907,2, NULL, '2023-12-2', 25000, 50500.00, false),
(3,1907, 1, 1, '2023-12-3', 40000, 80000.00, true),
(4,1907, 2, NULL, '2023-12-4', 75000, 150750.00, false),
(5,1907, 1, NULL, '2023-12-5', 30000, 60250.00, false),
(6,1907, 2, NULL, '2023-12-6', 20000, 40200.00, false),
(7,1907, 1, 2, '2023-12-7', 45000, 90500.00, false),
(8,1907, 2, NULL, '2023-12-8', 60000, 120600.00, false),
(9, 1907,1, NULL, '2023-12-9', 35000, 70350.00, false),
(10, 1907, 2, 3, '2023-12-13', 10000, 14000.00, true);

-- Inserting orderitem records for OrderID 1 with values based on the "product" table
INSERT INTO orderitem(OrderItemID, OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 2, 1000),    -- Milk
(2, 1, 2, 1, 5000);     -- Sesame











DELIMITER //
CREATE FUNCTION GetDiscountRate(customer_id INT) RETURNS DECIMAL(5,2) READS SQL DATA
BEGIN
    DECLARE level_discount DECIMAL(5,2);

    SELECT ml.DiscountRate INTO level_discount
    FROM membership m
    JOIN membershiplevel ml ON m.LevelID = ml.LevelID
    WHERE m.CustomerID = customer_id;

    RETURN COALESCE(level_discount, 0);
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION ApplyDiscount(customer_id INT, purchase_amount DECIMAL(10,2)) RETURNS DECIMAL(10,2) READS SQL DATA
BEGIN
    DECLARE discount_rate DECIMAL(5,2);

    -- 레벨별 할인율 가져오기
    SET discount_rate = GetDiscountRate(customer_id);

    -- 구매 가격에 할인 적용
    SET purchase_amount = purchase_amount - (purchase_amount * discount_rate / 100);

    RETURN purchase_amount;
END //
DELIMITER ;

DELIMITER //

CREATE TRIGGER update_stock_after_orderitem_insert
AFTER INSERT ON pos_db.orderitem
FOR EACH ROW
BEGIN
  DECLARE purchased_quantity INT;

  -- Get the purchased quantity from the inserted order item
  SELECT Quantity INTO purchased_quantity FROM pos_db.orderitem WHERE OrderItemID = NEW.OrderItemID;

  -- Update the stock quantity in the product table
  UPDATE pos_db.product
  SET StockQuantity = StockQuantity - purchased_quantity
  WHERE ProductID = NEW.ProductID;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER check_expiry_date
BEFORE INSERT ON membership
FOR EACH ROW
BEGIN
    IF NEW.ExpiryDate IS NOT NULL AND NEW.JoinDate IS NOT NULL AND NEW.ExpiryDate <= NEW.JoinDate THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ExpiryDate must be greater than JoinDate';
    END IF;
END;
//

DELIMITER ;


DELIMITER //

CREATE TRIGGER check_promotion_dates
BEFORE INSERT ON promotion
FOR EACH ROW
BEGIN
    IF NEW.EndDate IS NOT NULL AND NEW.StartDate IS NOT NULL AND NEW.EndDate <= NEW.StartDate THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'EndDate must be greater than StartDate';
    END IF;
END;
//

DELIMITER ;



-- 총 가격의 10%를 계산하는 함수
DELIMITER //
CREATE FUNCTION calculate_tax(total_price INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE tax_rate DECIMAL(5,2) DEFAULT 0.10;
    DECLARE tax_amount INT;

    SET tax_amount = ROUND(total_price * tax_rate);
    RETURN tax_amount;
END //
DELIMITER ;

-- 세금을 포함한 전체 가격을 계산하는 함수
DELIMITER //
CREATE FUNCTION calculate_total_with_tax(total_price INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE tax_amount INT;

    SET tax_amount = calculate_tax(total_price);
    RETURN total_price + tax_amount;
END //
DELIMITER ;






USE pos_db; -- 환불 프로시저

DELIMITER //

CREATE PROCEDURE refund(IN p_order_id INT)
BEGIN
    DECLARE total_return_amount DECIMAL(10, 2);

    -- Calculate the total return amount for the returned order
    SELECT SUM(oi.Quantity * oi.UnitPrice) INTO total_return_amount
    FROM orderitem oi
    WHERE oi.OrderID = p_order_id;

    -- Add refund information to the refund table
    INSERT INTO refund (OrderID, refundDate, reason, Status)
    VALUES (p_order_id, NOW(), 'Just change my mind', 'Processing');

    -- Increase the stock quantity for the returned products
    UPDATE product p
    INNER JOIN orderitem oi ON p.ProductID = oi.ProductID
    SET p.StockQuantity = p.StockQuantity + oi.Quantity
    WHERE oi.OrderID = p_order_id;


   -- Decrease the total order amount in the orders table
    UPDATE orders
    SET TotalAmount = TotalAmount - total_return_amount,
        IsRefunded = true
    WHERE OrderID = p_order_id;

    SELECT 'Return processed successfully' AS Message;
END //

DELIMITER ;





USE pos_db; -- 거래완료 프로시저

DELIMITER //

CREATE PROCEDURE CompleteTransaction(IN p_order_id INT)
BEGIN
    DECLARE v_sale_id INT;

    -- Inserting into `sale` table
    INSERT INTO sale (OrderID, SaleDate, TotalAmount, PaymentMethodID)
    SELECT OrderID, OrderDate, TotalAmount, PaymentMethodID
    FROM orders
    WHERE OrderID = p_order_id;

    -- Get the generated SaleID
    SET v_sale_id = LAST_INSERT_ID();

    -- Inserting into `saleitem` table
    INSERT INTO saleitem (SaleID, ProductID, Quantity, UnitPrice)
    SELECT v_sale_id, oi.ProductID, oi.Quantity, oi.UnitPrice
    FROM orderitem oi
    WHERE oi.OrderID = p_order_id;

    -- Remove the processed orderitem (You can keep the order by commenting or removing this line)
   DELETE FROM orderitem WHERE OrderID = p_order_id;

    SELECT 'Transaction completed successfully' AS Message;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE GetOrdersByDateRange(
  IN startDate DATE,
  IN endDate DATE
)
BEGIN
  SELECT *
  FROM pos_db.orders
  WHERE OrderDate BETWEEN startDate AND endDate;
END //

DELIMITER ;