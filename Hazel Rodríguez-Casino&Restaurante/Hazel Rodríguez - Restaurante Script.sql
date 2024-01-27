-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Restaurante
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Restaurante
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Restaurante` DEFAULT CHARACTER SET utf8 ;
USE `Restaurante` ;

-- -----------------------------------------------------
-- Table `Restaurante`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurante`.`Cliente` (
  `N_Cliente` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(15) NOT NULL,
  `DUI` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`N_Cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Restaurante`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurante`.`Vendedor` (
  `Id_Vendedor` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(15) NOT NULL,
  `DUI` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Id_Vendedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Restaurante`.`Repartidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurante`.`Repartidor` (
  `Id_Repartidor` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `N_Licencia` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(15) NOT NULL,
  `DUI` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id_Repartidor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Restaurante`.`Vehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurante`.`Vehiculos` (
  `Id_Vehiculos` INT NOT NULL AUTO_INCREMENT,
  `Id_Ocupante` VARCHAR(45) NULL,
  `N_Placa` VARCHAR(10) NOT NULL,
  `Estado` TEXT(1000) NOT NULL,
  PRIMARY KEY (`Id_Vehiculos`),
  CONSTRAINT `Id_repartidor`
    FOREIGN KEY (`Id_Vehiculos`)
    REFERENCES `Restaurante`.`Repartidor` (`Id_Repartidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Restaurante`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurante`.`Pedido` (
  `N_Pedido` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` LONGTEXT NOT NULL,
  `Cantidad` INT NOT NULL,
  `Valor` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`N_Pedido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Restaurante`.`Venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurante`.`Venta` (
  `N_Venta` INT NOT NULL AUTO_INCREMENT,
  `N_Cliente` VARCHAR(45) NOT NULL,
  `Id_Vendedor` VARCHAR(45) NOT NULL,
  `Id_Repartidor` VARCHAR(45) NOT NULL,
  `N_Pedido` VARCHAR(45) NOT NULL,
  `Total_Venta` VARCHAR(45) NOT NULL,
  `Ventacol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`N_Venta`),
  CONSTRAINT `N_Cliente`
    FOREIGN KEY (`N_Venta`)
    REFERENCES `Restaurante`.`Cliente` (`N_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_Vendedor`
    FOREIGN KEY (`N_Venta`)
    REFERENCES `Restaurante`.`Vendedor` (`Id_Vendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_Repartidor`
    FOREIGN KEY (`N_Venta`)
    REFERENCES `Restaurante`.`Repartidor` (`Id_Repartidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `N_Pedido`
    FOREIGN KEY (`N_Venta`)
    REFERENCES `Restaurante`.`Pedido` (`N_Pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
