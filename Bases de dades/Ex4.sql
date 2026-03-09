-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici4` ;
USE `Exercici4` ;

-- -----------------------------------------------------
-- Table `Exercici4`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici4`.`Client` (
  `id` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(100) NULL,
  `Direccio` VARCHAR(255) NULL,
  `Telefon` VARCHAR(14) NULL,
  `VIP` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici4`.`Venedors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici4`.`Venedors` (
  `id` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(100) NULL,
  `Direccio` VARCHAR(255) NULL,
  `telefon` VARCHAR(14) NULL,
  `email` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici4`.`TipusPolissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici4`.`TipusPolissa` (
  `id` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Descripcio` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici4`.`Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici4`.`Polissa` (
  `id` INT NOT NULL,
  `Numero` VARCHAR(25) NULL,
  `Preu` INT NULL,
  `TipusPagament` VARCHAR(100) NULL,
  `DataContractacio` VARCHAR(50) NULL,
  `DataInici` VARCHAR(50) NULL,
  `DataFi` VARCHAR(50) NULL,
  `TipusPolissa_id` INT NOT NULL,
  `Client_id` INT NOT NULL,
  `Venedors_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Polissa_TipusPolissa_idx` (`TipusPolissa_id` ASC) VISIBLE,
  INDEX `fk_Polissa_Client1_idx` (`Client_id` ASC) VISIBLE,
  INDEX `fk_Polissa_Venedors1_idx` (`Venedors_id` ASC) VISIBLE,
  CONSTRAINT `fk_Polissa_TipusPolissa`
    FOREIGN KEY (`TipusPolissa_id`)
    REFERENCES `Exercici4`.`TipusPolissa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Client1`
    FOREIGN KEY (`Client_id`)
    REFERENCES `Exercici4`.`Client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Venedors1`
    FOREIGN KEY (`Venedors_id`)
    REFERENCES `Exercici4`.`Venedors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
