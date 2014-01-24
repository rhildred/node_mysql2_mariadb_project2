SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `digitaldelivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `digitaldelivery` ;

-- -----------------------------------------------------
-- Table `digitaldelivery`.`owner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `digitaldelivery`.`owner` (
  `id` VARCHAR(64) NOT NULL,
  `ownerName` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `digitaldelivery`.`media`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `digitaldelivery`.`media` (
  `id` VARCHAR(64) NOT NULL,
  `contentType` VARCHAR(45) NULL DEFAULT 'image/jpeg' COMMENT 'this is for handling different media types in the future',
  `owner_id` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`id`, `owner_id`),
  INDEX `fk_media_owner_idx` (`owner_id` ASC),
  CONSTRAINT `fk_media_owner`
    FOREIGN KEY (`owner_id`)
    REFERENCES `digitaldelivery`.`owner` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
