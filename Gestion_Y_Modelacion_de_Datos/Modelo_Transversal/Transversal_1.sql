-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2023-10-18 17:12:35 COT
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE
/*
CREATE TABLE s2_bailarin (
    no_cedula               NUMBER(10) NOT NULL,
    nombres                 VARCHAR2(20) NOT NULL,
    apellidos               VARCHAR2(20),
    genero                  VARCHAR2(1),
    fecha_nacimiento        VARCHAR2(10) NOT NULL,
    s2_rol_tipo_rol         VARCHAR2(20) NOT NULL,
    s2_carrera_tipo_carrera VARCHAR2(50)
)tablespace GYMD02;

ALTER TABLE s2_bailarin ADD CONSTRAINT s2_bailarin_pk PRIMARY KEY ( no_cedula );

CREATE TABLE s2_carrera (
    tipo_carrera VARCHAR2(50) NOT NULL
)tablespace GYMD02;

ALTER TABLE s2_carrera ADD CONSTRAINT s2_carrera_pk PRIMARY KEY ( tipo_carrera );

CREATE TABLE s2_categoria (
    tipo VARCHAR2(30) NOT NULL
)tablespace GYMD02;

ALTER TABLE s2_categoria ADD CONSTRAINT s2_categoria_pk PRIMARY KEY ( tipo );

CREATE TABLE s2_comercio (
    s2_proveedor_id_proveedor NUMBER(4) NOT NULL,
    s2_bailarin_no_cedula     NUMBER(10) NOT NULL
)tablespace GYMD02;

ALTER TABLE s2_comercio ADD CONSTRAINT s2_comercio_pk PRIMARY KEY ( s2_proveedor_id_proveedor,
                                                                    s2_bailarin_no_cedula );

CREATE TABLE s2_concurso (
    nombre_concurso      VARCHAR2(30) NOT NULL,
    lugar                VARCHAR2(40) NOT NULL,
    fecha                VARCHAR2(10) NOT NULL,
    posicion             NUMBER(3) NOT NULL,
    s2_categoria_tipo    VARCHAR2(30) NOT NULL,
    s2_ensalsa2_id_grupo NUMBER(4) NOT NULL,
    s2_ritmo_tipo        VARCHAR2(30) NOT NULL,
    s2_modalidad_tipo    VARCHAR2(30) NOT NULL
)tablespace GYMD02;

ALTER TABLE s2_concurso ADD CONSTRAINT s2_concurso_pk PRIMARY KEY ( nombre_concurso );

CREATE TABLE s2_ensalsa2 (
    id_grupo NUMBER(4) NOT NULL
)tablespace GYMD02;

ALTER TABLE s2_ensalsa2 ADD CONSTRAINT s2_ensalsa2_pk PRIMARY KEY ( id_grupo );

CREATE TABLE s2_grupo (
    s2_ensalsa2_id_grupo  NUMBER(4) NOT NULL,
    s2_bailarin_no_cedula NUMBER(10) NOT NULL
)tablespace GYMD02;

ALTER TABLE s2_grupo ADD CONSTRAINT s2_grupo_pk PRIMARY KEY ( s2_ensalsa2_id_grupo,
                                                              s2_bailarin_no_cedula );

CREATE TABLE s2_modalidad (
    tipo VARCHAR2(30) NOT NULL
)tablespace GYMD02;

ALTER TABLE s2_modalidad ADD CONSTRAINT s2_modalidad_pk PRIMARY KEY ( tipo );

CREATE TABLE s2_proveedor (
    id_proveedor NUMBER(4) NOT NULL,
    nombre       VARCHAR2(40) NOT NULL,
    tipo         VARCHAR2(40) NOT NULL
)tablespace GYMD02;

ALTER TABLE s2_proveedor ADD CONSTRAINT s2_proveedor_pk PRIMARY KEY ( id_proveedor );

CREATE TABLE s2_ritmo (
    tipo VARCHAR2(30) NOT NULL
)tablespace GYMD02;

ALTER TABLE s2_ritmo ADD CONSTRAINT s2_ritmo_pk PRIMARY KEY ( tipo );

CREATE TABLE s2_rol (
    tipo_rol VARCHAR2(20) NOT NULL
)tablespace GYMD02;

ALTER TABLE s2_rol ADD CONSTRAINT s2_rol_pk PRIMARY KEY ( tipo_rol );

ALTER TABLE s2_bailarin
    ADD CONSTRAINT s2_bailarin_s2_carrera_fk FOREIGN KEY ( s2_carrera_tipo_carrera )
        REFERENCES s2_carrera ( tipo_carrera );

ALTER TABLE s2_bailarin
    ADD CONSTRAINT s2_bailarin_s2_rol_fk FOREIGN KEY ( s2_rol_tipo_rol )
        REFERENCES s2_rol ( tipo_rol );

ALTER TABLE s2_comercio
    ADD CONSTRAINT s2_comercio_s2_bailarin_fk FOREIGN KEY ( s2_bailarin_no_cedula )
        REFERENCES s2_bailarin ( no_cedula );

ALTER TABLE s2_comercio
    ADD CONSTRAINT s2_comercio_s2_proveedor_fk FOREIGN KEY ( s2_proveedor_id_proveedor )
        REFERENCES s2_proveedor ( id_proveedor );

ALTER TABLE s2_concurso
    ADD CONSTRAINT s2_concurso_s2_categoria_fk FOREIGN KEY ( s2_categoria_tipo )
        REFERENCES s2_categoria ( tipo );

ALTER TABLE s2_concurso
    ADD CONSTRAINT s2_concurso_s2_ensalsa2_fk FOREIGN KEY ( s2_ensalsa2_id_grupo )
        REFERENCES s2_ensalsa2 ( id_grupo );

ALTER TABLE s2_concurso
    ADD CONSTRAINT s2_concurso_s2_modalidad_fk FOREIGN KEY ( s2_modalidad_tipo )
        REFERENCES s2_modalidad ( tipo );

ALTER TABLE s2_concurso
    ADD CONSTRAINT s2_concurso_s2_ritmo_fk FOREIGN KEY ( s2_ritmo_tipo )
        REFERENCES s2_ritmo ( tipo );

ALTER TABLE s2_grupo
    ADD CONSTRAINT s2_grupo_s2_bailarin_fk FOREIGN KEY ( s2_bailarin_no_cedula )
        REFERENCES s2_bailarin ( no_cedula );

ALTER TABLE s2_grupo
    ADD CONSTRAINT s2_grupo_s2_ensalsa2_fk FOREIGN KEY ( s2_ensalsa2_id_grupo )
        REFERENCES s2_ensalsa2 ( id_grupo );

-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             21
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
*/

