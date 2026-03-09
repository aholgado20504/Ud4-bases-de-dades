-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici2.b
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici2.b
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici2.b` ;
USE `Exercici2.b` ;

-- -----------------------------------------------------
-- Table `Exercici2.b`.`CINE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.b`.`CINE` (
  `id` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Direccio` VARCHAR(255) NULL,
  `Telefon` VARCHAR(13) NULL,
  `Ciutat` VARCHAR(100) NULL,
  `NumSales` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2.b`.`PELICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.b`.`PELICULA` (
  `ID` INT NOT NULL,
  `Titol` VARCHAR(100) NULL,
  `Classificacio` VARCHAR(45) NULL,
  `Genere` VARCHAR(100) NULL,
  `Director` VARCHAR(255) NULL,
  `Durada` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2.b`.`PROJECCIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.b`.`PROJECCIO` (
  `ID` INT NOT NULL,
  `DATA` DATE NULL,
  `HORA` VARCHAR(45) NULL,
  `SALA` VARCHAR(45) NULL,
  `CINE_id` INT NOT NULL,
  `PELICULA_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_PROJECCIO_CINE_idx` (`CINE_id` ASC) VISIBLE,
  INDEX `fk_PROJECCIO_PELICULA1_idx` (`PELICULA_ID` ASC) VISIBLE,
  CONSTRAINT `fk_PROJECCIO_CINE`
    FOREIGN KEY (`CINE_id`)
    REFERENCES `Exercici2.b`.`CINE` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PROJECCIO_PELICULA1`
    FOREIGN KEY (`PELICULA_ID`)
    REFERENCES `Exercici2.b`.`PELICULA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2.b`.`TARIFA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.b`.`TARIFA` (
  `ID` INT NOT NULL,
  `NOM` VARCHAR(45) NOT NULL,
  `DESCRIPCIO` VARCHAR(255) NULL,
  `PREU` INT NULL,
  `PROJECCIO_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_TARIFA_PROJECCIO1_idx` (`PROJECCIO_ID` ASC) VISIBLE,
  CONSTRAINT `fk_TARIFA_PROJECCIO1`
    FOREIGN KEY (`PROJECCIO_ID`)
    REFERENCES `Exercici2.b`.`PROJECCIO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
