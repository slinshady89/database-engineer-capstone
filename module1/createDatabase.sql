-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemondb` DEFAULT CHARACTER SET utf8 ;
USE `littlelemondb` ;

-- -----------------------------------------------------
-- Table `littlelemondb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`Customers` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(255) NOT NULL,
  `ContactNumber` INT NOT NULL,
  `Email` VARCHAR(255) NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE INDEX `FullName_UNIQUE` (`FullName` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`Staff` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `StaffName` VARCHAR(255) NOT NULL,
  `StaffRole` VARCHAR(255) NULL,
  `Salary` INT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`DeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`DeliveryStatus` (
  `DeliveryID` INT NOT NULL AUTO_INCREMENT,
  `DeliveryDate` DATE NULL,
  `DeliveryStatus` TINYINT NOT NULL,
  PRIMARY KEY (`DeliveryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`MenuItems` (
  `MenuItemID` INT NOT NULL AUTO_INCREMENT,
  `Starters` VARCHAR(255) NULL,
  `Courser` VARCHAR(255) NULL,
  `Desserts` VARCHAR(255) NULL,
  `Drinks` VARCHAR(255) NULL,
  PRIMARY KEY (`MenuItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`Menus` (
  `MenuID` INT NOT NULL AUTO_INCREMENT,
  `MenuName` VARCHAR(255) NOT NULL,
  `Cuisine` VARCHAR(255) NULL,
  `MenuItemID` INT NOT NULL,
  `Price` INT NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `MenuItemID_idx` (`MenuItemID` ASC) VISIBLE,
  CONSTRAINT `fk_MenuItemID`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `littlelemondb`.`MenuItems` (`MenuItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`Orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `OrderDate` DATE NOT NULL,
  `CustomerID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL(10,2) NOT NULL,
  `StaffID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `StaffID_idx` (`StaffID` ASC) VISIBLE,
  INDEX `MenuID_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `fk_CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `littlelemondb`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StaffID`
    FOREIGN KEY (`StaffID`)
    REFERENCES `littlelemondb`.`Staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_OrderID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `littlelemondb`.`DeliveryStatus` (`DeliveryID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_MenuID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `littlelemondb`.`Menus` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `BookingDate` DATE NOT NULL,
  `TableNumber` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `littlelemondb`.`Customers` (`CustomerID`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
