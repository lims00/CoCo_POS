DELIMITER //
CREATE TRIGGER membership_expiry_trigger
BEFORE INSERT ON membership
FOR EACH ROW
BEGIN
    IF NEW.ExpiryDate IS NOT NULL AND NEW.ExpiryDate < CURDATE() THEN
        SET NEW.Status = 'expired';
    END IF;
END;
//

DELIMITER ;

DELIMITER //
CREATE TRIGGER membership_update_trigger
BEFORE UPDATE ON membership
FOR EACH ROW
BEGIN
    IF NEW.ExpiryDate IS NOT NULL AND NEW.ExpiryDate < CURDATE() THEN
        SET NEW.Status = 'expired';
    END IF;
END;
//

DELIMITER ;


/*
membership 테이블에 ExpiryDate를 모니터링하여 Status를 자동으로 갱신하는 트리거를 생성하는 MySQL 쿼리입니다.
BEFORE INSERT와 BEFORE UPDATE 이벤트를 사용하여 ExpiryDate가 지나면 Status를 'expired'로 설정합니다.
BEFORE INSERT 및 BEFORE UPDATE 이벤트에서 각각 실행되며,
새로운 행이 삽입되거나 기존 행이 업데이트될 때마다 ExpiryDate를 확인하고
만약 ExpiryDate가 현재 날짜보다 이전이면 Status를 'expired'로 설정합니다.
위의 쿼리를 사용하여 트리거를 생성하고 나면
membership 테이블에 새로운 레코드를 삽입하거나 ExpiryDate를 업데이트할 때 자동으로 Status가 갱신됩니다.
*/