PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, TotalCost FROM LittleLemonDB.Orders WHERE CustomerID = ?';
SET @id = 1;
EXECUTE GetOrderDetail USING @id;
DEALLOCATE PREPARE GetOrderDetail;