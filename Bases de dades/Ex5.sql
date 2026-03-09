-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici5` ;
USE `Exercici5` ;

-- -----------------------------------------------------
-- Table `Exercici5`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici5`.`Client` (
  `id` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(100) NULL,
  `Direccio` VARCHAR(255) NULL,
  `Telefon` VARCHAR(14) NULL,
  `Poblacio` VARCHAR(100) NULL,
  `Email` VARCHAR(100) NULL,
  `Usuari` VARCHAR(50) NULL,
  `Contrasenya` VARCHAR(50) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici5`.`TipusVehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici5`.`TipusVehicle` (
  `id` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Descripcio` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici5`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici5`.`Vehicle` (
  `id` INT NOT NULL,
  `NumBastidor` VARCHAR(25) NULL,
  `Marca` VARCHAR(50) NULL,
  `Model` VARCHAR(50) NULL,
  `Matricula` VARCHAR(20) NULL,
  `TipusVehicle_id` INT NOT NULL,
  `Client_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Vehicle_TipusVehicle_idx` (`TipusVehicle_id` ASC) VISIBLE,
  INDEX `fk_Vehicle_Client1_idx` (`Client_id` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_TipusVehicle`
    FOREIGN KEY (`TipusVehicle_id`)
    REFERENCES `Exercici5`.`TipusVehicle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehicle_Client1`
    FOREIGN KEY (`Client_id`)
    REFERENCES `Exercici5`.`Client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici5`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici5`.`Cita` (
  `id` INT NOT NULL,
  `Dia` VARCHAR(45) NULL,
  `Hora` VARCHAR(45) NULL,
  `Vehicle_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Cita_Vehicle1_idx` (`Vehicle_id` ASC) VISIBLE,
  CONSTRAINT `fk_Cita_Vehicle1`
    FOREIGN KEY (`Vehicle_id`)
    REFERENCES `Exercici5`.`Vehicle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
