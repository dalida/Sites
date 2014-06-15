SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Wipsea
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Wipsea` ;
CREATE SCHEMA IF NOT EXISTS `Wipsea` ;
-- -----------------------------------------------------
-- Schema testdrive
-- -----------------------------------------------------
USE `Wipsea` ;

-- -----------------------------------------------------
-- Table `Wipsea`.`persons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Wipsea`.`persons` ;

CREATE TABLE IF NOT EXISTS `Wipsea`.`persons` (
  `person_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(128) NOT NULL,
  `username` VARCHAR(128) NOT NULL DEFAULT TRUE,
  `password` VARCHAR(128) NOT NULL,
  `organisation` VARCHAR(128) NULL,
  `create_date` DATETIME NOT NULL,
  `last_update` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`person_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Table storing all persons.' /* comment truncated */ /*
Basic information about a person like first and last name are stored in the table itself. Same for the date the record was created and when the information was last updated.*/;

CREATE INDEX `idx_last_name` ON `Wipsea`.`persons` (`last_name` ASC);

CREATE INDEX `idx_email` ON `Wipsea`.`persons` (`email` ASC);

CREATE INDEX `idx_username` ON `Wipsea`.`persons` (`username` ASC);


-- -----------------------------------------------------
-- Table `Wipsea`.`elements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Wipsea`.`elements` ;

CREATE TABLE IF NOT EXISTS `Wipsea`.`elements` (
  `element_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `longitude` VARCHAR(50) NULL,
  `latitude` VARCHAR(50) NULL,
  `altitude` VARCHAR(50) NULL,
  `image_path` VARCHAR(255) NOT NULL,
  `created_by` SMALLINT UNSIGNED NOT NULL,
  `created` DATETIME NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`element_id`),
  CONSTRAINT `fk_element_person`
    FOREIGN KEY (`created_by`)
    REFERENCES `Wipsea`.`persons` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'An element that is either an image or wildlife.';

CREATE INDEX `fk_element_person_idx` ON `Wipsea`.`elements` (`created_by` ASC);


-- -----------------------------------------------------
-- Table `Wipsea`.`wildlife`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Wipsea`.`wildlife` ;

CREATE TABLE IF NOT EXISTS `Wipsea`.`wildlife` (
  `wildlife_id` INT UNSIGNED NOT NULL,
  `valid` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`wildlife_id`),
  CONSTRAINT `fk_wildlife_elements`
    FOREIGN KEY (`wildlife_id`)
    REFERENCES `Wipsea`.`elements` (`element_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Wildlife to be detected';


-- -----------------------------------------------------
-- Table `Wipsea`.`images`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Wipsea`.`images` ;

CREATE TABLE IF NOT EXISTS `Wipsea`.`images` (
  `image_id` INT UNSIGNED NOT NULL,
  `processed` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`image_id`),
  CONSTRAINT `fk_images_elements`
    FOREIGN KEY (`image_id`)
    REFERENCES `Wipsea`.`elements` (`element_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Image scenes to search wildlife';


-- -----------------------------------------------------
-- Table `Wipsea`.`images_queue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Wipsea`.`images_queue` ;

CREATE TABLE IF NOT EXISTS `Wipsea`.`images_queue` (
  `image_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`image_id`),
  CONSTRAINT `fk_images_elements0`
    FOREIGN KEY (`image_id`)
    REFERENCES `Wipsea`.`elements` (`element_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Queue to process images.';


-- -----------------------------------------------------
-- Table `Wipsea`.`images_queue_done`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Wipsea`.`images_queue_done` ;

CREATE TABLE IF NOT EXISTS `Wipsea`.`images_queue_done` (
  `image_id` INT UNSIGNED NOT NULL,
  `processed` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `fk_images_elements1`
    FOREIGN KEY (`image_id`)
    REFERENCES `Wipsea`.`elements` (`element_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Images processed';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
