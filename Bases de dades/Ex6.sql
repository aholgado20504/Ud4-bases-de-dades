-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici6` ;
USE `Exercici6` ;

-- -----------------------------------------------------
-- Table `Exercici6`.`Avio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Avio` (
  `id` INT NOT NULL,
  `Model` VARCHAR(100) NULL,
  `Fabricant` VARCHAR(255) NULL,
  `Capacitat` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici6`.`Passatger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Passatger` (
  `id` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(100) NULL,
  `DNI` VARCHAR(9) NULL,
  `Direccio` VARCHAR(255) NULL,
  `Telefon` VARCHAR(14) NULL,
  `Email` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici6`.`Vol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Vol` (
  `id` INT NOT NULL,
  `NumVol` VARCHAR(7) NULL,
  `Origen` VARCHAR(100) NULL,
  `Desti` VARCHAR(100) NULL,
  `DataSortida` VARCHAR(45) NULL,
  `DataArribada` VARCHAR(45) NULL,
  `HoraSortida` VARCHAR(45) NULL,
  `HoraArribada` VARCHAR(45) NULL,
  `Avio_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Vol_Avio1_idx` (`Avio_id` ASC) VISIBLE,
  CONSTRAINT `fk_Vol_Avio1`
    FOREIGN KEY (`Avio_id`)
    REFERENCES `Exercici6`.`Avio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici6`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Reserva` (
  `id` INT NOT NULL,
  `Codi` VARCHAR(10) NULL,
  `DataReserva` VARCHAR(45) NULL,
  `Import` INT NULL,
  `Passatger_id` INT NOT NULL,
  `Vol_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Reserva_Passatger_idx` (`Passatger_id` ASC) VISIBLE,
  INDEX `fk_Reserva_Vol1_idx` (`Vol_id` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Passatger`
    FOREIGN KEY (`Passatger_id`)
    REFERENCES `Exercici6`.`Passatger` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Vol1`
    FOREIGN KEY (`Vol_id`)
    REFERENCES `Exercici6`.`Vol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
