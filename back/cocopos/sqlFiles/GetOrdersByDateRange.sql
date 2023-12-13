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
