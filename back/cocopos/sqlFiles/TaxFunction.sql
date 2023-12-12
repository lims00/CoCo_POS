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
