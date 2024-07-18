-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- DROP DATABASE Ultimo_a_Saber;

-- -----------------------------------------------------
-- Schema Ultimo_a_Saber
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ultimo_a_Saber
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ultimo_a_Saber` DEFAULT CHARACTER SET utf8 ;
USE `Ultimo_a_Saber` ;

-- -----------------------------------------------------
-- Table `Ultimo_a_Saber`.`Diretor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimo_a_Saber`.`Diretor` (
  `idDiretor` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(75) NOT NULL,
  `DataNascimento` DATE NOT NULL,
  `DataAdmissao` DATE NOT NULL,
  PRIMARY KEY (`idDiretor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ultimo_a_Saber`.`Detetives`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimo_a_Saber`.`Detetives` (
  `idDetetives` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(75) NOT NULL,
  `DataNascimento` DATE NOT NULL,
  `CasosBemSucedidos` INT NOT NULL,
  `NomeCodigo` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`idDetetives`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ultimo_a_Saber`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimo_a_Saber`.`Clientes` (
  `idClientes` INT NOT NULL AUTO_INCREMENT,
  `Genero` CHAR(1) NOT NULL,
  `DataNascimento` DATE NOT NULL,
  `NIF` CHAR(9) NOT NULL,
  `Nome` VARCHAR(75) NOT NULL,
  `Morada` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ultimo_a_Saber`.`Investigacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimo_a_Saber`.`Investigacoes` (
  `idInvestigacoes` INT NOT NULL AUTO_INCREMENT,
  `Despesas` DECIMAL(9,2) NOT NULL,
  `Orcamento` DECIMAL(9,2) NOT NULL,
  `Descricao` VARCHAR(350) NOT NULL,
  `Clientes_idClientes` INT NOT NULL,
  `Diretor_idDiretor` INT NOT NULL,
  `DataInicio` DATE NOT NULL,
  `DataConclusao` DATE NULL,
  `Concluida` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idInvestigacoes`),
  INDEX `fk_Investigações_Clientes1_idx` (`Clientes_idClientes` ASC) VISIBLE,
  INDEX `fk_Investigações_Diretor1_idx` (`Diretor_idDiretor` ASC) VISIBLE,
  CONSTRAINT `fk_Investigações_Clientes1`
    FOREIGN KEY (`Clientes_idClientes`)
    REFERENCES `Ultimo_a_Saber`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Investigações_Diretor1`
    FOREIGN KEY (`Diretor_idDiretor`)
    REFERENCES `Ultimo_a_Saber`.`Diretor` (`idDiretor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Ultimo_a_Saber`.`Provas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimo_a_Saber`.`Provas` (
  `idProvas` INT NOT NULL AUTO_INCREMENT,
  `DataRecolha` DATE NOT NULL,
  `Descricao` VARCHAR(500) NOT NULL,
  `Investigacoes_idInvestigacoes` INT NOT NULL,
  PRIMARY KEY (`idProvas`),
  INDEX `fk_Provas_Investigações1_idx` (`Investigacoes_idInvestigacoes` ASC) VISIBLE,
  CONSTRAINT `fk_Provas_Investigações1`
    FOREIGN KEY (`Investigacoes_idInvestigacoes`)
    REFERENCES `Ultimo_a_Saber`.`Investigacoes` (`idInvestigacoes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ultimo_a_Saber`.`ContactoDetetive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimo_a_Saber`.`ContactoDetetive` (
  `Email` VARCHAR(150) NULL,
  `Telefone` CHAR(12) NULL,
  `Detetives_idDetetives` INT NOT NULL,
  PRIMARY KEY (`Detetives_idDetetives`),
  INDEX `fk_ContactoDetetive_Detetives1_idx` (`Detetives_idDetetives` ASC) VISIBLE,
  CONSTRAINT `fk_ContactoDetetive_Detetives1`
    FOREIGN KEY (`Detetives_idDetetives`)
    REFERENCES `Ultimo_a_Saber`.`Detetives` (`idDetetives`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Ultimo_a_Saber`.`ContactoDiretor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimo_a_Saber`.`ContactoDiretor` (
  `Email` VARCHAR(150) NULL,
  `Telefone` CHAR(12) NULL,
  `Diretor_idDiretor` INT NOT NULL,
  PRIMARY KEY (`Diretor_idDiretor`),
  INDEX `fk_ContactoDiretor_Diretor1_idx` (`Diretor_idDiretor` ASC) VISIBLE,
  CONSTRAINT `fk_ContactoDiretor_Diretor1`
    FOREIGN KEY (`Diretor_idDiretor`)
    REFERENCES `Ultimo_a_Saber`.`Diretor` (`idDiretor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Ultimo_a_Saber`.`ContactoCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimo_a_Saber`.`ContactoCliente` (
  `Email` VARCHAR(150) NULL,
  `Telefone` CHAR(12) NULL,
  `Clientes_idClientes` INT NOT NULL,
  PRIMARY KEY (`Clientes_idClientes`),
  INDEX `fk_ContactoCliente_Clientes_idx` (`Clientes_idClientes` ASC) VISIBLE,
  CONSTRAINT `fk_ContactoCliente_Clientes`
    FOREIGN KEY (`Clientes_idClientes`)
    REFERENCES `Ultimo_a_Saber`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Ultimo_a_Saber`.`Visual`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimo_a_Saber`.`Visual` (
  `LocalRecolha` VARCHAR(100) NOT NULL,
  `Provas_idProvas` INT NOT NULL,
  PRIMARY KEY (`Provas_idProvas`),
  CONSTRAINT `fk_Visual_Provas1`
    FOREIGN KEY (`Provas_idProvas`)
    REFERENCES `Ultimo_a_Saber`.`Provas` (`idProvas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Ultimo_a_Saber`.`Fisica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimo_a_Saber`.`Fisica` (
  `LocalRecolha` VARCHAR(100) NOT NULL,
  `Provas_idProvas` INT NOT NULL,
  PRIMARY KEY (`Provas_idProvas`),
  CONSTRAINT `fk_Fisica_Provas1`
    FOREIGN KEY (`Provas_idProvas`)
    REFERENCES `Ultimo_a_Saber`.`Provas` (`idProvas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Ultimo_a_Saber`.`Audio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimo_a_Saber`.`Audio` (
  `Provas_idProvas` INT NOT NULL,
  PRIMARY KEY (`Provas_idProvas`),
  CONSTRAINT `fk_Audio_Provas1`
    FOREIGN KEY (`Provas_idProvas`)
    REFERENCES `Ultimo_a_Saber`.`Provas` (`idProvas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Ultimo_a_Saber`.`TestemunhaAudio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimo_a_Saber`.`TestemunhaAudio` (
  `Nome` VARCHAR(75) NOT NULL,
  `Telefone` CHAR(12) NOT NULL,
  `Audio_Provas_idProvas` INT NOT NULL,
  PRIMARY KEY (`Audio_Provas_idProvas`),
  CONSTRAINT `fk_Testemunha_Audio1`
    FOREIGN KEY (`Audio_Provas_idProvas`)
    REFERENCES `Ultimo_a_Saber`.`Audio` (`Provas_idProvas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Ultimo_a_Saber`.`TestemunhaVisual`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimo_a_Saber`.`TestemunhaVisual` (
  `Nome` VARCHAR(75) NOT NULL,
  `Telefone` CHAR(12) NOT NULL,
  `Visual_Provas_idProvas` INT NOT NULL,
  PRIMARY KEY (`Visual_Provas_idProvas`),
  CONSTRAINT `fk_TestemunhaVisual_Visual1`
    FOREIGN KEY (`Visual_Provas_idProvas`)
    REFERENCES `Ultimo_a_Saber`.`Visual` (`Provas_idProvas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Ultimo_a_Saber`.`realiza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ultimo_a_Saber`.`realiza` (
  `dataAlocacao` DATE NOT NULL,
  `Investigacoes_idInvestigacoes` INT NOT NULL,
  `Detetives_idDetetives` INT NOT NULL,
  `dataRemocao` DATE NULL,
  PRIMARY KEY (`Investigacoes_idInvestigacoes`, `Detetives_idDetetives`),
  INDEX `fk_realiza2_Detetives1_idx` (`Detetives_idDetetives` ASC) VISIBLE,
  INDEX `fk_realiza2_Investigacoes1_idx` (`Investigacoes_idInvestigacoes` ASC) VISIBLE,
  CONSTRAINT `fk_realiza2_Investigações1`
    FOREIGN KEY (`Investigacoes_idInvestigacoes`)
    REFERENCES `Ultimo_a_Saber`.`Investigacoes` (`idInvestigacoes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_realiza2_Detetives1`
    FOREIGN KEY (`Detetives_idDetetives`)
    REFERENCES `Ultimo_a_Saber`.`Detetives` (`idDetetives`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
