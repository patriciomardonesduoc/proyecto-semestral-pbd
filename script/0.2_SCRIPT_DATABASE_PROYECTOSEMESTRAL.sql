-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2021-05-15 14:45:33 CLT
--   sitio:      Oracle Database 12cR2
--   tipo:      Oracle Database 12cR2

--*************************************************************
-- Script creación de base -  
-- Proyecto semestral
-- 2021-05-15
--*************************************************************
-- Integrantes
-- Vicente Carmona
-- Gustavo Diaz
-- Patricio Mardones
--*************************************************************


CREATE TABLE ciudades (
    id         INTEGER NOT NULL,
    ciudad     VARCHAR2(100) NOT NULL,
    paises_id  INTEGER NOT NULL
);

ALTER TABLE ciudades ADD CONSTRAINT ciudades_pk PRIMARY KEY ( id );

CREATE TABLE comunas (
    id             INTEGER NOT NULL,
    comuna         VARCHAR2(50) NOT NULL,
    provincias_id  INTEGER NOT NULL
);

ALTER TABLE comunas ADD CONSTRAINT comunas_pk PRIMARY KEY ( id );

CREATE TABLE datos_contactos (
    id                 INTEGER NOT NULL,
    direccion          VARCHAR2(100) NOT NULL,
    numero             VARCHAR2(10) NOT NULL,
    recibe_correos     NUMBER NOT NULL,
    opciones           CLOB,
    postulantes_id     INTEGER NOT NULL,
    comunas_id         INTEGER NOT NULL,
    tipo_direccion_id  INTEGER NOT NULL
);

ALTER TABLE datos_contactos ADD CONSTRAINT datos_contactos_pk PRIMARY KEY ( id );

CREATE TABLE dependecia_establecimiento (
    id           INTEGER NOT NULL,
    dep_est_edu  VARCHAR2(50) NOT NULL
);

ALTER TABLE dependecia_establecimiento ADD CONSTRAINT dependecia_establecimiento_pk PRIMARY KEY ( id );

CREATE TABLE disciplinas (
    id          INTEGER NOT NULL,
    disciplina  VARCHAR2(50) NOT NULL
);

ALTER TABLE disciplinas ADD CONSTRAINT disciplinas_pk PRIMARY KEY ( id );

CREATE TABLE documentos (
    postulantes_id                 INTEGER NOT NULL,
    ruta_cedula                    CLOB,
    ruta_permanencia               CLOB,
    ruta_certificado_titulo        CLOB,
    ruta_concentracion_notas       CLOB,
    ruta_certificado_especialidad  CLOB,
    ruta_certificado_laboral       CLOB,
    certificado_idioma             CLOB
);

CREATE TABLE estados_civiles (
    id            INTEGER NOT NULL,
    estado_civil  VARCHAR2(30) NOT NULL
);

ALTER TABLE estados_civiles ADD CONSTRAINT estados_civiles_pk PRIMARY KEY ( id );

CREATE TABLE estudios (
    id                             INTEGER NOT NULL,
    postulantes_id                 INTEGER NOT NULL,
    paises_id                      INTEGER NOT NULL,
    dependecia_establecimiento_id  INTEGER NOT NULL,
    tipo_establecimiento_id        INTEGER NOT NULL,
    tipo_ingreso_uni_id            INTEGER NOT NULL
);

ALTER TABLE estudios ADD CONSTRAINT estudios_pk PRIMARY KEY ( id );

CREATE TABLE experiencias_laborales (
    id                   INTEGER NOT NULL,
    empresa              VARCHAR2(50) NOT NULL,
    fecha_inicio         DATE NOT NULL,
    fecha_termino        DATE NOT NULL,
    tipo_experiencia_id  INTEGER NOT NULL,
    postulantes_id       INTEGER NOT NULL
);

ALTER TABLE experiencias_laborales ADD CONSTRAINT experiencias_laborales_pk PRIMARY KEY ( id );

