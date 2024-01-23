-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema intelbras
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema intelbras
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `intelbras` DEFAULT CHARACTER SET utf8 ;
USE `intelbras` ;

-- -----------------------------------------------------
-- Table `intelbras`.`segment_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `intelbras`.`segment_type` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `segment_name` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  `active` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `intelbras`.`component_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `intelbras`.`component_group` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  `active` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `intelbras`.`component`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `intelbras`.`component` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `component_group_id` INT UNSIGNED NOT NULL,
  `segment_type_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(100) NULL,
  `gtin` VARCHAR(100) NULL,
  `component_code` VARCHAR(100) NULL,
  `height` VARCHAR(45) NULL,
  `width` VARCHAR(45) NULL,
  `depth` VARCHAR(45) NULL,
  `gross_weight` VARCHAR(45) NULL,
  `net_weight` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  `active` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  INDEX `fk_component_segment_type_idx` (`segment_type_id` ASC) VISIBLE,
  INDEX `fk_component_component_group1_idx` (`component_group_id` ASC) VISIBLE,
  CONSTRAINT `fk_component_segment_type`
    FOREIGN KEY (`segment_type_id`)
    REFERENCES `intelbras`.`segment_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_component_component_group1`
    FOREIGN KEY (`component_group_id`)
    REFERENCES `intelbras`.`component_group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `intelbras`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `intelbras`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NULL,
  `username` VARCHAR(100) NULL,
  `pwd` VARCHAR(455) NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  `active` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `intelbras`.`token`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `intelbras`.`token` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `hash` VARCHAR(450) NULL,
  `username` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
