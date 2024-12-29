
INSERT INTO Customers (CustomerID, FullName, ContactNumber, Email) VALUES
(1, 'John Doe', 1234567, 'john.doe@example.com'),
(2, 'Jane Smith', 2345678, 'jane.smith@example.com'),
(3, 'Alice Johnson', 3456789, 'alice.johnson@example.com'),
(4, 'Bob Brown', 4567890, 'bob.brown@example.com'),
(5, 'Charlie Davis', 5678901, 'charlie.davis@example.com');


INSERT INTO Staff (StaffID, StaffName, StaffRole, Salary) VALUES
(1, 'Michael Scott', 'Manager', 60000),
(2, 'Dwight Schrute', 'Assistant Manager', 50000),
(3, 'Jim Halpert', 'Salesman', 45000),
(4, 'Pam Beesly', 'Receptionist', 35000),
(5, 'Stanley Hudson', 'Salesman', 40000);

INSERT INTO DeliveryStatus (DeliveryID, DeliveryDate, DeliveryStatus) VALUES
(1, '2023-01-01', 1),
(2, '2023-01-02', 0),
(3, '2023-01-03', 1),
(4, '2023-01-04', 0),
(5, '2023-01-05', 1);

INSERT INTO MenuItems (MenuItemID, Starters, Course, Desserts, Drinks) VALUES
(1, 'Bruschetta', 'Pasta', 'Tiramisu', 'Wine'),
(2, 'Caesar Salad', 'Pizza', 'Gelato', 'Beer'),
(3, 'Garlic Bread', 'Lasagna', 'Panna Cotta', 'Soda'),
(4, 'Caprese Salad', 'Risotto', 'Cannoli', 'Cocktail'),
(5, 'Stuffed Mushrooms', 'Spaghetti', 'Cheesecake', 'Juice');

INSERT INTO Menus (MenuID, MenuName, Cuisine, MenuItemID, Price) VALUES
(1, 'Italian Delight', 'Italian', 1, 25),
(2, 'Roman Feast', 'Italian', 2, 30),
(3, 'Venetian Special', 'Italian', 3, 28),
(4, 'Tuscan Treats', 'Italian', 4, 32),
(5, 'Sicilian Sensation', 'Italian', 5, 27);

INSERT INTO Orders (OrderID, OrderDate, CustomerID, MenuID, Quantity, TotalCost, StaffID) VALUES
(1, '2023-02-01', 1, 1, 2, 50.00, 1),
(2, '2023-02-02', 2, 2, 3, 90.00, 2),
(3, '2023-02-03', 3, 3, 1, 28.00, 3),
(4, '2023-02-04', 4, 4, 4, 128.00, 4),
(5, '2023-02-05', 5, 5, 2, 54.00, 5);

INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID) VALUES
(1, '2023-06-10', 10, 1),
(2, '2023-06-11', 11, 2),
(3, '2023-06-12', 12, 3),
(4, '2023-06-13', 13, 4),
(5, '2023-06-14', 14, 5);