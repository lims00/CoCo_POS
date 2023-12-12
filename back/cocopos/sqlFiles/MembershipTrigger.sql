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

