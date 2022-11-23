-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE DATABASE maratona;
USE maratona;

-- -----------------------------------------------------
-- Table mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE 'usuario' (
  idusuario INT NOT NULL,
  nome_pessoa VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  data_cadastro INT NOT NULL,
  senha INT NOT NULL,
  data_nascimento DATE NOT NULL,
  PRIMARY KEY (`idusuario`),
  


-- -----------------------------------------------------
-- Table mydb`.`ator`
-- -----------------------------------------------------
CREATE TABLE ator (
  idator INT NOT NULL,
  nome_ator VARCHAR(45) NOT NULL,
  data_nascimento_ator DATE NOT NULL,
  sexo VARCHAR(45) NOT NULL,
  PRIMARY KEY (idator))



-- -----------------------------------------------------
-- Table mydb.series
-- -----------------------------------------------------
CREATE TABLE  series (
  idseries INT NOT NULL,
  nome_serie VARCHAR(45) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  PRIMARY KEY (idseries),
  



-- -----------------------------------------------------
-- Table mydb.serie_usuario
-- -----------------------------------------------------
CREATE TABLE serie_usuario (
  usario_idusuario INT NOT NULL,
  series_idseries INT NOT NULL,
  status INT NOT NULL,
  nota_usuario INT NOT NULL,
  PRIMARY KEY (usario_idusuario, series_idseries),
  INDEX fk_tusario_has_tseries_tseries1_idx (series_idseries ASC) VISIBLE,
  INDEX fk_tusario_has_tseries_tusario1_idx (usario_idusuario ASC) VISIBLE,
  CONSTRAINT fk_tusario_has_tseries_tusario1
    FOREIGN KEY (usario_idusuario)
    REFERENCES mydb.usuario (idusuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_tusario_has_tseries_tseries1
    FOREIGN KEY (series_idseries)
    REFERENCES mydb.series (idseries)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- -----------------------------------------------------
-- Table mydb.temporada_series
-- -----------------------------------------------------
CREATE TABLE temporada_series (
  idtemporada_series INT NOT NULL,
  nr_episodios INT NOT NULL,
  data_lancamento DATE NOT NULL,
  series_idseries INT NOT NULL,
  PRIMARY KEY (idtemporada_series, series_idseries),
  INDEX fk_temporada_series_series1_idx (series_idseries ASC) VISIBLE,
  CONSTRAINT fk_temporada_series_series1
    FOREIGN KEY (series_idseries)
    REFERENCES mydb.series (idseries)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- -----------------------------------------------------
-- Table mydb.elenco_serie
-- -----------------------------------------------------
CREATE TABLE  elenco_serie (
  temporada_series_idtemporada_series INT NOT NULL,
  ator_idator INT NOT NULL,
  PRIMARY KEY (temporada_series_idtemporada_series, ator_idator),
  INDEX fk_temporada_series_has_ator_ator1_idx (ator_idator ASC) VISIBLE,
  INDEX fk_temporada_series_has_ator_temporada_series1_idx (temporada_series_idtemporada_series ASC) VISIBLE,
  CONSTRAINT fk_temporada_series_has_ator_temporada_series1
    FOREIGN KEY (temporada_series_idtemporada_series)
    REFERENCES mydb.temporada_series (idtemporada_series)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_temporada_series_has_ator_ator1
    FOREIGN KEY (ator_idator)
    REFERENCES mydb.ator (idator)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Table mydb.genero
-- -----------------------------------------------------
CREATE TABLE genero (
  idgenero INT NOT NULL,
  nome_genero VARCHAR(45) NOT NULL,
  PRIMARY KEY (idgenero),
  



-- -----------------------------------------------------
-- Table mydb.series_has_genero
-- -----------------------------------------------------
CREATE TABLE series_has_genero (
  series_idseries INT NOT NULL,
  genero_idgenero INT NOT NULL,
  PRIMARY KEY (series_idseries, genero_idgenero),
  INDEX fk_series_has_genero_genero1_idx (genero_idgenero ASC) VISIBLE,
  INDEX fk_series_has_genero_series1_idx (series_idseries ASC) VISIBLE,
  CONSTRAINT fk_series_has_genero_series1
    FOREIGN KEY (series_idseries)
    REFERENCES mydb.series (idseries)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_series_has_genero_genero1
    FOREIGN KEY (genero_idgenero)
    REFERENCES mydb.genero (idgenero)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- inserts

-- updates


-- deletes

-- selects
SELECT * FROM usuario ORDER BY ASC;
SELECT * FROM serie_usuario ORDER BY ASC;
SELECT * FROM serie ORDER BY ASC;
SELECT * FROM serie_has_genero ORDER BY ASC;
SELECT * FROM genero ORDER BY ASC;
SELECT * FROM temporada_serie ORDER BY ASC;
SELECT * FROM elenco_serie ORDER BY ASC;
SELECT * FROM ator ORDER BY ASC;

DROP DATABASE maratona;