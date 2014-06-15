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
-- Table `Wipsea`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Wipsea`.`person` ;

CREATE TABLE IF NOT EXISTS `Wipsea`.`person` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(128) NOT NULL,
  `username` VARCHAR(128) NOT NULL DEFAULT TRUE,
  `password` VARCHAR(128) NOT NULL,
  `organisation` VARCHAR(128) NULL,
  `create_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Table storing all persons.' /* comment truncated */ /*
Basic information about a person like first and last name are stored in the table itself. Same for the date the record was created and when the information was last updated.*/;

CREATE INDEX `idx_last_name` ON `Wipsea`.`person` (`last_name` ASC);

CREATE INDEX `idx_email` ON `Wipsea`.`person` (`email` ASC);

CREATE INDEX `idx_username` ON `Wipsea`.`person` (`username` ASC);


-- -----------------------------------------------------
-- Table `Wipsea`.`image_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Wipsea`.`image_type` ;

CREATE TABLE IF NOT EXISTS `Wipsea`.`image_type` (
  `id` TINYINT NOT NULL,
  `type` ENUM('background','wildlife') NOT NULL COMMENT 'enumeration for image types :' /* comment truncated */ /*- background
- wildlife
*/,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'Queue to process images.';


-- -----------------------------------------------------
-- Table `Wipsea`.`image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Wipsea`.`image` ;

CREATE TABLE IF NOT EXISTS `Wipsea`.`image` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `longitude` VARCHAR(50) NULL,
  `latitude` VARCHAR(50) NULL,
  `altitude` VARCHAR(50) NULL,
  `img_path` VARCHAR(255) NOT NULL COMMENT 'Filesystem path to image.',
  `img_thumb_path` VARCHAR(255) NOT NULL COMMENT 'Filesystem path to thumbnail of image.',
  `type` TINYINT NOT NULL COMMENT 'Image is of either type :' /* comment truncated */ /*0 - background scene
1 - wildlife object*/,
  `processed` TINYINT(1) NULL DEFAULT 0 COMMENT 'For images of type background scene, indicates whether image has been processed for wildlife object detection.',
  `valid` TINYINT(1) NULL DEFAULT 0 COMMENT 'For images of type wildlife object, indicates whether or not it is valid.',
  `created_by` SMALLINT UNSIGNED NOT NULL COMMENT 'Person who uploaded image.',
  `created` DATETIME NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_image_person`
    FOREIGN KEY (`created_by`)
    REFERENCES `Wipsea`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_image_type`
    FOREIGN KEY (`type`)
    REFERENCES `Wipsea`.`image_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Images that can be of either type background scene, or wildl' /* comment truncated */ /*ife object.*/;

CREATE INDEX `fk_image_person_idx` ON `Wipsea`.`image` (`created_by` ASC);

CREATE INDEX `fk_image_type_idx` ON `Wipsea`.`image` (`type` ASC);


-- -----------------------------------------------------
-- Table `Wipsea`.`image_queue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Wipsea`.`image_queue` ;

CREATE TABLE IF NOT EXISTS `Wipsea`.`image_queue` (
  `id` INT NOT NULL,
  `image_id` INT UNSIGNED NOT NULL,
  `status` INT NOT NULL DEFAULT 0 COMMENT 'Status of item:' /* comment truncated */ /*0 - waiting to be processed
1 - processing
2 - processed*/,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_queue_image`
    FOREIGN KEY (`image_id`)
    REFERENCES `Wipsea`.`image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Queue to process images.';

USE `testdrive` ;

-- -----------------------------------------------------
-- Table `testdrive`.`tbl_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `testdrive`.`tbl_user` ;

CREATE TABLE IF NOT EXISTS `testdrive`.`tbl_user` (
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
DROP TABLE IF EXISTS `testdrive`.`tbl_post` ;

CREATE TABLE IF NOT EXISTS `testdrive`.`tbl_post` (
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
    REFERENCES `testdrive`.`tbl_user` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE INDEX `FK_post_author` ON `testdrive`.`tbl_post` (`author_id` ASC);


-- -----------------------------------------------------
-- Table `testdrive`.`tbl_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `testdrive`.`tbl_comment` ;

CREATE TABLE IF NOT EXISTS `testdrive`.`tbl_comment` (
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
    REFERENCES `testdrive`.`tbl_post` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE INDEX `FK_comment_post` ON `testdrive`.`tbl_comment` (`post_id` ASC);


-- -----------------------------------------------------
-- Table `testdrive`.`tbl_lookup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `testdrive`.`tbl_lookup` ;

CREATE TABLE IF NOT EXISTS `testdrive`.`tbl_lookup` (
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
DROP TABLE IF EXISTS `testdrive`.`tbl_tag` ;

CREATE TABLE IF NOT EXISTS `testdrive`.`tbl_tag` (
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
