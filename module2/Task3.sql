SELECT m.MenuName
FROM littlelemondb.menus as m
WHERE m.MenuID = ANY (
    SELECT o.MenuID
    FROM littlelemondb.orders as o
    GROUP BY o.MenuID
    HAVING SUM(o.Quantity) > 2
);