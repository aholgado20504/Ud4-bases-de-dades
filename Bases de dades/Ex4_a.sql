-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`CLIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CLIENT` (
  `dni` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `cognoms` VARCHAR(100) NULL,
  `adreca` VARCHAR(255) NULL,
  `telefon` VARCHAR(14) NULL,
  `vip` TINYINT(1) NOT NULL,
  PRIMARY KEY (`dni`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TIPUS_POLISSA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TIPUS_POLISSA` (
  `idTIPUS_POLISSA` INT NOT NULL,
  `nom_tipus (1: automobil, 2: vida, 3: llar, 4: viatge)` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idTIPUS_POLISSA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VENEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VENEDOR` (
  `idVENEDOR` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`idVENEDOR`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`POLISSA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`POLISSA` (
  `num_polissa` INT NOT NULL,
  `preu_anual` INT NULL,
  `tipus_pagament` VARCHAR(45) NULL,
  `data_inici_vigencia` VARCHAR(45) NULL,
  `data_fi_vigencia` VARCHAR(45) NULL,
  `TIPUS_POLISSA_idTIPUS_POLISSA` INT NOT NULL,
  `VENEDOR_idVENEDOR` INT NOT NULL,
  `CLIENT_dni` INT NOT NULL,
  PRIMARY KEY (`num_polissa`),
  INDEX `fk_POLISSA_TIPUS_POLISSA1_idx` (`TIPUS_POLISSA_idTIPUS_POLISSA` ASC) VISIBLE,
  INDEX `fk_POLISSA_VENEDOR1_idx` (`VENEDOR_idVENEDOR` ASC) VISIBLE,
  INDEX `fk_POLISSA_CLIENT1_idx` (`CLIENT_dni` ASC) VISIBLE,
  CONSTRAINT `fk_POLISSA_TIPUS_POLISSA1`
    FOREIGN KEY (`TIPUS_POLISSA_idTIPUS_POLISSA`)
    REFERENCES `mydb`.`TIPUS_POLISSA` (`idTIPUS_POLISSA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_POLISSA_VENEDOR1`
    FOREIGN KEY (`VENEDOR_idVENEDOR`)
    REFERENCES `mydb`.`VENEDOR` (`idVENEDOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_POLISSA_CLIENT1`
    FOREIGN KEY (`CLIENT_dni`)
    REFERENCES `mydb`.`CLIENT` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
