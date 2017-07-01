CREATE TABLE registro_movimientos (
    id_reg_mov         INTEGER PRIMARY KEY,
    x                  NUMBER(6,3) NOT NULL,
    y                  NUMBER(6,3) NOT NULL,
    z                  NUMBER(6,3) NOT NULL,
    id_tipo_mov        INTEGER NOT NULL,
    usuarios_id_user   INTEGER NOT NULL,
	FOREIGN KEY(id_tipo_mov) REFERENCES tipo_movimientos(id_tipo_mov),
	FOREIGN KEY(usuarios_id_user) REFERENCES usuarios(id_user)
);
CREATE TABLE roles (
    id_rol        INTEGER PRIMARY KEY,
    type          VARCHAR2(16) NOT NULL,
    description   VARCHAR2(20)
);
INSERT INTO ROLES (type, description) VALUES ('root', 'Superusuario con todos los privilegios');
INSERT INTO ROLES (type, description) VALUES ('admin', 'Usuario administrador y supervisor de usuarios');
INSERT INTO ROLES (type, description) VALUES ('user', 'Usuario estandar a monitrizar');
CREATE TABLE tipo_movimientos (
    id_tipo_mov   INTEGER PRIMARY KEY,
    type          VARCHAR2(16) NOT NULL,
    description   VARCHAR2(20)
);
CREATE TABLE usuarios (
    id_user        INTEGER PRIMARY KEY,
    username       VARCHAR2(50) NOT NULL,
    password       VARCHAR2(50) NOT NULL,
    name           VARCHAR2(50),
    surename1      VARCHAR2(50),
    surename2      VARCHAR2(50),
    phone          VARCHAR2(50),
    mail           VARCHAR2(50),
    roles_id_rol   INTEGER NOT NULL,
	FOREIGN KEY(roles_id_rol) REFERENCES roles(id_rol)
);