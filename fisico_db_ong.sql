-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_ong
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_ong
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_ong` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema crazy_cat_gang
-- -----------------------------------------------------
USE `db_ong` ;

-- -----------------------------------------------------
-- Table `db_ong`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ong`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idcliente`),
  UNIQUE INDEX `idcliente_UNIQUE` (`idcliente` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ong`.`clinica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ong`.`clinica` (
  `idclinica` INT NOT NULL AUTO_INCREMENT,
  `bairro` VARCHAR(100) NOT NULL,
  `rua` VARCHAR(255) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idclinica`),
  UNIQUE INDEX `idclinica_UNIQUE` (`idclinica` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ong`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ong`.`items` (
  `iditems` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `imagen` BLOB NULL,
  PRIMARY KEY (`iditems`),
  UNIQUE INDEX `iditems_UNIQUE` (`iditems` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ong`.`cliente_has_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ong`.`cliente_has_items` (
  `cliente_idcliente` INT NOT NULL,
  `items_iditems` INT NOT NULL,
  PRIMARY KEY (`cliente_idcliente`, `items_iditems`),
  INDEX `fk_cliente_has_items_items1_idx` (`items_iditems` ASC) VISIBLE,
  INDEX `fk_cliente_has_items_cliente_idx` (`cliente_idcliente` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_has_items_cliente`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `db_ong`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_items_items1`
    FOREIGN KEY (`items_iditems`)
    REFERENCES `db_ong`.`items` (`iditems`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_ong`.`items_has_clinica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_ong`.`items_has_clinica` (
  `items_iditems` INT NOT NULL,
  `clinica_idclinica` INT NOT NULL,
  PRIMARY KEY (`items_iditems`, `clinica_idclinica`),
  INDEX `fk_items_has_clinica_clinica1_idx` (`clinica_idclinica` ASC) VISIBLE,
  INDEX `fk_items_has_clinica_items1_idx` (`items_iditems` ASC) VISIBLE,
  CONSTRAINT `fk_items_has_clinica_items1`
    FOREIGN KEY (`items_iditems`)
    REFERENCES `db_ong`.`items` (`iditems`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_has_clinica_clinica1`
    FOREIGN KEY (`clinica_idclinica`)
    REFERENCES `db_ong`.`clinica` (`idclinica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
