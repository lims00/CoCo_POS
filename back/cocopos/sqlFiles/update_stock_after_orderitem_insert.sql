 -- orderitem이 생성되면 해당 product의 stockQuantity를 orderitem의 개수만큼 감소시키는 트리거 입니다.

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