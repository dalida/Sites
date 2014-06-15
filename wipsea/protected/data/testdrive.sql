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
DROP SCHEMA IF EXISTS `testdrive` ;
CREATE SCHEMA IF NOT EXISTS `testdrive` DEFAULT CHARACTER SET latin1 ;
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
  `create_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `image_thumb_path` VARCHAR(255) NOT NULL,
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
  CONSTRAINT `fk_images_queue_images`
    FOREIGN KEY (`image_id`)
    REFERENCES `Wipsea`.`images` (`image_id`)
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
  `processed_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `fk_images_queueD_images`
    FOREIGN KEY (`image_id`)
    REFERENCES `Wipsea`.`images` (`image_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Images processed';

CREATE INDEX `fk_images_elements1_idx` ON `Wipsea`.`images_queue_done` (`image_id` ASC);

-- USE `testdrive` ;

-- -----------------------------------------------------
-- Table `testdrive`.`tbl_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Wipsea`.`tbl_user` ;

CREATE TABLE IF NOT EXISTS `Wipsea`.`tbl_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(128) NOT NULL,
  `password` VARCHAR(128) NOT NULL,
  `email` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `testdrive`.`tbl_post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Wipsea`.`tbl_post` ;

CREATE TABLE IF NOT EXISTS `Wipsea`.`tbl_post` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(128) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `content` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `tags` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `status` INT(11) NOT NULL,
  `create_time` INT(11) NULL DEFAULT NULL,
  `update_time` INT(11) NULL DEFAULT NULL,
  `author_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_post_author`
    FOREIGN KEY (`author_id`)
    REFERENCES `Wipsea`.`tbl_user` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE INDEX `FK_post_author` ON `Wipsea`.`tbl_post` (`author_id` ASC);


-- -----------------------------------------------------
-- Table `testdrive`.`tbl_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Wipsea`.`tbl_comment` ;

CREATE TABLE IF NOT EXISTS `Wipsea`.`tbl_comment` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `content` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `status` INT(11) NOT NULL,
  `create_time` INT(11) NULL DEFAULT NULL,
  `author` VARCHAR(128) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `email` VARCHAR(128) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `url` VARCHAR(128) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `post_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_comment_post`
    FOREIGN KEY (`post_id`)
    REFERENCES `Wipsea`.`tbl_post` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE INDEX `FK_comment_post` ON `Wipsea`.`tbl_comment` (`post_id` ASC);


-- -----------------------------------------------------
-- Table `testdrive`.`tbl_lookup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Wipsea`.`tbl_lookup` ;

CREATE TABLE IF NOT EXISTS `Wipsea`.`tbl_lookup` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `code` INT(11) NOT NULL,
  `type` VARCHAR(128) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `position` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `testdrive`.`tbl_tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Wipsea`.`tbl_tag` ;

CREATE TABLE IF NOT EXISTS `Wipsea`.`tbl_tag` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `frequency` INT(11) NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
