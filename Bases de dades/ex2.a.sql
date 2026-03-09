-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici2.a
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici2.a
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici2.a` ;
USE `Exercici2.a` ;

-- -----------------------------------------------------
-- Table `Exercici2.a`.`PACIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.a`.`PACIENT` (
  `id` INT NOT NULL,
  `DNI` VARCHAR(9) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(100) NOT NULL,
  `Mobil` VARCHAR(13) NULL,
  `Direccio` VARCHAR(100) NULL,
  `NumeroSS` VARCHAR(25) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2.a`.`METGE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.a`.`METGE` (
  `idMETGE` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(100) NOT NULL,
  `NumColegiat` VARCHAR(25) NOT NULL,
  `Especialitat` VARCHAR(100) NULL,
  `Carrec` VARCHAR(100) NULL,
  PRIMARY KEY (`idMETGE`),
  UNIQUE INDEX `idMETGE_UNIQUE` (`idMETGE` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2.a`.`CONSULTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.a`.`CONSULTA` (
  `DATA` DATE NULL,
  `DESPATX` VARCHAR(45) NULL,
  `DIAGNOSTIC` VARCHAR(255) NULL,
  `ID` INT NOT NULL,
  `PACIENT_id` INT NOT NULL,
  `METGE_idMETGE` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_CONSULTA_PACIENT_idx` (`PACIENT_id` ASC) VISIBLE,
  INDEX `fk_CONSULTA_METGE1_idx` (`METGE_idMETGE` ASC) VISIBLE,
  CONSTRAINT `fk_CONSULTA_PACIENT`
    FOREIGN KEY (`PACIENT_id`)
    REFERENCES `Exercici2.a`.`PACIENT` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONSULTA_METGE1`
    FOREIGN KEY (`METGE_idMETGE`)
    REFERENCES `Exercici2.a`.`METGE` (`idMETGE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