CREATE TABLE instituciones (
    id           INTEGER NOT NULL,
    institucion  VARCHAR2(300) NOT NULL,
    url          VARCHAR2(100),
    ciudades_id  INTEGER NOT NULL
);

ALTER TABLE instituciones ADD CONSTRAINT instituciones_pk PRIMARY KEY ( id );

CREATE TABLE jerarquias_academicas (
    id                      INTEGER NOT NULL,
    jerarquia               VARCHAR2(50) NOT NULL,
    institucion             VARCHAR2(50) NOT NULL,
    compromiso_contractual  VARCHAR2(100) NOT NULL,
    postulantes_id          INTEGER NOT NULL
);

ALTER TABLE jerarquias_academicas ADD CONSTRAINT jerarquias_academicas_pk PRIMARY KEY ( id );

CREATE TABLE lineas_investigacion (
    id                     INTEGER NOT NULL,
    linea_investigacion_1  VARCHAR2(50) NOT NULL,
    linea_investigacion_2  VARCHAR2(50),
    linea_investigacion_3  VARCHAR2(50),
    disciplina_principal   CLOB NOT NULL,
    postulantes_id         INTEGER NOT NULL
);

ALTER TABLE lineas_investigacion ADD CONSTRAINT lineas_investigacion_pk PRIMARY KEY ( id );

CREATE TABLE modulos (
    id            INTEGER NOT NULL,
    modulo        VARCHAR2(100) NOT NULL,
    programas_id  INTEGER NOT NULL
);

ALTER TABLE modulos ADD CONSTRAINT modulos_pk PRIMARY KEY ( id );

CREATE TABLE objetivos (
    id                          INTEGER NOT NULL,
    objetivo_principal          CLOB NOT NULL,
    interes_principal           CLOB NOT NULL,
    aplicacion_subespecialidad  CLOB NOT NULL,
    postulantes_id              INTEGER NOT NULL
);

ALTER TABLE objetivos ADD CONSTRAINT objetivos_pk PRIMARY KEY ( id );

CREATE TABLE paises (
    id    INTEGER NOT NULL,
    pais  VARCHAR2(100) NOT NULL
);

ALTER TABLE paises ADD CONSTRAINT paises_pk PRIMARY KEY ( id );

CREATE TABLE postulaciones (
    id                 INTEGER NOT NULL,
    postulantes_id     INTEGER NOT NULL,
    programas_id       INTEGER NOT NULL,
    fecha_postulacion  DATE NOT NULL
);

ALTER TABLE postulaciones ADD CONSTRAINT postulaciones_pk PRIMARY KEY ( id );

CREATE TABLE postulantes (
    id                      INTEGER NOT NULL,
    run                     VARCHAR2(10) NOT NULL,
    nombre_1                VARCHAR2(20) NOT NULL,
    nombre_2                VARCHAR2(20),
    apellido_1              VARCHAR2(20) NOT NULL,
    apellido_2              VARCHAR2(20) NOT NULL,
    fecha_nacimiento        DATE NOT NULL,
    sexo                    VARCHAR2(20) NOT NULL,
    es_extranjero           NUMBER NOT NULL,
    pasaporte_ext           VARCHAR2(30),
    visa_ext                VARCHAR2(30),
    tiene_hijos_5_annos     NUMBER,
    numero_hijos            INTEGER NOT NULL,
    es_discapacitado        INTEGER NOT NULL,
    estados_civiles_id      INTEGER NOT NULL,
    paises_id               INTEGER NOT NULL,
    pueblos_originarios_id  INTEGER,
    promedio_notas          INTEGER NOT NULL,
    puntaje                 INTEGER NOT NULL
);

ALTER TABLE postulantes ADD CONSTRAINT postulantes_pk PRIMARY KEY ( id );

