-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE DATABASE maratona;
USE maratona;

-- -----------------------------------------------------
-- Table mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE usuario (
  idusuario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_pessoa VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  data_cadastro DATETIME NOT NULL,
  senha INT NOT NULL,
  data_nascimento DATE NOT NULL
  );
  


-- -----------------------------------------------------
-- Table mydb`.`ator`
-- -----------------------------------------------------
CREATE TABLE ator (
  idator INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_ator VARCHAR(45) NOT NULL,
  data_nascimento_ator DATETIME NOT NULL,
  sexo VARCHAR(45) NOT NULL
 );
-- -----------------------------------------------------
-- Table mydb.series
-- -----------------------------------------------------
CREATE TABLE  series (
  idseries INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_serie VARCHAR(45) NOT NULL,
  descricao VARCHAR(255) NOT NULL
  );

-- -----------------------------------------------------
-- Table mydb.serie_usuario
-- -----------------------------------------------------
CREATE TABLE serie_usuario (
  usario_idusuario INT NOT NULL,
  series_idseries INT NOT NULL,
  status INT NOT NULL,
  nota_usuario INT NOT NULL
  );


-- -----------------------------------------------------
-- Table mydb.temporada_series
-- -----------------------------------------------------
CREATE TABLE temporada_series (
  idtemporada_series INT NOT NULL,
  nr_episodios INT NOT NULL,
  data_lancamento DATE NOT NULL,
  series_idseries INT NOT NULL
 );


-- -----------------------------------------------------
-- Table mydb.elenco_serie
-- -----------------------------------------------------
CREATE TABLE  elenco_serie (
  temporada_series_idtemporada_series INT NOT NULL,
  ator_idator INT NOT NULL,
  PRIMARY KEY (temporada_series_idtemporada_series, ator_idator)
  );


-- -----------------------------------------------------
-- Table mydb.genero
-- -----------------------------------------------------
CREATE TABLE genero (
  idgenero INT NOT NULL  PRIMARY KEY AUTO_INCREMENT,
  nome_genero VARCHAR(45) NOT NULL
);


-- -----------------------------------------------------
-- Table mydb.series_has_genero
-- -----------------------------------------------------
CREATE TABLE series_has_genero (
  series_idseries INT NOT NULL,
  genero_idgenero INT NOT NULL
  );

-- inserts

INSERT INTO usuario(
   nome_pessoa,
  email,
  data_cadastro,
  senha,
  data_nascimento
)
  VALUES ('Vitória Novaes', 'vitorianovaes@gmail.com', '2016-08-06', '1526', '2004-08-14'),
         ('Sofia Nascimento', 'sofianascimento@gmail.com', '2016-08-19', '2151', '2009-06-04'),
         ('Ana Silva', 'anasilva@gmail.com', '2017-02-22', '2156', '2002-05-04'),
         ('Sabrina Hostins', 'sabrinahostins@gmail.com', '2014-09-18', '5421', '2006-07-05'),
         ('Milene Deschamps', 'milenedeschamps@gmail.com', '2015-02-18', '1548', '2002-07-19'),
         ('Diego Augusto', 'diegoaugusto@gmail.com', '2017-03-17', '3254', '2006-08-02'),
         ('Eloá Soares', 'eloasoares@gmail.com', '2015-08-16', '787', '2002-08-04'),
         ('Amélia Batista', 'ameliabatista@gmail.com', '2016-09-18', '7625','2004-09-05'),
         ('Amanda Zuchi', 'amandazuchi@gmail.com', '2015-09-16', '5487', '2009-05-04'),
         ('Bernardo Schimitt', 'bernardoschimitt@gmail.com', '2019-05-16', '4554', '2008-08-04')
;

INSERT INTO series(
  nome_serie,
  descricao
)
  VALUES ('Gossip Girl', 'Favorita'),
         ('Bridgerton', 'Favorita'),
         ('Outer Banks', 'Amei'),
         ('Stranger things', 'Muito boa'),
         ('Coisa mais linda', 'Muito boa'),
         ('Virgin River', 'Amei'),
         ('Maldivas', 'Muito boa'),
         ('Emily in Paris', 'Favorita'),
         ('The 100', ' Muito boa'),
         ('Dark', 'Não gostei')
;

INSERT INTO genero(
  nome_genero
)
  VALUES ('Romance'),
         ('Romance'),
         ('Ficção cientifica'),
         ('Terror'),
         ('Ação'),
         ('Aventura'),
         ('Drama'), 
         ('Comédia'),
         ('Aventura'),
         ('terror');

INSERT INTO ator(
  nome_ator,
  data_nascimento_ator,
  sexo
)
  VALUES ('Leighton Meester', '1986-04-14', 'Feminino'),
         ('Phoebe Dynevor', '1995-04-17', 'Feminino'), 
         ('Madelyn Cline', '1997-12-14', 'Feminino'),
         ('Millie Bobby Brown', '2004-02-04', 'Feminino'),
         ('Maria Casadevall', '1987-07-19', 'Feminino'),
         ('Martin Henderson', '1974-10-07', 'Mascolino'),
         ('Bruna Marquezine', '1995-08-19', 'Feminino'),
         ('Lyli Colins', '1989-03-17', 'Feminino'),
         ('Bob Morley', '1940-12-04', 'Mascolino'),
         ('Louis Hofman', '1997-06-07', 'Mascolino')
;
-- updates
UPDATE usuario SET email = 'camilaandrade@gmail.com' WHERE idusuario = 1;
UPDATE usuario SET email = 'anajulia@gmail.com' WHERE idusuario LIKE 491911;
UPDATE usuario SET email = 'rayssa@gmail.com' WHERE idusuario LIKE 67576429992;
UPDATE usuario SET email = 'larissaandrade@gmail.com' WHERE idusuario LIKE 950996;
UPDATE usuario SET email = 'lorenzosouza@gmail.com' WHERE idusuario LIKE 114183;


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
DELETE FROM usuario WHERE idusuario = 105863;
DELETE FROM usuario WHERE idusuario = 491911;
DELETE FROM usuario WHERE idusuario = 675764;
DELETE FROM usuario WHERE idusuario = 950996;
DELETE FROM usuario WHERE idusuario = 114183;

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
SELECT * FROM usuario ORDER BY idusuario;
SELECT * FROM serie ORDER BY idserie;
SELECT * FROM genero ORDER BY idgenero;
SELECT * FROM temporada_serie ORDER BY idtemporada_serie;
SELECT * FROM ator ORDER BY idator;

SELECT * FROM usuario WHERE idusuario = 105863;
SELECT * FROM series WHERE idserie = 2;
SELECT * FROM genero WHERE idgenero = 5;
SELECT * FROM temporada_serie WHERE idtemporada_serie = 7;
SELECT * FROM ator WHERE idator = 3;

SELECT usuario.idusuario, series.idserie FROM usuario RIGHT JOIN series ON usuario.idusuario = series.idseries;
SELECT series.idseries, autor.idautor FROM series RIGHT JOIN autor ON series.idseries = autor.idautor;
SELECT autor.idautor, temporada_serie.idtemporada_serie FROM autor RIGHT JOIN temporada_serie ON autor.idautor = temporada_serie.idtemporada_serie;
SELECT temporada_serie.idtemporada_serie, genero.idgenero FROM temporada_serie RIGHT JOIN genero ON temporada_serie.idtemporada_serie = genero.idgenero;
SELECT genero.idgenero, series.idserie FROM genero RIGHT JOIN series ON genero.idgenero = series.idserie;

-- DROP DATABASE maratona;