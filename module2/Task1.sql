CREATE VIEW `OrdersView` AS
SELECT OrderID, Quantity, TotalCost as Cost FROM littlelemondb.orders
where quantity > 2