CREATE TABLE programas (
    id                     INTEGER NOT NULL,
    cupo_minimo            INTEGER,
    cupo_maximo            INTEGER,
    duracion               VARCHAR2(50),
    requisitos_academicos  CLOB NOT NULL,
    requisitos_laborales   CLOB NOT NULL,
    requisitos_idioma      CLOB NOT NULL,
    subespecialidades_id   INTEGER NOT NULL,
    instituciones_id       INTEGER NOT NULL
);

ALTER TABLE programas ADD CONSTRAINT programas_pk PRIMARY KEY ( id );

CREATE TABLE provincias (
    id           INTEGER NOT NULL,
    provincia    VARCHAR2(50) NOT NULL,
    regiones_id  INTEGER NOT NULL
);

ALTER TABLE provincias ADD CONSTRAINT provincias_pk PRIMARY KEY ( id );

CREATE TABLE proyectos (
    id                 INTEGER NOT NULL,
    proyecto           VARCHAR2(100) NOT NULL,
    tipos_proyecto_id  INTEGER NOT NULL,
    postulantes_id     INTEGER NOT NULL
);

ALTER TABLE proyectos ADD CONSTRAINT proyectos_pk PRIMARY KEY ( id );

CREATE TABLE pueblos_originarios (
    id                 INTEGER NOT NULL,
    pueblo_originario  VARCHAR2(50) NOT NULL
);

ALTER TABLE pueblos_originarios ADD CONSTRAINT pueblos_originarios_pk PRIMARY KEY ( id );

CREATE TABLE rankings (
    sub_areas_id      INTEGER NOT NULL,
    instituciones_id  INTEGER NOT NULL,
    ranking           INTEGER NOT NULL,
    puntaje           INTEGER NOT NULL
);

CREATE TABLE regiones (
    id            INTEGER NOT NULL,
    region        VARCHAR2(50) NOT NULL,
    ordinal       VARCHAR2(5) NOT NULL,
    zona_extrema  INTEGER
);

ALTER TABLE regiones ADD CONSTRAINT regiones_pk PRIMARY KEY ( id );

CREATE TABLE sub_areas (
    id              INTEGER NOT NULL,
    sub_area        VARCHAR2(50) NOT NULL,
    disciplinas_id  INTEGER NOT NULL
);

ALTER TABLE sub_areas ADD CONSTRAINT sub_areas_pk PRIMARY KEY ( id );

CREATE TABLE subespecialidades (
    id               INTEGER NOT NULL,
    subespecialidad  VARCHAR2(50) NOT NULL
);

ALTER TABLE subespecialidades ADD CONSTRAINT subespecialidades_pk PRIMARY KEY ( id );

CREATE TABLE submodulos (
    id          INTEGER NOT NULL,
    submodulo   VARCHAR2(200) NOT NULL,
    modulos_id  INTEGER NOT NULL
);

ALTER TABLE submodulos ADD CONSTRAINT submodulos_pk PRIMARY KEY ( id );

CREATE TABLE tipo_direccion (
    id              INTEGER NOT NULL,
    tipo_direccion  VARCHAR2(20)
);

ALTER TABLE tipo_direccion ADD CONSTRAINT tipo_direccion_pk PRIMARY KEY ( id );

CREATE TABLE tipo_establecimiento (
    id            INTEGER NOT NULL,
    tipo_est_edu  VARCHAR2(50) NOT NULL
);

ALTER TABLE tipo_establecimiento ADD CONSTRAINT tipo_establecimiento_pk PRIMARY KEY ( id );

CREATE TABLE tipo_experiencia (
    id                INTEGER NOT NULL,
    tipo_experiencia  VARCHAR2(50) NOT NULL
);

ALTER TABLE tipo_experiencia ADD CONSTRAINT tipo_experiencia_pk PRIMARY KEY ( id );

CREATE TABLE tipo_ingreso_uni (
    id                        INTEGER NOT NULL,
    tipo_ingreso_universidad  VARCHAR2(50) NOT NULL
);

