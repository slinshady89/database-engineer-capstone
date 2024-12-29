USE `littlelemondb`;
DROP procedure IF EXISTS `CheckBooking`;

USE `littlelemondb`;
DROP procedure IF EXISTS `littlelemondb`.`CheckBooking`;
;

DELIMITER $$
USE `littlelemondb`$$
CREATE DEFINER=`admin1`@`%` PROCEDURE `CheckBooking`(IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE table_status VARCHAR(50);

    SELECT COUNT(*) INTO @table_count
    FROM `LittleLemonDB`.`Bookings`
    WHERE `BookingDate` = booking_date AND `TableNumber` = table_number;

    IF (@table_count > 0) THEN
        SET table_status = 'Table is already booked.';
    ELSE
        SET table_status = 'Table is available.';
    END IF;

    SELECT table_status AS 'Table Status';
END$$

DELIMITER ;
;

