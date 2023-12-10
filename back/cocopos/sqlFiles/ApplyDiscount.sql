-- -- 할인 적용 함수

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

-- 예시 SELECT ApplyDiscount(123, 100.00) AS FinalPurchaseAmount;