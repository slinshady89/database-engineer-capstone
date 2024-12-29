SELECT cd.CustomerID, cd.FullName as FullName, o.OrderID, o.TotalCost as Cost, m.MenuName as MenuName, mi.Course as CourseName
FROM littlelemondb.customers as cd
INNER JOIN littlelemondb.orders as o on o.CustomerID = cd.CustomerID
INNER JOIN littlelemondb.menus as m on o.MenuID = m.MenuID
INNER JOIN littlelemondb.menuitems as mi on m.MenuItemID = mi.MenuItemID
ORDER BY o.TotalCost ASC