-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Casino
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Casino
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Casino` DEFAULT CHARACTER SET utf8 ;
USE `Casino` ;

-- -----------------------------------------------------
-- Table `Casino`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Casino`.`Cliente` (
  `id_Cliente` INT NOT NULL AUTO_INCREMENT,
  `DUI` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Edad` INT NOT NULL,
  `Direccion` TEXT(100) NOT NULL,
  `N_Telefono` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id_Cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Casino`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Casino`.`Empleado` (
  `id_Empleado` INT NOT NULL AUTO_INCREMENT,
  `DUI` INT NOT NULL,
  `Nombre` VARCHAR(50) NOT NULL,
  `Apellido` VARCHAR(70) NOT NULL,
  `N_Telefono` VARCHAR(45) NOT NULL,
  `Sexo` CHAR(1) NOT NULL,
  PRIMARY KEY (`id_Empleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Casino`.`Juegos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Casino`.`Juegos` (
  `id_Juego` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Juego`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Casino`.`Fecha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Casino`.`Fecha` (
  `id_Fecha` INT NOT NULL AUTO_INCREMENT,
  `Fecha` DATETIME NOT NULL,
  PRIMARY KEY (`id_Fecha`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Casino`.`Apuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Casino`.`Apuesta` (
  `id_apuesta` INT NOT NULL AUTO_INCREMENT,
  `Monto_Apuesta` VARCHAR(45) NOT NULL,
  `id_Fecha` VARCHAR(45) NOT NULL,
  `id_Mesa` VARCHAR(45) NOT NULL,
  `id_Juego` VARCHAR(45) NOT NULL,
  `id_Cliente` VARCHAR(45) NOT NULL,
  `id_Empleado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_apuesta`),
  CONSTRAINT `id_Fecha`
    FOREIGN KEY (`id_apuesta`)
    REFERENCES `Casino`.`Fecha` (`id_Fecha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Mesa`
    FOREIGN KEY (`id_apuesta`)
    REFERENCES `Casino`.`Mesa_De_Juegos` (`id_Mesa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Juego`
    FOREIGN KEY (`id_apuesta`)
    REFERENCES `Casino`.`Juegos` (`id_Juego`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Cliente`
    FOREIGN KEY (`id_apuesta`)
    REFERENCES `Casino`.`Cliente` (`id_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Empleado`
    FOREIGN KEY (`id_apuesta`)
    REFERENCES `Casino`.`Empleado` (`id_Empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Casino`.`Mesa_De_Juegos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Casino`.`Mesa_De_Juegos` (
  `id_Mesa` INT NOT NULL AUTO_INCREMENT,
  `id_Juego` VARCHAR(45) NULL,
  `id_Empleado` VARCHAR(45) NULL,
  `id_Cliente` VARCHAR(45) NULL,
  `id_apuesta` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Mesa`),
  CONSTRAINT `id_Juego`
    FOREIGN KEY (`id_Mesa`)
    REFERENCES `Casino`.`Juegos` (`id_Juego`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Empleado`
    FOREIGN KEY (`id_Mesa`)
    REFERENCES `Casino`.`Empleado` (`id_Empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Cliente`
    FOREIGN KEY (`id_Mesa`)
    REFERENCES `Casino`.`Cliente` (`id_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_apuesta`
    FOREIGN KEY (`id_Mesa`)
    REFERENCES `Casino`.`Apuesta` (`id_apuesta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Casino`.`Bitacora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Casino`.`Bitacora` (
  `id_Bitacora` INT NOT NULL AUTO_INCREMENT,
  `Total_Perdida` VARCHAR(45) NOT NULL,
  `Total_Ganancia` VARCHAR(45) NOT NULL,
  `id_Apuesta` VARCHAR(45) NOT NULL,
  `id_Fecha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Bitacora`),
  CONSTRAINT `id_apuesta`
    FOREIGN KEY (`id_Bitacora`)
    REFERENCES `Casino`.`Apuesta` (`id_apuesta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Fecha`
    FOREIGN KEY (`id_Bitacora`)
    REFERENCES `Casino`.`Fecha` (`id_Fecha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
