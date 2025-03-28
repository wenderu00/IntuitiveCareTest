-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`modalidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`modalidade` ;

CREATE TABLE IF NOT EXISTS `mydb`.`modalidade` (
  `nome_modalidade` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`nome_modalidade`),
  UNIQUE INDEX `idmodalidade_UNIQUE` (`nome_modalidade` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cargo_representante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`cargo_representante` ;

CREATE TABLE IF NOT EXISTS `mydb`.`cargo_representante` (
  `cargo_representante` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`cargo_representante`),
  UNIQUE INDEX `cargo_representante_UNIQUE` (`cargo_representante` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`regiao_de_comercializacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`regiao_de_comercializacao` ;

CREATE TABLE IF NOT EXISTS `mydb`.`regiao_de_comercializacao` (
  `idregiao_de_comercializacao` INT NOT NULL,
  PRIMARY KEY (`idregiao_de_comercializacao`),
  UNIQUE INDEX `idregiao_de_comercializacao_UNIQUE` (`idregiao_de_comercializacao` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`operadora`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`operadora` ;

CREATE TABLE IF NOT EXISTS `mydb`.`operadora` (
  `registro_ans` VARCHAR(255) NOT NULL,
  `cnpj` VARCHAR(255) NOT NULL,
  `razao_social` VARCHAR(255) NULL,
  `nome_fantasia` VARCHAR(255) NULL,
  `logradouro` VARCHAR(255) NULL,
  `numero` VARCHAR(255) NULL,
  `complemento` VARCHAR(255) NULL,
  `bairro` VARCHAR(255) NULL,
  `cidade` VARCHAR(255) NULL,
  `uf` VARCHAR(255) NULL,
  `cep` VARCHAR(255) NULL,
  `ddd` VARCHAR(255) NULL,
  `telefone` VARCHAR(255) NULL,
  `fax` VARCHAR(255) NULL,
  `endereco_eletronico` VARCHAR(255) NULL,
  `representante` VARCHAR(255) NULL,
  `modalidade_nome_modalidade` VARCHAR(255) NOT NULL,
  `cargo_representante_cargo_representante` VARCHAR(255) NOT NULL,
  `regiao_de_comercializacao_idregiao_de_comercializacao` INT NOT NULL,
  `data_registro_ans` DATE NULL,
  PRIMARY KEY (`registro_ans`, `modalidade_nome_modalidade`, `cargo_representante_cargo_representante`, `regiao_de_comercializacao_idregiao_de_comercializacao`),
  UNIQUE INDEX `registro_ans_UNIQUE` (`registro_ans` ASC) VISIBLE,
  INDEX `fk_operadora_modalidade_idx` (`modalidade_nome_modalidade` ASC) VISIBLE,
  INDEX `fk_operadora_cargo_representante1_idx` (`cargo_representante_cargo_representante` ASC) VISIBLE,
  INDEX `fk_operadora_regiao_de_comercializacao1_idx` (`regiao_de_comercializacao_idregiao_de_comercializacao` ASC) VISIBLE,
  CONSTRAINT `fk_operadora_modalidade`
    FOREIGN KEY (`modalidade_nome_modalidade`)
    REFERENCES `mydb`.`modalidade` (`nome_modalidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_operadora_cargo_representante1`
    FOREIGN KEY (`cargo_representante_cargo_representante`)
    REFERENCES `mydb`.`cargo_representante` (`cargo_representante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_operadora_regiao_de_comercializacao1`
    FOREIGN KEY (`regiao_de_comercializacao_idregiao_de_comercializacao`)
    REFERENCES `mydb`.`regiao_de_comercializacao` (`idregiao_de_comercializacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`conta_contabil_descricao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`conta_contabil_descricao` ;

CREATE TABLE IF NOT EXISTS `mydb`.`conta_contabil_descricao` (
  `conta_contabil_descricao` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`conta_contabil_descricao`),
  UNIQUE INDEX `conta_contabil_descricao_UNIQUE` (`conta_contabil_descricao` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`conta_contabil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`conta_contabil` ;

CREATE TABLE IF NOT EXISTS `mydb`.`conta_contabil` (
  `cad_conta_contabil` INT NOT NULL,
  `operadora_registro_ans` VARCHAR(255) NOT NULL,
  `operadora_modalidade_nome_modalidade` VARCHAR(255) NOT NULL,
  `operadora_cargo_representante_cargo_representante` VARCHAR(255) NOT NULL,
  `operadora_regiao_de_comercializacao_idregiao_de_comercializacao` INT NOT NULL,
  `conta_contabil_descricao_conta_contabil_descricao` VARCHAR(255) NOT NULL,
  `valor_saldo_inicial` DOUBLE NULL,
  `valor_saldo_final` DOUBLE NULL,
  PRIMARY KEY (`cad_conta_contabil`, `conta_contabil_descricao_conta_contabil_descricao`),
  UNIQUE INDEX `idconta_contabil_UNIQUE` (`cad_conta_contabil` ASC) VISIBLE,
  INDEX `fk_conta_contabil_operadora1_idx` (`operadora_registro_ans` ASC, `operadora_modalidade_nome_modalidade` ASC, `operadora_cargo_representante_cargo_representante` ASC, `operadora_regiao_de_comercializacao_idregiao_de_comercializacao` ASC) VISIBLE,
  INDEX `fk_conta_contabil_conta_contabil_descricao1_idx` (`conta_contabil_descricao_conta_contabil_descricao` ASC) VISIBLE,
  CONSTRAINT `fk_conta_contabil_operadora1`
    FOREIGN KEY (`operadora_registro_ans` , `operadora_modalidade_nome_modalidade` , `operadora_cargo_representante_cargo_representante` , `operadora_regiao_de_comercializacao_idregiao_de_comercializacao`)
    REFERENCES `mydb`.`operadora` (`registro_ans` , `modalidade_nome_modalidade` , `cargo_representante_cargo_representante` , `regiao_de_comercializacao_idregiao_de_comercializacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conta_contabil_conta_contabil_descricao1`
    FOREIGN KEY (`conta_contabil_descricao_conta_contabil_descricao`)
    REFERENCES `mydb`.`conta_contabil_descricao` (`conta_contabil_descricao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
