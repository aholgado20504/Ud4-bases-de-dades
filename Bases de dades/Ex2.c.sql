-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici2.c
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici2.c
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici2.c` ;
USE `Exercici2.c` ;

-- -----------------------------------------------------
-- Table `Exercici2.c`.`Alumne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.c`.`Alumne` (
  `id` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(100) NULL,
  `DNI` VARCHAR(9) NULL,
  `Direccio` VARCHAR(100) NULL,
  `Telefon` VARCHAR(14) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2.c`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.c`.`Departament` (
  `idDepartament` INT NOT NULL,
  `Nom` VARCHAR(100) NULL,
  `Descripcio` VARCHAR(255) NULL,
  PRIMARY KEY (`idDepartament`),
  UNIQUE INDEX `idDepartament_UNIQUE` (`idDepartament` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2.c`.`Modul`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.c`.`Modul` (
  `idModul` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Credits` VARCHAR(45) NULL,
  PRIMARY KEY (`idModul`),
  UNIQUE INDEX `idModul_UNIQUE` (`idModul` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2.c`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.c`.`Professor` (
  `id` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(100) NULL,
  `Direccio` VARCHAR(255) NULL,
  `Telefon` VARCHAR(14) NULL,
  `Especialitat` VARCHAR(100) NULL,
  `Departament_idDepartament` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Professor_Departament1_idx` (`Departament_idDepartament` ASC) VISIBLE,
  CONSTRAINT `fk_Professor_Departament1`
    FOREIGN KEY (`Departament_idDepartament`)
    REFERENCES `Exercici2.c`.`Departament` (`idDepartament`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2.c`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.c`.`Matricula` (
  `id` INT NOT NULL,
  `CursAcademic` VARCHAR(45) NULL,
  `Alumne_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Matricula_Alumne_idx` (`Alumne_id` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Alumne`
    FOREIGN KEY (`Alumne_id`)
    REFERENCES `Exercici2.c`.`Alumne` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2.c`.`ModulMatricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.c`.`ModulMatricula` (
  `id` INT NOT NULL,
  `Matricula_id` INT NOT NULL,
  `Modul_idModul` INT NOT NULL,
  `Professor_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ModulMatricula_Matricula1_idx` (`Matricula_id` ASC) VISIBLE,
  INDEX `fk_ModulMatricula_Modul1_idx` (`Modul_idModul` ASC) VISIBLE,
  INDEX `fk_ModulMatricula_Professor1_idx` (`Professor_id` ASC) VISIBLE,
  CONSTRAINT `fk_ModulMatricula_Matricula1`
    FOREIGN KEY (`Matricula_id`)
    REFERENCES `Exercici2.c`.`Matricula` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ModulMatricula_Modul1`
    FOREIGN KEY (`Modul_idModul`)
    REFERENCES `Exercici2.c`.`Modul` (`idModul`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ModulMatricula_Professor1`
    FOREIGN KEY (`Professor_id`)
    REFERENCES `Exercici2.c`.`Professor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
