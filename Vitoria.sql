-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE DATABASE maratona;
USE maratona;

-- -----------------------------------------------------
-- Table mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE usuario (
  idusuario INT NOT NULL,
  nome_pessoa VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  data_cadastro INT NOT NULL,
  senha INT NOT NULL,
  data_nascimento DATE NOT NULL,
  PRIMARY KEY (idusuario),
  


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
INSERT INTO usuario(
  idusuario,
  nome_pessoa,
  email,
  data_cadastro,
  senha,
  data_nascimento

  VALUES (12341484980, 'Vitória Novaes', 'vitorianovaes@gmail.com', 05/02/16, 14/08/04),
         (55457899950, 'Sofia Nascimento', 'sofianascimento@gmail.com', 06/08/19, 22/06/04),
         (10586348956, 'Ana Silva', 'anasilva@gmail.com', 02/02/22, 02/05/04),
         (29705500916, 'Sabrina Hostins', 'sabrinahostins@gmail.com', 05/09/18, 06/07/05),
         (11418350966, 'Milene Deschamps', 'milenedeschamps@gmail.com',28/02/18, 02/07/1999),
         (52456817907, 'Diego Augusto', 'diegoaugusto@gmail.com', 17/03/17, 13/08/02),
         (95099636900, 'Eloá Soares', 'eloasoares@gmail.com', 05/08/16, 02/08/04),
         (07165506950, 'Amélia Batista', 'ameliabatista@gmail.com', 02/09/18, 14/09/05),
         (67576429992, 'Amanda Zuchi', 'amandazuchi@gmail.com', 15/09/16, 09/05/04),
         (49191171911, 'Bernardo Schimitt', 'bernardoschimitt@gmail.com', 19/05/16, 08/08/04)
);

INSERT INTO serie_usuario(
  status_serie,
  nota_usuario

  VALUES ('assisti', 10),
         ('quero assistir', 5),
         ('assisti', 7),
         ('quero assistir', 5),
         ('assisti', 9),
         ('assisti', 5),
         ('quero assistir', 4),
         ('assisti', 8),
         ('quero assistir', 4),
         ('assisti', 10)
);

INSERT INTO series(
  idserie,
  nome_serie,
  descricao

  VALUES (1, 'Gossip Girl', 'Favorita')
         (8, 'Bridgerton', 'Favorita'),
         (2, 'Outer Banks', 'Amei'),
         (5, 'Stranger things', 'Muito boa'),
         (6, 'Coisa mais linda', 'Muito boa'),
         (3, 'Virgin River', 'Amei'),
         (9, 'Maldivas', 'Muito boa') 
         (4, 'Emily in Paris', 'Favorita'),
         (10, 'The 100', ' Muito boa'),
         (7, 'Dark', 'Não gostei')
);

INSERT INTO genero(
  idgenero, 
  nome_genero

  VALUES (1, 'Romance'),
         (7, 'Romance'),
         (9, 'Ficção cientifica'),
         (5, 'Terror'),
         (4, 'Ação'),
         (3, 'Aventura'),
         (2, 'Drama') 
         (6, 'Comédia'),
         (10, 'Aventura'),
         (8, 'terror')
);

INSERT INTO temporada_series(
  idtemporada_series,
  nr_episodios,
  data_lancamento

  VALUES (2, '40', 18/02/18),
         (5, '55', 22/02/19),
         (10, '60', 07/08/12),
         (7, '102', 15/06/19),
         (4, '106', 12/09/17),
         (3, '18', 27/09/16),
         (1, '40', 18/07/19), 
         (6, '11', 18/02/08),
         (9, '27', 17/09/20),
         (8, '30', 14/02/17)


)

INSERT INTO ator(
  idator,
  nome_ator,
  data_nascimento,
  sexo

  VALUES (8, 'Leighton Meester', 09/04/1986, 'Feminino'),
         (6, 'Phoebe Dynevor', 17/04/1995, 'Feminino'), 
         (1, 'Madelyn Cline', 21/12/1997, 'Feminino'),
         (3, 'Millie Bobby Brown', 19/02/04, 'Feminino'),
         (7, 'Maria Casadevall', 24/07/1987, 'Feminino'),
         (2, 'Martin Henderson', 08/10/1974, 'Mascolino'),
         (9, 'Bruna Marquezine', 04/08/1995, 'Feminino'),
         (4, 'Lyli Colins', 18/03/1989, 'Feminino'),
         (5, 'Bob Morley', 20/12/1984, 'Mascolino'),
         (10, 'Louis Hofman', 03/06/1997, 'Mascolino')
);
-- updates
UPDATE usuario SET email = 'camilaandrade@gmail.com' WHERE id usuario LIKE 10586348956;
UPDATE usuario SET email = 'anajulia@gmail.com' WHERE id usuario LIKE 49191171911;
UPDATE usuario SET email = 'rayssa@gmail.com' WHERE id usuario LIKE 67576429992;
UPDATE usuario SET email = 'larissaandrade@gmail.com' WHERE id usuario LIKE 95099636900;
UPDATE usuario SET email = 'lorenzosouza@gmail.com' WHERE id usuario LIKE 11418350966;


UPDATE series SET nome_serie = 'Lúcifer' WHERE idserie LIKE 1;
UPDATE series SET nome_serie = 'PLL' WHERE idserie LIKE 2;
UPDATE series SET nome_serie = 'Sou Luna' WHERE idserie LIKE 3;
UPDATE series SET nome_serie = 'Violeta' WHERE idserie LIKE 5;
UPDATE series SET nome_serie = 'Barbie' WHERE idserie LIKE 6;

UPDATE genero SET nome_genero = 'Romance' WHERE idgenero LIKE 3;
UPDATE genero SET nome_genero = 'Ação' WHERE idgenero LIKE 5;
UPDATE genero SET nome_genero = 'Aventura' WHERE idgenero LIKE 2;
UPDATE genero SET nome_genero = 'Aventura' WHERE idgenero LIKE 1;
UPDATE genero SET nome_genero = 'Terror' WHERE idgenero LIKE 6;

UPDATE temporada_serie SET nr_episodios = '45' WHERE idtemporada_series LIKE 2;
UPDATE temporada_serie SET nr_episodios = '57' WHERE idtemporada_series LIKE 3;
UPDATE temporada_serie SET nr_episodios = '25' WHERE idtemporada_series LIKE 7;
UPDATE temporada_serie SET nr_episodios = '19' WHERE idtemporada_series LIKE 10;
UPDATE temporada_serie SET nr_episodios = '60' WHERE idtemporada_series LIKE 1;

UPDATE ator SET sexo = 'Mascolino' WHERE idator LIKE 8;
UPDATE ator SET sexo = 'Feminino' WHERE idator LIKE 2;
UPDATE ator SET sexo = 'Mascolino' WHERE idator LIKE 4;
UPDATE ator SET sexo = 'Feminino' WHERE idator LIKE 5;
UPDATE ator SET sexo = 'Mascolino' WHERE idator LIKE 1;

-- deletes
DELETE FROM usuario WHERE idusuario = 10586348956;
DELETE FROM usuario WHERE idusuario = 49191171911;
DELETE FROM usuario WHERE idusuario = 67576429992;
DELETE FROM usuario WHERE idusuario = 95099636900;
DELETE FROM usuario WHERE idusuario = 11418350966;

DELETE FROM series WHERE idserie = 1;
DELETE FROM series WHERE idserie = 2;
DELETE FROM series WHERE idserie = 3;
DELETE FROM series WHERE idserie = 5;
DELETE FROM series WHERE idserie = 8;

DELETE FROM genero WHERE idgenero = 2;
DELETE FROM genero WHERE idgenero = 3;
DELETE FROM genero WHERE idgenero = 7;
DELETE FROM genero WHERE idgenero = 8;
DELETE FROM genero WHERE idgenero = 9;

DELETE FROM temporada_serie WHERE idtemporada_serie = 5;
DELETE FROM temporada_serie WHERE idtemporada_serie = 2;
DELETE FROM temporada_serie WHERE idtemporada_serie = 3;
DELETE FROM temporada_serie WHERE idtemporada_serie = 6;
DELETE FROM temporada_serie WHERE idtemporada_serie = 1;

DELETE FROM ator WHERE idator = 8;
DELETE FROM ator WHERE idator = 2;
DELETE FROM ator WHERE idator = 3;
DELETE FROM ator WHERE idator = 9;
DELETE FROM ator WHERE idator = 7;


-- selects
SELECT * FROM usuario ORDER BY ASC;
SELECT * FROM serie_usuario ORDER BY ASC;
SELECT * FROM serie ORDER BY ASC;
SELECT * FROM serie_has_genero ORDER BY ASC;
SELECT * FROM genero ORDER BY ASC;
SELECT * FROM temporada_serie ORDER BY ASC;
SELECT * FROM elenco_serie ORDER BY ASC;
SELECT * FROM ator ORDER BY ASC;

SELECT * FROM usuario WHERE idusuario = 10586348956;
SELECT * FROM series WHERE idserie = 2;
SELECT * FROM genero WHERE idgenero = 5;
SELECT * FROM temporada_serie WHERE idtemporada_serie = 7;
SELECT * FROM ator WHERE idator = 3;

SELECT usuario.idusuario, series.idserie FROM usuario RIGHT JOIN series ON usuario.idusuario * series.idseries;
SELECT series.idseries, autor.idautor FROM series RIGHT JOIN autor ON series.idseries * autor.idautor;
SELECT autor.idautor, temporada_serie.idtemporada_serie FROM autor ON autor.idautor * temporada_serie.idtemporada_serie;
SELECT temporada_serie.idtemporada_serie, genero.idgenero FROM temporada_serie RIGHT JOIN genero ON temporada_serie.idtemporada_serie * genero.idgenero;
SELECT genero.idgenero, series.idserie FROM genero RIGHT JOIN series ON genero.idgenero * series.idserie;
DROP DATABASE maratona;