USE `littlelemondb`;
DROP procedure IF EXISTS `CancelOrder`;

DELIMITER $$
USE `littlelemondb`$$
CREATE PROCEDURE CancelOrder(IN orderIDToDelete INT)
BEGIN
  DECLARE orderExistence INT;

  -- Check if the order exists in the database
  SELECT COUNT(*) INTO orderExistence FROM `LittleLemonDB`.`Orders` WHERE OrderID = orderIDToDelete;

  -- If the order exists, delete it
  IF orderExistence > 0 THEN
    -- First delete related records from OrderDeliveryStatuses table
    DELETE FROM `LittleLemonDB`.`OrderDeliveryStatuses` WHERE OrderID = orderIDToDelete;

    -- Then delete the order from the Orders table
    DELETE FROM `LittleLemonDB`.`Orders` WHERE OrderID = orderIDToDelete;

    SELECT CONCAT('Order ', orderIDToDelete, ' is cancelled') AS 'Confirmation';
  ELSE
    SELECT CONCAT('Order ', orderIDToDelete, ' does not exist') AS 'Confirmation';
  END IF;
END;$$

DELIMITER ;

