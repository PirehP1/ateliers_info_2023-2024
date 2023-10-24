-- -----------------------------------------------------
-- Schema docs_diplo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `docs_diplo` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `docs_diplo` ;

-- -----------------------------------------------------
-- Table `docs_diplo`.`actes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `docs_diplo`.`actes` (
  `idactes` INT NOT NULL auto_increment,
  `cote` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  `date` DATE NULL,
  `institution` VARCHAR(60) NULL,
  `série` VARCHAR(60) NULL,
  `registre` VARCHAR(45) NULL,
  `titre` VARCHAR(120) NULL,
  `dossier` VARCHAR(45) NULL,
  PRIMARY KEY (`idactes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `docs_diplo`.`acteurs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `docs_diplo`.`acteurs` (
  `idacteurs` INT NOT NULL auto_increment,
  `label` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  `statut_social` VARCHAR(45) NULL,
  `orig_spatiale` VARCHAR(45) NULL,
  PRIMARY KEY (`idacteurs`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `docs_diplo`.`mentions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `docs_diplo`.`mentions` (
  `idmentions` INT NOT NULL auto_increment,
  `statut_mention` VARCHAR(100) NULL,
  `idactes_mentions` INT NOT NULL,
  `idacteurs_mentions` INT NOT NULL,
  PRIMARY KEY (`idmentions`),
  CONSTRAINT `idactes_mentions`
    FOREIGN KEY (`idactes_mentions`)
    REFERENCES `docs_diplo`.`actes` (`idactes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idacteurs_mentions`
    FOREIGN KEY (`idacteurs_mentions`)
    REFERENCES `docs_diplo`.`acteurs` (`idacteurs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