ALTER TABLE tipo_ingreso_uni ADD CONSTRAINT tipo_ingreso_uni_pk PRIMARY KEY ( id );

CREATE TABLE tipos_proyecto (
    id              INTEGER NOT NULL,
    financiamiento  VARCHAR2(50)
);

ALTER TABLE tipos_proyecto ADD CONSTRAINT tipos_proyecto_pk PRIMARY KEY ( id );

CREATE TABLE tipos_titulo (
    id           INTEGER NOT NULL,
    tipo_titulo  VARCHAR2(50) NOT NULL
);

ALTER TABLE tipos_titulo ADD CONSTRAINT tipos_titulo_pk PRIMARY KEY ( id );

CREATE TABLE titulos_superiores (
    id               INTEGER NOT NULL,
    tipo_estudio     VARCHAR2(50) NOT NULL,
    institucion      VARCHAR2(100) NOT NULL,
    curso            VARCHAR2(100) NOT NULL,
    fecha_obtencion  DATE NOT NULL,
    tipos_titulo_id  INTEGER NOT NULL,
    postulantes_id   INTEGER NOT NULL
);

ALTER TABLE titulos_superiores ADD CONSTRAINT titulos_superiores_pk PRIMARY KEY ( id );

ALTER TABLE ciudades
    ADD CONSTRAINT ciudades_paises_fk FOREIGN KEY ( paises_id )
        REFERENCES paises ( id );

ALTER TABLE comunas
    ADD CONSTRAINT comunas_provincias_fk FOREIGN KEY ( provincias_id )
        REFERENCES provincias ( id );

ALTER TABLE datos_contactos
    ADD CONSTRAINT dat_cont_comunas_fk FOREIGN KEY ( comunas_id )
        REFERENCES comunas ( id );

ALTER TABLE datos_contactos
    ADD CONSTRAINT dat_cont_postulantes_fk FOREIGN KEY ( postulantes_id )
        REFERENCES postulantes ( id );

ALTER TABLE datos_contactos
    ADD CONSTRAINT dat_cont_tipo_direccion_fk FOREIGN KEY ( tipo_direccion_id )
        REFERENCES tipo_direccion ( id );

ALTER TABLE documentos
    ADD CONSTRAINT documentos_postulantes_fk FOREIGN KEY ( postulantes_id )
        REFERENCES postulantes ( id );

ALTER TABLE estudios
    ADD CONSTRAINT estudios_dep_est_fk FOREIGN KEY ( dependecia_establecimiento_id )
        REFERENCES dependecia_establecimiento ( id );

ALTER TABLE estudios
    ADD CONSTRAINT estudios_paises_fk FOREIGN KEY ( paises_id )
        REFERENCES paises ( id );

ALTER TABLE estudios
    ADD CONSTRAINT estudios_postulantes_fk FOREIGN KEY ( postulantes_id )
        REFERENCES postulantes ( id );

ALTER TABLE estudios
    ADD CONSTRAINT estudios_tipo_est_fk FOREIGN KEY ( tipo_establecimiento_id )
        REFERENCES tipo_establecimiento ( id );

ALTER TABLE estudios
    ADD CONSTRAINT estudios_tipo_ing_uni_fk FOREIGN KEY ( tipo_ingreso_uni_id )
        REFERENCES tipo_ingreso_uni ( id );

ALTER TABLE experiencias_laborales
    ADD CONSTRAINT exp_laborales_post_fk FOREIGN KEY ( postulantes_id )
        REFERENCES postulantes ( id );

ALTER TABLE experiencias_laborales
    ADD CONSTRAINT exp_laborales_tipo_exp_fk FOREIGN KEY ( tipo_experiencia_id )
        REFERENCES tipo_experiencia ( id );

