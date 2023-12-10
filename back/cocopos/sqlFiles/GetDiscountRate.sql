 -- 멤버십 레벨별 할인율을 가져오는 함수입니다.

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