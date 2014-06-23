SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema wipsea
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `wipsea` ;
CREATE SCHEMA IF NOT EXISTS `wipsea` ;
-- -----------------------------------------------------
-- Schema testdrive
-- -----------------------------------------------------
USE `wipsea` ;

-- -----------------------------------------------------
-- Table `wipsea`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wipsea`.`person` ;

CREATE TABLE IF NOT EXISTS `wipsea`.`person` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(128) NOT NULL,
  `username` VARCHAR(128) NOT NULL DEFAULT TRUE,
  `password` VARCHAR(128) NOT NULL,
  `organisation` VARCHAR(128) NULL,
  `create_date` DATETIME NOT NULL,
  `last_update` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Table storing all persons.' /* comment truncated */ /*
Basic information about a person like first and last name are stored in the table itself. Same for the date the record was created and when the information was last updated.*/;

CREATE INDEX `idx_last_name` ON `wipsea`.`person` (`last_name` ASC);

CREATE INDEX `idx_email` ON `wipsea`.`person` (`email` ASC);

CREATE INDEX `idx_username` ON `wipsea`.`person` (`username` ASC);


-- -----------------------------------------------------
-- Table `wipsea`.`image_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wipsea`.`image_type` ;

CREATE TABLE IF NOT EXISTS `wipsea`.`image_type` (
  `type` VARCHAR(128) NOT NULL COMMENT 'image types :' /* comment truncated */ /*- background
- wildlife
*/,
  PRIMARY KEY (`type`))
ENGINE = InnoDB
COMMENT = 'Queue to process images.';


-- -----------------------------------------------------
-- Table `wipsea`.`image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wipsea`.`image` ;

CREATE TABLE IF NOT EXISTS `wipsea`.`image` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `longitude` VARCHAR(50) NULL,
  `latitude` VARCHAR(50) NULL,
  `altitude` VARCHAR(50) NULL,
  `img_path` VARCHAR(255) NULL COMMENT 'Filesystem path to image.',
  `type` VARCHAR(128) NOT NULL COMMENT 'Image is of either type :' /* comment truncated */ /*0 - background scene
1 - wildlife object*/,
  `processed` TINYINT(1) NULL DEFAULT 0 COMMENT 'For images of type background scene, indicates whether image has been processed for wildlife object detection.',
  `valid` TINYINT(1) NULL DEFAULT 0 COMMENT 'For images of type wildlife object, indicates whether or not it is valid.',
  `created_by` VARCHAR(128) NOT NULL COMMENT 'Person who uploaded image.',
  `created` DATETIME NOT NULL,
  `last_update` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_image_type`
    FOREIGN KEY (`type`)
    REFERENCES `wipsea`.`image_type` (`type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Images that can be of either type background scene, or wildl' /* comment truncated */ /*ife object.*/;

CREATE INDEX `fk_image_type_idx` ON `wipsea`.`image` (`type` ASC);


-- -----------------------------------------------------
-- Table `wipsea`.`image_queue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wipsea`.`image_queue` ;

CREATE TABLE IF NOT EXISTS `wipsea`.`image_queue` (
  `id` INT NOT NULL,
  `image_id` INT UNSIGNED NOT NULL,
  `status` INT NOT NULL DEFAULT 0 COMMENT 'Status of item:' /* comment truncated */ /*0 - waiting to be processed
1 - processing
2 - processed*/,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_queue_image`
    FOREIGN KEY (`image_id`)
    REFERENCES `wipsea`.`image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Queue to process images.';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
