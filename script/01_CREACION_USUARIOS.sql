------------------------------------------------------------
-- Nombre: Creación de usuarios y roles base Conicyt
-- Autor: [Vicente Carmona, Gustavo Diaz, Patricio Mardones]
-- Fecha: 2021-06-06
------------------------------------------------------------

alter session set "_ORACLE_SCRIPT"=true;

-- CREACION USUARIO DUEÑO DE TABLAS


CREATE USER CONICYT_MASTER_001
IDENTIFIED BY "!_C0nTr4$3n4_"
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

GRANT CONNECT TO CONICYT_MASTER_001;
GRANT RESOURCE TO CONICYT_MASTER_001;
GRANT ALL PRIVILEGES TO CONICYT_MASTER_001;


-- CREAR ROLE PARA DESARROLLADORES
-- CON PRIVILEGIOS COMPARTIDOS

CREATE ROLE DEV_GEN_001
NOT IDENTIFIED;

GRANT CONNECT TO DEV_GEN_001;
GRANT CREATE ANY PROCEDURE TO DEV_GEN_001; 
GRANT CREATE ANY TRIGGER TO DEV_GEN_001;
GRANT CREATE ANY VIEW TO DEV_GEN_001;
GRANT CREATE MATERIALIZED VIEW TO DEV_GEN_001;

-- CREAR DESARROLLADOR 1
CREATE USER CONICYT_DEV_001
IDENTIFIED BY "C0n1cyT_2020!*"
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";
GRANT DEV_GEN_001 TO CONICYT_DEV_001;
ALTER USER CONICYT_DEV_001 DEFAULT ROLE DEV_GEN_001;


-- CREAR DESARROLLADOR 2
CREATE USER CONICYT_DEV_002
IDENTIFIED BY "S3m3$tr4l_3nd*"
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";
GRANT DEV_GEN_001 TO CONICYT_DEV_002;
GRANT CREATE ANY SEQUENCE TO CONICYT_DEV_002;
ALTER USER CONICYT_DEV_002 DEFAULT ROLE DEV_GEN_001;