ALTER TABLE instituciones
    ADD CONSTRAINT instituciones_ciudades_fk FOREIGN KEY ( ciudades_id )
        REFERENCES ciudades ( id );

ALTER TABLE jerarquias_academicas
    ADD CONSTRAINT jer_aca_postulantes_fk FOREIGN KEY ( postulantes_id )
        REFERENCES postulantes ( id );

ALTER TABLE lineas_investigacion
    ADD CONSTRAINT lin_inv_post_fk FOREIGN KEY ( postulantes_id )
        REFERENCES postulantes ( id );

ALTER TABLE modulos
    ADD CONSTRAINT modulos_programas_fk FOREIGN KEY ( programas_id )
        REFERENCES programas ( id );

ALTER TABLE objetivos
    ADD CONSTRAINT objetivos_postulantes_fk FOREIGN KEY ( postulantes_id )
        REFERENCES postulantes ( id );

ALTER TABLE postulaciones
    ADD CONSTRAINT postulaciones_postulantes_fk FOREIGN KEY ( postulantes_id )
        REFERENCES postulantes ( id );

ALTER TABLE postulaciones
    ADD CONSTRAINT postulaciones_programas_fk FOREIGN KEY ( programas_id )
        REFERENCES programas ( id );

ALTER TABLE postulantes
    ADD CONSTRAINT postulantes_estado_civil_fk FOREIGN KEY ( estados_civiles_id )
        REFERENCES estados_civiles ( id );

ALTER TABLE postulantes
    ADD CONSTRAINT postulantes_paises_fk FOREIGN KEY ( paises_id )
        REFERENCES paises ( id );

ALTER TABLE postulantes
    ADD CONSTRAINT postulantes_pue_ori_fk FOREIGN KEY ( pueblos_originarios_id )
        REFERENCES pueblos_originarios ( id );

ALTER TABLE programas
    ADD CONSTRAINT programas_instituciones_fk FOREIGN KEY ( instituciones_id )
        REFERENCES instituciones ( id );

ALTER TABLE programas
    ADD CONSTRAINT programas_subespecialidades_fk FOREIGN KEY ( subespecialidades_id )
        REFERENCES subespecialidades ( id );

ALTER TABLE provincias
    ADD CONSTRAINT provincias_regiones_fk FOREIGN KEY ( regiones_id )
        REFERENCES regiones ( id );

ALTER TABLE proyectos
    ADD CONSTRAINT proyectos_postulantes_fk FOREIGN KEY ( postulantes_id )
        REFERENCES postulantes ( id );

ALTER TABLE proyectos
    ADD CONSTRAINT proyectos_tipos_proyecto_fk FOREIGN KEY ( tipos_proyecto_id )
        REFERENCES tipos_proyecto ( id );

ALTER TABLE rankings
    ADD CONSTRAINT rankings_instituciones_fk FOREIGN KEY ( instituciones_id )
        REFERENCES instituciones ( id );

ALTER TABLE rankings
    ADD CONSTRAINT rankings_sub_areas_fk FOREIGN KEY ( sub_areas_id )
        REFERENCES sub_areas ( id );

ALTER TABLE sub_areas
    ADD CONSTRAINT sub_areas_disciplinas_fk FOREIGN KEY ( disciplinas_id )
        REFERENCES disciplinas ( id );

ALTER TABLE submodulos
    ADD CONSTRAINT submodulos_modulos_fk FOREIGN KEY ( modulos_id )
        REFERENCES modulos ( id );

ALTER TABLE titulos_superiores
    ADD CONSTRAINT tit_sup_postulantes_fk FOREIGN KEY ( postulantes_id )
        REFERENCES postulantes ( id );

ALTER TABLE titulos_superiores
    ADD CONSTRAINT tit_sup_tipos_titulo_fk FOREIGN KEY ( tipos_titulo_id )
        REFERENCES tipos_titulo ( id );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            33
-- CREATE INDEX                             0
-- ALTER TABLE                             65
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