-- Ritmos

insert into s2_ritmo(tipo)
values ('Bachata');
insert into s2_ritmo(tipo)
values ('Salsa');
insert into s2_ritmo(tipo)
values ('Merengue');

-- Categorias

insert into s2_categoria(tipo)
values ('amateur');
insert into s2_categoria(tipo)
values ('intermedio');
insert into s2_categoria(tipo)
values ('profesional');

-- modalidades

insert into s2_modalidad(tipo)
values ('solista');
insert into s2_modalidad(tipo)
values ('pareja');
insert into s2_modalidad(tipo)
values ('grupo');

-- Proveedor
insert into s2_proveedor(Id_proveedor, nombre, tipo)
values (0,'Personal','Personal');
insert into s2_proveedor(Id_proveedor, nombre, tipo)
values (1,'Doña Florinda','vestuario');
insert into s2_proveedor(Id_proveedor, nombre, tipo)
values (2,'La bruja del 71','Vestuario');
insert into s2_proveedor(Id_proveedor, nombre, tipo)
values (3,'Don ramon','Zapatos');
insert into s2_proveedor(Id_proveedor, nombre, tipo)
values (4,'Quico','Zapatos');
insert into s2_proveedor(Id_proveedor, nombre, tipo)
values (5,'Señor Barriga','Vestuario');
insert into s2_proveedor(Id_proveedor, nombre, tipo)
values (6,'Chavito','Zapatos');

-- Ensalsados

insert into s2_ensalsa2(id_grupo) 
values (0);
insert into s2_ensalsa2(id_grupo) 
values (1);
insert into s2_ensalsa2(id_grupo) 
values (2);
insert into s2_ensalsa2(id_grupo) 
values (3);
insert into s2_ensalsa2(id_grupo) 
values (4);

-- concurso

insert into s2_concurso(Nombre_concurso, lugar, fecha, posicion, S2_CATEGORIA_TIPO, S2_ENSALSA2_ID_GRUPO, S2_RITMO_TIPO, S2_MODALIDAD_TIPO) 
values ('Viva la Salsa','tu corazon','15/03/04',1,'profesional',0,'Salsa','solista');
insert into s2_concurso(Nombre_concurso, lugar, fecha, posicion, S2_CATEGORIA_TIPO, S2_ENSALSA2_ID_GRUPO, S2_RITMO_TIPO, S2_MODALIDAD_TIPO) 
values ('BailaFiesta','Salón de Baile Luna','23/08/07',5,'intermedio',0,'Bachata','solista');

