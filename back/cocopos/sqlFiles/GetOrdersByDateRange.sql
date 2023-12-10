DELIMITER //

CREATE FUNCTION GetOrdersByDateRange(start_date DATE, end_date DATE)
RETURNS TABLE (
    CustomerID INT,
    OrderDate DATE,
    OrderID INT,
    PaymentMethod VARCHAR(255),
    TotalAmount DECIMAL(10, 2)
)
BEGIN
    RETURN (
        SELECT
            o.`CustomerID`,
            o.`OrderDate`,
            o.`OrderID`,
            o.`PaymentMethod`,
            o.`TotalAmount`
        FROM
            orders o
        WHERE
            o.`OrderDate` BETWEEN start_date AND end_date
    );
END //

DELIMITER ;

