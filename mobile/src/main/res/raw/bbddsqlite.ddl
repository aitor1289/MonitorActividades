CREATE TABLE IF NOT EXISTS registro_movimientos (
    id_reg_mov         INTEGER NOT NULL,
    x                  NUMBER(6,3) NOT NULL,
    y                  NUMBER(6,3) NOT NULL,
    z                  NUMBER(6,3) NOT NULL,
    id_tipo_mov        INTEGER NOT NULL,
    usuarios_id_user   INTEGER NOT NULL
);
ALTER TABLE registro_movimientos ADD CONSTRAINT registro_movimientos_pk PRIMARY KEY ( id_reg_mov );
CREATE TABLE IF NOT EXISTS roles (
    id_rol        INTEGER NOT NULL,
    type          VARCHAR2(16) NOT NULL,
    description   VARCHAR2(20)
);
ALTER TABLE roles ADD CONSTRAINT roles_pk PRIMARY KEY ( id_rol );
CREATE TABLE IF NOT EXISTS tipo_movimientos (
    id_tipo_mov   INTEGER NOT NULL,
    type          VARCHAR2(16) NOT NULL,
    description   VARCHAR2(20)
);
ALTER TABLE tipo_movimientos ADD CONSTRAINT tipo_movimientos_pk PRIMARY KEY ( id_tipo_mov );
CREATE TABLE IF NOT EXISTS usuarios (
    id_user        INTEGER NOT NULL,
    username       VARCHAR2(50) NOT NULL,
    password       VARCHAR2(50) NOT NULL,
    name           VARCHAR2(50),
    surename1      VARCHAR2(50),
    surename2      VARCHAR2(50),
    phone          VARCHAR2(50),
    mail           VARCHAR2(50),
    roles_id_rol   INTEGER NOT NULL
);
ALTER TABLE usuarios ADD CONSTRAINT usuarios_pk PRIMARY KEY ( id_user );
ALTER TABLE registro_movimientos ADD CONSTRAINT reg_mov_tipo_mov_fk FOREIGN KEY ( id_tipo_mov )
    REFERENCES tipo_movimientos ( id_tipo_mov )
NOT DEFERRABLE;
ALTER TABLE registro_movimientos ADD CONSTRAINT reg_mov_usuarios_fk FOREIGN KEY ( usuarios_id_user )
    REFERENCES usuarios ( id_user )
NOT DEFERRABLE;
ALTER TABLE usuarios ADD CONSTRAINT usuarios_roles_fk FOREIGN KEY ( roles_id_rol )
    REFERENCES roles ( id_rol )
NOT DEFERRABLE;