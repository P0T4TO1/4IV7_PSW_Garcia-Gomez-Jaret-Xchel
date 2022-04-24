

CREATE DATABASE docente;

USE docente;

-- -----------------------------------------------------
-- Tabla cedomaquina
-- -----------------------------------------------------
DROP TABLE IF EXISTS cedomaquina;

CREATE TABLE cedomaquina (
  idcedomaquina INT NOT NULL,
  tipoedo VARCHAR(45) NOT NULL,
  PRIMARY KEY (idcedomaquina)
  );


-- -----------------------------------------------------
-- Tabla cestadoreporte
-- -----------------------------------------------------
DROP TABLE IF EXISTS cestadoreporte;

CREATE TABLE cestadoreporte (
  idcestadoreporte INT NOT NULL,
  tipoedoreporte VARCHAR(45) NOT NULL,
  PRIMARY KEY (idcestadoreporte)
  );


-- -----------------------------------------------------
-- Tabla cgrupo
-- -----------------------------------------------------
DROP TABLE IF EXISTS cgrupo;

CREATE TABLE cgrupo (
  idCgrupo INT NOT NULL,
  tipo VARCHAR(45) NOT NULL,
  PRIMARY KEY (idCgrupo)
  );


-- -----------------------------------------------------
-- Tabla cmarca
-- -----------------------------------------------------
DROP TABLE IF EXISTS cmarca;

CREATE TABLE cmarca (
  idCmarca INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (idCmarca)
  );



-- -----------------------------------------------------
-- Tabla cprioridad
-- -----------------------------------------------------
DROP TABLE IF EXISTS cprioridad;

CREATE TABLE cprioridad (
  idcprioridad INT NOT NULL,
  tipo VARCHAR(45) NOT NULL,
  PRIMARY KEY (idcprioridad)
  );


-- -----------------------------------------------------
-- Tabla cprivilegio
-- -----------------------------------------------------
DROP TABLE IF EXISTS cprivilegio;

CREATE TABLE cprivilegio (
  idCprivilegio INT NOT NULL,
  tipoPrivilegio VARCHAR(45) NOT NULL,
  PRIMARY KEY (idCprivilegio)
  );


-- -----------------------------------------------------
-- Tabla crol
-- -----------------------------------------------------
DROP TABLE IF EXISTS crol;

CREATE TABLE crol (
  idCrol INT NOT NULL,
  tipoRol VARCHAR(45) NOT NULL,
  PRIMARY KEY (idCrol)
  );


-- -----------------------------------------------------
-- Tabla mcpu
-- -----------------------------------------------------
DROP TABLE IF EXISTS mcpu;

CREATE TABLE mcpu (
  idMcpu INT NOT NULL,
  descripcion VARCHAR(60) NOT NULL,
  PRIMARY KEY (idMcpu)
  );


-- -----------------------------------------------------
-- Tabla mconfiguracion
-- -----------------------------------------------------
DROP TABLE IF EXISTS mconfiguracion;

CREATE TABLE mconfiguracion (
  idmconfiguracion INT NOT NULL,
  descripcion VARCHAR(45) NOT NULL,
  PRIMARY KEY (idmconfiguracion)
  );


-- -----------------------------------------------------
-- Tabla laboratorio
-- -----------------------------------------------------
DROP TABLE IF EXISTS laboratorio

CREATE TABLE laboratorio (
  idLaboratorio INT NOT NULL,
  nombre VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (idLaboratorio)
  );


-- -----------------------------------------------------
-- Tabla mmouse
-- -----------------------------------------------------
DROP TABLE IF EXISTS mmouse

CREATE TABLE mmouse (
  idMmouse INT NOT NULL,
  descripcion VARCHAR(60) NOT NULL,
  PRIMARY KEY (idMmouse)
  );


-- -----------------------------------------------------
-- Tabla mteclado
-- -----------------------------------------------------
DROP TABLE IF EXISTS mteclado;

CREATE TABLE mteclado (
  idmteclado INT NOT NULL,
  descripcion VARCHAR(60) NOT NULL,
  PRIMARY KEY (idmteclado)
  );


-- -----------------------------------------------------
-- Tabla dequipo
-- -----------------------------------------------------
DROP TABLE IF EXISTS dequipo;

