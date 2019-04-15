-- MySQL Script generated by MySQL Workbench
-- Sun 14 Apr 2019 01:58:32 PM MSK
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `library` DEFAULT CHARACTER SET utf8 ;
USE `library` ;

-- -----------------------------------------------------
-- Table `library`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`role` (
  `idrole` INT NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idrole`))
ENGINE = InnoDB;

insert into role (idrole, role_name) values (1,'READER');
insert into role (idrole, role_name) values (2,'LIBRARIAN');
insert into role (idrole, role_name) values (3,'ADMINISTATOR');

-- -----------------------------------------------------
-- Table `library`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `role` INT NOT NULL DEFAULT 1,
  `login` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `role_idx` (`role` ASC),
  CONSTRAINT `role`
    FOREIGN KEY (`role`)
    REFERENCES `library`.`role` (`idrole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`book_state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`book_state` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `book_state_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

insert into book_state (id, book_state_name) values (1,'FREE');
insert into book_state (id, book_state_name) values (2,'ORDERED');
insert into book_state (id, book_state_name) values (3,'ON_HANDS');
-- -----------------------------------------------------
-- Table `library`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`book` (
  `idbook` INT NOT NULL AUTO_INCREMENT,
  `author` VARCHAR(100) NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `book_state_id` INT NOT NULL DEFAULT 1,
  `description` VARCHAR(200) NOT NULL DEFAULT 'no description',
  PRIMARY KEY (`idbook`),
  INDEX `book_state_idx` (`book_state_id` ASC),
  CONSTRAINT `book_state`
    FOREIGN KEY (`book_state_id`)
    REFERENCES `library`.`book_state` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`card` (
  `idhome_card` INT NOT NULL AUTO_INCREMENT,
  `user` INT NOT NULL,
  `book` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `is_return` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idhome_card`),
  INDEX `idreader_idx` (`user` ASC),
  INDEX `book_idx` (`book` ASC),
  CONSTRAINT `reader`
    FOREIGN KEY (`user`)
    REFERENCES `library`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `book`
    FOREIGN KEY (`book`)
    REFERENCES `library`.`book` (`idbook`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;