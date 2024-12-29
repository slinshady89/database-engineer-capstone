USE `LittleLemonDB`;
DROP procedure IF EXISTS `AddValidBooking`;

USE `LittleLemonDB`;
DROP procedure IF EXISTS `LittleLemonDB`.`AddValidBooking`;
;

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`admin1`@`%` PROCEDURE `AddValidBooking`(IN new_booking_date DATE, IN new_table_number INT, IN new_customer_id INT)
BEGIN
    DECLARE table_status INT;
    START TRANSACTION;

    SELECT COUNT(*) INTO table_status
    FROM `LittleLemonDB`.`Bookings`
    WHERE `BookingDate` = new_booking_date AND `TableNumber` = new_table_number;

    IF (table_status > 0) THEN
        ROLLBACK;
        SELECT 'Booking could not be completed. Table is already booked on the specified date.' AS 'Status';
    ELSE
        INSERT INTO `LittleLemonDB`.`Bookings`(`Date`, `TableNumber`, `CustomerID`)
        VALUES(new_booking_date, new_table_number, new_customer_id);

        COMMIT;
        SELECT 'Booking completed successfully.' AS 'Status';
    END IF;
END$$

DELIMITER ;
;

