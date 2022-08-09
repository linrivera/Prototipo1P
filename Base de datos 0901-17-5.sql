CREATE DATABASE sic;
USE sic;

CREATE TABLE IF NOT EXISTS `SIC`.`tbl_linea` (
 `PK_codigo_linea` INT NOT NULL,
   `nombre_linea` VARCHAR(35) NOT NULL,
  `estatus_linea` TINYINT(2) NOT NULL,
  PRIMARY KEY (`PK_codigo_linea`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `SIC`.`tbl_marca` (
 `PK_codigo_marca` INT NOT NULL,
   `nombre_marca` VARCHAR(35) NOT NULL,
  `estatus_marca` TINYINT(2) NOT NULL,
  PRIMARY KEY (`PK_codigo_marca`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `SIC`.`tbl_bodega` (
 `PK_codigo_bodega` INT NOT NULL,
   `nombre_bodega` VARCHAR(35) NOT NULL,
  `estatus_bodega` TINYINT(2) NOT NULL,
  PRIMARY KEY (`PK_codigo_bodega`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `SIC`.`tbl_unidad` (
 `PK_codigo_unidad` INT NOT NULL,
   `unidad_entrada` VARCHAR(35) NOT NULL,
  `unidad_salida` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`PK_codigo_unidad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `SIC`.`tbl_producto` (
 `PK_codigo_producto` INT NOT NULL,
   `nombre_producto` VARCHAR(35) NOT NULL,
  `descripcion_producto` VARCHAR(35) NOT NULL,
  `precio_producto` INT(10) NOT NULL,
  `costo_producto` INT (10) NOT NULL,
  `estatus_producto` TINYINT(2) NOT NULL,
  `codigo_linea` INT NOT NULL,
  `codigo_marca` INT NOT NULL,
  `codigo_bodega` INT NOT NULL,
  `codigo_unidad` INT NOT NULL,
  
  PRIMARY KEY (
  `PK_codigo_producto`,
  `codigo_linea`,
  `codigo_marca`,
  `codigo_bodega`,
  `codigo_unidad`
),
  CONSTRAINT `fk_codigo_linea`
  FOREIGN KEY (`codigo_linea`)
REFERENCES `SIC`.`tbl_linea` (`PK_codigo_linea`),

CONSTRAINT `fk_codigo_marca`
FOREIGN KEY (`codigo_marca`)
REFERENCES `SIC`.`tbl_marca` (`PK_codigo_marca`),   
  
CONSTRAINT `fk_codigo_bodega` 
FOREIGN KEY (`codigo_bodega`)
REFERENCES `SIC`.`tbl_bodega` (`PK_codigo_bodega`),
 
 CONSTRAINT `fk_codigo_unidad1` 
 FOREIGN KEY (`codigo_unidad`)
REFERENCES `SIC`.`tbl_unidad` (`PK_codigo_unidad`)
   
  
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

