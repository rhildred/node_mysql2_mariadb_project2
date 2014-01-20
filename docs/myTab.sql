SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `myTab` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `myTab` ;

-- -----------------------------------------------------
-- Table `myTab`.`Magazine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myTab`.`Magazine` (
  `idMagazine` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMagazine`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myTab`.`Fakebook`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myTab`.`Fakebook` (
  `idFakebook` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFakebook`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myTab`.`Issue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myTab`.`Issue` (
  `idIssue` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `sequence` INT NOT NULL,
  `Magazine_idMagazine` INT NOT NULL,
  PRIMARY KEY (`idIssue`, `Magazine_idMagazine`),
  INDEX `fk_Issue_Magazine_idx` (`Magazine_idMagazine` ASC),
  CONSTRAINT `fk_Issue_Magazine`
    FOREIGN KEY (`Magazine_idMagazine`)
    REFERENCES `myTab`.`Magazine` (`idMagazine`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myTab`.`Tab`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myTab`.`Tab` (
  `idTab` INT NOT NULL AUTO_INCREMENT,
  `idIssue` INT NULL,
  `idFakebook` INT NULL,
  `title` VARCHAR(45) NULL,
  `artist` VARCHAR(45) NULL,
  `pageNumber` INT NULL,
  `difficulty` INT NULL,
  `arranger` VARCHAR(45) NULL,
  PRIMARY KEY (`idTab`),
  INDEX `fk_Tab_Issue1_idx` (`idIssue` ASC),
  INDEX `fk_Tab_Fakebook1_idx` (`idFakebook` ASC),
  INDEX `index_title` (`title` ASC),
  INDEX `index_artist` (`artist` ASC),
  INDEX `index_difficulty` (`difficulty` ASC),
  INDEX `index_arranger` (`arranger` ASC),
  CONSTRAINT `fk_Tab_Issue1`
    FOREIGN KEY (`idIssue`)
    REFERENCES `myTab`.`Issue` (`idIssue`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tab_Fakebook1`
    FOREIGN KEY (`idFakebook`)
    REFERENCES `myTab`.`Fakebook` (`idFakebook`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
