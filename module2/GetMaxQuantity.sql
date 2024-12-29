USE `littlelemondb`;
DROP procedure IF EXISTS `GetMaxQuantity`;

DELIMITER $$
USE `littlelemondb`$$
CREATE PROCEDURE GetMaxQuantity()
BEGIN
SELECT Quantity as `Max Quantity in Order` FROM Orders
ORDER BY Quantity DESC
LIMIT 1;
END$$

DELIMITER ;
