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
