USE `LittleLemonDB`;
DROP procedure IF EXISTS `AddBooking`;

USE `LittleLemonDB`;
DROP procedure IF EXISTS `LittleLemonDB`.`AddBooking`;
;

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`admin1`@`%` PROCEDURE `AddBooking`(
    IN new_booking_id INT, 
    IN new_customer_id INT, 
    IN new_booking_date DATE, 
    IN new_table_number INT)
BEGIN
    -- Insert the new booking record
    INSERT INTO `LittleLemonDB`.`Bookings`(
        `BookingID`, 
        `CustomerID`, 
        `BookingDate`, 
        `TableNumber`)
    VALUES(
        new_booking_id, 
        new_customer_id, 
        new_booking_date, 
        new_table_number
    );

    SELECT 'New booking added' AS 'Confirmation';
END$$

DELIMITER ;
;