insert into s2_concurso(Nombre_concurso, lugar, fecha, posicion, S2_CATEGORIA_TIPO, S2_ENSALSA2_ID_GRUPO, S2_RITMO_TIPO, S2_MODALIDAD_TIPO) 
values ('Estrellas de la Danza','Teatro de las Estrellas','12/11/09',1,'profesional',1,'Salsa','pareja');
insert into s2_concurso(Nombre_concurso, lugar, fecha, posicion, S2_CATEGORIA_TIPO, S2_ENSALSA2_ID_GRUPO, S2_RITMO_TIPO, S2_MODALIDAD_TIPO) 
values ('Ritmo Estelar Showcase','Pista de Baile Brillante','04/02/11',9,'intermedio',2,'Merengue','pareja');
insert into s2_concurso(Nombre_concurso, lugar, fecha, posicion, S2_CATEGORIA_TIPO, S2_ENSALSA2_ID_GRUPO, S2_RITMO_TIPO, S2_MODALIDAD_TIPO) 
values ('Danza Galáctica','Palacio de los Movimientos','30/05/13',2,'amateur',2,'Bachata','pareja');
insert into s2_concurso(Nombre_concurso, lugar, fecha, posicion, S2_CATEGORIA_TIPO, S2_ENSALSA2_ID_GRUPO, S2_RITMO_TIPO, S2_MODALIDAD_TIPO) 
values ('Pasos Brillantes','Arena del Ritmo','18/12/15',6,'intermedio',1,'Merengue','pareja');

insert into s2_concurso(Nombre_concurso, lugar, fecha, posicion, S2_CATEGORIA_TIPO, S2_ENSALSA2_ID_GRUPO, S2_RITMO_TIPO, S2_MODALIDAD_TIPO) 
values ('Movimiento Mágico','Estudio de Danza','06/03/18',1,'profesional',4,'Salsa','grupo');
insert into s2_concurso(Nombre_concurso, lugar, fecha, posicion, S2_CATEGORIA_TIPO, S2_ENSALSA2_ID_GRUPO, S2_RITMO_TIPO, S2_MODALIDAD_TIPO) 
values ('Baile Cometa','Centro de Exhibiciónismo','29/06/21',8,'intermedio',3,'Bachata','grupo');
insert into s2_concurso(Nombre_concurso, lugar, fecha, posicion, S2_CATEGORIA_TIPO, S2_ENSALSA2_ID_GRUPO, S2_RITMO_TIPO, S2_MODALIDAD_TIPO) 
values ('Torneo de Ritmo','Plaza de Pasos','17/09/23',3,'amateur',4,'Salsa','grupo');

-- carreras

insert into s2_carrera(tipo_carrera)
values ('Medicina');
INSERT INTO s2_carrera(tipo_carrera) 
VALUES ('Nutricion');
INSERT INTO s2_carrera(tipo_carrera) 
VALUES ('Ingenieria Civil');
INSERT INTO s2_carrera(tipo_carrera) 
VALUES ('Psicologia');
INSERT INTO s2_carrera(tipo_carrera) 
VALUES ('Derecho');
INSERT INTO s2_carrera(tipo_carrera) 
VALUES ('Ingenieria de Sistemas');
INSERT INTO s2_carrera(tipo_carrera) 
VALUES ('Administración de Empresas');
INSERT INTO s2_carrera(tipo_carrera) 
VALUES ('Biologia');
INSERT INTO s2_carrera(tipo_carrera) 
VALUES ('Arquitectura');
INSERT INTO s2_carrera(tipo_carrera) 
VALUES ('Marketing');


-- rol

insert into s2_rol(tipo_rol)
values ('Profesor');
insert into s2_rol(tipo_rol)
values ('Colaborador');
insert into s2_rol(tipo_rol)
values ('Egresado');
insert into s2_rol(tipo_rol)
values ('Pregrado');
insert into s2_rol(tipo_rol)
values ('Posgrado');

-- Bailarin

insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000001,'Jean Carlos','Santa Cruz','Pregrado','M','01/04/03', 'Ingenieria de Sistemas');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000002,'Miguel Angel','Nivia Ortega','Pregrado','M','10/08/02', 'Ingenieria de Sistemas');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000003,'Ana María','González','Pregrado','F','15/05/01', 'Medicina');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000004,'Javier','Pérez','Pregrado','M','22/09/00', 'Medicina');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000005,'María Elena','Rodríguez','Pregrado','F','03/11/99', 'Medicina');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000006,'Alejandro','Gómez','Pregrado','M','12/07/98', 'Medicina');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000007,'Carla','López','Pregrado','F','28/03/97', 'Medicina');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000008,'Luis','Hernández','Pregrado','M','19/12/96', 'Medicina');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000009,'Lucía','Martínez','Pregrado','F','07/08/95', 'Medicina');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000010,'Eduardo','Sánchez','Pregrado','M','14/02/01', 'Nutricion');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000011,'Isabel','Torres','Pregrado','F','25/06/00', 'Nutricion');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000012,'Ricardo','García','Pregrado','M','10/10/99', 'Nutricion');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000013,'Silvia','Jiménez','Pregrado','F','05/03/98', 'Nutricion');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000014,'Felipe','Mendoza','Pregrado','M','20/07/97', 'Nutricion');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000015,'María Isabel','Ortega','Pregrado','F','03/09/01', 'Psicologia');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000016,'Alejandro','Lara','Pregrado','M','18/11/00', 'Psicologia');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000017,'Luisa','Gonzalez','Pregrado','F','30/05/99', 'Psicologia');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000018,'Sergio','Perez','Pregrado','M','11/07/98', 'Psicologia');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000019,'Laura','Sanchez','Pregrado','F','24/03/01', 'Ingenieria de Sistemas');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000020,'Carlos','Torres','Pregrado','M','09/12/00', 'Ingenieria de Sistemas');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000021,'Ana','Lopez','Pregrado','F','02/06/01', 'Ingenieria Civil');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000022,'Jorge','Hernandez','Pregrado','M','19/11/00', 'Ingenieria Civil');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000023,'Sofia','Garcia','Pregrado','F','05/04/01', 'Derecho');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000024,'Miguel','Ortega','Pregrado','M','20/10/00', 'Derecho');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000025,'Paula','Martinez','Pregrado','F','13/03/99', 'Derecho');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000026,'Roberto','Lara','Pregrado','M','28/09/01', 'Administracion de Empresas');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000027,'Maria','Gomez','Pregrado','F','17/05/00', 'Administracion de Empresas');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000028,'Andres','Sanchez','Pregrado','M','01/12/01', 'Biologia');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000029,'Elena','Ortega','Posgrado','F','14/08/70', 'Arquitectura');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000030,'Luis','Perez','Profesor','M','29/02/99', 'Marketing');
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000031,'Juan Ignacio','Gandara','Egresado','M','03/02/00', NULL);
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000032,'Maria Fernanda','Gonzalez','Egresado','F','14/07/99', NULL);
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000033,'Carlos Alberto','Lopez','Egresado','M','28/12/98', NULL);
insert into s2_bailarin(no_cedula, nombres, apellidos, s2_rol_tipo_rol, genero, fecha_nacimiento, s2_carrera_tipo_carrera)
values (1000000034,'Isabel Maria','Perez','Colaborador','F','05/06/97', NULL);


-- grupo

insert into s2_grupo(s2_ensalsa2_id_grupo, s2_bailarin_no_cedula) 
values (0, 1000000002);
insert into s2_grupo(s2_ensalsa2_id_grupo, s2_bailarin_no_cedula) 
values (1, 1000000001);
insert into s2_grupo(s2_ensalsa2_id_grupo, s2_bailarin_no_cedula) 
values (1, 1000000003);
insert into s2_grupo(s2_ensalsa2_id_grupo, s2_bailarin_no_cedula) 
values (2, 1000000001);
insert into s2_grupo(s2_ensalsa2_id_grupo, s2_bailarin_no_cedula) 
values (2, 1000000005);
insert into s2_grupo(s2_ensalsa2_id_grupo, s2_bailarin_no_cedula) 
values (3, 1000000001);
insert into s2_grupo(s2_ensalsa2_id_grupo, s2_bailarin_no_cedula) 
values (3, 1000000002);
insert into s2_grupo(s2_ensalsa2_id_grupo, s2_bailarin_no_cedula) 
values (3, 1000000003);
insert into s2_grupo(s2_ensalsa2_id_grupo, s2_bailarin_no_cedula) 
values (3, 1000000005);
insert into s2_grupo(s2_ensalsa2_id_grupo, s2_bailarin_no_cedula) 
values (4, 1000000001);
insert into s2_grupo(s2_ensalsa2_id_grupo, s2_bailarin_no_cedula) 
values (4, 1000000002);
insert into s2_grupo(s2_ensalsa2_id_grupo, s2_bailarin_no_cedula) 
values (4, 1000000003);
insert into s2_grupo(s2_ensalsa2_id_grupo, s2_bailarin_no_cedula) 
values (4, 1000000005);
insert into s2_grupo(s2_ensalsa2_id_grupo, s2_bailarin_no_cedula) 
values (4, 1000000006);
insert into s2_grupo(s2_ensalsa2_id_grupo, s2_bailarin_no_cedula) 
values (4, 1000000007);
insert into s2_grupo(s2_ensalsa2_id_grupo, s2_bailarin_no_cedula) 
values (4, 1000000008);
insert into s2_grupo(s2_ensalsa2_id_grupo, s2_bailarin_no_cedula) 
values (4, 1000000009);
insert into s2_grupo(s2_ensalsa2_id_grupo, s2_bailarin_no_cedula) 
values (4, 1000000010);
insert into s2_grupo(s2_ensalsa2_id_grupo, s2_bailarin_no_cedula) 
values (4, 1000000011);
insert into s2_grupo(s2_ensalsa2_id_grupo, s2_bailarin_no_cedula) 
values (4, 1000000012);
insert into s2_grupo(s2_ensalsa2_id_grupo, s2_bailarin_no_cedula) 
values (4, 1000000015);

