-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2023-10-18 17:12:35 COT
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE s2_bailarin (
    no_cedula               NUMBER(10) NOT NULL,
    nombres                 VARCHAR2(20) NOT NULL,
    apellidos               VARCHAR2(20),
    genero                  VARCHAR2(1),
    fecha_nacimiento        VARCHAR2(10) NOT NULL,
    s2_rol_tipo_rol         VARCHAR2(20) NOT NULL,
    s2_carrera_tipo_carrera VARCHAR2(50)
);

ALTER TABLE s2_bailarin ADD CONSTRAINT s2_bailarin_pk PRIMARY KEY ( no_cedula );

CREATE TABLE s2_carrera (
    tipo_carrera VARCHAR2(50) NOT NULL
);

ALTER TABLE s2_carrera ADD CONSTRAINT s2_carrera_pk PRIMARY KEY ( tipo_carrera );

CREATE TABLE s2_categoria (
    tipo VARCHAR2(30) NOT NULL
);

ALTER TABLE s2_categoria ADD CONSTRAINT s2_categoria_pk PRIMARY KEY ( tipo );

CREATE TABLE s2_comercio (
    s2_proveedor_id_proveedor NUMBER(4) NOT NULL,
    s2_bailarin_no_cedula     NUMBER(10) NOT NULL
);

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
);

ALTER TABLE s2_concurso ADD CONSTRAINT s2_concurso_pk PRIMARY KEY ( nombre_concurso );

CREATE TABLE s2_ensalsa2 (
    id_grupo NUMBER(4) NOT NULL
);

ALTER TABLE s2_ensalsa2 ADD CONSTRAINT s2_ensalsa2_pk PRIMARY KEY ( id_grupo );

CREATE TABLE s2_grupo (
    s2_ensalsa2_id_grupo  NUMBER(4) NOT NULL,
    s2_bailarin_no_cedula NUMBER(10) NOT NULL
);

ALTER TABLE s2_grupo ADD CONSTRAINT s2_grupo_pk PRIMARY KEY ( s2_ensalsa2_id_grupo,
                                                              s2_bailarin_no_cedula );

CREATE TABLE s2_modalidad (
    tipo VARCHAR2(30) NOT NULL
);

ALTER TABLE s2_modalidad ADD CONSTRAINT s2_modalidad_pk PRIMARY KEY ( tipo );

CREATE TABLE s2_proveedor (
    id_proveedor NUMBER(4) NOT NULL,
    nombre       VARCHAR2(40) NOT NULL,
    tipo         VARCHAR2(40) NOT NULL
);

ALTER TABLE s2_proveedor ADD CONSTRAINT s2_proveedor_pk PRIMARY KEY ( id_proveedor );

CREATE TABLE s2_ritmo (
    tipo VARCHAR2(30) NOT NULL
);

ALTER TABLE s2_ritmo ADD CONSTRAINT s2_ritmo_pk PRIMARY KEY ( tipo );

CREATE TABLE s2_rol (
    tipo_rol VARCHAR2(20) NOT NULL
);

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
