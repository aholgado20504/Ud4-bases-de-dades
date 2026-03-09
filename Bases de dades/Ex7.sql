-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici7` ;
USE `Exercici7` ;

-- -----------------------------------------------------
-- Table `Exercici7`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Client` (
  `id` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Direccio` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici7`.`Venedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Venedor` (
  `id` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Direccio` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `DataNaixement` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici7`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Ticket` (
  `id` INT NOT NULL,
  `NumFactura` VARCHAR(45) NULL,
  `Data` VARCHAR(45) NULL,
  `Hora` VARCHAR(45) NULL,
  `Total` VARCHAR(45) NULL,
  `Client_id` INT NOT NULL,
  `Venedor_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Ticket_Client1_idx` (`Client_id` ASC) VISIBLE,
  INDEX `fk_Ticket_Venedor1_idx` (`Venedor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_Client1`
    FOREIGN KEY (`Client_id`)
    REFERENCES `Exercici7`.`Client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ticket_Venedor1`
    FOREIGN KEY (`Venedor_id`)
    REFERENCES `Exercici7`.`Venedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici7`.`Producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Producte` (
  `id` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Descripcio` VARCHAR(45) NULL,
  `PreuUnitari` INT NULL,
  `Quantitat` VARCHAR(45) NULL,
  `IVA` VARCHAR(45) NULL,
  `CodiBarres` VARCHAR(45) NULL,
  `PVP` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici7`.`LiniaTicket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`LiniaTicket` (
  `id` INT NOT NULL,
  `Unitats` VARCHAR(45) NULL,
  `Descompte` VARCHAR(45) NULL,
  `Ticket_id` INT NOT NULL,
  `Producte_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_LiniaTicket_Ticket_idx` (`Ticket_id` ASC) VISIBLE,
  INDEX `fk_LiniaTicket_Producte1_idx` (`Producte_id` ASC) VISIBLE,
  CONSTRAINT `fk_LiniaTicket_Ticket`
    FOREIGN KEY (`Ticket_id`)
    REFERENCES `Exercici7`.`Ticket` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LiniaTicket_Producte1`
    FOREIGN KEY (`Producte_id`)
    REFERENCES `Exercici7`.`Producte` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
