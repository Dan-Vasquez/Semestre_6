-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2023-10-15 11:05:34 COT
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE
/*
CREATE TABLE s2_bailarin (
    no_cedula        NUMBER(10) NOT NULL,
    nombres          VARCHAR2(20) NOT NULL,
    apellidos        VARCHAR2(20),
    rol              VARCHAR2(20) NOT NULL,
    genero           VARCHAR2(1),
    fecha_nacimiento VARCHAR2(10) NOT NULL
)tablespace GYMD02;

ALTER TABLE s2_bailarin ADD CONSTRAINT s2_bailarin_pk PRIMARY KEY ( no_cedula );

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

CREATE TABLE s2_universidad (
    no_cedula             NUMBER(10) NOT NULL,
    nombres               VARCHAR2(20) NOT NULL,
    apellidos             VARCHAR2(20),
    carrera               VARCHAR2(50) NOT NULL,
    fecha_nacimiento      VARCHAR2(10) NOT NULL,
    genero                VARCHAR2(1),
    s2_bailarin_no_cedula NUMBER(10) NOT NULL
)tablespace GYMD02;

CREATE UNIQUE INDEX s2_universidad__idx ON
    s2_universidad (
        s2_bailarin_no_cedula
    ASC );

ALTER TABLE s2_universidad ADD CONSTRAINT s2_universidad_pk PRIMARY KEY ( no_cedula );

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

ALTER TABLE s2_universidad
    ADD CONSTRAINT s2_universidad_s2_bailarin_fk FOREIGN KEY ( s2_bailarin_no_cedula )
        REFERENCES s2_bailarin ( no_cedula );

-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             1
-- ALTER TABLE                             19
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

-- Bailarines

insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000001,'Jean Carlos','Santa Cruz','Pregrado','M','01/04/03');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000002,'Miguel Angel','Nivia Ortega','Pregrado','M','10/08/02');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000003,'Ana Mar�a','Gonz�lez','Pregrado','F','15/05/01');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000004,'Javier','P�rez','Pregrado','M','22/09/00');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000005,'Mar�a Elena','Rodr�guez','Pregrado','F','03/11/99');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000006,'Alejandro','G�mez','Pregrado','M','12/07/98');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000007,'Carla','L�pez','Pregrado','F','28/03/97');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000008,'Luis','Hern�ndez','Pregrado','M','19/12/96');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000009,'Luc�a','Mart�nez','Pregrado','F','07/08/95');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000010,'Eduardo','S�nchez','Pregrado','M','14/02/01');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000011,'Isabel','Torres','Pregrado','F','25/06/00');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000012,'Ricardo','Garc�a','Pregrado','M','10/10/99');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000013,'Silvia','Jim�nez','Pregrado','F','05/03/98');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000014,'Felipe','Mendoza','Pregrado','M','20/07/97');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000015,'Mar�a Isabel','Ortega','Pregrado','F','03/09/01');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000016,'Alejandro','Lara','Pregrado','M','18/11/00');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000017,'Luisa','Gonz�lez','Pregrado','F','30/05/99');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000018,'Sergio','P�rez','Pregrado','M','11/07/98');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000019,'Laura','S�nchez','Pregrado','F','24/03/01');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000020,'Carlos','Torres','Pregrado','M','09/12/00');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000021,'Ana','L�pez','Pregrado','F','02/06/01');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000022,'Jorge','Hern�ndez','Pregrado','M','19/11/00');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000023,'Sof�a','Garc�a','Pregrado','F','05/04/01');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000024,'Miguel','Ortega','Pregrado','M','20/10/00');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000025,'Paula','Mart�nez','Pregrado','F','13/03/99');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000026,'Roberto','Lara','Pregrado','M','28/09/01');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000027,'Mar�a','G�mez','Pregrado','F','17/05/00');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000028,'Andr�s','S�nchez','Pregrado','M','01/12/01');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000029,'Elena','Ortega','Posgrado','F','14/08/70');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000030,'Luis','P�rez','Profesor','M','29/02/99');

insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000031,'Juan Ignacio','Gandara','Egresado','M','03/02/00');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000032,'Mar�a Fernanda','Gonz�lez','Egresado','F','14/07/99');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000033,'Carlos Alberto','L�pez','Egresado','M','28/12/98');
insert into s2_bailarin(no_cedula, nombres, apellidos, rol, genero, fecha_nacimiento)
values (1000000034,'Isabel Mar�a','P�rez','Colaborador','F','05/06/97');

-- Universidad

insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000001,'Jean Carlos','Santa Cruz','Ingenieria de sistemas','01/04/03','M',1000000001);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000002,'Miguel Angel','Nivia Ortega','Ingenieria de sistemas','10/08/02','M',1000000002);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000003,'Ana Mar�a','Gonz�lez','Medicina','15/05/01','F',1000000003);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000004,'Javier','P�rez','Medicina','22/09/00','M',1000000004);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000005,'Mar�a Elena','Rodr�guez','Medicina','03/11/99','F',1000000005);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000006,'Alejandro','G�mez','Medicina','12/07/98','M',1000000006);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000007,'Carla','L�pez','Medicina','28/03/97','F',1000000007);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000008,'Luis','Hern�ndez','Medicina','19/12/96','M',1000000008);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000009,'Luc�a','Mart�nez','Medicina','07/08/95','F',1000000009);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000010,'Eduardo','S�nchez','Nutrici�n','14/02/01','M',1000000010);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000011,'Isabel','Torres','Nutrici�n','25/06/00','F',1000000011);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000012,'Ricardo','Garc�a','Nutrici�n','10/10/99','M',1000000012);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000013,'Silvia','Jim�nez','Nutrici�n','05/03/98','F',1000000013);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000014,'Felipe','Mendoza','Nutrici�n','20/07/97','M',1000000014);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000015,'Mar�a Isabel','Ortega','Psicolog�a','03/09/01','F',1000000015);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000016,'Alejandro','Lara','Psicolog�a','18/11/00','M',1000000016);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000017,'Luisa','Gonz�lez','Psicolog�a','30/05/99','F',1000000017);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000018,'Sergio','P�rez','Psicolog�a','11/07/98','M',1000000018);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000019,'Laura','S�nchez','Ingenier�a de Sistemas','24/03/01','F',1000000019);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000020,'Carlos','Torres','Ingenier�a de Sistemas','09/12/00','M',1000000020);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000021,'Ana','L�pez','Ingenier�a Civil','02/06/01','F',1000000021);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000022,'Jorge','Hern�ndez','Ingenier�a Civil','19/11/00','M',1000000022);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000023,'Sof�a','Garc�a','Derecho','05/04/01','F',1000000023);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000024,'Miguel','Ortega','Derecho','20/10/00','M',1000000024);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000025,'Paula','Mart�nez','Derecho','13/03/99','F',1000000025);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000026,'Roberto','Lara','Administraci�n de Empresas','28/09/01','M',1000000026);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000027,'Mar�a','G�mez','Administraci�n de Empresas','17/05/00','F',1000000027);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000028,'Andr�s','S�nchez','Biolog�a','01/12/01','M',1000000028);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000029,'Elena','Ortega','Arquitectura','14/08/00','F',1000000029);
insert into s2_universidad(no_cedula, nombres, apellidos, carrera, fecha_nacimiento, genero, S2_bailarin_no_cedula)
values (1000000030,'Luis','P�rez','Marketing','29/02/99','M',1000000030);

-- Proveedor
insert into s2_proveedor(Id_proveedor, nombre, tipo)
values (0,'Personal','Personal');
insert into s2_proveedor(Id_proveedor, nombre, tipo)
values (1,'Do�a Florinda','vestuario');
insert into s2_proveedor(Id_proveedor, nombre, tipo)
values (2,'La bruja del 71','Vestuario');
insert into s2_proveedor(Id_proveedor, nombre, tipo)
values (3,'Don ramon','Zapatos');
insert into s2_proveedor(Id_proveedor, nombre, tipo)
values (4,'Quico','Zapatos');
insert into s2_proveedor(Id_proveedor, nombre, tipo)
values (5,'Se�or Barriga','Vestuario');
insert into s2_proveedor(Id_proveedor, nombre, tipo)
values (6,'Chavito','Zapatos');

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

-- concurso

insert into s2_concurso(Nombre_concurso, lugar, fecha, posicion, S2_CATEGORIA_TIPO, S2_ENSALSA2_ID_GRUPO, S2_RITMO_TIPO, S2_MODALIDAD_TIPO) 
values ('Viva la Salsa','tu corazon','15/03/04',1,'profesional',0,'Salsa','solista');
insert into s2_concurso(Nombre_concurso, lugar, fecha, posicion, S2_CATEGORIA_TIPO, S2_ENSALSA2_ID_GRUPO, S2_RITMO_TIPO, S2_MODALIDAD_TIPO) 
values ('BailaFiesta','Sal�n de Baile Luna','23/08/07',5,'intermedio',0,'Bachata','solista');

insert into s2_concurso(Nombre_concurso, lugar, fecha, posicion, S2_CATEGORIA_TIPO, S2_ENSALSA2_ID_GRUPO, S2_RITMO_TIPO, S2_MODALIDAD_TIPO) 
values ('Estrellas de la Danza','Teatro de las Estrellas','12/11/09',1,'profesional',1,'Salsa','pareja');
insert into s2_concurso(Nombre_concurso, lugar, fecha, posicion, S2_CATEGORIA_TIPO, S2_ENSALSA2_ID_GRUPO, S2_RITMO_TIPO, S2_MODALIDAD_TIPO) 
values ('Ritmo Estelar Showcase','Pista de Baile Brillante','04/02/11',9,'intermedio',2,'Merengue','pareja');
insert into s2_concurso(Nombre_concurso, lugar, fecha, posicion, S2_CATEGORIA_TIPO, S2_ENSALSA2_ID_GRUPO, S2_RITMO_TIPO, S2_MODALIDAD_TIPO) 
values ('Danza Gal�ctica','Palacio de los Movimientos','30/05/13',2,'amateur',2,'Bachata','pareja');
insert into s2_concurso(Nombre_concurso, lugar, fecha, posicion, S2_CATEGORIA_TIPO, S2_ENSALSA2_ID_GRUPO, S2_RITMO_TIPO, S2_MODALIDAD_TIPO) 
values ('Pasos Brillantes','Arena del Ritmo','18/12/15',6,'intermedio',1,'Merengue','pareja');

insert into s2_concurso(Nombre_concurso, lugar, fecha, posicion, S2_CATEGORIA_TIPO, S2_ENSALSA2_ID_GRUPO, S2_RITMO_TIPO, S2_MODALIDAD_TIPO) 
values ('Movimiento M�gico','Estudio de Danza','06/03/18',1,'profesional',4,'Salsa','grupo');
insert into s2_concurso(Nombre_concurso, lugar, fecha, posicion, S2_CATEGORIA_TIPO, S2_ENSALSA2_ID_GRUPO, S2_RITMO_TIPO, S2_MODALIDAD_TIPO) 
values ('Baile Cometa','Centro de Exhibici�nismo','29/06/21',8,'intermedio',3,'Bachata','grupo');
insert into s2_concurso(Nombre_concurso, lugar, fecha, posicion, S2_CATEGORIA_TIPO, S2_ENSALSA2_ID_GRUPO, S2_RITMO_TIPO, S2_MODALIDAD_TIPO) 
values ('Torneo de Ritmo','Plaza de Pasos','17/09/23',3,'amateur',4,'Salsa','grupo');

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

SELECT s2_universidad.carrera, COUNT(*) as cantidad
FROM s2_universidad
GROUP BY s2_universidad.carrera
ORDER BY cantidad DESC;

-- 7

SELECT s2_bailarin.rol, COUNT(*) as cantidad
FROM s2_bailarin
GROUP BY s2_bailarin.rol
ORDER BY cantidad DESC;

--8

select * 
from s2_proveedor
order by tipo;





