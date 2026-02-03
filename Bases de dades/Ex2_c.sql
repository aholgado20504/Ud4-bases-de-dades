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
-- Table `mydb`.`PACIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PACIENT` (
  `idPACIENT` INT NOT NULL,
  `dni` VARCHAR(9) NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `cognoms` VARCHAR(100) NOT NULL,
  `telefon` VARCHAR(14) NULL,
  `adreca` VARCHAR(100) NULL,
  `numero_SS` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPACIENT`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`METGE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`METGE` (
  `idMETGE` INT NOT NULL,
  `numero_colegiat` VARCHAR(45) NULL,
  `nom` VARCHAR(45) NOT NULL,
  `cognoms` VARCHAR(100) NOT NULL,
  `especialitat` VARCHAR(45) NULL,
  `carrec` VARCHAR(45) NULL,
  `dni` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`idMETGE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CONSULTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CONSULTA` (
  `idCONSULTA` INT NOT NULL,
  `data` VARCHAR(10) NOT NULL,
  `llit` VARCHAR(45) NULL,
  `planta` VARCHAR(45) NOT NULL,
  `diagnostic` VARCHAR(45) NULL,
  `PACIENT_idPACIENT` INT NOT NULL,
  PRIMARY KEY (`idCONSULTA`),
  INDEX `fk_CONSULTA_PACIENT_idx` (`PACIENT_idPACIENT` ASC) VISIBLE,
  CONSTRAINT `fk_CONSULTA_PACIENT`
    FOREIGN KEY (`PACIENT_idPACIENT`)
    REFERENCES `mydb`.`PACIENT` (`idPACIENT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`METGE_has_CONSULTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`METGE_has_CONSULTA` (
  `METGE_idMETGE` INT NOT NULL,
  `CONSULTA_idCONSULTA` INT NOT NULL,
  PRIMARY KEY (`METGE_idMETGE`, `CONSULTA_idCONSULTA`),
  INDEX `fk_METGE_has_CONSULTA_CONSULTA1_idx` (`CONSULTA_idCONSULTA` ASC) VISIBLE,
  INDEX `fk_METGE_has_CONSULTA_METGE1_idx` (`METGE_idMETGE` ASC) VISIBLE,
  CONSTRAINT `fk_METGE_has_CONSULTA_METGE1`
    FOREIGN KEY (`METGE_idMETGE`)
    REFERENCES `mydb`.`METGE` (`idMETGE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_METGE_has_CONSULTA_CONSULTA1`
    FOREIGN KEY (`CONSULTA_idCONSULTA`)
    REFERENCES `mydb`.`CONSULTA` (`idCONSULTA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CINE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CINE` (
  `idCINE` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `adreca` VARCHAR(255) NOT NULL,
  `telefon` VARCHAR(14) NOT NULL,
  `poblacio` VARCHAR(45) NOT NULL,
  `numero_sales` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCINE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PROJECCIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PROJECCIO` (
  `idPROJECCIO` INT NOT NULL,
  `data` VARCHAR(10) NOT NULL,
  `hora` VARCHAR(5) NOT NULL,
  `sala` INT(45) NOT NULL,
  `CINE_idCINE` INT NOT NULL,
  PRIMARY KEY (`idPROJECCIO`),
  INDEX `fk_PROJECCIO_CINE1_idx` (`CINE_idCINE` ASC) VISIBLE,
  CONSTRAINT `fk_PROJECCIO_CINE1`
    FOREIGN KEY (`CINE_idCINE`)
    REFERENCES `mydb`.`CINE` (`idCINE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PELICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PELICULA` (
  `idPELICULA` INT NOT NULL,
  `titol` VARCHAR(255) NOT NULL,
  `classificacio` VARCHAR(45) NOT NULL,
  `genere` VARCHAR(45) NOT NULL,
  `director` VARCHAR(45) NOT NULL,
  `durada` VARCHAR(45) NOT NULL,
  `PROJECCIO_idPROJECCIO` INT NOT NULL,
  PRIMARY KEY (`idPELICULA`),
  INDEX `fk_PELICULA_PROJECCIO1_idx` (`PROJECCIO_idPROJECCIO` ASC) VISIBLE,
  CONSTRAINT `fk_PELICULA_PROJECCIO1`
    FOREIGN KEY (`PROJECCIO_idPROJECCIO`)
    REFERENCES `mydb`.`PROJECCIO` (`idPROJECCIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TARIFA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TARIFA` (
  `idTARIFA` INT NOT NULL,
  `tipus` VARCHAR(45) NOT NULL,
  `preu` INT(6) NOT NULL,
  `CINE_idCINE` INT NOT NULL,
  PRIMARY KEY (`idTARIFA`),
  INDEX `fk_TARIFA_CINE1_idx` (`CINE_idCINE` ASC) VISIBLE,
  CONSTRAINT `fk_TARIFA_CINE1`
    FOREIGN KEY (`CINE_idCINE`)
    REFERENCES `mydb`.`CINE` (`idCINE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ALUMNE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ALUMNE` (
  `idALUMNE` INT NOT NULL,
  `dni` VARCHAR(9) NULL,
  `nom` VARCHAR(45) NULL,
  `cognoms` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `telefon` VARCHAR(9) NULL,
  `adreca` VARCHAR(45) NULL,
  PRIMARY KEY (`idALUMNE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DEPARTAMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DEPARTAMENT` (
  `idDEPARTAMENT` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`idDEPARTAMENT`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PROFESSOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PROFESSOR` (
  `idPROFESSOR` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `cognoms` VARCHAR(100) NULL,
  `titulacio` VARCHAR(45) NULL,
  `esCapDepartament` TINYINT NULL,
  `dni` VARCHAR(9) NULL,
  `DEPARTAMENT_idDEPARTAMENT` INT NOT NULL,
  PRIMARY KEY (`idPROFESSOR`),
  INDEX `fk_PROFESSOR_DEPARTAMENT1_idx` (`DEPARTAMENT_idDEPARTAMENT` ASC) VISIBLE,
  CONSTRAINT `fk_PROFESSOR_DEPARTAMENT1`
    FOREIGN KEY (`DEPARTAMENT_idDEPARTAMENT`)
    REFERENCES `mydb`.`DEPARTAMENT` (`idDEPARTAMENT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ASSIGNATURA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ASSIGNATURA` (
  `idASSIGNATURA` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `credits` VARCHAR(45) NULL,
  `DEPARTAMENT_idDEPARTAMENT` INT NOT NULL,
  `PROFESSOR_idPROFESSOR` INT NOT NULL,
  PRIMARY KEY (`idASSIGNATURA`),
  INDEX `fk_ASSIGNATURA_DEPARTAMENT1_idx` (`DEPARTAMENT_idDEPARTAMENT` ASC) VISIBLE,
  INDEX `fk_ASSIGNATURA_PROFESSOR1_idx` (`PROFESSOR_idPROFESSOR` ASC) VISIBLE,
  CONSTRAINT `fk_ASSIGNATURA_DEPARTAMENT1`
    FOREIGN KEY (`DEPARTAMENT_idDEPARTAMENT`)
    REFERENCES `mydb`.`DEPARTAMENT` (`idDEPARTAMENT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ASSIGNATURA_PROFESSOR1`
    FOREIGN KEY (`PROFESSOR_idPROFESSOR`)
    REFERENCES `mydb`.`PROFESSOR` (`idPROFESSOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MATRICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MATRICULA` (
  `idMATRICULA` INT NOT NULL,
  `data` VARCHAR(10) NULL,
  `any_curs` VARCHAR(9) NULL,
  `nota` VARCHAR(45) NULL,
  `ALUMNE_idALUMNE` INT NOT NULL,
  `ASSIGNATURA_idASSIGNATURA` INT NOT NULL,
  PRIMARY KEY (`idMATRICULA`),
  INDEX `fk_MATRICULA_ALUMNE1_idx` (`ALUMNE_idALUMNE` ASC) VISIBLE,
  INDEX `fk_MATRICULA_ASSIGNATURA1_idx` (`ASSIGNATURA_idASSIGNATURA` ASC) VISIBLE,
  CONSTRAINT `fk_MATRICULA_ALUMNE1`
    FOREIGN KEY (`ALUMNE_idALUMNE`)
    REFERENCES `mydb`.`ALUMNE` (`idALUMNE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MATRICULA_ASSIGNATURA1`
    FOREIGN KEY (`ASSIGNATURA_idASSIGNATURA`)
    REFERENCES `mydb`.`ASSIGNATURA` (`idASSIGNATURA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
