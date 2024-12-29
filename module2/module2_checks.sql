INSERT INTO `LittleLemonDB`.`Bookings` (`BookingID`, `BookingDate`, `TableNumber`, `CustomerID`) VALUES
(11, '2022-10-10', 5, 1),
(12, '2022-11-12', 3, 3),
(13, '2022-10-11', 2, 2),
(14, '2022-10-13', 2, 1);

CALL `LittleLemonDB`.`CheckBooking`('2022-10-10', 5);

CALL `LittleLemonDB`.`AddValidBooking`('2022-10-10', 5, 1);

CALL `LittleLemonDB`.`AddBooking`(17, 1, '2022-10-10', 5);

CALL `LittleLemonDB`.`UpdateBooking`(9, '2022-11-15');

CALL `LittleLemonDB`.`CancelBooking`(9);