CREATE TABLE dequipo (
  idDequipo INT NOT NULL,
  id_Mcpu INT NOT NULL,
  id_teclado INT NOT NULL,
  id_mouse INT NOT NULL,
  id_marca INT NOT NULL,
  id_monitor INT NULL DEFAULT NULL,
  id_edoequipo INT NULL DEFAULT NULL,
  id_lab INT NULL DEFAULT NULL,
  id_config INT NULL DEFAULT NULL,
  problema VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (idDequipo),
  /*INDEX id_Mcpu_idx (id_Mcpu ASC) VISIBLE,
  INDEX id_teclado_idx (id_teclado ASC) VISIBLE,
  INDEX id_mouse_idx (id_mouse ASC) VISIBLE,
  INDEX id_marca_idx (id_marca ASC) VISIBLE,
  INDEX id_equiposerial_idx (id_monitor ASC) VISIBLE,
  INDEX id_edoequipo_idx (id_edoequipo ASC) VISIBLE,
  INDEX id_lab_idx (id_lab ASC) VISIBLE,
  INDEX id_config_idx (id_config ASC) VISIBLE,*/
  CONSTRAINT id_Mcpu FOREIGN KEY (id_Mcpu) REFERENCES mcpu (idMcpu)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT id_config FOREIGN KEY (id_config) REFERENCES mconfiguracion (idmconfiguracion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT id_edoequipo FOREIGN KEY (id_edoequipo) REFERENCES cedomaquina (idcedomaquina)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT id_equiposerial FOREIGN KEY (id_monitor) REFERENCES mcpu (idMcpu)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT id_lab FOREIGN KEY (id_lab) REFERENCES laboratorio (idLaboratorio)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT id_marca FOREIGN KEY (id_marca) REFERENCES cmarca (idCmarca)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT id_mouse FOREIGN KEY (id_mouse) REFERENCES mmouse (idMmouse)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT id_teclado FOREIGN KEY (id_teclado) REFERENCES mteclado (idmteclado)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Tabla docentereal
-- -----------------------------------------------------
DROP TABLE IF EXISTS docentereal;

CREATE TABLE docentereal (
  num_empleado INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  appat VARCHAR(45) NOT NULL,
  apmat VARCHAR(45) NOT NULL,
  sexo VARCHAR(1) NOT NULL,
  fechanacimiento DATETIME NOT NULL,
  docenterealcol VARCHAR(45) NOT NULL,
  PRIMARY KEY (num_empleado)
  );


-- -----------------------------------------------------
-- Tabla persona
-- -----------------------------------------------------
DROP TABLE IF EXISTS persona;

CREATE TABLE persona (
  boleta INT NOT NULL,
  nombre VARCHAR(45) NULL DEFAULT NULL,
  appat VARCHAR(45) NULL DEFAULT NULL,
  apmat VARCHAR(45) NULL DEFAULT NULL,
  sexo VARCHAR(1) NULL DEFAULT NULL,
  fechanacimiento DATETIME NULL DEFAULT NULL,
  id_grupo INT NULL DEFAULT NULL,
  num_empleado INT NULL DEFAULT NULL,
  id_persona INT NOT NULL,
  user1 VARCHAR(45) NULL DEFAULT NULL,
  pass VARCHAR(45) NULL DEFAULT NULL,
  id_rol INT NULL DEFAULT NULL,
  id_privilegio INT NULL DEFAULT NULL,
  PRIMARY KEY (id_persona),
  /*INDEX id_grupo_idx (id_grupo ASC) VISIBLE,
  INDEX id_rol_idx (id_rol ASC) VISIBLE,
  INDEX id_privilegio_idx (id_privilegio ASC) VISIBLE)*/
  );



-- -----------------------------------------------------
-- Tabla dreporte
-- -----------------------------------------------------
DROP TABLE IF EXISTS dreporte;

CREATE TABLE dreporte (
  idreporte INT NULL DEFAULT NULL,
  fecha DATETIME NOT NULL,
  hora DATETIME NOT NULL,
  id_equipo INT NULL DEFAULT NULL,
  id_persona INT NULL DEFAULT NULL,
  id_edoreporte INT NULL DEFAULT NULL,
  id_reporte INT NULL DEFAULT NULL,
  id_eer INT NULL DEFAULT NULL,
  id_dreporte VARCHAR(45) NOT NULL,
  id_prioridad INT NULL DEFAULT NULL,
  PRIMARY KEY (id_dreporte),
  /*INDEX id_equipo_idx (id_equipo ASC) VISIBLE,
  INDEX id_persona_idx (id_persona ASC) VISIBLE,
  INDEX id_prioridad_idx (id_prioridad ASC) VISIBLE,*/
  CONSTRAINT id_equipo FOREIGN KEY (id_equipo) REFERENCES dequipo (idDequipo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT id_persona FOREIGN KEY (id_persona) REFERENCES persona (id_persona)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- -----------------------------------------------------
-- Tabla eequiposreportados
-- -----------------------------------------------------
DROP TABLE IF EXISTS eequiposreparados;

CREATE TABLE eequiposreportados (
  ideequiposreportados INT NOT NULL,
  id_equipo INT NOT NULL,
  PRIMARY KEY (ideequiposreportados)
  );


-- -----------------------------------------------------
-- Tabla ereportespersona
-- -----------------------------------------------------
DROP TABLE IF EXISTS ereportespersona;

CREATE TABLE ereportespersona (
  idEreportesPersona INT NOT NULL,
  id_persona VARCHAR(45) NOT NULL,
  PRIMARY KEY (idEreportesPersona)
  );


-- -----------------------------------------------------
-- Tabla mreporte
-- -----------------------------------------------------
DROP TABLE IF EXISTS mreporte

CREATE TABLE mreporte (
  idMreporte INT NOT NULL,
  cantidad_repeticiones INT NOT NULL,
  PRIMARY KEY (idMreporte)
  );