-- comecio

insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula)
values (0, 1000000001);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula)
values (3, 1000000002);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula)
values (2, 1000000003);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (0, 1000000004);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (1, 1000000005);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (2, 1000000006);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (3, 1000000007);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (4, 1000000008);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (5, 1000000009);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (6, 1000000010);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (0, 1000000011);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (1, 1000000012);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (2, 1000000013);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (3, 1000000014);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (4, 1000000015);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (5, 1000000016);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (6, 1000000017);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (0, 1000000018);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (1, 1000000019);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (2, 1000000020);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (3, 1000000021);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (4, 1000000022);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (5, 1000000023);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (6, 1000000024);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (0, 1000000025);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (1, 1000000026);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (2, 1000000027);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (3, 1000000028);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (4, 1000000029);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (5, 1000000030);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (6, 1000000031);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (0, 1000000032);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (1, 1000000033);
insert into s2_comercio(s2_proveedor_id_proveedor, s2_bailarin_no_cedula) 
values (1, 1000000034);

-- Preguntas

-- 1 

select * from s2_concurso, s2_ensalsa2
where s2_ensalsa2.id_grupo = s2_concurso.s2_ensalsa2_id_grupo;

-- 2

select * from s2_concurso, s2_ensalsa2
where s2_ensalsa2.id_grupo = s2_concurso.s2_ensalsa2_id_grupo
and (s2_concurso.posicion = 1 or s2_concurso.posicion = 2 or s2_concurso.posicion = 3);

-- 3

SELECT DISTINCT s2_ensalsa2.id_grupo, s2_categoria.tipo 
FROM s2_concurso, s2_ensalsa2, s2_categoria
WHERE s2_ensalsa2.id_grupo = s2_concurso.s2_ensalsa2_id_grupo 
AND s2_categoria.tipo = s2_concurso.s2_categoria_tipo
ORDER BY s2_ensalsa2.id_grupo;

-- 4

SELECT DISTINCT s2_ensalsa2.id_grupo, s2_ritmo.tipo 
FROM s2_concurso, s2_ensalsa2, s2_ritmo
WHERE s2_ensalsa2.id_grupo = s2_concurso.s2_ensalsa2_id_grupo 
AND s2_ritmo.tipo = s2_concurso.s2_ritmo_tipo
ORDER BY s2_ensalsa2.id_grupo;

-- 5

SELECT DISTINCT s2_ensalsa2.id_grupo, s2_modalidad.tipo 
FROM s2_concurso, s2_ensalsa2, s2_modalidad
WHERE s2_ensalsa2.id_grupo = s2_concurso.s2_ensalsa2_id_grupo 
AND s2_modalidad.tipo = s2_concurso.s2_modalidad_tipo
ORDER BY s2_ensalsa2.id_grupo;

-- 6

SELECT s2_bailarin.s2_carrera_tipo_carrera, COUNT(*) as cantidad
FROM s2_bailarin, s2_carrera
where s2_bailarin.s2_carrera_tipo_carrera = s2_carrera.tipo_carrera
GROUP BY s2_bailarin.s2_carrera_tipo_carrera
ORDER BY cantidad DESC;

-- 7

SELECT s2_bailarin.s2_rol_tipo_rol, COUNT(*) as cantidad
FROM s2_bailarin, s2_rol
where s2_bailarin.s2_rol_tipo_rol = s2_rol.tipo_rol
GROUP BY s2_bailarin.s2_rol_tipo_rol
ORDER BY cantidad DESC;

--8

select * 
from s2_proveedor
order by tipo;