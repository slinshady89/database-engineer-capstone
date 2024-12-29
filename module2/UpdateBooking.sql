USE `LittleLemonDB`;
DROP procedure IF EXISTS `UpdateBooking`;

DELIMITER $$
USE `LittleLemonDB`$$
CREATE PROCEDURE `LittleLemonDB`.`UpdateBooking`(
    IN booking_id_to_update INT, 
    IN new_booking_date DATE)
BEGIN
    -- Update the booking record
    UPDATE `LittleLemonDB`.`Bookings`
    SET `BookingDate` = new_booking_date
    WHERE `BookingID` = booking_id_to_update;

    SELECT CONCAT('Booking ', booking_id_to_update, ' updated') AS 'Confirmation';
END;$$

DELIMITER ;

