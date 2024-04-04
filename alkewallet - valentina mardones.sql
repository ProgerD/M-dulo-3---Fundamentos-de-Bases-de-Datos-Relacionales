/*Creación de la BD*/
CREATE SCHEMA `alkewallet` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;

/*Creación de tabla "usuario*/
CREATE TABLE `alkewallet`.`usuario` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `passwrd` VARCHAR(45) NOT NULL,
  `saldo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
CHARACTER SET = utf8 ,
COLLATE = utf8_spanish_ci ;

/*Creación de la tabla "transaccion" */
CREATE TABLE `alkewallet`.`transaccion` (
  `transaction_id` INT NOT NULL AUTO_INCREMENT,
  `sender_user_id` INT NOT NULL,
  `receiver_user_id` INT NOT NULL,
  `importe` VARCHAR(45) NOT NULL,
  `transaction_date` DATE NOT NULL,
  PRIMARY KEY (`transaction_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;

/* Creación de FK */
ALTER TABLE `alkewallet`.`transaccion` 
ADD CONSTRAINT `sender_user_id`
  FOREIGN KEY (`sender_user_id`)
  REFERENCES `alkewallet`.`usuario` (`user_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `receiver_user_id`
  FOREIGN KEY (`receiver_user_id`)
  REFERENCES `alkewallet`.`usuario` (`user_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

/*Creación de tabla "moneda" */
CREATE TABLE `alkewallet`.`moneda` (
  `currency_id` INT NOT NULL AUTO_INCREMENT,
  `currency_name` VARCHAR(45) NOT NULL,
  `currency_symbol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`currency_id`))
ENGINE = InnoDB
CHARACTER SET = utf8 ,
COLLATE = utf8_spanish_ci ;

/*Población de tabla "usuario" */
INSERT INTO `alkewallet`.`usuario` (nombre, correo, passwrd, saldo) VALUES ('Pitita Pipú', 'pitita@gmail.com', '0303456','1000000');
INSERT INTO `alkewallet`.`usuario` (nombre, correo, passwrd, saldo) VALUES ('Alma Pelula', 'alma@gmail.com', '123456','800000');
INSERT INTO `alkewallet`.`usuario` (nombre, correo, passwrd, saldo) VALUES ('Nami Locura', 'nami@gmail.com', '666666','666000');
INSERT INTO `alkewallet`.`usuario` (nombre, correo, passwrd, saldo) VALUES ('Lulu Perlita', 'lulu@gmail.com', '897852','85000');
INSERT INTO `alkewallet`.`usuario` (nombre, correo, passwrd, saldo) VALUES ('Pitu Pituta', 'pitu@gmail.com', '0303456','657366');

SELECT * FROM alkewallet.usuario;

/*Población de tabla "transaccion" */
INSERT INTO `alkewallet`.`transaccion` (sender_user_id, receiver_user_id, importe, transaction_date) VALUES ('1', '1', '10000', '2023-12-15');
INSERT INTO `alkewallet`.`transaccion` (sender_user_id, receiver_user_id, importe, transaction_date) VALUES ('2', '4', '680000', '2024-02-17');
INSERT INTO `alkewallet`.`transaccion` (sender_user_id, receiver_user_id, importe, transaction_date) VALUES ('3', '5', '67000', '2023-03-28');
SELECT * FROM alkewallet.transaccion;

/*Población de tabla "moneda" */
INSERT INTO `alkewallet`.`moneda` (currency_name, currency_symbol) VALUES ('Dolar', 'US$');
INSERT INTO `alkewallet`.`moneda` (currency_name, currency_symbol) VALUES ('Euro', '€');
INSERT INTO `alkewallet`.`moneda` (currency_name, currency_symbol) VALUES ('CLP', '$');
SELECT * FROM alkewallet.moneda;


/*CONSULTAS SQL*/

/*1. Consulta para obtener el nombre de la moneda elegida por un usuario específico (usuario = 3)*/
USE alkewallet;

SELECT moneda.currency_name, moneda.currency_symbol, usuario.user_id
FROM moneda
INNER JOIN usuario ON moneda.currency_id = usuarios.user_id
WHERE user_id = 3;

/*2. Consulta para obtener todas las transacciones registradas*/
USE alkewallet;
SELECT * FROM transaccion;

/*3. Consulta para obtener todas las transacciones realizadas por un usuario específico (usuario = 4)*/
USE alkewallet;

SELECT transaccion.transaction_id, transaccion.importe, transaccion.transaction_date,
usuario.nombre, usuario.user_id
FROM transaccion
INNER JOIN usuario ON transaccion.transaction_id = usuario.user_id
WHERE user_id = 4;

/* 4. Sentencia DML para modificar el campo correo electrónico de un usuario específico (usuario = 1)*/
USE alkewallet;
SELECT * FROM usuario;

UPDATE usuario
SET email ='pititanuevo@gmail.com'
WHERE user_id=1;

SELECT * FROM usuario;

/*5. Sentencia para eliminar los datos de una transacción (eliminado de la fila completa)*/

DELETE FROM transaccion
WHERE transaction_id = 2;

SELECT * FROM transaccion;